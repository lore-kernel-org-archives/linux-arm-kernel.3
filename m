Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB3D6C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 18:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V7d2y3ul5N0Mf7A+x8KbqIBRsyxegjHYdT7Sjr9I/BQ=; b=L4U2E428XGEdcZPe1/0R7Idr3P
	mve/YnjktsRrxYoMNAwxHUMmROQK41zUVFMQ3hm5yfUyo+VxmBbIBmg4dPautRYDBYHtbKfY+3DSc
	nu5rvTTOXoYU0kmUKyHuqG0TT6YZNRKxLZflJj0iJr/E6rz9xykwuvPweosVP4uTgXNPomL+2wtTQ
	pALRUvVy9xWhxFqnAqh2tIgNbNLPZ3n/MAmNAeYQ4bJkIsXdYF0d8yPjP38tLhf2fkPhFV2iWU9c3
	861pt/cMC0j159ZX9Q4BeopBJJGH16+mCqm6An73UySMkqdftqEptHhduy4GV9Gy8W8dpla5sTMii
	+65mNRtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u81bN-0000000F4VJ-2EeE;
	Thu, 24 Apr 2025 18:47:13 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u81Qr-0000000F2gV-37Od
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 18:36:22 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-b06e9bcc986so1060589a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 11:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745519781; x=1746124581; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V7d2y3ul5N0Mf7A+x8KbqIBRsyxegjHYdT7Sjr9I/BQ=;
        b=XKVUj1i017SPl6J3moL6SFArgLJ+lkVmc9jZROolP7qxOvFYXNZRskwbm3vktw6bsA
         ID/LbI03DsTwUKCbDGa17ofCc+Y6Y7O1acxqejg9kJyQ48zyfG7VuxSIZkr4pb1IrRSM
         u8Hk/b0EVtBoDupeFobjhP86CvaOC3aro7mJKZory5wT0BU3f1xRbgX1Bnx3lcmdKLjA
         RXPxm3RkVNru0TR8tfnUymK0kx0cOdMl8HgLHCriYZhFbq3ngSJ1UNhjPibSh/c8Vp/X
         Us00oL5fjg0SH6rzd+BGg7tkcxyUNhXxyC42R2F0adwTRFwFFOGlTkHn7OkH7jgOw+yi
         qkxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745519781; x=1746124581;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V7d2y3ul5N0Mf7A+x8KbqIBRsyxegjHYdT7Sjr9I/BQ=;
        b=SDN1+0iUlFTnKfEAfi0XpF8r4FzTobBxXSPsSisj0JZstgiC3At0R8AG1v4fiajpfM
         mM1gRHWSW4mATNtJehXX6zOQ3UWHq3R3Sd8N3qfwO2Hn/9FqUvnc2RJOcqHAPtVEd36H
         14/37wSTtIXWwT+P851bwwicCJl+gIv3XrMHOmjWpqFmIhv7JB2vSXJaO5AzN4Y9bDf5
         IE4GbiitltZBgBXzVN7hWWGAu5AS9lNCpczNQ3qhVNtd8GMpOuKSVSLAIQMSjmxKyki6
         uwl3YyMRSz01FrCj8QSblm1NtKmeuNZWuxBbzepxy/wRgpboSIooTp7U7MejuJsmBAYx
         ZpjA==
X-Forwarded-Encrypted: i=1; AJvYcCV7DSEN3FQWA/2xLqnwrSDOfflrI/z2rsQOZC5WNdaqzo/70CjJqPuHuyHVDZXNHKZ2GN8CbeKXlHbQj2gfmHvs@lists.infradead.org
X-Gm-Message-State: AOJu0Yxi40wmTz8V8HrnwEaYR7gsjRFgiA1LAiVqHreab45bhlrcS9mG
	8W6Ezke66ER6ZijAJgZPFLyKTvtxJ73who+/BUrkOoD/RrkpvFFH
X-Gm-Gg: ASbGncsUGCxzKKrs1vmcfU3kJqj3SJjAOvZN+oVit+QpMdNGLP/PbBcN6kDnzhxxtvK
	cUPGbHEit65iIljFNg+ew87ymE5EfNzfj/JrcAFfYCz2jM21k+UJjKwUbcgfi8f94CtF+qML0BM
	W+rGFg/isnAMgbJ85F+n5BNmDVUKRkkpYSzwlQxGiqxF3NmtIFYps/hxpvsZkLJJym2fUjckmV5
	mW9FueySpcEExaK9+uOU1TNeahrHuGCdmSbJa8lAJSS5FKOqWFnU2Qz89W6CRhlCcPF50QFY7ah
	MxU9SD6fRB2slH5ZwWKISzuSoKQ5J35m8YrKDOyMlsx6VSwU8JR4
X-Google-Smtp-Source: AGHT+IEvTVhxG/HEpoGdmUvZL3DCkshSAemk2nnUG/eNuUy+xBFFooJCg81CWaxVrYyBfyYOjuULjA==
X-Received: by 2002:a17:90b:5252:b0:305:2d27:7cb0 with SMTP id 98e67ed59e1d1-309f554f7b3mr796266a91.21.1745519780757;
        Thu, 24 Apr 2025 11:36:20 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef0b9df8sm1744660a91.35.2025.04.24.11.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 11:36:20 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 24 Apr 2025 22:35:46 +0400
Subject: [PATCH 5/5] irqchip: vt8500: Use fewer global variables and add
 error handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-vt8500-intc-updates-v1-5-4ab7397155b3@gmail.com>
References: <20250424-vt8500-intc-updates-v1-0-4ab7397155b3@gmail.com>
In-Reply-To: <20250424-vt8500-intc-updates-v1-0-4ab7397155b3@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745519768; l=3067;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=ZvhDtpu1XnYczmFh42T13jRZysqmiKlyJitHmezAOec=;
 b=bxYbJszU9Ih3oQcgQ22sUUyhzKZ5U10yKce/YCYZElGTjmrBbnI76TANVVuNwV0vHa5kjA9b1
 7cWE9X3r1hGBvTgGKCrfwBkIuYZXGepvyYgpJCikl4fZqwKysm70/vL
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_113621_784797_EDB29E5C 
X-CRM114-Status: GOOD (  18.39  )
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

Controller private data doesn't really need to be in a global
statically allocated array - kzalloc it per controller instead,
keeping only one pointer to the primary controller global.

While at that, also add proper error return statuses in the init
path and respective cleanup of resources on errors.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 drivers/irqchip/irq-vt8500.c | 49 +++++++++++++++++++++++---------------------
 1 file changed, 26 insertions(+), 23 deletions(-)

diff --git a/drivers/irqchip/irq-vt8500.c b/drivers/irqchip/irq-vt8500.c
index aea43c838430d2a541aa9b3127a215531abecad8..0bf478c6541ede30719eb1e403d9cafe6474643a 100644
--- a/drivers/irqchip/irq-vt8500.c
+++ b/drivers/irqchip/irq-vt8500.c
@@ -64,9 +64,6 @@ struct vt8500_irq_data {
 	struct irq_domain	*domain;	/* Domain for this controller */
 };
 
-/* Global variable for accessing io-mem addresses */
-static struct vt8500_irq_data intc[VT8500_INTC_MAX];
-static u32 active_cnt = 0;
 /* Primary interrupt controller data */
 static struct vt8500_irq_data *primary_intc;
 
@@ -203,50 +200,56 @@ static void vt8500_handle_irq_chained(struct irq_desc *desc)
 static int __init vt8500_irq_init(struct device_node *node,
 				  struct device_node *parent)
 {
-	int irq, i;
+	struct vt8500_irq_data *intc;
+	int irq, i, ret = 0;
 
-	if (active_cnt == VT8500_INTC_MAX) {
-		pr_err("%s: Interrupt controllers > VT8500_INTC_MAX\n",
-								__func__);
-		goto out;
-	}
-
-	intc[active_cnt].base = of_iomap(node, 0);
-	intc[active_cnt].domain = irq_domain_add_linear(node, 64,
-			&vt8500_irq_domain_ops,	&intc[active_cnt]);
+	intc = kzalloc(sizeof(*intc), GFP_KERNEL);
+	if (!intc)
+		return -ENOMEM;
 
-	if (!intc[active_cnt].base) {
+	intc->base = of_iomap(node, 0);
+	if (!intc->base) {
 		pr_err("%s: Unable to map IO memory\n", __func__);
-		goto out;
+		ret = -ENOMEM;
+		goto err_free;
 	}
 
-	if (!intc[active_cnt].domain) {
+	intc->domain = irq_domain_add_linear(node,
+					     64,
+					     &vt8500_irq_domain_ops,
+					     intc);
+	if (!intc->domain) {
 		pr_err("%s: Unable to add irq domain!\n", __func__);
-		goto out;
+		ret = -ENOMEM;
+		goto err_unmap;
 	}
 
-	vt8500_init_irq_hw(intc[active_cnt].base);
+	vt8500_init_irq_hw(intc->base);
 
 	pr_info("vt8500-irq: Added interrupt controller\n");
 
-	active_cnt++;
-
 	/* check if this is a chained controller */
 	if (of_irq_count(node) != 0) {
 		for (i = 0; i < of_irq_count(node); i++) {
 			irq = irq_of_parse_and_map(node, i);
 			irq_set_chained_handler_and_data(irq,
 				vt8500_handle_irq_chained,
-				&intc[active_cnt]);
+				intc);
 		}
 
 		pr_info("vt8500-irq: Enabled slave->parent interrupts\n");
 	} else {
-		primary_intc = &intc[active_cnt];
+		primary_intc = intc;
 		set_handle_irq(vt8500_handle_irq);
 	}
-out:
+
 	return 0;
+
+err_unmap:
+	iounmap(intc->base);
+err_free:
+	kfree(intc);
+	return ret;
 }
 
 IRQCHIP_DECLARE(vt8500_irq, "via,vt8500-intc", vt8500_irq_init);

-- 
2.49.0


