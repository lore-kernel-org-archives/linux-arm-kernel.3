Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96602C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 16:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6sopdPzxBrsv7gyGIR0sec5UUj1FEvIaNqj0jbpbgo8=; b=YRuHBerYZo1WPR3QVUancxhRgy
	QmZojgmRy4jZ+vNs+gHtRFLnHNkJkys9oMXxpAfE1jwmg5L4BjiDgOOsaL63Lu71I+Dh+dSiaLw6K
	nC2Z0J176yM+wcLqf9ZVC77mqDQsZQyYU5Qbm0ETQkGYGLpcvtiGna5YHDpZxwwevMDL80JJHV2h0
	b+EAW78tyt7Cy1Mn4QCTrLOq+5aZqBfimHnLk0GVYpPIDDOZ7PScU6LjXJsUxTyaV0idcs+ybMb0G
	R5DJz9PYstMNgKRKS/7fZXMlrCzreAMnx2AsMOSmx02YGTGMG7UtaAhCByTHmOq3F0QPE8JAKVYYY
	phBTVLHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9RKd-00000006vma-0IWL;
	Mon, 28 Apr 2025 16:27:47 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9RG1-00000006uZx-2DnA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 16:23:03 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53SGMuNC3443258
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Apr 2025 11:22:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745857376;
	bh=6sopdPzxBrsv7gyGIR0sec5UUj1FEvIaNqj0jbpbgo8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=nTIF2imESXweQqcWqi30qcEa2puSO/ASPRlz3r3z6TabhqCKGu6EKiKmEGHvyR4UR
	 ZbZrgfFzwDT4cP5gzQBJlFRL4Zp0ypUHp1hcvB211mlTWeiWu5I9aKPdq9bIvwo2uD
	 kPDpZrvuzVDc/w640rQ7zU5nWuPiWZAjH08Rwd2g=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53SGMu3r107578
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 28 Apr 2025 11:22:56 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 28
 Apr 2025 11:22:56 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 28 Apr 2025 11:22:55 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53SGMsuj126290;
	Mon, 28 Apr 2025 11:22:55 -0500
Message-ID: <dbb5e793-a7b9-43ab-a54e-28d5205fd0db@ti.com>
Date: Mon, 28 Apr 2025 11:22:54 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 07/11] arm64: dts: ti: k3-am62p5-sk: Enable IPC with
 remote processors
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Hari Nagalla <hnagalla@ti.com>,
        Beleswar
 Prasad <b-padhi@ti.com>,
        Markus Schneider-Pargmann <msp@baylibre.com>,
        Devarsh Thakkar <devarsht@lewv0571a.ent.ti.com>
References: <20250415153147.1844076-1-jm@ti.com>
 <20250415153147.1844076-8-jm@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250415153147.1844076-8-jm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_092301_699631_9DC6BFC8 
X-CRM114-Status: GOOD (  18.27  )
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

On 4/15/25 10:31 AM, Judith Mendez wrote:
> From: Devarsh Thakkar <devarsht@ti.com>
> 
> For each remote proc, reserve memory for IPC and bind the mailbox
> assignments. Two memory regions are reserved for each remote processor.
> The first region of 1MB of memory is used for Vring shared buffers
> and the second region is used as external memory to the remote processor
> for the resource table and for tracebuffer allocations.
> 
> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> Signed-off-by: Hari Nagalla <hnagalla@ti.com>
> Signed-off-by: Judith Mendez <jm@ti.com>
> ---
>   arch/arm64/boot/dts/ti/k3-am62p5-sk.dts | 50 ++++++++++++++++++++++---
>   1 file changed, 44 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
> index d29f524600af0..05760507da4ed 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
> @@ -49,6 +49,30 @@ reserved-memory {
>   		#size-cells = <2>;
>   		ranges;
>   
> +		mcu_r5fss0_core0_dma_memory_region: mcu-r5fss-dma-memory-region@9b800000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x00 0x9b800000 0x00 0x100000>;
> +			no-map;
> +		};
> +
> +		mcu_r5fss0_core0_memory_region: mcu-r5fss-memory-region@9b900000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x00 0x9b900000 0x00 0xf00000>;
> +			no-map;
> +		};
> +
> +		wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9c800000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x00 0x9c800000 0x00 0x100000>;
> +			no-map;
> +		};
> +
> +		wkup_r5fss0_core0_memory_region: r5f-memory@9c900000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x00 0x9c900000 0x00 0xf00000>;

Since this size did change we should keep an eye out for any existing firmware
that made use of the top part of this DDR range. I haven't found any yet, but please
do work with the MCU+SDK folks to get this fixed here[0] so no one ever runs into
issues over this someday.

Reviewed-by: Andrew Davis <afd@ti.com>

[0] https://github.com/TexasInstruments/mcupsdk-core-k3/blob/93978d24d1224b43a898e9bc5182569b9abd1545/.project/templates/am62px/common/linker_wkup-r5f.cmd.xdt#L294

> +			no-map;
> +		};
> +
>   		secure_tfa_ddr: tfa@9e780000 {
>   			reg = <0x00 0x9e780000 0x00 0x80000>;
>   			no-map;
> @@ -58,12 +82,6 @@ secure_ddr: optee@9e800000 {
>   			reg = <0x00 0x9e800000 0x00 0x01800000>; /* for OP-TEE */
>   			no-map;
>   		};
> -
> -		wkup_r5fss0_core0_memory_region: r5f-dma-memory@9c900000 {
> -			compatible = "shared-dma-pool";
> -			reg = <0x00 0x9c900000 0x00 0x01e00000>;
> -			no-map;
> -		};
>   	};
>   
>   	vmain_pd: regulator-0 {
> @@ -640,6 +658,26 @@ mbox_mcu_r5_0: mbox-mcu-r5-0 {
>   	};
>   };
>   
> +&wkup_r5fss0 {
> +	status = "okay";
> +};
> +
> +&wkup_r5fss0_core0 {
> +	mboxes = <&mailbox0_cluster0 &mbox_r5_0>;
> +	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
> +			<&wkup_r5fss0_core0_memory_region>;
> +};
> +
> +&mcu_r5fss0 {
> +	status = "okay";
> +};
> +
> +&mcu_r5fss0_core0 {
> +	mboxes = <&mailbox0_cluster1 &mbox_mcu_r5_0>;
> +	memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
> +			<&mcu_r5fss0_core0_memory_region>;
> +};
> +
>   &main_uart0 {
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&main_uart0_pins_default>;

