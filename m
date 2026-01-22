Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C712BD3EE75
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 15:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NxwedwyogLQilWvweKyY+aR4T1jYt+aDjCdUunkRE0I=; b=QEWzxswP6JluqWjMEmvM+WPyx2
	jfLudV5jxT4MnT9kHLxzumYQqJjhuX4deluxs6sWxyAgvFZeroPV0YYFf+TkhlKktresdpxCD9S3u
	fUFnELAnhURigYlGFc3Efo+4Bhe8+izF9UriflnpiY9cIroLBpvH2X+83IQSHtCJvFe8X4DUNHw/G
	LvRklVxe3kVbN880roSERzTPrsQKYOq42Vzhx7BWJbVfeDriHydwplSFGlExqJt1Ckno7T93KSNOr
	uERESffcshHSgq7JdxLuDRTzktilNKyljXBFFo4iR0Kf33l7vfwKuWN6CDqhQOxZTRrpJRCpOzWPO
	4SS7JVVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viwCE-00000007Hs0-2Ggx;
	Thu, 22 Jan 2026 15:02:06 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viwCC-00000007HrI-0a8T
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 15:02:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769094124; x=1800630124;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=l77IAsVXahcW5YI/IdZW6IxkK1iQnfGhw6G2mzcbNLw=;
  b=JSZLFxsY5jjvVj9hLSRqiZoXoWI+ayoQUE3F1rE7Fza7fXeYCpiWn/ZR
   p0br/nO1Ul8/AgcGlzojAp++4uzF+E6cXvMvjpsCy5xtMvtAs8ZP0+MUJ
   ww4rbJnjsqSFlc5K8NarkhLbH5/NGRxZFrgp463jExdMITb7dbO0IKyxf
   QJvsAj2Ldk7yk76cM+xL4pQqbo4AholKw+YO+tqzgYTm66BZ+UnlT9Yo+
   PNZATmJsCQVaP7tBzfmLCoXXxPcla4/ODxjTD1Xa44aXISGVwfhoIAOrs
   9C4CWeGIpIPQT7ec573yfG+aY1Xz1Za3jubnKXe657sgypLh65MCnPHho
   w==;
X-CSE-ConnectionGUID: zxOOZ5cdQsaUfaDcFsfA+A==
X-CSE-MsgGUID: ekM9QOoLSQe8lvwTcMvLLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="70384597"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="70384597"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 07:02:04 -0800
X-CSE-ConnectionGUID: NW67R4G3RdaUyuKfqBUm4A==
X-CSE-MsgGUID: n2EU29aJRAySn/f0MLrr3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="206805571"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.225])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 07:02:00 -0800
Date: Thu, 22 Jan 2026 17:01:57 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 3/4] ASoC: pxa2xx-ac97: Remove platform_data
Message-ID: <aXI75VDA60hRIrYQ@smile.fi.intel.com>
References: <20260122-sound-cleanup-v1-0-0a91901609b8@nxp.com>
 <20260122-sound-cleanup-v1-3-0a91901609b8@nxp.com>
 <aXI7LlXOiLSD2K1a@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXI7LlXOiLSD2K1a@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_070204_214407_AE4BF24C 
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

On Thu, Jan 22, 2026 at 04:58:59PM +0200, Andy Shevchenko wrote:
> On Thu, Jan 22, 2026 at 08:44:59PM +0800, Peng Fan (OSS) wrote:

...

> > +	if (dev->dev.of_node) {
> > +		reset_gpio = of_get_named_gpio(dev->dev.of_node, "reset-gpios", 0);
> > +		if (reset_gpio == -ENOENT)
> > +			reset_gpio = -1;
> > +		else if (reset_gpio < 0)
> > +			return reset_gpio;
> 
> No, please convert to devm_gpiod_get*() or even better to use reset-gpio driver.
> TL;DR: no (reinstantiated) of_get_named_gpio() or alike must be in the kernel.

Ah, you do it in the followup, right?
If that is the case (I'm going to look into it after this one)
Acked-by: Andy Shevchenko <andriy.shevchenko@intel.com>

And thanks for cleaning it up, eventually!

> >  	} else {
> >  		if (cpu_is_pxa27x())
> >  			reset_gpio = 113;

-- 
With Best Regards,
Andy Shevchenko



