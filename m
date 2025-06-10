Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54A9FC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 18:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MFZGfKY+V/DAGTBUzNOTLEvOQ0xCWVfCM2/z6W7cr00=; b=FxMlw+VwSsEjsV1lzyE+r7bj1a
	ItVkDnjGvyr1teHNg5I41Z1NmisrYREmG41JDyisF4s20dR1Os3Id/yQimIodPaoeWCh+Abrfw4Kk
	Y7lacGkNBuAQK25LHhkdaibnKyi66Yx6bm7LO/aZ7dzPLKngzOEzT6o5YyeGnSfLXVH6csG96nKtA
	Q0w68lNqyooZUP4Nr3mY1pqhMGRgiSHVK2VSYgn8O8QHJNRFbZTuwY5FolErTPvJz0H0xKkcdl2Kg
	iW9HxIYSNKfsCygaq1FCzQqq4YMYhHZo3G3zzyU1wizZNs1/28dS8Nsqn79Rro4ghNowN2xDLdUKP
	nex60kLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP3de-00000007nYC-0lPH;
	Tue, 10 Jun 2025 18:23:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOzmV-000000076rN-2hbn;
	Tue, 10 Jun 2025 14:16:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 18D79629F0;
	Tue, 10 Jun 2025 14:16:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53E14C4CEED;
	Tue, 10 Jun 2025 14:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749565010;
	bh=RXXxDrUEIPBbjy3PKDw2gspe6TvSiaJPcdNSDA6Iwfg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=K14pOdt9y3LijzY4is8PinBn0Qst18T1V0ya0YA95a3jxhQvz7ma//GLFQUixACfS
	 VGLDiM0fUupKGZ+KAiUiUMmgBu8E56xnIr2v/yn1SNb/ZUO5YbvSp5c/jtSqxN8uZI
	 KouS6sMtpM+d/3PF7sgr52VmxL8uGJmi0FnIjfmAF4Dx5uxZ9Yo2dlT82vltRO14uP
	 XmKZtxzVPKC3q8NSEvlFc3XLz3EoHug10Xuhkvaf2H1zLQXEQ1sa9uUkaQqX1BKh1n
	 40FfzAvt1olhbVzizcDedRB1fO/y/EYC972EK8CKYKnTGWny6dj2TgJ+Z65HSfsXJI
	 8W63ygGuNLdHg==
From: Mark Brown <broonie@kernel.org>
To: linux-arm-kernel@lists.infradead.org, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: kernel test robot <lkp@intel.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, linux-renesas-soc@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org
In-Reply-To: <20250609200242.31271-1-marek.vasut+renesas@mailbox.org>
References: <20250609200242.31271-1-marek.vasut+renesas@mailbox.org>
Subject: Re: [PATCH] regulator: rpi-panel-v2: Add missing GPIOLIB
 dependency
Message-Id: <174956500908.46190.8376782599079931737.b4-ty@kernel.org>
Date: Tue, 10 Jun 2025 15:16:49 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1
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

On Mon, 09 Jun 2025 22:02:06 +0200, Marek Vasut wrote:
> Add missing GPIOLIB dependency reported by the LKP test robot.
> This fixes the following report:
> 
> "
> kismet warnings: (new ones prefixed by >>)
> >> kismet: WARNING: unmet direct dependencies detected for GPIO_REGMAP when selected by REGULATOR_RASPBERRYPI_TOUCHSCREEN_V2
>    WARNING: unmet direct dependencies detected for GPIO_REGMAP
>      Depends on [n]: GPIOLIB [=n]
>      Selected by [y]:
>      - REGULATOR_RASPBERRYPI_TOUCHSCREEN_V2 [=y] && REGULATOR [=y] && I2C [=y]
> "
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: rpi-panel-v2: Add missing GPIOLIB dependency
      commit: d6fa0ca959db8efd4462d7beef4bdc5568640fd0

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


