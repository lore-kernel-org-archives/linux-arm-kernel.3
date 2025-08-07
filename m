Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C14AC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 22:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IxkJSvKRuzPA9t8eldc0BIsl4eC3AOj1pVeWGxFhkCE=; b=Cvef6wT4BRlL3m4W4k01FQnRss
	nmLPdqMfUEbdFnmIUgNVI6b7yLWt6QVUJ9HLHWWJ8Sp95bpOZHErztv+ENI0zJODbpoYeU8ICyb7J
	AzXgSkXQdJxxLlWlSI4BjSYhCsFkvj7gyB9XL+Y1SmYbdI68Xfrm7WK78SR+vbqyQ9KfiLC78dAro
	y4HXh4DttOde+lL9BIv9W2uW5K+CgcozRZvfjpIhOv1kjLnjJw0lWVjR7tHnm6c2mDBAED+ZIfmCy
	/CVdy4baHPGn9PQ68+rql5kVUFxNjhd8DfG07diD2QbJkLhVOB/BhvD1TbFpyJar/hu2diyDKtL5i
	WCP+jtiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk9Xb-00000001er9-3JPa;
	Thu, 07 Aug 2025 22:56:55 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk9Sf-00000001eOi-0sdk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 22:51:50 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 577Mpd6j455842;
	Thu, 7 Aug 2025 17:51:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754607099;
	bh=IxkJSvKRuzPA9t8eldc0BIsl4eC3AOj1pVeWGxFhkCE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=oGRfFef8uj+phBfLv7KTgfXqCDd0f/QDYUvrrGySRTlSj4NULKGRiPjqsgDV99WDU
	 EaE9nyCwlQ8AuyTTJRIlrC8jgKu1t+33houO3G+ejhWeSnomAdsANx+b3+m9wMCYVO
	 9zEAMgXTq7YQxkzMuGF5tRRczY1Ki8f3c2MjybJo=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 577MpdSF1137035
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 7 Aug 2025 17:51:39 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 7
 Aug 2025 17:51:38 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 7 Aug 2025 17:51:38 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 577MpcBk2086622;
	Thu, 7 Aug 2025 17:51:38 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Adrian Hunter <adrian.hunter@intel.com>,
        Ulf
 Hansson <ulf.hansson@linaro.org>, Nishanth Menon <nm@ti.com>,
        Santosh
 Shilimkar <ssantosh@kernel.org>
CC: <linux-mmc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, Andrew Davis <afd@ti.com>
Subject: [PATCH v2 1/2] soc: ti: k3-socinfo: Add support for AM62P variants
Date: Thu, 7 Aug 2025 17:51:37 -0500
Message-ID: <20250807225138.1228333-2-jm@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250807225138.1228333-1-jm@ti.com>
References: <20250807225138.1228333-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_155149_337085_22B4A8D9 
X-CRM114-Status: GOOD (  15.85  )
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

This adds a support for detecting AM62P SR1.0, SR1.1, SR1.2.

On AM62P, silicon revision is discovered with GP_SW1 instead of JTAGID
register, so read GP_SW1 to determine SoC revision only on AM62P.

Signed-off-by: Judith Mendez <jm@ti.com>
---
 drivers/soc/ti/k3-socinfo.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/ti/k3-socinfo.c b/drivers/soc/ti/k3-socinfo.c
index d716be113c84..81d078f15cd2 100644
--- a/drivers/soc/ti/k3-socinfo.c
+++ b/drivers/soc/ti/k3-socinfo.c
@@ -15,6 +15,9 @@
 #include <linux/sys_soc.h>
 
 #define CTRLMMR_WKUP_JTAGID_REG		0
+#define CTRLMMR_WKUP_GP_SW1_OFFSET		544
+#define GP_SW1_MOD_OPR				16
+
 /*
  * Bits:
  *  31-28 VARIANT	Device variant
@@ -66,6 +69,10 @@ static const char * const j721e_rev_string_map[] = {
 	"1.0", "1.1", "2.0",
 };
 
+static const char * const am62p_gpsw_rev_string_map[] = {
+	"1.0", "1.1", "1.2",
+};
+
 static int
 k3_chipinfo_partno_to_names(unsigned int partno,
 			    struct soc_device_attribute *soc_dev_attr)
@@ -83,7 +90,7 @@ k3_chipinfo_partno_to_names(unsigned int partno,
 
 static int
 k3_chipinfo_variant_to_sr(unsigned int partno, unsigned int variant,
-			  struct soc_device_attribute *soc_dev_attr)
+			  struct soc_device_attribute *soc_dev_attr, u32 gp_sw1)
 {
 	switch (partno) {
 	case JTAG_ID_PARTNO_J721E:
@@ -92,6 +99,14 @@ k3_chipinfo_variant_to_sr(unsigned int partno, unsigned int variant,
 		soc_dev_attr->revision = kasprintf(GFP_KERNEL, "SR%s",
 						   j721e_rev_string_map[variant]);
 		break;
+	case JTAG_ID_PARTNO_AM62PX:
+		/* Always parse AM62P variant from GP_SW1 */
+		variant = gp_sw1 % GP_SW1_MOD_OPR;
+		if (variant >= ARRAY_SIZE(am62p_gpsw_rev_string_map))
+			goto err_unknown_variant;
+		soc_dev_attr->revision = kasprintf(GFP_KERNEL, "SR%s",
+						   am62p_gpsw_rev_string_map[variant]);
+		break;
 	default:
 		variant++;
 		soc_dev_attr->revision = kasprintf(GFP_KERNEL, "SR%x.0",
@@ -121,6 +136,7 @@ static int k3_chipinfo_probe(struct platform_device *pdev)
 	struct soc_device *soc_dev;
 	struct regmap *regmap;
 	void __iomem *base;
+	u32 gp_sw1_val = 0;
 	u32 partno_id;
 	u32 variant;
 	u32 jtag_id;
@@ -163,7 +179,14 @@ static int k3_chipinfo_probe(struct platform_device *pdev)
 		goto err;
 	}
 
-	ret = k3_chipinfo_variant_to_sr(partno_id, variant, soc_dev_attr);
+	if (partno_id == JTAG_ID_PARTNO_AM62PX) {
+		ret = regmap_read(regmap, CTRLMMR_WKUP_JTAGID_REG +
+				  CTRLMMR_WKUP_GP_SW1_OFFSET, &gp_sw1_val);
+		if (ret < 0)
+			goto err;
+	}
+
+	ret = k3_chipinfo_variant_to_sr(partno_id, variant, soc_dev_attr, gp_sw1_val);
 	if (ret) {
 		dev_err(dev, "Unknown SoC SR[0x%08X]: %d\n", jtag_id, ret);
 		goto err;
-- 
2.49.0


