Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE3DFC18E7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 17:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8k7MxGDGXdaouFHEvPH75JVb3S1twpfAXVhSuWav9UE=; b=ncwRGXoud0TykzAgE7j8NV7EQO
	WWal5MLAwwXtLk/P/89DTBEHuim7IjUOTc5pVd2N72H3EtzgSm4a8efCD7FIHJUVZZ+0AXgrI3leR
	gzGx7da4Xig041j5xTpOE808MvpmGS3O4dezJ+UmSOmsamjvdDfqx4obA33Xk21j6u2ulddwt0hLP
	7NLgK6o+6sHoqVbkA+pJ+j5YAuQPUZ6pFdWiL1HyCQRUU+sJiGLHFPT+msIkaGZPYZhMl5KZYKfRI
	lzRL2+rIvkL1WOiM+JuXRRF5Yqa1WvK9Jmxx+9k6sJX7AFTerIMtAgkCtoXoRP8d4Dq1CDwIwBMmx
	bi9GDHGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmyZO-00000000Zxh-19AM;
	Tue, 25 Feb 2025 17:18:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmyLT-00000000WYP-2Bw6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 17:03:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A24D55C7316;
	Tue, 25 Feb 2025 17:03:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FBA1C4CEE2;
	Tue, 25 Feb 2025 17:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740503026;
	bh=QjKx6PnEreTmGevRICTv66dbF9KM4R8MO1GuCfDDlD8=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=IrjWj1lqai1dG0x8uiajXo5PpZ/zYHo5eXSqcXl9oLB7JfeQQTLUWEuqnK6I75Y7P
	 rmAFAOp4o6QtQxuhGuqBozC2ASpOASgneHHO9tUc6FdbckibMhVCb8+QI7qrXpLMdw
	 zsbQNhcRkwYA5BVYYA+bf6siRUzWL1GlxFQa9cIrwrXfKfML8QgV8vFbGQovPCy35X
	 rC4qFPjZleOIP3NDvk5XoA5X5lob+AqoQDq4Bg9ojP342e7usFCVJ4m3lUmAZIoS8z
	 qa8PgXzUR0HGrkpjZvJvDYJQoPSnG/jXkhHECm2b8coLdECTfUDGpV6PQ1Cr7oEUJT
	 rX0Cz226bssxA==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
 linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, devicetree@vger.kernel.org, 
 Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <20250211035737.3886974-1-shengjiu.wang@nxp.com>
References: <20250211035737.3886974-1-shengjiu.wang@nxp.com>
Subject: Re: [PATCH 0/2] ASoC: imx-card: support playback or capture only
Message-Id: <174050302203.104078.14585047916828539805.b4-ty@kernel.org>
Date: Tue, 25 Feb 2025 17:03:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_090347_634918_2E88EDDB 
X-CRM114-Status: GOOD (  11.84  )
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

On Tue, 11 Feb 2025 11:57:35 +0800, Shengjiu Wang wrote:
> Be similar to audio graph card, support playback or capture only
> for imx-audio-card.
> 
> Shengjiu Wang (2):
>   ASoC: dt-bindings: imx-card: Add playback-only and capture-only
>     property
>   ASoC: imx-card: Add playback_only or capture_only support
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: imx-card: Add playback-only and capture-only property
      commit: 8c6ede5cc4226fd841f252d02ab0372cb92ee75c
[2/2] ASoC: imx-card: Add playback_only or capture_only support
      commit: 1877c3e7937fb2b9373ba263a4900448d50917b7

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


