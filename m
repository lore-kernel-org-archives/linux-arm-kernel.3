Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4985D78333
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 16:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1zswV+cOCf1VMq53pZdSbNCxwopscbLSKeixIAOtphg=; b=nXevaZo3JE/d5Sj2HDzk/OjaX2
	s/23MLEWgQ0Fo7FCuUAgSEBG0kc6sIvt5v3d/ofMSVHm2XXqSwH/6vi131tLDsq89/NhSgAicty6e
	cZB14Wzrfoe1XLB8H7FXEyLuX5X6auO+Gza1V4IxZFtDheRxqtsD2av3xQelVPMIrIcwZdERA1FyY
	v3er2wjkSHxJ85xxoe2/UGK9Hl5tksh6DJpOqNOk+e+XL2jZVIPuyqVZ1XcOz8lZCzR+V6VimIQUD
	A0usd96do6e/lqqGJbQlCP3r47WJ7Fd1iBnalhLsMwP/g8KxRMDgPFfjU20eGOPWOtlSqYzErxCU1
	IL2CGvFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI9ed-00000006vbK-2vWj;
	Mon, 02 Dec 2024 16:52:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI9db-00000006vM8-4B1l;
	Mon, 02 Dec 2024 16:51:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7CFD45C5DFE;
	Mon,  2 Dec 2024 16:50:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36240C4CED1;
	Mon,  2 Dec 2024 16:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733158267;
	bh=fBUEMjz+0P/kF8pp0HP+LWj3OKJjqJ67h1+3fPoQwrw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KfKDV+/rlMGK8H2CF9MyexBUGel/hkJXods3v8auZlpsrKq3OhE34ojMlXAeK2V8e
	 Az7Qc3d20kDInAAGTwOGuOGKcMUhw+bEGRotkX4WfaUGIDz1DmylaiBBOgfMqDEne0
	 EfngdNgQ1yb5US24I24yTs+cI2FoqS5bYfO4qB9IP6yz9NF+RgzuygwHnfqCserh4E
	 KBF5cXNQSt35fnX62Njx/rlnzisDb5LUhdoJYkdoDJSqUur6S1wjFx8ArUqDN8V3gN
	 0vNthRTDU0M3R7YmvbxWh/LERf21LkQoQHNwpvqJc26OWiXg3vN/J8OH/8iWXTKCCx
	 7J06PCyBsobJQ==
From: Mark Brown <broonie@kernel.org>
To: Jon Lin <jon.lin@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 heiko@sntech.de, linux-arm-kernel@lists.infradead.org, 
 linux-spi@vger.kernel.org
In-Reply-To: <20241120012208.1193034-1-jon.lin@rock-chips.com>
References: <20241120012208.1193034-1-jon.lin@rock-chips.com>
Subject: Re: [PATCH] spi: rockchip-sfc: Support ACPI
Message-Id: <173315826479.126887.9104664888049077624.b4-ty@kernel.org>
Date: Mon, 02 Dec 2024 16:51:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_085108_084358_CACF0D05 
X-CRM114-Status: UNSURE (   9.04  )
X-CRM114-Notice: Please train this message.
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

On Wed, 20 Nov 2024 09:22:08 +0800, Jon Lin wrote:
> Compatible with ACPI.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: rockchip-sfc: Support ACPI
      commit: e39531352aed30156b270a61ba075e5b8d3b8498

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


