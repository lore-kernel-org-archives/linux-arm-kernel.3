Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E367CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Sep 2025 07:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=enuewhJJIAq0bxnKpke06A8mzIMd1HuAuNa/kPYwfJY=; b=Rd73Qk+R4uLqNiK2Rtv0uCyKCk
	idLh5xpR6VfRNovuG74qhAeqPLZ1vCObwRjwtD9lM7SRgt/deGTwzzZ6C0w1V+IXpl8vKia4g5xzu
	FwcF1WkHUl9MlDnFp+k2fDGMPWSrFm70Clot4oglagSM7f+716PHMTsq/5epY4dqKUXQkZlgRTskK
	SM8PQrYxbCpjHH9TJdNJj+TPSNy/miQaLPADxX5fxnWTm6x9MkrlOTDKj+ppSZ9/tCTRNRyIe5OBQ
	a8iiFj8XplTxz/AqR5HaxVmCudQBKNxXufDCAub0pxEOXJjXiw/1aR6bW3uAZT9TfarzjDXON+qSB
	8FT/3hyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2lSb-0000000E1yl-1naZ;
	Sun, 28 Sep 2025 07:04:41 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2lSW-0000000E1xY-3Xww
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Sep 2025 07:04:39 +0000
Received: from localhost.localdomain (unknown [202.112.113.212])
	by APP-01 (Coremail) with SMTP id qwCowADXK5713dhohiDrBw--.18611S2;
	Sun, 28 Sep 2025 15:04:25 +0800 (CST)
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
Subject: [PATCH v2] soc: samsung: exynos-pmu: fix reference leak in exynos_get_pmu_regmap_by_phandle()
Date: Sun, 28 Sep 2025 15:04:19 +0800
Message-Id: <20250928070419.39881-1-make24@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: qwCowADXK5713dhohiDrBw--.18611S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WF1xAr18WF4DCr4kZFy5Jwb_yoW8KF1Upr
	WrJaySkrWkGrWvkrWvqr4jvFW3u34I939Y9a4xC34q93ZYqFySyryUGFy8Zas8Ary8JF15
	tF12yFy8GFyUAFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPj14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IE
	rcIFxwACI402YVCY1x02628vn2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE14
	v_GF4l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AK
	xVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrx
	kI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v2
	6r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8Jw
	CI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUoZ2-UUUU
	U
X-Originating-IP: [202.112.113.212]
X-CM-SenderInfo: ppdnvj2u6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_000437_263046_0D7E063A 
X-CRM114-Status: GOOD (  15.56  )
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

Since Exynos-PMU is a core system device that is not unloaded at
runtime, and regmap is created during device probing, releasing the
temporary device reference does not affect the validity of regmap.
From the perspective of code standards and maintainability, reference
count leakage is a genuine code defect that should be fixed. Even if
the leakage does not immediately cause issues in certain scenarios,
known leakage points should not be left unaddressed.

Found by code review.

Cc: stable@vger.kernel.org
Fixes: 0b7c6075022c ("soc: samsung: exynos-pmu: Add regmap support for SoCs that protect PMU regs")
Signed-off-by: Ma Ke <make24@iscas.ac.cn>
---
Changes in v2:
- modified the typo of the variable in the patch. Sorry for the typo;
- added more detailed description.
---
 drivers/soc/samsung/exynos-pmu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
index a77288f49d24..b80cc30c1100 100644
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
+	put_device(dev);
+
+	return regmap;
 }
 EXPORT_SYMBOL_GPL(exynos_get_pmu_regmap_by_phandle);
 
-- 
2.17.1


