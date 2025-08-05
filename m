Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFAA0C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 13:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cZWweXfQATMKDZrk4sSi9lSBe6kngHTyWWLkx0Jj+bk=; b=g5k/a1h2ArFVcoF0WKb479m6kf
	zbEvchl1ZZWzr8W0pCx2gqP2ZTzIXzirfez4kOUajkw/pBHczgcXgPKJkVHY4QbkuGYaBrSbLcrAM
	KpuWAVZsqdYIS8HPWuyRY7f4TBJUDdo2lABu2DzVvmhs7pk2zOnmU8K/baTM36a5dzuG8IpzeovcJ
	6OJRs20MjEc0VIX36vJB65V+xLXCmxVCoMt+slgNifWIaLnYlP8agXx90egR9Npp0q/5ThpTQlLeV
	RBLVCT/eGWt1z7guUsu8h/2Y8PC6TcztBnPzMiAdUahH8SIE+mcOaLujmH7ukietW0ZSpR38C2OY+
	edXPPZ0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujHvJ-0000000CsHk-2JcW;
	Tue, 05 Aug 2025 13:41:49 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujHkP-0000000Cqec-1SUH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 13:30:34 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-76bd2b11f80so4578968b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Aug 2025 06:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754400632; x=1755005432; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=cZWweXfQATMKDZrk4sSi9lSBe6kngHTyWWLkx0Jj+bk=;
        b=jktVS03+4osnGk7BP74AbqUz7C6jB+cpct9+EEzMJrjiREaMGcxnNhUZRY1hwUHUFp
         M9CD8JbmjMklssUECdE8DQbCkveceuQcTyIP7lto6wYoySwnARDMdb/BoHimiRVK3MRB
         jmPgN/H7f2hXHmACMU7aZVZFi1CHzOFKD5SVh8kek/uB6zcD7FTySUJ5DM7vnF1Ry002
         /vRTp5cJ/kIgYSCLgTkJLctFcVp5ZQUJEXdHNjGZ1B/30k3Qh0XmQu0HL04yUvPyUMwd
         OliBj0aNJ0ILFaVEIMsHg21blEPSUL0PtWjzxHOjabuIF38StZs0CdAjFF2fdXEXcIRX
         Umxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754400632; x=1755005432;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cZWweXfQATMKDZrk4sSi9lSBe6kngHTyWWLkx0Jj+bk=;
        b=iF78wingSIgi8MG+cab21L6Z2PcRutCQZakEx4KBvkV5OFEBU5hzVoZGRPKHi3eCCN
         Q/dRoMAxY6NHm9zzOGMbhVg99uTc9J5goDx1PQR7IIhPH1KEWtIjIXt2aLdnu80CdMSD
         XBMcJVA0EUg7TZ8zjSjCldPDKHmTPW1ZjoOJTXcR8plYLHAEsdPHulLeVkhSTE3rRHmP
         cb12KamUb72QFKBRiKawz+ks6LM7MxgOaZ/+oZCtuoHrxLjwrPhxj3vZU/6gD5Asy7qn
         EkiZR21JKAi2og4PQIjSxaVoZ6K+V9mVjba+3Ca/GZjw+eaB2a14BgkPV+UjT8kuHee/
         6tGA==
X-Forwarded-Encrypted: i=1; AJvYcCWPvA0614Fv/65lGY5HkPUAMbpsVxi0BO5g7CzDM5S6DXyQpUaZDhZ7DLqrlaBXPhPcw06AGDYFzu9hlHxaeG0l@lists.infradead.org
X-Gm-Message-State: AOJu0Ywya9Rwrg01zNkjgGHi34oMDW3DfXpWkMc7jMj3EFdbR5+vxypY
	YvLSrbjEUbZBJTZwI/m/vJ3wTY2w23RQMxSI5tOte3a1S7DjQeOwVAnI
X-Gm-Gg: ASbGncuEp1kadczr96W3FmPCnA4Ao9P26DW8nG4IkkHZ2iJqbbfjgCGlLlYv0Jv0jtx
	uNIOnZizcGxXgGgfjs81UzlU+Vl0ejn8VE9I1gOjSbYAGPhtQOkRKAuoiLjEBHOi5eM8TdQLwNK
	LS+BwLbzGNNf3s0hEscUG24A6Q5EFmqQM6/H4pKe/25GX6aDDBUEXBhZSI2UE4J8H1+Bb1h2JBx
	1X4tDdgF/MBTxVAeqqBuPr8wNzlxtoPuJr9abKapdu5OcExh42ZT4yLKFZnxym/l1WEy7sqc+/N
	8pP2DrHK2MJ7AkXNy2g7KkvbIYHab252sRBqKwesnmTTlrz1EQpAQpbUjeyh49/TUwnfLNwAbQu
	qxFU6GfZXgsRoRyEGC6DzWpMapMFcFHhqMIbfwXBk+sGGlZrOs58yRkex4H4vqK6qeKqXgDYf2Z
	SvkyFlxA==
X-Google-Smtp-Source: AGHT+IEvnnUy8re3j4J8a2pONxFAYiEi2+s8IXa2eOgdUl/cWzHK8tCot0jxI7/XmCVPhO59t4Zp8A==
X-Received: by 2002:a05:6a20:3d10:b0:21e:eb3a:dc04 with SMTP id adf61e73a8af0-23df8f94a47mr19694788637.3.1754400632409;
        Tue, 05 Aug 2025 06:30:32 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b422bae2fe7sm11241719a12.44.2025.08.05.06.30.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Aug 2025 06:30:31 -0700 (PDT)
Message-ID: <30e377c4-15a2-4201-98b0-f00670af1ee2@roeck-us.net>
Date: Tue, 5 Aug 2025 06:30:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] watchdog: s3c2410_wdt: Fix max_timeout being
 calculated larger
To: sw617.shin@samsung.com, 'Sam Protsenko' <semen.protsenko@linaro.org>
Cc: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
 khwan.seo@samsung.com, dongil01.park@samsung.com,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
References: <CGME20250724081336epcas2p38e95932ddc5c702e05a6436f05582993@epcas2p3.samsung.com>
 <20250724080854.3866566-1-sw617.shin@samsung.com>
 <20250724080854.3866566-3-sw617.shin@samsung.com>
 <CAPLW+4nRh9DEnkhunG68xvGdaNJswC8fN4v4uBA1Aaao_5pxfw@mail.gmail.com>
 <000a01dc05c0$9f0ab110$dd201330$@samsung.com>
 <18adfcd0-e955-4c3f-a68a-6a2f75ebd24d@roeck-us.net>
 <CAPLW+4kVMo68DAO0y_=m3k81Xeh4wYV9+KX3fg=5S7xwOh0O7Q@mail.gmail.com>
 <008501dc05da$36362600$a2a27200$@samsung.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <008501dc05da$36362600$a2a27200$@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_063033_406634_B38AF1E4 
X-CRM114-Status: GOOD (  11.11  )
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

On 8/5/25 00:26, sw617.shin@samsung.com wrote:
> On Tuesday, August 5, 2025 at 2:03 PM Sam Protsenko <semen.protsenko@linaro.org> wrote:
> 
>>
>>>> +       u64 t_max = n_max / freq;
>>>>
>>>
>>> Make sure this compiles on 32-bit builds.
>>>
>>
>> Can you please elaborate what might be the possible problem -- just
>> curious? I admit I never though about 32-bit case when writing that code,
>> but don't see any immediate issues with that too.
>>
> 
> In my opinion, it seems that Gunter Reck's explanation is correct.
> I've found out that the error of "undefined reference to '__aeabi_uldivmod'" may occur when compiling new code on a 32-bit architecture.

Also see include/linux/math64.h. The functions implemented or declared
in that include file do have a reason to exist.

Guenter


