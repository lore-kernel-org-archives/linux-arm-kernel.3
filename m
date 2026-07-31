Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CE39C5516D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 14:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PbiOW5y4Jhkq7EOxC4AseLbldFujHaicwMkRG9jUgQw=; b=Y6FFEanqrQkmFMOMx8Upfw62Bw
	4KfFXDdAia38724NF+MMZufcUsYKALM4q4nqrLmrINsmUkJUc0n2/QITyHiD9aCaR75X2TTTbeZSe
	ZpO+VgbmVxmDVxZlYXv7fO4LnCh2WnEL7EP656AD4rb0lNlCzlHZlAlcs5bhqtSK5Pg3hNoApgpzB
	1aIGawKEMmywgEUvS6ruxZw3puZCzGNbqFxSRSFFd9JGQ6uW5Pn6A9nhlSiuvJ2AGSUcnZLUNc1P1
	Pj46L98KojKuCGPZhB8Jf5Lzj91ZXT7NK0I6dLrjGxv17VP1Z0EwdYvp97+JCzzRhqtr29L+iidGq
	GanmWOAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpoTR-0000000CnxI-07VQ;
	Fri, 31 Jul 2026 14:44:33 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpoRP-0000000Clno-1bnz;
	Fri, 31 Jul 2026 14:42:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785508930;
	bh=n3IX51tkpkD21CL9ldfkAQVrSezJGEvz0u6xDi+nsPQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lHv9n2hwdRdQoN0Bo/tqsTZlMVvMTTSuOQvSSm5wBb03pfBNBnoaKMO09HQs5A8dJ
	 MZ4Les7Rkbre+soRFK+bg1AWo+rszQJLoHS6iNeCAvvXDANITqmv31sB9tbnr7rkwE
	 7MEsarqOOpwsCa5VSDZs1CPGjYzlkpc3Ft2Zsw4G46LShhbpecaywE1MT8RCQwvLkz
	 Iox7f4iK+vAtiFXcBwVJDi2LXuJ+cOo+/BqbJtskeTWYGnVgIRIakUpkY5fceNYvoF
	 m9iGt2iO3An1yHRf+w/zNA596XpotkCV72+NvCq4aPKq0ze5mMEpLoiYnLtQinfHux
	 1xZm7GbWZF1nA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0749117E093E;
	Fri, 31 Jul 2026 16:42:10 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 18F9F480065; Fri, 31 Jul 2026 16:42:09 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 31 Jul 2026 16:42:24 +0200
Subject: [PATCH v8 19/21] drm/bridge: synopsys: dw-dp: Use regmap_set_bits
 in dw_dp_send_sdp
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-synopsys-dw-dp-improvements-v8-19-ac1e6a75782f@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1255;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=n3IX51tkpkD21CL9ldfkAQVrSezJGEvz0u6xDi+nsPQ=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpstEAmiM7hQO4fCiWUrvhcE6MZZ8yW06xhO
 5kR02XdGvBSKYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqbLRAAAoJENju1/PI
 O/qaWB0P+wVbj2Bigh3YaBXj9ndVlegoqd65W527nQuLfIfUk77oZ3boc5IEACZUUyZP6+L2nO2
 24GjPuchJylG4ZD9q14QppCilHy/MmceXAHZlBLMpZpb+wCqXBcdwmHx1VaN9hi2VoYnByLfjmp
 RCz23aH+jH40O6/rTstUUDQupp01043mtnGRm1lezIIiNxfiFtwU6fXjPnAzjxzNzBQJE21xmHO
 ygHpqzahSg4N6Ns2VTp14X0pIOtaGlgHFRnv3ArHJQ1zy0TNjDLkn9x7Ei46FTr9Zamu1wBddUS
 QBg6juVu1iJg8PJ/KNRdwWDBeWNEjVcwWAfW3QfsYqz6mVFR9QoMd3KJ6nNB6p5qGeX4mFDbSKR
 QZnNrV395ncr9sHCO9XTZeXAe0Em+wfro+cmvR+bS5BN6yd+Y8WWSQGEArBvkU5B/jGoe57teAL
 e3x/uyiWxhg735dnSIgjAmK8Mt7HwcMmkynMbNuAU150UOkRC9AMPsMXy/FyXQz5FYnUFqErsK8
 +CI2t4b2zyPdV3VjbBpLDJz2b+xgrBm6prpNhE3Pe+0s095DjHxxKzO9tPeEw1MKE6CIB9981hn
 yJ+z5BHtSHsugxNOnGDmWV3ULZnCLyWJSv4EY3EUN2fyz1qSh+YExoCRTrDzj3nLmEf7sJjesSY
 gayIny0WuzwW26dS+jKE2eA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_074227_603671_35E85849 
X-CRM114-Status: GOOD (  10.69  )
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

Simplify dw_dp_send_sdp() a little bit by making use of
regmap_set_bits.

No functional change intended.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index 9b9c6d7c8cd2..a39007f13a05 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -1070,14 +1070,12 @@ static int dw_dp_send_sdp(struct dw_dp *dp, struct dw_dp_sdp *sdp)
 			     FIELD_PREP(SDP_REGS, get_unaligned_le32(payload)));
 
 	if (sdp->flags & DW_DP_SDP_VERTICAL_INTERVAL)
-		regmap_update_bits(dp->regmap, DW_DP_SDP_VERTICAL_CTRL,
-				   EN_VERTICAL_SDP << nr,
-				   EN_VERTICAL_SDP << nr);
+		regmap_set_bits(dp->regmap, DW_DP_SDP_VERTICAL_CTRL,
+				EN_VERTICAL_SDP << nr);
 
 	if (sdp->flags & DW_DP_SDP_HORIZONTAL_INTERVAL)
-		regmap_update_bits(dp->regmap, DW_DP_SDP_HORIZONTAL_CTRL,
-				   EN_HORIZONTAL_SDP << nr,
-				   EN_HORIZONTAL_SDP << nr);
+		regmap_set_bits(dp->regmap, DW_DP_SDP_HORIZONTAL_CTRL,
+				EN_HORIZONTAL_SDP << nr);
 
 	return nr;
 }

-- 
2.53.0


