Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F8A0C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 04:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HraXtN+VDBmg8Jr7Ws1Qqx3eC0zBZOgQnBqDsPJqBQo=; b=Y2OKyuI16zLHabRKQa2YeFxfVO
	Hnjh4NWQDrKditTdURNOFjUxldojCGVRni790++QkPTiOP3uJGlOk7y3IzoT0vvSv4ZoZJjBM4HZg
	7NYlBngparkWfQAbPj396WoaG47s7o/4iPMXBzdmjDiKEzTUkhcomOym8V3QWFIZkeHQaxqh6HB7y
	uGe4ERAEidBRJq9VD1cnlAbH93em4qJO9ar2UOQHluwRnYoBEw5MiyKStA2J1DQQ/UzMVDrg5SoBv
	mBdFfQGXyOZA/R5pLh8NzymwkxyKnYeGNt3z9+wJpDhrHOBKpdFyBvDyP9FVWKVQxEia4tD6CdkJt
	9LnTeh8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua5hX-0000000DhCr-2gkB;
	Fri, 11 Jul 2025 04:49:35 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua5RO-0000000DfOh-0tu0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 04:32:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752208373;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HraXtN+VDBmg8Jr7Ws1Qqx3eC0zBZOgQnBqDsPJqBQo=;
	b=FYTYvb5y6BcECh3EyxNCsgKM102EBrjvANeCrjWHurF/0LTr4Vpt9Ze1TsczceOi6MeJkO
	dOTeVv0wK6nup3vgzW1CLej1ZcGFuopGFI81dP+F8X7OHHhDrdAuh2axDQtIfooL461rGN
	nASN+eVTIYh5+ho9e7wiI3o7Dn6dj1k=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-173-TGjdrrW_N6yKyRUk1hCqQw-1; Fri,
 11 Jul 2025 00:32:48 -0400
X-MC-Unique: TGjdrrW_N6yKyRUk1hCqQw-1
X-Mimecast-MFC-AGG-ID: TGjdrrW_N6yKyRUk1hCqQw_1752208366
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C0EDE1956089;
	Fri, 11 Jul 2025 04:32:46 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.240])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A3327180045B;
	Fri, 11 Jul 2025 04:32:43 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 10 Jul 2025 23:31:17 -0500
Subject: [PATCH 06/14] drm/panel/lg-sw43408: Use refcounted allocation in
 place of devm_kzalloc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-b4-driver-convert-last-part-july-v1-6-de73ba81b2f5@redhat.com>
References: <20250710-b4-driver-convert-last-part-july-v1-0-de73ba81b2f5@redhat.com>
In-Reply-To: <20250710-b4-driver-convert-last-part-july-v1-0-de73ba81b2f5@redhat.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752208280; l=1349;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=3QDCqPHPMjOKG75wERMG3gnVgeLbhqq0KjlFSt72mzk=;
 b=G5IhmBlpsZ1SLS/7fDAzeQOm+Jx4AdzwZi0ZTYHQdgUquUhJubClUq4p0zjV/z6ciA/jgpV4O
 TzTQb4PYQ+lDdB4YFAV33wYBG1MFDFsJCCaXOwdKVyT8glRC2Bfp7hA
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_213254_317230_3C42D868 
X-CRM114-Status: GOOD (  13.18  )
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

Move to using the new API devm_drm_panel_alloc() to allocate the
panel. In the call to the new API, avoid using explicit type and use
__typeof() for more type safety.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/panel/panel-lg-sw43408.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-lg-sw43408.c b/drivers/gpu/drm/panel/panel-lg-sw43408.c
index f3dcc39670eae866030e705a30c6cfb2594a70bb..46a56ea92ad9ff3a7e60e0ad0810f4082dbed620 100644
--- a/drivers/gpu/drm/panel/panel-lg-sw43408.c
+++ b/drivers/gpu/drm/panel/panel-lg-sw43408.c
@@ -246,8 +246,6 @@ static int sw43408_add(struct sw43408_panel *ctx)
 
 	ctx->base.prepare_prev_first = true;
 
-	drm_panel_init(&ctx->base, dev, &sw43408_funcs, DRM_MODE_CONNECTOR_DSI);
-
 	drm_panel_add(&ctx->base);
 	return ret;
 }
@@ -257,9 +255,11 @@ static int sw43408_probe(struct mipi_dsi_device *dsi)
 	struct sw43408_panel *ctx;
 	int ret;
 
-	ctx = devm_kzalloc(&dsi->dev, sizeof(*ctx), GFP_KERNEL);
-	if (!ctx)
-		return -ENOMEM;
+	ctx = devm_drm_panel_alloc(&dsi->dev, __typeof(*ctx), base,
+				   &sw43408_funcs, DRM_MODE_CONNECTOR_DSI);
+
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
 
 	dsi->mode_flags = MIPI_DSI_MODE_LPM;
 	dsi->format = MIPI_DSI_FMT_RGB888;

-- 
2.48.1


