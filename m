Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85EDFCD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 09:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QRG2UUB+bvCAJewpeLGo2zr3hssMfYBAjZROWVUDPsE=; b=i3MuLbeS1gco4KFcVmHMEyM5gC
	tY6JYtElHGvksoPX1sLDRbQOobIupOFBetiOXHKNZXQ4mf11Ni0DD3AJkDf9kUBKHvgsursq9v8l6
	Embo6YoyJVBnSBQ9wLiIBZvobuA3WKNGjdo0lAqUWw15uab306YS9Xu989zPLTUxbGRIY1oWXC2fz
	aiyUWxrRUlzrU21EUXEHXDfg4/ev7mfgSP3YnnbMSp+5NcKLaVa3UBVI74gfUTtoWgsgqyiajifn9
	yloIs6+B2gdffb/o1wMakJ8K4QGJphAwDfjWJ9D9xM0znTT0Ju3shjtE7HOMVPlm1pdIGQ3s8VkrD
	jpzylQ4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPd6G-000000047El-1dzf;
	Wed, 20 May 2026 09:20:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPd66-00000004752-1oa6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 09:20:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D572A601FE;
	Wed, 20 May 2026 09:20:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 833871F0089E;
	Wed, 20 May 2026 09:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779268813;
	bh=QRG2UUB+bvCAJewpeLGo2zr3hssMfYBAjZROWVUDPsE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cR1OSIlTlRJlCgyc0nterhjdN7TG11G+i3IDIwwOHMq1vdQoDsbX/IZHlpSKKrTkf
	 W+WPw3P4eo8T3qaSf03yZGvApTawSW6+bkcmp80Z1qn3+vQzX4CR0r10o+3XO1a7jp
	 5Vhec+oQQVuZv7F/mFDMMvoE+chLE5ZOTWcAVPYRuRr/yqSygTv59ujLj8Si3gKMB7
	 vIqYTBH0DQu1o2zxx0LK8Sise+6yvdcI66DbyBNRC85EEm8CBhBaoV7M1lH6XHgSnR
	 TLqJOf254Hi8MHhuHMgQGJKtbgU5XKr+VzVz1CYUWQ5Z4PEoRLgIYPVBI+e/cUWvLU
	 ZpgRfwb3O7AWQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wPd63-00000004IaV-3WyX;
	Wed, 20 May 2026 09:20:11 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Sascha Bischoff <sascha.bischoff@arm.com>
Subject: [PATCH v2 08/18] KVM: arm64: vgic: Rationalise per-CPU irq accessor
Date: Wed, 20 May 2026 10:19:39 +0100
Message-ID: <20260520091949.542365-9-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260520091949.542365-1-maz@kernel.org>
References: <20260520091949.542365-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, sascha.bischoff@arm.com
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

Despite adding the necessary infrastructure to identify irq types,
vgic_get_vcpu_irq() treats GICv5 PPIs in a special way, which
impairs the readability of the code.

Use the existing irq classifiers to handle per-CPU irqs for all
vgic types, and let the normal control flow reach global interrupt
handling without any v5-specific path.

Reviewed-by: Joey Gouly <joey.gouly@arm.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/vgic/vgic.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic.c b/arch/arm64/kvm/vgic/vgic.c
index 3ac6d49bc4876..b697678d68b01 100644
--- a/arch/arm64/kvm/vgic/vgic.c
+++ b/arch/arm64/kvm/vgic/vgic.c
@@ -106,24 +106,23 @@ struct vgic_irq *vgic_get_irq(struct kvm *kvm, u32 intid)
 
 struct vgic_irq *vgic_get_vcpu_irq(struct kvm_vcpu *vcpu, u32 intid)
 {
+	enum kvm_device_type type;
+
 	if (WARN_ON(!vcpu))
 		return NULL;
 
-	if (vgic_is_v5(vcpu->kvm)) {
-		u32 int_num, hwirq_id;
-
-		if (!__irq_is_ppi(KVM_DEV_TYPE_ARM_VGIC_V5, intid))
-			return NULL;
-
-		hwirq_id = FIELD_GET(GICV5_HWIRQ_ID, intid);
-		int_num = array_index_nospec(hwirq_id, VGIC_V5_NR_PRIVATE_IRQS);
+	type = vcpu->kvm->arch.vgic.vgic_model;
 
-		return &vcpu->arch.vgic_cpu.private_irqs[int_num];
-	}
+	if (__irq_is_sgi(type, intid) || __irq_is_ppi(type, intid)) {
+		switch (type) {
+		case KVM_DEV_TYPE_ARM_VGIC_V5:
+			intid = vgic_v5_get_hwirq_id(intid);
+			intid = array_index_nospec(intid, VGIC_V5_NR_PRIVATE_IRQS);
+			break;
+		default:
+			intid = array_index_nospec(intid, VGIC_NR_PRIVATE_IRQS);
+		}
 
-	/* SGIs and PPIs */
-	if (intid < VGIC_NR_PRIVATE_IRQS) {
-		intid = array_index_nospec(intid, VGIC_NR_PRIVATE_IRQS);
 		return &vcpu->arch.vgic_cpu.private_irqs[intid];
 	}
 
-- 
2.47.3


