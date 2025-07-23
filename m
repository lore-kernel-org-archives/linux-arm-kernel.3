Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D27C9C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 16:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rpdG+fWUJx/MEWPRBR/iNMmM4vspf5PtvBWSw8B+o08=; b=ou6yQfp3XMIVqU27HCjU/DYlze
	2XY97apj+S3hdkZguhgkr56dKRxadp0kQXVOht6ZRG3mCGCO50+AQU78Q15JL+Za4Rjw1d6djvRnC
	lXNCtFU5I/esbZxlpJuazzCyjfwaE8nyg0jDEPvq2gusNJqH4czAaJKP4PdLdBOQsX1tNF2IcOhiT
	uMHo9Bp31prvxJSe4beh3JVkjqgwwoWCC0eujlmJQoQXPjLDehwYfnrxeCKee9dkd4s2MrmFeEXUZ
	rpKvkOR+27x08FyLjPixhcTAfWCHHfuJRVTz6e7rDmlJQULITa+Z1ywGCcXqfG7Dkq0r6zfawOqy+
	oRY8ph8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uecgc-00000005XBs-1EdG;
	Wed, 23 Jul 2025 16:51:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueceA-00000005Wtj-1Cqa;
	Wed, 23 Jul 2025 16:48:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 927F85C49E6;
	Wed, 23 Jul 2025 16:48:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19083C4CEF1;
	Wed, 23 Jul 2025 16:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753289329;
	bh=ByZ5PYiT1ej+cqdbA286xENhWOW5ZOiRkfXl/Z6pp5k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=qkCKKoJpiV3pjA5YQVloF7LV8OaRYMBeLagUW5Y/gW+dNmwN7EB6t4bO2ioLkhezt
	 LfGuaeU0iqmjIEf8AmdYMCk9HoGYNrste+KO/xv2ve4KWHgG+YvExLWH23XaTU8TVV
	 DGasaE7zWgz2EjIQ4msU54PJ2zQLsZApWmALQVuHN/3w4l46KCHvL4muZGfhTgEeJs
	 TkGcyvwQcFsDUC7gf/UOpViD4YbZzI3OxB2PQjkZlSbqj0I4uAn2vcgxDoEGif5zwk
	 40jX+6vApy/i3EeA3AknaV6RqV/p6InircNGYtQyXW9pY7k+PPVgyaNv75af6NUga7
	 ABF6eng/66Adw==
From: Mark Brown <broonie@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
In-Reply-To: <20250722092542.32754-1-johan@kernel.org>
References: <20250722092542.32754-1-johan@kernel.org>
Subject: Re: [PATCH] ASoC: mediatek: common: fix device and OF node leak
Message-Id: <175328932684.84720.16626909941095412727.b4-ty@kernel.org>
Date: Wed, 23 Jul 2025 17:48:46 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_094850_367529_FE762C56 
X-CRM114-Status: GOOD (  11.01  )
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

On Tue, 22 Jul 2025 11:25:42 +0200, Johan Hovold wrote:
> Make sure to drop the references to the accdet OF node and platform
> device taken by of_parse_phandle() and of_find_device_by_node() after
> looking up the sound component during probe.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: common: fix device and OF node leak
      commit: 696e123aa36bf0bc72bda98df96dd8f379a6e854

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


