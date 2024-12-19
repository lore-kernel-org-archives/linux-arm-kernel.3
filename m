Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0417E7718C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 16:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rxn0pHchtckpi8ghVd31LjcmAQ7HtgPzbCQ5Ylz2kkM=; b=tuySqstG0cLkci2IW08nbzTGY+
	FZiBZIAc9jNtBZI+cf9BIHWIP9pfWOrtx/VQ84pAZEj2JrzZGGG6iK55R3T7wpV1bXsrlh6FLUueH
	y+LnjSJEpcE+hHnEQyYxeGYao1MG55RO4Ni4IKRGkbc5Qwk563LAES7rco9PkZIoYwtH18jWdpblT
	L9MFzrr7Ur+GeQpa3HoC9LDlnvDalRkTLZKRcvErq5ZoHLR//Ohxf1H8+jT7DykmweItAMOPiPzYP
	qKx+Ig+GIRrPtq3r4Pt4K5YLRIGNcTKXmKuVNAC37745KUVJmOBwN0QO6U9kuNIgpCMEbqvXkp4Fl
	HjEUBqRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOJG5-00000002KGX-2boN;
	Thu, 19 Dec 2024 16:20:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOJEz-00000002K2W-0yuX;
	Thu, 19 Dec 2024 16:19:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A938C5C41A4;
	Thu, 19 Dec 2024 16:18:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E2BCC4CECE;
	Thu, 19 Dec 2024 16:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734625148;
	bh=kJNcHPMbjFb6Aho2NUJcW41JRPmk0uJDYJqJ/w8xypI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=HMZ/uyNqe6wHTRjC2efrEjjesE6xxPGpiC7rPuiVPpjDuHcTuQ7jPXSi3x7M8Bk1r
	 ZgJGLxwo6bDwT5dC+vjSsmQM0Pz8LNFlw6aD7CdKeoZaaqYHQCfzKl6PGvZ5Bz73Ri
	 5Kx/zGdIHYDdxqaMM5Oxkax32cqJ//JRivyPTK8obX9X8s7nnF9Xh3MFhuzDM2XqBt
	 zGLWOrmOl4wV337ixhmzKIvlCEAoZBi4ofrM+/6ca+ImEJIp0LqffmH0WHSyJbGmGe
	 PrHhb7l1lbNehhM04u+WuwS83D6JE85gAohbKOPBOYIzIAX7iLgMX13WidMjgwcRLq
	 nd3nnk3/g3nfQ==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-sound@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 treapking@chromium.org, yuanhsinte@chromium.org
In-Reply-To: <20241219105303.548437-1-wenst@chromium.org>
References: <20241219105303.548437-1-wenst@chromium.org>
Subject: Re: [PATCH] ASoC: mediatek: disable buffer pre-allocation
Message-Id: <173462514608.189443.5339636221433842657.b4-ty@kernel.org>
Date: Thu, 19 Dec 2024 16:19:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_081909_321588_1A576F8C 
X-CRM114-Status: GOOD (  15.69  )
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

On Thu, 19 Dec 2024 18:53:02 +0800, Chen-Yu Tsai wrote:
> On Chromebooks based on Mediatek MT8195 or MT8188, the audio frontend
> (AFE) is limited to accessing a very small window (1 MiB) of memory,
> which is described as a reserved memory region in the device tree.
> 
> On these two platforms, the maximum buffer size is given as 512 KiB.
> The MediaTek common code uses the same value for preallocations. This
> means that only the first two PCM substreams get preallocations, and
> then the whole space is exhausted, barring any other substreams from
> working. Since the substreams used are not always the first two, this
> means audio won't work correctly.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: disable buffer pre-allocation
      commit: 32c9c06adb5b157ef259233775a063a43746d699

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


