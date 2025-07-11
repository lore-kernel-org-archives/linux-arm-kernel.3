Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC1C1C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 05:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XK5bdt887duIlbvqWjutT9zbGbRguv0UFPjU/94wLiI=; b=xhsaTB4Ehu0l5cPpT5b/usDfk6
	X2Y2HmJfBPZRAixpiPyxjc5eJyjRCUWgvO2F3BdPybJFQbZnSSXTEE/lbbepDWeI2SrAOnF0595gj
	DGsFgdJbIwJbXEmx/y7XWsWJ0E2i51shFaIh0qAg3YkvUAZIHhkxVSeG5Wsz2Na0YrXedd+9gJz0R
	wuLKmkmTNPkM9bwAg5pa2oKnUGZrD8/VUvsjVpvp3+rUq9by8eMcpL/Ajvv5Mx2KRSNMIZkZ/8DS8
	uutI/k8q0e+TAqASfTiLJsVnO4E6Uv4wh52YZFFHBTrO3WZidGvTRXHFgwgtb8nmKdxbLFgu6Jwuz
	zKvOFewQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua5tA-0000000Di11-2YrQ;
	Fri, 11 Jul 2025 05:01:36 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua5Ri-0000000DfZe-1wA0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 04:33:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752208393;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XK5bdt887duIlbvqWjutT9zbGbRguv0UFPjU/94wLiI=;
	b=XrI2sa5oI8XzQNHkMOn6SgxMWjhhpNKXOFfY95hMJsnHjsVX2og4BnL0+5l3l0zyaOBHYz
	pmokEBlBsXNdaqlxqg+diAWWAyG86ONBTapVPsBVfSlY8QJ8u6UXPUwrLJw0pLtsLYEnJM
	aQsyEwEu/HNFz4Kg/ExL0pTWlTTf7oE=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-479-OfZ38x9TNE-qZrPbdjthjA-1; Fri,
 11 Jul 2025 00:33:10 -0400
X-MC-Unique: OfZ38x9TNE-qZrPbdjthjA-1
X-Mimecast-MFC-AGG-ID: OfZ38x9TNE-qZrPbdjthjA_1752208388
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DDC6F180028A;
	Fri, 11 Jul 2025 04:33:07 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.240])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B8DE51803AF2;
	Fri, 11 Jul 2025 04:33:04 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 10 Jul 2025 23:31:23 -0500
Subject: [PATCH 12/14] drm/panel/himax-hx83102: Use refcounted allocation
 in place of devm_kzalloc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-b4-driver-convert-last-part-july-v1-12-de73ba81b2f5@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752208280; l=1488;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=+qytONX5qdNYsbSY96SUao7oslIs6VJcUi2ae56BVbA=;
 b=YzQp+0zPuATiOdY8n/ZqoUHfDmb0JE/RqAmDPPQNILpZaEZj/Dv+suOONBpeYpzY2RXLcHdhu
 fdHTZ746oDVAwLcEEBTA0/6hvAaqhL1ess1aqqdsI8ow1gLqPAnnYGA
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_213314_581421_69239CB2 
X-CRM114-Status: GOOD (  13.76  )
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
 drivers/gpu/drm/panel/panel-himax-hx83102.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-himax-hx83102.c b/drivers/gpu/drm/panel/panel-himax-hx83102.c
index 66abfc44e424829e295f5848153d548176b9dda9..4c432d207634d2d976a9e7cb7744b1fefa10420d 100644
--- a/drivers/gpu/drm/panel/panel-himax-hx83102.c
+++ b/drivers/gpu/drm/panel/panel-himax-hx83102.c
@@ -989,8 +989,6 @@ static int hx83102_panel_add(struct hx83102 *ctx)
 
 	ctx->base.prepare_prev_first = true;
 
-	drm_panel_init(&ctx->base, dev, &hx83102_drm_funcs,
-		       DRM_MODE_CONNECTOR_DSI);
 	err = of_drm_get_panel_orientation(dev->of_node, &ctx->orientation);
 	if (err < 0)
 		return dev_err_probe(dev, err, "failed to get orientation\n");
@@ -1013,9 +1011,11 @@ static int hx83102_probe(struct mipi_dsi_device *dsi)
 	int ret;
 	const struct hx83102_panel_desc *desc;
 
-	ctx = devm_kzalloc(&dsi->dev, sizeof(*ctx), GFP_KERNEL);
-	if (!ctx)
-		return -ENOMEM;
+	ctx = devm_drm_panel_alloc(&dsi->dev, __typeof(*ctx), base,
+				   &hx83102_drm_funcs, DRM_MODE_CONNECTOR_DSI);
+
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
 
 	desc = of_device_get_match_data(&dsi->dev);
 	dsi->lanes = 4;

-- 
2.48.1


