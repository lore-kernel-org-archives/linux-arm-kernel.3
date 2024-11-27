Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 088CBD6ACF4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 16:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AxOVFaaTtf3vqrp1NbSGzCrsRokoNNo20iMlzSXj/hw=; b=waxcOF9iI36fZqE/M86qJAvjz8
	DscVKDOlIhUdGLKzV6a0hm9hDm8BHkfm0VJOuZk24RiTuPdhqua4HEVSWpbPv1V1tv/MS0TgW0M8p
	68Oycws8kxAC+qHkHzTKJUCBYxejiUSrSiElB6PExYBhbJ7+A56SVCIHeiXNEg7yZmJjDfCZ0Dw2R
	MmyvgnznAe/+I+WqtJm9C52x+sCL0GuM7XrFNjsvPBRXHTbPQpQYzJy0Rh1bAjJqeR/po7kiBe8/X
	96OJFyFOiwBUDVFjjE5zVqpPKFEfwoINUnXQpS/ep9ygthJfBsNNMUsr73vjetl2StxBpq+ERMGEI
	6QbAQE1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGLI9-0000000Dgzq-2QAB;
	Wed, 27 Nov 2024 16:53:29 +0000
Received: from mail.fris.de ([116.203.77.234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGL9k-0000000DfHc-41rb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 16:44:50 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6F404BFB96;
	Wed, 27 Nov 2024 17:44:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1732725887; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=AxOVFaaTtf3vqrp1NbSGzCrsRokoNNo20iMlzSXj/hw=;
	b=YbwGJoKIUvNDlJNRQkanxrXcaqQ4B34YnRbJw4V3kacSCu1AzoBxBMaS6Hpkbfh225avgM
	cP/JEPgUeMtfSxRZPfDTLRlfiMQGBhOYP8DFVtMUjZg5auNiURv9CPoc5zR4dncRj11LJL
	hZBG2oPPyjad2OaOl/0zP0iQMRgKYmRwu7DUXFhDVE1wG41VdiBRLiehAmTsHDmtm9VY2G
	LQ0syTDiKnuqVFsfHH8ZEVULp/5DdSHZwiTzeR22Nlgp1q6C3Fp2lmeFdS/6qLEtJ9miq1
	fpundE7b/DKanTPwKKPh6XCNqtXkuAkH1AbY904c/setcNm0iOKM5yBAihfG5A==
From: Frieder Schrempf <frieder@fris.de>
To: linux-arm-kernel@lists.infradead.org,
	Marek Vasut <marex@denx.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>,
	Bo Liu <liubo03@inspur.com>,
	Joy Zou <joy.zou@nxp.com>
Subject: [PATCH v2 08/11] regulator: pca9450: Handle hardware with fixed SD_VSEL for LDO5
Date: Wed, 27 Nov 2024 17:42:24 +0100
Message-ID: <20241127164337.613915-9-frieder@fris.de>
In-Reply-To: <20241127164337.613915-1-frieder@fris.de>
References: <20241127164337.613915-1-frieder@fris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_084449_136793_B5E07889 
X-CRM114-Status: GOOD (  14.21  )
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

From: Frieder Schrempf <frieder.schrempf@kontron.de>

There are two ways to set the output voltage of the LD05
regulator. First by writing to the voltage selection registers
and second by toggling the SD_VSEL signal.

Usually board designers connect SD_VSEL to the VSELECT signal
controlled by the USDHC controller, but in some cases the
signal is hardwired to a fixed low level (therefore selecting
3.3V as initial value for allowing to boot from the SD card).

In these cases, the voltage is only determined by the value
of the LDO5CTRL_L register. Introduce a property
nxp,sd-vsel-fixed-low to let the driver know that SD_VSEL
is low and there is no GPIO to actually get that
information from dynamically.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
Changes for v2:
* new patch
---
 drivers/regulator/pca9450-regulator.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/regulator/pca9450-regulator.c b/drivers/regulator/pca9450-regulator.c
index 7f7e176bef452..6024de9656e8e 100644
--- a/drivers/regulator/pca9450-regulator.c
+++ b/drivers/regulator/pca9450-regulator.c
@@ -36,6 +36,7 @@ struct pca9450 {
 	enum pca9450_chip_type type;
 	unsigned int rcnt;
 	int irq;
+	bool sd_vsel_fixed_low;
 };
 
 static const struct regmap_range pca9450_status_range = {
@@ -102,6 +103,9 @@ static unsigned int pca9450_ldo5_get_reg_voltage_sel(struct regulator_dev *rdev)
 {
 	struct pca9450 *pca9450 = rdev_get_drvdata(rdev);
 
+	if (pca9450->sd_vsel_fixed_low)
+		return PCA9450_REG_LDO5CTRL_L;
+
 	if (pca9450->sd_vsel_gpio && !gpiod_get_value(pca9450->sd_vsel_gpio))
 		return PCA9450_REG_LDO5CTRL_L;
 
@@ -1084,6 +1088,9 @@ static int pca9450_i2c_probe(struct i2c_client *i2c)
 		return ret;
 	}
 
+	pca9450->sd_vsel_fixed_low =
+		of_property_read_bool(ldo5->dev.of_node, "nxp,sd-vsel-fixed-low");
+
 	dev_info(&i2c->dev, "%s probed.\n",
 		type == PCA9450_TYPE_PCA9450A ? "pca9450a" :
 		(type == PCA9450_TYPE_PCA9451A ? "pca9451a" : "pca9450bc"));
-- 
2.46.1


