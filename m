Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86A7BC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 19:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pe9TGbQbkCe+ORWPYOnOFjy2xEDFN3D1DRO+A6gr8d8=; b=gX6oDh87SbKnm2fz0iTiRKz+x1
	JdBTGfPxYwUVyAetFnWfNvOJUh6DBKgKs8qgrDKbRRMDualOhOSCUvRoq5OK3pnem8T+u+51bcNPM
	UWJJgH5NYwh0NOQZIwFihuFg9NtImOc51hClQg60CXnj6JLiIIxav8lMvswU9fmnH1fPROexmxuf9
	tzEIvZq4ed1SYZ/JkS5NCJDs6y36MNR5dZJnaIPFUuFcibgBb2F/XPOY3To+NKbaB8hBnNoHTTvWt
	jzl24cBQ1dtqSq3/LKWrv273wt5vISrwOmxLQ9MpdSaHUJ6XmiMyHqi3bjr5obYa/vw4/TMv4NGi3
	gxoFVrBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u81zk-0000000F8RH-2veW;
	Thu, 24 Apr 2025 19:12:24 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u81nO-0000000F629-2h1T;
	Thu, 24 Apr 2025 18:59:40 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1A1A8443AC;
	Thu, 24 Apr 2025 18:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745521176;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pe9TGbQbkCe+ORWPYOnOFjy2xEDFN3D1DRO+A6gr8d8=;
	b=ENSDT7HqsiyuBMtm9ZWgHDJIwA6rNydfQT3vUAEvINHE3ZilXsEUTxfnJCNzj4K5iyBMeh
	xI5N3QaLx9xdrG+Yi9IP51QPwTzZ6Ev1UA7pUop84y/qoj+OYAHoVq3VaUJu5LF06pLXw4
	tZqMthi2H4aTZGfuoKb3H58kvW2AXXf64vUgps/1fKOPLZ1f6kQ1e4a8I6JNGmz38AOf1d
	eH55cPq+zuOxWvyWyCNGrKg9MjW7cYS6IJP4g/5uc+NJCP8+JjD32U6QSTI7Kw2oF8+hxN
	roVhDODBTmQmSMxk3a9UjodmSmBDv0WJsFRCIKBYAaLgw+6d8deMFipWIUrp0Q==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 24 Apr 2025 20:59:09 +0200
Subject: [PATCH v2 02/34] platform: arm64: acer-aspire1-ec: convert to
 devm_drm_bridge_alloc() API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250424-drm-bridge-convert-to-alloc-api-v2-2-8f91a404d86b@bootlin.com>
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
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Hans de Goede <hdegoede@redhat.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvhedtvdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefffffgfefghfettedtfeehgfdtveekhfekudeiueetkeehleetveetjeffhedugeenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegrgeeivdemudgsuggumeeluddtudemvdelgehfnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegrgeeivdemudgsuggumeeluddtudemvdelgehfpdhhvghloheplgduledvrdduieekrddujeekrdduudekngdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegvddprhgtphhtthhopehhuggvghhovgguvgesrhgvughhrghtrdgtohhmpdhrtghpthhtohepkhhriihksehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepjhgrg
 hgrnhesrghmrghruhhlrghsohhluhhtihhonhhsrdgtohhmpdhrtghpthhtohepihhmgieslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepnfgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehlihhnuhigqdhmvgguihgrthgvkheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_115938_870079_D899F79E 
X-CRM114-Status: UNSURE (   9.40  )
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

This is the new API for allocating DRM bridges.

Acked-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---

Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: "Ilpo Järvinen" <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/arm64/acer-aspire1-ec.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/arm64/acer-aspire1-ec.c b/drivers/platform/arm64/acer-aspire1-ec.c
index 958fe1bf5f85bb69ac7962f217de9f0b40cde9a1..438532a047e68799ac53a16a4c813fc16be997b9 100644
--- a/drivers/platform/arm64/acer-aspire1-ec.c
+++ b/drivers/platform/arm64/acer-aspire1-ec.c
@@ -452,9 +452,9 @@ static int aspire_ec_probe(struct i2c_client *client)
 	int ret;
 	u8 tmp;
 
-	ec = devm_kzalloc(dev, sizeof(*ec), GFP_KERNEL);
-	if (!ec)
-		return -ENOMEM;
+	ec = devm_drm_bridge_alloc(dev, struct aspire_ec, bridge, &aspire_ec_bridge_funcs);
+	if (IS_ERR(ec))
+		return PTR_ERR(ec);
 
 	ec->client = client;
 	i2c_set_clientdata(client, ec);
@@ -497,7 +497,6 @@ static int aspire_ec_probe(struct i2c_client *client)
 	fwnode = device_get_named_child_node(dev, "connector");
 	if (fwnode) {
 		INIT_WORK(&ec->work, aspire_ec_bridge_update_hpd_work);
-		ec->bridge.funcs = &aspire_ec_bridge_funcs;
 		ec->bridge.of_node = to_of_node(fwnode);
 		ec->bridge.ops = DRM_BRIDGE_OP_HPD;
 		ec->bridge.type = DRM_MODE_CONNECTOR_USB;

-- 
2.49.0


