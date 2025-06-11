Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8007C71141
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 19:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hEdiVj/ouDxjtTL64A28GwxWv7LWsH935w5UighpXbg=; b=OpAT5LXo+0KFWfZgc2MAbhWi5M
	fyaJF3k/Njjs9PasQF4x5KzOOi5GkTzwQIBwrjVRsZtzvnpEJaCjTbIaGBuLGFCu+7t9pQFxjbRrY
	cMI3h2NkEepy4xhxv8clhfAl9yr4nQiqCM/l35Hz5yKszcJNB/ys1DtWFTba5tTpMTz9w3FWOcw9y
	HLqihmywSi+gJr+SrosSIjXrciMM2F6e1K2/p/e25KbEVLZBDzYuF0ZKm1Z57weEV2d4AUNs9HuiG
	/NwaNndhQUOBYCwA7peYmHYVn6YqtvF6jsbSuLlVj13NhRAHRyibZjrfVHBMlbPX/wV2zfS1bfSCl
	UrwWf1tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPRY1-0000000B3ex-0oUb;
	Wed, 11 Jun 2025 19:55:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPNbt-0000000AREV-2qsT;
	Wed, 11 Jun 2025 15:43:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CBC3261F1D;
	Wed, 11 Jun 2025 15:43:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D9BDC4CEEA;
	Wed, 11 Jun 2025 15:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749656608;
	bh=nYOyxTm0Jn2vrAgeyWkPSPKnq9L/YExq6J4YfvCyaPg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=AxqzvwU8TebnHervLM08aFajfTNx3pw4mNUc1mA+AgAwPRaz797sASz8gqr5gCAzJ
	 Ioivlu7Vy4mpJ9f/AOkue7jvoTpVAUMivyb9gOhp2P65I9owP5MWByFS7COutemSkz
	 5lKUFa4xAQQHEDJEr1MSujWaID/75iKSWEaUW40NvqXmmoshoSRdBadmRTxtoL6oDK
	 WfDxFmp1qHoj+YMa8QAxiYdIPeIcUI90bBjxKbYSbcwgN9zbRGmioGDDjL4YNEhF9s
	 O7HmYzjV/NMmuKs+p6J1GYxCuEuGkJpd5K++Zx0gK1f+imCYYNVVkoNYEYNq41WdJU
	 jAGFLqhKIMXYA==
From: Mark Brown <broonie@kernel.org>
To: linux-arm-kernel@lists.infradead.org, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: kernel test robot <lkp@intel.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, linux-renesas-soc@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org
In-Reply-To: <20250609223012.87764-1-marek.vasut+renesas@mailbox.org>
References: <20250609223012.87764-1-marek.vasut+renesas@mailbox.org>
Subject: Re: [PATCH] regulator: rpi-panel-v2: Fix missing OF dependency
Message-Id: <174965660685.52384.1301110608042859548.b4-ty@kernel.org>
Date: Wed, 11 Jun 2025 16:43:26 +0100
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

On Tue, 10 Jun 2025 00:30:00 +0200, Marek Vasut wrote:
> Add missing OF dependency and drop of_match_ptr() use.
> This fixes the following LKP report:
> 
> "
> >> drivers/regulator/rpi-panel-v2-regulator.c:95:34: warning: 'rpi_panel_v2_dt_ids' defined but not used [-Wunused-const-variable=]
>     static const struct of_device_id rpi_panel_v2_dt_ids[] = {
>                                      ^~~~~~~~~~~~~~~~~~~
> "
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: rpi-panel-v2: Fix missing OF dependency
      commit: a4eb71ff98c4792f441f108910bd829da7a04092

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


