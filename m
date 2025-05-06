Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2400C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 16:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Scd2MmOA1DSZdiJ7FCQoAOF/Qr/pLl/Af07JEkoCX94=; b=dhJ+SRbFO6KGXgQu/YdbKSGK94
	KfxluTrOLZrpwjgCXuPgwyT8ZPzzdEHBnmfDbAz2DzfV99DtUtls05dh1XKQAwi0/7F6S7Kfw+azc
	vuUCSeYaM2ttRM0Vs0emBeeqidQjDQjuZZtOJVL0ENhSj5DldT01x3KgTyRWPG+FusaFAU9tCI9SY
	2eAbavquSw7dn7g0VH0F+pfp13iYv2gZ7UxnmS8/BipoYavrrnqB9bEnETrV3vlOw5+zb6iRfuAko
	ynBGa3Eg2dbNJqVp6ojxx6TuAegiMa6yRbCqH7Jtj3GjN9gMcbFyOkOVfa+h2G9bE1ZAz/59qIj8m
	Vp0ksczQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCKyh-0000000Ce2G-3myA;
	Tue, 06 May 2025 16:17:07 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCHhE-0000000Bxkj-1ryy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 12:46:53 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-739be717eddso4473754b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 05:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746535611; x=1747140411; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Scd2MmOA1DSZdiJ7FCQoAOF/Qr/pLl/Af07JEkoCX94=;
        b=IgRGdM+BrQUtfzfTIHmVbLPeLq+hnq46rJ5Tu98h+lfC77W9fCsPWUCfpj6JBYkYHw
         MYRwjTgciHuwJwPfhCw845ZeENnJuPMRxmRNBmgcdueeenj0sbXXOYLVdlbcw9cKQXcU
         5OQeBeerZr/Qfl/BAftasaIEZn28MSqeCQZfqF1+AZlKDkmEsjBNF9+VpNTwIAmKguKj
         ZjDgStBRGTcVECn7ZtGEHrWQQeTc+YsBUJKNcTdZne69WY0q2tk5xF/cdd0RMOSRYAHH
         dZfeZ+qgjdCgOLI/iAbMG/vyoiUgT4J2dUZOU0YiRbY8o3cWkVutuwEpOza1U1cwngrE
         Wxgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746535611; x=1747140411;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Scd2MmOA1DSZdiJ7FCQoAOF/Qr/pLl/Af07JEkoCX94=;
        b=ija58vXYV5GppxnDDQZnPbg4kA9NwHo0sNfoSXvb/55rvZpmIojZnOo7iHxx1K6p1i
         YU2SLD/1EvnXcnAVPODZ9TlnBr7gbzfAqE0EcQUfbEvp6t44Dw+hhxtLzAE5snEIodAW
         epAoHiAyK5jBOFXF2XRZyz77rwwJfPtFNPhUxIxfFEamWXCmZmYfGr+jZQXu80ePiQpQ
         vczcOlXQYAO9PrfdMs6uCQ6yVa3qBv4TC/bD36Dmeu9wx37wMrKRM6m9la/8b7FfBl0/
         WFCxxu84JH9AtNIhd2JK+7PyMyw4lwokpl/P4c3LSUXhD6sFKQJr+frVA3zVaCx4RQ8f
         Yccg==
X-Forwarded-Encrypted: i=1; AJvYcCUgOkUUQv9flJXJCYjbBYxRA3CvY/bNc1JW00PoRkfrclmRGpawhenDwsWesFYQ3m6nEhdhsLKHMQ743eHT3PbH@lists.infradead.org
X-Gm-Message-State: AOJu0YyRuW2UaNMB9nFKDSsPSw9VSIIq3sjhibRyLs/tEwryPr4qtnKQ
	G+smyZXwJEvuP3aLEwuq1/d3EC+DWnkqGSxuX5n5qd4tLe/nleYD
X-Gm-Gg: ASbGncu6nBrxKSM5y2U3xoPLovOUaYy4WigrHimV8dAkxkrgXdVLvKzb1QwP9/g+kYn
	t41YXHyKk9sDsrtyhqvRvcqjcNWWfDyTgKNJg9UsUMZ4JlXI/wGPEIZo/CsCysIjs8fCQrBAOgQ
	sjayGnI+B97bggyAAQYJfM0E09z1U62hkYDlmKUo7GfXfLO/ae9yDTAV4ExOf3qgy6sMb33Ryc8
	v2soqyJkWL+AT6WfNhdIBxYMIKaWlZ6RKPUBe1AYHY8kTdYeDxN1D5HCe12T3RHs3z4L2E8jDFE
	tFZGUfk0oNih6WPlv+DIAFnp+p+P6gWNEaUqcomNMwd0UjAm0IRb
X-Google-Smtp-Source: AGHT+IGt0OfmjZdbzWABnMzYK9s5aOTopCPcBf44B3mse0L30V1n9a6FbyIPkSvKOjCg75pe9VtBXg==
X-Received: by 2002:a05:6a00:340f:b0:73d:ff02:8d83 with SMTP id d2e1a72fcca58-74091a0447bmr4126556b3a.3.1746535611537;
        Tue, 06 May 2025 05:46:51 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7405909cd89sm8756817b3a.169.2025.05.06.05.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 05:46:51 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Tue, 06 May 2025 16:46:17 +0400
Subject: [PATCH v2 4/5] irqchip/irq-vt8500: Use a dedicated chained handler
 function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-vt8500-intc-updates-v2-4-a3a0606cf92d@gmail.com>
References: <20250506-vt8500-intc-updates-v2-0-a3a0606cf92d@gmail.com>
In-Reply-To: <20250506-vt8500-intc-updates-v2-0-a3a0606cf92d@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746535586; l=3948;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=GOA+u85tduWxVv4ECfMp+FDaLJ7imscZ/xPP/oEH2eQ=;
 b=O6fqrOR24uJ9xju6Sd7nqpOfeF5O89fby817sqf0xcnOuX6HnJocQbCrgP0eX/5PZm+seJkdy
 GhWNgcnZlmLBx6RlQpxxyT9wt0xS5LljcdDtydrN0geSCSk1SmBdHt+
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_054652_489836_DF9EA501 
X-CRM114-Status: GOOD (  20.73  )
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

Current code for the chained interrupt controller maps its interrupts
on the parent but doesn't register a separate chained handler, instead
needlessly calling enable_irq on an unactivated parent interrupt, causing
a boot time WARN_ON from the common code.

The common handler meanwhile loops through all registered interrupt
controllers in an arbitrary order and tries to handle active interrupts
in each of them, which is fragile.

Use common infrastructure for handling chained interrupts instead.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 drivers/irqchip/irq-vt8500.c | 60 ++++++++++++++++++++++++++++----------------
 1 file changed, 38 insertions(+), 22 deletions(-)

diff --git a/drivers/irqchip/irq-vt8500.c b/drivers/irqchip/irq-vt8500.c
index cf24a88f52d1b90f033d429288c88398439b92d1..aea43c838430d2a541aa9b3127a215531abecad8 100644
--- a/drivers/irqchip/irq-vt8500.c
+++ b/drivers/irqchip/irq-vt8500.c
@@ -15,6 +15,7 @@
 #include <linux/io.h>
 #include <linux/irq.h>
 #include <linux/irqchip.h>
+#include <linux/irqchip/chained_irq.h>
 #include <linux/irqdomain.h>
 #include <linux/interrupt.h>
 #include <linux/bitops.h>
@@ -66,6 +67,8 @@ struct vt8500_irq_data {
 /* Global variable for accessing io-mem addresses */
 static struct vt8500_irq_data intc[VT8500_INTC_MAX];
 static u32 active_cnt = 0;
+/* Primary interrupt controller data */
+static struct vt8500_irq_data *primary_intc;
 
 static void vt8500_irq_ack(struct irq_data *d)
 {
@@ -163,28 +166,38 @@ static const struct irq_domain_ops vt8500_irq_domain_ops = {
 	.xlate = irq_domain_xlate_onecell,
 };
 
+static inline void vt8500_handle_irq_common(struct vt8500_irq_data *intc)
+{
+	unsigned long irqnr = readl_relaxed(intc->base) & 0x3F;
+	unsigned long stat;
+
+	/*
+	 * Highest Priority register default = 63, so check that this
+	 * is a real interrupt by checking the status register
+	 */
+	if (irqnr == 63) {
+		stat = readl_relaxed(intc->base + VT8500_ICIS + 4);
+		if (!(stat & BIT(31)))
+			return;
+	}
+
+	generic_handle_domain_irq(intc->domain, irqnr);
+}
+
 static void __exception_irq_entry vt8500_handle_irq(struct pt_regs *regs)
 {
-	u32 stat, i;
-	int irqnr;
-	void __iomem *base;
-
-	/* Loop through each active controller */
-	for (i=0; i<active_cnt; i++) {
-		base = intc[i].base;
-		irqnr = readl_relaxed(base) & 0x3F;
-		/*
-		  Highest Priority register default = 63, so check that this
-		  is a real interrupt by checking the status register
-		*/
-		if (irqnr == 63) {
-			stat = readl_relaxed(base + VT8500_ICIS + 4);
-			if (!(stat & BIT(31)))
-				continue;
-		}
+	vt8500_handle_irq_common(primary_intc);
+}
 
-		generic_handle_domain_irq(intc[i].domain, irqnr);
-	}
+static void vt8500_handle_irq_chained(struct irq_desc *desc)
+{
+	struct irq_domain *d = irq_desc_get_handler_data(desc);
+	struct irq_chip *chip = irq_desc_get_chip(desc);
+	struct vt8500_irq_data *intc = d->host_data;
+
+	chained_irq_enter(chip, desc);
+	vt8500_handle_irq_common(intc);
+	chained_irq_exit(chip, desc);
 }
 
 static int __init vt8500_irq_init(struct device_node *node,
@@ -212,8 +225,6 @@ static int __init vt8500_irq_init(struct device_node *node,
 		goto out;
 	}
 
-	set_handle_irq(vt8500_handle_irq);
-
 	vt8500_init_irq_hw(intc[active_cnt].base);
 
 	pr_info("vt8500-irq: Added interrupt controller\n");
@@ -224,10 +235,15 @@ static int __init vt8500_irq_init(struct device_node *node,
 	if (of_irq_count(node) != 0) {
 		for (i = 0; i < of_irq_count(node); i++) {
 			irq = irq_of_parse_and_map(node, i);
-			enable_irq(irq);
+			irq_set_chained_handler_and_data(irq,
+				vt8500_handle_irq_chained,
+				&intc[active_cnt]);
 		}
 
 		pr_info("vt8500-irq: Enabled slave->parent interrupts\n");
+	} else {
+		primary_intc = &intc[active_cnt];
+		set_handle_irq(vt8500_handle_irq);
 	}
 out:
 	return 0;

-- 
2.49.0


