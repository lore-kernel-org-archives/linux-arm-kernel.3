Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21C0CC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 21:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pqhmSE2X/5Lf6maaZmtUIVXjvqU4jt4Au1Lyim5DIq0=; b=GjImfuMBuDMMy4ATZK06lbyg2J
	AtX9z7Zlg2/yLZ2ywIZJoc5hucWxI4ah5o9Wa+bkvK+fLRjJjhLVLuuS1W9ClVsJeEITGnDTnhiew
	fcwoadneDYXAMKy5GAfh0Q+XE/21kkq0kWS+e7X2gs+NaTOPZEfPkoirqPBU/wxlxMyomdYneACtf
	hMmgmIvhcLub3akNjSS+vAZLxJi1qT4KCsU6NhUSs6NQ1j4meH02XR9qBPa8GSeLJls77po26/D1V
	9s5QxJQPQGD6LgnT+jBEeIFSbWJAkcjhgHX1Q/qv98LcPDKxzN3omJ1vOoE1bgMrIo2q5IWDXKphq
	hrXHSekw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf3E5-00000008SUv-0Zow;
	Thu, 24 Jul 2025 21:11:41 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf3Be-00000008SGA-1iDo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 21:09:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 93794A539A4;
	Thu, 24 Jul 2025 21:09:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5043C4CEED;
	Thu, 24 Jul 2025 21:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753391349;
	bh=9hBLthfeLJohmBKsdKVC7/N8g1CIumC4Qo8te0kkv2Q=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=amJyI82YFSXU59uf+xcB/1nflwqoq8fm8g0pbd8MAfhxMdpFCXg6C9Owt45GID8Z9
	 O6qkegnIzv2rzXQISHEExXuRyYMbHpZJdlhYCQlEN0ysPQ9hj711/COZcSZhFzaa8D
	 smZpp6unNhchBAbQt0+kNeQ0ueesDKOjKgQUqsIycVVT1+2qoITqLMOGapk+pscQJX
	 H/Ui85egm+n9Bn3lS9hCQoSF3HcMWT1i8r5aM6gHCy/XHNr9bZvHb4hE6uCGUIc7Zw
	 jbs+izz4PMj4FFDH3MT15/09icj4HhsmAnuTxUSm5sL+OC9uD9g3DYfy7VEC2gZByu
	 4LLhfrHzZeB0A==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 shawnguo@kernel.org, linux-kernel@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-sound@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Chancel Liu <chancel.liu@nxp.com>
In-Reply-To: <20250619062413.3946142-1-chancel.liu@nxp.com>
References: <20250619062413.3946142-1-chancel.liu@nxp.com>
Subject: Re: [PATCH] ASoC: imx-card: Add WM8524 support
Message-Id: <175339134540.153218.11280213676101043795.b4-ty@kernel.org>
Date: Thu, 24 Jul 2025 22:09:05 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_140910_518172_CDA9FBE6 
X-CRM114-Status: GOOD (  10.61  )
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

On Thu, 19 Jun 2025 15:24:13 +0900, Chancel Liu wrote:
> WM8524 is a stereo DAC. Add support for this codec in imx-card ASoC
> machine driver.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: imx-card: Add WM8524 support
      commit: 2260bc6ea8bd57aec92cbda770de9cc95232f64d

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


