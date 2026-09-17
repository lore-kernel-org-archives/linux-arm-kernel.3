Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA29DC982DC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 09:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z1o+2EJUrEUDbyRUgSUskYSkV3cMpCH3ceYu3ofO7V0=; b=WrGYw56dtzWUM6Eg+YABqTtkMW
	xdd+kun8EYzgh5TlG2ZIz37SfSz+ykgckTEWhfY8BrOKgp2HK17xAMCjUkk90TLiXi86OO6/MWrb0
	iMluo8EVBfxOjDLFS1L3QBHZAPee5TISAdh4Dr9WSEsH7MMcEtpPE0OGJ6kTXOm+lybm1jG/kRM4y
	+xnBvRFgbtlc6MuwmGLO9lmimH/7LXio5D7lVPW/f8RBgEdrie6GHOEqzmvMRV79LABlZta6O1A4d
	L5v8jZuVyt3rV1gpUawLRYYLVZnkwBMWmxx1JjGLKQQGpo1KDE7yYwwmNlOwx5AvtHmKnuNBqI+wJ
	LJn8jMtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7VNZ-0000000E1cb-2M0H;
	Fri, 18 Sep 2026 09:59:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7VNY-0000000E1bx-40Wj;
	Fri, 18 Sep 2026 09:59:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EB56460A5E;
	Fri, 18 Sep 2026 09:59:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E2EB1F00898;
	Fri, 18 Sep 2026 09:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789725575;
	bh=z1o+2EJUrEUDbyRUgSUskYSkV3cMpCH3ceYu3ofO7V0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=TXD9X0N4EOz7g+ZOsnyYq8PjoPS6r/evXipkXUDIgrfT5rxBcTwDA0fTFdBkuN3XY
	 n0muqI0hyQmHdzKpYjpIcGGofLjlhr0wVfv5gDoiRnXrZqGPlB6VVO2ITnE7WVusyY
	 atjdYiB9oOI4bQdHZQsQFQYHT7D5OdJMhGwEbWIxLci3KhuvnuHVXMltSAVLzQgIJl
	 RVV4E3oijSEvZE2TLoFFLDqG0bZ//6opVFlmO5QG7e+hDhyfTq/kO5v56p1BpYibbJ
	 6LEAWHUcoV2etl1DzJHbPO9zqdBaFqNPdt2SN2Tm+F3vOcmGT/sMuZji1Orfnm0HZi
	 B5NobWZfkEVzQ==
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 phucduc.bui@gmail.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Cezary Rojewski <cezary.rojewski@intel.com>, 
 Cyril Chao <Cyril.Chao@mediatek.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Dan Carpenter <error27@gmail.com>, cassiogabrielcontato@gmail.com, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260916050020.14575-1-phucduc.bui@gmail.com>
References: <20260916050020.14575-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH v3 00/12] ASoC: mediatek: mt8189: Improve error
 handling
Message-Id: <178964579061.162267.1362536058859075939.b4-ty@b4>
Date: Thu, 17 Sep 2026 12:49:50 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2622; i=broonie@kernel.org;
 h=from:subject:message-id; bh=DyUPZa74Z6H2dwMaVflO5vPYh8y7Y+XnqMVZ729Issg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqrQuC8AvSUhtSFMKXeNu/CtsaAbJ+39W4gmt0b
 qK1kL2tgGGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaq0LggAKCRAk1otyXVSH
 0CwNB/9XQDgm/oej4WNwzmN06N+304vOdFoIWg77CZn+9TMH8/Ib2NEUuGTyPdrcxB9/sGJJ3nk
 oXlkZWze+j58o7QwIivsPRjaANz3sZLpK21LDo8Xd8FhGh3ie/IB8cB8WUVL8kOo9SMWeA97Wu/
 +CKAh61TP64/MvTm4lk40IjGRMfM5ykLs/PZJVQqKhkaMFzwn5Oq61a9I9bjEuNLUwgn92avbAP
 IErQMkXf1DB18+isDnLl3IeFCVSvrrr7Rx6ISkYbLWTnEsG484dl6g+wdQndgkpDedwd796I7FS
 5TGlzYWOovwOzlU21Sa2YO01BdFJKZiJ2Prs+IjopdLUXouc
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

On Wed, 16 Sep 2026 12:00:07 +0700, phucduc.bui@gmail.com wrote:
> ASoC: mediatek: mt8189: Improve error handling
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> This series addresses part of the error handling in the MT8189 AFE driver.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[01/12] ASoC: mediatek: mt8189: Propagate APLL enable errors
        https://git.kernel.org/broonie/sound/c/5a3c23d4aa89
[02/12] ASoC: mediatek: mt8189: Propagate MCK enable errors
        https://git.kernel.org/broonie/sound/c/bd9a8d9def20
[03/12] ASoC: mediatek: mt8189: Validate MCK ID
        https://git.kernel.org/broonie/sound/c/b6b47040e897
[04/12] ASoC: mediatek: mt8189: Propagate reg_rw clock errors
        https://git.kernel.org/broonie/sound/c/29de66668799
[05/12] ASoC: mediatek: mt8189: Use dev_err_probe() for clock errors
        https://git.kernel.org/broonie/sound/c/ea8c96a05da7
[06/12] ASoC: mediatek: mt8189: Propagate runtime resume errors
        https://git.kernel.org/broonie/sound/c/483e827b005f
[07/12] ASoC: mediatek: mt8189: Remove redundant error message
        https://git.kernel.org/broonie/sound/c/e9e9e514eeef
[08/12] ASoC: mediatek: mt8189: Propagate APLL errors
        https://git.kernel.org/broonie/sound/c/6347f276da8c
[09/12] ASoC: mediatek: mt8189: Propagate MCLK errors
        https://git.kernel.org/broonie/sound/c/65b9d4a783cc
[10/12] ASoC: mediatek: mt8189: Validate sysclk frequency
        https://git.kernel.org/broonie/sound/c/9c73b5a43c99
[11/12] ASoC: mediatek: mt8189: Propagate TDM clock errors
        https://git.kernel.org/broonie/sound/c/242d0280eabb
[12/12] ASoC: mediatek: mt8189: Validate TDM MCLK frequency
        https://git.kernel.org/broonie/sound/c/197ec30e1b60

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


