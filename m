Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1153CD6E52
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 10:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T7IVg0Z/GtE0lxd89186+RKNusAM87gZCU/HngUTh/E=; b=lCQ6ME1/Ar79rUCC7FmwnwhdpQ
	poY076k1on/3g5Crb93EB2mnPqFgdryQDcNxw3XY3lnoXc7tarmsnjJRmnjVBJjxI9aWtnh4r9Nur
	0M/fwzf5S7Y2DeHkrqmifQXmgkW70EX97e5LEcSAeneFWzgr+NcIj8QIgq9tSvTFj5joNs7Xbt5t1
	pRPQlK5OBMR7KZ4GXkc5mtDEccCkLkLhrVXSvDQlbfHn1KCsBwdQjem3QMGIlaV9hUCays/4uaL1F
	HXMWkHT8b4Pa1ZCL0tPqTP9Vw7r6DxyiiUYvD43zfY7upG39GPPBfnMplz2tPRSFqZdvohDXY2ViB
	mmJMD72g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTdFV-00000009Thj-1a9n;
	Sun, 31 May 2026 10:18:29 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTdFT-00000009ThF-0mvP
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 May 2026 10:18:28 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-39669bcaadfso7875711fa.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 May 2026 03:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780222704; x=1780827504; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T7IVg0Z/GtE0lxd89186+RKNusAM87gZCU/HngUTh/E=;
        b=aZFtYX2hhofn8BrBWNnnOnVfoH/toxye7Wkp3JHEAlOao03xWWtEW/3pM7fSmY5juY
         Fo8+ejX/Pbvi4APm7PNPBWhwHIEyoHbHe0YEAgms/pPHPovjumSu5t7Lg6QRHt273JhQ
         0XjH0lMpCbOv0fCKsM2Uw3lruw3oCv7g0+fk8fiEzHCoJAfcn54TScZ1TD51E9hX7cYh
         VCxp8jqr2ZXMk5iBBZEMmP6+3pEC29SpLeFXxtUiuTfamZp2Qt1p1KF38vX5omdpwcJh
         KufQEBPOhvrRSTxdTCuEjPJSycXnDIVDXXbkdGVZfNZPvLm2ozDgDptfWJPfCFQhcAxv
         JysA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780222704; x=1780827504;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T7IVg0Z/GtE0lxd89186+RKNusAM87gZCU/HngUTh/E=;
        b=RsX7nlhr+5BwRvARrIKzgCsmUWtDBkAcvAPhPNZQzjH/UeWyXs5v7smJxi+ab8L7Et
         /NSWCSPdD30XXWvavX7jaxZ4Kni2IyJz35hlRj/DxzKiFKEEs++1YS7VpsnpQDCSSNzC
         FVQwBvZcki3oNVsQTiun/O7qdNi2WYmocxaebOOoosorPmGedsukp6NtNyOV2FQGqlic
         4YCFlzVRWzbbWNLaPw9H0WlEWBSWAporW4SXSKilvLrzJICV6z2jmL/mTwHt8rQllGpW
         t+kzjH6/P4d2fk9ErGRl0bunIUwj1LeadL2nhJXc9fSi/312w9sekBVTU77/tRwWfHO9
         +zlg==
X-Forwarded-Encrypted: i=1; AFNElJ85Mu1xAG5xDV+PKd25VU3V2bFcf6XADyZKA86ZaIlGgMxg6TbdPq9AOp91C1+iUXqBNV5xo7/ADCJikkGH1ReJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yxd2fDSfvQC1TLT6qY8qraSt1cg4desLxegPzaH3plXI3GcoPAg
	4i6Hn9fml6A1QKepKWy4USgfeybuPYhOoQy5/nw9eMStDMuTFVQ534US
X-Gm-Gg: Acq92OEZloXbDHSYJm6CrnInqij+EVZ5axzBPaF3GsuBRos+4fyiFq2d9DwvUkgBcFU
	MQeXsMPwT7XOMZsZhHKHQjrdJHw0LB/UzsbXTBttsNW3btKLcnV8dxdUHiDV1FONOkYVRq35YYP
	EJ4pZwHPtQc/BzvnLYmzOhGTezdapU2+9M5XZ+jjAKKqJDaUbje8MdI6XUDfKwk4KhCVMHLdWqI
	eoSAmShM/yYBRwG2CzVkhrmwWknKkivcp1KjSPpJ4lOyrG2LdCcNGmkuB1QtQphNiauSs7K0SqS
	Als/wA1Gonu7GEz5TWj8GK74Xhcu7kHyA5I07x7bHO/n5AsHZgElAi4cHKpGFbrlEUqVwEPCCWX
	oIVELROPYp7pj2/NL+Tzi+GFGkXhdB1h7DxVn6N+nNBHkMbASp3mPO0N1A0l5YNudpXo/S1Qi8J
	4tQjuO73QNrRI14o8WBb9r+VBhTYKX3C18pOwb2M9/HRxuoAtV0eD0XsWBDMTQL4nuK/scrq0=
X-Received: by 2002:a05:6512:308b:b0:5a8:80ce:ba55 with SMTP id 2adb3069b0e04-5aa607af794mr1763417e87.11.1780222704172;
        Sun, 31 May 2026 03:18:24 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39659e2966asm15125681fa.32.2026.05.31.03.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 03:18:23 -0700 (PDT)
Date: Sun, 31 May 2026 12:18:21 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Peter Rosin <peda@axentia.se>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v9 1/5] i2c: core: add callback to change bus frequency
Message-ID: <ahwK7XsUswya3F1L@gmail.com>
References: <20260324-i2c-mux-v9-0-5292b0608243@gmail.com>
 <20260324-i2c-mux-v9-1-5292b0608243@gmail.com>
 <ahX44_rzaRlTLSLU@shikoro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ahX44_rzaRlTLSLU@shikoro>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_031827_248654_26E72005 
X-CRM114-Status: GOOD (  28.58  )
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

Hi Wolfram!

On Tue, May 26, 2026 at 09:47:47PM +0200, Wolfram Sang wrote:
> Hi Marcus,
> 
> finally I found some time... thank you for your patience!

No worries, I'm aware of your workload and appreciate you taking the
time to review the patches.

> 
> Some comments here, but I have high level questions first to be
> discussed in patch 5. Maybe we should start there...
> 
> > +	int (*set_clk_freq)(struct i2c_adapter *adap, u32 clock_hz); /* Optional */
> 
> Shouldn't this rather go into 'struct i2c_algorithm'?

Hrm, not sure.
When looking into `struct i2c_algorithm`, it has no information about
any other state. 

Also, the `struct i2c_algorithm` is often shared between multiple
adapters, so if it had the information about the current clock
frequency, it will be shared as well, which is not what we want.

To me it feels more natural to have this callback in the adapter, but
I'm open to change it if there are good reasons to do so.

> 
> > +static inline int
> > +__i2c_adapter_set_clk_freq(struct i2c_adapter *adapter, u32 clock_hz)
> > +{
> > +	if (adapter->set_clk_freq)
> > +		return adapter->set_clk_freq(adapter, clock_hz);
> 
> So, Sashiko mentions[1] that setting 'adapter->clock_hz' below is not
> executed. This is fine in my book because the requested new rate might
> not be the actually used rate. However, I agree that it must be
> documented that the callback is required to set 'clock_hz'. Or maybe
> even better, the callback should return the newly set value and this
> function then updates the variable?

I will look into this, thanks!

> 
> [1] https://sashiko.dev/#/patchset/20260324-i2c-mux-v9-0-5292b0608243%40gmail.com
> 
> > +
> > +	/*
> > +	 * If the adapter is a root adapter without .set_clk_freq() implemented, this feature is not
> > +	 * supported.
> > +	 */
> > +	if (!i2c_parent_is_i2c_adapter(adapter))
> > +		return -EOPNOTSUPP;
> > +
> > +	/*
> > +	 * Update the clock_hz for non-root adapters, even if .set_clk_freq() is not implemented,
> > +	 * to allow the clock frequency to be propagated to root adapters that do support it.
> > +	 */
> > +	adapter->clock_hz = clock_hz;
> > +	return 0;
> 
> So, Sashiko is IMO correct with asking what happens if setting the new
> freq in the root adapter fails? There is no path to restore the old
> values for the children then, or did I miss it?

I will look into this as well.
Spontaneously, I would say that if the root adapter fails to set the new
frequency, the deselect chain will restore the old frequency for all
children no matters what.

> 
> Happy hacking,
> 
>    Wolfram
> 

Best regards
Marcus Folkesson

