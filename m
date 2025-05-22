Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 871DDC54E65
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 17:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nrSmv/uqSIEmzvd2mFK7wDb4dLulAkjNAXb2Kh/wG9E=; b=UazTRDaJrL+jwRvrap9WQWZ3P9
	F8AkCYYKSfra8OJfJW6HqqqnNkYMkxXZPh25Wvr2jILi/YvJ3RqcXT/37O3C6phr+ILkR+lYIZY1a
	XFBG1PzgblUVuqsOH8OVw3wLTzCcSbi4v8LtTFRRV+mksWMqgZUhpUnN+Sc/TEu4+QP+pqZWDsGgU
	GkZXYcUCORUnD5N/ApS37wgzakzmSQVdKU88Egjdp6wlv+Tj+FNUNEMOFQUAZViGiLe+hiYif3kj7
	7XoKfPCnQ/8DetDP1jPGlvqgptpCWoFc7us7AHIJFqlNnp21yWTRg9NBR69ECqXoTnyRzk5y0wHzP
	PxIiSYVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI9aP-00000001ilE-2Br5;
	Thu, 22 May 2025 17:20:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI9YO-00000001ica-32Xt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 17:18:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CC4626135E;
	Thu, 22 May 2025 17:17:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE42FC4CEE4;
	Thu, 22 May 2025 17:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747934279;
	bh=zt7+l4oSZuD0/9FmyoQM5JpiKAJhKIgjL/L3nrauO30=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=WcmhuwsH+v34k/Mb7xq3B1A/GA8v8cea0e0pzwWPS7qTdcydrzxYM03u5sfH9edMn
	 RwANKtFAmlRZQ1NmnRjLlMGqrCcpBYxNrfcIGo8Ofxon593uorq8EhP29v9lr2vrRC
	 IZVVm5xfWLP9Us1raF693tWH8sGzc6XB+Mo8cSUicgh331lSowInY+jt67j1+fi51h
	 w6OUim4hdydsjtdnNSIwEq/P+hQQCPf3IO8+2AETOrwxM9UrOaSnQpNk0R1SKzbthq
	 KmcsLtX9RIKrBMFSCkvWbUw98p3F1L5XAMXGhfupduroYkw1DEg3ToEaFvxYWiwM9G
	 GxsrYe+5kCe6A==
From: Mark Brown <broonie@kernel.org>
To: Vladimir Oltean <olteanv@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, 
 James Clark <james.clark@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
 NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Chao Fu <B44548@freescale.com>, 
 Xiubo Li <Li.Xiubo@freescale.com>, Lukasz Majewski <lukma@denx.de>, 
 linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Vladimir Oltean <vladimir.oltean@nxp.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>, 
 Larisa Grigore <larisa.grigore@nxp.com>, 
 Xulin Sun <xulin.sun@windriver.com>, 
 Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>, 
 Marius Trifu <marius.trifu@nxp.com>, 
 Ciprian Marian Costea <ciprianmarian.costea@nxp.com>, 
 Andra-Teodora Ilie <andra.ilie@nxp.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Stoica Cosmin-Stefan <cosmin.stoica@nxp.com>, Dan Nica <dan.nica@nxp.com>, 
 Larisa Grigore <Larisa.Grigore@nxp.com>, 
 Stefan-Gabriel Mirea <stefan-gabriel.mirea@nxp.com>, 
 "Radu Pirea (NXP OSS)" <radu-nicolae.pirea@oss.nxp.com>
In-Reply-To: <20250522-james-nxp-spi-v2-0-bea884630cfb@linaro.org>
References: <20250522-james-nxp-spi-v2-0-bea884630cfb@linaro.org>
Subject: Re: (subset) [PATCH v2 00/14] spi: spi-fsl-dspi: DSPI support for
 NXP S32G platforms
Message-Id: <174793427263.150041.3711005972084134023.b4-ty@kernel.org>
Date: Thu, 22 May 2025 18:17:52 +0100
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

On Thu, 22 May 2025 15:51:29 +0100, James Clark wrote:
> DT and driver changes for DSPI on S32G platforms. First 3 commits are
> fixes for various edge cases which also apply to other platforms.
> Remaining commits add new S32G registers and device settings, some S32G
> specific fixes and then finally add the DT compatibles and binding docs.
> 
> Tested in both host and target mode on S32G-VNP-RDB3 by transferring to
> an external device over spi1 using spidev_test.c
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[01/14] spi: spi-fsl-dspi: restrict register range for regmap access
        commit: 283ae0c65e9c592f4a1ba4f31917f5e766da7f31
[02/14] spi: spi-fsl-dspi: Halt the module after a new message transfer
        commit: 8a30a6d35a11ff5ccdede7d6740765685385a917
[03/14] spi: spi-fsl-dspi: Reset SR flags before sending a new message
        commit: 7aba292eb15389073c7f3bd7847e3862dfdf604d

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


