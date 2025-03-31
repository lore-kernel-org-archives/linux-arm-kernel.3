Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3884C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 14:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YlkLf9qakJ0Ydh137h5g1CWwnJdePphu94m7SHeHGgA=; b=4J4qWUJqOjCwvBNn+aL5snWv1m
	xVlxT1/r00C7wZC/dCQbn+PH+aN1Ai55cnlKDCe9NkGqwroj5dReWNscVO4h3odcRUbOk6Ku1I/az
	vKN/vKdy6FR60gIYVkflTRxqMRVh1AlDIwRuZa+xCCe/u1FsznU4etlAJviP2ZW69CoR/RxnvuECV
	Fe/E86DjqnuvjhaDVj97thkLLqBuVjwas7v/iWfYs0DTOLnoF1BKQEfhPEYJwIxCwW2beQ3hSQXcH
	SI+ZKNu1gFf6mzSMSJwyeDxZbgxeZpbbXLRGtrHcCYIX3Tbqydd5aOTjIoudqlTAfECN2rU8dqP8U
	p911fXkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzGKc-00000000bTl-3uow;
	Mon, 31 Mar 2025 14:41:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzGDh-00000000ZTc-46Zv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 14:34:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 67FD55C5643;
	Mon, 31 Mar 2025 14:32:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2BD4C4CEE3;
	Mon, 31 Mar 2025 14:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743431673;
	bh=pC02LxYEhOQX0acsiBSpSAp+XyktTgRqcV1taCsvBIc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YMIIJ3s4V8cDnjbW441hLoEMOlUMf4VTyr7gNpt8PkbjyaCDCiPkAZyh//c7Mq/y/
	 lgMoBrGmFL9hNZm1qjeWJ8982Imu+KxeM7/B6lQqnV8zQb5XhU/1GrGHma67D7r1ou
	 zAIO8N7pKW38xZM5xnytXWjaAsPqLsEx/SU9ID9HHBfYgxwRNtrRuO8amWCIEnM+ci
	 ZgQtpWNTESAgz9KU46Zmrh0is9qre9Wkqt0ys3TlF79dvZhWwXiW0QH3y4xg+fvpuF
	 qtglZ7lvlykP855GEuUONbJZLG5guml1NJNJWRbeCuyHSqsWYeRHTvP91ByTsWAF2f
	 Yhpn9p2IxcRpQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Yunhui Cui <cuiyunhui@bytedance.com>,
	Shuai Xue <xueshuai@linux.alibaba.com>,
	Will Deacon <will@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	renyu.zj@linux.alibaba.com,
	mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Subject: [PATCH AUTOSEL 6.14 09/18] perf/dwc_pcie: fix some unreleased resources
Date: Mon, 31 Mar 2025 10:33:59 -0400
Message-Id: <20250331143409.1682789-9-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250331143409.1682789-1-sashal@kernel.org>
References: <20250331143409.1682789-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_073434_099284_467FEF34 
X-CRM114-Status: GOOD (  15.25  )
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

From: Yunhui Cui <cuiyunhui@bytedance.com>

[ Upstream commit 6eb1e8ef586ac4a3dcdc20248f9cb45e4ceb141f ]

Release leaked resources, such as plat_dev and dev_info.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
Reviewed-by: Shuai Xue <xueshuai@linux.alibaba.com>
Link: https://lore.kernel.org/r/20250220121716.50324-2-cuiyunhui@bytedance.com
Signed-off-by: Will Deacon <will@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/perf/dwc_pcie_pmu.c | 33 ++++++++++++++++++++++-----------
 1 file changed, 22 insertions(+), 11 deletions(-)

diff --git a/drivers/perf/dwc_pcie_pmu.c b/drivers/perf/dwc_pcie_pmu.c
index cccecae9823f6..19fa2ba8dd670 100644
--- a/drivers/perf/dwc_pcie_pmu.c
+++ b/drivers/perf/dwc_pcie_pmu.c
@@ -572,8 +572,10 @@ static int dwc_pcie_register_dev(struct pci_dev *pdev)
 		return PTR_ERR(plat_dev);
 
 	dev_info = kzalloc(sizeof(*dev_info), GFP_KERNEL);
-	if (!dev_info)
+	if (!dev_info) {
+		platform_device_unregister(plat_dev);
 		return -ENOMEM;
+	}
 
 	/* Cache platform device to handle pci device hotplug */
 	dev_info->plat_dev = plat_dev;
@@ -730,6 +732,15 @@ static struct platform_driver dwc_pcie_pmu_driver = {
 	.driver = {.name = "dwc_pcie_pmu",},
 };
 
+static void dwc_pcie_cleanup_devices(void)
+{
+	struct dwc_pcie_dev_info *dev_info, *tmp;
+
+	list_for_each_entry_safe(dev_info, tmp, &dwc_pcie_dev_info_head, dev_node) {
+		dwc_pcie_unregister_dev(dev_info);
+	}
+}
+
 static int __init dwc_pcie_pmu_init(void)
 {
 	struct pci_dev *pdev = NULL;
@@ -742,7 +753,7 @@ static int __init dwc_pcie_pmu_init(void)
 		ret = dwc_pcie_register_dev(pdev);
 		if (ret) {
 			pci_dev_put(pdev);
-			return ret;
+			goto err_cleanup;
 		}
 	}
 
@@ -751,35 +762,35 @@ static int __init dwc_pcie_pmu_init(void)
 				      dwc_pcie_pmu_online_cpu,
 				      dwc_pcie_pmu_offline_cpu);
 	if (ret < 0)
-		return ret;
+		goto err_cleanup;
 
 	dwc_pcie_pmu_hp_state = ret;
 
 	ret = platform_driver_register(&dwc_pcie_pmu_driver);
 	if (ret)
-		goto platform_driver_register_err;
+		goto err_remove_cpuhp;
 
 	ret = bus_register_notifier(&pci_bus_type, &dwc_pcie_pmu_nb);
 	if (ret)
-		goto platform_driver_register_err;
+		goto err_unregister_driver;
 	notify = true;
 
 	return 0;
 
-platform_driver_register_err:
+err_unregister_driver:
+	platform_driver_unregister(&dwc_pcie_pmu_driver);
+err_remove_cpuhp:
 	cpuhp_remove_multi_state(dwc_pcie_pmu_hp_state);
-
+err_cleanup:
+	dwc_pcie_cleanup_devices();
 	return ret;
 }
 
 static void __exit dwc_pcie_pmu_exit(void)
 {
-	struct dwc_pcie_dev_info *dev_info, *tmp;
-
 	if (notify)
 		bus_unregister_notifier(&pci_bus_type, &dwc_pcie_pmu_nb);
-	list_for_each_entry_safe(dev_info, tmp, &dwc_pcie_dev_info_head, dev_node)
-		dwc_pcie_unregister_dev(dev_info);
+	dwc_pcie_cleanup_devices();
 	platform_driver_unregister(&dwc_pcie_pmu_driver);
 	cpuhp_remove_multi_state(dwc_pcie_pmu_hp_state);
 }
-- 
2.39.5


