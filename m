Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A92CCA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 17:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OKnpTmEVMtNXocWw+l66Q3zN1z1F7NIXesotsKstlss=; b=SDvlmeqchNdRiImZ9yd2JAP9/C
	/Dm08ou3PnYUxDBCAqVRhspBKp/y0S5PaIU5M4TNJH5ExbNB1TwdDbihQiEwVyGgyvpLfiks3clSA
	3rxONkr8PjRTQX8OgcNiJgnGLdsC3iDgPylwr6vxzRjRzhCylB4kPOnqA+nD/J4fsg+9+OikKNrv3
	Xe378TJIRE1Yx0qE6PKwTcstnuGD5ah3N2c8bWdFC22XYBhLpPeEE0I/EBNK8eCrxBEnovDFQMT32
	DRx0F0Ji8J2ftTp/hT2kKI11T1LgmPEtxMWHuKBq3PaHG7kfP0shBIpFcaac+YpNmvyTXInuyTlH9
	Sd3gx5eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulspy-0000000BZIY-2jeF;
	Tue, 12 Aug 2025 17:31:02 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulmoT-0000000AYnC-2h6i
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 11:05:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 04C3DA56A9C;
	Tue, 12 Aug 2025 11:05:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 443CFC4CEF4;
	Tue, 12 Aug 2025 11:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754996704;
	bh=+sjD5DBMwZ01KvsXUAV5SJn+sj8/ohUTnEVYWG/4NUM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=qidwNdk5LLHuh+RkonL10l5tIMuz1EL1iLZsnU6Y4QMR9aGNbmkxH7776FpFuodKp
	 lFELFbWkzrAVpLNGIBxOEgpd5P1I4Oe3lhnyQpWxcckU3Lda8qEusVUL241OWOoVSd
	 R8vI01bQF4eogEX9fkP2VVWKoSZsjvE8oFWxQaZkySPQM7dYCXtMLPZ+AdRq2Z0Vd+
	 UdD3wEDzneXPBzyQV/EEIrdC5FzbbqrjEz9u63C49Q/uE1nub1OMh5Jsz6IN9I8Fl/
	 1ZdChx9KQyQRCsVIpqIGpF0Ma9ajCc60c+ltAWQ3YlwMXN73/vRK8I87rwaBwbKbuQ
	 LkM2p84dzj6wg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Waqar Hameed <waqar.hameed@axis.com>
Cc: kernel@axis.com, sound-open-firmware@alsa-project.org, 
 linux-sound@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <pndpldam7tf.a.out@axis.com>
References: <pndpldam7tf.a.out@axis.com>
Subject: Re: [PATCH v2] ASoC: SOF: imx: Remove error print for
 devm_add_action_or_reset()
Message-Id: <175499670102.16031.12835450413879680065.b4-ty@kernel.org>
Date: Tue, 12 Aug 2025 12:05:01 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_040505_765085_DA9BA6AC 
X-CRM114-Status: GOOD (  14.08  )
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

On Tue, 05 Aug 2025 11:33:32 +0200, Waqar Hameed wrote:
> When `devm_add_action_or_reset()` fails, it is due to a failed memory
> allocation and will thus return `-ENOMEM`. `dev_err_probe()` doesn't do
> anything when error is `-ENOMEM`. Therefore, remove the useless call to
> `dev_err_probe()` when `devm_add_action_or_reset()` fails, and just
> return the value instead.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: imx: Remove error print for devm_add_action_or_reset()
      commit: 9d6a51651faa577e5d2be9d67915b7621c5c589a

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


