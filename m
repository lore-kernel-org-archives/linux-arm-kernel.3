Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD0CC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 18:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Scd2MmOA1DSZdiJ7FCQoAOF/Qr/pLl/Af07JEkoCX94=; b=R94NwWtfxP4mA51CVFus/UvshD
	ftC1s0taxyz1kxelgJX4210A6MxvOFc8qttWK82gBSB9697dqoHfHgoU4qUGk63r4XSr1Jl79aVDf
	919YnXwtOxGe5mk9fdqqBfq2cZyJHapPfUuNwgrsvPqXQXIBS2lXG6EKfgrUt0dlwnwELOzdOKzqH
	dDejwseZKeJ7wVvD8YTvM5sm10OFZPqYms4SN9qglOomqd2l2tujovGPUXUOnLiDg14Ajx+nHX3DG
	t/821nbV9fxJ61G/jgrreGLa/SDWnSKSBM0wkJA29Hajs4hoH2qlHdp2aoUJPP0yVsQ9pSQt9I244
	48kJrFJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u81ZY-0000000F4FM-3M0k;
	Thu, 24 Apr 2025 18:45:20 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u81Qm-0000000F2f2-2DQ2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 18:36:17 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-b13e0471a2dso1026241a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 11:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745519775; x=1746124575; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Scd2MmOA1DSZdiJ7FCQoAOF/Qr/pLl/Af07JEkoCX94=;
        b=HhXEDfrV4jP63ggYXBr971h/IL/Dc6S/WIVHgPHDlR/OCrQfJfoQ1LBE8Q18FH4WGI
         LR4hBHbCdXazs1yWruL4hmSP/4Dba3IZv058evCirY7La21PEiZoFSwgjY5PJxm5e8ng
         itA1brSkscEY6rCSmDHzDGVdpCad9VRPot3CCLPNYJOliAInYerCvINu1lyUeMN8wtRB
         EeDcTUV8NUHePhImOBCeRIEkFjsmaQ+BCryZSDDBbLKRUJiy+8Ue3Hms3Ia0IWPOrTB2
         Kqzsg4CoearcfBI5H13qEQcVBN2zqK+LhvAfbGLr51MmLmgqpAvjTUvuwlkGu2SfHXvz
         1hqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745519775; x=1746124575;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Scd2MmOA1DSZdiJ7FCQoAOF/Qr/pLl/Af07JEkoCX94=;
        b=DDcBfaL9IOdg9BnFk39M7pi45y6dZLobkN+6YYmXQM37Am3/KLSS9hNy7Cd9k9b7j+
         p/n62Ebl8huuvxqU2YzUQZZ/ZuTr1i4qdAbZl6/8L4XEeGo7yG69O1UXRqe/a2fGccsh
         osi9B+2QPb/HDRSFfDsViOEwJ1+RB4+1EODC2cXblj+qZGHzjOasDbbtng9DEVnxu8O8
         xyWfWiRF3sNrPoUXNjGLaOZOXZtX1EJ/JaOW77Awpv52EheXZ/Jeiviiz8sz7/V5LA/W
         n/SW7H0tvp5T051ayAiaZ/toG5pfa87/lkUmEmP1HtbrsunzudcfAxAIt7+qgqXU2KBO
         78iw==
X-Forwarded-Encrypted: i=1; AJvYcCVnuuIBp82rMKOvsBSonYnwfYtsj6j88Z+h5Y+m3YsFaNUjFdJ3gsO19A9N0MXOIAdNYr+pzs15PZ7CnYE/X+bF@lists.infradead.org
X-Gm-Message-State: AOJu0YwgopmbTrBw3Y97DrRy5pk1EklzWMekNm4oKPLZqzIj/xme4FD5
	Gv827pXlVaPSRhqvRT1F2NHfsM8lMxOWNKKLb+2ZCHQLqbObCpu4
X-Gm-Gg: ASbGnctGvcFFYsOJRBn6bZjQ8TEMCc30S1/E+PLzmBCzcUBKfwMmtPWhqF8TwT2Wxym
	RABjFaKa8BEZohksdZbQsuupwprRCmo+iH8FlRT85GfPC5r3YrhAsljZjshZzTTex8Xu3gR0kVF
	zLflljvfJOtS2oEK/LKXHQA4NOa3mzzveYB453oY8SiUj3ehbpQT/H1DITd6MIFecQ04+Z7+E99
	LxYWSQ4aNouA5z6s/7ZqGr8WTT0E5RLSPVoSiNYHP76ZQvrgT/5XArhJ8zaz2Ls0pxoLaHg/5oA
	vrQlxuZOBvA1IDtAGlY51jCzetJOq1zcU8xgKZw8U13Dl6vXUqmA
X-Google-Smtp-Source: AGHT+IEEDtoVXgeW00/znJ03dj8QOc2rEKTzqVN9hbM25x/CWolg0jP+EcqxTj1n7m0VR4tpCdRWBQ==
X-Received: by 2002:a17:90a:bf06:b0:2f9:d9fe:e72e with SMTP id 98e67ed59e1d1-309f554b8b4mr905191a91.16.1745519775450;
        Thu, 24 Apr 2025 11:36:15 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef0b9df8sm1744660a91.35.2025.04.24.11.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 11:36:14 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 24 Apr 2025 22:35:45 +0400
Subject: [PATCH 4/5] irqchip: vt8500: Use a dedicated chained handler
 function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-vt8500-intc-updates-v1-4-4ab7397155b3@gmail.com>
References: <20250424-vt8500-intc-updates-v1-0-4ab7397155b3@gmail.com>
In-Reply-To: <20250424-vt8500-intc-updates-v1-0-4ab7397155b3@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745519768; l=3948;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=GOA+u85tduWxVv4ECfMp+FDaLJ7imscZ/xPP/oEH2eQ=;
 b=c1oXrgxD03TnBoaePI33Tc1myEsrAfQwBvAQZvufdR8bybKZOnqTxGMc2cJhH1vZdUthW0kAq
 soR6657v3wxCQQZxRDW1WBKZ5292wsw3YCeJheMinobjUNqT1K29lNy
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_113616_569428_FE9875F3 
X-CRM114-Status: GOOD (  20.00  )
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


