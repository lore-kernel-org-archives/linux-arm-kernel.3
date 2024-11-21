Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E97CAD7877A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 14:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sm+Axe2p7mbA5AmAutLZwJKn6ixloQ8vsNngI7O3KRQ=; b=4WbkGCvLqa31rTcPzvR/6C76wW
	mhF7EvaUMQ5BGsnD0NW1pxc6wUwM1wIhTBaafqjMqRXSgZ77OU3iRh7uNP44TizCgdl8YQeCOnklP
	1qmK4P5GM7yxkoQlSCuUmFZm0Ce+ztRP1I2TI4fmDn6mD8/8LOdlKF8Vg/Cdwf9vNScxuWVeCqPNo
	xfO4UNnAe0zTbUdQROd/zVmUhzBcDiVJbJyCOHoLFO/8fTJEi61jPNTsM1dAgmxfhqZ8Ttfs/0bkq
	pRgkOsJcSLR74+kqT3w9/YvLKvwuuy8gDY5jzLUNQReyVypNYLluWJTsrfw1TqExb71UYITXLJ6dl
	Yph0mv3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE8dm-00000000HmE-2dY8;
	Thu, 21 Nov 2024 14:58:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tE8cp-00000000Hcr-20ko
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Nov 2024 14:57:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A8EA75C4B01;
	Thu, 21 Nov 2024 14:56:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73B1CC4CECC;
	Thu, 21 Nov 2024 14:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732201062;
	bh=gMlYzKO9uoaDT2cKlgIGWz4G5uCpBb+cq8AaPzgfmJg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=uQ0Pwf4jcpJEpbiD4EnU+E7ZrtSK2F/EOvWvsYUj8AXk+qU8/a6rqRJlC1fNkWnQ2
	 He+FAp//l4mjdA83XBfbUN1JbLk4QrC3p9hitWinXgievFVWAQ7+570MoAdCv7DjUs
	 rVVc2dG8Gu5Y037YBwKMAeVsm7HcHxqVrGC9ea7ZNGvc1BikVMC33f95WB11OekoP7
	 BO7+LxtZYBCRw9D8ttJ479O8pXVLVwEq4fLQTaGjEl0pQ+D/mgXHq71vJy58Ho6FWx
	 5ZjC8dXnuUpynxxhRcSVnlqk4FR0WRRNPurCRTmf+0bQ8YC6wHDItJjQx0D5U8CbLX
	 Z3omXZCXbLdxA==
From: Mark Brown <broonie@kernel.org>
To: linux-spi@vger.kernel.org, Antonio Quartulli <antonio@mandelbit.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20241115220202.31086-1-antonio@mandelbit.com>
References: <20241115220202.31086-1-antonio@mandelbit.com>
Subject: Re: [PATCH] spi-imx: prevent overflow when estimating transfer
 time
Message-Id: <173220106016.54863.10499187778967280458.b4-ty@kernel.org>
Date: Thu, 21 Nov 2024 14:57:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_065743_564733_4D7CFDBE 
X-CRM114-Status: GOOD (  12.46  )
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

On Fri, 15 Nov 2024 23:02:02 +0100, Antonio Quartulli wrote:
> The words delay is computed by multiplying two unsigned ints
> and by adding up the result to a u64 variable.
> 
> The multiplication, however, is performed with 32bit math
> thus losing data when the actual result is larger than UINT32_MAX.
> 
> Fix the operation by casting the first operand to u64, thus forcing
> the multiplication to be performed with 64bit math.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi-imx: prevent overflow when estimating transfer time
      commit: 9e141955ede223d82251a59644ff9448a5aba580

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


