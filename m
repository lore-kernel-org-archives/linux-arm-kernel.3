Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4B3AC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 05:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v5NQY7SJ4LLppWBDJBpdzLvXvWEVdpffYWehFNWdW2o=; b=jJ72yYPmAeGHwpkT7G7EQef8DJ
	c9zXYaKi9Fb/2iMmdV+tlTZsPO1FbO07G36zyfMx1g3Pd8OO5rcrR0P0CwD57MEUKrUIsfJrkD2lP
	j45gCVyjPoHrRnIftUtZ60P5w8oXA76CllfZA7bkPNV3AgYpuE5jGl1lkYyYfH/z/6h/pINPyX1cD
	6KHoxnmTr4XImSg2aRztBaPWjgsDWMOa02fiM4j5ZG09y2X+M82UgSRfOaOH8LwI5bwNZ4Es6xgCT
	0cqHthMJ2RjSojkQbWXMf+VyvzGmVsitzTsLguhfowJOAAaZ9isjCBQgngZGaqtL3JBTD7m5EwjJu
	SSiW0jhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua60M-0000000Dith-07fC;
	Fri, 11 Jul 2025 05:09:02 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua5Rp-0000000DfeH-0FrF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 04:33:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752208400;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v5NQY7SJ4LLppWBDJBpdzLvXvWEVdpffYWehFNWdW2o=;
	b=SVtHU0LRhNeZD31nglhH0kZbKZSPjeHlVnWw1SMf2hY4o7CwU9hki34XsR6ocTQREJ8ugQ
	I94rj+fKKXycHbnFYojA941bNg6dtPHnboaOHVvvICpnK1e/em8nN9SBoBvlrCnzy24sa2
	8g8Qhs5CQkOlqF6noS8hj6/SfJg+VlM=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-270-ZqAmy-P-Nxe49eipFG5q7Q-1; Fri,
 11 Jul 2025 00:33:16 -0400
X-MC-Unique: ZqAmy-P-Nxe49eipFG5q7Q-1
X-Mimecast-MFC-AGG-ID: ZqAmy-P-Nxe49eipFG5q7Q_1752208394
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A1C4A19560AD;
	Fri, 11 Jul 2025 04:33:14 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.240])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9090018046C6;
	Fri, 11 Jul 2025 04:33:11 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 10 Jul 2025 23:31:25 -0500
Subject: [PATCH 14/14] drm/panel/boe-himax8279d: Use refcounted allocation
 in place of devm_kzalloc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-b4-driver-convert-last-part-july-v1-14-de73ba81b2f5@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752208280; l=1431;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=pasqR+ymXP+Ee0FMYpSDIKGKmE5tAtwA2XZu07wcBdw=;
 b=u+ndzt2KL06RSFFMDzl6bT+IEYcNTgF84vu96MNw+nOmxxJr1GlYVtAQLfs8CGyXu1Ckjz/WX
 uBxj0txISPOBBDcU5PPuuWd/bJfGl252+cOYgZIY6NOFoelCBDPZ5HA
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_213321_166445_CBDC6214 
X-CRM114-Status: GOOD (  12.51  )
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
 drivers/gpu/drm/panel/panel-boe-himax8279d.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-boe-himax8279d.c b/drivers/gpu/drm/panel/panel-boe-himax8279d.c
index df746baae301cf70d9fa940b36aae2712e73b3e3..4a8560b4b899a4da3b307dcb43682303d0543813 100644
--- a/drivers/gpu/drm/panel/panel-boe-himax8279d.c
+++ b/drivers/gpu/drm/panel/panel-boe-himax8279d.c
@@ -847,9 +847,6 @@ static int panel_add(struct panel_info *pinfo)
 						 "failed to get enable gpio\n");
 	}
 
-	drm_panel_init(&pinfo->base, dev, &panel_funcs,
-		       DRM_MODE_CONNECTOR_DSI);
-
 	ret = drm_panel_of_backlight(&pinfo->base);
 	if (ret)
 		return ret;
@@ -865,9 +862,11 @@ static int panel_probe(struct mipi_dsi_device *dsi)
 	const struct panel_desc *desc;
 	int err;
 
-	pinfo = devm_kzalloc(&dsi->dev, sizeof(*pinfo), GFP_KERNEL);
-	if (!pinfo)
-		return -ENOMEM;
+	pinfo = devm_drm_panel_alloc(&dsi->dev, __typeof(*pinfo), base,
+				     &panel_funcs, DRM_MODE_CONNECTOR_DSI);
+
+	if (IS_ERR(pinfo))
+		return PTR_ERR(pinfo);
 
 	desc = of_device_get_match_data(&dsi->dev);
 	dsi->mode_flags = desc->mode_flags;

-- 
2.48.1


