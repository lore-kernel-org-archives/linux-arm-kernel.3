Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08882CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 21:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Fj6M1q9KQ1Ru4BAuLDTfX9zC7BgQcWSax5mSaV4yDg=; b=MXEQOs75zfOJzQCNmG4CDZeD7I
	RaGq/JyGpUEbMhr/Qtk3AD1q4qLMWbDSUZG+wyFi+Te7gknpNl3RJn+7VaamFmCTGdIKxrDD/r7rx
	q7Uy1IlnPqnbHOU5aDLMvby/VGe9A2Ua8/tN3mFZMiaiIB86KrS1JsQg7v/+xmiFbnE8IgOWsLS06
	aLsuyirm9ybo5AONwxIPr6mdoPJsm8qhK8j17ruwQzX7RBhunpD7u5ZINjiX9isJ58RzwsjpEsWiz
	4r2GSIEGzwmAl1OFmACMebZg3j2buh4DL94MlMO3GlMwFg9/ZKLTyCou48Ixq9B/R5pZ6aHflG9Iu
	jTH8eNgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uziJd-000000042rl-2iSh;
	Fri, 19 Sep 2025 21:06:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uziJb-000000042rP-197c
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 21:06:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E0E6643737;
	Fri, 19 Sep 2025 21:06:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A28DC4CEF0;
	Fri, 19 Sep 2025 21:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758316006;
	bh=AZyVB8V6Ey50Gr7OmuBq23KPrawUMGKWsAlF4V2ssKg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=CNWybv6KN/koR1Nk2/3ZqLBy+tEj6tOo+bUae3egY6K9HPQl/cTEvhkqos2R/MFe9
	 jxE8tivDGfYIIYSsruQfYXZpe4QCs36Jyrt2BTgN+zitvlAwoGkQGk1WQb0VoHlMrx
	 08Q1dqAMhu4oYjnO0UCN/8NLwRyCf7POV1xIIZWHngcWuXFZfiXYGH9cpOG8TPPtOW
	 qJTSbegUxcJntN7pMAXrKi7T+6t4xUN/bUSIdoqp8/y55v7EIzumSUdge+WB2duZCq
	 J7C0JfYC1/kZV5/+bbuD+BfvjB6VmMF26BVEK1Z0wXzdn3jUPCQldIaH4JsluWf+4a
	 Svxybdp9x09HQ==
From: Mark Brown <broonie@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>, 
 Qiang Zhao <qiang.zhao@nxp.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, 
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
 Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
In-Reply-To: <cover.1758209158.git.christophe.leroy@csgroup.eu>
References: <cover.1758209158.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH RESEND v3 0/4] ASoC: fsl: fsl_qmc_audio: Reduce amount
 of interrupts
Message-Id: <175831600403.228965.1508351336751078255.b4-ty@kernel.org>
Date: Fri, 19 Sep 2025 22:06:44 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-56183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_140647_340690_20013AE1 
X-CRM114-Status: GOOD (  14.70  )
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

On Thu, 18 Sep 2025 17:34:07 +0200, Christophe Leroy wrote:
> This is a RESEND of v3 sent one month ago, see:
> https://lore.kernel.org/all/cover.1754993232.git.christophe.leroy@csgroup.eu/
> 
> This series reduces significantly the amount of interrupts on
> fsl_qmc_audio device.
> 
> Patches 1 and 2 are preparatory patches.
> Patch 3 is the main change
> Patch 4 is a cleanup which is enabled by previous patch
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] soc: fsl: qmc: Only set completion interrupt when needed
      commit: c2a60426e94a56e5329f6c2681c251281f63ab24
[2/4] ASoc: fsl: fsl_qmc_audio: Ensure audio channels are ordered in TDM bus
      commit: fb418fe26d28378700bddc16f5fa3362dda86d1b
[3/4] ASoC: fsl: fsl_qmc_audio: Only request completion on last channel
      commit: 4c5f8c25561f36407cb137d4c350651820068148
[4/4] ASoc: fsl: fsl_qmc_audio: Drop struct qmc_dai_chan
      commit: 2c618f361ae6b9da7fafafc289051728ef4c6ea3

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


