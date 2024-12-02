Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36403D7833E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 18:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aG5V9bPMmr3yvJlAwQdUJ7OtjiRklUtEDk3XNW725Oo=; b=h63DBaTEA7WtoA1WJIUn4xPOfj
	sTu0FUnHx8KYTqomq/guA14k7c/CfUOiOEsi5nQV3Wkc/dvtEUD+VHCGr33/Q2E8wQOKjEDnSjYeC
	ccbse3RiRxxBVqG2hvg/NpAHaqaSlzE2yLsoHuTVfe7eqDxT2uRARyEBRsOgZtXydhg7qquaK/hZk
	tSCVeg823JArim1EpzDUvUHWBLAHemO0TwX/IORUt1c9mlOGHPFExWkzkfKbab6CFXfNQEQEnIdEJ
	MZRSmwRAlgYLuuQ9cMSxAkuaFOMf/N+lUv1mzN78lrDIzap8gFJxZGLJ81FrEKqrcUS6VNMMJn8Di
	I9p4jr1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIAic-000000076OZ-25Nq;
	Mon, 02 Dec 2024 18:00:22 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIAgj-0000000764I-0UOz;
	Mon, 02 Dec 2024 17:58:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E6869A411CF;
	Mon,  2 Dec 2024 17:56:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 156DBC4CED1;
	Mon,  2 Dec 2024 17:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733162304;
	bh=RmCnNjhUcPfj4ZV7oqO8MNtJx7x0NboJ5/JOdBfbFVU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=UpQWIfe0QTWKVzbmsHY8AvwXql88P2Uo1M7HBqZjVBV3/oGu6U4ZDflItE396DMVk
	 tHR62hLdfEvCfdSSLl5COy639nYpCxcjAph2rqtvqFC0ZzCxtL7VccaSeFZsTD/Guf
	 EkhW2E9yv8C1OjWmibIpd0VHi6J+yqNjYxQGztQdQ4oiV9k+bDcDqNOW1KzjHerhXf
	 vIxjD1j6kQphHn8fqqEiwJmHX3Ln8c8iZShprFNOK9YZWHCrHSZT/9I2RApjZWngEB
	 azt/+2/HXBqeng28g9WBKGL1r86FA82ahT9EEqJBoBVpcI3dUrlyRan6kxvcDCELNB
	 8SHJ853O14eKw==
From: Mark Brown <broonie@kernel.org>
To: Nicolas Belin <nbelin@baylibre.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20241031102725.2447711-1-andriy.shevchenko@linux.intel.com>
References: <20241031102725.2447711-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/1] ASoc: mediatek: mt8365: Don't use "proxy"
 headers
Message-Id: <173316230181.189181.7179970847637835365.b4-ty@kernel.org>
Date: Mon, 02 Dec 2024 17:58:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_095825_220962_C4CA6E69 
X-CRM114-Status: UNSURE (   9.91  )
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

On Thu, 31 Oct 2024 12:27:25 +0200, Andy Shevchenko wrote:
> Update header inclusions to follow IWYU (Include What You Use)
> principle.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoc: mediatek: mt8365: Don't use "proxy" headers
      commit: 509544d1b6dbffe7bc1849593ff217f965ec0419

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


