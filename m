Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A9EDCCD1BC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 08:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mvitnbkjcLAPoCX0wHi6huodXxXSf+n5ic/epN0KCNA=; b=SN3LlhJXWwi2b7nlvt0QYz/eJl
	1a7+c54hWnN+mWrMdbC+cS7o8Fg8swlA/yXxNFsLPG8FBFn2lNMAlYZhkQnzCcKLGGV+avfYWlEjy
	E3BdC1EM3eCCbAss3XViwGdgKB4JFD2p8NDjY084s/bhDueSjRZOUYN7JVaIR6rYHNdH0pk8quFrS
	NI4x6eCkmdwWPtOet9P8i9hj35Aa7OiICRVAGf7vWUS4BrwRYYeCCNGjrcWgqMELLTbC8NosiF32z
	MriOanHfL5gY+BzFdsRJeyAmhSOFHTwlbzZbYdb7C7Xs43SlJBkqvUqdrUKmYXKuLjoN5I3PE4W/1
	TfZjg5xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBqPV-00000005U5m-3Kb8;
	Thu, 23 Oct 2025 08:11:01 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBqPT-00000005U4j-2MgO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 08:11:01 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59N8Am9X483021;
	Thu, 23 Oct 2025 03:10:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1761207048;
	bh=mvitnbkjcLAPoCX0wHi6huodXxXSf+n5ic/epN0KCNA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=E/ncisCbT+ddeWJ5/EgdoFSv4WoQmsskRT5yFbVikwmLxKdAHccYOY/o98GEtNicz
	 Vy2rxVeOPKQL2jEMm0RJ/F+1v1nFjGUwA/2SDoRqfIYl9J27uMxqB3XxjgZdKXcVfH
	 8/sVEp0xtQXwBNM/COesSQUlu6h8oeQJCLGSvFzo=
Received: from DLEE210.ent.ti.com (dlee210.ent.ti.com [157.170.170.112])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59N8AmKN2247619
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 23 Oct 2025 03:10:48 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 23 Oct
 2025 03:10:48 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 23 Oct 2025 03:10:48 -0500
Received: from [172.24.233.103] (uda0132425.dhcp.ti.com [172.24.233.103])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59N8AiYh2549946;
	Thu, 23 Oct 2025 03:10:45 -0500
Message-ID: <3c131320-7be9-4223-b3c2-11beb435abd5@ti.com>
Date: Thu, 23 Oct 2025 13:39:16 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: k3-am642-tqma64xxl: add boot phase tags
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
        Nishanth Menon
	<nm@ti.com>, Tero Kristo <kristo@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux@ew.tq-group.com>
References: <20251006095036.16367-1-matthias.schiffer@ew.tq-group.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <20251006095036.16367-1-matthias.schiffer@ew.tq-group.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_011059_699540_1A2C5277 
X-CRM114-Status: GOOD (  14.33  )
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

Hi Matthias,

On 06/10/25 15:20, Matthias Schiffer wrote:
> Similar to other AM64x-based boards, add boot phase tags to make the
> Device Trees usable for firmware/bootloaders without modification.
> 
> Supported boot devices are eMMC/SD card, SPI-NOR and USB (both mass
> storage and DFU). The I2C EEPROM is included to allow the firmware to
> select the correct RAM configuration for different TQMa64xxL variants.
> 
> Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> ---
>  .../dts/ti/k3-am642-tqma64xxl-mbax4xxl.dts     | 18 ++++++++++++++++++
>  arch/arm64/boot/dts/ti/k3-am642-tqma64xxl.dtsi | 12 ++++++++++++
>  2 files changed, 30 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl.dts b/arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl.dts
> index 8f64d6272b1ba..81e9e047281fd 100644
> --- a/arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl.dts
> @@ -167,6 +167,7 @@ reg_pwm_fan: regulator-pwm-fan {
>  	};
>  
>  	reg_sd: regulator-sd {
> +		bootph-all;

Here and elsewhere:

Per [1] boot-phase tags would need to go just after all the std/common
properties and just before vendor properties

[1] https://docs.kernel.org/devicetree/bindings/dts-coding-style.html

>  		compatible = "regulator-fixed";
>  		pinctrl-names = "default";
>  		pinctrl-0 = <&main_mmc1_reg_pins>;
> @@ -245,6 +246,7 @@ icssg1_phy0c: ethernet-phy@c {
>  
>  
>  &main_gpio0 {
> +	bootph-all;
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&main_gpio0_digital_pins>,
>  		    <&main_gpio0_hog_pins>;
> @@ -263,6 +265,7 @@ &main_gpio0 {
>  };

 [...]
-- 
Regards
Vignesh
https://ti.com/opensource


