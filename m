Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B7E4E77173
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Dec 2024 15:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BkXmty9V9UumQmJiSKG/1C8V4fnfZ0RhcvZQ4ROkR2w=; b=yY9cJJNU3Z1iq4/1gs8HVFV5yb
	GIRii1f0ForTNLuh4c3JomiTLAoAKX8Rcdy+JJ7h8KqRlTFsAi3HiX66Tv2bbsUB5f0xKGs9r0CDG
	+NGTJ5gFFxDocszibewzG7sNMxzIfRZOV6mUwNN9xoiMjfD7Z/8S9XKSiN6FPkDviXr99CUJI6iHZ
	hJbNEHxq9HiMc03/qJPkVaGG8ATpnqGvUT4Bh+Up81Di3fUVPSG6gAOk1MApmnp3s4clNa/+DYLaL
	+/l1BvDQDRkWgd9Fw8eknBObpC6SsHFBmu0lnCUHi06IWuS5GrWVLQX31OfTuQswATghy492P3Rke
	WIdY8+vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKIwc-00000005R41-33fS;
	Sun, 08 Dec 2024 15:11:38 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKIsm-00000005Q8V-0lai
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Dec 2024 15:07:41 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-21631789fcdso4788995ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Dec 2024 07:07:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1733670459; x=1734275259; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BkXmty9V9UumQmJiSKG/1C8V4fnfZ0RhcvZQ4ROkR2w=;
        b=gmvqFq96nKrMOKGocaWoq9D1d3ELVaUiUUEaM72MrAlm2CkDBTysvb0cSvLfqg+Up5
         /gaFBBxugq6i+PqTt6EvCeZaP6aD8qjgLolAuMdsYe59JkYbz2Q8u0+m2mEbyoDUXRbY
         +Sb59VuP3GNmxMyWlbq3tu/8vfgDScgaEyo5jsgnqXD9gami1vcrXXxvTi9nACBr9kaA
         mxyxtPHhO3fQz/DsV+VdqdoqYojEV42nrbsWe5PaL4qy506szW9hbZSiOEIj1dybexDY
         tsxKyS3KACwMXQX0o3YCOsu1fqR5W+MuSqL67xvaJf+2wmzuUq/Cxciige6m5iwnsFB+
         MQ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733670459; x=1734275259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BkXmty9V9UumQmJiSKG/1C8V4fnfZ0RhcvZQ4ROkR2w=;
        b=IEufaIxHDABrM2EJJtpc0alg0ReRLx4rJ+DkpP5JWk0G4SnaJpCI8NCvXg8T6J5DIa
         g9GlWKmGCD4B1VeslA1T0D3K4LVvUlg9/ZwtazgyLVOdDeClRDQgMEnwS0/TP+Qiae2E
         DPfebd4AYbhr90LMoeyWfNj8LRerppK1D3xJFcHWi5Esxz/peadH5Gd2TOjNQVBlMhRP
         WKB9/ttkbkX1YguqMWxdl7Ly5Hj2Kmvx16JivtvEq7SLlTHgiTBpOJrjzBBOfUr/1CCl
         cy0aY6OLo3WcT3doJJ9jN+dzu1FGWsJkBuoKca5nRmz0HO6BmSjAyNU+Jyq+iP5qA7wN
         27lg==
X-Forwarded-Encrypted: i=1; AJvYcCUcvcNVbM0B1W0s6Nigeqxq2Y5nU7n310WQj27ZZAJaNjrKc/+nZvIvv/6KTAQBqKXUm95fputayOcMmdogqAmk@lists.infradead.org
X-Gm-Message-State: AOJu0YyJVbWGmugVdlqyZZKOQvOrpvu0o7OuDNGspVetg8ZZDSCvp0RO
	qwZtSMApz6C4zPF+uti5ZcLYqBYyjVt9AfPiNgkS8UQWCNtY7qVeUtC7a2zsPLw=
X-Gm-Gg: ASbGncvwtl/RlJL/96py4p4VRO657hiSeBYPSlNRQSB3IUHJe29LtKnEhUI2xQLvdf6
	AsCNQQhri/Cbyq7opDce6Es7y6oVl3Bd3bh3EGkVRTbrbUJwxEI4aF7qPF4UnhR8OCiX2HsP238
	yPbv12EbdtJYLTWV1ulaKOT503vcC77iMP9Wjj8Z8KvPzRnUfp2sFScP5SNDrgsjI8YKFJtHSbJ
	1oOgeeZI9SrOecxR/aEmIjicfHyvqqN6sQ5GeWSP9HLwotzwcMD3TNjqL0Poxm4HuyYR05hC+Sc
	ZNPfek+i7AzE208=
X-Google-Smtp-Source: AGHT+IEdCvop71IxVDmxbyI+VLG1bHMgUFJCX254kjusIKOtBxnkHakfEgU6KYI1lpBx+kU5iAXctw==
X-Received: by 2002:a17:902:ef48:b0:215:742e:5cff with SMTP id d9443c01a7336-216114e67eamr186694365ad.16.1733670458958;
        Sun, 08 Dec 2024 07:07:38 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([223.185.130.223])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-216412293d2sm10274515ad.237.2024.12.08.07.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 07:07:38 -0800 (PST)
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
Subject: [PATCH 3/4] irqchip/riscv-imsic: Set irq_set_affinity for IMSIC base
Date: Sun,  8 Dec 2024 20:37:10 +0530
Message-ID: <20241208150711.297624-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241208150711.297624-1-apatel@ventanamicro.com>
References: <20241208150711.297624-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_070740_226453_DD2E92F7 
X-CRM114-Status: GOOD (  14.78  )
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

Instead of using imsic_irq_set_affinity() for non-leaf MSI domains,
use imsic_irq_set_affinity() for the leaf IMSIC base domain and use
irq_chip_set_affinity_parent() for non-leaf MSI domains.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/irq-riscv-imsic-platform.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-imsic-platform.c b/drivers/irqchip/irq-riscv-imsic-platform.c
index 707c7ccb4d08..33a8261e6017 100644
--- a/drivers/irqchip/irq-riscv-imsic-platform.c
+++ b/drivers/irqchip/irq-riscv-imsic-platform.c
@@ -96,10 +96,9 @@ static int imsic_irq_set_affinity(struct irq_data *d, const struct cpumask *mask
 				  bool force)
 {
 	struct imsic_vector *old_vec, *new_vec;
-	struct irq_data *pd = d->parent_data;
 	struct imsic_vector tmp_vec;
 
-	old_vec = irq_data_get_irq_chip_data(pd);
+	old_vec = irq_data_get_irq_chip_data(d);
 	if (WARN_ON(!old_vec))
 		return -ENOENT;
 
@@ -139,17 +138,17 @@ static int imsic_irq_set_affinity(struct irq_data *d, const struct cpumask *mask
 		tmp_vec.local_id = new_vec->local_id;
 
 		/* Point device to the temporary vector */
-		imsic_msi_update_msg(d, &tmp_vec);
+		imsic_msi_update_msg(irq_get_irq_data(d->irq), &tmp_vec);
 	}
 
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
@@ -162,6 +161,9 @@ static struct irq_chip imsic_irq_base_chip = {
 	.name			= "IMSIC",
 	.irq_mask		= imsic_irq_mask,
 	.irq_unmask		= imsic_irq_unmask,
+#ifdef CONFIG_SMP
+	.irq_set_affinity	= imsic_irq_set_affinity,
+#endif
 	.irq_retrigger		= imsic_irq_retrigger,
 	.irq_compose_msi_msg	= imsic_irq_compose_msg,
 	.flags			= IRQCHIP_SKIP_SET_WAKE |
@@ -272,7 +274,7 @@ static bool imsic_init_dev_msi_info(struct device *dev,
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


