Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31A1EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 18:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zj2ikyX7bBttwfozOnp0vCaUHZFhgvkkDvwyqU4jtCU=; b=Zb5hwslVKgIeZn7w3ZwD1SL2w1
	yExCgEBiH91GAE1BAXt807x2AkiEDpKShVCzbxB2KAo91untJW0VdUgiuSNJSAeS+CgKOeqBH7Wfe
	VU+b752htp65OnPL4jCwZLdd1bWJHlpIUzI8VTjF8sV4E2/Clb/VvTJJwDOFxd32lqiqXabWC/yj0
	umeJdP01KKx+UeXMG1PQIGFrYHKVCmEDpXr06hrLMC8Vp0Xc95fa/tQVp927jNRkAvsFzL8QnByXj
	j4uRcvvMJkvN6ozmozY/agpklwRjGVTiyX152ZE0arM63rUeQF1bM4fzo7EVLKSfwWiEdjVAHRRsm
	ZNGEACWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJsa-00000004uNp-1sEM;
	Thu, 02 Jul 2026 16:03:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJsU-00000004uDT-40NP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 16:03:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8E3C143F4A;
	Thu,  2 Jul 2026 16:03:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7357C1F00ADE;
	Thu,  2 Jul 2026 16:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783008182;
	bh=Zj2ikyX7bBttwfozOnp0vCaUHZFhgvkkDvwyqU4jtCU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dBwa+dNU2zAeWNRSxThplGypY+pt92rT5JS/3TK5y0xx/TyBU/JAZgnnSbStNzVsi
	 gAD393dKttSxcosw43bhrkJ7Uc7YmDfiZ2n9PR0dICc5c9P9z5aiGlnYvkfRdJ/ia7
	 yPwP24r8iFWc09UASMPq0fHTi91doySNAS/zsDtH/yNUtD67Myujbvf4W+TIkJHRVb
	 hrHLy+RhKoyUYB7CHxWrlg5fFgkiiNtjbKlttJ7AyIg7OccAM0fhSfeBKroDkPKr/g
	 aaAoo2KYM9bDPv1kf+dsN2mUjibMtTjKSeCRPphiOZcCv/p8vYUYh3QIUvCZtBvYls
	 qbHI737ReeSrA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wfJsS-00000000ojd-38xG;
	Thu, 02 Jul 2026 16:03:00 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 13/28] arm64: sysreg: Add NVHCR_EL2 description as a mirror of HCR_EL2
Date: Thu,  2 Jul 2026 17:02:33 +0100
Message-ID: <20260702160248.1377250-14-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260702160248.1377250-1-maz@kernel.org>
References: <20260702160248.1377250-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

FEAT_NV3 introduces a new register that contains the HCR_EL2 value
exposed to a NV guest. As such, it has the exact same layout as
HCR_EL2.

Describe NVHCR_EL2 as a mapping to HCR_EL2.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index c6e8117a6f9cd..31e4ea455a9ce 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -4266,6 +4266,9 @@ Field	1	E2TRE
 Field	0	E0HTRE
 EndSysreg
 
+Sysreg	NVHCR_EL2	3	4	1	5	0
+Mapping	HCR_EL2
+EndSysreg
 
 Sysreg HDFGRTR2_EL2	3	4	3	1	0
 Res0	63:25
-- 
2.47.3


