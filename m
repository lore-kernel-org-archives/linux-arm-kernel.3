Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D57B5CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 15:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0FJ9VV7lLzJBPBx6JDRS77SckdQ+FbpXYPZY1X9X8wU=; b=pQitnoAvbbWGbgw1+dQmVquJhX
	cgkKLj2Ps5gKfDynjP006Y/WGdtU48Bm5ipn7wgLAVhjttgmFfOe5LF8+g7VBW4aDO+oqYWyuP2mi
	SktgcKDfr5NCtK7VBqT4Lefzc1sAQq2TDgfOHOJ1PEWVyewo/1/zPNmxlAXQVeiFJPIYzbitEnplp
	a+2ygutmvWkA5XD1SrI1eKcQ18U1XHIXyu2V4e+M7A2UKTNU7B1Pr19ndxBE6nW3KiN+4hLqau8Dt
	YXzh4UXQzlBBt1GmeSzUuUoyJ8qbUuQjDoQ6UWVhNc3ROxcYoQyJDWaAlWMdHsLWO9aquvFIuapUG
	tUBJxKrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umZpn-0000000HQa9-3JLR;
	Thu, 14 Aug 2025 15:25:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umYn1-0000000HET1-1NMY
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 14 Aug 2025 14:18:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=0FJ9VV7lLzJBPBx6JDRS77SckdQ+FbpXYPZY1X9X8wU=; b=UmApuKuzSP1b3EMwchXAa5jBR1
	pKEAt+c7GkmLOoatDIl5o5gumMpGj5WZSAOez71tP4AZQPcdHFFD8FXWSCVbP7qzlmO4nvQV27U+s
	iOu46uADclH5VvSh2PndlUsWyfxzsn8jm2XO4ubjCtn8Woci33XLN4NeApEaE03eXqzrGAG7yFRmw
	vf1W0yBaEzJn8N5JzQjq9v1YC7aArqilw7cbDZwF2I14gsYrv3ouyMb42WczvCt2il4fUEAWRgVZp
	PtAYSGz3/QgRMUwR8Y4Fd18uDz/sDghyZlTM0znIWXfMNpgJ6dCY+At/oJ900frpwNSlsMkxdC0v4
	zzjqm7rg==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umYmw-0000000GRXB-0un3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 14:18:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9C78945CB3;
	Thu, 14 Aug 2025 14:18:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34B0EC4CEEF;
	Thu, 14 Aug 2025 14:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755181120;
	bh=ezT8h19tbrErhEX74K5EDIS1DVgKzjeCE9jYx/GAjfA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YS/34ryVn84cNOohcF2crew00cdL4+AySZDS67orfKzZ6wPYwxb0VXm+90fsXs7wa
	 ro6h1JrAYglyF4hkd8C9yjlSkSPfRn1axNtKDNEefAsGZsDafSLEPwvrXMQnCWCd6e
	 uIl81Ky+eHTwQU6A4WozPX249myuEg4QaD3WPPN5QArwvUFu9q9Zvn1ebIzmeOLNLl
	 NzKiy0gsJyTXbS02VwxHGQBgbQlwOMnpoqbbRBVp6quESoH0IMmriHX1TGOJoHJiWK
	 +skeBwsrltkLQGXOZ8mbi3QBpUWFYCyzkN/+L9SkF7teg6fjKRSFfhAmIddmCyfD96
	 2uWcuvB3zImWg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 Shimrra Shai <shimrrashai@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250814012652.81424-1-shimrrashai@gmail.com>
References: <20250814012652.81424-1-shimrrashai@gmail.com>
Subject: Re: (subset) [PATCH 0/2] ASoC: es8323: Playback enablement for
 Firefly ITX-3588J and similar hardware
Message-Id: <175518111895.47921.9144261888630473273.b4-ty@kernel.org>
Date: Thu, 14 Aug 2025 15:18:38 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_151842_562488_1C6CD942 
X-CRM114-Status: GOOD (  15.12  )
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

On Wed, 13 Aug 2025 20:26:49 -0500, Shimrra Shai wrote:
> This small pair of patches is needed to enable the audio output to
> speaker using the ES8323 CODEC on boards like the Firefly ITX-3588J
> that use the right-hand DAC mixer to connect the line out jack. I also
> enable associated DAPM power widgets so that the volume can be
> controlled in the ALSA mixer. This seems sufficient to me to produce
> basic audio functionality on this board and any others that might use
> the same features. I tested it with both ear buds and a pair of
> speakers plugged into the green jack on the back of the board.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[2/2] ASoC: es8323: enable DAPM power widgets for playback DAC and output
      commit: 258384d8ce365dddd6c5c15204de8ccd53a7ab0a

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


