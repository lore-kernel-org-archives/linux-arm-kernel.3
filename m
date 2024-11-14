Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE4AD68B31
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 15:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oublD+O6Qp3hgaKTR+8a0GSB7bBLcFDaiuPsv7MfQeQ=; b=Pn1Nk1BexYU4ZG9AR4FCWl/YP9
	VJbeXoSxOUdGdQCuMGGFtTlBI/Nv9F2rhjIL6+MAR8izKE84mMO9y3lyp9eAQGXl9CkjQa8c0/oUl
	6ZAxlpq7nVxou4k8rsAc63HS872VPsKjtW0NrbTp43p0WL4WQAQQEkm8pQ4CRFwL5+4FNrKkcXe1g
	O1tjU2Dew3EVxvzN8JJrT19fv/zdUV69FJPWUajTBo/HVI1UsK53IEkjkXuISREclei6L5fgLUCky
	EomKaaqb5x7vQnnuCJxNyqP1qHbi1vWeUc10eQYCDGLJsIAv1VLFMoi2YLWoHO0DyK5rTZoz9S7vW
	1uDFnxzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBbuk-000000003C5-37Bs;
	Thu, 14 Nov 2024 15:37:46 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBbt9-000000002Yb-2DHf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 15:36:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6C9F4A4150A;
	Thu, 14 Nov 2024 15:34:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1C9FC4CECD;
	Thu, 14 Nov 2024 15:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731598565;
	bh=c+QtyugjOQ3i5dvHqnYIoLWX152YPjrTGXRzntFQuQw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=OVNQnGG4/atn0pvBVfywdQNfSoFZUzXEKhLrySyKPqBzmyY+ARm8iuYuhVfpeHUJW
	 WEWVQbIbc7Rw5XZDGykgKrnPsOig8GBILoHY/LjsZJqNCGFa/tk51XrMN5Qo+VXaj9
	 xkRrooSUGTm+F4UM0ZO/5XEDirB7nL/x3rK103a9hvMMQtUvyMimqDMdmrI3/ZZGsV
	 8hWKe6HvmOjIPYeoeFwrVsQGpqrXdgOImj9KbL5VEavs8w2DS0enqg0VYgrfie6iTD
	 FcyXwstDXwBg4RoGkXvWVqNt9n2k3ogeQ7nyuks/SjkDhhazwDMf4U4flygTy8F8Ng
	 arcklwJFfExew==
From: Mark Brown <broonie@kernel.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Olivier Moysan <olivier.moysan@foss.st.com>
Cc: linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20241114102851.2497942-1-olivier.moysan@foss.st.com>
References: <20241114102851.2497942-1-olivier.moysan@foss.st.com>
Subject: Re: [PATCH] ASoC: stm32: dfsdm: change rate upper limits
Message-Id: <173159856240.505512.17591660886281127681.b4-ty@kernel.org>
Date: Thu, 14 Nov 2024 15:36:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-355e8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_073607_677399_40253AD9 
X-CRM114-Status: UNSURE (   9.43  )
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

On Thu, 14 Nov 2024 11:28:51 +0100, Olivier Moysan wrote:
> Increase rate upper limit to 192kHz to reflect the rate range actually
> supported by the STM32 DFSDM peripheral.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: stm32: dfsdm: change rate upper limits
      commit: ba888450828befb0607219f34c03aa8645625447

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


