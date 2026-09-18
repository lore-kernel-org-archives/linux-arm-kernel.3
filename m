Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5BB9C982D2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 07:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dR1PMKLo1D2kGI6/FDnHvp2c1skhd9HOM2syk/EfTJM=; b=J1Ukb3tGgF3TThpwVbbAS7IXwR
	5AaWVOyZ3ZuVy5hjWPg+akh2sOcxQV9FEs5dPlmVLZmg7pNpaSN4hd7taF5KL2YWzmWEjWzMDnMki
	tcn4ewhxoM6ba4MKzWz5BurzVg+Q8QzK7hyF0Eg83t9dlKHdBnhElnpVqHm4HK6YSjHcY0w1myysn
	AqYznhrFM6y/XokkFrqLDSx904OSh3vIW0CbvETzjHu+No954J86s7q+vuT1tWwA3fqkCp0ROFpNr
	3CG9uko/DMyJwW/Bi8MovhvALp679s6IQX5uX6e2EbocJkDE66K8FQpDyEPtn0ozFR7eTtekg46a/
	XMO/lc7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7SsC-0000000DfrQ-435O;
	Fri, 18 Sep 2026 07:19:04 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7SsA-0000000Dfqp-2lkq;
	Fri, 18 Sep 2026 07:19:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789715943; x=1821251943;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dfxlF5cxykKt1JLCGAytW/kqApoyMBeXGMrJQ5Ycbg4=;
  b=HeDVAwVEblsHHL9S8H0spUMvWcYzAdKi6JR42Xtwbzxujm4e/b3M6BG+
   ls1raktvOiG1Tg4E7uqp0AvDUPKx2busA2V97VaUZTQDoNz66Ap5/yBBI
   wcAGQJzGMeeSTRUSSfJD91oxLkiH1JATBWlS7iFk+HlgoAaVlrDOvB1Eh
   tZk5618QydKTJNnSYPkfroF/qEbEVwp45EpexAtoK6VnQ9Ln2QcFexMQI
   w4C/PUf+Xx55MVfeU0jE+ky3zBmVHWhd5YX4HjLe1gQ8J8YIXVVwsLDPX
   jepJomFrLaN6BFBmxqx5UE+E206AZTQWZuOfRauccsO2UzYkfRC3jeJSZ
   g==;
X-CSE-ConnectionGUID: UEqVCYJJRxCVcidrmEAtfg==
X-CSE-MsgGUID: tDTUfbbNR8aDGwYBZlW88Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89338053"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89338053"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 00:19:01 -0700
X-CSE-ConnectionGUID: YVxCbwO2SqqSvBOkmu44aw==
X-CSE-MsgGUID: FpOe3BXLSpad84ZaQLJXvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="276224505"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.170])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 00:18:57 -0700
Date: Fri, 18 Sep 2026 10:18:51 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Ryan Brue <ryanbrue.dev@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Lee Jones <lee@kernel.org>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, mfd@lists.linux.dev,
	Roman Vivchar <rva333@protonmail.com>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>
Subject: Re: [PATCH v2 0/3] iio: adc: add mt6397 PMIC AUXADC support
Message-ID: <aqzl29C_R4zwAnDK@ashevche-desk.local>
References: <20260917-rbrue-suez-upstreaming-mt6397-auxadc-v2-0-db35882a6080@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-rbrue-suez-upstreaming-mt6397-auxadc-v2-0-db35882a6080@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_001902_709304_CE99B17B 
X-CRM114-Status: GOOD (  34.69  )
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

On Thu, Sep 17, 2026 at 09:19:49PM -0500, Ryan Brue wrote:
> The MediaTek mt6397 PMIC has a 10-bit AUXADC that nothing in-tree can
> reach. On boards built around it that ADC is the only path to the battery:
> the SoC's AUXADC is wired to board thermistors, and the charger ICs these
> boards use have no ADC at all, so without it there is no pack voltage and
> no state of charge.
> 
> Patch 1 adds the compatible to the existing MediaTek PMIC AUXADC schema and
> the header naming the channels, patch 2 the driver, patch 3 the MFD cell
> that instantiates it. The cell comes last so that no commit in between
> registers a child no driver can claim.
> 
> The mt6397 is not given mediatek,mt6359-auxadc as a fallback because the
> two are not register compatible; patch 1 has the detail.
> 
> Only the two channels a board needs for its pack are described, so patch 1
> ships a header naming them: a channel ID is an index into the driver's array
> and not the PMIC's channel number, as in mt6323-auxadc. The register
> sequences are the ones the vendor kernel's pmic_auxadc.c programs.
> 
> One note on patch 3: it adds a cell to mt6397_devs[], which Luca Leonardo
> Scorcia's MT6392 series converts to the MFD_CELL_* macros in its patch
> 4/9 [1]. Whichever of the two lands second needs a respin. Mine would
> become a single MFD_CELL_OF(), and I can do a respin if that patch arrives
> first.

> Cc'd Luca.

Instead of this, just put the real Cc: email tag here
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>

> Tested on an Amazon Fire HD 10 (2017), an mt8173 with an mt6397. Both
> channels are exercised: the battery channel by a fuel gauge, which reads 817
> counts, 3830 mV with the pack at rest, and the thermistor channel by an
> ntc-thermistor consuming it.
> 
> A new driver was created here, instead of modifying an existing driver such
> as mt6323-auxadc or mt6359-auxadc, for the following reasons:
> 
>  - Both mt6323-auxadc and mt6359-auxadc select channels through a request
>    register (1 bit per channel), while mt6397 uses a 4-bit numeric field
>    CHSEL in CON1 (10:7), and then pulses a START bit (CON1 bit 0).
> 
>  - For mt6323-auxadc, which is the closest I could find to the mt6397
>    (CON0..CON27), it has 13 more registers than the mt6397 (CON0..CON14).
>    It uses CON22 for its request register, and reads the result value
>    from the same register as the ready bit. We don't do that - the mt6397
>    has a factory calibrated value for each channel at 0x16 higher than the
>    raw value. mt6323 also has a 1800 mV / 15 bit scale / resolution while
>    we have 1200 mV / 10 bits. We also have some per-channel preparation
>    that we have to do before the burst, that the mt6323 doesn't have to
>    do.
> 
>  - For mt6359-auxadc, it has a more generic framework for describing the
>    AUXADC, but it assumes requests are channel-per-bit, and so we would
>    have to basically ignore req_idx, req_mask, rdy_idx, and rdy_mask.
> 
>  - We also have our own software sampling, which the vendor does too
>    (Amazon Fire OS based on Linux 3.18). We'd have to have our own
>    sampling callback to do it.
> 
> I have two things in the driver different from the vendor (Amazon
> Fire OS based on a 3.18 kernel). Verified with over 150 interleaved reads
> per setting:
> 
>  - Leaving the ISENSE input enabled between reads, as the vendor does,
>    makes no difference to the value, so the driver switches it off again
>    and leaves both ADC input enables clear when idle.
> 
>  - The chip's sample accumulator makes no difference at 4, 8, 16 or 31
>    samples and costs no measurable time, so it is left at one. Software
>    averaging helps, but only by about a quarter: 0.92 LSB standard
>    deviation for one conversion against 0.67 for sixteen, where independent
>    samples would have given 0.23. Conversions in a burst are correlated.
> 
> The reading was checked against the charger, which regulates the pack to
> a programmed voltage in constant-voltage mode. Over twelve such voltages
> from 3904 to 4080 mV, and charge currents from 111 to 778 mA, the driver's
> reading is a mean of 0.9 mV from the regulated value, well inside
> the charger's regulation tolerance. That also settles reading the chip's
> trimmed result register rather than the raw one - the raw register is
> 20.7 mV low at every one of the twelve points.
> 
> [1] https://lore.kernel.org/all/20260902193351.185771-5-l.scorcia@gmail.com/

-- 
With Best Regards,
Andy Shevchenko



