Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E626C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 17:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IldYrjBrNiicEKDypgdTmvOYJP/ivQY5AR+49uR4q4s=; b=2ofvd4ochPZzc5
	6/mIFCkgY85WNJ2lkB0wKazK6mRqzcnJVEojp6zfX3wVu2zfqew0WVIpEi+GLp5j1ANzd5nFfC2Gx
	V5h09yvHMsgDPF7h5ZmscX9fucHlOBwqGSPso9reZu59qRVYfmQES3fxu/Gwb8fFfPAZlUs3wJid1
	BhSd1HG5hPD0A/2M771RaTh3QY4LFSG3NiPSGsCbPHZ6uENlEU+AzjvvvBDp3/wCcyfqB2ASpxxy4
	a80rHB//jl9DmKpRjbiuGV2UebVwRBeP2VI2niCtjfxWDs64+bBvcALjOhCeIjHCfcyE5xvpk2bza
	wXZ+De59yLWcOm2byeVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqF6R-0000000BhXi-2yqK;
	Thu, 06 Mar 2025 17:33:47 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqF1f-0000000Bgoe-42aq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 17:28:53 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B0340441CA;
	Thu,  6 Mar 2025 17:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741282127;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IldYrjBrNiicEKDypgdTmvOYJP/ivQY5AR+49uR4q4s=;
	b=JcLC4Hym6wDZYoTWvWQwnoD16J/nAvplEwRb46CpXZhipbjm93flldHOu3X+STp8fRlch/
	FPXG7UCpdAbC6aIk8JGplgeHhvNtLwHR/wqsEjdu9BIk96+G3NjiaApdSNNoarwdqxEC4E
	CVe2TIwoQ5lPhp8XZOTGJlEknbdowNXyg5osqINEWUpJxaY5yho0w+MTzcdtF5Mps/VAzr
	H3AOLSy/Y0AAvhwc4wFy+YEiqXZK6UG87ejBsxmHRtMo3vA7ltP9YcYsDTzUioneoSj/zt
	3KbHGlEBuPSqW4w4ZY7m81UkbbYcKTB5MEYTQRlA0qYeJshK3TCcnRj8dAmYOA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH 0/2] drm/bridge: two minor code improvements
Date: Thu, 06 Mar 2025 18:28:39 +0100
Message-Id: <20250306-drm-two-ldb-improvements-v1-0-f139d768b92c@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEfbyWcC/x3MwQqEIBCA4VeJOTdgLRn0KtHB1bEGUmMMW4jef
 aXjd/j/GzIJU4apuUGocOYUK7q2AbuZuBKyq4Ze9YP6KI1OAp5Xwt19kcMhqVCgeGbstDd6tFa
 R8VDzQ8jz713Py/P8AYlH8OhqAAAA
X-Change-ID: 20250306-drm-two-ldb-improvements-16fa67cc0eaf
To: Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutdekfeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthejredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeektedvtdfhhedvveeiveffheefffejvefgleekhfelueefveeiveefhfejtefgveenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghloheplgduledvrdduieekrddujeekrdduudekngdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvvddprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghrohdrohhrghdprhgtphhtthhopehjohhnrghssehkfihisghoohdrshgvpdhrtghpthhtohepjhgvrhhnv
 ghjrdhskhhrrggsvggtsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomhdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtoheprhhfohhssheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhgvrhhnvghlsehpvghnghhuthhrohhnihigrdguvg
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_092852_516899_5F605D2A 
X-CRM114-Status: UNSURE (   6.72  )
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

This small series brings small improvements to two bridge drivers.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Luca Ceresoli (2):
      drm/bridge: imx8qxp-ldb: cleanup return value
      drm/bridge: fsl-ldb: make warning message more informative

 drivers/gpu/drm/bridge/fsl-ldb.c         | 6 +++---
 drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
---
base-commit: 7eb172143d5508b4da468ed59ee857c6e5e01da6
change-id: 20250306-drm-two-ldb-improvements-16fa67cc0eaf

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>


