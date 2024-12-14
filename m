Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 820F9E7716A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Dec 2024 17:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nBJthI+mqNYzorludLEAXvfiuDja+LCnD6djvnBek6Y=; b=0ZSTHPsu8cf/Y2yiiSmu4gHngU
	s3+3zALNOBNIFJfiV9XnbMcvncSFypLBNrSb9Ufi5QhGGgBQLV+tjQKinWhkOiSfXORtZLoS2D4ij
	8+ok2ryhorMWRE40kFEB4qOz+w1/SNP20TxiPkUYj4ZAaYTtLcFRoT8E3xrnMVCyv5IEMv9NrHG28
	luHAg+CjpErfQqk7cYlpwt7xvaSDdOE02P8ug0ycz0Zu/Bw1li3cFN2orzJT3MviCFlw8wxaOXjyB
	d9sKmf03e/bAhdk3Hz0haDbRjQaNLCNnZxPNgXKBMM4yZtqpdlMgizH4NRoRdTyESfMTumyQu+OQK
	C34wqMnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMW1Z-00000006hwS-2zdZ;
	Sat, 14 Dec 2024 17:33:53 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMVuh-00000006gSV-3eJQ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Dec 2024 17:26:49 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2163dc5155fso24612075ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Dec 2024 09:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1734197207; x=1734802007; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nBJthI+mqNYzorludLEAXvfiuDja+LCnD6djvnBek6Y=;
        b=XwD75bzjtZC0hcFt552Ed3Cwu2pjC74+4d2/k2A4NzxeKzmUaqnHjUAyEB31QZVDfe
         3eEMLwyqjFqN/AFGGwcW8/ZWE5u7OQDLxsN9U8zt8PFIpWLQ0xxBlFeMHU+tInxEzXqV
         MVVkhGBi5PqoMOLTrpDZVnWVmF0R3096yQuRuJeRr0m/ZeaFoGhPaWj487SxbPN4g0fG
         7oja0C2imIloG30z+vXbjb7w0NhaPmgkCkvdPpt13SBGMzMVDoopT2a5qKZMRcWpqJVe
         YKMLwMBZ2tHLrreVHPyPZcCBMtb730aIse06wHLyM7Jak6eOiIkiaw+vTODEXvmM8JrW
         75wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734197207; x=1734802007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nBJthI+mqNYzorludLEAXvfiuDja+LCnD6djvnBek6Y=;
        b=V2hRt5wiPWcwhNvKZBeoihNix8oaGAP8Mnv8AXwzmziqKu+MLH1eldEar0A4ew/SRu
         ZxQ3BSyjd7p1A3WPTyH9D8pBPFqXWyrk4f5MM0qDAmnsOH2RAeUHsN6s2AFtZZ4dRpoO
         a5sWB+J/I9hCzaCm615J8ttPLSKvmPRA+CDyW2XaRR8jElp0n6/rjXaIvl7lsAPd8dK6
         2wU1RsfniJkeAF2pwJVRe4l2VTlIEEC3B60naz3m0j8qsWr770umEHhTXpNkvms2dzGK
         Sg5Yoc7wZcSIXejQruEaMJQbs6pR7ofjufzvlYSNFiEmSRENIwQWAoHg+VrWIK2nKP8h
         TVvw==
X-Forwarded-Encrypted: i=1; AJvYcCUMbTM4DsmaDuyg7TRVz7bIJk4A2l6e6QV1kx7jMibuCUSFW2tFo3Bx0iETMpI8Zlnq5bcpTLRREYdBDyoprBm6@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+JxWAP+1+Su6ssdkxbp/6vklDyFubLxngpvJXGzGXpOngsaZH
	T9ORhSmTRfH6K81NsG8QWOty4RM/URwhWlgv5Jevgtn4XqYv+AnsZLnXM1O7ItM=
X-Gm-Gg: ASbGncuNgEQE6Z/ReBdSQytvhzetEa5Qo63zmM7Uy6Y5VY9Y1NL19rU+sIGtPumGKog
	UpqMV4rUlPPgZolYj1uUj+R/PaVcXLQkAqZfUL19900oS8Z7cV27PApx1fT8+mkhpQiy5eozBWL
	3QbMXlm2Sh0qpnvJkOy48ZzuBdj9BJpxeVu2G7XaqTxZOY5L+9KN/7Lej5oVy11CaHik1sbKG/l
	Y6pyOxElVSs5eU9gU6PlfqwRAtUHosf4QI3/aEuVOVYSkKfHcREDRNIifM1ZxbWoG+4IlBFMbBN
	GH2AdZN0yMC6gwI=
X-Google-Smtp-Source: AGHT+IHWMVLk7VAHEJKffclkR/GgfiztR1cE76mj+f0onDTerIF7KBl2vajNkAVkEerHi9sn/JzVIA==
X-Received: by 2002:a17:902:ccd0:b0:216:3466:7414 with SMTP id d9443c01a7336-21892a41a9dmr113376145ad.44.1734197206669;
        Sat, 14 Dec 2024 09:26:46 -0800 (PST)
Received: from localhost.localdomain ([223.185.132.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f142f9e186sm5049811a91.41.2024.12.14.09.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 09:26:46 -0800 (PST)
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
Subject: [PATCH v2 06/11] genirq: Introduce common irq_force_complete_move() implementation
Date: Sat, 14 Dec 2024 22:55:44 +0530
Message-ID: <20241214172549.8842-7-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241214172549.8842-1-apatel@ventanamicro.com>
References: <20241214172549.8842-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241214_092647_957766_A8FF452B 
X-CRM114-Status: GOOD (  12.87  )
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
index b689c8fe8d60..509c0ee4ef38 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -496,6 +496,7 @@ static inline irq_hw_number_t irqd_to_hwirq(struct irq_data *d)
  * @ipi_send_mask:	send an IPI to destination cpus in cpumask
  * @irq_nmi_setup:	function called from core code before enabling an NMI
  * @irq_nmi_teardown:	function called from core code after disabling an NMI
+ * @irq_force_complete_move:	optional function to force complete pending irq move
  * @flags:		chip specific flags
  */
 struct irq_chip {
@@ -547,6 +548,10 @@ struct irq_chip {
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


