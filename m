Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A969BE77180
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Dec 2024 17:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q91PIdpY0ToxJxjWetgT5wSgNIKHhdsWJzKO3onxaMI=; b=3P1oeuG5HQCB3vrIGav1O6PNby
	StaQatJYLngiz3T53i6mEXSXNfkEDt+Ye8SKr6feiRsS/0jdhqAbHhkTsqejR5+I39Wcwj599Xv1G
	EnuE8xLesrfXQmKeNzhNEZrHVIcIe4mc8pWReSzW/MocXFnhOo5mG3TV3O7OvMlYYXHR6gFpW49xu
	Hv+uv+Qg8vs1qOrguG27q2/3ohvcHw9f2fKegomb86gEJB7oP9RhsR5/8bXYFkECYDJVnqp+g+dJk
	0FLLj2k6hGwLGqVR/nS9uA2uohy7LV+bZRO+Qo2FcbVY1yEXUmBE9zF+xz/+P7H/LHvJ3clbEZFl8
	TZpnkmqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMW6q-00000006j5A-2fBW;
	Sat, 14 Dec 2024 17:39:20 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMVvG-00000006gbr-055f
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Dec 2024 17:27:23 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2161eb94cceso18956905ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Dec 2024 09:27:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1734197241; x=1734802041; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q91PIdpY0ToxJxjWetgT5wSgNIKHhdsWJzKO3onxaMI=;
        b=AgFzUv8z7ZTrx5avSuVUgCvjZFAn5RK/Ge6CwlBN2RP4zNq5a2nyjeh9myZjKtwkTi
         1DPmpJNwm7tnkHMTPicLfviitj7x8Qs8+U1+b13/S2V3NymM0F8Kya9ImlKX1vM/qrov
         wXpiFyt1aRpwhUmJpwnUORbVEpiPGCx4oeDGy7xb1uO80FDqPU8mV3ZdPoe8iMrzs8sh
         WO+tIPtPVY3E6vC0REiQTPWc5Y3gSM/hkuXdrzBabBBYv0HPgXzsa6vFGFAcUtIDKIRF
         +csPcv5QuB2mYJdED47gR5T+jOWGVAylKAAgoxv0ZnaQ/vHBD8hJt2KY9C5rExTLTlp5
         z+kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734197241; x=1734802041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q91PIdpY0ToxJxjWetgT5wSgNIKHhdsWJzKO3onxaMI=;
        b=VldJuUxSVFiJ5LENcl2kS1RSwOuWorOwPRtOfBOrNiSXLwK1UwzI4YSVVdSEJKdZVR
         fyvDVYMpKBREirnqjNMsL8famfHu80i5xOkIxMDBc283nrVEMM+XSCe90bOLKWdQ40So
         V3gv2F8W8mM5EYtY4CQ5lfAkDUWIkKRTVlD4NMUc0ID3dGS19rgVS2jXGEHT7QLSe+D2
         icRSZfnjxz/QeHb1A1Bv7p4E70C2HduzAQtV4IQOtNZ1w8RD2SiVzNsCVxoKi+cLGLUi
         T3Xm2HEhUnHFlxCeveN0w55ateGl1HP4wJ1fzSX3DcZEHF3FrrXkD6jowjJM85w/6Xdg
         Ck1A==
X-Forwarded-Encrypted: i=1; AJvYcCVAOWA2y2RwJojNoAv0fW0VJ9VgmVRV/NuLOzw9czFaKrzEXKP17dwXKPqIATUN+Wk42pvTcPLBqAWnohe/96BB@lists.infradead.org
X-Gm-Message-State: AOJu0YwgPNnZBO0wFFCdVIU7UfaivI+QhFb78B720P0OCmbCc9tQ5isD
	OgFalqWUIO3KjV8aP/BxbHT1Zaw0+n/01KTenvJU2FI0JVOEitIqMZ//pic+zgM=
X-Gm-Gg: ASbGncvGHM4M+VYKZnMQKIGKnPOx3UjeCrLSkuxLVPONy7tj6VmRHuGpySHtkul8NCs
	H4nQ9AmgapGx27eYcl/9Ea5sxbqMZjrh9OGSgzJwmJg5j7Sj1zd8ns+CCIbP49uRhNs76L3Dmk0
	SxmNe39mlSDJFj3KK5lJwUQW+GVuzpE1y1lm1cmEV+N/d8PzCjgplaICzmD+uEWT8XeOKSNZY8i
	O0tXk5gZi4lrV/QX5myCUOr31zESu7Y+Ob9pWUu+E2bX+nX1hPts2elJve8+ngm2+fy8Q1Ba5Af
	LyJtSUEcfjI1YFs=
X-Google-Smtp-Source: AGHT+IHMsJ5YCvABWOrU64w2NgYzPATagi+l1J7ESIDXSbMnwGULGsvQOBHQ97Lfbn1IK/p1gbun3A==
X-Received: by 2002:a17:902:ecc1:b0:216:46f4:7e30 with SMTP id d9443c01a7336-21892a42024mr107832805ad.43.1734197240770;
        Sat, 14 Dec 2024 09:27:20 -0800 (PST)
Received: from localhost.localdomain ([223.185.132.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f142f9e186sm5049811a91.41.2024.12.14.09.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 09:27:20 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2 11/11] irqchip/riscv-imsic: Use IRQCHIP_MOVE_DEFERRED flag for PCI devices
Date: Sat, 14 Dec 2024 22:55:49 +0530
Message-ID: <20241214172549.8842-12-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241214172549.8842-1-apatel@ventanamicro.com>
References: <20241214172549.8842-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241214_092722_062927_F33B8E19 
X-CRM114-Status: GOOD (  25.28  )
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

Devices (such as PCI) which have non-atomic MSI update should
migrate irq in the interrupt-context so use IRQCHIP_MOVE_DEFERRED
flag for corresponding irqchips.

The use of IRQCHIP_MOVE_DEFERRED further simplifies IMSIC vector
movement as follows:

1) No need to handle the intermediate state seen by devices with
   non-atomic MSI update because imsic_irq_set_affinity() is called
   in the interrupt-context with interrupt masked.
2) No need to check temporary vector when completing vector movement
   on the old CPU in __imsic_local_sync().
3) No need to call imsic_local_sync_all() from imsic_handle_irq()

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/irq-riscv-imsic-platform.c | 74 ++++++++++++++--------
 drivers/irqchip/irq-riscv-imsic-state.c    | 25 +-------
 2 files changed, 50 insertions(+), 49 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-imsic-platform.c b/drivers/irqchip/irq-riscv-imsic-platform.c
index e6c81718ba78..eac7f358bbba 100644
--- a/drivers/irqchip/irq-riscv-imsic-platform.c
+++ b/drivers/irqchip/irq-riscv-imsic-platform.c
@@ -64,6 +64,11 @@ static int imsic_irq_retrigger(struct irq_data *d)
 	return 0;
 }
 
+static void imsic_irq_ack(struct irq_data *d)
+{
+	irq_move_irq(d);
+}
+
 static void imsic_irq_compose_vector_msg(struct imsic_vector *vec, struct msi_msg *msg)
 {
 	phys_addr_t msi_addr;
@@ -97,7 +102,20 @@ static int imsic_irq_set_affinity(struct irq_data *d, const struct cpumask *mask
 				  bool force)
 {
 	struct imsic_vector *old_vec, *new_vec;
-	struct imsic_vector tmp_vec;
+
+	/*
+	 * Requirements for the downstream irqdomains (or devices):
+	 *
+	 * 1) Downstream irqdomains (or devices) with atomic MSI update can
+	 *    happily do imsic_irq_set_affinity() in the process-context on
+	 *    any CPU so the irqchip of such irqdomains must not set the
+	 *    IRQCHIP_MOVE_DEFERRED flag.
+	 *
+	 * 2) Downstream irqdomains (or devices) with non-atomic MSI update
+	 *    must do imsic_irq_set_affinity() in the interrupt-context upon
+	 *    next interrupt so the irqchip of such irqdomains must set the
+	 *    IRQCHIP_MOVE_DEFERRED flag.
+	 */
 
 	old_vec = irq_data_get_irq_chip_data(d);
 	if (WARN_ON(!old_vec))
@@ -117,31 +135,13 @@ static int imsic_irq_set_affinity(struct irq_data *d, const struct cpumask *mask
 		return -ENOSPC;
 
 	/*
-	 * Device having non-atomic MSI update might see an intermediate
-	 * state when changing target IMSIC vector from one CPU to another.
-	 *
-	 * To avoid losing interrupt to some intermediate state, do the
-	 * following (just like x86 APIC):
-	 *
-	 * 1) First write a temporary IMSIC vector to the device which
-	 * has MSI address same as the old IMSIC vector but MSI data
-	 * matches the new IMSIC vector.
-	 *
-	 * 2) Next write the new IMSIC vector to the device.
-	 *
-	 * Based on the above, the __imsic_local_sync() must check both
-	 * old MSI data and new MSI data on the old CPU for pending
+	 * Downstream irqdomains (or devices) with non-atomic MSI update
+	 * may see an intermediate state when changing target IMSIC vector
+	 * from one CPU to another but using the IRQCHIP_MOVE_DEFERRED
+	 * flag this is taken care because imsic_irq_set_affinity() is
+	 * called in the interrupt-context with interrupt masked.
 	 */
 
-	if (new_vec->local_id != old_vec->local_id) {
-		/* Setup temporary vector */
-		tmp_vec.cpu = old_vec->cpu;
-		tmp_vec.local_id = new_vec->local_id;
-
-		/* Point device to the temporary vector */
-		imsic_msi_update_msg(irq_get_irq_data(d->irq), &tmp_vec);
-	}
-
 	/* Point device to the new vector */
 	imsic_msi_update_msg(irq_get_irq_data(d->irq), new_vec);
 
@@ -198,6 +198,7 @@ static struct irq_chip imsic_irq_base_chip = {
 	.irq_force_complete_move = imsic_irq_force_complete_move,
 #endif
 	.irq_retrigger		= imsic_irq_retrigger,
+	.irq_ack		= imsic_irq_ack,
 	.irq_compose_msi_msg	= imsic_irq_compose_msg,
 	.flags			= IRQCHIP_SKIP_SET_WAKE |
 				  IRQCHIP_MASK_ON_SUSPEND,
@@ -217,7 +218,7 @@ static int imsic_irq_domain_alloc(struct irq_domain *domain, unsigned int virq,
 		return -ENOSPC;
 
 	irq_domain_set_info(domain, virq, virq, &imsic_irq_base_chip, vec,
-			    handle_simple_irq, NULL, NULL);
+			    handle_edge_irq, NULL, NULL);
 	irq_set_noprobe(virq);
 	irq_set_affinity(virq, cpu_online_mask);
 	irq_data_update_effective_affinity(irq_get_irq_data(virq), cpumask_of(vec->cpu));
@@ -256,15 +257,36 @@ static const struct irq_domain_ops imsic_base_domain_ops = {
 #endif
 };
 
+static bool imsic_init_dev_msi_info(struct device *dev,
+				    struct irq_domain *domain,
+				    struct irq_domain *real_parent,
+				    struct msi_domain_info *info)
+{
+	if (!msi_lib_init_dev_msi_info(dev, domain, real_parent, info))
+		return false;
+
+	switch (info->bus_token) {
+	case DOMAIN_BUS_PCI_DEVICE_MSI:
+	case DOMAIN_BUS_PCI_DEVICE_MSIX:
+		info->chip->flags |= IRQCHIP_MOVE_DEFERRED;
+		break;
+	default:
+		break;
+	}
+
+	return true;
+}
+
 static const struct msi_parent_ops imsic_msi_parent_ops = {
 	.supported_flags	= MSI_GENERIC_FLAGS_MASK |
 				  MSI_FLAG_PCI_MSIX,
 	.required_flags		= MSI_FLAG_USE_DEF_DOM_OPS |
 				  MSI_FLAG_USE_DEF_CHIP_OPS |
 				  MSI_FLAG_PCI_MSI_MASK_PARENT,
+	.chip_flags		= MSI_CHIP_FLAG_SET_ACK,
 	.bus_select_token	= DOMAIN_BUS_NEXUS,
 	.bus_select_mask	= MATCH_PCI_MSI | MATCH_PLATFORM_MSI,
-	.init_dev_msi_info	= msi_lib_init_dev_msi_info,
+	.init_dev_msi_info	= imsic_init_dev_msi_info,
 };
 
 int imsic_irqdomain_init(void)
diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/irq-riscv-imsic-state.c
index aca769d915bf..c7649fb6bbe6 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.c
+++ b/drivers/irqchip/irq-riscv-imsic-state.c
@@ -126,8 +126,8 @@ void __imsic_eix_update(unsigned long base_id, unsigned long num_id, bool pend,
 
 static bool __imsic_local_sync(struct imsic_local_priv *lpriv)
 {
-	struct imsic_local_config *tlocal, *mlocal;
-	struct imsic_vector *vec, *tvec, *mvec;
+	struct imsic_local_config *mlocal;
+	struct imsic_vector *vec, *mvec;
 	bool ret = true;
 	int i;
 
@@ -170,27 +170,6 @@ static bool __imsic_local_sync(struct imsic_local_priv *lpriv)
 		 */
 		mvec = READ_ONCE(vec->move_next);
 		if (mvec) {
-			/*
-			 * Device having non-atomic MSI update might see an
-			 * intermediate state so check both old ID and new ID
-			 * for pending interrupts.
-			 *
-			 * For details, refer imsic_irq_set_affinity().
-			 */
-
-			tvec = vec->local_id == mvec->local_id ?
-			       NULL : &lpriv->vectors[mvec->local_id];
-			if (tvec && __imsic_id_read_clear_pending(tvec->local_id)) {
-				/* Retrigger temporary vector if it was already in-use */
-				if (READ_ONCE(tvec->enable)) {
-					tlocal = per_cpu_ptr(imsic->global.local, tvec->cpu);
-					writel_relaxed(tvec->local_id, tlocal->msi_va);
-				}
-
-				mlocal = per_cpu_ptr(imsic->global.local, mvec->cpu);
-				writel_relaxed(mvec->local_id, mlocal->msi_va);
-			}
-
 			if (__imsic_id_read_clear_pending(vec->local_id)) {
 				mlocal = per_cpu_ptr(imsic->global.local, mvec->cpu);
 				writel_relaxed(mvec->local_id, mlocal->msi_va);
-- 
2.43.0


