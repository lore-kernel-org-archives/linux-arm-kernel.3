Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47C15CD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 22:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f3oMmrVXWyC5Wzc2sMvrJFI2Fzlu9pNGMbkNW/R6LDg=; b=mqsLL7NmyWzupYR/PP5/YDP+cY
	LBX3YMnASQDXXnO8Oq647qo3YOL4RcaL4sLzMdP+dS1RjTOe8YtN0Ltd9sCcZ3/ROeMVMzPU1P+M8
	O8mKDrDns9vqmSEbARsayFEPCjIfrEhR0eAm0mz3BablguRj/xKQ/OHzCR+XNxii39h+k+3GYSmFq
	8/CPonY6CTHwKu0LQaj9nWMrT3xv0EMRyC5GJuyRN3Zv/r0YmoUdJrIUchcLnaxzbWXh2B+Ds8icQ
	eK9rCOVcLyOCmZHNO9EQDYFDCF2R+TWyLq3IIo3Hp9PCxzQKn1hAV4VgCMaW6sIIO5seB3vPiK/j9
	P1dACpjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYADZ-0000000BekL-0bVI;
	Fri, 12 Jun 2026 22:19:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYADX-0000000Bejj-21HI;
	Fri, 12 Jun 2026 22:19:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6534D60008;
	Fri, 12 Jun 2026 22:19:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E57F1F000E9;
	Fri, 12 Jun 2026 22:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781302750;
	bh=f3oMmrVXWyC5Wzc2sMvrJFI2Fzlu9pNGMbkNW/R6LDg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=GfSNY6tCmURPFfTsAasGL0KULYw37NvIrwenNSXCO/zHges2r36rBXCobJI29tX4l
	 U0tU5umwOrMPHeEhXR/dd84LBvkF9k2aW+KlvfMTLVX93yDeX9jy3+JtYqxS2DXEbK
	 navC49qjtLL3G+AjcpbjT8wL3TwFovpAPGjzXjf2K1jAKdrm+7EreeYK9KKK/DbCyv
	 G/oysRjWCRWKv5G4eH47bYr7gwpDcLJnYYb12KJr+A9u1eMG3rSni3Q6dmO9LkaUZO
	 WtEExJKjv2H1O0OstT40Sf7pUMp/DySKlMo23Z8uKSqsHNrQJ1/mJ6KcgpP/yaM0cC
	 2HdGNa3v4ttOg==
From: Mark Brown <broonie@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>, phucduc.bui@gmail.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org
In-Reply-To: <20260610102021.83273-1-phucduc.bui@gmail.com>
References: <20260610102021.83273-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH 00/10] ASoC: mediatek: Use guard() for mutex & spin
 locks
Message-Id: <178120798545.484538.11565286739109588330.b4-ty@b4>
Date: Thu, 11 Jun 2026 20:59:45 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2577; i=broonie@kernel.org;
 h=from:subject:message-id; bh=s6eAXdoqlUtuLTZth4AInopuSR9AS4C4NIHo4pAOH0g=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqLIXY3qY4bPRZzGt04t1+88KFfah/WK8pl1Dii
 yKqa5Bte0aJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaiyF2AAKCRAk1otyXVSH
 0KzRB/9/lmKAq9WvQTjtXr2vcfs/RpkjmcKxB1gkRm+rO78MqATIRHFdBOlzCezkeK9Dmo+S2Ay
 4ZIDE/MC2+d4ssKrXbyMz1rekMFO+njYDoU43qtDjrDDavijOkMhKkKo0pydBQw7x7L+0eR4+2u
 Bez+M4/iIcpOhN4YtmBOicPNspZ6q0HTToJOEOMIqfklZ1amGHSR5SRpZaPB0CxIuYGo7ENsbzd
 BUFnaoRCq90RJXIb27JQNQHUS4Rb/+2tjlAMEQJ0wYhW9nOhsazyJhuK1z8WD+JVMNCvooK4Y6S
 lBBqwLu4fLlE3XNIbXDyVc6bSglIbyHdOL9VABtfuxeeXKRe
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

On Wed, 10 Jun 2026 17:20:11 +0700, phucduc.bui@gmail.com wrote:
> ASoC: mediatek: Use guard() for mutex & spin locks
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> This series converts mutex and spinlock handling in Mediatek ASoC drivers
> to use guard() helpers.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[01/10] ASoC: mediatek: common: mtk-afe-fe-dai: Use guard() for mutex locks
        https://git.kernel.org/broonie/sound/c/9475859429e4
[02/10] ASoC: mediatek: common: mtk-btcvsd: Use guard() for spin locks
        https://git.kernel.org/broonie/sound/c/c69724b714c5
[03/10] ASoC: mediatek: mt8186: mt8186-afe-gpio: Use guard() for mutex locks
        https://git.kernel.org/broonie/sound/c/1e9f4587c873
[04/10] ASoC: mediatek: mt8188: mt8188-afe-clk: Use guard() for spin locks
        https://git.kernel.org/broonie/sound/c/cc29c31e87fc
[05/10] ASoC: mediatek: mt8192: mt8192-afe-gpio: Use guard() for mutex locks
        https://git.kernel.org/broonie/sound/c/14edf39daefb
[06/10] ASoC: mediatek: mt8195: mt8195-afe-clk: Use guard() for spin locks
        https://git.kernel.org/broonie/sound/c/a9f8d09ab109
[07/10] ASoC: mediatek: mt8195: mt8195-dai-etdm: Use guard() for spin locks
        https://git.kernel.org/broonie/sound/c/a57e39c7ff03
[08/10] ASoC: mediatek: mt8195: mt8365-afe-clk: Use guard() for mutex & spin locks
        https://git.kernel.org/broonie/sound/c/befae7299ab4
[09/10] ASoC: mediatek: mt8195: mt8365-dai-adda: Use guard() for spin locks
        https://git.kernel.org/broonie/sound/c/754c2fbf8bbc
[10/10] ASoC: mediatek: mt8195: mt8365-dai-i2s: Use guard() for spin locks
        https://git.kernel.org/broonie/sound/c/62bde3771c3b

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


