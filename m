Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DCB7C36014
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 19:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zBoytlFzpBzkXnFDVwjVkSWUKXoG0GUj7KceAaB9YcA=; b=IQkJdHnj9Z0S7rtlolI3wsEx7I
	wMU2RTrMkHDaDSsBwsykjKkrhxZ0Z1//bRJqVaYHPly85qzAqxpvXmwc+p7HOHJvMtc7A3lkbVCEt
	lrtv4QrLiHLL988FfrIFSzGaZlClpMQ3y9Vn1d2oUGX5xz8yUwoMAD2JQZDJ/PffxBUGgAgqxxf/r
	+5kk7/RX8dBgv66JlmrtwKE+ubqUIzxWbwhPDlS15r3qOlm40FVkJHarkSMQgoksMwNpWFFNp4Kh0
	GmL09BBmboV2OnPyaWHPf4MzJd8ZPqTnTF9TAPz7sZ7ppiBACZ+i2tg1sz8IPIoMI0JAtamv+q37Q
	Suv4SRIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0QFu-00000009kpG-3rSI;
	Thu, 03 Apr 2025 19:29:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Q0B-00000009fzE-30QF;
	Thu, 03 Apr 2025 19:13:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1BAF35C6C0F;
	Thu,  3 Apr 2025 19:11:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DB47C4CEE3;
	Thu,  3 Apr 2025 19:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743707602;
	bh=Od6xNWqg5f1TGcVxQW6t87mVJrpqg1QBQau9rDrcCbc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NzLLLEDiM5pVl7mLHWB9RQwLwsGvU5uec/xEjZB7VNpF4ryZtFDltRwHUgBDOGApz
	 TvaPrPpsz8cE5nbI6uh4tMDDEF+bThtB56GYsWikosTIpyrRTi912hHnzo/gBH/vww
	 8rIDSQzQajsaNgyIBAWFjYv7CWS1SAS+se5J2Lhc7+SfwbcxlotvC7pV0HAaknMyFE
	 3SG2RGL9GZiYpTqssqOfEOsdYXijLxvUXJtt5nZpNu00guSIbuqMgPAunj2nzOtehG
	 t9snVEKE0piex2UiSX8jfEa2Qta2TJhS3myX4sH0Np8K+aoFwu/5ytwjBvHRE16lIz
	 5pyR6L3/YipJQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Derek Foreman <derek.foreman@collabora.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Sasha Levin <sashal@kernel.org>,
	hjc@rock-chips.com,
	andy.yan@rock-chips.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH AUTOSEL 6.14 03/44] drm/rockchip: Don't change hdmi reference clock rate
Date: Thu,  3 Apr 2025 15:12:32 -0400
Message-Id: <20250403191313.2679091-3-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250403191313.2679091-1-sashal@kernel.org>
References: <20250403191313.2679091-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_121323_841313_836DCC00 
X-CRM114-Status: GOOD (  12.15  )
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

From: Derek Foreman <derek.foreman@collabora.com>

[ Upstream commit 1854df7087be70ad54e24b2e308d7558ebea9f27 ]

The code that changes hdmi->ref_clk was accidentally copied from
downstream code that sets a different clock. We don't actually
want to set any clock here at all.

Setting this clock incorrectly leads to incorrect timings for
DDC, CEC, and HDCP signal generation.

No Fixes listed, as the theoretical timing error in DDC appears to
still be within tolerances and harmless - and HDCP and CEC are not
yet supported.

Signed-off-by: Derek Foreman <derek.foreman@collabora.com>
Reviewed-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
Link: https://patchwork.freedesktop.org/patch/msgid/20241217201708.3320673-1-derek.foreman@collabora.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index e498767a0a667..cebd72bf1ef25 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -54,7 +54,6 @@ struct rockchip_hdmi_qp {
 	struct regmap *regmap;
 	struct regmap *vo_regmap;
 	struct rockchip_encoder encoder;
-	struct clk *ref_clk;
 	struct dw_hdmi_qp *hdmi;
 	struct phy *phy;
 	struct gpio_desc *enable_gpio;
@@ -81,7 +80,6 @@ static void dw_hdmi_qp_rockchip_encoder_enable(struct drm_encoder *encoder)
 	if (crtc && crtc->state) {
 		rate = drm_hdmi_compute_mode_clock(&crtc->state->adjusted_mode,
 						   8, HDMI_COLORSPACE_RGB);
-		clk_set_rate(hdmi->ref_clk, rate);
 		/*
 		 * FIXME: Temporary workaround to pass pixel clock rate
 		 * to the PHY driver until phy_configure_opts_hdmi
@@ -330,17 +328,6 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 		return ret;
 	}
 
-	for (i = 0; i < ret; i++) {
-		if (!strcmp(clks[i].id, "ref")) {
-			hdmi->ref_clk = clks[1].clk;
-			break;
-		}
-	}
-	if (!hdmi->ref_clk) {
-		drm_err(hdmi, "Missing ref clock\n");
-		return -EINVAL;
-	}
-
 	hdmi->enable_gpio = devm_gpiod_get_optional(hdmi->dev, "enable",
 						    GPIOD_OUT_HIGH);
 	if (IS_ERR(hdmi->enable_gpio)) {
-- 
2.39.5


