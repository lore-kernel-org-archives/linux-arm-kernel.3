Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88CE4E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 10:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b6wYz82A6AGhsPXazi1Uvv0yx7+ounHuIllaP9TX9RI=; b=jw/siv4G5/Hy/tqHDdYy40pgWA
	SEJqTn3NJLbax4k/rSXvmhYCy3EMv4Vtc5gHNUxjwVvSZXaFbXsKqwbZE8az0I6ZnVC8dQMpHcjOO
	NxSoC7SPS22w6HyZSQP3gERPZiJS+Wh7/ZtBKi4EibsoOdRUYy9XfHcIem55W+/PxUWQqecEEZV0M
	TLdcnax9IZfbaM+UpsDI9u3Ul66x75JydWH2i6yUmAmF8uNEL0YroVuiceQohchtO8sh6dnP7k1rb
	yQNCgoksftTe3UJWEfSoRI2g5EVUo3Wn4wdIrX+pN/dJPWUpLrtBc00bRya/fJvDyavdCv8PPcy0t
	xRJQazaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWCPp-0000000Ez0A-2E5v;
	Fri, 10 Jan 2025 10:38:57 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWCOb-0000000EypL-0hae;
	Fri, 10 Jan 2025 10:37:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736505461; x=1768041461;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uJYOTl7B8MBckYkMtZtBQCm2Zvq1+VaHDB3X1GJcbn4=;
  b=mgu9wuE8pWHqk1MY8M00u3+XQ6BveZOPgRd8GdKg1xfOCkN/+3OhpvKV
   N+R3cdupYGZmGBdA+iBhuqPIJTGWC3WgxvmYSoLkiPMxpS8uE/u92eDZH
   OHO/+r3sM17EQWoDS05Xu8P7eQyyK4eBeiKWHHUgasVzP4eIsAttntO8E
   Rsq9S3MNdb8U9EyqdFiSmf69L5OK5P0BAkPUnst2X2Ok+dldnV29DSivH
   gSDb9NfdyRNcy1Q1QILIuED+Fm0dhj1j5j0rpKh3nEbLGJ5GrB+RDLoaS
   L4s95CabKK21NpYVsIfTP3rAIEtg2tmwD3/XJjj5eKEL7T6drKf9BFMXY
   w==;
X-CSE-ConnectionGUID: U7cp6CZlQRm19TfiQTBaTw==
X-CSE-MsgGUID: dLFgK8wSSZ+Zl5iwxChaNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="54212364"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="54212364"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 02:37:39 -0800
X-CSE-ConnectionGUID: D5SBEckiSJWrOsnWZFDHbw==
X-CSE-MsgGUID: 41rOFE7bRNOq5/uQEhoMqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="104256826"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 02:37:34 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 604EB12049D;
	Fri, 10 Jan 2025 12:37:31 +0200 (EET)
Date: Fri, 10 Jan 2025 10:37:31 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Michael Riesch <michael.riesch@wolfvision.net>
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Kever Yang <kever.yang@rock-chips.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Mehdi Djait <mehdi.djait@bootlin.com>,
	Gerald Loacker <gerald.loacker@wolfvision.net>
Subject: Re: [PATCH v2 4/6] media: rockchip: add a driver for the rockchip
 camera interface (cif)
Message-ID: <Z4D4a0GZ88sqc-rg@kekkonen.localdomain>
References: <20241217-v6-8-topic-rk3568-vicap-v2-0-b1d488fcc0d3@wolfvision.net>
 <20241217-v6-8-topic-rk3568-vicap-v2-4-b1d488fcc0d3@wolfvision.net>
 <Z3-f1SrrRjMnB-1C@kekkonen.localdomain>
 <561bef3e-2511-4741-9175-5c15239f9b1f@wolfvision.net>
 <Z4ACALOeioLroqmw@kekkonen.localdomain>
 <78fa589d-f9b6-41d8-bee5-766d0d1c3b17@wolfvision.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78fa589d-f9b6-41d8-bee5-766d0d1c3b17@wolfvision.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_023741_252602_83429FD3 
X-CRM114-Status: GOOD (  37.81  )
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

Hi Michael,

On Fri, Jan 10, 2025 at 10:12:29AM +0100, Michael Riesch wrote:
...
> >>>> +static int cif_stream_enum_framesizes(struct file *file, void *fh,
> >>>> +				      struct v4l2_frmsizeenum *fsize)
> >>>> +{
> >>>> +	struct cif_stream *stream = video_drvdata(file);
> >>>> +	struct v4l2_subdev_frame_size_enum fse = {
> >>>> +		.index = fsize->index,
> >>>> +		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
> >>>> +	};
> >>>> +	struct v4l2_subdev *sd = stream->remote->sd;
> >>>> +	const struct cif_output_fmt *fmt;
> >>>> +	int ret;
> >>>> +
> >>>> +	fmt = cif_stream_find_output_fmt(stream, fsize->pixel_format);
> >>>> +	if (!fmt)
> >>>> +		return -EINVAL;
> >>>> +
> >>>> +	fse.code = fmt->mbus_code;
> >>>> +
> >>>> +	ret = v4l2_subdev_call(sd, pad, enum_frame_size, NULL, &fse);
> >>>
> >>> You shouldn't get this information from the sensor driver but just convey
> >>> what this device supports.
> >>
> >> OK, but what does this device support? In principle, there is a
> >> continuous range of frame sizes up to a certain maximum size. But in
> >> practice, it depends on the subdevice as there is no scaler in the DVP
> >> path. Thus, every frame size but the one that the subdevice delivers
> >> will result in a broken stream?
> > 
> > Could you use CIF_MAX_WIDTH and CIF_MAX_HEIGHT?
> > 
> >>
> >> If this does not return the only possible frame size, is this callback
> >> useful at all?
> > 
> > In order not to configure an output size for the sensor that can't be
> > received by this block?
> 
> Right... Forgot about this case. This means user space needs to
> determine the possible frame sizes of each V4L2 device and subdevice in
> the pipeline and find a size that matches, right?

Correct.

Ideally this would be available on sub-device nodes, not video devices, but
I guess v4l2-compliance requires it on video devices.

> >> And would that apply to all the method and struct names in this driver
> >> or to the driver as well (location, file names)?
> >>
> >> The name has been discussed several times during the 13 iterations of
> >> the PX30 VIP series and I believe it changed from (cif//rkcif_) in
> >> downstream -> (vip//vip_) in Maximes work -> (cif/cif-/cif_) in Mehdis
> >> work, where the tuple is (driver directory/filename prefix/function and
> >> structs prefix).
> >>
> >> Hence I am a bit reluctant to change the naming convention yet again.
> >> That said, I'll be prepared to change it JUST ONE MORE TIME to any tuple
> >> you suggest -- but this really should be the end of the name bikeshedding.
> > 
> > I don't care about the internal naming but the global symbols. Using a
> > namespace is another option.
> > 
> 
> I would suggest the tuple (rkcif/rkcif-/rkcif_) then. This is in
> alignment with the Rockchip ISP driver (rkisp1/rkisp1-/rkisp1_).
> Unfortunately, the Rockchip RGA differs here (but with the tuple
> (rga/rga-/rga_) it uses the same prefix for everything at least).
> 
> There seems to be even less alignment when looking at other
> drivers/media/platform/ drivers, therefore I can only try to maximize
> the alignment within drivers/media/platform/rockchip/.
> 
> What do you think?

The rkcif prefix for anything global seems good to me.

-- 
Kind regards,

Sakari Ailus

