Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F08CDC021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 14:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5UJlixiQvWHH//2sWCzg9aPzYNzJOS4BBglNIU7hn6o=; b=cjVP+gbXOIHiq9FbppmNgg92if
	PxNehmbzDTkOryN8C47JWatbJwXzW21QHrLAv/QD627W9MAxbVauWS31wKWF320fCGoKDDHTfE3Vu
	6xf7T/dN7NGbCqh1R3jh8w1apsZR/i4iCkldcMudcgwOHWkL3RLs2LqrQCF53ytFiqDkgcW40kMko
	3NpwNbfRIjkc2LP4eKjg/f4QIB0IcoZ28R4pCF1n24kbVT453/uNS9DuXsxoEfYrh6rz+uaDafYR1
	t/lqxxy7xbSHFWzVgOPf0oXprwNrXFFmlnr/Mbeh40Jyk3/D8LoisegYMMLmMqg91IIiKsq913u/1
	h7hhwEAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl7No-00000001GeN-04Ns;
	Thu, 20 Feb 2025 14:18:32 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl7MJ-00000001G9c-0cvx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 14:17:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740061019; x=1771597019;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=90sGWHgBiFWC8WmFaCJEHLODTZgic+HaEiiKAov7w4A=;
  b=ke62+k5iT3nUABtyLj1Eu2JDOvcH/eVtsvx4+Rz+bC5UvNiWlnzenmU6
   U0Xi+qxhc7ySX1QJwotH5qSDf0put+lS8XaW/+rCEKXY03F8rx5FiTsFo
   Yg5U4F9gnJsOG+U2WkKquWhArjxBBChDtCzuxrXTtvjbioo1y+qyQkYg1
   kQu8NpZggrUxw+4zJQ6thkTOtqu27KTKNnsOW2zQoApTF4s0TvdSaGNDr
   bCpIdAAD4IxanoXTZ3I6C8fC66CBf7C/sNhX2179l1WBrdQtDUQgi+S7a
   q367V8AHEA19BgXFXZg7T6RnwXljvVYAZSUKLnJKgE8zlEcQ1Yd3AvfK5
   A==;
X-CSE-ConnectionGUID: XALFkpV+RnW9h48b17RcYQ==
X-CSE-MsgGUID: Swq9aIpXSV6u2cagoA9yiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="28438586"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="28438586"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 06:16:58 -0800
X-CSE-ConnectionGUID: hq/WbzC4RBWGAxh3UZBwRw==
X-CSE-MsgGUID: xVSkBMrZR/qIo+idZR+y5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="119672464"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 06:16:54 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 649C911F7F2;
	Thu, 20 Feb 2025 16:16:51 +0200 (EET)
Date: Thu, 20 Feb 2025 14:16:51 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Umang Jain <umang.jain@ideasonboard.com>,
	=?utf-8?B?UGF3ZcWC?= Anikiel <panikiel@google.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/3] media: add v4l2_subdev_state_xlate_streams()
Message-ID: <Z7c5U6u5rr0-X0aK@kekkonen.localdomain>
References: <20250220092036.6757-1-demonsingur@gmail.com>
 <tw6x663t5dmxsdarrxjtopza3mou3lnhwazu3dfv2k27fv47v2@bvftfepqqhss>
 <c94580f0-3ab0-4a19-a996-9bb37e23dd39@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c94580f0-3ab0-4a19-a996-9bb37e23dd39@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_061659_199570_A61404C1 
X-CRM114-Status: GOOD (  32.83  )
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

On Thu, Feb 20, 2025 at 03:01:41PM +0200, Cosmin Tanislav wrote:
> 
> 
> On 2/20/25 1:38 PM, Jacopo Mondi wrote:
> > Hi Cosmin
> > 
> > On Thu, Feb 20, 2025 at 11:20:32AM +0200, Cosmin Tanislav wrote:
> > > Currently, the v4l2_subdev_state_xlate_streams() function is used
> > > to translate streams from one pad to another.
> > > This function takes the entire subdev state as argument, but only makes
> > > use of the routing.
> > 
> > Correct, but is this a problem ?
> > 
> 
> No, it's not a problem.

I think I have a slight preference to keep the pattern of referring to the
state as other functions do.

I wonder what Laurent and Hans think, too.

> 
> > Is this the first step for a larger rework or is this a drive-by
> > beautification ?
> > 
> 
> Mostly a drive-by beautification to avoid passing the whole state around
> where we only need the routing. I'm planning to submit drivers for more
> GMSL2/3 chips and we're using this just to not pass the whole state
> around. I think I can just use v4l2_subdev_state_xlate_streams(),
> but I had these patches in my tree and it would have been good to get
> them upstream, in preparations for submitting the GMSL2/3 drivers.
> 
> > I'm asking because (and I know it's hard to strike a balance) this
> > kind of changes tend to make back-porting a more painful, and if
> > only justified by "it looks better" I would be a bit hesitant in
> > taking them.
> > 
> > 
> > > 
> > > Introduce a v4l2_subdev_routing_xlate_streams() function which can be
> > > used without the entire subdev state, to avoid passing the entire state
> > > around when not needed.
> > > 
> > > Convert all usages of v4l2_subdev_state_xlate_streams() to
> > > v4l2_subdev_routing_xlate_streams().
> > > 
> > > Remove v4l2_subdev_state_xlate_streams().
> > > 
> > > V2:
> > >    * Fix description of parameters
> > > 
> > > Cosmin Tanislav (3):
> > >    media: v4l: subdev: add v4l2_subdev_routing_xlate_streams()
> > >    media: use v4l2_subdev_routing_xlate_streams()
> > >    media: v4l: subdev: remove v4l2_subdev_state_xlate_streams()
> > > 
> > >   drivers/media/i2c/ds90ub913.c                 | 14 ++++++-----
> > >   drivers/media/i2c/ds90ub953.c                 | 14 ++++++-----
> > >   drivers/media/i2c/max96714.c                  | 16 ++++++-------
> > >   drivers/media/i2c/max96717.c                  | 23 ++++++++++---------
> > >   drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 14 ++++++-----
> > >   .../platform/nxp/imx8-isi/imx8-isi-crossbar.c |  2 +-
> > >   drivers/media/v4l2-core/v4l2-subdev.c         |  7 +++---
> > >   include/media/v4l2-subdev.h                   | 10 ++++----
> > >   8 files changed, 53 insertions(+), 47 deletions(-)
> > > 
> > > --
> > > 2.48.1
> > > 
> > > 
> 

-- 
Regards,

Sakari Ailus

