Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27C18C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 12:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=an5rGKqKMspqBWSigaAZmqS9YdiWvHRQ6Lil3Zm2j5Y=; b=Sa5JOcpXUX6TBnvw2CcXMG6sIG
	wogY65+h1i6qu2zpscZtooNmHQ/httAirMPPzmxlH+4mxFKMOyAMCGbKTf0kZqqwdYWzI1N8Ixe5A
	kFRpcxbvFPJmu6bizS06ICAyfHoVBjzddFgCUsDRWrbaQf41R7BdCS/IKyiWdyS3b9Cbf+JfsdBJO
	ixIinkIWFAtOk9R6mZcXQPiQXFBX177S5jjqnMeYUmRTpSZ6yDTY5A1tFwOJmQBykhtPRH0OhPHbs
	gzGXNPs86tcCkmYy1Led9AsmHMEKj5kq2qyu8pPs3lBtV2mZsPbFJr8qyJhucanAbzTrOg/CYspWl
	7vX7swLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpRUr-00000004efg-0KRg;
	Tue, 04 Mar 2025 12:35:41 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpRTG-00000004eNZ-2NVy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 12:34:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D1178A45155;
	Tue,  4 Mar 2025 12:28:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97FDDC4CEE5;
	Tue,  4 Mar 2025 12:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741091641;
	bh=+Oq4qborciN3DUoZ8cclX0JGNzd0VTbYzFALe57YoB8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=kp7FvLQjCHpKoC4yJGp5A0Z75h7ahSVZHdI7ezCoSQK4lPylNsVISWczDD4LMDWQo
	 OjuZUerP9DyqG7uQKmKpSK0F2cB3tM6l0lMrDuzKlKAbUMMxnBsQliXdpGUDmkQLuP
	 Oub/btjTWLBn+XOc2AI3WejQEXZBKi9mPc62hWDRuwqkninUAOx79vkyfKbegh+eke
	 FxAnAiRoCCYVcv238BKwIrwNseCyNI20aSFCPbdYr8rv1zw+aJaRtjIoQ1/lTPzL9J
	 09pTu7J3OULxC7IphGgdJmbYjUTAN9gH+EPqTHUQ4SBhhTKSfhf2gv8vruktadHhHF
	 /Lvzrdam09usQ==
From: Mark Brown <broonie@kernel.org>
To: linux-arm-kernel@lists.infradead.org, 
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, 
 Frieder Schrempf <frieder@fris.de>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>, 
 Bo Liu <liubo03@inspur.com>, Frank Li <Frank.Li@nxp.com>, 
 Joy Zou <joy.zou@nxp.com>, Robin Gong <yibin.gong@nxp.com>
In-Reply-To: <20250303132258.50204-1-frieder@fris.de>
References: <20250303132258.50204-1-frieder@fris.de>
Subject: Re: [RESEND PATCH v3] regulator: pca9450: Handle hardware with
 fixed SD_VSEL for LDO5
Message-Id: <174109163933.26710.17795041039558652228.b4-ty@kernel.org>
Date: Tue, 04 Mar 2025 12:33:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_043402_677406_47302850 
X-CRM114-Status: GOOD (  13.08  )
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

On Mon, 03 Mar 2025 14:22:54 +0100, Frieder Schrempf wrote:
> There are two ways to set the output voltage of the LD05
> regulator. First by writing to the voltage selection registers
> and second by toggling the SD_VSEL signal.
> 
> Usually board designers connect SD_VSEL to the VSELECT signal
> controlled by the USDHC controller, but in some cases the
> signal is hardwired to a fixed low level (therefore selecting
> 3.3V as initial value for allowing to boot from the SD card).
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: pca9450: Handle hardware with fixed SD_VSEL for LDO5
      commit: c8c1ab2c5cb797fe455aa18b4ab7bf39897627f6

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


