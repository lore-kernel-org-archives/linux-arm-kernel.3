Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D08DED3B9A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 15:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EywgxkrTN2xkW7W98GxF9WmLUXMyuExpTDsIr7nON3k=; b=W8PJ5rKt07F/I6+h/6JcDd3Qu1
	d3aGbetmcPQR9Vu/h3a8wzc2STOr5YwIxNeGffpfhh8Yc0vVyRIgtIiUYx+/xuylgqlOUw7iD9xKY
	eGrDkyZI5rRN9IpuROPoUVWSOie0dySLX0+CJHFizJNa/MX1bG4nyWXuRyAD3KcSTt9fJxCWFPgCx
	XaR58W0VRna6hK2/GroNrzoHcJKFt89OgpjPK+8YJGJBqeUO/c6irCqFwQkrxAYLk+Q1ABzHauUx6
	ARnf0ZtOCrEkSP9W05HFQHM5+xzHWt4iFJIMhJLSSrGEwtfgEoMS7KIlT78KebQN5q1idT2k1Lf5G
	cCPTo7pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFxQF-0000000Azda-0xaz;
	Tue, 26 Nov 2024 15:24:15 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFxPA-0000000AzTu-1nbI;
	Tue, 26 Nov 2024 15:23:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732634588; x=1764170588;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BRSfxCCbOwhi2VADRh6D9j6oW5F0hLtYWnvHVw2D4Ok=;
  b=dx+nGmh866NMJ10Tg1nsKlLBgD3mDDZzwdoWfw/kZhdxYzIpG2tadKTz
   afUGkC9SUjB+yg3FbweK70maJyKCz1l5G3m0OCILxELlr2oMkGzLG+MXf
   I2YSlZkSQ5xcmtSDJ7rtfHUI7uEMkwTvDiEq5V/aA7idOTbvSO726/Ldy
   912qZVQx2InkEDrH0uMdhzgB2ljuCi69sVXjPzhiD1wbAiTMh+LpIBMp4
   RWgiCXITUoyLs4ecIyWULgI8VjwUFvywVNzScsPfpvQ4dZLmw76ayD5eC
   KlJh4F46wzSeMleBE60Yu4HRTJmideCgcGO+/T9YYZjX5TzD3itFc58/x
   w==;
X-CSE-ConnectionGUID: bN/DnmHBRCis1XImq85/uA==
X-CSE-MsgGUID: IPn98drzRX275jdsspmc2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="32859267"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; 
   d="scan'208";a="32859267"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 07:23:07 -0800
X-CSE-ConnectionGUID: uzI9OrRkRESc0LNpJIAMGg==
X-CSE-MsgGUID: QH5wPg5HS+SufPvb1ivXHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; 
   d="scan'208";a="122496182"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 07:23:04 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tFxP3-00000001JiU-3m2Z;
	Tue, 26 Nov 2024 17:23:01 +0200
Date: Tue, 26 Nov 2024 17:23:01 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Mark Brown <broonie@kernel.org>, Nicolas Belin <nbelin@baylibre.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v1 1/1] ASoc: mediatek: mt8365: Don't use "proxy" headers
Message-ID: <Z0Xn1fMvuwR4KQbb@smile.fi.intel.com>
References: <20241031102725.2447711-1-andriy.shevchenko@linux.intel.com>
 <ZykbMlshvlwCaeGJ@smile.fi.intel.com>
 <d7bf7863-fd24-4f8e-8cd0-d84867a997bb@sirena.org.uk>
 <dad2ecb7-e624-49c2-a7d5-0ff53b6a1686@baylibre.com>
 <Z0RkaqfID9v0age_@smile.fi.intel.com>
 <ed50c130-076c-4697-9f11-fe602c7ca03d@baylibre.com>
 <49fa1677-db35-497b-afae-caa5dccf3747@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <49fa1677-db35-497b-afae-caa5dccf3747@baylibre.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_072308_513732_187127D0 
X-CRM114-Status: GOOD (  23.53  )
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

On Tue, Nov 26, 2024 at 11:37:26AM +0100, Alexandre Mergnat wrote:
> On 26/11/2024 11:29, Alexandre Mergnat wrote:
> > On 25/11/2024 12:50, Andy Shevchenko wrote:
> > > On Mon, Nov 25, 2024 at 12:32:13PM +0100, Alexandre Mergnat wrote:

...

> > > > Actually, after test it, "linux/of_gpio.h" isn't needed at all anymore.
> > > > 
> > > > That mean all added include in this patch aren't required.
> > > Do you mean the driver doesn't not use types from types.h or dev_*() macros
> > > from dev_printk.h? I don't believe this, sorry.
> > 
> > > 
> > > Basically what you are trying to say is "let's move of_gpio.h implicit
> > > includes to become something else's problem". It's not what this patch
> > > intended to do.
> > 
> > I'm just saying that I've test a build/boot with "linux/of_gpio.h" removed and without all
> > include added in you patch. My understand is "linux/of_gpio.h" act as proxy
> > for the includes added in your patch, my first idea was "if I remove it, build should fail cause
> > of lack of other includes". I can understand these missing includes are mandatory, that
> > probably means there is another proxy header ?
> > Maybe my test isn't consistent because it isn't possible to clear all proxy ?
> > 
> > If that's the case, consider my review-by.

> Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

Thank you!
Mark, would be enough to apply the change?

> > I've validated some include manually. Are you using a script to parse
> > the file and raise all necessary "linux/*" include ?

-- 
With Best Regards,
Andy Shevchenko



