Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D709E7716A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 07:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kwvB7uBpEMwnL4s+j9WaUS+8KTpcKQVS4QfB1gDHcEA=; b=E99gi5LFlX+H8/v5+hYy0a2W5u
	j6uEwXCm6bpc30h3CNgKicQh/XMZgYXmnOyS26/GDPI3nadnPed6oNE+gYknthV4lON3A9CSUp+iD
	Q02uSoej8lBTzX31ZF3XKs3ivf2xQlbD6GWpYe54I0OqnlgpPqVN71mbY0L3lVwXg1PYxSZSJXTBd
	5d2GObR9cGOvQ0lWUZwsI7gu3p8gP8aTn0etZpRScsAGUP2IRzVhQxaY0ToFVTmiz8xC69YqV3SGS
	sB0Pkgw6tYICi0hTvrIctw0fUhTnDagJvY6idwbzRgepS/aMpo97Og6MgBxicvBL28egSXNN5KRY2
	n9NLzUIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNRyU-0000000CZtA-1x1v;
	Tue, 17 Dec 2024 07:26:34 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNRss-0000000CYyB-28Mo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 07:20:47 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-43635796b48so18492335e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 23:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734420044; x=1735024844; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kwvB7uBpEMwnL4s+j9WaUS+8KTpcKQVS4QfB1gDHcEA=;
        b=zj46QQGPgvl38INHm4r+ZMMyinWgB0TRCJLREh3fJcc16LI6b5MZdE+oOVkrMTcX9P
         MYNrSi2yCWARQDFwDKFP668uiLDhhvAf5RfrRlpZyLmmgURSw7cv3w0owDj5Bzar/nLK
         i1jE0vqRSdbkGFZMB2F0OZHbMMPW01d2qvWdf/9k7rFBH7YdGrB1eNMW1CCG+8/nJGHs
         iHcS7mHcblPgV79nwDce0Z97Cy5gzdAlpUOYa2WYE2m/9CpnsB3WPiRqdNX3tKlUyNue
         QVhxdJujMomkE8z/9/S6VxaN1KZaW8tKq2SwMeP3jV8wzJKLY59rWKdkN6O3Vo5MAZ9q
         U7vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734420044; x=1735024844;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kwvB7uBpEMwnL4s+j9WaUS+8KTpcKQVS4QfB1gDHcEA=;
        b=nMxLICtGY4kk3/E6lIBvJmkRSx/Zw4JgtANXbYW7PLvRlajcp6V2CWgjlCXHNnRaiR
         QWLZVwvpdxug+er25+AxJRcv2f8rljoh5ufaKYVErngVpC2jmjGM1dKH60aoSgTAMr5P
         ofiBDeAk/6IChi8ZMegBr6zaDf0cHnYrZLI8jSNKpnfmH4YoQGD+/6RUgN2BlEMXMJHJ
         Czaikngfc/GQ67+WubVoB9I8c5TySytU+5XbqJfEUxmn11MW7UzXoHIdRQN3pRaxDz4i
         vh3hTfFVuBDPLIexetfLmpdHtaKQoeYTF+Nyhf4i7H1FXU2XIf5mTYjHo6kQGN0UdL9x
         FX1A==
X-Forwarded-Encrypted: i=1; AJvYcCVcTZ5OLdVyVwMosIxvQDYXviEaf9Hs7Y98BlPfVuKN/7sU34AGhAvtPyCzKexWizjTcQdOgqr7OSEU3e2sHjMD@lists.infradead.org
X-Gm-Message-State: AOJu0YxsOyvyAjWh00ebxfKuUTboNIEtDdc0Cr1tZtM4UZ/hk4Y91l8c
	bW43FqTnCx01hC2A3alSLNgd1StJCyoVjJSPRM8fktB+DPv2b/xhaBPG5rqxcRw=
X-Gm-Gg: ASbGncuvgHnhVqFPxAaqPghVHtpRAb+S55c4B1OfjDe1NbApNe6flEW/sFkZhaUROME
	K14qdF98IZBDrMIjYdCsUWMi8obsgZCgWs1tMpENWvrikTwzUnQCVxtAgBKPUgadWcPYxKnTrXn
	kRM7zte3qC/AcZPOIeifBDedxwOgBSqkeCE3A8x1xKB58rwXMy8uSMt/gSd/AxS8qs5NYSVDdKu
	7pjcrecZmNZ3HxiRWrLdpZeTHlgvz6KvE4E3Tv0B+P/P0dJZW43jsai9A+DmEGf
X-Google-Smtp-Source: AGHT+IF9HA/1SKKgvXJjtH52nkzbyQi6zojEXUgurj4MP9uhS4GfNABlmxHlIXgDW1wjDEC3z9sBhw==
X-Received: by 2002:a05:600c:1583:b0:434:e892:1033 with SMTP id 5b1f17b1804b1-4364812a08cmr15865095e9.2.1734420044507;
        Mon, 16 Dec 2024 23:20:44 -0800 (PST)
Received: from [192.168.0.14] ([188.26.61.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c801637esm10236598f8f.28.2024.12.16.23.20.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2024 23:20:44 -0800 (PST)
Message-ID: <45a54924-226e-4a94-b1ae-b0f1f703f854@linaro.org>
Date: Tue, 17 Dec 2024 07:20:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: exynos: gs101: add ACPM protocol node
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
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <Z2B3V78k2ibIdLYh@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_232046_559841_616A0C9D 
X-CRM114-Status: GOOD (  16.94  )
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



On 12/16/24 6:54 PM, William McVicker wrote:
> Hi Tudor,

Hi, William!

> 
> On 12/12/2024, Tudor Ambarus wrote:
>> Add the ACPM protocol node. ACPM protocol provides interface for all
>> the client drivers making use of the features offered by the
>> Active Power Management (APM) module.
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>> ---
>>  arch/arm64/boot/dts/exynos/google/gs101.dtsi | 22 ++++++++++++++++++++++
>>  1 file changed, 22 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
>> index 04561e15b96c..8c3f07371912 100644
>> --- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
>> +++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
>> @@ -277,6 +277,28 @@ apm_sram: sram@2039000 {
>>  		ranges = <0x0 0x0 0x2039000 0x40000>;
>>  	};
>>  
>> +	firmware {
>> +		acpm_ipc: power-management {
>> +			compatible = "google,gs101-acpm-ipc";
>> +			mboxes = <&ap2apm_mailbox 0 0
>> +				  &ap2apm_mailbox 0 1
>> +				  &ap2apm_mailbox 0 2
>> +				  &ap2apm_mailbox 0 3
>> +				  &ap2apm_mailbox 0 4
>> +				  &ap2apm_mailbox 0 5
>> +				  &ap2apm_mailbox 0 6
>> +				  &ap2apm_mailbox 0 7
>> +				  &ap2apm_mailbox 0 8
>> +				  &ap2apm_mailbox 0 9
>> +				  &ap2apm_mailbox 0 10
>> +				  &ap2apm_mailbox 0 11
>> +				  &ap2apm_mailbox 0 12
>> +				  &ap2apm_mailbox 0 13
>> +				  &ap2apm_mailbox 0 14>;
>> +			shmem = <&apm_sram>;
>> +		};
>> +	};
> 
> You mentioned in the previous patch that "GS101 has 14 mailbox controllers",

Right, I got the number from the GS101 memory map.

> but here you have 15 mailboxes. I looked at the downstream driver and see the

Here we have a single mailbox controller, ap2apm_mailbox, with 15 channels.

> number of mailboxes is defined by the ACPM framework (firmware) which is read

s/mailboxes/mailbox channels that ACPM uses/

> from SRAM initdata. Dumping that, I see there are 15 ACPM channels. Have you

Correct.

> looked into into extracting the data from the initdata SRAM address?
> 

Yes, that's the reason why I defined the 15 channels from above for the
ap2apm_mailbox controller.


Cheers,
ta

