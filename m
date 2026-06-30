Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B25AC43327
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 12:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vthu6x26m8QbWgOc56MLHZ4Me1nt4fhxQPtoqsa1yZs=; b=R6cbdhOTkcdXgw0ekef2K6QwDF
	9Ydd0IwKcOy0GehL1PtPVzSrqtGCR1hJ+owMud6gRx0q7yJ8SWLB8XH5wGGJqEz3caUDPlCqMrK+G
	L4krieFZZT/oLB4OqkPq/aTJ5OVIVOPffgFY5Cg1F9KK7D67zLvdYVaZvBqtoKnF02HmqObifW/0L
	8ygICNc+g3357CXooH45T/9QUXQOdV6LbkYXz6LuRm1kWrABQk4S/x7tcw47pEqA6v7ByucU9uvTw
	qWB6109LTxND7F2GVDlCRpG1UXC4AoMABSujaJFsaCzGktA95E0/ro6h7x6hf5upPTfPHZgYVskY3
	XSMGyBCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weXXh-0000000Gyv0-2fjO;
	Tue, 30 Jun 2026 12:26:21 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weXXf-0000000Gyuf-00kT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 12:26:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782822379; x=1814358379;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jqluEbBWVcccGX43p7xRM26vmTqwW1h8FiHvNmMF8Sg=;
  b=koXfddh+0MAu0w+MebtAM6RqridYPXx8EHyNRabdOjAGnz+NDw6SW1mf
   W4vB10rjfo98QnubKmd16fTO682crKAh7PoHGYGL+bKOXi8EgQvT3qVIG
   TEGHXyZ/rE7w9nUkVNmtWjr0109A2cURbvPX6RBSlZGdttvHYybDei8Qx
   kuZA2hws4oq/6uqnnjeXsHZVqpq2Z7tFtxSKNN3GIKBt+weKakTbr09lp
   OmyzQJ7VrpPN/5UPF1NCA+mYSxCfo++Lh8bwS8sfmUX88bX+NpHRimbww
   qNbF9/oe992bQAeGiqlBapycc0qokeem4K3DIC6hc58CR15CofvXQrH2b
   A==;
X-CSE-ConnectionGUID: lo6BbIA6TqWd0K86dW0m7Q==
X-CSE-MsgGUID: BlzNLyOuR7aRDvk4ta9FSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="87445682"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="87445682"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 05:26:18 -0700
X-CSE-ConnectionGUID: RZhHf/tvR2eGBy5+X7UfMg==
X-CSE-MsgGUID: K6xQASOmQfqt9WB8oVIRZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="254161440"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.96])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 05:26:13 -0700
Date: Tue, 30 Jun 2026 15:26:11 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Varshini Rajendran <varshini.rajendran@microchip.com>
Cc: ehristev@kernel.org, jic23@kernel.org, dlechner@baylibre.com,
	nuno.sa@analog.com, andy@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, srini@kernel.org,
	marcelo.schmitt@analog.com, jorge.marques@analog.com,
	mazziesaccount@gmail.com, Jonathan.Santos@analog.com,
	jishnu.prakash@oss.qualcomm.com, antoniu.miclaus@analog.com,
	duje@dujemihanovic.xyz, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 06/13] nvmem: microchip-otpc: add tag-based packet
 lookup
Message-ID: <akO146b0WGkdPFpb@ashevche-desk.local>
References: <20260630093603.38663-1-varshini.rajendran@microchip.com>
 <20260630093603.38663-7-varshini.rajendran@microchip.com>
 <akO1Rgf4tibxbhfk@ashevche-desk.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akO1Rgf4tibxbhfk@ashevche-desk.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_052619_078838_66028741 
X-CRM114-Status: GOOD (  21.29  )
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

On Tue, Jun 30, 2026 at 03:23:42PM +0300, Andy Shevchenko wrote:
> On Tue, Jun 30, 2026 at 03:05:56PM +0530, Varshini Rajendran wrote:
> > Add support for accessing OTP packets by their 4-byte ASCII tag while

Forgot to mention that widely the term is FourCC (that may or may not be
represented in ASCII) is used. But I don't know if documentation on these
chips uses "4-byte ASCII tag" everywhere. So, just for you to know.
And it's up to you if you want to use the common term instead.

https://en.wikipedia.org/wiki/FourCC

> > preserving backward compatibility with the existing ID-based lookup.
> > 
> > The OTP memory layout can vary across devices and may change over time,
> > making the packet ID approach unreliable when the memory map is not
> > known in advance. The packet tag provides a reliable way to identify
> > and access packets without prior knowledge of the OTP memory layout.
> > 
> > Two offset encoding are now supported:
> >   1. Legacy ID-based: offset = OTP_PKT(id) = id * 4
> >      Used in DT as: reg = <OTP_PKT(1) 76>;
> >   2. TAG-based: offset = 4-byte ASCII packet tag
> >      Used in DT as: reg = <0x41435354 0x4c>; (tag "ACST")
> > 
> > The driver resolves offsets matching valid legacy selectors (multiples
> > of 4 within the packet count) through ID lookup, falling back to tag
> > lookup for other values. This ensures existing device trees continue
> > to work while enabling new tag-based access.
> > 
> > During probe, packet meta data including the tag is read and cached.
> > The driver also validates OTP memory accessibility and emulation mode
> > status. When the boot packet is not configured, emulation mode allows
> > access to the other packets. When both are not available an
> > informational message is logged.
> > 
> > The stride of the nvmem memory is set to 1 in order to support tag based
> > offsets, comment in the header file is updated accordingly.

-- 
With Best Regards,
Andy Shevchenko



