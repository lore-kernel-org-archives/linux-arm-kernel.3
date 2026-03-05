Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 233E9F33A70
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 14:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rwxTJdKl/d602FDC0mIdoL/MoUbuZ1KesTpLdFtLuuU=; b=SkZeoT/OUGKWszud6Vn6U+5NK/
	iMeLpmXr/owRQDKdO/JVpknlWkPOdj43yIovCSSJ7EA+BOUkWOdr8gmkuMST84ZPTtw7sL7Ou3CMT
	wXh4X/BRTqajA7BKD1OIF3q18OSeFgXEBssLdrNbTbMWO09+7pxo8uDgurApIYkAmJnj7got+Yw77
	0nhOnNbTpJEkj2KrvK2sLUfDP4ZnH4w27IhomswXiRsKaCwOT+ia59bFl1XDo1HC8A2nsk3+C7u8t
	bvismtMAEYpDHRF+6cHE5uJdHAdO/SxtRQ9x2Z2hdS2lad4chgzrh0WdhdaMAcNJ4q+kealr90cYP
	zbb1lpJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy9af-00000001xMB-3KXE;
	Thu, 05 Mar 2026 14:22:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy9ad-00000001xJZ-3JPb;
	Thu, 05 Mar 2026 14:22:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=rwxTJdKl/d602FDC0mIdoL/MoUbuZ1KesTpLdFtLuuU=; b=UHVH75IXx5DrcYtzWRTAhBOZSk
	z0L5RBss9uZEnqCaUE1IjmocGOhGxarKgsn3cx8FxzYY4hG7VBtOWo0ooKsV1xh3e/kKYYu1fRwOR
	sLnfsxelHkuGoeF517oMnJyhFzifGvfSz/MSqo1SDIKthEgJgPRjpJcbYP8rLlWHo5jPmlpG/fmr+
	zcMvw0qMpHy2RBIHIf/ieR3TDb4OzD423oKio4sUYyWySzWCqXxk8f2dNDA2oVo3z80fAsW2WPVWY
	BsK1yOqXX0d2u5tI8I5RydX5Ul3BBvCR67e03gLkgrKJTsrlb3o4vtNgwJ2lPHwyrySRwRV+KFBGA
	m5v6nV9w==;
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy9aZ-00000006uXq-1vfG;
	Thu, 05 Mar 2026 14:22:10 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1772720487; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=RThC1fTEKhRYqYBkW4WMILbeqyLK/S3n9jKPH02xiXkxzqxKOtv74rJ8Bx3AKB9fFpEZe18/RYr+I7b6ETb5PtbeyhlS00LDoAV5096uLdsSK40w4txOn17qS66HXx3d3Vmr2i0TNF96E5vnKo23+E2rkjScU/QDxyVrfQoX9Vg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772720487; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=rwxTJdKl/d602FDC0mIdoL/MoUbuZ1KesTpLdFtLuuU=; 
	b=NOIJndCzvBQ7s74gTuefEhYJwiW2zG2YBcBoeE2+l/vf/mqycbzryZ7RuwuiQ4W6hDMNYb2jXfmUZik1xEfaWY+0VDimZ/Osr+liqlTTDq1AycxJJOKs0X0lNLOCsOfVRVE0LQhHW2r7iJOkqjQZjEGLIYs1eu3JEF5/h2oKR+s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772720487;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=rwxTJdKl/d602FDC0mIdoL/MoUbuZ1KesTpLdFtLuuU=;
	b=fgKrtGekN4Sxs5mbNvSepMcQYCz7U/Kte6Hy5MLwOCoFB+Qhf8qCod60ffsnmn+0
	rMpBUewSHxk1YN/CVdsznCKFQyj1pW+OwdNkOFbOKVOMQfuc2N3Mi4BEPSxJLg39EmQ
	DScjpzh9JUrAQ/5MVHebZparYhaKh73bJM67il0Q=
Received: by mx.zohomail.com with SMTPS id 1772720485432477.3720868934895;
	Thu, 5 Mar 2026 06:21:25 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 05 Mar 2026 15:19:37 +0100
Subject: [PATCH v10 11/22] drm/rockchip: vop2: Add RK3576 to the RG swap
 special case
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-color-format-v10-11-a58c68a11868@collabora.com>
References: <20260305-color-format-v10-0-a58c68a11868@collabora.com>
In-Reply-To: <20260305-color-format-v10-0-a58c68a11868@collabora.com>
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
 Andy Yan <andyshrk@163.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_142207_869539_58CB6833 
X-CRM114-Status: GOOD (  11.13  )
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
Reviewed-by: Andy Yan <andyshrk@163.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index a195f5c819a2..39c64296174f 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -337,7 +337,8 @@ static bool vop2_output_uv_swap(u32 bus_format, u32 output_mode)
 
 static bool vop2_output_rg_swap(struct vop2 *vop2, u32 bus_format)
 {
-	if (vop2->version == VOP_VERSION_RK3588) {
+	if (vop2->version == VOP_VERSION_RK3588 ||
+	    vop2->version == VOP_VERSION_RK3576) {
 		if (bus_format == MEDIA_BUS_FMT_YUV8_1X24 ||
 		    bus_format == MEDIA_BUS_FMT_YUV10_1X30)
 			return true;

-- 
2.53.0


