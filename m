Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7A7FC71135
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Jun 2025 11:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i0FdvzflD/5VtwgBhHXtBhu/ZqKfVQj+50oVAO9XPxM=; b=V8F3/hhDv2IqVpAFmT0N4eacnN
	VRFzhw1zdmKAB7xkAElQbOQt71OBXwtT0z4n5343AvLBvpkJ5QHL7Olgt2Nf8X3oJjStlXpfzBRtS
	SvQy/YBsTIn/xmDkqTaKkqEEuW4n+4LfT53AJ3RjYWFWb62yiWHH7hDLw5ecmy6tqrLKEcSmKogSO
	tYAsesB6cw4emKim712Md5e9VasiRE4zS2Grgr+maQiTjhgVaoUFjB5OekzYf4FJOJ/yicMKg+YcZ
	I8l2SaVD9S1AfnYMFVvooEWmCIThLxDGDD9CKsOn3q6vLDhn2z9C6mTsEeORZbuSiMmZekErhFBiB
	GW1Rv/Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQOxH-00000001BFW-2PjO;
	Sat, 14 Jun 2025 11:21:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQOoj-00000001AZX-0u7y
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Jun 2025 11:12:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DA7ED40C1C;
	Sat, 14 Jun 2025 11:12:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 418A2C4CEEB;
	Sat, 14 Jun 2025 11:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749899576;
	bh=di0vudlUJl9ldcR9UsjTlgPrj2pTt9RZvG4yRZnfheA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mwTsZuIC6mohekKQprEBnkvZFbg92Z06uo552hFeIUoZyeB6wGwsTy8jD0fJX7msn
	 2s6MZ0AItWNvctoyqvv0KmmLPg5V0W41DI3KPxQ9rkye+yWJkpGg8QgKoAw8NnFttS
	 yP0l8dDZ4Y7KxtGgN+T+lraguvPIIqekJ8Ie065J7Ft8XcdGDHcnuw8SdnEWTMm7Uk
	 E6u8wEjwCDP0TAh8AfPEOyjtB4erytWA6n17GqUUPseVF/dL+WuPhaMIGyQ41T6y4z
	 2hxc0PadsQyJHQIComuYupkWskeCohqOujwB0O9ldMhQTiJbI+2UQkX+phnzaZ80RI
	 3HWemMiHHJzaQ==
From: Mark Brown <broonie@kernel.org>
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
 Andi Shyti <andi.shyti@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Joerg Roedel <joro@8bytes.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Vinod Koul <vkoul@kernel.org>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Arnd Bergmann <arnd@arndb.de>, 
 Sven Peter <sven@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org, iommu@lists.linux.dev, 
 linux-input@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-sound@vger.kernel.org
In-Reply-To: <20250612-apple-kconfig-defconfig-v1-0-0e6f9cb512c1@kernel.org>
References: <20250612-apple-kconfig-defconfig-v1-0-0e6f9cb512c1@kernel.org>
Subject: Re: (subset) [PATCH 00/11] Drop default ARCH_APPLE from Kconfig
 and use defconfig instead
Message-Id: <174989957100.19870.13761538351492320924.b4-ty@kernel.org>
Date: Sat, 14 Jun 2025 12:12:51 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250614_041257_296502_7172910A 
X-CRM114-Status: GOOD (  15.25  )
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

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[10/11] ASoC: apple: mca: Drop default ARCH_APPLE in Kconfig
        commit: f59427932885f9b47b22b532b079478905b9ad08

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


