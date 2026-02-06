Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFBF2EE20A6
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 15:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vqntc3mGZhsTFj2qn0IsTeoSdqqAdPY47w81CjtIRcU=; b=zHrVIfE0qVfXNMRZoOm7QXrBL1
	wfDnfJkyzcjFxrkOCTH95/0jkCiDoIxvchJKf5yO/Yf785mFi1tMl3FFTaHo8QGGF2KJk0k0FCwGc
	xNxdzVaEryN4gTRAkvNA+ReJdL4iuyoiKslxUK9wA2bnFW53a6pYVm8azrDND/OImhtXqNosVuIk1
	xe5UNtuZ+N0/zCe1PDe5/Xyq6ByT7jBXyFqrdQYHa2tUZWbhBGBWH5JG+MxYXBBHkYipVN2L07oZU
	ZDADNSZLcgGFYhBaIIoJSmnAOY8ZOTN6KRD2WH0WlekWdx2C947zF144Uk15B+kJSfOv3n7EIo/EJ
	6TuQGMfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voNkW-0000000BVN9-1DzR;
	Fri, 06 Feb 2026 15:28:00 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voNkT-0000000BVMg-2ZQL;
	Fri, 06 Feb 2026 15:27:59 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1770391628; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=a4h+OMbk0iyCauZRGyFmaHiVxh6Yugm4f32aGLbFhazNxk2AM6aEzKSFJrvmbCkDa1kHpArrcDG9eOr9eKpkJn9go19QxTKOfOKPavc5QP1VZYj/GcgVI6YH6osbBQ4tzee6Ic2DfhF+KQUDs1tmYsAkCdpua4wS0c2x/ZR4Zos=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1770391628; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=vqntc3mGZhsTFj2qn0IsTeoSdqqAdPY47w81CjtIRcU=; 
	b=WhmsIoXPknI/ZfuAJvjw/L+iIZm5YOJgtxfxsCHunsPD5aWHpevT5NdsNfEsw2dpwijkoc7oTtOsPAla8d0ob3+jULGNzZxNoS5vf9OI5QrhioFduAh/oLPT6249tPWOGt2YjRWyWFMe9duEZryJd/xA+ugNdJb9pJso95K6M50=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770391628;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=vqntc3mGZhsTFj2qn0IsTeoSdqqAdPY47w81CjtIRcU=;
	b=g1rsV09NZVeVjM8t7+ErxmMNzCf1eyjSqe3YVJSgOOy2VOoOdHNMsYj8XQqpHLWU
	3nZeRaIXnrlgW9G2ES7zouFMyDRjfDplLgvXSGV33v+UHedcPcFRcrdeC2lBx7/vEqB
	6+UL8ghWEGrqLdtKZUlfBYCyJY/EQ/LEvY4xFERo=
Received: by mx.zohomail.com with SMTPS id 1770391626411181.8997983206183;
	Fri, 6 Feb 2026 07:27:06 -0800 (PST)
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
 Tvrtko Ursulin <tursulin@ursulin.net>, Dmitry Baryshkov <lumag@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, kernel@collabora.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-doc@vger.kernel.org,
 Andri Yngvason <andri@yngvason.is>, Werner Sembach <wse@tuxedocomputers.com>,
 Marius Vlad <marius.vlad@collabora.com>
Subject: Re: [PATCH v7 02/22] drm: Add new general DRM property "color format"
Date: Fri, 06 Feb 2026 16:26:56 +0100
Message-ID: <6318997.lOV4Wx5bFT@workhorse>
In-Reply-To: <20260206-deft-provocative-perch-6ca9bf@houat>
References: <20260121-color-format-v7-0-ef790dae780c@collabora.com>
 <20260121-color-format-v7-2-ef790dae780c@collabora.com>
 <20260206-deft-provocative-perch-6ca9bf@houat>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_072757_739927_405613AC 
X-CRM114-Status: GOOD (  20.76  )
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

Hello,

On Friday, 6 February 2026 15:05:08 Central European Standard Time Maxime Ripard wrote:
> Hi,
> 
> On Wed, Jan 21, 2026 at 03:45:09PM +0100, Nicolas Frattaroli wrote:
> > diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> > index 7eaec37ae1c7..b5604dca728a 100644
> > --- a/include/drm/drm_connector.h
> > +++ b/include/drm/drm_connector.h
> > @@ -556,6 +556,16 @@ enum drm_colorspace {
> >  	DRM_MODE_COLORIMETRY_COUNT
> >  };
> >  
> > +enum drm_color_format {
> > +	DRM_COLOR_FORMAT_AUTO			= 0,
> > +	DRM_COLOR_FORMAT_RGB444			= BIT(0),
> > +	DRM_COLOR_FORMAT_YCBCR444		= BIT(1),
> > +	DRM_COLOR_FORMAT_YCBCR422		= BIT(2),
> > +	DRM_COLOR_FORMAT_YCBCR420		= BIT(3),
> > +};
> > +
> > +#define DRM_COLOR_FORMAT_COUNT 5
> > +
> 
> I don't really see a reason to expose an enum, with a bunch of values
> that are all mutually exclusive, as a bitmask. It's pretty inconsistent
> with most (all?) the other similar properties we have.
> 
> I appreciate you did that to avoid fixing up every driver using those
> values, but then maybe we don't have to? We could create a userspace
> facing enum, and convert to DRM_COLOR_FORMAT internally.

This is what the series did at v5 and earlier. IMHO it was kind of
counter-productive, because we then had two different things for the
same purpose, and some conversion logic between them. I think it's more
error prone to do it that way (think: mixing up the two), and doesn't
have a clear benefit. Just to give a picture of how bad things get:

1. we have the HDMI color format (aka "HDMI_COLORSPACE")
2. we have driver specific output color formats, e.g. the intel ones
3. we have DRM_COLOR_FORMAT
4. we have the bus formats (multiple per color format)
5. we have the DRM plane formats (again, multiple per color format)

Adding a sixth into the mix feels a bit bad because we'll then need to
justify why we should have another layer of switch-case statements.

Kind regards,
Nicolas Frattaroli

> 
> Maxime
> 





