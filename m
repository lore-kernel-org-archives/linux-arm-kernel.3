Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 290D3C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 11:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RZx9garggCkb/4fuz/ISY5Yhx3oRGz6TSqSU+AFBcZU=; b=zjZVdsQkbTt0CzYb4/1l3xJiJA
	JWtyc3Y2G/8omFYEhigNc9KSQPdGPuBZ7sqB6UiB0etWSK6Oc1YhOUH6UeBUmlKe93F+W1eWlfJJb
	PHlKyWvWXwX/RVvTOzofhJYIHRObVvbXB39u5dqGb3gRwOeeCTXzi98BCub4e935OYYofpTvdD8YN
	/qEwOyGW5U6CfGvYSRccoGbkCrvgynHWn5l096mv1OWvquBHn+lg7SnbSxZtd439IrG0L+JdwFqtg
	Fv4gFGDreNn+7uGQWc8H/ANlZj5ScPScUaQx86QQ7IUjakbiuUPXkwwCLiZyqf1YbE419StuskvMC
	xRI8J9/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueBYd-00000002L67-1Lvi;
	Tue, 22 Jul 2025 11:53:19 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueBOq-00000002K1k-1H4G
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 11:43:14 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0966B4335F;
	Tue, 22 Jul 2025 11:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753184589;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RZx9garggCkb/4fuz/ISY5Yhx3oRGz6TSqSU+AFBcZU=;
	b=o57jEKFip4Jeg9G/3rSSRHrZofXaKJDGzZgxI4eo/G3/sRveZrZVnH+waD48AVLCbX2N0f
	QDpYcFz2bQjx3JoteaZ64aFKBbPo35o18pyM14oPipRgqeWjqhzhE/wS2urMt85UOIS79l
	FR9iFtECxSWcaZ5QtpCXRnE4NtGpadgjNWW1JMJFm8U3lkoMDBgiVk+PRXWRFqWEaJddnf
	f56ebPIf3mg9Eudu2gEZQvk+tWUjN4aarg4KqM5LMV81EELb1n9kedmjxjMEVkVfHFID0p
	IZG6R4Qo87q+1Rj9YbXlxv4WDExhX1Qvzwqm3yGCjbYpwFznMyd6UHqfd+FAJQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Liu Ying <victor.liu@nxp.com>, Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250708-drm-bridge-alloc-getput-drm_bridge_chain_get_first_bridge-v9-0-db1ba3df7f58@bootlin.com>
References: <20250708-drm-bridge-alloc-getput-drm_bridge_chain_get_first_bridge-v9-0-db1ba3df7f58@bootlin.com>
Subject: Re: [PATCH v9 0/5] drm/bridge: get/put the bridge returned by
 drm_bridge_chain_get_first_bridge()
Message-Id: <175318458693.1221782.3691939996156823166.b4-ty@bootlin.com>
Date: Tue, 22 Jul 2025 13:43:06 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdejgeekudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvegjfhfukfffgggtgffosehtkeertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepledtveevveduvedvteefhffgiefhfeefleffvdfgffefheeuueeihffhtdeuteehnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegludelvddrudeikedrudejkedrjeehngdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvhedprhgtphhtthhopehfvghsthgvvhgrmhesghhmrghilhdrtghomhdprhgtphhtthhopefnrghurhgvnhhtrdhpihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepjfhuihdrrfhusehgvghhvggrlhhthhgtrghrvgdrt
 ghomhdprhgtphhtthhopehjohhnrghssehkfihisghoohdrshgvpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrrhhordhorhhg
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_044312_678707_847AD826 
X-CRM114-Status: UNSURE (   8.02  )
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


On Tue, 08 Jul 2025 17:48:17 +0200, Luca Ceresoli wrote:
> This series adds drm_bridge_get/put() calls for DRM bridges returned by
> drm_bridge_chain_get_first_bridge().
> 
> All patches are Reviewed-by Maxime except patch 3.
> 
> This is part of the work towards removal of bridges from a still existing
> DRM pipeline without use-after-free. The grand plan was discussed in [1].
> Here's the work breakdown (➜ marks the current series):
> 
> [...]

Applied, thanks!

[1/5] drm/bridge: add a cleanup action for scope-based drm_bridge_put() invocation
      commit: 4d2d28776ae3ad7aa95328d28aff220b0ec6202d
[2/5] drm/bridge: get the bridge returned by drm_bridge_chain_get_first_bridge()
      commit: 8fa5909400f377351836419223c33f1131f0f7d3
[3/5] drm/mxsfb: put the bridge returned by drm_bridge_chain_get_first_bridge()
      commit: a73ddcba33ed8fe8f2bd5be4de88125b06df96b4
[4/5] drm/atomic-helper: put the bridge returned by drm_bridge_chain_get_first_bridge()
      commit: c26c844390e1384c49dd9a395c3bab268dcb5bea
[5/5] drm/probe-helper: put the bridge returned by drm_bridge_chain_get_first_bridge()
      commit: 956f82e529dd283382f080273ed3b8db1e978699

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>


