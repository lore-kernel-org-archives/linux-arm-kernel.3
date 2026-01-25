Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E0DBE63CA4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Jan 2026 18:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YPoViYNjyfGmUsvPf8KRXEGZpQr2hqfqFw85F8RnlH4=; b=Vq1ozo5bj7I2Pj543Y6jA0UwYi
	3UoLKLU7Hr6EDr7EUFwCJY2+NdLSzn4N4VF0F2D9p3Z117IiZ3oYKEthI/g0aZdNqkU0FbaQru+4v
	kp/YZeZfVdz45R0V3r5fVcjyFzcUxbc+m2Kawq9eUAFUXU1C7r6qH0lVTI8uLz6jMOWQo7pyQpppI
	9ujKayJvjXKWNIhEeWEQsdftC/3taTNrZtVka1x50xsqHITnzIXhIAPYH97C/h3LCugRt9w4FrOXk
	HXxUBEWPwJ7FUc+W5pRXHQkOPJn8JYe2LJZaKUiLYYHMjktobuymvGXZMz0STrd0ohFi8MouTpv4v
	OA8S3nFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk4TJ-0000000BNIZ-0JsM;
	Sun, 25 Jan 2026 18:04:25 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk4TF-0000000BNHr-3zmI
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Jan 2026 18:04:23 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-42fbc305882so2256445f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 25 Jan 2026 10:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769364259; x=1769969059; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YPoViYNjyfGmUsvPf8KRXEGZpQr2hqfqFw85F8RnlH4=;
        b=CE4Zl9viHMRz7BU4dqTO1k/MMRyBMOBRIqaQdLekzlrfEhZkCrHCP7s4CeI7rScPAt
         t3uHHTsxaCWA/fdBVxtJFj8c0Dha6CX3/KfyPh0hoji6xQTqPO7O5Wu634chF9GSsz/h
         RshP/EdmWXIejlCxWTS4ChtXbQrGVUv+2GkPY1qnBsGZIsNbeFIPe+VV04PY6CgMTWGa
         /gU5yfHl/jJJOo+L6qpJt0PG9ea99XTYMpdiaAH23mF7AXn4gGVSuQPG/Pvqr/0M9QRE
         biLGHwUbZkg1E1Fv9nR1iHLP9Djn3qPh/VnkSulMO45FUTzBbYZ21MPxl/p8qZ7w/Kdd
         LiyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769364259; x=1769969059;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YPoViYNjyfGmUsvPf8KRXEGZpQr2hqfqFw85F8RnlH4=;
        b=K9xFLzRJffkmle0ASZx3Gf24k0iXhkz2Poe8xpA2ptxiwJ3qqMakWeT4Z2u3sa6uDg
         zGZhb8PLymj9mzsUqGZLVEkb0bbPwO91hh9Fk9BDkMS1nFPw82vfaREjchg8HBQGUi9T
         KNTwpdQBLF2/a8oyZHgU0wBAJqG1HqrwWhoNQYFUDwlhCeI3YHxoR9PZyzxYZSQbD1Ra
         2ni1RyBAhX9CGFPPrSXuWN1y12m0hd0kI2VGzN21TjukTfqG9+40z1+j5pfABlYURImj
         NB1ZdCE9UFFbsj5OtplJcWggWALFrTodO1uFOJfogJy1tmmqqFdeNGdyhw0N0TXTqyrY
         EuMA==
X-Forwarded-Encrypted: i=1; AJvYcCUHJey1o5AuFi65r7kuXn+Bmmw8IzU4ZKCm8mukPy24OqjvwJtv0GpwT1ONAw435MyJbKELUFWTD6jqFfkb9Hjo@lists.infradead.org
X-Gm-Message-State: AOJu0YxC9wN+6RRpAY2YdpNaFvO5QMdF0Ll6YHo07evJJwaQBeXIjzpC
	fJk1WMBpP8/CFQgbSF2AHY4sa4viTjCLOYj9d5wFTG/ce8Fw2Up8H9UZ
X-Gm-Gg: AZuq6aK0HrWIb2dDQJs7QF0ApjASStUG5fhjgDSthv6aMgWmoDQRqLKHoVv8cB1LJxS
	mVp/lJ2XauzzIc+wHiE093+Yo0KiPD5ROKQ0lYjclEwfOQ+I8mEyT/d3O+VFcHIhgZJtuK2Atp4
	pc2Nzh6owwlEQfEZ6pnWlQWAD77qaurj8vw9PNeg2q6RRvngAYgYEOpJS2GmWGjBS4aK+6NTVdQ
	HApx/nedAoe1EQQXT7AFc+pWG78Nw9k9KlhXL3lh8qlXGIMBoWsfbcr+VcCSjaineC6ch73UBkH
	vtIFBRu0o+13sGwjbTBNF6C9z+3ZG+5mTHO6Xx19qhV/XgDTvPWmbKZrOP0JDc+LtFP69NsTjfG
	5NoHLBdFz9lJ1wMUT5myPhzyAJZyjR1qCarpa47Lzqysgi2+kODRE8WMrsznKUnK9SfRQr2ESW3
	Of4EBgiRV8dh26D/r4EcGAvJOFMUt8nVm5UYuipkSvN14J4vhgRrK5Ssm4eEA6CkeEHDJOsoeXP
	Q==
X-Received: by 2002:a05:600c:c16e:b0:477:63b5:6f76 with SMTP id 5b1f17b1804b1-4806111e38emr4511635e9.25.1769364258971;
        Sun, 25 Jan 2026 10:04:18 -0800 (PST)
Received: from ?IPV6:2a02:8010:6606:0:fd30:74ec:a5b0:107a? ([2a02:8010:6606:0:fd30:74ec:a5b0:107a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804d6588e3sm84017525e9.3.2026.01.25.10.04.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Jan 2026 10:04:18 -0800 (PST)
Message-ID: <6235f7ee-d0fa-4c46-b98b-54af4d9d5ce8@gmail.com>
Date: Sun, 25 Jan 2026 18:04:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: rockchip: add pwm-fan for NanoPC-T6
To: Dragan Simic <dsimic@manjaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Alexey Charkov <alchark@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251109192128.72527-1-sigmaris@gmail.com>
 <da6721a3-8f59-9c0c-762c-bc02b39ac472@manjaro.org>
Content-Language: en-GB
From: Hugh Cole-Baker <sigmaris@gmail.com>
In-Reply-To: <da6721a3-8f59-9c0c-762c-bc02b39ac472@manjaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_100422_022171_33B41AAF 
X-CRM114-Status: GOOD (  31.81  )
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

Hello Dragan,

I haven't been able to test patches for a while, but now I have access to
the NanoPC board again, and I've done some tests:

On 10/11/2025 00:23, Dragan Simic wrote:
> Hello Hugh,
> 
> Thanks for the v2!  Please, see a couple of nitpicks below.
> 
> On Sunday, November 09, 2025 20:20 CET, Hugh Cole-Baker <sigmaris@gmail.com> wrote:
>> FriendlyELEC offers an optional heatsink and fan addon for the NanoPC-T6
>> and T6 LTS, which plugs in to the fan connector on the board driven by
>> pwm1. Add the fan as an active cooling device for the SoC package.
>>
>> Signed-off-by: Hugh Cole-Baker <sigmaris@gmail.com>
>> ---
>> Changes from v1: https://lore.kernel.org/linux-rockchip/20251026194858.92461-1-sigmaris@gmail.com/
>> * add the fan to the base board dtsi instead of overlay (Heiko)
>> * just use 2 trip points for warm and hot temperatures (Dragan, Alexey)
>>
>> References:
>> FriendlyELEC heatsink with fan addon:
>> https://www.friendlyelec.com/index.php?route=product/product&product_id=305
>> Vendor DT with trip points and PWM duty cycle values:
>> https://github.com/friendlyarm/kernel-rockchip/blob/4944602540b62f5aad139fe602a76cf7c3176128/arch/arm64/boot/dts/rockchip/rk3588-nanopi6-rev01.dts#L75-L90
> 
> I think it would be better to move these references to the patch
> description, so they become directly available in the repository.
> It might be the best to use the "... [n]" form for the references,
> which puts them as close to the backed contents as possible.
> 
> Oh, and I think that "arm64: dts: rockchip: Enable active cooling
> on NanoPC-T6" as the patch subject would read nicer. :)
> 
>>  .../boot/dts/rockchip/rk3588-nanopc-t6.dtsi   | 39 +++++++++++++++++++
>>  1 file changed, 39 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
>> index fafeabe9adf9e..9164a0ee6228e 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
>> +++ b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
>> @@ -11,6 +11,7 @@
>>  #include <dt-bindings/input/input.h>
>>  #include <dt-bindings/pinctrl/rockchip.h>
>>  #include <dt-bindings/soc/rockchip,vop2.h>
>> +#include <dt-bindings/thermal/thermal.h>
>>  #include <dt-bindings/usb/pd.h>
>>  #include "rk3588.dtsi"
>>  
>> @@ -89,6 +90,14 @@ usr_led: led-1 {
>>  		};
>>  	};
>>  
>> +	fan: pwm-fan {
>> +		compatible = "pwm-fan";
>> +		cooling-levels = <0 35 64 100 150 255>;
>> +		fan-supply = <&vcc5v0_sys>;
>> +		pwms = <&pwm1 0 50000 0>;
>> +		#cooling-cells = <2>;
>> +	};
>> +
>>  	sound {
>>  		compatible = "simple-audio-card";
>>  		pinctrl-names = "default";
>> @@ -591,6 +600,36 @@ &i2s6_8ch {
>>  	status = "okay";
>>  };
>>  
>> +&package_thermal {
>> +	polling-delay = <1000>;
>> +
>> +	trips {
>> +		package_warm: package-warm {
>> +			temperature = <50000>;
>> +			hysteresis = <2000>;
>> +			type = "active";
>> +		};
>> +
>> +		package_hot: package-hot {
>> +			temperature = <60000>;
>> +			hysteresis = <2000>;
>> +			type = "active";
>> +		};
>> +	};
> 
> It should be better to use 55 and 65 oC as the trip thresholds,
> because people often report around 50 oC as the observed idle-state
> temperature of their RK3588 SoCs, so increasing the first threshold

Were these people using the heatsink accessory on the NanoPC-T6, or were
they using some other board with worse heat dissipation? I recorded the
package temperature on my NanoPC-T6 with the FriendlyELEC heatsink and fan
and even though it's not idle but actually running Home Assistant,
OpenLDAP, PostgreSQL, Prometheus, Grafana and Nginx, the temperature ranges
between 46 and 48°C, and the fan never even spins up.

Then I ran stress-ng and recorded the temperature under CPU load, with this
version of the patch and another version with 55 & 65°C trip points. [1]

I suspect if people are seeing 50°C at idle, they're either using a less
effective heatsink, or in a very warm ambient temperature. When talking
about the NanoPC-T6 fan specifically, we kinda have to assume the
FriendlyELEC heatsink is used, as there's no mounting for the fan without
the heatsink.

> to 55 oC should be beneficial by preventing the fan from spinning
> when the SoC is actually idle.  The second threshold is usually set
> to be 10 oC higher, so it should end up at 65 oC.

I'll send a v3 with 55 and 65°C trip points, but I doubt it makes any
difference to the fan activating while idle; from my testing it seems to
just let the SoC get a bit hotter under heavy load.

[1]: https://gist.github.com/sigmaris/2d5590271cf26da8ec6cfc7ef8e3e8bc

>> +	cooling-maps {
>> +		map0 {
>> +			trip = <&package_warm>;
>> +			cooling-device = <&fan THERMAL_NO_LIMIT 1>;
>> +		};
>> +
>> +		map1 {
>> +			trip = <&package_hot>;
>> +			cooling-device = <&fan 2 THERMAL_NO_LIMIT>;
>> +		};
>> +	};
>> +};
>> +
>>  &pcie2x1l0 {
>>  	reset-gpios = <&gpio4 RK_PB3 GPIO_ACTIVE_HIGH>;
>>  	vpcie3v3-supply = <&vcc_3v3_pcie20>;
> 

