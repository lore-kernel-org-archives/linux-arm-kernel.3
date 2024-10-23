Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE17BCDDE6E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 11:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VXygjawUNFgGZXGvgrS9dYzEo+YQBaZ/4AED7vTUJxI=; b=W4FgFp8/jQhyJ+2wVTA2tHBHwz
	5MGU8aTbKjo/epKKk0q8Tx1MoiKVffh5W5QQqM+HvqCZMcqGjGwRIeNpbUggbIytZ+ppWiLJaty5D
	x5UgKitRF5RYVhZfi3wwwSDNgJsN62hx9UlQzcxn6UmWBE8gLdE5A0oCMKp12WX2LnwNGlyU/Xt+n
	Fq0G+8OjAvOoYCDrW07pRqI8TjmkPyqiXZDhuEq2xLsqR5o2pnsa4c2VKzoVvW+itZOtSkXUz2bJq
	9H/oSZKDSZSGXgLd5VmuLzNhngmwGqfoAMsBvp2vXUj6Bg5/hD6YFqfS0tr/Vl4OHqxO+921Y2QpL
	E5oyhdcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ZpL-0000000EC17-0o2Y;
	Wed, 23 Oct 2024 11:46:59 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ZAe-0000000E4xV-0GlQ;
	Wed, 23 Oct 2024 11:04:58 +0000
Received: from umang.jain (unknown [IPv6:2405:201:2015:f873:55d7:c02e:b2eb:ee3f])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 076709FC;
	Wed, 23 Oct 2024 13:03:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1729681387;
	bh=fvlat9AHEEDf8cSpGbz1hc5d3oS8Gf8tdHnvlCW1ce8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qM2MTKsWBIq5UwKpFip16eKxS29ok1aao6A1BS4GeXxgZSiz9Wim9gpWqfsrkzQDb
	 QGioOTRQbxHKQkIkEqDUbjQJ6n+skq1Wm2X61T379uXvFyjLar+6fUGGkB6XFcI9KT
	 MN7ITKrXxZvSTlmS9LVTQgoDL+4FYKG8AmndkRZo=
From: Umang Jain <umang.jain@ideasonboard.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	kernel-list@raspberrypi.com,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH 5/6] staging: vchiq_core: Pass vchiq_bulk pointer to make_service_callback()
Date: Wed, 23 Oct 2024 16:34:05 +0530
Message-ID: <20241023110406.885199-6-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241023110406.885199-1-umang.jain@ideasonboard.com>
References: <20241023110406.885199-1-umang.jain@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_040456_267632_A78EDFC1 
X-CRM114-Status: GOOD (  11.22  )
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

Pass struct vchiq_bulk pointer to make_service_callback() instead of
just passing the bulk->cb_data. This is a preparatory change when we
need to pass the callback data user pointer (__user) in a subsequent
commit.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 .../vc04_services/interface/vchiq_arm/vchiq_core.c  | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 6095adaf0cf6..3c811b8f210c 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -455,10 +455,18 @@ mark_service_closing(struct vchiq_service *service)
 
 static inline int
 make_service_callback(struct vchiq_service *service, enum vchiq_reason reason,
-		      struct vchiq_header *header, void *cb_data)
+		      struct vchiq_header *header, struct vchiq_bulk *bulk)
 {
+	void *cb_data = NULL;
 	int status;
 
+	/*
+	 * If a bulk transfer is in progress, pass bulk->cb_data to the
+	 * callback function.
+	 */
+	if (bulk)
+		cb_data = bulk->cb_data;
+
 	dev_dbg(service->state->dev, "core: %d: callback:%d (%s, %pK, %pK)\n",
 		service->state->id, service->localport, reason_names[reason],
 		header, cb_data);
@@ -1339,8 +1347,7 @@ static int service_notify_bulk(struct vchiq_service *service,
 	} else if (bulk->mode == VCHIQ_BULK_MODE_CALLBACK) {
 		enum vchiq_reason reason = get_bulk_reason(bulk);
 
-		return make_service_callback(service, reason, NULL,
-					     bulk->cb_data);
+		return make_service_callback(service, reason, NULL, bulk);
 	}
 
 	return 0;
-- 
2.45.2


