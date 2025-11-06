Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E5A9CCFA0D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 02:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hbx/QURwIjeUHxXbRkGU120xvy1OzyC8WzA8ZpLbBU8=; b=WxnST6WYHpFlL/Klzd8R9WGDQ5
	dCvfdQriclR8ZU+KMpgFM3MUTAOWcZDRG045SGdsVA/VKYpm75avzfz5y1vZvMBt0pJpqNOt6kH3F
	QGGOGsyiKJDAdI96+NczyvJ5r6OFDLt1S6v3erqPbmQQgZcVAtyNIp/arN/XV6Wnr7eIDoHnD8uoU
	uLMVrztxl/iCaLzoMlOI1p5xMpqDuwcM+pzJNzwA3U4hxkTh9wpS3kTnaRIfo1h2IsESOctZah4Kg
	ezC2IueQEpLHPPU87rJPvl9cq95h0BvhtI/i09f2TnzjWPPhpqbi014vuetVSNdj7V5qM+j2EWjDe
	bIkyvWAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGpPd-0000000EjjZ-2g3M;
	Thu, 06 Nov 2025 02:07:45 +0000
Received: from smtpbg150.qq.com ([18.132.163.193])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGpPa-0000000EjHW-0ixY;
	Thu, 06 Nov 2025 02:07:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1762394831;
	bh=hbx/QURwIjeUHxXbRkGU120xvy1OzyC8WzA8ZpLbBU8=;
	h=From:To:Subject:Date:Message-Id;
	b=dbMNM1WcveNPRCNa+XdBH4Mgf/F0VHbSBQyfSdVE803JWmgojptyukcQt1+nWaFX6
	 3E1jAaXNr818MRUOQIQ8owxVyeDhlsi0Er56qHBGPlpFEdTOhuGvkcOzbgJNWLfQ80
	 AsFro4FFyWDnb9V9IqX3s0ngIZ+ZXhxal1q4+sc4=
X-QQ-mid: esmtpgz15t1762394829t0f07c30b
X-QQ-Originating-IP: QZPMgX2USNKo5HEA2++y4wEpyHyL9QH/EATI2ze4C+o=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 06 Nov 2025 10:07:07 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4356867921177031121
From: Chaoyi Chen <kernel@airkyi.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-phy@lists.infradead.org,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Hongming Zou <hongming.zou@rock-chips.com>
Subject: [PATCH 7/9] drm/rockchip: dsi: Add support for rk3506
Date: Thu,  6 Nov 2025 10:06:30 +0800
Message-Id: <20251106020632.92-8-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251106020632.92-1-kernel@airkyi.com>
References: <20251106020632.92-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: M7OGOwGJ/FwKEJNhnwTmktqSTqpPSEiEb4tzm1v004AAuRZv2UE0hzKK
	urqskMQaMtrJaOUrzCVyyKtPM1P1KQ2lcfVqw0v5vF/Ete7BZdPONjh8vrGe22hTnJmcUJi
	89SSxFIv/dNwKAugT6ry3rzoJoRD2khwH9nPUL/mmEKzFkCw12W9GQJ1mPDQwMUXhyEoyrF
	u2i6Pa5wKCzmwHqwUCd2XCN97v6j1+n9ZYmQGBVyWumSGDQ7qZYVuOKVpsbA+V1RyNBvSId
	tDvZFP518ZLfb4HmGS2b7YqI22Np/32EmiI/9MnHgjAAl/Av5QS9U9Z5nVxp5wAZZU2mP3d
	RMNp5hkZ1RCZjsCHXz5fBs7Wj/JlBe0YkivmnwweYjEyI89TtVOn2Zd2zp+GhMnLyHCbv8A
	/ZrQObm2zvP5MMsx0/wGDA4YBzcy5WeKIHt1AjEIxXniZ3Rnl0AUEXUk4Vyj++1Hjg7tx+y
	RPK58lmJJLhlmVgYFPs1OgyL5mnaavHx4zx4XVdw1tfQbKvyT/nvZOOD/SSBvfqSDVrrdjV
	wJ6xf5ifG1p7+lP1L9p3n/zqSVbbtZ9AVrPJc0OsPQ8aVf8wfGk221PKXEiuhBTrgvwPVgD
	f2WBj6WIFn7mSC9gmEvpfdby/m0piJDz2qUyQu6qhI9nuewO/62M1Fc6f1Oy6DM798/n60E
	O/QrqkxsuZ9o6mRGHvsrED+3CA0SfwiS3+okq63DPFEc4c9QX0fDBdaCQUItaeyOdrDSg9X
	E/qmwRmJA7dBP6xtkznXEJJKXelxHLiEuUAgH+tEheikZzIuKCDfjVgWqC2d0Y/UndBhHGZ
	McUeElQFh0JC1ouWR+ycH9hXLGhyyxsR6zgkhxd9d4M4MK/1k7UMoAkEXhs10yXapblKnXu
	MSU6G8smsVywpb3t7rxkPMJdfxpgGYkriDArOPoLBQ2rqMryIVNOWsfIDmbBJOYhX7nRGIB
	gOLvjovBqLFV1BvLQAWGv8EJhdsCMH1TrPZHZH++nau1Oli19Uot9vXqbDB3vEytn8Wg=
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_180742_793787_1BF49A87 
X-CRM114-Status: GOOD (  12.27  )
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

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

The dsi controller found on RK3506 supports up to 2 lanes.

Signed-off-by: Hongming Zou <hongming.zou@rock-chips.com>
Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---
 .../gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
index 5523911b990d..06e58cf287d3 100644
--- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
@@ -192,6 +192,11 @@
 #define RK3568_DSI0_TURNDISABLE		BIT(2)
 #define RK3568_DSI0_FORCERXMODE		BIT(0)
 
+#define RK3506_SYS_GRF_SOC_CON6		0x0018
+#define RK3506_DSI_FORCETXSTOPMODE	(0xf << 4)
+#define RK3506_DSI_TURNDISABLE		BIT(2)
+#define RK3506_DSI_FORCERXMODE		BIT(0)
+
 /*
  * Note these registers do not appear in the datasheet, they are
  * however present in the BSP driver which is where these values
@@ -1643,6 +1648,18 @@ static const struct rockchip_dw_dsi_chip_data rk3399_chip_data[] = {
 	{ /* sentinel */ }
 };
 
+static const struct rockchip_dw_dsi_chip_data rk3506_chip_data[] = {
+	{
+		.reg = 0xff640000,
+		.lanecfg1_grf_reg = RK3506_SYS_GRF_SOC_CON6,
+		.lanecfg1 = (FIELD_PREP_WM16_CONST(RK3506_DSI_TURNDISABLE, 0) |
+			     FIELD_PREP_WM16_CONST(RK3506_DSI_FORCERXMODE, 0) |
+			     FIELD_PREP_WM16_CONST(RK3506_DSI_FORCETXSTOPMODE, 0)),
+		.max_data_lanes = 2,
+	},
+	{ /* sentinel */ }
+};
+
 static const struct rockchip_dw_dsi_chip_data rk3568_chip_data[] = {
 	{
 		.reg = 0xfe060000,
@@ -1690,6 +1707,9 @@ static const struct of_device_id dw_mipi_dsi_rockchip_dt_ids[] = {
 	}, {
 	 .compatible = "rockchip,rk3399-mipi-dsi",
 	 .data = &rk3399_chip_data,
+	}, {
+	 .compatible = "rockchip,rk3506-mipi-dsi",
+	 .data = &rk3506_chip_data,
 	}, {
 	 .compatible = "rockchip,rk3568-mipi-dsi",
 	 .data = &rk3568_chip_data,
-- 
2.51.1


