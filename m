Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E8B1C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 05:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=153+CV5FQGBmw6QXu3EAAXcCsbIMkt0+8YEOVYAi/8o=; b=FAAw6rg2mw1oD2mxqid1rx3i9x
	Wf3nPUaNf1i9qdzSZXtbVrlS7OsE4IXVZv+5+k4ePkOJmt+2FEGRoCT2/yJX3RlHbxnZS9YhNeIp/
	s/j3AwG9OzAzU4V207VAEr136wzLI194VmVwupwdJEpUY1T1aqVklhCtbhdy6ZFears7oJO0Mwtpm
	GH43IyTGYmGQwEEat41t46qdcNFPHYFGdcbgYJY0IxDxM18w3yrAUNWjEw948lowfG9byeNdnBqVI
	bI/o57RBzT1/zgiVLqujkXfHKAiBpj8oXFFKMTWM83+cFLPh269D3rSszx+0R4oixyFXPFCmCTNwq
	FThsfHNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6M7Z-00000005JfJ-3RCt;
	Tue, 15 Sep 2026 05:54:22 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6M7W-00000005JeF-22EG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 05:54:20 +0000
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowAB3TPCE3ahqLUUKCA--.2511S2;
	Tue, 15 Sep 2026 13:54:12 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: alim.akhtar@samsung.com
Cc: bmasney@redhat.com,
	cw00.choi@samsung.com,
	krzk@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	mturquette@baylibre.com,
	s.nawrocki@samsung.com,
	sboyd@kernel.org,
	semen.protsenko@linaro.org,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] clk: samsung: Fix parent clock reference leak on enable failure
Date: Tue, 15 Sep 2026 05:53:43 +0000
Message-Id: <20260915055343.1730045-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAB3TPCE3ahqLUUKCA--.2511S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CF15AFy7JFyUGryxuw1DGFg_yoW8XFy5pF
	Z7CrWYyFW5GrWUKF43Kr1qgr1aqw45CFy3WryfCa4kWwn0yryDAF1rGa4qv3Z8JrWrJFWr
	trsrtFZ5CF18ZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9214x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAFwI0_Gr1j6F4UJwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
	8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFV
	Cjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWl
	x4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r
	1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_
	JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYx
	BIdaVFxhVjvjDU0xZFpf9x0JULo7NUUUUU=
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwULA2qowpBb1AABsU
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_225418_887052_E6F66840 
X-CRM114-Status: GOOD (  10.76  )
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

In exynos_arm64_enable_bus_clk(), when dev is NULL the parent clock is
obtained with of_clk_get_by_name() and then handed to
clk_prepare_enable(). On the enable failure path the function returns
directly without clk_put(), leaking the consumer reference.

Store the clk_prepare_enable() return value and release the reference
with clk_put() before returning on failure.

Fixes: 454e8d296ce4 ("clk: samsung: Extract parent clock enabling to common function")
Cc: stable@vger.kernel.org
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/clk/samsung/clk-exynos-arm64.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos-arm64.c b/drivers/clk/samsung/clk-exynos-arm64.c
index 35d4de233cc1..05c4a15dfe99 100644
--- a/drivers/clk/samsung/clk-exynos-arm64.c
+++ b/drivers/clk/samsung/clk-exynos-arm64.c
@@ -149,6 +149,7 @@ static int __init exynos_arm64_enable_bus_clk(struct device *dev,
 		struct device_node *np, const struct samsung_cmu_info *cmu)
 {
 	struct clk *parent_clk;
+	int ret;
 
 	if (!cmu->clk_name)
 		return 0;
@@ -167,7 +168,11 @@ static int __init exynos_arm64_enable_bus_clk(struct device *dev,
 	if (IS_ERR(parent_clk))
 		return PTR_ERR(parent_clk);
 
-	return clk_prepare_enable(parent_clk);
+	ret = clk_prepare_enable(parent_clk);
+	if (ret)
+		clk_put(parent_clk);
+
+	return ret;
 }
 
 static int __init exynos_arm64_cmu_prepare_pm(struct device *dev,
-- 
2.34.1


