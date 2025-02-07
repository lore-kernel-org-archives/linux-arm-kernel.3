Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42D1DC02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 17:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2zri0YGU7tlFtITZQ9YMGtcv5e9E37p1MNnjf0vhx08=; b=S2Kp88wrBA6Q40SARwBvuxvIGt
	ryno8U1cyTyXLxdg0RYpsdSnAr0uZE/8XbGTiCAqUXYjSfl9t6BY1eZ0g51sTjXRmxl2ro+f09rjr
	L6YtOmCAYguHFHBo8MCjsj1BTsOqQKS+quqGvQe8MtQ3lHagL3vPAivoKY3tfYTkqJgG3TvVPDGly
	O8mSnsEljw56x8kVYfwrSC7loNtbdK0xsJxaf7PJkM1nEaasPqrc6PEx5ASvhBO5mtdY6f7bRGK3p
	Br7ssuNRI/5md537u5hFdOqqoxxs1XGo0HCySWJYd/pNJ8VtnwX8peyeFg7Vl4slFwIu6P3Qpznp4
	Ex5PTPcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgS8e-0000000AUKs-2T3Q;
	Fri, 07 Feb 2025 17:27:36 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgRgk-0000000AOAT-0mmr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 16:58:47 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 517GwfnQ3861324
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 7 Feb 2025 10:58:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738947521;
	bh=2zri0YGU7tlFtITZQ9YMGtcv5e9E37p1MNnjf0vhx08=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=leL05ieF6zpLhg2FiTFTeRMLLae99qfp4tExBvi3pzjhdFroseaKK5JCD0Tk3zq18
	 eW3IKGeGD+IxR5sGR63deUXFee/iTp3JHlbsbTGORS14jIV+oWp0OFxtxSqe6kBz0K
	 Tw/G3jXxXy2zf3Kv0y5urFjXWJ+XWK50bPvXKxLM=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 517Gwf6n060034;
	Fri, 7 Feb 2025 10:58:41 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 7
 Feb 2025 10:58:41 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 7 Feb 2025 10:58:41 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 517GweNg097409;
	Fri, 7 Feb 2025 10:58:40 -0600
Message-ID: <32358aa1-0c02-4f4d-9782-2d8376c0d9fc@ti.com>
Date: Fri, 7 Feb 2025 10:58:40 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/9] arm64: dts: ti: k3-am62p5-sk: Enable IPC with
 remote processors
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Hari Nagalla
	<hnagalla@ti.com>
References: <20250206235200.3128163-1-jm@ti.com>
 <20250206235200.3128163-7-jm@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250206235200.3128163-7-jm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_085846_393424_866772CA 
X-CRM114-Status: GOOD (  21.03  )
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

On 2/6/25 5:51 PM, Judith Mendez wrote:
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
> Changes since v3:
> - Add SRAM child node for am62p MCU R5 core 0
> ---
>   .../dts/ti/k3-am62p-j722s-common-mcu.dtsi     | 13 +++++
>   arch/arm64/boot/dts/ti/k3-am62p5-sk.dts       | 50 ++++++++++++++++---
>   2 files changed, 57 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi
> index b33aff0d65c9d..0be3463bc21c5 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi
> @@ -6,6 +6,18 @@
>    */
>   
>   &cbass_mcu {
> +	mcu_ram: sram@79100000 {
> +		compatible = "mmio-sram";
> +		reg = <0x00 0x79100000 0x00 0x80000>;
> +		ranges = <0x00 0x00 0x79100000 0x80000>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +
> +		mcu_sram1@0 {

What does this node do for us? Seems you reserve the whole SRAM
area from the start, but shouldn't the phandle in mcu_r5fss0_core0
point to this node? Or better it would use the normal SRAM API
to request an allocation from this region.

Since this is still not resolved, and you don't mention it in
the commit message, might be good to drop this SRAM part of this
patch and deal with this in a later series.

Andrew

> +			reg = <0x0 0x80000>;
> +		};
> +	};
> +
>   	mcu_pmx0: pinctrl@4084000 {
>   		compatible = "pinctrl-single";
>   		reg = <0x00 0x04084000 0x00 0x88>;
> @@ -213,6 +225,7 @@ mcu_r5fss0_core0: r5f@79000000 {
>   			ti,atcm-enable = <0>;
>   			ti,btcm-enable = <1>;
>   			ti,loczrama = <0>;
> +			sram = <&mcu_ram>;
>   		};
>   	};
>   };
> diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
> index ad71d2f27f538..9609727d042d3 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
> @@ -48,6 +48,30 @@ reserved-memory {
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
> +			reg = <0x00 0x9c900000 0x00 0x1e00000>;
> +			no-map;
> +		};
> +
>   		secure_tfa_ddr: tfa@9e780000 {
>   			reg = <0x00 0x9e780000 0x00 0x80000>;
>   			no-map;
> @@ -57,12 +81,6 @@ secure_ddr: optee@9e800000 {
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
> @@ -638,6 +656,26 @@ mbox_mcu_r5_0: mbox-mcu-r5-0 {
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

