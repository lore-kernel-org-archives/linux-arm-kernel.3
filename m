Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7864C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 17:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5b7Ja/njtquSYHToua+2n7iQrKQp4u+2m/eij/UqS8c=; b=lIkCEnuzqWlW2JeDTouIhuw0x3
	7VCpG4vGHJmY+jjRDTl9rqKJx5JFvtArS75iErGDikq9ZyJ9FKDAA/0SlBFs3c7IThSBqD50DALIV
	YEcZ1zhs9M5s0RChUy2JTR5Zf5CjqXzgpDS8u8HU3kzKv7oqAJ2WpEOpJ4rw71Rorj1T2VNro1g3I
	c2GrDFJnSg2dxZtYfAjPwfdjGNBZBQ25F3RU2Dy3jcmCyiMptVic2xG95qkbjdgHaKd397CyCUvkU
	fAhfX3uSyEpryTgoPPCh47P6kY1r3Zx491Hy32nhlOWXhBLSgD9CQVj57iWiVGm8MzW1Va5/RpGYr
	/4p5mG3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhtK7-00000006VzH-3CUA;
	Fri, 01 Aug 2025 17:13:39 +0000
Received: from relay15.mail.gandi.net ([217.70.178.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhtCP-00000006Ujb-1DjG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Aug 2025 17:05:43 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 176D4442CD;
	Fri,  1 Aug 2025 17:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754067939;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5b7Ja/njtquSYHToua+2n7iQrKQp4u+2m/eij/UqS8c=;
	b=AYQB/qoXGHzydvbgG1dHjMI/GqV++DCN0Mz9pC/0KNHnAaVb+hnOCfjmzxO6lhOguTUSXL
	aC1Zov+ICS4rW1Th0MgSChGVBVX7HVEAVnoIPRVH3ECnszEdHZP8MQdc+LkRMGvgiw7K5y
	bQt8HOu/TESK83r0Yie9ApduLcvE0eadhuZAnxYzL0v4/ACJTzWBsAl9lJekNuBH5f4CsJ
	QP1q1qLh0fsJwMTd+svjuexPdjUm+G7LBQJLp70DNK5aAlUkRx3fJQJ45tsKQ/yuhJDfcw
	bFYgYWn2dGAylw1d7LZmh0dUzbSMox4COKkaQm/pNqBLlAyCZEztuRYlRA2ZRQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 01 Aug 2025 19:05:24 +0200
Subject: [PATCH v2 2/9] drm/bridge: add drm_bridge_chain_get_last_bridge()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250801-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v2-2-888912b0be13@bootlin.com>
References: <20250801-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v2-0-888912b0be13@bootlin.com>
In-Reply-To: <20250801-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v2-0-888912b0be13@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddutdegvdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeiieeuvdfftefgueduleehueetgffgjeeitedtteetkeeuueeuueekveevvdeuveenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghloheplgduledvrdduieekrddujeekrdduudekngdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvhedprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepphdriigrsggvlhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepshhhrgifnhhguhhosehkvghrnhgvl
 hdrohhrghdprhgtphhtthhopefjuhhirdfruhesghgvhhgvrghlthhhtggrrhgvrdgtohhmpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtoheprhhfohhssheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_100541_465421_6916861A 
X-CRM114-Status: UNSURE (   9.76  )
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

Add an equivalent of drm_bridge_chain_get_first_bridge() to get the last
bridge.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 include/drm/drm_bridge.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 620e119cc24c3491c2be5f08efaf51dfa8f708b3..ce51b73e323ec5e188e84c9577803bd4934daf2b 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -1358,6 +1358,24 @@ drm_bridge_chain_get_first_bridge(struct drm_encoder *encoder)
 						       struct drm_bridge, chain_node));
 }
 
+/**
+ * drm_bridge_chain_get_last_bridge() - Get the last bridge in the chain
+ * @encoder: encoder object
+ *
+ * The refcount of the returned bridge is incremented. Use drm_bridge_put()
+ * when done with it.
+ *
+ * RETURNS:
+ * the last bridge in the chain, or NULL if @encoder has no bridge attached
+ * to it.
+ */
+static inline struct drm_bridge *
+drm_bridge_chain_get_last_bridge(struct drm_encoder *encoder)
+{
+	return drm_bridge_get(list_last_entry_or_null(&encoder->bridge_chain,
+						      struct drm_bridge, chain_node));
+}
+
 /**
  * drm_for_each_bridge_in_chain() - Iterate over all bridges present in a chain
  * @encoder: the encoder to iterate bridges on

-- 
2.50.1


