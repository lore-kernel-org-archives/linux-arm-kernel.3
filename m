Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3CF4C02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 07:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=akq5KXNO6yQt2g32XEbXQyeThszQvcySRASydOxEc/Y=; b=A7Nt7C+qCnaI0UDHaCqYvIArNO
	vjTlmF18+qaCL7tlrqYTMb7AehDeoTcScsjxyhi1NZjoRmUnPUVjToObOK8+2J7yMbL+QUazjf+7i
	2d9v2k/nXSz2AnaQoRnGD+8cr3/jXfBDQTkAOE4sjazMv3jlbOWmLKb2Nybz88965FciVYxDzGF1m
	mRqX2JGAX+93trNrZv94LVgKboyWUNrTiC7zdnAD3zoAJUWCYPjfz54Pf3FmBWhrdu1QO2QCbW/eC
	dnBKmb4xoZPNXqIs6bC8wo8z4DsYuJGMzggq41CSlCvi4v5R5JmjjAbELPVJYKLNC3oF1M2ohmzrV
	ExSpQQQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taryZ-0000000BuVY-0TUb;
	Thu, 23 Jan 2025 07:50:07 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tarxG-0000000BuOw-2zgF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 07:48:48 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-2ef70c7efa5so957723a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jan 2025 23:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1737618522; x=1738223322; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=akq5KXNO6yQt2g32XEbXQyeThszQvcySRASydOxEc/Y=;
        b=V7HuwV7T5wtNtDm1+66FNXIeOMtPT6DsD0Te41yWnqnwn6F09mCLUt/W6LRfIvuJqD
         yCYeFdaLelVOI0Xl+BC4U9FhMr3n1ZR4tlcr/EcuKPTOqN5Vcr+5keTBYwTOPskdUmna
         ZRiEWwiI/x6K7VlLScqbPJxbuceONflICq08fr7VSW7U7pzKz9Qok8+bwnbPm6PTT1Yy
         JE9yrt0lW9kHYNYpzrmLf2ccOltQ3kpQ8UVUaix0Wzb8fgvsjbqzrJmFgTRxdhiB54Xi
         +A6t4dksXvyc/QCv8pvjHqA5WHotHy+JSgQszclD7/X9SpD6QLXLxbkSiytNxX8T7npY
         XLLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737618522; x=1738223322;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=akq5KXNO6yQt2g32XEbXQyeThszQvcySRASydOxEc/Y=;
        b=wh/DVaW5Mo4YiMoO+UFKIHXRHP3MlylmBoFiCgJCYN2COKdZDc/9coIcgMwUMc6ky9
         fJebN39mNFPNGJ8mleZ+Hs+kyBSBDC4DSdg6gygeMHsf1tTSK2rjDHuENv5TRj+too3y
         3RyQ1Ofeezh1cMqF0JLpOB3YuGoocwi1d4x9LjY4OjJNtJxwfwn31KKx9G5loAsuheVr
         DRrOV8z/9vTVokjyDG4/uEtnR3NA+9Uk0tlr2WeKrbXiZIlVZ30xlxDVCpsHmT6ofAvp
         Tr2/dPrYPGufnhW+By16RVAxxDrg0AZEiG7H4C5LxzdMPYDZzE6IpwQ73NbNsx9Q8pDc
         6bWw==
X-Forwarded-Encrypted: i=1; AJvYcCX3BxA2m7HMkxWBUrr05LHRb4n1y2MY34ewiuSb19eqAYGBCCu3RzY2ChLNfgbfluM8dwbYrCrdEDlpOdWw2tYr@lists.infradead.org
X-Gm-Message-State: AOJu0YyjAUeJDVF69pstqa1WtSx+VHgu0leLihEmBVLVjJ/Rrnj4WTkG
	0nrQKL7QTAmIKfcRe0SXAZWXJaaf0tnLZIrN5q3aVHkpehAyRGNSovmsuexSezo=
X-Gm-Gg: ASbGncsv3Viu59wIB5u3NrquNOUShVrfpa2GfPzWl5sxvx4kcXoK3G55mLoUvLifOgm
	ZMT1iY2pfCwmDnlfV2NXlI788TWO7x/AGMRc1oSS1SaDRuc63cpJmgEUOTZ9BFmmLb8QgxDZ07z
	riSQUiss+ONIHcC+piRf950fQabWMh+Bnpu7jEdDNAbjX8soIK8jQq4LzbcdC8Rjn/CGuf0F1fi
	2KUvHdQ7IV7e0RpC4G/K8usSklXe3g9r6YdAWMB59V/e1ht5BP8EQivsO9A6EzcksZAtjOz+22B
	p/svKfaeIYyFCsAKySwp4xgoxyjDnkR+thC/pcoR3+9T0AoV
X-Google-Smtp-Source: AGHT+IE9X53VOiUMKpFB+BSDlxPRom2fGPMvdfIAykyzXKLH2DYJqYIyh5IN0C8tYV+MtH6iQMWt8w==
X-Received: by 2002:a05:6a00:b4d:b0:71e:108e:9c16 with SMTP id d2e1a72fcca58-72daf9760cbmr36109849b3a.12.1737618521995;
        Wed, 22 Jan 2025 23:48:41 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([2408:8207:7820:2ed0:a46e:6310:4021:f441])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72daba4895csm12749090b3a.130.2025.01.22.23.48.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 22 Jan 2025 23:48:41 -0800 (PST)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: xueshuai@linux.alibaba.com,
	renyu.zj@linux.alibaba.com,
	will@kernel.org,
	mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Yunhui Cui <cuiyunhui@bytedance.com>
Subject: [PATCH] perf/dwc_pcie: fix duplicate pci_dev devices
Date: Thu, 23 Jan 2025 15:48:30 +0800
Message-Id: <20250123074830.90923-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_234847_081870_3EAFD8C0 
X-CRM114-Status: GOOD (  15.64  )
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
 drivers/perf/dwc_pcie_pmu.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/perf/dwc_pcie_pmu.c b/drivers/perf/dwc_pcie_pmu.c
index cccecae9823f..8b208f287a1f 100644
--- a/drivers/perf/dwc_pcie_pmu.c
+++ b/drivers/perf/dwc_pcie_pmu.c
@@ -565,9 +565,7 @@ static int dwc_pcie_register_dev(struct pci_dev *pdev)
 	u32 sbdf;
 
 	sbdf = (pci_domain_nr(pdev->bus) << 16) | PCI_DEVID(pdev->bus->number, pdev->devfn);
-	plat_dev = platform_device_register_data(NULL, "dwc_pcie_pmu", sbdf,
-						 pdev, sizeof(*pdev));
-
+	plat_dev = platform_device_register_simple("platform_dwc_pcie", sbdf, NULL, 0);
 	if (IS_ERR(plat_dev))
 		return PTR_ERR(plat_dev);
 
@@ -614,19 +612,32 @@ static struct notifier_block dwc_pcie_pmu_nb = {
 
 static int dwc_pcie_pmu_probe(struct platform_device *plat_dev)
 {
-	struct pci_dev *pdev = plat_dev->dev.platform_data;
+	struct pci_dev *pdev = NULL;
 	struct dwc_pcie_pmu *pcie_pmu;
+	bool found = false;
 	char *name;
 	u32 sbdf;
 	u16 vsec;
 	int ret;
 
+	for_each_pci_dev(pdev) {
+		sbdf = (pci_domain_nr(pdev->bus) << 16) | PCI_DEVID(pdev->bus->number, pdev->devfn);
+		if (sbdf == plat_dev->id) {
+			found = true;
+			break;
+		}
+	}
+	if (!found) {
+		pr_err("The plat_dev->id does not match the sbdf");
+		return -ENODEV;
+	}
+
 	vsec = dwc_pcie_des_cap(pdev);
 	if (!vsec)
 		return -ENODEV;
 
 	sbdf = plat_dev->id;
-	name = devm_kasprintf(&plat_dev->dev, GFP_KERNEL, "dwc_rootport_%x", sbdf);
+	name = devm_kasprintf(&plat_dev->dev, GFP_KERNEL, "dwc_rootport_%d_pmu", sbdf);
 	if (!name)
 		return -ENOMEM;
 
@@ -640,7 +651,7 @@ static int dwc_pcie_pmu_probe(struct platform_device *plat_dev)
 	pcie_pmu->on_cpu = -1;
 	pcie_pmu->pmu = (struct pmu){
 		.name		= name,
-		.parent		= &pdev->dev,
+		.parent		= &plat_dev->dev,
 		.module		= THIS_MODULE,
 		.attr_groups	= dwc_pcie_attr_groups,
 		.capabilities	= PERF_PMU_CAP_NO_EXCLUDE,
@@ -727,7 +738,7 @@ static int dwc_pcie_pmu_offline_cpu(unsigned int cpu, struct hlist_node *cpuhp_n
 
 static struct platform_driver dwc_pcie_pmu_driver = {
 	.probe = dwc_pcie_pmu_probe,
-	.driver = {.name = "dwc_pcie_pmu",},
+	.driver = {.name = "platform_dwc_pcie",},
 };
 
 static int __init dwc_pcie_pmu_init(void)
-- 
2.39.2


