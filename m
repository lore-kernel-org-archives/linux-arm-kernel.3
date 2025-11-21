Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E2CFCFC29B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 17:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2ZYN6CUWohQloljnDLqdKdUMC90qRAZ5XfNki7IHyQA=; b=MBGBgPIm317kHBwFehNp4OQ+WT
	XhHtzwcCDPxZ9LezlJovRV7/C0aC2G5LB1ieXqYqXdT18XwiAs/uXhRRCv+gJ8eInpPCUJMZPrZgh
	bNJCuJDB9kx8fo0yghHX8YNfUx5lPgnF2yZP68dLahjRFZPFRotwe66RerQq+bu6OQFahXPFtY4MG
	UOHT95bDLcUvVUE4yDVVCmjQzJ79WVxddDAjRK/Sz0uQ8ywKzQEn6nZ/uDRw5L/cUrTCl8sROMayG
	YMtZqOkh8ycpdfZUPzaJJSa4pQDpB9OE8/OLV201CQqz9HnyWnM6IpK9z4NEV1NXLLRZWYqelgiyg
	cMdkSPuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMVIm-00000008okY-0SwJ;
	Fri, 21 Nov 2025 17:52:08 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMVIi-00000008okA-2wox
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 17:52:06 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-7aab7623f42so2357511b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Nov 2025 09:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763747523; x=1764352323; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2ZYN6CUWohQloljnDLqdKdUMC90qRAZ5XfNki7IHyQA=;
        b=ItYpm+VXsPr2nrUaS9nQlX+rFh4Y7QLwFdLAd41+qxBSH8/7N1vSJ0O9UMtY592rxR
         Ra4C8Pr1g8VYGPBMu2Y+bfyD6Ho+rRQbME76J7S4XsQnTVmvExxVtAnIUBqPzryiFMm8
         GetKaROgymDhNo7lmtpK6RAm2pHqUZzmpo7LPCI2B5yxfFflNwfGp3y/B9RQpZCmxIBP
         5f46SqwYu0ND8ul4z8zSXKhcFEdFtMrHHYYyYY7buKm2o+pF9xHrJUnhJfZ2tlATbnr6
         nY2FK3RzvOLu/LQyqFGdPCJSPn+i2ZUcKn/rb8nMzuxmujlcXU1Eo4tZcQNGZNxsSgGk
         vUwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763747523; x=1764352323;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2ZYN6CUWohQloljnDLqdKdUMC90qRAZ5XfNki7IHyQA=;
        b=OBXztcOZ2kwAVEJBRkeDK14eTrYA0V/WPOJsNkFcbW7JWUYVc1pvOeci7mpp1Q9dGo
         6UdUhXzy5yY7yEzAvsWPImq63d+hQRKptFAMc5BGwRG+ueEGPUq+EATZBiUPf81nqjYK
         CnJZzo9Qsaqcdy78qeFC0BSRW2PGnJbvrfsbRzGyEU24a9z7Gd0yFBDLLXixzqP4HVNw
         C5ghH43WHuCPSRdtCObYRXlGlcMmlyzQWE+0w8aTBW4xw6/dzH5DhJqL7oMnjSv72Zog
         yOou7d6icJKv/kA17i4XC9qUl4gRJ+YC4Q3v1Y9FHRuwc4lV2NHFBsWNLeBsJ2QhiIeN
         cmNw==
X-Forwarded-Encrypted: i=1; AJvYcCVjhaH6/eWqXWStwk0EQKGTyrP81eIpv21ixUB0wq88ym3ab0Lw7c/RUOSabaxewlIZyzftehmjoveLyr7aeONP@lists.infradead.org
X-Gm-Message-State: AOJu0YxLq4ZQ0NCmKeVZJcGX6fzKMcpL9JO3zykcP8GRVJgxJw+r0LOs
	M8e9aDeg3Xn5I+l8a2r549W7wF4BxWkdFrgW0nns2i+WHEuYsHeKnaRbXgCZJcSSZA==
X-Gm-Gg: ASbGncsAkkimU5bep1Z+YstvxrpsFQlBrfYfhh2qKq0asgZdWA97patSmJaKEnw3EUA
	oLEDQNU8I2ScR9aqLWXRw7JYxyy07bEWbgimUKRlZ1el1kuUFhlwCuty9YPXE6Yn8uBBxMWWwi+
	xiB+jvcOD6qrQnukmGPUH4VvnlNK390zZdAdOJ+RYn3CI9ZroDBUqX9PQpFkk5pbalqlhnvXr1T
	/9YG035LxZuYzRgOmObEq2+wXB8y2Yh7nJY4cXvdaIFAUFmd5CKdFFdSAVGGJ+WwdEnQitweL9U
	d0pRlKzKsePT7DUMwP5uCo7QDu3jWB37vWSpud3VsXfnhcSIASZfxZGlrT39V8wAtLOTAGSMjvB
	g0ZZXwRKAtjCwNze+fEJKfI9N7oaYgp2qVe6/zjNHJVsl8OY0uknuYBeOEIIiWZtEj3zaOdq0CW
	yZ2cmQyU0xjOYe9rLk2m/pXMwqmpUbVfi6DygSdHiBFaiGdA2o9w2lxqA=
X-Google-Smtp-Source: AGHT+IFPL3FivnOWfid8exhOdWBbh9Ql9Sf8cs9AXnf97m9xxC/jy3I6lLegY3I666JwhN5KsK/Tfw==
X-Received: by 2002:a05:6a00:9286:b0:782:5ca1:e1c with SMTP id d2e1a72fcca58-7c58e112b18mr3708723b3a.21.1763747522951;
        Fri, 21 Nov 2025 09:52:02 -0800 (PST)
Received: from google.com (226.174.82.34.bc.googleusercontent.com. [34.82.174.226])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3f174ba7dsm6627878b3a.64.2025.11.21.09.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 09:52:02 -0800 (PST)
Date: Fri, 21 Nov 2025 17:51:58 +0000
From: William McVicker <willmcvicker@google.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Donghoon Yu <hoony.yu@samsung.com>,
	Hosung Kim <hosung0.kim@samsung.com>, Rob Herring <robh@kernel.org>,
	John Stultz <jstultz@google.com>,
	Youngmin Nam <youngmin.nam@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-samsung-soc@vger.kernel.org, kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/6] ARM: make register_current_timer_delay()
 accessible after init
Message-ID: <aSCmvsOc13Z1TS6y@google.com>
References: <20251120184242.1625820-1-willmcvicker@google.com>
 <20251120184242.1625820-2-willmcvicker@google.com>
 <aSB_bUbfjenD1fjZ@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aSB_bUbfjenD1fjZ@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_095204_753109_F47EB68A 
X-CRM114-Status: GOOD (  27.17  )
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

Hi Daniel and Russell,

On 11/21/2025, Russell King (Oracle) wrote:
> On Thu, Nov 20, 2025 at 06:42:29PM +0000, Will McVicker wrote:
> > The function register_current_timer_delay() is called from the
> > exynos_mct clocksource driver at probe time. In the event that the
> > exynos_mct driver is probed deferred or the platform manually unbinds
> > and rebinds the driver we need this function available. So drop the
> > __init tag.
> 
> First question. Why.

Sorry for not explaining this very well. Let me fill in the gaps.

> 
> Second, have you analysed the code to check that you _can_ call this
> after init time?
> 
> Let's look at the code:
> 
>         if (!delay_calibrated && (!delay_res || (res < delay_res))) {
>         } else {
>                 pr_info("Ignoring duplicate/late registration of read_current_ti
> mer delay\n");
>         }
> 
> So, if delay_calibrated is set, then this will fail. When is that set?
> It's set by calibrate_delay_is_known() and calibration_delay_done().
> When are these called? Basically after calibrate_delay() has finished.
> When is calibrate_delay() called? It's called by start_kernel(), while
> the init sections are still present.
> 
> So, calling this _after_ the init sections has been freed will result
> in the above pr_info() printed and this function doing *nothing*.
> So it's utterly pointless to call if the init sections have been freed.
> 
> Please find a different solution.

Sorry for wasting your time digging into this! You're right we shouldn't (and
don't) call register_current_timer_delay() after the init sections are freed.
This change was made purely to address the section mismatch compile-time
errors. The Exynos MCT driver cannot be compiled as a module for ARM 32-bit
devices; however, since ARM64 and ARM devices both call the function
exynos4_clocksource_init() and ARM64 configurations can set the MCT driver as
a module, we hit a section mismatch error due to calling an __init tagged
function -- register_current_timer_delay() -- from a non-init tagged function
-- exynos4_clocksource_init(). If you inspect the code, you will see that
register_current_timer_delay() is compiled out of the driver for ARM64. To
avoid hacking up the MCT driver with more `#if defined(CONFIG_ARM)` to handle
this section mismatch, I decided it was cleaner to drop the __init tag.

I'd be happy to re-factor the MCT driver to split up the ARM and ARM64 parts of
exynos4_clocksource_init() to avoid the section mismatch altogher in order to
keep the __init tag for register_current_timer_delay(). Given the comments
here, I think that makes sense.

I hope that explains it. Let me know if I overlooked anything.

Thanks,
Will

