Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A647C4453D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 07:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ji8nSRKlAPdWEdBVe8ICSTMa6u+ah4ntK0FcnZBJE6c=; b=HJx3Hh4QWSfVasH0zrPCoJjE8F
	JyA743cInZmJv1mO1eiSeSvVJsE4cJrWR75rkNyehijNU4QKYCA/r1hwc77l+R/SjT/N//o+iLGIW
	E/oK9NulMxPtiO6kofgnVSrXomvndDTV+uatym1dK8zizzWeGpDlIp3yDm4BKIvpRYSBrCQvMiIXs
	j9F55ghA0fUBPUyC7cwQJ164vS9QpablvYESpg15AN6DwvXmn5oIzj0GpRu3Uz/eKEzPUMYEANbcu
	9hFBnVeEDTBrk5nJEsYuTt9/xiEuesDx3UuCVR/UqXnx2xymHYbIhwcbBos7+xDp2LVDXatSvGiud
	rywjQH/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRc1-0000000B76S-3Cit;
	Wed, 22 Jul 2026 07:43:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRbX-0000000B6iP-1Cl0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 07:42:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E99E944DEB;
	Wed, 22 Jul 2026 07:42:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD32E1F00A3E;
	Wed, 22 Jul 2026 07:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784706178;
	bh=ji8nSRKlAPdWEdBVe8ICSTMa6u+ah4ntK0FcnZBJE6c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JXWFxdUoqLt5fcIV+FraJYXSEWtwLRWIjnQFxcTPufsFxJFpFiAGvs1SR4ru7Q8f4
	 ItcFnb1IE81RB5HonqGoDjB4UtOJ99v29efraYLlOY71MvKSsyzvs6Oc9Oml+UX1oP
	 nk3aNyTIBJeOVBTzSHm71hzKAxdykJQabE0QbYKYrnlO3EOE4CKN6aUg7lqKnLIxUT
	 hHMZP+gOy6xasN16MYu/TqMfg05gcgDY1SPvEsX0BvDJ6LvTB4PkWhqpgSrEe3f7wD
	 F9QsJ+Z0vcPMLA0Pk4ZRNS72WYGfleotbJ4b/DjeOjbBPxynnB+oSIwqXoBPLQu2YP
	 kKsukxFsLD9eA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wmRbV-00000007VfN-0bUI;
	Wed, 22 Jul 2026 07:42:57 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Yao Yuan <yaoyuan@linux.alibaba.com>,
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: [PATCH v3 13/28] arm64: sysreg: Add NVHCR_EL2 description as a mirror of HCR_EL2
Date: Wed, 22 Jul 2026 08:42:19 +0100
Message-ID: <20260722074234.3330999-14-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260722074234.3330999-1-maz@kernel.org>
References: <20260722074234.3330999-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, yaoyuan@linux.alibaba.com, weilin.chang@arm.com
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
index 28755f70f0bf0..42839d2b15ae4 100644
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


