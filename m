Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 098FEE7716A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Dec 2024 17:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qKWIt7ITp/X88ndEH7it4rZ1geXjjPOabq3XOqds9DM=; b=Z0RByp9RyqgXJYM2NW2ON0Rc27
	ZywdGzCVg9cDUOUH5g7il4cDEDFGUdlqejwTwRDspyLp+tzXIovKmQ1/CggXyK+G/V+5jobqkv4mh
	1amJ2Roq/JzWX/1vShgeZXUmE8g8+ujRL8qic1Tmpq5EHb6i+ll+1/QS2trCPX0t3DjRp/u/OT0RB
	evxbYHLU1Wl6AWWG1b2/Ib0jQX7D7OJAacNbfuRfAroFJeh6Vj9Aq/eh16C5PBgJ3H37W8Ios/SMN
	BkMjGsch/oLWIe8K5vvLcnAH434ZDEAZe6iDJE5cI8S1e1O1IJGscZMkA8r1daNrm0mQn0hNe+s7D
	tMWUmAWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMW3g-00000006iP5-3o0K;
	Sat, 14 Dec 2024 17:36:04 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMVuv-00000006gWI-1aFp
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Dec 2024 17:27:02 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2ee46851b5eso1874840a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Dec 2024 09:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1734197220; x=1734802020; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qKWIt7ITp/X88ndEH7it4rZ1geXjjPOabq3XOqds9DM=;
        b=jaceKLxGXdYrTLmXc8Q399w/Zqi0QmghpUoESaQ5vbqYCdfpUc8rXyOwcsOQmNCAfp
         2I2eIiriDsbReMV1a9R6n7rMGXKnlDg1++hWxdgqJipEpkZAPon7UmJft/z8a92JRTwV
         2ZA4WRglHi8vEy9OHEX1esKRtSr0rOZcxiG78wJpQAmWaU5kjraaLlWtV2XqHqzKh38P
         Kf2Qq/L0FtGKKV8KRetZ+84DfBEUDpmBwOVh30KsThXHCyaxa8xDM+Kf2LmVUakJc4x2
         zxOIIbNQmmwy0XirembEIhIUrkhBgqgrA3ioM+NhWk7qpa/jyaTwPCbH8IE3xaCNL2Kw
         Z75A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734197220; x=1734802020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qKWIt7ITp/X88ndEH7it4rZ1geXjjPOabq3XOqds9DM=;
        b=nUEY23GpelEy4matPMcIdR2X7Cj9Hen3PA5B7IsnsPvYTKRuSBC+B60ZPyXz4Une3r
         UbIMw1O95yG2AUc6K+BmdiIfDbJ9U61h9zSmJFuVaww5FZWc06jVM9cCaIwvYfJ/OC77
         is+o8+Se9rDrWPGakM66DQ6RSCphYV4NG4b4qhtSJi0Ido7OSv99gF9aaUYkNWUOwJCN
         0eAEr3ExuN1S+wEsz9g6u2dgIH362wmUZ5+IDOeGgMNSb2NnLHEM1Vw0Fu/JdBQnnZqO
         Jf8uEH9YbWcWiDzZiDQ/IQNWfE/TSdzBV4xYQZEMf4ksHlZmcwUJNLLCF98sisZPuc48
         lSDw==
X-Forwarded-Encrypted: i=1; AJvYcCUggDNNN4fG7g4lXsSEBNap+yQH/4oNNXIja4qqzOFo1YquQrC1DlBCUrGoMRwykGXJ74wE0Po+qpbH6iQFtay4@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8gJBGQOeZm3trYBrRsUZRIp9mavIMaIcifL3jXrp62/hvkR0z
	SgHXp5QyU2y2Dio1nbO+Q0sIhjlnf63b3tQrixtIkZnyUoWPTbszlxQ+dQ/qKOM=
X-Gm-Gg: ASbGncsE744Fp+t79ls9kZx6Qexv3uvF4m93GQz/AV7oD9wUqs6qlkFP2pAunX1R0bZ
	nlCrZEAsRo33Q5f/FuI34SmsrhOSyWIH/DqhJrkxQ47YGXmpDVuHKn/g2K1b5UUID7GO2acmqrx
	fMC2CvpvPNNFHOWS0GBSp+0WjaaGcxmcz5Dx50bbG4/lbVX6Qm9CtYty+0ObeXZ3VN1fKcPr7bs
	dZw3wC2ui5MQAdaNbBsleBbSNcvWUt88/73dzTI/m5HAWAw5uoM1aDFFnHr9YF3yLL7FiyLv6UE
	bLFB7RslhQ90/x4=
X-Google-Smtp-Source: AGHT+IGQwf+KWHUKDSuNXTV8W8BsAm/unz0Vds64eL7itxYSGgZbtZcUWjgcYwS8LtLhLbggFNNyJA==
X-Received: by 2002:a17:90b:5112:b0:2ea:4c4f:bd20 with SMTP id 98e67ed59e1d1-2f2904a724dmr9248924a91.32.1734197220158;
        Sat, 14 Dec 2024 09:27:00 -0800 (PST)
Received: from localhost.localdomain ([223.185.132.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f142f9e186sm5049811a91.41.2024.12.14.09.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 09:26:59 -0800 (PST)
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
Subject: [PATCH v2 08/11] irqchip/riscv-imsic: Separate next and previous pointers in IMSIC vector
Date: Sat, 14 Dec 2024 22:55:46 +0530
Message-ID: <20241214172549.8842-9-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241214172549.8842-1-apatel@ventanamicro.com>
References: <20241214172549.8842-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241214_092701_421172_73B1E931 
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

Currently, there is only one "move" pointer in the struct imsic_vector
so during vector movement the old vector points to the new vector and
new vector points to itself.

To support force cleanup of old vector, add separate "move_next" and
"move_prev" pointers in the struct imsic_vector where during vector
movement the "move_next" pointer of the old vector points to the
new vector and the "move_prev" pointer of the new vector points to
the old vector. Both "move_next" pointers are cleared separately
by __imsic_local_sync() on the old and new CPUs respectively.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/irq-riscv-imsic-state.c | 60 +++++++++++++++++++------
 drivers/irqchip/irq-riscv-imsic-state.h |  5 ++-
 2 files changed, 50 insertions(+), 15 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/irq-riscv-imsic-state.c
index a8645084bd8f..da49a160ea09 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.c
+++ b/drivers/irqchip/irq-riscv-imsic-state.c
@@ -124,10 +124,11 @@ void __imsic_eix_update(unsigned long base_id, unsigned long num_id, bool pend,
 	}
 }
 
-static void __imsic_local_sync(struct imsic_local_priv *lpriv)
+static bool __imsic_local_sync(struct imsic_local_priv *lpriv)
 {
 	struct imsic_local_config *tlocal, *mlocal;
 	struct imsic_vector *vec, *tvec, *mvec;
+	bool ret = true;
 	int i;
 
 	lockdep_assert_held(&lpriv->lock);
@@ -142,15 +143,33 @@ static void __imsic_local_sync(struct imsic_local_priv *lpriv)
 		else
 			__imsic_id_clear_enable(vec->local_id);
 
+		/*
+		 * If the ID was being moved from an existing ID on some
+		 * other CPU then we clear the pervious vector pointer
+		 * only after the movement is complete.
+		 */
+		mvec = READ_ONCE(vec->move_prev);
+		if (mvec) {
+			/*
+			 * If the old IMSIC vector has not been updated then
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
 		/*
 		 * If the ID was being moved to a new ID on some other CPU
 		 * then we can get a MSI during the movement so check the
 		 * ID pending bit and re-trigger the new ID on other CPU
 		 * using MMIO write.
 		 */
-		mvec = READ_ONCE(vec->move);
-		WRITE_ONCE(vec->move, NULL);
-		if (mvec && mvec != vec) {
+		mvec = READ_ONCE(vec->move_next);
+		if (mvec) {
 			/*
 			 * Device having non-atomic MSI update might see an
 			 * intermediate state so check both old ID and new ID
@@ -177,11 +196,14 @@ static void __imsic_local_sync(struct imsic_local_priv *lpriv)
 				writel_relaxed(mvec->local_id, mlocal->msi_va);
 			}
 
+			WRITE_ONCE(vec->move_next, NULL);
 			imsic_vector_free(vec);
 		}
 
 		bitmap_clear(lpriv->dirty_bitmap, vec->local_id, 1);
 	}
+
+	return ret;
 }
 
 void imsic_local_sync_all(bool force_all)
@@ -190,9 +212,16 @@ void imsic_local_sync_all(bool force_all)
 	unsigned long flags;
 
 	raw_spin_lock_irqsave(&lpriv->lock, flags);
+
 	if (force_all)
 		bitmap_fill(lpriv->dirty_bitmap, imsic->global.nr_ids + 1);
-	__imsic_local_sync(lpriv);
+	if (!__imsic_local_sync(lpriv)) {
+		if (!timer_pending(&lpriv->timer)) {
+			lpriv->timer.expires = jiffies + 1;
+			add_timer_on(&lpriv->timer, smp_processor_id());
+		}
+	}
+
 	raw_spin_unlock_irqrestore(&lpriv->lock, flags);
 }
 
@@ -232,8 +261,8 @@ static void __imsic_remote_sync(struct imsic_local_priv *lpriv, unsigned int cpu
 	 */
 	if (cpu_online(cpu)) {
 		if (cpu == smp_processor_id()) {
-			__imsic_local_sync(lpriv);
-			return;
+			if (__imsic_local_sync(lpriv))
+				return;
 		}
 
 		if (!timer_pending(&lpriv->timer)) {
@@ -294,8 +323,9 @@ void imsic_vector_unmask(struct imsic_vector *vec)
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
@@ -305,7 +335,10 @@ static bool imsic_vector_move_update(struct imsic_local_priv *lpriv, struct imsi
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
@@ -338,8 +371,8 @@ void imsic_vector_move(struct imsic_vector *old_vec, struct imsic_vector *new_ve
 	 * interrupt on the old vector while device was being moved
 	 * to the new vector.
 	 */
-	enabled = imsic_vector_move_update(old_lpriv, old_vec, false, new_vec);
-	imsic_vector_move_update(new_lpriv, new_vec, enabled, new_vec);
+	enabled = imsic_vector_move_update(old_lpriv, old_vec, true, false, new_vec);
+	imsic_vector_move_update(new_lpriv, new_vec, false, enabled, old_vec);
 }
 
 #ifdef CONFIG_GENERIC_IRQ_DEBUGFS
@@ -402,7 +435,8 @@ struct imsic_vector *imsic_vector_alloc(unsigned int hwirq, const struct cpumask
 	vec = &lpriv->vectors[local_id];
 	vec->hwirq = hwirq;
 	vec->enable = false;
-	vec->move = NULL;
+	vec->move_next = NULL;
+	vec->move_prev = NULL;
 
 	return vec;
 }
diff --git a/drivers/irqchip/irq-riscv-imsic-state.h b/drivers/irqchip/irq-riscv-imsic-state.h
index 8fae6c99b019..f02842b84ed5 100644
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
@@ -87,7 +88,7 @@ static inline bool imsic_vector_isenabled(struct imsic_vector *vec)
 
 static inline struct imsic_vector *imsic_vector_get_move(struct imsic_vector *vec)
 {
-	return READ_ONCE(vec->move);
+	return READ_ONCE(vec->move_prev);
 }
 
 void imsic_vector_move(struct imsic_vector *old_vec, struct imsic_vector *new_vec);
-- 
2.43.0


