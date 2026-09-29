Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D94F9CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 11:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2COO99V3tWZkY2vKSP/RcAXFdKtCl9Xe902JMrRqT08=; b=AZQJDkdMe6AUyRpUdy1BQ0Jtpv
	Sm8YdoANWS8pfWU2SgekFAMOaeGBeRq01iI/bZkXSkqDlgzKo296HEagnWZtWGA6sc1c9wyd5q7mD
	tlPjoDMb78QhcTA2Y/fsCdCY7uNyp5z41DE7bfgH97LWMtNW7VhiT79CVG6rgX88FnRX9ofiVFnME
	fHuumwz2Qkkz2WDGBObiVm4qPLcV7Z88enrFbmAspekqVW6U+GjmRRatHkauaHzq6btw4DVdfaZe0
	63nJyDdqCX2dl4W/+zlT1q1CbhyVe9psIUljxpM2l9e1lP7DT0gUMNgtfpGw2EbyrBQw3YtJ89WSl
	m2CnZnpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBW2e-00000003Pio-3PHo;
	Tue, 29 Sep 2026 11:30:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBW2U-00000003PgG-28ag
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 11:30:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0C86943E9E;
	Tue, 29 Sep 2026 11:30:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 923971F00893;
	Tue, 29 Sep 2026 11:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790681425;
	bh=2COO99V3tWZkY2vKSP/RcAXFdKtCl9Xe902JMrRqT08=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=YhIScCCD2hrldStzzqLVcyZE5j66LQO/qOfz4sFArIpQ2PaLnC5+1+qAN7m54zyB/
	 SG2CxllzCp8opF3hCLOn6KCFj96YcUsRkUlqI4cUSQsfmEzSs4K62HgSck/Eb8HXEW
	 wM1ucBZoYMRH/fPM0icbvi1Gk6zp6oXT3/gvFG+OKOabKJI8AggI4JrV+yYpqsJzpq
	 CoC9LA9YZ0TsWHlXpkoaFOgDKUje/X8QcWk+N+cctaO8xPf8vf9g3CflreSPsDzJDa
	 Eq5Nv71xnMnY2XqkEHwOURk6ysX7vtPuTJrEKfjJYO634tKTV1/EnTQO0skRm0Fdpw
	 EHGG4uYFM7N0A==
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
 Chancel Liu <chancel.liu@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>
In-Reply-To: <20260928061756.1844185-1-shengjiu.wang@oss.nxp.com>
References: <20260928061756.1844185-1-shengjiu.wang@oss.nxp.com>
Subject: Re: [PATCH v6 5/5] ASoC: fsl_easrc: expose individual DAIs per
 conversion path
Message-Id: <179068142132.159801.7683706041383677671.b4-ty@b4>
Date: Tue, 29 Sep 2026 12:30:21 +0100
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

On Mon, 28 Sep 2026 14:17:56 +0800, shengjiu.wang@oss.nxp.com wrote:
> The i.MX EASRC hardware supports four independent conversion contexts
> (A, B, C, D). The driver previously registered a single DAI with generic
> stream names "ASRC-Playback" and "ASRC-Capture", which prevents
> multiple independent conversion paths from being used simultaneously.
> 
> Replace the single fsl_easrc_dai instance with an array of four DAI
> drivers to allow up to four independent conversion paths to be active
> at the same time:
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[5/5] ASoC: fsl_easrc: expose individual DAIs per conversion path
      https://git.kernel.org/broonie/sound/c/788e893edb6a

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


