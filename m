Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D7D3C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 07:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CBfvQ3kWrJIo4ZX2fO574K2xNLHLI8xt5fD3UcZCgGE=; b=XxwxwVSWIKX40hIjTUGgu7xKSk
	Q5F6iL+b2jPzHAwn2330/CZoXOs9lv0Od1GUWz9XI0K9+oXL1tqZDn+LLwOcJfBHWuoEU9QCs6oOz
	Bam52yUyaLrOX1LyBjSSBp0V1Od7lf3kYs9h8D5FrznfZLmF26S6D5ZTST2mEV/cmanYlS7C+KHp6
	HTV+zgEZ4jsDy+SUUgXoafkUAaiPUsRgMZdLz718PM2HGSwj/u02gVAL2Pdh1MHLNaMTmAbstswYU
	L1X1zbocEhgfLhC6aIA4IlXv+noks7wFQs0su06TKSsemUSxUqe0drprhqD0t10mZpWapMLkHP7U0
	JoV/UFvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfDoa-0000000HTRL-0J2f;
	Tue, 04 Feb 2025 07:57:48 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfDlS-0000000HSdD-2n5t
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 07:54:35 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-7b6fc3e9e4aso482097885a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Feb 2025 23:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738655673; x=1739260473; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CBfvQ3kWrJIo4ZX2fO574K2xNLHLI8xt5fD3UcZCgGE=;
        b=ZewnfPTku3rCxGEHONcgHgVdlOXBApzQmxEgCdc7X2pN4L+zzCTmgJ6A6DfxN66cnM
         xll4xX31GJj0G27vYQs/GWseBlJanFSR+d32AKE+hll0cAXTt0vDRzo1kpmWspSyslhA
         RTRvBJdeS0BNJ7nkpBvPhDak+dD4IGLRuZB8BjodsPkaj89vKG6V1+HjpRe1K29/bCMJ
         qpWVKM6Hw9eoaN3eNeHFwrD50SmwakTuCtMxCcijayu7BrVVVCJjhwSmYMH8pbfwTr2m
         dZz0uXa1rriyNloe7dVBMRkrPpk2uDh3oYb08KpCDo27TPIz68/Bijy6bVa9iqJFHHCu
         SflA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738655673; x=1739260473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CBfvQ3kWrJIo4ZX2fO574K2xNLHLI8xt5fD3UcZCgGE=;
        b=dPGi+9Bc/paoGRgkizawhMLJrllFPfGdc7fYMZe2NyGhN+2Knb7ZHqYOK7xkJENHNw
         HrEJimPbaF+BQlUCXV2Iu0PTpj7SzYFGpqJErBv90AxulaZNtlKKaEfgpC8sLDn+2l2p
         GrwPeb3LvkrOrFd8ghdGgFysDv4eXg1oTdg/ozKVEKigZ0iVLOXWgXCiExOeKGLahf/d
         i1pZaA+H9XlBIo1nfaZA80ESv0zJTKTO7D422bgw0wakBu9TlaPToUwbsJKoGQEGdmpc
         wqW+Lz6fKXyi5FhO0jQRD2nzYunrLTdgClrY4R5jLYpLQN9v1jSsFvpha3HUfFDrTIly
         EQEg==
X-Forwarded-Encrypted: i=1; AJvYcCXhbcdtPsVPBZ9EQEOxWhv4im6KhKG8NZ5CAlj4V1LwwWL6iKg3t7Tr0sNW7TCWhId4V2NXOfWXkQoDYbPZpP9Y@lists.infradead.org
X-Gm-Message-State: AOJu0YzXCxJ5RHjgkfQvN1v2tdOhMs8fk6bxq+asUjdTOxj7+A8fRypb
	w4c91I4Z5sw+jBWrnCy9Eop0KbCRj3IETXG827VXPD2WdklKKMizCLpaisFmTBg=
X-Gm-Gg: ASbGncubP7s+K/SQgAwVmhwzmWEBPtPIGYivqq6S0iZZJL0d/x5gb3iVc17SobfA8Pb
	me8b5DcA+k/jQv2BDIv8837fv0pEhXga3B5VkorjA8knb0xp/dRfgRF3zdVrYUgBAtbB/dDpmrS
	88wyKrpV4qAdQUu0vJT+ybn4Q1eLsCCQDLU2JmYv9DbkiTHiNNcbt5hlynsZMOnBNYgnDS9A/Vh
	T9lEtOqvAVs9kr8sxzHVzD+dxy7jL9wqMvqkf4ynwW1ObSjBzRnItaMyrgEb0XhadE1z2L1fulJ
	UVYoz9g07OdQthLw6CEaf2+i26c+rdeydM971lZJKy4v5PoFhxt4yZY=
X-Google-Smtp-Source: AGHT+IE1kHVojceFVzcf2jbW9XOHhUZiDggCrSxIzTiwYNG5RUoAlilnWj5uEbIRStQ4m23HHT45hg==
X-Received: by 2002:a05:620a:4093:b0:7b6:d1e1:a22e with SMTP id af79cd13be357-7bffcd43a1cmr3525668485a.29.1738655673185;
        Mon, 03 Feb 2025 23:54:33 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a8d05ddsm613373185a.39.2025.02.03.23.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 23:54:32 -0800 (PST)
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
Subject: [PATCH v3 01/10] irqchip/riscv-imsic: Handle non-atomic MSI updates for device
Date: Tue,  4 Feb 2025 13:23:56 +0530
Message-ID: <20250204075405.824721-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250204075405.824721-1-apatel@ventanamicro.com>
References: <20250204075405.824721-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_235434_701319_9570B61B 
X-CRM114-Status: GOOD (  22.15  )
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

To handle such intermediate device state, update MSI address
and MSI data through separate MSI writes to the device.

Fixes: 027e125acdba ("irqchip/riscv-imsic: Add device MSI domain support for platform devices")
Suggested-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/irq-riscv-imsic-early.c    |  8 +++-
 drivers/irqchip/irq-riscv-imsic-platform.c | 27 ++++++++++++
 drivers/irqchip/irq-riscv-imsic-state.c    | 50 ++++++++++++++--------
 drivers/irqchip/irq-riscv-imsic-state.h    |  2 +-
 4 files changed, 68 insertions(+), 19 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-imsic-early.c b/drivers/irqchip/irq-riscv-imsic-early.c
index c5c2e6929a2f..73a93ce8668f 100644
--- a/drivers/irqchip/irq-riscv-imsic-early.c
+++ b/drivers/irqchip/irq-riscv-imsic-early.c
@@ -77,6 +77,12 @@ static void imsic_handle_irq(struct irq_desc *desc)
 	struct imsic_vector *vec;
 	unsigned long local_id;
 
+	/*
+	 * First process pending IMSIC vector enable, disable and movement
+	 * on the current CPU.
+	 */
+	imsic_local_sync_all(false);
+
 	chained_irq_enter(chip, desc);
 
 	while ((local_id = csr_swap(CSR_TOPEI, 0))) {
@@ -120,7 +126,7 @@ static int imsic_starting_cpu(unsigned int cpu)
 	 * Interrupts identities might have been enabled/disabled while
 	 * this CPU was not running so sync-up local enable/disable state.
 	 */
-	imsic_local_sync_all();
+	imsic_local_sync_all(true);
 
 	/* Enable local interrupt delivery */
 	imsic_local_delivery(true);
diff --git a/drivers/irqchip/irq-riscv-imsic-platform.c b/drivers/irqchip/irq-riscv-imsic-platform.c
index c708780e8760..b44eb0b3990b 100644
--- a/drivers/irqchip/irq-riscv-imsic-platform.c
+++ b/drivers/irqchip/irq-riscv-imsic-platform.c
@@ -97,6 +97,7 @@ static int imsic_irq_set_affinity(struct irq_data *d, const struct cpumask *mask
 {
 	struct imsic_vector *old_vec, *new_vec;
 	struct irq_data *pd = d->parent_data;
+	struct imsic_vector tmp_vec;
 
 	old_vec = irq_data_get_irq_chip_data(pd);
 	if (WARN_ON(!old_vec))
@@ -115,6 +116,32 @@ static int imsic_irq_set_affinity(struct irq_data *d, const struct cpumask *mask
 	if (!new_vec)
 		return -ENOSPC;
 
+	/*
+	 * Device having non-atomic MSI update might see an intermediate
+	 * state when changing target IMSIC vector from one CPU to another.
+	 *
+	 * To avoid losing interrupt to some intermediate state, do the
+	 * following (just like x86 APIC):
+	 *
+	 * 1) First write a temporary IMSIC vector to the device which
+	 * has MSI address same as the old IMSIC vector but MSI data
+	 * matches the new IMSIC vector.
+	 *
+	 * 2) Next write the new IMSIC vector to the device.
+	 *
+	 * Based on the above, the __imsic_local_sync() must check both
+	 * old MSI data and new MSI data on the old CPU for pending
+	 */
+
+	if (new_vec->local_id != old_vec->local_id) {
+		/* Setup temporary vector */
+		tmp_vec.cpu = old_vec->cpu;
+		tmp_vec.local_id = new_vec->local_id;
+
+		/* Point device to the temporary vector */
+		imsic_msi_update_msg(d, &tmp_vec);
+	}
+
 	/* Point device to the new vector */
 	imsic_msi_update_msg(d, new_vec);
 
diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/irq-riscv-imsic-state.c
index b97e6cd89ed7..a8645084bd8f 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.c
+++ b/drivers/irqchip/irq-riscv-imsic-state.c
@@ -126,21 +126,21 @@ void __imsic_eix_update(unsigned long base_id, unsigned long num_id, bool pend,
 
 static void __imsic_local_sync(struct imsic_local_priv *lpriv)
 {
-	struct imsic_local_config *mlocal;
-	struct imsic_vector *vec, *mvec;
+	struct imsic_local_config *tlocal, *mlocal;
+	struct imsic_vector *vec, *tvec, *mvec;
 	int i;
 
 	lockdep_assert_held(&lpriv->lock);
 
 	for_each_set_bit(i, lpriv->dirty_bitmap, imsic->global.nr_ids + 1) {
 		if (!i || i == IMSIC_IPI_ID)
-			goto skip;
+			continue;
 		vec = &lpriv->vectors[i];
 
 		if (READ_ONCE(vec->enable))
-			__imsic_id_set_enable(i);
+			__imsic_id_set_enable(vec->local_id);
 		else
-			__imsic_id_clear_enable(i);
+			__imsic_id_clear_enable(vec->local_id);
 
 		/*
 		 * If the ID was being moved to a new ID on some other CPU
@@ -151,26 +151,47 @@ static void __imsic_local_sync(struct imsic_local_priv *lpriv)
 		mvec = READ_ONCE(vec->move);
 		WRITE_ONCE(vec->move, NULL);
 		if (mvec && mvec != vec) {
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
+			if (tvec && __imsic_id_read_clear_pending(tvec->local_id)) {
+				/* Retrigger temporary vector if it was already in-use */
+				if (READ_ONCE(tvec->enable)) {
+					tlocal = per_cpu_ptr(imsic->global.local, tvec->cpu);
+					writel_relaxed(tvec->local_id, tlocal->msi_va);
+				}
+
 				mlocal = per_cpu_ptr(imsic->global.local, mvec->cpu);
 				writel_relaxed(mvec->local_id, mlocal->msi_va);
 			}
 
-			imsic_vector_free(&lpriv->vectors[i]);
+			if (__imsic_id_read_clear_pending(vec->local_id)) {
+				mlocal = per_cpu_ptr(imsic->global.local, mvec->cpu);
+				writel_relaxed(mvec->local_id, mlocal->msi_va);
+			}
+
+			imsic_vector_free(vec);
 		}
 
-skip:
-		bitmap_clear(lpriv->dirty_bitmap, i, 1);
+		bitmap_clear(lpriv->dirty_bitmap, vec->local_id, 1);
 	}
 }
 
-void imsic_local_sync_all(void)
+void imsic_local_sync_all(bool force_all)
 {
 	struct imsic_local_priv *lpriv = this_cpu_ptr(imsic->lpriv);
 	unsigned long flags;
 
 	raw_spin_lock_irqsave(&lpriv->lock, flags);
-	bitmap_fill(lpriv->dirty_bitmap, imsic->global.nr_ids + 1);
+	if (force_all)
+		bitmap_fill(lpriv->dirty_bitmap, imsic->global.nr_ids + 1);
 	__imsic_local_sync(lpriv);
 	raw_spin_unlock_irqrestore(&lpriv->lock, flags);
 }
@@ -190,12 +211,7 @@ void imsic_local_delivery(bool enable)
 #ifdef CONFIG_SMP
 static void imsic_local_timer_callback(struct timer_list *timer)
 {
-	struct imsic_local_priv *lpriv = this_cpu_ptr(imsic->lpriv);
-	unsigned long flags;
-
-	raw_spin_lock_irqsave(&lpriv->lock, flags);
-	__imsic_local_sync(lpriv);
-	raw_spin_unlock_irqrestore(&lpriv->lock, flags);
+	imsic_local_sync_all(false);
 }
 
 static void __imsic_remote_sync(struct imsic_local_priv *lpriv, unsigned int cpu)
diff --git a/drivers/irqchip/irq-riscv-imsic-state.h b/drivers/irqchip/irq-riscv-imsic-state.h
index 391e44280827..8fae6c99b019 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.h
+++ b/drivers/irqchip/irq-riscv-imsic-state.h
@@ -74,7 +74,7 @@ static inline void __imsic_id_clear_enable(unsigned long id)
 	__imsic_eix_update(id, 1, false, false);
 }
 
-void imsic_local_sync_all(void);
+void imsic_local_sync_all(bool force_all);
 void imsic_local_delivery(bool enable);
 
 void imsic_vector_mask(struct imsic_vector *vec);
-- 
2.43.0


