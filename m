Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20C5B109C04A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 17:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Tg5bMbQcNvXEHMJ/XZQftUyJfYr7HHfwolooZRYnLao=; b=LM7PGBAlQ/ihC1TORVYxfcCjeH
	3ILiPiNDqa5AhTAP+u5Jjek7hnMkyU7jLjXbVrQ40SfeKyc088/MP+ZquVph6gwtO1q52rbKFLkch
	w9cLii9FSnlEN8MgMyvGvjUQ0OMV0TEZslis11NQ769rA2cxfjbHSmzWtKKzcoECiP5khcNQL1jf1
	nWgYi4fdio6xsVeGPt32yusHqLYxRAojwq3bDMkvqO9/6ZhA1EkWV20+y5zkVKo+o40hkIU424UXH
	D9HhXgEtErmkEFl7iYzirmbq+IQchxoggKP/ScttZPZwdiT3o+hVV8t3pklia127AAmW/oN3KSdHp
	qSVaR0KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5SJM-000000040xy-2czy;
	Wed, 25 Mar 2026 17:46:32 +0000
Received: from mail-pl1-x664.google.com ([2607:f8b0:4864:20::664])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5SJK-000000040xc-1O6M
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 17:46:31 +0000
Received: by mail-pl1-x664.google.com with SMTP id d9443c01a7336-2addb31945aso715415ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 10:46:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774460789; x=1775065589;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tg5bMbQcNvXEHMJ/XZQftUyJfYr7HHfwolooZRYnLao=;
        b=d6W2eWF+mFh+WEqH3XaIHtOiKrGbjFXJpTuEV6nP5OQ52EGeMfn2FfiRj+gJGRMGRp
         exCBOoqyUwgvEVWN/EyQwyCboROJm9A1V6sjeZ0p3+f0vpz/bQI9ODJSzzVGS0uPDgOz
         Owkb44x1XxFirBhp0uBc3fmv3xu7rhBlg9KvoOFttapwb1Q9q6Pci9niryW/kj3AZJ2+
         0tRPqcxH1eOqfyC1tZXnDiyEmcblHczNmJy3LP9zrVtVyv4TZYFU5hLr1F1vNWucdZyk
         R21FFO6fGhiqL0i4pH31J9Q3d6Wt+M8XHAsURMx8c6ya/rMp2xVsSuCUgD6n1ym9Q+pt
         5HYw==
X-Gm-Message-State: AOJu0YxY3/9BUbIhMy5uzH261SGX3hosWheHkG5y94vwyHrU7nvtK2LP
	lS59O6N6i1UyRfZkNFMeW/IRLFtQyjsXUuGJPQUJ0ShJ9SDVlS4pa/6N4ltHCGWL5y34fVuuyoD
	YLehUY9YjrSipv2PYoyyvmnoYvDZrI57lx6WAch1GbUuUC5lyY1+Vh4hj6O7/P469/6C750OicD
	5UhsKEA4GNyyOI7qy04gTo6PzzObBM3LxlgwN+Pnemtnh7PBQYn9oSDTl8za2xNSLVlW0+SBep+
	1/f7GIPOER3piUZ1u7eHzbXj2DN
X-Gm-Gg: ATEYQzwi73tj1P+2Y2oBQuVUrMh4MfDcgkSG2lHrHjEOtCPQxPTm06Suh3MHxPL9xoB
	QRa5giZPMFK6luTTlMA6kaL81h7T/cf86BhMxkLAUC2zcshOJ3/Yj2qcuXizhv9qLK6a7oEZHz5
	Cqh5TKB0scKbLIn17HzsOYVoSGEzxBkCW/mBafKVMWaI6gTSTAHoRM0/EjH4MvKhWoT7jiwgsmv
	kjE9Xlf43TTM1+2BjFQDzKoWY3T1lJ1aBXKL6MTvD5YMRGO4T/kG9V7LYqzuPW1Fr68AesYhB/j
	gehtFYv1Dm+hMnuN4mDl2Kn/PBOWWnp6HlIyzU8cIypJ4q/osOnsLTuiwZMkf+4IkLDX/PCR0ZS
	FEjGbjZhtxeIPgUiHsZRo+wWFgT1M9TAweZmOz3qid/1866GkeddQNGBP9HaqjrnWGv4cTv8O5p
	DVC3IEq6Dkid+YyhHsgr+yzoDRBrXsRoixWMn4xzXO6Ptskeeo4MfFSag=
X-Received: by 2002:a17:903:1666:b0:2b0:6475:73d0 with SMTP id d9443c01a7336-2b0b09f3844mr47346185ad.12.1774460789067;
        Wed, 25 Mar 2026 10:46:29 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-12.dlp.protect.broadcom.com. [144.49.247.12])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2b0bc8bfdbdsm585995ad.47.2026.03.25.10.46.28
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Mar 2026 10:46:29 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89cc2d5ffcaso4722626d6.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 10:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1774460787; x=1775065587; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tg5bMbQcNvXEHMJ/XZQftUyJfYr7HHfwolooZRYnLao=;
        b=OgLcPOl/QNsmDufUwg2/lSrlnzFS6Mr6HvVWK+4tFC/Rq/f8m6Ki1x17owNHgqmBHj
         8t/n/Tzwbn9yBoUsAxwbq990t0aYQKH3toD9Ea28X7S2QF3C5BJylw8R9hFDd3LOwTT2
         4Uo+DCUq975jHQaugKkUx8dOwVK4oW5Q0B2yg=
X-Received: by 2002:a05:6214:611b:b0:89c:d639:e7bd with SMTP id 6a1803df08f44-89cd63a055dmr2876946d6.31.1774460787363;
        Wed, 25 Mar 2026 10:46:27 -0700 (PDT)
X-Received: by 2002:a05:6214:611b:b0:89c:d639:e7bd with SMTP id 6a1803df08f44-89cd63a055dmr2876286d6.31.1774460786604;
        Wed, 25 Mar 2026 10:46:26 -0700 (PDT)
Received: from stbsdo-bld-1.sdg.broadcom.net ([192.19.161.248])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89cd5aa2275sm2551636d6.43.2026.03.25.10.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 10:46:26 -0700 (PDT)
From: justin.chen@broadcom.com
To: linux-arm-kernel@lists.infradead.org
Cc: kees@kernel.org,
	bcm-kernel-feedback-list@broadcom.com,
	florian.fainelli@broadcom.com,
	Justin Chen <justin.chen@broadcom.com>
Subject: [PATCH] soc: brcmstb: consolidate initcall functions
Date: Wed, 25 Mar 2026 10:46:19 -0700
Message-Id: <20260325174619.3761964-1-justin.chen@broadcom.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_104630_378734_D5E42739 
X-CRM114-Status: GOOD (  18.03  )
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

From: Justin Chen <justin.chen@broadcom.com>

Merge the separate early_initcall and arch_initcall functions into a
single early_initcall. This is possible thanks to commit 6e12db376b60
("base: soc: Allow early registration of a single SoC device"), which
allows soc_device_register() to be called during early_initcall by
deferring the actual registration until the soc_bus is ready.

Replace static family_id/product_id variables with a dynamically
allocated brcmstb_soc_info structure.

Signed-off-by: Justin Chen <justin.chen@broadcom.com>
---
 drivers/soc/bcm/brcmstb/common.c | 88 +++++++++++++++++---------------
 1 file changed, 46 insertions(+), 42 deletions(-)

diff --git a/drivers/soc/bcm/brcmstb/common.c b/drivers/soc/bcm/brcmstb/common.c
index 2da79bd42930..7be0374f5943 100644
--- a/drivers/soc/bcm/brcmstb/common.c
+++ b/drivers/soc/bcm/brcmstb/common.c
@@ -11,18 +11,22 @@
 #include <linux/soc/brcmstb/brcmstb.h>
 #include <linux/sys_soc.h>
 
-static u32 family_id;
-static u32 product_id;
+struct brcmstb_soc_info {
+	u32 family_id;
+	u32 product_id;
+};
+
+static struct brcmstb_soc_info *soc_info;
 
 u32 brcmstb_get_family_id(void)
 {
-	return family_id;
+	return soc_info ? soc_info->family_id : 0;
 }
 EXPORT_SYMBOL(brcmstb_get_family_id);
 
 u32 brcmstb_get_product_id(void)
 {
-	return product_id;
+	return soc_info ? soc_info->product_id : 0;
 }
 EXPORT_SYMBOL(brcmstb_get_product_id);
 
@@ -40,10 +44,12 @@ static const struct of_device_id sun_top_ctrl_match[] = {
 	{ }
 };
 
-static int __init brcmstb_soc_device_early_init(void)
+static int __init brcmstb_soc_device_init(void)
 {
+	struct soc_device_attribute *soc_dev_attr;
 	struct device_node *sun_top_ctrl;
 	void __iomem *sun_top_ctrl_base;
+	struct soc_device *soc_dev;
 	int ret = 0;
 
 	/* We could be on a multi-platform kernel, don't make this fatal but
@@ -51,63 +57,61 @@ static int __init brcmstb_soc_device_early_init(void)
 	 */
 	sun_top_ctrl = of_find_matching_node(NULL, sun_top_ctrl_match);
 	if (!sun_top_ctrl)
-		return ret;
+		return 0;
 
 	sun_top_ctrl_base = of_iomap(sun_top_ctrl, 0);
 	if (!sun_top_ctrl_base) {
 		ret = -ENODEV;
-		goto out;
+		goto out_put_node;
 	}
 
-	family_id = readl(sun_top_ctrl_base);
-	product_id = readl(sun_top_ctrl_base + 0x4);
-	iounmap(sun_top_ctrl_base);
-out:
-	of_node_put(sun_top_ctrl);
-	return ret;
-}
-early_initcall(brcmstb_soc_device_early_init);
-
-static int __init brcmstb_soc_device_init(void)
-{
-	struct soc_device_attribute *soc_dev_attr;
-	struct device_node *sun_top_ctrl;
-	struct soc_device *soc_dev;
-	int ret = 0;
+	soc_info = kzalloc(sizeof(*soc_info), GFP_KERNEL);
+	if (!soc_info) {
+		ret = -ENOMEM;
+		goto out_unmap;
+	}
 
-	/* We could be on a multi-platform kernel, don't make this fatal but
-	 * bail out early
-	 */
-	sun_top_ctrl = of_find_matching_node(NULL, sun_top_ctrl_match);
-	if (!sun_top_ctrl)
-		return ret;
+	soc_info->family_id = readl(sun_top_ctrl_base);
+	soc_info->product_id = readl(sun_top_ctrl_base + 0x4);
 
 	soc_dev_attr = kzalloc_obj(*soc_dev_attr);
 	if (!soc_dev_attr) {
 		ret = -ENOMEM;
-		goto out;
+		goto out_free_info;
 	}
 
 	soc_dev_attr->family = kasprintf(GFP_KERNEL, "%x",
-					 family_id >> 28 ?
-					 family_id >> 16 : family_id >> 8);
+					 soc_info->family_id >> 28 ?
+					 soc_info->family_id >> 16 : soc_info->family_id >> 8);
 	soc_dev_attr->soc_id = kasprintf(GFP_KERNEL, "%x",
-					 product_id >> 28 ?
-					 product_id >> 16 : product_id >> 8);
+					 soc_info->product_id >> 28 ?
+					 soc_info->product_id >> 16 : soc_info->product_id >> 8);
 	soc_dev_attr->revision = kasprintf(GFP_KERNEL, "%c%d",
-					 ((product_id & 0xf0) >> 4) + 'A',
-					   product_id & 0xf);
+					 ((soc_info->product_id & 0xf0) >> 4) + 'A',
+					   soc_info->product_id & 0xf);
 
 	soc_dev = soc_device_register(soc_dev_attr);
 	if (IS_ERR(soc_dev)) {
-		kfree(soc_dev_attr->family);
-		kfree(soc_dev_attr->soc_id);
-		kfree(soc_dev_attr->revision);
-		kfree(soc_dev_attr);
-		ret = -ENOMEM;
+		ret = PTR_ERR(soc_dev);
+		goto out_free_attr;
 	}
-out:
+
+	iounmap(sun_top_ctrl_base);
+	of_node_put(sun_top_ctrl);
+	return 0;
+
+out_free_attr:
+	kfree(soc_dev_attr->revision);
+	kfree(soc_dev_attr->soc_id);
+	kfree(soc_dev_attr->family);
+	kfree(soc_dev_attr);
+out_free_info:
+	kfree(soc_info);
+	soc_info = NULL;
+out_unmap:
+	iounmap(sun_top_ctrl_base);
+out_put_node:
 	of_node_put(sun_top_ctrl);
 	return ret;
 }
-arch_initcall(brcmstb_soc_device_init);
+early_initcall(brcmstb_soc_device_init);
-- 
2.34.1


