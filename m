Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EC10C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 18:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fDQ63XmeOhBW2hD0J5kGHPrC33sSQHadrxfLLtnklr0=; b=FgtBDtgN8uONOQ2lqmtkUErOmj
	LRWzejG5+mAsUt9IbKx9Sc3u56NW0H+/X+YDwu5Wt8eBRK/J/G/chdL2AvS0RiihmgJ0HI/yYSPUH
	0TjYrZRg6TyW60OAIHFVZFGvTECVdFFH68phiV6uhUB5fmk9Hlr8r37dbW2QyKL7yZVtJkATa8zIX
	V82wkZL0aMvON5qEsMWDfIfo+GTE6Dw6zNSdONVcltEos6BFwT9aF/R34X+ujFfn0LqK0LyPw+sHs
	I/IUUw5iovjCuO4ON/saaDK7/PY/AjRQeLjijNb8XRFZGSLzerXlvBZYKIoKU/mu/0IWSKNpPQ0Mf
	iov+EGMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u81U6-0000000F3KM-2mIp;
	Thu, 24 Apr 2025 18:39:42 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u81QW-0000000F2bR-0LSZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 18:36:01 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-309f3bf23b8so757123a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 11:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745519759; x=1746124559; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fDQ63XmeOhBW2hD0J5kGHPrC33sSQHadrxfLLtnklr0=;
        b=erYsBwV0BgEt/3INdTDxRCSdIIEvicsn53d7PJu+M2WLjG4kiXo0GE8RgF0wu3bjU5
         VSlugrRyncSWB61/dIZ4V9LJCGaqG5RcjHMaQpE9IcQjLe/+rA7M4cri6Mzn5K8ODalU
         nWTMTM8JUYGyaaqL35v3YaqRuMykNG9Uzcev6Wl1uxWAc45oqJkYcWO+FqHPgekMw+oS
         pZwXDs7cJi+veOvb1P2Lx6nG4rMDXrSU5T+8DZUPDHOwW4kuYnE5UPQGA4btfboXzk0N
         gctNRykIME/zLrmSvgoDlPq3ZdbCvUF2q/EaXHD6JQpaDPV0hx+BaBdvQ+LpxGlVBTbo
         dLiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745519759; x=1746124559;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fDQ63XmeOhBW2hD0J5kGHPrC33sSQHadrxfLLtnklr0=;
        b=WcyFW2kJr+nBknvs73fjxeo9a7p/VvqZeCOEtzvcZhA9vU3uLftVv8YlXm2BN75dPZ
         xr6eRB15/3hesmxJ+w2leOnBSpxUvczW/93E+4zdmqM0i/XxnJPEkMI0jgY1Pr+eMbrL
         5ZdZTzY+ZYwSK22irlJfan3GlXp3xSmSxKbD/1l0+7xWu783JnRDdURbuPQrGHQBxkLQ
         nLZn0V8PiMOtvquLM5ef3sqFp8l1BOU18GmxBV60bISA/kBGWhBO2ouNlPL/HF0K9txh
         hr/RXV7XiSmd2PX2rm26r4EeQaIVFVXmXMqiI1qZrkSdJIqOVLF45xEku5hPWOWGpbb1
         42TQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+hh+xbyHFddRqk3i6EbjC5E5Iz7IIJwO3B5iZPhoWoUQ6kvlHhWAXVgbIqlAec5v1HTNt6Zeu/fXB0s1gRzbp@lists.infradead.org
X-Gm-Message-State: AOJu0YwfB5gTAmu4n9DwRI/El2P5ucy0+7i3oW0vBip0kLO4aCvB2sG2
	0XkHFp49CpQEL43Zwqawmr28zmuhhceyFE+bvckE3Dgs7wE2fGgD
X-Gm-Gg: ASbGnctXn2K/A4vyRrwVy6LzGxiK+9bIMChvBjfMSYJGymTa0Bk+9/dHEfUt5rTZ9fa
	X9WNL2LgZBVt7bZxUT8er0XrMgXQQhyp7oghTWSWCFCY45Le3/7T5b7p9XqbkS5L+Ves+Ozq6Ki
	uahbFMOVg6HUr1CQy7eRXEL4nP2+p6iHes2n4VqN4lYrfsaY0i/eQuuxuXcPoMHnaltEXn8DxAt
	8yavXRZtAyAxvpkOJzAbOp3AZ3C6C2GRk0YexAmtvRIFaZ/t0QgwcDHWIeq6mhTD2RXTxCr0DCR
	shvAax+LJYSAdc58OCFclH5+5QfxKlHylZorZbVBJ8cDIYqEuwsu
X-Google-Smtp-Source: AGHT+IHqbGl3wWMgKMlmkpO3aAqia2AmQFa51dP1SBJA6i6zMBE2cj8gi6+YiNddbtygRemvXRa73Q==
X-Received: by 2002:a17:90a:d006:b0:2ff:5ed8:83d1 with SMTP id 98e67ed59e1d1-309f555444amr889337a91.19.1745519759038;
        Thu, 24 Apr 2025 11:35:59 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef0b9df8sm1744660a91.35.2025.04.24.11.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 11:35:57 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 24 Apr 2025 22:35:42 +0400
Subject: [PATCH 1/5] irqchip: vt8500: Split up ack/mask functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-vt8500-intc-updates-v1-1-4ab7397155b3@gmail.com>
References: <20250424-vt8500-intc-updates-v1-0-4ab7397155b3@gmail.com>
In-Reply-To: <20250424-vt8500-intc-updates-v1-0-4ab7397155b3@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745519768; l=2522;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=tSGH2p1izsSzRGjyaTk9F2yB01tgjf//IQcyliOLsVk=;
 b=j+S/3SxqUxx37jAiC0EshP0ayQNjwapgRbZyRm7sa+cleuMq8KQnMaIYOXEhj/xWPQ3KTGXJz
 oAig4ge8TpHDrfBhQtp3jRK2NDuBnwyAPWOKpax/mT0WqBUKfpoflGz
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_113600_124492_36FEBA14 
X-CRM114-Status: GOOD (  12.98  )
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

Original vt8500_irq_mask function really did the ack for edge
triggered interrupts and the mask for level triggered interrupts.
Edge triggered interrupts never really got masked as a result,
and there was unnecessary reading of the status register before
the ack even though it's write-one-to-clear.

Split it up into a proper standalone vt8500_irq_ack and an
unconditional vt8500_irq_mask.

No Fixes tag added, as it has survived this way for 15 years and
nobody complained, so apparently nothing really used edge triggered
interrupts anyway.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 drivers/irqchip/irq-vt8500.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/irqchip/irq-vt8500.c b/drivers/irqchip/irq-vt8500.c
index e17dd3a8c2d5a488fedfdea55de842177c314baa..d0580f6577c88ffd7e374d640418d1fc23db623e 100644
--- a/drivers/irqchip/irq-vt8500.c
+++ b/drivers/irqchip/irq-vt8500.c
@@ -67,25 +67,25 @@ struct vt8500_irq_data {
 static struct vt8500_irq_data intc[VT8500_INTC_MAX];
 static u32 active_cnt = 0;
 
-static void vt8500_irq_mask(struct irq_data *d)
+static void vt8500_irq_ack(struct irq_data *d)
 {
 	struct vt8500_irq_data *priv = d->domain->host_data;
 	void __iomem *base = priv->base;
 	void __iomem *stat_reg = base + VT8500_ICIS + (d->hwirq < 32 ? 0 : 4);
-	u8 edge, dctr;
-	u32 status;
-
-	edge = readb(base + VT8500_ICDC + d->hwirq) & VT8500_EDGE;
-	if (edge) {
-		status = readl(stat_reg);
-
-		status |= (1 << (d->hwirq & 0x1f));
-		writel(status, stat_reg);
-	} else {
-		dctr = readb(base + VT8500_ICDC + d->hwirq);
-		dctr &= ~VT8500_INT_ENABLE;
-		writeb(dctr, base + VT8500_ICDC + d->hwirq);
-	}
+	u32 status = (1 << (d->hwirq & 0x1f));
+
+	writel(status, stat_reg);
+}
+
+static void vt8500_irq_mask(struct irq_data *d)
+{
+	struct vt8500_irq_data *priv = d->domain->host_data;
+	void __iomem *base = priv->base;
+	u8 dctr;
+
+	dctr = readb(base + VT8500_ICDC + d->hwirq);
+	dctr &= ~VT8500_INT_ENABLE;
+	writeb(dctr, base + VT8500_ICDC + d->hwirq);
 }
 
 static void vt8500_irq_unmask(struct irq_data *d)
@@ -131,7 +131,7 @@ static int vt8500_irq_set_type(struct irq_data *d, unsigned int flow_type)
 
 static struct irq_chip vt8500_irq_chip = {
 	.name = "vt8500",
-	.irq_ack = vt8500_irq_mask,
+	.irq_ack = vt8500_irq_ack,
 	.irq_mask = vt8500_irq_mask,
 	.irq_unmask = vt8500_irq_unmask,
 	.irq_set_type = vt8500_irq_set_type,

-- 
2.49.0


