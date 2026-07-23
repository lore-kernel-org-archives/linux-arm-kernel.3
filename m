Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CD22C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 00:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d+rccmQha0mpuPngPslpwm9IlHn7y2fRy92hIecwpwU=; b=RnGIoVmRtkK+lb1FIuqNiWKNrl
	y9t7IW0ieZx8UQaFp1eoWM1sG7S/mhf5sJ3CVcPlkhL4nP58iKu7nur4Sk9FNjEHDsfSvFOzRz58+
	dxZ0vS+3d0ZHq3x7g8Xa6aE43lBE/PgykgQkd7ELaqNuoI9T2h52KUBon2Ck5VxLVkTycrxAbf50+
	xpHwfi+/V/p1iGhls3gQ/pbQ/TBAVkxVDyHhFIRndSmrKuSLqBcrGZL8kyQz9T46amMSvQzJDttSz
	mn+LybXfAcjqU2EnQV2lYnJQxpGJRY50qaXFS9/tjUEDOpPBSAFNFxl5+5VdAbhBRg6YQHLr0jygy
	q50fVr/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn4FK-0000000FJTb-1NuZ;
	Fri, 24 Jul 2026 00:58:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn4FJ-0000000FJTP-1ufm;
	Fri, 24 Jul 2026 00:58:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E0E75600AA;
	Fri, 24 Jul 2026 00:58:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5600F1F000E9;
	Fri, 24 Jul 2026 00:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784854716;
	bh=d+rccmQha0mpuPngPslpwm9IlHn7y2fRy92hIecwpwU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=mshJbWy0j0QQWNkkG8gXmWO6ppIV0IlAJcYk9boidTMNFrC/1KqMNNLDHoM22uWc0
	 Ms407o5SLpJCWf22jjPNcjG0d4OBrZ0Uey5P4XJ34HEFy5Rn1h5857cpPzCZXnPtJ5
	 Z+3WO2F3a9ffbGWBkCubKGByTRDm/2fDq/qcHby6x8f+CccB+AN6RPouE+O1NxgVR6
	 MiN5WV16JA19a/CpVleoVKkKsuxO5jdLcrCGxVL0ZAiA8igjtsPiIlItkjNmlns4cG
	 7hUrA7UrUrb3WIXJo3XjugVt/Zrq/Wi2ehsDO/zo7P2603TxYPlDkU56HoWZ9uZlw9
	 ytgX++hb3wYpA==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.com>, Nick Li <nick.li@foursemi.com>, 
 Herve Codina <herve.codina@bootlin.com>, phucduc.bui@gmail.com
Cc: Support Opensource <support.opensource@diasemi.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Oder Chiou <oder_chiou@realtek.com>, Linus Walleij <linusw@kernel.org>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 u.kleine-koenig@baylibre.com, Zhang Yi <zhangyi@everest-semi.com>, 
 Marco Crivellari <marco.crivellari@suse.com>, Kees Cook <kees@kernel.org>, 
 HyeongJun An <sammiee5311@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
 Qianfeng Rong <rongqianfeng@vivo.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260721102600.523199-1-phucduc.bui@gmail.com>
References: <20260721102600.523199-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH v4 00/29] ASoC: codecs: Use guard() for mutex & spin
 locks - part 2
Message-Id: <178482419886.53486.18432313898881224470.b4-ty@b4>
Date: Thu, 23 Jul 2026 17:29:58 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4775; i=broonie@kernel.org;
 h=from:subject:message-id; bh=jaCu5qL9mMDjt299UAYjuj7jDb/QtbuwtHVWE2JfdRw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqYri2ZaFghhN04vjJsl7C/an/f7uE0vwP69/DC
 cZ0ZNCAWYqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCamK4tgAKCRAk1otyXVSH
 0M2mB/4tFJE1SWmELrjSsFmKq6ErAzAYZrhQOIMLdUDmKljimPjS+14gXIYcfD79sT8/ntCHUi4
 WALB7CaiTwKk9EPaqkmF/YOLj5E55t1pb3I7sCEq0RI7lfbMg3DwTalR5RJKNmsoioPGvZVx9bO
 K4iV+g/CSmsiHC4E/ot6h06VZOJ4Tutj4FGP7eJC8rSaGSbG/6uUDPJDbqmQJNXrVQ/gLH6Rh4L
 F0C0CsoVxdh13hRH7GVggW01+NVjR0bzM2ImRwDaf+/H5xYzu9LOqQL7r8yqNeUViRKbZCfRPRf
 yScDFBM+dU0uBnv0zCOOc16CXsH3usDKRnFBRrp6fRqe+KGo
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

On Tue, 21 Jul 2026 17:25:31 +0700, phucduc.bui@gmail.com wrote:
> ASoC: codecs: Use guard() for mutex & spin locks - part 2
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> This series converts mutex and spinlock handling in ASoC codec drivers
> to use the guard() and scoped_guard() helpers.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[01/29] ASoC: codecs: da7213: Use guard() for mutex locks
        https://git.kernel.org/broonie/sound/c/847b7114df54
[02/29] ASoC: codecs: da7219: Use guard() for mutex locks
        https://git.kernel.org/broonie/sound/c/47f85aa98bb2
[03/29] ASoC: codecs: es8316: Use guard() for mutex locks
        https://git.kernel.org/broonie/sound/c/357d20c73de6
[04/29] ASoC: codecs: es8326: Use guard() for mutex locks
        https://git.kernel.org/broonie/sound/c/61bc0010fafa
[05/29] ASoC: codecs: es9356: Use guard() for mutex locks
        https://git.kernel.org/broonie/sound/c/17b1563aad1f
[06/29] ASoC: codecs: fs210x: Use guard() for mutex locks
        https://git.kernel.org/broonie/sound/c/db044108a54a
[07/29] ASoC: codecs: hdac_hdmi: Use guard() for mutex locks
        https://git.kernel.org/broonie/sound/c/51aac9ed7c0e
[08/29] ASoC: codecs: hdmi-codec: Use guard() for mutex locks
        https://git.kernel.org/broonie/sound/c/9c61998c9c85
[09/29] ASoC: codecs: idt821034: Use guard() for mutex locks
        https://git.kernel.org/broonie/sound/c/e199ec211b53
[10/29] ASoC: codecs: lpass-macro: Use guard() for mutex locks
        https://git.kernel.org/broonie/sound/c/9296b430502c
[11/29] ASoC: codecs: madera: Use guard() for mutex locks
        https://git.kernel.org/broonie/sound/c/5dabb2549c89
[12/29] ASoC: codecs: max98095: Use guard() for mutex locks
        https://git.kernel.org/broonie/sound/c/750c61b2920f
[13/29] ASoC: codecs: mt6359-accdet: Use guard() for mutex locks
        https://git.kernel.org/broonie/sound/c/3ec678539a9f
[14/29] ASoC: codecs: pcm512x: Use guard() for mutex locks
        https://git.kernel.org/broonie/sound/c/b812b16661e8
[15/29] ASoC: codecs: pcm6240: Use guard() for mutex locks
        https://git.kernel.org/broonie/sound/c/f3da3b7f6ed2
[16/29] ASoC: codecs: peb2466: Use guard() for mutex locks
        https://git.kernel.org/broonie/sound/c/f7a116261d6b
[17/29] ASoC: codecs: rt5514-spi: Use guard() for mutex locks
        https://git.kernel.org/broonie/sound/c/ed2e18138f18
[18/29] ASoC: codecs: rt5645: Use guard() for mutex locks
        https://git.kernel.org/broonie/sound/c/1937a1e0969e
[19/29] ASoC: codecs: rt5665: Use guard() for mutex locks
        https://git.kernel.org/broonie/sound/c/f1c58069475c
[20/29] ASoC: codecs: rt5668: Use guard() for mutex locks
        https://git.kernel.org/broonie/sound/c/c745a4e595c5
[21/29] ASoC: codecs: rt5677: Use guard() for mutex locks
        https://git.kernel.org/broonie/sound/c/be03bd5c4c34
[22/29] ASoC: codecs: rt5682: Use guard() for mutex locks
        https://git.kernel.org/broonie/sound/c/97ed7ddb98d6
[23/29] ASoC: codecs: rt700: Use guard() for mutex locks
        https://git.kernel.org/broonie/sound/c/5d649ea1d053
[24/29] ASoC: codecs: rt711: Use guard() for mutex locks
        https://git.kernel.org/broonie/sound/c/f8e861f73b90
[25/29] ASoC: codecs: rt712-sdca-sdw: Simplify regcache error handling in resume
        https://git.kernel.org/broonie/sound/c/cd1c99ff8cf7
[26/29] ASoC: codecs: rt712: Use guard() for mutex locks
        https://git.kernel.org/broonie/sound/c/32ac6377cec1
[27/29] ASoC: codecs: rt721-sdca-sdw: Simplify regcache error handling in resume
        https://git.kernel.org/broonie/sound/c/2df329044c61
[28/29] ASoC: codecs: rt721: Use guard() for mutex locks
        https://git.kernel.org/broonie/sound/c/219fbaa1b6d1
[29/29] ASoC: codecs: rt722: Use guard() for mutex locks
        https://git.kernel.org/broonie/sound/c/cce043d552cd

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


