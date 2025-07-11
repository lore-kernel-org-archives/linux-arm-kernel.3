Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C40EDC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 04:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ASpOxMdhH1Ni6FA6cOiOM+xnxokYtM9/grNQla7mZ4=; b=FtLOTDSdQ813vvw4JsixajHIil
	YC9+0H3ietQg9HIFDByWuIEii9ZtP6+f+pzn95yuSDd7hFNLNRKla0tLUKqmz8ZpRKIZKBaRzCmJ8
	VSMFzL4aYu20cOKqOWWlEnIuaed4+ioPRe3ieeIS861yo10U909vfhQz1UAbWMxWOMV9FtMtG/cQl
	PfFjCx/H2OBANnkx3hT2PWFfV/JjkcWhCDrmJUbGmkQ2R4l+0ZCkTHMrd7nsC+z007+Dyc3xL5Tnb
	lApB3kXjAiqeJ8o1rLcrcE1rGOjaPDpOfnWTp6wdsKUGHZxGaHxkPZLYueRI2F2dqq8hpZsApwwq7
	NbZjOhIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua5qr-0000000DhsG-3m7W;
	Fri, 11 Jul 2025 04:59:13 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua5Rb-0000000DfWM-0tvK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 04:33:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752208386;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+ASpOxMdhH1Ni6FA6cOiOM+xnxokYtM9/grNQla7mZ4=;
	b=LAzLnZtcRUgLfB6enTGVDQ+jtP5mTRyJq2tNr2bDGjqKTnOf27P/9zQ+tblVEDwmdNnpHf
	TW4kaXqW47SpdzcbpkkO6RfdVOuc+h1REylpCIr/ixmQtbE5m0d/bByEc1N9k53PhybQmf
	r/Karv64UPL7mvJbqEzGdBCJG6SR3xg=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-99-0afFhi0sNVKFQBd9kZ0sUQ-1; Fri,
 11 Jul 2025 00:33:02 -0400
X-MC-Unique: 0afFhi0sNVKFQBd9kZ0sUQ-1
X-Mimecast-MFC-AGG-ID: 0afFhi0sNVKFQBd9kZ0sUQ_1752208380
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 98CF418089B4;
	Fri, 11 Jul 2025 04:33:00 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.240])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 818CE180045B;
	Fri, 11 Jul 2025 04:32:57 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 10 Jul 2025 23:31:21 -0500
Subject: [PATCH 10/14] drm/panel/lpm102a188a: Use refcounted allocation in
 place of devm_kzalloc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-b4-driver-convert-last-part-july-v1-10-de73ba81b2f5@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752208280; l=1518;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=76yWT/SXjPcOqdfDoug/udmadP1Sboehs0wZbeLGz0I=;
 b=CQH52r9at6hFa1Ymf8GJHoUDHfBxW7YTCZJGYAmSh6pqT6Q+ZQB3zYIxMmVhn63/Z8u5Zik6u
 XP2rofWeeouCEuvIMkofaRsIK4J8YECn/v8jJIHDz+9k8N2ynZA3brP
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_213307_317996_8B5A5E33 
X-CRM114-Status: GOOD (  13.33  )
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
 drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c b/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
index 5b5082efb282bcf705cf2d38dea24901e9803648..5f897e143758c2be51c39a20eeda2ecd09e1fbee 100644
--- a/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
+++ b/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
@@ -435,9 +435,6 @@ static int jdi_panel_add(struct jdi_panel *jdi)
 		return dev_err_probe(dev, PTR_ERR(jdi->backlight),
 				     "failed to create backlight\n");
 
-	drm_panel_init(&jdi->base, &jdi->link1->dev, &jdi_panel_funcs,
-		       DRM_MODE_CONNECTOR_DSI);
-
 	drm_panel_add(&jdi->base);
 
 	return 0;
@@ -475,10 +472,13 @@ static int jdi_panel_dsi_probe(struct mipi_dsi_device *dsi)
 
 	/* register a panel for only the DSI-LINK1 interface */
 	if (secondary) {
-		jdi = devm_kzalloc(&dsi->dev, sizeof(*jdi), GFP_KERNEL);
-		if (!jdi) {
+		jdi = devm_drm_panel_alloc(&dsi->dev, __typeof(*jdi),
+					   base, &jdi_panel_funcs,
+					   DRM_MODE_CONNECTOR_DSI);
+
+		if (IS_ERR(jdi)) {
 			put_device(&secondary->dev);
-			return -ENOMEM;
+			return PTR_ERR(jdi);
 		}
 
 		mipi_dsi_set_drvdata(dsi, jdi);

-- 
2.48.1


