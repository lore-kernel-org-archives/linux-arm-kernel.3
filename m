Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A44B7C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 07:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o8vH8JfnKijTJB45W87819LYq2SjUU3QszzdXJjSPeo=; b=uU3v6+x469/CbbAioPPmOxzZ4h
	5FWxPi2CWFinCZQcC2qVt1aTEuua1MmrPJ1STcPGJMYV0zkwrbgk7h7e2nF9uUKchSQcpOIXJFqZA
	rcd57mxhtH/JQl/q8M2tpB97oPz1fFny3qjkPqJS+5xhGFK+Dr2FwEzsi9SPbKyUc5D75GV8GzbUs
	fZN9hKiajSDqpZGJQXWYOB5cyrhiZdJJrwZ0Sf/Th4kyX0ykMTCSwOIn1AiLRL0RRemZsEJB/Dqjs
	1AF636RYNHQ3VTv8p8b8xVka7XDT09rcZkPqvOyIRXyFHbfClaW1Y47x1GWa5Mqlf/rruZjjjaJ+h
	EW9d206g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueqa2-00000006jeI-47HY;
	Thu, 24 Jul 2025 07:41:30 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueqJJ-00000006h0E-3B3Z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 07:24:15 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-454f428038eso5544645e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 00:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753341852; x=1753946652; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o8vH8JfnKijTJB45W87819LYq2SjUU3QszzdXJjSPeo=;
        b=kosMgDX3g0Z738518ewai77AcmCW3ofRi4tq7GuXWa5RLmMhqQI6pXcloFwD/caG5p
         aM1a2uQ26Kk2Em+GmBG8vYld6IITlQU6dW2QnR6722eIz/iQophAV/8GDQ/rGvQ5p+8E
         Dv0qlvoUp1N1k94RbGXPzSKCbMXd805aE6A4f3YM2YD1bGtCMGJQY9xCMo+bm1a27RJ7
         r9HuasgIakpFOWYRTnVlma9Tjm8AmaRv1klCS5UVXDE1COmQKAxWpbyCTbAOjJFDwfJ2
         9Quyp1dskKB2CjF99ZSte6aOTys2yggvLEOlUk2bnulQkm7PVmyKd11yBRV+lypH4DtH
         kgRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753341852; x=1753946652;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o8vH8JfnKijTJB45W87819LYq2SjUU3QszzdXJjSPeo=;
        b=vYA0jJhZEIEeqSr0yjbctF/tpE33ju25w86yufeprDCBOebM4kLFIl9CAr/FeTOKqE
         bH0sIqNEn4nSQHGD4VNJeIYf8Jg/zCFejnBFW4+rDkEuzQfTAZe3fk+f3jXvgVPmocnj
         1RK4HT91jTjlujzWzwQGEMD40tgNfiHKRQBv9az0dvD6TarvuY0yV7ZIZhTVBbV76ykm
         eSrfCLzfmBctf4OnTBYp137p/0pwGmoyErg3tYjpZk5bZ9LzcdgarQpGZqlK0NpNStk5
         nZ7lmIJIAaYLniWfjtbcYdqhJqJf3cD6dnkycADzjz6vGHuFbgo1l9HAaZXCFQ95f7mL
         UhTg==
X-Forwarded-Encrypted: i=1; AJvYcCXLrCp85sTB9+cZGRgga7hq7sGv4ILwo0Rafw7l3ITUMMYjyIIoXGK7645pW8I859/A8e1b3DiqU2pZf4S+xy7b@lists.infradead.org
X-Gm-Message-State: AOJu0YyatEKCpmqAVJV5PnGR0JExXOQ4fm80XT6b/Rtb7z8F1LRY44EA
	b7oDLOMvJNuq+6N23yrQ52rQ2YQJUmUb7QCZ7c7SIC6YQtlB7Tw+T28E
X-Gm-Gg: ASbGnctwd2KTQlqkes1eYBJlhcHojgGRDsuZE4GbCZsGCpTii4fl0QjK1+vnhDmrVLP
	jr8KKSHn8jL0tgwZNgzNk1RFMZMSFlNozg9VYnEUf5wN/8eOr8v+gn960K0GVEggXJV5Xq/t6EA
	Tbzj5G1x0EfglnV2g7r2VWDWIl0MNku/FhOknBoX6LlsKYMjZO8BBG6lNFsLvE4XlNPkdlfH2xR
	As3pHXDlP8blRuUfbJofVXITQVO8oVjEqNvwfxNfIuYRMmCRos5SzL38q74X6s1PQcS+rDjqiCS
	V2wFkN12KSR0dkqFqg+yL1QaAX2QBygl5f+1np54yMdDvuxBOiPul5yQaGS8a7J8g8w4SIUHQTT
	/fm/p6rIMBnEYA+PDG6msZRAudfumZD7WiU91WI8VqwY2TdMKVUWAEZfGTI33ZaDJCeYygUeI8k
	MF
X-Google-Smtp-Source: AGHT+IHJ2yzAoWayRGrUS7izFIhkrxGchhvycroHp+KIHa7mpc3HqJKp+E42uRSyubs/rDl8+yH73g==
X-Received: by 2002:a05:600c:8717:b0:455:fc16:9ed8 with SMTP id 5b1f17b1804b1-45868d4eaf7mr55550145e9.30.1753341851836;
        Thu, 24 Jul 2025 00:24:11 -0700 (PDT)
Received: from [192.168.1.107] (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458714605c2sm3269475e9.19.2025.07.24.00.24.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jul 2025 00:24:11 -0700 (PDT)
Message-ID: <f5022fe7-c3f6-4bea-bb0c-98dfe461d555@gmail.com>
Date: Thu, 24 Jul 2025 10:24:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] dt-bindings: soc: samsung: usi: allow 64-bit
 address space
Content-Language: en-US
To: Sam Protsenko <semen.protsenko@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250722121037.443385-1-ivo.ivanov.ivanov1@gmail.com>
 <20250723-hypnotic-malkoha-of-trust-9efdb6@kuoka>
 <3e1d7be9-e99f-41c3-8b0d-aaa426aa9de8@gmail.com>
 <CAPLW+4kPN65uX0tyG_F-4u5FQpPnwX9y6F1zrobq5UyVbks+-w@mail.gmail.com>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <CAPLW+4kPN65uX0tyG_F-4u5FQpPnwX9y6F1zrobq5UyVbks+-w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_002413_794825_DDE12651 
X-CRM114-Status: GOOD (  22.16  )
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

On 7/24/25 06:02, Sam Protsenko wrote:
> On Wed, Jul 23, 2025 at 3:21 AM Ivaylo Ivanov
> <ivo.ivanov.ivanov1@gmail.com> wrote:
>> On 7/23/25 11:15, Krzysztof Kozlowski wrote:
>>> On Tue, Jul 22, 2025 at 03:10:36PM +0300, Ivaylo Ivanov wrote:
>>>> Some device trees, like the exynos2200 one, configure the root node
>>>> with #address-cells and #size-cells set to 2. However, the usi binding
>>>> expects 32 bit address space only. Allow these determining properties to
>>> So if USI expects 32 bit, then why do we allow 64?
>>>
>>> Switching this to 2 means you use 64-bit addressing for children
>> I don't, but the main point was to avoid defining ranges for every single usi
>> node, because they are a lot.
>>
> If all MMIO addresses in your SoC are 32-bit (they probably are), I
> think it'd be neater to just make the entire "soc" bus 32-bit (so both
> address and size cells = <1>), and map it to the root node's address
> space with "ranges", like this:
>
>     soc: soc@0 {
>         compatible = "simple-bus";
>         #address-cells = <1>;
>         #size-cells = <1>;
>         ranges = <0x0 0x0 0x0 0x20000000>;
>         ...
>
> That's how it's done in exynos850 and gs101 dts for example. This way
> you could drop all those extra "reg = <0x0 ...>" in the child nodes,
> also avoid declaring "ranges" arrays in each USI node (just "ranges;"
> would be enough), and this patch won't be needed.

Yeah, but then we'll have one more DT patch that is way bigger, changing
every single "reg =" in /soc. And the device tree for the SoC is merged already.

I do think that the neatest option is to avoid that and set an enum in the
binding, as otherwise we'd be making a stylistic change that has no
impact on functionality.

If we want the device tree to model hardware identically to how it is, then
we'd want to define IPs per bus (which I cannot really do on my own, I don't
even have TRMs).

I'll leave it up to Krzysztof to decide what is best.

Best regards,
Ivaylo

> Maybe I'm missing
> some details though?
>
>> Best regards,
>> Ivaylo
>>
>>>  and
>>> allowing DMA for >32 bit. This should be the true reason - what is the
>>> address space and DMA range for children?
>>>
>>> Best regards,
>>> Krzysztof
>>>


