Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FB04C021AD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 05:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g1uPoQUPdZmOVAGUjsuXvJv4u9Da43G7I2Dsh2jSmdU=; b=UgzVFqRpqDgO9fKeL70TW48mRI
	+XOKFmCEblhoYzyTl+BCWDhvrP7ldGh3V9QdiMewD61p7CijMHktJSqtnPlDOjfwxgyG+2X+c9end
	UTFqEtUgAqUcp1C8aUaWR5f8hOIwjN/CqF4gHqTEGhC2PBTpx63EzFN+r9X/q+kJF3/8RGT9cYhl1
	cvsHa4Gv2Li6ud0zcTB3NSmOjJDEHdjYGyCs8d9ToeI7wDxMn86J2y0EsFNOmhCjxFGufGe/r7a82
	wOuE6NXXxLF9zfk4n8vHaS2jauisGHm8HsFuJPgZS5IIKLZV0ZoVd/lYsJCOxtQr8QfKrjgbTV7Md
	8SMuGLkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkzWR-0000000Gr20-01Y4;
	Thu, 20 Feb 2025 05:54:55 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkzUw-0000000GquA-2lKZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 05:53:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1740030802; x=1771566802;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=23uAUqD4eF/XUPX1PwVhFaSmnK6teNTJ7mdwU8z7ALA=;
  b=J0Zf+1RbkfFQ7yhpD+4fL8hQAYwaq3GrDhnVQJvuCiOfQIhIqxYnUIeU
   0hXHKRrvvyx4R3JcTMKPnVJj9YiYVmmKsDUdFVwfLNCBYa6fpUVPHPghn
   wrovI1TYgKlfyqhsS/Op0NbhttesgKk8DGfuHsVJ/9qDlid+PkPDELH5q
   jIUvfSl5NegPQgXIhWzIliHx32vLMvtP6ttXLo/9cSLyuiuWxvJZBdbTA
   jaEhe71ek1DtE1hetYaBdxsXy58UiSx9uzYvaiAN7WRUvfq22C3Fhc3Pv
   g4Yk4/rKOW53gFioG6ViziRLlqUczcLmIpQz2JRpDk091BQAql4UljNHh
   g==;
X-CSE-ConnectionGUID: rBsYg2s3SBypivTWQV4Ygg==
X-CSE-MsgGUID: 2sE9eV6ETVGZ4t1c151u/w==
X-IronPort-AV: E=Sophos;i="6.13,300,1732604400"; 
   d="scan'208";a="38313356"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Feb 2025 22:53:19 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 19 Feb 2025 22:53:11 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 19 Feb 2025 22:53:08 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <varshini.rajendran@microchip.com>,
	<javier.carrasco.cruz@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: Dharma Balasubiramani <dharma.b@microchip.com>, Manikandan Muralidharan
	<manikandan.m@microchip.com>
Subject: [PATCH v2] drivers: soc: atmel: fix the args passed to AT91_SOC for sam9x7 SoC
Date: Thu, 20 Feb 2025 11:23:02 +0530
Message-ID: <20250220055302.284558-1-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_215322_884342_A9158DA1 
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

From: Dharma Balasubiramani <dharma.b@microchip.com>

Fix the arguments passed to the AT91_SOC for sam9x7 SoC
updating the SoC revision is skipped since the DBGU Chip ID Register
in sam9x7 SoC does not store the current version of the device.

Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
[manikandan.m@microchip.com: update CIDR Macros, skip updating the SoC
revision]
Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
changes in v2:
- update the version_mask to 0 for sam9x7 SoC to skip upating the SoC revision
- add AT91_CIDR_VALUE_MASK to mask bits 0 to 30 as per the datasheet
- update the SAM9X7_CIDR_MATCH macro
---
 drivers/soc/atmel/soc.c | 42 +++++++++++++++++++++++------------------
 drivers/soc/atmel/soc.h |  4 ++--
 2 files changed, 26 insertions(+), 20 deletions(-)

diff --git a/drivers/soc/atmel/soc.c b/drivers/soc/atmel/soc.c
index 298b542dd1c0..3e0b8ba4f8ba 100644
--- a/drivers/soc/atmel/soc.c
+++ b/drivers/soc/atmel/soc.c
@@ -26,6 +26,7 @@
 #define AT91_CIDR_VERSION_MASK_SAMA7G5	GENMASK(3, 0)
 #define AT91_CIDR_EXT			BIT(31)
 #define AT91_CIDR_MATCH_MASK		GENMASK(30, 5)
+#define AT91_CIDR_VALUE_MASK		GENMASK(30, 0)
 #define AT91_CIDR_MASK_SAMA7G5		GENMASK(27, 5)
 
 static const struct at91_soc socs[] __initconst = {
@@ -102,26 +103,26 @@ static const struct at91_soc socs[] __initconst = {
 		 "sam9x60 8MiB SDRAM SiP", "sam9x60"),
 #endif
 #ifdef CONFIG_SOC_SAM9X7
-	AT91_SOC(SAM9X7_CIDR_MATCH, AT91_CIDR_MATCH_MASK,
-		 AT91_CIDR_VERSION_MASK, SAM9X70_EXID_MATCH,
+	AT91_SOC(SAM9X7_CIDR_MATCH, AT91_CIDR_VALUE_MASK,
+		 0, SAM9X70_EXID_MATCH,
 		 "sam9x70", "sam9x7"),
-	AT91_SOC(SAM9X7_CIDR_MATCH, AT91_CIDR_MATCH_MASK,
-		 AT91_CIDR_VERSION_MASK, SAM9X72_EXID_MATCH,
+	AT91_SOC(SAM9X7_CIDR_MATCH, AT91_CIDR_VALUE_MASK,
+		 0, SAM9X72_EXID_MATCH,
 		 "sam9x72", "sam9x7"),
-	AT91_SOC(SAM9X7_CIDR_MATCH, AT91_CIDR_MATCH_MASK,
-		 AT91_CIDR_VERSION_MASK, SAM9X75_EXID_MATCH,
+	AT91_SOC(SAM9X7_CIDR_MATCH, AT91_CIDR_VALUE_MASK,
+		 0, SAM9X75_EXID_MATCH,
 		 "sam9x75", "sam9x7"),
-	AT91_SOC(SAM9X7_CIDR_MATCH, SAM9X75_D1M_EXID_MATCH,
-		 AT91_CIDR_VERSION_MASK, SAM9X75_EXID_MATCH,
+	AT91_SOC(SAM9X7_CIDR_MATCH, AT91_CIDR_VALUE_MASK,
+		 0, SAM9X75_D1M_EXID_MATCH,
 		 "sam9x75 16MB DDR2 SiP", "sam9x7"),
-	AT91_SOC(SAM9X7_CIDR_MATCH, SAM9X75_D5M_EXID_MATCH,
-		 AT91_CIDR_VERSION_MASK, SAM9X75_EXID_MATCH,
+	AT91_SOC(SAM9X7_CIDR_MATCH, AT91_CIDR_VALUE_MASK,
+		 0, SAM9X75_D5M_EXID_MATCH,
 		 "sam9x75 64MB DDR2 SiP", "sam9x7"),
-	AT91_SOC(SAM9X7_CIDR_MATCH, SAM9X75_D1G_EXID_MATCH,
-		 AT91_CIDR_VERSION_MASK, SAM9X75_EXID_MATCH,
+	AT91_SOC(SAM9X7_CIDR_MATCH, AT91_CIDR_VALUE_MASK,
+		 0, SAM9X75_D1G_EXID_MATCH,
 		 "sam9x75 125MB DDR3L SiP ", "sam9x7"),
-	AT91_SOC(SAM9X7_CIDR_MATCH, SAM9X75_D2G_EXID_MATCH,
-		 AT91_CIDR_VERSION_MASK, SAM9X75_EXID_MATCH,
+	AT91_SOC(SAM9X7_CIDR_MATCH, AT91_CIDR_VALUE_MASK,
+		 0, SAM9X75_D2G_EXID_MATCH,
 		 "sam9x75 250MB DDR3L SiP", "sam9x7"),
 #endif
 #ifdef CONFIG_SOC_SAMA5
@@ -370,8 +371,10 @@ struct soc_device * __init at91_soc_init(const struct at91_soc *socs)
 
 	soc_dev_attr->family = soc->family;
 	soc_dev_attr->soc_id = soc->name;
-	soc_dev_attr->revision = kasprintf(GFP_KERNEL, "%X",
-					   AT91_CIDR_VERSION(cidr, soc->version_mask));
+	if (soc->version_mask)
+		soc_dev_attr->revision = kasprintf(GFP_KERNEL, "%X",
+						   AT91_CIDR_VERSION(cidr, soc->version_mask));
+
 	soc_dev = soc_device_register(soc_dev_attr);
 	if (IS_ERR(soc_dev)) {
 		kfree(soc_dev_attr->revision);
@@ -382,8 +385,11 @@ struct soc_device * __init at91_soc_init(const struct at91_soc *socs)
 
 	if (soc->family)
 		pr_info("Detected SoC family: %s\n", soc->family);
-	pr_info("Detected SoC: %s, revision %X\n", soc->name,
-		AT91_CIDR_VERSION(cidr, soc->version_mask));
+	if (soc->version_mask)
+		pr_info("Detected SoC: %s, revision %X\n", soc->name,
+			AT91_CIDR_VERSION(cidr, soc->version_mask));
+	else
+		pr_info("Detected SoC: %s\n", soc->name);
 
 	return soc_dev;
 }
diff --git a/drivers/soc/atmel/soc.h b/drivers/soc/atmel/soc.h
index 2c78e54255f7..2503a80856bc 100644
--- a/drivers/soc/atmel/soc.h
+++ b/drivers/soc/atmel/soc.h
@@ -44,7 +44,7 @@ at91_soc_init(const struct at91_soc *socs);
 #define AT91SAM9X5_CIDR_MATCH		0x019a05a0
 #define AT91SAM9N12_CIDR_MATCH		0x019a07a0
 #define SAM9X60_CIDR_MATCH		0x019b35a0
-#define SAM9X7_CIDR_MATCH		0x09750020
+#define SAM9X7_CIDR_MATCH		0x09750030
 #define SAMA7G5_CIDR_MATCH		0x00162100
 
 #define AT91SAM9M11_EXID_MATCH		0x00000001
@@ -69,11 +69,11 @@ at91_soc_init(const struct at91_soc *socs);
 
 #define SAM9X70_EXID_MATCH		0x00000005
 #define SAM9X72_EXID_MATCH		0x00000004
+#define SAM9X75_EXID_MATCH		0x00000000
 #define SAM9X75_D1G_EXID_MATCH		0x00000018
 #define SAM9X75_D2G_EXID_MATCH		0x00000020
 #define SAM9X75_D1M_EXID_MATCH		0x00000003
 #define SAM9X75_D5M_EXID_MATCH		0x00000010
-#define SAM9X75_EXID_MATCH		0x00000000
 
 #define SAMA7G51_EXID_MATCH		0x3
 #define SAMA7G52_EXID_MATCH		0x2
-- 
2.25.1


