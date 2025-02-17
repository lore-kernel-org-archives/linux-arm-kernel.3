Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A2D8C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 09:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LSbtd2A+IfFNBQ5eBtv/V1kZK2ZwPWt/jT9RsNuUoAs=; b=gbJIA1uI76Pio44w4nVy0KuI8N
	RwsBD1R0a2Ko8UsZchWD2uXiE5hun6QVhXSwYa9lM0MAxaq0bMGQTWMvGU0MtcNj891qHHOaHBuin
	tGs3ZY2sQPjr4PWgPhL7cHEg3enZ9vM+RmjqtI8AUdSDLMYyaZWNJ5MDp5X0dcqc6oMMk0/DS+EqG
	RvB4jCUGA4oeeuM83cjmO8n96gEk/OZ8/4X+7tQG6SFRwdR3P8uLBSpnGWqXpBT0R3JAkGC79zCiq
	zYk0fTxwMzBTSx+Rscs2c0ueQAsOdL/GAmmcWiXsEDhPE/6AT9cZM6ALV83WXBqQ+H8Ge+rIbNda/
	bdymajfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjx8S-00000003sY8-1pmT;
	Mon, 17 Feb 2025 09:09:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjwxl-00000003pm2-2V0m
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 17 Feb 2025 08:58:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=LSbtd2A+IfFNBQ5eBtv/V1kZK2ZwPWt/jT9RsNuUoAs=; b=Kt0mDe08MjhEEcu804lj8LbCQ4
	OaZgd64aNaS/qJTK9FwzDALvGIotj/2FBDFEsbRByVen0J5nlppYHd2RtQ3y2/pICVITfloAQ7UAE
	ujuHqAKsChkGrE2dGn6eQZyuZX7Mz7MgNOymwxwATB2ghfcXr8RCzhv27Hiv/mif2SHZkd7c/lth/
	kbrh9+FEwjfeiE2CSf2YR5Vylv6LXND4SLOGXmWsWBODuoGzTvY12bF1/PCKrujIYgNkXYb4ADJOf
	aj/O4lJPTiBgWO3DQUlxU8ckyCQkAS8Is0rxR65BVMRaRBknTpDUuhcsteAkBmTmRQmdDgCEzOoZj
	ihkkYDjw==;
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjwxi-00000001joI-3Twa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 08:58:48 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-21f61b01630so79534215ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 00:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739782725; x=1740387525; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LSbtd2A+IfFNBQ5eBtv/V1kZK2ZwPWt/jT9RsNuUoAs=;
        b=BCvLkaI6ZlhBWAHtvls4wlajhLBV1Ks1zzubDq0Bgv8aLqLnB7jXc15sXazbMoYJht
         YHLv8qJMY9ZhOdeNNfAAnsOlYZm16G4NYu6qbVpn0FhuOpwwV7GMv8B7f31A9Meq8+tx
         NVrwTCE4q/19X3x/s/VFh8rBe0jZkGHOhCSC2efK3JQFKBMIvkleBkA26mBehWodB1ur
         +hW36wEdpuVpaVjQAR0P7yqJwzJdcrHnT3klJ+8c5/ocEnFl+X7KnTDdht2lBF8BCZH6
         NXW+xFv5l9gOkUf4MR08tt2GX65wdMhk3IbFZH1gIek/WLn9ZZgcHRTDP/VrD7IrQKzd
         j7fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739782725; x=1740387525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LSbtd2A+IfFNBQ5eBtv/V1kZK2ZwPWt/jT9RsNuUoAs=;
        b=s09yBb7c+faYl/d5l0t8EjGR6I53EZvyymRJ+PBtbV2cQq79BvrxREf1dqm44TEJ8g
         9lQrFIpWSX7QbDT8sABSt8RSWiIPChTi1Na9l4rnIQ8+//fAGiHv42gp05wlCf/hOWim
         NTjc4T7Bzae3+VNaSKTFJnYEedoixdHRhrBNP/GVq8Qklmqun9lMUE+myDiIaH7p0s8j
         YzWj+NryDbzxsUc/NbU0G/rtxpu8bTQNjBs3X9aHPXnoI5vCWVTjd3T3x7rMQchnhthL
         iDIHtNF+rLLjBrtGkWj1NkmFzZvpFxK8FkPO6OJgcdcgR1iuOMLgx2pOle6MflmWXeru
         HGog==
X-Forwarded-Encrypted: i=1; AJvYcCXcl77fIH7Yr9XPg7AHuX9TRLbDKHQPPJO+IxUx5C9s0gDc/EQVXphOqDZmMpvgT5+nuTsX8eABH5BdWBH2+h1h@lists.infradead.org
X-Gm-Message-State: AOJu0YxZEfc4/O0bxcwixnNFdhq2nLkTkk3yiK64VmorgomvW4By+dfP
	Jec2y+vLLyrbDZjShwKiEva8YGEvMlmdEi76YUcjrnnQ02eD5cnpgdkznLXOcZ8=
X-Gm-Gg: ASbGnct70AD1Jy+R721Z/s2oPQp7RDphdPlvOLqYgtjJhx6RG7v7T6jz8orO3qqQMbU
	y11qsJhpnGc5xd5dZ8+uXQzy3iyPrsoVDPNTYCYhUIAPfscQad1GQalMeaz7Po/xXyhpuR0LKLG
	ZjoEDeEzw+SB5K77UvnoL4IJZDwIRMlcPzVZwZRT2uioJd82Ju+ezXnRVDGlctFkkEvjBua3yLt
	3yZR6aJG2lfwJ6GBkocBE0qPFvJkT9FsODXiYvjT+kf3jGWJBsvEmdWE9zBCrtA0UPEYRFxD3Ew
	HWFmmynUli6ElHja/E4+Ptw51hxRX7su3p6uij7+SM70oNHWhodZvk8=
X-Google-Smtp-Source: AGHT+IGxqt1/NXuR/2jkVfU876iHwX+bRPYBCe6t0MKtB0yrApmwkzYXbLbKcxfdEmKjCUbS0U/rew==
X-Received: by 2002:a05:6a00:9456:b0:732:57d3:f004 with SMTP id d2e1a72fcca58-73257d3f4d5mr18708318b3a.6.1739782725252;
        Mon, 17 Feb 2025 00:58:45 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([122.171.22.227])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73242546867sm7632018b3a.24.2025.02.17.00.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 00:58:44 -0800 (PST)
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
Subject: [PATCH v6 07/10] irqchip/riscv-imsic: Separate next and previous pointers in IMSIC vector
Date: Mon, 17 Feb 2025 14:26:53 +0530
Message-ID: <20250217085657.789309-8-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250217085657.789309-1-apatel@ventanamicro.com>
References: <20250217085657.789309-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_085847_044757_44DCC623 
X-CRM114-Status: GOOD (  25.32  )
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

Currently, there is only one "move" pointer in the struct imsic_vector
so during vector movement the old vector points to the new vector and
new vector points to itself.

To support force cleanup of old vector, add separate "move_next" and
"move_prev" pointers in the struct imsic_vector where during vector
movement the "move_next" pointer of the old vector points to the new
vector and the "move_prev" pointer of the new vector points to the
old vector.

Both "move_next" and "move_prev" pointers are cleared separately by
__imsic_local_sync() with a restriction that "move_prev" on the new
CPU is cleared only after old CPU has cleared "move_next".

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/irq-riscv-imsic-early.c |  8 ++-
 drivers/irqchip/irq-riscv-imsic-state.c | 96 +++++++++++++++++--------
 drivers/irqchip/irq-riscv-imsic-state.h |  7 +-
 3 files changed, 78 insertions(+), 33 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-imsic-early.c b/drivers/irqchip/irq-riscv-imsic-early.c
index 275df5005705..553650932c75 100644
--- a/drivers/irqchip/irq-riscv-imsic-early.c
+++ b/drivers/irqchip/irq-riscv-imsic-early.c
@@ -77,6 +77,12 @@ static void imsic_handle_irq(struct irq_desc *desc)
 	struct imsic_vector *vec;
 	unsigned long local_id;
 
+	/*
+	 * Process pending local synchronization instead of waiting
+	 * for per-CPU local timer to expire.
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
diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/irq-riscv-imsic-state.c
index b97e6cd89ed7..96e994443fc7 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.c
+++ b/drivers/irqchip/irq-riscv-imsic-state.c
@@ -124,10 +124,11 @@ void __imsic_eix_update(unsigned long base_id, unsigned long num_id, bool pend,
 	}
 }
 
-static void __imsic_local_sync(struct imsic_local_priv *lpriv)
+static bool __imsic_local_sync(struct imsic_local_priv *lpriv)
 {
 	struct imsic_local_config *mlocal;
 	struct imsic_vector *vec, *mvec;
+	bool ret = true;
 	int i;
 
 	lockdep_assert_held(&lpriv->lock);
@@ -143,35 +144,75 @@ static void __imsic_local_sync(struct imsic_local_priv *lpriv)
 			__imsic_id_clear_enable(i);
 
 		/*
-		 * If the ID was being moved to a new ID on some other CPU
-		 * then we can get a MSI during the movement so check the
-		 * ID pending bit and re-trigger the new ID on other CPU
-		 * using MMIO write.
+		 * Clear the pervious vector pointer of the new vector only
+		 * after the movement is complete on the old CPU.
 		 */
-		mvec = READ_ONCE(vec->move);
-		WRITE_ONCE(vec->move, NULL);
-		if (mvec && mvec != vec) {
+		mvec = READ_ONCE(vec->move_prev);
+		if (mvec) {
+			/*
+			 * If the old vector has not been updated then
+			 * try again in the next sync-up call.
+			 */
+			if (READ_ONCE(mvec->move_next)) {
+				ret = false;
+				continue;
+			}
+
+			WRITE_ONCE(vec->move_prev, NULL);
+		}
+
+		/*
+		 * If a vector was being moved to a new vector on some other
+		 * CPU then we can get a MSI during the movement so check the
+		 * ID pending bit and re-trigger the new ID on other CPU using
+		 * MMIO write.
+		 */
+		mvec = READ_ONCE(vec->move_next);
+		if (mvec) {
 			if (__imsic_id_read_clear_pending(i)) {
 				mlocal = per_cpu_ptr(imsic->global.local, mvec->cpu);
 				writel_relaxed(mvec->local_id, mlocal->msi_va);
 			}
 
+			WRITE_ONCE(vec->move_next, NULL);
 			imsic_vector_free(&lpriv->vectors[i]);
 		}
 
 skip:
 		bitmap_clear(lpriv->dirty_bitmap, i, 1);
 	}
+
+	return ret;
 }
 
-void imsic_local_sync_all(void)
+#ifdef CONFIG_SMP
+static void __imsic_local_timer_start(struct imsic_local_priv *lpriv)
+{
+	lockdep_assert_held(&lpriv->lock);
+
+	if (!timer_pending(&lpriv->timer)) {
+		lpriv->timer.expires = jiffies + 1;
+		add_timer_on(&lpriv->timer, smp_processor_id());
+	}
+}
+#else
+static inline void __imsic_local_timer_start(struct imsic_local_priv *lpriv)
+{
+}
+#endif
+
+void imsic_local_sync_all(bool force_all)
 {
 	struct imsic_local_priv *lpriv = this_cpu_ptr(imsic->lpriv);
 	unsigned long flags;
 
 	raw_spin_lock_irqsave(&lpriv->lock, flags);
-	bitmap_fill(lpriv->dirty_bitmap, imsic->global.nr_ids + 1);
-	__imsic_local_sync(lpriv);
+
+	if (force_all)
+		bitmap_fill(lpriv->dirty_bitmap, imsic->global.nr_ids + 1);
+	if (!__imsic_local_sync(lpriv))
+		__imsic_local_timer_start(lpriv);
+
 	raw_spin_unlock_irqrestore(&lpriv->lock, flags);
 }
 
@@ -190,12 +231,7 @@ void imsic_local_delivery(bool enable)
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
@@ -216,14 +252,11 @@ static void __imsic_remote_sync(struct imsic_local_priv *lpriv, unsigned int cpu
 	 */
 	if (cpu_online(cpu)) {
 		if (cpu == smp_processor_id()) {
-			__imsic_local_sync(lpriv);
-			return;
+			if (__imsic_local_sync(lpriv))
+				return;
 		}
 
-		if (!timer_pending(&lpriv->timer)) {
-			lpriv->timer.expires = jiffies + 1;
-			add_timer_on(&lpriv->timer, cpu);
-		}
+		__imsic_local_timer_start(lpriv);
 	}
 }
 #else
@@ -278,8 +311,9 @@ void imsic_vector_unmask(struct imsic_vector *vec)
 	raw_spin_unlock(&lpriv->lock);
 }
 
-static bool imsic_vector_move_update(struct imsic_local_priv *lpriv, struct imsic_vector *vec,
-				     bool new_enable, struct imsic_vector *new_move)
+static bool imsic_vector_move_update(struct imsic_local_priv *lpriv,
+				     struct imsic_vector *vec, bool is_old_vec,
+				     bool new_enable, struct imsic_vector *move_vec)
 {
 	unsigned long flags;
 	bool enabled;
@@ -289,7 +323,10 @@ static bool imsic_vector_move_update(struct imsic_local_priv *lpriv, struct imsi
 	/* Update enable and move details */
 	enabled = READ_ONCE(vec->enable);
 	WRITE_ONCE(vec->enable, new_enable);
-	WRITE_ONCE(vec->move, new_move);
+	if (is_old_vec)
+		WRITE_ONCE(vec->move_next, move_vec);
+	else
+		WRITE_ONCE(vec->move_prev, move_vec);
 
 	/* Mark the vector as dirty and synchronize */
 	bitmap_set(lpriv->dirty_bitmap, vec->local_id, 1);
@@ -322,8 +359,8 @@ void imsic_vector_move(struct imsic_vector *old_vec, struct imsic_vector *new_ve
 	 * interrupt on the old vector while device was being moved
 	 * to the new vector.
 	 */
-	enabled = imsic_vector_move_update(old_lpriv, old_vec, false, new_vec);
-	imsic_vector_move_update(new_lpriv, new_vec, enabled, new_vec);
+	enabled = imsic_vector_move_update(old_lpriv, old_vec, true, false, new_vec);
+	imsic_vector_move_update(new_lpriv, new_vec, false, enabled, old_vec);
 }
 
 #ifdef CONFIG_GENERIC_IRQ_DEBUGFS
@@ -386,7 +423,8 @@ struct imsic_vector *imsic_vector_alloc(unsigned int hwirq, const struct cpumask
 	vec = &lpriv->vectors[local_id];
 	vec->hwirq = hwirq;
 	vec->enable = false;
-	vec->move = NULL;
+	vec->move_next = NULL;
+	vec->move_prev = NULL;
 
 	return vec;
 }
diff --git a/drivers/irqchip/irq-riscv-imsic-state.h b/drivers/irqchip/irq-riscv-imsic-state.h
index 391e44280827..f02842b84ed5 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.h
+++ b/drivers/irqchip/irq-riscv-imsic-state.h
@@ -23,7 +23,8 @@ struct imsic_vector {
 	unsigned int				hwirq;
 	/* Details accessed using local lock held */
 	bool					enable;
-	struct imsic_vector			*move;
+	struct imsic_vector			*move_next;
+	struct imsic_vector			*move_prev;
 };
 
 struct imsic_local_priv {
@@ -74,7 +75,7 @@ static inline void __imsic_id_clear_enable(unsigned long id)
 	__imsic_eix_update(id, 1, false, false);
 }
 
-void imsic_local_sync_all(void);
+void imsic_local_sync_all(bool force_all);
 void imsic_local_delivery(bool enable);
 
 void imsic_vector_mask(struct imsic_vector *vec);
@@ -87,7 +88,7 @@ static inline bool imsic_vector_isenabled(struct imsic_vector *vec)
 
 static inline struct imsic_vector *imsic_vector_get_move(struct imsic_vector *vec)
 {
-	return READ_ONCE(vec->move);
+	return READ_ONCE(vec->move_prev);
 }
 
 void imsic_vector_move(struct imsic_vector *old_vec, struct imsic_vector *new_vec);
-- 
2.43.0


