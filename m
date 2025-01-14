Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 408B9E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 16:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XHeWJpmEoFSMvBnZYnATRl3sJr818XQmu3TVK1mf2HQ=; b=4KWGEZfCRAYOX99jmglXpOXzKx
	+bmqtbXgcU+PW7Ik+NU0yNCxovVQfgx1jG+SNyiLfiSjqvSKFme1BzEhoczKcuoABsIF6g+ZhLcR+
	SfxGxM+I1tf+tTWI3ymngvQA8r+IQvO7OeZmJyzS4P9ZuYE6UUsujHMXGLVqDhz41sTSko9TpWUFN
	UCOLOrtM1lrM1GCSH5s+rzTWF+93tHKGUs1CIPYj7gchl445xvbWwFvFo5rfyCSRKoBzeoG8HbwEw
	XBCUfZbMOYZdoVN8VzhsGKQOkDpUqNW+qEvl1AtfqGYTRFhOaMESUm2L6n3c+ccb4fa2grog1pRMt
	Cs3a8j+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXjvZ-000000093KN-44nX;
	Tue, 14 Jan 2025 16:38:05 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXjt9-000000092oq-3U0u
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 16:35:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F40ADA41889;
	Tue, 14 Jan 2025 16:33:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFE78C4CEDD;
	Tue, 14 Jan 2025 16:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736872535;
	bh=Elen7iUmj/EPR3RMtRSgFS7j/YgmhA9JWL4WxMVNBM8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Rkat0leYsLAj5X6N28+LDl2UqlEzxJRcN9aWFzt6cDS/MmmYPLJXUQjUP+UQSXitK
	 WKUZB2sW4EK2OvSyMpxRwMlRjF9PsWkX0ut0jOuQuqrBqQSeCSi3FUSXByOIUnepwR
	 FOS/85CRD8c4yESOa5xQBVrWAZv7/7D7Avi8MaJkIJG3aSlvn80Y52Wn1Ydk33lCtj
	 guY9CwiOfe+I0yhCfh59C8/eiX1b5fKx5nyP+6gHwa6uoOcQtnpU4p6q+VuWga+qBf
	 eOcpX//sI9TZEcIKGrZuHf7YgKlG+idTxKBpv7a7jNvSWXuEOSm4vs7rGwbIwCUVm9
	 IS6F6caqkMeug==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Bence_Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
In-Reply-To: <20250114095909.798559-1-csokas.bence@prolan.hu>
References: <20250114095909.798559-1-csokas.bence@prolan.hu>
Subject: Re: [PATCH v2] ASoC: sun4i-codec: Use new devm clk and reset APIs
Message-Id: <173687253259.61795.6623030930207706042.b4-ty@kernel.org>
Date: Tue, 14 Jan 2025 16:35:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-1b0d6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_083535_929472_C3686B7D 
X-CRM114-Status: GOOD (  12.09  )
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

On Tue, 14 Jan 2025 10:59:07 +0100, Bence Csókás wrote:
> Clean up error handling by using the new devm_
> clock and reset functions. This should make it
> easier to add new code, as we can eliminate the
> "goto ladder" in probe().
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: sun4i-codec: Use new devm clk and reset APIs
      commit: 65880d32e1d7eb1ef03253c454fcd8f9d41aaa09

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


