Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C302CF394D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 16:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s+urd6hZuWEo3shlMiSBaDb8+AZAhwgeZeQG9S0pL0o=; b=flyeOPwiOCN0fcYLcW1w4daWf4
	iucTv3Y9NNt7Okn65+7ZP/PhM3cwW9WH4SW7hMEeLpMId+jMCydCyds6M5HwfjxnS/5VaPhTrcciz
	djPGRGwjQFKOtSSp95drhf83gLx20+JsPVkaT9iN6d7wqur19USNb8eNaoV7+9xksJXy600BM/9nk
	zMqZx5qe/lJpH2LZ9g7KeEA5OVUFjKhRlcKycdvnz9EUtuz+wOqSAaCAhkiGoda6l+0Mp7S9QwoG2
	IESSKmAia36PxxyeoIhBOx8VZUZWonrKeLAKQo12vVv4aSRM8urpksxykThSFPdnks8T8u1RKflGF
	ltopPriA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkuU-00000003gKu-1DNz;
	Wed, 19 Nov 2025 16:19:58 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkuS-00000003gJT-126R
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 16:19:57 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-47778b23f64so46616015e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 08:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763569194; x=1764173994; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s+urd6hZuWEo3shlMiSBaDb8+AZAhwgeZeQG9S0pL0o=;
        b=QIJx6gUsT2dVeIZPKghPNsfVYF1OTJJp4qYw0OO1KlpX+Z+kSMBr56lmjTkO0F3sqI
         HpDR7G8zF7nvsVdA1HCYou3fa+Z6328vj1Y8HRPLgnMFiYIbcWkEE10taOgGlSqSuP9U
         kb15sOlzVRVqXO4GgxCUvXiCalt5vNWk22NeWZe39Yy2gCLXHL6aGkJay4AQuSdV8Gib
         WBYLgzcRJxz5pwnYZqJN90eNg5phUQtumEJc+/23/Q5D3nO6Fk7SjKjE8DECoVX0AKcD
         uT1+69ld3zPf9knPXojMVo6APDowH+5sZrTT0CzdKcmPxaolW431UXZq2bfRtzOHL0Fp
         k1Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763569194; x=1764173994;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s+urd6hZuWEo3shlMiSBaDb8+AZAhwgeZeQG9S0pL0o=;
        b=VCxsJedMyLUkrkbuqo0+crqnPtceGmkFOu8O2qCIcpEW7KEhIK9QGZ3QyRH0i9w8y3
         arjwRKAsax1iyKDtFYXMeM30LU3Xn0r+3HeSwezC0HbMqoqK4e3fYUTOiepM8WxCokIM
         BkJy6EkiuKkMMuBB2Gvk9mkys10Jk+/yhjLB+05+r9BU24nHwesj6pUeK961Ie3VCx1N
         veLR1YdMivlQWXMvtiYZchQ988C6KhR+EDLqylrzGmCH0ROl6lzPZFRHhnHohRYEoYcN
         uvShtPrA7g7290tDqGp5HxpDSBeZ+IOZs32+P7VLO1GjkHCfQhHCi+C5c0pNoHcmMLCF
         yvLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpPDZBzse5Izhh37sieacf1Y7Lj+lt7KzcKgWDxSAT23I1uwkJq+JPYiL+xV8q8QLWYD6jEhcsG3TgX+D/4gI0@lists.infradead.org
X-Gm-Message-State: AOJu0Yyt5uOs2oZNeXqvaX989vDq6cXAHSLj62nbJJQrHnf978KtLyVC
	C+FNtNRUoYtvs9zCq8Dfk8ogAUzr/v9wVehgG2FP79RzLjqZWDB711z3fHNdNp7PDp8=
X-Gm-Gg: ASbGncukcBryHFMFYQZVLRIR+aj5Xgwx1nHBm+6oMEBukvXzdWEr2WE7ns56LuFPLo/
	n5LcJw6IKIdQvF8WHRo6SqjtqFegDiKqmQgsfrG6qGDCA8Z/6dq9C9DY+qnK+rDYhsJxR5GqTlN
	vdjMEwafjC4ZVJ0+g6lWqSPv09Q9aUl2iF+pu8OKZm/svfC0eChh9aLOepJS1jJX3Ojj7XH1X6n
	i4u2os2jCra7Zvi4PHWkrSQPIQstMVLhAQLIFMfA84HF6yN0hTr5nV/9a3qC7DsFVKK6K9szuGv
	VUlHOR6Hwu9RxRn3oy3iu6OFHYWC+E4v2vg8L5Zd4WkgCBccmNHmRX+qaNeCS6KjwEnicEXpO8q
	6Q7kSjeyipWFao7n+9Kx89ENiobd7iBxtNxC+R6Ndtn+9/reYaLLyf22D6fzyP1ZOvfP4qsx19Z
	zAV7aZ/kKXJcjVwxP4FynuoNWAUDk2
X-Google-Smtp-Source: AGHT+IFwK5aAXHXIDIc3E2JseMPHhoLC/8O7sdHZVlYBJKdiPiGNYDVrkfdVj41qV4fzGcHy4cnIEg==
X-Received: by 2002:a05:600c:4513:b0:477:2f7c:314f with SMTP id 5b1f17b1804b1-4778fe5c820mr231183085e9.10.1763569190918;
        Wed, 19 Nov 2025 08:19:50 -0800 (PST)
Received: from [192.168.0.39] ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b0ffc90fsm61424875e9.2.2025.11.19.08.19.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 08:19:50 -0800 (PST)
Message-ID: <060e7412-8f1f-4d31-af39-79213c560e85@linaro.org>
Date: Wed, 19 Nov 2025 18:19:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 25/26] dt-bindings: reserved-memory: Add Google Kinfo
 Pixel reserved memory
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, tglx@linutronix.de,
 andersson@kernel.org, pmladek@suse.com, rdunlap@infradead.org,
 corbet@lwn.net, david@redhat.com, mhocko@suse.com
Cc: tudor.ambarus@linaro.org, mukesh.ojha@oss.qualcomm.com,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 jonechou@google.com, rostedt@goodmis.org, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-arch@vger.kernel.org, tony.luck@intel.com, kees@kernel.org
References: <20251119154427.1033475-1-eugen.hristev@linaro.org>
 <20251119154427.1033475-26-eugen.hristev@linaro.org>
 <e73bdb23-c27b-4a18-b7e3-942f2d40b726@kernel.org>
Content-Language: en-US
From: Eugen Hristev <eugen.hristev@linaro.org>
In-Reply-To: <e73bdb23-c27b-4a18-b7e3-942f2d40b726@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_081956_337977_4CD83722 
X-CRM114-Status: GOOD (  45.51  )
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



On 11/19/25 18:02, Krzysztof Kozlowski wrote:
> On 19/11/2025 16:44, Eugen Hristev wrote:
>> Add documentation for Google Kinfo Pixel reserved memory area.
> 
> Above and commit msg describe something completely else than binding. In
> the binding you described kinfo Linux driver, above you suggest this is
> some sort of reserved memory.
> 
>>
>> Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
>> ---
>>  .../reserved-memory/google,kinfo.yaml         | 49 +++++++++++++++++++
>>  MAINTAINERS                                   |  5 ++
>>  2 files changed, 54 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/reserved-memory/google,kinfo.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/reserved-memory/google,kinfo.yaml b/Documentation/devicetree/bindings/reserved-memory/google,kinfo.yaml
>> new file mode 100644
>> index 000000000000..12d0b2815c02
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/reserved-memory/google,kinfo.yaml
>> @@ -0,0 +1,49 @@
>> +# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/reserved-memory/google,kinfo.yaml#
> 
> Filename based on the compatible.
> 
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Google Pixel Kinfo reserved memory
>> +
>> +maintainers:
>> +  - Eugen Hristev <eugen.hristev@linaro.org>
>> +
>> +description:
>> +  This binding describes the Google Pixel Kinfo reserved memory, a region
> 
> Don't use "This binding", but please describe here hardware.
> 
>> +  of reserved-memory used to store data for firmware/bootloader on the Pixel
>> +  platform. The data stored is debugging information on the running kernel.
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - const: google,kinfo
>> +
>> +  memory-region:
>> +    maxItems: 1
>> +    description: Reference to the reserved-memory for the data
> 
> This does not match description. Unfortunately it looks like you added a
> node just to instantiate Linux driver and this is not allowed.
> 
> If this was some special reserved memory region, then it would be part
> of reserved memory bindings - see reserved-memory directory.

I sent this patch for reserved-memory directory, where all the
reserved-memory bindings reside. Or maybe I do not understand your
comment ?>
> Compatible suggests that it is purely Linux driver, so another hint.

This reserved memory area is used by both Linux and firmware. Linux
stores some information into this reserved memory to be used by the
firmware/bootloader in some specific scenarios (e.g. crash or recovery
situations)
As the firmware reserves this memory for this specific purpose, it is
natural to inform Linux that the memory should not be used by another
purpose, but by the purpose it was reserved for.
Which would be the best way to have Linux understand where is this
memory area so it could be handled?


> 
> Looks like this is a SoC specific thing, so maybe this should be folded
> in some of the soc drivers.
> 
Not really soc specific. Any soc who implements this at firmware level
can use it. The firmware can reserve some memory for this specific
purpose and then pass it to Linux, so Linux can fill it up.
It just happens that the Pixel phone has this implemented right now, but
it is not constrained to Pixel only.

Instantiating this driver with a call like platform_device_register_data
would make the driver unaware of where exactly the firmware looks for
the data. This is right now passed through the DT node. Do you have a
better suggestion on how to pass it ?

> 
> 
>> +
>> +required:
>> +  - compatible
>> +  - memory-region
>> +
>> +additionalProperties: true
>> +
>> +examples:
>> +  - |
>> +    reserved-memory {
>> +      #address-cells = <1>;
>> +      #size-cells = <1>;
>> +      ranges;
>> +
>> +      kinfo_region: smem@fa00000 {
>> +          reg = <0xfa00000 0x1000>;
>> +          no-map;
>> +      };
>> +    };
> 
> Anyway, drop, not relevant.
> 
> 
>> +
>> +    debug-kinfo {
>> +        compatible = "google,debug-kinfo";
> 
> Device node with only one phandle to reserved memory region is a proof
> it is not a real device.
> 
> Also,
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC (and consider --no-git-fallback argument, so you will
> not CC people just because they made one commit years ago). It might
> happen, that command when run on an older kernel, gives you outdated
> entries. Therefore please be sure you base your patches on recent Linux
> kernel.
> 
> Tools like b4 or scripts/get_maintainer.pl provide you proper list of
> people, so fix your workflow. Tools might also fail if you work on some
> ancient tree (don't, instead use mainline) or work on fork of kernel
> (don't, instead use mainline). Just use b4 and everything should be
> fine, although remember about `b4 prep --auto-to-cc` if you added new
> patches to the patchset.
> 
Thanks for your review and suggestions

> 
> Best regards,
> Krzysztof
> 


