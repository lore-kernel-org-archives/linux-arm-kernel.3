Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F9F5C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 21:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ohHI0HByobn0j33Lx+Kl7czfoxwUOXlw3pm9/0NuBG4=; b=VHVhHexMU2QBHgEBTMfPhBzmju
	9Fy3BtLk84zckwjmrdV0JFSKfLi0Wliz8fV0VY93O3MP9+qSjQaReh+Q7ZSKsBAQhvhNF7EfK1u+A
	8NItBj1iufjh8DqCGox0W3E5fdNDLhtRoEBHtxuYc6zBu4WLWB38FItkxpmYXcaRefd+b/jNWy7NE
	GT75lIsEEZrf/oiCR+xwec8x+aCSGgI6F6WEjFZ/uTc01ITV4wBVfQVmKrD1PQIfmGbZv8q5sM1mO
	d8CiiPZfX+BGGD+C8NR79VIjIbMjIQZMYLzhW/eGNlKkiOsKjFbj/Cem8oOnvDVDBEpK1Kvf9JQFU
	mzdjA0SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdDaS-0000000Bq91-28N8;
	Fri, 26 Jun 2026 20:55:44 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdDZu-0000000BpbS-3Mxa;
	Fri, 26 Jun 2026 20:55:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782507302;
	bh=1nHF1vrjaNXH6VxWJ8xbYUrny3B+6HOnTbC9UsQPiUA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kNLaLxuOFDahf/RD0A7UG+SZrqlNJu9EKRGOAAVZaaFDOZt+byKPdXaxGSqGcpZ4h
	 SpS5qtqB3h2m1N8tN/yl2LUjsIomJq3Q2BqzQBgrw08rI9i89ZeQ7CurPAd5bTF9bu
	 QBT9LpEuVwI4wIx0Nxygpu9onus2YPMdaBTxBeqaqXaBdmiMnOe02KbZlOLG4ddBPQ
	 bD7rtXofqNgbH3XQ5oIq0QFNIFgthViWjNqoX4eUKeJWO6I4s2yrKGnLNbdSiWkpcQ
	 7DIyTIeA+V6lvVuxknBFG5cwChZTPXsg9xlvlgN6a5k8rdAnidq+4sshYf2kB97e1d
	 uPMSRIhCZpUwg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AFD7D17E1270;
	Fri, 26 Jun 2026 22:55:02 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 13EBC480031; Fri, 26 Jun 2026 22:55:02 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 26 Jun 2026 22:54:59 +0200
Subject: [PATCH v8 06/29] phy: rockchip: usbdp: Drop seamless DP takeover
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260626-rockchip-usbdp-cleanup-v8-6-47f682987895@collabora.com>
References: <20260626-rockchip-usbdp-cleanup-v8-0-47f682987895@collabora.com>
In-Reply-To: <20260626-rockchip-usbdp-cleanup-v8-0-47f682987895@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2693;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=1nHF1vrjaNXH6VxWJ8xbYUrny3B+6HOnTbC9UsQPiUA=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo+5yVrcDd9pGLx40GIcnPMFQdfjYzZAJukZ
 oEs5fq1+0WHRokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqPuclAAoJENju1/PI
 O/qakkMQAJsmLpk5yiZKcUP5L+SHN9M/nrx1QT+6PnzKk0T1s7CltqMrycoE81zZw0W/r+Dn7cI
 wfbCHUHnrJHhWWu3FCROZcmuhdo+eushp9DTctYIeAB1FIY/peYhZLi5GKkN5Od+pYNr4Xhp8si
 LnklzD2/cXdwPrXu3tIPpY3HiHy0QYwmw47Rbu03P0Y0AM8Uwn9GE6UXCm+d0mkvXQJKx27LyRj
 32DgVpmySh7bZRRPMp7FMyC+ztePV8wBwdXaTiWmHxQM/RMDWEoKQEQrVb15747YlvnhnQ4pLrD
 uQWPeJ1gObDgC0DvlMbYdAzoFXQ3ekYUdVVo6FmPUy6sjF+hS4ODo/E5HU0fTNep+u4JiolvR8w
 PfbTTFOqxrBVIIJkWqMn2MHqJz0VZd346t738e7Agn4ZLaOj9xClj8C1lw2d37JXXGzSB0qzS+F
 yxmEvd+WngwPpiVDgf8hZ1lMQ0JUnkzTAiT+CJksif7da3cIZYIg7BAdNA143gMK6lN2uoF8Znr
 UqRgA4W0mu2DM0sSd5vCelgc+GMoE6MnrmR/3ggIt9TStxwEcIvFa3nItAC3nXFPC2Q4z+U5BGj
 bn8AxYrGfX0eD3RWVTmQ06m7RmTKEjpKsZHgxU81hYxBzRUZIeQ4WaKuJwXUvVgEzrO8vDN1LCp
 fljNRnd08BOVT4vvJUt8trw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_135511_017138_46F1E0FE 
X-CRM114-Status: GOOD (  14.91  )
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

Right now the DRM drivers do not support seamless DP takeover and I'm
I'm not aware of any bootloader implementing this feature either.

In any case this feature would be limited to boards using the USBDP PHY
for a DP or eDP connection instead of the more commonly USB-C connector.
With USB-C's DP AltMode a seamless DP takeover requires handing over the
state of the TCPM state machine from the bootloader to the kernel. This
in turn requires a huge amount of work to keep the state machine
implementations synchronized. It's very unlikely we will see somebody
implementing that in the foreseeable future.

As the current code is obviously buggy and untested, let's simply drop
support for seamless DP takeover. It can be re-implemented cleanly once
somebody adds all missing bits.

Technically the VOP side should be disabled first to avoid data being
send to an unpowered PHY from the running pipeline. As a workaround this
force disables HPD. I'm not sure if this would be good enough, but cannot
test as there is no support in the bootloaders known to me and my test
boards route USBDP to USB-C connectors.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/linux-phy/20260612164107.C7DB21F000E9@smtp.kernel.org/
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 3fc8222fcaec..f7ff55f03b7c 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -926,6 +926,7 @@ static int rk_udphy_parse_lane_mux_data(struct rk_udphy *udphy)
 
 static int rk_udphy_get_initial_status(struct rk_udphy *udphy)
 {
+	const struct rk_udphy_cfg *cfg = udphy->cfgs;
 	int ret;
 	u32 value;
 
@@ -938,10 +939,12 @@ static int rk_udphy_get_initial_status(struct rk_udphy *udphy)
 	rk_udphy_reset_deassert_all(udphy);
 
 	regmap_read(udphy->pma_regmap, CMN_LANE_MUX_AND_EN_OFFSET, &value);
-	if (FIELD_GET(CMN_DP_LANE_MUX_ALL, value) && FIELD_GET(CMN_DP_LANE_EN_ALL, value))
-		udphy->status = UDPHY_MODE_DP;
-	else
-		rk_udphy_disable(udphy);
+	if (FIELD_GET(CMN_DP_LANE_MUX_ALL, value) && FIELD_GET(CMN_DP_LANE_EN_ALL, value)) {
+		dev_info(udphy->dev, "Started with DP PHY pre-enabled; seamless takeover unsupported\n");
+		rk_udphy_grfreg_write(udphy->vogrf, &cfg->vogrfcfg[udphy->id].hpd_trigger, false);
+	}
+
+	rk_udphy_disable(udphy);
 
 	return 0;
 }

-- 
2.53.0


