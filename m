Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B206C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 18:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wtudna5zSAodN/OgEPlADtyXBWCbThURo2yxyL7blUU=; b=b2Czx+RRSZTD2+2DQUYXQIWLBn
	FHC8dsSppOs8tmTawCBAIFRKvvm31f/77S+ExSdKMh2MOjZSpGb7Tl2NwdSHfK34AfIJyA0+lhFxS
	XdRSuUcvyEcUBRbazuHE5ucQA/5EpXDhsLj5s3pMu8Hgek5HAsjmcxZHmx4gay/Wvl0wstBK+F95r
	zySaSpSZSB5JXAqpR8Izqvkh3TXZzHWLg4/G5T+48uOe6I4dVcuc5qSCT1PUemvJ6P0QHFB/epksN
	dZ0EKlxDKKzRj0No83GtTTTSK8nSxycJUq6oEGfJH49tQLGc/Vv0Bv7c0BezSdnTbMqHrDi3las7m
	ZBItmTvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuFXi-00000003k4c-1P1I;
	Mon, 17 Mar 2025 18:50:30 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuFUQ-00000003jZo-0fDN;
	Mon, 17 Mar 2025 18:47:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DDFC0A48CD0;
	Mon, 17 Mar 2025 18:41:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27C0CC4CEEE;
	Mon, 17 Mar 2025 18:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742237225;
	bh=yMXt4xcTxN/VyZY3CTEhTkaSSfPWNnhgA4XwK0Qdz0o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=pe5pmIowVqnFyhsjicNpxuognAsoaR7yhu2CjQTxJDQhH5rZgSwCkuZKgK0Jn6PzT
	 1bbgkITMyBSDF+HorSBmfYxZ4maeZ82Q7Pxdimav2c5k8i/qdQRZlI7HxNtW/p5ICi
	 r5kEpRmsWP0pCc5BlroEaHkqIvW7Sy8W9HQoHivs/vWrsVNGLlUfeQ1HKnMzmN+FW0
	 HRUefCWsFVNu2rFEtsCviAIgjyXUTY8eW3g3gnWmxAm7mEu/EBy1EmXyom5tmEWrww
	 uiytVOaEYDSHttXMrRS9UU3zL3UUtaAedidPzM3K3j7lOXwmkJPqSvJqSaM59MJNeu
	 +UqQfOdpd3C9g==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Trevor Wu <trevor.wu@mediatek.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Zoran Zhan <zoran.zhan@mediatek.com>
In-Reply-To: <20250306-mt8188-accdet-v3-0-7828e835ff4b@collabora.com>
References: <20250306-mt8188-accdet-v3-0-7828e835ff4b@collabora.com>
Subject: Re: [PATCH v3 0/4] Allow retrieving accessory detection reference
 on MT8188
Message-Id: <174223722189.287878.14772373895585128225.b4-ty@kernel.org>
Date: Mon, 17 Mar 2025 18:47:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-1b0d6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_114706_265891_F8D8DD5A 
X-CRM114-Status: GOOD (  13.57  )
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

On Thu, 06 Mar 2025 16:52:14 -0300, Nícolas F. R. A. Prado wrote:
> This series enables the MT8188-MT6359 sound driver to retrieve the
> MT6359 ACCDET sound component from a mediatek,accdet DT property, which
> allows detecting jack insertion/removal.
> 
> Patch 1 describes the new property in the binding. Patch 2 implements
> the sound component retrieval in the common MTK soundcard driver. Patch
> 4 updates the MT8188-MT6359 sound driver to register the audio jack and
> initialize the ACCDET driver for detection, if the property is present.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: dt-bindings: mediatek,mt8188-mt6359: Add mediatek,accdet
      commit: 3fec903f2cb18805b1ef22a0e310498020c1f15e
[2/4] ASoC: mediatek: common: Handle mediatek,accdet property
      commit: cf536e2622e2b0a60c99e799995b6e9acf539c17
[3/4] ASoC: mediatek: mt6359: Add stub for mt6359_accdet_enable_jack_detect
      commit: 0116a7d84b32537a10d9bea1fd1bfc06577ef527
[4/4] ASoC: mediatek: mt8188-mt6359: Add accdet headset jack detect support
      commit: f35d834d67adbbf121ee4397376d9eac21d99a85

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


