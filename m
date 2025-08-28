Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3022DC8303F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 18:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xp2dO5mheTuwtHp182VzDDZTc40Yx+Yp8/mY5wegE0Q=; b=nyzCEemHpcAxDAHorkqKqLwk3c
	gAAyxNVzaTQLbjuEfQmP/WLriYXflOHThXQSPGyG1sZiV6s3KgBxl67PMWnMO1pDf4vOQ6u15SOPY
	+2POnsSrLTyvN9Fp+YQfMUa37LCR7kC8XW7d1ugc8F7fHO7tzCqhjRk7+KhRJ3wOyr6t4XEdUkQnE
	EWpVbZJuYEewhLOgPaxG4Ya/p9cBE5qTRJs/ldKs8hEMyOJBKAFIIs8MKlaI5n8JNmpbpy/yB7ZGV
	QOsk+GUYN8h+sduc18dLsYEQMmnQVG0YfEmqYMXQNQdGCaBlKvQ3jsDHYd6riO+gywM0RWO9g9nJ7
	OpMLcE4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urhWZ-00000002oWb-2FCS;
	Thu, 28 Aug 2025 18:39:03 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urdpX-00000001xRf-2unq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 14:42:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756392143; x=1787928143;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SMW3xNgf1e4fN0in0pQWb5Ft82SGZRFlvkKOyugEm/k=;
  b=f++3ScZdWbGaP9xgj0R3xAiw9SL9sa4j2SzneEm0sxsP+Cf6m2J9vupM
   XbgEDYM0Jdh5zh+W+dAthzZyBT0YfDOr9O3YaI6wixmI/kL8ZqU1IIXLp
   Xjfu8QlViYxNROq3zdkXXbj1qhAFxIMXUDnlpZRohsAqtyaQtjdW388ct
   ZJZ+lyiMU56W6lCQYDRVD3emHrZBgh1sTBNqwvHpMfea3sGrEHIcKkfm+
   PST675G56xkIxmD0yej6zfJuADOhbNUOToBs+oMKmhMsWCpcpE1ovJI7c
   hRwTO4QM6IT1+BIpcLaI0oMLnTvIXBVe1ALETFST6aXA2/uP9Mc7BVz7N
   A==;
X-CSE-ConnectionGUID: AHOCQjoYRWm7K6sVs8vadw==
X-CSE-MsgGUID: dHtNMeTaR9qRIwfaFkyfdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="69256239"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="69256239"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2025 07:42:21 -0700
X-CSE-ConnectionGUID: n5t3Q6rNRFaBlTLBg9DLDA==
X-CSE-MsgGUID: RwZH5Jm1Rhi4vAmq71xDzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="170028872"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.135])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2025 07:42:16 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 66BF811F9D4;
	Thu, 28 Aug 2025 17:42:13 +0300 (EEST)
Date: Thu, 28 Aug 2025 17:42:13 +0300
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
Message-ID: <aLBqxQQsnY3ZK4eT@kekkonen.localdomain>
References: <20250718152500.2656391-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718152500.2656391-1-demonsingur@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_074223_776747_3A2115A0 
X-CRM114-Status: GOOD (  16.98  )
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

On Fri, Jul 18, 2025 at 06:24:36PM +0300, Cosmin Tanislav wrote:
> This series adds new drivers for multiple Maxim GMSL2 and GMSL3 devices,
> replacing the few GMSL2 drivers already in upstream, and introducing a
> common framework that can be used to implement such GMSL chips, which
> avoids code duplication while also adding support for previously
> unsupported features.
> 
> While the normally acceptable and polite way would be to extend the
> current mainline drivers, the choice was made here to add a totally new
> set of drivers. The current drivers support only a small subset of the
> possible features, and only a few devices, so the end result after
> extending them would in any case be essentially fully rewritten, new
> drivers.
> 
> This series depends on support for internal pads, for which a patch has
> been added.

Could you provide v4l2-compliance -m, media-ctl -p as well as media-ctl
--print-dot output on this device, please?

-- 
Kind regards,

Sakari Ailus

