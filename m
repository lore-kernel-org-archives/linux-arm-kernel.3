Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F363CDE006
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 06:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WDB3oUwoJ3pfq9nKJ4nI2lJjAnSo9Z0oIEmE0HBjJDI=; b=l8+gvvi5CVvWrH6gESygg7T04I
	sH3fm43vDK3pfIQTvKx+yQCoTrt1ir3+c2tximKGKmOzVLvIq7usmvCXyGwKVEZiqKkTgMFvbM2jq
	13Nbbqwk/gM39kDcereT3WAb7+zH5l7DOcVY7Xm8rC4S/ccrCvtNLoecDr47wOVFoxqIpedQOJgyb
	RysT3wePeYN1Gvu6oMa6tD/A8spX561i6Bdn9VOG9qzW20VLxqff58O1Ztk+E4JA3eHK+nuB25ATn
	J0mDDdxNrPF/3XQaxPT1iY0+02Ie+Gn9eh1xUrI7IukytpeuS3dRdrD3WAy/Euff9k1sMxfouVG0U
	yNQioH5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcdcW-00000008hnl-2qWh;
	Thu, 25 Jun 2026 06:31:28 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcdcT-00000008hnH-1urQ;
	Thu, 25 Jun 2026 06:31:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782369085; x=1813905085;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fwGnL97xmgeZIlcEfXqmDIbjqKBgP8CglQlDHEXM+X8=;
  b=IZXx2CrfqRQlWmMoRl/68uIy1waVxcbR+M0FP5cR8j9l0G/QFdpS8XM7
   K41Q+7arzCjMtD+/j3LlktrhjNClIjFj9Lnx8oBCERKsM7tlQ4AZbnrhR
   cK6HGwEn5lPRyzkh6R6QGhUptzYCLUpP1hnyBW1q3+j0hIQ6It9sVO4tX
   CxZMKaaMiKLgWXuni5YZoZfupsaAS+em7MZWZwp0eA9pIK/U45kDNFNhx
   +eGnYo6SI7kCC/yrCuSEB24vS4N3VvYfwS6nr8ThgJSf1nJC1ePo+1okd
   MHIXFXk3pNSzOofCI8amLzXTvJVeodJNT7HwlYTf6MAzUm5d9H0kCnVDo
   w==;
X-CSE-ConnectionGUID: DqIqg32FQD+LaZCdgowwHg==
X-CSE-MsgGUID: 0h/dUAn6SYKiY1HQrAKgEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="87046026"
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; 
   d="scan'208";a="87046026"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 23:31:21 -0700
X-CSE-ConnectionGUID: slld4H3rR16nX4qt4wrK0A==
X-CSE-MsgGUID: LScKLZpATE+psYxu0HB+Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; 
   d="scan'208";a="252343530"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.93])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 23:31:16 -0700
Date: Thu, 25 Jun 2026 09:31:14 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	driver-core@lists.linux.dev, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	imx@lists.linux.dev, Guoniu Zhou <guoniu.zhou@nxp.com>,
	Frank Li <Frank.Li@nxp.com>, Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Subject: Re: [PATCH v2 0/4] media: add and use
 fwnode_graph_for_each_endpoint_scoped()
Message-ID: <ajzLMiKrlXf2hFRd@ashevche-desk.local>
References: <20260624-fw_scoped-v2-0-0a8db472af4a@nxp.com>
 <20260624191935.GG851255@killaraus.ideasonboard.com>
 <ajwxcn2LXS8InAjZ@SMW015318>
 <20260624200237.GJ851255@killaraus.ideasonboard.com>
 <ajxCOE3avXXLlrfT@SMW015318>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ajxCOE3avXXLlrfT@SMW015318>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_233125_540677_DB200C66 
X-CRM114-Status: GOOD (  31.46  )
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

On Wed, Jun 24, 2026 at 03:46:48PM -0500, Frank Li wrote:
> On Wed, Jun 24, 2026 at 11:02:37PM +0300, Laurent Pinchart wrote:
> > On Wed, Jun 24, 2026 at 02:35:14PM -0500, Frank Li wrote:
> > > On Wed, Jun 24, 2026 at 10:19:35PM +0300, Laurent Pinchart wrote:
> > > > On Wed, Jun 24, 2026 at 01:00:08PM -0400, Frank.Li@oss.nxp.com wrote:
> > > > > Add new helper macro fwnode_graph_for_each_endpoint_scoped() and use it
> > > > > simplify media code.
> > > > >
> > > > > Typical example should qualcomm's driver (camss.c), the v4l2_mc.c and
> > > > > rkisp1-dev.c only silience improvement.
> > > > >
> > > > > Anyways, *_for_each_*_scoped() already use widely and make code clean.
> > > > >
> > > > > Build test only.
> > > > >
> > > > > Sakari Ailus:
> > > > > 	when I try to improve the patch
> > > > > "Add common helper library for 1-to-1 subdev registration", I found need
> > > > > camss.c pattern, so I create this small improvement firstly.
> > > >
> > > > Those are nice cleanups, thank you.
> > > >
> > > > After applying this series, the only left users of the
> > > > fwnode_graph_for_each_endpoint() macro are in drivers/base/property.c.
> > >
> > > I already checked previously, two place use it.
> > >
> > > fwnode_graph_get_endpoint_count(), it will go though all endpoints, last
> > > ep is NULL, which totally equial to scoped() version.
> > >
> > > another one fwnode_graph_get_endpoint_by_id(), which return ep, expect
> > > caller to call put().
> > >
> > > if use scoped() version, need use no_free_ptr() at return, which make think
> > > a little bit complex.
> >
> > It would introduce a tiny bit of extra complexity there, but the
> > advantage (in my opinion) is that we'll be able to remove the less safe
> > fwnode_graph_for_each_endpoint() macro.
> >
> > Now one may argue that the risk of
> > fwnode_graph_for_each_endpoint_scoped() is returning the iterator
> > without using no_free_ptr(). I wonder if that would be easier to catch
> > in static analysis tools than the current pattern that leaks a reference
> > when exiting the loop early.
> 
> It's not big deal, if everyone prefer drop fwnode_graph_for_each_endpoint(),
> I can do it.

I slightly tend to the safest option (see below), but as a compromise I can
suggest to inline the fwnode_graph_for_each_endpoint() into that single user
that doesn't need a put. However, this may uglify the code and rise a question
of the consistency. So, consider that suggestion with grain of salt and apply
only if we have wider agreement with it.

> > > It'd better leave these as it.

TL;DR:
This is the safest option, of course. And as mentioned above I slightly
prefer this way. Another argument is that in some cases we might want to
have it in the future and since we have an existing user, let it live.

-- 
With Best Regards,
Andy Shevchenko



