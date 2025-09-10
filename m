Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2792CCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 14:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n2XG5G5idL1icWs5gdOF0RPGr8c47uMS45arCKqvExU=; b=VuVW1DDMvbTs19btuCThX5k0lx
	4fmVJPFMPhcH7Q949S/sGvEysjTqEtVOTV5qyjD2fo5dFCMWj7AsHtBKTWldDF97cUfMRf6u/UEgZ
	VlcEMcD8Hj22OZ/PGgJN6OzQexAl6lhmf9jCvxEMp2B/UuzL2e10rig1/SWEgD9EEljlKMlUwAWVy
	xMqJeFS2pTvzhM5faUju/Y4/YU9Qwhdg5PTyHUc6llu83tqSNYUv4l0Nq6TTTNSnLiqPg0nuETE3l
	RQp4DH7D9TPEZwliCmJlwqXetWlRJecFfbu5g4CZFM+vI2Ooy8KoSW//1HwD3UZsg8JtAy6w8h9ez
	LOtbj6Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwM2f-0000000EoSa-21vL;
	Wed, 10 Sep 2025 14:43:25 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwM2d-0000000EoQO-0LSn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 14:43:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757515403; x=1789051403;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZbY2B6yVl12t9+vakyT6Odcj14A3coWtEtGibMgyy5g=;
  b=CCPGji1F9oT0B6LikUGBH96xkK3hrwnC3Jj1A+dCgVGnwmKmwrcmRlmI
   1bA9CEEleVf1Yg8VAt24a7TITdJCj7oN+6O6RwgwwuH0FGIOEldCsm1P4
   Blx44OEPo85ORLxKc+chhoTw57jgbcKJe4oHu8xOyUWvIR5tkoLsnTJz7
   dz0gT6xFgoDYDNOD+Kd7c0JFr4LQhs1RZrNC4UrdKJGd2FVSkLpZo9Is2
   /YAKBUaxSAP5Erizc01t/2lUWgEO142fNnAm08kNgzcxKMZQGLqtSBZiP
   DP2gfA2BYPsVefKW1QAMlf6a9Weq+/i8eHf3fWucfwbYof1KjrQT9t6uZ
   g==;
X-CSE-ConnectionGUID: o5fICFjiQPSXO3WMMMo9Dw==
X-CSE-MsgGUID: SnhdscTIQB+nFL8b6Bd/mA==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="71248284"
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; 
   d="scan'208";a="71248284"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 07:43:21 -0700
X-CSE-ConnectionGUID: 8xOG4fZsS/Wlx1q+FywMXA==
X-CSE-MsgGUID: uILFlauiRmePsJvk6TcztA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; 
   d="scan'208";a="177742939"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.108])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 07:43:16 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id F09371201B4;
	Wed, 10 Sep 2025 17:43:12 +0300 (EEST)
Date: Wed, 10 Sep 2025 17:43:12 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v7 00/24] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
Message-ID: <aMGOgHzwig8NvxT-@kekkonen.localdomain>
References: <20250718152500.2656391-1-demonsingur@gmail.com>
 <aLBqxQQsnY3ZK4eT@kekkonen.localdomain>
 <d558ede0-5838-4a69-b25d-cafaa3b6cc97@gmail.com>
 <aMEgNtjcy1-NuBds@kekkonen.localdomain>
 <1b79e467-1d39-457f-a488-0f3eb9e14efc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1b79e467-1d39-457f-a488-0f3eb9e14efc@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_074323_193013_F15A3094 
X-CRM114-Status: GOOD (  24.28  )
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

Hi Cosmin,

On Wed, Sep 10, 2025 at 01:48:29PM +0300, Cosmin Tanislav wrote:
> 
> 
> On 9/10/25 9:52 AM, Sakari Ailus wrote:
> > Hi Cosmin,
> > 
> > On Thu, Sep 04, 2025 at 10:52:09AM +0300, Cosmin Tanislav wrote:
> > > Hi Sakari.
> > > 
> > > I recently left Analog Devices but I will continue to try upstreaming
> > > this driver. After the upstreaming is done we can switch the
> > > maintainer status to someone else.
> > 
> > Ack, thank you.
> > 
> > > 
> > > Here's the output for the commands you asked, provided by my
> > > ex-coworker. It's for MAX96716 + 2xMAX96717 + 2x IMX219.
> > > 
> > > Do we need to fix anything based on the compliance tests?
> > 
> > Looking at the errors, it looks like some fixing is needed, possibly also
> > on v4l2-compliance side.
> > 
> 
> I'll take a closer look at the failures whenever I get the time.
> 
> > Regarding GMSL, are the image width, height or mbus code used for anything
> > by the serialiser or deserialiser drivers?
> > 
> 
> No, not really. All the information needed by the GMSL drivers is
> provided through get_frame_desc() ops, and there's no fallback for the
> data type, so the stream format is not involved at all, but as far as I
> remember it's necessary to be set properly for the media pipeline to
> pass validation.

In earlier iterations of multi-stream support we've had link validation dig
this information up from the closest sub-device that supported get_fmt pad
op but that also made the assumption there would be no stream branching
taking place, which is not the case anymore.

I guess the most simple way to address this indeed would be to add the
formats to the streams, even if the driver doesn't need them. Also for
backwards compatiblity related reasons they are probably necessary -- the
older max9671* drivers did support them, too.

This would also address (most of?) the v4l2-compliance issues.

-- 
Kind regards,

Sakari Ailus

