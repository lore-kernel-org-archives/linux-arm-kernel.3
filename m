Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F1B1F41800
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 15:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TdH8bvkNIpDog/K3q0ZzGRX8OtZ/OKv1fjCXdvgPWAI=; b=xMnuilTYZtlhkJM1aXYQb9HU0B
	4XqJl13bXUXwM2WnKdMPHchEZycP5MmuQV1FYnVDH3FRyhkmZ94IO4//ukhPdCGjygBCcqTCsqTK3
	YyqnFkJqbsaDlyUhhZdgxy9Sm3WEXc8+P1Yh1uRzXfM13ddy+hOurUOjfhKz+GT6gG4tYEXJVaf2r
	PZAaljtgD+a/VMN4eFHJ+C55shnyMO38ISvTPApVhfksiEm/GVtQ9H1TKn9TZjTzGHR2e5PZg0A/4
	NZsj+bDKF2/RL2iIAd5gLy7IaaRDHsO0gmEqtKa9aTw//IDPuw3wgWeqMkhCvuhd0O/mEqWe7fOMw
	rzubYQZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzcCf-00000007YgL-38pz;
	Mon, 09 Mar 2026 15:07:29 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzcCe-00000007Yf1-0ucT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 15:07:29 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-5a12f88d839so5373684e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 08:07:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773068846; cv=none;
        d=google.com; s=arc-20240605;
        b=WqtsRQ04ZOXdj3jIy6agXWBcxZ5n+fMH+F8ZVC/wwkBUD1WeF4WwyIMt1u8dSX5p9b
         cs3JacgE8xKiMGqxg49Wv6KDTLIjUmj/pHnrejiphRPsvLWfDj5C2Y/GTgv18aUbbAYn
         qTnePfB8XF5CrLDlozEp1ce2tcPOgD0uHZ3jFItimTNRhI2HSH5XXeZ06dn1OQq9CVpo
         3ayGJRAjbDJhcfZJCsOaRcWPMdY07tM17c/dpAf5JKsBCGYZfk2exJGppxU9W5SWl9rN
         krMwMmAOLapGX7WcHma+ja9hf2ZY1aNHyG8+cxFmOXliS52XjIPAM32d+UW871y2meNt
         sPmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=TdH8bvkNIpDog/K3q0ZzGRX8OtZ/OKv1fjCXdvgPWAI=;
        fh=4JBOaS/SNoxtl1OAEeZ88tchnbAHJksyHHuKGPYfcqk=;
        b=SEyMCDHAF2X887qjdneo6FxgDqlnE+4q0ANPjYjeYYOH3PFbIJ4L37T7eJMaV3TtJj
         Sbhd2UfOcU/DYzWBxwfXuEhh4TS3MMDoBK/ZpEe3Zy3itdhX6/766IXjn7MH0fU8YNIc
         PGSf2c/rNyHQOx48DoQIfQskkQbs6k6q5kh7CqUPG0Alj++sSdy28SjmBba+kc9WmfLy
         b4yMyURADDbsR1OHYQPOmDRutqGxjebmHbUhF7JI50rXRzV4XhvvaBuAe5sBNqF6amly
         V9/LFgi5K2aPreIExPeR2iwXl+edILvPNJPysGJv7AT4CmTyEeDycMtrLxEjgE4MMbg6
         hrQw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773068846; x=1773673646; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TdH8bvkNIpDog/K3q0ZzGRX8OtZ/OKv1fjCXdvgPWAI=;
        b=atiAKm9gsJWUGjsaUUE6mtdJmH3t5MBF6HZy5xg7s2NqsVzCuBIRpRM5dnpbkbwIt+
         o4YzP7dJZucVmYr96XLwQ22dgMSOb4enAS0bXiT5noZBvdUEp3Ywwoe6gh6sJB4D0KYV
         8UDvx3Im+1iIgp5Wo/pxrGeBb5rsLUVeTBqmMVOiqoNOZX2fiErilQP4QkmnupolpO1m
         i+1FPxLw+1Ub5aaVXVgwXVZZSYvOpis72ZNIrXjx6UYVRdiL+k8x4VfvtOAHuDuwnpy6
         Fs7A1QEKgfj4/padXs2SiWlI8dfVJE9/JXycZZHsVabW6BwCy9AGymYzDJ1y1pyLVQcN
         qKdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773068846; x=1773673646;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TdH8bvkNIpDog/K3q0ZzGRX8OtZ/OKv1fjCXdvgPWAI=;
        b=SEVfFLDWM1sj7mp96QfIW9An2VepB4i6UYwwh5Q4aoYBu1ZqB+w4cp6iUHVsaS2eVw
         nsr30daPJzGJTZphGxi8EZiEKdQ3fs19VcJ4XannP2FkM+U9x3ed2q8Jj+bNCbly+AbF
         0OIG4sfkvhLg4fYgoov6E2ekcsfaES9iQxtZpwx985rMMQgDDpb6UBxTcE33/lS0GAVb
         y+dYGg+pz8/gBdPy2Rkf4MgIaOvVfvrvRLgQuJlHzE4QD7t2i+TjiBk5YiO0ovArTn0E
         bvyOdLRWYxZYJadUZMSGAk+arN4LWcAMKzWRnPal9koDJiQfoOuDEurIU1HS6Jf7P9nO
         24xQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNygm2Bi4ma3eG2JpH577NMN/yhFtiyXTwLVSpUqr+6qegs0oSUknh8ZZKjlbfp5Fz++XLMfMZ1kEqMW0RljAS@lists.infradead.org
X-Gm-Message-State: AOJu0YyGlb3li6KTVPlfKTCegkFIcYHjHXctRRCLgjYTgsh/9LJLXHvI
	Y2A7bB+d+jX09mdq/YSqowD0rqJStiriaCY8iCjG0cGt1n//yBB+xpFBhwjkEx6LGVeuvdihfyM
	ltFUZ4V1mKWBgS4wuNEu4L8fVz/oCLuDRENQNi4YOJA==
X-Gm-Gg: ATEYQzzrxVhrdrWRLfF4o2jCUQcm/q9ItTCT7fMEcJblT4pSHWVXAZfOoRyQv2a7CXo
	rIHjo0NZORr8Jd/O08Hy7JSmqIDi966cRkrs11xCxELifefyEJLrKCrpBor7XvFF89mjZ2Gjfyy
	1Aw+W08WJaKJ8Ud5c0sOYuLkSfMu/+/iJcDQeCZqFrqH8NPVZZNZkGPfMDFvzMQj0V4t9Wi+dda
	B6cgrr252e4blNg780eepbhPL5fzqnjUAcqlCCQ0VatS1ORRwjOrO5GEjroLJUKF9AMT4PYMMOE
	2DGSDFzZ
X-Received: by 2002:a05:6512:3409:b0:5a1:2a71:cc3b with SMTP id
 2adb3069b0e04-5a13ccb1aeemr3618408e87.18.1773068845876; Mon, 09 Mar 2026
 08:07:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260309143411.8231-1-ciprianmarian.costea@oss.nxp.com>
In-Reply-To: <20260309143411.8231-1-ciprianmarian.costea@oss.nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 9 Mar 2026 16:06:49 +0100
X-Gm-Features: AaiRm53zSNZD-rgavB1hXZqnC71GE3J4BBqG9ZBYLAtj9oAS6JeEy0pPrIt0G5A
Message-ID: <CAPDyKFof23uOBe7duOLuFJ=qd8bv8f6ryFWbrPcTFB-Jg4ZQTA@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] arm64: Add initial support for NXP S32N79 SoC
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Haibo Chen <haibo.chen@nxp.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Shawn Guo <shawnguo@kernel.org>, Lucas Stach <l.stach@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, s32@nxp.com, 
	Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>, 
	Enric Balletbo <eballetb@redhat.com>, Eric Chanudet <echanude@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_080728_290570_E58AFA52 
X-CRM114-Status: GOOD (  22.32  )
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

On Mon, 9 Mar 2026 at 15:34, Ciprian Costea
<ciprianmarian.costea@oss.nxp.com> wrote:
>
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>
> This series introduces initial device tree support for the NXP S32N79
> automotive SoC and its Reference Design Board (RDB).
>
> The S32N79 is an automotive-grade system-on-chip featuring eight Arm
> Cortex-A78AE cores organized in four dual-core clusters. It is designed
> for high-performance networking and gateway applications vehicle
> architectures [1]
>
> Hardware features included in this initial support:
> - 8x Arm Cortex-A78AE cores (4 clusters of 2 cores each)
> - 32GB DRAM Memory. 28GB are usable and 4GB are reserved for ECC logic
> - Three-level cache hierarchy (L1/L2 per core, L3 per cluster)
> - GICv3 interrupt controller with ITS
> - SMMUv3 for IOMMU support
> - Generic Timer
> - IRQ steering controller
> - PL011 UART controllers
> - uSDHC controller
>
> This series also includes the necessary driver updates:
> - sdhci-esdhc-imx: Add S32N79 uSDHC controller support
> - irq-imx-irqsteer: Add S32N79 IRQ steering support
> - irqchip Kconfig: Add ARCH_S32 dependency for IMX_IRQSTEER
>
> Future patches will add support for additional peripherals such as
> networking controllers, PCIe, and other IP blocks.
>
> [1] https://www.nxp.com/products/processors-and-microcontrollers/s32-automotive-platform/s32n-vehicle-super-integration-processors:S32N
>
> v5 -> v4
> - Squashed irqsteer 'Kconfig' changes with the actual driver updates.
> - Fixed tabular layout in the irq-imx-irqsteer driver
> - Added received 'Reviewed-by' and 'Acked-by' tags from V4.
>
> v4 -> v3
> - Added missing Signed-of-by's from one commit removed in v3 by mistake
>
> v3 -> v2
> - Split S32N79 SoC dtsi into separate standalone commit
> - Renamed a memory node in the S32N79 board dts
> - Fixed IRQ STEER DT-Bindings support for S32N79 addition
> - Updated S32N79 usdhc driver support commit message
>
> v2 -> v1
> - added driver changes required for S32N79 uSDHC support
> - added driver changes required for S32N79 IRQ_STEER support
> - updated commit message for uSDHC dt-bindings
> - implemented fixes for 'dt-format' tool findings on newly added S32N79 dts files
>
> Ciprian Marian Costea (7):
>   dt-bindings: interrupt-controller: fsl,irqsteer: add S32N79 support
>   dt-bindings: mmc: fsl-imx-esdhc: add S32N79 support
>   dt-bindings: arm: fsl: Add NXP S32N79 SoC and RDB board
>   mmc: sdhci-esdhc-imx: add NXP S32N79 support
>   irqchip/imx-irqsteer: add NXP S32N79 support
>   arm64: dts: freescale: Add NXP S32N79 SoC support
>   arm64: dts: freescale: Add NXP S32N79-RDB board support
>
>  .../devicetree/bindings/arm/fsl.yaml          |   6 +
>  .../interrupt-controller/fsl,irqsteer.yaml    |   4 +-
>  .../bindings/mmc/fsl-imx-esdhc.yaml           |   1 +
>  arch/arm64/boot/dts/freescale/Makefile        |   1 +
>  arch/arm64/boot/dts/freescale/s32n79-rdb.dts  |  70 ++++
>  arch/arm64/boot/dts/freescale/s32n79.dtsi     | 362 ++++++++++++++++++
>  drivers/irqchip/Kconfig                       |   6 +-
>  drivers/irqchip/irq-imx-irqsteer.c            |  55 ++-
>  drivers/mmc/host/sdhci-esdhc-imx.c            |   9 +
>  9 files changed, 497 insertions(+), 17 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/freescale/s32n79-rdb.dts
>  create mode 100644 arch/arm64/boot/dts/freescale/s32n79.dtsi
>
> --
> 2.43.0
>

Patch2 and patch4 applied for next, thanks!

Kind regards
Uffe

