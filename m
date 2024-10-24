Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A637BD0BB62
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 20:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T6Z8IFqRcVOyldvseLJ3WnSThq+1dXU3Oh0KOrrhlC0=; b=UGP82tRggQz7vZJQDOmQl9LyOR
	601iqCBd5fBUtSc7aqg2HiMSCBk8Ss53a7sc6lCQp+ywEtKFBpVfFTJu2tu6oJ/fKYDqshIn/Z26a
	x+A7Uv4K6C+6iD3uUavrYi8Izr199oPi39fuexXekUzoEzn+QZ3CxAbewp1XNafGTsvOEuufejL+Q
	Lr0iftu4cPCTzQaUlaet77/LrTg4QluB26uI/zEBS/jACKFcccnab7MrZLEsYXOY7kau/gvuFlVnT
	u2e6fXMPmD9nizYDfU0MxzCUttQ+YQx2F3SRYocBttU+2GpfLH3UTTP6dVoh1vsBZZZJHuiNaNXbE
	wBsD2NkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t44Po-00000001j9t-2WRl;
	Thu, 24 Oct 2024 20:26:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t44GK-00000001hvq-203Z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 20:16:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4A2C75C5904;
	Thu, 24 Oct 2024 20:16:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 010B0C4CEC7;
	Thu, 24 Oct 2024 20:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729801011;
	bh=M8Hou7W+/slEq6beBx1BMbstELY0N17vo5D8dtjCwaw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=uVlghJjtlBAM8RBB0TFYRfF2upDQF6o0IDI3jnzZNQn3qsSu62i4WiMSA0gSD/s0l
	 2/up8sX6KJ6JidEdblO8bvf8drryM0sB78IeFAJz+BPvwXHTGYVav67Pzh6O53PSek
	 l/6dbyNegQAks2AHKlKqRjZuOFZ1gVawYJCHGkwtOvbRfnzVAfdCioXOZxExqIpWp3
	 L7bTdeOYqKrSOcZvW0nEDjRrA6l55aSdbJHzP8syxRBhLHd8ArbcAwaRniUA5iNr2s
	 pVtS5q/mruJa6l6x4Fdsl1xWn5nlmCb0Dz+IXh7JIVoy9YUwvavlL68+N96RQsW0Ou
	 CjOayo9B8dv5g==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Chris Morgan <macroalpha82@gmail.com>, 
 Philippe Simons <simons.philippe@gmail.com>, 
 Ryan Walklin <ryan@testtoast.com>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-clk@vger.kernel.org
In-Reply-To: <20241023075917.186835-1-ryan@testtoast.com>
References: <20241023075917.186835-1-ryan@testtoast.com>
Subject: Re: (subset) [PATCH v3 0/7] ASoC: add Allwinner H616 audio codec
 support
Message-Id: <172980100873.554299.14641282051254983661.b4-ty@kernel.org>
Date: Thu, 24 Oct 2024 21:16:48 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_131652_643163_0D877052 
X-CRM114-Status: GOOD (  17.05  )
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

On Wed, 23 Oct 2024 20:56:56 +1300, Ryan Walklin wrote:
> V3 of this patch adding support for the Allwinner H616 (and variant)'s audio codec. Some clarification of comments, particularly regarding the clock driver changes, and a small fix for the device tree binding (apologies I forgot to re-run dt_binding_check on V2). Review comments otherwise addressed and reviews noted.
> 
> Changelog v1..v2:
> - Reordered patches to group ASoC changes
> - Corrected PLL_AUDIO clock dividers to match values from manual and vendor SDK.
> - Remove PLL_AUDIO_4X clock from the device tree binding (not used in the driver).
> - Restrict TX-only DMA changes to the H616.
> - Change the codec name to fit into the 16 char limit.
> - Move the codec (and spdif) blocks in the H616 DTSI to restore address-order.
> - Add board enablement (and power/GPIO changes for RG35XX to support speaker amp).
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[2/7] dt-bindings: allwinner: add H616 sun4i audio codec binding
      commit: 542e19c20506953c03eec57b1cb65355164dfb64
[3/7] ASoC: sun4i-codec: Add support for different DAC FIFOC addresses to quirks
      commit: 5836a9d2ca48bb7473bb10d061c03525d8f4f163
[4/7] ASoC: sun4i-codec: Add playback only flag to quirks
      commit: 9fde21d6c5d1f75c2651442e5aae463545136aad
[5/7] ASoC: sun4i-codec: support allwinner H616 codec
      commit: 9155c321a1d0220a60878f2c99bc79b5a7e34d95

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


