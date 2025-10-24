Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D530CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 15:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SNrPSnUwQSgek1TWOY7IJ65SZA0nkgGonkU8txu9DEo=; b=fULOov1LI8sIM0lUaKVgx6GuV2
	c1asnqRzFhpghBsNZCdlPnSF5zakc+LMbEkXQ5UXVZeFIJet7FC11iJ2ScTFkkS7mtWfWvbVzUUpb
	Fcjc8cM8pPc2IyGeAqyydmUzcZsfy62XaKUrt/5lRGuXfFlBuoABzm5EDOfqnC+KdFTBAu/NRte+w
	W5Ba183DE58+5dg7UJUyWq6bIjhothPXTvid8UdvoF703j7ZnJ+T5KMZom7+cy3Ous26FnvYIN3UO
	MYCzLC0KBiUtfzdS60f3brIQrrwLWxkvNsu1YKyeOif/Sc5KAnBCS4A5vnbi1lP1Ju6lT8OLCbTWv
	yz3haJKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCK7n-00000009sBb-1XS4;
	Fri, 24 Oct 2025 15:54:43 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCK7k-00000009sB5-2wwp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 15:54:41 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-781206cce18so2373255b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Oct 2025 08:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761321280; x=1761926080; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SNrPSnUwQSgek1TWOY7IJ65SZA0nkgGonkU8txu9DEo=;
        b=QkN4AL4WPhOzF3qbund0NXAEn9SZlC4NlTmsCYxMbP3C5nbLLzKFPqNT0x5oNbwH2z
         z2ooNlmmEK96Wji3l4e/QbmTRTC1ocADrvo/zuFRMdQbJLGK9xLjzuAXnMNhAN7USlim
         IuMIoxuQ4glytMLjc41extjX8sKOtyEYWMQH5T8m2od0vODkDLxh8yPI9sWa5KFuHdX2
         SA+fWwPWZy8qQOhD3zy9yAh+kdWGlAmIHwAfHVDdduMp92OxYtxVzqqEDsVXa4SqUqtj
         khIWKMD3BayDpraWVfI840cVzblY3U/tn8kwMDkXvjBYx6rvOOY0jOMZBgiVjmHljoo2
         O8/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761321280; x=1761926080;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SNrPSnUwQSgek1TWOY7IJ65SZA0nkgGonkU8txu9DEo=;
        b=oiSCKeLW/aL++ZqzSp69iEBnrh34rPfzckUCgXH8fhzQYd8oR1mLo/j6FBMa2Mbl8J
         0icFKBM8rQag7kwJMNxZZHhQji3uRg8fPvH2xX1VBSh0VrVc0/yv2vs7CaNpzRVBNu8T
         XX7mGYuNI6onvpb1pj1zJKvidhVGGbk9FS9Eo4lDklzRF3fn6mc0ij8Abo4WHyZ8+GZq
         qalSZxRq5W0B35aLE8r6xZOb70gG/SUOCFJY69BRmdzg7Vs2EARiKatPryU2hpW55LoE
         +pLysNo9aaWjsknsDzg4FZ/bah6wUrMW8DfHyB/aJLgK3FMD449FjMDc1HI3uLzFN/Tq
         AGOg==
X-Forwarded-Encrypted: i=1; AJvYcCXUrS8kilnoa/EHJPJJfCS3cxH1tG7QVA+2OFGb4Vf9+pnBbSkVLNN7k4fWZiKlMaK20EBww8iufctKwYVgi2Ic@lists.infradead.org
X-Gm-Message-State: AOJu0YwjJPWS/6a0BEkkgEcfPnPcQgRV9iUNOhUhcSxtI4l7TQ2sYv6y
	AAHyLdRsDDCWOaB2khswaL7ICbsViLJLFcwtqX2QpCyl3H9EBWtGpFjeAiWcFA6kEg==
X-Gm-Gg: ASbGncsZAkb06gN3TFRF+K+mHeVdKFWHe+R1NEwrkBvBxWmuB0MKQatmyY6oOAALAqt
	fBorqb0dkROgE8kBl3yQ4TRidLwU1vsG1JCavTt/2Ph7U6a/LAhHHxbITsRDjb3HjgNxiKErL4R
	OAtRVQC6gDTOh3e6IDC4BWAQx/AdCjRBVV0ByHBZOiWvKGIvHUzGhWDAar7m/ks8zlHfeTHuU5A
	YHT4boFBDOalsF/H3fMsgc3SWz00MKsja+cpqKOBfzGFko/X8cDJCegu1nRDii4RDIeIUB1Dd4a
	OciGf0zgw1P5RQxvNZIjS6rS4jbWlPBhZ1A76+cKMtLHOBOFpVPfFJzPjpgGCU1UMW4PRE3jjC1
	82eKV1EF7UfD0GHqP0dfsx0rKoICh2WAypC/TBF73+ylp12OxGCrLzl4k8RvzmiLdL8ti2NCebE
	xo1DPzIkSgLux5IJQk7855MdRSTqpCz6u8Uz51LBhWfdZJx54W
X-Google-Smtp-Source: AGHT+IFKK/nc8huqNArnVsQcPMFPGO2/41KstRTfEUMyU+vcdTuI3QzEMa2HNBjhFdRtL+9SlQ1fRQ==
X-Received: by 2002:a05:6a00:13aa:b0:772:6856:e663 with SMTP id d2e1a72fcca58-7a284dbb2c9mr3491514b3a.8.1761321279403;
        Fri, 24 Oct 2025 08:54:39 -0700 (PDT)
Received: from google.com (80.88.82.34.bc.googleusercontent.com. [34.82.88.80])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a274a9e8fasm6403828b3a.29.2025.10.24.08.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 08:54:39 -0700 (PDT)
Date: Fri, 24 Oct 2025 15:54:35 +0000
From: William McVicker <willmcvicker@google.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Ingo Molnar <mingo@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Youngmin Nam <youngmin.nam@samsung.com>,
	Donghoon Yu <hoony.yu@samsung.com>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	John Stultz <jstultz@google.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-samsung-soc@vger.kernel.org, kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v5 4/7] clocksource/drivers/exynos_mct: Use percpu
 interrupts only on ARM64
Message-ID: <aPuhO5wn8O85krV3@google.com>
References: <20251023205257.2029526-1-willmcvicker@google.com>
 <CGME20251023205313eucas1p2164ef0c1db80bccd2bbd6a79e809a1cb@eucas1p2.samsung.com>
 <20251023205257.2029526-5-willmcvicker@google.com>
 <c09387b9-3fcc-4d0e-8e29-21dee196014a@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c09387b9-3fcc-4d0e-8e29-21dee196014a@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_085440_742499_9D09BE39 
X-CRM114-Status: GOOD (  12.59  )
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

On 10/24/2025, Marek Szyprowski wrote:
> On 23.10.2025 22:52, Will McVicker wrote:
> > From: Marek Szyprowski <m.szyprowski@samsung.com>
> >
> > For some unknown reasons forcing percpu interrupts for local timers
> > breaks CPU hotplug for 'little' cores on legacy ARM 32bit Exynos based
> > machines (for example Exynos5422-based Odroid-XU3/XU4 boards). Use percpu
> > flag only when driver is compiled for newer ARM64 architecture.
> >
> > Fixes: f3cec54ee3bf ("clocksource/drivers/exynos_mct: Set local timer interrupts as percpu")
> 
> This tag doesn't make sense in this patchset. Simply squash this change 
> with the previous one, adding the following tags:
> 
> Suggested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Link: 
> https://lore.kernel.org/all/20250827102645.1964659-1-m.szyprowski@samsung.com/ 

Okay, no problem!

--Will

