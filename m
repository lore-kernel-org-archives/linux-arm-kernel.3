Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D432AF31E45
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 15:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FenlZU+Q9fcqz4rTVQF15NxhkdYoxpJFDd83oJEXDMg=; b=UFzc4Iy1DdJPCbeU4RTG9ZNKIZ
	nMsdzeI4i8uMpwHCwSYmufGjxXqwCI/qRd+GmlKae1omVGSK33OtYRYmKRb0OyrwUD/7j28RvE+mh
	JCrlQ4o+E3njohyzn2yd7yg8ngDgQTUTIFb1b3VdfqrikC0VEs0VTCR7aa0fttlcdXWemDcZXOiCA
	PO6Tf3InFSuS7I8OyltqOWYREjjbtSpqMOWBrOdxMdqOuLwe3Tv2N80cfY5oLV9WlV46feIm28gLJ
	qLx7aIUwcj/T053vkGMsoKH0ABTHYQYiK9BxH7fiWd7mcLdTBfdsz20GjIqkJ3uHYUZ8OIA+w9LLo
	jw+JtLnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wArbc-0000000AqBl-2qS8;
	Thu, 09 Apr 2026 15:47:44 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wArbY-0000000Aq8b-49qb;
	Thu, 09 Apr 2026 15:47:42 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1775749628; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=chVmjwjSndd65aozBzT5hpWg6KtdAHOO5RMyw4KnX2Qqh16jF2LD+fKuY0h7d4IizxquxdWoP0EBIEokSVWfrGPTSU6ooWkag9Osc3a5pjmDzfokmY62BliqJ6d97ET4TtOnNiklqOtsDwCVbsaW5lkHEPJKMhnH9e0TYH0YCqs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1775749628; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=FenlZU+Q9fcqz4rTVQF15NxhkdYoxpJFDd83oJEXDMg=; 
	b=QXZrWsZqOCtwwyC7w8ZsjScOwSoha4grbvFFC6qWp4PECtDqkfFOECtC987vCDTuIddHhC1CePM1k3mBaHfgJMimtVMTZinENYKEC3IDnbMVfOV3LTo7UBd/E05rrggaxZ1MgqDnZOGRkWuoEKgY3duXhxqx9w4TZzOn/87B1Nc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1775749628;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=FenlZU+Q9fcqz4rTVQF15NxhkdYoxpJFDd83oJEXDMg=;
	b=CtG/PFDyKXi1BngC3NP7+Bj3663Ini6SdCyzf5KGH2cTGT4/IFV53r71O6tmIFM4
	BcUApzIOH8RCicCSMt2qs/nBDDgOcT8TCOiFxaoQT1AABVecU4JNuMnKlGo17ylO7Pc
	kX8DexrZ18saCKXCaPp7sTuAF70FcINqGmKVWxEk=
Received: by mx.zohomail.com with SMTPS id 1775749626269513.6299910266216;
	Thu, 9 Apr 2026 08:47:06 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 09 Apr 2026 17:45:04 +0200
Subject: [PATCH v12 14/25] drm/rockchip: vop2: Recognise 10-bit YUV422 as
 YUV format
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-color-format-v12-14-ce84e1817a27@collabora.com>
References: <20260409-color-format-v12-0-ce84e1817a27@collabora.com>
In-Reply-To: <20260409-color-format-v12-0-ce84e1817a27@collabora.com>
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
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: kernel@collabora.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_084741_098285_ABD42B82 
X-CRM114-Status: GOOD (  10.03  )
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

The Rockchip VOP2 video output driver has a "is_yuv_output" function,
which returns true when a given bus format is a YUV format, and false
otherwise.

This switch statement is lacking the bus format used for YUV422 10-bit.

Add the two component orderings of the YUV422 10-bit bus formats to the
switch statement.

Fixes: 604be85547ce ("drm/rockchip: Add VOP2 driver")
Reviewed-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index d3b76e7e785e..59d15bacf023 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -352,6 +352,8 @@ static bool is_yuv_output(u32 bus_format)
 	switch (bus_format) {
 	case MEDIA_BUS_FMT_YUV8_1X24:
 	case MEDIA_BUS_FMT_YUV10_1X30:
+	case MEDIA_BUS_FMT_YUYV10_1X20:
+	case MEDIA_BUS_FMT_UYVY10_1X20:
 	case MEDIA_BUS_FMT_UYYVYY8_0_5X24:
 	case MEDIA_BUS_FMT_UYYVYY10_0_5X30:
 	case MEDIA_BUS_FMT_YUYV8_2X8:

-- 
2.53.0


