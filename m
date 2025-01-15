Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EB3CC02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 15:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O+TEw22AVontHHqXfjSfeIvZxVbWvvoY4JYvVvO5hBk=; b=Jk4W44oVnWHwn3xJ3DWbp1hWf9
	MTyOJ1g+3WzNPISMULBrTvSZhc9YMCABz+XerUyJKw0MMbo5CJhVTtJfuD3+3Zev2Xr3a5Ubk1gDs
	WyV5TsoSwhbiX6/AFvT2O+dGhhcJSjMVduZ20uQAQO6ZMlBHHeiKefXntO/r+1e+o0qUFqEt2QhGY
	lX4c38mKFPbn7hIm1fQqeXlJfGvDQPQeKJQ3zHaM9eD7aRv0d2pQMW9HhJL6sYVCfY85XZ17/PRgc
	nF8wAXc8frMmfjvn33GwEhfkALKsLV4HeIU2jEr7YdTrdci+zCLPLVQn0Rki3E0Q+NtFd70miqHY6
	l4qD6paQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY5eS-0000000CKQl-3JO3;
	Wed, 15 Jan 2025 15:49:52 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY5dB-0000000CKJu-22Pz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 15:48:34 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-385e27c75f4so4867826f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 07:48:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736956112; x=1737560912; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O+TEw22AVontHHqXfjSfeIvZxVbWvvoY4JYvVvO5hBk=;
        b=ruVSCFffKYJQobpzHRi6KzFBHTEx1kRrYNffpm3BfuGg+yPueT5LGRqYs5PUPrXB8L
         YQCQkUzhjKg+Nxl+Re6eHNY5b2Ig7U+d7OE59A5D3KrTPipE06rsXAm05tjF+fI0HkkJ
         s9UEV5H/sTeqSqyi2RxaaGF8c89pWzTuhMYDufoXs32Y3lVuJXGXd2iUOUrmGfGoIwpo
         sJQT7J9n4BIiIx5xjp6AC4wRtrFhZYO3yr6lCQvDLqGoRkKuZwO9aJ5U1npPv1sw76mF
         6GUs6VoBjoYIhuYsJkU7OaIzfL8b6mZLjxHdPcoDrRa5w5RZp5GL7/6GqSZ8lYwEonNz
         4YQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736956112; x=1737560912;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O+TEw22AVontHHqXfjSfeIvZxVbWvvoY4JYvVvO5hBk=;
        b=j7ERU29IQMkZUlqT5h6Ms7YMIO85oPioygjf9DuJFt2C3SatKC/UCSttw3ljj4dmNC
         /3dwPHJeozqcLcflPsjap+z2kptbXBCj+D/N4o4t/H11t5m0wfld2sOIrkB/lNvCMjMk
         ZXAFxa55Ud4wJA9ihQoqCrdAbpAqvjpj6C/cRe52sqIJR6EdHZ51c2BBnbKvfvgCkL5v
         OOs7Cz6HIEtRtNrbvw41CGp6x9uXFiopFJ5FHwvlfz7i4fWt86SjxW03gdeYs2g29QFc
         vSe6FrvEB1LVQ4GQRx8q8ITL+Ld8BXF5a39mXGsIQ+m/h6u2thkCsYpSR3bVbcY49YBF
         6a4w==
X-Gm-Message-State: AOJu0YyL0lWRtjanP+HOFF1jmgikQP/iw+x1ToMVTi2mmdMBAF2mAGi4
	RvB0OGuh33QAIULhMmLzdtIL4+52LJAXAC8ZP2KoxwR9Bdo0aQt/0uq7B8cyhMY=
X-Gm-Gg: ASbGncvcjRnJyMpcenoKsZOnLPzNKstKWZJ/TtVY0eAhMjev4lwkId1Fl7flpUiuPz+
	UOMj9BwWAj9XD4LUyH0AJ6/qbPKZtbrir7tdzoUSeKWytcdw9v7ant5AiCUDOugVlVwYX5VuGSP
	JhfppS19ztaDkSnPMviSDryhJujWMkxgVrgX4MCWsDNoUyTS3gPUNSJ+hin66PolXhmrkGWNTPm
	YrpdgbltiHJGfEfPeVSX8Xi2tBXKBT5Ovc0OrQr7N2jsQQDIBr6MW/gSzoawK4iUw==
X-Google-Smtp-Source: AGHT+IGjzi93xDbrH8PhQpZEWfFM4hz29cUNgLumlFwyXrcez1K1tWDWXeUmRwGwyfJJfyxns3HR9A==
X-Received: by 2002:a5d:64c9:0:b0:385:f0dc:c9f4 with SMTP id ffacd0b85a97d-38a873066fcmr22815280f8f.20.1736956111746;
        Wed, 15 Jan 2025 07:48:31 -0800 (PST)
Received: from [192.168.68.163] ([145.224.90.10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38be66b01c7sm2649024f8f.22.2025.01.15.07.48.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2025 07:48:31 -0800 (PST)
Message-ID: <65eb308e-6851-47b2-8fa8-31b093a0d25e@linaro.org>
Date: Wed, 15 Jan 2025 15:48:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] arm64/sysreg: Enforce whole line match for closing
 blocks
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, robh@kernel.org,
 broonie@kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org
References: <20250115134259.1864060-1-james.clark@linaro.org>
 <20250115134259.1864060-3-james.clark@linaro.org>
 <867c6ww49g.wl-maz@kernel.org>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <867c6ww49g.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_074833_576164_17EC6645 
X-CRM114-Status: GOOD (  18.84  )
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



On 15/01/2025 2:17 pm, Marc Zyngier wrote:
> On Wed, 15 Jan 2025 13:42:54 +0000,
> James Clark <james.clark@linaro.org> wrote:
>>
>> Match on the whole line to prevent matching on prefixes like "Endsysreg"
>> vs "EndsysregFields". This could potentially make the script go wrong
>> in weird ways so make it fall through to the fatal unhandled statement
>> catcher if it doesn't fully match the current block.
>>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   arch/arm64/tools/gen-sysreg.awk | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/arm64/tools/gen-sysreg.awk b/arch/arm64/tools/gen-sysreg.awk
>> index 1a2afc9fdd42..7c7412adf90e 100755
>> --- a/arch/arm64/tools/gen-sysreg.awk
>> +++ b/arch/arm64/tools/gen-sysreg.awk
>> @@ -127,7 +127,7 @@ END {
>>   	next
>>   }
>>   
>> -/^EndSysregFields/ && block_current() == "SysregFields" {
>> +/^EndSysregFields$/ && block_current() == "SysregFields" {
> 
> The problem with this sort of things is that it will now fail with
> trailing spaces, which is both counter-intuitive and pretty hard to
> spot.
> 
> Why don't you simply match the field number, like you do in patch 3?
> 
> 	M.
> 

The intention was to ensure that the end tokens were the only thing on 
the line (including whitespace). But yeah it is slightly inconsistent 
compared to start tokens because as you mention "$1 ==" allows both 
leading and trailing whitespace.

I'll change it to "$1 ==" for end tokens as well and then add 
expect_fields(1) which catches unexpected trailing stuff but has a 
better warning.

James



