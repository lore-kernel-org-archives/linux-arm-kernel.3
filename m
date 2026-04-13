Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B863EBFD2F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 10:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pAXSZtPd5U/ZCuO8959Lc90gPEZRU63FJ0bQzc9gzHI=; b=aDPbEyws9cTmIQbI8VZ0DXaOyi
	16cNSoPYSetVZ3Xp55b9dFoWFhzMlO0RcgZIcokG9QJTchgkylGev3pFsHAbQSzfBH9i+TDjOnqSp
	qaM/RYqHqLCgSckFMi9ClNPsczMX/oT6Kk0tBhbTk0DjbUGXf9cQRbSBduLklmLjt1yIgDvHdOf1k
	T8d2PPxXOx2NGP53hHtp9PBrstKCZq90r83jdB5EViILcte9Y2iEeYHmpiBup/9gjzfi4y0khFHNP
	rYBCI8JPYTCCHOspMsFuw8xfMm6TiZDb57w62Pdf/uTXaGsYp8mwWiUPYy1mK53joxvF1Ab96bHkp
	5Sc/4XDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCEHE-0000000FT5E-25Mb;
	Mon, 13 Apr 2026 10:12:20 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCEHD-0000000FT4C-1iJI;
	Mon, 13 Apr 2026 10:12:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=pAXSZtPd5U/ZCuO8959Lc90gPEZRU63FJ0bQzc9gzHI=; b=Q0lo9chrlc6bHohAwNwz44okdW
	sXWPXWdCkeXZN+QX85Gsx8o/aau5j1wgc2gAZJYaP9DHVntJ1TAWeCyQHM8opkJ6jIJwINMwosTLU
	+t5rx4XiB0DWtjb0J7JTMgbgqVgkALlxe4tW6bxb+DCTm7tUIzO5vk00cSJNGnpPSte6j9vio9PTm
	DcrXoQQszhC5tGwaC+g4I7kz0XZjzgT0mLz7vXNHdhy/Y+m+Nn2d8bt6+BuZVNZo4nwaPaZ/hfy9U
	iGu3wD1g0uzvsTeDyUUZRhVaMqW0h5TD+pHgrXxQTm+bcs4Cm17exoQvs0kyW8p/QIXSopWtyQccU
	5OliHkTw==;
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCEH9-0000000Dh7W-1oO9;
	Mon, 13 Apr 2026 10:12:18 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1776075102; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=IBTsDxLxQSdNoi3ndUXa20r13M4Ela5iEpVM08Oo2RkBEYLAF+Lw/dJzqDGqMyz+i5psseEJCdN5DruAJbExPguHCM75eMzOJdpnFxkP+wZg+/gMI7lE0pJcdv9DkEAtPV4kEdSgWhnuNvZd+EAylDxSJ4pdbF1Cjvz2D1hLgMU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1776075102; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=pAXSZtPd5U/ZCuO8959Lc90gPEZRU63FJ0bQzc9gzHI=; 
	b=AOkxbjOIdTJDYdW1Ob1kjqvA6a3TpbC77dYOBpKpH4MSQpWVFZmHRnlbH+TrscRrKWcyrEhkmUzfM0Qgp5plOFgjrB1DhBx2Ffd2tCbUTRlCjXTMDaewahyww7Ty/Td11sYdcNqN+W0q853FZ0UjF0OwDnncCxJQfRJzyLt76r8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1776075102;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=pAXSZtPd5U/ZCuO8959Lc90gPEZRU63FJ0bQzc9gzHI=;
	b=QgmkkMtl/suz2GbB8NnEaOetn8NXNniLv61xv0fk95cPbACV/sIw1UsHl28Dt/N5
	luI4x10c2eVBU0SoYIKt3VMzDO5Go1sk4iLDXd1ck8OcT43IzcLS7xvCvCMEeqDlrWh
	HoSdEUnQehxbKyyt7GHgciZ+tLnaeEi2F3cU++VE=
Received: by mx.zohomail.com with SMTPS id 1776075099753819.2140777372053;
	Mon, 13 Apr 2026 03:11:39 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 13 Apr 2026 12:07:41 +0200
Subject: [PATCH v13 27/27] drm/connector: Update docs of "colorspace" for
 color format prop
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-color-format-v13-27-ab37d4dfba48@collabora.com>
References: <20260413-color-format-v13-0-ab37d4dfba48@collabora.com>
In-Reply-To: <20260413-color-format-v13-0-ab37d4dfba48@collabora.com>
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
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_111215_824311_CD563167 
X-CRM114-Status: GOOD (  11.58  )
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

The colorspace property's documentation states that BT2020_RGB and
BT2020_YCC are equivalent, and the output format depends on the driver.

Now that there is a "color format" property that userspace can use to
explicitly set a format, update the colorspace docs to mention this.

The behaviour here is not changed for userspace that doesn't know about
the color format property yet, as the color format property defaults to
"AUTO", where the choice of output format is left up to drivers.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/drm_connector.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 048789032971..88185a53d940 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -2573,7 +2573,8 @@ EXPORT_SYMBOL(drm_mode_create_aspect_ratio_property);
  *		conversion matrix and convert to the appropriate quantization
  *		range.
  *		The variants BT2020_RGB and BT2020_YCC are equivalent and the
- *		driver chooses between RGB and YCbCr on its own.
+ *		driver chooses between RGB and YCbCr based on the color format
+ *		property.
  *
  *	SMPTE_170M_YCC:
  *	BT709_YCC:

-- 
2.53.0


