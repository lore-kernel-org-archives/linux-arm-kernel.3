Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C05D5C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 04:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/GVtp9qqFjx2/BwC2OA4RCl93BnNwMZ4NEmrKbv4PXE=; b=yYDuyPRO2/A55sMIxMQUB987e5
	dedcYU2amKlvNOh+i0XKTCyd7ipcLIPrjZaGFca3va3Ac3rwTTl1//7H6d5p2+5HvC3sartdYwmwg
	7pI5vTiG8++FT3DxV2p24GK/nmd8wOT3MP5O7oRVSFfb/cagnJ2WuFO9nRTm4Hd7iOQ0kEqX4e4w3
	78eP10yWn4NasNC4AiJbrJvjAuPp9zCiTe02mw7VYVaIpx2ACAihqwXfSkHk2EUMm85cqmAIHm5mH
	oWNVEPOT8Ci2RiIbjfLdH2xibVOSBUHTWbD07v7v2sUtNsSfYmyESXFSqLDFnNSLt/eaMLEEo+hWi
	XzB+vLLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua5Vl-0000000DgGe-1rCx;
	Fri, 11 Jul 2025 04:37:25 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua5R6-0000000DfEw-0ReR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 04:32:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752208355;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/GVtp9qqFjx2/BwC2OA4RCl93BnNwMZ4NEmrKbv4PXE=;
	b=NFk10IaSYNlnVmRSHFC82GH5Kb1ACQag72WYX2aMe1QWuW3v0TaMmWrOGvnseJ/9oz8hAm
	KfRGMQ021I4W6xU5RqR5fQNi8U/yX+xbJ2oxbCj/PeASNfNotTd+ayFocmOuHDRkf9/xjq
	oSwCPJVvZR1gFIVuskPrsreiAzDnGM0=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-595-IBibMAwsNkqOSTUKh4InfQ-1; Fri,
 11 Jul 2025 00:32:31 -0400
X-MC-Unique: IBibMAwsNkqOSTUKh4InfQ-1
X-Mimecast-MFC-AGG-ID: IBibMAwsNkqOSTUKh4InfQ_1752208349
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A2B1619560B2;
	Fri, 11 Jul 2025 04:32:28 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.240])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8332D1803AF2;
	Fri, 11 Jul 2025 04:32:24 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 10 Jul 2025 23:31:12 -0500
Subject: [PATCH 01/14] drm/panel/lq101r1sx01: Use refcounted allocation in
 place of devm_kzalloc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-b4-driver-convert-last-part-july-v1-1-de73ba81b2f5@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752208280; l=1551;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=XwHrhha4r8E5H3/YHzr2brJv4FW0X5k7UgxfvfR1BOo=;
 b=a/pFvCxmyNn0BtJAg1K8boxZ9yka4eSHSaPt+BW6l+vMcCWSa0dJP0ICVeIKhXlGl/uNbqufJ
 3kx4yUQ9QaIA4gkN3iTK8IW6CvU9NMuvkZ+l9RijD8/0lJ56QMbtayf
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_213236_222512_6A63D88D 
X-CRM114-Status: GOOD (  13.71  )
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
 drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c b/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c
index a0d76d588da1a276c5875ad291195d01a0c0495c..d159b0e4fdb6bfb00beb60de660db59ed2c9c566 100644
--- a/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c
+++ b/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c
@@ -279,9 +279,6 @@ static int sharp_panel_add(struct sharp_panel *sharp)
 	if (IS_ERR(sharp->supply))
 		return PTR_ERR(sharp->supply);
 
-	drm_panel_init(&sharp->base, &sharp->link1->dev, &sharp_panel_funcs,
-		       DRM_MODE_CONNECTOR_DSI);
-
 	ret = drm_panel_of_backlight(&sharp->base);
 	if (ret)
 		return ret;
@@ -323,10 +320,12 @@ static int sharp_panel_probe(struct mipi_dsi_device *dsi)
 
 	/* register a panel for only the DSI-LINK1 interface */
 	if (secondary) {
-		sharp = devm_kzalloc(&dsi->dev, sizeof(*sharp), GFP_KERNEL);
-		if (!sharp) {
+		sharp = devm_drm_panel_alloc(&dsi->dev, __typeof(*sharp), base,
+					     &sharp_panel_funcs,
+					     DRM_MODE_CONNECTOR_DSI);
+		if (IS_ERR(sharp)) {
 			put_device(&secondary->dev);
-			return -ENOMEM;
+			return PTR_ERR(sharp);
 		}
 
 		mipi_dsi_set_drvdata(dsi, sharp);

-- 
2.48.1


