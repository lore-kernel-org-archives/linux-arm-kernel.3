Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2DD1D64097
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 23:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0oSoie1qIRXgWGFb6cKb7mnY6LaDSDkqhi5T4II1in0=; b=dckmjqVc4SQj5WVYuM2x+1W9Xo
	IUTyztGcchCVPVsGPZSDLmHw3n6+Q9rfZrN16BtIDg4ImQaRToBenqZjg22+HE2p+78S7UbjpjIvL
	XHDoKJ1cbEwp4OFDyYkLzpfb+PvbuHL6EblJwci00LyLek0yKt0e15VFazLPnEj3vMUm1K5G9jQYI
	Tk06d4GzyGguk7cTXzzIhxmMuVuy03QYbABGmawXn6V4sLX6isO4YZZr3B8o53Fy4eTvHRao8lfKr
	955G8DXGnIvCC/NIFh5VuYHfY1vpU7dTeUa01BQqFQdHZiq++eqCyAdJ0ksdKGyehZ+/JaVVDsPkF
	AvYg79Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9YDm-0000000CCem-2TE4;
	Fri, 08 Nov 2024 23:16:54 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9YC0-0000000CCOM-0b64
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 23:15:05 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-37d70df0b1aso1565400f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Nov 2024 15:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wirenboard.com; s=google; t=1731107702; x=1731712502; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0oSoie1qIRXgWGFb6cKb7mnY6LaDSDkqhi5T4II1in0=;
        b=eqhQgH8gpcEAbp463H0TPwUfqMMHL4fKMFmOkpNn6Q7eWbXENxMwgzyn9a1K30U4CP
         j+hnvO89vCiFF4H6ORCrugMsvqIRz33TPk2Lndm2iJTYkdYcuYy4bQVOyR0KaA+qW+nL
         2ylGDhvzRTckHWoqAsRQeTRLwEqtbw4BXDdX6SZwtk3uRKHvo3HmR0Ky2zJ6pEKTNDLH
         6/t1jqS700sHANLP4xLZftmqc+p0RXrLwrg4bUFjZBYrcHqz5f5FUkotYLjvF9XN/qKO
         IIZy159xaUdAJUW6KAWIxhN7BzUpX0ig28xAbeng2LZIhkZCZYGkw0BxzFN0UR240biS
         WlIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731107702; x=1731712502;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0oSoie1qIRXgWGFb6cKb7mnY6LaDSDkqhi5T4II1in0=;
        b=YMoapAQtOb6r6C3BlOISKlr1RpNXGRHV57GbL7fowH6WJDoPMbPVRmBoFaHA651MTi
         i7mufKm7+5Vd2ed1+mfsR+LFmrbWuYmxo0XuaJesrzhb9Vtdp3rSwx+Um30csp/R/MWm
         SFoPKFapC6qhtY4xXP8n8fLzFZ72DhP2cgTTlwzfscml5VwMOLa6t3hddHhKt9xJ+nAv
         6Eh3OM/uzc5FMi0x3GDdZ0BLF+5YELgFr1353gdQsfaN4/PNXOgV2ZzRPWUR/2Xxv5cD
         dX6VJW+DZdz2tGVL80Lu5Bk3trm3ayexiaHkL/HZNTBq7bikGBH7rRBSLEIxlasqREYz
         9uQg==
X-Forwarded-Encrypted: i=1; AJvYcCVXMbsnbz3qNqUkC33k49h01jyIxRk+DJfazMfbf/hXipvRJOxvlWg9BbYuUBprRAfE5VsUVZ89fGxFFl4fJEPS@lists.infradead.org
X-Gm-Message-State: AOJu0Yxa+YNubtlenmnjFaHwC6hIEvnrzVvsB5EZW8JF4AQTqdH/Mlwh
	t0vcosJuM/qYjuohSp+vzVVVfUJtIkg3Jzy5Qq6PbkjqHTMHtevT9upw/weuw1U=
X-Google-Smtp-Source: AGHT+IEkXE8e6btQk8tjWEgg1I5q8fB3JHMfs8pcIcYIogpdbfL+NQYAjuHnUilwSeLh4eJW9S2S/w==
X-Received: by 2002:a5d:5f93:0:b0:37d:493c:f7b8 with SMTP id ffacd0b85a97d-381f1867129mr4149308f8f.2.1731107702379;
        Fri, 08 Nov 2024 15:15:02 -0800 (PST)
Received: from ?IPV6:2001:4c4e:24e5:bb00:6639:286e:9ea6:bb49? (20014C4E24E5BB006639286E9EA6BB49.dsl.pool.telekom.hu. [2001:4c4e:24e5:bb00:6639:286e:9ea6:bb49])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-381ed970775sm6137066f8f.13.2024.11.08.15.15.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Nov 2024 15:15:01 -0800 (PST)
Message-ID: <a4fada26-7ef8-4618-9ddd-0962b7dc6efb@wirenboard.com>
Date: Sat, 9 Nov 2024 02:14:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] clk: sunxi-ng: h616: Reparent CPU clock during
 frequency changes
To: Andre Przywara <andre.przywara@arm.com>
Cc: jernej.skrabec@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-sunxi@lists.linux.dev,
 mturquette@baylibre.com, samuel@sholland.org, sboyd@kernel.org,
 simons.philippe@gmail.com, wens@csie.org
References: <20241025105620.1891596-1-andre.przywara@arm.com>
 <7b63b316-4cd7-48ee-ae32-3750d25e2307@wirenboard.com>
 <20241108223400.460982d6@minigeek.lan>
Content-Language: en-GB
From: Evgeny Boger <boger@wirenboard.com>
Organization: Wiren Board
In-Reply-To: <20241108223400.460982d6@minigeek.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_151504_218271_CF152182 
X-CRM114-Status: GOOD (  21.38  )
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

On 11/9/24 01:34, Andre Przywara wrote:
> On Fri, 8 Nov 2024 23:14:51 +0300
> Evgeny Boger <boger@wirenboard.com> wrote:
>
> Hi Evgeny,
>
>> Tested-by: Evgeny Boger <boger@wirenboard.com>
>>
>> We had stability issues with some of our T507-based boards. T507 is the
>> same die as H616, to my knowledge.
>> They were fixed by essentially the same patch, which we unfortunately
>> didn't submitted to mainline:
>> https://github.com/wirenboard/linux/commit/dc06e377108c935b2d1f5ce3d54ca1a1756458af
>>
>> It's worth noticing that not only the reparenting is mandated by T5 User
>> Manual (section 3.3.3.1), it's also is implemented in vendor BSP in the
>> same way.
>>
>> We tested the patch extensively on dozens of custom T507 boards (Wiren
>> Board 8 PLC). In our test it significantly improved the stability,
>> especially at low core voltages.
> many thanks for this reply, I was hoping for such a kind of report!
> I typically don't test those things in anger, and only have a few
> boards, so having those reports from the real world is very helpful!
>
> Can you maybe give some hint on how you tested this? Does "at low core
> voltages" mean you forced transitions between the lower OPPs only, or
> were the chips undervolted?
Both, in a way. Some boards (about 1 in 20 or so) would hang after a few 
days of operation.

During our investigation, we found they would never hang under stress 
testing, so we started examining cpufreq-related factors.

Disabling lower OPPs also prevented hanging. If we artificially lowered 
the OPP voltages (undervolting the chip), the boards would hang much 
faster without the patch, and even the previously stable ones would 
start to hang.

>
>>   From my understanding, all Allwinner SoCs need to follow this kind of
>> procedure, however it's only implemented in mainline for a handful of chips.
> Yes, I saw, I have added this to my A523 code already, and prepared a
> patch for the H6.
> Do you have boards with any other Allwinner SoCs you could test on, or
> even already have experience with?
Unfortunately, no, not really. We only use the T507 and A40i at the moment.
We’ve never had these kinds of issues with the A40i, though. By the way, 
the A40i is among the few Allwinner chips with reparenting implemented 
in the mainline.

The A523/T527 is really nice; it's a pity it's limited to 4GB RAM.

>
> Cheers,
> Andre

-- 
Kind regards,
Evgeny Boger


