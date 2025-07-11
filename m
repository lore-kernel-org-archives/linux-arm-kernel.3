Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9003AC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 04:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lOIEjR3bn17PTtc+an4LNIrGgCXywU+z8GNsvCzSuMs=; b=bpPTW0keMwX53vcrj95ZEzxriI
	89aD16nL4Bm3udIfyMuexOwqla2OB7cJ5p5AjGCt2bGe+hlSdxmCYn2cfN4JDyOhcSqzCjy793BBZ
	AXeyBUryi5Ae6kTLvV70XeGzg6pFU9Nl3/ByC1SoUyZBGD6qlaY7gy4iAVrm1+t9IpItaHI1699kA
	alUE430fYSHRpQGzuXRNiQOjSwfDtUrhX7XI895jswgJDeuU3JbInfUSd5T11wwJnxzgMjXq9QKvS
	WdniNr+gDNAXaiEnn+CrK8BuMo5mi3NagmKdT8fgCJ0wE9YwpwwUUR4oRKeiTbkKmnirTAugFH1hd
	i/UAb0EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua5fB-0000000Dh5W-1k69;
	Fri, 11 Jul 2025 04:47:09 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua5RK-0000000DfLO-1mCQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 04:32:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752208369;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lOIEjR3bn17PTtc+an4LNIrGgCXywU+z8GNsvCzSuMs=;
	b=Oau/LauK1lOBTifIQ1oRuVBGXtMLiN9VRhihQddb/rZkKEcQub1M9HqUCcl/oPf4nIslqy
	zqFNIv5XCFIkc0MuSs1IiCIZfjosSCoNy7jyxAXtr7S4DD0nZ+8ZWOmAoMMfPVZqTHvrIL
	tfRgmEB8U6iqQyLryUP3A04DuLXhXWQ=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-675-EPUs1CxiPPedMmgjRQibxg-1; Fri,
 11 Jul 2025 00:32:45 -0400
X-MC-Unique: EPUs1CxiPPedMmgjRQibxg-1
X-Mimecast-MFC-AGG-ID: EPUs1CxiPPedMmgjRQibxg_1752208363
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 56673195608E;
	Fri, 11 Jul 2025 04:32:43 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.240])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1A90E1803AF2;
	Fri, 11 Jul 2025 04:32:39 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 10 Jul 2025 23:31:16 -0500
Subject: [PATCH 05/14] drm/panel/novatek-nt36672a: Use refcounted
 allocation in place of devm_kzalloc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-b4-driver-convert-last-part-july-v1-5-de73ba81b2f5@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752208280; l=1571;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=2BGDkKDqlgKagbBkMVRSH6g/ko/Kvb354Xho7jH6dCY=;
 b=PiWqcXRhVy2sOtQMis5OvIsnIPb2clZQvZH1vG1g/ch8MSKbu1gK23jiLZMjjl6MUmWIFHXUr
 Ih9SdH9yHuCAxHpED0sX1jkoohtNIxlpDVkMmTWrm0PyxH5P7XJSS1x
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_213250_547262_E98BFC13 
X-CRM114-Status: GOOD (  13.53  )
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
 drivers/gpu/drm/panel/panel-novatek-nt36672a.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c b/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
index c2abd20e0734bd1e94fa3692e41d442170ab24c3..29e1f6aea48060384f4639999174b67097a6c8a7 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
@@ -608,8 +608,6 @@ static int nt36672a_panel_add(struct nt36672a_panel *pinfo)
 		return dev_err_probe(dev, PTR_ERR(pinfo->reset_gpio),
 				     "failed to get reset gpio from DT\n");
 
-	drm_panel_init(&pinfo->base, dev, &panel_funcs, DRM_MODE_CONNECTOR_DSI);
-
 	ret = drm_panel_of_backlight(&pinfo->base);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to get backlight\n");
@@ -625,9 +623,11 @@ static int nt36672a_panel_probe(struct mipi_dsi_device *dsi)
 	const struct nt36672a_panel_desc *desc;
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


