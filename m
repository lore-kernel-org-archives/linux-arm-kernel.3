Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 886FDC369D5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 19:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qAMpzkdcu4YyVXcoriylpHMenEacmOqIz6YdxYu79ZI=; b=VTJwxZXFoRdC9U195wSKXPCS/o
	g1Af2Y/ZpmQQhTracNDkrWB5rIZ/bjsgPrbKkDtEN4XuigKcZ/vPgcAYybRngdXbHr4+P3BQPVSkE
	vxeDEd70yZkzV3UOehFe/mUI8z58Z5IvZ+S/lKuenFkUFkGWTeh1/GteLWLvfnIXFSXqc1zBobKhM
	Ze8wxNQTfmkbBF8wUaXG5R7PiMM1IyFIjvGmuxngpL6T88MDzfwlJpyTSKVJAPReqktkrYg52nPaU
	d3T/feOQW4tagrTQbX4BVz6w6VEXIUyfLQgNklxMe6mcAqCg2CqQ5BTOBdZFrzEuGw2lnIR8saLlA
	feHQMtWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u81zm-0000000F8Sy-12ri;
	Thu, 24 Apr 2025 19:12:26 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u81nR-0000000F62y-20xI;
	Thu, 24 Apr 2025 18:59:42 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7AD29443A8;
	Thu, 24 Apr 2025 18:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745521179;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qAMpzkdcu4YyVXcoriylpHMenEacmOqIz6YdxYu79ZI=;
	b=JmNT1LA5zC55ZojbXdHDx0DmJrHd2HHJZ1lX5pceXf5FVQnP8XIQBgHgoVwCfXmemV8Ywc
	3dnbTrHTCh1m/p0ROnPLPqXN9Mi3N7qh8IVm/szGJeu27NaJmybtqKk0fQugGFpMOLG746
	+h92aKduZj1xdvVY6ipAMgxF2bzewMoMxPekooWmOhTaIsPQzV+xq2nkQ52KbfdB65iH8y
	8dFcvBCMcjXGCativimBTNi+4EzQNVjm/juF2w25zQ3Eq05AUQfsNE9lre1y/tDN+Nz48E
	Aq8G+wxEWeAPuqZQ2W4xH2DvTpNRqR0MlTo7wx8N/QVvYGUnXbd/4bcN9Y+sAQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 24 Apr 2025 20:59:10 +0200
Subject: [PATCH v2 03/34] drm/bridge: analogix-anx6345: convert to
 devm_drm_bridge_alloc() API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250424-drm-bridge-convert-to-alloc-api-v2-3-8f91a404d86b@bootlin.com>
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
In-Reply-To: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Anusha Srivatsa <asrivats@redhat.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Jani Nikula <jani.nikula@intel.com>, Sui Jingfeng <sui.jingfeng@linux.dev>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvhedtvdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefffffgfefghfettedtfeehgfdtveekhfekudeiueetkeehleetveetjeffhedugeenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegrgeeivdemudgsuggumeeluddtudemvdelgehfnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegrgeeivdemudgsuggumeeluddtudemvdelgehfpdhhvghloheplgduledvrdduieekrddujeekrdduudekngdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeggedprhgtphhtthhopehkrhiikheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomhdprhgtphhtthhopehjrghgrghnsegrmhgrrhhulhgrshholhhuthhiohhnshdrtghomhdprhgtp
 hhtthhopehimhigsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheprghnugihrdihrghnsehrohgtkhdqtghhihhpshdrtghomhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepnfgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehlihhnuhigqdhmvgguihgrthgvkheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_115941_645190_08513218 
X-CRM114-Status: GOOD (  10.58  )
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

This is the new API for allocating DRM bridges.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Cc: "Uwe Kleine-König" <u.kleine-koenig@baylibre.com>
Cc: Andy Yan <andy.yan@rock-chips.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 drivers/gpu/drm/bridge/analogix/analogix-anx6345.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
index f2bafa6cf77956ecafc87aae3a2b6890bdb36cfa..f3fe47b12edca1f92ddd306d152be144df5649b5 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
@@ -664,9 +664,10 @@ static int anx6345_i2c_probe(struct i2c_client *client)
 	struct device *dev;
 	int i, err;
 
-	anx6345 = devm_kzalloc(&client->dev, sizeof(*anx6345), GFP_KERNEL);
-	if (!anx6345)
-		return -ENOMEM;
+	anx6345 = devm_drm_bridge_alloc(&client->dev, struct anx6345, bridge,
+					&anx6345_bridge_funcs);
+	if (IS_ERR(anx6345))
+		return PTR_ERR(anx6345);
 
 	mutex_init(&anx6345->lock);
 
@@ -738,7 +739,6 @@ static int anx6345_i2c_probe(struct i2c_client *client)
 	/* Look for supported chip ID */
 	anx6345_poweron(anx6345);
 	if (anx6345_get_chip_id(anx6345)) {
-		anx6345->bridge.funcs = &anx6345_bridge_funcs;
 		drm_bridge_add(&anx6345->bridge);
 
 		return 0;

-- 
2.49.0


