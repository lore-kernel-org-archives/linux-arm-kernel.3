Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDD30CD5BA7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 10:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sao0yuOn9cKu8y1mwI62QTwKuextTxc4wrqkEYzJgG8=; b=RRPo5ivIQIqd5hwdpGnVgATKOI
	iJBG2ySBus4clAmohf3xN9S7NxsF97bp1qALxPW+tBujH0JkuuosR7Jt8zgLlTv5ad84ZdLEikz/N
	Ty8YrwB2cD4uvnLLofZN+DiZ3iS4bGbdUNP/JmbEwo5v9odj/cQ5NKpAdW9D46v1goL0xBbHqX7d+
	UzOqu/Tcp6+omDdpw15+epYw/Zi4atYE8vdyQpXglVd8TQZT8OlEDYcRGMiVAZF9G3Kc3eK1l1Y/n
	EFJOfirfOkBSL86DJwC5CqZGJUZUBlqyS0ZzGFtUgkJqD1bBtPYMib52h/qtbI9I4DQhR+b1trCBQ
	QjixZBbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPHrV-000000018nN-0XlV;
	Tue, 19 May 2026 10:39:45 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPHrP-000000018eh-1o1p
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 10:39:40 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id BFB61C2B9DB;
	Tue, 19 May 2026 10:40:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 95B0B606E9;
	Tue, 19 May 2026 10:39:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1F29C107E8AEA;
	Tue, 19 May 2026 12:39:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779187175; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Sao0yuOn9cKu8y1mwI62QTwKuextTxc4wrqkEYzJgG8=;
	b=fds5ptX+ISSKYE732a+mWt2C3yJ0bk/EOQU5Yg8lFWoWyvrrpHoft9W6zIvZp0p1qS/+Pj
	u2RTS20ixBQv2nQhXkkimN9FDNyYOQhlrO86b9HmB6xDbZESgY6d07ajiaLmcpsnh7UV5u
	lRSIl1YZyPCRT7fqlZNjB3BtFSWV1edY4ZN0v3JoYJYTd4eNDmJDoWbkBPq8jP9qyek1eu
	7z9tc9phH/NEJ4nXXVR8L7kmBHrbKyjKulqYnXnkVUY6VrzavivWqWJtHfqTogVgDfxDdJ
	aePNkGH1yIdz5mpmp/IOM0FwuzVV9HxIii1pXp6X8L2vw2VvSbbpGTQi8lHqtA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 19 May 2026 12:37:38 +0200
Subject: [PATCH 21/37] drm/bridge: initialize chain_node list head on
 allocation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-drm-bridge-hotplug-v1-21-45e2bdb3dfb4@bootlin.com>
References: <20260519-drm-bridge-hotplug-v1-0-45e2bdb3dfb4@bootlin.com>
In-Reply-To: <20260519-drm-bridge-hotplug-v1-0-45e2bdb3dfb4@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, Marek Vasut <marex@denx.de>, 
 Stefan Agner <stefan@agner.ch>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_033939_649612_CD23DEF6 
X-CRM114-Status: UNSURE (   8.66  )
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
index 687b36eea0c7..657f6609d7b1 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -378,6 +378,7 @@ void *__devm_drm_bridge_alloc(struct device *dev, size_t size, size_t offset,
 		return ERR_PTR(-ENOMEM);
 
 	bridge = container + offset;
+	INIT_LIST_HEAD(&bridge->chain_node);
 	INIT_LIST_HEAD(&bridge->list);
 	bridge->container = container;
 	bridge->funcs = funcs;

-- 
2.54.0


