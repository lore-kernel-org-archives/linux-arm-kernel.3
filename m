Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E3BDD35668
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 03:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZPfThlWCYMm1yIZqof+raQMoNGoslQTrbBsgYLGW+Oc=; b=MZafj0LBA5T2PSdQiHSir8g+zs
	1pxdtVMcrfeLMfyrLbtfmFskXNMa8WWGC7GEaBsC1Kr5OSm3zA/Q9vFMBjZeQGpwATwcfGJpEm8ug
	dXuH8OQ0rEePQnLXSXwKW0jgCe5G6LkRvUGLwWw2kyPeUs891t8uz8vFNcTxWz/yyewraq4Nm1VI1
	X/OIapYB1gRzmkCYbdQ3HqBnXJmY23W/7HK1hqP/Ur66VhVjuuseM2JXwvQMeZZcmeejRp9f+G/3y
	iMqAFUlTKuUxMqqwif/Hzc00Tp960e5FNWhZRTlafghSDaiC4YfTFFuWgXTn/CbRb+Iw22D9NAIrt
	cgWlahRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkvp6-0000000FKqy-0ocR;
	Wed, 28 Jan 2026 03:02:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkvoy-0000000FKpS-0mRh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 03:02:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 671C843AEF;
	Wed, 28 Jan 2026 03:02:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B90E8C2BCB1;
	Wed, 28 Jan 2026 03:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769569339;
	bh=/fPPEPcwmF3TdH7Q9cOa4teh7j31CwYm2Qus1YwzhtA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=XV+DvkAlwmNQm9QvMt+Q/bf1nQ8qCfkHzvgXEXvvyTM4zNf3FwGFtoGZZiGpN2Byt
	 o/+X9ATo6AIzmbpc0hYgct4hMO2OUuS8ywmb0R94aNA4NevQ+iY09Nn+MewQB96Lxy
	 xU4MHG3Mihth34JQkjviSKC4kzVF9bZkJ1qny8jKIOtDIkJE6W5NsxlW5jl49W9fwo
	 Xn5b9zDHmr7KqHF6uHMKB717qVT1fgFOfSyW1T+CAE7whO3tpwYKIg3m/kTFGQra8K
	 Rct+FsktiojFg2kdZGbGspWJ+UBO1Y9yBJz3lgaR63W0qf1tXpWehV/l+RNzgRLg4m
	 oQFrC9GXrNhfA==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Daniel Mack <daniel@zonque.org>, 
 Haojian Zhuang <haojian.zhuang@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Peng Fan <peng.fan@nxp.com>
In-Reply-To: <20260122-sound-cleanup-v1-0-0a91901609b8@nxp.com>
References: <20260122-sound-cleanup-v1-0-0a91901609b8@nxp.com>
Subject: Re: [PATCH 0/4] ASoC: codec: Remove ak4641/pxa2xx-ac97 and convert
 to GPIO descriptors
Message-Id: <176956933650.1515833.16491235295905220325.b4-ty@kernel.org>
Date: Wed, 28 Jan 2026 03:02:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_190220_310028_05F37117 
X-CRM114-Status: GOOD (  14.87  )
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

On Thu, 22 Jan 2026 20:44:56 +0800, Peng Fan (OSS) wrote:
> The main goal is to convert drivers to use GPIO descriptors. While reading
> the code, I think it is time to remove ak4641 and pxa2xx-ac97 driver,
> more info could be found in commit log of each patch.
> Then only need to convert sound/arm/pxa2xx-ac97-lib.c to use GPIO
> descriptors. Not have hardware to test the pxa2xx ac97.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: codec: Remove ak4641
      commit: d7e1f9e84af460c5f1e5352eda8f036000cfcf0a
[2/4] ASoC: codec: Remove pxa2xx-ac97.c
      commit: b094de7810f3c0340a3aebaf6b8fc60c81c0cf91
[3/4] ASoC: pxa2xx-ac97: Remove platform_data
      commit: be829277ef79aa626e952e17030d711bdb6c1eef
[4/4] ASoC: ac97: Convert to GPIO descriptors
      commit: c76d50b71e898694c946993eb3c77f50efa97254

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


