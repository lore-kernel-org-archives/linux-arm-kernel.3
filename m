Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03639CCD1BE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 07:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UZ0zLiQMjHfWfIrETWEpgf86vfPQWqa3rEBNo24tR5I=; b=CyH4S7uoGcqWnu7ETdMDeYFAgs
	VVd5fyLjsh2CoL/THtyVhC1RsxH87rEWsjDoU55bjtLfw6cIVja1g+Hfyb/bb/4m83vY8G7x33n+d
	+M3TUTW4VDbX2QhMB0Mt45Q6XuWAdQuM3KqQrKSiGIDhBsC+g/9BGKdQesL9xDE1a7kpiT1zmfFDp
	ANDHKSSPSY80UyMqzuiMy1p6UfTJFIW1NpmtOv/7OJe2vV43thxB+Dq+M6f8ZTEjot3OLoynuvkY+
	e5fnTfLnSwD6z79U8WVZJ1IewMB3y7QTHUbWoIKILTjnrSvMAy/hb2k9s0XiTBWX4yJ/TYjryYHFG
	9qCj+Uww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBSpW-00000001lu0-2sUz;
	Wed, 22 Oct 2025 07:00:18 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBSpT-00000001lsC-3woI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 07:00:17 +0000
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-8909f01bd00so736400385a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 00:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=me-ssier-org.20230601.gappssmtp.com; s=20230601; t=1761116413; x=1761721213; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UZ0zLiQMjHfWfIrETWEpgf86vfPQWqa3rEBNo24tR5I=;
        b=BafdJ6MriAfGoxlCduAis3ACdbWbujAvBP0bQdTRGjdxKXxA3bHBkdqC/BZ4Anod+5
         6oNiEH1DPxUQNR/SnQqOlI7wBAO87wEdqo6DgBr1yk9DCGBQZQsDCtkuh/NoqM2prB1d
         crBl0bT3dYhDn6bFkWHXJhkVwx/VM2wzNNYwm/j1Q4YKSOAlV06Zyg13GMFWjBwk9EyC
         byGyDmSWhZyIaSnWbOB7Rse4qcd5mj3IkDnluJbIiUsYqW0gf5UHQ0us7/lqcXH+AFso
         8Ywb19nqnJRznb+idQfp0350EBiPeqmQiFQO3rf+N6qsvlopeRHKiFRkwA2zzEsIhyS/
         qX3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761116413; x=1761721213;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UZ0zLiQMjHfWfIrETWEpgf86vfPQWqa3rEBNo24tR5I=;
        b=m0EvnHeQ/Jm1evnnW+la0UryjWNW7C1SV51Dan4GeoG1E7PkaUkfo0NWqVV2KrXLOC
         emkJiMuGuqqJFEkBKEY5M9SFbBYFIqhrqmi4KEdGVeETUJdv3skFKoa7P8GIPucXZ0zj
         UDmo3CAvKJf6jIxINKbuZZu5JR6NAREZIHxyixDcL4Q4YjAmI/6A/yCwUgVLmsGHHBBB
         YFHPiPrt5/s25Q6yBg010Jl9yX/y1DAx9s1UBxs8eMBrpf7tUJgGRAoA52lR5rofLl7F
         mReRFZ4/CKJ74W+6UzgcflyfQt0LHy8UzE5UNFk2D1pyaidroht31iUYNCiGzYznxjvn
         rT1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXtNEJEZAGmD7Z6HrVgkajDoqTAASZf+v0rlf8aYMji6LYxRuBq6iP6v/T6MW7cSdY5L2IPOw1pot+t1yYN/tSC@lists.infradead.org
X-Gm-Message-State: AOJu0YybJR93H3bffiuBv8cppMEBEAzuLg/H+o0QFTEzNCdRJMELWOcl
	HdsSJ5Fw962ikcx8ukiB7lNTRPFw7P2Z13hrMsNVngkVPYMMGEtuPgub1Il/Dh2nlfm3a44tHTL
	sxBzynsA=
X-Gm-Gg: ASbGncsHhnYxaOTTl8ZwcymE7de2hRH9ED6qNJv16YeG8ChiVIFWqIVj/Fk+MXuGjJ6
	QzSOsXEkJbc8wrn8wwC/tpxQ+e/nAH2FDhuU8P0PXk01Gu2FpexQHNv4eEP0LFBIdciWj0QHVS2
	5OUqFHH0dl59HODW1yF1oijwiV3zF8wMxs2ukm2B+BBfJd+kikYndk4fwFzHDpMAjmRvTdCcfAZ
	0hrbtmFlwzXCio/Go8dzqkGWSMxQaNuijYc1hZiBmOkuf4Yl3JLuvcTzl9I5N1ilgzkI+XdTVCA
	QWnIBgktl/HVNemdePyEU91JX1MrsGEAdSOnMM4nyYofPg2mF2520wlO9+hHFhRHqL6LgESBkoW
	lUsVYNEUk7SfrBZuNi1bZgqOysz9pksL0Bg18zbMXsQMkSl8t/WjLCTQ9FErgZE3E1/Q/Fbeh4k
	4Wzheq7wzXlA==
X-Google-Smtp-Source: AGHT+IFP1Egld4e4M3O9ldes+hPt4it1nCGP1bODqWck6WjBakPWZGeujTTjHQoGUKEqPL4vEcQSIw==
X-Received: by 2002:a05:620a:4621:b0:88f:228c:c6a0 with SMTP id af79cd13be357-8906e8af048mr2096261085a.24.1761116412834;
        Wed, 22 Oct 2025 00:00:12 -0700 (PDT)
Received: from [192.168.2.8] ([74.14.126.215])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-891cd6717desm915892985a.26.2025.10.22.00.00.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 00:00:12 -0700 (PDT)
Message-ID: <77efe2a2-ee81-4096-9145-a76e35954e84@me.ssier.org>
Date: Wed, 22 Oct 2025 03:00:01 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] ARM: dts: qcom: msm8974pro-htc-m8: add status LEDs
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Pavel Machek <pavel@kernel.org>
Cc: Luca Weiss <luca@lucaweiss.eu>, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251007-m8-dts-additions-v1-0-53d7ab3594e7@me.ssier.org>
 <20251007-m8-dts-additions-v1-1-53d7ab3594e7@me.ssier.org>
 <6c791f05-70e7-49c9-a3ce-50fb82b0c894@oss.qualcomm.com>
 <fef52764-3092-4375-b9c7-793d85adc102@me.ssier.org>
 <41c63020-9226-45d9-979d-429b7299da41@oss.qualcomm.com>
Content-Language: en-US
From: Alexandre Messier <alex@me.ssier.org>
In-Reply-To: <41c63020-9226-45d9-979d-429b7299da41@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_000016_234834_0C904B60 
X-CRM114-Status: GOOD (  21.59  )
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

On 2025-10-20 08:02, Konrad Dybcio wrote:
> On 10/12/25 8:03 AM, Alexandre Messier wrote:
>> On 2025-10-07 06:03, Konrad Dybcio wrote:
>>> On 10/7/25 7:55 AM, Alexandre Messier via B4 Relay wrote:
>>>> From: Alexandre Messier <alex@me.ssier.org>
>>>>
>>>> Add support for the notification LEDs on the HTC One M8.
>>>>
>>>> Two LEDs are available, one amber and one green.
>>>
>>> Do they form a single notification led, or are they supposed
>>> to act separately?
>>
>> Good point, I had to check the phone user manual to confirm. Indeed, it is
>> referred to as a one logical notification LED. It also mentions the color can
>> be either green or orange, it does not mention using the combined color of
>> the two LEDs.
>>
>> So I would say they are supposed to act separately.
>>
>> Hope this answers your question, and let me know if more details are needed.
>>
>> BTW: I will be sending a V2 to update the color name, since the user
>> manual says the color is orange, not amber.
> 
> Let's describe it as a single LED then:
> 
> multi-led {
>         color = <LED_COLOR_ID_MULTI>; // notice it's not RGB
>         function = LED_FUNCTION_STATUS;
> 
>         #address-cells = <1>;
>         #size-cells = <0>;
> 
>         led@6 {
>                 reg = <6>;
>                 color = <LED_COLOR_ID_GREEN>;
>         };
> 
>         led@7 {
>                 reg = <7>;
>                 color = <LED_COLOR_ID_ORANGE>;
>         };
> };

Using multi-led is fine for me.

But currently, the "qcom-lpg" driver doesn't support LED_COLOR_ID_MULTI, only
LED_COLOR_ID_RGB. Adding support for LED_COLOR_ID_MULTI is trivial, I tested it
and it works.

Or I can also use the "leds-group-multicolor" driver, using the two individual
LEDs. I also tested this method and it works.

> 
> + Pavel the LED maintainer, please take a look if you think it makes sense

If Pavel agrees using multi-led makes sense, I think the first option is the
best. I will separate the LED patch into a new series, along with the change to
the qcom-lpg driver to support LED_COLOR_ID_MULTI.

Thanks
Alex

> 
> Konrad


