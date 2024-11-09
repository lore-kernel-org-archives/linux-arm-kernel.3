Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA957D3C543
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 03:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F8Eg0pOZHvy+BIOj1wLUHKVtvI6GzlLFIyNlz2ibqtw=; b=wzxm9FrRmWxiM0IkoraE0zmpYk
	sOAUneaUqUVuaMim34zjRFz21KRDIUyO0GV7+mojAUEJURvQ3LVaOBVnyEMbpJLhfRqPy4oueHBf7
	LKbgaCphpUwDiKjLnOkbGRvMtwos86wYoVrqm1ZLBy9l+SZPaT4OT0JeEBK9AlkZhL4byrlWrsk/a
	eHFRM4n1AsykYgSmm92oLDUZledYOdY05z6S+RkEeOdEGUFNTzkV+gKPJGgNVskKGrvvxkPVgWb0R
	fhd7rKH2a7Zk+Osa9gQiTKt7Pd68I7NuUcBvdK9UKfINL9xR+V9IgPNZl1rIpNmWbr628lgQEQV82
	QIbEQYzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9byi-0000000CZvH-05SX;
	Sat, 09 Nov 2024 03:17:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9bvG-0000000CZY4-22zp
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 Nov 2024 03:14:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 67D5E5C5456;
	Sat,  9 Nov 2024 03:13:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE1D5C4CED2;
	Sat,  9 Nov 2024 03:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731122041;
	bh=+fO1Ep+DCuJGkt1paLe1xt9jDCApzKVVE3M9ZNlZNOU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=oMAAu6Bw/sJeCPto/7oDxFXHp9Az63CqCb/czvofrz0f9l6/UBKFJYlABrDYC0cLM
	 Ibn7/Y49pOk7Ly03Qd3dGUIPuiCMC7Fl9JfDz8/mz/lV6LGL8e0ThZpIygFEDh+0+6
	 eB8zjX4WbztkB78yKPMf78QLPv5rJddJGLd1gBht0VmiPUh9vZlQyaGkmmp/+P7SGt
	 JR+hKwZUpPY1LLW08y0Is/tQsDAhnPKtw8yQEMCXVb7au4VzuDjCPc06hAtHoEdcRG
	 XJiCpV+6jlzvEVEmxMO6t8DSsXOA5wqQ/DS+S4sJtVAv/w7Mn8wpQHl85IeCF5mpDR
	 zDoMQlOw9fyow==
From: Mark Brown <broonie@kernel.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Olivier Moysan <olivier.moysan@foss.st.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20241107155143.1340523-1-olivier.moysan@foss.st.com>
References: <20241107155143.1340523-1-olivier.moysan@foss.st.com>
Subject: Re: [PATCH 0/2] ASoC: stm32: sai: add stm32mp25 support
Message-Id: <173112203864.168194.12196332639413190423.b4-ty@kernel.org>
Date: Sat, 09 Nov 2024 03:13:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_191402_610577_6BF6294E 
X-CRM114-Status: GOOD (  12.94  )
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

On Thu, 07 Nov 2024 16:51:40 +0100, Olivier Moysan wrote:
> Update STM32 SAI driver and binding to support STM32MP25 SoCs.
> 
> Olivier Moysan (2):
>   ASoC: dt-bindings: add stm32mp25 support for sai
>   ASoC: stm32: sai: add stm32mp25 support
> 
>  .../bindings/sound/st,stm32-sai.yaml          |  26 +++-
>  sound/soc/stm/stm32_sai.c                     |  58 +++++--
>  sound/soc/stm/stm32_sai.h                     |   6 +
>  sound/soc/stm/stm32_sai_sub.c                 | 144 +++++++++++++++++-
>  4 files changed, 216 insertions(+), 18 deletions(-)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: add stm32mp25 support for sai
      commit: 8509bb1f11a1fed710271631c2e06fd66452f510
[2/2] ASoC: stm32: sai: add stm32mp25 support
      commit: b3ea5bec7519027a8e0d6c5c3a313e2ab11e6b2c

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


