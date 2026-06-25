Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 377CCCDE002
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 07:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sDtG3awr190WQ1bwFXKig7vbdTxQsCK4ptbu5W8EcjQ=; b=SZupIOZYJ4yRrP4tZKwuaA0hHR
	DzSupvS/Smiszfxu4LYo9w61LbqBAlGMLbWt1GTGqPFfKWSQYoEBX861Te8lDjCMBkSIPCzqLW2ym
	2cW9C8SKi7+7yNHMgIgacjmJ7lpiBlsal8kuKA/jqs+HiZhTSjmhem0C1tw/3Ef7yLf96TSpJmCfA
	D2ZohVxdNUBP32K2JOYRcnWwRsAASTlJUptSh6PtSDhxSUL1ZJAyfDCEwFvU5klKG9CJ7xR1WD2hE
	B6ERUHGIrmeHQqendqItn+rNUad0ctS6d8z8d2IxeSgeaDZKyTgM6dKTm8mwdLGLaQBT2/m9RkT6Y
	LGcTcgZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wceUB-00000008lH2-3y9Q;
	Thu, 25 Jun 2026 07:26:55 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wceU9-00000008l3j-0tXE;
	Thu, 25 Jun 2026 07:26:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782372413; x=1813908413;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=h5ocJXXKpSTKpkJaGKhd2kaVYd35m9dsl6aoMK/+5oE=;
  b=gLZ4QLF1SpWkP3Hpt2WEU9FYoUks23b20CX3jnNNoSXztlbu1apfA6Q2
   xJOHkFWOKlop2tnSOv/EVO/iKulzU5qh7t6lVwA15vVj7Sdcu+le2Aepp
   4l8x3Be1GOfO6g+lL2bK8MQHCggd9+JzNtww9OfLeNYQrkCc6ZNh54W0b
   0DsTfYQB5DcQ1d79aYeoalJaP9xFN0Xc/oTdDip6tIsoCEC/+Bjjs6jh/
   Hiiczyr3sDxpRktF8iLyxNMdw8NwnL1wsZf8abAdbZtR2xJ3cDEgdf9Xp
   6Ywq1zjm5bJ3/sbxw9/KhI9hgSou1SHX4DEkxfKf9iv+OET7Sh439y+ht
   A==;
X-CSE-ConnectionGUID: fasjkrncTrufaUCF114JbQ==
X-CSE-MsgGUID: zg3clpDUTlGULfrTwuUq6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="86822206"
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; 
   d="scan'208";a="86822206"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 00:24:39 -0700
X-CSE-ConnectionGUID: hcztOcZrRiS2v4zjDIGV1g==
X-CSE-MsgGUID: OEXbgkZkRPSxlt5KzXGeSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; 
   d="scan'208";a="244045858"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.106])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 00:24:34 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id F407111FAA5;
	Thu, 25 Jun 2026 10:24:33 +0300 (EEST)
Date: Thu, 25 Jun 2026 10:24:33 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Frank Li <Frank.li@oss.nxp.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
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
Message-ID: <ajzXsacric_2fvGh@kekkonen.localdomain>
References: <20260624-fw_scoped-v2-0-0a8db472af4a@nxp.com>
 <20260624191935.GG851255@killaraus.ideasonboard.com>
 <ajwxcn2LXS8InAjZ@SMW015318>
 <20260624200237.GJ851255@killaraus.ideasonboard.com>
 <ajxCOE3avXXLlrfT@SMW015318>
 <20260624222042.GN851255@killaraus.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260624222042.GN851255@killaraus.ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_002653_294045_40F8FFB4 
X-CRM114-Status: GOOD (  31.41  )
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

Hi Laurent,

On Thu, Jun 25, 2026 at 01:20:42AM +0300, Laurent Pinchart wrote:
> On Wed, Jun 24, 2026 at 03:46:48PM -0500, Frank Li wrote:
> > On Wed, Jun 24, 2026 at 11:02:37PM +0300, Laurent Pinchart wrote:
> > > On Wed, Jun 24, 2026 at 02:35:14PM -0500, Frank Li wrote:
> > > > On Wed, Jun 24, 2026 at 10:19:35PM +0300, Laurent Pinchart wrote:
> > > > > On Wed, Jun 24, 2026 at 01:00:08PM -0400, Frank.Li@oss.nxp.com wrote:
> > > > > > Add new helper macro fwnode_graph_for_each_endpoint_scoped() and use it
> > > > > > simplify media code.
> > > > > >
> > > > > > Typical example should qualcomm's driver (camss.c), the v4l2_mc.c and
> > > > > > rkisp1-dev.c only silience improvement.
> > > > > >
> > > > > > Anyways, *_for_each_*_scoped() already use widely and make code clean.
> > > > > >
> > > > > > Build test only.
> > > > > >
> > > > > > Sakari Ailus:
> > > > > > 	when I try to improve the patch
> > > > > > "Add common helper library for 1-to-1 subdev registration", I found need
> > > > > > camss.c pattern, so I create this small improvement firstly.
> > > > >
> > > > > Those are nice cleanups, thank you.
> > > > >
> > > > > After applying this series, the only left users of the
> > > > > fwnode_graph_for_each_endpoint() macro are in drivers/base/property.c.
> > > >
> > > > I already checked previously, two place use it.
> > > >
> > > > fwnode_graph_get_endpoint_count(), it will go though all endpoints, last
> > > > ep is NULL, which totally equial to scoped() version.
> > > >
> > > > another one fwnode_graph_get_endpoint_by_id(), which return ep, expect
> > > > caller to call put().
> > > >
> > > > if use scoped() version, need use no_free_ptr() at return, which make think
> > > > a little bit complex.
> > >
> > > It would introduce a tiny bit of extra complexity there, but the
> > > advantage (in my opinion) is that we'll be able to remove the less safe
> > > fwnode_graph_for_each_endpoint() macro.
> > >
> > > Now one may argue that the risk of
> > > fwnode_graph_for_each_endpoint_scoped() is returning the iterator
> > > without using no_free_ptr(). I wonder if that would be easier to catch
> > > in static analysis tools than the current pattern that leaks a reference
> > > when exiting the loop early.
> > 
> > It's not big deal, if everyone prefer drop fwnode_graph_for_each_endpoint(),
> > I can do it.
> 
> Let's see what others think. If people prefer keeping both versions,
> I'll be OK with that.

I'd prefer to keep both: it depends on the use case which one is better. 

-- 
Kind regards,

Sakari Ailus

