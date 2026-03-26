Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4125910A3D90
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 12:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OSUVDXD78sWOEkX0slW7O4nHOQ6IXLnzNINhSsFAGtY=; b=cHME7Xb22jy7f6HTbg/Wg5Kj2N
	dm+kL4ZGd+Nak4UQbqMcvMm6Ted8nQyyriDkRno32jeSxnvc5lXYy/GH/dA6vHk2n77IWjdwDCpQe
	7FsBCqo0iKQ3eCNb5LngZgtCw2JjoH9YKvfcBjzir5G509+63790amUy3Fv4Z6E/uaGS3c4+Yvlfd
	ycVDJdSfw3WiAE9B1WTYlKbYrAv1dzWold5JRMP1Z1fRQdmQVV5WHKKZQ4GMLwySzW/tVpMfyjAdB
	ZKAKdmcam5H2w+DpfW36m3ckuUAKYn44jJ4IVhi2s3lkSBFPzXBcnTbuRG0w6KgJ41wMgEz0AflRI
	WYiOAD5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5k59-00000005U2I-0l6r;
	Thu, 26 Mar 2026 12:45:03 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5k56-00000005U1Q-464Z;
	Thu, 26 Mar 2026 12:45:02 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1774529053; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TrSl20mrUhKyAwSXH2BaofiS0davnhwOsaaehOkLoDjd9JFhoAYUnqCWKl0QKQ2wsBqpKPLhvhjZXyJTPNDiuY2itsmIhCckU3x2D/uBfHH8MYDFQwu2Pebf1X6ifySejIm5wsUmBt7OLNzpg/4rdlX3j+mGlsnnhOymgXTffpg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774529053; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=OSUVDXD78sWOEkX0slW7O4nHOQ6IXLnzNINhSsFAGtY=; 
	b=QK+BnGQA8xy5e9I/cvAEWOHb1kxy1C4UMhE1KpvhUmyQvQmsffJFfTPPhRjhrdDlBFp5vVvH9VcFQ+XOOqUON/YJdwCVMxmxBwjxW9rNgbjywmc8Fi0pPM9Yd2vBL690vGQhLAghN7zpBsqnCPFSzXu1t3Ftbx0yfHna3UK/z9s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774529053;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=OSUVDXD78sWOEkX0slW7O4nHOQ6IXLnzNINhSsFAGtY=;
	b=HE7C1XM3iXSRiRwRbApiPEPrRuM6tf7GC+GF6Rwt6hqib8I7pA76ZlBeRC1D4DZj
	p9goFEYEyL1BQ0PLGrp+r7mIWKiLXMEeZyn3zUHC+/tyIDgsSVUPJ1xRV+6PjbxlJIa
	MJ3DjTeTgDymmOCoGMwNmD+9Z1wXSfcxD5Aws358=
Received: by mx.zohomail.com with SMTPS id 1774529052171601.5959355004869;
	Thu, 26 Mar 2026 05:44:12 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Maxime Ripard <mripard@kernel.org>,
 Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
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
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 kernel@collabora.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-doc@vger.kernel.org, Werner Sembach <wse@tuxedocomputers.com>,
 Andri Yngvason <andri@yngvason.is>, Marius Vlad <marius.vlad@collabora.com>
Subject: Re: [PATCH v11 03/22] drm: Add new general DRM property "color format"
Date: Thu, 26 Mar 2026 13:44:03 +0100
Message-ID: <3979783.tdWV9SEqCh@workhorse>
In-Reply-To: <acPA60Ci3n_t__xF@intel.com>
References: <20260324-color-format-v11-0-605559af4fb4@collabora.com>
 <20260325-neat-elegant-raven-ebc9ab@houat> <acPA60Ci3n_t__xF@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_054501_104958_A74400EB 
X-CRM114-Status: GOOD (  43.48  )
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

On Wednesday, 25 March 2026 12:03:07 Central European Standard Time Ville S=
yrj=C3=A4l=C3=A4 wrote:
> On Wed, Mar 25, 2026 at 09:24:27AM +0100, Maxime Ripard wrote:
> > On Tue, Mar 24, 2026 at 09:53:35PM +0200, Ville Syrj=C3=A4l=C3=A4 wrote:
> > > On Tue, Mar 24, 2026 at 08:10:11PM +0100, Nicolas Frattaroli wrote:
> > > > On Tuesday, 24 March 2026 18:00:45 Central European Standard Time V=
ille Syrj=C3=A4l=C3=A4 wrote:
> > > > > On Tue, Mar 24, 2026 at 05:01:07PM +0100, Nicolas Frattaroli wrot=
e:
> > > > > > +enum drm_connector_color_format {
> > > > > > +	/**
> > > > > > +	 * @DRM_CONNECTOR_COLOR_FORMAT_AUTO: The driver or display pr=
otocol
> > > > > > +	 * helpers should pick a suitable color format. All implement=
ations of a
> > > > > > +	 * specific display protocol must behave the same way with "A=
UTO", but
> > > > > > +	 * different display protocols do not necessarily have the sa=
me "AUTO"
> > > > > > +	 * semantics.
> > > > > > +	 *
> > > > > > +	 * For HDMI, "AUTO" picks RGB, but falls back to YCbCr 4:2:0 =
if the
> > > > > > +	 * bandwidth required for full-scale RGB is not available, or=
 the mode
> > > > > > +	 * is YCbCr 4:2:0-only, as long as the mode and output both s=
upport
> > > > > > +	 * YCbCr 4:2:0.
> > > > > > +	 *
> > > > > > +	 * For display protocols other than HDMI, the recursive bridg=
e chain
> > > > > > +	 * format selection picks the first chain of bridge formats t=
hat works,
> > > > > > +	 * as has already been the case before the introduction of th=
e "color
> > > > > > +	 * format" property. Non-HDMI bridges should therefore either=
 sort their
> > > > > > +	 * bus output formats by preference, or agree on a unified au=
to format
> > > > > > +	 * selection logic that's implemented in a common state helpe=
r (like
> > > > > > +	 * how HDMI does it).
> > > > > > +	 */
> > > > > > +	DRM_CONNECTOR_COLOR_FORMAT_AUTO =3D 0,
> > > > > > +
> > > > > > +	/**
> > > > > > +	 * @DRM_CONNECTOR_COLOR_FORMAT_RGB444: RGB output format
> > > > > > +	 */
> > > > > > +	DRM_CONNECTOR_COLOR_FORMAT_RGB444,
> > > > > > +
> > > > > > +	/**
> > > > > > +	 * @DRM_CONNECTOR_COLOR_FORMAT_YCBCR444: YCbCr 4:4:4 output f=
ormat (ie.
> > > > > > +	 * not subsampled)
> > > > > > +	 */
> > > > > > +	DRM_CONNECTOR_COLOR_FORMAT_YCBCR444,
> > > > > > +
> > > > > > +	/**
> > > > > > +	 * @DRM_CONNECTOR_COLOR_FORMAT_YCBCR422: YCbCr 4:2:2 output f=
ormat (ie.
> > > > > > +	 * with horizontal subsampling)
> > > > > > +	 */
> > > > > > +	DRM_CONNECTOR_COLOR_FORMAT_YCBCR422,
> > > > > > +
> > > > > > +	/**
> > > > > > +	 * @DRM_CONNECTOR_COLOR_FORMAT_YCBCR420: YCbCr 4:2:0 output f=
ormat (ie.
> > > > > > +	 * with horizontal and vertical subsampling)
> > > > > > +	 */
> > > > > > +	DRM_CONNECTOR_COLOR_FORMAT_YCBCR420,
> > > > >=20
> > > > > Seems like this should document what the quantization range
> > > > > should be for each format.
> > > > >=20
> > > >=20
> > > > I don't think so? If you want per-component bit depth values,
> > > > DRM_FORMAT_* defines would be the appropriate values to use. This
> > > > enum is more abstract than that, and is there to communicate
> > > > YUV vs. RGB and chroma subsampling, with bit depth being handled
> > > > by other properties.
> > > >=20
> > > > If you mean the factor used for subsampling, then that'd only be
> > > > relevant if YCBCR410 was supported where one chroma plane isn't
> > > > halved but quartered in resolution. I suspect 4:1:0 will never
> > > > be added; no digital display protocol standard supports it to my
> > > > knowledge, and hopefully none ever will.
> > >=20
> > > No, I mean the quantization range (16-235 vs. 0-255 etc).
> > >=20
> > > The i915 behaviour is that YCbCr is always limited range,
> > > RGB can either be full or limited range depending on the=20
> > > "Broadcast RGB" property and other related factors.
> >=20
> > So far the HDMI state has both the format and quantization range as
> > different fields. I'm not sure we need to document the range in the
> > format field, maybe only mention it's not part of the format but has a
> > field of its own?
>=20
> I think we only have it for RGB (on some drivers only?). For YCbCr
> I think the assumption is limited range everywhere.
>=20
> But I'm not really concerned about documenting struct members.
> What I'm talking about is the *uapi* docs. Surely userspace
> will want to know what the new property actually does so the
> uapi needs to be documented properly. And down the line some
> new driver might also implement the wrong behaviour if there
> is no clear specification.
>=20
> So I'm thinking (or perhaps hoping) the rule might be something like:
> - YCbCr limited range=20
> - RGB full range if "Broadcast RGB" property is not present
> - RGB full or limited range based on the "Broadcast RGB" property
>   if it's present
>=20
> I think the "Broadcast RGB" property itself might also be lacking
> proper uapi docs, so that may need to be remedied as well.
>=20
>=20

Alright, so in v12 I'll do the following:

=2D Add a line to all YCBCR connector formats that specifies they're
  limited range as long as Broadcast RGB is limited. Whether it's limited
  range when Broadcast RGB is full is purposefully left undefined.
  In the future, we can expand this to state they're limited range by
  default unless some other property is set. If we're not re-using
  Broadcast RGB for that, this will work out fine, because users who
  don't know about the eventual new property won't have this behaviour
  changed. If we do re-use "Broadcast RGB" for that, then only users
  relying on things we explicitly left undefined will get surprise
  full range YCBCR.
=2D Add a line to the RGB connector format that specifies its range
  depends on the "Broadcast RGB" property

This is a bit of a mess, because it's entirely reasonable that a
future YCBCR range property would want to default to full range
so that users get the most color out of their monitors. But with
this description of the connector color formats, we can't do that.

If there are alternate suggestions, I'm open for them. We can't
really rename "Broadcast RGB" but if I had a time machine, that'd
be my first choice.

Kind regards,
Nicolas Frattaroli



