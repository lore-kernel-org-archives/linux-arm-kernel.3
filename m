Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1769FC98326
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 00:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HfYlT1mXmN7hZV9gF/hiwyqoHbDfenk2feT8KXoCIOc=; b=bSgJAehW/JU5Wv98JhbqHPfCa2
	ceAMTCfuLG4nhpjrA5yopLv/29Q/LRfT5U7jmAkaC56X5Tehjgy6fDeE15KwZK2Zb3ZT9Dlxubu4Z
	l5ORoOIM+bRtaIUqLXgQDir0XiM5ixYemsP6XaIFOK4cmBu+T7/PX1aVfjYtbim1pMZ5VvyfqZc4U
	jZE+5DnYqq+JCkzSUka8NAvYPY7/9UZ4RHQhq0TDG8Ep3AggAsdvsHXPajGOS08wJaZxX6N5MMz++
	creRy5h3QuIts2h9A7cTxkSh3bRJMO3faIONGIuRCr2pzgdT+vtjIncsT55SY9fdthKPm4kg+QF1w
	CFDGkzIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAGUq-0000000Ekht-40DP;
	Sat, 26 Sep 2026 00:42:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAGUp-0000000EkhO-1hfs;
	Sat, 26 Sep 2026 00:42:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BC73641A7C;
	Sat, 26 Sep 2026 00:42:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 255641F000FF;
	Sat, 26 Sep 2026 00:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790383350;
	bh=HfYlT1mXmN7hZV9gF/hiwyqoHbDfenk2feT8KXoCIOc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=GWht8zLr8pm0fNjuXdaTPKwv4p2QKOFi9sFNST4AXZrbl/SdxHr3VsEH/xXrwSZ5S
	 qfn2i3Cbm02X3U6PIXZZfTf1k7xSG34K5rFu8g7UtbQPzc6EOj1XS7kW++FrgZf42H
	 b+Iwh02EJzaBfW6zdVnqsXyf8KfdutClS3YQtCAG+n/xqx/hAjZNZJeOyQDiQNyzPK
	 KARd5Sw1YsctcrTPza+NuCOFjf1ZqDQZjs0bFrlTheKGNdVbHhS3/GL0sTOZBn8N1p
	 Vbo9/CHNmWUBGmncr75MRxHGwgjMPmJrrQwB8I7v1lllniNNb1lhTbX+G8TJYWfQby
	 tYwLAn5+L901g==
From: Mark Brown <broonie@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>, phucduc.bui@gmail.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Cezary Rojewski <cezary.rojewski@intel.com>, 
 Shunli Wang <shunli.wang@mediatek.com>, cassiogabrielcontato@gmail.com, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260903045203.175337-1-phucduc.bui@gmail.com>
References: <20260903045203.175337-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH v4 0/5] ASoC: mediatek: mt8183: Fix clock error
 handling
Message-Id: <179035803658.204944.2406140635443720922.b4-ty@b4>
Date: Fri, 25 Sep 2026 18:40:36 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1823; i=broonie@kernel.org;
 h=from:subject:message-id; bh=/LjzesrlcWTd/CH1GZp69Xv1z4ylzcuCNdP97aIc2cM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqtxTxwHnRigYvRJG9MsCfkFpvB7CaB2BWhVxFZ
 b4t+HC/OSiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCarcU8QAKCRAk1otyXVSH
 0PWlB/9UKaCd/H5Vsx6p24FjHIzrX3tyxefaspzQHADIMwMo6sNkiYM1n6MBPiFhyar1M5r21VR
 CaFm/5JJuYYyeWpQWapONkoxdrTkh+DxVLE8kCiNxRFYabj3N/JO4hFlhMWIOrYVFq0DsQLBODP
 5ZYO5Lr0bR5KcmVHTpR0dPZ7+0Q5qfWd+N4MnQaVmXDHX0pLQvuf8BTTun8IrvX7MOiQxca/yJE
 cn1Lx6Edqtw2vdUr4yR+6bgBWr0YEG00+UcwFvgnPTyj+PiupFYq3vJ0sDzK2nvjoRVHKdN83kx
 6dtKyc9FCXXn8VlgNjhse8mmak4CWcbcdE3DThw3unMXmIGD
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

On Thu, 03 Sep 2026 11:51:58 +0700, phucduc.bui@gmail.com wrote:
> ASoC: mediatek: mt8183: Fix clock error handling
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> This series fixes and cleans up clock error handling in the MT8183 ASoC
> driver.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/5] ASoC: mediatek: mt8183: Fix wrong clock cleanup on clk_set_parent() failure
      https://git.kernel.org/broonie/sound/c/7f05596bd404
[2/5] ASoC: mediatek: mt8183: Fix clock handling in mux disable path
      https://git.kernel.org/broonie/sound/c/4a0f9566ae0c
[3/5] ASoC: mediatek: mt8183: Fix APLL enable error handling
      https://git.kernel.org/broonie/sound/c/30cf48383006
[4/5] ASoC: mediatek: mt8183: Use dev_err_probe() for error handling
      https://git.kernel.org/broonie/sound/c/21cc0c50d395
[5/5] ASoC: mediatek: mt8183: Drop redundant probe error messages
      https://git.kernel.org/broonie/sound/c/f7bcb8c94ccb

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


