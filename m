Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91D81F46130
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 14:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mw89EmH8qUZwnDDKLdU6WpDiI5F4oXbKdFeBF7Ff7+U=; b=hEcpERbw6/N8wkIz4iFX4vLtBj
	1Vk9702nF6YqigJh5Ww0P7Q6ERJPkfhjkwyjTPRF3G1Wx5fLJP+DzxHQVXI8WZeHPgXfuV7CtxK2R
	ruByp2WLgryneHqeYgHPpREa3dgGZZcpwX+2uO90q2rUQQu9hlozLWctMNFhZqofnF31txnRj42sg
	1p3YTmpRiewOuMloyPFfdU6eBpB48+HxkHmYLVsoq+r9ouwcL1/ChazwiYlrJePXd9zjBampeLk+2
	L6gz/0gULhs4Zy08L7q9naaXLTClOc2GkCGecjX8qc91nFnbLNhq6yaR7TTlfiTwN1zt6K6mXk60y
	Rah6LufQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4gVV-0000000Gwm2-1bn3;
	Mon, 23 Mar 2026 14:43:53 +0000
Received: from mail-dl1-x1232.google.com ([2607:f8b0:4864:20::1232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4gVS-0000000Gwlf-3xs6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 14:43:52 +0000
Received: by mail-dl1-x1232.google.com with SMTP id a92af1059eb24-12a71ade78cso271437c88.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 07:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774277030; x=1774881830; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Mw89EmH8qUZwnDDKLdU6WpDiI5F4oXbKdFeBF7Ff7+U=;
        b=CUMMSIYRU9kXXp+E3GGQ/CWQho3lDbfgpawFMbo3O4Jw1jtKzagzWbsIcBK9RvQ+BT
         XFY3wG+ZsrJz7OUQDGLTieaTUp3m/FxhzBpqzdYY2VCrrJcYJdN5f69t+el8NnpgoIsZ
         TmmM62YFe3dYyogp0gXYOjeFKT1XInIA8kRLT/HfPgokxJHdqRjibpS0/UY7z1Q7pmR5
         Ez5pqxCpRfyIj+UMH3vpxRVVN1hxQURuAUHXNjDKcBp2Dya+eYIjgjcAVo0Yan+Fvp4/
         EVzMDoBOo5moA+eMbS37LqGOLB5RtUJgxmpw+uKefbDqNovNwD6LgfDNw1VRVvRTlHVN
         /QAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774277030; x=1774881830;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mw89EmH8qUZwnDDKLdU6WpDiI5F4oXbKdFeBF7Ff7+U=;
        b=UZryY8G97OvIw7k0sAErohiCBuLxgX9GTpgZuihQeSvy8IfbR8IrV79QpLaotOn0J7
         1e/dgHeQu0YFufokc/KsaLg3jL6dXR3opwSO1CZtGtOdkdJayvli9Ymul+PTbL+wGjnl
         ba+tiFPVQR7/35/6bbB2A5pZKwkQmYzzmo/KiTSdNvkVhF+thubklOzRZhkZJWjV7iPO
         PR7KkMYk0x2XC+OdVGt6CPtQ8V0YKCxsEpxZpluyrQ7biXy+p90F9FmdEgx33F5ApD4X
         num/h3Kp2qEhOgVjvt8/AN/Eg+m6+GbgeAouOFBseoBy+fLfaoagwC9EsLBvcCENFstW
         Ls4A==
X-Forwarded-Encrypted: i=1; AJvYcCWrpY9TKWrk3p8Du9/6q/jmTwNvHcM6Bvl6b5e0FkOofZYmP6EzKp5+UckWkcU273d1a5gV9LAETPqt7EBzwlp+@lists.infradead.org
X-Gm-Message-State: AOJu0YwEVK4+zdB0vZiJyT8EFhsyEs1FVvHjGTywPN7C5CmPopcLRgmO
	EHtCQ73TJ3P4r+PsaR0gRz70ef3eeTSxqP2MmXBQ4OG0UtffXOaXoPCH
X-Gm-Gg: ATEYQzyYztJStcKQSDSH5YcTv7EjZODzMvtpAHJgbuMkC1VmNmPmHnp9gRQfFIpd7q3
	iFuWKMtx7jbk2VvJbAeP5qlr3yqk0WJ5erVdCzEXNJvoUwBYRkCrja4a3yPHjx7MUMSGPMzgmD/
	gLADf2raNvRy0+1zL291TRYcP+UGihO2e7zgmFxNC0MhNpHCiMo/gpiKHua61QB42C09iZgt18e
	lSDX3twgyrXwn3XXsGeSkbJcoQA3heAPdMi9vC9K6qJ0A8SPS46SS2KNx01IMcCvpZRlSvHTzeN
	mmHPH/B/aiTOUXlYOto4FbLvwGoCvey/dWZiq1xCXu+ZCdMj0AlrUvJkchB92gp5BDo/5FTnXWq
	61iDLG/w0yGXPRZB8xEPHGfE86ftCWNkZ7elAyZTHqBXddXeO1BXQYSQfg4a0OXiZgZlx0Cv52k
	1epNWsrjM5UEOL8agL5HaTbwAtLUe2wXs6OVQDsQ7fDg3zj5SXn4IjggoaUhjLYlzyeyDxOW6V
X-Received: by 2002:a05:7022:327:b0:127:5cd6:fa45 with SMTP id a92af1059eb24-12a72684c44mr5788964c88.14.1774277029439;
        Mon, 23 Mar 2026 07:43:49 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12a733e794esm9375194c88.6.2026.03.23.07.43.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 07:43:48 -0700 (PDT)
Message-ID: <72ba643e-c716-4332-bff0-f9d12add0cc6@roeck-us.net>
Date: Mon, 23 Mar 2026 07:43:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon: emc2305: Add
 fan-shutdown-percent property
To: Daniel Baluta <daniel.baluta@oss.nxp.com>, florin.leotescu@oss.nxp.com,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Michael Shych <michaelsh@nvidia.com>,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: daniel.baluta@nxp.com, viorel.suman@nxp.com,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 festevam@gmail.com, Florin Leotescu <florin.leotescu@nxp.com>
References: <20260320152959.1575978-1-florin.leotescu@oss.nxp.com>
 <20260320152959.1575978-2-florin.leotescu@oss.nxp.com>
 <8a8d2991-cd85-4aed-a7ef-a90b0cd10fbd@oss.nxp.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <8a8d2991-cd85-4aed-a7ef-a90b0cd10fbd@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_074350_991480_552C9BB7 
X-CRM114-Status: GOOD (  18.34  )
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

On 3/23/26 02:10, Daniel Baluta wrote:
> On 3/20/26 17:29, florin.leotescu@oss.nxp.com wrote:
>> From: Florin Leotescu <florin.leotescu@nxp.com>
>>
>> The EMC2305 fan controller supports multiple independent PWM fan
>> outputs. Some systems require fans to enter a defined safe state
>> during system shutdown or reboot handoff, until firmware or the next
>> boot stage reconfigures the controller.
>>
>> Add an optional "fan-shutdown-percent" property to fan child nodes
>> allowing the shutdown fan speed to be configured per fan output.
>>
>> Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>
>> ---
>>   .../devicetree/bindings/hwmon/microchip,emc2305.yaml      | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
>> index d3f06ebc19fa..7bcadfab9fc4 100644
>> --- a/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
>> +++ b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
>> @@ -54,6 +54,12 @@ patternProperties:
>>             The fan number used to determine the associated PWM channel.
>>           maxItems: 1
>>   
>> +      fan-shutdown-percent:
>> +        description:
>> +          Fan RPM in percent set during shutdown.
> AI review suggests to update description to 'Fan speed percent' or 'PWM duty cycle in percent'. This could be an easy update.
> More important question here is how should we proceed with the following observation:
> 
> "fan-shutdown-percent property is already defined identically in pwm-fan.yaml."
> 
> Guenter, should we move it from pwm-fan.yaml to fan-common.yaml and use it here?
> 
> Our initial thought was to add have it merged in microchip,emc2305.yaml as it is now
> 
> and then factor it out in fan-common.yaml in a later patch.
> 
> 
> What do you think?
> 

Both are fine with me, with slight preference for the second approach.
Please do whatever gets approval from DT maintainers.

Thanks,
Guenter


