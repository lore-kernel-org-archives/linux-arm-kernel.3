Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2546AC624D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 18:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g7B9k3wEZXCM3vmGvq/Kc6DCDoAFzdN4ot5VSauuQ8Y=; b=teec1b7FJ5GQcaDtUb0RfCkXNG
	e4hu2Brk+UGKPQA6WiXAJ8NWrlmt9Tk1uU63CPg5wREC97U9fLsSccEwZdDL4KZEh79uSzCEkIX/u
	a9YrkpIfHb0sJ/BGkATRXxYdiVRmo+1Fjkid/bn4DocNV4hGydwzPiCBjRb8rB5i3Pw/K4BfuAn60
	R9mATydUci4OVhIIjefWwfhGbsvw+8/nuTYJUxDw2QdrgkEPqnLd/bgZmDj1xr/eXDsRRnQbOmvv7
	qjUlRcDlzi67Hzp84zhWCSuwgJVqG1dV61QKO4JJ2aLnwybplaBQtjbpy0sqgkB7JD5zhlkSXKoCG
	XDquWPBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1T68-0000000CwQh-23Bg;
	Tue, 01 Sep 2026 18:20:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1T5m-0000000CwLH-2p1M;
	Tue, 01 Sep 2026 18:20:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B9170600D2;
	Tue,  1 Sep 2026 18:20:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B2A61F000E9;
	Tue,  1 Sep 2026 18:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788286817;
	bh=g7B9k3wEZXCM3vmGvq/Kc6DCDoAFzdN4ot5VSauuQ8Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=KykzVk12EgSORhPtUSsmgXdwRYRebzq/kmagZviEyrJNzcNpGK5VjpK1EReJJWa05
	 KqDfXrfPrAzKANNPia9UJ99LhAhO0cdVM8lwc3S0WXXLljHHAuV3z9S4pWQywujWUL
	 A+BotPsJdWRtUsrKlsy+66TbLQ2Szp8lHoolMjNhdHcrcoSoBQt28BSQ/wOkkAjA18
	 lF2oRKTZaQaeylr3x7ibDE1IdvY+t+0BpgbcpOLmQlxnGx19w6RKvlU/eBGsibG7/y
	 j32YUgQUYC89rnCSDmYzjKg5DWtV3y02LZtQitKv6dQiVnpYvq3LUJroI5vCjM9WJv
	 zH9M73+uYesvw==
From: Mark Brown <broonie@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>, phucduc.bui@gmail.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260818104344.37824-1-phucduc.bui@gmail.com>
References: <20260818104344.37824-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH 1/3] ASoC: mediatek: mt8173: Fix clock error handling
Message-Id: <178812843613.13461.17948002666119165762.b4-ty@b4>
Date: Sun, 30 Aug 2026 23:20:36 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1378; i=broonie@kernel.org;
 h=from:subject:message-id; bh=gLozw8UEkRgHLK7htCTa+GJYnej0jU5Yh6Y3hEBgKUs=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqlxddWk9TwCixp7CzuWovcdrqyIRgJ7LFQmuw1
 nO4Kqci1yiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCapcXXQAKCRAk1otyXVSH
 0OxcB/9oKNuP43gqIxpBpXRB/JMT5s/P2iVAn/vYrUzCafWCFtgAm/T0B/3VrcqeWes43zn3uKl
 Ve5nbLXeLSt1X7faIRijS1UT4qq1Jp6OoOAF+aXU2N80pEHx8l02nsRpViXwmuNpDioaBxbfZ84
 7cYoDmlkAPdWM6eSGg4AiKNnyinJ7gzUGON0HonkqInIoOm8EjVamaQr7L+s9f5cd9AWkhCX2MI
 EhM4kwHsY9OBL9sFYlu5q8RzlkOHLAWuGncpaNybZEn7NPfYTwmey5y7vy/LX6R1rMIZU8v0VUp
 5YjPsk8si62rOVTZPx7oAlqqKx2A6lMqaWESIMpJHTsbeRhm
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

On Tue, 18 Aug 2026 17:43:42 +0700, phucduc.bui@gmail.com wrote:
> ASoC: mediatek: mt8173: Fix clock error handling

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/3] ASoC: mediatek: mt8173: Fix clock error handling
      https://git.kernel.org/broonie/sound/c/7635a23cd6e7
[2/3] ASoC: mediatek: mt8173: Use dev_err_probe() for error handling
      https://git.kernel.org/broonie/sound/c/7bcdd38eb502
[3/3] ASoC: mediatek: mt8173: Drop redundant probe error messages
      https://git.kernel.org/broonie/sound/c/15b975f173f1

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


