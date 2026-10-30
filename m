Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15305606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 06:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YH/F7pHv;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=X0BosyH7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=F/XPgbmsTeE5iFBKrHX05+VdT/Xx9ShJ4HYEs4+/nlQ=; b=YH/F7pHv5r9klS
	ZkI0cMt78HTglAn5s/0Zy5CLfdQmNnPPGH8W/mCLHqM9+sNcZpPPwc2ZnZt2tHRK5rRLRhqXgM2JA
	/o4ehn1TeR6bUVT+ZNUfPYIAenyIVyBuJNy3ATQI0SYdIRj/wWIgI5iTvuXsPqwTp3SmT3cs6l+Ye
	odUrh0Q5t6czK/emSvNT81YnotlRLrF6q9GUunXOcSVNIikfaUwxvWq5nNPp491Mxn+VnWDRiI5p5
	G1X/0xDHCz8Sg05oYkIPLf9TGYLnkaNbdbTSTeot8108oDDbGNIT97m9q1+v1K/l100OzO/csCy1j
	cHg7NYfunQmJ1mE11THA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMgRG-0000000Avlv-2B29;
	Fri, 30 Oct 2026 06:50:10 +0000
Received: from mail-m81143.xmail.ntesmail.com ([156.224.81.143])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMgQn-0000000AvEO-1PJW;
	Fri, 30 Oct 2026 06:49:43 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 52e796950;
	Fri, 30 Oct 2026 14:49:35 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: Sandy Huang <hjc@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Robert Foss <rfoss@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Dave Jones <s.dave.jones@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v4 5/6] drm/rockchip: analogix_dp: Add support for RK3568
Date: Fri, 30 Oct 2026 14:49:04 +0800
Message-Id: <20261030064905.2248999-6-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261030064905.2248999-1-damon.ding@rock-chips.com>
References: <20261030064905.2248999-1-damon.ding@rock-chips.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa18b922d7e03a8kunme14bef9979434
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1kYFggdWUFKV1ktWUFJV1kPCRoVCBIfWUFZGU8ZQlZKQh4ZHh4YSh
	9DQ0JWFRQJFhoXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0
	tIVUpLSEpKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=X0BosyH7FRo3N8MGfWVfVYDuO8s/2WYA1ETw0yYv9VL3GSPuxagFOHhDJcU+wg4Amr2dbPteIBiAqpxl5WMhcU0+eDbC3Bl7rKhakYfclCTRmyImtcaJdyGmfvSfO6wM6BLApNBVWPzcfND+AHY+d+z/ZSi/X/oNFBmVzVZnnGU=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=F/XPgbmsTeE5iFBKrHX05+VdT/Xx9ShJ4HYEs4+/nlQ=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_234941_713457_BC9D9215 
X-CRM114-Status: GOOD (  15.38  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The RK3568 eDP controller does not require any GRF configurations,
so make the "rockchip,grf" property optional.  Also enable the
optional avdd-0v9 and avdd-1v8 supplies which power the eDP PHY.

Add the "rockchip,rk3568-edp" compatible along with its chip data;
the register base in the chip data is used to match the platform
device memory resource.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

---

Changes in v2:
- Fail the probe when the chip data requires GRF configurations while
  the "rockchip,grf" property is missing. (Sashiko)
---
 .../gpu/drm/rockchip/analogix_dp-rockchip.c   | 24 ++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index ccdd4b9ecdb8..38c78360842f 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -320,12 +320,17 @@ static int rockchip_dp_of_probe(struct rockchip_dp_device *dp)
 	struct device *dev = dp->dev;
 	struct device_node *np = dev->of_node;
 	struct clk *clk;
+	int ret;
 
-	dp->grf = syscon_regmap_lookup_by_phandle(np, "rockchip,grf");
+	dp->grf = syscon_regmap_lookup_by_phandle_optional(np, "rockchip,grf");
 	if (IS_ERR(dp->grf))
 		return dev_err_probe(dev, PTR_ERR(dp->grf),
 				     "failed to get rockchip,grf property\n");
 
+	if (!dp->grf && (dp->data->lcdc_sel.valid || dp->data->edp_mode.valid))
+		return dev_err_probe(dev, -EINVAL,
+				     "missing the required rockchip,grf property\n");
+
 	dp->grfclk = devm_clk_get_optional(dev, "grf");
 	if (IS_ERR(dp->grfclk))
 		return dev_err_probe(dev, PTR_ERR(dp->grfclk),
@@ -351,6 +356,14 @@ static int rockchip_dp_of_probe(struct rockchip_dp_device *dp)
 		return dev_err_probe(dev, PTR_ERR(dp->apbrst),
 				     "failed to get apb reset control\n");
 
+	ret = devm_regulator_get_enable_optional(dev, "avdd-0v9");
+	if (ret && ret != -ENODEV)
+		return dev_err_probe(dev, ret, "failed to enable avdd-0v9\n");
+
+	ret = devm_regulator_get_enable_optional(dev, "avdd-1v8");
+	if (ret && ret != -ENODEV)
+		return dev_err_probe(dev, ret, "failed to enable avdd-1v8\n");
+
 	return 0;
 }
 
@@ -530,6 +543,14 @@ static const struct rockchip_dp_chip_data rk3288_dp[] = {
 	{ /* sentinel */ }
 };
 
+static const struct rockchip_dp_chip_data rk3568_edp[] = {
+	{
+		.chip_type = RK3568_EDP,
+		.reg = 0xfe0c0000,
+	},
+	{ /* sentinel */ }
+};
+
 static const struct rockchip_dp_chip_data rk3576_edp[] = {
 	{
 		.chip_type = RK3576_EDP,
@@ -555,6 +576,7 @@ static const struct rockchip_dp_chip_data rk3588_edp[] = {
 static const struct of_device_id rockchip_dp_dt_ids[] = {
 	{.compatible = "rockchip,rk3288-dp", .data = &rk3288_dp },
 	{.compatible = "rockchip,rk3399-edp", .data = &rk3399_edp },
+	{.compatible = "rockchip,rk3568-edp", .data = &rk3568_edp },
 	{.compatible = "rockchip,rk3576-edp", .data = &rk3576_edp },
 	{.compatible = "rockchip,rk3588-edp", .data = &rk3588_edp },
 	{}
-- 
2.34.1


