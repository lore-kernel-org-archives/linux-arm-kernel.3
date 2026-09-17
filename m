Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 803DCC982C1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 08:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QDyuTO0ZRwbxBwmEf+aUlRK6Ejj4v7oLYhRv9ipxsZ4=; b=m6+mg0KnZW7vjU+B2W4R1UDyZa
	hLGyT6Ep5WbH2WANOmW6ki+1xiGKNg5Bn87K+3rtZpQ9E32gez9rlnXmLscpJI7QsbkrHimONI2rn
	ojc2SgopumBq6BncudtwX8feKzMD9FZKZlMO/AwZNQWstFWmjyJ/JBTEr+qpz/rm6SjP8IWaPWhkG
	YLaokWCw9vC9Kk30NAw0A3BQVwq8Lh5t5BIm1JaJRnVGY2Z62Q1LVOxFZikOQYiyhX13LMC/OGoQH
	4U4KJPc6ukmFWrUhdf1oWMrKewTHJ47R6kMt8v5BDGIYw3ZHvucrWJaW9XqSi94IKQBPCjKHLqGQw
	SIwoPEuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x77Io-0000000AsK8-0LxX;
	Thu, 17 Sep 2026 08:17:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x77Ij-0000000AsJQ-3U35
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 08:17:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 829F5416A6;
	Thu, 17 Sep 2026 08:17:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F3B11F000FF;
	Thu, 17 Sep 2026 08:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789633021;
	bh=QDyuTO0ZRwbxBwmEf+aUlRK6Ejj4v7oLYhRv9ipxsZ4=;
	h=From:To:Cc:Subject:Date;
	b=YLzow3ByjYz4Nltp3wIx4GflEpu2GJ50QEuJyLZ+gPTs/SdzrCugpRVN1Dkhlhx0g
	 MHBmfOPM+dGYEHnuK9nTVtBZEig1aFSDmo0ko+z/c9gisRV3QX4VG2ve/nspMEsBCT
	 r4p96tDWrVPbiAk5/s3pmsFZ30B0lX1b9HSianoHrLK2KW9e9guWxAyK+V6CrKkT1+
	 QxSa/qPVNxrS4PtAIw5Zujl9aa6HbvJx5SfJdRpkw0sdOYf74Vt77TwaW06+AQAgkE
	 dEfUx8dlqwUILzVai5eGdvwaNo7N+Qgx+ih1atHXfQdi64Xy9Qbm2IlxbnfKApbS0S
	 rIR65RY34WJTA==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: soc@lists.linux.dev
Cc: linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alexey Klimov <alexey.klimov@linaro.org>,
	Sashiko <sashiko-bot@kernel.org>,
	stable@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH fixes] soc: samsung: exynos-pmu: fix use-after-free of interrupt generator node
Date: Thu, 17 Sep 2026 10:16:42 +0200
Message-ID: <20260917081641.72291-2-krzk@kernel.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2082; i=krzk@kernel.org; h=from:subject; bh=dE3+/DwJCR9TouOaCXZbn37MEpseKqnU4nyKAMX3J+Y=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqq6Hpfmg1EExaA4JgYrGTpt82/nt+ZKPakZCU4 VEng7yjWgSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaquh6QAKCRDBN2bmhouD 17hVD/9i2Gymlk29bdGxFhA84Gwu4oAuOHXMoJetd0ixu4Xxz6V16ibx7qFZBlj2DjKrWtFDm2Q jDLjvwG2/bwcDfvaa0AcYyOTHQmEbW+ZqR8OygkRn5EyeGoBE5ejicacTIHe24ROdw5+M88gnQv L0A5iyYto3RmEaiZIEerD/UIfwnCVv2iIyPX4ITPDQMUpbGmKJuiB9awk5L+IiHpkjnCwIO/zXa 29tgFwhUuYiBtK3XtNrLtM7uZtngsdlSFM9xHEyJomMmfKqKxiIeIUUeCBzw5dZLiZnsblnzZo4 L7m0n24Rh6spssSpLQVNPDnM3R6ynU8ADbMXpcE2pVlxyMVw6K1Mo/6PX9H0NTcuS7g7v6JcbMl hktAXyU+YSIck/laKAbJq3UrZkQxAO39thXD7ozNACTUliwylK/8cXtxdjV/OS8yY//2H8mR7ft Uj/QbIJ24uONWVWZTDPDD+BmYCaYNO6cuPERZS9fCdxyuPeB27IbBwEp6XgiIXo6/UYmKwZ5+Fn Yy4r7Q/vdwfyWaR3hJCz6TEagGvLjJAHNfGjLA216fU9JdqcSjkU4lGJKcdOv5G3jqkFw5Fxp0F 2KtaSfQfdDGktcawIQGhxmZVbV4F7cl751T1GroPynyHqDJ+6qEPbtEgEABN8v1kX2IQFR6QxN5 RUuvsYxFJi8vS/g==
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


