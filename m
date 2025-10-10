Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19E99CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 14:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u14/N400ai00fHVt2vd3J2VDGyko/X+Jvfxoof1W8ko=; b=4S9kj8Bap0iY/gJCE+KFueWGfO
	pdfLrgM8aIIHnfsVaLFANLHyvITgC1gMdXr9nA7PKdan4ipqCjR5C62b1rwD1soSo4fvdFKNhlEqK
	My06Dp8izN5oCAGPf+Fn0hs8vO5IZlbQ+BKusMHm8aGSmGsrQJsOqaSSshOOSi9oMZBmebS9W+FSn
	lMWAcibSY6J1i68Af65hof0RCgdd+Cr7CHAJgHMMVc8D31mEtlZ14cSAbry9QOh0+IB7fId0b9Cmi
	xAe5I+ts6XA0+IpXEGyXh6ISqPPmhAuolX68g4MgVVVVEcs78VGUWUdtFneYaCeofmWlY3RFCKXaw
	nf7fVdEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7EY2-00000008kTl-3Wcc;
	Fri, 10 Oct 2025 14:56:46 +0000
Received: from mail-pf1-f177.google.com ([209.85.210.177])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7EXy-00000008kSG-33RN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 14:56:45 +0000
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-77615d93276so169298b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Oct 2025 07:56:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760108201; x=1760713001;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u14/N400ai00fHVt2vd3J2VDGyko/X+Jvfxoof1W8ko=;
        b=bj5G7uxlCEigfUmjN5y+UHOS/hLoIfnTcct//Pxo6pV+4jDNRQV9hqtK4zxl779puo
         H++NOzHDoYSEz4T+logWgnmmrO1AO4U+NT4+Kq2H39J4ouGP4gJhCh/w8Yz8Y7y+OSlc
         GtQ3LGQ9XclcPIMa3U9h/aC226DCyAbD7FBAQo47UYR6QjF1eDOskm9Yrop2clCE+oWr
         SlL/L/Q/fj7Qs157sIEWBn69Mp9nfNKatNrQj/4ayFcZw+5pQ2aMcqTbE0tM5/Tdkswk
         spgr6JWPWnjKR8LyFoonmdAzpxUa1AUpXvlaDtwUngi83ax2Gm1g6B+zL9LORC/f9s8s
         kWJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFvqFiL5D7cY3sE/HUnWk9cxi97kIp9YNKdgoK45Mr7+6q6YV3By78FAPPGXJGZvW16/tIGbpixQN6POtEes66@lists.infradead.org
X-Gm-Message-State: AOJu0Ywzb9M+G6WpAnsvXv+CWWVjDlzgAdM9BJVC78+Ewc3RkGfyH5RT
	VkDVsftKoWNj2e8SbmhgwwuuiYvqtOnWBl0NOHklVZvKIndJm49dGbhW
X-Gm-Gg: ASbGncstqRPBv+grABzrIje85ciM9/hI80QpmJ2wnCXLpx8XotBvwx18SwXQnrXwadz
	A1cPnUH7HM/+FIHR+7MeYBex69jmIV00cwBaRydsBjCcueOwJKSl6VlAsnDhv+WomunGVajtoWw
	0HHW1ON14JZVsRcnWjrXV6KAm8nBJYAxdeytnm1NIXG9hUWJzSgx1bC8ZTAD+qa7kqJTkhzp6T6
	dLF0uXVQvdxwJ0hfyU09spmvRRcWJ7phXeuxfDCXpozeaaOTUTx+evk1rksIhjwRrLT4U3Lbt/i
	rZreQfOCtBn+jG7ApUgNz4ECZTWKnFoPdiQpyrmFiAVv00fRuMygSjucumvZqGw2TMb5tx7D/rd
	TfxRKBIMydnJWNICI01TEjrXaLDUkvL8jpj9HN1gh0M9aNppVuZC/x+Kdm1JvW0dx9vVc8XP8TQ
	Ts1DLef2Ya6FUo9qvJ7scCuSO2rFHUxOiktWEgZj448y1htA==
X-Google-Smtp-Source: AGHT+IGKWpnWR6YqBmKsSfIMcNBcVWPGcNUFMQXbOJpvBadgaHtn89wm2K6tlg04cMPFDt3oWIIQGA==
X-Received: by 2002:a05:6a00:1250:b0:781:1bf7:8c66 with SMTP id d2e1a72fcca58-79387c1ae19mr7895962b3a.7.1760108201302;
        Fri, 10 Oct 2025 07:56:41 -0700 (PDT)
Received: from [192.168.1.57] ([27.173.241.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992b252f23sm3232472b3a.6.2025.10.10.07.56.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Oct 2025 07:56:40 -0700 (PDT)
Message-ID: <5b5d6f02-3161-4490-9652-e6d23e320a57@kzalloc.com>
Date: Fri, 10 Oct 2025 23:56:34 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: cpufeature: Don't cpu_enable_mte() when
 KASAN_GENERIC is active
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 James Morse <james.morse@arm.com>, Yeoreum Yun <yeoreum.yun@arm.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, Marc Zyngier <maz@kernel.org>,
 Mark Brown <broonie@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Ard Biesheuvel <ardb@kernel.org>, Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com
References: <20251008210425.125021-3-ysk@kzalloc.com>
 <CA+fCnZcknrhCOskgLLcTn_-o5jSiQsFni7ihMWuc1Qsd-Pu7gg@mail.gmail.com>
 <d0fc7dd9-d921-4d82-9b70-bedca7056961@kzalloc.com>
 <2b8e3ca5-1645-489c-9d7f-dd13e5fc43ed@kzalloc.com>
 <aOj8KsntbVPRNBKL@willie-the-truck>
Content-Language: en-US
From: Yunseong Kim <ysk@kzalloc.com>
Organization: kzalloc
In-Reply-To: <aOj8KsntbVPRNBKL@willie-the-truck>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_075642_766204_563CA399 
X-CRM114-Status: GOOD (  18.39  )
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

Hi Will,

On 10/10/25 9:29 PM, Will Deacon wrote:
> On Thu, Oct 09, 2025 at 08:10:53AM +0900, Yunseong Kim wrote:
>> To summarize my situation, I thought the boot panic issue might be due
>> to incompatibility between MTE and KASAN Generic, so I sent this patch.
>>
>> However, it seems that the problem is related to the call path involving
>> ZERO page. Also, I am curious how it works correctly in other machine.
>>
>> On 10/9/25 7:28 AM, Yunseong Kim wrote:
>>> Hi Andrey,
>>>
>>> On 10/9/25 6:36 AM, Andrey Konovalov wrote:
>>>> On Wed, Oct 8, 2025 at 11:13 PM Yunseong Kim <ysk@kzalloc.com> wrote:
>>>>> [...]
>>>> I do not understand this. Why is Generic KASAN incompatible with MTE?
>>>
>>> My board wouldn't boot on the debian debug kernel, so I enabled
>>> earlycon=pl011,0x40d0000 and checked via the UART console.
>>>
>>>> Running Generic KASAN in the kernel while having MTE enabled (and e.g.
>>>> used in userspace) seems like a valid combination.
>>>
>>> Then it must be caused by something else. Thank you for letting me know.
>>>
>>> It seems to be occurring in the call path as follows:
>>>
>>> cpu_enable_mte()
>>>  -> try_page_mte_tagging(ZERO_PAGE(0))
>>>    -> VM_WARN_ON_ONCE(folio_test_hugetlb(page_folio(page)));
>>>
>>>  https://elixir.bootlin.com/linux/v6.17/source/arch/arm64/include/asm/mte.h#L83
>>
>>  -> page_folio(ZERO_PAGE(0))
>>   -> (struct folio *)_compound_head(ZERO_PAGE(0))
>>
>>  https://elixir.bootlin.com/linux/v6.17/source/include/linux/page-flags.h#L307
> 
> Do you have:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git/commit/?id=f620d66af3165838bfa845dcf9f5f9b4089bf508
> 
> ?
> 
> Will

Oh, There was a recent patch! Thanks a lot for letting me know, Will.

The current Debian kernel is based on v6.17, so this patch isn’t applied yet.
I should also let the Debian kernel team people know in advance.

I’ll apply and test it, Thanks again, Will!

Best regards,
Yunseong


