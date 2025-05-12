Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABC51C3ABCD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 13:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dBS7SAsAp5FhUlU/3iHX21eFkYpu2uCNBgSKCpFIXoc=; b=AyWEdvbsncabZcPRI0dQJk6UZV
	G8baAfMPc6YPY/gsL8avHkF8th2bfwaT+QQPQ1qf5lcnGt5t9UN862g5A2QOxPzl9d4sLb9xm8xiJ
	C4DS8p4YeswuiACVps4wkAQB+pf6804xXeeZvo0QlB+yacKenIKhapkWfFwtTb/vTZkW3ML6vvL+h
	QSKdK0RjVkdCJC0UEA4O/pbqPnbq9z/u0GnUsmXsIfltAb4OUpk2lzH0sEUrPhBxHRB6gFHjkyQdn
	WYriwUeeu+YbXkW0iwCLvhMbBAXRutyG/V8E3JiLKECZM3upyvp2nfi1FCUTLGw7pmUUJ91ALcKAE
	F1RS84pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uETIe-00000009ZX0-2X0A;
	Mon, 12 May 2025 13:34:32 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uESZE-00000009Ql7-0PEu;
	Mon, 12 May 2025 12:47:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=dB
	S7SAsAp5FhUlU/3iHX21eFkYpu2uCNBgSKCpFIXoc=; b=dYEgk0mr8SQrs9C3Yb
	mU0uQ95jeLLh/2SUuUKGtv75BEX7AbJnbBkDRE/oPkQv7kzOro8QdBRuEwi7ZRDV
	MK0WAaFt3v94mYzWD9cHkgMgEyNW7ozuZYXnvGuevseJkpE5jSS+VO7kZ1i9PIxV
	R0OE50jCrxiXCI7EeDADEoQvA=
Received: from ProDesk.. (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgC3chWY7SFoQ+_OAQ--.62400S10;
	Mon, 12 May 2025 20:46:29 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: dmitry.baryshkov@oss.qualcomm.com,
	heiko@sntech.de
Cc: jonas@kwiboo.se,
	Laurent.pinchart@ideasonboard.com,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	hjc@rock-chips.com,
	tzimmermann@suse.de,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v5 08/10] drm/rockchip: inno_hdmi: Simpify clk get/enable by devm_clk_get_enabled api
Date: Mon, 12 May 2025 20:46:09 +0800
Message-ID: <20250512124615.2848731-9-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250512124615.2848731-1-andyshrk@163.com>
References: <20250512124615.2848731-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PigvCgC3chWY7SFoQ+_OAQ--.62400S10
X-Coremail-Antispam: 1Uf129KBjvJXoWxXF1fJr1UGF4fWr43Cry3Jwb_yoW5uw4kpr
	y7AFWYqryxJF4jg34UZF4UJr1FyF4UGa47GrWxWan3AwnxXr15KFW0vryS9FWFyr95Za13
	trWkXFy5Z3WUWF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j8nYwUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0g9LXmgh5MDHDwAAst
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_054736_502301_031B929E 
X-CRM114-Status: GOOD (  12.37  )
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

Make use of devm_clk_get_enabled() to replace devm_clk_get() and
clk_prepare_enable(), which will make the cleanup of clk code simpler.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

---

Changes in v5:
- Split from PATCH 9/10

 drivers/gpu/drm/rockchip/inno_hdmi.c | 50 +++++++---------------------
 1 file changed, 12 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index 776a2aa74e49c..1ab3ad4bde9ea 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -1269,53 +1269,34 @@ static int inno_hdmi_bind(struct device *dev, struct device *master,
 	if (IS_ERR(hdmi->regs))
 		return PTR_ERR(hdmi->regs);
 
-	hdmi->pclk = devm_clk_get(hdmi->dev, "pclk");
+	hdmi->pclk = devm_clk_get_enabled(hdmi->dev, "pclk");
 	if (IS_ERR(hdmi->pclk))
 		return dev_err_probe(dev, PTR_ERR(hdmi->pclk), "Unable to get HDMI pclk\n");
 
-	ret = clk_prepare_enable(hdmi->pclk);
-	if (ret)
-		return dev_err_probe(dev, ret, "Cannot enable HDMI pclk: %d\n", ret);
-
-	hdmi->refclk = devm_clk_get_optional(hdmi->dev, "ref");
-	if (IS_ERR(hdmi->refclk)) {
-		ret = dev_err_probe(dev, PTR_ERR(hdmi->refclk), "Unable to get HDMI refclk\n");
-		goto err_disable_pclk;
-	}
-
-	ret = clk_prepare_enable(hdmi->refclk);
-	if (ret) {
-		ret = dev_err_probe(dev, ret, "Cannot enable HDMI refclk: %d\n", ret);
-		goto err_disable_pclk;
-	}
+	hdmi->refclk = devm_clk_get_optional_enabled(hdmi->dev, "ref");
+	if (IS_ERR(hdmi->refclk))
+		return dev_err_probe(dev, PTR_ERR(hdmi->refclk), "Unable to get HDMI refclk\n");
 
 	if (hdmi->variant->dev_type == RK3036_HDMI) {
 		hdmi->grf = syscon_regmap_lookup_by_phandle(dev->of_node, "rockchip,grf");
-		if (IS_ERR(hdmi->grf)) {
-			ret = dev_err_probe(dev, PTR_ERR(hdmi->grf),
-					    "Unable to get rockchip,grf\n");
-			goto err_disable_clk;
-		}
+		if (IS_ERR(hdmi->grf))
+			return dev_err_probe(dev,
+					     PTR_ERR(hdmi->grf), "Unable to get rockchip,grf\n");
 	}
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		ret = irq;
-		goto err_disable_clk;
-	}
+	if (irq < 0)
+		return irq;
 
 	inno_hdmi_init_hw(hdmi);
 
 	hdmi->ddc = inno_hdmi_i2c_adapter(hdmi);
-	if (IS_ERR(hdmi->ddc)) {
-		ret = PTR_ERR(hdmi->ddc);
-		hdmi->ddc = NULL;
-		goto err_disable_clk;
-	}
+	if (IS_ERR(hdmi->ddc))
+		return PTR_ERR(hdmi->ddc);
 
 	ret = inno_hdmi_register(drm, hdmi);
 	if (ret)
-		goto err_disable_clk;
+		return ret;
 
 	dev_set_drvdata(dev, hdmi);
 
@@ -1329,10 +1310,6 @@ static int inno_hdmi_bind(struct device *dev, struct device *master,
 err_cleanup_hdmi:
 	hdmi->connector.funcs->destroy(&hdmi->connector);
 	hdmi->encoder.encoder.funcs->destroy(&hdmi->encoder.encoder);
-err_disable_clk:
-	clk_disable_unprepare(hdmi->refclk);
-err_disable_pclk:
-	clk_disable_unprepare(hdmi->pclk);
 	return ret;
 }
 
@@ -1343,9 +1320,6 @@ static void inno_hdmi_unbind(struct device *dev, struct device *master,
 
 	hdmi->connector.funcs->destroy(&hdmi->connector);
 	hdmi->encoder.encoder.funcs->destroy(&hdmi->encoder.encoder);
-
-	clk_disable_unprepare(hdmi->refclk);
-	clk_disable_unprepare(hdmi->pclk);
 }
 
 static const struct component_ops inno_hdmi_ops = {
-- 
2.43.0


