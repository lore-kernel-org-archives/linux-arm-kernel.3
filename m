Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2216C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 11:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wbdv/shzAwCBmXAlWsariaXJLsd3y1GE42bnEwCWFfY=; b=LWGRBt+tj+U798U53HdduAp6oz
	KE+JmPTNGhlXhXPKwNopXmDp6DMMd+EtkS7jY2hjMG6S0hOeGayQjUmjENR+6h7C7wccV1foYiJpq
	opV6ZAsqi8NBbZrRIHoMVyNw95+NoVcF9Vrm7M0EQQT5zjLCtPD2vjjc6V5f/vAziBjRuwhbEDOOz
	wOYvbM8xY84Ixw64vom8+dDNGEnTAcAEO745KbLu4hv0xA/808nN30GdajnBmzx9VqWDmwOQKujZx
	s87M6FqzV2G2ar0q38w3CzqbgsPdMuDshyybidcOgLzT1VusFlB9kXpWxapDtNwjfRNYCD9Ex0ul1
	wga2GXMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV6q8-0000000EOJx-3YBe;
	Fri, 27 Jun 2025 11:01:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV6eM-0000000ELn0-08wJ
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Jun 2025 10:49:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Wbdv/shzAwCBmXAlWsariaXJLsd3y1GE42bnEwCWFfY=; b=gRyz9p+bGmCsZq68zMnKcppVfm
	G6JNGtKIfTgQ3SzJ9/50VU0FxLRVJqmr7KloPNMxO6XdJijHk9H4NOLA/YP/bpz2PR501oP3m1/cB
	1DaTK524qLpvBFNo5zzIkCC6DYqqfQ7qD8006Zbb9quC1JlKvihSF2wGuz4plJApSGjeewz3WBo4N
	SszDamVOPvQ2BmCwP4vN93QyIgowLLnVnSBoLKko2zd8WHioMhxT4nSS2AwP+kvdlgZUND3B9b3xz
	WCfCxIaeW6pJRs03/kN+P5omunMF+UkC9NABfL7JichdvfokpoOgNfKn4Rhdt8HWotvPKB+0yiyW1
	b2TVbfEg==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV6eI-00000006IjP-4AKS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 10:49:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 309C3A52D48;
	Fri, 27 Jun 2025 10:49:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E951C4CEE3;
	Fri, 27 Jun 2025 10:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751021375;
	bh=OrBU5eBwBcoKQHllVdPOQ7ABzGCI1+juFwHu/MwINgI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jjT5UI7V0MN8cv7Kxou/19uR4bMLbukpmBDE6+Hvnj7C6DXS6KP8eb87VWD61mA/Y
	 uF5D5Ct5K/Z/Mrf7cosGn/ZaRH55vKh9pgV0l27CFC1BjAimugSNJsYHaP6HKn38mj
	 HcNcKd0L98nVNcQZyc43Vbx/6LTEUKSGNFfmkWyI3vay2c7yWc3aLakfmJD35TcU2H
	 g5ZxBVSZ6JvEKZyRuGYVVLMhPvjBDALsYaTGrxu0d478gSF10PT/3nwtqyQQTzEOYl
	 ieUPrTo4t1AujfFjdwRMS/egGfRxIozKJ30XKuvFCpr4zie36/nJDbhthJ8GcD5eN7
	 3RnEyk3A+6UBA==
From: Srinivas Kandagatla <srini@kernel.org>
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Joerg Roedel <joro@8bytes.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Vinod Koul <vkoul@kernel.org>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Arnd Bergmann <arnd@arndb.de>, Sven Peter <sven@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org, iommu@lists.linux.dev, 
 linux-input@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-sound@vger.kernel.org
In-Reply-To: <20250612-apple-kconfig-defconfig-v1-0-0e6f9cb512c1@kernel.org>
References: <20250612-apple-kconfig-defconfig-v1-0-0e6f9cb512c1@kernel.org>
Subject: Re: (subset) [PATCH 00/11] Drop default ARCH_APPLE from Kconfig
 and use defconfig instead
Message-Id: <175102136780.6245.11489454367138517610.b4-ty@kernel.org>
Date: Fri, 27 Jun 2025 11:49:27 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_114939_344097_E7FB3A37 
X-CRM114-Status: GOOD (  11.62  )
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


On Thu, 12 Jun 2025 21:11:24 +0000, Sven Peter wrote:
> When support for Apple Silicon was originally upstreamed we somehow
> started using `default ARCH_APPLE` for most drivers. arm64 defconfig
> also contains ARCH_APPLE=y such that this will turn into `default y`
> there by default which is neither what we want nor how this is usually
> done.
> Let's fix all that by dropping the default everywhere and adding the
> drivers to defconfig as modules instead of built-ins.
> None of these patches depend on each other so we can just take them all
> independently through the respective subsystem trees.
> 
> [...]

Applied, thanks!

[04/11] nvmem: apple: drop default ARCH_APPLE in Kconfig
        commit: e426953c193a2b51c8adcd3922fb8eef15790219

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>


