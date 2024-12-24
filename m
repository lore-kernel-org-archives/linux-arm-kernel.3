Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13024E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 19:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I0XdwFkTByV2oDQUY3rRweCQzX/GHeUCGFeRnZwKKJ8=; b=Dq9i02MxbQzZLmmH7URiYvGCcu
	XiuIiJrFE6kqEdjFix197VXUgGyL2HIT3PHSx2tq6yymx26r6t1lDf7Z6dKX7qXqcvZYNvaOp0MnY
	CGQWjSPh0xXpc27AdxsAWOimk3TEvKZSMqVe/Br2VT4EgKftDZdWOgo4rWm7UmZOE3j50+EzX/rbo
	OGMHSpLIchGNfN1BMUkhIdDyTDv4A3voM8Gaku9oD+9ESk8WzlhmY6GI6j2NYIILMvm5R8JT0ICvV
	znfPjv1ofsLKggJONMq3rez6EE/H3ftoZ9ejwsr7KrI5KE7LRBsQDPh5LSJNKv3nHPaqoW6wVMa+j
	xBXrPnHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQAln-0000000CgW0-29xY;
	Tue, 24 Dec 2024 19:40:43 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQAiI-0000000Cfv6-1fmn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Dec 2024 19:37:08 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-436345cc17bso39665965e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Dec 2024 11:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1735069025; x=1735673825; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I0XdwFkTByV2oDQUY3rRweCQzX/GHeUCGFeRnZwKKJ8=;
        b=q3tnMT39FVdlwkgrAimXsfFAPCEJEZD/a9a0Vs07t9v+e4BTPiPRqRvH1v01ITJVBN
         uM9VFjiKqtnYyDci0Z5BT5/iEEOP8y0k7/69JVi1+bI/msWjytO3+NrKck8UPPici6RW
         LmcqkYjp6491qgA7q5duPDYtwpz9yDheYpsJMMZCN/6BEtgcWS4c1BMGixbUQ1qx8aX3
         8bYtLhVgdWKiUyPHaCi3Ahby6ptVbOibps2z+v4XCVVKL0dBCGS+oeBmXNphvKFRytfR
         eVTV/TSRdwXaXEFWtup8vCbqaD+dG7WDpqtsekGdhuPCwTN8Buy9TOc/BDRDzjaUjk2h
         j0Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735069025; x=1735673825;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I0XdwFkTByV2oDQUY3rRweCQzX/GHeUCGFeRnZwKKJ8=;
        b=kh8zU1t3akDgAIvU5Xpv59FrLNNrd8U7qvIP0tixyXkveuR9vtTS/CZ4WHCfzF9gqU
         IhnpKNBvn62w97jPhXq5QMPxr4CWiM75kqeBWbOK5T25vQKaySy2iOemFy1gTi7gsa9U
         tSFdYW1+kSQJBQ8Zeq7o5/QpahUErIqt57s0AeS5L8qBNXe7QJ30IVIhsxITjLj8B9HB
         Myr5GXDBnz1AJMIsIAryX85urSP1CHKt3wIWstih+0GxUKC9YxGvCvo7AWJofyA3fqUV
         GKaH1GYo1glYVc1HQ3RBNrlGY7V82ZLG+TRZp/ufk5D+QkywjQCGwHNHmrfknyMlsgiD
         lqww==
X-Gm-Message-State: AOJu0Yw2sABghu3FRnAsAG6OAbfmc8csvRxMIOvDtlBGjkfQy5ZMHa+i
	n4BLq0vJNOgnym2zTildH8coTh0M+QRSKsPjKKlzii6tQ6w0mO1V+i5d7fDEfV4=
X-Gm-Gg: ASbGncsDlCjV6nz14CzmOiA7/Gv5bxy/c4wARto2S7zKXuIhfAlZdO41qt+3DNLARFM
	WLO9HXd9/j6g0adV2q8RnMcC+K5PKweIeAJ2RuNL8FbMxl3jhdA39dbXviRS6EYOVFC/YaxTsFZ
	8xWdplh139pJ3+Rt1HgPkMR+bfNdFkbTnrAnTv8xFxXy9+Q2J/kXLrEtzCG+ebLI6ZqHFnJNaGy
	zJDH+6vEF1cReWG+etQWTDeSwiuDnKHQ5lDcSAryjVF1Ry3CSEsAzlSoHpG
X-Google-Smtp-Source: AGHT+IFYKl7NiNheeGbdAaZoPe9z+46nf1leFsJn80aeuc4EHABu2cZzKKp3ixc2gFkVwDoOtwxLDQ==
X-Received: by 2002:a05:600c:3ca1:b0:434:a350:207c with SMTP id 5b1f17b1804b1-43668b5e22fmr137473665e9.23.1735069024426;
        Tue, 24 Dec 2024 11:37:04 -0800 (PST)
Received: from [127.0.1.1] ([2001:861:d40:ed60:c48a:f4b0:6773:1823])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436611ea4a7sm175691355e9.3.2024.12.24.11.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 11:37:03 -0800 (PST)
From: Guillaume La Roque <glaroque@baylibre.com>
Date: Tue, 24 Dec 2024 20:36:43 +0100
Subject: [PATCH v4 2/2] irqchip/ti-sci-inta : Add module build support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241224-timodules-v4-2-c5e010f58e2c@baylibre.com>
References: <20241224-timodules-v4-0-c5e010f58e2c@baylibre.com>
In-Reply-To: <20241224-timodules-v4-0-c5e010f58e2c@baylibre.com>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Santosh Shilimkar <ssantosh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 vishalm@ti.com, Mattijs Korpershoek <mkorpershoek@baylibre.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Guillaume La Roque <glaroque@baylibre.com>, 
 Nicolas Frayer <nfrayer@baylibre.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_113706_448345_99375781 
X-CRM114-Status: GOOD (  13.59  )
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

From: Nicolas Frayer <nfrayer@baylibre.com>

Add module build support in Kconfig for the TI SCI interrupt aggregator
driver. The driver's default build is built-in and it also depends on
ARCH_K3 as the driver uses some 64 bit ops and should only be built
for 64 bit platforms.

Add MODULE_LICENSE which is mandatory to support module build.

Signed-off-by: Nicolas Frayer <nfrayer@baylibre.com>
Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
---
 arch/arm64/Kconfig.platforms      | 1 -
 drivers/irqchip/Kconfig           | 3 ++-
 drivers/irqchip/irq-ti-sci-inta.c | 1 +
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index eda592ac9c8d..02007256709e 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -135,7 +135,6 @@ config ARCH_K3
 	select SOC_TI
 	select TI_MESSAGE_MANAGER
 	select TI_SCI_PROTOCOL
-	select TI_SCI_INTA_IRQCHIP
 	select TI_K3_SOCINFO
 	help
 	  This enables support for Texas Instruments' K3 multicore SoC
diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 1099691c45d5..be063bfb50c4 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -545,8 +545,9 @@ config TI_SCI_INTR_IRQCHIP
 	  TI System Controller, say Y here. Otherwise, say N.
 
 config TI_SCI_INTA_IRQCHIP
-	bool
+	tristate "TI SCI INTA Interrupt Controller"
 	depends on TI_SCI_PROTOCOL
+	depends on ARCH_K3 || (COMPILE_TEST && ARM64)
 	select IRQ_DOMAIN_HIERARCHY
 	select TI_SCI_INTA_MSI_DOMAIN
 	help
diff --git a/drivers/irqchip/irq-ti-sci-inta.c b/drivers/irqchip/irq-ti-sci-inta.c
index b83f5cbab123..a887efba262c 100644
--- a/drivers/irqchip/irq-ti-sci-inta.c
+++ b/drivers/irqchip/irq-ti-sci-inta.c
@@ -743,3 +743,4 @@ module_platform_driver(ti_sci_inta_irq_domain_driver);
 
 MODULE_AUTHOR("Lokesh Vutla <lokeshvutla@ti.com>");
 MODULE_DESCRIPTION("K3 Interrupt Aggregator driver over TI SCI protocol");
+MODULE_LICENSE("GPL");

-- 
2.34.1


