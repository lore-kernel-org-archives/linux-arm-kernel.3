Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4414DC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 04:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GvROWprvZVObxVu7yfL80nRieDhkDbGSMls4JOe4MeA=; b=Yy9j3Y4bqIIe9znO8EVqnmHzKv
	IwCHK8paC2e608CGXRCfxOwL9/yedGeJ6PgN7OyAdW9cV1RK1wDF05laCIzEuhhcwx+5eCMRhcQ5Z
	t0CtsLh0DTYy3T9SwDn5iVs6/gAFFdwNJqcPW13cJkc9EG5OFcv8LPgCqrbOK6JXE3SmSbjipFkUC
	LbzsOAOmM+hYMZjLuD0EiZ7VncZq2wOgVflDcnW0kUOoK6rfwLLuxCqqUdaEI6c/MdFrTQ+tzu1Us
	PVMhD8mzGPQ5Qq0QvVgIg9rMXFq1XPqw2+1XNjGcJqc6l2MlDLLpzP2lKDEsFBrDI/sjnB02q4hpi
	EdL2kjnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua5jq-0000000DhJC-1YEB;
	Fri, 11 Jul 2025 04:51:58 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua5RQ-0000000DfQP-2gEc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 04:32:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752208375;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GvROWprvZVObxVu7yfL80nRieDhkDbGSMls4JOe4MeA=;
	b=e382phAtzxJWWFAPR9DpjtH9wywr4CEcqoD53vkzT2Xgtd7wjBmCNlLdRrfXu+xlZEEozp
	VB+h3C6HBuFBpWjh3WlyVfdzQoTiEdXwAgYuJy7kkXgqAO8jHAjZeMJ5PF9z6ZPIGpLDyV
	kXgAcbLIv1H7zw0EBIG/snonj0zoZos=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-121-tz-HPw1oNZu7DDbA8AWMvA-1; Fri,
 11 Jul 2025 00:32:52 -0400
X-MC-Unique: tz-HPw1oNZu7DDbA8AWMvA-1
X-Mimecast-MFC-AGG-ID: tz-HPw1oNZu7DDbA8AWMvA_1752208370
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 336E619560A2;
	Fri, 11 Jul 2025 04:32:50 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.240])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1B8C3180045B;
	Fri, 11 Jul 2025 04:32:46 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 10 Jul 2025 23:31:18 -0500
Subject: [PATCH 07/14] drm/panel/kd097d04: Use refcounted allocation in
 place of devm_kzalloc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-b4-driver-convert-last-part-july-v1-7-de73ba81b2f5@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752208280; l=1638;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=x9jjKpQmSTs4YmDmtzZOKXceb+X207TGO3xWPLWt/E4=;
 b=nCwchFKw19gEAI9laVB4vJcXAZ1fnbeo5uSxXlTF0jFmOCMdEsCjb98o6tf8Y6hXM7tsQgYfD
 bZxHP/EnZ7jDHxOU/PX9v8LIiPHtCBEVIqIr7W7p/OsaWx8WC5hgmW6
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_213256_754567_2F593A2E 
X-CRM114-Status: GOOD (  13.15  )
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
 drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c b/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c
index d6b912277196ee68a7ca57bfefb327dee11596fa..2fc7b0779b37b28c7ed2fba6b28459c8a9d27e70 100644
--- a/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c
+++ b/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c
@@ -337,9 +337,6 @@ static int kingdisplay_panel_add(struct kingdisplay_panel *kingdisplay)
 		kingdisplay->enable_gpio = NULL;
 	}
 
-	drm_panel_init(&kingdisplay->base, &kingdisplay->link->dev,
-		       &kingdisplay_panel_funcs, DRM_MODE_CONNECTOR_DSI);
-
 	err = drm_panel_of_backlight(&kingdisplay->base);
 	if (err)
 		return err;
@@ -364,9 +361,12 @@ static int kingdisplay_panel_probe(struct mipi_dsi_device *dsi)
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
 			  MIPI_DSI_MODE_LPM;
 
-	kingdisplay = devm_kzalloc(&dsi->dev, sizeof(*kingdisplay), GFP_KERNEL);
-	if (!kingdisplay)
-		return -ENOMEM;
+	kingdisplay = devm_drm_panel_alloc(&dsi->dev, __typeof(*kingdisplay), base,
+					   &kingdisplay_panel_funcs,
+					   DRM_MODE_CONNECTOR_DSI);
+
+	if (IS_ERR(kingdisplay))
+		return PTR_ERR(kingdisplay);
 
 	mipi_dsi_set_drvdata(dsi, kingdisplay);
 	kingdisplay->link = dsi;

-- 
2.48.1


