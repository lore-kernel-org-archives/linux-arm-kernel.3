Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83D49C02198
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Feb 2025 10:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SQGQvZxBQgd+2Ma/k6f6Q/GLYBdp+hkg2ZeYWxhonnA=; b=L5B/xJcZLD/KM6CgvJQO0Tp7ox
	3ex/+z9447xhiCfmzVKosUgsZJrYbXKQQ5pm9n870Pl1wdbbWQ9EQhwuc9685S3BRATFRDIJuF1So
	4y3HXzV6HipGfqtEYsxphjbi9M3y7dT19luB+QJTnAcNGDMQMmjowyrBCnFX0hijvsnvkguQvpsUb
	fHyPsyM/4zqQbjytFDBNj6qmHDfqWXX0I2pOV+eyRGjeoGjDXKRZCFUJI8Owdpvtwy6MloqEf04CX
	BN++1zCAwym0lwdlDxAj8dNsqAeqPs7yH9dLHQ1oLEzxY3/JqDMPlKIE1rx/U5JplNRlLYjZX9VlE
	T8CySC0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgiK4-0000000CmA9-2dX1;
	Sat, 08 Feb 2025 10:44:28 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgiG1-0000000Clg6-3dL3
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Feb 2025 10:40:19 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-21f49837d36so29427495ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Feb 2025 02:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1739011217; x=1739616017; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SQGQvZxBQgd+2Ma/k6f6Q/GLYBdp+hkg2ZeYWxhonnA=;
        b=JKZpuRrZWbb149s/RKTpxGz7pKqEGP5Ac6uBTVgIbARrN7/exYAPGSrc7RH1TdYoVm
         nqn3kGgDlKI1/51jHFQHvPVsHhUcVfyudonbPkedgAas1KBFY3Q6wEOFhvGY31s8o7mi
         vFNDlrTIPwDTTPGtcEcDWfvVqe+w2rysqhCA7V7EUGWYs/mLFj8YeCbWsRIkvtdJAiQD
         c+09/69nMrVtXSer8TDSi/AiWHmYZkOavnfofE5nDaqH1lPtOLNSLLraJ7eof92HGLdC
         peqjrRzlLfhWxLoFtW+EOa9XhPbvnnLx225DTdYMvG6OnjPZlcrLktbATczTLGzqx3lk
         kgIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739011217; x=1739616017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SQGQvZxBQgd+2Ma/k6f6Q/GLYBdp+hkg2ZeYWxhonnA=;
        b=Qx5QQmrzswVun1/5EPKvb+4XOjZezp7rE3bgtkzhGucCyphfDDtkjploeFOh+PaZ2d
         va2qwJueHY7Qy9OLmSdkclCYARgyMtBUH0qKPVunh3TA3x0C/r/0BFfVmro6sYX2KOT6
         JxZAMJGfoGIBaDMgnizKFo0lw5wq4PwjhHRIZ082z/SqaBhWEOn8euzpLuVP+iC2UrcL
         SGA61klhvKyvgUI733pad5dwKhvfuBqBXT7YS50uWZ9Ilos6ZARiDJww9pp6WghdAUaW
         4qWVwmblFgnRX8C1UqOHeOkmlJ/jEiG3numeAYXcoPdCTEybyALFvSHlA31WDkNKhYUK
         UPfw==
X-Forwarded-Encrypted: i=1; AJvYcCXdkG9V3dAZSu6EyfVUnJEj3H0l4K7OcDHr+oBmUFC0LiJTy7+JO9BvgfPKWj3L/dHFbAmBy+4eu+bq9FnQje26@lists.infradead.org
X-Gm-Message-State: AOJu0YyDkPe0tmCb4Z8rKsWWBEQM/h6FnuV56jpMqwIh51/l1eMJcNK8
	7xM/JSsuA3mj9O7LE+7wAQaEPHXRawimk5nPLdG5beRgVmEpBnmlef2WecKzBNsAlofmi4SdsHb
	kpP0=
X-Gm-Gg: ASbGncvk/PeRlOUwQf9OxN7PiN1zr/FsBjqzLr945qP2TtwhCjELWUrSFmAXL8xkpOR
	KxzFg5UyhRnofbDO40CSVq3ZPtYh4r4Z9XZ4Ibstfown6eN7eStiqiyiEx1tUP1nTElq4RNx4Rl
	APjJWbatV1DRkQAAncpQ9a/v7tJztdT0csUm2BgkFqp2YSWIlwho7r6BgCv8Raq+1ROfkadHZMK
	MqqixPiU9io0zIpyzkTKfAto1pEzB4zlJ1MG6/azfQpGxeGENr1ETPRUyJs/gcX17u1Q7NNBUAB
	qg73w90CG5WUQrCsWBWy+sD8ON5fiAWl3VdH46O/bwvRF459fw==
X-Google-Smtp-Source: AGHT+IFwKZ4ENzUKalHf5+THzKNZ277YQzoHoj85tFF8ysZVymo0KlkXTEeb4xQMHVqxLg83ynp2eA==
X-Received: by 2002:a05:6a21:918b:b0:1ea:ddd1:2fcf with SMTP id adf61e73a8af0-1ee03a22bb9mr10999850637.4.1739011217015;
        Sat, 08 Feb 2025 02:40:17 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ad5460b8d4bsm216325a12.11.2025.02.08.02.40.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 08 Feb 2025 02:40:16 -0800 (PST)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: xueshuai@linux.alibaba.com,
	renyu.zj@linux.alibaba.com,
	will@kernel.org,
	mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Yunhui Cui <cuiyunhui@bytedance.com>
Subject: [PATCH v3 2/2] perf/dwc_pcie: fix duplicate pci_dev devices
Date: Sat,  8 Feb 2025 18:40:02 +0800
Message-Id: <20250208104002.60332-3-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20250208104002.60332-1-cuiyunhui@bytedance.com>
References: <20250208104002.60332-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250208_024017_902965_09B95923 
X-CRM114-Status: GOOD (  14.90  )
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
index 19fa2ba8dd67..4f6599e32bba 100644
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
 
@@ -616,18 +614,26 @@ static struct notifier_block dwc_pcie_pmu_nb = {
 
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
+		pr_err("No pdev found for the sbdf 0x%x\n", sbdf);
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
@@ -642,7 +648,7 @@ static int dwc_pcie_pmu_probe(struct platform_device *plat_dev)
 	pcie_pmu->on_cpu = -1;
 	pcie_pmu->pmu = (struct pmu){
 		.name		= name,
-		.parent		= &pdev->dev,
+		.parent		= &plat_dev->dev,
 		.module		= THIS_MODULE,
 		.attr_groups	= dwc_pcie_attr_groups,
 		.capabilities	= PERF_PMU_CAP_NO_EXCLUDE,
@@ -729,7 +735,7 @@ static int dwc_pcie_pmu_offline_cpu(unsigned int cpu, struct hlist_node *cpuhp_n
 
 static struct platform_driver dwc_pcie_pmu_driver = {
 	.probe = dwc_pcie_pmu_probe,
-	.driver = {.name = "dwc_pcie_pmu",},
+	.driver = {.name = "platform_dwc_pcie",},
 };
 
 static void dwc_pcie_cleanup_devices(void)
-- 
2.39.2


