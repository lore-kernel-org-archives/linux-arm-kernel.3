Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B45BAC36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 17:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V8RVUmA+m1kGChPMpcQ+PaepE65DTzRvMV0W66iG5TU=; b=jWkb5E9jZXnHFP6wBeK7QPQFZs
	iQcOfECTClHsNa49ckkLG4O21tNHbsHmuqdOPoKQLGPe6B7dhgpaPMStdVA58PF06Lxjnqr5R/I4S
	E6i+lxFsHenQtIAEbvw54qYOl0eXGyDSAMII1wGO8Oe1Wl508lDUhUROAfYIuDMfgn2nsCKZyp1VW
	gZoFLpnXFxQ7pdFdD56KOsJgKmqTKnOSEhA/faPKfQ3iv/mHlQwn+hPOLFRcrMAMbIlMxvyRLMTHM
	VmDSLRt800Nq9LbvezN7WLv8lyK0ZTDvbhoznXLX1qurI67HMBZ9SsyEZqDvxxnQtoJ+/xbehwbwb
	NeU7hMbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzfVZ-000000041d5-2Pzt;
	Tue, 01 Apr 2025 17:34:41 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzfTl-000000041VO-3sJC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 17:32:51 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-22423adf751so109108255ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Apr 2025 10:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743528769; x=1744133569; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V8RVUmA+m1kGChPMpcQ+PaepE65DTzRvMV0W66iG5TU=;
        b=XeLvRe97xm/RYveG2IAcz1b0s9FaSIyzXrrdbvHPMeh9Vq7YO8YKyA5dkW5d1fFiBG
         /2V8Ihmq7Zt5y4EG1IXJafMdw3wCLCyi9Y5zgf4xZfchmWjEcuuw/9hmmfL7Y5RDgy1O
         fGitMY02NxrJL7S9TNv5t4HcsOArA/s7NRRo/kg7VWSlPLfFr8Enm0IRnZ1lc9AJ0jR3
         VBiJ+vroeiwHRxAwYGfxdCTuCO/RZ6TrsnsqcuK/2dQYD5HhLVZRYVVSo0rvjx5cTVXB
         6ZQd5XvtUxdMd5XdwaLgCA1EBWvuT0rV7afQdpVObziOsdUkosuglnkIb0SlDH9dlCi/
         g4bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743528769; x=1744133569;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V8RVUmA+m1kGChPMpcQ+PaepE65DTzRvMV0W66iG5TU=;
        b=a8cXDFufY4erKLo+k13H4owTt5Vj0xVCt5FO5Y/LA8CdULdFKPKiep1YR9yp1LepSW
         zDATVpXCU9lWkwyLfLnAoOb8mQYYVy59CbEM/TETq70xtoFTHg03xbBU4nnwfLyKhtUM
         TUQdfeomrJxnKeW2rJtEAe/Mw6Mmo50IdSAxi17gPE6EkAlKenYMY1jwtWn0OX/NlbCP
         5c2wmIu8fH4c2XGV02yT5sLLyQy3Nobev/BPygFHPeu3c5NMog53ZsKSj92Oj7sJ7U3S
         trunCZ+nnsB/vIh8hP/HPJp0pIB+UkZkwePnvE3lxf+hzuKByAlD6w5wVZFOsQx1OqWd
         ElKA==
X-Forwarded-Encrypted: i=1; AJvYcCU1iectAcAXGXbjJLkrEbXltkVNB27Nm3vocBhLEKjf+kVPL7sMABWtf92vqmaOz9IZTVcmOH5oNOaC4YZfi4Q2@lists.infradead.org
X-Gm-Message-State: AOJu0YyJhaCqFAKxhXjn4cMBN6QY3HtruQpiCrCA51xbwKVxKMqTIxPE
	ysDoWEiLucnYH8Hpil4t9Bfb1WUkVe7Hrfds3O0YF+qsrkA992Xx
X-Gm-Gg: ASbGncunQzSlFReJ64YY3XSKrd3Teo9e8MoOXHyL5Mn9mQYIOnCR/91TOlYKiN+x5Ye
	ER5nwU67D5RPdXmhkBZW4ASx30NiWeqSn/bUjXkzJ+MjWFBeZzd8WWbr7kTu0nkkIvXX3DVcx4C
	j8KEAXJ0FsObA1bDsjFDDEmvrvPjDRF1ulWbEPJMhzjWlbA05jHGn9P3SVlRLv7QZ1Azhn2ElzB
	7q6ZTqgEpH14S7bZke9OjfTV6N8ZuSvqjydNnp+lFerjW5lPchUhunR1u3ufd8D6kmPXsNmOnxx
	l1qcytMwzjaVyr6+cfwY+NtnlvfndQCuyzydtehSPg+fSfAJPeBgprHsDtt0tFesSK6CCgJb1Rw
	Lg4zJ7jWuAD/ZU8Le9lZVpPfsZ/M7awPeeTY=
X-Google-Smtp-Source: AGHT+IH95w/LAWi9XB3yjcdglXPFnSGj8XWtvL857JlmhI7fKhJECGlgQFhZrN0iisUbnhGnnnDRUg==
X-Received: by 2002:a17:903:11c8:b0:224:24d3:60f4 with SMTP id d9443c01a7336-2295be6601bmr58932595ad.15.1743528768618;
        Tue, 01 Apr 2025 10:32:48 -0700 (PDT)
Received: from ?IPV6:2409:4080:109b:c762:5821:556c:83c9:d1d7? ([2409:4080:109b:c762:5821:556c:83c9:d1d7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73971068576sm9187137b3a.119.2025.04.01.10.32.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 10:32:48 -0700 (PDT)
Message-ID: <61b1e302-98ad-4dda-8c03-18315d432512@gmail.com>
Date: Tue, 1 Apr 2025 23:02:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: pwm: Convert lpc32xx-pwm.txt to YAML
To: Krzysztof Kozlowski <krzk@kernel.org>, ukleinek@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, vz@mleia.com,
 piotr.wojtaszczyk@timesys.com
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250312122750.6391-1-purvayeshi550@gmail.com>
 <b2f6a357-a468-4526-a1b6-69ab2c643b2c@kernel.org>
Content-Language: en-US
From: Purva Yeshi <purvayeshi550@gmail.com>
In-Reply-To: <b2f6a357-a468-4526-a1b6-69ab2c643b2c@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_103249_968102_DA61174B 
X-CRM114-Status: GOOD (  20.94  )
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

On 13/03/25 16:34, Krzysztof Kozlowski wrote:
> On 12/03/2025 13:27, Purva Yeshi wrote:
>> Convert the existing `lpc32xx-pwm.txt` bindings documentation into a
>> YAML schema (`nxp,lpc3220-pwm.yaml`).
>>
>> Set `"#pwm-cells"` to `const: 3` for expected PWM cell properties.
>>
>> Signed-off-by: Purva Yeshi <purvayeshi550@gmail.com>
>> ---
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> 
> ---
> 
> <form letter>
> This is an automated instruction, just in case, because many review tags
> are being ignored. If you know the process, you can skip it (please do
> not feel offended by me posting it here - no bad intentions intended).
> If you do not know the process, here is a short explanation:
> 
> Please add Acked-by/Reviewed-by/Tested-by tags when posting new versions
> of patchset, under or above your Signed-off-by tag, unless patch changed
> significantly (e.g. new properties added to the DT bindings). Tag is
> "received", when provided in a message replied to you on the mailing
> list. Tools like b4 can help here. However, there's no need to repost
> patches *only* to add the tags. The upstream maintainer will do that for
> tags received on the version they apply.
> 
> Full context and explanation:
> https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577
> </form letter>
> 
> Best regards,
> Krzysztof

Hello!

I wanted to follow up on the patch I submitted. I was wondering if you
had a chance to review it and if there are any comments or feedback.

Thank you for your time and consideration. I look forward to your response.

Best regards,
Purva Yeshi

