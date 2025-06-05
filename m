Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18425C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 03:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZXHAO2+jY1bXsxo50PiVK4q6TUh1IfN7fKlHU0JYCOM=; b=0N4INJUrc9a4xYCuxBnbpBRUHV
	ZVOt5IYqWzsuE9Mh81U1uoiX/WlDx6Hi4Rs2VgKeW3AT4U3dyof3vycRyYYPxFmoOYWDmhggVACLv
	EDnu9iHkhXCFfJHoXtGgayB7ktAGkinBzh0ZAbUzSDji7YbzHgEtVyoH/jEoKJHz7jNot2ysc6rAD
	TvJ8Q0Nlt1dN0hyYDt5z6G0i2yGa0YCdZnqE+2lZDv44iiioQDCb6M4WkBqw6Sr0n3DIfJdfbuw5a
	pIxOkp99ct6sXkF2g0AvO1CyT0J94WsjTdQL9nWAyKuVmNRVoUY5SGlKtc0QLGmlDXpuG1sqz6rOx
	ld2tmRcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN1dJ-0000000EfJC-0PcC;
	Thu, 05 Jun 2025 03:51:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN1Z7-0000000EetY-40dS
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 05 Jun 2025 03:46:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ZXHAO2+jY1bXsxo50PiVK4q6TUh1IfN7fKlHU0JYCOM=; b=CWAP9UEfXd6PxDHkDE5glsqjxA
	NGF/k27R2UgjQD849waZgj0rKpCOwX/bAEMVq+JmDL3yv8A58VC0Ck2LIXJj/o+Op/XjYtTMB3aG/
	TwGYDKdC8klxYNDFiBj3NvQ4jaXb1qdQ/Pk8uf9ySV1IxvL0ih0yeArWJBCHPzW8g2kNFXZj4UzrP
	UVy6P2CQqwWdAPYAWwzYt2mXaLAC5s3O0FuS+szzx8Jy7AV4IFLKpcr6Bc2spW4a/Ot0qSgj3ujZ0
	Zxf1IJ+QGTifXTqMUgGSHP6EvapwldQ0QvP5mhPJD2TRUK0YiAxYWJd5YKr/6TgV/LgNajA2IgtCt
	SvpO2v7w==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN1Z4-000000013TW-0mKr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 03:46:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749095200;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZXHAO2+jY1bXsxo50PiVK4q6TUh1IfN7fKlHU0JYCOM=;
	b=G+iXTV1Bg3d6lflJtkMkTmLcqpa8CCtXBXFisYRKHghe7jAz2sqQXkpbXXQjnLzEl7Vh52
	+fhQT+eu8P+r+cocJiZ71kOGHaz+7k0M7P97F8ghlHEPf1usk1GUSedcXUnp8oA12PYn+x
	qQMMx97ePVMOugho4tkFk7YjPhy++gc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749095208;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZXHAO2+jY1bXsxo50PiVK4q6TUh1IfN7fKlHU0JYCOM=;
	b=T5iuq6nDBEsmac+0f0EF8PerOr8iK0hfBQSrpYkKaFkceCryjLy4jIL64DdiaHkJMSLLMF
	27byh3s0pkyl7tJOgagpggArW549tqC+jDlgxmHJ+79QBzIKSY2t2LLyPVsD/+ticl0Mel
	qxCVcecwnUhl2BgikNwgYr+sIVXAq/Q=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-657-WRIv9wjSOb2byFW1NMyImQ-1; Wed,
 04 Jun 2025 23:46:35 -0400
X-MC-Unique: WRIv9wjSOb2byFW1NMyImQ-1
X-Mimecast-MFC-AGG-ID: WRIv9wjSOb2byFW1NMyImQ_1749095192
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1ED9D180035E;
	Thu,  5 Jun 2025 03:46:31 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.229])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 284E630002C3;
	Thu,  5 Jun 2025 03:46:24 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Wed, 04 Jun 2025 22:45:10 -0500
Subject: [PATCH 1/4] drm/panel: get/put panel reference in
 drm_panel_add/remove()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250604-of_drm_find_panel_part1-v1-1-c632e12e131d@redhat.com>
References: <20250604-of_drm_find_panel_part1-v1-0-c632e12e131d@redhat.com>
In-Reply-To: <20250604-of_drm_find_panel_part1-v1-0-c632e12e131d@redhat.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-samsung-soc@vger.kernel.org, Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749095111; l=1068;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=9zlGo30GCNSbMrsJ6h0xg1RV+1gEkhPqt5tGuwTBh00=;
 b=PwnWFuSL2mOqVpmilI7vyag4kWY0qQx64BLJk5k/blISrap7GAOY6KekL8K+39wUERLlVUEzo
 r6A1ALUIQJVAHBbQoY9hPNQ3uFgAdg+lUDedlFvVmd78a7utw8mk4A0
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_044650_591646_47B24418 
X-CRM114-Status: GOOD (  10.41  )
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

Take the panel reference and put it back as required.
drm_panel_add() and drm_panel_remove() add a panel to
the global registry and removes a panel respectively.
Use get() and put() helpers to keep up with refcounting.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/drm_panel.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index fee65dc65979d6c03753967cefa6d5c4e597277d..ffa3428b5f52c599b53b1fdc0d0a9181a47c91d4 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -80,6 +80,7 @@ EXPORT_SYMBOL(drm_panel_init);
  */
 void drm_panel_add(struct drm_panel *panel)
 {
+	drm_panel_get(panel);
 	mutex_lock(&panel_lock);
 	list_add_tail(&panel->list, &panel_list);
 	mutex_unlock(&panel_lock);
@@ -97,6 +98,7 @@ void drm_panel_remove(struct drm_panel *panel)
 	mutex_lock(&panel_lock);
 	list_del_init(&panel->list);
 	mutex_unlock(&panel_lock);
+	drm_panel_put(panel);
 }
 EXPORT_SYMBOL(drm_panel_remove);
 

-- 
2.48.1


