Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7E06C44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 11:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jesZuPeWaeL9z/PHoWJHtu6Qq+AFb40j5P16AfqJxyA=; b=ZYgOaJxG741V0ahxK2tRMCguMR
	ZzmvM8kGxjZ6UqC+hrrE2EGCcYl2LxJsY4/fDi94nIVweAH+gEMB3vIfXzRJXVWlqH+Nd1Tb1kc2B
	jo4hB1OyrWsXR2urokwvYDsYZg/BfeZb67MQBPBBmIL2b43JPMKdaDpYBGhaDz9riNWoSPiZqNtaS
	OMwwB1WUEymI44DqLLrbfcbJHz2UDpUfLzilTn45bPZ/R9BUyvySGsjYrHIOREnmparncOiNTMskw
	cIEH3xnhaHRhxDMGJlAy72RMLgIXs3X/nOG81HxiOT8FyWOELpkAmTDPjoRc6xRNekHRjw8aqVNBu
	gOnCvWfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjxtq-0000000Eao5-22wW;
	Wed, 15 Jul 2026 11:35:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjxtm-0000000EanN-1M6S
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 11:35:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 73E746001A;
	Wed, 15 Jul 2026 11:35:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 711331F000E9;
	Wed, 15 Jul 2026 11:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784115333;
	bh=jesZuPeWaeL9z/PHoWJHtu6Qq+AFb40j5P16AfqJxyA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=DU7gCO/hsLqTwwk7TrDDgi6SxLThPZZUBTDgrO/vIreh//foqleLzkS3qXzkElWtB
	 CQKaJF8wR03T1QTKHvCbSFm/OO8G6JR8351ZvqQ+kJLjx6xlt3W4hgFzvdQti/56z8
	 AdAl7uEqWLmVf0QiQAuxA4DZzP2OppKvovPu4dVvbzk60+2W591kBra8i7MQarcQhV
	 4WlAiIpr83zDimSizShclQeutXvBhvTeOXE0a+il4DdprKWBqwrQT7lW/+ViVJty6H
	 W36kWw2XuxnRh12PUqcjsBdUtsNN6cg06zSSPMCEBMj3vuMZE4NIWePo6cy6a9P3o7
	 FucInxpg9bLog==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 Frank.Li@nxp.com, Chancel Liu <chancel.liu@oss.nxp.com>
Cc: kernel@pengutronix.de, linuxppc-dev@lists.ozlabs.org, 
 linux-sound@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20260710031333.3491445-1-chancel.liu@oss.nxp.com>
References: <20260710031333.3491445-1-chancel.liu@oss.nxp.com>
Subject: Re: [PATCH] ASoC: fsl: imx-card: Skip sysclk reset for active DAIs
 in shutdown
Message-Id: <178406418862.7661.7096078031628027721.b4-ty@b4>
Date: Tue, 14 Jul 2026 22:23:08 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1149; i=broonie@kernel.org;
 h=from:subject:message-id; bh=sNEXueWVdWEvfYKYwZZOPFDO+l6YsE+OW3Ra6F4e6zw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqV3CBctjQmNjrs8DaxHnHGNriWx0pEgtvGK67Z
 99Q7E7K7dSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaldwgQAKCRAk1otyXVSH
 0Lv2B/9iwsllDW7+fFWuMbcXDu+pjbFkmouDD7PciHiUfac0zJWqUb8SwEPVm7oGXMOibcDq2Kq
 YYouaK3iixM869F51GmvpQGgKWcu5tKldP5a1KGcQLcD5SfJvvsd4oYraV7jkS2zWaKToBwYBjM
 mhXSdzMOSNTZyFo1oH7Dt2gv7gI9vW9Q4UHyxpFoY6/Lz0VPCcAzVfNRPImPqiCWBNUZ5irG833
 J69er+PQAizp+0z8ltrK5Coa9q3+igR48mHEgGulXvStCD73JTM2MYHoao8/eJFV9ueYHpT27sO
 IO1bOopuY7+1+mIo9ncpEwxUoLEhRN4sVHiQpy6KO7RHgqTe
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

On Fri, 10 Jul 2026 12:13:33 +0900, Chancel Liu wrote:
> ASoC: fsl: imx-card: Skip sysclk reset for active DAIs in shutdown

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: fsl: imx-card: Skip sysclk reset for active DAIs in shutdown
      https://git.kernel.org/broonie/sound/c/9f86aea99256

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


