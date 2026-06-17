Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46ED3CD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 22:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ht3Y2gw7aLExBw+qb4CEwcLhztxh5KbxtMCsO7yS08=; b=IPJz1CNz8HgqX8F2ZBdD48n9CZ
	vr9QeDrLTZbDxfQ0EWv7tmdzK6t0eaOWDotUAOp2Dp7Xl2RODkiVGr7W5YQ9fYwBdnkEra5s/Shhj
	YAi5MUSDxkaGoyrfsQpga3JdhQz5JNSbZNb0NsVLLLNB2TZjKu/9D/J0IBNLAP7sxWZ48dwOFWCwd
	2IaBq8i3zLgEDHFikgTj3caYkPVahaaHqepJZWN8dk9GtOATo/ulNfodHy+bfUwpXaeMiXhkOSu5H
	2G+vGb/C9UIo5b6IDYo04Eov+BURorrBL+rnjeZbzKgHa1KICDhjFcXSaMXWt4XUGiTRYXXodLWTh
	DeD2EWuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZysa-00000000OyT-1TDy;
	Wed, 17 Jun 2026 22:37:04 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZys0-00000000Ox6-2ihg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 22:37:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781735789; x=1813271789;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xqYjUeV6vUJ0e8uDgzC+drVzHWfpAA3DVqnkox41OuM=;
  b=ZAUMVUllyGAZmYI2Aed6qFY86ovh5CUYUwF9hx7r19Hdvg5XDW8I+wKl
   S/5/M8TAH8szXRop344FwdKWYFDGPJvBcaNxRobdB7iAUulbI8dYlyoiz
   JTKeU5nwbG9k4vwYix1FP4OYPI7fPhF0VKKl1leoLa5z40D62YfUg0TL9
   b+hPgcCTnnNcamWCUQQmnVypunkpd292VX2SVyjQXqu2aXhDb6eTKPt9z
   i17CYDacnA06qiQhi0sl4gueeJf8mhLJfKDd1yWM/EnGSBqbtg0fmezgN
   UcXid4aKtvXxWp4RX42PCk8//n3ZsauprbnL6BuV4ygywuwBeLFSpxuRr
   g==;
X-CSE-ConnectionGUID: D0pUZ2lfSnSceYf3g0r5Dw==
X-CSE-MsgGUID: CYQ8vDFFStasiCS0gjTXCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="86399437"
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; 
   d="scan'208";a="86399437"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 15:36:27 -0700
X-CSE-ConnectionGUID: SPtzNDigSgO4NknRt6PRGw==
X-CSE-MsgGUID: wzISkg4lQyqkIxcyu5zSnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; 
   d="scan'208";a="248250158"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.232])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 15:36:22 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 0BB2811FAA5;
	Thu, 18 Jun 2026 01:36:20 +0300 (EEST)
Date: Thu, 18 Jun 2026 01:36:20 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Frank.Li@oss.nxp.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michael Riesch <michael.riesch@collabora.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Frank Li <Frank.Li@nxp.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Purism Kernel Team <kernel@puri.sm>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 2/8] media: v4l2-fwnode: Add common helper library for
 1-to-1 subdev registration
Message-ID: <ajMhZP5YHuQdhc5M@kekkonen.localdomain>
References: <20260617-imx8qxp_pcam-v5-0-7fa6c8e7fba7@nxp.com>
 <20260617-imx8qxp_pcam-v5-2-7fa6c8e7fba7@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260617-imx8qxp_pcam-v5-2-7fa6c8e7fba7@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_153628_734003_44D25AF2 
X-CRM114-Status: GOOD (  16.65  )
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

Hi Frank,

Thanks for the patch.

On Wed, Jun 17, 2026 at 03:50:12PM -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Many V4L2 subdev drivers implement the same registration and media pad
> setup logic for simple pipelines consisting of a single sink pad and a
> single source pad. As a result, the same boilerplate code is duplicated
> across multiple drivers.
> 
> Introduce a common helper library for 1-to-1 subdevs to encapsulate the
> registration, media entity initialization, and cleanup paths. Drivers
> can embed a struct v4l2_subdev_1to1 instance and use the provided helper
> APIs instead of open-coding the setup sequence.

I appreciate your efforts in trying to reduce the amount of code drivers
need simply to get things done but I think there are a few issues with the
approach taken in this patch:

- The new helpers aren't generic enough, but require two pads; one sink,
  one source. You could provide special helpers for just this case, but
  right now it looks like that if there's something you need that the
  helper assumes you don't, you can't use the helper at all. In other
  words, more modularity would be nice.

- The new helper should work with the existing types and not add new types
  (struct v4l2_subdev_1to1).

- There should be a way to provide default V4L2 fwnode endpoint
  configuration as well as to validate the obtained configuration.

I don't have a good proposal to address the above but at least one way I
can think of making error handling easier would be to use devm_() for
teardown in more places we to today. That certainly does have its own
issues though.

-- 
Kind regards,

Sakari Ailus

