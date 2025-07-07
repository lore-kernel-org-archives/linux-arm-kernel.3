Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A32C5C83F07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 15:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IH9KVtMgBsrkYXH8nnFecmz5YKaJj3+GxgiEXc+y1YA=; b=4PhDaZc1n/ELmtm/M2Xuwhd3qg
	ihh8SiLOtnIsmfy0jV13KpxIFCXXTBeiZ23ONymHF34OqmVK7MJaaaOljBbL4QRW9OaVKH6AXmrVF
	mpPw44bW8w1zBnLP1MFoKVk14Rb8/3CxWDTQs1tb6QRZwoxBBla7EHTGjAt7qVs+T1Tw7ldu2+CDL
	6z8zX4WDE476CNFB3xCR0PdBHcGh/n1hIqTHxI3XbksfVBAG9+veJDSYe8ZeFuUsw1lahd/RVoWHA
	TqexUSLr8dG8Fb//G/8zpgKFpLa1P9aLwLHW5zqTIGFBTOLf7dX2pHxISyjPOdJSgHMEBzSCogYir
	YgjlYRSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYo1Z-00000002uan-0mMj;
	Mon, 07 Jul 2025 15:44:57 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYnsw-00000002snu-1FOi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 15:36:03 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-453608ed113so36433375e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Jul 2025 08:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751902561; x=1752507361; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IH9KVtMgBsrkYXH8nnFecmz5YKaJj3+GxgiEXc+y1YA=;
        b=iJt95TWYm802B6eDe71paElVla0tVis7sFOBL/UYJN6GAODmETag1DwtpnC/fnfAbI
         9Dqcrz11wxKEOmBQ0HPrOiJy/8Px9SvwbLOvEmizWEotuUxx2SDEusiBLlJS7KR6U3dx
         rJNxa1nuwbcPcyK6r+Ks7V0ixgro/w8rZFf/8eOSTRCqk68JSlaAgc1MFPZbpI2Avhze
         pQEKmnGH5/QWrzbx0SJaLDU4MgoKA6EVbeTPpHsI4nkMSucbTareKa5H8KNMCfaVzBWD
         00ZfVgD/dQMT+nriGiuTWW9NNYLLk7NYHVVxROarKSIoKCnj/oWYC9z0RCsxOlV/sZRB
         zOiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751902561; x=1752507361;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IH9KVtMgBsrkYXH8nnFecmz5YKaJj3+GxgiEXc+y1YA=;
        b=wLIsjde980rQ+ELA6kA+2mq6rPv+e/gwNikZNusBmk3LSnNaGShqIDd1QtzpKWgyKB
         rv1r2PeVyHwOGnNmkubZ7Izo/Q8miU6WaIixMNKOiPBFTwM9YLFdEwn3ZK0/g9Hrme6s
         hVebgHRLlP9xs6t2DqYd9JOLl/Gv/vGV6ipxeGJM2fqEVB0KbCLoqyRlIy5UbnB3wx5Z
         2eFaTa9i2S7OdNO9h6OK26/yLi/iCjivPodxqM+V57ffCw7kQzZ5/W7Bz50rM46fA0C6
         e/KvRM4pCVleErEaCbhvLjklwQ/qgHqj+KTat52yWofjuBR8HBPX0SCwmxPNqOZ+vRMD
         fokA==
X-Forwarded-Encrypted: i=1; AJvYcCVdM710vC7hNlpFgCeYmD8HeyOQQIGR8lSV+9P5NrLMwbO/JiOO1d8CcjDHPRmIYACwgWAS9OghWIPshYhKUIVs@lists.infradead.org
X-Gm-Message-State: AOJu0YzIqZ/PJFbsO87T+3dZocelsO3BgW7Y61hReY4SnWLr3avRBEn0
	wXsGB8MIg2pF0NI0prNUb17RZ22gX1c5bobjku8xYzATvJm0Gdfnhjee3RywdyGdshQ=
X-Gm-Gg: ASbGncvvERoCPLNIgBg4Cy/8xub48kZuic/M7O2WHMW7IJeniaTk+JcXvuzJ0hDFgAO
	zM06M4jwa1JKdN0OZc+tLL9lHZEyl1XTb1uKa/0kxV9jYXZnnzV/e7zEchGtDppta9gIIERIvSu
	QTj1q0EPqsBYU+fVKI4ANNpP7mxclwQSrB9ydx4s5eVq5yuyU0b83fPLm2rqFrToHiUXbtsVAJn
	t8ZDMQm+A/s4Pu/zaXag+d9heex4n6flN6SBh1JBNl88NbnC0+73+V2r/A1eJ3OQR/KpcpXApKw
	giTZ4aFhbM8bkluNhDODoIetoRYaGW/+A+RfVhcV05E47tKy9ZEO4wSORso74yPGwpbNokte86H
	r
X-Google-Smtp-Source: AGHT+IGes0ufFH5VmLZsiJtyyublkopHtpaYl2Uv7IhC3VQUUkrA40ug/nbGGBQCxtDhT7AejuRV5Q==
X-Received: by 2002:a05:600c:8416:b0:450:d4a6:799d with SMTP id 5b1f17b1804b1-454b306b0c9mr109664975e9.7.1751902560647;
        Mon, 07 Jul 2025 08:36:00 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:e0a:e50:3860:43f7:96cc:da3f:e6bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47030bd4dsm10409968f8f.7.2025.07.07.08.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 08:36:00 -0700 (PDT)
From: Guillaume La Roque <glaroque@baylibre.com>
Date: Mon, 07 Jul 2025 17:35:58 +0200
Subject: [PATCH 2/2] soc: ti: ti_sci_inta_msi: Enable module compilation
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-timsi-v1-2-80ae43b2c550@baylibre.com>
References: <20250707-timsi-v1-0-80ae43b2c550@baylibre.com>
In-Reply-To: <20250707-timsi-v1-0-80ae43b2c550@baylibre.com>
To: Thomas Gleixner <tglx@linutronix.de>, vigneshr@ti.com, 
 Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
 Tero Kristo <kristo@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Guillaume La Roque <glaroque@baylibre.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_083602_343027_686DD441 
X-CRM114-Status: GOOD (  14.63  )
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

Add module support to the TI SCI INTA MSI driver:
- Change Kconfig from bool to tristate to allow module compilation
- Add linux/module.h include for module functionality
- Add MODULE_LICENSE, MODULE_DESCRIPTION, and MODULE_AUTHOR macros

This allows the driver to be compiled as a loadable kernel module
named ti_sci_inta_msi.

Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
---
 drivers/soc/ti/Kconfig           | 5 ++++-
 drivers/soc/ti/ti_sci_inta_msi.c | 5 +++++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/ti/Kconfig b/drivers/soc/ti/Kconfig
index 1a93001c9e36..0a9eb5ac264b 100644
--- a/drivers/soc/ti/Kconfig
+++ b/drivers/soc/ti/Kconfig
@@ -85,7 +85,10 @@ config TI_PRUSS
 endif # SOC_TI
 
 config TI_SCI_INTA_MSI_DOMAIN
-	bool
+	tristate "TI SCI INTA MSI Domain driver"
 	select GENERIC_MSI_IRQ
 	help
 	  Driver to enable Interrupt Aggregator specific MSI Domain.
+
+	  Say Y here to compile it into the kernel or M to compile it as a
+	  module. The module will be called ti_sci_inta_msi.
diff --git a/drivers/soc/ti/ti_sci_inta_msi.c b/drivers/soc/ti/ti_sci_inta_msi.c
index 193266f5e3f9..d92cab319d57 100644
--- a/drivers/soc/ti/ti_sci_inta_msi.c
+++ b/drivers/soc/ti/ti_sci_inta_msi.c
@@ -8,6 +8,7 @@
 
 #include <linux/irq.h>
 #include <linux/irqdomain.h>
+#include <linux/module.h>
 #include <linux/msi.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
@@ -115,3 +116,7 @@ int ti_sci_inta_msi_domain_alloc_irqs(struct device *dev,
 	return ret;
 }
 EXPORT_SYMBOL_GPL(ti_sci_inta_msi_domain_alloc_irqs);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Texas Instruments K3 Interrupt Aggregator MSI bus");
+MODULE_AUTHOR("Lokesh Vutla <lokeshvutla@ti.com>");

-- 
2.34.1


