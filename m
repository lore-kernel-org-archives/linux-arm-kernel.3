Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75386C282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 13:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ytag+vUn1YOAY7Tv+GjF5B1jzcAOw0B2REY/Qu/aUug=; b=Iqxijntm2c93ntK06NkD+JetIL
	7BxnaJM46utXB76zChBxsi9DF6ALgnuGVakezxNHIWfbnXT08mhgCCXSZS3hiG+Gi5tnI58eBNH0r
	fYmjdglmTWWu2IixhzuLyXZQBXuJ86YDvkyGJCEjAWx+SbJjXjlgK9wWHvp6t7WuALLnrSolOr3eB
	MIZ2UjadhzMUpQR5fe6Me4KkiddW3PaYp/+FguC9iT5UA9RywlfG20FcxU/RKLHAFQAsTmN7qyGpV
	uje2afUUTD0NuV3Dws2aG8SeIOQM1ZycLvYVF8m0kL7ykcybYaxY2/mgbg0P6IKx6OE9gB7/mlCru
	OzYIYDvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp6Af-00000000ypG-3C6e;
	Mon, 03 Mar 2025 13:49:25 +0000
Received: from mail.fris.de ([116.203.77.234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp5ld-00000000twD-1i2U
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 13:23:35 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B2A4FBFB6A;
	Mon,  3 Mar 2025 14:23:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1741008204; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=ytag+vUn1YOAY7Tv+GjF5B1jzcAOw0B2REY/Qu/aUug=;
	b=cTHRFPUCljYtWPPD51NPpSneH3cw1vuMO7E0wdjg2BCkCAAl/vtK2rAvtxU1ZA/O3RDg7E
	P0m22GIrd5s8aY+ZqXbAAzKrfOH6b1DvysS1svZ4uqtNuLp52wD+/ITB3Kvz5FaBiJnpkS
	vAUHZSMR+hBZI/Ojb18tkzqBewNhdEXQpjDZIZ33gKr+r+nb693V+HPgcLT6aeXTo9f07b
	Pbp3+JbzyrzXeEqE0gDDAssvTtM5kKRgDMLZLl7kDrj6tKrKA0483qfQL3AUEhlJOcRNCN
	Q5BtQdmP4Yxeew82r41HR3Of7CDpdiSMgOzKaCzU01HhgX63+WWZm8B+Ng28bg==
From: Frieder Schrempf <frieder@fris.de>
To: linux-arm-kernel@lists.infradead.org,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>,
	Bo Liu <liubo03@inspur.com>,
	Frank Li <Frank.Li@nxp.com>,
	Joy Zou <joy.zou@nxp.com>,
	Robin Gong <yibin.gong@nxp.com>
Subject: [RESEND PATCH v3] regulator: pca9450: Handle hardware with fixed SD_VSEL for LDO5
Date: Mon,  3 Mar 2025 14:22:54 +0100
Message-ID: <20250303132258.50204-1-frieder@fris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_052333_872934_CB0233FB 
X-CRM114-Status: GOOD (  14.38  )
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
This was originally part of the series here: [1]. The other patches
were already applied, but this one is missing in regulator/for-next
and linux-next, which is why I'm resending.

[1] https://patchwork.kernel.org/project/linux-arm-kernel/cover/20241218152842.97483-1-frieder@fris.de/
---
---
 drivers/regulator/pca9450-regulator.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/regulator/pca9450-regulator.c b/drivers/regulator/pca9450-regulator.c
index 8f81d813640d..a56f3ab754fa 100644
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
 
@@ -1100,6 +1104,9 @@ static int pca9450_i2c_probe(struct i2c_client *i2c)
 		return ret;
 	}
 
+	pca9450->sd_vsel_fixed_low =
+		of_property_read_bool(ldo5->dev.of_node, "nxp,sd-vsel-fixed-low");
+
 	dev_info(&i2c->dev, "%s probed.\n",
 		type == PCA9450_TYPE_PCA9450A ? "pca9450a" :
 		(type == PCA9450_TYPE_PCA9451A ? "pca9451a" : "pca9450bc"));
-- 
2.48.1

