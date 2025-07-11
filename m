Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27F62C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 04:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mfn9L63NyGnHcCssK+9XeEnkkOjmDRSCTK1Dph1u3rQ=; b=CjXOcjLH9/GVPY7tVamgslYtPK
	B5mIw2ArUFmaL6h0OeKm86y7z+XYn0yWM/aoLEM/it9y0rzy/JaqHCiwHwBICGWvucWqsCmHNJ7DX
	ogVmWO1zFQMbJ1WSXnblCRzD3EK6u0MIRbpUiY0jWDw5kdeVmnW3HwSwd5aSmXZyqcNmiklJnZIyY
	apoU5F3xgKQrEXSpD+c1f652lkQmK26KWr7byVBTes6PyLq92J0cwpxqXfmE0gBXp32aGyT8fGVFV
	rf55LjzDAALpaKytSYJnjnYI9HQWH2BOCVdIYB/uaIFebNDpgZSL71wCjJcrpk5DKN4byu+L7Zy+V
	kUBRrjeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua5oY-0000000DhhH-09IJ;
	Fri, 11 Jul 2025 04:56:50 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua5RX-0000000DfUA-3jgP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 04:33:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752208383;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mfn9L63NyGnHcCssK+9XeEnkkOjmDRSCTK1Dph1u3rQ=;
	b=cWyxeekpPnGN1zfLXh7cFMsT8U1/zlla749oOprqvfXvo/On4r9rm+E7h7yl7LH3u3WwE8
	VVyNNHMsWCKQtGiB8Cassv/GKHfGmUiVC5CIMSCmb/RQcSH/d9wWI2mQGKA2crJdpbTDUd
	eRiK3LS9X3EwdSopnudj/FNZkwihQio=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-102-DHN0yI4lMT2wculgXQo02g-1; Fri,
 11 Jul 2025 00:32:59 -0400
X-MC-Unique: DHN0yI4lMT2wculgXQo02g-1
X-Mimecast-MFC-AGG-ID: DHN0yI4lMT2wculgXQo02g_1752208377
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 32A9118002ED;
	Fri, 11 Jul 2025 04:32:57 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.240])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1F841180045B;
	Fri, 11 Jul 2025 04:32:53 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 10 Jul 2025 23:31:20 -0500
Subject: [PATCH 09/14] drm/panel/jdi-lt070me05000: Use refcounted
 allocation in place of devm_kzalloc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-b4-driver-convert-last-part-july-v1-9-de73ba81b2f5@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752208280; l=1496;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=ATz8x7koYgHgmVT1nHAx9zlNjogIDPekD0KoOrO4J1M=;
 b=InQRUyJBwdB1lNXv874qbjdyrZ9XkP3sY/uix3iwPoBIiQms7YjhEoOYkZxO8Mp6NtgvOWwc7
 g9DXi63tWKkAmBDAben3ngAA4tvqelfC41XYWET6IvpiM4sumVnnQbu
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_213304_001061_BCC75DB5 
X-CRM114-Status: GOOD (  12.15  )
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
 drivers/gpu/drm/panel/panel-jdi-lt070me05000.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c b/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
index b1ce186de2616be03fa9f94d0e0724141e9dcbac..3513e5c4dd8c6ee3c9c8836e8d150d838d8666cd 100644
--- a/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
+++ b/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
@@ -402,9 +402,6 @@ static int jdi_panel_add(struct jdi_panel *jdi)
 		return dev_err_probe(dev, PTR_ERR(jdi->backlight),
 				     "failed to register backlight %d\n", ret);
 
-	drm_panel_init(&jdi->base, &jdi->dsi->dev, &jdi_panel_funcs,
-		       DRM_MODE_CONNECTOR_DSI);
-
 	drm_panel_add(&jdi->base);
 
 	return 0;
@@ -426,9 +423,11 @@ static int jdi_panel_probe(struct mipi_dsi_device *dsi)
 	dsi->mode_flags =  MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO |
 			   MIPI_DSI_CLOCK_NON_CONTINUOUS;
 
-	jdi = devm_kzalloc(&dsi->dev, sizeof(*jdi), GFP_KERNEL);
-	if (!jdi)
-		return -ENOMEM;
+	jdi = devm_drm_panel_alloc(&dsi->dev, __typeof(*jdi), base,
+				   &jdi_panel_funcs, DRM_MODE_CONNECTOR_DSI);
+
+	if (IS_ERR(jdi))
+		return PTR_ERR(jdi);
 
 	mipi_dsi_set_drvdata(dsi, jdi);
 

-- 
2.48.1


