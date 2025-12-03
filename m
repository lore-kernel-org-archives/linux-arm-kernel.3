Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9672CD1BDD4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 20:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=la5DY+nye5Y4WsEMXBxzYTG6S0M/hvXAkvJ3L0NdBQ8=; b=1x474LP+dLtwGR0/W0ZQH1t6yr
	TgXSz3zWcKIXM8B4WN1vz0GsRBTvKhoi60DfEftDMig251h2iCbC8X6oDLkU3AgQfGKiMAlntBCYI
	gpf8vtq7xqODuYfVwlegm+BjXL9+EdrB7msKhulwn3EqEyNj7TEMsXaYNrnEs4K2vNEYzXqab/1PE
	YXMDt6ajWNwTZHotza5FdbBtJim4n0wFuI4tu/fE49ugrBRNH69B+wGY/+nz5Wj+YAFzs7D573NBY
	g0wiWZgwXwJaQzzGmnwMD0Dsr0l/t3RyOeQWAmhLWWhtySPFvs4+3iLgysrCq6tnf7bMe09z1QnuB
	D2+azjjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQtNc-000000071mX-1yGB;
	Wed, 03 Dec 2025 20:23:16 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQtNZ-000000071kQ-2QpA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 20:23:15 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso2240435e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Dec 2025 12:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764793391; x=1765398191; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=la5DY+nye5Y4WsEMXBxzYTG6S0M/hvXAkvJ3L0NdBQ8=;
        b=FnQ96lmMCnTwr7Z0kjGmauXNPVIM4zg/SSjl2MxUD4ftx0tTg+qxdBVgs5JLrZv+XM
         5gxcOS2RkkdnW26p5Tc05dLGx7J4hkVO2mo4aMVRMB6384vEtHNpI7VeyXxMOpb8ytb9
         uzY9Y9LNpM/GhUnTwx9RG7LExGl8P+3VqX2XHQN+NrDdlwZc/NaQTf0wOdSGNjfbSHHi
         SLVHck9t4ACiKuBto/IrLs3Ysfl8MF3D7s+3LdwJBgi4qHHtHPEsC0zEAQ/W0vhJd2aX
         sP6A++7zc4JjmCXGPdy8S5jiWdOL6FH/XxzDIrn7wz6Ro/S6XPojAVIbAATvGmP5VU1p
         8K2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764793391; x=1765398191;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=la5DY+nye5Y4WsEMXBxzYTG6S0M/hvXAkvJ3L0NdBQ8=;
        b=Gr+lUCgiJ/0N2GhG4emvOcmQoipSb9Mz9arg3rlauGHyrOSVDlmyFnajrncxNGq0+6
         efPH8eafETJQ//rhYfIRKUiflrqxkE7cPQwcXTCtebz7rRezCqUvX7bBLjxBEYT5oayj
         CPJRAKrXJg054GfRsaqgp5zAY1hXmFWXoMORJjRc8J85Y2fUd/FJWBgmSWyXI8cikVsm
         l415FVZHe/0ZTHplRKlbXC156MLwIev5JeMAmc4/etDNv9Rpkn1/y/dHi4qRSWRjHMCg
         pCIblI9mBorbq4iol9qPRunGZzVyCvCQJ0zFHQ7ydXyqJ7t/s3O61MHmP5B14F/WvGA0
         aupQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZQRT4oxoQkld7epNERgW+KmQHjNurh6E84qv0081tfvJ9ZMIx2p2+JL0Jt93TtL8kcfH8Ei+Em33LdA+BK1Pe@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/ATb8Hxxm0o6m18RL+zoNJNyHdGNfsQRsdEyltfVqFKyUZsS8
	0N5StNOliE8ch1pXOtQVgyVy+ZEIpHFxqdy6MqHwYGr7Z+0vXYKcHpE1DZIp
X-Gm-Gg: ASbGncsweMbP0lw6pXVf89InDJEpYEu7j+Hk/fxXxTQ1QOZv0wOsCiTqbYRek+TVB7U
	IVurPMQN+WUBvqLven6cqCk6S6U2EDpua27Ejxa2kHfVZ4IRqhjfs0atWhUQ7ppysQfDvtGHbTq
	6g0+7bv38oGbB606JLmbwFrS6ln9AcJexyFyO2tKUZUMuDdMHwrpTIT3tru5fm1UZycI79DSy6s
	sO6O5W8zu3DdxhxISRMTY0m74LyUoCXGmgC0Z65+ye7XvLOp5WQdRNWmQXH7OCWiZliMGKFMZRQ
	89OvtAvexJp1RuajoXEm/GiIylfudy31nDWv2ozsux25goAZKCszl6DPYNQbOPBV5c3orwUR3LK
	XKtmW7RRuOqSfBTw4VAKl8qWwQYZEMqWjqyh6uSTJvoxUeqWFdR645EVKvRdFCczjYHvdp7XiZj
	ZzSDOHF7QWgp2/4AgmLI9OarznSCrzdY5REMCNsIYIOmB8PM/3DPYumtiaC9/SlkzfIdM=
X-Google-Smtp-Source: AGHT+IEpGSW/EFraUJRRr3A4U1L8grZ6drN7sy7XuL6+qwvpsW1qlvzAiO5Upxd981TrT5V2Ub2FOw==
X-Received: by 2002:a05:600c:4443:b0:477:9b35:3e36 with SMTP id 5b1f17b1804b1-4792aedfbf4mr38189915e9.2.1764793391265;
        Wed, 03 Dec 2025 12:23:11 -0800 (PST)
Received: from ?IPV6:2a02:810b:f13:8500:3079:1d24:47d4:553a? ([2a02:810b:f13:8500:3079:1d24:47d4:553a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4792a7971c7sm68875275e9.2.2025.12.03.12.23.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 12:23:10 -0800 (PST)
Message-ID: <f0df035f-3c3d-4649-9f48-3e8e2e69d17b@gmail.com>
Date: Wed, 3 Dec 2025 21:23:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: rockchip: add SPDIF audio to Beelink A1
To: Robin Murphy <robin.murphy@arm.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250828164300.3829488-1-christianshewitt@gmail.com>
 <66ae20b3-3316-4ec2-9c51-8414c053dc32@arm.com>
Content-Language: en-US
From: Alex Bee <knaerzche@gmail.com>
In-Reply-To: <66ae20b3-3316-4ec2-9c51-8414c053dc32@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_122313_654076_02CC42A7 
X-CRM114-Status: GOOD (  15.64  )
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

Hi Robin,

Am 03.12.25 um 17:21 schrieb Robin Murphy:
> [ Just noticed this... ]
>
> On 2025-08-28 5:43 pm, Christian Hewitt wrote:
>> From: Alex Bee <knaerzche@gmail.com>
>>
>> Add the required nodes to enable SPDIF audio output on
>> the Beelink A1 set-top-box.
>
> But the A1 doesn't have S/PDIF? Only HDMI plus a 3.5mm jack connected 
> to the analog audio codec (and possibly the composite TV out) :/
>
Yeah, sorry - this patch wasn't supposed to be submitted upstream.

Regards,

Alex

> Thanks,
> Robin.
>
>> Signed-off-by: Alex Bee <knaerzche@gmail.com>
>> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
>> ---
>>   arch/arm64/boot/dts/rockchip/rk3328-a1.dts | 23 ++++++++++++++++++++++
>>   1 file changed, 23 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3328-a1.dts 
>> b/arch/arm64/boot/dts/rockchip/rk3328-a1.dts
>> index f7c4578865c5..b276a29bdd85 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3328-a1.dts
>> +++ b/arch/arm64/boot/dts/rockchip/rk3328-a1.dts
>> @@ -58,6 +58,24 @@ ir-receiver {
>>           gpios = <&gpio2 RK_PA2 GPIO_ACTIVE_LOW>;
>>           linux,rc-map-name = "rc-beelink-gs1";
>>       };
>> +
>> +    spdif_sound: spdif-sound {
>> +        compatible = "simple-audio-card";
>> +        simple-audio-card,name = "SPDIF";
>> +
>> +        simple-audio-card,cpu {
>> +            sound-dai = <&spdif>;
>> +        };
>> +
>> +        simple-audio-card,codec {
>> +            sound-dai = <&spdif_dit>;
>> +        };
>> +    };
>> +
>> +    spdif_dit: spdif-dit {
>> +        compatible = "linux,spdif-dit";
>> +        #sound-dai-cells = <0>;
>> +    };
>>   };
>>     &analog_sound {
>> @@ -325,6 +343,11 @@ &sdmmc {
>>       status = "okay";
>>   };
>>   +&spdif {
>> +    pinctrl-0 = <&spdifm0_tx>;
>> +    status = "okay";
>> +};
>> +
>>   &tsadc {
>>       rockchip,hw-tshut-mode = <0>;
>>       rockchip,hw-tshut-polarity = <0>;

