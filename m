Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C771E7716A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 08:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LwKLcx3qWGZ0J4OB9gBZAl+ma98QJfj1A73XswW/D2s=; b=e2PLzsqpVJlpP9XKnNA+h3bgkW
	kfp9IJqrkdxrU+42LMYnKNciOj3tayuNe5EResXd2+CRuiKwCTRR+L5lvN91wuRH6rTwaA37bGHac
	+pb/WHVqtHVJvQL5tX2jGuDKjDLZlgPNKWcxcJ0RxWPQtzw2nLkxSZalWwkWTFI4J9mDWPgKn9+eh
	jmdXOuHdjXFUDzfiSuuOlfzwmvCJc25C/FE+g9O6zM8+T/3+cYMdVaVJDQ9OQl2/Qfo4NicaS6ZQs
	zbpFggTREZoaGSNEGbsVWoym/XiHKs7A9Sk8eXUIhUO1UJ1DlSBP1Hnxrvt0FobJhWuZTFqgaC8cW
	DQtKFVgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNT7D-0000000CjQd-2xSr;
	Tue, 17 Dec 2024 08:39:39 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNT69-0000000CjIK-1S14
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 08:38:34 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-385de59c1a0so3278933f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 00:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734424711; x=1735029511; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LwKLcx3qWGZ0J4OB9gBZAl+ma98QJfj1A73XswW/D2s=;
        b=nKL7bBu18RUeGhv7scUSgVef7nCK7DdkiwvJ37V4uoOUVD4XVaK2SNRRnJXfDJpaub
         2/LNv9Y3bawK1ISI/gS/w48VWmixZFjl29gTBo7B1QX/yt/6LJxx6gEBvmkO0GsJcHyC
         0/Lvbv1F4e0w9KWdnzDWgGTq6t6/a4JsgT+SAJADts6rr3OlgwQLDibq+QzwN33YRAIp
         6fIquTK0XiNNoKMyrfpaePBnm05muEdjrP29b9NSjjyY/uYXxlETtfT+rO9rDLkiAYNs
         CDAMxjAFdgI6YiM6lvFO6r+TomFwkOxlCoak76ZSmw82bHugnJaMqBAEiT5Q73Ewq3FD
         uB1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734424711; x=1735029511;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LwKLcx3qWGZ0J4OB9gBZAl+ma98QJfj1A73XswW/D2s=;
        b=uHDnh30iWwAEL6BSY95PiQHVRluwjfJfdTnocfhb74wYOEDlywX+sumWblER4b+djH
         b/1Al7sV9hTG2SCKhVIlSNDAIOdI07dOo69+Z/AuhdbOPITsc2t8uHEdBXYKZYnb7PhW
         pgEJnH19YvhqCrpLX1pyYgF9xXDaZq9pawF2VAs4w1kKP70InvPvZ1fdOE7J9Kr9PhLB
         lQRn4Nz4lMPolPuicgiYpZHescYCXTWCygLh641M+W8GXOYFjv/U0zgLge2ugsFjMVJK
         l154yJk8lm3W6oHA5ksIIjPtGTVY5YsQrbmr65oXAQQljx7KD0SFgUwj7aXwvg4qziqX
         vwjw==
X-Forwarded-Encrypted: i=1; AJvYcCX3f1TiEWcdJ8SPyWDfPp9jbEDSBy4PeXoyNHae57/AMXglJiz0OreBeo7nke1xVoeKADiwzaeZk6OsXd0HnTgP@lists.infradead.org
X-Gm-Message-State: AOJu0YzQ6VnOEUqvXlD9ib7GU0Wg8lKjgcVjSEBiJTxFCilqE+vulfTn
	j8oHxEUvJUhSXqKnUjukH1sDgRUfuggtqbQyyC+x0vCTm+Q9nd6hWAp3TOpAXCM=
X-Gm-Gg: ASbGncstHlZrOBJxClVFBzFgMUs/SgJOv0BUi/dTGDXlkNLXj1qP1mft9QpIAfVu5nv
	pVIk1Z5wWjNdMQhVa42pCpUB/BSJPE6lvGRkhGtuOLYCY7oP1MbctDRKbDi2zeGIpv0ux7NQBdr
	aBRKjoligXOuzWJHNLlDSnbngdpDMhuLZweSSbTm1G1qDr5oJHKeT1BffdiYLYI+q3Bv/4N0PAv
	L8omPrIdVopkgygoNYjeBayzOFBNfoC5BvucLnP19fTO/F7XsxTyOwLLFPboJc7
X-Google-Smtp-Source: AGHT+IG1ScKF9S6YLpA0VEyZm9yVfmIx7vyc5/iav7Ktgk6AaGAJ4fl38EJ0MOFcy/fDQp5fgbPrhQ==
X-Received: by 2002:a5d:6c63:0:b0:385:ee59:4510 with SMTP id ffacd0b85a97d-38880ac1cc1mr14557623f8f.9.1734424711437;
        Tue, 17 Dec 2024 00:38:31 -0800 (PST)
Received: from [192.168.0.14] ([188.26.61.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c8060592sm10298741f8f.98.2024.12.17.00.38.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2024 00:38:30 -0800 (PST)
Message-ID: <4e8936e0-ac69-49e8-919f-b2776dd88779@linaro.org>
Date: Tue, 17 Dec 2024 08:38:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: exynos: gs101: add ACPM protocol node
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: William McVicker <willmcvicker@google.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 andre.draszik@linaro.org, kernel-team@android.com,
 daniel.lezcano@linaro.org, vincent.guittot@linaro.org,
 ulf.hansson@linaro.org, arnd@arndb.de
References: <20241212-b4-acpm-v4-upstream-dts-v2-0-91b7a6f6d0b0@linaro.org>
 <20241212-b4-acpm-v4-upstream-dts-v2-3-91b7a6f6d0b0@linaro.org>
 <Z2B3V78k2ibIdLYh@google.com>
 <45a54924-226e-4a94-b1ae-b0f1f703f854@linaro.org>
Content-Language: en-US
In-Reply-To: <45a54924-226e-4a94-b1ae-b0f1f703f854@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_003833_401341_2CF0933B 
X-CRM114-Status: GOOD (  20.16  )
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



On 12/17/24 7:20 AM, Tudor Ambarus wrote:
> 
> 
> On 12/16/24 6:54 PM, William McVicker wrote:
>> Hi Tudor,
> 
> Hi, William!
> 
>>
>> On 12/12/2024, Tudor Ambarus wrote:
>>> Add the ACPM protocol node. ACPM protocol provides interface for all
>>> the client drivers making use of the features offered by the
>>> Active Power Management (APM) module.
>>>
>>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>>> ---
>>>  arch/arm64/boot/dts/exynos/google/gs101.dtsi | 22 ++++++++++++++++++++++
>>>  1 file changed, 22 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
>>> index 04561e15b96c..8c3f07371912 100644
>>> --- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
>>> +++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
>>> @@ -277,6 +277,28 @@ apm_sram: sram@2039000 {
>>>  		ranges = <0x0 0x0 0x2039000 0x40000>;
>>>  	};
>>>  
>>> +	firmware {
>>> +		acpm_ipc: power-management {
>>> +			compatible = "google,gs101-acpm-ipc";
>>> +			mboxes = <&ap2apm_mailbox 0 0
>>> +				  &ap2apm_mailbox 0 1
>>> +				  &ap2apm_mailbox 0 2
>>> +				  &ap2apm_mailbox 0 3
>>> +				  &ap2apm_mailbox 0 4
>>> +				  &ap2apm_mailbox 0 5
>>> +				  &ap2apm_mailbox 0 6
>>> +				  &ap2apm_mailbox 0 7
>>> +				  &ap2apm_mailbox 0 8
>>> +				  &ap2apm_mailbox 0 9
>>> +				  &ap2apm_mailbox 0 10
>>> +				  &ap2apm_mailbox 0 11
>>> +				  &ap2apm_mailbox 0 12
>>> +				  &ap2apm_mailbox 0 13
>>> +				  &ap2apm_mailbox 0 14>;
>>> +			shmem = <&apm_sram>;
>>> +		};
>>> +	};
>>
>> You mentioned in the previous patch that "GS101 has 14 mailbox controllers",
> 
> Right, I got the number from the GS101 memory map.
> 
>> but here you have 15 mailboxes. I looked at the downstream driver and see the
> 
> Here we have a single mailbox controller, ap2apm_mailbox, with 15 channels.
> 
>> number of mailboxes is defined by the ACPM framework (firmware) which is read
> 
> s/mailboxes/mailbox channels that ACPM uses/
> 
>> from SRAM initdata. Dumping that, I see there are 15 ACPM channels. Have you
> 
> Correct.
> 
>> looked into into extracting the data from the initdata SRAM address?
>>
> 
> Yes, that's the reason why I defined the 15 channels from above for the
> ap2apm_mailbox controller.
> 

Haven't explicitly mentioned in the commit message: the ACPM protocol is
a mailbox client for the ap2apm_mailbox controller. The ACPM protocol
uses 15 mailbox channels of a total of 16 channels that ap2apm_mailbox
controller provides.

Let me know if you think I shall update the commit message.
Thanks,
ta

