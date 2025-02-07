Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF1DC02192
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 09:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9QuQO7QcmtLV3YXSW7XXjQXJN3jM1qRLRyaLw973vGc=; b=ieOkE+g7bOzGVEhazTJhQKenP7
	5WGfIZMCFlDvqp2AfT9Od+dno/HAeA/fafbV0qsj2fDTBU4fThXO//wL+9/9/Ms8hxjPwvcI+1FWA
	oqq0t8v/fxw0crxBabYiSWZ6oFdygR42TaRqq0RqfZLPFAA6joo4qs+hGYgWU0S1JRlHIY/69cfb4
	PvxzUzub4oJOLc8/ZeAOeDMsOlowbdnbJHGyeuvmE509yoO7wY4UI3uk0YMN2nioNIG1163FbqMCc
	gZySTvlz1S4Y0OOjfLikJR7YDkSr4GMlRSYTn24Hbps6NYPCHoJetZkROHum8s2ZSaNp/S2kdLV6r
	4Qd0szpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgKNk-00000008xYn-0RkP;
	Fri, 07 Feb 2025 09:10:40 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgKEe-00000008vOo-1eUK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 09:01:17 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2BCAD43310;
	Fri,  7 Feb 2025 09:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738918874;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9QuQO7QcmtLV3YXSW7XXjQXJN3jM1qRLRyaLw973vGc=;
	b=GSWncqUoCRG8fOhlT1BgumurcgFCDidy4afWlPmtggBq1JnOWRBv0IxGG6+BVetOGhKI5S
	FF37VhIlCH9QHylO0jP/kUcPqysMvln62a/xDma3U4U8SigHrBqroWmm7BebHh7MkS5rpA
	d5sHWvyX8FACg0kX2BZo6ar5hYhGCCVRTcHhtDSoqNWURaS5bfwznlJxJmhFHjMJ51DQoH
	CPekqRTO8wuxdDKL1V54skt5X7MFs9mmgN1F0ZmSYZU6o95lXcf7QBfN+f6lzbr78r3sHA
	85xB/aKdHHqCGWQRnven2+sfGhYqFYSaZexbKwZeD6sxLphwseutALcfRD68gQ==
Date: Fri, 7 Feb 2025 10:01:10 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, Jagan
 Teki <jagan@amarulasolutions.com>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Sam Ravnborg <sam@ravnborg.org>, Boris Brezillon <bbrezillon@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Paul Kocialkowski <contact@paulk.fr>, Maxime Ripard
 <mripard@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, =?UTF-8?Q?Herv?=
 =?UTF-8?Q?=C3=A9?= Codina <herve.codina@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Paul Kocialkowski
 <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v6 00/26] Add support for hot-pluggable DRM bridges
Message-ID: <20250207100110.3bc5baef@booty>
In-Reply-To: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeekiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeglefffefghefhtddvfeeufeeiveekgffgleekieduteekkeetvdehudekgfdvvdenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegtvgejvgemiegtgegvmeeitggtjeemleekgeejnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegtvgejvgemiegtgegvmeeitggtjeemleekgeejpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefjedprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtohepihhnkhhirdgurggvsehsrghmshhunhhgrdgtohhmpdhrtghpthhtohepjhgrghgrnhesrghmrghruhhlrghsohhluhhtihhonhhsrdgto
 hhmpdhrtghpthhtohepmhdrshiihihprhhofihskhhisehsrghmshhunhhgrdgtohhmpdhrtghpthhtoheptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtghomhdprhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhhrgifnhhguhhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsrdhhrghuvghrsehpvghnghhuthhrohhnihigrdguvg
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_010116_583052_A2B20077 
X-CRM114-Status: GOOD (  17.22  )
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

On Thu, 06 Feb 2025 19:14:15 +0100
Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:

> Patch series overview
> =====================

And I messed up with my patch series overview.

Please ignore all lines from here...

>  * 2 Preliminary patches (maybe to be removed as this work progresses):
>    - drm/bridge: allow bridges to be informed about added and removed bridges
>    - drm/encoder: add drm_encoder_cleanup_from()
> 
>  * Implement refcounting in the drm_bridge core:
>    - drm/bridge: add support for refcounted DRM bridges
>    - drm/tests: bridge: add KUnit tests for DRM bridges (init and destroy)
>    - drm/bridge: add documentation of refcounted bridges
> 
>  * Adapt some existing bridges to be refcounted and/or to refcount bridges
>    they take a pointer to:
>    - drm/bridge: ti-sn65dsi83: use dynamic lifetime management
>    - drm/bridge: panel: use dynamic lifetime management
>    - drm/bridge: samsung-dsim: use supporting variable for out_bridge
>    - drm/bridge: samsung-dsim: refcount the out_bridge
> 
>  * Add hotplug-bridge (may be removed as this work progresses): 
>    - drm/bridge: hotplug-bridge: add driver to support hot-pluggable DSI bridges

...to here, as they belong to v5

The lines that follow are the correct ones for v6:

>  * Prelimiary, simple cleanups:
>    - drm/debugfs: fix printk format for bridge index
>    - drm: of: drm_of_find_panel_or_bridge: move misplaced comment
>    - drm/bridge: panel: use drm_bridge_is_panel() instead of open code
>    - drm/bridge: panel: drm_panel_bridge_remove: warn when called on non-panel bridge
> 
>  * debugfs improvements to show bridges, part 1:
>    - drm/debugfs: add top-level 'bridges' file showing all added bridges
> 
>  * Restructure panel code to always add a panel_bridge:
>    - drm/panel: move all code into bridge/panel.c
>    - drm/bridge: panel: forbid initializing a panel with unknown connector type
>    - drm/bridge: panel: add a panel_bridge to every panel
>    - drm/bridge: move devm_drm_of_get_bridge and drmm_of_get_bridge to drm_bridge.c
> 
>  * Add new get_bridge variant for drivers supporting non-graph DT:
>    - drm/bridge: add devm_drm_of_get_bridge_by_node()
>    - drm/bridge: samsung-dsim: use devm_drm_of_get_bridge[_by_node] to find the out_bridge
>    
>  * Preliminary patches (maybe to be removed as this work progresses):
>    - drm/bridge: allow bridges to be informed about added and removed bridges
>    - drm/encoder: add drm_encoder_cleanup_from()
> 
>  * Implement refcounting in the drm_bridge core:
>    - drm/bridge: add support for refcounted DRM bridges
>    - drm/bridge: devm_drm_of_get_bridge and drmm_of_get_bridge: automatically put the bridge
>    - drm/bridge: increment refcount in of_drm_find_bridge()
>    - drm/bridge: add devm_drm_put_bridge() and devm_drm_put_and_clear_bridge()
>    - drm/bridge: add documentation of refcounted bridges
>    - drm/tests: bridge: add KUnit tests for DRM bridges (init and destroy)
> 
>  * debugfs improvements to show bridges, part 2:
>    - drm/debugfs: bridges_show: show refcount
>    - drm/bridge: add list of removed refcounted bridges
>    - drm/debugfs: show removed bridges
>    
>  * Adapt some existing bridges to be refcounted and/or to refcount bridges
>    they take a pointer to:
>    - drm/bridge: samsung-dsim: use refcounting for the out_bridge
>    - drm/bridge: panel: use dynamic lifetime management
>    - drm/bridge: ti-sn65dsi83: use dynamic lifetime management
>    
>  * Add hotplug-bridge (may be removed as this work progresses): 
>    - drm/bridge: hotplug-bridge: add driver to support hot-pluggable DSI bridges (HEAD -> ge/luca/wip)

Apologies for the mess.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

