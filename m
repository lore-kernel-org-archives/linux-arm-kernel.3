Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 488D9C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 08:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2spJ1HnVniz9PCwrjRYFNbVUb3mNe4Ef/XoJaqLNwpE=; b=H13xdnd2iHNGtGoYRCIGBi9TSR
	YxO7StWAi/mtE/jxjukJkRYNn51nCm21z+EqZX75MrEPqxBViDVEPduczXHf+TwGH8dv8ovBWbia8
	QQGvK4GIKJIVveu0MEHrZYT6jkNuWqO7QHWCyTZLQloWohbUkpqNT1p98LbHa9PJHNTCFMqvuw6r5
	T98vrbLdmsbhOJZQ6VA1kYt6mlgTw1bvBsVjNFU0MyuJoOJ9ThI2HsDre7vm0Y385SKbnk1psamL3
	W7nIT37gFnpuKFkE73W0AMCQVUgeKX8lT6OdrpaoaS0HX03Akkr3aSaZvlit6wmq3AgZoBZfjnYAb
	WrWp7w+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfDxp-0000000HUiw-0qNP;
	Tue, 04 Feb 2025 08:07:21 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfDmZ-0000000HSyS-1Gdy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 07:55:44 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-7b6e9db19c8so477630285a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Feb 2025 23:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738655742; x=1739260542; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2spJ1HnVniz9PCwrjRYFNbVUb3mNe4Ef/XoJaqLNwpE=;
        b=HXJfyv5xapJ+Ikt5B/RWtR/uLRKbjWPUmLN1P5EEPF3bmE5zZq2wgaOPC6P6yn7zgf
         Sz5fxQPiGGh5av6dzh8sBJSqbpg2+hLxJVkGnAHRo3oxyIcXBg4/j/4HCnIAdmnlPYHs
         N05HyiJGtSRt+HW54/99web4Lo1HEnaV/INy4eh1H+S0sonxJYZ60vtIWhbtTLq0HE/2
         aARhpwTsKp5QVVhQckF1SMGpjy+qBrZSr3qIu37Np1DAX7JWfnPHKOy9eCO+PWDnESKT
         EPHalTl8xM2FXkhzBfEjo/wHBOdgk+RXJuKIZq/WSC89Y+OIV3R24CVme52u8YEE4O9L
         ltPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738655742; x=1739260542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2spJ1HnVniz9PCwrjRYFNbVUb3mNe4Ef/XoJaqLNwpE=;
        b=InliGrvVcwXKFZ8n6Cw6pvj8NPe26ZgVVfVm4U73olIsEaqZII59h2iwnbkJBC8f45
         Ojvd/T7fJzITnug/JbtQtESijzSSHjkuEHU4x/hDGDgd7MkYDTn2i8oSCA3gOxoNw9x0
         LEnwPuTm1wwR52TZfElqNzX3aWVPo81FzC/8Qs4iMERS09phkX2GanNVtD/j0PVXGnFc
         vr1tBgBnPVldyjsyWyJN1E5gSwZEJfOJU9FKzWow8mHuTaoCX5FAJoqgW/2qOKP2PcIC
         v5v3W14Zuz+VRytDTqIDUh8IhR47C6KA8y0FAAIexcEgBcAN3eEEiRp/VQz/udzDOMfB
         jgCg==
X-Forwarded-Encrypted: i=1; AJvYcCXlW6ktsK435F//dL05zVdW05fWs+B00bTbxSqQfXffP2UsRx5kS02I3DEYjrFrKdF7FSclrIo0vyqL/sv6JAY3@lists.infradead.org
X-Gm-Message-State: AOJu0YxFjS3ZFDW0THKD7v8+5+GQC5tL2ZKOKzy+nAjr3yCSSLBq7YxK
	r+Mhvr1hzgpeb6BiOFuilrDYai3ZuZO0eRm2gJBpFvz/TA8jhdS18DWyoUYT8fg=
X-Gm-Gg: ASbGnctfAEEvOE+ugkDNv1rFzl2oHQ/hDTrqp+Ni7m20J030jYpoOId0mFfYsnCb9MR
	OwLkFM8mttJ2tibyCRD6aMYX9bhDE285LHqn5eSsyhwNXL7p1aTejYdG1VCNc3/iLhb3QQSPKx8
	r0ebrGsGNwTv71AnPVXIPmmgap0iWHOeuybV9ra66eVnz2CTR/8xnqWdVeigQobT2+dFYAPQaUI
	t1MmSkqzdL3nA60qiVPcB8gy9GY6/MgbWL4Jdwd477UTCGvHGSq1lf1HAuSpNNQBrl0/2c23rD5
	5dXxxqmxbA/oCXPf1qQV1SuN9K/uidbbAMY0OGv/HjojleFAKSD042c=
X-Google-Smtp-Source: AGHT+IH3PInyMoZqyc0SRTAjhuFIMbhus6lgn+l4uL8MxLHlStsGNic2bJF7E2l/TEt5N03Sy8JF7A==
X-Received: by 2002:a05:620a:4382:b0:7b1:56f0:e09f with SMTP id af79cd13be357-7bffcda14b6mr4536316585a.54.1738655742363;
        Mon, 03 Feb 2025 23:55:42 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a8d05ddsm613373185a.39.2025.02.03.23.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 23:55:41 -0800 (PST)
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
Subject: [PATCH v3 08/10] irqchip/riscv-imsic: Implement irq_force_complete_move() for IMSIC
Date: Tue,  4 Feb 2025 13:24:03 +0530
Message-ID: <20250204075405.824721-9-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250204075405.824721-1-apatel@ventanamicro.com>
References: <20250204075405.824721-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_235543_343130_FD9EF01B 
X-CRM114-Status: GOOD (  15.37  )
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
index 649012cc47a8..54773c27c411 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.c
+++ b/drivers/irqchip/irq-riscv-imsic-state.c
@@ -332,6 +332,23 @@ void imsic_vector_unmask(struct imsic_vector *vec)
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


