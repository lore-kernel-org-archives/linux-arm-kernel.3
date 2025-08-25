Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73D35CA0FEB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 11:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SvpsnnKSxT2F7HCJH8+1BYgotbi9PPcVO1YjvoQk68U=; b=Mwu1+dZMD7InDoFd9sk/SQ+GVU
	DKdHfi7h/fFWyGo90omnuKcDYxYrbG7666ucfry6z8bLxbhkLQk9JDLFlzKHkv2v9GvCi3zcu9ged
	bih7zsh/O/M4GO1onkXcimCjZnX9DyTCHfyVWmnGmQ6HcVTHrLaLNgf/dJtFU+Zi3abhJ26CSQrAC
	jL0j/Qz71zKvxxTJkg7lZxUmkP4sAhVhFmwmhBu8lEnP0iu+TJ7QCwqQpp3sE7ewPrL3Oiw4bYho4
	n1mEBRop3eHsAUYbWw2kAjZgz137nlbCDuXsqtIOKtaLYt7HRjAgza+u+3Ry2lqvuyR7O0T5J0Nll
	Tp8ok7XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqVN4-00000007jnB-1cvt;
	Mon, 25 Aug 2025 11:28:18 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqT0r-00000007Pth-3zMt;
	Mon, 25 Aug 2025 08:57:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756112232;
	bh=7+Og7rUGyFk1HcTP8p4Uyc/PYhGejFb5kkEHeMTwBtE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=e8t1tZDPcuW161VQWs4w0ue0FAugHx845eecL9ak/QF7jzENLXTW2i1NZ1kuPpOo3
	 QureLvkUvzB5b7fxs2ahRl3275k+M7fu/ByWkA3i0FVS58OFRshrBmv9Xx+8s1dZQ2
	 tvq8nGYXON2E0muImZxp1q+NkjOcH07rX9DExONsKx1coznAInXe1YJQv/pVBIc4aQ
	 IUjjFdpj0HyPT0oUs9J7q2j5WcDmbe6KhrdwzYcilOPy722smVYgGYhze7hL06WdIj
	 A+hj7gYWCleSVtkdIvrRVwRDuxfHrKY9g7uPolB7re9Kz5g1YPbNednZJWezpx8sQG
	 7lWCoUvLQKTcg==
Received: from localhost (unknown [82.79.138.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 7752817E059E;
	Mon, 25 Aug 2025 10:57:12 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Mon, 25 Aug 2025 11:56:45 +0300
Subject: [PATCH v3 5/6] drm/rockchip: dw_hdmi_qp: Provide ref clock rate in
 dw_hdmi_qp_plat_data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-rk3588-hdmi-cec-v3-5-95324fb22592@collabora.com>
References: <20250825-rk3588-hdmi-cec-v3-0-95324fb22592@collabora.com>
In-Reply-To: <20250825-rk3588-hdmi-cec-v3-0-95324fb22592@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_015714_140636_F42CF8D8 
X-CRM114-Status: GOOD (  12.77  )
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

In order to support correct initialization of the timer base in the HDMI
QP IP block, setup platform data to include the required reference clock
rate.

While at it, ensure plat_data is zero-initialized in
dw_hdmi_qp_rockchip_bind().

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index 39b46327afd8e4753d96962fad66792d22b33402..5280383febe25cf579c306ec1642557600595e58 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -431,14 +431,15 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 				    void *data)
 {
 	struct platform_device *pdev = to_platform_device(dev);
+	struct dw_hdmi_qp_plat_data plat_data = {};
 	const struct rockchip_hdmi_qp_cfg *cfg;
-	struct dw_hdmi_qp_plat_data plat_data;
 	struct drm_device *drm = data;
 	struct drm_connector *connector;
 	struct drm_encoder *encoder;
 	struct rockchip_hdmi_qp *hdmi;
 	struct resource *res;
 	struct clk_bulk_data *clks;
+	struct clk *ref_clk;
 	int ret, irq, i;
 
 	if (!pdev->dev.of_node)
@@ -508,6 +509,14 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 	if (ret < 0)
 		return dev_err_probe(hdmi->dev, ret, "Failed to get clocks\n");
 
+	ref_clk = clk_get(hdmi->dev, "ref");
+	if (IS_ERR(ref_clk))
+		return dev_err_probe(hdmi->dev, PTR_ERR(ref_clk),
+				     "Failed to get ref clock\n");
+
+	plat_data.ref_clk_rate = clk_get_rate(ref_clk);
+	clk_put(ref_clk);
+
 	hdmi->enable_gpio = devm_gpiod_get_optional(hdmi->dev, "enable",
 						    GPIOD_OUT_HIGH);
 	if (IS_ERR(hdmi->enable_gpio))

-- 
2.50.1


