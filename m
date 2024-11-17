Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC2CDD10F23
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 Nov 2024 17:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zHkDx2CX9L8Wp7Tj4mr9UhUPz/PRw2fPcqPCnVfSWIQ=; b=KpnLumLAF/FcOesVCEx8Cdis1c
	OA+j9MyhpDSX1kN8sS01EmLEVy7p/2Yy/GBqm9q4D6eo3l8AJi08hiICzhF27f9EN8H+dEPdKVSKS
	28u3ms0QJas6QX203bk7guVsbK8o4ygb/f0fGN9HO60+ztlOTPwr3er1uJklOc9aVYoesj+ZLakXW
	tmZJRB5yuFHaknzX+XUS7BAHx6OJACiHqIqfPLmBmxUKgpedoX1a6CWo+B2YnI7C55sYRKEoV565K
	45IzlgKev02ztzgKLL0flifYnJkM3L2e3WhF/q3xDgPLqkDk2hCrlU2dqPGpKUzJ8zbt2dHinAiUU
	rrzK8ZXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCidn-00000007aUU-2uZN;
	Sun, 17 Nov 2024 17:00:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCib7-00000007aGr-1xAk
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 Nov 2024 16:58:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A69055C4BC1;
	Sun, 17 Nov 2024 16:57:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78475C4CED8;
	Sun, 17 Nov 2024 16:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731862683;
	bh=atUjxq7FtVXxDP6ar/cAzl7DD0zGoP/QXim6pTv1I6A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lOPATGJzVtFlIbIGw93CfPIezR2QKyW88Rolayiwjf+SFJHIU4Sb9awUJQjC8f/AJ
	 SISgTQaaWmdPxHJ+fDshpNEtVeXIVOdJEPrTNNHWtbnURLSCNJPnHo7FpzAv2WFPuD
	 8KETkPm/pnyDTUuAhaKdrVY88K3qgDu0djlPfqkVDwyiZpbyJ1klIcnpqZyyAeeEHf
	 h4E42VpYsM5QuLiEGXU9lVPtzTT8AsvX/TAz1Q0og0UxKqGci0rFEQ+MbYKJDJpxtS
	 cWjwi3AgHrlRWyCGJDqKMdjclyldPPmEAfUfAiBZjXvoFfZTgW3SlGib/A45Jtid7N
	 ImEaAwMTAktvA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tCib3-00DYt6-NZ;
	Sun, 17 Nov 2024 16:58:01 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 3/4] KVM: arm64: vgic: Kill VGIC_MAX_PRIVATE definition
Date: Sun, 17 Nov 2024 16:57:56 +0000
Message-Id: <20241117165757.247686-4-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241117165757.247686-1-maz@kernel.org>
References: <20241117165757.247686-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241117_085805_565353_3C439912 
X-CRM114-Status: GOOD (  12.32  )
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

VGIC_MAX_PRIVATE is a pretty useless definition, and is better
replaced with VGIC_NR_PRIVATE_IRQS.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/vgic/vgic.c | 4 ++--
 include/kvm/arm_vgic.h     | 1 -
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic.c b/arch/arm64/kvm/vgic/vgic.c
index ffaa52448b6f8..cc8c6b9b5dd8b 100644
--- a/arch/arm64/kvm/vgic/vgic.c
+++ b/arch/arm64/kvm/vgic/vgic.c
@@ -106,8 +106,8 @@ struct vgic_irq *vgic_get_vcpu_irq(struct kvm_vcpu *vcpu, u32 intid)
 		return NULL;
 
 	/* SGIs and PPIs */
-	if (intid <= VGIC_MAX_PRIVATE) {
-		intid = array_index_nospec(intid, VGIC_MAX_PRIVATE + 1);
+	if (intid < VGIC_NR_PRIVATE_IRQS) {
+		intid = array_index_nospec(intid, VGIC_NR_PRIVATE_IRQS);
 		return &vcpu->arch.vgic_cpu.private_irqs[intid];
 	}
 
diff --git a/include/kvm/arm_vgic.h b/include/kvm/arm_vgic.h
index f5172549f9ba0..3a8ccfda34d29 100644
--- a/include/kvm/arm_vgic.h
+++ b/include/kvm/arm_vgic.h
@@ -26,7 +26,6 @@
 #define VGIC_NR_SGIS		16
 #define VGIC_NR_PPIS		16
 #define VGIC_NR_PRIVATE_IRQS	(VGIC_NR_SGIS + VGIC_NR_PPIS)
-#define VGIC_MAX_PRIVATE	(VGIC_NR_PRIVATE_IRQS - 1)
 #define VGIC_MAX_SPI		1019
 #define VGIC_MAX_RESERVED	1023
 #define VGIC_MIN_LPI		8192
-- 
2.39.2


