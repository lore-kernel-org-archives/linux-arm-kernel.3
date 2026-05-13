Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E55D9CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 20:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HUuVleCVAPYaVVQDtV8Uv1nhf6G7z7qcDEEz8dZ8lP8=; b=OBXGRNBVTbdYsp9a34jGqN+Uc7
	OBoxNPJDjsX0CXdPLdPzxvMEj+Pj7qBNl1ghNSvb4DTtElM1A1OA2gz/bvK8f2zdeM2WpJ4oeYwzX
	J5lElAI3tu9QudJ6B/M/dWS2VmkTgfb+LbgmWtnL3uPEymiqq9MkHxlpiyBZ8vVSuG8UfIO4UV70u
	OyLZ9iuOODuO6wmQOJPmV2Y8coQqpkKP+yWHH7xcesjQ/q6PFikgtUMXWNSpQCUZtDjkCNL/q1WZN
	+fBz5dm4eAyxF/WeNfeebMcnQONjm8FnyS8GhYN8q9okvIYEIOmFzQMURNkmFaAfzPxNoYPoTSHff
	rPa1vXyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNFwI-00000003fKU-3wTI;
	Wed, 13 May 2026 20:12:18 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNFwD-00000003fJZ-0f2t
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 20:12:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778703133; x=1810239133;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=5Epym90fKAuiJjd27QA6X5Qm4j4TMj5bRrbqdLkIIBE=;
  b=bvESM0qW2Jn9ReECQLxNuFiOCD2qwEaIflQ8YEZKv7aM+1vWpnmjA375
   SDSwr9KBxAuB/An6/12u///k0xQYHXVCaUcW57SbliQZ5DOl4rhSVXqc9
   dlrouh5B91Qi7DRvkQroaVShWoqUJin5C/ETLOgSlNNNE/3iWMMX7aukt
   GXfDUB2KRno0ISAul0IDbPTFlJeL7WHzDPCpICW41tQGM0VyJjVplhtaQ
   fJAkTYXVjU6njzbVSHQyGsfgvqQ6GEpoF2jfnsNLByaMwVJW27suCskuh
   ZlAt9d0j+6zfYssq2+7kdfK+NYWzR3e5rWUeIQ2DBsm6GR61f/N+bhduX
   w==;
X-CSE-ConnectionGUID: 8hjc7vaLSv66Tb8rMr3/WQ==
X-CSE-MsgGUID: EsQzf1QTSP+c/E4C7c03sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="83512257"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="83512257"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 13:12:12 -0700
X-CSE-ConnectionGUID: mlJKbVbsRei8/iMm01ob6Q==
X-CSE-MsgGUID: Ge71FgiOR/KxCahTfu36SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="261690012"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.106])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 13:12:07 -0700
Date: Wed, 13 May 2026 23:12:05 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Sanjay Chitroda <sanjayembeddedse@gmail.com>,
	Michal Piekos <michal.piekos@mmpsystems.pl>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maksim Kiselev <bigunclemax@gmail.com>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] iio: adc: sun20i-gpadc: add A523 gpadc support
Message-ID: <agTbFbicv9yzTQb9@ashevche-desk.local>
References: <20260513-sunxi-a523-gpadc-v2-0-d5efde151dac@mmpsystems.pl>
 <20260513-sunxi-a523-gpadc-v2-2-d5efde151dac@mmpsystems.pl>
 <A7772824-E704-4BFD-A796-BCD81197E5A2@gmail.com>
 <4248ac7e-3cce-4db8-a2c1-710f2c903490@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4248ac7e-3cce-4db8-a2c1-710f2c903490@arm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_131215_240358_29B1FD25 
X-CRM114-Status: GOOD (  14.09  )
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

On Wed, May 13, 2026 at 01:53:49PM +0200, Andre Przywara wrote:
> On 5/13/26 13:44, Sanjay Chitroda wrote:
> > On 13 May 2026 10:29:43 am IST, Michal Piekos <michal.piekos@mmpsystems.pl> wrote:

> > > +	if (ret <= 0)
> > 
> > Thank you Michal for the change.
> > 
> > Have you validated the changes ?
> > It looks while success ret would be 0 and it would give return error.

Good catch!

> But devm_clk_bulk_get_all_enabled() returns the number of clocks found and
> enabled. And since we need at least one, I think this is correct, and the
> error message below reflects that.
> 
> To me that change looks good:
> 
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>

== 0 ???
Doesn't look like correct code.

-- 
With Best Regards,
Andy Shevchenko



