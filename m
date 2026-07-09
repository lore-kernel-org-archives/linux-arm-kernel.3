Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 529A9C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 08:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=THSFgL0Y2FKUJgLIXJuUKx+xnsBMsYVZ+QMA86TDiMA=; b=iblfyAZETh9RiCD2wmOE/pAmwI
	9Tt5loL9bvhTpPwmcosZi8opXA6JF6shh1K3fR55gdX+FvXEI4sJrVrvW4R1U86V2gzbw6rf2qM3x
	Qb+3Bq6fW8bKFIrdEetP0tOEpXRoCg5lfF5+kXuG5TcHEXh64ci/WSpaPzQ5iuF1lPLMI4ZCip2Uw
	Howj44bRnV4+ntOHIFbjtx76EbHLBh8prjvX9W6gQ2Np8xr6fQJph1u3b16XiWizpTMPO8/c0lzBx
	ZKPiHZzV8WEiMEOTXWhHufUCy0zcPUeeBp1Mu9+lka3wWlcKl614fAbaFtlHReNzcbJhZCJjBT1i0
	B01AA0mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whkDe-00000001R65-3TwY;
	Thu, 09 Jul 2026 08:34:54 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whkDc-00000001R5G-1fls
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 08:34:53 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-5b015b2d792so713962e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 01:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783586090; x=1784190890; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=THSFgL0Y2FKUJgLIXJuUKx+xnsBMsYVZ+QMA86TDiMA=;
        b=LELHdPZ8a403V38FEFL3p9A2DGxw/ezbYSc91lcK8LyBeiraOP0LWHLq7k3Tp9rtru
         ioDCLot03qW3rIcIqpEG2TfWQOh8sm89009/tEuuUIjS8uH3u7P1T5jkXZRuNIkZPtla
         SJ5BDuyD5WPKxndSbKAlvbsYhKBpymLLxSMLjBEYrW6JUCwkjNgsCp5Gt5FuFMS8mwr9
         7ROmC9GCZuI+0BMKtTbuzRlIXbv9EIURc2ocFCjY6+cEcqbTZhq209gS5FvJS75PHIxS
         yJlq4wlDePeokhN/YCfTROXlODMxynDYA/Vruwx0HG5/XD6nY3C3IS7ShiWZ6SVYzJcZ
         f7Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783586090; x=1784190890;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=THSFgL0Y2FKUJgLIXJuUKx+xnsBMsYVZ+QMA86TDiMA=;
        b=D+zLHLgI6rsn3/SfCIUWmdJzkYEhIEuervGXshjCXLYRCdWRJf1pqATjF5UWOh9vAX
         48MxLVyfWDkKuz/Jy1VDEO9q4SJTcVZdn0SvSyaR/UF0u4bLpDt3MMpBpMZ1wJrUzxO4
         Y3rDn7SB0FaRTKAmXcxilzi5d50Pe+FVz2HlMcU4vdqU1aPANZNqawvCgszc87ceNQEo
         Bx4P3mpmJDtccM2JLpXqsE5fKITv5nGMb3lvpao+ipcRoQop868qW/6vTEmBFWfABY71
         hEBxL8Q4cMVcKc5XQrx/Z989yk6MRjehQ0/ziOSemtpLxYP+kJAs3Mn+whnxX53wwF6O
         DX2g==
X-Forwarded-Encrypted: i=1; AHgh+RrK8CcDTLlitCKK6cRrdR1yWQZ9lfKm2XEEFAec3qeg1nSDBj02kik1gdvwGTrcvCxEV9mVwqVG71HANwyUf/Ou@lists.infradead.org
X-Gm-Message-State: AOJu0YwG8XiqmlOWVcGPpNxKCcBhQuqPHge6ezDxPG9S7o6P0mIJKdlq
	g+VCOCq4EHfJEznH282VFpqZSU93hWYP5lEL0LY2WX4tRO97sKrHlqzo
X-Gm-Gg: AfdE7cneprG9VpweNgdM5VxTN1gNW5/PlRFU1ur8FNTqMXE5JmSqgl2/52soVdfSMth
	8urXQxe5vXtj9e8D6mpaaSw4agUtDDuqfrkSY/YfHHhz1MIenwMJxRgq7ZQk59Oy4nV85SOcaAJ
	xZ9XPXWT8Sh9hId2QEMYSGkUzY8Nq5pPn7QgHM+91D7QmVhFaGBMCnZ+bdkZM7kxwPoy+4KKhAx
	p9Z5YenWm7qQplmqhpLnBJ8mGxMaV5r64pVcYBFmQpZVVj3rQR2gG/eretbipUz9VHqaxebZ2uZ
	uB2ZugYDHcvmbYuKqR4tJYDJjML7POfdeVAtRTrrdh54Iw3Pa6VRs6+GS8QK8G3rStUU2Plf7Qb
	vbQnBsyFErQhlGEwmiRti6kcenTuAawkgLbESlTjXe0y+QQwGgb/sYm0PREpja8IwCYZz5QoXTP
	hnhNpEd9Dqj6vOJv7BvFav/V8SdDPsZmFiA6I8vZjctL53np2yXA==
X-Received: by 2002:a05:6512:159c:b0:5ae:d399:ceb8 with SMTP id 2adb3069b0e04-5b011472e03mr1731318e87.56.1783586090129;
        Thu, 09 Jul 2026 01:34:50 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13c3a15sm5082954e87.68.2026.07.09.01.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 01:34:48 -0700 (PDT)
Date: Thu, 9 Jul 2026 10:34:46 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Peter Rosin <peda@lysator.liu.se>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v10 4/7] i2c: davinci: calculate bus freq from Hz instead
 of kHz
Message-ID: <ak9dJm5GVfCOqAsU@gmail.com>
References: <20260708-i2c-mux-v10-0-09dca03c8a15@gmail.com>
 <20260708-i2c-mux-v10-4-09dca03c8a15@gmail.com>
 <ak6lWKWDM8XwqLgw@ashevche-desk.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ak6lWKWDM8XwqLgw@ashevche-desk.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_013452_460912_756A79E5 
X-CRM114-Status: GOOD (  19.93  )
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

On Wed, Jul 08, 2026 at 10:30:32PM +0300, Andy Shevchenko wrote:
> On Wed, Jul 08, 2026 at 02:16:16PM +0200, Marcus Folkesson wrote:
> > The bus frequency is unnecessarily converted between Hz and kHz in
> > several places.
> > This is probably an old legacy from the old times (pre-devicetrees)
> > when the davinci_i2c_platform_data took the bus_freq in kHz.
> > 
> > Stick to Hz.
> 
> ...
> 
> > -#define DAVINCI_I2C_DEFAULT_BUS_FREQ	100000
> > -
> 
> You need to rebase this on top of the i2c-next.

Thanks, will do.
> 
> ...
> 
> > +	/* standard bus frequency */
> > +	unsigned int		bus_freq_hz;
> 
> While at it, I would dare to suggest _Hz as we started doing in IIO (id est
> we start following more closely the SI units in the suffixes of constant
> definitions and variables to be case sensitive).

Sounds good, I will change to Hz.

> 
> ...
> 
> >  	r = device_property_read_u32(&pdev->dev, "clock-frequency", &prop);
> >  	if (r)
> > -		prop = DAVINCI_I2C_DEFAULT_BUS_FREQ;
> > +		prop = I2C_MAX_STANDARD_MODE_FREQ;
> >  
> 
> See above about rebase.
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
Best regards,
Marcus Folkesson

