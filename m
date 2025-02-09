Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30740C02199
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Feb 2025 04:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RoqQmmMLZnhmH7e8y5iCPOfAA2UjM+1/YD5gOA06f3E=; b=4LBw486Oroj6LHyWXiBYHkj83L
	K0BKkzmxtk28BOv0CRHJSgL9Vpgqz5bzKPQs0+ip32eA6dlQ6wOrWLo1GRLWRc4VHRo1ahC4i8ftm
	OJe5lFyIUeTxIDMh7d1t2eTmcMu7hpmTsJcqiQZwvL2bQXUWRl7UWtQM1zIUZ39xJmuvK2pzW/T7X
	O0VtOATFt0hyJFjqTc2pHfPknk/DlR22WWdu2CGgAFwtDCIuCxbaGsS5Z6u60i1sH7FshORw4uKa5
	y3ntnyO1nMX+tgIgJVmTLJQug5CUjFENid06NhQLJ7r383cXuji3j3g0k/M8vzSx1inhbGRXzp+69
	xQtR3pFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgyyb-0000000E4tE-436X;
	Sun, 09 Feb 2025 04:31:26 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgym8-0000000E2eS-2CpQ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Feb 2025 04:18:33 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-21f5268cf50so26802235ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Feb 2025 20:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739074712; x=1739679512; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RoqQmmMLZnhmH7e8y5iCPOfAA2UjM+1/YD5gOA06f3E=;
        b=GbtDVINbpEfX8FglJJetZ8ZfLA/+Sf8zkwhN8rL4+Za8TsXPOsM3IPokkgpKAWGuL8
         U6OAiEVDGia0Wr5GA6yxGdVaOZbtbLVa8yu5k/wa3yuvOgJ/WXXC3JM8Mp4BayhCCOlj
         yoZ21NXDFPsuHqE+/6X4tcUOkSUw9bNq/TM2r/wwGHZg9u7wkWM0XjGuejKoLn+UKe3J
         uH+E5clDWfqS5KgFrFJE3oHj1xz2KGzM00VA6SLrYvQWTJavKOjA3isrhoPTHIJuWcQc
         ijjIaHZJ/95PFFBE/keBI3zYaWTpE03B/lDd/0KJ+k/Ipeu1I6lCvfGcXIVYCwacdHjN
         oNoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739074712; x=1739679512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RoqQmmMLZnhmH7e8y5iCPOfAA2UjM+1/YD5gOA06f3E=;
        b=g3+Pi5umQ4X3bKVabCSAY6oitig9OQEZyomI0decjgxoq+NpJ0Me2aS+jNYpIcaRPe
         VwAyK4gTrTsrHUJXu6l/No1KxM18FTfF6mJQpfny2BLyMN6pEa2bkUg6rOEIkKvk+pe5
         ruaD6UfcZ8MW3cV8GNHG4MZT2ichDRD9TtNMzl0V8gww/S2dwid/TvyE75JScnvSgTYv
         D2UGu+OGbJsme6tDx3/LBao7uI8VfKnFwAc2RMhpTlEn0g6go3NB5iaZsyHil15Y2YOE
         hsHEI37Ih3RCJCI71mycSBTjq58dY5Su6242EXy6XP59KIV2tbVLNxctdppo8bRE7ba3
         7q0A==
X-Forwarded-Encrypted: i=1; AJvYcCVsaEIQ5CZaKWKMGihNRsuE77nret+RuSIEaZF3r0XGRstGPWYTRn6mi8JcB4XvOk5+r4C7EH9J3vTpFNYlACWP@lists.infradead.org
X-Gm-Message-State: AOJu0YwyklSsGAEwZDbEXb52SPMzOe+Gy/gADluxYzj78LkjYr93NFx4
	C6M+XukbXJAUzFX01ZFIV50/Ajty4NX+wphYJ5IgzqEkajRWw6kIrKyKhqv4lOg=
X-Gm-Gg: ASbGncvnt6joBvCnT1KeOkZP/a5SRLIndaqMdtdy5+mvzV91L5TcVGxHEt0kIb//Sem
	tM04EDW3MSHL7uGlUizl8xDMXu64YDiKBbyJiT3oz+XQyYpQ5CUkHWrrMFI869tEXH+oubfafIN
	+2+eOZu0X7shrVsPPDMmNEZGXppB//AihJw52kxO/hLKBXdARGKe+14Cm6ifroJN8Dvt5/SM4As
	9ko4WEm7tES1UDUrSQ6Akt0bvWbnf2aZJjpv2M7/IVkWttW8RX3rWuZoJY4oOuFFu3CzzqmNxzY
	eHXLs99X/3zwEGFor7l4isDRX3HvBzt+1pcJ72rVYaQMAgvRCkbYRJg=
X-Google-Smtp-Source: AGHT+IGE4yR6cgBkkvQcZ0IHX6BsNq+H8UInEThSWisvqbLPPoF9w9oT5fD4cZTzd5CMtWIib7XuTw==
X-Received: by 2002:a05:6300:6f82:b0:1ee:1910:803f with SMTP id adf61e73a8af0-1ee191082f5mr4625773637.42.1739074711624;
        Sat, 08 Feb 2025 20:18:31 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73073eba116sm1898410b3a.124.2025.02.08.20.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 20:18:31 -0800 (PST)
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
Subject: [PATCH v5 09/11] irqchip/riscv-imsic: Implement irq_force_complete_move() for IMSIC
Date: Sun,  9 Feb 2025 09:46:53 +0530
Message-ID: <20250209041655.331470-10-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250209041655.331470-1-apatel@ventanamicro.com>
References: <20250209041655.331470-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250208_201832_604540_5D960EC8 
X-CRM114-Status: GOOD (  15.85  )
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
index 9a5e7b4541f6..b9e3f9030bdf 100644
--- a/drivers/irqchip/irq-riscv-imsic-platform.c
+++ b/drivers/irqchip/irq-riscv-imsic-platform.c
@@ -129,6 +129,37 @@ static int imsic_irq_set_affinity(struct irq_data *d, const struct cpumask *mask
 
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
@@ -137,6 +168,7 @@ static struct irq_chip imsic_irq_base_chip = {
 	.irq_unmask		= imsic_irq_unmask,
 #ifdef CONFIG_SMP
 	.irq_set_affinity	= imsic_irq_set_affinity,
+	.irq_force_complete_move = imsic_irq_force_complete_move,
 #endif
 	.irq_retrigger		= imsic_irq_retrigger,
 	.irq_compose_msi_msg	= imsic_irq_compose_msg,
diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/irq-riscv-imsic-state.c
index 96e994443fc7..5ec2b6bdffb2 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.c
+++ b/drivers/irqchip/irq-riscv-imsic-state.c
@@ -311,6 +311,23 @@ void imsic_vector_unmask(struct imsic_vector *vec)
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


