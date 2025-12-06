Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 306EDD3B7D8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Dec 2025 20:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+DJMiovkGJ+i2ggvzErlRLV4kZ5tOdhjMfzzT/pSZtU=; b=fufLZIMv/gjjQwoRFhp09k7S7F
	LfzB6cjft87nsucRamsa0ATAuDYsJs6oic7y4qImTTJ1WvQN3+HsksRXBeTjIHz/dpWv7sxaNK57p
	PgdyJ+Kuglbo5Zr82/v1k6FLZ6PLc/R2J5LBNQ9AmpWrwaTl2ndo5Yih7XIAcVHNZ7XcXprhmsJJd
	esfWzyPvzKherguHBbqepZqh5CTqNNQVKniAoyiK4a7DRnAK7Im4od5pyyhezKBGnAbElUAmMVa5v
	qdNtyKfPnpKTX/PzQf/ZcNBCem2zS+5G97W240n3s81gJpfYCIDIunhymaT3hbL998XlkXwna9tpm
	QMzqQrRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRzAa-0000000BDPC-0wdR;
	Sat, 06 Dec 2025 20:46:20 +0000
Received: from sender3-pp-f112.zoho.com ([136.143.184.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRzAX-0000000BDLE-171m;
	Sat, 06 Dec 2025 20:46:18 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1765053962; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GpWmrRd5Efr8zcWpSIYQruDSqir+/VHWi9mm8apLf6rE6wpN2o1rl6XBxGIPdWV0W/9jGNHN5CNeGnbAKDHuchrs4bWXhwYyuQ8qw6IEBi2VXDuqg6NY84avUv8rgvtdlX9dTxbFgXyUmgIKHhrTj3nSGhGizg+bRql/zYWUVck=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1765053962; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=+DJMiovkGJ+i2ggvzErlRLV4kZ5tOdhjMfzzT/pSZtU=; 
	b=L8Oj+sH4vHQrpSHhflEmomHTyF141CrXFxKcV1RYG/uK3QMvlD0rPMSs01GCoagoqPznMR+G5Dy2swxPJjXKJAs4PEzog3tXITqhLSPLEzQAic6GKNl09Y0a365uchuzQ8PIHt3CfWJE4Tr/V/Ern6tEXMDPnlBMSQvSO2ONqAY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765053962;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=+DJMiovkGJ+i2ggvzErlRLV4kZ5tOdhjMfzzT/pSZtU=;
	b=XHTmfXLBsCKzVLzM5D4p01Z7J2S+7ucqnmu5TwIBsxifzpgo7qUOXvovkKsCcI1B
	cTfIvv8AO6nBxSY2j61gJKdSLeuGIZWz47bbJxl7X5GVJ8OHX54DmI9aU2+9SNiVZzu
	9gVqkGCVEKrdMWc7QIidsJjCAwS5mcwOT3VnsTRg=
Received: by mx.zohomail.com with SMTPS id 1765053962055216.10515253280266;
	Sat, 6 Dec 2025 12:46:02 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Sat, 06 Dec 2025 21:45:17 +0100
Subject: [PATCH v2 7/8] drm/rockchip: vop2: Use drm_is_afbc helper function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251206-vop2-atomic-fixups-v2-7-7fb45bbfbebd@collabora.com>
References: <20251206-vop2-atomic-fixups-v2-0-7fb45bbfbebd@collabora.com>
In-Reply-To: <20251206-vop2-atomic-fixups-v2-0-7fb45bbfbebd@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Daniel Stone <daniels@collabora.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251206_124617_362973_8D688A0F 
X-CRM114-Status: UNSURE (   9.41  )
X-CRM114-Notice: Please train this message.
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

From: Daniel Stone <daniels@collabora.com>

We don't need to do a long open-coded walk here; we can simply check the
modifier value.

Signed-off-by: Daniel Stone <daniels@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 2a308cc31632..8e0727c3523f 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1207,7 +1207,7 @@ static void vop2_plane_atomic_update(struct drm_plane *plane,
 		return;
 	}
 
-	afbc_en = rockchip_afbc(plane, fb->modifier);
+	afbc_en = drm_is_afbc(fb->modifier);
 
 	offset = (src->x1 >> 16) * fb->format->cpp[0];
 

-- 
2.52.0


