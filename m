Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 148EEC88E50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 12:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PL874DxmWdEEz+/Ho1XLM1gCTFYGrhEvvkDpUQlsjxY=; b=jUuD077CmGeMYsWlztGlBhKiWb
	mgg4We6B7EhUlNF++NuGRTwRO03ezmAtI/R2HcV0O9sA2vsiwsvd8VF9vVZKmW4Lsow1mEvuTlxw8
	pDc+iJ1dnIM2Hj64UZ8yyE7la7Ou3kBTgfZ76B9/VqpPRxoKWLYfxocOA90XLQaHfHLgtJ7Kar0HO
	DbUsNdtFE58SUcRxeipePZR/Ub8Vo5qM0IotOAzBTchjegPMGSELu7VDSW5jqlq5WZglwsdm8CzZW
	kVQzaBSbYlKzGT95A48S1bruaas/H7p7ZVTnCIzgqCb7xqmbLS4ar0ZwQ6Vk4a7KLZaJGTmCCpxlh
	rqg1M7Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x50E1-0000000GcPa-21q3;
	Fri, 11 Sep 2026 12:19:25 +0000
Received: from mail-ed2-x10.google.com ([2a00:1450:4864:33::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x50Dy-0000000GcNv-2BY6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 12:19:24 +0000
Received: by mail-ed2-x10.google.com with SMTP id 4fb4d7f45d1cf-6a67fa7a64eso1418924a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 05:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pardini.net; s=google; t=1789129161; x=1789733961; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PL874DxmWdEEz+/Ho1XLM1gCTFYGrhEvvkDpUQlsjxY=;
        b=L1DZh2m19zt1Qjzyro3edmhrcSqkENc1d7TZ9vGgQLANtpGLCeolnDPW/TdhMl504u
         QiP718mwSuBKSL9mao0JfqWP1pXfjJIIXsF4S+XH20+awWmtdJWQCGdtMYCueWOuaoBi
         BKL/xQyzqM4Lfs1TCMqTyDR+3n7rEIIE4PvYkG8eZ4CqTck31p6Kyal8KCUjMOyHNQlU
         AEzS4fAEIlqT4r+Sv/XQ03RwPoPICZuoGjWFsqw0NU5hKAPyK9YEOUu3P+Mt7jXzWhyt
         XjqIEKhs9di5EC9epff5peSkftp+jONejcAU8kMArv0jw0MmkZ5vM3Q8u9KaUsdGEzOb
         4U1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789129161; x=1789733961;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PL874DxmWdEEz+/Ho1XLM1gCTFYGrhEvvkDpUQlsjxY=;
        b=giIRgpYRqIL2RliKtQ0HwYp86b0WYyMc2UKltZEDjA6Jgmtm968rWog3Pr3sTZ8fkK
         +K5XJAMV31zk8Mz/2R//7jnfDv+deJDgfQPv/opyh+tW157Gmggru33Fq5MAioDGB5O0
         m5gFdBHsZ56Pzv65b5rNpsXg1Y28wN4Obj+6sO5JrswPc8Yw5FTMnyau722Atj43nMbB
         0XmDY8/d/P37FSfHsDN+BLUlhzJUPkm4W48U7NMLJwtTfO5JT4QatSJHlln6D1yfI7bb
         PFaf1PZloNGciUpwT9U/fnMf36BMMy4vSf4x8lruQETolSHACMA/b1iKGbaNoHqWyzmS
         JZvg==
X-Forwarded-Encrypted: i=1; AKwUvBzarT3k3hkcOGdt54+cv+d7IWFEYld4+aJt5e5wIAx5ZkUW9oEJY5GZ7JW7YFbsLm74+sdn1VQRK7sNO5XDJWAA@lists.infradead.org
X-Gm-Message-State: AFuF++mvD436tAJGknlgmsK4pRS1yyh6iRM/+FCgvLgyrwXMgg4QV1E8
	9s3MYI8c2YR0ZsyzG65GJU4wiwmUg/W7HRpd/smwzMuQeNrMsYRS6Z01ZDLl1ks99w==
X-Gm-Gg: AYBFou3EloaJej3nr5/SFYNhO7P3PtqDXEl/3g0frAXSdv+DP9R7JUO9sh9eVutfQ1L
	FlfgYUDo3f6mYelqmrrRHQmbpycthaQJlXBhvshzofGoouBQB479jWREij+TjzPDk8AZKdfo4Dn
	bEa2qJ2I0y54rpXBAQ8hwk7k/T0H0CG+SX4fjP951uFHvYBuV4oNEvyngAmmcEQtyDaxg7Cb48/
	ccmVohYmtY1Bpoje5u7kM9xv5v5N7G3QbT8iaX0ZDI30RUIGlqJcEwjMs+VPH4q/ppunQReXzeQ
	nspPJwXV+0iKG96LmcLsTWKrN1cpKrEEbvHJLWWP2V4r8TpUFjAIelLRFkPaB0ciUvD10IyuUDc
	VYo+F/hR0g/zHGTYtKAbbRvrLVnLnDQB//JfA9RXY7sijdx03UbauNYaJEbSv2Y3PsCV2wk2+yO
	9Xl7dCAmTEUO1ck0D839Uwa4EfUVxIximukWDUtSZlRHjSAtx0L+HZ+BdRldJLDExIZBm/qc2tl
	G5nMIarX8mJuZkcxHn0p9wi2XQy5pUpF/H5m5PMZdfT35A5f8jAoE5YxJeFb8jCnIWl5yS8wBGJ
	s5aN25o62uP6O3o/tzOkGc6CH0UcBM5Ck65bYPZG/xtb3Ug=
X-Received: by 2002:a05:6402:42d2:b0:6a9:b203:f410 with SMTP id 4fb4d7f45d1cf-6a9b5694f10mr1718054a12.21.1789129160539;
        Fri, 11 Sep 2026 05:19:20 -0700 (PDT)
Received: from ?IPV6:2a02:a466:4d7a:0:d90f:783f:2e2e:893d? (2a02-a466-4d7a-0-d90f-783f-2e2e-893d.fixed6.kpn.net. [2a02:a466:4d7a:0:d90f:783f:2e2e:893d])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b594f0fasm778079a12.25.2026.09.11.05.19.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 05:19:20 -0700 (PDT)
Message-ID: <bd032333-c557-4595-ae0c-6cb2971a9a86@pardini.net>
Date: Fri, 11 Sep 2026 14:19:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/7] arm64: dts: rockchip: describe PCIe RTL8125
 Ethernet on NanoPC-T6
To: Diederik de Haas <diederik@cknow-tech.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, nic_swsd@realtek.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20260910-rk3588-dts-rtl-eth-describe-dt-alias-v5-0-c1b9e5f10cd6@pardini.net>
 <20260910-rk3588-dts-rtl-eth-describe-dt-alias-v5-2-c1b9e5f10cd6@pardini.net>
 <DLCE8BRWYCBL.2UH33L4RQMAGN@cknow-tech.com>
Content-Language: en-US
From: Ricardo Pardini <ricardo@pardini.net>
In-Reply-To: <DLCE8BRWYCBL.2UH33L4RQMAGN@cknow-tech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_051922_602388_6CA9D2EC 
X-CRM114-Status: GOOD (  24.28  )
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

On 11/09/2026 11:52, Diederik de Haas wrote:
> On Thu Sep 10, 2026 at 10:07 PM CEST, Ricardo Pardini via B4 Relay wrote:
>> From: Ricardo Pardini <ricardo@pardini.net>
>>
>> The FriendlyElec NanoPC-T6 carries two on-board Realtek RTL8125 NICs
>> behind pcie2x1l0 and pcie2x1l2.
>>
>> Describe the fixed function nodes and attach ethernet0/ethernet1
>> aliases, so that U-Boot's fdt_fixup_ethernet() can fill in the MAC
>> from its ethaddr/eth1addr env. The on-NIC EEPROMs on this board are
>> not pre-programmed with a unique MAC, so this gives a stable MAC
>> across boots that both U-Boot and the kernel agree on.
>>
>> Signed-off-by: Ricardo Pardini <ricardo@pardini.net>
>> ---
>>   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi | 30 ++++++++++++++++++++++
>>   1 file changed, 30 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
>> index cfdb5c13f8606..550358a756618 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
>> +++ b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
>> @@ -20,6 +20,8 @@ / {
>>   	compatible = "friendlyarm,nanopc-t6", "rockchip,rk3588";
>>   
>>   	aliases {
>> +		ethernet0 = &rtl_eth0;
>> +		ethernet1 = &rtl_eth1;
>>   		mmc0 = &sdhci;
>>   		mmc1 = &sdmmc;
>>   	};
>> @@ -644,6 +646,20 @@ &pcie2x1l0 {
>>   	pinctrl-names = "default";
>>   	pinctrl-0 = <&pcie2_0_rst>;
> 
> The new pinctrl reference is ``pcie_25glan_perstb_b_pin``, so this patch needs
> to be rebased.

Indeed; I sent v5 vs v7.3-rc2 which doesn't have your recent series 
fixing those. I've rebased onto next-20260910 which does, will send in a 
v6 - but it's really just fuzz/context changes.

I'll wait a bit until Heiner/Krysztof/Heiko chime in ref the binding and 
its wording as that has been contentious in the previous versions. And 
who knows what Sashiko will find this time.

> 
>>   	status = "okay";
>> +
>> +	pcie@0,0 {
>> +		reg = <0x200000 0 0 0 0>;
>> +		#address-cells = <3>;
>> +		#size-cells = <2>;
>> +		ranges;
>> +		device_type = "pci";
>> +		bus-range = <0x21 0x2f>;
>> +
>> +		rtl_eth0: ethernet@0,0 {
>> +			compatible = "pci10ec,8125";
>> +			reg = <0x210000 0 0 0 0>;
>> +		};
> 
> Described on page 23 of the schematic titled '2.5G Ethernet B' and ``U12``
> (ie RTL8125BG) is connected to LAN2 which has ``ETH2`` as label on the case.

Confirmed.

> 
>> +	};
>>   };
>>   
>>   &pcie2x1l1 {
>> @@ -660,6 +676,20 @@ &pcie2x1l2 {
>>   	pinctrl-names = "default";
>>   	pinctrl-0 = <&pcie2_2_rst>;
> 
> The new pinctrl reference is ``pcie_25glan_perstb_pin``.

Will also be fixed by rebasing onto linux-next.

> 
>>   	status = "okay";
>> +
>> +	pcie@0,0 {
>> +		reg = <0x400000 0 0 0 0>;
>> +		#address-cells = <3>;
>> +		#size-cells = <2>;
>> +		ranges;
>> +		device_type = "pci";
>> +		bus-range = <0x41 0x4f>;
>> +
>> +		rtl_eth1: ethernet@0,0 {
>> +			compatible = "pci10ec,8125";
>> +			reg = <0x410000 0 0 0 0>;
>> +		};
> 
> Described on page 22 of the schematic titled '2.5G Ethernet A' and ``U10``
> (ie RTL8125BG) is connected to LAN1 which has ``ETH1`` as label on the case.
> 
> So this results in:
> ETH1 -> rtl_eth1
> ETH2 -> rtl_eth0
> 
> This sounds like a recipe for confusion and/or potential future mistakes.
> I think using ``rtl_eth1`` and ``rtl_eth2`` would be less confusing, but
> I'm fine with another construct which achieves a similar thing.

Yeah, that will result in aliases `ethernet0 = &rtl_eth1;` and 
`ethernet1 = &rtl_eth2;`. It could also be `rtl_lan1`/`rtl_lan2`, or as 
the schematics seems to to use the `_b` suffix, just `rtl_lan` and 
`rtl_lan_b`, I don't mind. Raise if you do, otherwise I'll send v6 as 
you suggested.

Userspace will be off-by-one vs the printed case labels, thus _some_ 
confusion will remain, but it's already better than the current 
enP2p33s0/enP4p65s0.

> 
> Cheers,
>    Diederik
> 
>> +	};
>>   };
>>   
>>   &pcie30phy {
> 

Thanks,
Ricardo


