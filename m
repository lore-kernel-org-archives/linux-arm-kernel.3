Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC572CD5BC9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 15:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KxLlu3bGboBpssH3q4i9X/9Rcpz/kEUO07K0hG3KAGo=; b=Vqyvz4XMESyrIMkMK6+FrPJEoM
	brZL3X15cOjNy0hiVhVqGXKqglZMAusTiT8Uu8xK7I6xau+EF3Zqvm/CJvLjHcWKP2pIKvVaQYczt
	n5pL6Oo7Dh/QWlG1nOI16kRaBt8PLGy2lI0VOljiwWVaK3ifCfuh88YCuu4us9BesDmsq53130HMY
	wELQOLj/FGJetM4Snak2ceHudP3C/JNaAPIf0O8MjuVhMtJhmbCgrbWTygI+LWwgp3Ydm6tu6dB/2
	RAfXOXuNUU/RD+s4HdA+nMok1XUuWPFixWaJjumc9G2BEmuXybhqWXx61I6o3YsoAOc86Bh8cdB8G
	EVMcKleQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRXNn-0000000HXc7-31Ja;
	Mon, 25 May 2026 15:38:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRXNm-0000000HXbj-0xoR;
	Mon, 25 May 2026 15:38:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AB6D46008A;
	Mon, 25 May 2026 15:38:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C5BD1F000E9;
	Mon, 25 May 2026 15:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779723501;
	bh=KxLlu3bGboBpssH3q4i9X/9Rcpz/kEUO07K0hG3KAGo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=n6Xy8kwWaYqgCrONmhPK9deWc7MFPgyoEIXJHiHbivJ3CBfIdnS4wmIXfRaxhpUEY
	 095UE7eFqlIQUTHJSDEmWV9MCk1BKfRDDHoywaIPdqiNNG9ryVvdSCniUkcmpEs8mj
	 SpycPQUynwe6BvMcq0J4LDxTBmngK+OYW0fb7Ju6VoEfzjqNTyqFv9hIbrXif9sNtY
	 sKRpTXHOR5TFnE2LxlxoD7/1sq1egsHgf8XEN5L+ViQO8x9XSvCwUspiZZvsFqRpWt
	 c8z+Jxkjshb+If2tzIhIJLvIKlICI+27MWZfODJ7aWzxTfCapfmOTMRAc0be/6l5f2
	 reE1To22jUBAw==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 sharq0406@gmail.com, kuninori.morimoto.gx@renesas.com, 
 ckeepax@opensource.cirrus.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20260520155002.145306-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260520155002.145306-1-srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/2] ASoC: codecs: max98090: switch to standard
 set_jack callback
Message-Id: <177971278332.58460.18153221856136100187.b4-ty@b4>
Date: Mon, 25 May 2026 13:39:43 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1634; i=broonie@kernel.org;
 h=from:subject:message-id; bh=HDoLE08+LMsF0VGAE+rCwJWmLkQjgVi2YjS7YWE60Ec=;
 b=kA0DAAoBJNaLcl1Uh9AByyZiAGoUbOqhlLg1wPvZIojtWu3FEb0H1NR9/G08wMPrqySzWZfFW
 okBMwQAAQoAHRYhBK3maKpnVxi1n+Kf6iTWi3JdVIfQBQJqFGzqAAoJECTWi3JdVIfQtSoH/jB1
 B6iErPaE6qYmHbeZUyEALSiPuMZgnX0FbCVNAgZrLEdEVZ6vcy636TPlifiLyVSNPx4OJZ5VjhH
 xwwBDX6NA9U4DJCGD0yRdthITi+97INDChToqvKh/k0o29J44L/UTJAuEDDxqc2JHnuIZONlTA8
 sm+sG8Dx10c60ub2qTsRemJs9JrP+dy2iGY6qbZldrENKwtyhT6yURKI/CQtCcczclW+k9hzKWK
 RLMH71WJGF2Giyoi0oYWUY1iksvajGDsm8fWF+qP3LU9yp90a27CP4be1Ahk+UP58HELw3kqt3d
 dZQqYZfD5npusPHiTSDfATHu66Scp1v7Gc0TUCM=
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

On Wed, 20 May 2026 15:50:00 +0000, Srinivas Kandagatla wrote:
> ASoC: codecs: max98090: switch to standard set_jack callback
> 
> The MAX98090 codec driver currently exposes a custom
> max98090_mic_detect() helper for machine drivers to register a headset
> jack.
> 
> This series converts the driver to use the standard component
> .set_jack callback and updates the mt8173-max98090 machine driver to use
> snd_soc_component_set_jack() instead of the codec-specific helper.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/2] ASoC: mt8173-max98090: use standard callback to set jack
      https://git.kernel.org/broonie/sound/c/bad83abb5c29
[2/2] ASoC: codecs: max98090: use component set_jack callback
      https://git.kernel.org/broonie/sound/c/e2c428c3832e

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


