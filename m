Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F13ACC4450A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 08:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=adUBNob18OYmBB9kVkDazfnMtoQOgNrVku/4a5SwouA=; b=Z1lwv6MEQL7M0/cB0H5uAmxp+j
	9DLKoVvPBWyWahkfiPlY7DCRGobtZe7Vqb+nI9MpUGd2qVARFmZCPyZ1DqQXNPeeIRfMMDZ+WzrsC
	Mxm3mEGs/ZBJRoZ830Zut3NHTb4EbmWidIomkMlOI4b3jrcWFuFTTA9YeM91sdcUW41ey2OJ3UHWF
	elU2PJdTsGMyc8kyEleiTy9mlvACuOmnI3FOlhPlJHqSUfQvQZ/NLjBXJcT6m0LzQBgKvYHKru3M/
	Mb0S0ZgEu8on9OzmsdYEvuuwOBTxFkXUUkhQj/qC8aCGezzoYwrRuAe4SZKP9TbO/MmdaG92cF2xw
	KzGs+qKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkHRG-0000000Gkgq-02JD;
	Thu, 16 Jul 2026 08:27:26 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkHRC-0000000GkgB-3P7n;
	Thu, 16 Jul 2026 08:27:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784190442; x=1815726442;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5oa/5XioJ8flc5AgybunsF5G261OjV++bUe/mqwllp4=;
  b=ijut/ciCPyYEeatgfxdksK/tovlXGKAUXqWV98kfOU7IyD7fW/0oOD0W
   aVJkTj9xEYfbGAkc/0CmEsRLGsG+3P8ec8zInTqRZpK5c9VT2lCHvQchj
   /btemIFPM1aaHoXjZK9BsZ9RxBHBrHm5/+P7bCFkepo8ZAgOLqkOUiZR1
   mAGKKAviQ1UKDND0sIahctijVIYtV0PFxR0fvY4cLgghaIF3dq21G7LnX
   5zVGUINLj47YER7W/I64uUh+1uVHXxBya2WQ4VcTlQLPKIdqrIfSJmKqz
   HNgIhctv2TE03KStTFpDroQ3flbFzQ/GjcJqeQW4U6Jr7In1P6b9izKCr
   g==;
X-CSE-ConnectionGUID: 3YejFzJeS+KMPDkz+Z3R2Q==
X-CSE-MsgGUID: qQvhWYGrS4uLZh7+Ro0bvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="83826039"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="83826039"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 01:27:22 -0700
X-CSE-ConnectionGUID: 43hHWRy4SXmvtkTrwMjpSw==
X-CSE-MsgGUID: stKbAuGLSyOVXOgq7dl9xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="279701626"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.26])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 01:27:16 -0700
Date: Thu, 16 Jul 2026 11:27:14 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: Michael.Hennerich@analog.com, afaerber@suse.com, andy@kernel.org,
	brgl@kernel.org, conor+dt@kernel.org, cy.huang@realtek.com,
	devicetree@vger.kernel.org, dlechner@baylibre.com,
	james.tai@realtek.com, jic23@kernel.org, krzk+dt@kernel.org,
	lars@metafoo.de, linus.walleij@linaro.org, linusw@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-realtek-soc@lists.infradead.org,
	mathieu.dubois-briand@bootlin.com, mwalle@kernel.org,
	nuno.sa@analog.com, robh@kernel.org, stanley_chang@realtek.com,
	tychang@realtek.com, wbg@kernel.org
Subject: Re: [PATCH v3 3/7] gpio: regmap: Add gpio_regmap_operation and
 write-enable support
Message-ID: <aliV4u6_xzx9D9Aq@ashevche-desk.local>
References: <d301ba0cd45d49d59e6a014188306ec9@realtek.com>
 <20260716062614.1507243-1-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260716062614.1507243-1-eleanor.lin@realtek.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_012722_910471_8876BE5A 
X-CRM114-Status: GOOD (  28.84  )
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

On Thu, Jul 16, 2026 at 02:26:14PM +0800, Yu-Chun Lin wrote:

...

> >> > -     ret = gpio->reg_mask_xlate(gpio, base, offset, &reg, &mask);
> >> > +     ret = gpio->reg_mask_xlate(gpio, GPIO_REGMAP_SET_DIR_OP, base,
> >> offset, &reg, &mask);
> >> > +     if (ret)
> >> > +             return ret;
> >> > +
> >> > +     ret = gpio->reg_mask_xlate(gpio, GPIO_REGMAP_SET_DIR_WREN_OP,
> >> base, offset, &reg,
> >> > +                                &wren_mask);
> >> 
> >> What constrains these two to provide the same value back for reg?
> >> To me it seems like the write enable might well be in a different register.
> >> 
> >> >       if (ret)
> >> >               return ret;

...

> >> > -     return regmap_update_bits(gpio->regmap, reg, mask, val);
> >> > +     return regmap_update_bits(gpio->regmap, reg, mask | wren_mask,
> >> > + val | wren_mask);
> >> >  }
> >> >
> >> >  static int gpio_regmap_direction_input(struct gpio_chip *chip,
> >
> > My initial design indeed assumed that the WREN mask and Data mask reside in
> > the same register.
> >  
> > Regarding WREN support, especially if WREN and Data use separate registers, I
> > came up with three ideas. Which direction do you prefer?
> >  
> > Approach 1: Provide Custom Callbacks in config (Let consumer driver handle it)
> > We can add '.set' and '.set_direction' function pointers in
> > 'struct gpio_regmap_config'. If a driver requires WREN, it can implement these
> > callbacks itself.
> > 
> > static void gpio_regmap_set(struct gpio_chip *chip, unsigned int offset, int val)
> > {
> >         struct gpio_regmap *gpio = gpiochip_get_data(chip);
> >  
> >         /* If the driver provides a custom set (to handle WREN), delegate to it */
> >         if (gpio->set) {
> >                 gpio->set(chip, offset, val);
> >                 return;
> >         }
> >         /* ... existing generic regmap logic ... */
> > }
> >
> > Pros: Clean core, no need to touch existing drivers' xlate signature. The consumer
> > driver handles its own locking for different registers.
> > Cons: It feels a bit strange and inconsistent to expose only '.set' and
> > '.set_direction' overrides while keeping other operations entirely abstracted.
> >  
> > Approach 2: Handle separate WREN register in the core (with locking concerns)
> > We keep the 'XX_WREN_OP' in 'xlate'. If someone needs WREN and 'wren_reg != reg',
> > we write to both.
> >  
> > static int gpio_regmap_set(struct gpio_chip *chip, unsigned int offset,
> >                            int val)
> > {
> >         /* skip */
> >         ret = gpio->reg_mask_xlate(gpio, GPIO_REGMAP_SET_WREN_OP, base, offset, &wren_reg,
> >                                    &wren_mask);
> >         if (ret == -ENOTSUPP)
> >                 has_wren = false;
> >         else if (ret)
> >                 return ret;
> > 
> >        ret = gpio->reg_mask_xlate(gpio, GPIO_REGMAP_SET_OP, base, offset, &reg, &mask);
> > 
> >        if (has_wren && reg == wren_reg) {
> >                mask |= wren_mask;
> >                mask_val |= wren_mask;
> >                has_wren = false;
> >        }
> > 
> >        if (has_wren)
> >                ret = regmap_set_bits(gpio->regmap, wren_reg, wren_mask); 
> > 
> >         /* ignore input values which shadow the old output value */
> >         if (gpio->reg_dat_base == gpio->reg_set_base)
> >                 ret = regmap_write_bits(gpio->regmap, reg, mask, mask_val);
> >         else
> >                 ret = regmap_update_bits(gpio->regmap, reg, mask, mask_val);
> >  
> >         return ret;
> > }
> >  
> > Pros: Keeps all WREN logic unified inside the core framework.
> > Cons: Introduces a locking issue. writing to 'wren_reg' and then 'reg' requires an
> > external lock to be atomic, which seems to defeat the purpose of relying on regmap's
> > internal lock. 
> > 
> > Approach 3: Assume WREN and Data always share the same register
> > 
> > static int gpio_regmap_set(struct gpio_chip *chip, unsigned int offset, int val)
> > {
> >         /* ... */
> >         ret = gpio->reg_mask_xlate(gpio, GPIO_REGMAP_SET_WREN_OP, base, offset, &reg, &wren_mask);
> >         if (ret == -ENOTSUPP)
> >                 wren_mask = 0;
> >         else if (ret)
> >                 return ret;
> >  
> >         ret = gpio->reg_mask_xlate(gpio, GPIO_REGMAP_SET_OP, base, offset, &reg, &mask);
> >  
> >         ret = regmap_update_bits(gpio->regmap, reg, mask | wren_mask, mask_val | wren_mask);
> >         return ret;
> > }
> >  
> > Regarding this approach, I would like to ask from your experience: Is it
> > actually common for hardware designs to place WREN and Data bits in completely
> > different registers for GPIO operations?
> > 
> > If they practically always share the same register, this simpler approach might
> > suffice.
> 
> If there are no further concerns, I will proceed with the third approach and
> send out v6.

From the above list I tend to the approach 2, but this might require to have
GPIO regmap level of locking. I'm a bit lost in the context, though. I assume
we need a fresh start, id est issue a v6 with approach 2 or 3 in place and
summarize the choices in the cover letter, so we can understand what has been
considered.

-- 
With Best Regards,
Andy Shevchenko



