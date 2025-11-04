Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECD9CCCFA00
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 04:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KjZfwq7+FeixOqIUwI6hH008ql6p+JUrRsxo6FhEVWY=; b=qUTjoud/BLwe4LL8dAjq9h2+JT
	5frn1/rDLpY8coh1gnWjymKWsce+H/F/Ou5qDyON6AzSu4vXLXmKnlGWiiIpXFtLjHKkG8qBsOcbL
	0Z/nEFtRbkMucV6ImeJSdX6vaTPdw/IK/vxQ6ICYlJMZ+ULQQiRHiFltFHKLnSnt12zqo7tHsMeUg
	aehIhKaywRUCZy4l8/BdfiNOvEkhuk3HA42TJbU27sEFh1IW5XG7F6AzMi7dqbYk5nLHd57OwYSqM
	iSnZXYsqiCANHSXcIhCAUCoFaImKF/f4vDoUTNh4ISa58eGHmU9DcYdpEMxr2SaxweFcm5tRLq9Ct
	S7CbeWzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG8IM-0000000B68O-3o0f;
	Tue, 04 Nov 2025 04:05:22 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG8IK-0000000B654-0GxU;
	Tue, 04 Nov 2025 04:05:21 +0000
Received: from DESKTOP-L0HPE2S (unknown [124.16.141.245])
	by APP-05 (Coremail) with SMTP id zQCowAB3IO94ewlpspxhAQ--.25862S2;
	Tue, 04 Nov 2025 12:05:14 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Haotian Zhang <vulab@iscas.ac.cn>
Subject: [PATCH] clk: mediatek: mt8173-apmixed: Fix ioremap resource leak in remove function
Date: Tue,  4 Nov 2025 12:04:31 +0800
Message-ID: <20251104040431.1452-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAB3IO94ewlpspxhAQ--.25862S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zr45WrW5JFW3XFyfuw48WFg_yoW8AF17pF
	ykKFWakay8tw4Uur1vy3yvkF1Fva1Iqa45KFy7W3s3ZwnxGrZ2yF1rKayvva4xArWkKr1D
	tr1UurWxCFW7AFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkG14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	tVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUd-B_UUU
	UU=
X-Originating-IP: [124.16.141.245]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBgsQA2kJG3SlGQABss
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_200520_480873_FD1D12DF 
X-CRM114-Status: GOOD (  10.67  )
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

The driver uses of_iomap() to map I/O memory in probe function, but
forgets to call iounmap() in the remove function, leading to a resource
leak when the driver is unloaded.

Replace of_iomap() with devm_of_iomap() to automatically manage the
I/O memory mapping. Remove the now-unnecessary unmap_io label and
iounmap() call from the error path.

Fixes: 4c02c9af3cb9 ("clk: mediatek: mt8173: Break down clock drivers and allow module build")
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 drivers/clk/mediatek/clk-mt8173-apmixedsys.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
index 95385bb67d55..ae759ef51f03 100644
--- a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
@@ -146,15 +146,13 @@ static int clk_mt8173_apmixed_probe(struct platform_device *pdev)
 	struct clk_hw *hw;
 	int r;
 
-	base = of_iomap(node, 0);
-	if (!base)
-		return -ENOMEM;
+	base = devm_of_iomap(&pdev->dev, node, 0, NULL);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
 
 	clk_data = mtk_alloc_clk_data(CLK_APMIXED_NR_CLK);
-	if (IS_ERR_OR_NULL(clk_data)) {
-		r = -ENOMEM;
-		goto unmap_io;
-	}
+	if (IS_ERR_OR_NULL(clk_data))
+		return -ENOMEM;
 
 	fhctl_parse_dt(fhctl_node, pllfhs, ARRAY_SIZE(pllfhs));
 	r = mtk_clk_register_pllfhs(node, plls, ARRAY_SIZE(plls),
@@ -188,8 +186,6 @@ static int clk_mt8173_apmixed_probe(struct platform_device *pdev)
 				  ARRAY_SIZE(pllfhs), clk_data);
 free_clk_data:
 	mtk_free_clk_data(clk_data);
-unmap_io:
-	iounmap(base);
 	return r;
 }
 
-- 
2.50.1.windows.1


