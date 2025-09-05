Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD382CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 00:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VJVfpgI2zWe2MxErYt5wf9h8pnNlJMF+coJct3xk478=; b=V52ks30K0h6zW3AY1C6p2TtYCj
	/ZY1WhYcqx/ZYgm6pbHgocT6cV+H68EUfdKo0WGAHLtGnCbBAtXJAtjtvfeQ92EkT51Btx4ZZYJjg
	RtAJZUmmlnfZt2rvuccQWFIQ44dXPPmy/iG+vTAjsFPg7IJrKLeeWXXY+VrMK+Vw0Zq9z+mTD/qAd
	1quueNHgvRLv+l7SBUaEZxb+6hMA3+I7/UUJZTziwxpTFoGEG8/Ofdodts2TXcIqO4YDRprH1VPPn
	04iXY3ws0e34VE3u/NDAqgmP8/bTXpezFBf8opDwnttPGNlTOn7bAaK5FG95j9KG2ieB4mWdZZbmg
	R6BrzMHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uugXl-00000005Voi-2kjh;
	Sat, 06 Sep 2025 00:12:37 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uubqX-0000000424s-3ekd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 19:11:43 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 585JBcuB3818526;
	Fri, 5 Sep 2025 14:11:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757099498;
	bh=VJVfpgI2zWe2MxErYt5wf9h8pnNlJMF+coJct3xk478=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=IBqyTH7Tz9vgy7DtRC8rFtBKvHucWUoobLdqwCpQH9DfJ228KfmTy9eWbmGFdts9n
	 OwQISS8UsoXAGLlUp29kjNRHjVRVSGAqq+46YY4JtkdkL04jyhfKOE2yZEXATtzrBI
	 93uy/lSAPaHWohf+xhY8bupkv4SJpkmpzOmWUztQ=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 585JBcMp1850783
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 5 Sep 2025 14:11:38 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 5
 Sep 2025 14:11:37 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 5 Sep 2025 14:11:37 -0500
Received: from localhost (lcpd911.dhcp.ti.com [172.24.233.130])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 585JBaHv899397;
	Fri, 5 Sep 2025 14:11:37 -0500
Date: Sat, 6 Sep 2025 00:41:36 +0530
From: Dhruva Gole <d-gole@ti.com>
To: Beleswar Padhi <b-padhi@ti.com>
CC: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <afd@ti.com>,
        <u-kumar1@ti.com>, <hnagalla@ti.com>, <jm@ti.com>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Wadim
 Egorov <w.egorov@phytec.de>
Subject: Re: [PATCH v3 06/33] arm64: dts: ti: k3-am62: Enable remote
 processors at board level
Message-ID: <20250905191136.f4akog3ewnhpggsa@lcpd911>
References: <20250905051846.1189612-1-b-padhi@ti.com>
 <20250905051846.1189612-7-b-padhi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250905051846.1189612-7-b-padhi@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_121142_001335_EBC281ED 
X-CRM114-Status: GOOD (  15.74  )
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

On Sep 05, 2025 at 10:48:19 +0530, Beleswar Padhi wrote:
> Remote Processors defined in top-level AM62x SoC dtsi files are
> incomplete without the memory carveouts and mailbox assignments which
> are only known at board integration level.
> 
> Therefore, disable the remote processors at SoC level and enable them at
> board level where above information is available.
> 
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> Reviewed-by: Wadim Egorov <w.egorov@phytec.de>
> Tested-by: Wadim Egorov <w.egorov@phytec.de>
> Acked-by: Andrew Davis <afd@ti.com>
> ---
> v3: Changelog:
> 1. Carried A/B, T/B, R/B tags.
> 
> Link to v2:
> https://lore.kernel.org/all/20250823160901.2177841-7-b-padhi@ti.com/
> 
> v2: Changelog:
> 1. Re-ordered patch from [PATCH 21/33] to [PATCH v2 06/33].
> 
> Link to v1:
> https://lore.kernel.org/all/20250814223839.3256046-22-b-padhi@ti.com/
> 
>  arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi | 1 +
>  arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi      | 1 +
>  arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi  | 1 +
>  3 files changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi
> index 10e6b5c08619..dcd22ff487ec 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi
> @@ -407,4 +407,5 @@ &wkup_r5fss0_core0 {
>  	mboxes = <&mailbox0_cluster0 &mbox_r5_0>;
>  	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
>  			<&wkup_r5fss0_core0_memory_region>;
> +	status = "okay";
>  };
> diff --git a/arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi
> index 6549b7efa656..75aed3a88284 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi
> @@ -128,6 +128,7 @@ wkup_r5fss0_core0: r5f@78000000 {
>  			ti,sci = <&dmsc>;
>  			ti,sci-dev-id = <121>;
>  			ti,sci-proc-ids = <0x01 0xff>;
> +			status = "disabled";
>  		};
>  	};
>  
> diff --git a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi b/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
> index 13e1d36123d5..840772060cb1 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
> @@ -506,6 +506,7 @@ &wkup_r5fss0_core0 {
>  	mboxes = <&mailbox0_cluster0 &mbox_r5_0>;
>  	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
>  			<&wkup_r5fss0_core0_memory_region>;
> +	status = "okay";

Reviewed-by: Dhruva Gole <d-gole@ti.com>

-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated

