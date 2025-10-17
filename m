Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A58EFCCD19A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 11:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nRRNv+cJkgFC4hKUKiV/sk9rxbfRS9Vd9jDnN1ZG9rw=; b=Wqf0jRikUHNN7/7K2VLTJWtUd1
	2hYc5mP6e8/z8/fGMIBYY2sy+nnCuKOKB6Z2C27XCwbYnHcqAPBw3W693LQ24gVan6+f50UNjE6cL
	jKBJoUX6erbHzCTzsY1A1sNTQxLPFezJxLp32cPYHBE79WrM/eSYMeGa2unngkKGIUmkyJWINtapZ
	cxUsKPdDVevwOXnMjZHAsq+1VB4L5iMnRw6W3jAqNL6PT/Xdrwdpy5KcPkx8tJEnZdMARuhCHj6mx
	DEcLJs2NcJ3xmp+v1pGTYKrSvMKmEuUUqgezidYpAfu4wToi6MlyaKXYEnvzTB+87IOL9uJ9GJG9U
	J15iFhRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9iZR-00000007fnw-3z0Y;
	Fri, 17 Oct 2025 11:24:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9iZQ-00000007fnn-1uWm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 11:24:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DC3F8642EF;
	Fri, 17 Oct 2025 11:24:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A8EEC4CEE7;
	Fri, 17 Oct 2025 11:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760700267;
	bh=uizEfJyKmrp+Hym2bNGCOmbLlAj0EhRNyc4xPm5CS58=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=n3IHctU1fkY35YgudySB6oRO6gocv/D0Mi/hoXDibrlZO7IkVHFaTW1Gq0kEWWamv
	 1LOcbGIizWRtdWQfIMWHdHK7gMKGluLvGqrBiUX1JhTHW4c3m+IGWtTTiWb+Mo8vsY
	 gKkc3R3CiT2DEMTtW2EUS1U7WvKhv4a0FIFKF+9gamazzi3EidR9nyzbXPXzXTDZ5w
	 fSIYGs8NhCySeyWpRscA7rjnEbjVtolR+NC+Dj3s2k7YvdhVUnnpKIc7jaqI1gx4Yo
	 SyZUDzSVTcXL6WKiithTUKNsBu1pYfHHIVfeQJqn8sjFhmuEPAsRqK+9YSNRlvd3rN
	 hJ+YHg33nhKKQ==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, 
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-amarula@amarulasolutions.com, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Michael Trimarchi <michael@amarulasolutions.com>, 
 Fabio Estevam <festevam@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Liam Girdwood <lgirdwood@gmail.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Takashi Iwai <tiwai@suse.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org
In-Reply-To: <20250924130749.3012071-1-dario.binacchi@amarulasolutions.com>
References: <20250924130749.3012071-1-dario.binacchi@amarulasolutions.com>
Subject: Re: (subset) [RESEND PATCH 1/3] ASoC: mxs-saif: support usage with
 simple-audio-card
Message-Id: <176070026206.36020.13915370894346909307.b4-ty@kernel.org>
Date: Fri, 17 Oct 2025 12:24:22 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-2a268
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

On Wed, 24 Sep 2025 15:07:44 +0200, Dario Binacchi wrote:
> Add support for enabling MCLK output when using the simple-audio-card
> driver. In the sound/soc/mxs/mxs-sgtl5000.c use case, that driver
> handles MCLK enable/disable by calling mxs_saif_get_mclk() and
> mxs_saif_put_mclk() at probe/remove. This does not happen when the
> simple-audio-card driver is used. Extend the mxs-saif driver to enable
> MCLK output in that scenario.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: mxs-saif: support usage with simple-audio-card
      commit: 1e570e77392f43a3cdab2849d1f81535f8a033e2

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


