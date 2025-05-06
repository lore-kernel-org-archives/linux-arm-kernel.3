Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 502BBC3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 16:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fDQ63XmeOhBW2hD0J5kGHPrC33sSQHadrxfLLtnklr0=; b=klb2fdMHuKthKjhBGOkxNqZjQM
	Xo+M5jnBpLBmmoNEmOsE3sEyuA+Gar5tYoWPNpPYiTDuP7xdwlCar+5oSLCREVj1PLk2gVBz/j3eC
	1RacTvuijPDRIC92bhmsLtuPZLfpEchWF6oSK8NMbo6Smi+mRPIG6/XNQ0Wy3ZNmqmsv+0vUr95zk
	14af7KYncXKM2NAOsJBQcSpSZA+Z0KUAG3grWDGUcaxy8++rwiEmRq5w2kzW+fdu+8IZO7P2E+u0m
	ItEUDTtS9R/A0SNWkQRHsBnQn/SZxzzNPWBBXh53iKuGpnNgzNY2AH1w/v/pT0qpJi/Y9vc4lvxAn
	GJjTLqtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCKsy-0000000CdDS-33sB;
	Tue, 06 May 2025 16:11:12 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCHgz-0000000BxfT-1lj2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 12:46:38 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-736c3e7b390so6361672b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 05:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746535596; x=1747140396; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fDQ63XmeOhBW2hD0J5kGHPrC33sSQHadrxfLLtnklr0=;
        b=naDrzV6FFAdW4tjj27dOJUdNSG1fv3FIQ7C6b9iCk+DTANW+nQRe07DCzcLRuop2Ur
         vK0KLc88iDyTFo/Zkh4D04hzKJT3pi3DHMSICpHiA65hzV+elhin5JfMFYnjtzr1THdZ
         euqpeJfQ6DIQnLjripNQ7KVaFojSfJdIoMO9cYIwO2FHmT2hI8ITFhyLLpASwbJab4Tr
         lmVuSCM/YFj7jeajogXQHKZKHHvnxaVxVvAuMdLXmXBN6qJluwe4nwyFNgQWsz2vFXR3
         tfT/RVAmVkeWXu9p9REjZskzOEM8oI/3XXgTp8kZXCt++qygAAGV65WUlkpeVLVxGteQ
         H1kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746535596; x=1747140396;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fDQ63XmeOhBW2hD0J5kGHPrC33sSQHadrxfLLtnklr0=;
        b=aalo94k2k+6VreEupsvuze9A7svg5ADl3dwUwZnQYwmSEn1p6Rndluw39SnEXqszbe
         YnXMWayxs1v3HZm0dsducYBsWXBlC/BV+hklxnWFUUWLIB59dr/izET8Yi2WVuMFKHdg
         7Eg0EZ3HitigdDZLthpMI/QVuSh0YYYUv7P+FZzfOcNLKwXjhD+pHPpAODpsXpztsRtR
         Uj2I1Il/M2rbviaXbzLIjJBczrOW1+jpFW8xP9A/42aq4S0A9aMJ7VGfgJRoP6HGbkPO
         K8FqLgyDkB/o7F3UBpHOEA7b4iunfUYb3LoU9VH5JnW/rmO9fO7J/SxbQ/Eaj+x0GG7y
         lr6A==
X-Forwarded-Encrypted: i=1; AJvYcCWvmlS53zvuk9jFf/M6RYj4bwyUhW8KERhSpqBoJXUAGtLQk9zuizsq8h+FYUioawfY+A4ns+J9WST+tHZqTXcp@lists.infradead.org
X-Gm-Message-State: AOJu0YyIxNifMTSptod8x8b016khTuF6XF15d+QhpUpTakpdbwW+Jvnk
	G7yLagb2Vw8NC6gqbkFEcjyumcl3dUZ+Rqqa0AzCuu1/gIzj8H7Y
X-Gm-Gg: ASbGnctdRnjxLsMZBskWGKPIcP6wimHKb8Hcf2TJyy7X0ut6ujYkpht1g8wykWCZZBj
	ofbGCIWGB6ps/ysCv73LAC/hSDm0NVh8o9O2GQIstD9y8BEU4wAJF1a+KOtXIcpG/IW0QMTKjkn
	J1Vzg3ocl8Ct5fPShHUrH0wwjLdtWwo8FkSQ/8w0RjCF75K//ST48rMp5ciKVblW/MogmtNojCZ
	VJosDfCwG4gph7LRRwY0jfo/LMurLY5CF2C7FvwRXQ1RZ9bYbQsAIHzHDLjyZTuK1QUfCnvoVOq
	LpGTmMGTp6mYZET3CJdZdb23DzsteDQlbMqrkRjTFwpG2ohtItSL
X-Google-Smtp-Source: AGHT+IH17mxLxSA2PPD32ssm2/FIfNgX6IYtN/NMQKdYqAS/9zwe1/azeH9miKCZC0U7mivk5kWCBg==
X-Received: by 2002:a05:6a00:4090:b0:73f:f623:55f8 with SMTP id d2e1a72fcca58-7406f08b86cmr14867749b3a.5.1746535596522;
        Tue, 06 May 2025 05:46:36 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7405909cd89sm8756817b3a.169.2025.05.06.05.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 05:46:36 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Tue, 06 May 2025 16:46:14 +0400
Subject: [PATCH v2 1/5] irqchip/irq-vt8500: Split up ack/mask functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-vt8500-intc-updates-v2-1-a3a0606cf92d@gmail.com>
References: <20250506-vt8500-intc-updates-v2-0-a3a0606cf92d@gmail.com>
In-Reply-To: <20250506-vt8500-intc-updates-v2-0-a3a0606cf92d@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746535586; l=2522;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=tSGH2p1izsSzRGjyaTk9F2yB01tgjf//IQcyliOLsVk=;
 b=zVTy0eAGf0nk6m25bKp+JZivOS1zpVtPTNs2BF9o/WLAqfw+yjEJaO9aqqF27dhamda08FM6t
 Ltl37TGFCdGBhdQJeaN2ER//sDC67QV5qkPi8RmmBuK7+Um6FH4JdV+
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_054637_463941_40C839AD 
X-CRM114-Status: GOOD (  13.80  )
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


