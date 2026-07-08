Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D837C44506
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 12:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CZCFvOFR+D0f5Pbt8AtYWBwNyj+1RPtceMZuCD+FMqU=; b=g528Ju9YxCR9Y404rc7drTXoTm
	kuc9xniApKM71Qei/0HhS1LnKBKuPS6JdIxwX8nHiJqUGwDBqphTvRJmdB/jUJoieuC6h7cI33yO1
	LVhbVHzb+RFEDFPwFaTiPYcFJRXxJ5PVndFgw8xj8nc81p3ct8EeJLQ2mf1Ixpp/zNjHDKAD7YiCR
	r5Q5g5fr8h9FpnQDQaS942zP5jqIwf+dAAJ+YgmX4M9K5vVy5IuCXXtCT1UUcH0dRfq1qyXccdHXO
	E75FmvSD5nep5U5VpKriE+3x/1LWS9ekEeY57i9e6VoC2Gu98yDtE4TG/+dlpr+cNbqycF44K8T+d
	1pI7pQUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whnil-00000002Nqd-0eSx;
	Thu, 09 Jul 2026 12:19:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whnik-00000002NqB-1ZPD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 12:19:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2671540D77;
	Thu,  9 Jul 2026 12:19:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93BB61F000E9;
	Thu,  9 Jul 2026 12:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783599554;
	bh=CZCFvOFR+D0f5Pbt8AtYWBwNyj+1RPtceMZuCD+FMqU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=P8CD5IG1QerO/rMxsjVGMH8VVGwWc7LbqHxR/JTqs2O8cmCHIh8pv4tmYsjza7UYF
	 nijiUr90kSMEHTrf6pZnLquyRq1F4fLXnqosDwaWyF7Avhg66ACT5ZTYAJ6Qvdpk4C
	 yS1Zk03/NS3OL39YRuRk/uec/u6e+qnF7j+/DEkyD2mOHi9FWku62UUs1d7cpa7h8Z
	 S6lTuWa0Zv5OYjEBD44hkE8dGkobo3xnDSyNeM5rCPFuQ5l2TfiGmJ5j+rHIVzqBBR
	 Jd+o04fNovG/MaAOZB29N74Xwz9CTSpPD7Iqr25zBpkdAAw15fsJ3dt6IBxgaVUOb0
	 4RsG+rqCt7vMg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de, 
 chancel.liu@oss.nxp.com
Cc: kernel@pengutronix.de, festevam@gmail.com, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260707065725.312450-1-chancel.liu@oss.nxp.com>
References: <20260707065725.312450-1-chancel.liu@oss.nxp.com>
Subject: Re: (subset) [PATCH 0/6] Add audio support on i.MX91 9x9 QSB
Message-Id: <178353053174.26140.5507506345849775715.b4-ty@b4>
Date: Wed, 08 Jul 2026 18:08:51 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1664; i=broonie@kernel.org;
 h=from:subject:message-id; bh=MplgETsFM0VexgxoMrMIq6KgDR0KfukYSXZ79Q+Fz88=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqT5G+bOeWXFq6laYD7zprq60YsaMtJmfMGd1gB
 n8CI8Eks86JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCak+RvgAKCRAk1otyXVSH
 0LrbB/9HQlTk58Ks5hTLUaXIH8HSzFf+mA6d/gBSskg+ClnJe2s5pNC4SrdFEP5Jf+aJvH8z5mP
 Zy3JnXF/I8pX/zrA8A/hSci8qGld7sG8JVgvuYwO7CqIlj+L45XxiltorhsYwf1mSoTuUZ1YCox
 mGtbtWyOr1BQQ7WHAfWCBHFZUko7QfTGAC8044YPGlNTc3FoPymNxNiGQKQuYoYq6dW4my4DVmZ
 Q8brkK+WUyZhQBUIwd3un7aZrK3sg4zz8LFWprPBr3eMMEuU7/J3j1mNYWWDTSn9NrG40Dqg8tu
 H5H2NWCNMnS4we0AI9lEpJdCVJHC8SqOuDYBYywzyP2locLf
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

On Tue, 07 Jul 2026 15:57:19 +0900, chancel.liu@oss.nxp.com wrote:
> Add audio support on i.MX91 9x9 QSB
> 
> From: Chancel Liu <chancel.liu@nxp.com>
> 
> The board routes audio related signals through on-board muxes controlled
> by a GPIO expander. Add the mux states required by SAI1 playback and PDM
> capture. Add support for WM8524 and PDM microphone sound cards in DT.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/6] ASoC: dt-bindings: wlf,wm8524: Add audio-graph port support
      https://git.kernel.org/broonie/sound/c/7ccad5668957
[2/6] ASoC: dt-bindings: fsl,micfil: Add audio-graph port support
      https://git.kernel.org/broonie/sound/c/28017bf7f762
[3/6] ASoC: dt-bindings: dmic-codec: Add audio-graph port support
      https://git.kernel.org/broonie/sound/c/cf3bd20c43f7

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


