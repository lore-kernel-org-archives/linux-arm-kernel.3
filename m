Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BA53C35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 10:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fmWIS0wLHvOfDdrgbj8ORSE1eJQwOVhMX/zX7anGKW4=; b=w+ejZzRreons8MFhbHqppZdcaU
	kc/ZqypLDiDWmb1h0t889VFk9e169q+KKmBvT9oj81u/UuK+kv/3J/g6SZ9OuU/0o8f4JReVBTtPc
	R6Un25P0iy8PCNT3ptvr1m2QwnU/fFctH8rTItt0SlXpgpLre3SdgiwFPOibw7tO3KzrLCDHRypzN
	LB5N1rTwbY4nhSS912A+KFGDC04YRDyIpl4fmGkzK65Zinw81DrWCqt1vTXv5CpoPe3YcBkzyPP8f
	Qo3CdVqwpAKLtwfNUx72BTWLxckMqK0JL88gqamTt9NYBoDSPcxnlSPxAbtpdjSW6QtW20du7D3oC
	qUhIgjaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu7lC-00000002ASc-3IIx;
	Mon, 17 Mar 2025 10:31:54 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu7hp-000000029Xm-0D8D;
	Mon, 17 Mar 2025 10:28:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=fmWIS
	0wLHvOfDdrgbj8ORSE1eJQwOVhMX/zX7anGKW4=; b=SqekagC72tCKT25KHSmS4
	/+b/w+C575D1N98h4BDUoxjOxnTCMxhJz4/JPOgO//WZqLyL2LezzhFK4lhH9+ng
	XzK09N4vXHxDZpHOogN3tAa/TN2/mpv3caiedJldEyp/q8pNoY4wuUXTccxfdjKu
	Ci4hDKUATluwrmqbDmq0dk=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wBnuTwy+ddnhLtwTQ--.47861S2;
	Mon, 17 Mar 2025 18:28:06 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: cristian.ciocaltea@collabora.com,
	hjc@rock-chips.com,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andy.yan@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH v2] drm/rockchip: dw_hdmi_qp: Fix io init for dw_hdmi_qp_rockchip_resume
Date: Mon, 17 Mar 2025 18:27:53 +0800
Message-ID: <20250317102757.565679-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wBnuTwy+ddnhLtwTQ--.47861S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZFWfXFWrGr45XFWxGrWUtwb_yoW8Kw45pw
	4UAa4jkrWkGr47Xrn8ZFnrArW2k3W7Jw4SqFWxKa4vv3W0qrn3KF93Wa1rXr43ZF9xuF4a
	krWvy34fJF4UXFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j7uc_UUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0h4TXmfX95EooAAAsf
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_032825_502541_8464344A 
X-CRM114-Status: GOOD (  10.07  )
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

Use cfg->ctrl_ops->io_init callback make it work for all platform.
And it's also gets rid of code duplication

Fixes: 3f60dbd40d3f ("drm/rockchip: dw_hdmi_qp: Add platform ctrl callback")
Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

---

Changes in v2:
- Store the ctrl_ops in struct rockchip_hdmi_qp

 .../gpu/drm/rockchip/dw_hdmi_qp-rockchip.c    | 23 +++----------------
 1 file changed, 3 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index 3d1dddb34603..7d531b6f4c09 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -94,6 +94,7 @@ struct rockchip_hdmi_qp {
 	struct gpio_desc *enable_gpio;
 	struct delayed_work hpd_work;
 	int port_id;
+	const struct rockchip_hdmi_qp_ctrl_ops *ctrl_ops;
 };
 
 struct rockchip_hdmi_qp_ctrl_ops {
@@ -461,6 +462,7 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 		return -ENODEV;
 	}
 
+	hdmi->ctrl_ops = cfg->ctrl_ops;
 	hdmi->dev = &pdev->dev;
 	hdmi->port_id = -ENODEV;
 
@@ -600,27 +602,8 @@ static void dw_hdmi_qp_rockchip_remove(struct platform_device *pdev)
 static int __maybe_unused dw_hdmi_qp_rockchip_resume(struct device *dev)
 {
 	struct rockchip_hdmi_qp *hdmi = dev_get_drvdata(dev);
-	u32 val;
 
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
+	hdmi->ctrl_ops->io_init(hdmi);
 
 	dw_hdmi_qp_resume(dev, hdmi->hdmi);
 
-- 
2.43.0


