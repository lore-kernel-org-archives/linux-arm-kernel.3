Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95854C7115D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 19:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CQGJ423Vt5SJF9bX8twapzBPTzXeITYH2XzCWr+uqU0=; b=JhVzfSBRd8FRm7bM2WyHYMu9YY
	MzL7WuP0rEpexKA7QvGW/9CyHvmQDKB5FkwEEP2/ZjLxzLhe4QWH/+sp1QMUhfBA5H4twXn5Jy/CX
	vNk/xnesN3JCxax6iBp0cG9EPlDeEH2AQ37e9GBgMTdvRX9Zzxso9/kiLlGB5xwlWXyexoR5deo0M
	lABv/UvVFoYFhlS3LJr+mQN0tXbTv/0adf1QEsZWRsQno8ZW7YqH9Xhh1ewVZMF0sxwL9xXxH2iRX
	JFCC33xKgbLauuk//zqZE3X9GWfCfxmX+i1/tK0khFx/fUw9Y/b8aFjnTZ49VhBsj05OnvO1Vzuih
	3yF8usag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSKsP-0000000E5qD-3A8a;
	Thu, 19 Jun 2025 19:24:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSKlz-0000000E4Fw-0upr
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 19 Jun 2025 19:18:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=CQGJ423Vt5SJF9bX8twapzBPTzXeITYH2XzCWr+uqU0=; b=htSe+VqknVgoIykf8+JI209aTQ
	/h5pVdoYSX6OA4OwiFCI+zZC5FSzknDVIQ5E3PNQKKIpeFvs40mERkEq1lQlYTZbzvmNwKH0/i7HM
	TxTyVp7QlZyjT7NF112Qm1S+GCqw8hPtrc13U+ddB1tX3udPPIlmsdGaPdh9MJqhh+Bkh3oxxlrxj
	OPAiKu8DHbNEc/R+i3xGALQpi5Zd+2AL/sEy8djZdmmpqN+IvsHhSddETsPhbwIdrElsAJMO2V1P0
	2gDr3Tdn+wbtrVdevaU0aPuFcvV/BlczVW5T6PGEXWp42cXUS6oR9Tr/j6GGO9j6lBeVZ4lCER/SD
	wQqNTdUg==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSKlw-00000004Yb2-37uB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 19:18:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750360676;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CQGJ423Vt5SJF9bX8twapzBPTzXeITYH2XzCWr+uqU0=;
	b=AXL9CpqoIJhOQ1sBHDJQbiWr1eLdpPhNSYczX8fIvYjQJaEhQsK8pLHxIsfnwqW5I4AMjS
	RcFyl0k4093oDPp0lx21cm/oFGFLpkxtTUOUY6qN/1hYI8QwHK7PsS4CKSN6bC9ZpunZdo
	mkNp+LVtOCJSqfSL9y49jKFulzpBL60=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750360683;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CQGJ423Vt5SJF9bX8twapzBPTzXeITYH2XzCWr+uqU0=;
	b=GPGObS2gXUfNcJ1j31e3GxkzEtASWK2dW41ShbW9hNbJtItfFfQwPfxP2gIqgH55qJp+I0
	C5NUXpqQwCboKp7Ap1TnuLhjpBBwlMx1nJQ7zUntsf2miFRxA2dbb9NcS85WTAasf2ZXB4
	yCZzJ8wSIwqjYp6Jw2Tp0SBEXK3qn7U=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-593-ls--TuZHMf-R6K8qq2UeHQ-1; Thu,
 19 Jun 2025 15:17:53 -0400
X-MC-Unique: ls--TuZHMf-R6K8qq2UeHQ-1
X-Mimecast-MFC-AGG-ID: ls--TuZHMf-R6K8qq2UeHQ_1750360668
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A2FC3180028B;
	Thu, 19 Jun 2025 19:17:47 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.132])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7937B19560A3;
	Thu, 19 Jun 2025 19:17:37 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 19 Jun 2025 14:15:54 -0500
Subject: [PATCH v2 02/16] drm/panel: get the panel returned by
 of_drm_find_panel()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-b4-of_drm_find_panel_part1-v2-2-0df94aecc43d@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750360565; l=1424;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=ST6gjD9VoyICwBm50h8zGvdSJVunJy885W3sLa5J6Jk=;
 b=2GD/QlDrfEdGiTy6fKjGhjgkbp1B4kVCHTBPGz6vEdOtoBLw7z/MuOICWzDPIfpy0SutVFUYr
 uOQwo6MYQ5wDJwrmx8Zr73kdxJSsaQmoT3S3bnoZcu+MwaVORo6f+F7
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_201805_031584_300C7759 
X-CRM114-Status: GOOD (  14.04  )
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

of_drm_find_panel() returns a panel pointer that the caller
holds. With refcounting in place, increment the refcount
of the panel that is returned. This reference has to be put()
by the caller.
Document the behaviour expected from all callers of this
API.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/drm_panel.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index ced6b08923b2150ebda6e1d9001517103895def1..a3aab725f91f76661185b3ebdf3d9b337bdf230f 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -401,6 +401,9 @@ EXPORT_SYMBOL(__devm_drm_panel_alloc);
  * Searches the set of registered panels for one that matches the given device
  * tree node. If a matching panel is found, return a pointer to it.
  *
+ * The refcount of the returned panel is incremented. Use drm_panel_put()
+ * at the caller side to maintain the count.
+ *
  * Return: A pointer to the panel registered for the specified device tree
  * node or an ERR_PTR() if no panel matching the device tree node can be found.
  *
@@ -422,6 +425,7 @@ struct drm_panel *of_drm_find_panel(const struct device_node *np)
 	list_for_each_entry(panel, &panel_list, list) {
 		if (panel->dev->of_node == np) {
 			mutex_unlock(&panel_lock);
+			drm_panel_get(panel);
 			return panel;
 		}
 	}

-- 
2.48.1


