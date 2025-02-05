Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26B2AC02197
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 16:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zXz6fvQA0XjFVpb2cpM8OodOs5mmbZEn6PcelI8ZWow=; b=vOnuG1IKtwoCPr4QARzw8AjnL7
	ilg+AgMncwDUO6uAsEe7ufu0quxEqXHfyv/gm4a+iXO9kLn1t2Kf7sNMJ89N7xwgmwIqeVJIdloSG
	2z3ePQYHT3PEIFEH7R00I/DV1Oa6fxidv1nCNX6etz7n+WTSLoZ/POqwWik9xtHNMhP1r7+NmJuTq
	NHkpPN23qRcue9GARsvOplBi/Do+7xBlv5BL/gj6FR7aspdVSmmAClG0FWJdMjA0vrV/x1VNQouAL
	KIWg4ENq+qD9U9jyi4nQAHqTMEv4VSuBkdhMVwul49cb9dyQ0fFPNkhKy7PfljX8ZUz7ZzkgJCfOp
	Prso3YSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfhwZ-00000003uYS-2tpS;
	Wed, 05 Feb 2025 16:08:03 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfhpD-00000003suJ-1S0F
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 16:00:28 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2164b662090so135455895ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Feb 2025 08:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738771227; x=1739376027; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zXz6fvQA0XjFVpb2cpM8OodOs5mmbZEn6PcelI8ZWow=;
        b=GcGMj1B2FufUiEuKofbveyI/yKlRYdMCuQ5PWYd+zqu/C1qxBmBS2jAgc2kqt7oOke
         Z8m2h+UaJI4MNcsUDiP4Yf6eUUvjKDvmxURBwP4Bwq7DztEM3WXwYxkUFKBSSFPvgLeu
         pXmpwJEOJF10NzhHLN5KNfIxTsB4GtqbUW0AE+/+nO/p1v482XjECCtD6osoY5ui53yy
         EhA/ZsbnP+MJs9ctgKnjp+IHCWVBRyiok4duzZq5Zf9++upKh4I13rRemwOmIPMp+Ob/
         8dyKLv34T8Mr7gY32rh8JUt3TxQg/OxOrp7Elb064Oh3RHGJrPQiTVDKphks6gBlhdDb
         bdaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738771227; x=1739376027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zXz6fvQA0XjFVpb2cpM8OodOs5mmbZEn6PcelI8ZWow=;
        b=nmR8yMjaM39n1uMFh1+oL3FDRYnmt9pBZLkM59islGtBOCBzOqzrBe7BsqlfPKDcr5
         DwZxqwqC6HGIK84khbBS86/gyETvgDdgQMD02T0MWetbEI6FNNg5C/Ufc+KDHvor3gNd
         cb+mLOIsMTdlpQXXblJ3KIxwGab/Z/rnOe369TVliqEhY4yzm5wBz9iRm9al+82BVYKf
         Wu7P3q7S4nDHUKdymQAjqObUnLd3x3stoYZ5mckbBNGGXQ7tuCiT87UL8n9PU4mdlpjZ
         AGEyISzkuvCDaWHqmqLwpgd308aPNkt1HqCYZn3nJsG4VKoShO4cHEPSbCj/YmAHtR2S
         94WA==
X-Forwarded-Encrypted: i=1; AJvYcCX4GVMBynIhrd2o/rT4Z/HKN9N9xsCPm6550NMEIuG0d97w9kVWWVS4Y2e78kfvpVuGOFKqjE6lQgiIGQYe9fLL@lists.infradead.org
X-Gm-Message-State: AOJu0YzYClloX4Mt4sVuvfnXofz2neQsPkhEhDOjTQTdVS/8Yp8xhoyM
	rrDoK8k700RI0PaEAed/so5HW/NbsoXJcp/nV/bFBec94V53ux33slA3/X+bhQs=
X-Gm-Gg: ASbGncuB5AN6riE/3fK3oZZhHI1fdM9MKf5b8ogz1qJUU12MpqKpYxMx31dmHUu/PAH
	jgNodtglDGcPQmNml9w5PEwFCXQrem0NXyadeD4Md+0moMMRj6Kgl+bH+jHA0ngs9Xx1UcZOCvc
	bpwypAfzWOYaJSKMcGRQZtpD6vdFsvVTnbmpYFZAeSHTb8YEjzxf0hGEkrS9vBJnUx2fzqPGklT
	4o2uWf4ud6FRmRc9gbTXq0EM+Y1FzP+x5zcPxGI/6Z/LcLX2SAzO1lQmebdsygdZz9PdH4kVVRn
	25+iPjnDp4tvP/0mX8JdG0eGfVF4pkKuLZch5K/XHvvP8Y9C3FRCx/8=
X-Google-Smtp-Source: AGHT+IF8jFyxyV/f5JzHUJJ21FDiQHGu6kpLDQlz+2/R29XsqdFXb5Fuvhx/j03+dIK/P/pfOWQ0WA==
X-Received: by 2002:a17:902:ccca:b0:216:2bd7:1c27 with SMTP id d9443c01a7336-21f17ebb95cmr57042015ad.33.1738771226541;
        Wed, 05 Feb 2025 08:00:26 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21edddf883fsm99369015ad.4.2025.02.05.08.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 08:00:26 -0800 (PST)
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
Subject: [PATCH v4 04/11] genirq: Introduce common irq_force_complete_move() implementation
Date: Wed,  5 Feb 2025 21:29:40 +0530
Message-ID: <20250205155948.81385-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250205155948.81385-1-apatel@ventanamicro.com>
References: <20250205155948.81385-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_080027_386195_221E1BC4 
X-CRM114-Status: GOOD (  12.84  )
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

The GENERIC_PENDING_IRQ requires an arch specific implementation
of irq_force_complete_move(). At the moment, only x86 implements
this but for RISC-V the irq_force_complete_move() is only needed
when RISC-V IMSIC driver is in use and not needed otherwise.

To address the above, introduce common weak implementation of
the irq_force_complete_move() which lets irqchip do the actual
irq_force_complete_move().

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/linux/irq.h    | 5 +++++
 kernel/irq/migration.c | 9 +++++++++
 2 files changed, 14 insertions(+)

diff --git a/include/linux/irq.h b/include/linux/irq.h
index 8daa17f0107a..1884fa4ec9b5 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -486,6 +486,7 @@ static inline irq_hw_number_t irqd_to_hwirq(struct irq_data *d)
  * @ipi_send_mask:	send an IPI to destination cpus in cpumask
  * @irq_nmi_setup:	function called from core code before enabling an NMI
  * @irq_nmi_teardown:	function called from core code after disabling an NMI
+ * @irq_force_complete_move:	optional function to force complete pending irq move
  * @flags:		chip specific flags
  */
 struct irq_chip {
@@ -537,6 +538,10 @@ struct irq_chip {
 	int		(*irq_nmi_setup)(struct irq_data *data);
 	void		(*irq_nmi_teardown)(struct irq_data *data);
 
+#if defined(CONFIG_SMP) && defined(CONFIG_GENERIC_PENDING_IRQ)
+	void		(*irq_force_complete_move)(struct irq_data *data);
+#endif
+
 	unsigned long	flags;
 };
 
diff --git a/kernel/irq/migration.c b/kernel/irq/migration.c
index eb150afd671f..2920024475a3 100644
--- a/kernel/irq/migration.c
+++ b/kernel/irq/migration.c
@@ -5,6 +5,15 @@
 
 #include "internals.h"
 
+void __weak irq_force_complete_move(struct irq_desc *desc)
+{
+	struct irq_data *d = irq_desc_get_irq_data(desc);
+	struct irq_chip *chip = irq_data_get_irq_chip(d);
+
+	if (chip && chip->irq_force_complete_move)
+		chip->irq_force_complete_move(d);
+}
+
 /**
  * irq_fixup_move_pending - Cleanup irq move pending from a dying CPU
  * @desc:		Interrupt descriptor to clean up
-- 
2.43.0


