Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 123ADE7716A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Dec 2024 17:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+XpbAvyCPU7XjesnTrNMuPwq8s0Ofi62LAN8USKi2As=; b=MKGgBi1gjCRfTfnZnKSj90ChGj
	KnktSJo7LOdGbtneBVsM65IAdAm3Ly1QtGCxt1dTT74p8mTajXgSXkcZO9OZUDTITXgovop2kFsvP
	dgGKSKBCW77wG/eKSpLZCog8W2/begZFUs+sxu0eiFDeFoofhbbEim3/NBmuHcN1we56uIOfP5lDe
	H3jzluewsjTR6TOofDkV8UOOMlbpirOzluVI+JEx+Zr2BjAVXi0QlH4nM2+pVG8GAmJKId6qofdSG
	+/jDyiypqK7l3vI26yMKy5v5LX/RfdVhNPbmkUz4gpvj4ef6OJScjOequxrMx2cnvEs1Z2XRBEaFA
	xmb7fVig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMVyO-00000006hNM-15ot;
	Sat, 14 Dec 2024 17:30:36 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMVuM-00000006gN5-0jts
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Dec 2024 17:26:27 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2ee709715d9so1866989a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Dec 2024 09:26:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1734197185; x=1734801985; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+XpbAvyCPU7XjesnTrNMuPwq8s0Ofi62LAN8USKi2As=;
        b=WtX4Rx2xWe6RHZLgpwXWTuL/DQBRJ8G3YiGMfJ3LNbTpqTtc2/66lSGYpGm9/83Jlc
         ij3nDZGtNjYi0+zrz6o1Ig9Awk1kKuH/yGqCufOoGJ/wbbUbycYMxTkAw/JMgSzfqU7k
         YzX/+spltkD7tkCe6x92GKCQqXa23STMffqdOyrrviGWXqBRr2jV56QcoxEiyqUA4jRw
         Vb8wJ/ZXWRPH3Y6bWc1TuNpczmjJHHDQK01792A+dzUz7dgohIVQt+nscOCg3iNw0W9h
         FJL9V9WPl1Ig2jhEzMbnX7pqvoPJRDBuzdPT4j7Q3WwRT+mX1ae71BoolI6O4wHxPE9f
         qq8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734197185; x=1734801985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+XpbAvyCPU7XjesnTrNMuPwq8s0Ofi62LAN8USKi2As=;
        b=Q5bVo66uzsmeRL9yThNkw3qx/B/935qRiTgdvyVxGZg/ey129Yhrc/VEWGOxgzSdvI
         QK8MtpypcTrQZ+WNqSD2+Nw4nocFIymuJQsdMDjHiMOp/itqNc4XJE9OIHBNwIJCR/9c
         nd1yv6tLqLyfbNb8NklysmHvfJbOTlRdanBvESztNSV3Pmobg2EOpfUKX40VhOwqz6ul
         rtooLqOH1g6HAncANND15zVDz8RUPTQqsKK0R9PFdAy7QVrWlJitacRU4T9voTjuhfwN
         97JeLRBlCIvcT4vnRD1M4vIS5PalhR2aJKxQVVwLh090OJuT3aNN0yCaC2OZLdfUuMAA
         jKaw==
X-Forwarded-Encrypted: i=1; AJvYcCVVRVLXtyOBIlaJxo7elXliI/9XWUesQTvc4q7bNYHTEpvFrvAZKSz2CImHt1smFtCpTRYwRkj1vDSHtNmTnDwY@lists.infradead.org
X-Gm-Message-State: AOJu0YxRxZTBf6xBZmBL5EFna5SAtM51oGEwz5aDHxskNgw2iMIwiHIa
	f9HpA+UDqRbIy/jgmoU2XKxHVJdPigg6uJIxncaCmCv/8Sv2B1J/2rJnkQDQ38w=
X-Gm-Gg: ASbGnctv19Qphu9BS9PcW0gLDXJNjMkmGS/FHiOy52HP8oRKeBCWAHXGnDCkFNvqauN
	Va11Fhmw+s7PM+5yCwqz49JpplZf9kpo6CUshYlOFviGSaWoLIX1VOtSsOHt/UEsD6Hpw0fDZAc
	xDnJG5Gs7hHhRdzxQZBPcpzlVSR5w20G7dPxv8l2/5fcL3/SKPDJFTrZdb6nD6ugFIMHr0nguf9
	AFpMVZmJT3at76ehDA98FqeKEtwAyx2Sly/8KyFCnbNnB+VWySmt/i6iGYCk904sxc4IOtZ24mD
	Jw83za2MKpqOtVo=
X-Google-Smtp-Source: AGHT+IE1SPKm+gzJ6VGXDJy+q7RKdAC9iquVy8ivXNUGMyZxEqe5AtUA6j7vJ+xaqDvjxeC/PzggwA==
X-Received: by 2002:a17:90b:3c02:b0:2ee:5958:86d with SMTP id 98e67ed59e1d1-2f28fb6764amr10436246a91.9.1734197185565;
        Sat, 14 Dec 2024 09:26:25 -0800 (PST)
Received: from localhost.localdomain ([223.185.132.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f142f9e186sm5049811a91.41.2024.12.14.09.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 09:26:25 -0800 (PST)
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
Subject: [PATCH v2 03/11] irqchip/riscv-imsic: Set irq_set_affinity for IMSIC base
Date: Sat, 14 Dec 2024 22:55:41 +0530
Message-ID: <20241214172549.8842-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241214172549.8842-1-apatel@ventanamicro.com>
References: <20241214172549.8842-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241214_092626_219307_7F7D5648 
X-CRM114-Status: GOOD (  15.18  )
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

Instead of using imsic_irq_set_affinity() for leaf MSI domains,
use imsic_irq_set_affinity() for the non-leaf IMSIC base domain
and use irq_chip_set_affinity_parent() for leaf MSI domains.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/irq-riscv-imsic-platform.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-imsic-platform.c b/drivers/irqchip/irq-riscv-imsic-platform.c
index b44eb0b3990b..dc6f63f657e4 100644
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


