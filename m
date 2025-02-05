Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3883BC02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 16:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2MMc9mwT9NVQ5mz2h0GYOBXRUS44hVyd7ty+rMv4eE4=; b=UG+ltpIxV4wRYoy4sFNNZfLpPQ
	ANovgKve43hCAdbEXD5+8/3uXeeW78pK+br0Isz0xB7+yAXcT1zYIxcP93c1DiZLhggPfa3zaR3ra
	Det0DetD0KGDMiK5MZ2I+V3IaA4NXlrBpVU1HD+Fdu5gr5TGXR6q3HtoFseBzrwqhPtz56m+yD7EK
	zWbm0riZR/IaV8d18Yha4l5y7XffHmTiUR0BfM5nit7GZvDIkPjn+xOJ7SCmIqx42lhUO8iNVwp3s
	oFPoRbRMAjTtwX8ITd4S2/zx+J9n/pOGiUjUTdpClxf8u8AgE7jmA2njFj1dr5jasdHWvHNdmYpnQ
	0HHUIGbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfhxv-00000003uuK-0K7F;
	Wed, 05 Feb 2025 16:09:27 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfhpK-00000003svj-0DZG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 16:00:35 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-218c8aca5f1so49719785ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Feb 2025 08:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738771233; x=1739376033; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2MMc9mwT9NVQ5mz2h0GYOBXRUS44hVyd7ty+rMv4eE4=;
        b=ILo+grGQIs16tbSanD8v6mZwUHlllZhrcY6rySUQhlLj3NEJSezHps8pTuAeoK9+sL
         UIMNv+rHkXYW32pa+NVZTZMKFxYneMQyDKkHbO29nW+/4LW7QlHXKr/CGoIvNk+P77ly
         eERz6CbO/4pRXXWalRiw8CjEEpzXwWIXqFJkywdy16uzDf6bOzbEnzgvFRRK12QJSnAW
         YlxnOZQO4gQbqIQBZSQL+BhuT6+rGK/VcVcLxvbpHsEJ0Ke6aordW1+cya+o5+gspVnl
         ioAf2azMi+aRo6/9KgIeUbl7Qhm8beHCawR6UDhflwtWlNx+ul2xrb0J+DEr+O1bPE6Q
         H9GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738771233; x=1739376033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2MMc9mwT9NVQ5mz2h0GYOBXRUS44hVyd7ty+rMv4eE4=;
        b=CdsqDfvDoV5fQQo5vzkWoQqJRPJrbOvdLiWRDMBP4TGWFfMszS6IaqJCZM321eBhVu
         dLeiwgDmmfT3uwvNf3QLHrtqz96p7EYEiKzEigr5K372ZfZzHRBF20zJ4aGVou8UOvdF
         rweSJufXfcDaEOSiFf+WmwC33Be03+AcHN6k4PSmcvzfP5trOCiKh7XxblzV8Xa+zxGe
         DQgoNBbAWbcpEpbNCV2wSqV0z08i1ZgSuRFHryyUYRQwLqQwksgrkO2cJ79voypZVBXe
         D6W26IIifVEyNwENpz9gPaGfrTG9txTXg1zX+hnuVMFXJC0tZWwEN5/s3tY51nL0BbhL
         4gKw==
X-Forwarded-Encrypted: i=1; AJvYcCV2cwxuRyyfToWEJ4dJ/UedvCJAV0ohfrFDfjkupV+rYWGWzjPpTsCh/GbUUhjgXmMLajwkGqUMO1PVpc+Pcj+P@lists.infradead.org
X-Gm-Message-State: AOJu0YxyerKbqJ1ydXwsoTRJfcjTfDogSvk3RIfjKehNndkDQoE28Fud
	Zo3QjY5gZisxTOepYLxLCf/qW/fKmLMct5jdMFEkbafZo3TqR4v5DdWAqL9wGXg=
X-Gm-Gg: ASbGncvc4MoNFO2p5JUEoiz/49GkJFxPTdL7CBowUW5UQYILNWDiS1aTGPFHDK+b5hb
	jgaZebzCaBrqRDnuOh2YgRVTsLCbcQBVoTfMGr2GoZ0mG9qp9f5MSqQnwp53rSNpqFdFI8QD16m
	EpTj4/uGb/mpj/5sohx34Nm8BlLeh6iqFS0bTp/GFSgIVIinZeojGVLK6sSisRI6wcbvIWsQv8c
	rcgrJ+YQsO8kqj4LQJWiqhL95WK+3ZLpreAcO7+wAuA82udntu1NFWrx1tIyy0hYuaaWbDWDvF7
	YjUBOhwT3rlpkeN1n4v59eyzwC6J8k8hgnD1V3QbTOmJBcDSUCyVV2g=
X-Google-Smtp-Source: AGHT+IFVUygBqhzTxplgfR5D4ALHtsI55bhay/IfP7Si4rFXdhEgGg1YfTQqUROzXYR+kUtbmKwJEQ==
X-Received: by 2002:a17:903:8c7:b0:21f:16b2:9339 with SMTP id d9443c01a7336-21f17e2a39amr53896345ad.27.1738771233066;
        Wed, 05 Feb 2025 08:00:33 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21edddf883fsm99369015ad.4.2025.02.05.08.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 08:00:32 -0800 (PST)
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
Subject: [PATCH v4 05/11] genirq: Introduce irq_can_move_in_process_context()
Date: Wed,  5 Feb 2025 21:29:41 +0530
Message-ID: <20250205155948.81385-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250205155948.81385-1-apatel@ventanamicro.com>
References: <20250205155948.81385-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_080034_107163_4E191581 
X-CRM114-Status: GOOD (  11.20  )
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

The interrupt controller drivers which use GENERIC_PENDING_IRQ
can move interrupts in process context for downstrean devices
which support atomic MSI configuration.

Introduce irq_can_move_in_process_context() which allows interrupt
controller drivers to test whether a particular interrupt can be
moved process context.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/linux/irq.h    |  2 ++
 kernel/irq/migration.c | 11 +++++++++++
 2 files changed, 13 insertions(+)

diff --git a/include/linux/irq.h b/include/linux/irq.h
index 1884fa4ec9b5..5b67a47da144 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -617,6 +617,7 @@ extern int irq_affinity_online_cpu(unsigned int cpu);
 #endif
 
 #if defined(CONFIG_SMP) && defined(CONFIG_GENERIC_PENDING_IRQ)
+bool irq_can_move_in_process_context(struct irq_data *data);
 void __irq_move_irq(struct irq_data *data);
 static inline void irq_move_irq(struct irq_data *data)
 {
@@ -626,6 +627,7 @@ static inline void irq_move_irq(struct irq_data *data)
 void irq_move_masked_irq(struct irq_data *data);
 void irq_force_complete_move(struct irq_desc *desc);
 #else
+static inline bool irq_can_move_in_process_context(struct irq_data *data) { return true; }
 static inline void irq_move_irq(struct irq_data *data) { }
 static inline void irq_move_masked_irq(struct irq_data *data) { }
 static inline void irq_force_complete_move(struct irq_desc *desc) { }
diff --git a/kernel/irq/migration.c b/kernel/irq/migration.c
index 2920024475a3..428e42d3bc91 100644
--- a/kernel/irq/migration.c
+++ b/kernel/irq/migration.c
@@ -126,3 +126,14 @@ void __irq_move_irq(struct irq_data *idata)
 	if (!masked)
 		idata->chip->irq_unmask(idata);
 }
+
+bool irq_can_move_in_process_context(struct irq_data *data)
+{
+	/*
+	 * Get top level irq_data when CONFIG_IRQ_DOMAIN_HIERARCHY is enabled,
+	 * and it should be optimized away when CONFIG_IRQ_DOMAIN_HIERARCHY is
+	 * disabled. So we avoid an "#ifdef CONFIG_IRQ_DOMAIN_HIERARCHY" here.
+	 */
+	data = irq_desc_get_irq_data(irq_data_to_desc(data));
+	return irq_can_move_pcntxt(data);
+}
-- 
2.43.0


