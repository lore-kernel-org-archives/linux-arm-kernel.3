Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84040C71135
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 07:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=heYYdoDlXFOciX8bAT8IXpBAQStR+kpfE0iWQ6XRFa8=; b=qZdd+n9Ba5bxHRDJ/sJ/8fsVO8
	xIFWJS2SHK61ql4MLLlNh7fpdZOVTjmT4S8lJYv7eKsDglWF5Qvp0XKQ2KnYlJvCB8K+owpb9CoX4
	ByR40E7KxHRtiU5b5DWZW7PIiy6OgYfgkhHjZfMiXEEJRvWjpR72FyV3UQpZKo2H+kiZqOz1v0Sfr
	iVtACVzcamMF6ilWby81Q4NcOimXHLw42k0+r5bh7hQ2fMgkHDyiNsIVEfcbbWPr90URdtokLQXWf
	dfBw3GYh3hCewNk54+gnJUjspnGHsT6WW4IXtt4XN5yft680a4vI6Svsb7sG9gPOFSsxDKcB5rkOb
	tCX9QMnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPz7w-0000000FfLg-1IYY;
	Fri, 13 Jun 2025 07:47:04 +0000
Received: from fhigh-b8-smtp.messagingengine.com ([202.12.124.159])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPywH-0000000FbZ5-1guF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 07:35:02 +0000
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 78C582540150;
	Fri, 13 Jun 2025 03:34:59 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Fri, 13 Jun 2025 03:35:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1749800099; x=1749886499; bh=heYYdoDlXF
	OciX8bAT8IXpBAQStR+kpfE0iWQ6XRFa8=; b=B67nTcCnNzwgqqw5e9km6I+xvo
	aP4x12BY0eqNXQd/5WAzuvx3iqVg+FZbcVKP5FKPEGSxxMuGAH3L/rfj418xIg70
	/PvX1cbyeDwUVpAcivjtmOGjtx3ml0nmwCKa17nScrb2s5Q527q2h1/y4XBROHia
	8nvdqwn17kBjrn8qoIQKRvcai0qtqKY6UiU2s0gziN05KRSAFQ4f9o6h6pNVDNwf
	xVf1VeIBpzeymw1P0k9OGmTImtr8zQJULdyC5yrqJcK6g4oaNCLeMYXfXeMRE0RW
	RFEC3RnE8yyU3OKG/xjyzlzvwyXSaM02E/VbYozacysEWXVmlLCujDx88tdQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1749800099; x=1749886499; bh=heYYdoDlXFOciX8bAT8IXpBAQStR+kpfE0i
	WQ6XRFa8=; b=obGdjANf3TY83z9E4pcTsihvUy/NhNuL3IyPMSupSohNWxVy02l
	DIhu0O7mPdBhG6LALj7QpvkuBLRqxCqUTe/FY4Lgl4LKVkszfBgYA8yw0VMo+P2L
	IwQnsy9s2JORNu4cgB5/Ez7MBDt83hyhqL/wYquBx1at4LCZ2I+NQNwPDOr9FMkE
	AyQ0zW/vRNT1xbbp1Z9aPEaYPnF9b5y3tP9zv1nlBYffAsC0pAWd1uHkLY0OEjuz
	9fsO6TrlrTHGWtQ2xMgouIieOSKT87OUFxo4gbsF49Z8qiAQCflR1cgxccfM+ex0
	aWWyY/hUGVsazvF765v54qnsr8ZcE2eWA8w==
X-ME-Sender: <xms:odRLaLh6zoBCwTVNx3mvfgXtLKR5nE8PQpNCvoZQTZ4Yl_CbLvnwdw>
    <xme:odRLaICswVPjz4ogeEyOqVrKMv3h2K0ju_EfqS7zm4Gl6Uf-UjFh8gN6posrOHBmL
    iOC5OcwHsAR-lM2c_8>
X-ME-Received: <xmr:odRLaLHK0aeEIyi6snr3y6ADuhS7i5ZXVIhpnmTkXcZQGxVBcNZK22osXdbJ_qmFKeLZKXiAXT60ogZi27I6ELmpNqrr_diVC9k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddujeefiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttdej
    necuhfhrohhmpeflrghnnhgvucfirhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqne
    cuggftrfgrthhtvghrnhepgfdvffevleegudejfeefheehkeehleehfefgjefffeetudeg
    tefhuedufeehfeetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhesjhgrnhhnrghurdhnvghtpdhnsggprhgtphhtthhopeefuddpmhhouggv
    pehsmhhtphhouhhtpdhrtghpthhtohepshhvvghnsehkvghrnhgvlhdrohhrghdprhgtph
    htthhopegrlhihshhsrgesrhhoshgvnhiifigvihhgrdhiohdprhgtphhtthhopehnvggr
    lhesghhomhhprgdruggvvhdprhgtphhtthhopehulhhfrdhhrghnshhsohhnsehlihhnrg
    hrohdrohhrghdprhgtphhtthhopehmthhurhhquhgvthhtvgessggrhihlihgsrhgvrdgt
    ohhmpdhrtghpthhtohepshgsohihugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsh
    hrihhniheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnughirdhshhihthhisehk
    vghrnhgvlhdrohhrghdprhgtphhtthhopehrrghfrggvlheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:odRLaIS_fY6doz4TXul-16ldYhjIlpniGV2a8g4n6ltibGDTV-_mOQ>
    <xmx:odRLaIznjucvvyZgRzf35RgUzJyDfO3OetS3EdETiVvnX76AZ8CLtw>
    <xmx:odRLaO761ll-OM5SIk4RJpRBEoWwgMAB-KKWrDFl6U7GyN_JjqAY0g>
    <xmx:odRLaNw8AJBTxtqIaToqpW5WlxojAdlTnU6UprMcyicXZwTH4PyLwQ>
    <xmx:o9RLaB0Xg6U_mH9QzF5X9ggXCjEz7dkLBSNqyZGrq3Q-npIGYGL9kSgl>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 13 Jun 2025 03:34:57 -0400 (EDT)
Date: Fri, 13 Jun 2025 09:34:55 +0200
From: Janne Grunau <j@jannau.net>
To: Sven Peter <sven@kernel.org>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,	Srinivas Kandagatla <srini@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,	Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>,	Robin Murphy <robin.murphy@arm.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Liam Girdwood <lgirdwood@gmail.com>,	Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>,	Takashi Iwai <tiwai@suse.com>,
 Arnd Bergmann <arnd@arndb.de>,	asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,	linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org,	linux-clk@vger.kernel.org,
 linux-i2c@vger.kernel.org,	iommu@lists.linux.dev,
 linux-input@vger.kernel.org,	dmaengine@vger.kernel.org,
 linux-sound@vger.kernel.org
Subject: Re: [PATCH 00/11] Drop default ARCH_APPLE from Kconfig and use
 defconfig instead
Message-ID: <20250613073455.GF3141695@robin.jannau.net>
References: <20250612-apple-kconfig-defconfig-v1-0-0e6f9cb512c1@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250612-apple-kconfig-defconfig-v1-0-0e6f9cb512c1@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_003501_544718_78A198A6 
X-CRM114-Status: GOOD (  17.90  )
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

Hej,

On Thu, Jun 12, 2025 at 09:11:24PM +0000, Sven Peter wrote:
> 
> When support for Apple Silicon was originally upstreamed we somehow
> started using `default ARCH_APPLE` for most drivers. arm64 defconfig
> also contains ARCH_APPLE=y such that this will turn into `default y`
> there by default which is neither what we want nor how this is usually
> done.

It's not such an uncommon pattern. `git grep 'default ARCH_' --
'*Kconfig'` has over 250 matches (not counting ARCH_APPLE) and from a
cursory look not all CONFIG_* look essential for booting.
I agree that the drivers covered here should not be built-in by default.
An alternative would be using `default m if ARCH_APPLE` instead but that
pattern is not common in the kernel. So just moving this to defconfig is
fine by me.

> Let's fix all that by dropping the default everywhere and adding the
> drivers to defconfig as modules instead of built-ins.
> None of these patches depend on each other so we can just take them all
> independently through the respective subsystem trees.
> 
> Best,
> 
> Sven
> 
> Signed-off-by: Sven Peter <sven@kernel.org>
> ---
> Sven Peter (11):
>       pmdomain: apple: Drop default ARCH_APPLE in Kconfig
>       soc: apple: Drop default ARCH_APPLE in Kconfig
>       clk: apple-nco: Drop default ARCH_APPLE in Kconfig
>       nvmem: apple: drop default ARCH_APPLE in Kconfig
>       i2c: apple: Drop default ARCH_APPLE in Kconfig
>       cpufreq: apple: drop default ARCH_APPLE in Kconfig
>       iommu/apple-dart: Drop default ARCH_APPLE in Kconfig
>       Input: apple_z2: Drop default ARCH_APPLE in Kconfig
>       dmaengine: apple-admac: Drop default ARCH_APPLE in Kconfig
>       ASoC: apple: mca: Drop default ARCH_APPLE in Kconfig
>       arm64: defconfig: Enable Apple Silicon drivers
> 
>  arch/arm64/configs/defconfig      | 19 +++++++++++++++++++
>  drivers/clk/Kconfig               |  1 -
>  drivers/cpufreq/Kconfig.arm       |  1 -
>  drivers/dma/Kconfig               |  1 -
>  drivers/i2c/busses/Kconfig        |  1 -
>  drivers/input/touchscreen/Kconfig |  1 -
>  drivers/iommu/Kconfig             |  1 -
>  drivers/nvmem/Kconfig             |  1 -
>  drivers/pmdomain/apple/Kconfig    |  1 -
>  drivers/soc/apple/Kconfig         |  3 ---
>  sound/soc/apple/Kconfig           |  1 -
>  11 files changed, 19 insertions(+), 12 deletions(-)

whole series

Reviewed-by: Janne Grunau <j@jannau.net>

