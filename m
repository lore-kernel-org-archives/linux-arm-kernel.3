Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E31C6F34C4E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 13:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I/uO96Rr3tKxwsuoLDCRBHX8aNlKyL9xUuUhRjLmqu4=; b=n7ylwNHvlZL+QRh8d06rU8LAX0
	aEgmtrcZJOvuuyODrkf1U5eb5RlX/QPCs37gH6T7ao9xj1i06zE0EHyObyXRONq129yvlfXDe0s2X
	Zmi/XRUqPHJolRzwLTegejJacOumrjzE9jSdO+3X6ze7EGG2/tARYCvF0DP57Xg1b1OWqTv5CVQI9
	Q61TkoMASLnff6Tgoc5ioiswQzDCihlnyKvZLtQAztdo/+G32hvxnYh1H/YOghyaph/btRkzr7h0a
	WM/HJQrJ47RKw+cKSFNlaS5kdvk4lQpghKrToTE5e8ZZrOAbdcfRFiHaaLmM4LevOLgFlzgylyp65
	rO+LwoMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCHox-0000000FnzN-09Lg;
	Mon, 13 Apr 2026 13:59:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCHov-0000000Fnxr-3o9m
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 13 Apr 2026 13:59:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=I/uO96Rr3tKxwsuoLDCRBHX8aNlKyL9xUuUhRjLmqu4=; b=QmQD1iydfrnDxlhUXjiwzrm0iS
	a1q1+1DBaCxn7xEaxkCPqAhHPDz0NkE070Hjs4TeZLltBslBqwqE5SA/s0ghnyRo7HUODxgMkYarw
	BkyyTkqo3hIKScA5NEd4EepvUZM4F6hZZtWWyHVb7gICsezCRqST1+BAAGnbOrEG++vvc/0B0Z0sX
	Ip0YP84x/Y8iSGv6ae3zE32beJQhOzop0f/O/C8Fqv3wMDo+jCyZqKg+GmPNYjBfk3rFlzmMGMmoh
	0J/Bo/O5k2/fSp+D+J/1lQFbTsyMx8HGrhF9tNY9hqeiyNxhFKAerNJWZmgFjC1f/8yg0whR79IDt
	NMtxiOMw==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCHos-0000000GtYM-3v5J
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 13:59:20 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id EE59A1A322D;
	Mon, 13 Apr 2026 13:59:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BCAF15FFB9;
	Mon, 13 Apr 2026 13:59:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8B8C1104513DF;
	Mon, 13 Apr 2026 15:59:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776088754; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=I/uO96Rr3tKxwsuoLDCRBHX8aNlKyL9xUuUhRjLmqu4=;
	b=Vkuq8VsDIcVs0Mduv36yWY8vjJHKU9KQpCScZCTQg0ruiKWVh7fzTqZ9qV2q3SFTyStWfO
	Sst1CPNF6aGqEIntpfDlaqRE8AlyIoW+jCt0qzkySiEpZp15WDfbEoztRWkVacV+npXLsY
	I14yhgJTOYIpUUL+MOkd5/SiW8YmvFkyY0J0tfq7wD7V0VNn+mjYoo9XtcbatCBOyHMBlB
	EPh45HfR5pxGQvUJmwqAxydEru5gT4MrBfsdURwpA4aRReBcqPyrP5GjQF3hjk81Ipx5S4
	HmWR4LuufaQ8t5gUjj2d71isPQ/8wAzs6vFImdt12chDHIhUh4KivuStyt1vnA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Mon, 13 Apr 2026 15:58:38 +0200
Subject: [PATCH 06/10] drm/bridge: lt9611: switch to
 of_drm_get_bridge_by_endpoint()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-drm-bridge-alloc-getput-panel_or_bridge-v1-6-acd01cd79a1f@bootlin.com>
References: <20260413-drm-bridge-alloc-getput-panel_or_bridge-v1-0-acd01cd79a1f@bootlin.com>
In-Reply-To: <20260413-drm-bridge-alloc-getput-panel_or_bridge-v1-0-acd01cd79a1f@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>, 
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.15.1
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_145919_223328_A14CA409 
X-CRM114-Status: GOOD (  11.36  )
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

This driver calls drm_of_find_panel_or_bridge() with a NULL pointer in the
@panel parameter, thus using a reduced feature set of that function.
Replace this call with the simpler of_drm_get_bridge_by_endpoint().

Since of_drm_get_bridge_by_endpoint() increases the refcount of the
returned bridge, ensure it is put on removal. To achieve this, instead of
adding an explicit drm_bridge_put(), migrate to the bridge::next_bridge
pointer which is automatically put when the bridge is eventually freed.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 4517aee83332..6aeaf248d7fe 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -37,7 +37,6 @@
 struct lt9611 {
 	struct device *dev;
 	struct drm_bridge bridge;
-	struct drm_bridge *next_bridge;
 
 	struct regmap *regmap;
 
@@ -761,7 +760,7 @@ static int lt9611_bridge_attach(struct drm_bridge *bridge,
 {
 	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
 
-	return drm_bridge_attach(encoder, lt9611->next_bridge,
+	return drm_bridge_attach(encoder, lt9611->bridge.next_bridge,
 				 bridge, flags);
 }
 
@@ -1058,7 +1057,7 @@ static int lt9611_parse_dt(struct device *dev,
 
 	lt9611->ac_mode = of_property_read_bool(dev->of_node, "lt,ac-mode");
 
-	return drm_of_find_panel_or_bridge(dev->of_node, 2, -1, NULL, &lt9611->next_bridge);
+	return of_drm_get_bridge_by_endpoint(dev->of_node, 2, -1, &lt9611->bridge.next_bridge);
 }
 
 static int lt9611_gpio_init(struct lt9611 *lt9611)

-- 
2.53.0


