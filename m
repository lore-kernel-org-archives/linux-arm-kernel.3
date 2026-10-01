Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0DF7CA5FCB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 12:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fd+170WrMvhaKQWHJoZWuWMeak3P1K3QiRPYIzfMKEw=; b=RChGEiSXalcjvEEqbI+8KG1ZZT
	N3BBjL27VtAlTzA0ZznB2LShz5FmrFEvWEmGZKC1Uj6SKYQNKzq05YuCX25rBFUFDqwKl8JJNItoD
	sqGbfPrecjR5xmFsRBXfWC5+eLmS+rp/Oq0WvAAEDwLb2BSNxTtzJJDTqdxrF7PR0PrZ5Eb9Y2Zrg
	JFuC3vVB4yzk4Yjq47CAWoAzxumOLih2JhGXcy6tCTY7TDGk0hUKs5qOjtBUUTyCP/C20+55JosrR
	HA7y9l9/SuMMwioUotWJoiSJRouFVEvIMMjUPd9QUFsO/a495N8Zkv0Q0Y1p5YxsHY1e9HDwqyBpp
	u5YXJeZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCG8Q-000000096YZ-1zBT;
	Thu, 01 Oct 2026 12:43:38 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCG8M-000000096UU-0kXt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 12:43:37 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B1A5F1A24DD;
	Thu,  1 Oct 2026 12:43:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8145060341;
	Thu,  1 Oct 2026 12:43:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BC53E10328105;
	Thu,  1 Oct 2026 14:43:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790858610; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=fd+170WrMvhaKQWHJoZWuWMeak3P1K3QiRPYIzfMKEw=;
	b=2z6W/aD3WV5Y71R3rAgw7uP/FKIkrJwHL4AZPRDsZtVoxrEFptk/qkBWd5IXrm5IyL482x
	LDAgjFSJB+V1fxZVRoUZdq8rEkIuZOEgYzpXGZjKjQI+gseI7rd5apbPi2T8lYhdZHZOtc
	/ffFq7rU2uQyPBJysMUEfwMJZhkMV6EdS76mmmsycfjzNZoLwnjN/sIDwR7XCEctyqrQ8p
	JF5PU8SyFvPqY2pp5YaKt1xgc8+cumkrtSVXOq2i+21HbAaKHuz7idivMYV6yBmvbEujuW
	wZzm3xipJlnMmK/bkaRyijbhZH4B2JnJzEJ2angPopud/gQsLOBaoJ3Rbt/liQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 01 Oct 2026 14:42:30 +0200
Subject: [PATCH RFC v2 08/24] drm/bridge: initialize chain_node list head
 on allocation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-drm-bridge-hotplug-v2-8-8e34986dcb68@bootlin.com>
References: <20261001-drm-bridge-hotplug-v2-0-8e34986dcb68@bootlin.com>
In-Reply-To: <20261001-drm-bridge-hotplug-v2-0-8e34986dcb68@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>, Marek Vasut <marex@denx.de>, 
 Stefan Agner <stefan@agner.ch>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_054335_806959_88B2A132 
X-CRM114-Status: UNSURE (   8.47  )
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

In preparation to add a check to detect whether a bridge is not yet
attached, ensure the chain_node list_head is always empty [as in
list_empty()] since it is allocated, until it is attached.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/drm_bridge.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 1b4ee746acb9..cd0c246f7e99 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -418,6 +418,7 @@ void *__devm_drm_bridge_alloc(struct device *dev, size_t size, size_t offset,
 		return ERR_PTR(-ENOMEM);
 
 	bridge = container + offset;
+	INIT_LIST_HEAD(&bridge->chain_node);
 	INIT_LIST_HEAD(&bridge->list);
 	bridge->container = container;
 	bridge->funcs = funcs;

-- 
2.55.0


