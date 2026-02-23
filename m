Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04DF1EC110C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 17:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jYpLWJusSgf+j4WABWj3QdLi9db80aykJ514OC2SQdQ=; b=ptclVMO6vJ+K0PUY/JOgf6HPFu
	QUiplM7Rg/uxkLcfHHU/nHbZUTnIp5AwhCfe848xXlXquztec9uGkR4x5LBLHtw1Sr/HlBwVio0H1
	x6q4JF8mcgUcmprORklNsg9faleeo9OGlHAzUgL1wc6okDbyD279StYf/+TJGWn6jHhrklYbMJ81L
	rBp4K5ID10dysZn2/oz8H4M0RImgqGe0Jdj+hv8jPhDfZy2p/XG3eInsvX0TTshoaX/gB6kuREGZN
	eFxXBoK5trqkVkoFBC9s28m6G77ns9lOzo8C97ILM77vhTzAlDvgyRpZZRTFgov1r70bI8bn5acS9
	0LmcmlNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuZqS-00000000nFw-2uFz;
	Mon, 23 Feb 2026 17:35:44 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuZqP-00000000nFa-1d4l
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 17:35:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771868141; x=1803404141;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=U5zxDmwawz4WruJGR4RkxkWHRP6haiZsXdq6zgOTCaU=;
  b=a4FhIrxTbE2NADlKOXMYZ+5Uo7J7q5u6VK0h5m1WzaJtIrlYhBG3mCEe
   sfe8riYGwVUNLVbvmSlX4r/9HYo/dSE2Dt/gMCq9xrbsig7vfAt5DzYT/
   TacckbjxOHwetXEWk1V7VzDvgb+GYx1QevPHvtHSXriQsTeKwF/4R20Xr
   GlPHzcTK16WNtGjY1eGjBBglbswkwD3Js7Le15LZChl51SUP2tW9KTx7T
   zUrfAJOkzavzeH0w6f083umc5JYvAF9DskDQwMzS6dB0FrBj9ICOZJVNJ
   qaAYV/7h3xcl64VsBNDdaJC/RHpbvOxoQ4iCF9hqOep5MNCNoeluGfiaS
   A==;
X-CSE-ConnectionGUID: lt9MdXwIQrqPqciz+LebFw==
X-CSE-MsgGUID: VLkQlmk6T+6YB5FeQhNXOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72970941"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="72970941"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 09:35:37 -0800
X-CSE-ConnectionGUID: AKo+otEIRKW/YmGTs8gUNQ==
X-CSE-MsgGUID: kYLwZzcFSD+fzetIaWYUuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="213544542"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.222])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 09:35:35 -0800
Date: Mon, 23 Feb 2026 19:35:32 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org, Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 1/1] spi: pxa2xx: use min() instead of min_t()
Message-ID: <aZyP5NdXWikG6E_C@smile.fi.intel.com>
References: <20260223153117.2838840-1-andriy.shevchenko@linux.intel.com>
 <20260223170903.5f3379b4@pumpkin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223170903.5f3379b4@pumpkin>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_093541_441238_59E1CD93 
X-CRM114-Status: GOOD (  16.07  )
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

On Mon, Feb 23, 2026 at 05:09:03PM +0000, David Laight wrote:
> On Mon, 23 Feb 2026 16:30:54 +0100
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> 
> > min_t(int, a, b) casts an 'u32' to 'int'. This might lead to
> > the cases when big number is wrongly chosen. On the other hand,
> > the SPI transfer speed rate is unsigned and driver uses signed type
> > for an unknown reason. Change the type of the SPI transfer speed
> > to be unsigned and convert to use min() instead of min_t().
> 
> Reviewed-by: David Laight <david.laight.linux@gmail.com>

Thanks!

...

> > -static unsigned int quark_x1000_get_clk_div(int rate, u32 *dds)
> > +static unsigned int quark_x1000_get_clk_div(u32 rate, u32 *dds)

> I've looked at the file...
> I think all the 'long' in that function can be 32bit.
> Especially if the code actually works on 32bit.
> There is also the stunning:
> 	do_div(fssp, 1 << 24);
> in the only bit that that does need u64.

I know, but it's unrelated to this patch aim.

-- 
With Best Regards,
Andy Shevchenko



