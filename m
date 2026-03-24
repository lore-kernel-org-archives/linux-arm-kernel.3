Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43561F54AD9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 16:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FenlZU+Q9fcqz4rTVQF15NxhkdYoxpJFDd83oJEXDMg=; b=WMHpsJnHKYbGER6WzdiyU/nbI4
	w1Q4v88TnLQjzJAcfEtydygf5lqm6N81oJMXSNQM8bVRJNiVRKxELXeW5Ml8qdY4CTh0TdqixT+JV
	6fNTKYHvDrvwB/9w9D40cjwNk5Y0i4FD0vCBKPE9BzFj1jRBbd3AQ4GXY0C2DRnDrR+BAM2mrP7g9
	Aek2ed5JRrn/fm/8wO6EUBofyTHE7grtSF1nrdbHE+TqA69qSr3HSqdlZdk1YcqqEhOf7S4DpNGoe
	Sc4+YsxKOi6cRow0Ph5m9MX6f+1Z85K0KLe13pXQcCiOoQpQlIQeQwz2R8QD4YpkJG+0Qtl6rU14O
	kmVyz+eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w54Ea-00000001p5D-24GZ;
	Tue, 24 Mar 2026 16:04:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w54EQ-00000001ozO-2AqI;
	Tue, 24 Mar 2026 16:03:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=FenlZU+Q9fcqz4rTVQF15NxhkdYoxpJFDd83oJEXDMg=; b=QrpplxWqSPzgJzPjY9q6jkiRnK
	ALpn2SIvAlaB5fO+FizzevNHwPfkzJKFieckcJWP8iUkVJ9GJ3HshnJ8mRnZO+BZclFxbw5jjCnwp
	h3ulyQT0Yp5X54kNtVkSt6UH2IrAPcReQCLQpJnvjrlSAuL9Qcw62p0CPTrA12poZDN0Ep0G54I2s
	qw1yERgGo/jDLsTn1CVqj+W0rOxCHbakS4gtOYzLoQ23MHVVfMeTQ0Q8OaL/whQq9n9WTU7pBsL41
	xNQLkXZWJ8Pb9hL1fSB1tXzdKjRu8r0l8RHcLojoqXmQN9MsC0U5naAfM1fnMhO4PkujQmi3lgc8T
	8HZCUxRA==;
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w54EK-00000004TLi-1ygT;
	Tue, 24 Mar 2026 16:03:46 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1774368190; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LReOyZYw5x4/D9u1OTFZn4uK7ZLhsOj7VBT/dwEiIASJyln5+JOYlPGxI5vvoraEMPXs1dj1LaYVhzLRL3klX1ziV2x9x76TVpcmBWb+qAK36d+js5cOqYMs6hoB4WauaY5IOLXsRCVsehQF/BrV2pQaFWf9Ic1zC36//CAlBVI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774368190; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=FenlZU+Q9fcqz4rTVQF15NxhkdYoxpJFDd83oJEXDMg=; 
	b=AGi0E1hbiljbqxnSIfI7gdW3MeokgzqDWncROtxJjOsqIYyuFTXDxN6NkHZV/hUQMChl5/ZHpe3/u38RH9jT6+8ppy5zdgcXbxPlUMYB8ZPzXq42yhAtYm2VPCX/uiA7xxpZ/DJPPdRnh3IwE5rsadMcCTyd0KhqYIM9XAaE1YQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774368190;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=FenlZU+Q9fcqz4rTVQF15NxhkdYoxpJFDd83oJEXDMg=;
	b=eSVDxpuQZgx9S9cjhwgvh11gPzulYEI4dFiNsA+OHtfjw8FubXSQrUmk4aNF4Wl2
	ZovT6ytW3bC+RcT+ds90hURGjg+EAChHTZkvBiL+YN+M3JpsM5PErWNqQTgZpoC+SDp
	BHaRuzeRTRc3GiDckulPXAF15riKG4/zO9GpdBkA=
Received: by mx.zohomail.com with SMTPS id 1774368188441327.08097183352686;
	Tue, 24 Mar 2026 09:03:08 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Tue, 24 Mar 2026 17:01:16 +0100
Subject: [PATCH v11 12/22] drm/rockchip: vop2: Recognise 10-bit YUV422 as
 YUV format
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-color-format-v11-12-605559af4fb4@collabora.com>
References: <20260324-color-format-v11-0-605559af4fb4@collabora.com>
In-Reply-To: <20260324-color-format-v11-0-605559af4fb4@collabora.com>
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
X-Mailer: b4 0.15.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_160344_957076_854DAAA9 
X-CRM114-Status: UNSURE (   9.70  )
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


