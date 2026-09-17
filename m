Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC359C982C1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 08:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QDyuTO0ZRwbxBwmEf+aUlRK6Ejj4v7oLYhRv9ipxsZ4=; b=A9tJy20jgg5O3HeyyvIB2n1LCt
	9sEUxxXSl972o21YrWXZBCBrRAZ2mL2frUZCPH+ZQobRLMIHMEt5hisHzSs211kMb9G1Hh6gPcLvU
	OnywdrSqqKxW3CVMO54sYTLr23TFZBb+BEeDaPCRDw9CormJeTD9X64GUB7fAa+hMcWNhBTW+OXnC
	YZfH+vRdvchL2Yyf31SC/IW/5Uk/5FiM12YRibR6FOmk9/csmSaV75Wgi3N40YZAw/5nMAvMRVM0t
	YLd4nVM0lvx7fw/5lZ8iC3T/jDBZlsf3JY5+a0076P7cYPZFzocA8zU1ADiIwesUk0SWPQAllMyEt
	/H16sjsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x77H8-0000000Arqu-2ozN;
	Thu, 17 Sep 2026 08:15:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x77H5-0000000Arq3-3bKb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 08:15:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7120641A40;
	Thu, 17 Sep 2026 08:15:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EB001F00899;
	Thu, 17 Sep 2026 08:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789632919;
	bh=QDyuTO0ZRwbxBwmEf+aUlRK6Ejj4v7oLYhRv9ipxsZ4=;
	h=From:To:Cc:Subject:Date;
	b=SqB946gz59b2RK7yo9v8JaVtoNHYj/1qfiDgVQSkVvQ10uIyUDuV87kqktecI1Xfk
	 Y461oPZTcDhp7ARRgvK//M7KeQG88Eo71ek2ochcr2mlxkbslDYm+jluTTLUZcgriP
	 lY3d8rbPVCoc5FrTotEOmQjBpHp0Dm6iIFKsBUsARVybKHcPLWHZHVjHUH6+JIr/DI
	 ieCwcOjD/umuvsP7D4UQD8ffB9nC8NdsTssCeqaGhKFCwE/PA1l7nLT1SYtBXL/og1
	 HeYkbUw+jUNlErR7eftOQVI/155NhKd/t2NUueuD6PeSbYAS3qOWREHfhnnwlz4V9G
	 QRkWBJ4IECjug==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Alexey Klimov <alexey.klimov@linaro.org>,
	Sashiko <sashiko-bot@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH fixes] soc: samsung: exynos-pmu: fix use-after-free of interrupt generator node
Date: Thu, 17 Sep 2026 10:15:11 +0200
Message-ID: <20260917081510.59599-2-krzk@kernel.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2082; i=krzk@kernel.org; h=from:subject; bh=dE3+/DwJCR9TouOaCXZbn37MEpseKqnU4nyKAMX3J+Y=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqq6GOfmg1EExaA4JgYrGTpt82/nt+ZKPakZCU4 VEng7yjWgSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaquhjgAKCRDBN2bmhouD 1xwCD/47Xr98/iTaeEhMXsYh7XA3Ab2nRUQglUf8QQ+204FVgDyDk0O+Zc8z1cqcOqCZ1cDs6lY YSu2n8xLSl0j0CKuwH/4E/Crlb+SAOrfHyhhtrf9w7IjALw1R5l5Oge5f17UGnp8df38W2SrBTi RnHYxogE4RpY60Y18BwjeKelW/jYRzy1+2tUwvSL+8ZAqpyn/NQH8beBaWa+YETXJqX7/awDwzk HHlouS6bpisTSH6liyul2WNkbn+StDWyCV8HQMogvsr6pKFRCfpqwVVOeFW3q6787PRi/xMwBmg l7Z4nMEvBuoSHaJWNTuLPlyYe8NBoInERSeEJGy518na0bPU/POxfn4vZEzmUNc/qLcvcmnH3e6 uPgrQcOdytZey0AnKx8SpF6jdBh9HhhuMyGI3MQ6n8/MzrceEZP+M6bAKqsojfQ6hVo+xfOvM27 0kiAKer4GduAPvjRfLIKegPBZ5W/UN5g12z3BiwsjHa1OyiXpC1gdBFV3slHHyOpILrx3SWWr8R vz9Y2FUGC2ixH1vbdxPzkoFBvSN3Q+uZEsoQwRScTyNhdAwfg8feFtt9rRyDcwGMONfCrT+FtdF hi44atFRXq0JpWKuqXZUxHBtSE3RMGWpSOLOoFEGE0fsQrC3Opb1UAUANH5Jdm0B1/hr9wYmMTi +q5lRNXq4oM10tg==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
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

From: Alexey Klimov <alexey.klimov@linaro.org>

The setup_cpuhp_and_cpuidle() parses the device tree node for the
interrupt generation block via of_parse_phandle() and decrements its
reference count using of_node_put() immediately after fetching the resource
address. However, later the intr_gen_node pointer is passed into
of_syscon_register_regmap().

Fix this by declaring intr_gen_node with __free() and removing
of_node_put().

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260513-exynos850-cpuhotplug-v4-0-54fec5f65362@linaro.org?part=3
Fixes: 78b72897a5c8 ("soc: samsung: exynos-pmu: Enable CPU Idle for gs101")
Cc: stable@vger.kernel.org
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
Link: https://patch.msgid.link/20260828-exynos-pmu-cpuhp-idle-fixes-v2-1-06bce6107bd6@linaro.org
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/soc/samsung/exynos-pmu.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
index f5fcdde9750e..efccdd63e40e 100644
--- a/drivers/soc/samsung/exynos-pmu.c
+++ b/drivers/soc/samsung/exynos-pmu.c
@@ -409,13 +409,12 @@ static struct notifier_block exynos_cpupm_reboot_nb = {
 
 static int setup_cpuhp_and_cpuidle(struct device *dev)
 {
-	struct device_node *intr_gen_node;
+	struct device_node *intr_gen_node __free(device_node) =
+		of_parse_phandle(dev->of_node, "google,pmu-intr-gen-syscon", 0);
 	struct resource intrgen_res;
 	void __iomem *virt_addr;
 	int ret, cpu;
 
-	intr_gen_node = of_parse_phandle(dev->of_node,
-					 "google,pmu-intr-gen-syscon", 0);
 	if (!intr_gen_node) {
 		/*
 		 * To maintain support for older DTs that didn't specify syscon
@@ -431,8 +430,6 @@ static int setup_cpuhp_and_cpuidle(struct device *dev)
 	 * syscon provided regmap.
 	 */
 	ret = of_address_to_resource(intr_gen_node, 0, &intrgen_res);
-	of_node_put(intr_gen_node);
-
 	virt_addr = devm_ioremap(dev, intrgen_res.start,
 				 resource_size(&intrgen_res));
 	if (!virt_addr)
-- 
2.53.0


