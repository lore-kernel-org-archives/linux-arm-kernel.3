Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF066C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 10:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KEjndyBD35lV6nr6NSLWRRyly4db2axy7koFOHZTKsQ=; b=PMGVRsB90y0GOfDul6jrQdBYsr
	ELNMthsqxRgwwOktYeKftWnLIJCULMDxXscopvqwaiisQr1HYZ6OVKGBN2HaKBzGl9Wu4fwiCAeHb
	6CRKwv9zRKA1mnqCBmBu0CutiinzyvNlcBBGSypCw/G641q/Z1+KFoEufSRYXGyJ7OrM5Z1scqyTV
	w5RwUcKJPCk/MoujtUKMjzrx0zLd6X308NXUiOESKYlp1CIZDvb0FoisHPuCpMyq07hY+XRM60eTX
	+VWDgFx/1A1nnxa5hKCBuC3jP1DPr8+YUXyNM9pcwzk62hd/Q8gEaPxAmmv7huFedaHeJhaoc8nGt
	3LE9O2PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjykO-00000004AOK-3Ncl;
	Mon, 17 Feb 2025 10:53:08 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjwy6-00000003pqy-2OiM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 08:59:11 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-22100006bc8so33731455ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 00:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739782750; x=1740387550; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KEjndyBD35lV6nr6NSLWRRyly4db2axy7koFOHZTKsQ=;
        b=BZsnZwfMY1iMM25EFCK0O5Fusy2EthSTTESRGqjzWyPKtFqalwBtGt0aiR9pS1MGkd
         F/nC3BTat7AzrgsYLIdP8dnFNz7r9POY3Dsza+5u0Rikee6CChFEafZxhP4g1xiq9X0Q
         siJW7dWycQ8/Ci5ogW6dJIcHbX+xbK2cNsjK7G1wF9ZM+y3U2g4QC9yNxdGuWRXor47v
         TnXFbuxK4IOeRfb1VNrmt3UHpY91L+nXjC27As4n7b/3WvnPG/RCVPWCHVIMkvi502/F
         GVcMn5xQ6lMj4IV9aOmkl3tUDY9WxNaiouOLEbXZ81Gm5LS7XlU+DavKkPRoAcVZ5D+g
         Mz1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739782750; x=1740387550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KEjndyBD35lV6nr6NSLWRRyly4db2axy7koFOHZTKsQ=;
        b=Bbx1KrLXLxAM8IJZtJr3Tfj1DL6Fz87VLqcHMGLrIzfwWQ+AosH6glAmW9BYVRceqm
         tK5bz9TxkONXu3mWYYL0KVUPhCsZj3bedgjzvmnXhtlWj75WLhzTIIQwy2VWqO6zJja2
         Rt5ai9EYILlvEh3dFAkJxg/k8jMT4M5YPCIaL+jKEKp6pgnZllgAwllskfWNrOLe4zsN
         UDpwlkwRWzq/7qjETPQ7dmwFMrsZAjXHIgyPphKiyDm8IHnU40hCS7ZoNb22R8O27weJ
         Cd1RTO7uOIEfgVfqbQRRkqFlc3m2iUCQUmwowq49Dy/p+mAc4TeGORMec/DdwTKDHWWa
         RVtg==
X-Forwarded-Encrypted: i=1; AJvYcCXxjU+48wZPVDkRxAXIWNnElzV10FZtvnHpPu7Rvb2Zr9M+N3fnLSI7NMs8k+7T1yOXi42w1vcx7h0fhFAynFbE@lists.infradead.org
X-Gm-Message-State: AOJu0YwC7FNScQQok6IzuLXi91XD7srWLdAFWwB+BmtYI6YD2yk520hE
	FP6oVRx/1kOkNrl/dbEC/BfSvF8Hd0adVi4fl8Z2wmlqZ3JdOJom6R3rVHI/w2A=
X-Gm-Gg: ASbGncvCu8kkomTyianm8Z8BI1GNuBoMI+Hf30TPmG+cz5XjhZ/H+qer9oXba34yLry
	zq8E38AHCHPDO6AaYlQ/7DGUZisBqH7TTHUVC0PbOwPguizAsl9F7kx089qEFotCx/oP8EYsrR4
	/jNdX8hMYLwpixV4xFpb+c/TdfUTjeh4sURsqTZPkJPu5Z8vG6XM8UOcoR1vUNczT7XpYttPeJ7
	GVvqG+/lzwm5vLASisQawnM6VZU3E9KgvVRQwe3RtfJTmlBFSdLxc2YZH3Ivpb3FUKf3KsxedX6
	M0fMG3AdgqTX/F06a09+MCptMgy/0CUdQfhLdluiI8xAiJVH+GA+dMY=
X-Google-Smtp-Source: AGHT+IH6Tjxl2D2mFXDe6LhFiNV1G6vUFczqpaUqf8nSRh0V0anC6B6P0c3HIggrJMZH7GpsMRQCQA==
X-Received: by 2002:a05:6a00:1392:b0:730:74f8:25b6 with SMTP id d2e1a72fcca58-7326179e8a0mr14044686b3a.6.1739782749571;
        Mon, 17 Feb 2025 00:59:09 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([122.171.22.227])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73242546867sm7632018b3a.24.2025.02.17.00.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 00:59:08 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org
Cc: hpa@zytor.com,
	Marc Zyngier <maz@kernel.org>,
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
Subject: [PATCH v6 10/10] irqchip/riscv-imsic: Special handling for non-atomic device MSI update
Date: Mon, 17 Feb 2025 14:26:56 +0530
Message-ID: <20250217085657.789309-11-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250217085657.789309-1-apatel@ventanamicro.com>
References: <20250217085657.789309-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_005910_606118_BF70A7A1 
X-CRM114-Status: GOOD (  23.12  )
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

Device having non-atomic MSI update might see an intermediate
state when changing target IMSIC vector from one CPU to another.

To avoid losing interrupt to such intermediate state, do the
following (just like x86 APIC):
 1) First write a temporary IMSIC vector to the device which
    has MSI address same as the old IMSIC vector but with MSI
    data matches the new IMSIC vector.
 2) Next write the new IMSIC vector to the device.

Based on the above, the __imsic_local_sync() must check pending
status of both old MSI data and new MSI data on the old CPU. In
addition, the movement of IMSIC vector for non-atomic device MSI
update must be done in interrupt context using IRQCHIP_MOVE_DEFERRED.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/irq-riscv-imsic-platform.c | 73 +++++++++++++++++++++-
 drivers/irqchip/irq-riscv-imsic-state.c    | 31 +++++++--
 2 files changed, 98 insertions(+), 6 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-imsic-platform.c b/drivers/irqchip/irq-riscv-imsic-platform.c
index 6bf5d63f614e..828102c46f51 100644
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
@@ -97,6 +102,21 @@ static int imsic_irq_set_affinity(struct irq_data *d, const struct cpumask *mask
 				  bool force)
 {
 	struct imsic_vector *old_vec, *new_vec;
+	struct imsic_vector tmp_vec;
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
@@ -115,6 +135,33 @@ static int imsic_irq_set_affinity(struct irq_data *d, const struct cpumask *mask
 	if (!new_vec)
 		return -ENOSPC;
 
+	/*
+	 * Device having non-atomic MSI update might see an intermediate
+	 * state when changing target IMSIC vector from one CPU to another.
+	 *
+	 * To avoid losing interrupt to such intermediate state, do the
+	 * following (just like x86 APIC):
+	 *
+	 * 1) First write a temporary IMSIC vector to the device which
+	 * has MSI address same as the old IMSIC vector but MSI data
+	 * matches the new IMSIC vector.
+	 *
+	 * 2) Next write the new IMSIC vector to the device.
+	 *
+	 * Based on the above, the __imsic_local_sync() must check pending
+	 * status of both old MSI data and new MSI data on the old CPU.
+	 */
+
+	if (!irq_can_move_in_process_context(d) &&
+	    new_vec->local_id != old_vec->local_id) {
+		/* Setup temporary vector */
+		tmp_vec.cpu = old_vec->cpu;
+		tmp_vec.local_id = new_vec->local_id;
+
+		/* Point device to the temporary vector */
+		imsic_msi_update_msg(irq_get_irq_data(d->irq), &tmp_vec);
+	}
+
 	/* Point device to the new vector */
 	imsic_msi_update_msg(irq_get_irq_data(d->irq), new_vec);
 
@@ -171,6 +218,7 @@ static struct irq_chip imsic_irq_base_chip = {
 	.irq_force_complete_move = imsic_irq_force_complete_move,
 #endif
 	.irq_retrigger		= imsic_irq_retrigger,
+	.irq_ack		= imsic_irq_ack,
 	.irq_compose_msi_msg	= imsic_irq_compose_msg,
 	.flags			= IRQCHIP_SKIP_SET_WAKE |
 				  IRQCHIP_MASK_ON_SUSPEND,
@@ -190,7 +238,7 @@ static int imsic_irq_domain_alloc(struct irq_domain *domain, unsigned int virq,
 		return -ENOSPC;
 
 	irq_domain_set_info(domain, virq, virq, &imsic_irq_base_chip, vec,
-			    handle_simple_irq, NULL, NULL);
+			    handle_edge_irq, NULL, NULL);
 	irq_set_noprobe(virq);
 	irq_set_affinity(virq, cpu_online_mask);
 	irq_data_update_effective_affinity(irq_get_irq_data(virq), cpumask_of(vec->cpu));
@@ -229,15 +277,36 @@ static const struct irq_domain_ops imsic_base_domain_ops = {
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
index d0148e48ab05..3a2a381e4fa1 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.c
+++ b/drivers/irqchip/irq-riscv-imsic-state.c
@@ -126,8 +126,8 @@ void __imsic_eix_update(unsigned long base_id, unsigned long num_id, bool pend,
 
 static bool __imsic_local_sync(struct imsic_local_priv *lpriv)
 {
-	struct imsic_local_config *mlocal;
-	struct imsic_vector *vec, *mvec;
+	struct imsic_local_config *tlocal, *mlocal;
+	struct imsic_vector *vec, *tvec, *mvec;
 	bool ret = true;
 	int i;
 
@@ -169,13 +169,36 @@ static bool __imsic_local_sync(struct imsic_local_priv *lpriv)
 		 */
 		mvec = READ_ONCE(vec->move_next);
 		if (mvec) {
-			if (__imsic_id_read_clear_pending(i)) {
+			/*
+			 * Device having non-atomic MSI update might see an
+			 * intermediate state so check both old ID and new ID
+			 * for pending interrupts.
+			 *
+			 * For details, refer imsic_irq_set_affinity().
+			 */
+
+			tvec = vec->local_id == mvec->local_id ?
+			       NULL : &lpriv->vectors[mvec->local_id];
+			if (tvec &&
+			    !irq_can_move_in_process_context(irq_get_irq_data(vec->irq)) &&
+			    __imsic_id_read_clear_pending(tvec->local_id)) {
+				/* Retrigger temporary vector if it was already in-use */
+				if (READ_ONCE(tvec->enable)) {
+					tlocal = per_cpu_ptr(imsic->global.local, tvec->cpu);
+					writel_relaxed(tvec->local_id, tlocal->msi_va);
+				}
+
+				mlocal = per_cpu_ptr(imsic->global.local, mvec->cpu);
+				writel_relaxed(mvec->local_id, mlocal->msi_va);
+			}
+
+			if (__imsic_id_read_clear_pending(vec->local_id)) {
 				mlocal = per_cpu_ptr(imsic->global.local, mvec->cpu);
 				writel_relaxed(mvec->local_id, mlocal->msi_va);
 			}
 
 			WRITE_ONCE(vec->move_next, NULL);
-			imsic_vector_free(&lpriv->vectors[i]);
+			imsic_vector_free(vec);
 		}
 
 skip:
-- 
2.43.0


