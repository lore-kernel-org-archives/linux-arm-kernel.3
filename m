Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 022C3C53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 17:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u1eS9NqF3sGrKE0fj1cmoz8LTVYTOuL5w/Jvxj3BjlU=; b=fskOTxTfhECsDJU8gXMObzi1YD
	4eKhDRcivvPKDuaWpt6gVO2CbRl8dgTyjX+Lvz5D0rm7DewnMUfnpQvnWfQ4pSHIj1+brOiFMc0IJ
	fdOzOS1VvCkyHlYjRds9KW+AQou2+nWvBPXNOKR8kLRrsxbmJ5t7ReBi8uVV5aedVtrWVoLiWoj4Q
	xwPvllzBhFdJjVCclUBDAbjEZECZDw+5syboCYCdsEkxe5AIXStZ+kg8bAnQQrhtVFeKB0hFHCfG6
	+JAK2fPKABFb8O0igGI55hft3wAlLW+ZgfcFklpBP8dT4Eb9htNAZu32yLF185jF3kfKe6YFXnjqk
	8axZrquQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wolne-00000005zDD-2RyF;
	Tue, 28 Jul 2026 17:41:06 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wolnN-00000005z0q-41QT;
	Tue, 28 Jul 2026 17:40:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785260446;
	bh=Sw0eBvl1Fm8R1WcMvoZrOtiF6wxkEL0dY1GQpPPGQ6I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=k2+kwQrRU4hGifXPsYIwKUdcZsj2LpAHMhSfl/Rn1aIJ0tlAv+XH4ESHFqzSFLJhK
	 A/YIYpwqzy1D05EPrQT9wfosHeNONslQMTKa0ObPT9F1dXOylLSQ6gs++txe77N6Ih
	 ew0S02b0gAT//NpS/19SpWPsA+bm5g+7zOEnvo3OsbuHcq6Oem0FTJXNOZsQ2gcc1h
	 F4OjArPdvIxRpYJ7ULCDCwW7Y8ukDnd36ZRD5AoOIA/+eTbcqlQQKxcqOl4eddeGus
	 eKl2JLg3zV8tr+JVmu6YF33wg4sArWJdGDgqj3AyKMRUHbjXzSjB2w35MthhHAiRTy
	 3uCifJymdW30w==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5A9A017E0726;
	Tue, 28 Jul 2026 19:40:46 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 0F787480030; Tue, 28 Jul 2026 19:40:46 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 28 Jul 2026 19:40:40 +0200
Subject: [PATCH v7 04/18] drm/bridge: synopsys: dw-dp: Add missing
 reinit_completion
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-synopsys-dw-dp-improvements-v7-4-b7640fa8cf48@collabora.com>
References: <20260728-synopsys-dw-dp-improvements-v7-0-b7640fa8cf48@collabora.com>
In-Reply-To: <20260728-synopsys-dw-dp-improvements-v7-0-b7640fa8cf48@collabora.com>
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
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Damon Ding <damon.ding@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Alexey Charkov <alchark@flipper.net>, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@collabora.com, 
 linux-arm-kernel@lists.infradead.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1245;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=Sw0eBvl1Fm8R1WcMvoZrOtiF6wxkEL0dY1GQpPPGQ6I=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpo6Z0DXIdtnlpb2zQk2OemZA9q006AiFoaH
 3Atf2WcSzjuqIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqaOmdAAoJENju1/PI
 O/qaGf4P/jSrAQ3f4seld+ntVRbufACqFMWRD3d+x8Q3wJU8TXYmJ+koBu+QjtdxWSmlyCtWlR8
 LlqPfxHYwg98ZXSufGwPfatJyH4lEG9fO9ghydFGN2vQ8Zi3wNKL83OypqY4q1X+eaBdc5OhAeW
 VoU0KPey96d/9WHUMLYpGrzMBSA4qJlSomjMaZzZI6xbfc+0MnH84v2ethqUxEhnRw3blDnH+4f
 pnD6x6733MNj2ALPm1rwvkLUUw/61TI+3wvnPDy8ySk7CrjefgqUJF2bBTNHiS8LOh2uA2L5FP5
 VVtY6LARhp39zEK6JJRbb6QiIaWlkCbZDn0BffSIIn96V9c52ryZaqC4UeSdNB9PoazdIfQsFHM
 UhzJeBmZC9qLkcSa1Zwd7DNhVI5tEY1QtOQ264L+Qu+YAkypx1embMOQuMzRPWmgpXEqcza20N7
 KEvczu66Aw4KAkHZQb41rUka7XeJ9hOAfTb198mg5Yicgo55SqWOwmAcvsEByXficlG01piTvRW
 JAeuXy5017wxLM7XYyJ+hyfbV4jYErt1I2+oe+9cdhWdQPIUb0lCHikQPhg7b5ydSV9cUdAZPvv
 IzqEH2It6yf4qdvnRvjOPMWRU/xWrFYMlCMSpweqEzvn1pLmB3cWorza0dgACnX4PTSsJF6kgq1
 JyVvg8UfO48wnhxbforIs0A==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_104050_156700_3FABEBA4 
X-CRM114-Status: GOOD (  12.17  )
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

The DP AUX transfer method uses a completion triggered by an interrupt,
which can timeout. If the function runs into the timeout and the
interrupt fires afterwards, the following DP aux transfer completion
would trigger immediately without waiting for the interrupt. This in
turn means the next one would also be broken and so on.

Fix this potential issue by re-initializing the completion before
sending the AUX command.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Fixes: 86eecc3a9c2e ("drm/bridge: synopsys: Add DW DPTX Controller support library")
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index ca7ff544d243..951f1e280e47 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -1465,6 +1465,8 @@ static ssize_t dw_dp_aux_transfer(struct drm_dp_aux *aux,
 	if (WARN_ON(msg->size > 16))
 		return -E2BIG;
 
+	reinit_completion(&dp->complete);
+
 	switch (msg->request & ~DP_AUX_I2C_MOT) {
 	case DP_AUX_NATIVE_WRITE:
 	case DP_AUX_I2C_WRITE:

-- 
2.53.0


