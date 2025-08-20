Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D4CACA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 01:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CCrCunTdU8xEFp07Ey9PdiNzt/IieIkKwVuDc+HiN88=; b=qtgC+2jAyBFxrHEywpt8+DYUgW
	8mO4AMzMDXS8i6B+2ZyetGEhuu9IDWZT6RsADTgQJQ+hBE/S4zYRO9a1NvojznZDNVzLiY45us2mr
	eKv+4z/RjkR0BwE9PhYIWTIAvoiXQB5IqgOK5ucog9Wb6lTTGcSy+QXH/VZeNNmlc3fVOY46KZHUp
	q/SBJH4kCYZkYcVgu6u9PFi/stcT5fOjcVG+136v2+jggClfkAxHvI1Pf5cAefDdSg84+MMC2X6VL
	YzG1OPLXXlFlkTlmUPM/jBeWpQf6SoVhNTxcDkNfE3DCChj83CQWrZ1VEu+2raPNFUBR0v1NdyXvH
	A6OILVhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uou6u-0000000FS66-0Dbu;
	Thu, 21 Aug 2025 01:29:00 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uor7l-0000000F4Ux-0Q8N
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 22:17:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4F474A57880;
	Wed, 20 Aug 2025 22:17:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F05CC4CEE7;
	Wed, 20 Aug 2025 22:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755728260;
	bh=eDu8QR5kIr07udxsRmoFGBACAqMZM7dZomdO2wR2NFw=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=deFp5pNHdK9Cn8YK/W/UKn93sLyXcRafl7AIdHn4ca4HS+VyBIBvZhfkU3SqZkqOO
	 Pd+zHaWlLPUw9NZEkK4FY+bWmjAHkgnjdA5JAvuXVx1pH5myfGRuY0j0skW6VlEXxI
	 jxb/FIxaydITafislJLf9s9gY+BR4oKz8S2VhPZV0/4uuYIy34UFhnOYig6d7eXaZH
	 7J92rop1Ic+bftYa4Dk3KrEIO30AfYuVx3el0WAoMB189W8Ie5xcPZTEvKfjUpOXnj
	 MKTiK92pD2q/dfi1duF3KTjvCWSK8t3AJKSMHSwWvL76SzEIOE/fiyKLJ47YDlXWFL
	 KansHdGD6Jxog==
From: Mark Brown <broonie@kernel.org>
To: Nick Li <nick.li@foursemi.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Andrew Davis <afd@ti.com>, Chen Ni <nichen@iscas.ac.cn>, 
 Linus Walleij <linus.walleij@linaro.org>, Al Viro <viro@zeniv.linux.org.uk>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Qianfeng Rong <rongqianfeng@vivo.com>
In-Reply-To: <20250820123423.470486-1-rongqianfeng@vivo.com>
References: <20250820123423.470486-1-rongqianfeng@vivo.com>
Subject: Re: [PATCH 0/3] ASoC: Use kcalloc() instead of kzalloc()
Message-Id: <175572825608.300376.7595587079585456413.b4-ty@kernel.org>
Date: Wed, 20 Aug 2025 23:17:36 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_151741_216669_231A9A05 
X-CRM114-Status: GOOD (  12.81  )
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

On Wed, 20 Aug 2025 20:34:17 +0800, Qianfeng Rong wrote:
> Replace devm_kzalloc() with devm_kcalloc() in sound/soc.  As noted in the
> kernel documentation [1], open-coded multiplication in allocator arguments
> is discouraged because it can lead to integer overflow.
> 
> Using devm_kcalloc() provides built-in overflow protection, making the
> memory allocation safer when calculating the allocation size compared
> to explicit multiplication.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: codecs: Use kcalloc() instead of kzalloc()
      commit: 45441b933cdfb7a018674049f269d7a1bc1688df
[2/3] ASoC: fsl: Use kcalloc() instead of kzalloc()
      commit: 3b6f4bd6cda2797b0d999a129376c112d41604f4
[3/3] ASoC: test-component: Use kcalloc() instead of kzalloc()
      commit: 96bcb34df55f7fee99795127c796315950c94fed

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


