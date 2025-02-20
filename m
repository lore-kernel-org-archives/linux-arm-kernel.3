Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D55D4C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 12:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WQ9El+/rlrHE/18GReAOzP2LKSCPW/1amedPa/4BiFI=; b=C7h6DM3BPdncYqpyUfUZ6NJYxK
	tCtpbOOlxxT3SIrbm8jcfpNJmaU9S2dV/GwdZ7WqVTh/JoaEjp1BNsxBcOGoPYyTxCtRzbT9x08sv
	IYypRQno2ilE/l2Y+JYcxDNv2ZMgrpKMXuawwou9bN4c24ZoFYIG2kqSlSwHhWJ38HhRsDiinnf6K
	qmtmYOQbTF0YX1KvfG3kyAqLyo8beuMI7r6mTuOBo92Y8sJIkaLD3VXSCpMim/BNTp+ikRPjYcsCJ
	eQ7hzZ1RT/RdZJt2YT6ZXtwTgoRehedVFFSlsZvMkfv0aRtibmELVqcUdJowsUTIATrTW5WJePapz
	PurCluQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl5aW-00000000lwx-0zPR;
	Thu, 20 Feb 2025 12:23:32 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl5VH-00000000k9J-1HbZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 12:18:08 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-220d601886fso11790405ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Feb 2025 04:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1740053886; x=1740658686; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WQ9El+/rlrHE/18GReAOzP2LKSCPW/1amedPa/4BiFI=;
        b=MpZ1aZX8XM3CJOkbJXz00Sqet+av98g+QDp6FwfKgFPx6rCtEzNnFfAyblZl4yGRSp
         MAYh0KFgiVhFCuMun7jT5I4Eh8paoh0NYP+qMiJ9Gp1VbgLJsooAf5/cz3rKXa3GQgUq
         31ZL16U+KjXHVEQ4GPi1Hd/FOkH7tv5bYWeerfZfHPfppAx3P/J+Qw0CNcUtjV7WcolF
         mq9TOEn3wx6v0A0X5StTefnzAylMO8JiL70ybFHdH9aitZ9X2XITwJGfJUmOmeOz2vAb
         PN1qJdMfskVveQnAjgjm40gC7Yhap9bx0rwRq+0C75giwXvLhQGEjVsRHHfIcrGTnZhf
         0hFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740053886; x=1740658686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WQ9El+/rlrHE/18GReAOzP2LKSCPW/1amedPa/4BiFI=;
        b=anHKEgmxJ+s4BRvAcWMWgNTDPDJLDP1egPjRBc5USRY+S7+87Y/XGVjefGKIlEjsM+
         d5FMbXecm3PJ/aAdkvVH6/DcBDjIR9gxJyGedNftbYRkeHvDDQrinhK5u/W80+nDk37f
         puExbGT82pByO+LpZnfDaLq94PMikDn1Fh7EMJNvOHNdnc5vDxZU4DrmBfxlNVfx2Lse
         ksoRJDYnuvbQ696OGbJDbqMZNtKXBipOVPN4syot47irBejWbF43oLyhbIK9ys2JQ7Xt
         KYkK1zNYhjXS7U93A7oQk1e8iEfVcCksZCerFykvk3Hiby3Q+qMBUezvdIEwkJsdZFOh
         lV8w==
X-Forwarded-Encrypted: i=1; AJvYcCX63jwNVabTOtNpMxKn2TbbvzQOYvNuwxLMGGjKlIe/LqypXltPeWwL1xzPRXs8Ts4G5O60k4MnYcc6uOJy9LJW@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2g4cAwwuY0Y/BB0UFcdbpa1TfrviKH71oDiEuSVF/Z0oHxrYV
	ZUjsQnl8J51X7ra2t9zvYsAMIvRl4FslyCUq+NB5tWFAsbzegEWhJLxhp4/e2E4=
X-Gm-Gg: ASbGncvzwPJR332a9Q7P2bquNM2ajUGWeG79qHbeOs0Xjm+gh/kacV2UllcYPucgUWO
	X45nt7OojvVkuMoKQ5wpUfec0uKw3evceS5t1XrgIWPyqY+5TBG+Y7mM9FIDWYNOq4Ovaj8hQOi
	5FkmNyQylsxoueIYIeLGRBhYNi/rX2LOoTuV5hSOMLbxl2jLIcSu3qeBpsUD0kbSfpoaU1eLemQ
	6GofxvYBTBw3JJ8WIij8BYAvaaGwV0lqtDhYoAyMxh/tgnPCOtrRtQAij91pfyQ8sERlAT1OVo2
	LNJZmB/BLSV4gUeR5M4aIzfVFCQ51o8Xe5rJXlo03tqVHGVmQA==
X-Google-Smtp-Source: AGHT+IF5DERZr4x7+rVPDYf+5pG+kTBcq8I+/piPH2yH0muu1OSon/ojTej4ajQeJjQ1xdnMPN+njQ==
X-Received: by 2002:a17:902:f789:b0:21f:61a9:be7d with SMTP id d9443c01a7336-221040d75abmr368001905ad.49.1740053886409;
        Thu, 20 Feb 2025 04:18:06 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.232])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-221040434d9sm87773895ad.196.2025.02.20.04.18.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 20 Feb 2025 04:18:06 -0800 (PST)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: xueshuai@linux.alibaba.com,
	renyu.zj@linux.alibaba.com,
	will@kernel.org,
	mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Yunhui Cui <cuiyunhui@bytedance.com>
Subject: [PATCH v4 2/2] perf/dwc_pcie: fix duplicate pci_dev devices
Date: Thu, 20 Feb 2025 20:17:16 +0800
Message-Id: <20250220121716.50324-3-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20250220121716.50324-1-cuiyunhui@bytedance.com>
References: <20250220121716.50324-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_041807_340949_5139C00B 
X-CRM114-Status: GOOD (  14.23  )
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
 drivers/perf/dwc_pcie_pmu.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/perf/dwc_pcie_pmu.c b/drivers/perf/dwc_pcie_pmu.c
index 19fa2ba8dd67..f851e070760c 100644
--- a/drivers/perf/dwc_pcie_pmu.c
+++ b/drivers/perf/dwc_pcie_pmu.c
@@ -565,9 +565,7 @@ static int dwc_pcie_register_dev(struct pci_dev *pdev)
 	u32 sbdf;
 
 	sbdf = (pci_domain_nr(pdev->bus) << 16) | PCI_DEVID(pdev->bus->number, pdev->devfn);
-	plat_dev = platform_device_register_data(NULL, "dwc_pcie_pmu", sbdf,
-						 pdev, sizeof(*pdev));
-
+	plat_dev = platform_device_register_simple("dwc_pcie_pmu", sbdf, NULL, 0);
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
-- 
2.39.2


