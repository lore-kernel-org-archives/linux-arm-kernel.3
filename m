Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CC91E77183
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Dec 2024 18:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K8c4bSx6OeCafE/EjjWkj4NBjcuAlryx7NpTdvjZLKQ=; b=r47uc0lJaItgKn61fXxKbnZJJM
	i6dlp1t0rZDc5rg3lX9AJgRm3XvK1v372zI8xdRcsnWxakrjFGfSp3gAKCtgEH6wLgh4vezLmf6tC
	Lx7UbZX7VUuIj/3cOrJ5nOJ8yiaNykMy5b82dOBdKddLAeee4oFqxtxGcO8BBZ+fFbxUxzGjfBmxH
	8v/uFA0XZskerLGmnJPUHUj6tlmQACNcgz/YC/t3m9XZfAtmfrxJvM6T1OGfvhGPHOUYypNpgOT+m
	Ajgd6KGAIgNh/AtAckbS3RgJeWUUsbxj9VLUu8hiI40i8O9bkq7AlNkP1FsB2tFr/oOAZVV0NtSPt
	WUzqo9Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMX9F-00000006nXk-49k7;
	Sat, 14 Dec 2024 18:45:53 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMVv2-00000006gXq-1zTV
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Dec 2024 17:27:09 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-7e9e38dd5f1so2113830a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Dec 2024 09:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1734197227; x=1734802027; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K8c4bSx6OeCafE/EjjWkj4NBjcuAlryx7NpTdvjZLKQ=;
        b=DyAQGC6PrV0cyPA1tAoa/aVyJn3JyNZBq6b7tYnZ3lU/vAI0vuV20DyBdUHfMh3mb0
         +GpIyUwFapPXO6ekwmmMal3LPBJkP1ItZxiVrylcDtcoEHVFgB8xmr6CzBFzHaGUOC80
         lLhoAvDoxE22t+MatTzrdCWo+ELJQns2uR8WPmB5BM2F+prjTV9IVEBv+4L284ggNReJ
         jD19Y20SGW+xtx6SZOg3EcylqCezHH0n3ddlFbXLRQEWCT2jG2GrxH9ni0ptaUNX5jBF
         NFpywYxu3obOLI6HwbAhaRVA/SZMhdtMcjTQuI1Bk1mREyiiC+PWYa9wwHTWZ/QjB3Kr
         XR/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734197227; x=1734802027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K8c4bSx6OeCafE/EjjWkj4NBjcuAlryx7NpTdvjZLKQ=;
        b=XUcX5QJRWFVlRoXlVrL08VTyUTR9pS8187kupWEbpxh11cP+e8i2Y5uVpp+diA5Q3L
         96hqHCRR+C2V45kk62BOqQ+C/G/OrySm35qA3L1DswmCRx3mzAuihzWReJRrAKXqR//4
         0/n6w5sgjjjAUj1Y3HBpZxFljpk4okH+jRk4SP+0Q0IO98ZkiItZLw6uM4CvcBE8HwTO
         5Gn2KQP63lN7w4NvconhmcqOuRT4z1tABAcvqRRNTit4ApssoVoLau1D2scsByPaJaFM
         Uut7kGT4uaTPEOIOfur8JVq+vmaLgCBN8WYyz0eYEL8aQ0as/e880XWJfSX+CHMHpOyr
         mkGw==
X-Forwarded-Encrypted: i=1; AJvYcCUE00F5YmmdOcEm9eByXgM0i4Q/VCD0K/xcl0g/BKdwxxVwFkNd+X1r8P0JYgVk6ylAiLuqsJ/6+kVO6IMQCDgi@lists.infradead.org
X-Gm-Message-State: AOJu0YwpUkfD9hW7HCoGPB7hFXPOHTw9KGoQwHM7S/E1Iq+jqKTcVR3W
	GVll677911ScrVcT23N1TT1HaHiX5R1itR8LjKuEqVM6tU0TCn6qXoepnZTuWRL3KXln7fYt5oN
	L
X-Gm-Gg: ASbGncugeeZ5xXbX5BOJu2dZM5ONcGT3qxtxT3Kb56ZxXCdN7xXO+b0teRHVgSUjCa1
	HpZQnfSKE5EbhNppzmXSL/zOb2yTxHu/WgBXh7ffwSVw5ntPyXHdr9xukBuTcEQDYF7ORhw+KAm
	X4JxWfNX3KOHI+sr5klYxB63dtRm0N9L3SZywWZH4doYHHEoPimkzcfftZ5e34PBek/edjG9KZQ
	dX5w9ZsdsnZtJPqGAVnIPKkm0rLA0Trh91s/JJ9UAD9EQn/OUfv9QxsoBv/hWbM3/Nc4c0V/G4g
	2jsolTwjp7ZmS4c=
X-Google-Smtp-Source: AGHT+IHUcfTVYGQvMkfUU7jHBszvrCcnJgKMrSzxBafo9cGQC89Lrd4GQaGCXdK1f1d1ktL3gp5V1w==
X-Received: by 2002:a17:90b:4a4f:b0:2ee:9902:18b4 with SMTP id 98e67ed59e1d1-2f2900a9878mr10311790a91.27.1734197227250;
        Sat, 14 Dec 2024 09:27:07 -0800 (PST)
Received: from localhost.localdomain ([223.185.132.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f142f9e186sm5049811a91.41.2024.12.14.09.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 09:27:06 -0800 (PST)
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
Subject: [PATCH v2 09/11] irqchip/riscv-imsic: Implement irq_force_complete_move() for IMSIC
Date: Sat, 14 Dec 2024 22:55:47 +0530
Message-ID: <20241214172549.8842-10-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241214172549.8842-1-apatel@ventanamicro.com>
References: <20241214172549.8842-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241214_092708_504325_8C827317 
X-CRM114-Status: GOOD (  16.13  )
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

Implement irq_force_complete_move() for IMSIC driver so that in-flight
vector movements on a CPU can be cleaned-up when the CPU goes down.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/irq-riscv-imsic-platform.c | 32 ++++++++++++++++++++++
 drivers/irqchip/irq-riscv-imsic-state.c    | 17 ++++++++++++
 drivers/irqchip/irq-riscv-imsic-state.h    |  1 +
 3 files changed, 50 insertions(+)

diff --git a/drivers/irqchip/irq-riscv-imsic-platform.c b/drivers/irqchip/irq-riscv-imsic-platform.c
index 2fab20d2ce3e..fae47b8ccf73 100644
--- a/drivers/irqchip/irq-riscv-imsic-platform.c
+++ b/drivers/irqchip/irq-riscv-imsic-platform.c
@@ -156,6 +156,37 @@ static int imsic_irq_set_affinity(struct irq_data *d, const struct cpumask *mask
 
 	return IRQ_SET_MASK_OK_DONE;
 }
+
+static void imsic_irq_force_complete_move(struct irq_data *d)
+{
+	struct imsic_vector *mvec, *vec = irq_data_get_irq_chip_data(d);
+	unsigned int cpu = smp_processor_id();
+
+	if (WARN_ON(!vec))
+		return;
+
+	/* Do nothing if there is no in-flight move */
+	mvec = imsic_vector_get_move(vec);
+	if (!mvec)
+		return;
+
+	/* Do nothing if the old IMSIC vector does not belong to current CPU */
+	if (mvec->cpu != cpu)
+		return;
+
+	/*
+	 * The best we can do is force cleanup the old IMSIC vector.
+	 *
+	 * The challenges over here are same as x86 vector domain so
+	 * refer to the comments in irq_force_complete_move() function
+	 * implemented at arch/x86/kernel/apic/vector.c.
+	 */
+
+	/* Force cleanup in-flight move */
+	pr_info("IRQ fixup: irq %d move in progress, old vector cpu %d local_id %d\n",
+		d->irq, mvec->cpu, mvec->local_id);
+	imsic_vector_force_move_cleanup(vec);
+}
 #endif
 
 static struct irq_chip imsic_irq_base_chip = {
@@ -164,6 +195,7 @@ static struct irq_chip imsic_irq_base_chip = {
 	.irq_unmask		= imsic_irq_unmask,
 #ifdef CONFIG_SMP
 	.irq_set_affinity	= imsic_irq_set_affinity,
+	.irq_force_complete_move = imsic_irq_force_complete_move,
 #endif
 	.irq_retrigger		= imsic_irq_retrigger,
 	.irq_compose_msi_msg	= imsic_irq_compose_msg,
diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/irq-riscv-imsic-state.c
index da49a160ea09..c915a5cf4187 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.c
+++ b/drivers/irqchip/irq-riscv-imsic-state.c
@@ -323,6 +323,23 @@ void imsic_vector_unmask(struct imsic_vector *vec)
 	raw_spin_unlock(&lpriv->lock);
 }
 
+void imsic_vector_force_move_cleanup(struct imsic_vector *vec)
+{
+	struct imsic_local_priv *lpriv;
+	struct imsic_vector *mvec;
+	unsigned long flags;
+
+	lpriv = per_cpu_ptr(imsic->lpriv, vec->cpu);
+	raw_spin_lock_irqsave(&lpriv->lock, flags);
+
+	mvec = READ_ONCE(vec->move_prev);
+	WRITE_ONCE(vec->move_prev, NULL);
+	if (mvec)
+		imsic_vector_free(mvec);
+
+	raw_spin_unlock_irqrestore(&lpriv->lock, flags);
+}
+
 static bool imsic_vector_move_update(struct imsic_local_priv *lpriv,
 				     struct imsic_vector *vec, bool is_old_vec,
 				     bool new_enable, struct imsic_vector *move_vec)
diff --git a/drivers/irqchip/irq-riscv-imsic-state.h b/drivers/irqchip/irq-riscv-imsic-state.h
index f02842b84ed5..19dea0c77738 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.h
+++ b/drivers/irqchip/irq-riscv-imsic-state.h
@@ -91,6 +91,7 @@ static inline struct imsic_vector *imsic_vector_get_move(struct imsic_vector *ve
 	return READ_ONCE(vec->move_prev);
 }
 
+void imsic_vector_force_move_cleanup(struct imsic_vector *vec);
 void imsic_vector_move(struct imsic_vector *old_vec, struct imsic_vector *new_vec);
 
 struct imsic_vector *imsic_vector_from_local_id(unsigned int cpu, unsigned int local_id);
-- 
2.43.0


