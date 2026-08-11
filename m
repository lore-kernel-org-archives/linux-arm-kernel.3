Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A654FC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 16:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7G7x9YFsXn4FS+MsawAPuBrlOk9V6aLvapXNJP5fUgU=; b=z/rfsWj5cSaXHwJMMiaeAs+1zf
	AS+84CYIE5pH8TrRcZlZ95FRHnw9DCfoO12NsBC0Qh126Ra2svtC+NyYX8mdX4XclpAlkD6JdVUfs
	pM9f96tqrw8pQuBW/c5NxcWmM+i5D7E9LkkR0jeyn4DaUt/ij4v89ZZZNJshhiHXkye5DWvCq70wx
	VDOT7XY+HIXVu8UCF9zDVC4sUht4kXMg+uZ5kELfJshXZ5jK/VfDP08XGBps8Vgt9zhC9pxkx0twB
	9Jl+DMkXyvdj3iYCwE5+HMwnJNXLk1Yqk7+AWYFopQNKZlpLENWx/pScC4M80hG4u1surJ3GcGqpy
	hOtYlZRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtp0K-0000000ER31-2DlD;
	Tue, 11 Aug 2026 16:07:04 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtp0I-0000000ER25-1a4v
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 16:07:03 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2cee9b74ee1so702545ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 09:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1786464421; x=1787069221; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7G7x9YFsXn4FS+MsawAPuBrlOk9V6aLvapXNJP5fUgU=;
        b=bMfE0llh3+dUdo4yu6tXI90S8lR03/WSMTePRY31UlHh+4ytUeKhI7rNP6a5SF5bt4
         Exmyz7NjWpsg4c6PL5laJjgezbTC3qkCFplsWwNPd0yzpUgANn1FSBrmx62TqG+4FSa1
         H7wN2PZaULX3ewu0FgxqFv0KD61f1AlYe1qtdS6RAxNHH/914+OnMTLCoEPSNSeDe/tz
         i5mPQ2qf7BSqwS996GezQI+oOYK7+GnxhaEcSL+PrAwj+LM5fseawfxOJ1y2IvmFyQ+L
         ungG/cl/rNzhQx+CUAbo7RFPkTiLgH+ZXW7Z+UX0SuRNqtDAvXn3QsB6gOVDVNez5BAe
         3uTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786464421; x=1787069221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7G7x9YFsXn4FS+MsawAPuBrlOk9V6aLvapXNJP5fUgU=;
        b=CSIKiD87AIML1hbiBSY/6Ij3B14/wZZ4/mPpoSrxiSdViKN6MJyH63tG59mr08wA/6
         BY6KiW1j1b6zoUfB75s5SEaKOnCmdiUDyBwltkV1wswnQ54aNt1jl+fjSvJmm3zuLe5k
         tfZ5HJS4ZDJy2KUDEPQppZzm1uY8pOfpbNE6NT1I8ZRvKJH4SkhZjAbzt+bzubYkGnDb
         WzIxk5rSSbWYERUfBcjGt8CHFdFqGzwMTt2IoLPvEvSXC4MCM9lxr7Ef3lfnEA9urxYc
         sr5gxs5tGSqwrYw6oxffKAeQcsw3f8QIOI5j8pVRfGFIsspDzNteuT851jRWP+eJreW5
         nBSw==
X-Forwarded-Encrypted: i=1; AHgh+Rq5ilMJtGjrEqPEYvB1GXKZ1iZIMCA7b0Vqpmvqhp+jpo3NnlI2CE6qWoB9M39NalkEiSE8qjO3wrkLsPm3MbGx@lists.infradead.org
X-Gm-Message-State: AOJu0YxKIm5w7aYoyyPFYgxqgOJdq4efibUanuJegMcohT434Nuej7yJ
	E9nAPZjIdqVO87+kPnit1EdxQziiN2Nt5l5oPnm39VJsfGiIPsxCW93LB/Vmz/rer2I=
X-Gm-Gg: AR+sD13Lrkd/cSxE+S0kgsLp0Cx0AzvC23BDeZuvDdLu7wOPV9qSGTgFyolzJh24IDu
	2NdnFSprBM1thOZ+qDpKFqzxC80+8t4Q2ZXkbItJdBuuTLYLq+rKOk+1ufgQT6jpF04qA+Q8Vfb
	5xux/2onTX7FGp/QL1NyZAbREIn8u0D3LedZRZDY1e5ocvjD4zDNuVs6SAsaIV8TQbO1Kw+HgNc
	dMPwHvklLnTJFbwkBfzue/98FBwWhUh0hjmmxteGtX1wtqSjo87TnpDJSbr71aXWcps3hb9GSg6
	+2E/RM1FYsotIxfusq9/wEOXpP88T8Zznypr1IWE2cER4nHu5bbIQAwyBlK/643/O7CFFBd6HQ2
	LeMaCZAXHqTo6S2JM3t41yz3q1KZAt6dYwIJMb8gSGmLg8PhiBxbqY1IgWyP3cI2XnMGma25UPA
	W0aJO9wibleKKg+UIknNP3bLN8gNJkDQeKDVNph5RzM9bsXvTwm9wv5HD74pS7TLbbTV7SbGDLn
	TlBfTCHkuRtiTGFfJ4=
X-Received: by 2002:a17:90b:2dca:b0:381:a766:efc9 with SMTP id 98e67ed59e1d1-392ec34642fmr5541878a91.7.1786464421415;
        Tue, 11 Aug 2026 09:07:01 -0700 (PDT)
Received: from FJ7FR2JRQ3 ([178.93.176.7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31cf7094c8dsm822008eec.31.2026.08.11.09.06.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 11 Aug 2026 09:07:00 -0700 (PDT)
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
To: Shuai Xue <xueshuai@linux.alibaba.com>,
	Jing Zhang <renyu.zj@linux.alibaba.com>
Cc: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Subject: [PATCH v2 1/2] perf/dwc_pcie: Avoid nested bus notifier locking
Date: Wed, 12 Aug 2026 00:06:49 +0800
Message-ID: <20260811160649.28255-1-zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260811131714.12779-1-zhangzhanpeng.jasper@bytedance.com>
References: <20260811131714.12779-1-zhangzhanpeng.jasper@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_090702_433302_6AF5A1DC 
X-CRM114-Status: GOOD (  24.19  )
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

dwc_pcie_pmu_notifier() registers a synthetic platform device directly from
the BUS_NOTIFY_ADD_DEVICE callback. Bus notifier callbacks run with the
bus_notifier rwsem held, so platform_device_register_data() enters the
platform bus notifier chain before the PCI bus notifier returns. When PCI
host bridges are registered during late init, lockdep reports this as
possible recursive locking.

Move platform device reconciliation to a work item that runs after the PCI
notifier returns. Serialize it with PCI rescan and removal, and parent each
synthetic device to its Root Port so their lifetimes remain coupled.

During removal, unregister the perf PMU and its CPU hotplug instance before
PCI resources disappear, then defer only platform device destruction.
Disable manual bind controls to preserve that ordering.

Fixes: af9597adc2f1 ("drivers/perf: add DesignWare PCIe PMU driver")
Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
---
Tested on a RISC-V system with CONFIG_KASAN, CONFIG_PROVE_LOCKING,
CONFIG_DEBUG_LOCK_ALLOC and CONFIG_LOCKDEP enabled. Late-init PCI discovery
no longer triggers the nested bus notifier warning.

 drivers/perf/dwc_pcie_pmu.c | 149 +++++++++++++++++++++++++++---------
 1 file changed, 113 insertions(+), 36 deletions(-)

diff --git a/drivers/perf/dwc_pcie_pmu.c b/drivers/perf/dwc_pcie_pmu.c
index 5385401fa9cf..7b2e28aade73 100644
--- a/drivers/perf/dwc_pcie_pmu.c
+++ b/drivers/perf/dwc_pcie_pmu.c
@@ -13,6 +13,7 @@
 #include <linux/errno.h>
 #include <linux/kernel.h>
 #include <linux/list.h>
+#include <linux/mutex.h>
 #include <linux/pcie-dwc.h>
 #include <linux/perf_event.h>
 #include <linux/pci.h>
@@ -20,6 +21,7 @@
 #include <linux/smp.h>
 #include <linux/sysfs.h>
 #include <linux/types.h>
+#include <linux/workqueue.h>
 
 #define DWC_PCIE_EVENT_CNT_CTL			0x8
 
@@ -103,12 +105,15 @@ struct dwc_pcie_pmu {
 static int dwc_pcie_pmu_hp_state;
 static struct list_head dwc_pcie_dev_info_head =
 				LIST_HEAD_INIT(dwc_pcie_dev_info_head);
+static DEFINE_MUTEX(dwc_pcie_dev_info_lock);
+static struct work_struct dwc_pcie_pmu_work;
 static bool notify;
 
 struct dwc_pcie_dev_info {
 	struct platform_device *plat_dev;
 	struct pci_dev *pdev;
 	struct list_head dev_node;
+	bool removed;
 };
 
 static ssize_t cpumask_show(struct device *dev,
@@ -593,6 +598,8 @@ static struct dwc_pcie_dev_info *dwc_pcie_find_dev_info(struct pci_dev *pdev)
 {
 	struct dwc_pcie_dev_info *dev_info;
 
+	lockdep_assert_held(&dwc_pcie_dev_info_lock);
+
 	list_for_each_entry(dev_info, &dwc_pcie_dev_info_head, dev_node)
 		if (dev_info->pdev == pdev)
 			return dev_info;
@@ -634,7 +641,6 @@ static u16 dwc_pcie_des_cap(struct pci_dev *pdev)
 static void dwc_pcie_unregister_dev(struct dwc_pcie_dev_info *dev_info)
 {
 	platform_device_unregister(dev_info->plat_dev);
-	list_del(&dev_info->dev_node);
 	kfree(dev_info);
 }
 
@@ -644,25 +650,92 @@ static int dwc_pcie_register_dev(struct pci_dev *pdev)
 	struct dwc_pcie_dev_info *dev_info;
 	u32 sbdf;
 
-	sbdf = (pci_domain_nr(pdev->bus) << 16) | PCI_DEVID(pdev->bus->number, pdev->devfn);
-	plat_dev = platform_device_register_simple("dwc_pcie_pmu", sbdf, NULL, 0);
-	if (IS_ERR(plat_dev))
-		return PTR_ERR(plat_dev);
-
 	dev_info = kzalloc_obj(*dev_info);
-	if (!dev_info) {
-		platform_device_unregister(plat_dev);
+	if (!dev_info)
 		return -ENOMEM;
-	}
 
-	/* Cache platform device to handle pci device hotplug */
+	sbdf = (pci_domain_nr(pdev->bus) << 16) |
+	       PCI_DEVID(pdev->bus->number, pdev->devfn);
+	plat_dev = platform_device_register_data(&pdev->dev, "dwc_pcie_pmu",
+						 sbdf, NULL, 0);
+	if (IS_ERR(plat_dev)) {
+		kfree(dev_info);
+		return PTR_ERR(plat_dev);
+	}
 	dev_info->plat_dev = plat_dev;
 	dev_info->pdev = pdev;
-	list_add(&dev_info->dev_node, &dwc_pcie_dev_info_head);
+
+	mutex_lock(&dwc_pcie_dev_info_lock);
+	list_add_tail(&dev_info->dev_node, &dwc_pcie_dev_info_head);
+	mutex_unlock(&dwc_pcie_dev_info_lock);
 
 	return 0;
 }
 
+static void dwc_pcie_quiesce_dev(struct dwc_pcie_dev_info *dev_info)
+{
+	struct dwc_pcie_pmu *pcie_pmu;
+
+	pcie_pmu = platform_get_drvdata(dev_info->plat_dev);
+	if (!pcie_pmu)
+		return;
+
+	/* Stop config-space accesses before PCI host resources are released. */
+	platform_set_drvdata(dev_info->plat_dev, NULL);
+	devm_release_action(&dev_info->plat_dev->dev, dwc_pcie_unregister_pmu,
+			    pcie_pmu);
+	devm_release_action(&dev_info->plat_dev->dev,
+			    dwc_pcie_pmu_remove_cpuhp_instance,
+			    &pcie_pmu->cpuhp_node);
+}
+
+static int dwc_pcie_reconcile_devices(void)
+{
+	LIST_HEAD(removed_devices);
+	struct dwc_pcie_dev_info *dev_info, *tmp;
+	struct pci_dev *pdev = NULL;
+	int error = 0;
+	int ret;
+
+	pci_lock_rescan_remove();
+	mutex_lock(&dwc_pcie_dev_info_lock);
+	list_for_each_entry_safe(dev_info, tmp, &dwc_pcie_dev_info_head, dev_node)
+		if (dev_info->removed)
+			list_move_tail(&dev_info->dev_node, &removed_devices);
+	mutex_unlock(&dwc_pcie_dev_info_lock);
+
+	list_for_each_entry_safe(dev_info, tmp, &removed_devices, dev_node) {
+		list_del(&dev_info->dev_node);
+		dwc_pcie_unregister_dev(dev_info);
+	}
+
+	for_each_pci_dev(pdev) {
+		if (!dwc_pcie_des_cap(pdev))
+			continue;
+
+		mutex_lock(&dwc_pcie_dev_info_lock);
+		dev_info = dwc_pcie_find_dev_info(pdev);
+		mutex_unlock(&dwc_pcie_dev_info_lock);
+		if (dev_info)
+			continue;
+
+		ret = dwc_pcie_register_dev(pdev);
+		if (ret) {
+			pci_warn(pdev, "failed to register DWC PCIe PMU: %d\n", ret);
+			if (!error)
+				error = ret;
+		}
+	}
+	pci_unlock_rescan_remove();
+
+	return error;
+}
+
+static void dwc_pcie_update_devices(struct work_struct *work)
+{
+	dwc_pcie_reconcile_devices();
+}
+
 static int dwc_pcie_pmu_notifier(struct notifier_block *nb,
 				     unsigned long action, void *data)
 {
@@ -674,14 +747,19 @@ static int dwc_pcie_pmu_notifier(struct notifier_block *nb,
 	case BUS_NOTIFY_ADD_DEVICE:
 		if (!dwc_pcie_des_cap(pdev))
 			return NOTIFY_DONE;
-		if (dwc_pcie_register_dev(pdev))
-			return NOTIFY_BAD;
+		schedule_work(&dwc_pcie_pmu_work);
 		break;
 	case BUS_NOTIFY_DEL_DEVICE:
+		mutex_lock(&dwc_pcie_dev_info_lock);
 		dev_info = dwc_pcie_find_dev_info(pdev);
+		if (dev_info) {
+			dwc_pcie_quiesce_dev(dev_info);
+			dev_info->removed = true;
+		}
+		mutex_unlock(&dwc_pcie_dev_info_lock);
 		if (!dev_info)
 			return NOTIFY_DONE;
-		dwc_pcie_unregister_dev(dev_info);
+		schedule_work(&dwc_pcie_pmu_work);
 		break;
 	}
 
@@ -702,18 +780,14 @@ static int dwc_pcie_pmu_probe(struct platform_device *plat_dev)
 	int ret;
 
 	sbdf = plat_dev->id;
-	pdev = pci_get_domain_bus_and_slot(sbdf >> 16, PCI_BUS_NUM(sbdf & 0xffff),
-					   sbdf & 0xff);
-	if (!pdev) {
-		pr_err("No pdev found for the sbdf 0x%x\n", sbdf);
+	if (!plat_dev->dev.parent || plat_dev->dev.parent->bus != &pci_bus_type)
 		return -ENODEV;
-	}
 
+	pdev = to_pci_dev(plat_dev->dev.parent);
 	vsec = dwc_pcie_des_cap(pdev);
 	if (!vsec)
 		return -ENODEV;
 
-	pci_dev_put(pdev);
 	name = devm_kasprintf(&plat_dev->dev, GFP_KERNEL, "dwc_rootport_%x", sbdf);
 	if (!name)
 		return -ENOMEM;
@@ -766,6 +840,8 @@ static int dwc_pcie_pmu_probe(struct platform_device *plat_dev)
 	if (ret)
 		return ret;
 
+	platform_set_drvdata(plat_dev, pcie_pmu);
+
 	return 0;
 }
 
@@ -815,7 +891,11 @@ static int dwc_pcie_pmu_offline_cpu(unsigned int cpu, struct hlist_node *cpuhp_n
 
 static struct platform_driver dwc_pcie_pmu_driver = {
 	.probe = dwc_pcie_pmu_probe,
-	.driver = {.name = "dwc_pcie_pmu",},
+	.driver = {
+		.name = "dwc_pcie_pmu",
+		.probe_type = PROBE_FORCE_SYNCHRONOUS,
+		.suppress_bind_attrs = true,
+	},
 };
 
 static void dwc_pcie_cleanup_devices(void)
@@ -823,32 +903,21 @@ static void dwc_pcie_cleanup_devices(void)
 	struct dwc_pcie_dev_info *dev_info, *tmp;
 
 	list_for_each_entry_safe(dev_info, tmp, &dwc_pcie_dev_info_head, dev_node) {
+		list_del(&dev_info->dev_node);
 		dwc_pcie_unregister_dev(dev_info);
 	}
 }
 
 static int __init dwc_pcie_pmu_init(void)
 {
-	struct pci_dev *pdev = NULL;
 	int ret;
 
-	for_each_pci_dev(pdev) {
-		if (!dwc_pcie_des_cap(pdev))
-			continue;
-
-		ret = dwc_pcie_register_dev(pdev);
-		if (ret) {
-			pci_dev_put(pdev);
-			goto err_cleanup;
-		}
-	}
-
 	ret = cpuhp_setup_state_multi(CPUHP_AP_ONLINE_DYN,
 				      "perf/dwc_pcie_pmu:online",
 				      dwc_pcie_pmu_online_cpu,
 				      dwc_pcie_pmu_offline_cpu);
 	if (ret < 0)
-		goto err_cleanup;
+		return ret;
 
 	dwc_pcie_pmu_hp_state = ret;
 
@@ -856,19 +925,26 @@ static int __init dwc_pcie_pmu_init(void)
 	if (ret)
 		goto err_remove_cpuhp;
 
+	INIT_WORK(&dwc_pcie_pmu_work, dwc_pcie_update_devices);
 	ret = bus_register_notifier(&pci_bus_type, &dwc_pcie_pmu_nb);
 	if (ret)
 		goto err_unregister_driver;
 	notify = true;
+	ret = dwc_pcie_reconcile_devices();
+	if (ret)
+		goto err_unregister_notifier;
 
 	return 0;
 
+err_unregister_notifier:
+	bus_unregister_notifier(&pci_bus_type, &dwc_pcie_pmu_nb);
+	notify = false;
+	cancel_work_sync(&dwc_pcie_pmu_work);
+	dwc_pcie_cleanup_devices();
 err_unregister_driver:
 	platform_driver_unregister(&dwc_pcie_pmu_driver);
 err_remove_cpuhp:
 	cpuhp_remove_multi_state(dwc_pcie_pmu_hp_state);
-err_cleanup:
-	dwc_pcie_cleanup_devices();
 	return ret;
 }
 
@@ -876,6 +952,7 @@ static void __exit dwc_pcie_pmu_exit(void)
 {
 	if (notify)
 		bus_unregister_notifier(&pci_bus_type, &dwc_pcie_pmu_nb);
+	cancel_work_sync(&dwc_pcie_pmu_work);
 	dwc_pcie_cleanup_devices();
 	platform_driver_unregister(&dwc_pcie_pmu_driver);
 	cpuhp_remove_multi_state(dwc_pcie_pmu_hp_state);
-- 
2.50.1 (Apple Git-155)

