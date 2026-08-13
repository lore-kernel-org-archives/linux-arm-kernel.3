Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00473C5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 11:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VxlozOHTV0l7kH01VkY8gMQr+CBC1D950EXG7JLaJQA=; b=49JShk6v3w9ms/46Ai/uurwK5g
	llr6hFAtoUtHPA68O076j9t+MwwBIajacxQMcy99cEhQGz/eIwSPOnIbjUDaEDY29XqYOhBuNwxvq
	rRfCj23ROUKdE3kea+u4BJ6TTYf5fbJ73DLXwsr8gH13UTkR0Ym1NPLFesw8d1R9YhypwjGM8UnLs
	tzizMJjivZJaqsoUB6Ca3EXunyqCAUpXvN4URTXdqgn//qedzZX5guD1LF/N13wWQq7/YVgi7ONck
	AuSbSS2SfQ4cGY2GlACBufvdGbdgr7dKlvsJQxJs1Y6DPy0XN4CxtxXi9K5oHdRLvHhTIhmAAZkrV
	q94i4m1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuqEl-00000002bFw-3WCz;
	Fri, 14 Aug 2026 11:38:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuqEl-00000002bFn-13Vp;
	Fri, 14 Aug 2026 11:38:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 40C85600C3;
	Fri, 14 Aug 2026 11:38:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F16A1F00A3F;
	Fri, 14 Aug 2026 11:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786707490;
	bh=VxlozOHTV0l7kH01VkY8gMQr+CBC1D950EXG7JLaJQA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=KepxzxOdSYKlibc5rEqXOGzBXVMFs1aQ1AWkQvi595DOpbfObOGWdjN1Mc78QnPxf
	 CV6LbtEgYVhqByWeVVFCwzbE+vyfMQUqNunj2/5vGwu1hFYOwZHh43k67r52FshhyS
	 FVwAoFhKIxCB9dYoLpCWOs0dh/il8BKHZAPgpAWboFG+BfaHSEfwyyjhca3erZarrB
	 ymKGZb5iU0F+Vu+ZyEW9p4NUHFUEYDmTEjt79GSDWwVSKJTkub9/jb70BeNbGtQXTJ
	 wM5jHPePD3YVU8y8V3hwuHP6NFTP3rXTC8OrMmO2RuJXFgfiZPWwr92Vs1XIZzi+Bk
	 7Kqrz048g5HMw==
From: Mark Brown <broonie@kernel.org>
To: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Heiko Stuebner <heiko@sntech.de>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 linux-rockchip@lists.infradead.org, phucduc.bui@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260806052136.21034-1-phucduc.bui@gmail.com>
References: <20260806052136.21034-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH 00/14] ASoC: rockchip: Simplify probe error handling
Message-Id: <178663242938.110398.4616104123339333100.b4-ty@b4>
Date: Thu, 13 Aug 2026 15:47:09 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3083; i=broonie@kernel.org;
 h=from:subject:message-id; bh=X+bkHMIykGMfgTnFl5dYB3gFs/d1nAs0ablI5dIyuq4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqfv4dF0ELklDTaytUOl3gquXr3axUlVMYXBwQo
 1zxlqyUExOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCan7+HQAKCRAk1otyXVSH
 0GiuB/4+eK/zn9anwX0PkYIkZrXfGhmYu9bJt/AudK1M4kG6Hscfr/jvlLrncqp0ySlP4PrVWZo
 y19XgIcfarO6vNf9pESDLYcK4TbEopvlwz1AimPqRRjFMUDVapCXMcA2XASw/JgwQ1HEHNB2hKW
 xRQMiNQe4DPLp6npE4yZVxMDChCMHuleA2qEGbioQGc+8dEDyzN0CkIJPa3koXXXMgai0SnIkc+
 lK/1rNPaXlqCdq/oCr0xhi5kVmMQH1lla/liD6ajFrGVQU/Xj3Bz22rRhLfv2Stqed1Y28Tt/bn
 NZhofyWyJK5k3oUKIBtzLsE6J4ZHJy9BNEnSUeWuMxAD2tW1
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

On Thu, 06 Aug 2026 12:21:22 +0700, phucduc.bui@gmail.com wrote:
> ASoC: rockchip: Simplify probe error handling
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> This series simplifies probe error handling across Rockchip ASoC drivers.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[01/14] ASoC: rockchip: rk3288_hdmi_analog: Drop redundant probe error messages
        https://git.kernel.org/broonie/sound/c/931f4a1223e1
[02/14] ASoC: rockchip: rk3288_hdmi_analog: Use dev_err_probe() for error handling
        https://git.kernel.org/broonie/sound/c/06f5854050f5
[03/14] ASoC: rockchip: rockchip_i2s: Use dev_err_probe() for error handling
        https://git.kernel.org/broonie/sound/c/b5e4b1159743
[04/14] ASoC: rockchip: rockchip_i2s: Drop redundant probe error messages
        https://git.kernel.org/broonie/sound/c/c1bf7ae0c87a
[05/14] ASoC: rockchip: rockchip_i2s: Propagate -EPROBE_DEFER from devm_pinctrl_get()
        https://git.kernel.org/broonie/sound/c/be4f82d15235
[06/14] ASoC: rockchip: i2s-tdm: Inline PTR_ERR() in dev_err_probe()
        https://git.kernel.org/broonie/sound/c/334d5ea7582b
[07/14] ASoC: rockchip: i2s-tdm: Drop redundant probe error messages
        https://git.kernel.org/broonie/sound/c/9fea4805ed95
[08/14] ASoC: rockchip: rockchip_max98090: Drop redundant probe error messages
        https://git.kernel.org/broonie/sound/c/de983524dcbe
[09/14] ASoC: rockchip: rockchip_pdm: Drop redundant probe error messages
        https://git.kernel.org/broonie/sound/c/7d3f7eb890f1
[10/14] ASoC: rockchip: rockchip_rt5645: Drop redundant probe error messages
        https://git.kernel.org/broonie/sound/c/b300f1313b00
[11/14] ASoC: rockchip: rockchip_sai: Propagate -EPROBE_DEFER from IRQ lookup
        https://git.kernel.org/broonie/sound/c/c97bdbf862c6
[12/14] ASoC: rockchip: rockchip_sai: Return the original error code
        https://git.kernel.org/broonie/sound/c/7a2229ef7cdb
[13/14] ASoC: rockchip: rockchip_sai: Drop redundant probe error messages
        https://git.kernel.org/broonie/sound/c/26c9632c33f7
[14/14] ASoC: rockchip: spdif: Return the original error code
        https://git.kernel.org/broonie/sound/c/5784ef446847

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


