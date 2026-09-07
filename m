Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB939C79FA3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 15:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VkAqAr7Z12LCHxwZegG/ZILA0Oydr34Y894kuKUR6C0=; b=yJ6AsasI67pl3gwI+zq7+23Pl5
	q6H8jhFjVTqZiHJMQpZZp7lsI0WQy+NTP70LwmqWYKqZfzM5u/BZfONVXmS2wU64nC6cxWZeBqebZ
	o2mO3rPWYKHdjkhljt5l+gbUkHYgEO1o5qY5IwndVISO1Vhz9lxVtnpoMCjplbgbTmuIkUP2GiUq0
	V1+p3eHHz0gyeWBIu0KVrVmUEHRkOJGmwlQi8QyeH+5KFdaVqAEKPeQdoMPqEc9cpztmp/xEqXLZ9
	SQp3p8S3PnOyanOIaPqTYKv2TecpZPN19tZS9O9Q3B3zpnH5suR/AWPDPSk+HzQxpdR6nGgXzJ+tR
	bJv22k2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3b71-000000078Er-1f2H;
	Mon, 07 Sep 2026 15:18:23 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3b6v-000000078BB-00ee
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 15:18:18 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-7f84a55cc06so2630206a34.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 08:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1788794296; x=1789399096; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VkAqAr7Z12LCHxwZegG/ZILA0Oydr34Y894kuKUR6C0=;
        b=YjOiQMDVSCX9CKc9t1p8/GuOQP5A8uDamSesY+pNBkOQ3IxRPOZxfBHItJ9VkQKaxb
         9NyzqLKowMAk9muX0IcHXP0Azq9f2QWH7stqTVHo0KHmkstfODHyBvWX8l2LMyOkh1ar
         6YgvnZPFRVhcTbl/8vwBDINR+X2Jm2Im9a7FQZr6PmMSBD+rEZPJAaxH8lA6sr2+pyy8
         ZjX4H/r9Q75dpu58hJH3DsltE/6CsbJ+JPj6Id0YhRBg7vnB8NIB635MawjihxEBvlNk
         AOyVZfiJ7/+Uu3Y5Vjh+frQ6LUqb0v3ByNUW7ajyZ0VUvs7MU6ieD7MCdd9CE9Pzx40Q
         IivQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788794296; x=1789399096;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VkAqAr7Z12LCHxwZegG/ZILA0Oydr34Y894kuKUR6C0=;
        b=df6oDzx5Htf44X6tY4AKTVZGEGyntJ8E0ONzI1wmdy7Q749jtcPmPDgr1R7l0TydM+
         BA60+qLTEAJSew+hndqPD+uCEuH75AKJAiF3fI+RblVYNR05lJLzw85YjK8vRBC1BpKa
         yx6ZtAYte1TVZTZQ8y5xUMO3VNsfBbtILPYeCyx7lwHBcIqZsbzIREZBCd/3j+O77mAM
         qYDjbrJYxbNMNGj7hK+DeFdLffuow9hrZxg+4AbG969KTOm6DeH4qlJnm/2QCjT75Txg
         Y0nD2tHv4oq0Pn+Y+YuIaf8g20k2IciP4IPpLDXCXD0IUM8qZHA5y4tf4oCXdquThti4
         3URg==
X-Forwarded-Encrypted: i=1; AKwUvBye23ElVxPVjVQc3UzFVZ2j8c2AaB3AjXc4JPUZyspx2vZcJEjcaDnrbTgyldCxRIogGy0h4KTTGrwwNLrGlCfP@lists.infradead.org
X-Gm-Message-State: AFuF++krH/trqrkBtmeD7ksLBLjyeXfTqu5p+0c+ah4LG5xRT/wevlYv
	DnhPrFxM/oqQPArprL7vf7XCKNJWoZlIlf6Z9XUcE9DNlosjO8njXpc/zODLxnYeROI=
X-Gm-Gg: AYBFou02p7/U2p1AFzx4cMVD5snpZtPbR26c15NPobgi9XFVPaLi2JTXLD8haURCWJi
	/6eU3eMDPpvbanCs/aIslOH/HtRy5ibVqhBKJim5s/3QUqMXAJuoK5PXZpmGKC+PqkPZweZH+Qz
	El5ycx7Q8SvCaeERX3dvD0sLzNKV9XN21L5fhP+X2Z9QOG7J0+ftqj82h/dn/fBbblyuE04RcRe
	0dq/Tjj13xTiNWpr8641AqWd1LasRKGTGfnFAvyAf+HLNUTgM9yz4B597hgppUKvReYsI14Vg5Z
	3UYFaNn9rpFSE9TwyVooZwx2QamNQbVmYIIBXcFgPLF94dYiOOBegWsLpooNliDjdSOdfb6Kkxp
	Jg+H+MS3igihyh/blYt1ja/bEECTKzCTjHPSLuS9Hu0eBogdisfC8k9bzKS0ldlZSPGX43dNE1w
	39rRDUxFQecvnYbkqYpYTnwF1fNP4KEKzR8epyZLXTUnNm/IOTbYk5u59WbhGAXyuwNgaiZupzL
	NqbIg==
X-Received: by 2002:a05:6820:4df7:b0:6a1:4507:3544 with SMTP id 006d021491bc7-6b6fd7c9e58mr12538158eaf.28.1788794296030;
        Mon, 07 Sep 2026 08:18:16 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:9f74:2a4b:1c38:e2d8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435648esm33474770c88.5.2026.09.07.08.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 08:18:15 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Mon, 07 Sep 2026 16:17:46 +0100
Subject: [PATCH v2 4/4] dma: xgene-dmac: use named initializers for
 acpi_device_id
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-acpi-dma-v2-4-0ffe4a007992@thegoodpenguin.co.uk>
References: <20260907-acpi-dma-v2-0-0ffe4a007992@thegoodpenguin.co.uk>
In-Reply-To: <20260907-acpi-dma-v2-0-0ffe4a007992@thegoodpenguin.co.uk>
To: Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, Sinan Kaya <okaya@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788794281; l=1050;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=BNXdpYcV6rP8Kzo2tOByWtdS1/BlwS7HT763SKS2iMA=;
 b=je0Q/Lb8ErmaZ8GdkEHJKU6dpuWT1QFFnOIu2k51oXK8LE5wRyQGaRgXY6JQ8isasnAQDA+Qm
 6/xLWprafnpBIJxN0OmBP0LngcoNeY1WMh/YEBdL7MX14FsKewoV36/
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_081817_048702_27E1807A 
X-CRM114-Status: GOOD (  14.11  )
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

Use a designated initializer for the acpi_device_id fields which makes the
code more readable and consistent with how lists are initialized in the
rest of the kernel code base. Also drop explicitly setting fields to 0
where it is redundant.

Unify the list terminator to have a single space between the brackets and
no trailing comma.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/dma/xgene-dma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/xgene-dma.c b/drivers/dma/xgene-dma.c
index fa1173e49900..8d1c58ca0d48 100644
--- a/drivers/dma/xgene-dma.c
+++ b/drivers/dma/xgene-dma.c
@@ -1800,8 +1800,8 @@ static void xgene_dma_remove(struct platform_device *pdev)
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id xgene_dma_acpi_match_ptr[] = {
-	{"APMC0D43", 0},
-	{},
+	{ .id = "APMC0D43" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, xgene_dma_acpi_match_ptr);
 #endif

-- 
2.43.0


