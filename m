Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEA93CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 11:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0992u7vgICnO1NdsO/eTd/pHfpQZSJGYyWihgfFSCww=; b=ox0aFk79yxdVSwxQrUB0ZTv7aA
	2OyiYjRjMjlhwqytxce6um/TmGVYMvWXPa/nA1hkCUlM272Aea550kw1Ld8hrRl6uBGOKivmh9s3C
	aenPqwFjqteElNTU/dyinqQHoHBlFd1wuUyMeB4YQYK9XE/ajBWeYOwd/PvPCgx9pYMGuAxY9/0B5
	0cv+F8I0ZFU4gl0cz11w/WhbDUN5C/ylvxzDTM4+GVTjKd2Htcw6S6tkeKD2XLbgcV/dbz69pRoiA
	cq5qiJpenXZmYTBa2Y7zWR1HRFDW0bEzHOqIGqRH9OAI4t3ODpDxP7pg6tTzAdSKoCpqEfSXSXuCX
	x7LgKMzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8zy3-00000001T3A-29LZ;
	Wed, 15 Oct 2025 11:46:55 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8zy0-00000001T2h-23cd;
	Wed, 15 Oct 2025 11:46:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760528813; x=1792064813;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0992u7vgICnO1NdsO/eTd/pHfpQZSJGYyWihgfFSCww=;
  b=XPzj8Z/eT7o4GGeCHal6La38H/Xp62ANMlPoVduHEUhC8taARBMqGQkj
   V13C6pMCwJ1dN2A06ZK+yqSUe0Vq0C+twblTgyFbozYPOae7an36WeyCi
   l5nIr2hZB18QTAYFDOhxp5PlRU9MAFJSVPZbS/vhM3PjqR30zZvggDKOf
   CJZnzmiCeFnfiVS4cp8unID5aUkngo8zU23NzyNta46DwlNBwmmnUzIOd
   7Z7JV9DJwSNhFr8k+Z+zbP50OgK//VpIBcoyUxX9k+fVfB9FBhhOEoLBw
   y1BDfM78qfJG74NtHerhkXLqDuAbOQe5ig+NYRxLdOqBADGJii0GNW6gR
   g==;
X-CSE-ConnectionGUID: nidxLn5RS1SEx9PJZ4iUkA==
X-CSE-MsgGUID: 4zl0qkPWSJaN3H5akIOYdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="73804167"
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; 
   d="scan'208";a="73804167"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 04:46:52 -0700
X-CSE-ConnectionGUID: 0qrU/XBMSn6HNPStha/rVg==
X-CSE-MsgGUID: 3FOlRQVPSq+vzNyDn9U/wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; 
   d="scan'208";a="181706203"
Received: from rvuia-mobl.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.114])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 04:46:45 -0700
Date: Wed, 15 Oct 2025 13:46:37 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: michael.riesch@collabora.com
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	=?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Gerald Loacker <gerald.loacker@wolfvision.net>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Markus Elfring <Markus.Elfring@web.de>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Kever Yang <kever.yang@rock-chips.com>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Collabora Kernel Team <kernel@collabora.com>, Paul Kocialkowski <paulk@sys-base.io>, 
	Alexander Shiyan <eagle.alexander923@gmail.com>, Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	Mehdi Djait <mehdi.djait@bootlin.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Bryan O'Donoghue <bod@kernel.org>
Subject: Re: [PATCH v12 00/18] media: rockchip: add a driver for the rockchip
 camera interface
Message-ID: <idp5tujavppw6ng5sl4e6ffdtzogbnw4rdadytbt5iaxsdhfyg@rs7fq5fawluh>
References: <20240220-rk3568-vicap-v12-0-c6dbece6bb98@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240220-rk3568-vicap-v12-0-c6dbece6bb98@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_044652_592296_123ADABE 
X-CRM114-Status: UNSURE (   9.96  )
X-CRM114-Notice: Please train this message.
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

On Tue, Oct 14, 2025 at 03:01:46PM +0200, Michael Riesch via B4 Relay wrote:

[..]

> Changes in v12:
> - added Radxa Camera 8M device tree overlay
> - rebased onto v6.18-rc1
> - fixed IOMMU pagefaults caused by wrong VLW (Mehdi)

Yes, I confirm it is fixed :)

Thank you for working on this!

> - fixed indentation of register defines in -regs.h (Sakari)
> - renamed CSI-2 receiver interrupts (Rob)
> - added MEDIA_BUS_TYPE_* as comments in DT bindings (Bryan)
> - added newline in rkcif-dev.c (Bryan)
> - Link to v11: https://lore.kernel.org/r/20240220-rk3568-vicap-v11-0-af0eada54e5d@collabora.com

--
Kind Regards
Mehdi Djait

