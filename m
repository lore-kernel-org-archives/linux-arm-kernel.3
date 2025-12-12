Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98B41D59D93
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 20:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/6wtxehS7WTM819be29IyrSvXjiAjsvtwp328K/5dyE=; b=Ko9bdMnaNopD20Vd/ppPvVa0b4
	WlAtEDm0G1seOVEQXZ1EXAqFfDhEPiq/2TyO7XXSOptyV60RbudIqOfZHuESKPrXDkNpTeHzz+gGT
	h6BmMH2sAAmKuFJBIV+aQz0BqS2TafiiJNrPv5vqncneYFrazJsHb28PAGA+mT7Pfyt2s2VDd1a+i
	fLoIrR66k+r+Y4OAkOjUYCrfmVvpbZcQQoNP3jXltl3fQGfHeAKn6oddfvAlgyskiIruzob9CYSLv
	CgK3bUl4eU5VKIOsg6tDunJCRW/aninRTBZLD39jc8TmVNOkGby754A+pd3cPua4uV7Ihphy2nxR3
	8P/JZK4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU9l0-00000001358-1Lkw;
	Fri, 12 Dec 2025 20:28:54 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU9kw-0000000134W-0vKT;
	Fri, 12 Dec 2025 20:28:51 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1765571294; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fFRjIgit+mkRtNRzhjFrfhRSb8VO8oIGYuX4Zl+izffCfsivomL/CFcO9vSPa8ySP2Ued8YffgB9jlYeXrCQhK9Sl+GSMC6XGOZk5O36G02MxosPrtW+hhOHs9DwxZcv3/hEaJVcOVq9xXoPjPKhjveANP3TQ/U9NpP2FhvEixc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1765571294; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=/6wtxehS7WTM819be29IyrSvXjiAjsvtwp328K/5dyE=; 
	b=GIisIJXPPKFhGb7HUjAxu0dA0b1LzsAfH8lbuzmBfEQXBWTp9MmUCnN3pYq+fTobweK6MW4IVdezVYa+KuzLW8a5H51x90a1VUP3tle64VKSe9l7LLXMu+esj8w5+LP9R6066RPyHyubV+QE7H54o5gWT7w8sYzlnoSTF5KsEik=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765571294;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=/6wtxehS7WTM819be29IyrSvXjiAjsvtwp328K/5dyE=;
	b=NSkxtuBZAgOYDD1SWdW3CbJLkPBSn9LktHM+iaPP52B0GtTM2371Z2ZBhWyygclw
	nrPtg2pNbaGin1WmV8fJyEwsv7lpaCPpBKEY2LrYw3r6gE3ENS/B/e7z1i4EgxCyNsN
	zBP1iyXGrERb+8M/60yYMuZt7+eu94uVO4woCk9I=
Received: by mx.zohomail.com with SMTPS id 1765571293146567.238599758411;
	Fri, 12 Dec 2025 12:28:13 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Maxime Ripard <mripard@kernel.org>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
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
 kernel@collabora.com, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v5 17/17] drm/tests: hdmi: Add tests for the color_format property
Date: Fri, 12 Dec 2025 21:28:03 +0100
Message-ID: <2819485.tdWV9SEqCh@workhorse>
In-Reply-To: <20251212-discreet-wisteria-perch-edccad@penduick>
References: <20251128-color-format-v5-0-63e82f1db1e1@collabora.com>
 <20251128-color-format-v5-17-63e82f1db1e1@collabora.com>
 <20251212-discreet-wisteria-perch-edccad@penduick>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_122850_297373_FEA838B0 
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

On Friday, 12 December 2025 10:19:13 Central European Standard Time Maxime Ripard wrote:
> On Fri, Nov 28, 2025 at 10:05:53PM +0100, Nicolas Frattaroli wrote:
> > Add some KUnit tests to check the color_format property is working as
> > expected with the HDMI state helper.
> > 
> > The added tests check that AUTO results in RGB, and the YCBCR modes
> > result in the corresponding YUV modes. An additional test ensures that
> > only DRM_COLOR_FORMAT_AUTO falls back to YUV420 with a YUV420-only mode,
> > and RGB errors out instead, while explicitly asking for YUV420 still
> > works.
> > 
> > This requires exporting hdmi_compute_config, so that it is accessible
> > from the tests.
> > 
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > ---
> >  drivers/gpu/drm/display/drm_hdmi_state_helper.c    |   3 +-
> >  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 109 +++++++++++++++++++++
> >  include/drm/display/drm_hdmi_state_helper.h        |   4 +
> >  3 files changed, 115 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> > index 1800e00b30c5..e86fb837ceaf 100644
> > --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> > +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> > @@ -641,7 +641,7 @@ hdmi_compute_format_bpc(const struct drm_connector *connector,
> >  	return -EINVAL;
> >  }
> >  
> > -static int
> > +int
> >  hdmi_compute_config(const struct drm_connector *connector,
> >  		    struct drm_connector_state *conn_state,
> >  		    const struct drm_display_mode *mode)
> > @@ -680,6 +680,7 @@ hdmi_compute_config(const struct drm_connector *connector,
> >  
> >  	return ret;
> >  }
> > +EXPORT_SYMBOL(hdmi_compute_config);
> 
> I don't think we need to export hdmi_compute_config directly, and if we
> do, it shouldn't be named that way.
> 
> The rest of the tests in the suite manage to test everything fine
> without exporting it. Is there any reason you can't do it for these
> tests?

The only function that calls hdmi_compute_config is the exported
drm_atomic_helper_connector_hdmi_check. While I can write tests around
drm_atomic_helper_connector_hdmi_check, it'll mean I'll have structure
the tests differently, and will accidentally test a lot of other things
as well, because it derives other state from the config and has a lot
more error paths. So checking that hdmi_compute_config fails as expected
won't be possible anymore, just that "_connector_hdmi_check fails.

I will rewrite the tests to do this since that appears to be the way
to do this, but I'll need to read up on the atomic state APIs and the
helper functions I've been using so far a bit to make sure I'm not
writing something broken here.

I do share your concerns about exporting this function though, I didn't
like doing it either. It is a side effect of unit testing not being a
first-class citizen of the C language I guess, but maybe it is better
to do this as an end-to-end test of the exported function rather than
just part of the implementation anyway.

> [...]

For everything I didn't directly reply to, assume I'll address it in
the next revision with no further sobbing to convey from my side.

Kind regards,
Nicolas Frattaroli



