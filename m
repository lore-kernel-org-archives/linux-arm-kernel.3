Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 798A5C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 02:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FU81qntwAFVdmVb/UmW5+/CYllzLnCuEzEsQatHhMLA=; b=ANcXZra5TmskYhSS+e2o0XQjos
	jcDZcK8MNv2g0DdTCaLyngnS2vPpVVbvcKSolPcNhFesG6TRRJHueed7XRPe55YdNg4AkUxUUDMQh
	sHfD3M3JyV5+6zhaQzDsBiXh1uWqyBUQe6iDgVgtxMd6WqRR0cHKpveE3EQwO1na2cp/JYFweIckP
	k7UQu3LRRhcbFZzkjJDBL2/fcd3mU0v1asWRCogsyhZ+Be9t0AQGtxy9JmrcWtwCJwDaip3kQRWmN
	E/by7CDpT+sjzsRN0dFy4Z/AmwH00hQvYcQQnTV2oxyeEOmDTiHCsoBWPxObXbwY3kYH/9XoT1YCL
	IVbp1XhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1EbI-0000000AuDs-3UMx;
	Tue, 01 Sep 2026 02:51:52 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1EbF-0000000AuDP-2DSI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 02:51:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=FU
	81qntwAFVdmVb/UmW5+/CYllzLnCuEzEsQatHhMLA=; b=julSyJEfZcSqmgFYWU
	v1gfoKz744FUqnFfVfos86QMdr6oXu5D8gxOaEoy6J6W8oeEW17T5dAYmjtAhtHG
	ZVONcfPaWeI05INJIWJUl9zzDsCysyTzdvpKSkbkk5Txfq5n6mZfRzgBSZoXdW2i
	3NWcurGYN89jw/BN9fkY9rriI=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wBnbpiyPZZqN4jWSg--.25091S2;
	Tue, 01 Sep 2026 10:51:30 +0800 (CST)
From: "Li Youhong" <dayou5941@163.com>
To: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	broonie@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	Li Youhong <liyouhong@kylinos.cn>
Subject: [PATCH] spi: ma35d1-qspi: assert reset on probe error paths
Date: Tue,  1 Sep 2026 10:51:29 +0800
Message-Id: <20260901025129.359960-1-dayou5941@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wBnbpiyPZZqN4jWSg--.25091S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cw4UGr1rGryxXF4DZw1UWrg_yoW8uFy3pF
	srGF4FkFy0q3WfX3y3Aa1DXF1YkFyIva1UGrW2gw1xZrZ5tryDJw17AFWfK3ZrtFyjya47
	JFWUZay8CFsrZaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jOjjgUUUUU=
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: 5gd103ivzuiqqrwthudrp/xtbC+hO7amqWPbOc1wAA3B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_195150_022210_37B50189 
X-CRM114-Status: GOOD (  11.95  )
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

From: Li Youhong <liyouhong@kylinos.cn>

nuvoton_qspi_probe() pulses the exclusive reset and leaves it
deasserted for normal operation. Later probe failures returned
without re-asserting the reset, leaving the controller out of
reset after a failed probe. Assert the reset on those error
paths.

Fixes: 78b16af159ae ("spi: ma35d1-qspi: Add Nuvoton MA35D1 QSPI controller support")
Signed-off-by: Li Youhong <liyouhong@kylinos.cn>
---
 drivers/spi/spi-ma35d1-qspi.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/spi/spi-ma35d1-qspi.c b/drivers/spi/spi-ma35d1-qspi.c
index 7f938d0c6f1f..cf731fa2f7e2 100644
--- a/drivers/spi/spi-ma35d1-qspi.c
+++ b/drivers/spi/spi-ma35d1-qspi.c
@@ -633,12 +633,16 @@ static int nuvoton_qspi_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, ret, "failed to deassert reset\n");
 
 	ret = device_property_read_u32(dev, "num-cs", &num_cs);
-	if (ret && ret != -EINVAL)
-		return dev_err_probe(dev, ret, "failed to read num-cs\n");
+	if (ret && ret != -EINVAL) {
+		ret = dev_err_probe(dev, ret, "failed to read num-cs\n");
+		goto err_assert;
+	}
 
-	if (!num_cs || num_cs > NUVOTON_QSPI_MAX_NUM_CS)
-		return dev_err_probe(dev, -EINVAL, "invalid num-cs %u\n",
+	if (!num_cs || num_cs > NUVOTON_QSPI_MAX_NUM_CS) {
+		ret = dev_err_probe(dev, -EINVAL, "invalid num-cs %u\n",
 				     num_cs);
+		goto err_assert;
+	}
 
 	ctlr->num_chipselect = num_cs;
 	ctlr->max_transfer_size = nuvoton_qspi_max_transfer_size;
@@ -655,14 +659,20 @@ static int nuvoton_qspi_probe(struct platform_device *pdev)
 
 	ret = nuvoton_qspi_hw_init(qspi);
 	if (ret)
-		return ret;
+		goto err_assert;
 
 	ret = devm_spi_register_controller(dev, ctlr);
-	if (ret)
-		return dev_err_probe(dev, ret,
-				     "failed to register spi controller\n");
+	if (ret) {
+		ret = dev_err_probe(dev, ret,
+				    "failed to register spi controller\n");
+		goto err_assert;
+	}
 
 	return 0;
+
+err_assert:
+	reset_control_assert(rst);
+	return ret;
 }
 
 static const struct of_device_id nuvoton_qspi_of_match[] = {
-- 
2.25.1


