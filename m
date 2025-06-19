Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF643C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 19:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0uj5bq15NBziJEiGW1nt+d5vwRWbeeBx1df0xo6lfNU=; b=KRyKC0T8qSvNW23YnEm1eeDxG/
	bTTR9MHJT2nXjZ7vlt2jY+9WKHh5PeMK5VXelyq6VYxR6rsr5tA0vG4FN218xUM/tQSD4PF79z84s
	Tzw/6ntXvTXAnCy8oN3IHU+EfLf1r8cZNg7VQuPixqjifPG2ZPYt/rih5yuFJF5LwYoZaGbPrASHs
	m9jU2yzNoWhJfZBv/9mDA54yZkmA7+Oe3ESQgzFa4hS+qpmlBG7+qpmMPnPK53Lzrpc+jAYT7mBAD
	PHKoskiAXShgOfd7kWKMX2iB7W/JvUJ6pxzzB4qyUYSXMaJiw83qdt9fneYPh+q45VqbG1UQ/CAn4
	pSSuiJBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSKub-0000000E618-2CMJ;
	Thu, 19 Jun 2025 19:27:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSKmT-0000000E4KZ-3mQ3
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 19 Jun 2025 19:18:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=0uj5bq15NBziJEiGW1nt+d5vwRWbeeBx1df0xo6lfNU=; b=FR9QGdgYx8+1Pby1jsflmofNx2
	8Cofn+dQTCKg/SjbGJW5UQYDN8AD9jUIFEtac4eB4jfAUBym4zFGAec6+9kQJX3EHctNJdDT9MDpF
	n7ajmIjsHKTePR9md/L2uxtrKH3K2E5mPS7SZzJFjAxOjGr4TDMHGb5s0JPC/UehClK5kkdC6vh0x
	BFeAto3Tdpt5+XtpM33sDnlpAw4dEpiq6U7z5QgHF2qQpDP4dFWAZ8vNXr8Mrk7MAjh7f4yf9cSAz
	o/+AasqoqGYl7W9SSkZ2t+JNxxe7YdZjhpdr5YkMIbLHR3zgW7qmc6Uyqe6uqe/PkLLqLYMYTACrA
	sgEs7neA==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSKmA-00000004Ybk-2QnZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 19:18:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750360696;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0uj5bq15NBziJEiGW1nt+d5vwRWbeeBx1df0xo6lfNU=;
	b=TjOw80i/FLU9zdf/xoVc35Bf/QEpM4OfT/Axie8/ikwoSb19ov4OE1MQ4buKXeZ+FN3Kxc
	OEV53ivjd+XYtgT+bAopD/OPuiCzC4dbr0Jgoc6DuSCWgijlw5s5BhDDICxwesZt7ch2uz
	6r+e9hRYVmJfS9rBQhkM0Dw6jJ5dCsc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750360697;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0uj5bq15NBziJEiGW1nt+d5vwRWbeeBx1df0xo6lfNU=;
	b=Ox+JZmvt8UHaOOWC4urH4gbAr7IdsmOU5dT2IWWd1aQwQaweJF/XNVoYrKFWRoaqbrduiE
	1aaTo+DDLsDeQn2t5PcefKPe3I1IKrI7U2wxSMZl5PVV5lgiajYETcEsQqRZu4TXwgRL7d
	ieUVfUPkdLVERlhLEe39KaEdUVovs1A=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-536-NlCAE8VIN0ew9ASJW0oK_A-1; Thu,
 19 Jun 2025 15:18:13 -0400
X-MC-Unique: NlCAE8VIN0ew9ASJW0oK_A-1
X-Mimecast-MFC-AGG-ID: NlCAE8VIN0ew9ASJW0oK_A_1750360689
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1940618002EC;
	Thu, 19 Jun 2025 19:18:08 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.132])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DAC5819560A3;
	Thu, 19 Jun 2025 19:17:57 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 19 Jun 2025 14:15:56 -0500
Subject: [PATCH v2 04/16] drm/panel/sun4i: Keep up with refcounting
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-b4-of_drm_find_panel_part1-v2-4-0df94aecc43d@redhat.com>
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
 linux-tegra@vger.kernel.org, Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750360565; l=704;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=vwDL0e/kpo3IfQsCqGi/us3Z8zaxOzAuP+sQe4GqNv4=;
 b=g7khlqVnumIsHfCfSyg1woKg7b+yPfwhEzUFo3QOoMq0IPTiWV2rTpeFC7PVXfC46T3XRxrJF
 fI+al3sbj0kDgQkGEBOUB30evTAaic6E/aBtVIm4pMDxX40daFlJ1F0
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_201834_298922_12D841F6 
X-CRM114-Status: GOOD (  11.87  )
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

Put the panel reference back when driver is no
longer using it.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
v2: none.
---
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
index c35b70d83e53b7397c6e38dde45824bd49fdf099..36d47d7cedde1e1e3e83eb670520664100bd0a25 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -990,6 +990,8 @@ static int sun6i_dsi_detach(struct mipi_dsi_host *host,
 
 	drm_kms_helper_hotplug_event(dsi->drm);
 
+	drm_panel_put(dsi->panel);
+
 	return 0;
 }
 

-- 
2.48.1


