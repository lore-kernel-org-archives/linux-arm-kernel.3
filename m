Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1E80CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 13:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iwrArVYN6Hgp4+ZQLHEDAJ1uYbH7JoKb4sYghjkBJlo=; b=i9m+nFQJ5ioXmHwM5kld5mhxcI
	/fohI50O6VrSoEX1eLaQ+MEWQ06If5Rwv7MrLXrgUePNzLt0neld0jvIaEtxoVTHtjeLZu2HbyIaG
	bU2/UBWs9LTdUxzlRersg7eOpWurt7JndBemU6vgLasDyV/83HtAttpzhoBS8n6Bev/tTOLkLKPCO
	8RFtB7ZGF3QWSBJPPRzPU38erxVUEWRTmXP5fGqRRBvOrnCvgClK9KPRH8qmzdkiDZZH73nEpkriK
	ptgmg4hUTbrQ0aJJWqB5BQoikwJTJZAjkB/uu+1e9o03yfDlxIwoeox+54D85kjoUr118kMnXYZ18
	L6SIklxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5lE8-000000005j2-3LdK;
	Mon, 06 Oct 2025 13:26:08 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5lE6-000000005ig-3244
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Oct 2025 13:26:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759757165;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=iwrArVYN6Hgp4+ZQLHEDAJ1uYbH7JoKb4sYghjkBJlo=;
	b=PqQ4jB3BNvxUuzxiVTG4e+fhAFhS8jpMM4kIVKjznDbnEQqGo15C2XRDmtr5BATj4sDnJq
	Dk+wVTEteDNqXBuoRnxqtjNAY3tS5vz5dYTIwQ+rpR1fT8PUFWlavk9NEN0RdCwk/JL+Co
	Y7s4CZqYohVm+qQ32n4iRWc9jLwXJBk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-147-O1ngwQykOH6xyynkHpNerQ-1; Mon, 06 Oct 2025 09:26:02 -0400
X-MC-Unique: O1ngwQykOH6xyynkHpNerQ-1
X-Mimecast-MFC-AGG-ID: O1ngwQykOH6xyynkHpNerQ_1759757161
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-46e45899798so17667765e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Oct 2025 06:26:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759757161; x=1760361961;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iwrArVYN6Hgp4+ZQLHEDAJ1uYbH7JoKb4sYghjkBJlo=;
        b=mQlZDXpVhVBVoelsP3jZdpk8Z9kg8LnTort4nznz8JBnHIdQN74gnyXZhJ5GLFTV0N
         tezmOQUbMB/srUBlelDvTk+9bXzpF8Ld+1dKhfD6mhzusMtJQHJkUG65esquL6QVnxjB
         R2duCJQUl0d/bxDkTtJVsWPYekoV73hfRH5mbR3qlMLV/2nl9FJETHDZpox0XENKFrOR
         9jM6F6emdOwiOWHZBhmqtcH8LZ8EGHnxgrt5XTo5aKZFff3ydT2rMwFajuI5GfwTXGF5
         XXJWyCnf7XDM5g4BcUS1/lvWQ+Ot1zFIxFLcRjJ2qxLHadM+4LnhxdIcmlmEW4cssYNB
         wUCw==
X-Forwarded-Encrypted: i=1; AJvYcCXJ/aGI7iAGt7k9QFCqIiisnlpln6cxawYpkySscR/rZF5JIMkjBKhAgkGc2mtO4YCSXQLCglYewaNUSAvEvcO8@lists.infradead.org
X-Gm-Message-State: AOJu0YxZq8Sv/qvNcegJEaQICMr09zWpusdVhU+/udMlEwyehzMjb3Gh
	QZ7g59LQI+Sc4edoc3x+vZGHMDir9ZnEEZsXXb+GMgMFmTIiW2u3cTfAgPXQrWsRju7cXILf/70
	AdAns6fFelPklKb3qVAPhJ2/3oW6NPEsI4ZYSuiZG7X5gam/C+UqNZRXXOtvE5g03gH8u6nEVAq
	Rjkjp9YYPc
X-Gm-Gg: ASbGnctBzy3LWdhwh0D5yZV29Q/1y3P5JIh9EJdHHaGYoFvcT6yFrxxeTknUGqjwynX
	muUHS+OPgsz6kogBWbSspu6aO7SR2rc9hRT3B+Y56GN9p/f9uZQnc3wwGMgEj8NgZ4O0SQpe2Cr
	6lBBxSwF4V1V6JiKQmFXw92FgXvz1V6B5ySaymcyvxhGkZSYNPY+RK7ULzoLdra+heg245+Re81
	0bCU0yp9SamXgfFMbCVeyEcHeJ6dj0RL1QKo0GoG7FSlRI1cg6b3MkKW/WKdcixaqQl+qv44dng
	v8YyG1fK/H/KpVyUjGBgYCmCMMMODpEnJJSb171iVazLDJcbbASjgOwxr3HfytpwiQN8cyRjmZ7
	qwdwlKg0g
X-Received: by 2002:a05:600c:3149:b0:46e:33b2:c8da with SMTP id 5b1f17b1804b1-46e7114829cmr73081715e9.32.1759757161011;
        Mon, 06 Oct 2025 06:26:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEB001Cs9Kie3XUKMPuCcgnWS4oQSNxtEp884mpAdG/6G6PtAWiaGPAxipwUeejHIFC7ewNJg==
X-Received: by 2002:a05:600c:3149:b0:46e:33b2:c8da with SMTP id 5b1f17b1804b1-46e7114829cmr73081485e9.32.1759757160599;
        Mon, 06 Oct 2025 06:26:00 -0700 (PDT)
Received: from [192.168.3.141] (tmo-083-110.customers.d1-online.com. [80.187.83.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e723431f5sm156675695e9.2.2025.10.06.06.25.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 06:26:00 -0700 (PDT)
Message-ID: <1d5df7c9-8eec-49ad-b4c7-39c70bd172d7@redhat.com>
Date: Mon, 6 Oct 2025 15:25:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [arm?] WARNING in copy_highpage
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: syzbot <syzbot+d1974fc28545a3e6218b@syzkaller.appspotmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 syzkaller-bugs@googlegroups.com, will@kernel.org,
 Kefeng Wang <wangkefeng.wang@huawei.com>
References: <68dda1ae.a00a0220.102ee.0065.GAE@google.com>
 <aOACSWYIOD3llWnj@arm.com> <7af02ceb-563a-4bad-84ee-620aaa513bed@redhat.com>
 <aOPBdNLJUdN4EAF0@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <aOPBdNLJUdN4EAF0@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: urdJaiBkq0RyquTDq-l2pUdkkaHnfov-LA4ffBp7_XE_1759757161
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_062606_843832_8056F689 
X-CRM114-Status: GOOD (  24.53  )
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

On 06.10.25 15:17, Catalin Marinas wrote:
> On Mon, Oct 06, 2025 at 09:55:27AM +0200, David Hildenbrand wrote:
>>>> Modules linked in:
>>>> CPU: 1 UID: 0 PID: 25189 Comm: syz.2.7336 Not tainted syzkaller #0 PREEMPT
>>>> Hardware name: linux,dummy-virt (DT)
>>>> pstate: 00402009 (nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>>>> pc : copy_highpage+0x150/0x334 arch/arm64/mm/copypage.c:55
>>>> lr : copy_highpage+0xb4/0x334 arch/arm64/mm/copypage.c:25
>>>> sp : ffff800088053940
>>>> x29: ffff800088053940 x28: ffffc1ffc0acf800 x27: ffff800088053b10
>>>> x26: ffffc1ffc0acf808 x25: ffffc1ffc037b1c0 x24: ffffc1ffc037b1c0
>>>> x23: ffffc1ffc0acf800 x22: ffffc1ffc0acf800 x21: fff000002b3e0000
>>>> x20: fff000000dec7000 x19: ffffc1ffc037b1c0 x18: 0000000000000000
>>>> x17: fff07ffffcffa000 x16: ffff800080008000 x15: 0000000000000001
>>>> x14: 0000000000000000 x13: 0000000000000003 x12: 000000000006d9ad
>>>> x11: 0000000000000000 x10: 0000000000000010 x9 : 0000000000000000
>>>> x8 : 0000000000000000 x7 : 0000000000000000 x6 : 0000000000000000
>>>> x5 : ffff800088053b18 x4 : ffff80008032df94 x3 : 00000000ff000000
>>>> x2 : 01ffc00003000001 x1 : 01ffc00003000001 x0 : 01ffc00003000001
>>>> Call trace:
>>>>    try_page_mte_tagging arch/arm64/include/asm/mte.h:93 [inline] (P)
>>>>    copy_highpage+0x150/0x334 arch/arm64/mm/copypage.c:55 (P)
>>>>    copy_mc_highpage include/linux/highmem.h:383 [inline]
>>>>    folio_mc_copy+0x44/0x6c mm/util.c:740
>>>>    __migrate_folio.constprop.0+0xc4/0x23c mm/migrate.c:851
>>>>    migrate_folio+0x1c/0x2c mm/migrate.c:882
>>>>    move_to_new_folio+0x58/0x144 mm/migrate.c:1097
>>>>    migrate_folio_move mm/migrate.c:1370 [inline]
>>>>    migrate_folios_move mm/migrate.c:1719 [inline]
>>>>    migrate_pages_batch+0xaf4/0x1024 mm/migrate.c:1966
>>>>    migrate_pages_sync mm/migrate.c:2023 [inline]
>>>>    migrate_pages+0xb9c/0xcdc mm/migrate.c:2105
>>>>    do_mbind+0x20c/0x4a4 mm/mempolicy.c:1539
>>>>    kernel_mbind mm/mempolicy.c:1682 [inline]
>>>>    __do_sys_mbind mm/mempolicy.c:1756 [inline]
>>>
>>> I don't think we ever stressed MTE with mbind before. I have a suspicion
>>> this problem has been around for some time.
>>>
>>> My reading of do_mbind() is that it ends up allocating pages for
>>> migrating into via alloc_migration_target_by_mpol() ->
>>> folio_alloc_mpol(). Pages returned should be untagged and uninitialised
>>> unless the PG_* flags have not been cleared on a prior free. Or
>>> migrate_pages_batch() somehow reuses some pages instead of reallocating.
>>
>> Staring at __migrate_folio(), I assume we can end up successfully calling
>> folio_mc_copy(), but then failing in __folio_migrate_mapping().
>>
>> Seems to be as easy as failing the folio_ref_freeze() in
>> __folio_migrate_mapping().
>>
>> We return -EAGAIN in that case, making the caller retry, stumbling into an
>> already-tagged page. (with the same source / destination parameters) IIRC)
>>
>> So likely this is simply us re-doing the copy after a migration failed after
>> the copy.
>>
>> Could it happen that we are calling it with a different source/destination
>> combination the second time? I don't think so, but I am not 100% sure.
> 
> Thanks David. I can now see how it would retry on the same pages without
> reallocating. At least we know it's not causing any side-effects, only
> messing up the MTE safety warnings.

As long as the folio is not getting reused elsewhere, yes.

I haven't fully understood yet if there could be cases where we use the 
folio for another source. But I think it's not trivially possible, 
because I think we allocate dst folios based on source-folio properties 
(order, node, zone, etc).

> 
>> The most reliable way would be to un-tag in case folio_mc_copy succeeded but
>> __folio_migrate_mapping() failed.
> 
> Clearing an MTE specific flag in the core code doesn't look great. Also
> going for some generic mask like PAGE_FLAGS_CHECK_AT_PREP may have
> side-effects as we don't know where the page is coming from (we have
> those get_new_folio()/put_new_folio() arguments passed on by higher up
> callers).

As an alternative, I would probably have done something like providing a 
simple folio_mc_copy_abort().

> 
> I'm tempted to just drop the warning in the arm64 copy_highpage(),
> replace it with a comment about migration retrying on a potentially
> tagged page. It will have to override the tags each time (as it
> currently does but also warns).

Works for me. Maybe we could warn if the tag would change, because I 
think after we unmapped the folio during migration, the tag can no 
longer change.

-- 
Cheers

David / dhildenb


