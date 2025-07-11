Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DAA9C83F21
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 04:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HXNaF4+BMp3g0HFKFrTE4oB1c46APaPxKbvDXy92b/k=; b=SaMoqh2uH138txxVPgyiBYP8ac
	9sCkJ16K8pGZgWo87/2C2sQ1U96/32KPBm3+18Hdo0wEySeyy++qf5LDUH6a9LXpHAtDKNC7StVTD
	z3lMAQBo70a2obFBmuYHjM84eGCaWTyiq9AxM0IL+LpyKsCyyzqgyLaqhgk16p/ehCL/qtiSpwu2+
	dky2TnnC0+sK3ZP97FNV/K9XN2V4Auup9ilszMNNTwGBgnF1/h1q+HV8eu1H0vlFqzrFZjSlnmVjP
	trECnz0UplZ8cl0CNrwFLRgY7X4wH/IjybR9KlvZT9R1r0x9YkXEXrT6+YCVewSko0iw/d1EsiS2i
	6TIk5gcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua5co-0000000Dgx7-0r1h;
	Fri, 11 Jul 2025 04:44:42 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua5RJ-0000000DfKt-1cIC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 04:32:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752208368;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HXNaF4+BMp3g0HFKFrTE4oB1c46APaPxKbvDXy92b/k=;
	b=AvXaM3SW5yZfuw7KwLsNssw7oXe14f+MLRzSyHKp0bnKR/yWjdDnKHfaW0Ld1EilTwsOkQ
	LdEFf4yJmL9f9RvrnoW4bIfor9FPCqGY2y8rys4VEX+fLhgNzcePGj050X+JBhmfhqZpJn
	4ZLK47FE0mmLcPH0ojL7uKu4WOHPi+M=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-605-jNmcXOdCNni-UY5LOX2_xA-1; Fri,
 11 Jul 2025 00:32:42 -0400
X-MC-Unique: jNmcXOdCNni-UY5LOX2_xA-1
X-Mimecast-MFC-AGG-ID: jNmcXOdCNni-UY5LOX2_xA_1752208360
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C298519560B4;
	Fri, 11 Jul 2025 04:32:39 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.240])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9C92118002B5;
	Fri, 11 Jul 2025 04:32:36 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 10 Jul 2025 23:31:15 -0500
Subject: [PATCH 04/14] drm/panel/osd101t2587-53ts: Use refcounted
 allocation in place of devm_kzalloc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-b4-driver-convert-last-part-july-v1-4-de73ba81b2f5@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752208280; l=1626;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=7kUwIkJl86pFYYQVdqTbPPyQkYWl3J1ABcWmZEpiDVc=;
 b=cXGLwVnCtsgtvTXjCBJ0QkJD60xl6QTAK8U0DdwiD/7ZMWenI70x57yDpOiB/eBQwYTVBuvZx
 8d5wOFYb+HxAHA1Rpm+xa+HKgasQ81yjR0aNvODXkmsKHyIuVFi2A0j
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_213249_494539_87B66783 
X-CRM114-Status: GOOD (  12.82  )
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
 drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c b/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c
index dbea84f515142dbf77236552643bb0e4546d0ca8..2334b77f348ce61e98b74f7b26d4021be412c376 100644
--- a/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c
+++ b/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c
@@ -132,9 +132,6 @@ static int osd101t2587_panel_add(struct osd101t2587_panel *osd101t2587)
 	if (IS_ERR(osd101t2587->supply))
 		return PTR_ERR(osd101t2587->supply);
 
-	drm_panel_init(&osd101t2587->base, &osd101t2587->dsi->dev,
-		       &osd101t2587_panel_funcs, DRM_MODE_CONNECTOR_DSI);
-
 	ret = drm_panel_of_backlight(&osd101t2587->base);
 	if (ret)
 		return ret;
@@ -161,9 +158,12 @@ static int osd101t2587_panel_probe(struct mipi_dsi_device *dsi)
 			  MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
 			  MIPI_DSI_MODE_NO_EOT_PACKET;
 
-	osd101t2587 = devm_kzalloc(&dsi->dev, sizeof(*osd101t2587), GFP_KERNEL);
-	if (!osd101t2587)
-		return -ENOMEM;
+	osd101t2587 = devm_drm_panel_alloc(&dsi->dev, __typeof(*osd101t2587), base,
+					   &osd101t2587_panel_funcs,
+					   DRM_MODE_CONNECTOR_DSI);
+
+	if (IS_ERR(osd101t2587))
+		return PTR_ERR(osd101t2587);
 
 	mipi_dsi_set_drvdata(dsi, osd101t2587);
 

-- 
2.48.1


