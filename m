Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C319CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 07:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z6/ckCFcgr4XWtYBVVRtL+Ct7dfjpf8dESf8wUMG9iA=; b=Wy8w6TfmWd2y8YgKfHQG8GitCH
	dspfPGlgRJBiuRTxXgqoQE5JQVmNy7F71HHWRbZgrUFqoFCCzWjpKiShU7ibOMSiZTcjAIcdK7BSC
	8XTFcHIrdFlKb94pjrQ+g6A8pGv8YdiS0ngWyYmROz1MvDMlyAQsKvECxcy9538U21BXJ24J9VEMD
	gQpOp0JEl8PCr4vcH7QAMPtX1VRGH77ukCwSoabI53cG/qTeUE2sYLH7GKA6dpGAdbOP9IpQ3l8I6
	NgjwoA7Yjh3RlwDU1I4n/lMOq4R7sbkNCScnzuosi3KS4yMhkg6rNtiTEA2/AA5Sg3FZOQ8oK6nK9
	Q6/n9LnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUfer-0000000EQjl-0rhA;
	Wed, 03 Jun 2026 07:04:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUfeq-0000000EQjD-24IB;
	Wed, 03 Jun 2026 07:04:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E497D60221;
	Wed,  3 Jun 2026 07:04:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2AB01F00893;
	Wed,  3 Jun 2026 07:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780470295;
	bh=Z6/ckCFcgr4XWtYBVVRtL+Ct7dfjpf8dESf8wUMG9iA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=k7GUF5l8oVabuD+5BF+MS3uw4cnRpVWa0H9A8XsabOvcehxVWo/UOmOl7lbVnx/xR
	 vXTAqLIG03CbQJJvJ2Xudfmx2KTlfBE6II/bziCPeyHDEx3ItGbaKDCU2iNhpmhj8X
	 nhyCi7ALSVu5THk832x+1HOlZHA+bDbNQ4LNIEUb8XQkl3nuN04yr2yrsLI87QXKVC
	 b6+r/7zveWoKebATm7JJZqLTqcgpWRZF7yf74WcjFe56NfWlWrc+8wotLW9P9EGYl1
	 47PVl5HfiM1W4WxxR6r5SnR11WQglvtEUpxZ3E79C6zLpJpLfkUsgNLUK9ux1E7oqt
	 lQCmLonveBqVw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Javier Martinez Canillas <javier@dowhile0.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Karel Balej <balejk@matfyz.cz>, Matti Vaittinen <mazziesaccount@gmail.com>, 
 Marek Vasut <marek.vasut+renesas@gmail.com>, 
 Samuel Kayode <samkay014@gmail.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 linux-renesas-soc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, linux-omap@vger.kernel.org
In-Reply-To: <cover.1779878004.git.u.kleine-koenig@baylibre.com>
References: <cover.1779878004.git.u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH v1 0/3] regulator: Use named initializers for
 platform_device_id arrays
Message-Id: <178041297263.93058.3488426549945445903.b4-ty@b4>
Date: Tue, 02 Jun 2026 16:09:32 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1683; i=broonie@kernel.org;
 h=from:subject:message-id; bh=bTVy3FAIZsqQF1unUBLrL1Tiy1sS6gTQkrGyju0A2UI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqH9IR+5XenVVA9mLHD2HeO7sMNeqC+VxerFOpf
 IwsWOpOWzOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCah/SEQAKCRAk1otyXVSH
 0IP9CACDwCfsHAyOc8wD19LkmpqTPvPL3MCjfuetPTU/gdAUVVKU3hJDg0mrEFSFtECISuQKNp+
 IDZhuxqSzlFO9vZYfTxelGP2i+YDA5qKrvSVWhUh/o2ocvKdqAkCTAbqKDoAO+zPRKhLq8LdQA4
 3vAQ7MaG3XwQh+DPYWKKOf3XpJSfpAewhEfaGYKG8ZCqwCZJM8KNvEUXW4sjxWfxA0b5+BEiNj8
 VtqKQ41+jd8pBtR8CP3onpyOFmb1T4iAKTxhxbub7qPgS9U4TjBvYRFo5RlcuC6CP8ulHLffsFV
 uaG1JcYy7gUAXHRu8KISbRgIZxYDYJgHHdl9F7pN7BIG+fMS
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

On Wed, 27 May 2026 12:47:43 +0200, Uwe Kleine-König (The Capable Hub) wrote:
> regulator: Use named initializers for platform_device_id arrays
> 
> Hello,
> 
> this series targets to use named initializers for platform_device_id
> arrays. In general these are better readable for humans and more robust
> to changes in the respective struct definition.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.2

Thanks!

[1/3] regulator: Drop unused assignment of platform_device_id driver data
      https://git.kernel.org/broonie/regulator/c/4079e9d91b40
[2/3] regulator: Use named initializers for platform_device_id arrays
      https://git.kernel.org/broonie/regulator/c/d35028340d75
[3/3] regulator: Unify usage of space and comma in platform_device_id arrays
      https://git.kernel.org/broonie/regulator/c/0eb17367814a

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


