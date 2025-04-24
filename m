Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F2F8C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 19:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y2vRVDgjiAJpk8Ki0+vTDs+cY+Rn+ImdKgp8gnjEE0s=; b=3+S5h8baArNAK86RfkcOunTIJV
	+EdeABNMlb6gz4gRhsjWYnkKp4gWtUSedCBaVkA8qW1gzLbctco+UH5Hp8c7QpByxJzaFNS4xWUuV
	mKpUDMy/Zr4s7ehvvzayCPVB2pd+0fwWeXdlf+8ks/yJv2ZduRGr+mCRYjnWidrLCRhkVkaNDCxOr
	NexQsTEPcI+QmvkQ9jkh7SPTwM5r5qPjnmm65H8hJokP7K/BD+L3Mtl+UsT7Btm12zZ4y+vap6eLx
	x83+SlaZlP6zbzLtD1vkZFNq5T4WTJaZZzOfS7fTe9yNm2P8NdAhxuz6F1hAfEPYUZ7QNc0p7AQg5
	SpUAURig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u827X-0000000FATJ-114q;
	Thu, 24 Apr 2025 19:20:27 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u81o1-0000000F6Ib-0kis;
	Thu, 24 Apr 2025 19:00:18 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C93D34439D;
	Thu, 24 Apr 2025 19:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745521214;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y2vRVDgjiAJpk8Ki0+vTDs+cY+Rn+ImdKgp8gnjEE0s=;
	b=c3JqSfQ8yT4IV5oJZamXLWByjGPXxCv424bI50HPFTK6vwDW3h9oK2t2xx8jwesYkRP8k4
	TXWggZ46bf5vJ9DgsG6SMF4ran6NIPavsRw85QXZrkKSZkNGJs2ZbY885oDkKyYqJ4rO7d
	/mCyq4mreZFpf2MM8bmMgS+Ni4NWuOq9B8vSUwsj9DWZQij1PpRKjnDrEjM8ggSRqHH8mR
	THsgPUm0SFVh3+moUABkLr7z6nOa4I2xBrcg2GJTbVP/DJP7LOH0TgaZm2UBNJBK6yXE2P
	taqMNScLdG1PbkGMPo5YfgYgoECMZn1Ba1vJ6vUqAaR7rJpLiFXOjoiu4nVv3A==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 24 Apr 2025 20:59:21 +0200
Subject: [PATCH v2 14/34] drm/exynos: mic: convert to
 devm_drm_bridge_alloc() API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-drm-bridge-convert-to-alloc-api-v2-14-8f91a404d86b@bootlin.com>
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
 Alim Akhtar <alim.akhtar@samsung.com>, Inki Dae <inki.dae@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvhedtvdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeiieeuvdfftefgueduleehueetgffgjeeitedtteetkeeuueeuueekveevvdeuveenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegrgeeivdemudgsuggumeeluddtudemvdelgehfnecuvehluhhsthgvrhfuihiivgepuddunecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemrgegiedvmedusgguugemledutddumedvleegfhdphhgvlhhopegludelvddrudeikedrudejkedruddukegnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgeefpdhrtghpthhtohepkhhriihksehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepjhgrghgrnhesrghmrghruhhlrghsohhluhhtihhonhhsrdgtohhmpdhrt
 ghpthhtohepihhmgieslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopegrlhhimhdrrghkhhhtrghrsehsrghmshhunhhgrdgtohhmpdhrtghpthhtohepkhihuhhnghhmihhnrdhprghrkhesshgrmhhsuhhnghdrtghomhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepnfgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomh
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_120017_412048_EA1534CA 
X-CRM114-Status: GOOD (  11.35  )
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

Cc: Alim Akhtar <alim.akhtar@samsung.com>
Cc: Inki Dae <inki.dae@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_mic.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_mic.c b/drivers/gpu/drm/exynos/exynos_drm_mic.c
index b34ec67283370e3fa836c7df06e12e2fba524622..29a8366513fa70655c6ceec9a09db0158e7bb169 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_mic.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_mic.c
@@ -379,11 +379,11 @@ static int exynos_mic_probe(struct platform_device *pdev)
 	struct resource res;
 	int ret, i;
 
-	mic = devm_kzalloc(dev, sizeof(*mic), GFP_KERNEL);
-	if (!mic) {
+	mic = devm_drm_bridge_alloc(dev, struct exynos_mic, bridge, &mic_bridge_funcs);
+	if (IS_ERR(mic)) {
 		DRM_DEV_ERROR(dev,
 			      "mic: Failed to allocate memory for MIC object\n");
-		ret = -ENOMEM;
+		ret = PTR_ERR(mic);
 		goto err;
 	}
 
@@ -421,7 +421,6 @@ static int exynos_mic_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, mic);
 
-	mic->bridge.funcs = &mic_bridge_funcs;
 	mic->bridge.of_node = dev->of_node;
 
 	drm_bridge_add(&mic->bridge);

-- 
2.49.0


