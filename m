Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 137DFC61DC4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 15:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Date:From:Cc:To:Content-Type:Message-Id:Subject:
	References:Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OOFci7YOWRONRU2EkJ/P6bDmKOzzj+GtBTW31kETtbg=; b=y+MoffEV06W7TzwS0HeY4H9QJA
	uhBdp1ppcY+EgwI+bsAriLLl0De9ECSBZANjeeBYHedWOarffFOok2MTiexCSDPmKuSw1B18G10Ro
	a5TxSThG6NK7Jn5ji0lbdOnwQ9Sgg9EtUTEtflVMfG3XfrzYIhBocNMOYGQbSvvzoHyVfzZETxz0N
	OHeMl284FSfSTgN5U/UmqFFCTts4Ot2aC9r3EdWSKOC9Rezxd724VQwHORj/ZrXdnqUmCJzE+5WhP
	iQDeWTIWGW/hN6Ze7FNAvDKvIspjTqwzaXbihZ0upfuz6ByB7EWzimAubliF2ykPcH5FJTVlXH8R+
	oEfS4ddg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzcGR-00000004Gl1-00ZG;
	Thu, 27 Aug 2026 15:43:39 +0000
Received: from sg-2-5.ptr.blmpb.com ([71.18.227.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzcGI-00000004GjK-3TfT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 15:43:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604220257; d=cherr.cc; t=1787845398; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=OOFci7YOWRONRU2EkJ/P6bDmKOzzj+GtBTW31kETtbg=;
 b=hRfo/+JAVjLKlzsS4SxiGLQzJKUn+O/szLDgLqQwnP3IvCNV+IbQ2fL05KaAdvV2GGcRxS
 V++0JZmCazu9q34jjtknWEhpBZocfYq3PHlCRGn35DXTnDhaXoJwoVq2Lh4eyh7iVmNeJd
 awasnakxT820dUAVk39gW3DOVsCbPVVadnK7nQZiyY5bzLNaHVUE7+srrDd/WDSPx9pEG2
 7mZFGHW795o4atz4ekhVg7j6t7wA3nGVCGbmmRWk3RqBzAMGHIz4SfbiXf6STZPFbbZcel
 H9fxf4Z/se/OXHinYVASncGItAygVUpRMshhRy4opCMIx5AvWRFgK+GclWQ5bg==
Mime-Version: 1.0
References: <20260827-i2c-dma-channel-leak-v1-0-271d4adc03a0@cherr.cc>
Received: from [192.168.9.107] ([111.42.148.163]) by smtp.feishu.cn with ESMTPS; Thu, 27 Aug 2026 23:43:15 +0800
Subject: [PATCH 3/3] i2c: qcom-geni: release DMA channels on probe error
Message-Id: <20260827-i2c-dma-channel-leak-v1-3-271d4adc03a0@cherr.cc>
Content-Type: text/plain; charset=UTF-8
X-Mailer: b4 0.16.0
X-Original-From: Shengzhuo Wei <me@cherr.cc>
To: "Codrin Ciubotariu" <codrin.ciubotariu@microchip.com>, 
	"Andi Shyti" <andi.shyti@kernel.org>, 
	"Nicolas Ferre" <nicolas.ferre@microchip.com>, 
	"Alexandre Belloni" <alexandre.belloni@bootlin.com>, 
	"Claudiu Beznea" <claudiu.beznea@tuxon.dev>, 
	"Wolfram Sang" <wsa@kernel.org>, 
	"Ludovic Desroches" <ludovic.desroches@atmel.com>, 
	"Oleksij Rempel" <o.rempel@pengutronix.de>, 
	"Pengutronix Kernel Team" <kernel@pengutronix.de>, 
	"Frank Li" <Frank.Li@nxp.com>, "Sascha Hauer" <s.hauer@pengutronix.de>, 
	"Fabio Estevam" <festevam@gmail.com>, 
	"Yao Yuan" <yao.yuan@freescale.com>, 
	"Mukesh Kumar Savaliya" <mukesh.savaliya@oss.qualcomm.com>, 
	"Viken Dadhaniya" <viken.dadhaniya@oss.qualcomm.com>, 
	"Bjorn Andersson" <andersson@kernel.org>, 
	"Vinod Koul" <vkoul@kernel.org>, 
	"Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, 
	"Praveen Talari" <praveen.talari@oss.qualcomm.com>
Cc: <linux-i2c@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, 
	<linux-kernel@vger.kernel.org>, <imx@lists.linux.dev>, 
	<linux-arm-msm@vger.kernel.org>, <stable@vger.kernel.org>, 
	"Shengzhuo Wei" <me@cherr.cc>
From: "Shengzhuo Wei" <me@cherr.cc>
X-Lms-Return-Path: <lba+26a905b14+fe9dac+lists.infradead.org+me@cherr.cc>
Date: Thu, 27 Aug 2026 23:43:03 +0800
Content-Transfer-Encoding: 7bit
In-Reply-To: <20260827-i2c-dma-channel-leak-v1-0-271d4adc03a0@cherr.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_084331_065028_4BF14FE9 
X-CRM114-Status: UNSURE (   9.58  )
X-CRM114-Notice: Please train this message.
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

geni_i2c_init() grabs exclusive GPI tx/rx DMA channels when the serial
engine runs in GPI mode. If i2c_add_adapter() subsequently fails, probe
returns without releasing the channels, because the remove callback is
not invoked after a failed probe.

The adapter-registration failure path used to release the channels via
its err_dma label; that release was dropped when the probe tail was
restructured into geni_i2c_init().

Release the channels on the adapter-registration failure path, mirroring
geni_i2c_remove().

Fixes: d8d3bb127ad1 ("i2c: qcom-geni: Isolate serial engine setup")
Cc: stable@vger.kernel.org
Signed-off-by: Shengzhuo Wei <me@cherr.cc>
Assisted-by: GLM:5.3
---
 drivers/i2c/busses/i2c-qcom-geni.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 658636c1ee0e..45c770552bd2 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -1189,8 +1189,10 @@ static int geni_i2c_probe(struct platform_device *pdev)
 		return ret;
 
 	ret = i2c_add_adapter(&gi2c->adap);
-	if (ret)
+	if (ret) {
+		release_gpi_dma(gi2c);
 		return dev_err_probe(dev, ret, "Error adding i2c adapter\n");
+	}
 
 	dev_dbg(dev, "Geni-I2C adaptor successfully added\n");
 

-- 
2.47.3

