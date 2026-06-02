Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFD44CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 07:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6SqQTJLSLTc5ORTNNPdbBL07+KG62ToCTtBK3V8opPk=; b=a65sSC9Vu2zZOySkoZRkhxUmYY
	Jqi19ajfw6d4dE6jrGygQnJVIck06my9t47wuC5DaZZ1Qlh61di8AaCDW9zAW6wvnbWr5unmlYkzH
	eFsy++eZSyxZ0bjPEjLkiMaS+x8m8AtWK4/i2vvU5CH5DIB4fv4K+V2JiML8M8ezFO/Q5/yOK2PMm
	iR+AMFhAiBBYbJ1G3Dxo+XOtrp2eIAJRFkgFKCkRM1uaKDb7nFaessl20rKRY0c9EB6F07MZF8yK4
	A6x0uvjvryqqgkB4wuylOSPX1OAFGCSmaVHbp+5v9aBnuNMBth3kAAInAtaKN1/6y3H0jrhkP3+FA
	av/j0c3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUfeZ-0000000EQZj-3IGH;
	Wed, 03 Jun 2026 07:04:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUfeZ-0000000EQZA-0KAQ;
	Wed, 03 Jun 2026 07:04:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4AC036008A;
	Wed,  3 Jun 2026 07:04:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A1531F00893;
	Wed,  3 Jun 2026 07:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780470278;
	bh=6SqQTJLSLTc5ORTNNPdbBL07+KG62ToCTtBK3V8opPk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=KfsjrNxcj1VMh69TZyNr766N2a5OtRF6gK+uhKgkAA78blDHXhFvob1gZ0pbhc7ZJ
	 psYMknlzRESOe8XHedppTqp/TwH0NQvYqX1C0IcjKKpzVg2P4tXc5wc6IHXCpHCxZW
	 ztvqsjJnkQcOTY6t9TdYanP+c6A+QMvBiwI/CCE45UibN5oD+Rkf1H4oRvCvW2OJdU
	 BxrEjOc8MeBktTm6SsPWOTbMZECll/C876od0b8jC4ng2kcKEQ3qM/PNkhsxCa3EpV
	 AnsSltcAE7PGUAJLOUAXS/0YALi4qaGQOHzqtaaKDV/wZR0U2uPbPKjgx1DWYaWG37
	 YmDSnAYQj/rmw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>, 
 Jaroslav Kysela <perex@perex.cz>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen-Yu Tsai <wenst@chromium.org>, Shunli Wang <shunli.wang@mediatek.com>, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 notify@kernel.org, stable@vger.kernel.org
In-Reply-To: <20260527-asoc-mt8183-probe-cleanup-v1-0-4f4f5593c8d1@gmail.com>
References: <20260527-asoc-mt8183-probe-cleanup-v1-0-4f4f5593c8d1@gmail.com>
Subject: Re: [PATCH 0/2] ASoC: mediatek: mt8183: Fix probe resource cleanup
Message-Id: <178041307167.93058.8280968694103073134.b4-ty@b4>
Date: Tue, 02 Jun 2026 16:11:11 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1520; i=broonie@kernel.org;
 h=from:subject:message-id; bh=eJuv17eLJZHSwOzwJZ0aqFGo6sAVK3Q/bWt1bbGlGf8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqH9IClZGO7bSnhuRJdTwfqiPVGBv1f7+UdJSuL
 6seECFgrcSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCah/SAgAKCRAk1otyXVSH
 0H2YCACBk8TC/Qq4VLNuBxjSwYqK8FPlGzzfq0uknvbQ+NhJuuocnTfTUXEDtPWJFSwPd+dwiCS
 DRVhecgclYTY6DhRFWPxVNp8qsKnQw9lF2oDJJtofi7CYc6tLNFy5jT0XmJv4ecjUPY8e+/STPq
 0hOXBUyYu4VvPPTPd/fQa/hX/AnRoAYNBpd+qW4st1Yceyml9yy/uuJ4Tm5BimdrVZJWwdcopR5
 X0q/2AoCJiqdEGLWBQAk//E43MzyCG49UBbkQLK2ZzFmrMmIQ1S5TVLrS4cFJBQHY9E02Q5yYri
 QGPRON907c1QK9wxAtJ8K3aQB6vkX9lpBVKED1pCwa6Z0ft4
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

On Wed, 27 May 2026 10:41:47 -0300, Cássio Gabriel wrote:
> ASoC: mediatek: mt8183: Fix probe resource cleanup
> 
> The MT8183 AFE probe has two cleanup gaps that match issues
> recently fixed in newer MediaTek AFE drivers.
> 
> First, reserved memory assigned with of_reserved_mem_device_init()
> is never released on driver removal or later probe failures.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/2] ASoC: mediatek: mt8183: Release reserved memory on cleanup
      https://git.kernel.org/broonie/sound/c/bee65e00c092
[2/2] ASoC: mediatek: mt8183: Check runtime resume during probe
      https://git.kernel.org/broonie/sound/c/f0334fbfd107

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


