Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC3E3C98304
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 18:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DBO6ysXqxsewkyeoBpzt8RskMK/dx24xXh3/dEMcXyQ=; b=tAapYP2aQxNfIitwxWsTQYcbdn
	67Z2j8OMKIM7LyhJeLY694SM4xuU35BEB7mnqSlBwOjxnp5I2enkDoKbuBOIp2cOZh5TAA/2Qw5s1
	WPcN2UUqiVWuRSkVr9ej1GTFvZ7kZ0k1MXx8QcCSeJE6qqmdL9cphFq0iNKRhnOw8fGXojJhyVAHo
	a6xw2UX2967IicnCwWaP50nxAreJx/Ue2rr0LXGUwwpFxwjX4OTmuG3gTWKHgOeSNE8gx3tgD3yuH
	z1vokhdjv1U2WUNmCL+eDqbRRD8Z0dn0oV644Vp/71vus6v1nnlhVPvi4fToIVvXnrTDuLLUlZmFl
	vA7M0A6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9RIQ-000000097i9-0DRG;
	Wed, 23 Sep 2026 18:02:18 +0000
Received: from mail-ej2-x0f.google.com ([2a00:1450:4864:34::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9RIG-000000097em-3CY1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 18:02:10 +0000
Received: by mail-ej2-x0f.google.com with SMTP id a640c23a62f3a-c254f9f0b20so192788866b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 11:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pardini.net; s=google; t=1790186524; x=1790791324; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DBO6ysXqxsewkyeoBpzt8RskMK/dx24xXh3/dEMcXyQ=;
        b=f3vohH6BFau60T6p5SXVODMRPO+eykLvrBN0hUVncquvTrhGP6M2jkDsZ4hTexGaRW
         SYDmjnJAjRqWf1JfLhWD5URooz1vkZCFV8YRN/3lIt38aqabjJSfGRuP/XWBchsVBQ+f
         F70IU7o9srUEC+neQxSlBace4kFBPYuxkCq5A4W6YllP4yon52eS8ditYlmZH68p6gwh
         ECyXfVh1bya40PtOVRauEHkcL7840oO0twi9VH77HS0ZNm0YbqpUQSYpe0WVC82aSZpH
         TGcOziA1SjXSDXAAlrtWU1tmOLzxmsX5Ll54kjGOidthZuMhb+OS1vz/T8LIeojwyXcj
         ZnUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790186524; x=1790791324;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DBO6ysXqxsewkyeoBpzt8RskMK/dx24xXh3/dEMcXyQ=;
        b=qoitfFpt60PizhaX6MJrbeg6WyxlTk0a+ZHiMqdKz3CvTBuv0CpFz9i7Eb3Elu1YMw
         TBIbEC25bYi368L8jyrQNUih4cx+W5XAVokmSDm9rW0GISBeV9/KtHSLik+c6XX7eP5v
         pL0tFEfRohnhxTWjtKWf6Q+01+ysXR0/dsiuFN9BQlidhA9o4fAApfsBXLKA0n84CRG1
         c70mnwxBHSRuyOr2fjhaXpFzAcoIrDQPfVoypMkYdt+Fq+3RAvrgQliBjdvc6ddjqg/4
         OLZOdlm0DwtSTyMoGI3ssCWBDXqLSIcHYg4UFnRsFBCU/TBWFhglJyT1yON6pJQJXOzK
         0RZw==
X-Forwarded-Encrypted: i=1; AKwUvBzlMFVqPaQeUUUw1aazVOla1/Iefcn3q6HcgNppvZVbOUmsK75ZnTseqDchwotjk1xp1FDfFobsr5QOw6LaDSgu@lists.infradead.org
X-Gm-Message-State: AFuF++kvMwBnsRcMOeFrmiHYUm0vfc5E0pJ+gEfylLd32GFpCRbqOqGP
	RozKsdPpqdVmuqW2qOFsUqODHPMObtnUonK6F9L7rMfO1cWJg88BDBQ+u/LQJNZC/A==
X-Gm-Gg: AYBFou2YquzW4OQLjZczvjKCozFJt8AukS34egf1cPQyDjNKbpYetCfq90JWlwDfrUf
	h+RLNb48FM6YqIw9YRZEqS+KHSgECkDJGjW1Cp08ki7PR4RF0MY1QkcIt4aTfWO3v+Lgi2N70HM
	7MXrmguEUe8nVStGmXp05hFrrF1ol9ku1I1VQZxHuTMYydVBskySnvUEiJxoiM87Ke0D0h0cdrU
	29QxwE3lJ0t0rgzEze33Qfqy9VRD4i/uRbaydONFBHXNfJMETAcLN5hQ+x/5VODbq+jgeNjh4E+
	qlTvcOrrokK3NCFoDKplw4rxUUp0vOkfkZpHog+Fe2vj9jVtpBDK9g5jQ+vXV2Jr6fK2wR2iPkc
	dNe+exe1bzrkMFXYY80edQz3BWGZbOY5fx1k0k9KRv+MJDrE5hfZLYel8MiqRLpnuNPGA0WcGL/
	qbsavl1VDxAaa9iGqcqCmAq9TsYcfQCehPmeT5Y7K0EsvgwqOU24toyi6GpF3i2o+7WNA8aPwQE
	b29t6R2rLLcY3OGafy9hya3+/yDlPlMD9V18yorSkFqEVCn6ar/zTqAVj3ML1NMiHBTapiA/6DP
	7xwRFVfMAn6Wmg/3ysLdw5xAP779D8EjPksxgZ9qK+K6ZA==
X-Received: by 2002:a17:907:9288:b0:c29:f5d8:9c6c with SMTP id a640c23a62f3a-c2aadc48f8dmr294406666b.27.1790186523723;
        Wed, 23 Sep 2026 11:02:03 -0700 (PDT)
Received: from ?IPV6:2a02:a466:4d7a:0:1072:bb1c:c0f3:280f? (2a02-a466-4d7a-0-1072-bb1c-c0f3-280f.fixed6.kpn.net. [2a02:a466:4d7a:0:1072:bb1c:c0f3:280f])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae5c6f35sm166925266b.12.2026.09.23.11.02.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 11:02:02 -0700 (PDT)
Message-ID: <12e5e5ad-7d55-469d-a63e-d19e3279c6c1@pardini.net>
Date: Wed, 23 Sep 2026 20:02:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/7] arm64: dts: rockchip: describe PCIe RTL8125
 Ethernet on NanoPi R5S
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
 linux-rockchip@lists.infradead.org, Jonas Karlman <jonas@kwiboo.se>
References: <20260910-rk3588-dts-rtl-eth-describe-dt-alias-v5-0-c1b9e5f10cd6@pardini.net>
 <20260910-rk3588-dts-rtl-eth-describe-dt-alias-v5-5-c1b9e5f10cd6@pardini.net>
 <DLMV5WTF5TR1.BXDY94L4J4H7@cknow-tech.com>
Content-Language: en-US
From: Ricardo Pardini <ricardo@pardini.net>
In-Reply-To: <DLMV5WTF5TR1.BXDY94L4J4H7@cknow-tech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_110209_329304_547FDB47 
X-CRM114-Status: GOOD (  29.27  )
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

On 23/09/2026 19:15, Diederik de Haas wrote:
> Hi,
> 
> On Thu Sep 10, 2026 at 10:07 PM CEST, Ricardo Pardini via B4 Relay wrote:
>> From: Ricardo Pardini <ricardo@pardini.net>
>>
>> The FriendlyElec NanoPi R5S (rk3568) carries two on-board Realtek
>> RTL8125 NICs behind pcie2x1 and pcie3x1, alongside the existing gmac0
>> RGMII PHY.
>>
>> Describe the fixed function nodes and attach ethernet1/ethernet2
>> aliases (ethernet0 stays mapped to gmac0), so that U-Boot's
>> fdt_fixup_ethernet() can inject mac-address properties from its
>> eth1addr/eth2addr env, for stable MACs across boots that both U-Boot
>> and the kernel agree on.
>>
>> Signed-off-by: Ricardo Pardini <ricardo@pardini.net>
>> ---
>>   arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts | 30 ++++++++++++++++++++++
>>   1 file changed, 30 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts b/arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts
>> index 90ce6f0e1dcff..9ed11663c31c9 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts
>> +++ b/arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts
>> @@ -15,6 +15,8 @@ / {
>>   
>>   	aliases {
>>   		ethernet0 = &gmac0;
>> +		ethernet1 = &rtl_eth1;
>> +		ethernet2 = &rtl_eth2;
>>   	};
> 
> With my NanoPi-R5S I'm still getting the following warning:
> 
>    r8169 0001:11:00.0: can't read MAC address, setting random one
> 
> ```
> root@nanopi-r5s:~# ip link
> 1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN mode DEFAULT group default qlen 1000
>      link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
> 2: end1: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc fq_codel state DOWN mode DEFAULT group default qlen 1000
>      link/ether 4e:52:85:9e:22:f9 brd ff:ff:ff:ff:ff:ff
>      altname enp1s0
>      altname enx4e52859e22f9
> 3: end2: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc fq_codel state DOWN mode DEFAULT group default qlen 1000
>      link/ether 12:e5:47:9e:e2:f1 brd ff:ff:ff:ff:ff:ff
>      altname enP1p17s0
> 4: end0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP mode DEFAULT group default qlen 1000
>      link/ether 4e:52:85:9e:22:f8 brd ff:ff:ff:ff:ff:ff
>      altname enx4e52859e22f8
> ```
> 
> I did not do anything (explicitly) in U-Boot, but it seems it created a
> non-random MAC address for end0 and end1 ... and then stopped.
> AFAIK gmac0=end0 already had a non-random MAC address and I hoped/expected
> it would create non-random addresses for end1 and end2, which would've made
> the above warning go away too.
> 
> Is this an issue with this patch, with U-Boot or me?

Hi Diederik, in this case (3 ethernet's) I think it's down to U-boot.
Check the output of `printenv` in u-boot, you'll probably find it only 
pre-computes 2 MAC addresses, and doesn't feed the ethernet2 alias 
during its fdt_fixup_ethernet().

Try doing `setenv eth2addr xx:xx...` in u-boot before booting -- it 
should work. I think that's what I did when testing the R5S with this 
series, but it has been a very long time ago.

One way around this (without u-boot) would be to use Alexey's series [1] 
which could compute as many MACs as needed out of the CPU serialnum - 
but that also won't work as-sent vs rk356x, I believe he's checking an 
alternative proposed.

[1] 
https://lore.kernel.org/linux-rockchip/20260902-rk3576-otp-cpuid-mac-v2-0-e4b7fe2ab13f@flipper.net/

> 
> Full details:
> https://paste.sr.ht/~diederik/8ae7d354985afcd1c3464e3a4ad81da1b4442364
> 
> Side note:
> I wonder how 'random' those addresses are as during testing ``ssh rock5b``
> landed me on another device (NanoPC-T6 Plus), f.e. My router has DHCP
> reservations based on MAC addresses and it looks like it got confused ;-)

Interesting. I dunno what seed is used, as I've been fully set on making 
it non-random, but I wouldn't discard the possibility of conflicts 
across different machines. One more reason to have this series ;-)

I'll soon send a v6 to linux-rockchip/dt (with small fixes Sashiko found 
to DTs, and without the binding) and split a single-patch v1 to net-next 
with only the binding, collecting Rob's review. If and when those land, 
we'd have open road both for u-boot local-mac-address and Alexey's 
nvmem-cells for the RTLs.

Regards,
Ricardo


> 
> Cheers,
>    Diederik
> 
>>   	gpio-keys {
>> @@ -107,6 +109,20 @@ &pcie2x1 {
>>   	num-lanes = <1>;
>>   	reset-gpios = <&gpio0 RK_PB6 GPIO_ACTIVE_HIGH>;
>>   	status = "okay";
>> +
>> +	pcie@0,0 {
>> +		reg = <0x000000 0 0 0 0>;
>> +		#address-cells = <3>;
>> +		#size-cells = <2>;
>> +		ranges;
>> +		device_type = "pci";
>> +		bus-range = <0x00 0x0f>;
>> +
>> +		rtl_eth1: ethernet@0,0 {
>> +			compatible = "pci10ec,8125";
>> +			reg = <0x010000 0 0 0 0>;
>> +		};
>> +	};
>>   };
>>   
>>   &pcie30phy {
>> @@ -119,6 +135,20 @@ &pcie3x1 {
>>   	reset-gpios = <&gpio0 RK_PA0 GPIO_ACTIVE_HIGH>;
>>   	vpcie3v3-supply = <&vcc3v3_pcie>;
>>   	status = "okay";
>> +
>> +	pcie@0,0 {
>> +		reg = <0x100000 0 0 0 0>;
>> +		#address-cells = <3>;
>> +		#size-cells = <2>;
>> +		ranges;
>> +		device_type = "pci";
>> +		bus-range = <0x10 0x1f>;
>> +
>> +		rtl_eth2: ethernet@0,0 {
>> +			compatible = "pci10ec,8125";
>> +			reg = <0x110000 0 0 0 0>;
>> +		};
>> +	};
>>   };
>>   
>>   &pcie3x2 {
> 


