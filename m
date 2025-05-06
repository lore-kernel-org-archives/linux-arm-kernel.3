Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71CF9C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 16:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V7d2y3ul5N0Mf7A+x8KbqIBRsyxegjHYdT7Sjr9I/BQ=; b=OJ7O9A1r7oznpvYxdN+Lrw9ZpF
	qzuA7Wy1Vf2U0jfvTuO5YEUsTn5VbCYkwHk4oa+feYsQv81Iwk82tQmixN3Jp3tU9gvYtVBqOQ88S
	XDVK2Txpd51vO52CHAjqj7iwBkkbcS+L6n3GTeIY8Z/a30Ucj6axcZZ34HPnVYomAzEh3FKyAH3lU
	2y/vgwqqGQMynRSkl7rI+6M8rh9AtHqtUgECjOQ/Kb3H0xXyZTeqWCXVGBDEXIqoha2xXSAHUJ2f4
	pxG7LAe5dszRzqBe69p5EDNIzQhUB9JrDqJmgApt/50VpKV8/inxQ7LAOJuc7EBs5XYMHz+eB5Zpz
	QXbT95Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCL0b-0000000CeG5-2hUC;
	Tue, 06 May 2025 16:19:05 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCHhJ-0000000BxmI-0vPh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 12:46:58 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-74068f95d9fso2638062b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 05:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746535617; x=1747140417; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V7d2y3ul5N0Mf7A+x8KbqIBRsyxegjHYdT7Sjr9I/BQ=;
        b=YzpjlVN06CXgGltlg3hAuPPS2sc7bNVMnVsfmtkb2Z+tlsvkrROJPYzZqKDgNAFPFh
         xl+Oz/o5RMlU7jHMOO4FxBCQKrlzgfh0SLN7fwkb6dBLO9hrYoiejeP2HOlrSgjr0rf4
         nJsNEQarh1OQRpgZ7qqbzlAkIR2n6TPkL/n59//fWZARkFsZauApzHtxIyr3/70utVNt
         s00PHYi+AHLcP8qRG4yz4Ufq2AXKnR4Bx8J8Lu4w4ygOEsRNVYT7aLLF59fQVCW8EtY9
         LzmriL2u+BVF9JPH1Ivu/VBBJ8aftATQGtilrYkfnMjwqtUnNXR/JYfSRyq6d1mV/Yfs
         tn1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746535617; x=1747140417;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V7d2y3ul5N0Mf7A+x8KbqIBRsyxegjHYdT7Sjr9I/BQ=;
        b=aKnq5cHxF1WmgP8gMUMtecF9TVubObYdCp1Mw5FbuegIOB3n3tuT9qv3PTx8ceVnDl
         oJibO3dGYEuXgSlhzPVzX6lGBjhsYJthz4FPpP8/Riut6GLqqBHyljq0OPJLYhsFjidm
         63/Ps4cNfx/u75Xp+kyFqS1Ph5uGBosG5bLVCwE6+c1TKM8bbOVRKi/BWRffuL3uG74h
         e27ccP7Fb51srq4UtHHxgP4MvdndkANPckj2dH30Q8Wjlk87Djc2t2n6BOPv0dl/JHfl
         tGfn9wsjpYbvksBWwSsjpH+jausGz6TyXV5tlFXTEcq9ByAIWtFWzN/BcVDW9ZEFCOql
         kqYA==
X-Forwarded-Encrypted: i=1; AJvYcCUznBxadqXNYo4jycHK4Q7EMtPE0DuePD1c2zrj64r69XLQBlXvhdlPCj0xOhYKBduSzBLx8EcJlvSkp0APcveN@lists.infradead.org
X-Gm-Message-State: AOJu0YyzMsShif1YzVhHKjZdqV6GTg1l+5gNdqDMIPmod6ebsPVBK8Vw
	mEn82tpnjNX5Dy+T+FtSxDuqmKH2R32lbrUX4NYHqkN0nxG/v+tL
X-Gm-Gg: ASbGncuMYIJtS15TCV9Ijg3ulogOzmH0UE2Uuf2oJ7LISbN+MeGYjHdUPxrcyI31uW7
	nse0KeUSgC9WqWk5cJl3MwSQ/U0W8I5kiYf08xHFhoy64UC12ff2cMSBnuU8+fSM7NUqle6HVDr
	Dh7pBSNw2hdRXsGItuwUNr3hFb/vbCuGtIlff15xuYjU05Hbc4Q1Zybt+jT5le2Qw9y5vFcEdq2
	cJwJc09poQ7+sVclGe99eGLZ+Lu1CzE/36fvoQk6dRyiQG6WHKMQfkTt8tAzEDecwD09mUiPLXS
	6hLOvmPiOi2HtnOAigMKjMJv16y+nt8HUHdEZ3fIieMGicgHc5gC
X-Google-Smtp-Source: AGHT+IGNnSAXy5brjBvE4/Ufe8niP9wxz79TSWuqxShduDXk0L8S+++Yl5TbcxjPSKCoiJ99zpb4Bw==
X-Received: by 2002:a05:6a00:414a:b0:736:62a8:e52d with SMTP id d2e1a72fcca58-740919e8b75mr3877019b3a.12.1746535616578;
        Tue, 06 May 2025 05:46:56 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7405909cd89sm8756817b3a.169.2025.05.06.05.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 05:46:56 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Tue, 06 May 2025 16:46:18 +0400
Subject: [PATCH v2 5/5] irqchip/irq-vt8500: Use fewer global variables and
 add error handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-vt8500-intc-updates-v2-5-a3a0606cf92d@gmail.com>
References: <20250506-vt8500-intc-updates-v2-0-a3a0606cf92d@gmail.com>
In-Reply-To: <20250506-vt8500-intc-updates-v2-0-a3a0606cf92d@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746535586; l=3067;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=ZvhDtpu1XnYczmFh42T13jRZysqmiKlyJitHmezAOec=;
 b=hopGDJ1av82b4uhMrK9KRsi9pPIm+0cG0QqUktUu2DfKw/R0jeG+0DfJ8Ha+Nagjm+pp4HA8t
 y3nQTlp2jYaA7ESiaGbw4sOF+uoJcaOmN3h2V2rK4i48cwtMykjaPTe
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_054657_261816_56A38506 
X-CRM114-Status: GOOD (  19.12  )
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


