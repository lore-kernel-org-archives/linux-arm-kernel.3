Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED8F7CD4F24
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 16:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Z4XofTmyrXM1eDUAnyoLPP8UjMjadHg57bVLtHnqZE=; b=N9oy1NKX8+X6j5frXyV4NdNumr
	V2wdd64K2Hd2GdKqzELtaEU3BEqx4xrDirdod2eNTPeT4fVWjJqSh33BAzNfA6Wot1clLm+DWuTD7
	WLSVpZdJQa8+qRaWSE3aw6Pdeq/X1mHLCuD7jGXZDvJqRYEddx+3kS2O0deX9QVYvNjdfd6GKGnAc
	BorxJrd6/BV8Vk6rMaas3+A4P3NPEVyryR3a/vQtp9a0UIxszg4oE6bu4olLWPGaAc6UY+lcnfeb0
	7XVvTRtICWAKXvtM1EaAKq1WigRoVeAFWJYmVFIPCTfvTM4H7zbWg8BzGNPJ0R/N+DI679CSk2ZFr
	xc8X/xug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMqP9-0000000HS6R-3r4q;
	Tue, 12 May 2026 16:56:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMqP8-0000000HS61-1D8Z;
	Tue, 12 May 2026 16:56:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+Z4XofTmyrXM1eDUAnyoLPP8UjMjadHg57bVLtHnqZE=; b=gL4r811Tp7e8ubp7S0DAkgee51
	LrSDrsiCRhowy1uDkIDgg3wYRdGerCUT9LGDHtqnCTcAHCZBW28bQvwR2gNcv8h4vEsa58tisFRKS
	Ogeg01+eU2hk8/NzebkA5/4GTMYc5e7mTiNrydmi/p6KrXv5dPfXa6CLr/bUAkAo9/4Nzqg89ySEF
	00DOySC3TO4SxvTah1XkdUzB3ksqigm675CmsEfaIJCf7XIMSyRIQsufkMieYpAY2UY8+EvL4lgDc
	+15IUUY/p6PDzJbr/UXI6lvCshcfIIiG3k66YrqaXaBWp4Bh6GU5HkBCwBl8K0oh4QggK+Z/wZ8AL
	RP2e+/aw==;
Received: from mgamail.intel.com ([192.198.163.8])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMqP3-0000000FPwO-25mU;
	Tue, 12 May 2026 16:56:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778604978; x=1810140978;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9JqXkD4oo5STPUWAnq9HH/ZMSx9akBEyLL9pFMj5Eto=;
  b=AQZHyaEgFTJq1RztkgSK0/hQDVmgO7jts7JqJTvmbch9dI/V5rjda5UO
   QyqL8a+rFaciBcSKqdc3eOLYPLmQx2rb5hI+LnI7sS8hNSq60AiumcB+k
   CHXmUM4x8z49qsPZ42l3P6XA2XwBSVUFofA7WGd2pw3h6HV65I8D4NOu+
   wKj3C73ZZcgixKRYVnOP7NYU0YXMy4ZZQPtREtX5SMr4D1EBv+lYzaMel
   lrrX6H6jAi5Nu/Us7xbmYjvXRzJ4z2uBV0pVMhc4CTVssyx9ZobqtN5wt
   yaW3Eov1YUN4M7b9vv6dPYoeQGFBJSqD6m2ABbfagfuThKdM0biwVa8Uf
   A==;
X-CSE-ConnectionGUID: 3O1BEVFnSjGIRo2a3JFVKQ==
X-CSE-MsgGUID: RddlUAKLQgK6ILA9Q0TZdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="97090230"
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="97090230"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 09:56:11 -0700
X-CSE-ConnectionGUID: eE/ZxnqvT+CkeJ6UrkNkkQ==
X-CSE-MsgGUID: AtasLK9fTAie+dOmlPczyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="242171405"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.244])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 09:56:05 -0700
Date: Tue, 12 May 2026 19:56:03 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Roman Vivchar <rva333@protonmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org,
	Ben Grisdale <bengris32@protonmail.ch>
Subject: Re: [PATCH v2 05/16] iio: adc: mediatek: add mt6323 PMIC AUXADC
 driver
Message-ID: <agNbo39p6uACvQHd@ashevche-desk.local>
References: <20260512-mt6323-v2-0-3efcba579e88@protonmail.com>
 <20260512-mt6323-v2-5-3efcba579e88@protonmail.com>
 <20260512142932.5c6801d1@jic23-huawei>
 <gWxamwTKyUeOF4QCsiIsrnh7DSWzIKFaY0h83qKq_0vg786xv1uFYhypix7BVO_ruG_vw3DrIsRhIKv5NAzl8hK72rjzPAjwAGU-rhkMgeA=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <gWxamwTKyUeOF4QCsiIsrnh7DSWzIKFaY0h83qKq_0vg786xv1uFYhypix7BVO_ruG_vw3DrIsRhIKv5NAzl8hK72rjzPAjwAGU-rhkMgeA=@protonmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_175618_249173_58323813 
X-CRM114-Status: GOOD (  17.35  )
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

On Tue, May 12, 2026 at 02:34:55PM +0000, Roman Vivchar wrote:
> On Tuesday, May 12th, 2026 at 4:29 PM, Jonathan Cameron <jic23@kernel.org> wrote:
> > On Tue, 12 May 2026 08:18:19 +0300
> > Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org> wrote:

...

> > > +#define VOLTAGE_FULL_RANGE	1800
> > Probably better to have this inline - however if you do keep it
> > prefix t he define  VOLTAGE_FULL_RANGE sounds too generic!
> > 
> > > +#define AUXADC_PRECISE		32768
> > I'd put that inline.  Little benefit it in having it up here...
> 
> There was a mention about magic values in the v1 for the thermal patch [1].
> Andy, would it be better to use an inline style or a #define here?
> If the former, I'll rename the first constant to something like
> AUXADC_VOLTAGE_FULL_RANGE.

If you use it inline, add a comment to explain the magic.
It will be a good compromise.

> [1]: https://lore.kernel.org/linux-mediatek/afmnUG8dG0N0HpV6@ashevche-desk.local/

-- 
With Best Regards,
Andy Shevchenko



