Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3437BFEFB4C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 12:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bipSVGtYuY7pSKdAP+P3qZEzZ4tmz3O7tuzLvgU8Lms=; b=FEOj0jFcAJaQes//QBEipkdJXm
	3QSKHSUfiLRfCBDYE+IIcU8mf8FcHcz8vF3dHNJi78YrniMOhgrWYbedciJqeOJvr4fWkWZoFsaLU
	AnOS7wYy3Apgjiny49vtOLGyOW0wD757Q0IHPKIDhHb7lzY0jiK7FQ6IC85qcowWcEeH8vo0IPP6L
	qFk7V8v+xoAPOFoFpH6Ke3GIEekp81N8JApjFB5tvkeacSJBA+E9jS7UGSh9VxgKMV3FtfwC5Uklv
	kAtfdLtuBuJ3pklFW4MDKH2JI7aPViw18vFNCfP96bao5aMDQwjI1pBw8nvdgHDndrJ4ZjISe1o7T
	pgkTOtaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvxG4-00000008LN8-1v2u;
	Fri, 27 Feb 2026 12:47:52 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvxG0-00000008LMb-3scH;
	Fri, 27 Feb 2026 12:47:50 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1772196420; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=EnamxOjNOYW413bvp8pGeS0DGcHEkAoR4gzm/d5ahyYAMsTb1jVDXdl7sJOfo4Xx+o6gYDvSl/JNgJuZTEmhEEh5u34RI4Rt/k0Cg3dxIv2mYLs6VXiV/ZftQIHRkl/v+/wNSmIdx6u0n02TuJ7YGiiFfBJQGB3QnxVm/ZhURd0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772196420; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=bipSVGtYuY7pSKdAP+P3qZEzZ4tmz3O7tuzLvgU8Lms=; 
	b=Sz9TtfK8WTmWu/P2KZ83MAs/mRY9l6M+fl7BHgn3KfdB5hVwjBgX8tIbCuIP1cmMTzj3c6fiQf/5apxd5e5AbGSMIQt7z0VirMtcmIEoAmy/v7pk/4HEb8b1aS3B1cyJ9F8+WOnOCJw1UBQ+Etde8U3hVj7cxQTNyvi651jGMnM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772196420;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=bipSVGtYuY7pSKdAP+P3qZEzZ4tmz3O7tuzLvgU8Lms=;
	b=a7DIPpNX4R5p+xYAxMwirNQKP0qg+cxXic7jX+XbKS9Nr/G9yePJhS7EVIogXniX
	uUw8jCOrb0BOESi/yUFNnDsca2vCPhncgQC4k7Exq9GYnUCmpMmbwiPG2+00i+Q5JrM
	Dg+ZzbWWVvoRijARsTvpATLEzxQscIjnk06anOvU=
Received: by mx.zohomail.com with SMTPS id 1772196419413925.2174865442265;
	Fri, 27 Feb 2026 04:46:59 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andy Yan <andy.yan@rock-chips.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>,
 Liu Ying <victor.liu@nxp.com>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 14/14] drm/display: hdmi: Use drm_output_color_format instead of
 hdmi_colorspace
Date: Fri, 27 Feb 2026 13:46:50 +0100
Message-ID: <13979896.O9o76ZdvQC@workhorse>
In-Reply-To: <20260227-dramatic-agouti-of-brotherhood-416e19@houat>
References: <20260224-drm-rework-color-formats-v1-0-bebc76604ada@kernel.org>
 <5558942.31r3eYUQgx@workhorse>
 <20260227-dramatic-agouti-of-brotherhood-416e19@houat>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_044749_005393_6781BF87 
X-CRM114-Status: GOOD (  30.68  )
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

On Friday, 27 February 2026 09:29:05 Central European Standard Time Maxime Ripard wrote:
> Hi
> 
> On Thu, Feb 26, 2026 at 05:24:05PM +0100, Nicolas Frattaroli wrote:
> > On Tuesday, 24 February 2026 11:58:53 Central European Standard Time Maxime Ripard wrote:
> > > The hdmi_colorspace enum was defined to represent the colorspace value
> > > of the HDMI infoframes. It was later used by some HDMI drivers to
> > > express the output format they should be setting up.
> > > 
> > > During the introduction of the HDMI helpers, it then was used to
> > > represent it in the drm_connector_hdmi_state structure.
> > > 
> > > However, it's always been somewhat redundant with the DRM_COLOR_FORMAT_*
> > > defines, and now with the drm_output_color_format enum. Let's
> > > consolidate around drm_output_color_format in drm_connector_hdmi_state
> > > to facilitate the current effort to provide a global output format
> > > selection mechanism.
> > > 
> > > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > > ---
> > >  drivers/gpu/drm/bridge/inno-hdmi.c                 |   6 +-
> > >  drivers/gpu/drm/bridge/ite-it6263.c                |   2 +-
> > >  drivers/gpu/drm/display/drm_hdmi_helper.c          |   7 +-
> > >  drivers/gpu/drm/display/drm_hdmi_state_helper.c    |  52 ++++--
> > >  drivers/gpu/drm/drm_bridge.c                       |   2 +-
> > >  drivers/gpu/drm/drm_connector.c                    |  14 +-
> > >  drivers/gpu/drm/mediatek/mtk_hdmi_v2.c             |   8 +-
> > >  drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |   2 +-
> > >  drivers/gpu/drm/tests/drm_connector_test.c         |  80 ++++-----
> > >  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 182 ++++++++++-----------
> > >  drivers/gpu/drm/vc4/vc4_hdmi.c                     |  18 +-
> > >  drivers/gpu/drm/vc4/vc4_hdmi.h                     |   2 +-
> > >  include/drm/display/drm_hdmi_helper.h              |   3 +-
> > >  include/drm/drm_connector.h                        |   7 +-
> > >  14 files changed, 205 insertions(+), 180 deletions(-)
> > > 
> > > [... snip ...]
> > > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> > > index 4f5b27fab475c7c733622eb8727927571f3fb8fe..171cd495976a3e16f201fd339d3d42a09dc3b63f 100644
> > > --- a/drivers/gpu/drm/drm_connector.c
> > > +++ b/drivers/gpu/drm/drm_connector.c
> > > @@ -589,14 +589,14 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
> > >  
> > >  	if (!(connector_type == DRM_MODE_CONNECTOR_HDMIA ||
> > >  	      connector_type == DRM_MODE_CONNECTOR_HDMIB))
> > >  		return -EINVAL;
> > >  
> > > -	if (!supported_formats || !(supported_formats & BIT(HDMI_COLORSPACE_RGB)))
> > > +	if (!supported_formats || !(supported_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444)))
> > >  		return -EINVAL;
> > >  
> > > -	if (connector->ycbcr_420_allowed != !!(supported_formats & BIT(HDMI_COLORSPACE_YUV420)))
> > > +	if (connector->ycbcr_420_allowed != !!(supported_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR420)))
> > >  		return -EINVAL;
> > 
> > I don't think this will work as-is. drm_bridge_connector_init calls this
> > function assuming hdmi_colorspace bitmasks in supported_formats.
> 
> Yeah, you're right I missed the conversion in drm_bridge_connector_init.
> It should be fixed now.
> 
> > This may have slipped through the conversion; the synopsys dw-hdmi-qp core
> > (separate from synopsys dw-hdmi) also assumes hdmi_colorspace, see e.g.
> > dw_hdmi_qp_plat_data::supported_formats in include/drm/bridge/dw_hdmi_qp.h
> > 
> > So should be a simple fix I hope.
> 
> For this one, did you identify anything more than the comment in
> dw_hdmi_qp_plat_data? I couldn't find any user of HDMI_COLORSPACE_* left
> for the dw_hdmi_qp_plat_data.supported_formats users.

Nope, it's really just the comment. My series will obviously need
adjusting since it makes use of that member, but that's part of my
rebase. So far, there don't seem to be any users that set the member,
so it's just the comment documenting it.

Kind regards,
Nicolas Frattaroli
 
> Maxime
> 





