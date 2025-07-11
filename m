Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BC17C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 05:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GWTeR8/c8og1zZivLTfFMs4guLGelLhrLnAKtFs0Ahg=; b=m2GBiq+nU5tz0WvWRthP+gQ5FP
	muSrabWnfXbTy5BpzdUrzid0xPlikQzBAGazkiztz26LRlSVlqG091vtoY97LnyBFBYNnlW2Ie0Aw
	V0/dXrauP1aGJPaxEM30e/en2wDY/sfnyOLfgzpDcZo2lR840qDUGyLHXGxxu9/ImA2XGGqSYG9ra
	VCLyC0CAOAzyep2ZBc6ncmsnPHjqyHVUwFMaQsRDBLwJwW7Wjw4Ln7z1L91yiMm7cVbVzFPRT1p+A
	AjLA8owXRmwCh2fyoshC+QuS1msz/XEj6QgOVC62xtbmwiYqeLL2sp0Ppes1MESUGDlKYi7tbhcVz
	1Hgl5+rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua5xz-0000000Dic8-0TA9;
	Fri, 11 Jul 2025 05:06:35 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua5Rl-0000000DfbQ-2PuB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 04:33:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752208396;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GWTeR8/c8og1zZivLTfFMs4guLGelLhrLnAKtFs0Ahg=;
	b=FxQQvICOFDeIdjvJW38ca443Fb3k8yhbqbFa3kqqcPqKcYjcQ4TbPxwLErYBtso3hEV8GS
	4GDrdOYxbONqFoTO1X9dVYPt/qYiXeVNmft72pOg6EK3etfWBo/lLXHz4l0X/LxARTYxLk
	3tcWkCML/UGtNV8Hk6hdLPkw0Igg2vs=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-47-Zgph_v_qP0OODgSQpsK7Tg-1; Fri,
 11 Jul 2025 00:33:13 -0400
X-MC-Unique: Zgph_v_qP0OODgSQpsK7Tg-1
X-Mimecast-MFC-AGG-ID: Zgph_v_qP0OODgSQpsK7Tg_1752208391
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6067718002ED;
	Fri, 11 Jul 2025 04:33:11 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.240])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 37E5A18002B5;
	Fri, 11 Jul 2025 04:33:08 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 10 Jul 2025 23:31:24 -0500
Subject: [PATCH 13/14] drm/panel/boe-tv101wum-nl6: Use refcounted
 allocation in place of devm_kzalloc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-b4-driver-convert-last-part-july-v1-13-de73ba81b2f5@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752208280; l=1515;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=a6ZNYWyy1tj4pWbYzR6Lh3OvSPa78NsH3QPr0ODN52k=;
 b=aaLAXmAYTYPXIf6rYqGtaHTBQU8AWJBRxjzPVIQsvNsueaKycU2N4n5l1Cs7Y0P0ac3dxJC98
 f6YN3atFk7aAuH3Dgxrwe3L15e1LmPkaaiFkiqOqchKro9jSrraiN9c
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_213317_689526_B975C6FA 
X-CRM114-Status: GOOD (  14.03  )
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
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
index 3e5b0d8636d087596aeb3ef0a9feef14157942ca..d5fe105bdbdde5147c5392945928148ebfdf53b5 100644
--- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
+++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
@@ -1720,8 +1720,6 @@ static int boe_panel_add(struct boe_panel *boe)
 
 	boe->base.prepare_prev_first = true;
 
-	drm_panel_init(&boe->base, dev, &boe_panel_funcs,
-		       DRM_MODE_CONNECTOR_DSI);
 	err = of_drm_get_panel_orientation(dev->of_node, &boe->orientation);
 	if (err < 0) {
 		dev_err(dev, "%pOF: failed to get orientation %d\n", dev->of_node, err);
@@ -1746,9 +1744,11 @@ static int boe_panel_probe(struct mipi_dsi_device *dsi)
 	int ret;
 	const struct panel_desc *desc;
 
-	boe = devm_kzalloc(&dsi->dev, sizeof(*boe), GFP_KERNEL);
-	if (!boe)
-		return -ENOMEM;
+	boe = devm_drm_panel_alloc(&dsi->dev, __typeof(*boe), base,
+				   &boe_panel_funcs, DRM_MODE_CONNECTOR_DSI);
+
+	if (IS_ERR(boe))
+		return PTR_ERR(boe);
 
 	desc = of_device_get_match_data(&dsi->dev);
 	dsi->lanes = desc->lanes;

-- 
2.48.1


