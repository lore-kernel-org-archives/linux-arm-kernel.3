Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F230C83F19
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 21:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J4PU2TA2p+Fr97D4NM8jh6amfcCLcxF5nilwAjHOb8g=; b=hCInYWp7HcV3gIcmXx6UG4THj2
	oXeRjL9bUGqB2Q32sohBtmsyX2piHJVPSpDeZ2Mlmbo9dCBWP389rmGdxAqw0xj5Bffi3B5h6BCgk
	h90GnsqeU3X4Ks7n+i9roFCPIdO+u6nx+hwijqX61VI28pCxdBVfNFfyR2/vqsE3tsaB3vL4zyMFF
	Kr0RQ4lxuL3x9Tt7/Q++BRHPKD/8TINKZQehdqwC1y90Cebhvy5c7ewdigEctAJHFrca5bk6jZ7ra
	B7KhmEf0yFUfirbBrCL1ahEZcuZ8eckPxwkzc+5a98uD9+dnUcNnjdoveVMngavd6Mm15nuvkpWgQ
	/iuslslA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZcoF-00000009xW4-1HkJ;
	Wed, 09 Jul 2025 21:58:35 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZXya-00000009Lw5-3iVv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 16:48:58 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8E897433D0;
	Wed,  9 Jul 2025 16:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1752079735;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J4PU2TA2p+Fr97D4NM8jh6amfcCLcxF5nilwAjHOb8g=;
	b=XmdDrE540a/n4ErrnnRadwEo8QP7Om8ynHFU7Jhjx60yywe6zYs1gvXGQ4HuS1py6QDCJ0
	Kx3kYmmJIoCcAYOkg+bdTaMvqTFrNYiqI0lzWDRH32mBgms//BjqminyWoZ98jk1Jx/rI2
	JgbRqiy0S0EKX2O7bq9fHZhTqr4m8He8JYcKH36C6eeuu+k7ApBYTLl73f4f6pTr6Bc3A/
	TEmo4+vT2xwX+n/j+CfKsKUpS6O93TCOW0gkxWlnglx/aWBcaAM//5bCkxh7Cr0smsHMho
	Ph8rWDIZohR3kQzrHqAX2kIS7at3j+bAkWQpd105PbaRfO7iZIlNo7sHqF7Bwg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 09 Jul 2025 18:48:05 +0200
Subject: [PATCH 6/9] drm/display: bridge_connector: use
 drm_bridge_is_last()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v1-6-48920b9cf369@bootlin.com>
References: <20250709-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v1-0-48920b9cf369@bootlin.com>
In-Reply-To: <20250709-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v1-0-48920b9cf369@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefkedtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieeiuedvffetgfeuudelheeutefggfejieettdetteekueeuueeukeevvedvueevnecukfhppeekjedruddvtddrvddukedrvddtjeenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepihhnvghtpeekjedruddvtddrvddukedrvddtjedphhgvlhhopegludelvddrudeikedruddrudefngdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvhedprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtohepihhmgieslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopefjuhhirdfruhesghgvhhgvrghlthhhtggrrhgvrdgtohhmpdhrtghpthhtohepthhomhhirdhvrghlkhgvihhnvghnsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehvihgtthhorhdrlhhiuhesn
 higphdrtghomhdprhgtphhtthhopehshhgrfihnghhuoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepphdriigrsggvlhesphgvnhhguhhtrhhonhhigidruggv
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_094857_073727_8361272F 
X-CRM114-Status: UNSURE (   9.85  )
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

Simplify code to know whether a bridge is the last in the chain by using
drm_bridge_is_last().

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 6cdb432dbc3004f88988883a37c2486c409ea932..842561d7b3fd5b833b97edc299c4a6d81b2a7168 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -749,12 +749,11 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 				return ERR_PTR(-EINVAL);
 		}
 
-		if (!drm_bridge_get_next_bridge(bridge))
+		if (drm_bridge_is_last(bridge))
 			connector_type = bridge->type;
 
 #ifdef CONFIG_OF
-		if (!drm_bridge_get_next_bridge(bridge) &&
-		    bridge->of_node)
+		if (drm_bridge_is_last(bridge) && bridge->of_node)
 			connector->fwnode = fwnode_handle_get(of_fwnode_handle(bridge->of_node));
 #endif
 

-- 
2.50.0


