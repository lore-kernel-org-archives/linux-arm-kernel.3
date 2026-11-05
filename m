Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82DD8606D828
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 01:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DD8M8XEp;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=pS48B6GV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=BlK/YTVMnUoqCmWClO/UwFAOnvnic/Onn4777GZprX8=; b=DD8M8XEpJAgz5Q
	AYW28/4pWevnmRzvZYTd9Mh0Zt6dkN/HbpUKKRGAc0tQ5Jln+n7bKp/pekVjHKoydlcs3tPiBZKsA
	8p/4aPngcs0gSq0rQoe4CoVhn6RQjh3xzEP+QaQDNn6S23cKutvdm4gNVILarL0c8L8lZ6MHrZPAt
	QNdvCYz5zwRvdmrj6BOSp4WlzDPmNQcjK5yU46KDjgbqEjIzQd5MAjFxQAt2mp25s85o4iuJDvO3m
	Xxt6ynjlrIx4aL3iKCYEXu75utAfI0P9ClrXrcf0H289VqcE37hU2oKaH+ccoKq9fr1jEXCI+xMai
	xXuplonUXXGcEUm+dlww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOlr4-00000007Oue-0srp;
	Thu, 05 Nov 2026 01:01:26 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOlqx-00000007OYo-1CKO;
	Thu, 05 Nov 2026 01:01:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793840476;
	bh=RhZ4fXL1AORS0/8pLCbVTNBRUTNmNdnA0HjJGklhMZc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pS48B6GVUKbY4gjiM+SXD+UlwdJElwUI4pzN9cE2rdfM8G1UnOaRcwTMmZji6Jr2r
	 +SOtWNIU+zdGq8Zi1v4RXu0fV08fX1iL6aCYveT4iCwS2LtdwNWC9Q0dI5wuAqkp48
	 mS8n3Fn0FmFcZVOLviR6FXQ2WPAlpDX0gOW6u1j982xKfPJuUt20JKC0kQvJsWsrU+
	 6+SVzZkd0cHGr1EAjpTtI8GELp8zAd7tnBPS0WzQ2Jr88tHSqNvh88MRWPjh89MFoE
	 pzzzCQPe2aAAMKmgKeOnP+OaQDuMr602+5/VCIMbf155NdZMI8IrIr8y8NqTmm947P
	 Z0t0HP3SYRT8A==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8302417E0D13;
	Thu, 05 Nov 2026 02:01:16 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 05 Nov 2026 03:00:48 +0200
Subject: [PATCH v6 14/15] drm/rockchip: dw_hdmi_qp: Enable YUV420 output
 format
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-dw-hdmi-qp-yuv-v6-14-1bb63ef5766e@collabora.com>
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
X-CRM114-CacheID: sfid-20261104_170119_553825_A7B9EDD0 
X-CRM114-Status: GOOD (  11.10  )
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

Both RK3576 and RK3588 SoCs are capable of driving the YUV420 output
color format, and the required bus-format handling and VOP2 support are
already in place.  Advertise it via the platform supported formats so
the HDMI core can select it.

YUV420 halves the TMDS bandwidth compared to RGB/YUV444, which enables
high-resolution modes such as 4K@60Hz on links that cannot otherwise
carry the full-bandwidth signal.

Tested-by: Igor Paunovic <royalnet026@gmail.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index 7f05d26f8d76..8ce991a5275c 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -660,7 +660,8 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 
 	plat_data.supported_formats = BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444) |
 				      BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444) |
-				      BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422);
+				      BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422) |
+				      BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR420);
 
 	encoder = &hdmi->encoder.encoder;
 	encoder->possible_crtcs = drm_of_find_possible_crtcs(drm, dev->of_node);

-- 
2.55.0


