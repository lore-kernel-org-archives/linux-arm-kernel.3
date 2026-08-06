Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35B57C5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 00:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w+BN3eaJ8DbRd+zP4inzia6kNjI5WAHwriv5XsSjPYM=; b=z0VcWSxKy4Gld4d64OQ+/kVJkF
	rf76XxY4NcDvNRugKgtPJVFSS1Cc1SZ4TWAHLtvxNxXWdM1Ojeq5kCJ+lJwqPsd/K0+kRNWi+GRxs
	boyiQUXzW9xxAgCV8k0cHQXglWCxqFwli54nibIEv5Lls/ml0YuO1JHpdJR2mXrn37i7Vvv+rBiBU
	Kmwow/OuUGXJhYvwUbM0xAMBCz7hl7FEVhwi/k3uESAU7yhovL5RmDa69uuaZbTLwkbADXaCvsRKM
	M9WD2fPeXCDJ5CUks/n29IBoCXqQXCb/luj4hqT5W3u6LbNFQB5HYJpXtY7HZC0ifmargj7O6Axhs
	8spkMpXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrm8w-00000004gvy-05yo;
	Thu, 06 Aug 2026 00:39:30 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrm8l-00000004gc6-3LpC;
	Thu, 06 Aug 2026 00:39:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785976751;
	bh=MXKziEXcaaAN5ybtaER2wtFJ0oAuG2XANzY2ZyvyAkY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pd0JrudD5AruG37n9hLi6TvmBVyi2CytLsF+1KW/N/+fGmWCabDEYc+GGVRLTH5HX
	 VKRyIH3XoBY2jN8o2w99ihmwynFmuhF8s9lSPu2hBLW1J7jzI8/s9PPGSLgH/accI6
	 wfw7/amWJCS1AQOq/CSGjQcOrVVGTtsbMDmjmoMFbwGG4bM6K/VhhF1lPff9qtnmda
	 Uoik+Lg1LY+7wJYZqOMMiSK3Amd8BsoMJ02FAd7atIGGd/ls2Su6fjFlPQDPdITOKo
	 xwsXU5u/4opT3jdC/rJerQ5DnYXoInOhmzXZAkD8eA+7QyGkwu6Ey0i42X+y5fBe4y
	 vaAp91EFZhpzw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3B5AF17E07C2;
	Thu, 06 Aug 2026 02:39:11 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 90E95480038; Thu, 06 Aug 2026 02:39:10 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 06 Aug 2026 02:39:13 +0200
Subject: [PATCH v10 07/21] drm/bridge: synopsys: dw-dp: Fix support for
 short I2C reads
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-synopsys-dw-dp-improvements-v10-7-d84a26c303d6@collabora.com>
References: <20260806-synopsys-dw-dp-improvements-v10-0-d84a26c303d6@collabora.com>
In-Reply-To: <20260806-synopsys-dw-dp-improvements-v10-0-d84a26c303d6@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1481;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=MXKziEXcaaAN5ybtaER2wtFJ0oAuG2XANzY2ZyvyAkY=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpz162etrcu/cgKVHRD+LGKL9qoeXu0fBeiB
 O2H7LxOJTXW6YkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqc9etAAoJENju1/PI
 O/qaMNIQAItcvqeLuS53smgADmTjbGA4wJK0Ar54lPJk+2fh6p/TRB/tgGTLLt3qj9+Ui7RCDpd
 7nON6eUnKnO2FH1qxXpQPBVJqvazg+S4MO1PGoRK61N2oeauYRTiTLsCLbDJF85dlwwbCxD9nti
 qL/qzV5axKXZ6fWJKK507XK0kEhD3NTQ9QNcppsWVOMv0q5Rq5GZAcKhvSNRr8ImhfPTWCJTVRm
 IEHyb1T3VuDpddXPlor20VGYzxCpdIzLRoVaOn6hhoXil3eabG6oS2PcigIHVrioRmuooMqBaSR
 0Bs8kZIDMYiG8X2rQA4FkKWB4RariHiUvDu4/yBea+hep1U7MhSZopLeDtGzmdHN+k7QUg+14du
 K8QYc4kdwgjGCjgj48Gyqg4fs3zBMY+oypqymG/bEEHUCgiqx6dhpVg5qcBA1UGEiwZoWVnFfSe
 81IY2oEiivWZCj6NfCYR1ajCiaK1IZnRe09W577a7T3LGMfxLrTR/DIDcGKRk9TCe1XBLOW9GhR
 6y7nRRkBS+bNIgSQelfj5PrXJMZEvyS3ZGSdgBJRnYofJAz1vM3bAQlorD69y4JxvWKyz84ZsYB
 3DUhby2J1vxGc1Qy4YYNSYkNTSVFrk/cTWlurKusOztFheEv7viuavavMtu9WyUs51/IH+WqdTU
 8qwPJQB1xuUGRQBA3dgYkOg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_173920_174338_2BE3488D 
X-CRM114-Status: GOOD (  14.54  )
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
index f82330640380..696cdef279fb 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -1513,7 +1513,7 @@ static ssize_t dw_dp_aux_transfer(struct drm_dp_aux *aux,
 		if (msg->request & DP_AUX_I2C_READ) {
 			size_t count = FIELD_GET(AUX_BYTES_READ, value) - 1;
 
-			if (count != msg->size)
+			if (!count || count > msg->size)
 				return -EBUSY;
 
 			ret = dw_dp_aux_read_data(dp, msg->buffer, count);

-- 
2.53.0


