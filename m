Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB259C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 16:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q3E91wuDfCT8BFLnPyL3EbfnCVT24U4SNlKSwb5/uX8=; b=0mK/lmcFb/ORfQhYTlkA6jYqyu
	VfBh0AMMg9Skg8vsdN6NgU4JDn+qSpSkq/SUA+JWQdB2wAqUSTZ+pax1J+TjEnVu1N+PMeX9HuYXA
	7rSHIwKp6kwjynBQbq9/49a9atOD59ZXzOICFn3cS4joaschMwT8y04ymfwAJd4XUAIkAW89IWIdj
	f0l7JbMs53ngjk0k67bIg18ZEc1RO1xzBmjCOurpBj7MPDBRZhuv0uSFAoGTSqA2W24VffAk60t27
	m+NsgDKKt9QpAfbzQztAXrQ0pP0m6ymPc8ffHom1C9U3WuddZSHUi+GD1WktCy1UgFgaeW/Sc/DbV
	6lL58hHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpVNV-00000005Tv9-1mdV;
	Tue, 04 Mar 2025 16:44:21 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpUJO-00000005ExK-1rpZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 15:36:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D4B86A45843;
	Tue,  4 Mar 2025 15:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CD44C4CEE5;
	Tue,  4 Mar 2025 15:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741102561;
	bh=52x7TUjSQQWpNjcLzsxfo3TSUHtkZ2ZLty6KE9TnZ1I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=sUFIQLOEK/Fk9lumGa2oLz7mNk8mJeHZ9FpACCkSde6hagzcMxIH27nfrE9GqSBbO
	 qdIgrhxvf0ukv+SQqVHtPH/1kYSdkcHGcsvu7d3ytk0ijwsHFWxElSaM5Fzj2CUDEn
	 n1NOHACB1cq7kRWyx0T3Q05R+3/8n+8haiPURrMkAUW8uXyZ9LleVgSwrkX/MeSyL/
	 4KbuZu7gCcUxa00ST3zmzSt4Fiz8y1vPyP80zFwCRTD8xKcYLh+2MY5+kN96auA3a4
	 5nY1MKr/teMu2AkGtclt8gQCXtKUd+sgqP+k11RV3kO8SCA5DcHF2fhIWacuc636qQ
	 fuTpiuJahbRtQ==
From: Mark Brown <broonie@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org
In-Reply-To: <20250303-samsung-codecs-v1-0-56a2299dd928@linaro.org>
References: <20250303-samsung-codecs-v1-0-56a2299dd928@linaro.org>
Subject: Re: [PATCH 0/6] ASoC: samsung: GPIO descriptor conversion
Message-Id: <174110255924.87345.17067818310965896666.b4-ty@kernel.org>
Date: Tue, 04 Mar 2025 15:35:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_073602_555217_EDB6BFBC 
X-CRM114-Status: GOOD (  10.94  )
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

On Mon, 03 Mar 2025 09:41:40 +0100, Linus Walleij wrote:
> This drops unused includes and converts one Samsung
> codec to use GPIO descriptors.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: samsung: bells: Drop unused include
      commit: b19d340d5d08c5940ce612c2a1b5fe3a8a401f9d
[2/6] ASoC: samsung: littlemill: Drop unused include
      commit: c4b2d9643a06a5326a778c4d77d6fa60e0f3d6b1
[3/6] ASoC: samsung: lowland: Drop unused include
      commit: 5c06f7f3d8374df1cec3b353306a4d1032a60f44
[4/6] ASoC: samsung: speyside: Convert to GPIO descriptor
      commit: da9146c19b1774926148ff271c4a3dc8d7891b18
[5/6] ASoC: samsung: tobermory: Drop unused include
      commit: c095b7a27529d1d18b3b36a47f77a1419f0de939
[6/6] ASoC: samsung: tm2_wm5110: Drop unused include
      commit: 0a22454ab2eca530702b2689858909b608953703

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


