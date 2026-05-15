Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8987ECD4851
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 12:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ea/4RzxEzKT31bEDQIXyxVIvc8FvNcipfvT1OSWbCeE=; b=qHaSUT6iUl0AeC8h2w80If5cvP
	4dXyEzpOBtoUCSbyYNqeOKbvpI700ljyDP8kYNMmbfg25uz35/Mq5SDgnrtL9lRxbYGlaouO/Jxyq
	IS9Fh8IbEUoFAD3qgIhTXcT4YsYgbd7yh+Kf6RoHScAfyLnIIwwIW3jX69OG4Bo2tS4ctthV4f1f3
	RdcrojfGoh/FowGQCWWPaOtlWvcfKI5RlkZyZk84XpG0mIibA0jbe5g+w2IDI9Og7zjsKHxmDtZAh
	dN6Fu4UWB/+nGY2xIaMZnotE9JAtbAIGH6wHykoj/YS7SPd0WYsoRSK7ZwFbMHTTfgTMvVrX0ayim
	gG9lymsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNrD9-00000008GOL-0QbF;
	Fri, 15 May 2026 12:00:11 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNrD6-00000008GMv-3FJq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 12:00:09 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5a884ebba7dso9141261e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 05:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1778846407; x=1779451207; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ea/4RzxEzKT31bEDQIXyxVIvc8FvNcipfvT1OSWbCeE=;
        b=M8aANpH4Rwk9xAwHXNgZdd0dJ0gRVUoqlrYDgFY8FWBeTNly7bPubK2G5zXj+RxWvr
         9a4tq0tdcwwfa4oKw0aThxZTr5hSr8sAYBjC1HHioZoACqIKA+gFk2mI44PQBP/7CzeP
         PRalNfOWXJWn1y839hZaRrpnwPtCNaA0DOT83yoB7MV968htFOId7HyT7X2gbkNug8Nv
         q9yEqtATECmwVnNLzUg1tHC8TX4hwapg/wrycKmhqohRG0ctwf2uVwyarIguwrBs6WLI
         2V4+eXg1Xl1jTeiV9Fl0FnD14JxdpzMMlcWY0ZaBizh4BDXkkkCClzlQuH3h3o1caKW/
         ms+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778846407; x=1779451207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ea/4RzxEzKT31bEDQIXyxVIvc8FvNcipfvT1OSWbCeE=;
        b=D0X9kOOENJUdLDBmZM7ZB4PDzNeTI54BMmfb3ccQIws62TZsfBGEREn5I9XF0EYXRE
         BFoZ51vsHjEllVfVGyCTBM04pw2krZFur3hVC5xWoJ+PFIu4yf7mXDOTx8JygaLybBPp
         1tFsP4MePBPnkFJ4DmSYVctmmy1LzDbWfe/O/jLk0a52mkFdaYsFYJy57VmO57ccFyEt
         YT6jz9RGr4QAMgWmRbMT01smY5aBC5V5xLnStEdUh2fLL11rgbpvyyTKtYwuyGPieqpS
         sI5KzVOel3Cq4pksyOa5tDFxCMliPTL7+04I99SquPyPjOFZT5L0C4EtLT2VRbhtiSVs
         Mfqg==
X-Forwarded-Encrypted: i=1; AFNElJ/HbL2jCHXpEU3yYRABz9oZRwM70C+Zc5mn1HCssMy+SpTk9tt7fD38iFD9A9Ki3AHAvWXt0+NhZxAFNQDak0tr@lists.infradead.org
X-Gm-Message-State: AOJu0YypmMdzB9cvrN+6pY5aE0mJAePyDIJG/W0MlDCBunQ3r9xk0Bsr
	lNFQin/3ptjqYcA6CLtt0fnidC9ldsDqSp5rpzVqkviGvUjMlE1g5J4iPFWXq6awhO4=
X-Gm-Gg: Acq92OHUVtBHJpt4rnzVXzFt4IHe5yRlnx8ytI+NHg5jtIVdP4miaiOaU6V0XDRdoO3
	4x56dYUAbJmP2p30cpbI9qurLGEMGC/mLNVBI2LOMEM6cAmc09wUYgxYi4TvlNbbQ27gE4DcqP+
	Iivq+yrlyRV2ocNqFq9v0kNx3aiH1TbQxgII+mE5x8P+iVCqAie9PyCfumZCw42BQY0NukqNPPl
	Bhk4LSjrbTjvaT4iDuuP4QM+CmwFSWAQ0OEKWzVV2KAkYIjtA/W7DDPt7Po95oXkJf1LNk9qXDe
	Wa5DWTsoHW2QVPy0GlSC1QaIa13ey1Hq0QPaSf82rZ1EdSyj1D0hTS14TWFy55G6000gStEGN+L
	Zl2RO5fLki/Af244LVcS+ErNWae0uTUQS4PBpX55knqOfOsRDB/x8fCrBYk2xrD4j5pRSVOJXVk
	mhUqRuALkPaFdJ/MXRjfZbLmXOlqNuiqvWEMUjNGIn6bSr7RgNHQaOqPTahzfexWgWwlTcpE1WP
	2dEf+LP0Cr8ef+gIab/Az+EtK+74MCw
X-Received: by 2002:a05:6512:3c98:b0:5a9:163a:9ebc with SMTP id 2adb3069b0e04-5aa0e612da4mr1402039e87.19.1778846406756;
        Fri, 15 May 2026 05:00:06 -0700 (PDT)
Received: from fedora (d-zg2-146.globalnet.hr. [213.149.37.146])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3945cb015f9sm14679631fa.32.2026.05.15.05.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 05:00:06 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
X-Google-Original-From: Robert Marko <robimarko@gmail.com>
To: srini@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev,
	horatiu.vultur@microchip.com,
	daniel.machon@microchip.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v3 2/3] nvmem: lan9662-otp: add support for LAN969x
Date: Fri, 15 May 2026 13:59:08 +0200
Message-ID: <20260515115954.701155-2-robimarko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260515115954.701155-1-robimarko@gmail.com>
References: <20260515115954.701155-1-robimarko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_050008_834745_41F88474 
X-CRM114-Status: GOOD (  15.20  )
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

From: Horatiu Vultur <horatiu.vultur@microchip.com>

Microchip LAN969x provides OTP with the same control logic, only the size
differs as LAN969x has 16KB of OTP instead of 8KB like on LAN966x.

Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>
Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v3:
* Rebase onto current next-20260508

 drivers/nvmem/Kconfig        |  2 +-
 drivers/nvmem/lan9662-otpc.c | 12 +++++++++---
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
index 74ddbd0f79b0..78b648e14727 100644
--- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@ -138,7 +138,7 @@ config NVMEM_JZ4780_EFUSE
 
 config NVMEM_LAN9662_OTPC
 	tristate "Microchip LAN9662 OTP controller support"
-	depends on SOC_LAN966 || COMPILE_TEST
+	depends on SOC_LAN966 || ARCH_LAN969X || COMPILE_TEST
 	depends on HAS_IOMEM
 	help
 	  This driver enables the OTP controller available on Microchip LAN9662
diff --git a/drivers/nvmem/lan9662-otpc.c b/drivers/nvmem/lan9662-otpc.c
index 56fc19f092a7..62d1d6381bf8 100644
--- a/drivers/nvmem/lan9662-otpc.c
+++ b/drivers/nvmem/lan9662-otpc.c
@@ -27,7 +27,6 @@
 #define OTP_OTP_STATUS_OTP_CPUMPEN		BIT(1)
 #define OTP_OTP_STATUS_OTP_BUSY			BIT(0)
 
-#define OTP_MEM_SIZE 8192
 #define OTP_SLEEP_US 10
 #define OTP_TIMEOUT_US 500000
 
@@ -176,7 +175,6 @@ static struct nvmem_config otp_config = {
 	.word_size = 1,
 	.reg_read = lan9662_otp_read,
 	.reg_write = lan9662_otp_write,
-	.size = OTP_MEM_SIZE,
 };
 
 static int lan9662_otp_probe(struct platform_device *pdev)
@@ -196,6 +194,7 @@ static int lan9662_otp_probe(struct platform_device *pdev)
 
 	otp_config.priv = otp;
 	otp_config.dev = dev;
+	otp_config.size = (uintptr_t) device_get_match_data(dev);
 
 	nvmem = devm_nvmem_register(dev, &otp_config);
 
@@ -203,7 +202,14 @@ static int lan9662_otp_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id lan9662_otp_match[] = {
-	{ .compatible = "microchip,lan9662-otpc", },
+	{
+		.compatible = "microchip,lan9662-otpc",
+		.data = (const void *) SZ_8K,
+	},
+	{
+		.compatible = "microchip,lan9691-otpc",
+		.data = (const void *) SZ_16K,
+	},
 	{ },
 };
 MODULE_DEVICE_TABLE(of, lan9662_otp_match);
-- 
2.54.0


