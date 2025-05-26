Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DABC6C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 May 2025 05:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DO4UKFcjT1jdMKNGMOOu+sLadecJqRP1bouop32CCm0=; b=efX5AMDLQagHgxMr6wU/6iXVvt
	kpDfE2DSdlVGs+JLa01K8MR6Q+n6oUCow7DCNdRd3fNG/G8ijnITVC79BidH/SJL7v01hc4GRLrzy
	bgVomYEa4TfqIOPQf3Q/qopLSxTagUmaA+PSIkEmWFScRsCm+ApHS9ASYnKXjRds+SH2YIW8BaHbt
	k/YKYwuWj59ZKrsYiNErILgMYWxUVztfms0aBntAJKwfvF6+HLAb9gaFceVJBD6g714sqLYtHsHoq
	aL+oUA7jYrehvhJGKWnF3hSbRcGogi4X32WeWYlXLaj6qsN3fiarnR+DFMdUzlT4z0pylgcecliLQ
	5I5Wt6BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJQTr-000000087YG-1wQo;
	Mon, 26 May 2025 05:34:35 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJQRh-000000087Ff-3GlE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 May 2025 05:32:23 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54Q5W96h2608394;
	Mon, 26 May 2025 00:32:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748237529;
	bh=DO4UKFcjT1jdMKNGMOOu+sLadecJqRP1bouop32CCm0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=RtFiJnYd7nXxwSojuQIrd9mJgtNDVSvW+AGDmXTVJ19vlc3+816bilhY7/7m+vG1f
	 2HD7EMgz8BfN0DLww5VD9VTMSLsjxHU4m/kzMFIVJtcUFxyLlqTRreooPydkElIPVk
	 ZupVL31Wl2OeHaoP8CGE9KC8zHq//Hvn9q3wb+bM=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54Q5W9G14007162
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 26 May 2025 00:32:09 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 26
 May 2025 00:32:09 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 26 May 2025 00:32:08 -0500
Received: from [10.24.69.185] (dhcp-10-24-69-185.dhcp.ti.com [10.24.69.185])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54Q5W5HQ116398;
	Mon, 26 May 2025 00:32:06 -0500
Message-ID: <4f660adb-1cb4-4bcf-9d1c-c13e62818f07@ti.com>
Date: Mon, 26 May 2025 11:02:05 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: k3-am642-phyboard-electra: Fix PRU-ICSSG
 Ethernet ports
To: Wadim Egorov <w.egorov@phytec.de>, <nm@ti.com>, <kristo@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <upstream@lists.phytec.de>
References: <20250521053339.1751844-1-w.egorov@phytec.de>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <20250521053339.1751844-1-w.egorov@phytec.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250525_223221_910872_D27F1A87 
X-CRM114-Status: GOOD (  15.24  )
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



On 21/05/25 11:03, Wadim Egorov wrote:
> For the ICSSG PHYs to operate correctly, a 25 MHz reference clock must
> be supplied on CLKOUT0. Previously, our bootloader configured this
> clock, which is why the PRU Ethernet ports appeared to work, but the
> change never made it into the device tree.
> 

Should this patch have a Fixes tag then?

> Add clock properties to make EXT_REFCLK1.CLKOUT0 output a 25MHz clock.
> 
> Signed-off-by: Wadim Egorov <w.egorov@phytec.de>
> ---
>  arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-rdk.dts | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-rdk.dts b/arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-rdk.dts
> index f63c101b7d61..129524eb5b91 100644
> --- a/arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-rdk.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-rdk.dts
> @@ -322,6 +322,8 @@ AM64X_IOPAD(0x0040, PIN_OUTPUT, 7)	/* (U21) GPMC0_AD1.GPIO0_16 */
>  &icssg0_mdio {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&icssg0_mdio_pins_default &clkout0_pins_default>;
> +	assigned-clocks = <&k3_clks 157 123>;
> +	assigned-clock-parents = <&k3_clks 157 125>;
>  	status = "okay";
>  
>  	icssg0_phy1: ethernet-phy@1 {

-- 
Regards
Vignesh
https://ti.com/opensource


