Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA418D3176F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 17:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eVarSUVImq3C17UtuBFKgjsAE8tZo13M6Xt5/flkrHA=; b=JawGmwEP9IwckluGXr5vX8Cccv
	s4T74IxlNkqgYYue/awprQuBVlR9qztOxfks2ISgdas4PeaPV1gUfmk5haxc0CsuK1N1/W7xRx16N
	nlSwZdhwemqqE0BSXnvrncvpTkCfT21SxjzpoPhsnI7MMTrJBiuKB36YvVkp8DgiJeK9BxPxTA3dX
	h8erZgSIVqMZgM73kbaYE7R7VvRu606xpLTD5Pe3BuMj0CM9sR/6dQITEbG9dq+YcQngYlOBsnAle
	VLcCcmRfsIgGT7TB6OdXsAHnymj2SDXCYNHwi+ul0DFeeEvYzuhUYbkso9y12z7YW3Mhmte17ZHnW
	LqtyCyFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Nlc-00000000IJo-0X7C;
	Tue, 05 Nov 2024 17:55:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Njt-00000000IBu-1k55
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 17:53:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3C1A55C4636;
	Tue,  5 Nov 2024 17:52:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 342D2C4CECF;
	Tue,  5 Nov 2024 17:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730829191;
	bh=GBpdf1OVO9BOr56k/DS5sh/foQKQ7xW6cGQgQpR2NCA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Pw5KJOOypZ+1M8BcBE1sks8BopZNvfyjIUSRrCa8l9BsQDa57h+iIrOYogz4Z/R3F
	 BGgMRI3BzVtRJZnrd8EPtO9bkkwfGVHl3pH2Wb9k32RvLss5b4kESmkAPGMFvsHWU7
	 HsfImJ/9oLem4OZommuIE4+MHIC+59xP2TXTed92k01Z0Ns2ew0CGMHx4DACRKU4JJ
	 Rt6gUyszCPAyqEP1rDnwCN2zxwe8JKeNsA5if3fvcBrbsH+KT6vrdO2jglYiHBjqQz
	 2lzzf4V9w7F5Mxn1wsOslkLlsliJgQFtmY7DgHFTgI5KoAAPxXLXe1yuWuZKixE1Wi
	 I40bxMdeGXilg==
From: Mark Brown <broonie@kernel.org>
To: amelie.delaunay@foss.st.com, 
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Olivier Moysan <olivier.moysan@foss.st.com>
Cc: Olivier Moysan <olivier.moysan@st.com>, linux-sound@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20241105140242.527279-1-olivier.moysan@foss.st.com>
References: <20241105140242.527279-1-olivier.moysan@foss.st.com>
Subject: Re: [PATCH 1/1] ASoC: stm32: spdifrx: fix dma channel release in
 stm32_spdifrx_remove
Message-Id: <173082918893.89365.2926884723667800367.b4-ty@kernel.org>
Date: Tue, 05 Nov 2024 17:53:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_095313_553952_0EBF9AF1 
X-CRM114-Status: GOOD (  12.75  )
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

On Tue, 05 Nov 2024 15:02:42 +0100, Olivier Moysan wrote:
> In case of error when requesting ctrl_chan DMA channel, ctrl_chan is not
> null. So the release of the dma channel leads to the following issue:
> [    4.879000] st,stm32-spdifrx 500d0000.audio-controller:
> dma_request_slave_channel error -19
> [    4.888975] Unable to handle kernel NULL pointer dereference
> at virtual address 000000000000003d
> [...]
> [    5.096577] Call trace:
> [    5.099099]  dma_release_channel+0x24/0x100
> [    5.103235]  stm32_spdifrx_remove+0x24/0x60 [snd_soc_stm32_spdifrx]
> [    5.109494]  stm32_spdifrx_probe+0x320/0x4c4 [snd_soc_stm32_spdifrx]
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: stm32: spdifrx: fix dma channel release in stm32_spdifrx_remove
      commit: 9bb4af400c386374ab1047df44c508512c08c31f

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


