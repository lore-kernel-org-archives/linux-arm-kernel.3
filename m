Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4450FE7718D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Dec 2024 10:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6aCxR0l8EvSQGKG5+yEFrWRsCLXuZHQCauP7BxS/fhM=; b=3zXo0st+fUt8AS5fQNN3xiefAc
	Ua86hGmmtByuD0o8ay2z+Y0XIjhxB23UPOKUT9Wvx8zg5FCuJeCaPMvRRv59GuXQPXJnqF8x46+W/
	a0MN7hCbYQKF2vDElwlinmK3L12FGRwUvCGPzsX6GiR72OGTcjLqmdJdZoFJNGCmI8o4oq4sGnXci
	gGYnX84hbyDREjJYdeyAHWgE9Jq86D3nrpOXBfndLfqE/SOq/uPXuzx8/VjUyQUuH36COHoGPugur
	bmgPJeEKEF3ImeR7ZzhfPdPIUSlWpFGGIdwjzTTD1bEtJkAraDngyTqhxy85LWWBOSupQ2LwqQJUs
	eFlx8Kww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQOpv-0000000Defb-0uTX;
	Wed, 25 Dec 2024 10:41:55 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQOmQ-0000000De8o-0Ytg;
	Wed, 25 Dec 2024 10:38:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=6aCxR
	0l8EvSQGKG5+yEFrWRsCLXuZHQCauP7BxS/fhM=; b=KzBv9JSmXd62/Ko0aCDck
	jLFtpQvlNfuvaupAt6/3zYKUGeoNsloVUU6CpyUXLT3ngQXLn6jkSttLsD3Kaw3z
	HkRu3FVz3d6UYfyYsgLRLb31gASShuJCv0qnPepvMWYWYdFU5RU5kwGuoSkSWwug
	7OKKO07qCPvpW+xdiPm96E=
Received: from ProDesk.. (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgCnfIF24GtnkqkWCg--.3201S3;
	Wed, 25 Dec 2024 18:37:47 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: cristian.ciocaltea@collabora.com,
	krzk+dt@kernel.org,
	mripard@kernel.org,
	hjc@rock-chips.com,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH 1/3] drm/rockchip: dw_hdmi_qp: Add platform ctrl callback
Date: Wed, 25 Dec 2024 18:37:29 +0800
Message-ID: <20241225103741.364597-2-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241225103741.364597-1-andyshrk@163.com>
References: <20241225103741.364597-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PygvCgCnfIF24GtnkqkWCg--.3201S3
X-Coremail-Antispam: 1Uf129KBjvJXoW3WFWrZF43WF4xJFyUAw4fKrg_yoW7GFWkp3
	yUAw1YyrWkJF47Jr4FvF97tFW2y3W7J3ySqF97tFyYy3WYqrn5KF93Wa1rJr4SvF9xuF47
	C39Yya4rJF1UGFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jSSoJUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqR3AXmdr3gYzHgAAsT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_023818_578685_2A7F60F6 
X-CRM114-Status: GOOD (  13.64  )
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

 .../gpu/drm/rockchip/dw_hdmi_qp-rockchip.c    | 81 ++++++++++++-------
 1 file changed, 54 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index c36fc130b734..b21e868e7c16 100644
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
 
@@ -282,6 +327,12 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
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
 
@@ -357,31 +408,7 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
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
 
@@ -394,8 +421,8 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
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


