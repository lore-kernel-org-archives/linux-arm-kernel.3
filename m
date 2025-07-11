Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCF97C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 04:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ybj92p3FeYPb6PC8GulJyPRWsViFfANiGwTVSp0VdX4=; b=wdsOCrelD1DTvDSEmPn9iLa0e9
	+rnhVksBO8SIHZF5RptODPuO5zNMKiGopSAjN3aPOoB0IuBIv3SsrYOpX/wF807tcG0OhI9vsNUqz
	FttT1BdKdwNGgbmuxrbTO8sN14e9En2t8+wQkTxvOv4zlxBvqzWJxzpLJJdKvsrMnkPOgF3qHkVs9
	lQS9p0QR60DOjkvx32uBQmV2vMCHfg0MvKy8o7LhQDx46NBi7IpGtk76honX8oELtCBTvcsamPcPb
	+4oprijKjHPLhhHAdtSdbrGZUH+n99YzEfqECxz4MIt60q1VgEkthHZ+r7gllE06CEZR9XejFwAX3
	KAf0+xLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua5aV-0000000DgiJ-08M1;
	Fri, 11 Jul 2025 04:42:19 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua5RF-0000000DfJ0-01YH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 04:32:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752208363;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ybj92p3FeYPb6PC8GulJyPRWsViFfANiGwTVSp0VdX4=;
	b=ZS2aiDE/GPknK296iAkrT9feXQ9Iie2vGAx1aSgaUTZ5C5lUTyUjoouMgl+17CSunx9KKz
	1bkM5/l51VWi8D1wdZH+onQ0Me8o3riCiVwGYC5fpUcLRwL4Zu/99clRXQ9HrzTS9Do4J8
	71eq5Iop91+7V629/ncqZdPMPka1+RI=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-247-ePPTMWUmNaefCetTzTFRZg-1; Fri,
 11 Jul 2025 00:32:39 -0400
X-MC-Unique: ePPTMWUmNaefCetTzTFRZg-1
X-Mimecast-MFC-AGG-ID: ePPTMWUmNaefCetTzTFRZg_1752208357
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 86CE9180028C;
	Fri, 11 Jul 2025 04:32:36 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.240])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4A77C180045B;
	Fri, 11 Jul 2025 04:32:32 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 10 Jul 2025 23:31:14 -0500
Subject: [PATCH 03/14] drm/panel/vvx10f034n00: Use refcounted allocation in
 place of devm_kzalloc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-b4-driver-convert-last-part-july-v1-3-de73ba81b2f5@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752208280; l=1558;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=SUV4f8dNf/xYjMAHj2f0Rzw90WK1gwUaB8kV6C9fYoo=;
 b=cveZnxEVTl9fD4dgn3VYxY0c24BJ4C5Zv1DaSA2DSWTnJdyulmh5nQQcL4X2ztZfU4Dbkh4VU
 hYmQq7h238LDZP7OaMgBa5Y8pj38WtFJIDLZuFcdnnAgGDCX01p0ST2
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_213245_120717_712EADDF 
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
 drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c b/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c
index d1c5c9bc3c56a6fe12096ca7b08e34e490699207..3c3308fc55df08a24d62fadbef00080667ea3902 100644
--- a/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c
+++ b/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c
@@ -166,9 +166,6 @@ static int wuxga_nt_panel_add(struct wuxga_nt_panel *wuxga_nt)
 	if (IS_ERR(wuxga_nt->supply))
 		return PTR_ERR(wuxga_nt->supply);
 
-	drm_panel_init(&wuxga_nt->base, &wuxga_nt->dsi->dev,
-		       &wuxga_nt_panel_funcs, DRM_MODE_CONNECTOR_DSI);
-
 	ret = drm_panel_of_backlight(&wuxga_nt->base);
 	if (ret)
 		return ret;
@@ -196,9 +193,12 @@ static int wuxga_nt_panel_probe(struct mipi_dsi_device *dsi)
 			MIPI_DSI_CLOCK_NON_CONTINUOUS |
 			MIPI_DSI_MODE_LPM;
 
-	wuxga_nt = devm_kzalloc(&dsi->dev, sizeof(*wuxga_nt), GFP_KERNEL);
-	if (!wuxga_nt)
-		return -ENOMEM;
+	wuxga_nt = devm_drm_panel_alloc(&dsi->dev, __typeof(*wuxga_nt), base,
+					&wuxga_nt_panel_funcs,
+					DRM_MODE_CONNECTOR_DSI);
+
+	if (IS_ERR(wuxga_nt))
+		return PTR_ERR(wuxga_nt);
 
 	mipi_dsi_set_drvdata(dsi, wuxga_nt);
 

-- 
2.48.1


