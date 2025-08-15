Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23285CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 17:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wjDT0cuqOqz1KGiBfuvRft2frGHo6r0c62HTNnpyaXg=; b=HAiboSuza9tH5Xvwx44Yzfkcs4
	b+pTq7+g1RaGHHaj6uQUvqGXllQkLJVW/R5Oau5vQXC350PeOgPXdAi6xRSRL8KmFc+07Nol24KBa
	i+JdQ57fV1MsAOIuWNfbfZ/c+UIXWW5Rrk3J4txYr5aEZ1Yg8TRy/mMHXaccBxyfIP+1WI4O57kZO
	i3UHT0L/omENd3xU67aHi1anMknoebqkYdtlyFrWOliQmdIMNJvHkB121qbwmOWGvhV92FJTtjl84
	MJtwShniBjYwvCFmlrnXSc5AABGJTvvjV3Fzg9f9zLE7RdXkZcZmpqkzz3usUec//Vn350IgA2OdC
	n4TCHMeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umxyF-000000035Yf-0rC6;
	Fri, 15 Aug 2025 17:12:03 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umwVr-00000002rFE-2PwV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 15:38:40 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57FFcZ072553249;
	Fri, 15 Aug 2025 10:38:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755272315;
	bh=wjDT0cuqOqz1KGiBfuvRft2frGHo6r0c62HTNnpyaXg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=B7OQpQ3nyKnmOuEbFUxq3lPgRRvToDpjEXBIYj1JTfCMW3YW1yUQO9SzsRkz5t7jD
	 6Gt/3hklCgloLDQYbB/2FiLFgG8Cr+dX/3Qd6w8SuAPI55mwNm+ZcO68jiwZ7DnlXk
	 ++DT56BTxKURf3wb+l6GP+bSZj5AtnKRnZSSJbT8=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57FFcZLU2683971
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 15 Aug 2025 10:38:35 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 15
 Aug 2025 10:38:34 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 15 Aug 2025 10:38:34 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57FFcYPf1490856;
	Fri, 15 Aug 2025 10:38:34 -0500
Message-ID: <c32e3cab-9074-488d-8909-4435f5194c48@ti.com>
Date: Fri, 15 Aug 2025 10:38:33 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/33] arm64: dts: ti: k3-j7200: Enable remote processors
 at board level
To: Beleswar Padhi <b-padhi@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <u-kumar1@ti.com>, <hnagalla@ti.com>, <jm@ti.com>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250814223839.3256046-1-b-padhi@ti.com>
 <20250814223839.3256046-2-b-padhi@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250814223839.3256046-2-b-padhi@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_083839_747849_A9AAD390 
X-CRM114-Status: GOOD (  17.02  )
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

On 8/14/25 5:38 PM, Beleswar Padhi wrote:
> Remote Processors defined in top-level J7200 SoC dtsi files are
> incomplete without the memory carveouts and mailbox assignments which
> are only known at board integration level.
> 
> Therefore, disable the remote processors at SoC level and enable them at
> board level where above information is available.
> 
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> ---

Looks good to me. Could you move all these "Enable rproc at board level" patches
to the start of the series? They should be the most straightforward patches and
so could all go in even if the .dtsi refactor doesn't and needs some work.

Andrew

>   arch/arm64/boot/dts/ti/k3-j7200-main.dtsi       | 3 +++
>   arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi | 3 +++
>   arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi     | 9 +++++++++
>   3 files changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-j7200-main.dtsi b/arch/arm64/boot/dts/ti/k3-j7200-main.dtsi
> index 5ce5f0a3d6f5..628ff89dd72f 100644
> --- a/arch/arm64/boot/dts/ti/k3-j7200-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j7200-main.dtsi
> @@ -1516,6 +1516,7 @@ main_r5fss0: r5fss@5c00000 {
>   		ranges = <0x5c00000 0x00 0x5c00000 0x20000>,
>   			 <0x5d00000 0x00 0x5d00000 0x20000>;
>   		power-domains = <&k3_pds 243 TI_SCI_PD_EXCLUSIVE>;
> +		status = "disabled";
>   
>   		main_r5fss0_core0: r5f@5c00000 {
>   			compatible = "ti,j7200-r5f";
> @@ -1530,6 +1531,7 @@ main_r5fss0_core0: r5f@5c00000 {
>   			ti,atcm-enable = <1>;
>   			ti,btcm-enable = <1>;
>   			ti,loczrama = <1>;
> +			status = "disabled";
>   		};
>   
>   		main_r5fss0_core1: r5f@5d00000 {
> @@ -1545,6 +1547,7 @@ main_r5fss0_core1: r5f@5d00000 {
>   			ti,atcm-enable = <1>;
>   			ti,btcm-enable = <1>;
>   			ti,loczrama = <1>;
> +			status = "disabled";
>   		};
>   	};
>   
> diff --git a/arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi
> index 56ab144fea07..692c4745040e 100644
> --- a/arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi
> @@ -612,6 +612,7 @@ mcu_r5fss0: r5fss@41000000 {
>   		ranges = <0x41000000 0x00 0x41000000 0x20000>,
>   			 <0x41400000 0x00 0x41400000 0x20000>;
>   		power-domains = <&k3_pds 249 TI_SCI_PD_EXCLUSIVE>;
> +		status = "disabled";
>   
>   		mcu_r5fss0_core0: r5f@41000000 {
>   			compatible = "ti,j7200-r5f";
> @@ -626,6 +627,7 @@ mcu_r5fss0_core0: r5f@41000000 {
>   			ti,atcm-enable = <1>;
>   			ti,btcm-enable = <1>;
>   			ti,loczrama = <1>;
> +			status = "disabled";
>   		};
>   
>   		mcu_r5fss0_core1: r5f@41400000 {
> @@ -641,6 +643,7 @@ mcu_r5fss0_core1: r5f@41400000 {
>   			ti,atcm-enable = <1>;
>   			ti,btcm-enable = <1>;
>   			ti,loczrama = <1>;
> +			status = "disabled";
>   		};
>   	};
>   
> diff --git a/arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi b/arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi
> index 291ab9bb414d..90befcdc8d08 100644
> --- a/arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi
> @@ -254,20 +254,27 @@ mbox_main_r5fss0_core1: mbox-main-r5fss0-core1 {
>   	};
>   };
>   
> +&mcu_r5fss0 {
> +	status = "okay";
> +};
> +
>   &mcu_r5fss0_core0 {
>   	mboxes = <&mailbox0_cluster0 &mbox_mcu_r5fss0_core0>;
>   	memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
>   			<&mcu_r5fss0_core0_memory_region>;
> +	status = "okay";
>   };
>   
>   &mcu_r5fss0_core1 {
>   	mboxes = <&mailbox0_cluster0 &mbox_mcu_r5fss0_core1>;
>   	memory-region = <&mcu_r5fss0_core1_dma_memory_region>,
>   			<&mcu_r5fss0_core1_memory_region>;
> +	status = "okay";
>   };
>   
>   &main_r5fss0 {
>   	ti,cluster-mode = <0>;
> +	status = "okay";
>   };
>   
>   /* Timers are used by Remoteproc firmware */
> @@ -287,12 +294,14 @@ &main_r5fss0_core0 {
>   	mboxes = <&mailbox0_cluster1 &mbox_main_r5fss0_core0>;
>   	memory-region = <&main_r5fss0_core0_dma_memory_region>,
>   			<&main_r5fss0_core0_memory_region>;
> +	status = "okay";
>   };
>   
>   &main_r5fss0_core1 {
>   	mboxes = <&mailbox0_cluster1 &mbox_main_r5fss0_core1>;
>   	memory-region = <&main_r5fss0_core1_dma_memory_region>,
>   			<&main_r5fss0_core1_memory_region>;
> +	status = "okay";
>   };
>   
>   &main_i2c0 {


