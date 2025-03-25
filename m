Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D397C36005
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 13:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z+Uzch6EUA5KKSDVbfXUEIaM57kueShEZfjW0O0iCdA=; b=4jaGQS+HtbHhDmGHViqZP3+esj
	6lFFn1nPblKKiR0Oerrnq2Wn/vIMzGu0553LrUTGV1g1ZSIXH5zUGzuJsLCx+HMtEGNOSvYKeYejd
	04evLrUJFoe+7pfcNUHrZhvuG+gtylBr2BLFIj2UK8nj4GlEztsodFVEiHDeeVHdwG2++/KCVYXWS
	Ug7R0NvujubHcC+07RgMLkkIod+sdlxYlobaPdCL/HpyFVyliur745ameJEAcaW0wy0EGodjW7YkT
	82TXNsr+rcPhSEWaq6RNtegScx36Ava+wuLEVjlbg9Gyq0Ic14Pb7t4wkV5PJKqpBtdBnpE6Y6b2I
	jJ1DeTpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx4Wq-0000000644i-4BtG;
	Tue, 25 Mar 2025 13:41:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx4ML-000000062Gs-0vyz;
	Tue, 25 Mar 2025 13:30:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Z+Uzch6EUA5KKSDVbfXUEIaM57kueShEZfjW0O0iCdA=; b=MsTc8mYl1LkVGPaYcI6t7N9RFZ
	9+A6Mm4lgoUI4OaKuyf5odbEa7MOAoKnoPjmocTS0P8iRqLwxjvBWorBlt3qDm175k4DWbnlyYOtX
	VlMfAzMY/NxfDgeX+QcCvdEIWcNh25hjn12rGR/HGhyHf0bbP++bxUURKA+f79wewltfE9FTY7fEf
	UlZkAB1N0kbNFMBidwFOjHOL/fhVJCg1RkNIKMqlKGhfTcEINfx4kWB/DWqmd77mWWJAq4Dphog4e
	v/Lp+CSB1MdEzU3/VKG6nrmWIr6QL2vNK2FC1dCIhVRwrmgtKqS8FV5HJBc9kDOBar5cCB/70av3w
	T1zKGMlQ==;
Received: from m16.mail.163.com ([220.197.31.5])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tx4MH-00000005Sng-1sYV;
	Tue, 25 Mar 2025 13:30:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=Z+Uzc
	h6EUA5KKSDVbfXUEIaM57kueShEZfjW0O0iCdA=; b=fu7UU5JIFwLPWf3wyRgTx
	+La/s79dVhcUwOCPv96643Rx533kDnz83TXo+H2ZToo7XQWFiDAiv4x9/6s/vv6L
	vpkhSdyPiY6ONRTpFn6avAQJNjTCY4+7q//+UiFeXmUXrkwVvybHsn+lE0+jPaBQ
	znc8T1oZNRrtqs4+CmrDvo=
Received: from ProDesk.. (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgAnc2bLr+JnWNnrAA--.35530S6;
	Tue, 25 Mar 2025 21:29:54 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	hjc@rock-chips.com,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v2 4/6] drm/rockchip: inno-hdmi: Fix video timing HSYNC/VSYNC polarity setting for rk3036
Date: Tue, 25 Mar 2025 21:29:38 +0800
Message-ID: <20250325132944.171111-5-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250325132944.171111-1-andyshrk@163.com>
References: <20250325132944.171111-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PygvCgAnc2bLr+JnWNnrAA--.35530S6
X-Coremail-Antispam: 1Uf129KBjvJXoWxZr17Gry3Ar18CFW5Xw4xZwb_yoWrJrWfpa
	y7Ca4UJF43Xa13Jw4xAa93Cr1aga97ta12yry7W3Wa9w12gr9YyF1kZF43uF1rAF93Was7
	trW8Ga4UG3W7Zw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jfeOJUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBkB4bXmfirygTGgAAsA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_133021_995701_7E417E37 
X-CRM114-Status: GOOD (  16.62  )
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


