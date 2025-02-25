Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DED4C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 20:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZSknL8Y8XzdJj6cAqzMlrju+40bU6595IgSp9gYFe18=; b=e4nr+BPhpcxtrIgpv9gDjaW185
	+B11BejRBmdJ9zXpXWqNYSxdbHSBfl7NGpSxhrR6ti3GZDL9PYLti4aIyLrMoKoC6306htFqQwbIi
	zJjIInRvIQYkHHxDcGqUyJZfml3msxm/mjFn1hoB3sSxClDiO8jPFe6Ub+diBkWz+DPKDEhIieBi/
	Q73GvirlxDYhYaSMbZsxyhWI76VvrPwgzkTEacCfD68WCYhrg/p+Z9+QYMZ14seKtIQEae2ONgo+O
	gdzRFrzNo2gVSmT7V1bboGFQ6JUAPgelazgysTXrFzzfSaQxZIGQ9XoeXGg22p7YawXHQJMO/B2j6
	Afy0+8yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn1ba-00000001Naj-1JNc;
	Tue, 25 Feb 2025 20:32:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn1IH-00000001Jvq-2hic
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 25 Feb 2025 20:12:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:Content-Type:
	Date:Sender:Reply-To:Content-ID:Content-Description;
	bh=ZSknL8Y8XzdJj6cAqzMlrju+40bU6595IgSp9gYFe18=; b=ZuLVRRnoUVkxzYZgk4lAD1wVYA
	wck0voiQ78aTKTAQznD+h6X433IO2U4ww14ySrqk0uHTd4WGExx6bEfaADMqzExQBOktXvECCxj+V
	tnCZhzSfqGnHQ7qi9eTKNM9b9BJOeJV031pSn7NgJzG+nxhPdYCnjRhPB23Cpd4275aEKdJtYvXvT
	IsnjM3nxxMaFQtJ77tqGGYn3eytfwEJbpccvWY3rIXPd/lVIW7Ujq0pG1eoWFhnjZhHS1Nb8UUlu1
	EOQ0AIvHN68dZYdXU43T3ni9FSX20LDqkuWimYr+zTKHd/1fA7GQolTQkV+IFe52fmk45b0bqQJJQ
	Cva1EWmQ==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn1IE-00000003P2h-26xE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 20:12:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3E7475C708F;
	Tue, 25 Feb 2025 20:11:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 941DFC4CEDD;
	Tue, 25 Feb 2025 20:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740514356;
	bh=yTCj5mHCtdBx8pk+52dg55Yg5D96C+PxN6w8CQznwjM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=qA/yQo2Dj7sATmTqu+FxRMZ65j9/jCkahdI62i/V40ioGuSi2VPnHu+ozuj0hCykM
	 7SwJsjXxnFwy5gAEVVto5RF/S13qmg4gmUdYBgf6i+zc8r0IROTfT+VESyZEPDRs4H
	 UxNacRkez6vE1G0S562m0LjxY9fD5f/Qub7y8BpjbWIkVKPsdJlRHbcAXQfPCJ4xLH
	 DQyQUfZ+U1hwVn5ZH6fcdjIQJJ7uOc1hu6AAK1njsVkcmXuyu5F1ItA39HdEWxd/qN
	 7p1JfHl5t6QAegMK+0wFDo2wggGt9kTyPga4LZqk3/r281/fkY6jUdkoUe6vqE6OGZ
	 cdwFm+tgF71yQ==
Date: Tue, 25 Feb 2025 14:12:34 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: will@kernel.org, jic23@kernel.org, lee@kernel.org, ukleinek@kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 tglx@linutronix.de, catalin.marinas@arm.com, daniel.lezcano@linaro.org, 
 linux-iio@vger.kernel.org, wbg@kernel.org, devicetree@vger.kernel.org, 
 linux-pwm@vger.kernel.org, conor+dt@kernel.org, 
 alexandre.torgue@foss.st.com, krzk+dt@kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, olivier.moysan@foss.st.com
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <20250224180150.3689638-1-fabrice.gasnier@foss.st.com>
References: <20250224180150.3689638-1-fabrice.gasnier@foss.st.com>
Message-Id: <174051415125.2971414.5163158019956863310.robh@kernel.org>
Subject: Re: [PATCH 0/8] Add STM32MP25 LPTIM support: MFD, PWM, IIO,
 counter, clocksource
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_201238_867919_BFAD05CB 
X-CRM114-Status: GOOD (  15.33  )
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


On Mon, 24 Feb 2025 19:01:42 +0100, Fabrice Gasnier wrote:
> This series adds support for STM32MP25 to MFD PWM, IIO, counter and
> clocksource low-power timer (LPTIM) drivers.
> This new variant is managed by using a new DT compatible string.
> It comes with a slightly updated register set, some new features and new
> interconnect signals inside the SoC.
> Same feature list as on STM32MP1x is supported currently.
> The device tree files add all instances in stm32mp251 dtsi file.
> 
> Fabrice Gasnier (6):
>   dt-bindings: mfd: stm32-lptimer: add support for stm32mp25
>   mfd: stm32-lptimer: add support for stm32mp25
>   pwm: stm32-lp: add support for stm32mp25
>   counter: stm32-lptimer-cnt: add support for stm32mp25
>   arm64: defconfig: enable STM32 LP timers drivers
>   arm64: dts: st: add low-power timer nodes on stm32mp251
> 
> Olivier Moysan (1):
>   iio: trigger: stm32-lptimer: add support for stm32mp25
> 
> Patrick Delaunay (1):
>   clocksource: stm32-lptimer: add stm32mp25 support
> 
>  .../bindings/mfd/st,stm32-lptimer.yaml        |  23 +-
>  arch/arm64/boot/dts/st/stm32mp251.dtsi        | 177 ++++++++++++++
>  arch/arm64/configs/defconfig                  |   5 +
>  drivers/clocksource/timer-stm32-lp.c          |   1 +
>  drivers/counter/stm32-lptimer-cnt.c           |   1 +
>  drivers/iio/trigger/stm32-lptimer-trigger.c   | 109 +++++++--
>  drivers/mfd/stm32-lptimer.c                   |  30 ++-
>  drivers/pwm/pwm-stm32-lp.c                    | 220 +++++++++++++++---
>  include/linux/iio/timer/stm32-lptim-trigger.h |   9 +
>  include/linux/mfd/stm32-lptimer.h             |  32 ++-
>  10 files changed, 554 insertions(+), 53 deletions(-)
> 
> --
> 2.25.1
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/st/' for 20250224180150.3689638-1-fabrice.gasnier@foss.st.com:

arch/arm64/boot/dts/st/stm32mp257f-ev1.dtb: timer@46060000: trigger@3:reg:0:0: 3 is greater than the maximum of 2
	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-lptimer.yaml#
arch/arm64/boot/dts/st/stm32mp257f-ev1.dtb: timer@46070000: trigger@4:reg:0:0: 4 is greater than the maximum of 2
	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-lptimer.yaml#






