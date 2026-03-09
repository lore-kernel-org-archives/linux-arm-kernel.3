Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33FA4FCA19A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 22:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hrSbyZBA5Px2iidq6W57qtYbXFOmMx8uhJF7gt5CJ8A=; b=A1462nzOvJa1Gty9YEnFQpLeza
	ndzxjBvbnJTpe7Pxi7r30uHzyCX//pJhpSY/JGw54GIXx1FnwjDeDbu3QTt+8cD9Zv7xbcH2TLibW
	lHj7wejWr7wOGg58zp2YyhddekuGA2vRQCjUBqvUWeS+opq9n93OgV2YMUkZUz25VybkNaLXZL+wI
	hubWUncwhM2mFfAD9Oj+LUEgNShpmGmhA4gOUUZfLkEdrRh9oE2rRsYu8pMP5BwVEzt8WbHs8aH2h
	A2gr0uOrZWgc+IqPhCDePibZPXkozIsjosGA4AFi2JpfzWpNsErroxaWnHI+9s5d4rN9A7yue6RB+
	KqMyeZww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzj1V-00000008Ddo-3ZgB;
	Mon, 09 Mar 2026 22:24:25 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzj1T-00000008DdH-2dxa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 22:24:25 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2aaf43014d0so89994575ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 15:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773095063; x=1773699863; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=hrSbyZBA5Px2iidq6W57qtYbXFOmMx8uhJF7gt5CJ8A=;
        b=YqiRhu2hntooiKOHpC23pcmGPc96zqCvRSUtfc2+rWWRHQ6PKR0llWXgKZYuav6Maj
         2aXR7Yd0yFFH3qScvaPSLIILdYYsdPVup4dISljZCoAkIpIpljjpoFIPOBt2476y048t
         VEnSNBPLiew+1va/FFzt1bGnaZA+W3lLC/pYrnx7a10HpV/IESH2F4OawebMGqWg+RFI
         uTN4zDUVmxioUqferK4a6Ak8R+GmiROefKw9S6zaqRicEdtQ0xpxjF1IlLjAOGnmdz+m
         S8klOdm3JUow0GhQ91+m/TZ4diOB1oylp1owBG89ynsZH9YehQyP1g+qxmgRnavEBqe/
         J3Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773095063; x=1773699863;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hrSbyZBA5Px2iidq6W57qtYbXFOmMx8uhJF7gt5CJ8A=;
        b=PZINB2Fo55YeP1lEVPcYTK7FMVI8KDz66wdtR0bwOldK9XRAU7Yl1wvsf6mwZTjUUc
         pr67jX2TqN4KlpF65T+8p3KVLqpGsvTv0+wTMkgUNSjuoY9Gkdjc23YBj28v+Y1T57lE
         BRqO4bVtGBKlqyNgMC1ZxDYHgoFr0n0+7WZ8FbMezCrjPefwg7XINx162ZPVD4UNrH86
         WZ0DeeTPQuGCB332DC8mSPbGAKaTMJcjZ7rXTB4XSUv8SGKeVffK52Iuqe+6RbBI2eKt
         dxSSgGuWpy7XyvPURfB5/DjhpnKoEDqqRnn1Xsk90RzbVSawMk0YotAa0XEyEkICi/iK
         FnVg==
X-Forwarded-Encrypted: i=1; AJvYcCXvm9utsoEKJvNJHX8PoUSpFxjCRpVmusH3t3kEdi2Bs2RBtJ1MK6a1HlUJ7nYHPBQI0rbT5k+bskdCE9DksUuu@lists.infradead.org
X-Gm-Message-State: AOJu0YxwFoHCIClV3djMEgVQq/y6nPb4Pm3kK6HHVe8ZyiJsKf3bufaU
	4UJfFiLuMEd1W97ORbj8kbqlqFposCksiZvMXw7MDuORQMJ8wvy9O91gWpFbjpBatgc=
X-Gm-Gg: ATEYQzzqAvhrA7CqHS45nAmIKHjX6brPB6pfE9Zj0Cv2zb7lm4j6yhBdO2dAh0FNBp8
	XoRJeBLqVWOvXqiI8wcua4pSnrHG9Su74NSHS/0sUNFzfs9WQVq9jGJq3cUqurcfaYmbsDwgR37
	C/Ude0E8r97WIUQ3HODTX4eJEwrNT65BSku0KNt4J0JUKrGkNghuEnNkb+YbSVurA4wZBRkh5Wx
	BfkEA3NqFRjiu1WEG+qDXkv9CvxQEZSKpBKta7ONTGi5ag6DFoUcvxbtPrqh0srJlGk+WAvSo89
	bXC4kxi+RIYScVJ1xA7eeFhdTmKtM9BSeF+cBNORfA+ObktrXVY0NEJlkGQ5/hAcBYT41PnP6XN
	ui04gGgE/GLhVxGtgdxM2ta5CvXMCAO5/rZe0599ThAJo/fd8wu7uqqqd3jmaf4XPt9KSTXRMZI
	i1omkosqQinydsKq39Vfwa
X-Received: by 2002:a17:902:f78b:b0:2ae:55c1:ba8a with SMTP id d9443c01a7336-2ae823851bamr116227635ad.14.1773095062734;
        Mon, 09 Mar 2026 15:24:22 -0700 (PDT)
Received: from localhost ([71.212.200.220])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83fa2fa5sm130946135ad.70.2026.03.09.15.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 15:24:22 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Rob Herring
 <robh@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Sudeep Holla
 <sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 arm-scmi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC v5 1/2] pmdomain: core: support domain hierarchy via
 power-domain-map
In-Reply-To: <CAPDyKFq0JAKc693d+RrPEBCAH--r+gobf822dQ5Ao6f2gnjRrw@mail.gmail.com>
References: <20260122-pmdomain-hierarchy-onecell-v5-0-76855ec856bd@baylibre.com>
 <20260122-pmdomain-hierarchy-onecell-v5-1-76855ec856bd@baylibre.com>
 <20260127151735.GA1699112-robh@kernel.org> <7hjywtzaiy.fsf@baylibre.com>
 <CAMuHMdURxN=kBQHJKnsTVEQPeuB41r5kZy4sgFNqg=U2ynuZMw@mail.gmail.com>
 <7hv7flrb36.fsf@baylibre.com>
 <CAPDyKFq0JAKc693d+RrPEBCAH--r+gobf822dQ5Ao6f2gnjRrw@mail.gmail.com>
Date: Mon, 09 Mar 2026 15:24:21 -0700
Message-ID: <7hqzpszlnu.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_152423_677255_6D4BF0E3 
X-CRM114-Status: GOOD (  36.65  )
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

Ulf Hansson <ulf.hansson@linaro.org> writes:

> On Wed, 25 Feb 2026 at 00:11, Kevin Hilman <khilman@baylibre.com> wrote:
>>
>> Geert Uytterhoeven <geert@linux-m68k.org> writes:
>>
>> > Hi Kevin,
>> >
>> > Thanks for your series! I became aware of it only recently, and read
>> > it and its history with great interest...
>> >
>> > On Wed, 4 Feb 2026 at 00:13, Kevin Hilman <khilman@baylibre.com> wrote:
>> >> Rob Herring <robh@kernel.org> writes:
>> >> > On Thu, Jan 22, 2026 at 05:14:00PM -0800, Kevin Hilman (TI) wrote:
>> >> >> Add of_genpd_[add|remove]_subdomain_map() helper functions to support
>> >> >> hierarchical PM domains defined by using power-domains-map
>> >> >
>> >> > power-domain-map. No 's'.
>> >> >
>> >> >> property (c.f. nexus node maps in DT spec, section 2.5.1).
>> >> >>
>> >> >> This enables PM domain providers with #power-domain-cells > 0 to
>> >> >> establish subdomain relationships via the power-domain-map property,
>> >> >> which was not previously possible.
>> >> >>
>> >> >> These new helper functions:
>> >> >> - uses an OF helper to iterate to over entries in power-domain-map
>> >> >> - For each mapped entry: extracts child specifier, resolves parent phandle,
>> >> >>   extracts parent specifier args, and establishes subdomain relationship
>> >> >> - Calls genpd_[add|remove]_subdomain() with proper gpd_list_lock mutex protection
>> >> >>
>> >> >> Example from k3-am62l.dtsi:
>> >> >>
>> >> >>   scmi_pds: protocol@11 {
>> >> >>       #power-domain-cells = <1>;
>> >> >>       power-domain-map = <15 &MAIN_PD>,  /* TIMER0 */
>> >> >>                          <19 &WKUP_PD>;  /* WKUP_TIMER0 */
>> >> >>   };
>> >> >>
>> >> >>   MAIN_PD: power-controller-main {
>> >> >>       #power-domain-cells = <0>;
>> >> >>   };
>> >> >>
>> >> >>   WKUP_PD: power-controller-main {
>> >> >>       #power-domain-cells = <0>;
>> >> >>   };
>> >> >>
>> >> >> This allows SCMI power domain 15 to become a subdomain of MAIN_PD, and
>> >> >> domain 19 to become a subdomain of WKUP_PD.
>> >> >
>> >> > One concern I have here is generally *-map is transparent meaning when
>> >> > you lookup <&scmi_pds 15>, &MAIN_PD is returned as the provider. It's
>> >> > also possible to have a map point to another map until you get to the
>> >> > final provider. The only way we have to support both behaviors is the
>> >> > consumer has to specify (i.e. with of_parse_phandle_with_args_map() vs.
>> >> > of_parse_phandle_with_args()), but the consumer shouldn't really know
>> >> > this detail.
>> >
>> > This is also the first thing I was worried about, when I noticed you are
>> > not doing transparent mapping, but add an explicit hierarchy instead,
>> > based on the map.
>>
>> Yeah, the map wasn't my original idea, and TBH, I had never really even
>> heard of nexus node maps before it was suggested by Rob[1] that I could
>> use it to describe hierarchy.
>>
>> But... I'm gathering from Rob's and your recent feedback that my current
>> approach to using a map is an abuse/misuse of the map because it's just
>> being used to describe hierarchy, and because it's not transparent.
>>
>> I'm still waiting to hear from Rob to see if I understood that right,
>> but your feedback is making me think that's the case.
>>
>> If so, I'm honestly not sure where to go next.
>>
>> >> > Maybe a transparent map of power-domains would never make sense. IDK. If
>> >> > so, then there's not really any issue since the pmdomain core handles
>> >> > everyone the same way.
>> >
>> > AFAIUI, SCMI is not limited to the SoC, but may be used for the whole
>> > hardware platform, so it could control power to external devices, too.
>> > Once we need to map a power domain through a connector, we need
>> > support for transparent mapping through a nexus node.
>> >
>> >> I don't really know enough about potential usage of maps to know if
>> >> there's ever a usecase for transparent maps.  However, the problem I'm
>> >> trying to solve is less about transparent maps, and more about
>> >> describing hierarchy in a situation where "leaf" domains of the same
>> >> type (e.g. SCMI) can have different parent domains.
>> >
>> > Hierarchy is indeed something that cannot be described with the current
>> > SCMI power domain management protocol.  This includes external hierarchy
>> > (your use case), and internal hierarchy: AFAIK, Linux cannot be made
>> > aware of the hierarchical relationship among the different power
>> > domains controlled through SCMI either.
>>
>> Yes, the limitations of SCMI (both the protocol, and the Linux
>> implementation) are the root cause here.  In case you didn't see it,
>> before I posted the original version of this series, I started a thread
>> on the arm-scmi list to discuss implementation options[2]
>>
>> So since this is primarily and SCMI limitation, maybe I should just go
>> back to the original proposal of using power-domains-child-ids[3]?
>>
>> I'm definitely open to suggestions here as I'm a bit out of my depth
>> here.
>
> FWIW, I favor re-trying the "power-domains-child-ids" [3] approach.
>
> The main reason is that we already have the "power-domains" property,
> which allows us to describe parents using a list of phandles.
>
> To me, it seems more sensible to extend this with a new
> "power-domains-child-ids" property, which can be used when needed,
> rather than inventing an entirely new property, that would replace the
> existing one.

OK, in the absence of any feedback from the DT maintainers, I'll go back
to the original approach of using `power-domain-child-ids`.

Kevin



