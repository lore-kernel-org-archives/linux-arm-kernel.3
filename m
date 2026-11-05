Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18403606D83D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 01:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cxrfUcTg;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=VR855FDp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=IE+CwyGmVpK9kCq38wcc2HM4ElfDFOxunpUNRJr2ayk=; b=cxrfUcTgowuQgP
	MEendCAy5lV/jyldkjy0epDm2QNGJmXwI/OEYJfmH3pDp1LTpN+fcKRxjflz3Ja9cPHPgusD+Pdf2
	d3KI0xLD481AaIXOuNxT1u3tHuTASKPoRfOwC6oL5EpQMSLohpQbjCE5asujzWTMsAsxbzeRy5a0r
	+nejR85bnfv0+svS2mVWG091pMu5U5fenbDT8dufgEIsNZjWrT0vadMxH/58SBN6w2h8Jw2YrV/Zz
	IcGuMU7vUTPxOCm2/OrA1Mwpt5NGI8Xzzjr7s1pxzwYvi6kSNOMt2o7buUjanBkEJnTCjwxS1CmxP
	5aAID9YDX65Vp7vyin0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOlr2-00000007Opm-24it;
	Thu, 05 Nov 2026 01:01:24 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOlqw-00000007OXW-0ydE;
	Thu, 05 Nov 2026 01:01:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793840475;
	bh=fYsBZY+jSikNub85K8e0+OdnyNo7wwxjd1+6YCys8OA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VR855FDpiojGQjntT7bGe/YYaibGfjJX7V2GMMa1wh0eDU9HRJWoEHKN6i4sLB/lb
	 zGMzeRVnZWAZ/WAcP0279QRqq3Y1I6wJP24NTK688ZtIFiRPB43R+WKXAKsZtvbmui
	 au6XKiWXwoPdyC7t1qswazUzjstRgBKySeboUzGwMh1JFEWJ00+jn6hN+ooledOunF
	 G/3CQBu4nvEp4nBC6+Owet9wLXq1YalTwkcBqamBWhTzUFmr2hwuqesIEGTHfUJXeh
	 xDv/HyJo2MwiwyJ39eGbPpCFKggTuDmyReErY+s1+HJkYwftoiiDdM9T0Mjmumtdf1
	 cxBNyyW98SaQg==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B9B1A17E0CF7;
	Thu, 05 Nov 2026 02:01:15 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 05 Nov 2026 03:00:47 +0200
Subject: [PATCH v6 13/15] drm/rockchip: dw_hdmi_qp: Support 10-bit YUV422
 output format
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-dw-hdmi-qp-yuv-v6-13-1bb63ef5766e@collabora.com>
References: <20261105-dw-hdmi-qp-yuv-v6-0-1bb63ef5766e@collabora.com>
In-Reply-To: <20261105-dw-hdmi-qp-yuv-v6-0-1bb63ef5766e@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andyshrk@163.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Daniel Stone <daniels@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Daniel Stone <daniel@fooishbar.org>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Igor Paunovic <royalnet026@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_170118_468515_0816B590 
X-CRM114-Status: GOOD (  14.45  )
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

Rockchip DW HDMI QP encoder supports YUV 4:2:2 output through
ROCKCHIP_OUT_MODE_YUV422, but was limited to 8-bit depth via
MEDIA_BUS_FMT_UYVY8_1X16.  Add support for its 10-bit counterpart
MEDIA_BUS_FMT_UYVY10_1X20, which carries two 10-bit components per clock
cycle on a 20-bit wide bus.

The HDMI PHY scales its PLL output by 8/bpc to undo the deep color
packing, such that it matches the DCLK rate expected by VOP2.  However,
YUV 4:2:2 is never deep color packed, as it always transmits two 12-bit
components per pixel, regardless of the color depth.  From a clock-rate
perspective this is equivalent to three 8-bit RGB components, so
configure the HDMI PHY with 8 bpc when YUV 4:2:2 is in use to keep its
output clock aligned with the TMDS character rate.

Tested-by: Igor Paunovic <royalnet026@gmail.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index db1933d75ced..7f05d26f8d76 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -190,6 +190,25 @@ static int dw_hdmi_qp_rockchip_get_vop_format(struct drm_encoder *encoder,
 	return bstate->output_bus_cfg.format;
 }
 
+/*
+ * The HDMI PHY scales its PLL output by 8/bpc to undo the deep color packing,
+ * such that it matches the DCLK rate expected by VOP2.
+ *
+ * YUV422 is never deep color packed, as it always transmits two 12-bit
+ * components per clock cycle, regardless of the color depth.  Hence, as for
+ * drm_hdmi_compute_mode_clock(), use 8 bpc to keep the PHY PLL output aligned
+ * with the TMDS character rate.
+ */
+static unsigned int
+dw_hdmi_qp_rockchip_phy_bpc(const struct rockchip_crtc_state *s,
+			    const struct drm_connector_state *conn_state)
+{
+	if (s->output_mode == ROCKCHIP_OUT_MODE_YUV422)
+		return 8;
+
+	return conn_state->hdmi.output_bpc;
+}
+
 static int
 dw_hdmi_qp_rockchip_encoder_atomic_check(struct drm_encoder *encoder,
 					 struct drm_crtc_state *crtc_state,
@@ -218,6 +237,7 @@ dw_hdmi_qp_rockchip_encoder_atomic_check(struct drm_encoder *encoder,
 		s->output_mode = ROCKCHIP_OUT_MODE_AAAA;
 		break;
 	case MEDIA_BUS_FMT_UYVY8_1X16:
+	case MEDIA_BUS_FMT_UYVY10_1X20:
 		s->output_mode = ROCKCHIP_OUT_MODE_YUV422;
 		break;
 	case MEDIA_BUS_FMT_UYYVYY8_0_5X24:
@@ -229,7 +249,7 @@ dw_hdmi_qp_rockchip_encoder_atomic_check(struct drm_encoder *encoder,
 	}
 
 	phy_cfg.hdmi.tmds_char_rate = conn_state->hdmi.tmds_char_rate;
-	phy_cfg.hdmi.bpc = conn_state->hdmi.output_bpc;
+	phy_cfg.hdmi.bpc = dw_hdmi_qp_rockchip_phy_bpc(s, conn_state);
 
 	ret = phy_configure(hdmi->phy, &phy_cfg);
 	if (!ret) {

-- 
2.55.0


