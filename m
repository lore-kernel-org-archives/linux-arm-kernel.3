Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A806CF31BE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 12:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qkp5pM4kPUn4Z6RS327lCOqrGmM6PpBeTOuTvzIeNwc=; b=UIRFSvTZMjD14b28NDCESdrCiW
	f0t7v4N9VjdjA/AoIo9xbPIYZYTlMmOwlacCXOdU7YrpFBgW9mLpCZjK+o57cChIhaKBQw9qxPhRr
	hsidxCfTJhmup0eJfJ6OsTyKjbWcJonAwkIrctgXUCZix9hjlDIqJ0zCfE9Ga13/91k+nAQlvEUDP
	kZu7C7KKyrXXStFDYV6TO/F7ylfWc4TSMzxnkPGgGL7N1RzWQ4vao9sHI7l3vnlkTfCMRl3XXtA3u
	ugjVrZYggQQVSD345fOJIf51BKjb3B62B/Sd0txmBh2ZR9l1Z0vCbV4rdyzmIVK6iS+VyclkbImET
	aDmOqQGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLhVk-00000003Bai-20aL;
	Wed, 19 Nov 2025 12:42:12 +0000
Received: from sender3-pp-f112.zoho.com ([136.143.184.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLhVh-00000003BaB-3ZWD;
	Wed, 19 Nov 2025 12:42:10 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1763556090; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=efAGdgdlLCmUjUiCUN+88ikUtvP8E+gBXE8iOqgiH9/f4gYzd0gr8lweUEbd3ZFRD+ZiqSuuV6xP+sZGKES92se5zLTUVxCvnkOeLTgwKWwsrJetJMgUwELe/8/ll9gxR0l7fAMLpdu4UqFRY1E3v1MFP/e1FTQRkOHIX+/NYvg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1763556090; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=qkp5pM4kPUn4Z6RS327lCOqrGmM6PpBeTOuTvzIeNwc=; 
	b=OuztPRTlii3euM5FvuVgPFtTPcHctPj4sm+4mCNQmbk01+4clywpxZjFBSlRiHbmx9uqILeTnT1X+ErlmtVJcEszZ55rNhF5DH3cn96jNTMoMGvT2cNd/coVnVISVDDivzhjCgDfBhaKzsaVmfJYtWneNpj4czpNxuG7yhp9r8s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763556090;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=qkp5pM4kPUn4Z6RS327lCOqrGmM6PpBeTOuTvzIeNwc=;
	b=Hvyo7taZPEolTW7Q7dLQLL/uX2K0MI7p7QAQJLQEAbXYw5eFq6ofNe5beUBpEd12
	1/y0p4GyB6eSbpZp5CYbpjl3VeOiXJWyQF07RqM8SnEM91fxbYGFwkvPO+vEcfw7E6J
	EjXEYgUF2NAl6dXlaOaFH32IGvWQZQLMQ964umEE=
Received: by mx.zohomail.com with SMTPS id 1763556087174897.1379263947298;
	Wed, 19 Nov 2025 04:41:27 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, kernel@collabora.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v4 07/10] drm/display: hdmi-state-helper: Act on color format DRM
 property
Date: Wed, 19 Nov 2025 13:41:18 +0100
Message-ID: <7179523.lOV4Wx5bFT@workhorse>
In-Reply-To: <4wt5dbvseauo2bvi66ohtk445zsfjtpjwgvochwwlyk4uugcmy@5ubwtkxyy2ax>
References: <20251117-color-format-v4-0-0ded72bd1b00@collabora.com>
 <20251117-color-format-v4-7-0ded72bd1b00@collabora.com>
 <4wt5dbvseauo2bvi66ohtk445zsfjtpjwgvochwwlyk4uugcmy@5ubwtkxyy2ax>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_044209_948707_1DAEEBB1 
X-CRM114-Status: GOOD (  23.41  )
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

On Wednesday, 19 November 2025 10:09:12 Central European Standard Time Maxime Ripard wrote:
> Hi,
> 
> On Mon, Nov 17, 2025 at 08:11:51PM +0100, Nicolas Frattaroli wrote:
> > With the introduction of the "color format" DRM property, which allows
> > userspace to request a specific color format, the HDMI state helper
> > should implement this.
> > 
> > Implement it by checking whether the property is set and set to
> > something other than auto. If so, pass the requested color format, and
> > otherwise set RGB.
> > 
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > ---
> >  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> > index a561f124be99..add0d51fce33 100644
> > --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> > +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> > @@ -650,9 +650,15 @@ hdmi_compute_config(const struct drm_connector *connector,
> >  				       conn_state->max_bpc,
> >  				       8, connector->max_bpc);
> >  	int ret;
> > +	enum hdmi_colorspace hdmi_colorspace;
> > +
> > +	if (conn_state->color_format && conn_state->color_format != DRM_COLOR_FORMAT_AUTO)
> > +		hdmi_colorspace = color_format_to_hdmi_colorspace(conn_state->color_format);
> > +	else
> > +		hdmi_colorspace = HDMI_COLORSPACE_RGB;
> >  
> >  	ret = hdmi_compute_format_bpc(connector, conn_state, mode, max_bpc,
> > -				      HDMI_COLORSPACE_RGB);
> > +				      hdmi_colorspace);
> 
> I don't think we want the fallback to yuv420 for anything but auto, so

Okay. Changing all the non-hdmi-state-helper drivers (amdgpu, i915)
to do this as well would require some more work however, especially
in the case of amdgpu where the code flow is not always obvious.

> I'd rather have something like
> 
> if (conn_state->color_format != DRM_COLOR_FORMAT_AUTO)
>    return hdmi_compute_format_bpc(connector, conn_state, mode, max_bpc,
>                                   color_format_to_hdmi_colorspace(conn_state->color_format))
> 
> We'll also need unit tests.

Sure, am I guessing correctly that they'd go in
drm_hdmi_state_helper_test.c?

> Maxime
> 





