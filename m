Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12420CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 10:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nulHJL9kJLIpA0dFtXRxyHkO5i/ASN8Tu4K5VpXlcec=; b=is+UEhFTVYPAAA5bBjRPt8vS+T
	YxrgAKQHnUh8BUIH+b+iUd7aSi1vI/KlrgTGjbE50ww1GJBZYu7uBYfiTFg40kV0IwNmfKKi91Ayl
	6z1325qxxzD0FI9v7WmFTyZ9r1iN2jEL4OEnLvXPT2C1Z7yAmG0kfNIFNSGH8VHCpD/RMa5bpau0F
	5CEzgxTDnZaOkhzmOlaE6oCdQD7+wASEehk13dnUwP3o+AuZujN6x2KUwRAR6oXfeai+jH+9wkLn4
	taGuBAdwT5ElX4i4pOMNqRmz+dn4uJsOFb+vPHyJEqIQohrEg4HXLGTZcwsvwiUDpXSAInIG09kEI
	2sDSkQzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBUfP-000000033B4-3cby;
	Tue, 29 Sep 2026 10:02:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBUfO-000000033AR-1lWw;
	Tue, 29 Sep 2026 10:02:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E96F34170F;
	Tue, 29 Sep 2026 10:02:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F2F81F000FF;
	Tue, 29 Sep 2026 10:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790676149;
	bh=nulHJL9kJLIpA0dFtXRxyHkO5i/ASN8Tu4K5VpXlcec=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=RgioHhkmNdZtQvg+MiGPMxL9dx4r3u+xbFBYJ+THf5+Rj/t1kYEUpNgjYcTL1nQTu
	 3GaKqOflr6Gedtkz3eaZ2HgTDTQH4Z/qjtDDQqbnH/SCyY/INOtgoNCT0wuarQSM/c
	 B3tQvJjW5qVFkT3M7BVZTD0CT0ZQD9l93lKc8HiL9NFRWAmni9vH9/Dku5N99tpkxI
	 gsTJvOAegSDLNZ4mC84wwTemvPkhvsv4ol4+Ss1vutXG8SP6BD1IiOb8v1l4uSVISh
	 d+5ClpJQJWNSDUED1S2adj1CVP0m8MDYWPXTiNs4MdmWKvM5j3R1A5zfUsKHDh21Q1
	 wpBrAxlcnNR0g==
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 phucduc.bui@gmail.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 cassiogabrielcontato@gmail.com, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, 
 Jiaxin Yu <jiaxin.yu@mediatek.com>, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260918133912.133799-1-phucduc.bui@gmail.com>
References: <20260918133912.133799-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH 00/15] ASoC: mediatek: mt8192: Improve error handling
Message-Id: <179061349732.139547.10371331992646576384.b4-ty@b4>
Date: Mon, 28 Sep 2026 17:38:17 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3193; i=broonie@kernel.org;
 h=from:subject:message-id; bh=stgBM7pYGROF9+rzR96tnRXOrCNzrYnyoCUvQ4IcUNg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqu4ywQnV3aU6c7DM6H1ZPC3cV2G/fM4z512afD
 8CUVlf9y4OJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaruMsAAKCRAk1otyXVSH
 0InXB/9UXNYse/bdzBQAmCKkxDQ72Yf7LfgHio339TkWNwiU2WRhi8z625A0K+Pehuiu3TFijUi
 t5+nOTeESV2C/DVzyENdDvLE6SZnWWCTyIHUWLS8MS9c7RaiQSyf9rAR3saw1+Z9yJa8PLfvLuf
 O2GTgXmoqcY3rLV00ontvlsV8k/Gw+6kn1zhfs22SRATtnEXsSTCzVZvZC3Fie05QXPr038QlVM
 UiH5gSzL5yzbzmfYqj02yW2xYD31mfIA+h3jIRepeKuzHAg3sKCGnvZZY5L1KR3tUC6fC7z5LpT
 m3yITdtFU+04m+uo4Xs/1GrKMSWrid88StM6M+CbSYeYjgCn
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

On Fri, 18 Sep 2026 20:38:56 +0700, phucduc.bui@gmail.com wrote:
> ASoC: mediatek: mt8192: Improve error handling
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> This series addresses part of the error handling in the MT8192 driver.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[01/15] ASoC: mediatek: mt8192: fix APLL mux error handling
        https://git.kernel.org/broonie/sound/c/e8c263e0ef95
[02/15] ASoC: mediatek: mt8192: fix AFE clock error handling
        https://git.kernel.org/broonie/sound/c/7c54781e6e60
[03/15] ASoC: mediatek: mt8192: fix error handling in APLL enable functions
        https://git.kernel.org/broonie/sound/c/88760524ca99
[04/15] ASoC: mediatek: mt8192: fix MCK clock error handling
        https://git.kernel.org/broonie/sound/c/4a0ab266cb15
[05/15] ASoC: mediatek: mt8192: switch to devm_clk_get_optional()
        https://git.kernel.org/broonie/sound/c/6f4edfdce009
[06/15] ASoC: mediatek: mt8192: Use dev_err_probe() in mt8192_init_clock()
        https://git.kernel.org/broonie/sound/c/bed395cb305b
[07/15] ASoC: mediatek: mt8192: Propagate errors in mt8192_afe_gpio_request()
        https://git.kernel.org/broonie/sound/c/411be3902fa8
[08/15] ASoC: mediatek: mt8192: Use dev_err_probe() for devm_pinctrl_get()
        https://git.kernel.org/broonie/sound/c/59608878c593
[09/15] ASoC: mediatek: mt8192: check return values in mt8192_afe_gpio_init()
        https://git.kernel.org/broonie/sound/c/7cca184ad434
[10/15] ASoC: mediatek: mt8192: Handle regcache_sync() failure in runtime resume
        https://git.kernel.org/broonie/sound/c/d9e264741b04
[11/15] ASoC: mediatek: mt8192: Remove redundant error message
        https://git.kernel.org/broonie/sound/c/d31c0d3eb414
[12/15] ASoC: mediatek: mt8192: Propagate mt8192_afe_gpio_request() errors in ADDA DAI
        https://git.kernel.org/broonie/sound/c/eed9414a1b07
[13/15] ASoC: mediatek: mt8192: Propagate errors in TDM DAI DAPM event handlers
        https://git.kernel.org/broonie/sound/c/d0bc9613bc2d
[14/15] ASoC: mediatek: mt8192: Propagate errors in I2S DAI DAPM event handlers
        https://git.kernel.org/broonie/sound/c/49aeb628d10e
[15/15] ASoC: mediatek: mt8192-mt6359: Fix error handling in MTKAIF calibration
        https://git.kernel.org/broonie/sound/c/d6c8a0b5bf69

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


