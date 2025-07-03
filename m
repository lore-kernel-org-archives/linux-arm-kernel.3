Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D44C83F05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 21:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q4igWQZKqN8f1ZpvNdpopowoaBAOy09IG44SgyEbavM=; b=Kbtp4sq1oNNor8E08wBlsK38PO
	QJctIcL1y3EfHFTUkEE5z7sn9Gd/jQ16tc7/IkPO2EyZHaIOB9cjor6snTov75Z/VQ/65jECz/XXV
	bP8J/28Bq63W9xXL1eBLGCz41Y0bSnKAAFTcp8T2tGxCNNqRiq8l7FPN8RWBfHE7pSB3cdyZDWITw
	BrNly0NTCExFMMAb3I+Ff7gZVM4JYQ+f0i4PhirqEc17FOBGMOVfZpY5UU5ZFWYLKrjV4YttdqT1y
	U/9w4Cf2+YgrcvfcgLsjuwglZxOdZ7pvKO0HbMPy0neKtfo9/NJYx70xCuvsbKCh993TddDJ8rxj2
	GmNPif9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXR2U-0000000CXmq-1dGF;
	Thu, 03 Jul 2025 21:00:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXNSB-0000000C5NI-2yH7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 17:10:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DBCFE5C3F9D;
	Thu,  3 Jul 2025 17:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEDDBC4CEED;
	Thu,  3 Jul 2025 17:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751562630;
	bh=VBNBTHMTAZlDZfjt9bZrrU4QHStDFo99Vh/bJIt/n/s=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=fkVZJJm1iGyGdp1Ja5Tu7Hch65JO16hxP0lASxwcxLGUwtJQu5KhA+/rbghPX8WOd
	 n7HF7bEC35BDP86O+2jDjpro7I1wSGc0l8/kzK2wy2Wp8jyIWDFDNTZHSw9b5iLNcW
	 Yyir5cL8JKJnM6WonM33j4aBQh/yJEW2ZiQV2ybl8LxoLn4vYm2mXZQYHT6Z0vMhsZ
	 BxiIZSdLAnLWt1XC8t/lQzg1aQOHbpv0mR8aP0/jNKauYtj3QPVvTzy1p2CGCjqp74
	 PRciY3DOiw0Lw2YQ0dr8aEsMBosEPslC8LW/bMSi26BkNmP4UeWl3j7o/KyDf+Wffj
	 NsheR+fjLrhCw==
From: Mark Brown <broonie@kernel.org>
To: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
 festevam@gmail.com, shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 cristian.marussi@arm.com, peng.fan@nxp.com, sudeep.holla@arm.com, 
 arnd@arndb.de, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <20250620055229.965942-1-shengjiu.wang@nxp.com>
References: <20250620055229.965942-1-shengjiu.wang@nxp.com>
Subject: Re: [PATCH 0/2] ASoC: fsl_mqs: support MQS2 on i.MX94 platform
Message-Id: <175156262671.651944.3516186569995786227.b4-ty@kernel.org>
Date: Thu, 03 Jul 2025 18:10:26 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_101031_800915_DDEBB893 
X-CRM114-Status: GOOD (  11.18  )
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

On Fri, 20 Jun 2025 13:52:27 +0800, Shengjiu Wang wrote:
> ASoC: fsl_mqs: support MQS2 on i.MX94 platform
> 
> Shengjiu Wang (2):
>   ASoC: fsl_mqs: Distinguish different modules by system manager indices
>   ASoC: fsl_mqs: rename system manager indices for i.MX95
> 
> include/linux/firmware/imx/sm.h | 20 ++++++++++++++------
>  sound/soc/fsl/fsl_mqs.c         | 11 ++++++++---
>  2 files changed, 22 insertions(+), 9 deletions(-)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: fsl_mqs: Distinguish different modules by system manager indices
      commit: 9931d2899eec3737f4e4fa9fc900be7329816e94
[2/2] ASoC: fsl_mqs: rename system manager indices for i.MX95
      commit: baee26a9d6cd3d3c6c3c03c56270aa647a67e4bd

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


