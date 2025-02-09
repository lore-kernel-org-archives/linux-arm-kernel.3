Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01A75C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Feb 2025 04:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3sE/PXdSSokJ0Zgm0Fk4Pk1jUj6qdWvd3FyfD/aEiAI=; b=YPOg40UqQRG/K9RwFJ8zFyUAlT
	yLsKlwifXNOwpKrRdj/gOXYxoKEQSym1WMgU+NU4hlrhUlhu46MnVXDl9diuZn+k0bPKb5kDWb2Tb
	mNZq2dkcvF4UM60i9oZEu27+hABfyBcf4KFyZFm4JbrZSwONHr/ElAdPIHENkGeLFK34/DeM8pvLq
	OfHdL4B/n9lx7IAWL2Yyqy6DItRJ98rcKmrWhwoYBXg3G1MpKmfXg/qr2Xv9xb2OusiIhuUKp4mh0
	flVMeiCyj95RiNkFOzt06RkvZrso2wwx9BeEj9vCsyzXRqi/JHCJjYoY83wOr2KacTJ0Iicr/h0nV
	apxa+2Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgyt8-0000000E3tH-0rat;
	Sun, 09 Feb 2025 04:25:46 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgylY-0000000E2SB-3yEf
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Feb 2025 04:17:58 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2f9ba87f5d4so4708499a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Feb 2025 20:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739074676; x=1739679476; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3sE/PXdSSokJ0Zgm0Fk4Pk1jUj6qdWvd3FyfD/aEiAI=;
        b=S+IYvifu3RJKwJ64EqOFpzfssoHjWXjmzBUswhqINnDP6hPZDYORuUwMINRTayjECM
         9ALJKzIBwXseW5eYWB0I7RbDEZh34iuq9B0j4jceX7CMNykSMElSkpO/pzzgqW2TZwiZ
         F32s0WvvOfJaiF2vE7R2jy2wuXfGOg0kw7cdTOjGu80uY0pgAR//6Pd4u1ijnCg/WPHS
         vtTs+DZPIOjD9Aa59uRfKuPmWSWwN6uwmOOPr1mJMGBU42QKBq933//Bp3yl7r2mQPd9
         +NrRF1e9P6xka8PqyzIHRHGrBMtyIb6op2UVxzSOHNnZ8BOBdxDfj9RwFZnHLBprdeRH
         7hmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739074676; x=1739679476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3sE/PXdSSokJ0Zgm0Fk4Pk1jUj6qdWvd3FyfD/aEiAI=;
        b=Tg5yUD/mQNNKrVoU5Iy385hNFK+E2t3y0bUEooNAY6ThBTobcSTYyJzulkwWzZhKaW
         ICftummfW3TrBfhI+20irE0eZAS8Ky2vJD97YNRQrxmoFPWRuUxn23/zgaCDPZHipnnO
         NlYN5f107HX7n+sV7T21SvkCxIkn4+e8Yc3Ckzj8E0AqrI5/np6peU+qiBpKRK4dy4d9
         LTUHuDe1axUAh9dj+1N3psgFXJ0aPOTAG+wf+All/lFtNAP7veVCIiElqgbXko9VzDBb
         8aOeJQf0Q6pPiR/EXYUV9GQ5eTfa8PtHUAugcLba16qr9rOqGCwKnGVUj+hmc/DEDGQF
         msKA==
X-Forwarded-Encrypted: i=1; AJvYcCUio9pVoUhShOyuajeTx78HDFJURjfKh5eVkw7Kh120X0NU1i/FzIQPDxe9tHzzsL6HMWUeoPdFMmCT58HD4D4P@lists.infradead.org
X-Gm-Message-State: AOJu0YzsMU/6vjcPL6htcKFCKhzFiemLx+dNhYWq/8ymFFfPcR9F02bP
	gdaUcZW9RYozzBYlXiLfa9V1wX3tS3HB5Vqp7qA4VJ3yyDRUKNvjTMLl9wToSGk=
X-Gm-Gg: ASbGncvfsJK5EmG5Qb6paiOKvZ7M2B67onbyqHRWJpxNAZqkZ/ZnKJvJgE9s+uHB5a6
	bqBOoV+QMszmcVYuOBfC/83E8ZfljicsJP1M9v35unVzBd9w0F+wnOkc2yfJnTDeW2ZXskfa0JK
	9JSwsMoMcMIM/C7TaaOcoDwzt5xNqo+J7tKknubdntJst8v5eHuzHncCdqvflmnDVJecfzFS9gU
	Whn/FTsY+KIhyW8TNqwtYwlt5Cs5U7X5ehYj1pGXAO5UaKdgdbzdgoUrikhI5SDDAZ5sXvDUFrL
	evMgQDZPbZrkg+uXOeYfGTq72ckccBFIFhfYmCyyLsKOYxQXAmgtM/I=
X-Google-Smtp-Source: AGHT+IHDq8j70VgdWYD0/5rZSoa9FGuz2H9SOfW3ipfEG4foQkrNVKZyKea9+xF989Gz8oAitxsVGw==
X-Received: by 2002:a05:6a00:a15:b0:727:d55e:4be3 with SMTP id d2e1a72fcca58-7305d463732mr13313591b3a.7.1739074676324;
        Sat, 08 Feb 2025 20:17:56 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73073eba116sm1898410b3a.124.2025.02.08.20.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 20:17:55 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org
Cc: hpa@zytor.com,
	Marc Zyngier <maz@kernel.org>,
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
Subject: [PATCH v5 05/11] genirq: Introduce irq_can_move_in_process_context()
Date: Sun,  9 Feb 2025 09:46:49 +0530
Message-ID: <20250209041655.331470-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250209041655.331470-1-apatel@ventanamicro.com>
References: <20250209041655.331470-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250208_201757_039446_3F70E7F5 
X-CRM114-Status: GOOD (  11.06  )
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
index 56f6583093d2..dd5df1e2d032 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -615,6 +615,7 @@ extern int irq_affinity_online_cpu(unsigned int cpu);
 #endif
 
 #if defined(CONFIG_SMP) && defined(CONFIG_GENERIC_PENDING_IRQ)
+bool irq_can_move_in_process_context(struct irq_data *data);
 void __irq_move_irq(struct irq_data *data);
 static inline void irq_move_irq(struct irq_data *data)
 {
@@ -623,6 +624,7 @@ static inline void irq_move_irq(struct irq_data *data)
 }
 void irq_move_masked_irq(struct irq_data *data);
 #else
+static inline bool irq_can_move_in_process_context(struct irq_data *data) { return true; }
 static inline void irq_move_irq(struct irq_data *data) { }
 static inline void irq_move_masked_irq(struct irq_data *data) { }
 #endif
diff --git a/kernel/irq/migration.c b/kernel/irq/migration.c
index e110300ad650..5acea2ac57be 100644
--- a/kernel/irq/migration.c
+++ b/kernel/irq/migration.c
@@ -127,3 +127,14 @@ void __irq_move_irq(struct irq_data *idata)
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


