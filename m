Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A506FC02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 17:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DvFsqgBHoepkWBjGC1yP+KOn/8qryanxa+3zb4U83Ao=; b=mjm+CmlhATM6Tp+FMz32W3wCTE
	eu7OINAms9Dz/FiJDi6QHE6OULOcoiniGyhcLMkDRAjj3uEgaxLMtt/OS7VHWSwuLmEdvDBV9WRRv
	0UAEa9W/2gF8ddPQOFT4TeP9rzddz7Djlo0OTCnxOcdbKtlCkFIZvJtWA0DOqOIk4Qp/G55Al6zKX
	Z+oTufL7mSjjC+T9gkUGFvrvlXW3MQTCzz3h9mLDcaJN/K2U/NTU0EaVri24g6pac7ISX+QvY0iP9
	vnwJOYajbg0/GXbIrbm3TDFVG3eSAaFwDsqbvqs/VH/uI7lbzrPSVR8HLxrEEOuYQKJb1Qgu2ET3b
	qH6iIttg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfj0V-000000043iW-3MhV;
	Wed, 05 Feb 2025 17:16:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfhow-00000003sqH-2NYz
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Feb 2025 16:00:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=DvFsqgBHoepkWBjGC1yP+KOn/8qryanxa+3zb4U83Ao=; b=GgEjLpY0OwT0bpWQJ+msw1DG6Y
	HXF+wSB/qJ9eMIrKKrs+GTDRRaAl2uWELIBWNHeIfGuqmQYe6B4XSgl2ZRl/tDATVnoux6NeQnyVW
	sHrhzFU+FhbISi9+TzD6S/NtiKT4Dwwed8h4kCBqjq4fA0YKTmvDSFQM/TURVAzpoEI+0gIjQ7n7l
	AHV/zZ1WRro0Me1X9XCEFv+vGkxbmTw3a7DYdQV7909atto44CkE8saR4T0kt7m/m1IQfCB15qr9A
	sUBIATpM01bzCqJGrCiQ2XYjIg6TVtye/VOtSwCivzgRmrBkk1LHQoZcgIwIZys1ixTye22Ws+SgD
	rolWuIBg==;
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfhot-0000000GgKn-2JnX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 16:00:09 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-21f200014f1so9654185ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Feb 2025 08:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738771205; x=1739376005; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DvFsqgBHoepkWBjGC1yP+KOn/8qryanxa+3zb4U83Ao=;
        b=RHAUBPB2DvScUihMQzh6RFEtnszQm1n25B5Ts/O4zEC+bJIjw/PG1cbgHieFBGztkp
         GkDdhWL/4xu4sG/n4chiE6/c9i26pXY1UPNn1RgZ4c2DOxg0gfKUm9CmV70hBWXonmvA
         rV3KhGOmpHmYQZZesz+EFcl9EbkMBOLb1HonKP5nldiyVBpUvJfi2ik7dtTFu+8vwqnO
         Cp2kT1Y2WUUF1nSlpc9S6foGJb43BRU3eT4aBnI0FZkGNIHnEb52xN4QenQnlkymqBwh
         NqsmQuo06/ztNctcEJ52ETPBxXFEoF2xH9OW1/zcz46hw82L4laQdWLlJVvMF6XmvMmI
         xqHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738771205; x=1739376005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DvFsqgBHoepkWBjGC1yP+KOn/8qryanxa+3zb4U83Ao=;
        b=gg+/aT7OjXaDmb/ZliKAsPRcm5DiUr6uJpKJ32Q27KKl7mBjfHWAyrMDuibIJ6ElQB
         F7N2a2PCLtIO6Wqt7ISEFmAChnSlD+LEOdNQs9HHtPzJdO5ADADvYB59cnQVgnqAHuLr
         dKB8fW8rOnE8XGC0S5PyppoF+spr1WtRfHxniqGCsb+YLYTF/0A7mi+srlZSHKhE+qOF
         m1DhnJkbWxuIleR6vSoUBDjIqm3qLS1WUZo2KCRTPXZnR2JFRhBodJBdO/4f9Xz7ZavH
         9OfMO7AvFwkdhvdF4UOGUrXO8l53AXywrWMenjaqG8jeo4XdYXFRWMc8Cx+M4g0OHp2r
         2GtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwkYLPB0TzALgwMsT5OcOec7TmIOienqZ9mTXstQlwqgjmobVM8CEMELm9dqXU52txDBt07d9BcSUb62lqiIYo@lists.infradead.org
X-Gm-Message-State: AOJu0Yyumx2mNNZcsY6OiwNGRQExfH9ACiaEjyX6np1mgXEYxP0RT2Gm
	0jTid+Yawx4+DZkf8+MLYXjSff0lwYF4QpnBvQNE5f7hQfdjAgjy0MYhIjOhH7A=
X-Gm-Gg: ASbGncuG4lvrjkAdhis1K/RqssUXtzn1QxxxJ4VmiRu7It55KWWAczgyWxYZlL8rG1v
	92YdV4Zkvk1630ywNaVk3nlRObzFLIo4HjQoJlysLiY2rxgbvAqrk9phQaZbLtwaWkmmn1fNbKU
	10xc7dH+y74Cq64yRGMZNYLmyufLobn10yz3Oott+uS5EtpyJiYbypm9JsUoCfWbVk9qRkNRqSr
	RQY5F3XM4aqLnmULGQPFMv1UVXUVNpNCSh92IqpBL2r7YbbhwKYHlpf7iJhjBnpWm+Qxdix0wUN
	BI8fYZrfPr0U9LZDl0ZoU7+vRCZ7sfgziUvpaPPrpYS0o/mQURR1wSM=
X-Google-Smtp-Source: AGHT+IFxrHkC5lry9v73hirVrwz0VwaueSl7vlCr1NVutMq+Q53roymPHtPchmK1sMCpMcVptQ1tdg==
X-Received: by 2002:a17:902:d28b:b0:216:410d:4c53 with SMTP id d9443c01a7336-21f17ebba71mr44908125ad.41.1738771204969;
        Wed, 05 Feb 2025 08:00:04 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21edddf883fsm99369015ad.4.2025.02.05.07.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 08:00:04 -0800 (PST)
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
Subject: [PATCH v4 01/11] irqchip/riscv-imsic: Set irq_set_affinity for IMSIC base
Date: Wed,  5 Feb 2025 21:29:37 +0530
Message-ID: <20250205155948.81385-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250205155948.81385-1-apatel@ventanamicro.com>
References: <20250205155948.81385-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_160007_818868_CBC15DB2 
X-CRM114-Status: GOOD (  14.25  )
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


