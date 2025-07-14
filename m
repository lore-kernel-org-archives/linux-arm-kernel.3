Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33060C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 12:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=135cp2bUprghcAIcjpmML1GzDm0xFVqPA3z2ImvmtMI=; b=bii0Ovav7OwmbgajR7t1mJIfx4
	KYXS+2FHERW312JG241JGGkZ70f9Xluri5nsBfQNsIBRwbFZxuELF8UDABK+LN/zd+UM35bAqTzMG
	uqGBOycZQtqS48ecddeOU8jNFkm+5Ao7qYpFcPgH/c3B5f3ATjeyVCo5brA/cATxk9mDwSNVDdikH
	EQGKiNvS61Wp7S8Sr9Vk22i+5a0haiZ5/iRGnFoSERhJh5SXR+b4hxpQdEh3VoyTfr1UlSKHLcT7g
	v7J9J6ROfu5HsoYWrWwLVvrLW5h2Kw8mtD5lSegp2hR7gjWbS0vug3Z92hDu4evWKy5UaRQcnCgVk
	P8WagL9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubIdU-00000002Cn9-3vgq;
	Mon, 14 Jul 2025 12:50:24 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubIGb-000000029j1-196M
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 12:26:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 89A10A5704F;
	Mon, 14 Jul 2025 12:26:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 347F8C4CEF8;
	Mon, 14 Jul 2025 12:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752496004;
	bh=Maovpa248I7CBxH/PejkKeRqHw0v3C94HDRXqdy2Gn4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YGIxjV1VLwuQ9bjvR8ejkKTI4UlvucRA1/U7qw4hnYK8IkMLAjMAMIZrHQJxC64X0
	 1aOSGT+EYPZqXEf3DswiINdBCJjK0mA5Dqbkpa7nTNUiK3X4FfziMc15GESZE29V4U
	 1pgP6Nh8XT/AJsChmuTfvc53QLmUlPyiCo1OnCtWFPJ6eSDMUO6gtlWOt7IDcVmCbz
	 hrcSd5sLm7MxBf5mp5yIF0pn6sdS/HI5sAziFo3rIz/gryJ7Hz/ZmmX5YibJFGzAoj
	 9yX4gUjLt1bw0ioTew/zebE5nBrXAPaRzpM4mq8B4bTrc525TqOnTN3okaZvNc+iqo
	 C6vtgwqe6KkGw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1ubIGY-00FW7V-D3;
	Mon, 14 Jul 2025 13:26:42 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Eric Auger <eric.auger@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 04/11] KVM: arm64: Define helper for ICH_VTR_EL2
Date: Mon, 14 Jul 2025 13:26:27 +0100
Message-Id: <20250714122634.3334816-5-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250714122634.3334816-1-maz@kernel.org>
References: <20250714122634.3334816-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, eric.auger@redhat.com, peter.maydell@linaro.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_052645_380744_BB03DBDF 
X-CRM114-Status: GOOD (  11.23  )
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

Move the computation of the ICH_VTR_EL2 value to a common location,
so that it can be reused by the save/restore code.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/sys_regs.c  |  6 +-----
 arch/arm64/kvm/vgic/vgic.h | 15 +++++++++++++++
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 6981c1b34c2c4..6763910fdf1f3 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -2521,11 +2521,7 @@ static bool access_gic_vtr(struct kvm_vcpu *vcpu,
 	if (p->is_write)
 		return write_to_read_only(vcpu, p, r);
 
-	p->regval = kvm_vgic_global_state.ich_vtr_el2;
-	p->regval &= ~(ICH_VTR_EL2_DVIM 	|
-		       ICH_VTR_EL2_A3V		|
-		       ICH_VTR_EL2_IDbits);
-	p->regval |= ICH_VTR_EL2_nV4;
+	p->regval = kvm_get_guest_vtr_el2();
 
 	return true;
 }
diff --git a/arch/arm64/kvm/vgic/vgic.h b/arch/arm64/kvm/vgic/vgic.h
index af4bf80b785c3..67233fa04e709 100644
--- a/arch/arm64/kvm/vgic/vgic.h
+++ b/arch/arm64/kvm/vgic/vgic.h
@@ -66,6 +66,21 @@
 
 #define KVM_ICC_SRE_EL2		(ICC_SRE_EL2_ENABLE | ICC_SRE_EL2_SRE |	\
 				 ICC_SRE_EL1_DIB | ICC_SRE_EL1_DFB)
+#define KVM_ICH_VTR_EL2_RES0	(ICH_VTR_EL2_DVIM 	|	\
+				 ICH_VTR_EL2_A3V	|	\
+				 ICH_VTR_EL2_IDbits)
+#define KVM_ICH_VTR_EL2_RES1	ICH_VTR_EL2_nV4
+
+static inline u64 kvm_get_guest_vtr_el2(void)
+{
+	u64 vtr;
+
+	vtr  = kvm_vgic_global_state.ich_vtr_el2;
+	vtr &= ~KVM_ICH_VTR_EL2_RES0;
+	vtr |= KVM_ICH_VTR_EL2_RES1;
+
+	return vtr;
+}
 
 /*
  * As per Documentation/virt/kvm/devices/arm-vgic-its.rst,
-- 
2.39.2


