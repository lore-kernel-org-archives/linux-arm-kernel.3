Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1A38ECD6C1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Feb 2026 16:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kmv+l6I1Mmt7+27jK79akKLkt8N0f0Ri3uD6FgXaqIg=; b=N108eI3GyIXi3cotVraO8ATDJu
	5XWbQoVAatIrXdK/RygA1tNbCAujffxlgU5Ix9I96uj9Dr3wVhxDOG1VdgexYFUg/ElxOEWO3RhF0
	s3phHbiAmIq36jLIj8RxhS4sJ8DsHi1RBkNV3yO7qQ1m0vDuq2v7h53BoCw/jEmVAgS7+JotNqb4n
	R7sZ6j+r8uXb9/aSFfhl6WdOw6nOqVp22yNSlObV0hRLvlex1sa5+dWlmNtbse3zbIxQOYGgd4Cgm
	OdM/2b4wUvO+sAbenrkgMJQ28s/zcimo64VLo68FOKhfJp1gwyfj2BlqKyErDLiP5UdB++uQScxEM
	uqrrqKgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqD8e-00000000qX3-01OX;
	Wed, 11 Feb 2026 16:32:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqD8c-00000000qWU-0J5p
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Feb 2026 16:32:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C6C95600AD;
	Wed, 11 Feb 2026 16:32:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16DD6C19423;
	Wed, 11 Feb 2026 16:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770827544;
	bh=UfYFQzw9DizcfbI8UKrSjkCRJhieWEEOgyJ4SZyP2T0=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=S/bNigMyu2iHQT1xmPSL1Ve8BuSCqCHVgygJX4vATi4CZvzQGbzYfmaPYbG7nc1FC
	 6wFSVby6yNrbScmQc+MBaF9w2K/lPqKAeOrSlHuT01xGUHmnQEdBPLhl7Vfk+kKfiL
	 ljbr7gZkjv+Qq0Relds2bfCXHUdsVDymHdjjJFA+G3jQjsxkCzVmfKTozfomy/hSiC
	 5p4DBggLkOTg3n0KkeeZJvvvoYUWaopaS510xkmTa0244iQiw9Ix4lUlX+jLW0Wh1h
	 sCxhoU0YTKugEgHMQ9qRPgGIPSuOeap0JFcZoTCGZYaV3btBKxTNet6X7brTeiJxof
	 LDb362ewehG9w==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 0D873F40068;
	Wed, 11 Feb 2026 11:32:23 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Wed, 11 Feb 2026 11:32:23 -0500
X-ME-Sender: <xms:Fq-MaRo16QXgUMCriSisFkAv3XAHq6k42Zu8W0FlpXBtoHzfDbuLew>
    <xme:Fq-MaefLh2XgGgDwiX4g049pSO82U6L78kIPzhisBoGb4DQ79Y7Dkhl1biTSSm2dk
    Y5-N1cFbltak_o1HmML9YAwCTVbVmiLXtxfOaxHYOoeeb0wFRjJ1g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvtdeftdegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusehkvghrnhgvlhdrohhrgheqnecuggftrfgrth
    htvghrnhepjeejffetteefteekieejudeguedvgfeffeeitdduieekgeegfeekhfduhfel
    hfevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhguodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduvdekhedujedtvdeg
    qddvkeejtddtvdeigedqrghrnhgupeepkhgvrhhnvghlrdhorhhgsegrrhhnuggsrdguvg
    dpnhgspghrtghpthhtohepuddupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehl
    ihhnuhigsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhtohepthhonhihsegrth
    homhhiuggvrdgtohhmpdhrtghpthhtohepughmihhtrhihrdhtohhrohhkhhhovhesghhm
    rghilhdrtghomhdprhgtphhtthhopehjmhhkrhiihihsiihtsehgmhgrihhlrdgtohhmpd
    hrtghpthhtoheprggrrhhordhkohhskhhinhgvnhesihhkihdrfhhipdhrtghpthhtohep
    sghrghhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehhrghnshhgsehkvghrnhgvlh
    drohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdr
    ihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopegsrghrthhoshiirdhgohhlrghsii
    gvfihskhhisehoshhsrdhquhgrlhgtohhmmhdrtghomh
X-ME-Proxy: <xmx:Fq-MaWhZObjCIHQbqjkDMsVOzq99p7RF3KwnZuT3zLVo_N-oZUX5dw>
    <xmx:Fq-MafJSnb3sKne5HvwMxdWaOguH57HCdonGqBU4xF_XnQGr2hYfVQ>
    <xmx:Fq-MadnKMjH8KHpIGOUfEpKZJTNJn3ac73bjuYykG_9RfDP0NG4tvQ>
    <xmx:Fq-MafPSVRX-o06ho0W-hsHiPJT3oAYbkZUPXmXhb9dp6t9pnOo8JA>
    <xmx:F6-Maf5EBeBZKj1ozTd2eOuD0sF5ZudExoifaYVc9kme0IsOaBfmcPNU>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id D6A92700065; Wed, 11 Feb 2026 11:32:22 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AEuu_v-AJ7hw
Date: Wed, 11 Feb 2026 17:31:52 +0100
From: "Arnd Bergmann" <arnd@kernel.org>
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>,
 "Aaro Koskinen" <aaro.koskinen@iki.fi>,
 "Janusz Krzysztofik" <jmkrzyszt@gmail.com>,
 "Tony Lindgren" <tony@atomide.com>, "Russell King" <linux@armlinux.org.uk>,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Hans de Goede" <hansg@kernel.org>
Cc: Linux-OMAP <linux-omap@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Bartosz Golaszewski" <brgl@kernel.org>
Message-Id: <213b82de-fee8-4ebf-a8ee-d8ca783ce403@app.fastmail.com>
In-Reply-To: <20260211131350.126966-1-bartosz.golaszewski@oss.qualcomm.com>
References: <20260211131350.126966-1-bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [RFT PATCH v2] ARM: omap1: enable real software node lookup of GPIOs on
 Nokia 770
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
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

On Wed, Feb 11, 2026, at 14:13, Bartosz Golaszewski wrote:
> Currently the board file for Nokia 770 creates dummy software nodes not
> attached in any way to the actual GPIO controller devices and uses the
> fact that GPIOLIB matching swnode's name to the GPIO chip's label during
> software node lookup. This behavior is wrong and we want to remove it.
> To that end, we need to first convert all existing users to creating
> actual fwnode links.
>
> Create real software nodes for GPIO controllers on OMAP16xx and
> reference them from the software nodes in the nokia board file.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

I don't see mistakes here, and I don't want to throw a wrench in
this patch, but I wonder if there is a way to take this one step further:

> @@ -244,6 +263,14 @@ static int __init omap16xx_gpio_init(void)
>  		iounmap(base);
> 
>  		platform_device_register(omap16xx_gpio_dev[i]);
> +
> +		ret = device_add_software_node(&omap16xx_gpio_dev[i]->dev,
> +					       omap16xx_gpio_swnodes[i]);
> +
> +		if (ret) {
> +			dev_err(&pdev->dev, "Failed to add software node.\n");
> +			return ret;
> +		}

I was planning to go through the remaining 'static struct platform_device'
definitions in arch/arm/ after the planned board file removal and
try to convert these to 'platform_device_info' or similar, using
platform_device_register_full(). Since that function already contains
code to dynamically allocate the software_node, I had hoped that
a lot of this would just go away.

However, I see that your patch creates pointers to those software_node
instances, so  think that would become a bit harder, but I have not
actually tried it.

Do you know if there is a good way to do this without using static
platform devices?

     Arnd

