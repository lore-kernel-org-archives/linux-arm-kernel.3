Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23AD7C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 08:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uBQhgtS9ybuOxHj6AdnuF/Cq3dS0a7fHWP3yItbSd2c=; b=mq8mY+W+7kbJWOYfiaYLVBKase
	ZfzWeiU8mwuQv7+y7Go3b/epiegPoaIkWQNsaaze9X8EC7JvPoxDcZrnyFjNdo3F7oCEWtnf87BJa
	CTgQlOagGx1pMU1W79Y+ymq7Bz/zn24W+pgvYpx6hsO+kkvbOfrr1KgLvFjmJ9eL0iWiSahiGscfI
	DMLMG4m3XRUg6YuvLbJL3b7YxHCVSmDWmKhMd3IJSH+Zo73qiSWQBRVBU9VuwBX55VqMZ5LCJ7aY9
	XeUPyu9OabFFQJJXWY1mmUwR0t/mgdzO2soml/cMTe0ZLfrifmtiKrpiEXpcuCV6KdPYVbdXKVYGu
	J3vr60tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCaMt-0000000EniZ-2pUH;
	Wed, 07 May 2025 08:43:07 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCZWb-0000000EbBC-1uHU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 07:49:09 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-736c277331eso588911b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 May 2025 00:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746604144; x=1747208944; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uBQhgtS9ybuOxHj6AdnuF/Cq3dS0a7fHWP3yItbSd2c=;
        b=j22Ox0UV2tOvZC4lPl2ZhFqp9SljQSrWGtS2vnwhkG1/W1XOkxk0gOZ2PXL9pwKf26
         JC1zI3vT50xwWSog5zZl1TCkxO/tLdStKZWGgQThZm3488RS4dz/RGSXjaNRF5ksjE15
         JFyBwTADbuPOz68d+aq8O/KHQ+Gy8MIiKmmvg4Cw/gAr2rmyQo8Vhdn1k2hIYjRKv0hl
         2n/p6GSlOC2Kb+njZfsjEGg9LEkCoygaY7tLZYOPEl2ztCgWEVN+ayRjalMXCh9YiOJ4
         f8nlWdjI+q00gMxzfC8Z9oH9fi1jcgS6+t5M+7Pvn1lTOgpZFL510Dt1zyezoEkbd94r
         xOaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746604144; x=1747208944;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uBQhgtS9ybuOxHj6AdnuF/Cq3dS0a7fHWP3yItbSd2c=;
        b=hRdc646UpOtl9u1/gF3CA/j/V1CBYlYbFIuGoY15lbhWT6qgJLQZAOsXF8wubFmuq/
         Pyq8DPvIWD3jcmdVFzBf+Ks90jh0QjvI+bbXonNbp0hlYDwR2R84lFGF85mtPKnq6jDC
         cwcqZjkkDTkpWmV39jlK2JrTldK/Jo5bv8zOImyp+XTDj4Pf16Ry9/9lK3OEjpds9hl3
         CPqL6kgSztIisHZxGya4ZFhy3jjnzt9pCSjyS7B5OAktSnLIILw6SA/j/qm1sW7fiLqi
         r++/Qa9hEdxJaOktmt+aVPfQdLU1HHmBCxIPHtRptmU0OdwmUpTDewwTLwR5qGaF9e4H
         uKkg==
X-Forwarded-Encrypted: i=1; AJvYcCX9D8fnW26kK1W5u4uRuesyaE/VGto/2Qnk6ydZTZl8vprWAZywRKGeHORBmKBcEMhLUsyhdG0Mo9OOXo9RxI1n@lists.infradead.org
X-Gm-Message-State: AOJu0YxgTsO22JLyI0vMtGlClyIt71qnR30m2Oq4eIQeasIe3ksB7T9i
	MRBzyyY7KZ/vwfGHOV5kc61pxY9HXC2gNToR7Iiljd+pMbASlZAWJ3QOVL7x6KQ=
X-Gm-Gg: ASbGncv3c9v2e+EJM1O+r+5NYJkLdR3A2qNeQcfGqwX8xVdC8XcbSKuRDy6gkcnK9U/
	14Ea8RY6I5ig72x4UG84kCP7zhsN+mXkz4XyMv4RsOQZ1NHb2xq2XxZr5KmK/Lvijgs9CM6lu7K
	XEShSjuNLh5T/63sZy0rZ5aj8t0stFS8j7A+Gd4L4Z5yBnXOnEdTh2KCf55Rt+/B5WGlEib1Aom
	MNTEldHCf9Tmyd4XvG3CpHLjh517KZZpg5Ahrpz6+CixxH++1P6QgO9KzCfIfCYsQzcBpuYqdmF
	M+BTR5pwwIDvw5itUxdRsJJsPv/hOg/pvSCVMw63XkZjYJxBAgRjxl5CmKqivncIEKvllglkLbp
	j+irlxmL+jxh1qpA=
X-Google-Smtp-Source: AGHT+IHjHRiwgANkAJ3S9Z01d1Zgt2+B4LvIz1I6F5aV28W7g29cSTSyqCEScOdJG7/V14ux2621Pw==
X-Received: by 2002:a05:6a21:101b:b0:1ee:a410:4aa5 with SMTP id adf61e73a8af0-21496321efamr2808776637.17.1746604144528;
        Wed, 07 May 2025 00:49:04 -0700 (PDT)
Received: from [192.168.5.157] (88-127-185-231.subs.proxad.net. [88.127.185.231])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058dee10bsm10442690b3a.76.2025.05.07.00.48.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 00:49:04 -0700 (PDT)
Message-ID: <50ef47ca-1054-4b5a-a7d7-56e6cfcb863e@baylibre.com>
Date: Wed, 7 May 2025 09:48:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt6357: Drop regulator-fixed
 compatibles
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Fabien Parent <fparent@baylibre.com>, Conor Dooley <conor+dt@kernel.org>
References: <20250502-mt6357-regulator-fixed-compatibles-removal-v1-1-a582c16743fe@collabora.com>
 <174652097090.119919.16240846809714782858.b4-ty@collabora.com>
 <99febf26-2ada-4fed-b4b3-596ac4abf581@baylibre.com>
 <1e8b80c9-d491-4b71-b424-e2322c711fd3@notapiano>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <1e8b80c9-d491-4b71-b424-e2322c711fd3@notapiano>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_004905_742088_2E213AB8 
X-CRM114-Status: GOOD (  39.51  )
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



On 06/05/2025 23:20, Nícolas F. R. A. Prado wrote:
> On Tue, May 06, 2025 at 11:30:08AM +0200, Alexandre Mergnat wrote:
>> Hello Nícolas and Angelo,
>>
>> On 06/05/2025 10:42, AngeloGioacchino Del Regno wrote:
>>> On Fri, 02 May 2025 11:32:10 -0400, Nícolas F. R. A. Prado wrote:
>>>> Some of the regulators in the MT6357 PMIC dtsi have compatible set to
>>>> regulator-fixed, even though they don't serve any purpose: all those
>>>> regulators are handled as a whole by the mt6357-regulator driver. In
>>>> fact this is the only dtsi in this family of chips where this is the
>>>> case: mt6359 and mt6358 don't have any such compatibles.
>>>>
>>>> A side-effect caused by this is that the DT kselftest, which is supposed
>>>> to identify nodes with compatibles that can be probed, but haven't,
>>>> shows these nodes as failures.
>>>>
>>>> [...]
>>>
>>> Applied to v6.15-next/dts64, thanks!
>>>
>>> [1/1] arm64: dts: mediatek: mt6357: Drop regulator-fixed compatibles
>>>         commit: d77e89b7b03fb945b4353f2dcc4a70b34baa7bcb
>>
>> I'm surprised that patch is applied after the Rob's bot reply.
>> Also, I've some concern:
>>
>> On 02/05/2025 17:32, Nícolas F. R. A. Prado wrote:
>>> Some of the regulators in the MT6357 PMIC dtsi have compatible set to
>>> regulator-fixed, even though they don't serve any purpose: all those
>>> regulators are handled as a whole by the mt6357-regulator driver. In
>>> fact this is the only dtsi in this family of chips where this is the
>>> case: mt6359 and mt6358 don't have any such compatibles.
>> This is the only dtsi in this family to do this, yes. But according to
>> all other vendor DTSI, which use regulator-fixed when a regulator can't
>> support a range of voltage, IMHO, it make sense to use it, isn't it ?
>> If other DTSI from the family of chips doesn't, why don't fix them to be
>> aligned with the other families?
> 
> Well, but this isn't just like any other regulator-fixed in a DTSI. In this case
> it is part of a multi-function device (MFD) and so it gets probed by a parent
> node. That's the source of the issue, because then no driver gets assigned to
> the node itself.
> 

Ok, thanks for the details. After Quick check, Maxim does't use "regulator-fixed"
in the MFD too.

>>
>>>
>>> A side-effect caused by this is that the DT kselftest, which is supposed
>>> to identify nodes with compatibles that can be probed, but haven't,
>>> shows these nodes as failures.
>>>
>> I lack of data about kselftest, but according to what is reported here, it
>> appear to me this is something which could be fixed in the test itself. It make
>> sense for a DTS, but not for a DTSI because it expose HW capability of a
>> device, not the board, so it isn't mandatory to probe all DTSI node.
>> Again, I'm not an expert, the test shouldn't show the DTSI node as failure,
>> but maybe more a warning.
> 
> The DT kselftest is a run-time test, so it wouldn't be able to distinguish
> between DTSI and DTS. But in any case, we do want to check that devices from
> DTSIs have probed, a lot of the devices come from them. When a particular board
> doesn't actually have a node from a DTSI present then the node should be
> disabled, and in that case the kselftest ignores the node.
> 
> It would be possible to ignore this particular compatible, "regulator-fixed", in
> the kselftest, if it is a compatible that can't be expected to be probed. Of
> course that would mean that all the other regulator nodes that aren't MFD
> children and do get probed by that driver would no longer be checked by the
> test.
> 

Yeah this isn't the wanted behavior.

>>
>>> Remove the useless compatibles to move the dtsi in line with the others
>>> in its family and fix the DT kselftest failures.
>> If you remove compatible from these regulators, I think mediatek,mt6357-regulator.yaml
>> documentation file should be modified to be consistent and avoid dt-check error.
> 
> Ah, yes, totally agreed, I seem to have missed running dtbs_check on this patch,
> sorry. Indeed now either the binding needs to be fixed or the patch reverted.
> 
> I believe the most reasonable option would be to update those regulators in the
> binding to reference the generic regulator binding, ie:
> 
> diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6357-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6357-regulator.yaml
> index 6327bb2f6ee0..9308008f420e 100644
> --- a/Documentation/devicetree/bindings/regulator/mediatek,mt6357-regulator.yaml
> +++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6357-regulator.yaml
> @@ -33,7 +33,7 @@ patternProperties:
> 
>     "^ldo-v(camio18|aud28|aux18|io18|io28|rf12|rf18|cn18|cn28|fe28)$":
>       type: object
> -    $ref: fixed-regulator.yaml#
> +    $ref: regulator.yaml#
>       unevaluatedProperties: false
>       description:
>         Properties for single fixed LDO regulator.
> 
> as well as updating the examples in the YAML. The fixed-regulator.yaml binding
> doesn't seem to provide any additional checks compared to regulator.yaml,
> besides enforcing the regulator-fixed compatible, which in this case doesn't
> serve any purpose.
> 
> Thoughts?
> 

Yes, IMHO, this yaml change should be enough.

-- 
Thanks,
Alexandre

