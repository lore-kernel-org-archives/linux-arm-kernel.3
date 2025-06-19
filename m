Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19D41C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 19:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IUZoRGl8XKKMcHwculHbrWtrVRY+BTfu98QTVEXtSWA=; b=k+QkVcYksBuCKzpT9OMd4Pol0X
	Q8xlyOSd/ZLo6i39s6tBc+6w8hfo9jkCYQ5JLyMyPYJCgoPchtphBNDu5gLY1/p1X+bM2iCaOZST5
	GrE76VJFnw1mYWgmyiwppWgW2ioqOrImdnQENqja9EnyKZluBR2zRIqKGmYxahCOjwKtgRlXPichB
	0ilcpxkWgfw5Erl1GQNFubk8bwlAgIoO9B9JX/ow9U2nj6yPlOfURwzxp3wWSVoqbgBgwgzVudedK
	PYWw3R4ZNMilHGtFc+dNOlf7tKNDXOEs8L8WSY2lg9P4JSML5wyNxGpGkzliltHDkeGHHlFB33Wwu
	iZhGMpYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSKqD-0000000E5Ci-00YC;
	Thu, 19 Jun 2025 19:22:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSKlq-0000000E4EH-3YqW
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 19 Jun 2025 19:17:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=IUZoRGl8XKKMcHwculHbrWtrVRY+BTfu98QTVEXtSWA=; b=k7uJiprY0nrS4uru7nLJxoPe9s
	mrLdxloQx49xBoXAnLCrZhw30BudsMcS0q9t/2K+ZsxzgqgHaGW2xaUD9NBo2WgqFrTqX4rxe/qCF
	HYbLDUwhqb/iFNTDhTEs7xGMEvqU9b8kCCc7pvIQ1T2ulXGO4a4Ne8gzgNpUfgy4Lq9mLEI7ifVKG
	8IGzkFuMqOZjphvo4Eip23w2Kj1TRbvuM0zjaoMECG2IIYU6WsQ2dhtHN0+ifRef0EN2dD5vURiPc
	tsiAR72jMUs6wlRAAEdTV06Cs07Vj9gXWHKvEASQFh+xIAKrZhAoNB0qvYAA7bKXSOLX/RNGH4ZC3
	zKZnHlMw==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSKln-00000004YZq-385y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 19:17:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750360666;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IUZoRGl8XKKMcHwculHbrWtrVRY+BTfu98QTVEXtSWA=;
	b=UHtEjQi6EDxQzZzX1j4LvcsVtH0K0vmFCerI1ppQa/c+carsyp+4cE3Lo9dNTQBWRLoLQe
	BjUdj1ifJXXBA8AdcqP9u/90Is4NrFqec3Mm2bEYEP6kbLUlphi+TS4IunvJCR4G0Cu2WH
	PXY2yIiiw1pc9NnvDm9kraAtHv28wjU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750360673;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IUZoRGl8XKKMcHwculHbrWtrVRY+BTfu98QTVEXtSWA=;
	b=cS+1ClqDMmKn9rXPATpbyI3aSSDZkbbbWcP8rmTJFG6fBpBNHij9H3N/xOHgHYB8/WFdxe
	/CDziieilMFED4GLdvPPhOa5RkEWjJTlX5+YgDwf2K4HC32KT4CXHd1H3SCruay3mm62Aj
	lIjZR0OSDi8DSmKbq9H5F70jmqnOa0s=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-451-f2y4jO45Nymi3edFtLyl6w-1; Thu,
 19 Jun 2025 15:17:43 -0400
X-MC-Unique: f2y4jO45Nymi3edFtLyl6w-1
X-Mimecast-MFC-AGG-ID: f2y4jO45Nymi3edFtLyl6w_1750360658
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 22B8F19560B2;
	Thu, 19 Jun 2025 19:17:37 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.132])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A25BB19560B2;
	Thu, 19 Jun 2025 19:17:26 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 19 Jun 2025 14:15:53 -0500
Subject: [PATCH v2 01/16] drm/panel: get/put panel reference in
 drm_panel_add/remove()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-b4-of_drm_find_panel_part1-v2-1-0df94aecc43d@redhat.com>
References: <20250619-b4-of_drm_find_panel_part1-v2-0-0df94aecc43d@redhat.com>
In-Reply-To: <20250619-b4-of_drm_find_panel_part1-v2-0-0df94aecc43d@redhat.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, Stefan Agner <stefan@agner.ch>, 
 Alison Wang <alison.wang@nxp.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-samsung-soc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-tegra@vger.kernel.org, Anusha Srivatsa <asrivats@redhat.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750360565; l=1124;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=gduD5wUHpyegnOzCbwQD/ohEcVXwZ6Qjsy8tHoT5140=;
 b=Oc8qrV8Xj2Q/G9/VWGYSxA7a4bUjy007RPXT1RvRMyIzkygFnbR0TsmFakVD8oLlQuIsxGR7A
 XCtuG3cA2XIBC25fKaqmKD56QVrKK84HAg1Zy9PbKqqUleSQ2f/gc6A
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_201756_113311_2A33E3B0 
X-CRM114-Status: GOOD (  11.09  )
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

Take the panel reference and put it back as required.
drm_panel_add() and drm_panel_remove() add a panel to
the global registry and removes a panel respectively.
Use get() and put() helpers to keep up with refcounting.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/drm_panel.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index 805b4151ccefd8ec0107951162c3b71446102ffb..ced6b08923b2150ebda6e1d9001517103895def1 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -80,6 +80,7 @@ EXPORT_SYMBOL(drm_panel_init);
  */
 void drm_panel_add(struct drm_panel *panel)
 {
+	drm_panel_get(panel);
 	mutex_lock(&panel_lock);
 	list_add_tail(&panel->list, &panel_list);
 	mutex_unlock(&panel_lock);
@@ -97,6 +98,7 @@ void drm_panel_remove(struct drm_panel *panel)
 	mutex_lock(&panel_lock);
 	list_del_init(&panel->list);
 	mutex_unlock(&panel_lock);
+	drm_panel_put(panel);
 }
 EXPORT_SYMBOL(drm_panel_remove);
 

-- 
2.48.1


