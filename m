Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3710D116F6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 21:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vMEVtusOOXfPRN1S7veFHRS7LrQNrJrKcU+w7cKs18Y=; b=cQzbHmNsapOnLnHTZo4bPooAHi
	eHfYop0rRzDtygMkwEMP2qy3GC2CHndZsVurzFP8sBFUMBMa4W3WJFeJVE1I0C05puEoYF9qWxPaX
	BdqjEBUkzD6mMbulIcCfMaXBLUPLEHrP+8M//oJPbUrZoPALQ9GvCTNh35CjEJKnysrhJ7gfqjm8L
	jIUwnw3M1+iIrbIJzsIekxLA2Q+/yZOsI7mZdY/zuJOqNOukKHfrEqdd4bJ7ibmBG7MXTqsRnXs9N
	aF3+VDQl7yVTvJ9aMlz2TSmievwgsroooh4su0fHgKZlhPgdd7xzqEvoj/x76tbgBrvvWNxfH8uFt
	MCBI9VeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP5h9-00000000wCW-01rC;
	Fri, 28 Nov 2025 21:07:59 +0000
Received: from sender3-pp-f112.zoho.com ([136.143.184.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP5h0-00000000w24-0ZvU;
	Fri, 28 Nov 2025 21:07:51 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1764364040; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mP7JOnOVmykDoJeYZ1TH/GVAybcvE5O9W95kh3HcC1xAzM6EZ7uoSSH4szoFphfEcnS+4mbm+6c5ICDrHXLHI1VQ1xeTgOR/eFM++xpUAFeDg+0z+sU2gzswUMDaEj6ARKggRNaG46LZ8g2Zoc2bYOWbGBdWg43pgdDER2D7pww=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1764364040; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=vMEVtusOOXfPRN1S7veFHRS7LrQNrJrKcU+w7cKs18Y=; 
	b=JKABHKXUYv6hftOD2O1nEADFI9DptPuH1elVCdSOypnlazJoaAemq7eqb7CjjbcYTXzrNUAoPQQfzuQpmhJg7YHmknUEUCcFoOGmB+ufTHMS9JeTHnOOWUgDUuTQxfuo3wC0Bj1Lvo9TjRWnuLdjt11t5OQtmkiASVJ6JJq8Glk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764364040;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=vMEVtusOOXfPRN1S7veFHRS7LrQNrJrKcU+w7cKs18Y=;
	b=jRFnEV2hXn49mq20FbWVpn0yKXRmpyKwj6kxw7z+Waj2+dfFloPXQdiBGf3UTD0q
	zwoNBQoGlhM7+mUzwfei8HuI0ItZf7I+SeSanLIam0r+uerrXSBkEL1j9iFY3oZONY6
	Igj3fBUeT+vzPO8U/wHejQzfVWb3b4L2Iyq19pY8=
Received: by mx.zohomail.com with SMTPS id 1764364038497541.7488626349531;
	Fri, 28 Nov 2025 13:07:18 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 28 Nov 2025 22:05:47 +0100
Subject: [PATCH v5 11/17] drm/rockchip: vop2: Add RK3576 to the RG swap
 special case
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-color-format-v5-11-63e82f1db1e1@collabora.com>
References: <20251128-color-format-v5-0-63e82f1db1e1@collabora.com>
In-Reply-To: <20251128-color-format-v5-0-63e82f1db1e1@collabora.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Dmitry Baryshkov <lumag@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>
Cc: kernel@collabora.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_130750_272405_9B9578A9 
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

Much like RK3588, RK3576 requires an RG swap to be performed for YUV444
8-bit and YUV444 10-bit bus formats.

Add its version to the already existing check for RK3588, so that YUV444
output is correct on this platform.

Fixes: 944757a4cba6 ("drm/rockchip: vop2: Add support for rk3576")
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index f1252d1f06e9..0a1adf36a24f 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -354,7 +354,8 @@ static bool vop2_output_uv_swap(u32 bus_format, u32 output_mode)
 
 static bool vop2_output_rg_swap(struct vop2 *vop2, u32 bus_format)
 {
-	if (vop2->version == VOP_VERSION_RK3588) {
+	if (vop2->version == VOP_VERSION_RK3588 ||
+	    vop2->version == VOP_VERSION_RK3576) {
 		if (bus_format == MEDIA_BUS_FMT_YUV8_1X24 ||
 		    bus_format == MEDIA_BUS_FMT_YUV10_1X30)
 			return true;

-- 
2.52.0


