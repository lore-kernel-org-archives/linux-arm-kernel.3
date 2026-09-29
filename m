Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8FB8CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 11:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=202PceNA4mgm+8gsK0Krd58dlYSUB37NGsnHorEd2N8=; b=amz7++ooEUk4yRRP2YixfppWMj
	8/8ptzheNt+tr/MoOti/Z6nsggCoMlcYiBZ8KlwdiwEwr2VRQEoFmsW4fmt4wpi+nikuhcA/kvVI/
	Z9FG0a/4ZlVS9aJN02R04mFUYl6wTw8i7SBYxcGkhl9xU1mlRhnkIj7J7lCqXDZe4m3RPZxn5rQ4x
	w7bj/byJ9LUsHdRf0yqE8coTRK3fUMnLVNK5ZFs07poO+T+GBqMqxgXnxEe8yBm0JrZXywUUT/54F
	YrxuyU46eoiSU2B++mMt6Ftgefie9yFDVOBQ5eSM996ojlTQI1AfY+CSVP/pJNzL/cVJGyPvRIP3j
	ZRdmRKoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBW2R-00000003PfO-2SbF;
	Tue, 29 Sep 2026 11:30:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBW2Q-00000003Pf1-0lgV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 11:30:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 650CE60008;
	Tue, 29 Sep 2026 11:30:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B0741F000FF;
	Tue, 29 Sep 2026 11:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790681421;
	bh=202PceNA4mgm+8gsK0Krd58dlYSUB37NGsnHorEd2N8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=hItW585slob3QBS6P5xzCMG0vw8GN3aNzq2Z9nwKqB70HAFmlvYeJoHa1y7vBgRqo
	 OLtNP5J/MRh83pTwAtZ4oMw4/zd5Gi03Wq7eiu5vo9GRhmWlLx72irxw5RkiOCoZXp
	 bo1Td7MUryU94GRk+v2UHvSUJzru2IZafFaepdF/VGpf/tSzhFO5RNJ9IfmlWWVwCo
	 NR+qLbPqjj1QGzm7uMYFGAbYftl0YakmkfWN0C5Q6t4OQOsUL731uaAmGNkqR6aas0
	 3ULbHCvTT1gCCNoffSHe6LTG9JPF6iurs4u8yPdb14IgCPA3wSXmGCSQXnIwvSI12H
	 gEeZJLf4JNVYQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de, 
 kernel@pengutronix.de, festevam@gmail.com, shawnguo@kernel.org, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, 
 nicoleotsuka@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linuxppc-dev@lists.ozlabs.org, shengjiu.wang@oss.nxp.com
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, 
 Chancel Liu <chancel.liu@gmail.com>
In-Reply-To: <20260928061727.1844167-1-shengjiu.wang@oss.nxp.com>
References: <20260928061727.1844167-1-shengjiu.wang@oss.nxp.com>
Subject: Re: [PATCH v6 4/5] ASoC: fsl_asrc: expose individual DAIs per
 conversion path
Message-Id: <179068141537.159801.4072628732064323719.b4-ty@b4>
Date: Tue, 29 Sep 2026 12:30:15 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
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

On Mon, 28 Sep 2026 14:17:27 +0800, shengjiu.wang@oss.nxp.com wrote:
> The i.MX ASRC hardware supports three independent conversion pairs
> (A, B, C). The driver previously registered a single DAI with generic
> stream names "ASRC-Playback" and "ASRC-Capture", which prevents
> multiple independent conversion paths from being used simultaneously.
> 
> Replace the single fsl_asrc_dai instance with an array of three DAI
> drivers to allow up to three independent conversion paths to be active
> at the same time:
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[4/5] ASoC: fsl_asrc: expose individual DAIs per conversion path
      https://git.kernel.org/broonie/sound/c/6aef9cb5c797

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


