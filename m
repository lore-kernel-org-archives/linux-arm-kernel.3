Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53F24C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 14:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HJXc10uVHArrgWQfirQzw4xfu+i+JBRRlfN/XUL1Ils=; b=i8s9sXZGje/RPxLyMzFHiXbmU3
	owZv/2JibIBbvpwIEKeTzzHan6EdqhsjBoxI1J6Rb6NGEUtCXS284w64AOR/BxDbl03vqtublGRAy
	IBgxh034G/wT9+199YwlzsM5svxhqSDQkJEeA75OFKyUX/A7fpwp5Y26OVtEZPHIisCPcjI6RyGbo
	YAZcAvw3RteFm+JDE5yMleCBvyM4kZ01Oq1zzYsAofugFSOnsMvrEtuXe7re2KwJmY3NSSNP3mtAs
	4X0BB/wPsGbqE+Vrb0NJVM/cY2KLuWAsR2RWJ3I79ZH2jNVgMFMdcfvOUAA8v0YGaTQk5sgumrZTG
	WobbllZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7vpi-0000000GMES-2C0l;
	Sat, 19 Sep 2026 14:14:26 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7vpg-0000000GME2-1vUI
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Sep 2026 14:14:25 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49b912d37b6so7293375e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Sep 2026 07:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1789827262; x=1790432062; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HJXc10uVHArrgWQfirQzw4xfu+i+JBRRlfN/XUL1Ils=;
        b=fLv+gLjmitjAjyVMvb7GgB+WcAUN6jzu8QlT1OarCZeV9oy0t6IYmNx+1duoRVYfEe
         dziOUgijtaMuWf4isc+V1Usfil8WhgPDODv5Vhj5b6K4BxtGRzNjz28c1Ld9mGh03Bkv
         5hYD0g72FG2kAAa8Asck6Q8tbAcKtVLB0OaYVUPEdcMmr298TjlYDB+A+8Fyne8iw+jz
         YwK/3wQdLBasBKlGgEzHv4qcvwuJ0m2f2r12Zf3TU/zqB9avQZJ4bSGkORMHUMBcLFUX
         hR/Vk5dhA/QQfxOvYSqw6XnNJzSEYYeamlLmK4znBauW8ZACDE3LChJlBTjYbadQH1Ye
         3b0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789827262; x=1790432062;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HJXc10uVHArrgWQfirQzw4xfu+i+JBRRlfN/XUL1Ils=;
        b=Vfj+3asX/wzLHltfsU9tGfSxgyHjQhmLqRsL1k8Jo3dXAZ51aODZ141BFuGSd6WRWQ
         hwJ27XAuo561mIlUgq9Lw9siYjxFE3sthkSWwJvwqv14fs1pFXa4WTpdArvQjSv4+mw+
         5y2BzpehiyQd9ySeU2Up9SdwXR4InhdrnsSXg4d7s5AmELpw3RPZFiWXi0b6KAUfHoUj
         0XW+JSDTYQ0jnLc4VpVzXC5EMU9edsSb5JxfrStu4myWuOu6r4E0onMFiODiRVgrIlJ1
         oFng3J3UUZihh0z1E21EmPKfQxioMoKLrWeErmNdNITS4Am64stNYUYwuwuqS0pv6nMK
         eOgg==
X-Forwarded-Encrypted: i=1; AKwUvByevFejgWLPDRC1M9pcbnyCp8BjaKJYpJNSJucyKhXQZB2QdrJCCF9ZipGqREIH9elUdXLaFz1/DwNtyFLUxhui@lists.infradead.org
X-Gm-Message-State: AFuF++lWAZQgn1UUfNuq8b7PR1HuZloU2DMUV5ILGiIBFr5WJ+QWxVsK
	xi7WagJemlRCPK8ok73XgNAAKFFRNh5RN+dYo5jA+XMzifxuarK1M9GT6xnndYophIc=
X-Gm-Gg: AYBFou32L22BiBwRso/cwhL1SKAqXlAebh7+VIG19XOMhVRl4ceiLE2y2lKlQnhZxls
	UrRh3DkiGiWLwsOVleSMq7v1VdDEhga0no0rD1g4jpySFMpNixlJRoS0gJldOQe7K/D89U4g4mz
	oAeVfQJCWsTXrz4atgCBDN703lHeVv9WEGc9dfTGuSbLSWuiojVfK+nfq/4wuEgyRYeOpjIlBij
	hDH8lDSeEWuW5TmmyhvPojLTYKutxH58Bd0oFuM0UXpMmlapvnQt1cOg2r/OnyQOXsvdZXVTj3U
	XsVlbPMI3RS7VmO25jftdh0QpZvIA+2rv8lyLWEl7nJ+cc+CCu+nzyPCUdDm+8m+8DJahE83PSx
	OUwXtL8qK4iS9VFKHL18XSULQw8MLkcfVVSY+z3xNACP54NBmk4fKDM8MpDdR1+72RPs2dxD1MV
	e0QfCygDUGPUKNDfxpagp7H3KWuqVQBGpzphGVplqPsNR4KCiTsS486KEg7koqz4k5RhrYkFoi+
	k65ZHHkc8CoFQ+n6tNQkR+BOrQvEOamCauPZb0joD44HSjF2pIFG5g7
X-Received: by 2002:a05:600c:19c8:b0:49f:ce78:3565 with SMTP id 5b1f17b1804b1-49fce7835f7mr20772865e9.22.1789827262336;
        Sat, 19 Sep 2026 07:14:22 -0700 (PDT)
Received: from ?IPV6:2a02:2f05:1204:e000:2cf7:c250:64a9:ae77? ([2a02:2f05:1204:e000:2cf7:c250:64a9:ae77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd090f0csm106078635e9.15.2026.09.19.07.14.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 07:14:21 -0700 (PDT)
Message-ID: <09c057fe-bcaa-4e57-bedc-40dc1fcc770c@tuxon.dev>
Date: Sat, 19 Sep 2026 17:14:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] arm64: dts: microchip: lan969x: add SDMMC nodes
To: Robert Marko <robert.marko@sartura.hr>, ulfh@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, adrian.hunter@intel.com,
 aubin.constans@microchip.com, ehristev@kernel.org,
 linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: luka.perkov@sartura.hr
References: <20260907132617.1198548-1-robert.marko@sartura.hr>
 <20260907132617.1198548-5-robert.marko@sartura.hr>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260907132617.1198548-5-robert.marko@sartura.hr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_071424_522009_F0F1822F 
X-CRM114-Status: GOOD (  15.89  )
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

Hi, Roberto,

On 9/7/26 16:25, Robert Marko wrote:
> Add nodes for both SDMMC controllers. Connect their bus interface clock to
> the fabric clock and their core clock to the corresponding generated clock.
> 
> Configure SDMMC0 with a 100 MHz generated clock for 50 MHz eMMC DDR
> operation. Configure SDMMC1 with an exact 50 MHz generated clock so the
> integer base clock encoded in the SDHCI capabilities remains accurate and
> the identification clock does not exceed 400 kHz.
> 
> Keep both nodes ordered by unit address.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> ---
> Changes in v2:
> * Use the fabric clock for the SDMMC bus interface clock.
> * Configure SDMMC1 with an exact 50 MHz generated clock.
> * Move the SDMMC1 node to preserve unit-address ordering.
> * Explain the selected clock rates in the commit description.
> 
>   arch/arm64/boot/dts/microchip/lan9691.dtsi | 24 ++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/microchip/lan9691.dtsi b/arch/arm64/boot/dts/microchip/lan9691.dtsi
> index a8541c6a098d..5e330d5fab50 100644
> --- a/arch/arm64/boot/dts/microchip/lan9691.dtsi
> +++ b/arch/arm64/boot/dts/microchip/lan9691.dtsi
> @@ -414,6 +414,18 @@ qspi0: spi@e0804000 {
>   			status = "disabled";
>   		};
>   
> +		sdmmc0: mmc@e0830000 {
> +			compatible = "microchip,lan9691-sdhci",
> +				     "microchip,sam9x60-sdhci";
> +			reg = <0xe0830000 0x00000300>;

s/0x00000300/0x300
> +			interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&fabric_clk>, <&clks GCK_ID_SDMMC0>;
> +			clock-names = "hclock", "multclk";
> +			assigned-clocks = <&clks GCK_ID_SDMMC0>;
> +			assigned-clock-rates = <100000000>;
> +			status = "disabled";
> +		};
> +
>   		qspi2: spi@e0834000 {
>   			compatible = "microchip,lan9691-qspi";
>   			reg = <0xe0834000 0x00000100>,
> @@ -429,6 +441,18 @@ qspi2: spi@e0834000 {
>   			status = "disabled";
>   		};
>   
> +		sdmmc1: mmc@e0838000 {
> +			compatible = "microchip,lan9691-sdhci",
> +				     "microchip,sam9x60-sdhci";
> +			reg = <0xe0838000 0x00000300>;

Same here. I can adjust it while applying.

With that addressed:
Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>


