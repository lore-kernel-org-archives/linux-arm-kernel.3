Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B8AEC982CC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 15:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lu5guPXgXFd1BuNfLIuo3ivfuL40g3z62BH6glpWOfI=; b=3cPoLbEThusRNLTLToIj0nLGmG
	m776Ht2kl7lw3yg84U5aBHBWTeCqWggva5iyCFFLkqgdN2z8NlFGCDoi30B26TK9JIsifrEDKso0C
	0G47GzHyqsBoQWSTDj3vhdRupYYanxp045EEK9npMHtio9yd7E1QxHu51orREIgUUwuTkH3x9HnFq
	ulCveWCPnON2JH2JhVrJJrZJGCR4YjpZ4qYsMwvw8NBK7NeOnslEiQs6vcsWkjQ7e2Htw/E/eTqbd
	iCXSjL3ujhb4pwBvofLjB0YLDXiPQ2Rn9rR5t7CcKxZl/HRkTVwI0u4Yo7WzX8A2FozxGtOAlrPGD
	r9O/hA2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6s2S-00000009fMA-0dzw;
	Wed, 16 Sep 2026 15:59:12 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6s2P-00000009fLM-0hzk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 15:59:11 +0000
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowAAHcz3JvKpqj0RtCA--.21547S2;
	Wed, 16 Sep 2026 23:59:05 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: andi.shyti@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	piotr.wojtaszczyk@timesys.com,
	stigge@antcom.de,
	vz@mleia.com,
	wsa@kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] i2c: pnx: Fix of_node reference leak in i2c_pnx_probe()
Date: Wed, 16 Sep 2026 15:58:38 +0000
Message-Id: <20260916155838.2078067-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAAHcz3JvKpqj0RtCA--.21547S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cw1rKry7Xr13Kr4DJr4DCFg_yoW8trW7pa
	9rGFZIvr4UJFn7KrWkXr1UZFy5tw4ftrW8K3W3uw1kCanxKrWUJr4aqFyFvFWFkFWvq3WY
	qF1DJFWfuF1kuFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9I14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr1j6F4UJwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
	8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFV
	Cjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWl
	x4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r
	4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j
	6r1xMIIF0xvEx4A2jsIE14v26F4j6r4UJwCI42IY6I8E87Iv6xkF7I0E14v26F4UJVW0ob
	IYCTnIWIevJa73UjIFyTuYvjfUrrWFUUUUU
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwUMA2qqpVg55wADst
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_085909_575671_77AB1720 
X-CRM114-Status: GOOD (  12.24  )
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

The device node reference taken with of_node_get() for the adapter
device is never released: the early probe error paths return without
dropping it, and neither the late error paths nor i2c_pnx_remove() put
it back. The i2c core does not release the adapter device's of_node
either.

Route the clock, I/O mapping and clock-enable error paths to a common
label that drops the node reference, and drop the reference after
i2c_del_adapter() in the remove path.

Fixes: b41a216dafe4 ("i2c: Add device tree support to i2c-pnx.c")
Cc: stable@vger.kernel.org
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/i2c/busses/i2c-pnx.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pnx.c b/drivers/i2c/busses/i2c-pnx.c
index 8daa0008bd05..b2a686b132ea 100644
--- a/drivers/i2c/busses/i2c-pnx.c
+++ b/drivers/i2c/busses/i2c-pnx.c
@@ -644,20 +644,24 @@ static int i2c_pnx_probe(struct platform_device *pdev)
 	}
 #endif
 	alg_data->clk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(alg_data->clk))
-		return PTR_ERR(alg_data->clk);
+	if (IS_ERR(alg_data->clk)) {
+		ret = PTR_ERR(alg_data->clk);
+		goto err_of_node;
+	}
 
 	snprintf(alg_data->adapter.name, sizeof(alg_data->adapter.name),
 		 "%s", pdev->name);
 
 	/* Register I/O resource */
 	alg_data->ioaddr = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
-	if (IS_ERR(alg_data->ioaddr))
-		return PTR_ERR(alg_data->ioaddr);
+	if (IS_ERR(alg_data->ioaddr)) {
+		ret = PTR_ERR(alg_data->ioaddr);
+		goto err_of_node;
+	}
 
 	ret = clk_prepare_enable(alg_data->clk);
 	if (ret)
-		return ret;
+		goto err_of_node;
 
 	freq = clk_get_rate(alg_data->clk);
 
@@ -707,6 +711,8 @@ static int i2c_pnx_probe(struct platform_device *pdev)
 
 out_clock:
 	clk_disable_unprepare(alg_data->clk);
+err_of_node:
+	of_node_put(alg_data->adapter.dev.of_node);
 	return ret;
 }
 
@@ -716,6 +722,7 @@ static void i2c_pnx_remove(struct platform_device *pdev)
 
 	i2c_del_adapter(&alg_data->adapter);
 	clk_disable_unprepare(alg_data->clk);
+	of_node_put(alg_data->adapter.dev.of_node);
 }
 
 #ifdef CONFIG_OF
-- 
2.34.1


