Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 796DEC0218F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 08:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3gEwcaDf3FiyZX0vTyT/9XCNNLKunHvBb/ApGbPO13I=; b=U6GU8NNBvibZFemHcwXAoeEWsP
	GeP2tSghyEmqg7OE3NWAOPtmbSysjfD+0R9wrekqLKETvh5/hMQZkrPe+WtXcy+Etc5fmQpDWVC66
	23GhWFcsPqfSsa4dBhkHpeOs+gsWj1SeRpaSmEnZa3UHocya7lbdfpkqkzRSNBSe6OfggiGCdy8Kq
	0CtivUHkb0QEMZmeXF5GR7xTDNznGeYCcgNUXVVtQF8uogdo+GDXPGiJcCIc0TFV33NvjFFhVtCvV
	zf23vJZ8MnOa3EMehuzUBnDefwMthbKi/+yDtsBXucwkB6r1xJbuhWnJDLbLxaGcx8v5EMEjpAnA6
	7XJ1Ik6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfDz9-0000000HUwp-24iR;
	Tue, 04 Feb 2025 08:08:43 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfDmi-0000000HT22-3mEq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 07:55:54 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-7b8618be68bso518313585a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Feb 2025 23:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738655752; x=1739260552; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3gEwcaDf3FiyZX0vTyT/9XCNNLKunHvBb/ApGbPO13I=;
        b=BAJ8CwJ/DVmyUhEdQNSQBTJZTBech1LS87zix86GEM+PzkX/mDXV9X80yhmciEsiJL
         BCocVTNDlHXlNftUoB2QYbctLVsMkxKlHGBK+XyaEW1CrCsHccPW0/Os2nkgOk8NULzp
         2xYCNo/h3k8IfS6PBGg/+KCdKunZltt4YNSKEoz7lrxne5XmUe8fk9VL+GMV4G66N8yT
         yjOwL1mqarTdCyuRR85UFus5iFeclUtcvjI6jr9trgoE3VOgmnQVxb4wEIlQzfwEWi+Z
         U8GSymW9Ucws40LbmiK0X9Z5wGu+DFvNnKCh8P/eEIT8oj2I1u17FEaSp9nJRzV32zOo
         OUWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738655752; x=1739260552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3gEwcaDf3FiyZX0vTyT/9XCNNLKunHvBb/ApGbPO13I=;
        b=xTOalZgXGa2bXT2YWPTYbA+YdtF8is+PUYhBvzXQ2tEhf0bxmaMA7UaFEqFPJGtsTm
         8PMP1AQQ85OJkPwTojhMn5wRtk0sSRbFlcK4D7Ac2G8vbmoDxVKvtLeI6Pq1SZ2DtzCO
         9H8Ycbu8o8fMQ3grS4xdeJtvn/FtnnSj1GsevhrPSXKgPwowtuE2nRBGOOSasDlF2t0v
         BF3dbL30NNNFPbmsCwutQClC+iDetjCt5ePsivO6Sc7egZjn8+5Nt6MFsnyaL1JNfugh
         sAFSwjhW4QcukO9Tg0syd7p/aJq6sZBE1DTvx1hixtPSk5GSyp2mUm7bG46SegUHa7wi
         b1RA==
X-Forwarded-Encrypted: i=1; AJvYcCVKjpK1rQZyzC8Z+TJ83/Lqtmj/vWAty3nEocxMacxazj5nS0lr0NrN2Dp06z/usMCK3ovHMa6O4rc4fVxGJDSg@lists.infradead.org
X-Gm-Message-State: AOJu0YykqMiobDTkLdRamL1zP/wAdHTOUG25NwTtZ0e9+ubqVNB8Pvf6
	iMt1ObTesLooPY+jMi7A5PYpzb9J/XKZU66t+RkzlHmCxpMrNBxdKjTOD/scIDM=
X-Gm-Gg: ASbGncspcOby40jYe1efFAzctJK9/j4r8DwY/EvKh3IQZQtgv1YdkmHXKQtVEDPZWSU
	+iV2nPYUvuM17e8RtGgE4s5EmKiZyzEdLYu1U8uQB0HUuS05IMiaWRCqLYPVQGOquhnXGvIrSTH
	izl1r6lLST4Q8GNsDV0/H0oA2quObxfDzVPPtoDAz7sIbEpKcTqw4wqLY6XC+/zW8S7d6QFPy+7
	E2+OJnOOGMJNY8hg9Z72RHZa+lXwc1wgDkiZxDCb94lquos4Cq3t+dOdvNR35dYsJApiwufYdai
	aMIDucvHxBYHBVQsnTUKzPLNa+zXkE1z6nm0G+jfPe4x40T15x7gKgc=
X-Google-Smtp-Source: AGHT+IE1kqeyReImTVJHGW5IDLgtzpBSrI2/ZE4aOj+o6f7vrc3hrNQAxAn/RUr7v38bA4d+4LAZBQ==
X-Received: by 2002:a05:620a:2992:b0:7b9:a387:3cd8 with SMTP id af79cd13be357-7bffcd956e1mr2941465585a.42.1738655751905;
        Mon, 03 Feb 2025 23:55:51 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a8d05ddsm613373185a.39.2025.02.03.23.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 23:55:51 -0800 (PST)
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
Subject: [PATCH v3 09/10] irqchip/riscv-imsic: Replace hwirq with irq in the IMSIC vector
Date: Tue,  4 Feb 2025 13:24:04 +0530
Message-ID: <20250204075405.824721-10-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250204075405.824721-1-apatel@ventanamicro.com>
References: <20250204075405.824721-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_235552_940476_FB5654DC 
X-CRM114-Status: GOOD (  17.97  )
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

Currently, the imsic_handle_irq() uses generic_handle_domain_irq() to
handle the irq which internally has an extra step of resolving hwirq
using domain. This extra step can be avoided by replacing hwirq with
irq in the IMSIC vector and directly calling generic_handle_irq().

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/irq-riscv-imsic-early.c    | 6 ++----
 drivers/irqchip/irq-riscv-imsic-platform.c | 2 +-
 drivers/irqchip/irq-riscv-imsic-state.c    | 8 ++++----
 drivers/irqchip/irq-riscv-imsic-state.h    | 4 ++--
 4 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-imsic-early.c b/drivers/irqchip/irq-riscv-imsic-early.c
index 73a93ce8668f..0c94ce8ce580 100644
--- a/drivers/irqchip/irq-riscv-imsic-early.c
+++ b/drivers/irqchip/irq-riscv-imsic-early.c
@@ -73,7 +73,7 @@ static int __init imsic_ipi_domain_init(void) { return 0; }
 static void imsic_handle_irq(struct irq_desc *desc)
 {
 	struct irq_chip *chip = irq_desc_get_chip(desc);
-	int err, cpu = smp_processor_id();
+	int cpu = smp_processor_id();
 	struct imsic_vector *vec;
 	unsigned long local_id;
 
@@ -103,9 +103,7 @@ static void imsic_handle_irq(struct irq_desc *desc)
 			continue;
 		}
 
-		err = generic_handle_domain_irq(imsic->base_domain, vec->hwirq);
-		if (unlikely(err))
-			pr_warn_ratelimited("hwirq 0x%x mapping not found\n", vec->hwirq);
+		generic_handle_irq(vec->irq);
 	}
 
 	chained_irq_exit(chip, desc);
diff --git a/drivers/irqchip/irq-riscv-imsic-platform.c b/drivers/irqchip/irq-riscv-imsic-platform.c
index fae47b8ccf73..e6c81718ba78 100644
--- a/drivers/irqchip/irq-riscv-imsic-platform.c
+++ b/drivers/irqchip/irq-riscv-imsic-platform.c
@@ -112,7 +112,7 @@ static int imsic_irq_set_affinity(struct irq_data *d, const struct cpumask *mask
 		return -EBUSY;
 
 	/* Get a new vector on the desired set of CPUs */
-	new_vec = imsic_vector_alloc(old_vec->hwirq, mask_val);
+	new_vec = imsic_vector_alloc(old_vec->irq, mask_val);
 	if (!new_vec)
 		return -ENOSPC;
 
diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/irq-riscv-imsic-state.c
index 54773c27c411..e70f497a9326 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.c
+++ b/drivers/irqchip/irq-riscv-imsic-state.c
@@ -443,7 +443,7 @@ struct imsic_vector *imsic_vector_from_local_id(unsigned int cpu, unsigned int l
 	return &lpriv->vectors[local_id];
 }
 
-struct imsic_vector *imsic_vector_alloc(unsigned int hwirq, const struct cpumask *mask)
+struct imsic_vector *imsic_vector_alloc(unsigned int irq, const struct cpumask *mask)
 {
 	struct imsic_vector *vec = NULL;
 	struct imsic_local_priv *lpriv;
@@ -459,7 +459,7 @@ struct imsic_vector *imsic_vector_alloc(unsigned int hwirq, const struct cpumask
 
 	lpriv = per_cpu_ptr(imsic->lpriv, cpu);
 	vec = &lpriv->vectors[local_id];
-	vec->hwirq = hwirq;
+	vec->irq = irq;
 	vec->enable = false;
 	vec->move_next = NULL;
 	vec->move_prev = NULL;
@@ -472,7 +472,7 @@ void imsic_vector_free(struct imsic_vector *vec)
 	unsigned long flags;
 
 	raw_spin_lock_irqsave(&imsic->matrix_lock, flags);
-	vec->hwirq = UINT_MAX;
+	vec->irq = 0;
 	irq_matrix_free(imsic->matrix, vec->cpu, vec->local_id, false);
 	raw_spin_unlock_irqrestore(&imsic->matrix_lock, flags);
 }
@@ -531,7 +531,7 @@ static int __init imsic_local_init(void)
 			vec = &lpriv->vectors[i];
 			vec->cpu = cpu;
 			vec->local_id = i;
-			vec->hwirq = UINT_MAX;
+			vec->irq = 0;
 		}
 	}
 
diff --git a/drivers/irqchip/irq-riscv-imsic-state.h b/drivers/irqchip/irq-riscv-imsic-state.h
index 19dea0c77738..3202ffa4e849 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.h
+++ b/drivers/irqchip/irq-riscv-imsic-state.h
@@ -20,7 +20,7 @@ struct imsic_vector {
 	unsigned int				cpu;
 	unsigned int				local_id;
 	/* Details saved by driver in the vector */
-	unsigned int				hwirq;
+	unsigned int				irq;
 	/* Details accessed using local lock held */
 	bool					enable;
 	struct imsic_vector			*move_next;
@@ -96,7 +96,7 @@ void imsic_vector_move(struct imsic_vector *old_vec, struct imsic_vector *new_ve
 
 struct imsic_vector *imsic_vector_from_local_id(unsigned int cpu, unsigned int local_id);
 
-struct imsic_vector *imsic_vector_alloc(unsigned int hwirq, const struct cpumask *mask);
+struct imsic_vector *imsic_vector_alloc(unsigned int irq, const struct cpumask *mask);
 void imsic_vector_free(struct imsic_vector *vector);
 
 void imsic_vector_debug_show(struct seq_file *m, struct imsic_vector *vec, int ind);
-- 
2.43.0


