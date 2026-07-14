Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEE1AC4450A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 09:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RtXDFqw6p2zDy0q9A7tS+b3EKzCFjxgTHXGegH5U6qY=; b=RSBi9qtXjD0U/Nbg38CfWC/zuV
	fn1oFGuji04n/s7rr4l177/IBtKiBqCCGQOvFud9a3mogyWXbxKpiUwZ3TDOM5e/OXpQupUwOS5x8
	2Ur9YgZ8TQUBteqgyNZ867DUxcubM8WUhH/l5pJAUrrz23np//3OTwMfhlhp47LDnqKogTfRIdEwj
	WmQre3VereSowLuSmzMagltPg029KmJDQOXmXOY73q2k/rYBY7+5W+2FwdMAGy7LS6Qf5Js/V3vCJ
	W4MTmIMGDis5n4w/MQIlyJekhLmZ1tcmPYXjDbmuUT+qLvKyuF3VfwhWJMrSPlzp7isGmla9D5x/v
	+MsedKGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjZGB-0000000BPEQ-3P4u;
	Tue, 14 Jul 2026 09:17:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjZG0-0000000BP3I-06Ve
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 09:16:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C49E043211;
	Tue, 14 Jul 2026 09:16:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FA821F0155E;
	Tue, 14 Jul 2026 09:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784020611;
	bh=RtXDFqw6p2zDy0q9A7tS+b3EKzCFjxgTHXGegH5U6qY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WI1mTTmII4RB1pCV/8PoHcMdbn/pMnKE6jRrqD9HL93Z3/qIdZwfSvi0TFTFW6ejO
	 MYITybGoNs0F+sSR3deNQ9zv2LYnwi4UhsZF8k/46kKJyHScgZOWUIggDQUn8lPICp
	 HlKpu0YcAvu1ltz60tN8qsZN7oUcFqRsxeuk7LEfiJvlPnCBpLVW5ues2oOgSQP+yl
	 aVd0PpT7dvQXwjnNmo2BWkGEEby9emRcfOTx5VCxxRBfd41+pAZl4wBHIJCmMUivog
	 57jnRNsIO6SRVpJwn5y2uJcMgW8la9uffcw14mqgJBYtxzwPlmlOm/sL6LVb7euCrG
	 /nr3/IJ6Q4Yxw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wjZFx-00000004ny1-40MM;
	Tue, 14 Jul 2026 09:16:50 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH v2 14/28] arm64: sysreg: Add HCRX_EL2 bits related to FEAT_NV3
Date: Tue, 14 Jul 2026 10:16:27 +0100
Message-ID: <20260714091641.1970822-15-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260714091641.1970822-1-maz@kernel.org>
References: <20260714091641.1970822-1-maz@kernel.org>
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

FEAT_NV3 introduces 4 new HCRX_EL2 control bits. Describe them
in the sysreg file.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 31e4ea455a9ce..afe9337851a2e 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -4548,7 +4548,12 @@ Fields	ZCR_ELx
 EndSysreg
 
 Sysreg	HCRX_EL2	3	4	1	2	2
-Res0	63:27
+Res0	63:35
+Field	34	NVnTTLBOS
+Field	33	NVnTTLBIS
+Field	32	NVnTTLB
+Res0	31:28
+Field	27	NVTGE
 Field	26	SRMASKEn
 Res0	25
 Field	24	PACMEn
-- 
2.47.3


