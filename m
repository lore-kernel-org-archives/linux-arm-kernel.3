Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D387BD42B86
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 14:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ag6yg0oYLrpqfvd4azazNuL2hfZjYdO7Ypy2X6JCrnk=; b=iAMCsE0li/OAQoLw6T1nAstdoC
	naAknzHCWL2UqAaWzaOF+d6dGKTLWriMqkdwksFwoApd28hkvQdmOmrl2OplxAkR+fsBeJDNlRUZD
	HqBVkNY8QMFrOL2kbkKohYTTnP/mXUfI9U8/gu3b+mL/p1HvWXapI3jDa7pY+bpkmGRtMbxpTonH7
	ppjR76/Fw22I0dD98+UiHuwz/JIFekyKaGcquPVjSUtFi7Ut30IEPGpwU6VlnaAQiN8WmkyuLSkOW
	SEK+AnyxEkrOO1WWS1WFAB986G657UmmfCU2lZf2HHq/c4Lq06Yq+Aezr1QlLmnObkxvi15zrVVVJ
	HN7SuSlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tArlZ-00000003jEt-2ZXF;
	Tue, 12 Nov 2024 14:21:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tArjk-00000003ivC-3yBu;
	Tue, 12 Nov 2024 14:19:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6BBC425E3;
	Tue, 12 Nov 2024 06:19:48 -0800 (PST)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 214F13F66E;
	Tue, 12 Nov 2024 06:19:17 -0800 (PST)
Message-ID: <607a731c-41e9-497a-a08c-f718339610ae@arm.com>
Date: Tue, 12 Nov 2024 14:19:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: rockchip: Fix vdd_gpu voltage constraints on
 PinePhone Pro
To: Dragan Simic <dsimic@manjaro.org>, linux-rockchip@lists.infradead.org
Cc: heiko@sntech.de, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, stable@vger.kernel.org
References: <0718feb8e95344a0b615f61e6d909f6e105e3bf9.1731264205.git.dsimic@manjaro.org>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <0718feb8e95344a0b615f61e6d909f6e105e3bf9.1731264205.git.dsimic@manjaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_061921_108947_7D141CB4 
X-CRM114-Status: GOOD (  23.54  )
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

On 10/11/2024 6:44 pm, Dragan Simic wrote:
> The regulator-{min,max}-microvolt values for the vdd_gpu regulator in the
> PinePhone Pro device dts file are too restrictive, which prevents the highest
> GPU OPP from being used, slowing the GPU down unnecessarily.  Let's fix that
> by making the regulator-{min,max}-microvolt values less strict, using the
> voltage range that the Silergy SYR838 chip used for the vdd_gpu regulator is
> actually capable of producing. [1][2]

Specifying the absolute limits which the regulator driver necessarily 
already knows doesn't seem particularly useful... Moreover, the RK3399 
datasheet specifies the operating range for GPU_VDD as 0.80-1.20V, so at 
the very least, allowing the regulator to go outside that range seems 
inadvisable. However there's a separate datasheet for the RK3399-T 
variant, which does specify this 875-975mV range and a maximum GPU clock 
of 600MHz, along with the same 1.5GHz max. Cortex-A72 clock as 
advertised for RK3399S, so it seems quite possible that these GPU 
constraints here are in fact intentional as well. Obviously users are 
free to overclock and overvolt if they wish - I do for my 
actively-cooled RK3399 board :) - but it's a different matter for 
mainline to force it upon them.

Thanks,
Robin.

> This also eliminates the following error messages from the kernel log:
> 
>    core: _opp_supported_by_regulators: OPP minuV: 1100000 maxuV: 1150000, not supported by regulator
>    panfrost ff9a0000.gpu: _opp_add: OPP not supported by regulators (800000000)
> 
> These changes to the regulator-{min,max}-microvolt values make the PinePhone
> Pro device dts consistent with the dts files for other Rockchip RK3399-based
> boards and devices.  It's possible to be more strict here, by specifying the
> regulator-{min,max}-microvolt values that don't go outside of what the GPU
> actually may use, as the consumer of the vdd_gpu regulator, but those changes
> are left for a later directory-wide regulator cleanup.
> 
> [1] https://files.pine64.org/doc/PinePhonePro/PinephonePro-Schematic-V1.0-20211127.pdf
> [2] https://www.t-firefly.com/download/Firefly-RK3399/docs/Chip%20Specifications/DC-DC_SYR837_838.pdf
> 
> Fixes: 78a21c7d5952 ("arm64: dts: rockchip: Add initial support for Pine64 PinePhone Pro")
> Cc: stable@vger.kernel.org
> Signed-off-by: Dragan Simic <dsimic@manjaro.org>
> ---
>   arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
> index 1a44582a49fb..956d64f5b271 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
> @@ -410,8 +410,8 @@ vdd_gpu: regulator@41 {
>   		pinctrl-names = "default";
>   		pinctrl-0 = <&vsel2_pin>;
>   		regulator-name = "vdd_gpu";
> -		regulator-min-microvolt = <875000>;
> -		regulator-max-microvolt = <975000>;
> +		regulator-min-microvolt = <712500>;
> +		regulator-max-microvolt = <1500000>;
>   		regulator-ramp-delay = <1000>;
>   		regulator-always-on;
>   		regulator-boot-on;
> 
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip

