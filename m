Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCFCEC55162
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 11:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LVHWZvePVBLXjM9MPn3NlL7GgsLFfAvDE8L3DbsP3yg=; b=JTy7/U8J1YtjhG2uUasre9Kmr8
	DqFYbY7IkvsjyuQSfk+zaTodNV8simMoAqIRmPSA1ulKZuR5oqxiKcsH2KBVss7qkIqxQ5Lg3TIuX
	V/mW6HiS5TtXL6A5RuA3nG8vUtLo6WvfFEooFoVBFNegfRVS4QgMk5PKvU5h7zB6Vb+wnR6bOPqhD
	oLgrbNUWfUFLhf9E2btHHOPpPmmD5nRYnWXO7S1HUVgfvXLYRzJIZ9UIyLZ7K0bYVr4cxv0aG6/AP
	9LYCiJibL7e2XO1PKHJyXPhQDPDCa6h4UcF0e7hMEGZsRKKa7jn/0KjvsF0QqXL8uz4+HhFAu4Q9u
	4xjSx4dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpOsc-0000000AL6H-3eAx;
	Thu, 30 Jul 2026 11:24:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpOsb-0000000AL5e-0M9F
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 11:24:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2AA10600B0;
	Thu, 30 Jul 2026 11:24:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A42E21F000E9;
	Thu, 30 Jul 2026 11:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785410686;
	bh=LVHWZvePVBLXjM9MPn3NlL7GgsLFfAvDE8L3DbsP3yg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Ef9HY2rCjsm/msVt4ofQ7cVNumr2Jh/kYhQgkJkfpUzsyFh2btVUxIzD3BOz+TE4E
	 90IKtAQW6iZFKf2Otct7fWULPlVh9N5cNPn1vnIZ8OFS308vZpLwhjMi1U9y3j7g9g
	 0LIjjwOKYoRNqIDlQ9321F2+7CWmcJ3tXVtoAg3BWk1uHZprU4HEjQjniIhFgA17dm
	 uoGN12rD6oz+dMtGtwN0SrytYXLOnivfZ+c796VaNqWOfOGLa6op45NKpUlQbsvxLd
	 Vs+u2Kv2K+M3maXNGowGp2VmJ2KvG8Yf/V2CzyJ1KWiydBztzNBb/VOAfGUam0hPvV
	 N7eVEOdjCtPWA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Olivier Moysan <olivier.moysan@foss.st.com>, 
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, phucduc.bui@gmail.com
Cc: linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260720074044.87528-1-phucduc.bui@gmail.com>
References: <20260720074044.87528-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH 0/4] ASoC: stm: Drop redundant error message
Message-Id: <178536726558.512962.11305528912668407095.b4-ty@b4>
Date: Thu, 30 Jul 2026 00:21:05 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
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

On Mon, 20 Jul 2026 14:40:39 +0700, phucduc.bui@gmail.com wrote:
> ASoC: stm: Drop redundant error message
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> This series removes redundant error messages across multiple STM32 ASoC
> drivers. Since core functions already log failures internally, dropping
> these explicit dev_err() blocks prevents duplicate log messages and
> cleans up the code.
> Compile-tested only.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/4] ASoC: stm: stm32_adfsdm: Drop redundant error message
      https://git.kernel.org/broonie/sound/c/30df43c14050
[2/4] ASoC: stm: stm32_i2s: Drop redundant error messages
      https://git.kernel.org/broonie/sound/c/a6cdfb623094
[3/4] ASoC: stm: stm32_sai_sub: Drop redundant error messages
      https://git.kernel.org/broonie/sound/c/e502adb1cdd6
[4/4] ASoC: stm: stm32_spdifrx: Drop redundant error messages
      https://git.kernel.org/broonie/sound/c/94495c842711

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


