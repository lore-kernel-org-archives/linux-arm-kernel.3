Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D80C606EA25
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 11:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=P6yXzUAs;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aAW1KUUe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/jC5d0rS+q4cmxCF0m5PTk+OxcNoBs/3lqvduRzrOxM=; b=P6yXzUAsrBny2j
	X8Fu8ocqadFDR1UaRD2Z4YcZrhLIzrTwMp9A062LbJHnInWCng+iWveMBjUPyMmklf1jLOBrXfpcf
	8abTok1Z2NDmADvnCTUonatdxhIrQky9q5o3qlmmTG6sOIjMQXuKwVjHQQ5sQ99Cqx8JOcN8dYpxs
	+kr1iotTQtAFV67HnQGIzyDPu6ztQ8PYIDeYjrrzhnUylHkq2I7unykxSCgsgcOdTfZrkhPPD0Srf
	XUwGGcdHoxL/wHM40DHTDDt+T87sb6DjVxqX1Pz4LtXjc7OFFSp4mV6OV8/HQkwuM7H6FTOrV8H+V
	g8blI20dPiJWRVf8xYoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvxo-00000008lUQ-24lr;
	Thu, 05 Nov 2026 11:49:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvxn-00000008lTJ-2NbW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 11:49:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AB29E605F4;
	Thu,  5 Nov 2026 11:49:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48AFD1F000C1;
	Thu,  5 Nov 2026 11:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793879342;
	bh=/jC5d0rS+q4cmxCF0m5PTk+OxcNoBs/3lqvduRzrOxM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=aAW1KUUemLZXtLiBscLQMkwARKKI2/aCuLMFxQSgl5oGf4UH7b0ZE5F7dgXXx+uZq
	 i1rn4ANcWOW1sksF9sSPcSWshA9NN69aiXUsdNheSiI2ynrZiP5znuFSwxtnxE5iQp
	 uwvI43SzVYNEwLfkjWnCWPfwnOhFqfI3W+XTr80TSQMuj1sYxnb9F3mCNXjLmOAmlI
	 1CGONkKd5v44c7O0aehmvrpdwY3YHOjbHhxnLq3A1IEH5fHUvwqSjXXFtFYcLMXHFc
	 vIxV65dXJY2lkNDVVKjyyi0YCUB0CI0umuMrVNpWIvnDtgRBuDAH3Ei+bfYsOuvgiK
	 Vtwfu4x51L8Rg==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 3C27B272EB3A;
	Thu, 05 Nov 2026 11:49:00 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Wentao Liang <vulab@iscas.ac.cn>
Cc: linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20261104022815.1484320-1-vulab@iscas.ac.cn>
References: <20261104022815.1484320-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: fsl: imx-sgtl5000: drop codec device reference
 after probe
Message-Id: <179384023780.2186205.14628179165151508431.b4-ty@b4>
Date: Thu, 05 Nov 2026 00:57:17 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1146; i=broonie@kernel.org;
 h=from:subject:message-id; bh=9xMAwbkFcOKEheJ4m/qgkj5cYKA3wwz80aPGGbWSH9Y=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLe5OrMXRK/fmPJnCNHdi4wPSZSwylZPO1fVFHWxOZUh
 jP1lpasHaUsDGJcDLJiiixxWdwv60ter+E7uLANZg4rE8gQBi5OAZjIhkMMf7j9L22TvfX1jODt
 4IVXlAuWOq+TdPVeuG7+5hAV6VKOvWcY/gpvZwzN+Bx3fkrxn5VVkl3zFZ+UOm8+rtk2N/HuUmt
 5CS4A
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 04 Nov 2026 02:28:15 +0000, Wentao Liang wrote:
> ASoC: fsl: imx-sgtl5000: drop codec device reference after probe

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: fsl: imx-sgtl5000: drop codec device reference after probe
      https://git.kernel.org/broonie/sound/c/53865f2d4974

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


