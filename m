Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E56DC02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 03:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ZtwwLK7UbW+7SeKV2tsQ5uK6rRg+ZSYyqZGaCPCC0I=; b=3DXrflHFgCV45FukbEvzqt4t4N
	/wTuPa9vyeSFGKM0u4XWtzY7YGnZASOY6q0BShb8Yun9QrXOP56grRzX95SPfmLtriaynJp53ygr6
	9UPyg7eNhPEWsYThMEGSZtRmwJmdKMgOtKlgsbtkqeZQrO7NbIoE+dau9RiGmUch0ae0Er/MzAMmm
	h/tjCVZyMD9SdAgwaHueTJdTmWrIrvQEu80VQdsL65JFfLxw+Ax+w1TyMXd57QBk71Y6hELrkvUw0
	Xonoit+lz9cgdnEhwyxhwKLwOPPlNuiW1pBgg1BvX/5fwiCGdhhdwltsM6F76wDOJVbbH1qKz9JJB
	vfwya4jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfVw8-00000002DKH-2vP7;
	Wed, 05 Feb 2025 03:18:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfVsN-00000002CjV-40sR
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Feb 2025 03:14:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=1ZtwwLK7UbW+7SeKV2tsQ5uK6rRg+ZSYyqZGaCPCC0I=; b=qX37tJT8FOfBQEu7h4Oa2vmzl2
	ssMLb7beu08wOU6l+/jq8CDgWwzRj9QcBzfXF9PiIOQzgr+95ueffRPQlxSksQfNiBgwyQ23zA595
	gFUFPkTnJf8w5XsG/HVLrQ+XDjY/Ah3HXGy7SL3riCMlOzXx2SJO9Iz5Tg4mLNseK3KDGiZtFtxmy
	1ry+DMsaWyZlkF2narH/FW54WJlbCY3BclBKdRloxnnQgVbqhIHKxEgUNAot2UEerdZpDnZBWTakl
	C0dLPHUPLs54zd/ekPRdgG9EOtsm3aCqgeBXKoGvQtBw4SDWHTNC63scE3ELEQtbzy/mQ+jc2gRug
	da5gX1JQ==;
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfVsJ-0000000GXCt-2HFX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 03:14:54 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-21effc750d2so24802105ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Feb 2025 19:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1738725285; x=1739330085; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ZtwwLK7UbW+7SeKV2tsQ5uK6rRg+ZSYyqZGaCPCC0I=;
        b=JMEG3VQHiYYz3/SwYMNeHcxMpFES4wGTH4e3Zk2AJpCfqPr2iKrvuEHwRSZqX0ipgx
         SnXWKmliWFsMaacybot+GBaI3KOGJVzHu24r8jQf3KO8V5tJV7g1rVpup0gQLeu8lNXN
         gcYorFCpN8V2oEB5nXd0PA+FA+AxQFxD0I+btoAfmQW0h/SK/aR7W8DWFueaiif2VnLl
         jWtgqtuC9Myfnn7mel2qLCbSEbhzfnKA3KkHRGhdhkFJcYCvRnaHaNyxQeQpaOY+a+Kc
         g+l8k38t4aRdDwPKlCmPFJGg3TqmqzekkKwgBVwmQBYszm9ZQnPLo5ABuq+5AYijiwvS
         2CeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738725285; x=1739330085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ZtwwLK7UbW+7SeKV2tsQ5uK6rRg+ZSYyqZGaCPCC0I=;
        b=oP6/2G6WW0ctvQf9nm83kuCtwGvmsgo2WkjC8kX1KQbtLUmdyRaWX3nFF8vZR+jioF
         VU/erQGgwGwtv23yL2svjj6nGKYJKuEpxEJ1I6JlZxiyaKiKfQaSWP3tj2FLPDyE3zjB
         8P3xOmXlnXL8Xsc9hGtGknkQk4oFpnyVxbIDac14P60x1blcxpOqgB9wdLLtfGiOQ0Oo
         MfXZuRF+P4DjPbyv+oOtvz06az7yRE3uzRzi1cx++VM518RC+JQO+v2Sx6hdsYtp85JG
         fTeYoDiSFh151LQFsVw/5rG0Miq51MzrkgfTHadjASRVSZ+AezgrwDb4iCPdBybTp99/
         zbkg==
X-Forwarded-Encrypted: i=1; AJvYcCUXXGHuHbhQFWWRuOUfM36P2qNXDUU+vabnnFdRspx4zFT1kMpj5edFXhuzjNq8fqsUxbYZmyZDRKrIov4fJqLi@lists.infradead.org
X-Gm-Message-State: AOJu0YxaL2vW+hO396cucdQa5iMy+T42UAsrA/rzPPvsGNhspTnVcKqz
	vbDmiAhzeGPkcsRGTGi8ywl23hekdAzfm6hjmrl7jHZsyJlCozsGRXOqRpZ/RJ4=
X-Gm-Gg: ASbGncsscPcaKhaIRT6OZ9faPqRij44oBzi1GCxBw6NhbBXcclf5WIh5sYfgYn+kPTi
	E2S8571Vu5QATVuwFP3HIuHclJElUUQIa6z0Uq8K3JHZC1cp2bgQU/tfXSgqLzxRXNSxO9BLmzX
	PRWIRRNsDwlw34Ks09m4l7XMg08YhqvFnOHXuy1MCHbCsfARG+vgf8A6fWIFjvkK9HLo/tI4fNW
	Nen87iaIVGDYfGK0wSD2V9Hzf7k2KfCdEGucq/PBuxNq6zIMbu/dOFtpOoDlcDvJ2YGK2CxtIqN
	vDV1xhNJb1gU+H+T0HWr6oXiAdv7bnBZUEhFTyGRjfbNcFKsSw==
X-Google-Smtp-Source: AGHT+IGvs9YlJSJ4IV1c8mfZKeNsIc8mGiu0UvBJnVQ8jcswFf6SnQ+8jYxvoQNAtQ8+6zh7iONi5A==
X-Received: by 2002:a17:902:ecc1:b0:205:4721:19c with SMTP id d9443c01a7336-21f17eb9bb1mr16527375ad.37.1738725285599;
        Tue, 04 Feb 2025 19:14:45 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de330342asm103509115ad.193.2025.02.04.19.14.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 04 Feb 2025 19:14:44 -0800 (PST)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: xueshuai@linux.alibaba.com,
	renyu.zj@linux.alibaba.com,
	will@kernel.org,
	mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Yunhui Cui <cuiyunhui@bytedance.com>
Subject: [PATCH v2 2/2] perf/dwc_pcie: fix duplicate pci_dev devices
Date: Wed,  5 Feb 2025 11:14:25 +0800
Message-Id: <20250205031425.67265-3-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20250205031425.67265-1-cuiyunhui@bytedance.com>
References: <20250205031425.67265-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_031452_478333_73A80262 
X-CRM114-Status: GOOD (  15.17  )
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

During platform_device_register, wrongly using struct device
pci_dev as platform_data caused a kmemdup copy of pci_dev. Worse
still, accessing the duplicated device leads to list corruption as its
mutex content (e.g., list, magic) remains the same as the original.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 drivers/perf/dwc_pcie_pmu.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/perf/dwc_pcie_pmu.c b/drivers/perf/dwc_pcie_pmu.c
index 4ac53167d7ab..fd9d87b4f201 100644
--- a/drivers/perf/dwc_pcie_pmu.c
+++ b/drivers/perf/dwc_pcie_pmu.c
@@ -566,9 +566,7 @@ static int dwc_pcie_register_dev(struct pci_dev *pdev)
 	u32 sbdf;
 
 	sbdf = (pci_domain_nr(pdev->bus) << 16) | PCI_DEVID(pdev->bus->number, pdev->devfn);
-	plat_dev = platform_device_register_data(NULL, "dwc_pcie_pmu", sbdf,
-						 pdev, sizeof(*pdev));
-
+	plat_dev = platform_device_register_simple("platform_dwc_pcie", sbdf, NULL, 0);
 	if (IS_ERR(plat_dev))
 		return PTR_ERR(plat_dev);
 
@@ -620,18 +618,26 @@ static struct notifier_block dwc_pcie_pmu_nb = {
 
 static int dwc_pcie_pmu_probe(struct platform_device *plat_dev)
 {
-	struct pci_dev *pdev = plat_dev->dev.platform_data;
+	struct pci_dev *pdev;
 	struct dwc_pcie_pmu *pcie_pmu;
 	char *name;
 	u32 sbdf;
 	u16 vsec;
 	int ret;
 
+	sbdf = plat_dev->id;
+	pdev = pci_get_domain_bus_and_slot(sbdf >> 16, PCI_BUS_NUM(sbdf & 0xffff),
+					   sbdf & 0xff);
+	if (!pdev) {
+		pr_err("No pdev found for the sbdf");
+		return -ENODEV;
+	}
+
 	vsec = dwc_pcie_des_cap(pdev);
 	if (!vsec)
 		return -ENODEV;
 
-	sbdf = plat_dev->id;
+	pci_dev_put(pdev);
 	name = devm_kasprintf(&plat_dev->dev, GFP_KERNEL, "dwc_rootport_%x", sbdf);
 	if (!name)
 		return -ENOMEM;
@@ -646,7 +652,7 @@ static int dwc_pcie_pmu_probe(struct platform_device *plat_dev)
 	pcie_pmu->on_cpu = -1;
 	pcie_pmu->pmu = (struct pmu){
 		.name		= name,
-		.parent		= &pdev->dev,
+		.parent		= &plat_dev->dev,
 		.module		= THIS_MODULE,
 		.attr_groups	= dwc_pcie_attr_groups,
 		.capabilities	= PERF_PMU_CAP_NO_EXCLUDE,
@@ -733,7 +739,7 @@ static int dwc_pcie_pmu_offline_cpu(unsigned int cpu, struct hlist_node *cpuhp_n
 
 static struct platform_driver dwc_pcie_pmu_driver = {
 	.probe = dwc_pcie_pmu_probe,
-	.driver = {.name = "dwc_pcie_pmu",},
+	.driver = {.name = "platform_dwc_pcie",},
 };
 
 static void dwc_pcie_cleanup_devices(void)
-- 
2.39.2


