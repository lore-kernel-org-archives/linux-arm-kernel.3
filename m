Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18791CAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Sep 2025 03:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SQNWvZBrNvBkCi6nsUMupSXRSgUKCff92ffNbr62nlM=; b=h3pjboaN9gnPBIZjz682Ko/Tn7
	sYB1ClKozBjzvfGdNdle0MsUzZhgWjXpmr4ttDLYFWwxdjBfFZ6QufEOXzhAhsu7mUgNDTkthWlhz
	eTaQadznA2sdsha77uRGSmX9OrttGZY3MlfT5LwDdTSK+of5MSYxE2qN4Tamp9F2y7RMN4GlRWBZw
	6Y4F6AQeTz5lLoEwIW9GsMKD7s+i2UMsLHDSYFOV3CKR87iwGA+9gQxWsFHdaKgzlO+i6rfBUQLvI
	2L+c0PwyXFOruPdVsOgvTOsUd22I4kUOVO59KYQswjJL3cHbldNDHrGW8GHF5t/Xsp5u0C06wvgyg
	gzQLLntA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2iRf-0000000Dfjv-41ro;
	Sun, 28 Sep 2025 03:51:31 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2iRc-0000000DfjG-1KSi
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Sep 2025 03:51:30 +0000
Received: from localhost.localdomain (unknown [202.112.113.212])
	by APP-03 (Coremail) with SMTP id rQCowABntH6usNhous7GBw--.19174S2;
	Sun, 28 Sep 2025 11:51:22 +0800 (CST)
From: Ma Ke <make24@iscas.ac.cn>
To: krzk@kernel.org,
	alim.akhtar@samsung.com,
	semen.protsenko@linaro.org,
	peter.griffin@linaro.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	Ma Ke <make24@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] soc: samsung: exynos-pmu: fix reference leak in exynos_get_pmu_regmap_by_phandle()
Date: Sun, 28 Sep 2025 11:51:08 +0800
Message-Id: <20250928035108.10432-1-make24@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: rQCowABntH6usNhous7GBw--.19174S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WF1xAr18WF4DCr4kZFy5Jwb_yoW8AF47pr
	W8JFWFkrW7GrWUKa10qr4qvFW3u34xC39Y9a4xC3sY93ZYqFySkry8GFy8Zas8Ary8JF13
	tF12ya48GFy8Ar7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUP014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
	1j6rxdM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
	Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJV
	W8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI2
	0VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxkIecxEwV
	AFwVW8GwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
	4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUjg4S5UU
	UUU==
X-Originating-IP: [202.112.113.212]
X-CM-SenderInfo: ppdnvj2u6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250927_205128_733168_2447C875 
X-CRM114-Status: GOOD (  11.61  )
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

In exynos_get_pmu_regmap_by_phandle(), driver_find_device_by_of_node()
utilizes driver_find_device_by_fwnode() which internally calls
driver_find_device() to locate the matching device.
driver_find_device() increments the reference count of the found
device by calling get_device(), but exynos_get_pmu_regmap_by_phandle()
fails to call put_device() to decrement the reference count before
returning. This results in a reference count leak of the device each
time exynos_get_pmu_regmap_by_phandle() is executed, which may prevent
the device from being properly released and cause a memory leak.

Found by code review.

Cc: stable@vger.kernel.org
Fixes: 0b7c6075022c ("soc: samsung: exynos-pmu: Add regmap support for SoCs that protect PMU regs")
Signed-off-by: Ma Ke <make24@iscas.ac.cn>
---
 drivers/soc/samsung/exynos-pmu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
index a77288f49d24..ed903a2dd416 100644
--- a/drivers/soc/samsung/exynos-pmu.c
+++ b/drivers/soc/samsung/exynos-pmu.c
@@ -302,6 +302,7 @@ struct regmap *exynos_get_pmu_regmap_by_phandle(struct device_node *np,
 {
 	struct device_node *pmu_np;
 	struct device *dev;
+	struct regmap *regmap;
 
 	if (propname)
 		pmu_np = of_parse_phandle(np, propname, 0);
@@ -325,7 +326,10 @@ struct regmap *exynos_get_pmu_regmap_by_phandle(struct device_node *np,
 	if (!dev)
 		return ERR_PTR(-EPROBE_DEFER);
 
-	return syscon_node_to_regmap(pmu_np);
+	regmap = syscon_node_to_regmap(pmu_np);
+	put_device(regmap);
+
+	return regmap;
 }
 EXPORT_SYMBOL_GPL(exynos_get_pmu_regmap_by_phandle);
 
-- 
2.17.1


