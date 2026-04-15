Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE7BF41996
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 11:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3uZexWDmgXifLSn34IfEanZcpYlzXSPBmMp8RHmHshM=; b=xvV6Ym87oGrQr46fm2Llw9OEJL
	wvV8QYn55Z5j8BKswu799qBXYxxthZN2sQmyys/+f8fYXjf43uP3vZQwzqBDqBIe7gqZ/UW/PzX4/
	W/riEBhYgANsFb02q9BzHLDHzFA8FKablnWPAt20MP1+xFPBMbr22yTc/zefxb6vEeT+K9iHs48ud
	wuN8V4eHofjrn2IyAMjzeJNr4EVq7ACbNQLQwobqXN37SLxMCvouxI5YSCLIjpovCdYA+fygIME+A
	tMekTnEre77XHOesrwgZuO9zvqr/bYPK850N81gy+E7itzIg/trZ4rQCMhqYAQSzWVJ9/Ew/RByD0
	BedaUCew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCyr2-0000000147R-3QSS;
	Wed, 15 Apr 2026 11:56:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCyr0-0000000145i-3mpm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 11:56:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E3695600AE;
	Wed, 15 Apr 2026 11:56:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 997C7C4AF09;
	Wed, 15 Apr 2026 11:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776254181;
	bh=5uepsjQHzt2SBVAjdXEaX2voIvkanpfVMA5y+kwwmag=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F9Wo106PfKVgUvFy7csC1ipd85bVBtyzUSat0TQLb8XaTTsRUq6FojJ/9oa6cy5K2
	 tKTqdX0FaaY47SEFlAa7AcUuHjKgPSDjDsfUUXnosfwLEf7sZVuZRkyUHnoSsaIzEi
	 77P8nrTEyyicVHu6VuyFa6zJIGvgcfnRqyCHURvpELH4JuVj4TvaELnNcyeh6XO8mO
	 bueM5EMRa2NmX1fXbKjaLl8K9jWBeJZnIUbAk2BFhoZvEBFfTNpF5D+EErH+7gDJVh
	 WSAOReLgJsLOpqS25bh7BBSVf0xp935gx6sdMdM3n723FO6vI2SJzmEZqUCEAR05jU
	 AvhC/tANWnesw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wCyqx-0000000Bqsi-2NiD;
	Wed, 15 Apr 2026 11:56:19 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Sascha Bischoff <sascha.bischoff@arm.com>
Subject: [PATCH 02/18] KVM: arm64: vgic-v5: Move PPI caps into kvm_vgic_global_state
Date: Wed, 15 Apr 2026 12:55:43 +0100
Message-ID: <20260415115559.2227718-3-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260415115559.2227718-1-maz@kernel.org>
References: <20260415115559.2227718-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, sascha.bischoff@arm.com
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

Constant vgic properties are usually kept in kvm_vgic_global_state,
but the vgic-v5 code does its own thing.

Move the ppi_caps data into the global structure, which has the
modest additional advantage of making it ro_after_init.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/vgic/vgic-v5.c |  2 +-
 include/kvm/arm_vgic.h        | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-v5.c b/arch/arm64/kvm/vgic/vgic-v5.c
index c0d36658ffe74..7c146fccc9689 100644
--- a/arch/arm64/kvm/vgic/vgic-v5.c
+++ b/arch/arm64/kvm/vgic/vgic-v5.c
@@ -10,7 +10,7 @@
 
 #include "vgic.h"
 
-static struct vgic_v5_ppi_caps ppi_caps;
+#define ppi_caps	kvm_vgic_global_state.vgic_v5_ppi_caps
 
 /*
  * Not all PPIs are guaranteed to be implemented for GICv5. Deterermine which
diff --git a/include/kvm/arm_vgic.h b/include/kvm/arm_vgic.h
index 1388dc6028a9a..ea793479ab254 100644
--- a/include/kvm/arm_vgic.h
+++ b/include/kvm/arm_vgic.h
@@ -177,6 +177,11 @@ struct vgic_global {
 	bool			has_gcie_v3_compat;
 
 	u32			ich_vtr_el2;
+
+	/* GICv5 PPI capabilities */
+	struct {
+		DECLARE_BITMAP(impl_ppi_mask, VGIC_V5_NR_PRIVATE_IRQS);
+	} vgic_v5_ppi_caps;
 };
 
 extern struct vgic_global kvm_vgic_global_state;
@@ -492,11 +497,6 @@ struct vgic_v5_cpu_if {
 	struct gicv5_vpe gicv5_vpe;
 };
 
-/* What PPI capabilities does a GICv5 host have */
-struct vgic_v5_ppi_caps {
-	DECLARE_BITMAP(impl_ppi_mask, VGIC_V5_NR_PRIVATE_IRQS);
-};
-
 struct vgic_cpu {
 	/* CPU vif control registers for world switch */
 	union {
-- 
2.47.3


