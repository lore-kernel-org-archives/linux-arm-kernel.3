Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB4BDCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 00:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2ozhSc9fWCXpoZo6y9/TJu376fK1mD4abGnuKuDNvF0=; b=uCUOnmr/CcXeqokt9QvRDlBKIO
	/WvQcUYj/gtHOXn6FZ4emevST4Jk+/+O6SXsMMnij6sjjjzaX6X/haGV4hQVQxnVoonUSZRdXieDW
	rIEGjjcPFW5aA462mlBEkoybvbnaU6/Nc/HdcemqucSyvVv+L8fRrqSIM3qIkYWwAJ4HATzVlsrZ6
	P8+cDe+/XDcGQbN+lg0IFh/0godY2uZMM7SDmPrYQ8FUziTmoJO3B2r0N8pH9rEemoeImYqUap4TP
	Q3eHxJeTRNXlUjst6uNeXLLHs9x5TLORWDxCBGbtY1ZPFMZ4nbyGb3KNS/CJWhwV4ZPZToCWmsDAT
	8tH6w0BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uugXj-00000005Vkp-3POR;
	Sat, 06 Sep 2025 00:12:35 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuboO-000000041Rd-3WJY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 19:09:30 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 585J9PCM3318147;
	Fri, 5 Sep 2025 14:09:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757099365;
	bh=2ozhSc9fWCXpoZo6y9/TJu376fK1mD4abGnuKuDNvF0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=XKKCdNi2IUzEX3vMRNXUQnhm+b2vkVFZHG3UvPsKREzHJCAMJsOseVYbMEfD5m8wc
	 ioNEia+GKDmnAIzo/t+RmOZQ46AWekaYqBGXTZfRf8qKfzgb2Fcu738jUyP/XnnhKj
	 r49Bcn+fCgdsCqeezxy7qV+4kJx0xB0oVftGgCO4=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 585J9PlF1117620
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 5 Sep 2025 14:09:25 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 5
 Sep 2025 14:09:24 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 5 Sep 2025 14:09:24 -0500
Received: from localhost (lcpd911.dhcp.ti.com [172.24.233.130])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 585J9Nkc1190511;
	Fri, 5 Sep 2025 14:09:24 -0500
Date: Sat, 6 Sep 2025 00:39:23 +0530
From: Dhruva Gole <d-gole@ti.com>
To: Beleswar Padhi <b-padhi@ti.com>
CC: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <afd@ti.com>,
        <u-kumar1@ti.com>, <hnagalla@ti.com>, <jm@ti.com>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 05/33] arm64: dts: ti: k3-am62p-j722s: Enable remote
 processors at board level
Message-ID: <20250905190923.c6uxxurvt6kkxxo4@lcpd911>
References: <20250905051846.1189612-1-b-padhi@ti.com>
 <20250905051846.1189612-6-b-padhi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250905051846.1189612-6-b-padhi@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_120928_971884_16C91346 
X-CRM114-Status: GOOD (  16.26  )
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

On Sep 05, 2025 at 10:48:18 +0530, Beleswar Padhi wrote:
> Remote Processors defined in top-level AM62P-J722S common SoC dtsi
> files are incomplete without the memory carveouts and mailbox
> assignments which are only known at board integration level.
> 
> Therefore, disable the remote processors at SoC level and enable them at
> board level where above information is available.
> 
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> Acked-by: Andrew Davis <afd@ti.com>
> Tested-by: Judith Mendez <jm@ti.com>
> ---
> v3: Changelog:
> 1. Carried A/B and T/B tags.
> 
> Link to v2:
> https://lore.kernel.org/all/20250823160901.2177841-6-b-padhi@ti.com/
> 
> v2: Changelog:
> 1. Re-ordered patch from [PATCH 13/33] to [PATCH v2 05/33].
> 
> Link to v1:
> https://lore.kernel.org/all/20250814223839.3256046-14-b-padhi@ti.com/
> 
>  arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi    | 1 +
>  arch/arm64/boot/dts/ti/k3-am62p-j722s-common-wakeup.dtsi | 1 +
>  arch/arm64/boot/dts/ti/k3-am62p5-sk.dts                  | 2 ++
>  arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts           | 3 +++
>  arch/arm64/boot/dts/ti/k3-j722s-evm.dts                  | 3 +++
>  arch/arm64/boot/dts/ti/k3-j722s-main.dtsi                | 1 +
>  6 files changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi
> index bd6a00d13aea..5288c959f3c1 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi
> @@ -205,6 +205,7 @@ mcu_r5fss0_core0: r5f@79000000 {
>  			ti,atcm-enable = <0>;
>  			ti,btcm-enable = <1>;
>  			ti,loczrama = <0>;
> +			status = "disabled";
>  		};
>  	};
>  };
> diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-wakeup.dtsi
> index 6757b37a9de3..8612b45e665c 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-wakeup.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-wakeup.dtsi
> @@ -136,6 +136,7 @@ wkup_r5fss0_core0: r5f@78000000 {
>  			ti,atcm-enable = <1>;
>  			ti,btcm-enable = <1>;
>  			ti,loczrama = <1>;
> +			status = "disabled";
>  		};
>  	};
>  };
> diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
> index 899da7896563..2755598fd1f5 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
> @@ -725,6 +725,7 @@ &wkup_r5fss0_core0 {
>  	mboxes = <&mailbox0_cluster0 &mbox_r5_0>;
>  	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
>  			<&wkup_r5fss0_core0_memory_region>;
> +	status = "okay";
>  };
>  
>  &mcu_r5fss0 {
> @@ -735,6 +736,7 @@ &mcu_r5fss0_core0 {
>  	mboxes = <&mailbox0_cluster1 &mbox_mcu_r5_0>;
>  	memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
>  			<&mcu_r5fss0_core0_memory_region>;
> +	status = "okay";
>  };
>  
>  &main_uart0 {
> diff --git a/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts b/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
> index bf9b23df1da2..b329e4cb0c37 100644
> --- a/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
> @@ -515,6 +515,7 @@ &wkup_r5fss0_core0 {
>  	mboxes = <&mailbox0_cluster0 &mbox_wkup_r5_0>;
>  	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
>  			<&wkup_r5fss0_core0_memory_region>;
> +	status = "okay";
>  };
>  
>  &mcu_r5fss0 {
> @@ -525,6 +526,7 @@ &mcu_r5fss0_core0 {
>  	mboxes = <&mailbox0_cluster1 &mbox_mcu_r5_0>;
>  	memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
>  			<&mcu_r5fss0_core0_memory_region>;
> +	status = "okay";
>  };
>  
>  &main_r5fss0 {
> @@ -535,6 +537,7 @@ &main_r5fss0_core0 {
>  	mboxes = <&mailbox0_cluster3 &mbox_main_r5_0>;
>  	memory-region = <&main_r5fss0_core0_dma_memory_region>,
>  			<&main_r5fss0_core0_memory_region>;
> +	status = "okay";
>  };
>  
>  &c7x_0 {
> diff --git a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
> index 9d8abfa9afd2..2b9e007432a9 100644
> --- a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
> +++ b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
> @@ -850,6 +850,7 @@ &wkup_r5fss0_core0 {
>  	mboxes = <&mailbox0_cluster0 &mbox_wkup_r5_0>;
>  	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
>  			<&wkup_r5fss0_core0_memory_region>;
> +	status = "okay";
>  };
>  
>  &mcu_r5fss0 {
> @@ -860,6 +861,7 @@ &mcu_r5fss0_core0 {
>  	mboxes = <&mailbox0_cluster1 &mbox_mcu_r5_0>;
>  	memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
>  			<&mcu_r5fss0_core0_memory_region>;
> +	status = "okay";
>  };
>  
>  &main_r5fss0 {
> @@ -870,6 +872,7 @@ &main_r5fss0_core0 {
>  	mboxes = <&mailbox0_cluster3 &mbox_main_r5_0>;
>  	memory-region = <&main_r5fss0_core0_dma_memory_region>,
>  			<&main_r5fss0_core0_memory_region>;
> +	status = "okay";
>  };
>  
>  &c7x_0 {
> diff --git a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
> index 993828872dfb..d57fdd38bdce 100644
> --- a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
> @@ -368,6 +368,7 @@ main_r5fss0_core0: r5f@78400000 {
>  			ti,atcm-enable = <1>;
>  			ti,btcm-enable = <1>;
>  			ti,loczrama = <1>;
> +			status = "disabled";
>  		};
>  	};

Reviewed-by: Dhruva Gole <d-gole@ti.com>

-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated

