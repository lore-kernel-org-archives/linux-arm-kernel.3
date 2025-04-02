Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C90D3C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 12:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CBuVD5mLxW1qWVh3yysFaNPsNmOWSZ6Qe90zC/Vn6b4=; b=PxZltbykZJTXGx1iAjMhu76NpA
	c4NFfxdiAsbV5iVsyk7NqQxbJONVrxUs/CboABG5xv+W1YfuUfnZyoReBvWt67RbPOzIUReN8YA5W
	svFy2dj7NhNaAa+isft5fez2Q1BBMsbcV+MOScEu17y1+HbhHTS9QNc5PIRwfNED6Jdeyz+pmxVMz
	rxH84vjINNLHEPhlxWGllvpvFDFsGfUueuDUV8k3v50TEZAymBFPwy+IU6CTDp5hk4YMzsg3Il9Dp
	1J8ykS5MirAjGxqlnix8k7L+eHX548NhsP4I0icFHsrCsi3FAWA462O7jdKt97w0uuoLW2r9ewTnj
	BpiTQp6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzxN7-000000066a1-23V7;
	Wed, 02 Apr 2025 12:39:09 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzxGZ-000000065KB-1TYz;
	Wed, 02 Apr 2025 12:32:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=CBuVD
	5mLxW1qWVh3yysFaNPsNmOWSZ6Qe90zC/Vn6b4=; b=M7F54b6XJU+kRYft5LtkL
	Z6VagWP+2LCz3EVq3DxVZzZKAdHopIr1/Y079LCLE2IzRkka9P7h7LxY0BAjQrtB
	HOISEyKLKPyUe2qVBgZs7NKURvHtA5f+BWNtW1qLkWaZpBUqvk/LChH7EVjrDkE8
	FN9cRUgvV71k5ayvX5R75E=
Received: from ProDesk.. (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgDnd405Lu1nJwOJBA--.36321S6;
	Wed, 02 Apr 2025 20:32:01 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	hjc@rock-chips.com,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	dmitry.baryshkov@oss.qualcomm.com,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v3 4/7] drm/rockchip: inno-hdmi: Fix video timing HSYNC/VSYNC polarity setting for rk3036
Date: Wed,  2 Apr 2025 20:31:38 +0800
Message-ID: <20250402123150.238234-5-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250402123150.238234-1-andyshrk@163.com>
References: <20250402123150.238234-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PygvCgDnd405Lu1nJwOJBA--.36321S6
X-Coremail-Antispam: 1Uf129KBjvJXoWxZr17Gry3Ar18CFW5Xw4xZwb_yoWrJF4xpa
	yUCFyUJF43Xa13Jw4xAa97Cr1aga97ta12yry7W3Wa9w12gr9YyF1kZF43uF1rAF93Was7
	trWkGa4UG3W7Zw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07js2-5UUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqB0jXmftKV94EgAAse
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_053223_789074_5103E56B 
X-CRM114-Status: GOOD (  16.66  )
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

From: Andy Yan <andy.yan@rock-chips.com>

The HSYNC/VSYNC polarity of rk3036 HDMI are controlled by GRF.
Without the polarity configuration in GRF, it can be observed
from the HDMI protocol analyzer that the H/V front/back timing
output by RK3036 HDMI are currently not in line with the specifications.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

---

(no changes since v2)

Changes in v2:
- First included in this series

 drivers/gpu/drm/rockchip/inno_hdmi.c | 36 +++++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index e891d42dd08a4..db4b4038e51d5 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -10,10 +10,12 @@
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/hdmi.h>
+#include <linux/mfd/syscon.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/platform_device.h>
+#include <linux/regmap.h>
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
@@ -29,8 +31,19 @@
 
 #include "inno_hdmi.h"
 
+#define HIWORD_UPDATE(val, mask)	((val) | (mask) << 16)
+
 #define INNO_HDMI_MIN_TMDS_CLOCK  25000000U
 
+#define RK3036_GRF_SOC_CON2	0x148
+#define RK3036_HDMI_PHSYNC	BIT(4)
+#define RK3036_HDMI_PVSYNC	BIT(5)
+
+enum inno_hdmi_dev_type {
+	RK3036_HDMI,
+	RK3128_HDMI,
+};
+
 struct inno_hdmi_phy_config {
 	unsigned long pixelclock;
 	u8 pre_emphasis;
@@ -38,6 +51,7 @@ struct inno_hdmi_phy_config {
 };
 
 struct inno_hdmi_variant {
+	enum inno_hdmi_dev_type dev_type;
 	struct inno_hdmi_phy_config *phy_configs;
 	struct inno_hdmi_phy_config *default_phy_config;
 };
@@ -58,6 +72,7 @@ struct inno_hdmi {
 	struct clk *pclk;
 	struct clk *refclk;
 	void __iomem *regs;
+	struct regmap *grf;
 
 	struct drm_connector	connector;
 	struct rockchip_encoder	encoder;
@@ -374,7 +389,15 @@ static int inno_hdmi_config_video_csc(struct inno_hdmi *hdmi)
 static int inno_hdmi_config_video_timing(struct inno_hdmi *hdmi,
 					 struct drm_display_mode *mode)
 {
-	int value;
+	int value, psync;
+
+	if (hdmi->variant->dev_type == RK3036_HDMI) {
+		psync = mode->flags & DRM_MODE_FLAG_PHSYNC ? RK3036_HDMI_PHSYNC : 0;
+		value = HIWORD_UPDATE(psync, RK3036_HDMI_PHSYNC);
+		psync = mode->flags & DRM_MODE_FLAG_PVSYNC ? RK3036_HDMI_PVSYNC : 0;
+		value |= HIWORD_UPDATE(psync, RK3036_HDMI_PVSYNC);
+		regmap_write(hdmi->grf, RK3036_GRF_SOC_CON2, value);
+	}
 
 	/* Set detail external video timing polarity and interlace mode */
 	value = v_EXTERANL_VIDEO(1);
@@ -904,6 +927,15 @@ static int inno_hdmi_bind(struct device *dev, struct device *master,
 		goto err_disable_pclk;
 	}
 
+	if (hdmi->variant->dev_type == RK3036_HDMI) {
+		hdmi->grf = syscon_regmap_lookup_by_phandle(dev->of_node, "rockchip,grf");
+		if (IS_ERR(hdmi->grf)) {
+			ret = dev_err_probe(dev, PTR_ERR(hdmi->grf),
+					    "Unable to get rockchip,grf\n");
+			goto err_disable_clk;
+		}
+	}
+
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0) {
 		ret = irq;
@@ -988,11 +1020,13 @@ static void inno_hdmi_remove(struct platform_device *pdev)
 }
 
 static const struct inno_hdmi_variant rk3036_inno_hdmi_variant = {
+	.dev_type = RK3036_HDMI,
 	.phy_configs = rk3036_hdmi_phy_configs,
 	.default_phy_config = &rk3036_hdmi_phy_configs[1],
 };
 
 static const struct inno_hdmi_variant rk3128_inno_hdmi_variant = {
+	.dev_type = RK3128_HDMI,
 	.phy_configs = rk3128_hdmi_phy_configs,
 	.default_phy_config = &rk3128_hdmi_phy_configs[1],
 };
-- 
2.43.0


