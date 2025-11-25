Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B86B2D0EE13
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 18:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pM0o1AYxzUtWqc+Ck8fcphfQUFNkt/WGLDT5cfunRqc=; b=pCG3sp56IHrq6bvTiwYnLm2/YC
	j360MEZfmpkEzO9/PJm6nenL5aw2khngVqcS6XNDojwKfpx1a0426uRii+A+voBZanj7Ir4RoWPth
	GZrVry/VLATCSdcT8ONpR9Y9L78GBxg1pslOAnJhQwgIStCp208JP5eZjE0iCx7K+DhTPv/aD2sVl
	oT73HQalc/I/Ouakj8RkGRsR7WFGKIvnQUQE9+5WmgmTrv5BIkQUZ+CAub6fHsuWuqxFAZA1/2zH9
	TVrl4gzHM3lQ+5+NUBGYJFFzNpNZc8Vou38Vwvk+YgHGW8tXghcluVRw5TwpZ9DUWQmWCsWbnfPSM
	hfrbKhqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNxzO-0000000DmbV-1CV6;
	Tue, 25 Nov 2025 18:42:10 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNxzJ-0000000Dmb2-2W78;
	Tue, 25 Nov 2025 18:42:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764096126; x=1795632126;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mEHY9GgoiSqhxR/W0E8OtjxK4nwc0SEgrPhZ5czKwe8=;
  b=U8GrVZGc9vFDv/wGYb+no03OEtNeREQbCQI1bk3J53bDjgrcLxlRFWXz
   P1T0bP6hzWhNhbjRJBz3lQ3JV5ATUsDp513LTtS+9VX1wyvFOzm/OIAUs
   9o3tf5ZIhxqnwYenqK/cie45qrr8qbF94+Pc1bh3HR5FC6nRQtIWUw7Sc
   jS/D9Frc4kb2abN/u72v27G4+bQrlKBm93z0hZjOn5XpOzSBCiOYjJo0M
   7St8CRkfWSbRk1FZXDcMgITLL5nq6kvuFS5bIAsEz88wvmyhdn9bbWuD3
   /oL5Ln6JWCKqzXEIdMIA0zS2qewi8fzBLRBZgeTPFlLjPiv1r6dAxz4Tx
   w==;
X-CSE-ConnectionGUID: 4twwlgyqT5iPMXoD1BqWtw==
X-CSE-MsgGUID: wtou73DvQqGQcgklqIUtXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="65833574"
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; 
   d="scan'208";a="65833574"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 10:42:03 -0800
X-CSE-ConnectionGUID: k0Wtz+P3Spe8Tm0zUe2zGQ==
X-CSE-MsgGUID: 7DGzM9uHRSWs90aCUXQEHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; 
   d="scan'208";a="192719812"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.22])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 10:41:59 -0800
Date: Tue, 25 Nov 2025 20:41:57 +0200
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
Message-ID: <aSX4dXXmlHcz0zeU@smile.fi.intel.com>
References: <20251125021051.857159-1-mikhail.kshevetskiy@iopsys.eu>
 <20251125021051.857159-2-mikhail.kshevetskiy@iopsys.eu>
 <aSVYShXLirW--bYe@smile.fi.intel.com>
 <83a15a9d-8dfa-4949-b483-020bbcf0847a@iopsys.eu>
 <aSWBacH8N5NWO8oV@smile.fi.intel.com>
 <13321124-6b45-479c-a73d-1d9ec9e96f05@iopsys.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <13321124-6b45-479c-a73d-1d9ec9e96f05@iopsys.eu>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_104205_685895_B0E35AE5 
X-CRM114-Status: GOOD (  18.62  )
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

On Tue, Nov 25, 2025 at 05:20:44PM +0300, Mikhail Kshevetskiy wrote:
> On 11/25/25 13:14, Andy Shevchenko wrote:
> > On Tue, Nov 25, 2025 at 01:04:12PM +0300, Mikhail Kshevetskiy wrote:
> >> On 11/25/25 10:18, Andy Shevchenko wrote:
> >>> On Tue, Nov 25, 2025 at 05:10:49AM +0300, Mikhail Kshevetskiy wrote:

...

> could you clarify what's wrong here?
> 
> >>>> -	err = dma_set_mask(as_ctrl->dev, DMA_BIT_MASK(32));
> >>>> -	if (err)
> >>>> -		return err;

Sure, just don't touch these lines. Only set the respective ops depending
on dma_enable.

With that done the patch will look better and less confusing about affection of
DMA mask setting on DMA operations (which are kinda orthogonal).

> >>>> +	if (dma_enable) {
> >>>> +		err = dma_set_mask(as_ctrl->dev, DMA_BIT_MASK(32));
> >>>> +		if (err)
> >>>> +			return err;
> >>>> +	}
> >>> Why do you need this to be conditional? The settings of DMA mask should not
> >>> affect the (in)ability of the device to perform DMA. I.o.w. it should not
> >>> influence PIO mode. Can you confirm this?
> >>>
> >> no any particular reason, just see no sense to set mask if dma will not
> >> be used
> > So, this is an unneeded churn in the patch. Device is [still] capable of DMA?
> > Yes. Set the mask. The DMA/PIO choice is done on the upper layer (as you do it
> > via ops).

-- 
With Best Regards,
Andy Shevchenko



