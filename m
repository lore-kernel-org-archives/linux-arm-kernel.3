Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AC0FC02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 17:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rgm4tzwUKVFwXJjmQmXTd1jgTRz3WNxTI+37e9/vAYY=; b=MqnnbH/F7KgZlI/RVQ66B0vPKo
	2zJUoJFla2F4LguTzAA9s+CSsoOrkD1dXGFcYD3UsaKC34QCvYcEp4uEUfbb5XWQ8XUmaiVT8craJ
	28csGvrSf0ttcUZE6adfvR93810rn+IfASew6FhlSLuesMmQksNu7sX89bbkZrRRHba8+EwUYBk7C
	/DlC2d/lPUDwAmaYzJm9xxW4N4kFxC9s5HcCIVeYyMX3vREqMlIvRuKJIgwQ3glUUtedCHgtBSRSn
	RS/9kWbTZhMjsvu8VjRIVbDBXB2Wn3dC2jWmmzUdESULwxT2VT3GP4HYp+5gBkZrbu3ajFDiqmUoJ
	i45AUlGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg5lB-000000070HD-1bIy;
	Thu, 06 Feb 2025 17:33:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg5hk-00000006zW1-43Pw;
	Thu, 06 Feb 2025 17:30:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A22755C6740;
	Thu,  6 Feb 2025 17:29:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B1FBC4CEDF;
	Thu,  6 Feb 2025 17:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738863020;
	bh=+PAq1d83UlU8oLR/YEeDk9SvrGKk3RNvw6lhYjscWBI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=PitP9Zed77UsBd3nKEkR0UAclDy4vwOIAmfNR+jk+dqPCSZF6vw1xnzwr/TxzRZJ9
	 qDXQM3Sy2uS21IDxmqF/hvAex5tsMs3AlKNkDf72xX+1Nj+qMyfBg0ucmNMvgI2vPC
	 cPbwHAPEfdnBXDoTo6gWSHEn2nLpXpg0bJs+D1HCLxq0LfvvHSM5b4emdn//2EgUbb
	 O4MNsVagzyWudHQLRIo890+MDEQWXrKN92n2tQ6GmSRuIF9evVgWh6GvD0NMIL+926
	 NUU2d3Gh9+5jkHxSHtKcko6x50/H354RwJHSL4KdM0c/LYjt9roG5m8VkJDfD8uD9K
	 zj+0Q8Kx9f4sA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Thorsten Blum <thorsten.blum@linux.dev>
Cc: sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20250204153806.3587-2-thorsten.blum@linux.dev>
References: <20250204153806.3587-2-thorsten.blum@linux.dev>
Subject: Re: [PATCH] ASoC: SOF: mediatek: Use str_on_off() helper function
Message-Id: <173886301607.325569.16667965221124695083.b4-ty@kernel.org>
Date: Thu, 06 Feb 2025 17:30:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_093021_057289_2211F037 
X-CRM114-Status: UNSURE (   9.53  )
X-CRM114-Notice: Please train this message.
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

On Tue, 04 Feb 2025 16:38:04 +0100, Thorsten Blum wrote:
> Remove hard-coded strings by using the str_on_off() helper function.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: mediatek: Use str_on_off() helper function
      commit: 3f75771987f32a9f512c8944e70e343f8c6d71c1

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


