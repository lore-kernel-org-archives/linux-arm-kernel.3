Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7254C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 08:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zXz6fvQA0XjFVpb2cpM8OodOs5mmbZEn6PcelI8ZWow=; b=Nk4UOg9dnTXi+t4GQB5jwLvzfc
	I1dxgRpVO0QaDQKAac2jaF/mMHbMDej1koF0Ue8A5UoawVfTfD4f79GJs0j33rO9EJhu+DSqTTJBt
	f/g4s1pFO19i0VGQeT3SdUPUuJRyuagXt3LZW92HuSZvacR3JogpKfN7ZrQPnxPwPRR+0qnA0trqa
	eqmnsevyz7W/ql4X+/a1YKq6vVBDhRLcU5hGsC+E7eWwEHs4dKDTRjwW9M57GPlBGPsvumfhTd8qS
	Q84bVBc3ZCZTZFCOdns751Ns7V2kHNvv7PH94J0LRn/CnwNCpge2OzLFRwfmn2ZLaLbNLJ4AzKS84
	XcnMlwzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfDtt-0000000HUCZ-2CV6;
	Tue, 04 Feb 2025 08:03:17 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfDm4-0000000HSoV-3Z2m
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 07:55:13 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-7be8f28172dso263998785a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Feb 2025 23:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738655712; x=1739260512; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zXz6fvQA0XjFVpb2cpM8OodOs5mmbZEn6PcelI8ZWow=;
        b=nCXhPJS129mXHl8LjkLJpQXnN8qDONxJoosT4r1dWpAiKa1481PWWHbN08LAcHvg8d
         1XCr6BHQsm5sheBCweuxVrHfCuzlnamFtZ0LiGIulmQf1+LqXDSH5s8+dDHZqZGfeZTi
         S1ZZqLE62xs7k0spvAWWiNG0ozXkdloTzOCLpBRW7VggQXgQgwsa/McVCpN/F+DxHmD3
         N4OQAST+PTn42lxEN2JgX6SMImpQdxUbuLHEswnWBWjdeBy2hjeHhaTLO79JE+3BQAyA
         iksg9asm3egzT8Jd0NuQnzg7xz7WDRhX6rfoAFiAAd6RgrkGnA1Ctr1EPQncR2E4Vat7
         lw7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738655712; x=1739260512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zXz6fvQA0XjFVpb2cpM8OodOs5mmbZEn6PcelI8ZWow=;
        b=kxaIk51IZwE70q1tVZdfg1+sMc5rvbcqelmi+LeZd2m7vaIxeLMSHkVBhTQ9kelA86
         TBziEgePT7jQgmZerAWzE1/86t0qJFddGv+AMQKNj27TBl2SyCwDsMylYtAywIdP9Ucn
         6FqYOu8UkXb5LmJFq5sxHDJSgcLkzdSb4XIg8ErMY48E/FsSrN/HyiqAZZuxZ/lkEgGR
         F7RTd/DiIM47sR7y4ryhiLAc0zg+xYfZLjx1itIe5eQTTF1efM8kxoerfTow0JsAFmhY
         I/Gf00XZiIM8yzaZguZSTmhvysdeU2lWs9eYYq/u2LM64aSbuhRv6eEOcx+PqIQv3lMn
         hS5g==
X-Forwarded-Encrypted: i=1; AJvYcCXWw9Hp/LcdHR7wEwxzriZKnQ0fDSNAmYX2dKpJKWeD7Ec8mXTQRf9ge/7VQ2/OrsbTifcBzgKibLhNfsYFDWVo@lists.infradead.org
X-Gm-Message-State: AOJu0Yxxgy5QjRcOiugVBx2pq08bZ5oxiXG5W48OYMv/n0lFvGTqSxXP
	xhs3BIte8/CI3KGBWVwPKT2RExI6jqkHylMGL1YZFm3LVa65W234QSNU+UXnKzY=
X-Gm-Gg: ASbGncuLHDAu6BR93eERM4u4J2yFJORPGEdJBPJBWbC6YA5llOfDyYxDehaEMO05V3N
	STqbjCmz3B0QEH4WrdstNru7l4g25TbkJMPSXhcM4GXYj2Qxo5PVFT2kQ3V6PLz05vEDSkUuEjC
	6J+Ee+eTo1GYLBSmPDAn+nPJqMOJlKBldAbeeGVMjscwmlPA//yb+MDXggeqXAM8Mh3twyUvE9K
	s+0LT72Zzx5RWvygPnPnVGJf7Ux+j6+aW8ZFrHNcBztaH7BbsnVfNDBEMvK8Hl61aTEKTTB9AOn
	tbucPjFoVDs9ai1F7UG5p/zs9sirG8pcXLHkPqapibzV2uHaheuKqdM=
X-Google-Smtp-Source: AGHT+IEygJlzRE1f+LllQAS/xZozPVCC5zlNa0cJxT7IbmhuAFZYxlHSMSOoINty/Bxd6fyVjhK48w==
X-Received: by 2002:a05:620a:2b8a:b0:7b6:6c6f:fb5c with SMTP id af79cd13be357-7bffcce52e1mr3541223185a.15.1738655711939;
        Mon, 03 Feb 2025 23:55:11 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a8d05ddsm613373185a.39.2025.02.03.23.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 23:55:10 -0800 (PST)
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
Subject: [PATCH v3 05/10] genirq: Introduce common irq_force_complete_move() implementation
Date: Tue,  4 Feb 2025 13:24:00 +0530
Message-ID: <20250204075405.824721-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250204075405.824721-1-apatel@ventanamicro.com>
References: <20250204075405.824721-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_235512_894602_C1E3B07E 
X-CRM114-Status: GOOD (  12.80  )
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


