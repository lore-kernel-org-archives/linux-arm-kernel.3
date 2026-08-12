Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE14EC5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 11:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/nKOXb11thqF/gUJpn3dQgk/iwZeR/0ericzfrjsocw=; b=bv4FyT2GYmvXmk7AkSjp7ZFblm
	/f+UdRg+QSIMy/uo/sOy0g8+o4fK6Eaa5ca2iQhnwUDQd6mguE26sVbyLNQc3jb5ctH4BxinpxAXs
	jYUHHyyU7HPe++MS/OEoTW3meRP+Mkss5VNp6wxbaFQtp4z25CSb2TMj1+5F8WJrlQJsHD5iuxwXJ
	2RS09TVKv1GQZDXqffhZnnu7BZ4RmJaqYC30tvNxO9PWJqDGD8EeYAx0gC5pm+EtwxbRW0jUdVB1l
	MR1wf60YP2H2Gn7gy6I2HPTGjgxOlWsITvuTKPa8LAFKF4dqVC/3sD8tPbPBlbywUx22eXPsOcluF
	kOBF/p6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuTkp-00000000Zab-2vrJ;
	Thu, 13 Aug 2026 11:37:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuTkp-00000000ZaV-0yky
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 11:37:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AB463600AD;
	Thu, 13 Aug 2026 11:37:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB8D51F000E9;
	Thu, 13 Aug 2026 11:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786621066;
	bh=/nKOXb11thqF/gUJpn3dQgk/iwZeR/0ericzfrjsocw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=R2jRinvu3znaYhc7gsGUjrAk+/k1y7lEEo6yMZfJUv5FBklyHKZTn0CE3vwE84bmn
	 UcGc20yjyCDrlOLnq2qTisaVcQXV4Q+ndQrMFtqXT3/mDp3e+EY/5xKIQvdn+EsrG4
	 5qJ2VsicDHdG7YdXqxTiVwlk1Bi9hF6Kch8kmtf3q1Wns+FdgLXc1cUhafyg+XKD7U
	 Y42liR8PcCPV/UT+KrAhFYy5D9IykgaMIJxSzlgapO+oW4kKnCHRXE5unYY+pdKHU1
	 IYTS9BTXtuI77KgyuW5Hu2W1loi9sQopfWMLfoOyesoN2Mon2T4tzxs+i6Z97txhpv
	 rKfH1xVPre5qw==
From: Mark Brown <broonie@kernel.org>
To: Frank Li <Frank.Li@nxp.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, phucduc.bui@gmail.com
Cc: Fabio Estevam <festevam@gmail.com>, 
 Michael Trimarchi <michael@amarulasolutions.com>, 
 Dario Binacchi <dario.binacchi@amarulasolutions.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260812101418.37966-1-phucduc.bui@gmail.com>
References: <20260812101418.37966-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH 0/3] ASoC: mxs: Improve probe error handling
Message-Id: <178655643965.342177.15378550063939908942.b4-ty@b4>
Date: Wed, 12 Aug 2026 18:40:39 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1703; i=broonie@kernel.org;
 h=from:subject:message-id; bh=YYBnUv6qdzX56esAR5zst0HHT1xQZW6e40uF451j4EQ=;
 b=kA0DAAoBJNaLcl1Uh9AByyZiAGp9rIWh6xTQ7WPfj3zThpUIuqEjMWG53Pd40BdJ+zxf4am83
 IkBMwQAAQoAHRYhBK3maKpnVxi1n+Kf6iTWi3JdVIfQBQJqfayFAAoJECTWi3JdVIfQAXQH/0HH
 EU1dNuux362PF5w+farDKIDNho9sBJoPXbuNA8/g7gnBkJSIiZ0jZ5wJ8hH7EuMz0xmmlb0CTZb
 oRxalWXG5wPknNvu+VX2WK/TD03WpP6fmeutio6kjUjaUKtNSkeGeGX9elyDLePD/WRlC6T2psV
 eyQiXycR4FmWPynU2th3Mu2rgQFgAt7AknnbnwRbtFuldo5ZrhULNwiU9b49um3HQEnyFT10IjM
 PNoRzw2vd0plBtwFguHujliFE87X7Qi6UFmIMDcQewmkJXdT4+KnxaPk+xPSkszd8bGcaFwch2h
 73ZZ3qUrsL+bnwMIbkd017BjsaV9FGmWxMVS4TY=
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

On Wed, 12 Aug 2026 17:14:15 +0700, phucduc.bui@gmail.com wrote:
> ASoC: mxs: Improve probe error handling
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> This series improves probe error handling in the MXS ASoC drivers.
> Use dev_err_probe() where appropriate and remove redundant dev_err() calls
> when the corresponding errors are already reported by the called functions
> or further down the call chain.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/3] ASoC: mxs-saif: Use dev_err_probe() for error handling
      https://git.kernel.org/broonie/sound/c/b215caca714e
[2/3] ASoC: mxs-saif: Drop redundant probe error messages
      https://git.kernel.org/broonie/sound/c/f0701e5fc299
[3/3] ASoC: mxs-sgtl5000: Drop redundant probe error messages
      https://git.kernel.org/broonie/sound/c/e84c06775d4a

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


