Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C43FCD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 22:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=raD0DV9Bl5ViipDNB5LAvSIjSFwwXj88qPYZmqyqjq4=; b=Jmp24Bk7/Dpea4UFA46pga4e3F
	OmC88I42NluojV85AfQ9wufvb8lxUrPwo+sEzNhYQ5kfaXaoFSpJfzmsTio2WsotDS1LQXruXyhz9
	JKJDgIp65rmWfEFc3PbNGKzNoY8aItmNapmYgcVavpovaUcWPRiBZZiPyjB5pxonVSzXOKe1TT/AC
	wDUyPdtBgxFWDMg1XTIxrel2iMqvxFRYLbEQoNhlt6qlceYZAtqRJKnn+BT13Tl50Dhig/jw4zeNx
	1fati9CWrXxuNXmEC2ZEMCd4rLiu5tLV9ULnpua5Ni3JVl1aspvFXxhBsmKpBCUgl375I5DyjroiV
	7emA3zuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYADe-0000000BenV-1oqP;
	Fri, 12 Jun 2026 22:19:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYADc-0000000BemS-2xhu;
	Fri, 12 Jun 2026 22:19:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2487A60008;
	Fri, 12 Jun 2026 22:19:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 388891F00A3D;
	Fri, 12 Jun 2026 22:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781302755;
	bh=raD0DV9Bl5ViipDNB5LAvSIjSFwwXj88qPYZmqyqjq4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=WswevIXRn/FEU/DWqFdMMd9Y+16KNZtVFclRhEjHm4yFRZXPRyNEg19Y0rTSVWZ0U
	 +dcNxIBbI4NiXRWVqhtNt3ogbY2wJ7lGSW9X4Rwz2yhRFOmn8vqrKhMifPider3OQv
	 xgKX5Gs1IFjbfAUKuKXP9bun0XzGRpcfT6/jNam/ekyTC4L+A1TKOLYbXCR10qmPVZ
	 TvezH3AYeWHzfqZbKLKWH3QxjW6O0/22TMnqnPdJuOPLGUYJqa/dsGotGoNxSm4FMK
	 mxPUnfwzJibskb5Fbio1I25k9YxEqSLuEZ84ugPk9t6nw6OaGiaPUiKjstE3nL54GD
	 TqkVWE+SceHFA==
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>, phucduc.bui@gmail.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260610102153.83367-1-phucduc.bui@gmail.com>
References: <20260610102153.83367-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH] ASoC: meson: axg-tdm-formatter: Use guard() for mutex
 locks
Message-Id: <178120696227.484538.4270206978478924014.b4-ty@b4>
Date: Thu, 11 Jun 2026 20:42:42 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1145; i=broonie@kernel.org;
 h=from:subject:message-id; bh=q/ePDLbuq221yKIMcn/uM9R4k7o9ZqIFjOkpq4bDfX0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqLIXes3vMx5VTSrzq+Bi0bcUY3ANrcFqllZ+0B
 kA/bI7yUymJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaiyF3gAKCRAk1otyXVSH
 0CfbB/wKgwKnTeGoDFLJd4ux2i4QSIdaSdF0wZdVFkFvgFvu5/MaUqyYU3jnveIKpsQTZ4v9Z7w
 yo4Q6ZI/8n3jjbfwkKNWgJq+oqEHB15qiZecTWFqa4LhCidHIPSks4W2d04F17/R86JS1ZESn2T
 q/GgTyBP8zvYGDBnSFr7hmHNGl3/XjF6TMbc6VN1Jva3q6jdxXBA3yE0qLtCm3XnSKpJ9igK2JM
 zsN1dq4a2okuV+xiAW3Hfm9LXDMeEn174EUAKaKxNZqWnK4F4Wkj10cOW81hxhkzSjUKlcMm2n4
 LdVug+WkHhDG0aBnpgei7RARaEMzQwkZHwVTsZnGQQtkSb27
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

On Wed, 10 Jun 2026 17:21:53 +0700, phucduc.bui@gmail.com wrote:
> ASoC: meson: axg-tdm-formatter: Use guard() for mutex locks

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: meson: axg-tdm-formatter: Use guard() for mutex locks
      https://git.kernel.org/broonie/sound/c/a68bbd4ac1b1

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


