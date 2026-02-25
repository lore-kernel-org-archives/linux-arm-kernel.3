Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E57BEFD213
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 19:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HPNu4AV62fFVWdqIyv+UIPraP/Rr/vWIHvsL/yDjPnw=; b=VdcM7m3g85lHwo9i9uCeOAXp/G
	R6b7PNtEDlrcvJtyJFpO5O/8PbpOa79bZJxMlLNbNoN9SeBFacT1H5nkElw5mOho1EZ7tBTITaSJM
	U/rKcRK/9rOQmPjgrOZjhLrJdlPm+P+Pu2WtRyrGAlNi4jpcARO0tAeo/8nzmMUgM77QhkntSwnNz
	jAumK2NbrMXAAZ27J4E6Y/09Bu1Cjp+mW9fv3Yc6A0AjdI7z2zmVgq/RJoE2vbDvwWjL26TtU6VXT
	WfhL+FpkUdx7jcAMSOfUGTP6tV6GJdUYGM2Nq3vLV/0gX6x9zwoDtIjlXtf6LHo/xQz5yC6bKhIqJ
	WQ6Th8WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvKEX-00000004ljc-2yHJ;
	Wed, 25 Feb 2026 19:07:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvKET-00000004lid-45kL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 19:07:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B63844438C;
	Wed, 25 Feb 2026 19:07:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9527C2BC87;
	Wed, 25 Feb 2026 19:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772046456;
	bh=hSiieK6gw9zhLfbluo0StCtR2+HseDZumG3VzdZ9QbM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ZEtFRoAo4oBPAzYCOLiT0/TNL8/2/puRvEflRaFGh4v/KtesRLapwNI0L893w7erB
	 osV4riLBUHl2O9Er+SvS/VXX5N/zfsBOSS5jurMNC7pKrPmC3ZeZbbJRBI6u24xin3
	 JzFCkpxHaOhEptevS2DHJKcvElbDArVPxQHlBfACaTuQxcT/xHMpuY8eu4STKiI+Kh
	 iYPoK93WEBNfFgGuJJy1XH2POwDxQPbjLDaKiEKY2AbefKwfdgKe1jhbiXTsJvvFbW
	 i1WjvguwLO9V7VQooRyxN0E2tnID42yBMQiq8e1dIrwkDzTbGpjn0pedGFq5jrCpxw
	 RLjr/QbjoJHLg==
From: Mark Brown <broonie@kernel.org>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Alain Volmat <alain.volmat@foss.st.com>
Cc: linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Dan Carpenter <dan.carpenter@linaro.org>
In-Reply-To: <20260212-spi-stm32-fix-dma-rx-release-v1-1-53a37c31626b@foss.st.com>
References: <20260212-spi-stm32-fix-dma-rx-release-v1-1-53a37c31626b@foss.st.com>
Subject: Re: [PATCH] spi: stm32: fix rx DMA request error handling
Message-Id: <177204645457.169139.2112213155210381085.b4-ty@kernel.org>
Date: Wed, 25 Feb 2026 19:07:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_110738_061180_06D4EBA0 
X-CRM114-Status: GOOD (  11.27  )
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

On Thu, 12 Feb 2026 12:49:10 +0100, Alain Volmat wrote:
> Avoid trying to release the RX DMA channel when an error occurs
> during RX dma_request_chan() call. Instead, jump directly to
> release the TX channel, if applicable.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: stm32: fix rx DMA request error handling
      commit: 837f6691d5f39ea6453e4489dded40fb17755c60

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


