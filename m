Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05C17C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 10:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7SqGMxq5975lMlqnb4GEZWltCuOrS0Th0H4icarU5s4=; b=Itk4eTtpN/QZqJahnE738grZFE
	oGH8fwS/uzI5H/EO4YDa4Y2WLVCtOg14T9L8uqD5LS9fjG4ymzUlpdt5+8TkahLUMmL23+msWH9MY
	hW9AwoNyaaLUEC6vZiVqCmh5Q9Yro0p4HAHZgdZ+LBeY81JRGzFoKYQ/Er9Xt0PM7FKLeuomDEasB
	mDyu/5zwy/bJuI6ruwLi0vO5ExBwe2/h9jWAAHMSX4UX9SiRvC+jaWllf45YJ1cklXomNz+qrx/Vv
	aU0JsgBMxtMyeu1Br1i1zY6I9gu4Xmh6TubFtHuvPisOh3plseMgIA8VAo1xOhubtaYWLo2DCP26C
	fpjYR8Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uciQE-0000000CJKS-39t6;
	Fri, 18 Jul 2025 10:34:34 +0000
Received: from fout-b6-smtp.messagingengine.com ([202.12.124.149])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uchmS-0000000CEzS-27jI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 09:53:31 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id ABC661D000D0;
	Fri, 18 Jul 2025 05:53:26 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Fri, 18 Jul 2025 05:53:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1752832406;
	 x=1752918806; bh=7SqGMxq5975lMlqnb4GEZWltCuOrS0Th0H4icarU5s4=; b=
	dVXHm5TjJar97qRy8v6ZCOwnAuvNDngTi4sGnLFPkjG6mYVFn5MhK+v8a9I49w6R
	wtyvTO5NP5azbnIsEWQF74D9MTgl8Y0g8my82rIAm9rnh++oZhyJJyq2JLXQz8zO
	wgSe37FEIHZ5bfMEWY0rKVb5BC2sTgz5AxgTU/JSOXM40IBwgc9sddSMgqivDlnO
	ve9VrKz/QMD9Vg48TVVu7drVZ9/C34j9JdbNk3auRqPj3i420x1VJ3Psl1KiJWOW
	9Z1wpjhwoaJFyeyjifUhgBeMGCF5s7IVVFncOx2zpDTlQQL7DBQtUHGQ96zsiyfz
	I2W8EWWnUi6k+LKI3GtiXA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1752832406; x=
	1752918806; bh=7SqGMxq5975lMlqnb4GEZWltCuOrS0Th0H4icarU5s4=; b=i
	KBnNfo5B50V4tFBq1iHFaS7ctPsvIjDd8KyXxoUsxlp4DXbTe/kvIL4/MhAkgbnj
	4HvMz/UxeAbpCu3sqgKLJ4CqMQFj0htJlN5cY338mhbbGFv3EwEW3XN6kn2EIuRv
	PxXc/EDlaL3OXhbria9D3x23B+YSbSfuJjepqhtxqgP0eObMsr4AbFIak/45FbO6
	WpzjKmIo7F/SUWRlXXNwc7J9+mKgQSeXxfFo+NQUxyUd7huQB/qqt4BjdwHMfnPQ
	J9v6EYDZsNHncIKn0FoDa3N3d0icOFn4Z5JIhYO7f0n1onD30NOFlgRhxJpqrITx
	9Q7hZagbXJT2Kal/rXmBA==
X-ME-Sender: <xms:lRl6aJeq5ifbMwZYChxtcOPGhbeO50cuUb4I3ANKXlaMncCoi-1Q4w>
    <xme:lRl6aHNopLerASkXHQwJVTlDcdrPR_8UIXCLxLIU0Umv7K3S_5LqP9UcDsYVHXBK2
    07UPPvVw6MgyUf9peg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeifeduhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeekpdhmohguvgepshhmthhpohhuthdp
    rhgtphhtthhopeifihhllhhmtghvihgtkhgvrhesghhoohhglhgvrdgtohhmpdhrtghpth
    htohepkhhriihksehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghnihgvlhdrlhgv
    iigtrghnoheslhhinhgrrhhordhorhhgpdhrtghpthhtohepthhglhigsehlihhnuhhtrh
    honhhigidruggvpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhs
    thhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheprghlihhmrdgrkhhhthgrrh
    esshgrmhhsuhhnghdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhg
    vghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhsrghmshhunhhgqd
    hsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:lRl6aA9E4sK1Y7VjUXEWlhwEnBUhYr74uBhnAPp3NmZS2eSYv6bQVw>
    <xmx:lRl6aFlJboraXgsMTeEhqNKKajYjQOvsb3zF7YmQ8qCCDhqc6PXUpQ>
    <xmx:lRl6aFzmc-DgjivPAa94gze3gLvg04Ab478YLBXvMQZJU0yVVswB5g>
    <xmx:lRl6aP7sn1iGg1-hPPo_TMyRNpzTNG1s-eJib_bIxP4cKe6pgN6LIg>
    <xmx:lhl6aGqJbSaRAF5pOKm8zGXOo0thPUdyQD_jHy4z6PnNBRFDLw7cfcaG>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 9445E700065; Fri, 18 Jul 2025 05:53:25 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T5ec6489364d9ab60
Date: Fri, 18 Jul 2025 11:53:05 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Daniel Lezcano" <daniel.lezcano@linaro.org>,
 "Thomas Gleixner" <tglx@linutronix.de>,
 "William McVicker" <willmcvicker@google.com>
Cc: linux-kernel@vger.kernel.org, "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Alim Akhtar" <alim.akhtar@samsung.com>,
 "moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>
Message-Id: <bccb77b9-7cdc-4965-aa05-05836466f81f@app.fastmail.com>
In-Reply-To: <20250715121834.2059191-1-daniel.lezcano@linaro.org>
References: <20250620181719.1399856-6-willmcvicker@google.com>
 <20250715121834.2059191-1-daniel.lezcano@linaro.org>
Subject: Re: [PATCH] clocksource/drivers/exynos_mct: Fix section mismatch from the
 module conversion
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_025329_127748_0F877735 
X-CRM114-Status: GOOD (  14.35  )
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

On Tue, Jul 15, 2025, at 14:18, Daniel Lezcano wrote:
> diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
> index 5075ebe052a7..80d263ee046d 100644
> --- a/drivers/clocksource/exynos_mct.c
> +++ b/drivers/clocksource/exynos_mct.c
> @@ -657,7 +657,7 @@ static int exynos4_timer_interrupts(struct device_node *np,
>  	return err;
>  }
> 
> -static int mct_init_dt(struct device_node *np, unsigned int int_type)
> +static __init_or_module int mct_init_dt(struct device_node *np, 
> unsigned int int_type)
>  {
>  	bool frc_shared = of_property_read_bool(np, "samsung,frc-shared");
>  	u32 local_idx[MCT_NR_LOCAL] = {0};

Something still feels off here, though I'm not sure what the best
solution would be. Some observations:

 - The exynos4_mct_probe() function is listed as permanent, but
   it indirectly calls an __init_or_module function, which is not
   technically allowed but does not produce a warning here
   because of the indirection.

 - if the driver is built-in and the platform_driver picks
   up the device, it can be manually unbound and rebound, but the
   mct_init_dt() will be discarded at this point.

 - In a loadable module, you cannot call register_current_timer_delay(),
   since this causes a link failure.

 - unloading the module fails to undo the registration, so the
   next call to delay(), sched_clock(), ktime_get() or an interrupt
   ends up in invalid memory.

I think the driver should use an explicit init function calling
platform_driver_probe(), so the probe is only done at initcall
time and both unbinding and unloading are prevented.

       Arnd

