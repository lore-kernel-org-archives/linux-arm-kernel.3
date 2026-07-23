Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6895FC531CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 01:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SlB7HFHGf2Fm/ryVlEbSVR1lHiN5b0TxiYY3z91LgYE=; b=XA0A1ixjOtwd07Zqg93o8/IzmJ
	Z6nKR9gLWdZi7rYoX8hegneNcTZwUjwrDA+7otaSUKc2n/h2bnY782S9NjyLbgCBgSs2+e5SBGcvp
	+hndUdchV+sLPUelLjQedNHrKyWS8K05/H4H7rJV9MWNZWdDSoz6ziYVgUxWAfFXcOfxjaSnzTis/
	np8Y0i3LMrfP6bdW4/yYDe+PfG0qqOui/o413Zb+qs2Y71/X3ToonHOJJUslC5dlDEQjPThTl6Vl4
	UfpM9OBszp1xSbG8IZ5y7myJhXiwGYDg+qpUfWRjnOeCXE8u/MQ3xw3iFi4vEQbt4l3Rwe1VUgVha
	B1tMWUsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmiLo-0000000D3zQ-2kPc;
	Thu, 23 Jul 2026 01:35:52 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmiLE-0000000D2wr-22qr;
	Thu, 23 Jul 2026 01:35:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784770514;
	bh=vkmohHBcUSuwS6ZyFCylIMegc4f1JtD3hk0obLRPOFI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JZBYr7+C00r1wL0e/BjKmWVhQ8Pi6A+THSPgl+/zp8kk99hx+dS4egmsocS1JLzS4
	 9qjuKCEvxTXcNCgMRgwBBOCc1tdf5UjPaQihvz6BsAraa4UMlCcH4OJivmIwngKz5Y
	 xSYGriIuRQNqHuI0eLim8jGkUI6enyKwjb6CUG2117DUbrUk/Lr5CQOGcrr7qQAOZP
	 D1/uhFonnoT6QKT8RfD/JJtZTQxvYs+k2nFpVBKQJN8x9hPoG+5AzhHAao7gAhreyj
	 aXyPLR4GXzbxCvtgRgtVb1WOID+vpfiDhYlwUJffI4+aZIJyAG87tvDAQx6rtDkeOm
	 37adn59VBGxyw==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9F81117E1064;
	Thu, 23 Jul 2026 03:35:14 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 23 Jul 2026 04:35:07 +0300
Subject: [PATCH v9 18/61] drm/display: hdmi-state-helper: Set HDMI
 scrambling requirement
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-dw-hdmi-qp-scramb-v9-18-4fb12ea22ac9@collabora.com>
References: <20260723-dw-hdmi-qp-scramb-v9-0-4fb12ea22ac9@collabora.com>
In-Reply-To: <20260723-dw-hdmi-qp-scramb-v9-0-4fb12ea22ac9@collabora.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Algea Cao <algea.cao@rock-chips.com>, 
 Daniel Stone <daniels@collabora.com>, Liu Ying <victor.liu@nxp.com>, 
 Phong LE <ple@baylibre.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 Maud Spierings <maud_spierings@hotmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_183516_727105_F33DE342 
X-CRM114-Status: UNSURE (   8.64  )
X-CRM114-Notice: Please train this message.
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

Set drm_connector_hdmi_state.scrambler_needed when the computed TMDS
character rate exceeds the HDMI 1.3 maximum TMDS character rate.

HDMI 2.0 requires scrambling above 340 MHz.  Centralize that clock-based
requirement in the HDMI state helper so drivers do not need to open-code
the threshold check.

Acked-by: Maxime Ripard <mripard@kernel.org>
Tested-by: Maud Spierings <maud_spierings@hotmail.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index ad59318a3e85..d112c1555517 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -594,6 +594,9 @@ hdmi_compute_clock(const struct drm_connector *connector,
 
 	conn_state->hdmi.tmds_char_rate = clock;
 
+	/* TODO: also check drm_display_info.hdmi.scdc.scrambling.low_rates */
+	conn_state->hdmi.scrambler_needed = (clock > HDMI_1_3_TMDS_CHAR_RATE_MAX_HZ);
+
 	return 0;
 }
 

-- 
2.55.0


