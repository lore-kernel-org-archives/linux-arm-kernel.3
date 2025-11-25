Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80882CFD37E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 10:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dBDt/0A05ARqGq/gwPaOapg9oYZT6aCA8dCl86xHh7g=; b=dKXMUXO8LJ7HcRUrcXxzNNuQj9
	Q9lKNF3eIrFZv6Dk+sgM2LHo48ym6Av71erjtob5MKFpJU2Kluk70Jyn/U1LcM8qf/IYxq00gacNQ
	azW2rFYt56eLNcZIje6iTdVIjcQwvi1AawbDuEOfy8AZtTYQkFWL9OxMOaRaoGkuPM6VxzYEz8ioB
	BayMO0UDxyGeCSiIXhanbMSK1m6huRYpqhICtr0qo1pfZU0Xz76YRycXFbU2D3o0OfS/yhfm6LeEQ
	hSkujeU6adsTD8OrOPHFVngUKM+CpvWV2kGZmA793E3Q+5sjF53xmSt6SERvDmz8nKwUPt6YhN4/P
	l6PJCW4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNq3n-0000000D6sk-0GFa;
	Tue, 25 Nov 2025 10:14:11 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNq3k-0000000D6sH-3NKl;
	Tue, 25 Nov 2025 10:14:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764065648; x=1795601648;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+KH7Ypgy6kj3Q59t5+0vx6RYUePPMpPgWugFJSvdq6k=;
  b=AdWXRQrZyS36nYvyyt7pQEqBONDnQo3bAS89cad2DKTXYjdDSy2HkXM5
   sXLLJg2Fb63wu53l+hkPd5npMd4jYglZZ/QahHsTqwlttltQ9Mypc+kLf
   iwAsBrL0Z9WC/JhPZdBXo3FjIIcKbg8+bZhN0oot4KIhOIOC0NsVrojFK
   pmKwiMfR02SIdwjDM4xGMf74w2zPTMvTMQfBUfgPXRLydQ4NjGiA8zCJ3
   okqs6+8BM+lq1gBrBtmpTP6uzJwOEUdkh2D+oUl/RKNfquiti79YmyRF4
   UhNYsHN70ZfVIIYA8M3KrEmM+TlYKMGKyQzjS/2duIaDq5rFuLT4zbeAo
   Q==;
X-CSE-ConnectionGUID: 9I8H2O9LTgKFr9Mu/i69dg==
X-CSE-MsgGUID: uBSKls5HSfWw1vccqpfCHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="91565060"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="91565060"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 02:14:07 -0800
X-CSE-ConnectionGUID: b+bhd7nARGGQ5v25jH4xQg==
X-CSE-MsgGUID: 0jzW2n0PQym93ChWozUx/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="191859408"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.152])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 02:14:03 -0800
Date: Tue, 25 Nov 2025 12:14:01 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Ray Liu <ray.liu@airoha.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Andreas Gnau <andreas.gnau@iopsys.eu>
Subject: Re: [PATCH v4 1/3] spi: airoha-snfi: en7523: workaround flash
 damaging if UART_TXD was short to GND
Message-ID: <aSWBacH8N5NWO8oV@smile.fi.intel.com>
References: <20251125021051.857159-1-mikhail.kshevetskiy@iopsys.eu>
 <20251125021051.857159-2-mikhail.kshevetskiy@iopsys.eu>
 <aSVYShXLirW--bYe@smile.fi.intel.com>
 <83a15a9d-8dfa-4949-b483-020bbcf0847a@iopsys.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <83a15a9d-8dfa-4949-b483-020bbcf0847a@iopsys.eu>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_021408_888323_4CED33E3 
X-CRM114-Status: GOOD (  25.41  )
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

On Tue, Nov 25, 2025 at 01:04:12PM +0300, Mikhail Kshevetskiy wrote:
> On 11/25/25 10:18, Andy Shevchenko wrote:
> > On Tue, Nov 25, 2025 at 05:10:49AM +0300, Mikhail Kshevetskiy wrote:
> >> Airoha EN7523 specific bug
> >> --------------------------
> >> We found that some serial console may pull TX line to GROUND during board
> >> boot time. Airoha uses TX line as one of it's BOOT pins.
> > I know the term bootstrap, what does BOOT mean?
> 
> yes, it's bootstrap pin

Then use that term.

> >> On the EN7523 SoC this may lead to booting in RESERVED boot mode.
> >>
> >> It was found that some flashes operates incorrectly in RESERVED mode.
> >> Micron and Skyhigh flashes are definitely affected by the issue,
> >> Winbond flashes are NOT affected.
> > NOT --> not
> will fix

> >> Details:
> >> --------
> >> DMA reading of odd pages on affected flashes operates incorrectly. Page
> >> reading offset (start of the page) on hardware level is replaced by 0x10.
> >> Thus results in incorrect data reading. As result OS loading becomes
> >> impossible.
> >>
> >> Usage of UBI make things even worse. On attaching, UBI will detects
> >> corruptions (because of wrong reading of odd pages) and will try to
> >> recover. For recovering UBI will erase and write 'damaged' blocks with
> >> a valid information. This will destroy all UBI data.
> >>
> >> Non-DMA reading is OK.
> >>
> >> This patch detects booting in reserved mode, turn off DMA and print big
> >> fat warning.

...

> >> -	err = dma_set_mask(as_ctrl->dev, DMA_BIT_MASK(32));
> >> -	if (err)
> >> -		return err;
> >> +	if (dma_enable) {
> >> +		err = dma_set_mask(as_ctrl->dev, DMA_BIT_MASK(32));
> >> +		if (err)
> >> +			return err;
> >> +	}
> > Why do you need this to be conditional? The settings of DMA mask should not
> > affect the (in)ability of the device to perform DMA. I.o.w. it should not
> > influence PIO mode. Can you confirm this?
> >
> no any particular reason, just see no sense to set mask if dma will not
> be used

So, this is an unneeded churn in the patch. Device is [still] capable of DMA?
Yes. Set the mask. The DMA/PIO choice is done on the upper layer (as you do it
via ops).

-- 
With Best Regards,
Andy Shevchenko



