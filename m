Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71234C021A1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 10:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Atdfv1u3QJvV1o68tlPZkH3S4E5LyywsJGNj7mblCio=; b=kjfIM8Qj4zLB0+kcJbKw+kx4v8
	tuDl7BtgdzO0sonBZ6yGq+wcCy4znF/C05/7PLTcn/YcI1SgYDd408QYtV1BtaH4TDS+S2OPhT/AN
	YA23d/5r2Lorbxd7+qCnK5VH09x5Z5BtzuTZF9WZ6R/+uZl6Hijf+zDqGKhkToi7aNaFsvQQ3zV8z
	ukZ2YKBQ/+G3LEfcaXqS3Gz1UJZvAIIaDtxSo1UqpccVAfbXTWygJfdGjqNGQBFfI6vNJXJXzbT3K
	cEvTcUJtCv9EC33ieN4k29SqGG5SKypjqAgPCvXvBZQ2CjyX9gQsa1pHrLlxne7fwR9PdSlhBcVW8
	559u2X9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjykN-00000004ANt-2byp;
	Mon, 17 Feb 2025 10:53:07 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjwww-00000003pa4-0B1M
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 08:57:59 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-220e989edb6so76091775ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 00:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739782677; x=1740387477; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Atdfv1u3QJvV1o68tlPZkH3S4E5LyywsJGNj7mblCio=;
        b=N5GZiwzPhb3hogKX/hCLPo1FRYQeET8F9SGiqJwJCz9P0EXkCd48OI1grZXB4Swezk
         NzK2CgjhP3sbxbFPUm6fvdXa0hFJfGXUnnU0LK2D5d8kp16TJaK19g/B5R91yqOiryyX
         MHPb0Qak149maV7EEMaMqWpY2hiyTuKYsFwXlq9rBZTFb4S7VE7TlFtoNFxB8HhZUDXL
         Nelnsd/gySLelKRegVcna9opIH43z0KhIsbK6MmhDsFdwuMjI/n7p3usf3nC8L1+cMML
         EN+Fdg7L0wavMSBNhyb/l+y8Pn3UHTpInifN2xZkF/sZGebQqFy2aPOH07zm3jSsZXRc
         XVtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739782677; x=1740387477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Atdfv1u3QJvV1o68tlPZkH3S4E5LyywsJGNj7mblCio=;
        b=SY+iLPIKnFdKFF3b9/hYnBaMX93CWU1c0gFwSjIT6Qj1u5cY/HVv5pcorHJo0hwMPO
         N3WuOIeuDCsHQNDXyZrDIbhER0NLQw7vwTHx6HsS325ZfLYZakchN1301bAI8SAFmdT1
         ubW7J//0Yj32i4WCEv4DPYd8Nozo2vMHioPTWI36zrXGl7atrvTn9p7rlql+treNBLnR
         sONIYtQM0uyXPyck9FOwVPt+grQnXeNr+2A91Se82MhAXd0acQT0gSncZwH4Nj2R8m9s
         SymdLvT24Q4RGNQnc92gA+W3EgDkSBvwbW5M1w4ArC7TIh5B+pOSOsKKK9Qkj9Tn8Y3+
         kW0w==
X-Forwarded-Encrypted: i=1; AJvYcCUx82LOrrNFn3LmGm8woRqWMMT34hhVkrVnZJMEndKpuC+66dLwjX8KEmlk5+EJgZWCb2fL8h4YUYvB24D8HEvs@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2bGwF0KgZwNDWUhLCAeJzRJrQf3Q/RYaRI9gr05qDdh7nGPw3
	DAnkL1xc1H+UPjtIDRdGrdVeWjkqBDRBUdX5EOqxNe4WKI+YG16SnjX1YYnZE2M=
X-Gm-Gg: ASbGncu+6aQR8DazbDhLRIne1tKTzNgu0yYrGlm8O+tg1st04Zg3yPai/4Q1wAWxfG/
	kcbNSVMjVmfMK4DpYi4WZ2f7LwPn45RmEAW745KxD1NUJhikHB+aeLWQ8tGUH56c76A2kkkyzTP
	3bNLbC8PeLU4772p0HJL8dwdtw+4mskfrTdKNfoCmWGapQXnQ2VkdRlZjS9cHoHvDbU7SqFSl+8
	ZOGAz1SXX2fC1GfXcrSn/2beHzwSl5R2NAIlSO09E+ZY/16jRAyRkxORyfIEWIgwJJHz2a/PSEz
	lAskRLi3oU22U8aXc34JxgtzczWQ/+ImlWnOTP382U4F9s0AYAj+A58=
X-Google-Smtp-Source: AGHT+IFPW0gjXYzToorJlW4AuIzo5YfoCgQvbwScUi6k6HolCkujw1LAnVbhNnt/U0DkIfz+68pqpQ==
X-Received: by 2002:a05:6a00:cd4:b0:725:9d70:6ace with SMTP id d2e1a72fcca58-73261798a0amr14960838b3a.6.1739782677006;
        Mon, 17 Feb 2025 00:57:57 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([122.171.22.227])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73242546867sm7632018b3a.24.2025.02.17.00.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 00:57:56 -0800 (PST)
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
Subject: [PATCH v6 01/10] irqchip/riscv-imsic: Set irq_set_affinity for IMSIC base
Date: Mon, 17 Feb 2025 14:26:47 +0530
Message-ID: <20250217085657.789309-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250217085657.789309-1-apatel@ventanamicro.com>
References: <20250217085657.789309-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_005758_085293_76AE693F 
X-CRM114-Status: GOOD (  14.92  )
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

From: Andrew Jones <ajones@ventanamicro.com>

Instead of using imsic_irq_set_affinity() for leaf MSI domains, use
imsic_irq_set_affinity() for the non-leaf IMSIC base domain and use
irq_chip_set_affinity_parent() for leaf MSI domains. This is required
for moving the IMSIC driver to the common MSI lib which uses a generic
msi_domain_set_affinity() for device MSI domains.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/irq-riscv-imsic-platform.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-imsic-platform.c b/drivers/irqchip/irq-riscv-imsic-platform.c
index c708780e8760..5d7c30ad8855 100644
--- a/drivers/irqchip/irq-riscv-imsic-platform.c
+++ b/drivers/irqchip/irq-riscv-imsic-platform.c
@@ -96,9 +96,8 @@ static int imsic_irq_set_affinity(struct irq_data *d, const struct cpumask *mask
 				  bool force)
 {
 	struct imsic_vector *old_vec, *new_vec;
-	struct irq_data *pd = d->parent_data;
 
-	old_vec = irq_data_get_irq_chip_data(pd);
+	old_vec = irq_data_get_irq_chip_data(d);
 	if (WARN_ON(!old_vec))
 		return -ENOENT;
 
@@ -116,13 +115,13 @@ static int imsic_irq_set_affinity(struct irq_data *d, const struct cpumask *mask
 		return -ENOSPC;
 
 	/* Point device to the new vector */
-	imsic_msi_update_msg(d, new_vec);
+	imsic_msi_update_msg(irq_get_irq_data(d->irq), new_vec);
 
 	/* Update irq descriptors with the new vector */
-	pd->chip_data = new_vec;
+	d->chip_data = new_vec;
 
-	/* Update effective affinity of parent irq data */
-	irq_data_update_effective_affinity(pd, cpumask_of(new_vec->cpu));
+	/* Update effective affinity */
+	irq_data_update_effective_affinity(d, cpumask_of(new_vec->cpu));
 
 	/* Move state of the old vector to the new vector */
 	imsic_vector_move(old_vec, new_vec);
@@ -135,6 +134,9 @@ static struct irq_chip imsic_irq_base_chip = {
 	.name			= "IMSIC",
 	.irq_mask		= imsic_irq_mask,
 	.irq_unmask		= imsic_irq_unmask,
+#ifdef CONFIG_SMP
+	.irq_set_affinity	= imsic_irq_set_affinity,
+#endif
 	.irq_retrigger		= imsic_irq_retrigger,
 	.irq_compose_msi_msg	= imsic_irq_compose_msg,
 	.flags			= IRQCHIP_SKIP_SET_WAKE |
@@ -245,7 +247,7 @@ static bool imsic_init_dev_msi_info(struct device *dev,
 		if (WARN_ON_ONCE(domain != real_parent))
 			return false;
 #ifdef CONFIG_SMP
-		info->chip->irq_set_affinity = imsic_irq_set_affinity;
+		info->chip->irq_set_affinity = irq_chip_set_affinity_parent;
 #endif
 		break;
 	default:
-- 
2.43.0


