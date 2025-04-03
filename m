Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBBB2C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 14:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3IsSPBXQWY1usNrfBN/KIensIpJex3632vzJAXdEQkI=; b=bVTQQrzd8Q8l/U8DZcNh1FQ5gX
	HopoZLgUkWRDOdJdYIYgw29ClY8h4cLWPvvkcBCYtTJiZYb0pJShoj7VNGnOg4SHiz7SA+HxTYNza
	Wmq7jJIoy/0wki9w0q9Vt5+4487UJ2jqYNbotZwLFSpca53E9mgFGZfBVtjE5+jlhqNHnBfM6w5BS
	80D5RQYlxQEiLzjrBIeNI67gYLANkGer7wMIK1Y3k99vho55QAbf8zVYrcZOeAnxjWNkSqeTN18+q
	RcDQH0NNEBs9hR5nl+4v5BtsPnVrlzLnHFSXNLaVKCN0ytFx/cbFrHxkO5Hme/z8a23MLxas5FIEy
	77sgDkKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Lnm-0000000974u-2yku;
	Thu, 03 Apr 2025 14:44:18 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0LfM-000000095fP-30Zf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 14:35:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 38436A432CE;
	Thu,  3 Apr 2025 14:30:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94184C4CEE5;
	Thu,  3 Apr 2025 14:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743690935;
	bh=zumkyYgD4rKRxbVuiS3xNK72xMEL7G46+2AXsQp2PTM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=aAn1mFcb7H6bICJ3q77Y2KkevOwYQkQpfxxEt5dkNtIUmPbo8+rf6rI7/i+ZmrqDF
	 GQ8qmloqZtKEvPdwmAqegoZY0Zq0HeCZLpt5N1ASKyZuot87W1m1zDrNEJx6Z7goZF
	 q4av7dDSYKfMX2lxMqsrE0hWkVSSxRqUUJEyJAG9VawD4CqdMSfEKVUme+qptjwA9T
	 J0fq5D6JhaAqT5vKWz1lT4taJ7njeZe59y/5WxfFYp/2F3kG4w6uzldaX69N1B6H6S
	 S7l+qc3d+gV6K/a4AhvM+jt5esZlNKngtfnSZPoXZHWLsg70SWvGdq+JwB5uUfstm7
	 oYJLRDmmHhfbQ==
Date: Thu, 03 Apr 2025 09:35:34 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, mcoquelin.stm32@gmail.com, 
 alexandre.torgue@foss.st.com, linux-arm-kernel@lists.infradead.org, 
 conor+dt@kernel.org, tglx@linutronix.de, krzk+dt@kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org, 
 maz@kernel.org
To: Christian Bruel <christian.bruel@foss.st.com>
In-Reply-To: <20250403122805.1574086-1-christian.bruel@foss.st.com>
References: <20250403122805.1574086-1-christian.bruel@foss.st.com>
Message-Id: <174369066487.2789685.6006460527429704975.robh@kernel.org>
Subject: Re: [PATCH 0/3] Add ST STM32MP2 GICv2 quirk for EOI split mode
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_073536_896508_1FFD3636 
X-CRM114-Status: GOOD (  16.05  )
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


On Thu, 03 Apr 2025 14:28:02 +0200, Christian Bruel wrote:
> When using GIC EOI split mode, GICC_DIR fails to deactivate the interrupt,
> leading to a WFI freeze. On ST MP2, GIC cpu interface is limitted to 4K,
> thus GICC_DIR register is reachable with a 0x10000 remapping
> 
> When using GIC EOI split mode, the GICC_DIR fails to deactivate the
> interrupt, causing core freeze on WFI. On the ST MP2, the GIC CPU interface
> is limited to 4K, so the GICC_DIR register can be accessed remapping the
> register to a 0x10000 offset.
> 
> Christian Bruel (3):
>   dt-bindings: interrupt-controller: arm,gic: Add
>     st,stm32mp2-cortex-a7-gic
>   irqchip/gic: Use 0x10000 offset to access GICC_DIR
>   arm64: dts: st: add st,stm32mp2-cortex-a7-gic in intc node in
>     stm32mp251.dtsi
> 
>  .../interrupt-controller/arm,gic.yaml         |  1 +
>  arch/arm64/boot/dts/st/stm32mp251.dtsi        |  2 +-
>  drivers/irqchip/irq-gic.c                     | 47 ++++++++++++++++++-
>  3 files changed, 48 insertions(+), 2 deletions(-)
> 
> --
> 2.34.1
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


This patch series was applied (using b4) to base:
 Base: attempting to guess base-commit...
 Base: tags/next-20250403 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/st/' for 20250403122805.1574086-1-christian.bruel@foss.st.com:

arch/arm64/boot/dts/st/stm32mp257f-dk.dtb: interrupt-controller@4ac00000: compatible: 'oneOf' conditional failed, one must be fixed:
	['st,stm32mp2-cortex-a7-gic', 'arm,cortex-a7-gic'] is too long
arch/arm64/boot/dts/st/stm32mp257f-dk.dtb: interrupt-controller@4ac00000: compatible: 'oneOf' conditional failed, one must be fixed:
		['st,stm32mp2-cortex-a7-gic', 'arm,cortex-a7-gic'] is too long
		'nvidia,tegra210-agic' was expected
		'st,stm32mp2-cortex-a7-gic' is not one of ['nvidia,tegra186-agic', 'nvidia,tegra194-agic', 'nvidia,tegra234-agic']
	'arm,gic-400' was expected
	'arm,arm1176jzf-devchip-gic' was expected
	'brcm,brahma-b15-gic' was expected
	'arm,arm11mp-gic' was expected
	'arm,cortex-a15-gic' was expected
	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,gic.yaml#
arch/arm64/boot/dts/st/stm32mp257f-ev1.dtb: interrupt-controller@4ac00000: compatible: 'oneOf' conditional failed, one must be fixed:
	['st,stm32mp2-cortex-a7-gic', 'arm,cortex-a7-gic'] is too long
arch/arm64/boot/dts/st/stm32mp257f-ev1.dtb: interrupt-controller@4ac00000: compatible: 'oneOf' conditional failed, one must be fixed:
		['st,stm32mp2-cortex-a7-gic', 'arm,cortex-a7-gic'] is too long
		'nvidia,tegra210-agic' was expected
		'st,stm32mp2-cortex-a7-gic' is not one of ['nvidia,tegra186-agic', 'nvidia,tegra194-agic', 'nvidia,tegra234-agic']
	'arm,gic-400' was expected
	'arm,arm1176jzf-devchip-gic' was expected
	'brcm,brahma-b15-gic' was expected
	'arm,arm11mp-gic' was expected
	'arm,cortex-a15-gic' was expected
	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,gic.yaml#






