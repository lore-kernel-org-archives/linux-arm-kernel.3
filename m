Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A266CCD1BC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 13:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zki04Sm93j86wFa73SiXbRhOneWQJcRk+qoxflH2Q9g=; b=05otUGsJ4hvh65qmzi0g7Kxp2f
	Sl9KVc6jBPQ9sTAAp2uhXYLqyikVzr89KA3KsPvxn1Hfw6W/FA3A5mYmAbqzpWbufqy9VjNknWHSt
	ekxCX2BMbtcbm2kFt/lbjV+0AoJfYOghDMCdP866F+9LtFm7+gGNo9mWMA9fZt3fO4YCE4lLlOHxm
	jfqLLBj8HxkGV2nBp3Dtir1Tt6B+OV1oWEdZ7DTXJo8uIj0dU/J+ZrRDEi52BLhAs06L7AYxZg3Pe
	RTzmWBGHAshP1xsOp/nvtAPxfYz4PIlpBQafvvGGs7B3gXV7/VG0D9q38JWs9/a1/QrrVEKMoZQr2
	YwfXCR6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBviG-00000006TBH-2Y44;
	Thu, 23 Oct 2025 13:50:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBviE-00000006TAz-2KoV
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 23 Oct 2025 13:50:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=zki04Sm93j86wFa73SiXbRhOneWQJcRk+qoxflH2Q9g=; b=HCa+0S4nETd7WtbsKelIK99778
	8tpZ4eDJvGGHPc70PfLbmLajwe+MKOpn0kbfEChCMXqxax7WHTBvhYViE+Bpk11L2RSGzqwUqxs4X
	N5Zt4Op497/vzvgPZDScIdeYF3P6hlJj40Vu8HnGzNbq+AhtA0V4ifPEpo8EILNyKC1d5e32WsX31
	+M6Zh/RKOjrhdoNRyybM+ZUuw5scJkInirG1WCYC6XndRLbaorRYNbJVrcRy2o6867HoHNnP96zV8
	jTjbD86DRnoq8mKXe5CHaNqPWRkopcQIxyg/eDu336VmRzv5dEyTxaRgL85RAAiENPfS8Lm+IdHx9
	7AbEw+ZQ==;
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBuqV-00000001N8B-2oH5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 12:55:14 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59NDoTUS540288;
	Thu, 23 Oct 2025 08:50:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1761227429;
	bh=zki04Sm93j86wFa73SiXbRhOneWQJcRk+qoxflH2Q9g=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=gj8HcGBFKgITuRVeZo89cCU+6zRmxLf6nbvWuc/iZo3M98TywDl/KwZkai2RcuG6o
	 ZmNhIE66U9pVh6HS20u7ARsI+O72bbUMQ4C8YENVTL5rhZMzRWw3kO3SIC8fByALVL
	 tqjFlhTTI0Iuwbgx24r5KmRpq7zviXEje+CdvBvQ=
Received: from DFLE206.ent.ti.com (dfle206.ent.ti.com [10.64.6.64])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59NDoSiT2749992
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 23 Oct 2025 08:50:29 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 23 Oct
 2025 08:50:28 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 23 Oct 2025 08:50:28 -0500
Received: from [10.249.141.75] ([10.249.141.75])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59NDoPG32933967;
	Thu, 23 Oct 2025 08:50:25 -0500
Message-ID: <554df7d2-1809-42a8-b512-bde3fd284163@ti.com>
Date: Thu, 23 Oct 2025 19:20:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] arm64: dts: ti: k3-j722s-main: fix the audio
 refclk source
To: Michael Walle <mwalle@kernel.org>, Nishanth Menon <nm@ti.com>,
        Vignesh
 Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>
References: <20251017102228.530517-1-mwalle@kernel.org>
 <20251017102228.530517-2-mwalle@kernel.org>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20251017102228.530517-2-mwalle@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_135512_458242_024729C4 
X-CRM114-Status: GOOD (  25.64  )
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

Hi Michael,

On 10/17/2025 3:52 PM, Michael Walle wrote:
> At the moment the clock parent of the audio extclk output is PLL1_HSDIV6
> of the main domain. This very clock output is also used among various IP
> cores, for example for the USB1 LPM clock. The audio extclock being an
> external clock output with a variable frequency, it is likely that a
> user of this clock will try to set it's frequency to a different value,
> i.e. an audio codec. Because that clock output is used also for other IP
> cores, bad things will happen.
>
> Instead of using PLL1_HSDIV6 use the PLL2_HSDIV8 as a sane default, as
> this output is exclusively used among other audio peripherals.


Thanks for this fix,

Initial support for audio_refclkx was added in j722s and am62p soc 
specific files due

to selection of different parent.

Since these SOC share many common things, and this patch will make these 
nodes same as of am62p device

https://elixir.bootlin.com/linux/v6.18-rc2/source/arch/arm64/boot/dts/ti/k3-am62p-main.dtsi#L46 


So I suggest to move in common file 
https://elixir.bootlin.com/linux/v6.18-rc2/source/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi#L42 


and remove from SOC specific files.


> Signed-off-by: Michael Walle <mwalle@kernel.org>
> ---
> The original abort happens when sound is played and the codec will try
> to change the clock frequency of the audio_extclk. In that case, there
> will be a synchronous external abort in the xhci irq handler on our
> board. This error only happens on board variants with an attached
> on-board USB hub (TUSB8043A) probably because of USB traffic.
>
> This can also reduced to just run k3conf to set the clock manually:
>    k3conf set clock 157 15 12000000
>
> That will then produce the following splat:
>
>      Internal error: synchronous external abort: 0000000096000010 [#1]  SMP
>      Modules linked in:
>      CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Tainted: G   M                6.18.0-rc1-next-20251016-00042-gde32b6002bba #3076 NONE
>      Tainted: [M]=MACHINE_CHECK
>      Hardware name: Kontron SMARC-sAM67 (DT)
>      pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>      pc : xhci_handle_events.isra.0+0x278/0x14e8
>      lr : xhci_irq+0xa4/0x140
>      sp : ffff800080003e00
>      x29: ffff800080003e60 x28: ffff0008043cc000 x27: 0000000000000000
>      x26: ffff000804513a78 x25: ffffbdbfa3b5df40 x24: ffff0008043c9c48
>      x23: ffff000803234c60 x22: ffff800081410490 x21: 0000000000000000
>      x20: 0000000000000000 x19: ffff0008043c9240 x18: 0000000000000004
>      x17: ffff4249db4d5000 x16: ffff800080000000 x15: ffff00097ee690e0
>      x14: 0000000000000001 x13: 0000000000000001 x12: 0000000000000000
>      x11: 0000000000000040 x10: ffff0008000146f0 x9 : ffffbdbfa240937c
>      x8 : ffff000802679fb0 x7 : 0000000000000000 x6 : 0000000000000000
>      x5 : ffff000802679f88 x4 : ffff0008043c9284 x3 : 0000000000000078
>      x2 : ffff0008043cc000 x1 : ffff000804513a00 x0 : 0000000000000078
>      Call trace:
>       xhci_handle_events.isra.0+0x278/0x14e8 (P)
>       xhci_irq+0xa4/0x140
>       usb_hcd_irq+0x38/0x60
>       __handle_irq_event_percpu+0x64/0x278
>       handle_irq_event+0x4c/0x110
>       handle_fasteoi_irq+0x14c/0x270
>       handle_irq_desc+0x3c/0x68
>       generic_handle_domain_irq+0x24/0x40
>       gic_handle_irq+0x138/0x280
>       call_on_irq_stack+0x30/0x48
>       do_interrupt_handler+0x88/0xa0
>       el1_interrupt+0x4c/0xb8
>       el1h_64_irq_handler+0x18/0x30
>       el1h_64_irq+0x80/0x88
>       default_idle_call+0x38/0xf0 (P)
>       do_idle+0x22c/0x290
>       cpu_startup_entry+0x40/0x50
>       rest_init+0xc8/0xd0
>       start_kernel+0x8d0/0x8d8
>       __primary_switched+0x88/0x98
>      Code: eb02031f 54000e80 f8606836 f9400b1c (b94002d6)
>      ---[ end trace 0000000000000000 ]---
>      Kernel panic - not syncing: synchronous external abort: Fatal exception in interrupt
> ---
>   arch/arm64/boot/dts/ti/k3-j722s-main.dtsi | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
> index 11a1a42e12b1..04de29da40f1 100644
> --- a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
> @@ -468,7 +468,7 @@ audio_refclk0: clock@82e0 {
>   		reg = <0x82e0 0x4>;
>   		clocks = <&k3_clks 157 0>;
>   		assigned-clocks = <&k3_clks 157 0>;
> -		assigned-clock-parents = <&k3_clks 157 15>;
> +		assigned-clock-parents = <&k3_clks 157 16>;
>   		#clock-cells = <0>;
>   	};
>   
> @@ -477,7 +477,7 @@ audio_refclk1: clock@82e4 {
>   		reg = <0x82e4 0x4>;
>   		clocks = <&k3_clks 157 18>;
>   		assigned-clocks = <&k3_clks 157 18>;
> -		assigned-clock-parents = <&k3_clks 157 33>;
> +		assigned-clock-parents = <&k3_clks 157 34>;
>   		#clock-cells = <0>;
>   	};
>   };

