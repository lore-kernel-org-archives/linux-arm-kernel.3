Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16B94C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 15:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rex62BfC53cDEqX4g228G0Xt/mWhr0GZ6YGKgSGCPQM=; b=lIDX2OuRROUkJzG8FGs6lMq/5p
	Gl+Ep4PP8EjbABE22RFOO/5ASFVpAeQ0RPHhrSav+gndZRTpKVFhIEd1BKPRl+PG9Xtx+KcNsYh2L
	djxEo7mFoOlDmLJU+US/7eVU4NaUvlenlPI1TRV26cp/MwEjaeZU4+gdJ7qYgVks6Ju+Sul7F2/of
	x6YNC7mNZKMbMGPB4Qv4E0vcjsVqts3lTX5cfE2uSKQ0YiR/3JF7P55oKzzHMtW8qHiXL/XGameCv
	DTwRJqAAfm1+RrZjEgYWwwbxOCbk4qD0Oq5YlAz+QV3Cx2fthRvR/GxRUU54AjHdbRQc6ZKYVI0D8
	TP1cjBOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt7Mr-0000000EddF-2LWR;
	Fri, 14 Mar 2025 15:54:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt7LA-0000000EdKi-2Nsf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 15:52:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D4DCB5C365B;
	Fri, 14 Mar 2025 15:50:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A853DC4CEEF;
	Fri, 14 Mar 2025 15:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741967571;
	bh=NX2Md3U+bOQqXplBc113iIeIOo0t7MlCS1wk9cRyyQk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=NPhKdtTm7NG1HkUBT/Jq2uCczGCk9Wmqy6J8QpukK834sVNxdFMogsT2Kz/1XvsxX
	 vfwd8AlClj7x8WL/PgnLGupjmPZJGy82k91wsITI+doXcODNdSeswtkkZEbzzzAV5t
	 3GDEeIdWP7fivabiK1LudxjvHhgUEfC+Xw1ZJt5Z4V5SG96gfzmLHNb13qIBI1SDQC
	 p6iBbIrSohhG+XkBo2FA+PPrw3NKq2quBIR42d2JGampBA+Iytk2SLfs18+PXF4szX
	 ktsXmp17cb4LT3j1s+t2THn6I2v8nOAQ+O4WzwLLR0FHrtGeCK1OvLLD1FcBZD5emC
	 CCRS192mPvFKA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Ryan Walklin <ryan@testtoast.com>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
 Chris Morgan <macromorgan@hotmail.com>, Rob Herring <robh@kernel.org>, 
 Philippe Simons <simons.philippe@gmail.com>
In-Reply-To: <20250214220247.10810-1-ryan@testtoast.com>
References: <20250214220247.10810-1-ryan@testtoast.com>
Subject: Re: (subset) [PATCH v3 0/5] ASoC: sun4i-codec: add headphone
 dectection for Anbernic RG35XX devices
Message-Id: <174196756840.19728.17664266192768404946.b4-ty@kernel.org>
Date: Fri, 14 Mar 2025 15:52:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_085252_723573_33FDE91B 
X-CRM114-Status: GOOD (  14.76  )
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

On Sat, 15 Feb 2025 11:02:22 +1300, Ryan Walklin wrote:
> V3 of this patch adding headphone jack detection support to the Anbernic RGnnXX series of handhelds. V3 corrects my misunderstanding of derivation of ALSA UCM file paths, and adds recieved Reviewed-by and Tested-by tags. Thanks to those that have reviewed and fed back on previous versions.
> 
> Original message below:
> 
> This series adds the required device tree bindings to describe GPIOs for jack detection in the sun4i-codec driver, adds support for jack detection to the codec machine driver, and describes the hardware configuration in the RG35XX DTS. The existing speaker amplifier GPIO pin can then be used in concert with jack detection to enable userspace sound servers (via an ALSA UCM configuration) to disable the speaker route when headphones are connected.
> 
> Thanks to Chris Morgan for his assistance putting this series together.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: dt-bindings: sun4i-a10-codec: add hp-det-gpios
      commit: 7bda89a2489fb012c4c63f3338827ad1f35c8880
[2/5] ASoC: sun4i-codec: correct dapm widgets and controls for h616
      commit: ae5f76d4044d1580849316c49290678605e0889d
[3/5] ASoC: sun4i-codec: support hp-det-gpios property
      commit: a149377c033afe6557c50892ebbfc0e8b7e2e253
[5/5] ASoC: sun4i-codec: add h616 card long_name
      commit: d389719fb4ece17ea28c0cf908066815d3ab0e25

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


