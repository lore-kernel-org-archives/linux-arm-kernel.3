Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05E0ED3C543
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 03:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QM2VQqTxBOxhB3XVzb9nVX/0UbLbVhEpnTnt3rqFsuQ=; b=AGd6wZGtY2nYEbb8epiBRx7MDk
	uTM1zlgJOYMsjgI8uuGP3c1HGTNekLfzwbB+0BziRLwxSaGX46gsJyEvFe7h8ZaC91xs8ik26aMc7
	OEpFGRVFTBfzAerI+Cfe/IYtRy9uvCnm0Bq+1BJvvlNBo/FD1bnpfHi4v2/GQh+UcxdcEp83sJRBd
	U1Tpa0LkLp4H8Mxtm5DjNru17zVw57iYZSbgbIQr2NUGHF8u9XCEmRfE9kOZSLh5b+SXk18cKD1Qk
	sVj/wQtLDaIcXpPem5wm7C0X9CZQ/9KfNpmnzYTgxmf5/ojs0r2PzJLRpJRLT8IEBoyXLGE32a4np
	4ZYsdbbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9bwz-0000000CZiy-2tmn;
	Sat, 09 Nov 2024 03:15:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9bvE-0000000CZX9-0BoO
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 Nov 2024 03:14:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 33D8A5C3DD7;
	Sat,  9 Nov 2024 03:13:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A38A4C4CECD;
	Sat,  9 Nov 2024 03:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731122038;
	bh=3iuSVudXSVZ71knUjkoNCSsIOWru8sa9e6szXIqlfzc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=b97qmbzxHSMDPTebIajbloR6t/MitYhUl5O/LUAQbMy+TsgopB10WpUI/9piWjhES
	 V1gnbjuYspRzOZipR3l2z2IW3A1oEfqPsHD3TA2AUyem0X5uRIrkPxVcpdeBH8ryDl
	 HEm9L0QOeZC4/7PBHQH2qi87weYV74syaBNRqV9nutFYnq2xcwVPLB0Yd8NUOY600N
	 Iae6osyixnV+3cici8b6Ykjuc4JGPYmOuFFvymAzlMzVVAtxxQuXBHwaIXxylf2WaF
	 FZ/7QdV9bk6NODxQ4FOPhUh3ydjxvvM2+LABxhYipTZuf+6fj9UcPIrK/6pLIpRXIe
	 vMo2mPAowliyQ==
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
In-Reply-To: <20241107144712.1305638-1-olivier.moysan@foss.st.com>
References: <20241107144712.1305638-1-olivier.moysan@foss.st.com>
Subject: Re: [PATCH v2 0/2] ASoC: stm32: i2s: add stm32mp25 support
Message-Id: <173112203540.168194.9961366675088520447.b4-ty@kernel.org>
Date: Sat, 09 Nov 2024 03:13:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_191400_163495_F25E3463 
X-CRM114-Status: GOOD (  12.42  )
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

On Thu, 07 Nov 2024 15:47:10 +0100, Olivier Moysan wrote:
> Update STM32 I2S driver and binding to support STM32MP25 SoCs.
> 
> Changes in v2:
> - Rearrange clocks and clock-names ranges depending on compatible.
> 
> Olivier Moysan (2):
>   ASoC: dt-bindings: add stm32mp25 support for i2s
>   ASoC: stm32: i2s: add stm32mp25 support
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: add stm32mp25 support for i2s
      commit: c69b7edc10d2fff4bcb3dd464ee26cbf22818fec
[2/2] ASoC: stm32: i2s: add stm32mp25 support
      commit: 125d0f698ad500b0092812e52a6c342ba055ae68

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


