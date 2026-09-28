Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 929AACA5FAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 11:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SF264KM1xpFJ+Dj32T5xIH7ajqAgZoHjgLRWkmxYRhc=; b=GqePxCWYkxmA37FiSmT99Fv+DC
	Sp37+jAvXa/OTEOaFdLp1f7FZ8VFokOaQMUPZYu8ue96ob43BnMBNHMXnjgNLVI0eqlPpzR0Xu/nq
	Ch4ZBgHSRI47IEx+txw1JGRu500FmQDBEGkNqDwES6DCClDW3mw3fYMe/sqxHcaOT52kiM9f7/cua
	F85Bq89HsYF36rz96G90vi8rSFcSJL67OM3zYx01wuSy4IaLQev/P47bUZj/KTo//PXGKR3Twsr8r
	c5fn/E/GuXpaR5XF8XXdzeAEAxOHC2CeNGj4BjVHrBpnrrJBI+9ybvZMFOFcZixEH1lNe7Yc7P25K
	WvxK7D0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBW0G-00000003P4N-0PVP;
	Tue, 29 Sep 2026 11:28:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBW0E-00000003P4C-1eBY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 11:28:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A496460008;
	Tue, 29 Sep 2026 11:28:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 662A91F000FF;
	Tue, 29 Sep 2026 11:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790681285;
	bh=SF264KM1xpFJ+Dj32T5xIH7ajqAgZoHjgLRWkmxYRhc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=TaCp7VF+ghdsIp8cbipLsnUrlK+ZaDq8YiaIQrIBXgYISNADu3VqQXzhrtGHmJvKc
	 gqNRx7/AWc6hUzZat0ZHRcHXBQAfQLCHhZbYQ+TBItz/hnJAROL1dtRJWoCMj5VSLn
	 PGHAOZzUpzR07eJbxG0rE4LtGrC8McPTuXCymW7/UylISSKk6FS84ojbF2UZAZPbGL
	 4frOBfmowYCl1oOF+um/befHzNptb9WK/2o21k5ktEX+ie3OuNlQLnDAW2s11Bgmm4
	 W4a3rmWYqGWgQGv2XUrE4EZz/9i7k9IjtmyPAuPnbLE+8R4IVVtHl7l90NFS4Bjo11
	 BD1u50XOXB1cg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de, 
 kernel@pengutronix.de, festevam@gmail.com, shawnguo@kernel.org, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, 
 nicoleotsuka@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linuxppc-dev@lists.ozlabs.org, shengjiu.wang@oss.nxp.com
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <20260928061149.1844121-1-shengjiu.wang@oss.nxp.com>
References: <20260928061149.1844121-1-shengjiu.wang@oss.nxp.com>
Subject: Re: [PATCH v6 0/5] ASoC: fsl_asrc/fsl_easrc: expose
 per-pair/context DAIs and fix DMA race
Message-Id: <179062040693.139547.920625432189790512.b4-ty@b4>
Date: Mon, 28 Sep 2026 19:33:26 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1969; i=broonie@kernel.org;
 h=from:subject:message-id; bh=08vNLIXx98Yrj1IvpKudnUztu+PDLXSe1G9EqUOPitU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqu6C+CJwhLDtBYODaVPjpkxT4PasDIRnK4w0LF
 qkt5qH1jyCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCarugvgAKCRAk1otyXVSH
 0N3fB/48ng38Yw1sNvkBArrecRxtJTVGTny+M/NNSSBoHgs1Q2g59SsOpMpPi5/8WH9Zzm0ODkZ
 QFs9Cj7cSSPA7i4+F2GgfrDJ/QpeEiGOrKo8q8TAXf3WTh91WusidXAocvUW0sah9doz5UrTlCA
 RcaR6XQK2KuuOVVvFtVdw7QmCnx8NEjSQk6yL/AohbCjc+vhSMZgEBWF1ko4w3H6RciZlvVEYQv
 Nkezy980RanQ9pcSvy8hBDTeACiphO1eJQz6ACFyl1btGd9HO6/lhDqtmpumJYS5fwFlGJ6qR6K
 qiLD6kKgTbzYrLA4jePspvzHJRO+5aXY1oRKVpogY5rxv7Km
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

On Mon, 28 Sep 2026 14:11:44 +0800, shengjiu.wang@oss.nxp.com wrote:
> ASoC: fsl_asrc/fsl_easrc: expose per-pair/context DAIs and fix DMA race
> 
> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> 
> This series extends the i.MX ASRC and EASRC drivers to expose one DAI
> per hardware conversion pair/context, allowing multiple independent
> conversion paths to be active simultaneously.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/5] ASoC: dt-bindings: fsl,imx-asrc: update port binding to support multiple paths
      https://git.kernel.org/broonie/sound/c/7845324094fc
[2/5] ASoC: dt-bindings: fsl,easrc: add ports binding for multiple conversion paths
      https://git.kernel.org/broonie/sound/c/33598785b31c
[3/5] ASoC: fsl_asrc/fsl_easrc: move DMA params into pair/context struct
      https://git.kernel.org/broonie/sound/c/76915128bde2
[4/5] ASoC: fsl_asrc: expose individual DAIs per conversion path
      https://git.kernel.org/broonie/sound/c/6aef9cb5c797
[5/5] ASoC: fsl_easrc: expose individual DAIs per conversion path
      https://git.kernel.org/broonie/sound/c/788e893edb6a

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


