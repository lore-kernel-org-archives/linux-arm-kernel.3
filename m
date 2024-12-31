Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE917E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Dec 2024 09:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GGNk+E6dN1fEhd5Gt/Vz/ei4dfIItKSH9jCkiZwv9sY=; b=0VlwpTK1rsi+J7kIvfUDfOhcMP
	M/zG5lBgfEpp3QZmD188oN/zbOlFrQB6KJqaCm00vgMqKw9rIuxBt6hmnDuHupuFhJ7RgSp4OQ2ki
	prwJ9N7Ul9eZzJBvzQwDxIgf0Z6LxsHdgkg/mMBNOwIyQIbpjjtgcapxJB8SssbupngaiAx0eJdMU
	tmBQpm5ku0PjzH3YfySZduJxGHbkCV5B/c24ctI50tPV8I1rqq4sTS1Tthka3XWkCgSuL5COLeJUr
	EvXriLYJfe1PxJjImpQg6MZpOK9++B6AfgRXj4qMLtw0npzE0dMHb5sM7LumcFGsaKLOXTClTpnJb
	qpjAXasg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSYrd-00000006yV5-43AL;
	Tue, 31 Dec 2024 09:48:37 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSYo1-00000006xe9-44q0;
	Tue, 31 Dec 2024 09:44:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=GGNk+E6dN1fEhd5Gt/Vz/ei4dfIItKSH9jCkiZwv9sY=;
	b=HbGIzSfy5SNCKN8MSGGkVz1hsF8QY1jnejLcZS9JEQMYA39C7rCh1FXoMVswFU
	dLx8KiQgxVfwuteOQEJ+U5a2MjMxJeOhjPsZLkpi4PCDV26KHfsVivRrAjaniFdj
	tVcAco4xxzgp61VjnRAeo+PsZlCSRd5Yzk51v0CKtdyvY=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wD3v8P6vHNnCZWrCw--.29543S3;
	Tue, 31 Dec 2024 17:44:30 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: krzk+dt@kernel.org,
	mripard@kernel.org,
	robh@kernel.org,
	hjc@rock-chips.com,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v2 1/3] drm/rockchip: dw_hdmi_qp: Add platform ctrl callback
Date: Tue, 31 Dec 2024 17:44:17 +0800
Message-ID: <20241231094425.253398-2-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241231094425.253398-1-andyshrk@163.com>
References: <20241231094425.253398-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3v8P6vHNnCZWrCw--.29543S3
X-Coremail-Antispam: 1Uf129KBjvJXoW3WFWrZF4UurWDGFyxAr13urg_yoW7ArW8p3
	yUAw1YyrWkJF47Xr4FvF97tFW2y3W7J3ySqF97tFyYy3WFqrn5KF93Wa15Jr4SvF9xuF47
	C39Yy34rJF1UGFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j4eHDUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0hnGXmdzt4WQFgAAsz
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241231_014454_403693_59F81161 
X-CRM114-Status: GOOD (  14.67  )
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

There are some control bits for IO and interrupts status scattered
across different GRF on differt SOC.
Add platform callback for this IO setting and interrupts status
handling.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

---

Changes in v2:
- Fix compilation warning: unused variable ‘val’ [-Wunused-variable]

 .../gpu/drm/rockchip/dw_hdmi_qp-rockchip.c    | 82 ++++++++++++-------
 1 file changed, 54 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index c36fc130b734..711bbe1c7470 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -62,6 +62,12 @@ struct rockchip_hdmi_qp {
 	int port_id;
 };
 
+struct rockchip_hdmi_qp_ctrl_ops {
+	void (*io_init)(struct rockchip_hdmi_qp *hdmi);
+	irqreturn_t (*irq_callback)(int irq, void *dev_id);
+	irqreturn_t (*hardirq_callback)(int irq, void *dev_id);
+};
+
 static struct rockchip_hdmi_qp *to_rockchip_hdmi_qp(struct drm_encoder *encoder)
 {
 	struct rockchip_encoder *rkencoder = to_rockchip_encoder(encoder);
@@ -226,9 +232,47 @@ static irqreturn_t dw_hdmi_qp_rk3588_irq(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+static void dw_hdmi_qp_rk3588_io_init(struct rockchip_hdmi_qp *hdmi)
+{
+	u32 val;
+
+	val = HIWORD_UPDATE(RK3588_SCLIN_MASK, RK3588_SCLIN_MASK) |
+	      HIWORD_UPDATE(RK3588_SDAIN_MASK, RK3588_SDAIN_MASK) |
+	      HIWORD_UPDATE(RK3588_MODE_MASK, RK3588_MODE_MASK) |
+	      HIWORD_UPDATE(RK3588_I2S_SEL_MASK, RK3588_I2S_SEL_MASK);
+
+	regmap_write(hdmi->vo_regmap,
+		     hdmi->port_id ? RK3588_GRF_VO1_CON6 : RK3588_GRF_VO1_CON3,
+		     val);
+
+	val = HIWORD_UPDATE(RK3588_SET_HPD_PATH_MASK, RK3588_SET_HPD_PATH_MASK);
+	regmap_write(hdmi->regmap, RK3588_GRF_SOC_CON7, val);
+
+	if (hdmi->port_id)
+		val = HIWORD_UPDATE(RK3588_HDMI1_GRANT_SEL,
+				RK3588_HDMI1_GRANT_SEL);
+	else
+		val = HIWORD_UPDATE(RK3588_HDMI0_GRANT_SEL,
+				RK3588_HDMI0_GRANT_SEL);
+	regmap_write(hdmi->vo_regmap, RK3588_GRF_VO1_CON9, val);
+
+	if (hdmi->port_id)
+		val = HIWORD_UPDATE(RK3588_HDMI1_HPD_INT_MSK, RK3588_HDMI1_HPD_INT_MSK);
+	else
+		val = HIWORD_UPDATE(RK3588_HDMI0_HPD_INT_MSK, RK3588_HDMI0_HPD_INT_MSK);
+	regmap_write(hdmi->regmap, RK3588_GRF_SOC_CON2, val);
+}
+
+static const struct rockchip_hdmi_qp_ctrl_ops rk3588_hdmi_ctrl_ops = {
+	.io_init		= dw_hdmi_qp_rk3588_io_init,
+	.irq_callback	        = dw_hdmi_qp_rk3588_irq,
+	.hardirq_callback	= dw_hdmi_qp_rk3588_hardirq,
+};
+
 struct rockchip_hdmi_qp_cfg {
 	unsigned int num_ports;
 	unsigned int port_ids[MAX_HDMI_PORT_NUM];
+	const struct rockchip_hdmi_qp_ctrl_ops *ctrl_ops;
 	const struct dw_hdmi_qp_phy_ops *phy_ops;
 };
 
@@ -238,6 +282,7 @@ static const struct rockchip_hdmi_qp_cfg rk3588_hdmi_cfg = {
 		0xfde80000,
 		0xfdea0000,
 	},
+	.ctrl_ops = &rk3588_hdmi_ctrl_ops,
 	.phy_ops = &rk3588_hdmi_phy_ops,
 };
 
@@ -265,7 +310,6 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 	struct resource *res;
 	struct clk *clk;
 	int ret, irq, i;
-	u32 val;
 
 	if (!pdev->dev.of_node)
 		return -ENODEV;
@@ -282,6 +326,12 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 	if (!cfg)
 		return -ENODEV;
 
+	if (!cfg->ctrl_ops || !cfg->ctrl_ops->io_init ||
+	    !cfg->ctrl_ops->irq_callback || !cfg->ctrl_ops->irq_callback) {
+		dev_err(dev, "Missing platform ctrl ops\n");
+		return -ENODEV;
+	}
+
 	hdmi->dev = &pdev->dev;
 	hdmi->port_id = -ENODEV;
 
@@ -357,31 +407,7 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 		return ret;
 	}
 
-	val = HIWORD_UPDATE(RK3588_SCLIN_MASK, RK3588_SCLIN_MASK) |
-	      HIWORD_UPDATE(RK3588_SDAIN_MASK, RK3588_SDAIN_MASK) |
-	      HIWORD_UPDATE(RK3588_MODE_MASK, RK3588_MODE_MASK) |
-	      HIWORD_UPDATE(RK3588_I2S_SEL_MASK, RK3588_I2S_SEL_MASK);
-	regmap_write(hdmi->vo_regmap,
-		     hdmi->port_id ? RK3588_GRF_VO1_CON6 : RK3588_GRF_VO1_CON3,
-		     val);
-
-	val = HIWORD_UPDATE(RK3588_SET_HPD_PATH_MASK,
-			    RK3588_SET_HPD_PATH_MASK);
-	regmap_write(hdmi->regmap, RK3588_GRF_SOC_CON7, val);
-
-	if (hdmi->port_id)
-		val = HIWORD_UPDATE(RK3588_HDMI1_GRANT_SEL,
-				    RK3588_HDMI1_GRANT_SEL);
-	else
-		val = HIWORD_UPDATE(RK3588_HDMI0_GRANT_SEL,
-				    RK3588_HDMI0_GRANT_SEL);
-	regmap_write(hdmi->vo_regmap, RK3588_GRF_VO1_CON9, val);
-
-	if (hdmi->port_id)
-		val = HIWORD_UPDATE(RK3588_HDMI1_HPD_INT_MSK, RK3588_HDMI1_HPD_INT_MSK);
-	else
-		val = HIWORD_UPDATE(RK3588_HDMI0_HPD_INT_MSK, RK3588_HDMI0_HPD_INT_MSK);
-	regmap_write(hdmi->regmap, RK3588_GRF_SOC_CON2, val);
+	cfg->ctrl_ops->io_init(hdmi);
 
 	INIT_DELAYED_WORK(&hdmi->hpd_work, dw_hdmi_qp_rk3588_hpd_work);
 
@@ -394,8 +420,8 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 		return irq;
 
 	ret = devm_request_threaded_irq(hdmi->dev, irq,
-					dw_hdmi_qp_rk3588_hardirq,
-					dw_hdmi_qp_rk3588_irq,
+					cfg->ctrl_ops->hardirq_callback,
+					cfg->ctrl_ops->irq_callback,
 					IRQF_SHARED, "dw-hdmi-qp-hpd",
 					hdmi);
 	if (ret)
-- 
2.34.1


