Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC8B1C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 16:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jo+MK/ePKofkxSXm+5enVAsUVT3cb/LUo2cfbFkW5So=; b=2HPiwNDSsWtAJ3Ez3Cl1rO2MI3
	MBfSdLOXGU2XBG/sSMqoP1+Iz1PIB6vovWfbkay8Mt4BtQscbww++T0gu9Nu4udFC3z9NzEDzR3Xn
	0mQuJakLLmYbkTSB1W3+J3i2+6ogIszilJEbUBRnnMX2YfcF1A2tq2cY2nPj5aMyFuXHPl1SGi00/
	xF3YjikL88mslAWAJ6vKidFNAhSN7yrXK49fNH5Xl8wnY6PFU8bw++n6tCMsFKRywW33bE32EGGnI
	nzNbHn5828JxuqfNQBxNrPEwPu7Gp8Qs8Dp6IM52LmYdf3Vqa4zq2sOVLUmpq9jg2ZcMRwMUxeNln
	Zomckhmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCKus-0000000CdUa-1e6l;
	Tue, 06 May 2025 16:13:10 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCHh4-0000000BxgW-23cS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 12:46:44 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-73712952e1cso5485178b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 05:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746535601; x=1747140401; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jo+MK/ePKofkxSXm+5enVAsUVT3cb/LUo2cfbFkW5So=;
        b=RWuz/k16E19kcPw25CZdfIe+y8n0V72OaxmQVQ4IOV6jZ/7a70TvgQCtxLnkDxOiqJ
         pcSgoV6WfIuJg0E1TxvYHnGkDcFJrHq15D+dBXZE2VsE/ZYogY4cJzYCvhp3NI64s8x1
         KxGu8EXojSJ+/r/GeQIh2jD1WSJrz4mBbmmgQiY3CJL3oly8+0Dg4fXpqkdkjCtF4ChH
         1v3UG6Nfr8Z9Uh7IsG4/YWXAKj4Q6cpdtLls02ZInx6G9Ds8vfhLZY/yTtEPxHhe7Dn2
         K0YLlNYJtZUzHkCSehCajMlsB9orODdwmtUbdIn+Io7fFCqbodmxasRzxiE9FHVkdoGu
         jSMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746535601; x=1747140401;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jo+MK/ePKofkxSXm+5enVAsUVT3cb/LUo2cfbFkW5So=;
        b=wVEvtHNoI0/bU7WHnd4/lUBQ3zTq0My0MZOzjqqjrQQseSWnETaJGgingDxP2AlGaE
         X/XnFpFbSibIMAd+VAk3Qaz/+aMmar8iUOkbWg/Gv+4oQePQFMRO3KybuhwMYavF/T9U
         Nr0z8y13l4sK8TErPVRDV2+3BYCh208TzR2jf7G2H4IDJi/gk6sTMs30ijQ82LfLK0J9
         lWoSKFqKYmRbKJ9DZFMHkS7FL7psr/Dhu3f268rdUcCyNEx2VJDRgYu3auLAixPox40U
         hBGXLslQLFMEMx6GxN9ZmwoOH86+qS3cjoLkeJWkuvEZd1ylYspbWVkPl6qbPaygSLXq
         zU+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVvzqlhfCo9XAcb0yhVrTcDkZI6HkGp7eCmJdfiH8qSjHy8kDEIyqyCJFyomvaWE1ve8g1lF73t0U6BH3jScSaj@lists.infradead.org
X-Gm-Message-State: AOJu0YwejR/UaCicWTufTwXxrk28J+R6PLcCq3CzQL7H0IiyJJaJx/Vy
	aOxW9BACMbVNs0Oc8IY8zwkEdgrTI+mAF5U1ql0r/Vu7JqZCG6r4
X-Gm-Gg: ASbGnct2JWXgiyD06LlD0U0YRzLo48Yr/xbwzK5BMbjYxeStbwfK/lXA9YK081Mrswc
	1wLZU4jvYkyjTOTPzGB/7bzQg8K3JW4WQpQi4FL3d7AojjrJGkNaGgq8j65xSANOZCpA4JkO6MU
	RyBnUw6UiGA6d97/PhzmCZ8pdE6xQ0Kn53YdEFBcj7rnkJs6hyu1QqBdS4k7zywKgL/oCIdIaHW
	/OFD2OVpeVmjNRtsd8OrCDayzJxTWEYZPSPsvtCFRR/1pzHCoEJHmxX1vb01O/hqyfTKnp8/UO+
	S/fZAcG9BEf08POEX3230RuEg/Ioqiamt62gzgtlOapPq1POkQay
X-Google-Smtp-Source: AGHT+IGowFY2MVMfbMWWSCYh2dopuWBl9OWrkFvlshF/0V06/C6EkV/6AUrpLqlxmj7eZ06nAxOmnA==
X-Received: by 2002:a05:6a00:369b:b0:740:3830:4119 with SMTP id d2e1a72fcca58-7406f177d74mr15436359b3a.18.1746535601545;
        Tue, 06 May 2025 05:46:41 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7405909cd89sm8756817b3a.169.2025.05.06.05.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 05:46:41 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Tue, 06 May 2025 16:46:15 +0400
Subject: [PATCH v2 2/5] irqchip/irq-vt8500: Drop redundant copy of the
 device node pointer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-vt8500-intc-updates-v2-2-a3a0606cf92d@gmail.com>
References: <20250506-vt8500-intc-updates-v2-0-a3a0606cf92d@gmail.com>
In-Reply-To: <20250506-vt8500-intc-updates-v2-0-a3a0606cf92d@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746535586; l=1647;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=5NC/31HeV/bFV7gPszc2SfNMbyljqfXDlZ++AHm2h2E=;
 b=lRrzoWPpBic995ZB7JmJ6Ikfz+jrP3eE9vsH/Q6Qh/pbqxKJe4IhEQmlHSrYNkspNch4vwfRJ
 ttjdF0YlCrnD5uvwEo+6nFtUAU/mjGobOQfWkrw2RxQBHyvpt1N8WhD
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_054642_530846_55F1A8C3 
X-CRM114-Status: GOOD (  15.11  )
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

Inside vt8500_irq_init, np is the same as node. Drop it.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 drivers/irqchip/irq-vt8500.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/irqchip/irq-vt8500.c b/drivers/irqchip/irq-vt8500.c
index d0580f6577c88ffd7e374d640418d1fc23db623e..6d46e1a0fda953d76679ad2318674fdf0a977f0b 100644
--- a/drivers/irqchip/irq-vt8500.c
+++ b/drivers/irqchip/irq-vt8500.c
@@ -191,7 +191,6 @@ static int __init vt8500_irq_init(struct device_node *node,
 				  struct device_node *parent)
 {
 	int irq, i;
-	struct device_node *np = node;
 
 	if (active_cnt == VT8500_INTC_MAX) {
 		pr_err("%s: Interrupt controllers > VT8500_INTC_MAX\n",
@@ -199,7 +198,7 @@ static int __init vt8500_irq_init(struct device_node *node,
 		goto out;
 	}
 
-	intc[active_cnt].base = of_iomap(np, 0);
+	intc[active_cnt].base = of_iomap(node, 0);
 	intc[active_cnt].domain = irq_domain_add_linear(node, 64,
 			&vt8500_irq_domain_ops,	&intc[active_cnt]);
 
@@ -222,16 +221,16 @@ static int __init vt8500_irq_init(struct device_node *node,
 	active_cnt++;
 
 	/* check if this is a slaved controller */
-	if (of_irq_count(np) != 0) {
+	if (of_irq_count(node) != 0) {
 		/* check that we have the correct number of interrupts */
-		if (of_irq_count(np) != 8) {
+		if (of_irq_count(node) != 8) {
 			pr_err("%s: Incorrect IRQ map for slaved controller\n",
 					__func__);
 			return -EINVAL;
 		}
 
 		for (i = 0; i < 8; i++) {
-			irq = irq_of_parse_and_map(np, i);
+			irq = irq_of_parse_and_map(node, i);
 			enable_irq(irq);
 		}
 

-- 
2.49.0


