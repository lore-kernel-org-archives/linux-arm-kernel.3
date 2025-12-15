Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84A96D5B16E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 14:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p065Ctfv0+YZkVudNfEaBaJuLCONxpch52O21i+TW98=; b=N+UrDtMbWsFroXSfoxLfJPk7Ob
	fm2Gntl6A2sG8cMofbDHijuyXXBfClJ+FQPTjD7yOBblCE7Uw/vusvXSOobB2U4OEyyTp8LWaXHYY
	IbanEgXFyEA6mukVcss9gKzXWDc3pQbHCt5CHMbjG7WfysDo432BBB29aA+fQieoi1ThhxXN28ijq
	18wbwfeJmhD1WK2I1kC4h4ZeJF/Qp1g2tNyuhOpIKk9h65abChLks/G4xDl2wHdd5b1vuRQorHWeb
	cWMswllt5214/WtaTFqX+5dEzVB7khtjQdaUBQsqKTp3OenwwpwHORkfF73LJ9QtPlIpS/ptIoEIM
	PGJCAh5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV9JP-00000003lNg-2gOb;
	Mon, 15 Dec 2025 14:12:31 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV9JN-00000003lMh-2bzW;
	Mon, 15 Dec 2025 14:12:30 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1765807912; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Pe5zEGen7DWMIxa0od2V27KaZd5+IYdcsbmA109St1b4Tma8sLq/nrWMj+pK4uYwDZdpkmOoFUsuFE579SDvm13+7leM3eeELm4eMNSI4yJa7lWF8dpZONizF/rgv4vVfeWE+xY+67aV84AIH1S5hQ5w3vXTvaXWCPl19OUzajo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1765807912; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=p065Ctfv0+YZkVudNfEaBaJuLCONxpch52O21i+TW98=; 
	b=l39otskCqJRUucKHJXIrtcgsQwwak6Jpfxgi4eNObTAEFpGM7Ebp/fyVJsSHDY3L9MQCGl+IllVUhvKfQ9CPpmQQf7uzACKXZPkROzTp7evXYNaptubrIi2VEZk7N9wgScdjQH0giJj+S1AhFagT1Crw6BAlckbGKQyEDrwHgRo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765807912;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=p065Ctfv0+YZkVudNfEaBaJuLCONxpch52O21i+TW98=;
	b=d9lZdGCXn+1rU5HzZhl0hdtdnqfneWhgLdqRxMqHXX/AyhNVd3bu+MmX0o/wsYII
	q7XzwADK0RkiHmRCiZ5osIZHFzDuqx/8TmEdb3Wg/TEcvjc+FWorWA02yH4tbvLAvnT
	mkGyloQ3O+cP4sWYa4jwwbKg6XaA1qr1DoDHuh6M=
Received: by mx.zohomail.com with SMTPS id 1765807906487314.75561026470734;
	Mon, 15 Dec 2025 06:11:46 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 15 Dec 2025 15:09:23 +0100
Subject: [PATCH v5 7/8] drm/rockchip: vop2: Use drm_is_afbc helper function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-vop2-atomic-fixups-v5-7-83463c075a8d@collabora.com>
References: <20251215-vop2-atomic-fixups-v5-0-83463c075a8d@collabora.com>
In-Reply-To: <20251215-vop2-atomic-fixups-v5-0-83463c075a8d@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: David Laight <david.laight.linux@gmail.com>, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Daniel Stone <daniels@collabora.com>, kernel@collabora.com, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_061229_722934_481DC625 
X-CRM114-Status: GOOD (  10.30  )
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
index 7591a34ba912..707b48c7e9d8 100644
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


