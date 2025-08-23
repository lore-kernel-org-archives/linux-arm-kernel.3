Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 487E3CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 10:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=63rf6UW69I7dzJvUbjS/g+o800Qui00mrJJtWDKwN9I=; b=hg3UJptyJ4Zz6CU/kzqFdLUYKW
	qqP+PYZuJA04nOCORErHwGAxXOWZJSzDg8LVg/OhhL2eDOruOcM/5daLXDTz9BkwQIC8meiGENc22
	zDA6b1Jl6+QHriqSSAVMULx0o5h3lUeiKjsVf/SnNRryfqJOs2qcdLZpN+vT2dgdCM7ywSGQRjupr
	60cJP1GVgtDPnjyGJrUOyW6nMuhiMeFPZi21Hhiha1jJTJRaig1lkk4UTRdp6uZ//GNOmbQ/dIUkI
	OskU6rypDXrT8l2KYTbQQtJntS6trA1s6AB6vYWe7Qg//Bqyev+OGBvF0nemMQAeNEs5ryFb5rebc
	Hs+zVh7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uplLT-00000004csa-3hHd;
	Sat, 23 Aug 2025 10:19:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upju8-00000004PFN-2Sr4
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 23 Aug 2025 08:47:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=63rf6UW69I7dzJvUbjS/g+o800Qui00mrJJtWDKwN9I=; b=ch8MqeTO72C1idIVXT7tJQ7/Pb
	kzjjdcFRvVjkHh3Hyuauu/TtzB7saiKGTw4tX/mqW2lIyvBoBj4zl/ly/J9pGbfpiRaehjfdydfC3
	6LkQ3KCjzRz8Wko3nsFkurBdp4WVo9XmCP1a+xP1mllwjYOMXvAVqPLIrMvSo8ZGVN/25icNEbJs6
	Tq4z0lg2EKFxMKWefTbb1kLXCAXpAWn2EgDilnx7+pnCXq419iCwrJag2Kwottaq6ATf6YJemGZ6V
	Y7J/h2CkhHwRKaMnllnqaFFrZ3AasqQS0LuxNR7yUJ0IxZXWSOXtCjmi/zC2kCFJXJg1Aft3dCoFa
	y1JwK3nw==;
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upju5-00000001MyU-1cHO
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Aug 2025 08:47:15 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-afcb74bef86so39561766b.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 23 Aug 2025 01:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755938831; x=1756543631; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=63rf6UW69I7dzJvUbjS/g+o800Qui00mrJJtWDKwN9I=;
        b=KGkoy810venxDfi56kfkX9QyBW9MXLvV702lhkU/F89UGoMEqEwkpYb73mU47BfAY1
         k/5HibRwnvsFPjoe3R60XsKyPFj9svi73GFVPTDsViMtZrcvWh9YStduRZGNWwyRL3C8
         Ox4l8v5lgLIC3Dl560ze0gsejmXUh5zzU7M/FSS1Vnv/lnEGQWHqlCrqip34dL1XW843
         LJTREqNDTNPhjzPaF2+DEjXhE3QHYPwboIyZ33BsfpWO5hezvHlcHQkNQocW+67xSJ6p
         +bo2mj/ozyA+YhTLOVWBMv7vOLzE/AnYXKQp/i7eUVex6+zQuMjbsFMZq485UUq4sDVU
         CA0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755938831; x=1756543631;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=63rf6UW69I7dzJvUbjS/g+o800Qui00mrJJtWDKwN9I=;
        b=JELBHE4P3vyMmflkkkF1oHHmA0mMIAAgY7GdVG9HhKQf3t8ha1l/lsuWhonu8IFrk9
         ctAyXPZt5bz8C2gT6/Ba6vd5lo5xqd1BYh4GbGLU8g3WozMWUJVTMoZPN7tgjUqlEUat
         w1BxGgjVrvU1BQrwMZzatk+SERsUHOEB71FnAwrJ9SaIcRjV6xZh9dw3Z6NgQXS1G3Hd
         k3EGDUX5mKOVT65lVbdh5+hDNIlNHn8UV0uvM/oPXY/eSntzC/oGR0nxDWTiAWnQdzLW
         3YACKl2aXdXGCuOQ0z7Hhacv64WryK7aCpWORaVIKdBThhHLe5oS+S7MnnmS0LKpkaWN
         WUbA==
X-Forwarded-Encrypted: i=1; AJvYcCXeqvTvkuIzuSh5lQ08/9ht+n9zVT+VmXNuGNvjOQg22ksEBUkV2ERXbLj0mG5RD9EedcNwB6L6Ylg4rvPiSI5K@lists.infradead.org
X-Gm-Message-State: AOJu0YzX+8DhIrlli/bmfG4hyniWEMviwU0+HDYnzZSxkeMj4ZTxSeeB
	tE9Ul+HL47JhmHTsxcdZQCQH00a+p+abh6gupwpDfisSObxxjVkkDndnQ7Tq0QYNY/I=
X-Gm-Gg: ASbGncupmlLajkXhJnCXON12m4X8wqNC720F62xHvWks/LTn4U/afQwWCouWyAByNex
	n5UvNf9EALDOBiLOHNw6PhrTem1fsFeTgUgmxJGWJ8vXZHeQ+18zUJeecVydlnHt1jarzdU+iRu
	KF4efY1C58Ktkgf0OuYRH3N62xp7r859Jh6yaoNajnHgpInrJ8sLlZ0hQaThaekWfAQvkzKsbMe
	bTtVzLmlxsXszVajclZlNbaJfLuZpq9STrHQDoelAY2kX9Zb167h62A2FhZ56DXOS2mPLIFiYvi
	GmTpHiAXE27vye5Z8EpeO/43f9UBZnh6jieZgmA00rKAfoNaqrvVeRJ8RNTbgNXDIcegGPacm4q
	ottEGIq0PT5ulD1jSp/PvtQX93oSdTPbPrGM/+7NoNp0=
X-Google-Smtp-Source: AGHT+IGTEJ8SbKPY7zKGNwC0BrMP8HgDH2XNiA3vCklY0PS5TihvmIa43Qo9BCTwLKgAiIe+jA7kiA==
X-Received: by 2002:a17:906:4fd2:b0:ae0:da2d:44bb with SMTP id a640c23a62f3a-afe28f07324mr255351566b.1.1755938831294;
        Sat, 23 Aug 2025 01:47:11 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe4900a18asm133130666b.49.2025.08.23.01.47.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Aug 2025 01:47:10 -0700 (PDT)
Message-ID: <ee241506-96a1-431e-a7a7-2e5848fce0e0@linaro.org>
Date: Sat, 23 Aug 2025 10:47:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: marvell: armada-cp11x: Add default ICU
 address cells
To: Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250822133329.312326-3-krzysztof.kozlowski@linaro.org>
 <20250822133329.312326-4-krzysztof.kozlowski@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20250822133329.312326-4-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_094713_573189_0A1EDC53 
X-CRM114-Status: GOOD (  17.04  )
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

On 22/08/2025 15:33, Krzysztof Kozlowski wrote:
> Add missing address-cells 0 to the ICU interrupt node to silence W=1
> warning:
> 
>   armada-cp11x.dtsi:547.3-47: Warning (interrupt_map): /cp0-bus/pcie@f2600000:interrupt-map:
>     Missing property '#address-cells' in node /cp0-bus/bus@f2000000/interrupt-controller@1e0000/interrupt-controller@10, using 0 as fallback
> 
> Value '0' is correct because:
> 1. GIC interrupt controller does not have children,
> 2. interrupt-map property (in PCI node) consists of five components and
>    the fourth component "parent unit address", which size is defined by
>    '#address-cells' of the node pointed to by the interrupt-parent
>    component, is not used (=0)
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm64/boot/dts/marvell/armada-cp11x.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi b/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi
> index a057e119492f..d9d409eac259 100644
> --- a/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi
> +++ b/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi
> @@ -202,6 +202,7 @@ CP11X_LABEL(icu): interrupt-controller@1e0000 {
>  			CP11X_LABEL(icu_nsr): interrupt-controller@10 {
>  				compatible = "marvell,cp110-icu-nsr";
>  				reg = <0x10 0x20>;
> +				#address-cells = <0>;
This is not GIC, so it might need bindings adjustment. LKP reported:

interrupt-controller@1e0000 (marvell,cp110-icu):
interrupt-controller@10: '#address-cells' does not match any of the
regexes: '^pinctrl-[0-9]+$'

Best regards,
Krzysztof

