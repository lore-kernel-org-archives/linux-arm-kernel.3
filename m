Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBA30CF45CB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 01:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3P1GOp/ZjgnDRK02ms4FV5EJC9lCwHGqttldZm1IAJs=; b=D+0KWwngH5z1iUTCdCaoYNFvG+
	uWvYIkv/zthCdRNoNgLFoulhILbaZatuXY9J47l2tbk7RnSKG3ikAW1mLDfZhsCYXN4uY5k7fMI1g
	P57cE0JGEp4l1vMopq3s+wqv0vSQjE3bnTvXIHLe8g/OPwe0ZJ+jHPQevxBv6IkBN5a5vPM8ixeHx
	Y0+klq9c5sOt2nX8HP2vNf4DYgf7HUMgYNGlOERjV0Zk+q9jcZtTKVRToP3BXPyICaQE1jSNPuIUk
	JyImGExgiZhAXvuGBvMQ39HeUHFXTiK4CUfBs9dQ4AVv6XufrKXgrnW7EVpxjz1/Bl0pbJmZ8e94T
	zIaxJxxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfTVO-00000006OaI-1G9u;
	Tue, 13 Jan 2026 01:47:34 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfTVI-00000006OZH-2h0c
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 01:47:33 +0000
Received: from dfae2b116770.home.arpa (unknown [124.16.138.129])
	by APP-01 (Coremail) with SMTP id qwCowAAXvmkmpGVpOViMBA--.15566S2;
	Tue, 13 Jan 2026 09:47:18 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: nm@ti.com,
	ssantosh@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH v3] soc: ti: pruss: fix double free in pruss_clk_mux_setup()
Date: Tue, 13 Jan 2026 01:47:16 +0000
Message-Id: <20260113014716.2464741-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAAXvmkmpGVpOViMBA--.15566S2
X-Coremail-Antispam: 1UD129KBjvJXoWrZw4DtryrJF48CrWfGFW5Awb_yoW8JF1kp3
	y8CrWSv348JF4xAF45Ar4kGFyYva9Iyay7uayq9w13ZF13tryjq3W2vFyavFsxtFyrGwsI
	yF4DKF9rC3W5AF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvq14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
	0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Wrv_ZF1lYx0Ex4A2jsIE14v26rxl6rkdMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1lc2xSY4AK67AK6w4l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0x
	ZFpf9x0pRNyCXUUUUU=
X-Originating-IP: [124.16.138.129]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwkGA2lllVk4lwAAsk
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_174731_019548_76D7A96E 
X-CRM114-Status: GOOD (  10.50  )
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

In the pruss_clk_mux_setup(), the devm_add_action_or_reset() indirectly
calls pruss_of_free_clk_provider(), which calls of_node_put(clk_mux_np)
on the error path. However, after the devm_add_action_or_reset()
returns, the of_node_put(clk_mux_np) is called again, causing a double
free.

Fix by returning directly, to avoid the duplicate of_node_put().

Fixes: ba59c9b43c86 ("soc: ti: pruss: support CORECLK_MUX and IEPCLK_MUX")
Cc: stable@vger.kernel.org
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

---
Changes in v2:
- Drop error jumping label.
Changes in v3:
- Omit curly brackets.
---
 drivers/soc/ti/pruss.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/ti/pruss.c b/drivers/soc/ti/pruss.c
index d7634bf5413a..0bc5122ee22b 100644
--- a/drivers/soc/ti/pruss.c
+++ b/drivers/soc/ti/pruss.c
@@ -366,12 +366,10 @@ static int pruss_clk_mux_setup(struct pruss *pruss, struct clk *clk_mux,
 
 	ret = devm_add_action_or_reset(dev, pruss_of_free_clk_provider,
 				       clk_mux_np);
-	if (ret) {
+	if (ret)
 		dev_err(dev, "failed to add clkmux free action %d", ret);
-		goto put_clk_mux_np;
-	}
 
-	return 0;
+	return ret;
 
 put_clk_mux_np:
 	of_node_put(clk_mux_np);
-- 
2.34.1


