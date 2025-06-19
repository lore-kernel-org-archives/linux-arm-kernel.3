Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D418DC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 19:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lrc8YKlde5W1t6OJf9ynUBwY9w0/oeOW7czUDKX3OBQ=; b=Nn6Vc6Afp6fcak1PKlOGHhbguR
	8s7wZaOXewtRV2TwhjJ/P7oVxZjIqK5ToCNdZ6WRutq1y1noullNxNduG+OJkSmTGV8OfmhdLI1jm
	iqlg4YM7r5tOisbq//0ADSb4PE4BxHXTuI0ZiqxS5z3uvG06gRx105bFAAmVOMLIRNIT16gPPl60/
	gVc1Ks9tbcQ/eRKrlSP93H1Tyf5e8tNuYKcxw9ohehpPuoFLWEqg9GFbZgtRWn0BFiF96O2ZRbDVy
	QTxWcprBam4Xj5PDlLsQwmKcBzXoKuknKp+9ztDupPByB9h8RBxZG27NkIksGRjrhTyUXtFoB1S/u
	PweJ7uCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSL3O-0000000E6xQ-20n0;
	Thu, 19 Jun 2025 19:36:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSKmh-0000000E4NO-3qkE
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 19 Jun 2025 19:18:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=lrc8YKlde5W1t6OJf9ynUBwY9w0/oeOW7czUDKX3OBQ=; b=ZUIPM8Gihg3/u+H+WI34snqr2g
	7Qu16ncahIFAMOyqqbg63O91Mgi9ZLUl6xZabl6JwnDxKH8iPYb0VvRQI0FtTFV07G3sxHoJXuBzY
	L3hHt3f3ThLwjLQ1QF/TR2jGK9zqfDqQPTbGgBpfDgRTU2aVtPWdtwALw/fi5rb636mMLgpqewcaW
	ZMMEmoso5f3tFJE3rHDT5y4FP3XCp7gMYQ6QG6pTz4YC51Fl8AIJm2U/PYN7MildiCqRZ7rz7bN4c
	jIDPmfKprMiWlDNidFJtQz+X8yYb1d0ueB65saBASDoEjsk7wfOzs0nucHI4LOVyntmpdGUro/Mim
	f+N2fUEQ==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSKmd-00000004Ye6-1msJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 19:18:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750360725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lrc8YKlde5W1t6OJf9ynUBwY9w0/oeOW7czUDKX3OBQ=;
	b=X+9Cb2jpYeqy0yDVNTzwu81uHizhuKZFRdZGBR3bAiaz5OhzUJB6EvvaNHgFCcBk0xtm/s
	N+eJhSMWgkHZwsovvkFR//xJumxlBoKQA91GAWnNUV32jLR3ztgUELbXX6KJMw2Ts8B9LE
	JTs5sduOfMvsi7lAgyjFT4sJW+33U0Q=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750360725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lrc8YKlde5W1t6OJf9ynUBwY9w0/oeOW7czUDKX3OBQ=;
	b=X+9Cb2jpYeqy0yDVNTzwu81uHizhuKZFRdZGBR3bAiaz5OhzUJB6EvvaNHgFCcBk0xtm/s
	N+eJhSMWgkHZwsovvkFR//xJumxlBoKQA91GAWnNUV32jLR3ztgUELbXX6KJMw2Ts8B9LE
	JTs5sduOfMvsi7lAgyjFT4sJW+33U0Q=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-265-Ad2e_eS5OrOs14i45_1NqA-1; Thu,
 19 Jun 2025 15:18:42 -0400
X-MC-Unique: Ad2e_eS5OrOs14i45_1NqA-1
X-Mimecast-MFC-AGG-ID: Ad2e_eS5OrOs14i45_1NqA_1750360718
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 85DED1809C89;
	Thu, 19 Jun 2025 19:18:37 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.132])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id AEBE719560B2;
	Thu, 19 Jun 2025 19:18:28 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 19 Jun 2025 14:15:59 -0500
Subject: [PATCH v2 07/16] drm/panel/rz-du: Keep up with refcounting
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-b4-of_drm_find_panel_part1-v2-7-0df94aecc43d@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750360565; l=927;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=1Q2AGcbykrcW7nFXSzl10ipwDgXlsi2VlG8nEde7weQ=;
 b=qAr8RZZlNdQyaPiSFC0Wdf3kFGUcM+dR+cMcs9lrFvGJ1pPQ3r9/IBeeudgIvJu3maHcs57Iv
 McisF4jFKB3DIn1WlV5Es9wfqO6DSA5f/+uWUxQESqRE6eNHo81p/BR
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_201848_432534_47CC45B2 
X-CRM114-Status: GOOD (  10.76  )
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

The panel returned by of_drm_find_panel() is mainly
for the purpose of devm_drm_panel_bridge_add_typed().
Put the panel back accordingly.

This patch added in v2.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
index 5e6dd16705e60a196f607819336ed41135fdec44..112415f948d3e7f3685d629b29107a269865c9c2 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
@@ -83,6 +83,7 @@ int rzg2l_du_encoder_init(struct rzg2l_du_device  *rcdu,
 
 		bridge = devm_drm_panel_bridge_add_typed(rcdu->dev, panel,
 							 DRM_MODE_CONNECTOR_DPI);
+		drm_panel_put(panel);
 		if (IS_ERR(bridge))
 			return PTR_ERR(bridge);
 	} else {

-- 
2.48.1


