Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2107CC7115D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 19:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8gPs4sj4/K13gI/HYpqYV+uIWwgLBY8Dn0ugveCFR1k=; b=m7d3sfv1m2pnigzfnI319St8tO
	f5U9r4XtlA/6JaJno7R/O69jOgHoVPph2pSfmY5JSAn/cOAnZC+ChMWa2depGPo4wTx9MHo01y9XP
	S7drKlz3W4vbSv7fdj9clMb153DoM4+1Yt9lu057jtf5uv450zHG+TzHvK9Gy3/tQBZJx5VZXqBBn
	3SxbmMdf9AN9LNC5Frg+23hiaVNxTaTY6pDC2QRNUl7cHc7t+8dHP5JsvmNv4ihFothnLHSqUB4vJ
	7tdwU4U63ryjly0QTYXVndUOrCWeB1pUvgzF+37APlk/yJc+eLXe3uJfOugvfHHNt0xW1dxylByGr
	Yr9DhITQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSLJT-0000000E9Y0-493Z;
	Thu, 19 Jun 2025 19:52:43 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSKnF-0000000E4V9-47ZD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 19:19:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750360765;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8gPs4sj4/K13gI/HYpqYV+uIWwgLBY8Dn0ugveCFR1k=;
	b=Za9lVRGNNu0dY0wEcMNMJPpcJ6kaaw0QwPUeqPVCKRw+O+dA0sRnNpeHJU/W15mNMSs9OW
	Xd18bt7vUqgpRL3Q06lfJDsd6LkvY7yayTsrIv4MkIH2XYDX2fCN59qEHR75wRGyZYITyr
	RMp2SwcF9G2V/PoUh9rSuOQAeTiJBJk=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-348-M_JtvyASMu-WKdAYu-ywLA-1; Thu,
 19 Jun 2025 15:19:20 -0400
X-MC-Unique: M_JtvyASMu-WKdAYu-ywLA-1
X-Mimecast-MFC-AGG-ID: M_JtvyASMu-WKdAYu-ywLA_1750360754
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B94411809CAF;
	Thu, 19 Jun 2025 19:19:14 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.132])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D741B19560A3;
	Thu, 19 Jun 2025 19:19:05 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 19 Jun 2025 14:16:03 -0500
Subject: [PATCH v2 11/16] drm/panel/sti: Keep up with refcounting
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-b4-of_drm_find_panel_part1-v2-11-0df94aecc43d@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750360565; l=807;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=wdL1e0FxJPNm7JAn83OhitF3yXWvKr44k4EiR1gWX58=;
 b=EwhsT3JAYQcZTNfClR+7o4NypNPor8tvQQ/8B4FzoPHVR7sZ69og4CleXCpE8AMMwaqFipcqo
 c2oa6NAe60iCIXtylSBSTU2sIKO+U0ANF2f9eYJb40K+dB3S6wfagyz
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_121926_086900_21D32DCE 
X-CRM114-Status: GOOD (  11.04  )
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

Put the reference of the panel returned by
of_drm_find_panel() in the disable() function
after which panel won't be used.

Patch added in v2.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/sti/sti_dvo.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/sti/sti_dvo.c b/drivers/gpu/drm/sti/sti_dvo.c
index 7484d3c3f4ed5fac7eab408e30cbe2f6b87f27e5..11684279320a0e4b15fe761bdf6782cc24e8be96 100644
--- a/drivers/gpu/drm/sti/sti_dvo.c
+++ b/drivers/gpu/drm/sti/sti_dvo.c
@@ -225,6 +225,8 @@ static void sti_dvo_disable(struct drm_bridge *bridge)
 
 	drm_panel_disable(dvo->panel);
 
+	drm_panel_put(dvo->panel);
+
 	/* Disable/unprepare dvo clock */
 	clk_disable_unprepare(dvo->clk_pix);
 	clk_disable_unprepare(dvo->clk);

-- 
2.48.1


