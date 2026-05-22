Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1D76CD5BB3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 17:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K22gNRoh2z9yLN92hgi07gB7wLMlyv2U+j/zIg7Two8=; b=zuWsyBgzGUI7E+MD/ZFl4XT24F
	37OI8tSwVAxgwiY4JyriLTMikjtTJEOGIqyt4jPipZJb0iaK3tFcAuNqARmf152svXm/Wa0VQu1gX
	mJS/kTQ3tI7Ar2Gl1fTtFzRJfWkTuh7kWryjs9JGz8OpHXaNVeocuhECMgo9s14utCuRApOnxP3FS
	JLSshp6vQCGxU393gqpc09MJaVJ6Epl/5n5RRMLvvVwzuVQUbD7wANqLyPdDQpXQ74oTm9Cbv32vS
	tw2OYqNcYbW/PZDCHvwA/NQI8+hu0eQycTjyOXjGJF8g9nDFj+RxIvPIC0IWVuoWkcDmqeHq1Ak41
	HM1LXJSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQTus-0000000Bagu-0yFx;
	Fri, 22 May 2026 17:44:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQTuk-0000000BaeW-3jJe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 17:44:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8EF0B43874;
	Fri, 22 May 2026 17:44:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 459851F000E9;
	Fri, 22 May 2026 17:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779471842;
	bh=K22gNRoh2z9yLN92hgi07gB7wLMlyv2U+j/zIg7Two8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=V28kY8SvG4Ipwl37n1Zb+BfUlvKbi/q1KOCANLazO/AUMWs8LdVgsU3OBjuKJGv2b
	 zKrZYp0Gn2nMNdOzH2LEHgmmHKVe0Ijy+lqwXpeENrI/13C9sk7ZNybhVDXs9qEP9J
	 k0LXZuZ0Wxni335iDzREvLxxITTHHAqY4Pu4tOLtPXNUjjdF/wAYwx+Toic5gYzefA
	 qhFYvxxXZAKetz0xjRsZqQdvOe8jY36EY+q+vxjr80T+EOi/z+CBq3xLMkfb7brp5M
	 uYWOF4iidpCPPeqva2arWerxghmxsIZk62BJUxApUJrSYK3qqqxpnEp4n4OQXZGFJq
	 Q8Zb0nGbTaoSg==
From: Mark Brown <broonie@kernel.org>
To: olivier.moysan@foss.st.com, arnaud.pouliquen@foss.st.com, 
 phucduc.bui@gmail.com
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 
 linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260515112458.34378-1-phucduc.bui@gmail.com>
References: <20260515112458.34378-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH v2 0/4] ASoC: stm: Use guard() for mutex & spin locks
Message-Id: <177945340534.6494.9459779300774728810.b4-ty@b4>
Date: Fri, 22 May 2026 13:36:45 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1740; i=broonie@kernel.org;
 h=from:subject:message-id; bh=xWFVqWztShCirmApW3gFp7kLzV92xCyCzkRDksqOHGE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqEJXfKyDXbJQfdrp4L/s53dZlnV+F057bQiQt5
 UY/e23F22iJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCahCV3wAKCRAk1otyXVSH
 0Ow7B/4pPIJXmPZTefFXWsQL84lP4Kk48+aWzm16FutztIvaUHaW1SJXmqmauCZI5b1uMEiEFae
 ahkGNn5CfFZMHif8/yzHTIs6/3zEp30fPmDt7ze1Tebq46VEQgqGlmuoDsJZqSlB76vi0VGogGx
 a1K4GSvksfz6BM3oob91h7qSZrHxV+SB+xbfULBKRgGL9uCE7IvKlRw3G14ze9ro6YkCNMeWuu8
 qIb9Br51R1/zI1OOB1D1YPE2x/RDo/dQSyiyKJHGO3h0k9DX1jiJt3kzucwNrNDyB7k/39fZARD
 cBHgjFmjdq/vmNOk7MW66pJ1R3mukbEsVIo39LidLtFi5f37
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_104402_990507_3CFD59BC 
X-CRM114-Status: GOOD (  12.33  )
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

On Fri, 15 May 2026 18:24:54 +0700, phucduc.bui@gmail.com wrote:
> ASoC: stm: Use guard() for mutex & spin locks
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> This series converts mutex and spinlock handling in the STM drivers
> to use guard() helpers.
> The changes are code cleanup only and should have no functional impact.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/4] ASoC: stm: stm32_adfsdm: Use guard() for mutex locks
      https://git.kernel.org/broonie/sound/c/dabf5b45b18c
[2/4] ASoC: stm: stm32_i2s: Use guard() for spin locks
      https://git.kernel.org/broonie/sound/c/b212cb00168c
[3/4] ASoC: stm: stm32_sai_sub: Use guard() for mutex & spin locks
      https://git.kernel.org/broonie/sound/c/5e54b4c280af
[4/4] ASoC: stm: stm32_spdifrx: Use guard() for spin locks
      https://git.kernel.org/broonie/sound/c/3f0d573c3259

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


