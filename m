Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84095C79F99
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 17:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0EQhqCbrqwzwwWKEroV5fCssCI+1bbt2OCRkahyZW/s=; b=fKrvHq7tGxE8lqwbb3HQIkwH5L
	DPqsBbgmoUFWWTYe9/rly+zqMuu50odnXRW1ytPoQ0ThEmagxH4Rqx/xtPM9ivS+NM5ffXHkH7Pwy
	/FwAii+9BmPPAC2NcCOH81NDCS/6peSdC3fVNWfIVmMOyM7geEDjhJ4VDJWh/H7NRL4UKLrOHkm/7
	o+oTJJVwjPkpWCPpO+WVMWyGTV9oKGNCwNIo6zcCM8hp7Bkx4CLJAbUJs+earyB+446NRfiwsBBdK
	lACk+JTewAeLILXEB7TZHNeEHxNpvEOgSSvv/Og6VYrWJV/OrJmPOpkz9fUbReIjPN7q0rXfOheoG
	LVqdJk8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zc6-00000009p3T-1beS;
	Tue, 08 Sep 2026 17:28:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zc4-00000009p24-1dGo;
	Tue, 08 Sep 2026 17:28:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3957841880;
	Tue,  8 Sep 2026 17:28:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E27B1F00A3A;
	Tue,  8 Sep 2026 17:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788888483;
	bh=0EQhqCbrqwzwwWKEroV5fCssCI+1bbt2OCRkahyZW/s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=DLkoMscuF03DiQJB8lCqCtMGAeV3vv2NEAna4f2iHH/j9eReKaml+h7pLpaTfn+2R
	 LUjES668wLWU9PgXc6TjSKI8XwXHFnWa07fJXdcTXIBsC12DL674ajnQIBpwtltn7X
	 tfpCvZqC3gqmY47Ings9HwPUEX0ZJQW5Nvh85pF4gQtJTFqVmHD8YjfyBsr+zd7sLX
	 rCP/gQQeLHXx+1M5pRmJ/05lHa/Q4qnShobypYZgIlgRwKLUPgv6vmYlW6Is3DMhDV
	 Jj4hnh8imw2uY3hRpypYmkX//gS5f5oftody7hS/y/faOQrqk9JUqtmHHwIrExuzqX
	 UyOPiSjJGvZYg==
From: Mark Brown <broonie@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>, phucduc.bui@gmail.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Cezary Rojewski <cezary.rojewski@intel.com>, 
 Jiaxin Yu <jiaxin.yu@mediatek.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260903051150.178057-1-phucduc.bui@gmail.com>
References: <20260903051150.178057-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH v4 0/8] ASoC: mediatek: mt8186: Fix clock error
 handling
Message-Id: <178887689148.78527.9216488124284671038.b4-ty@b4>
Date: Tue, 08 Sep 2026 15:14:51 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2159; i=broonie@kernel.org;
 h=from:subject:message-id; bh=lEUgOH/O9TJ8aaaKwHIpkEDMFvYaZ3as10UkVzac/3A=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqoEWeQes/jCku3Iq4D3H5LKd6gl8xKA3GdAEe/
 XlZjShb5niJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaqBFngAKCRAk1otyXVSH
 0CkuB/wOoqeXC9FOIyndZtWhz5Qj4zD7zwwM/7nTG52Om90sRRJGh0Wubs8FAtPV2zv5lA5NiBf
 ofcjtN7pp35fsEmexC5PGYZ0NRHNY5eQR1rJE4aaTZVWiwLUrpdtiZNebxjeKCOF73goNfZnxTe
 7xjdm2dalX1Cs0HEVDjbaHoyw7YaO0vAch3jJ+H5J0AXrcVN9vL55Oo09BdKS+D9+zJhf0IhVlD
 HVIRpt7Lc7VMYorRse3fo9+MxGYB8PdrTvRpIW15wEJlREkn0kXLgguf9kq1lGWfXw94gk/gpK8
 /Fe0kdw6jJBQN1oFT5vlFg+xEEhWpvcsvXCtQ5PvhoW+GpbT
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

On Thu, 03 Sep 2026 12:11:42 +0700, phucduc.bui@gmail.com wrote:
> ASoC: mediatek: mt8186: Fix clock error handling
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> This series fixes several error handling issues in the mt8186 ASoC driver.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/8] ASoC: mediatek: mt8186: Fix APLL mux setting error handling
      https://git.kernel.org/broonie/sound/c/5ee5987fadf6
[2/8] ASoC: mediatek: mt8186: Fix clock handling in mux disable path
      https://git.kernel.org/broonie/sound/c/d70109f5510b
[3/8] ASoC: mediatek: mt8186: Fix AFE clock error handling
      https://git.kernel.org/broonie/sound/c/eb72060a1966
[4/8] ASoC: mediatek: mt8186: Fix APLL enable error handling
      https://git.kernel.org/broonie/sound/c/cb552c6b9abe
[5/8] ASoC: mediatek: mt8186: Fix MCK error handling
      https://git.kernel.org/broonie/sound/c/996469c1092e
[6/8] ASoC: mediatek: mt8186: Fix gpio rollback on adda dl/ul partial failure
      https://git.kernel.org/broonie/sound/c/d87989ec1c2a
[7/8] ASoC: mediatek: mt8186: Handle regcache sync failure
      https://git.kernel.org/broonie/sound/c/0830625cacf9
[8/8] ASoC: mediatek: mt8186: Drop redundant probe error messages
      https://git.kernel.org/broonie/sound/c/5ca0b1c5e32a

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


