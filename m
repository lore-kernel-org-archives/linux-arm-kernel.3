Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32E99C5516F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 14:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vSfAcdAKPieQkAkzhWPdvNO7cAiZyhzdbRXL6+jQ+WU=; b=nebRhXCEvvSZWT1nbCr+wOA+Zc
	r2EiPrQHcPtMA68UmszkdHM64MAcDxEuZ5iul+Qm1QCJC3RJdOJoz+3BK40Te+ZW+4sIuOsuwdgne
	w2JvRoQ22S/taD/FPWZ35qjZS09tfA73hFTcV2emMG7R02HFAwQh3juvDAJX+iVaF4rosSwtpcXsI
	G6QvQTA6QWgn9rqEP0GxQpot/cJBC9zgYU2pEZwz3cJFrXT2ju9CIWMOxdFxBLQDz2D2Ld0dkdVY2
	kCq7aHqCYsoOP5Hy5Z2QGgf1cXFTYD02E+kG2WFa5PGm9ate0ocrmh7GNSD5scN1bESDxeRtfzHNu
	yFhvliyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpoRu-0000000CmTT-33l0;
	Fri, 31 Jul 2026 14:42:58 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpoRE-0000000Clb0-333T;
	Fri, 31 Jul 2026 14:42:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785508929;
	bh=xXEUBll9y6OuU/YT7UswjnBGnWHXZmw9kG8eQXnPYWI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XLA3w7EsLv1eu9smNNJYgjge7nU9o5A50HUxaNsZCwgrMx3mAvp8/rCw3hxU8WGAu
	 pm//pYgbgP/sImpcMJQ29bxCqFQNgCllems7uGnTnUZh6+zSblj2uNHMjvzmKKtGOW
	 Q+h7lCQbwQouX/BvHhDUomgyXxbynOum1w+OnajehkdGXQcfuMY2bpDyiFKvzrwlas
	 3zPey4wSqR/486gMst7e2DEYecyhCK4iaIcK339+0doUdUhWwmobljFTBgbTZ0ybIn
	 e8JPz8p4u77gj9NQvL0wia1N4aw9pZoio86DLiAI6GW0JzQtjAtNdbJeBhuWNPcz70
	 XUgJU++4DVE6Q==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A0A8317E0916;
	Fri, 31 Jul 2026 16:42:09 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 067C6480038; Fri, 31 Jul 2026 16:42:09 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 31 Jul 2026 16:42:12 +0200
Subject: [PATCH v8 07/21] drm/bridge: synopsys: dw-dp: Fix support for
 short I2C reads
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-synopsys-dw-dp-improvements-v8-7-ac1e6a75782f@collabora.com>
References: <20260731-synopsys-dw-dp-improvements-v8-0-ac1e6a75782f@collabora.com>
In-Reply-To: <20260731-synopsys-dw-dp-improvements-v8-0-ac1e6a75782f@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Damon Ding <damon.ding@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Alexey Charkov <alchark@flipper.net>, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@collabora.com, 
 linux-arm-kernel@lists.infradead.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1460;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=xXEUBll9y6OuU/YT7UswjnBGnWHXZmw9kG8eQXnPYWI=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpstEAQh2CtbiplgbxQz6tO/3/UYpXFPgoF1
 UXjkdynUMWlN4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqbLRAAAoJENju1/PI
 O/qayy0P/RpgiiOe96OD0ClUPwcrk8cEbEZs79HOcyfv5EdIxLptw1aqgzBHMUROMJ+Sc4SGPWu
 bGrzIT4zyoQDFmubk6rme/zStA/H41lGHcT5tyvV1wxGY+MoeFsN4SEwfGAfpt+2RvLOcalPt4Q
 nFlXx/ZtLb7ei2FlwyBqaom8slIGtkRrSrwtUWj5BsU95K0T0x4XKttlsqCTt5Y2LdSuhN9fzZ7
 qBmoYBDB7RauxdcQTF+djEOaIqLhLJbyl0eIh3BAtBP6lzV5zRNieOe5yLZJYOd/CgaXLZbS4eH
 1gDwGKUnWyLelj64PWNhqMvLRIC+YT6HIUEjLNItyLdGOAO/ZQEgA2dVSjzeqkU+sokmTbex6Q8
 TkOaptX1I+mIuNFtRAFDK4QmHQ0MS11pXQ1/ThS5qbuSv3rpnpv2QUxYTUOE+LDHvLJWwcSBO8N
 Y5V6e6bhlxJHuDMihr3PiHGUpFWeJTk/76F9fYAxorlAApW1kZkajgj7jANQe0I17SaXHTUAMw0
 Qtdq5jtzs3ypK1NXwB8n5F2X/wCOWKHBDHAUgvx4cUnnnztYZx30NzLI/jm5lYW8PjONPyXdUPM
 Tq6E2JcV199aRKGOWdlIH3mUe8O80It4JhP700qG3B0Y5lbdAK7WEj5keJpyEgpXtrriGJKigiD
 M58GeXDACH91sCnmqstIqGg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_074216_954264_736731CA 
X-CRM114-Status: GOOD (  14.77  )
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

The transfer functions returns the amount of bytes read for
DP_AUX_I2C_READ. By returning -EBUSY for short reads, the caller has
less information available what is going wrong and possibly simply
resends the read request. On sinks not supporting long reads, this will
simply run into the same issue again.

Instead it makes more sense to return the data from the short read with
the length information, which allows drm_dp_i2c_do_msg() to read data in
smaller chunks and succeed in the end.

Due to lack of a sink, which only supports short reads, this change is
effectively untested.

Fixes: 86eecc3a9c2e ("drm/bridge: synopsys: Add DW DPTX Controller support library")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index 57b6a8fc98d0..760e1e0f8234 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -1513,7 +1513,7 @@ static ssize_t dw_dp_aux_transfer(struct drm_dp_aux *aux,
 		if (msg->request & DP_AUX_I2C_READ) {
 			size_t count = FIELD_GET(AUX_BYTES_READ, value) - 1;
 
-			if (count != msg->size)
+			if (!count)
 				return -EBUSY;
 
 			ret = dw_dp_aux_read_data(dp, msg->buffer, count);

-- 
2.53.0


