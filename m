Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBB66CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 09:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LATvy2V6SYrxON5S0ZwKxz6/ssurKvZ0zpsAbTZsXD4=; b=ayrMlkyRm1r4fyraPaltSGQlqG
	vPSbp83zXhRU6SY9H+nYvoHhH+cBdJYEiIZJxYe+LMqNMZdEtYb4oylhemp5+6aNKC16DSsaf6eg0
	lAafTq95y8PlzOd0jk0uC262lrMENBAlAV4oXPYLJHTwC0M52U0UCJAITb61gunYvs74slfZu6+V6
	4zpK1rSygYu8P8BqQD0xxqFAfJWQritGUH/vTviQ4F74lrooAP6WaonmqkxG+1MReo14trTjTa2gp
	sljxwcnnto0iVlxazuVnxDwd4seCqfaOaN+iAQaTm5rArBxtgYMrV18EOUmEK3joaspmTGEDWudhE
	ky7UHPMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1M33-0000000G9vR-0MAB;
	Wed, 24 Sep 2025 09:44:29 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1M30-0000000G9uK-1O0w
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 09:44:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758707065;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=LATvy2V6SYrxON5S0ZwKxz6/ssurKvZ0zpsAbTZsXD4=;
	b=Ym2fl5DsEBP/zm3pmP3tCV37bPoTuhLZTx3SXhSRx/No2FLicoa8MslT2xHsSYV1flh3UQ
	YXJd4+NCoJt4CSDVyu3Ps1BMSK8bM+9oCcc2wgYkwWzICsFKdOX+dQ4QKprC5eRHoTotYY
	+ok7+B0AeZHI+t66KpmExa3j0ITYx88=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-538-T1r0Uz3bPiK18kiRjqYMZA-1; Wed, 24 Sep 2025 05:44:24 -0400
X-MC-Unique: T1r0Uz3bPiK18kiRjqYMZA-1
X-Mimecast-MFC-AGG-ID: T1r0Uz3bPiK18kiRjqYMZA_1758707063
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4612d068c47so45928975e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 02:44:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758707063; x=1759311863;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LATvy2V6SYrxON5S0ZwKxz6/ssurKvZ0zpsAbTZsXD4=;
        b=Bm9H93Vop1JLbZm+q4DCxFnR5TxQeMLJBHDmvotojeG9iaXKwr5ayQ7XUW+KNDX2mE
         mVsZxRGnfga5QLKGYWI80LzHnQjNFwHho9EMGfAuorQeEGVhdKVEzoMUTdTZoBqQxnai
         ShNYhnwWiwggfILecuClocE+ptcCvBOLyh84gwLQIknRO8/xTGvC8J+98lfsh8aZ+9KF
         TN1bKtTvAllZtvd6mhHJhVXkG2PTyBS50R/SMrcp2Gl8gv0XJO5FteT/jcvue20oat5Z
         TV9CZbpIGXpkuPAFAf7pSIbwXpDyQfSOPd+Q4hPkqk3r34p4eNWTluoOUy9fKglX5BVE
         WHMg==
X-Forwarded-Encrypted: i=1; AJvYcCVmAqDxALmZQYFlMY9LkD93XLZXQFl6GStD1I8OMB0mbQbu2X+NMdThQ1ABErJQPhxdDDGdk/jVPqTW52bCdRZ5@lists.infradead.org
X-Gm-Message-State: AOJu0YyOZX/KYLbbnEsCMaDFMihp1EvdZDFZUJRumBU+sTrL3F6zZL9V
	5yarAhO3dWxrLX6uwwG2N/2aFQkjiRyri1XxmF9xQ1tnK9Vo2BkunIsakt4c18EPcY+VDq8dKk3
	TE9Mt7oH5o9JbN72/BfxNENXMNpME6WRXueEHz/Me/F3hU4fNA//r1YWa3ZEKI+WQbpMHrYu7nx
	0o
X-Gm-Gg: ASbGncvbkF/wkM3LB+TEtciou8TEwFzTdlc+MfBneb8DNNb45cEqAZYNJQdsi6YLEKA
	jjet97dtgPdGyCQak0HVCENDJxEpNSFBZ1EoI49NjyjMilzzZn8Tli61zC5ttiphcsGSAKITfAt
	OB7wSsrhoVoUI/Sw7M0rk07TCVCWVdCwkv967EoBGC/4Q19dIw0gAzbGLQWUxC4ePsoyme+QMM5
	FWwRapbNHJLcIkQeM+Cub7jSjdoqOaCuRIToFWqzwWpcI9/KcunkQ3E8NbsibjKZ9MP+62p6uv0
	EzWc8+sBWofudtrRrVhgse8gsc5cIZhmp+kXzBnMQgUmjRn4ALYlGdp3CQVk9Nlaa1IXjvTAIR+
	S+c1VEcLMLOIxmK0Ck6jFSVTY0ZNp0FljIJUBBrRg1bY+TiZiKEBgIRhiNbVtmRGblQ==
X-Received: by 2002:a05:600c:8b4c:b0:46e:1ae7:dc1a with SMTP id 5b1f17b1804b1-46e1dacdeccmr60077335e9.35.1758707062752;
        Wed, 24 Sep 2025 02:44:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtajsvp/kDNdAlIZ81myaBdoqXgoPzgIMj71ym20C24BB7lOR6FEuJDw/hq3ekdj+UMiHTYg==
X-Received: by 2002:a05:600c:8b4c:b0:46e:1ae7:dc1a with SMTP id 5b1f17b1804b1-46e1dacdeccmr60076735e9.35.1758707062201;
        Wed, 24 Sep 2025 02:44:22 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f14:2400:afc:9797:137c:a25b? (p200300d82f1424000afc9797137ca25b.dip0.t-ipconnect.de. [2003:d8:2f14:2400:afc:9797:137c:a25b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e2aad99f8sm25671645e9.17.2025.09.24.02.44.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 02:44:21 -0700 (PDT)
Message-ID: <791e0d59-0eb2-481f-bf8b-ba4b413d5ebd@redhat.com>
Date: Wed, 24 Sep 2025 11:44:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] mm/thp: fix MTE tag mismatch when replacing
 zero-filled subpages
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Lance Yang <lance.yang@linux.dev>, akpm@linux-foundation.org,
 lorenzo.stoakes@oracle.com, usamaarif642@gmail.com, yuzhao@google.com,
 ziy@nvidia.com, baolin.wang@linux.alibaba.com, baohua@kernel.org,
 voidice@gmail.com, Liam.Howlett@oracle.com, cerasuolodomenico@gmail.com,
 hannes@cmpxchg.org, kaleshsingh@google.com, npache@redhat.com,
 riel@surriel.com, roman.gushchin@linux.dev, rppt@kernel.org,
 ryan.roberts@arm.com, dev.jain@arm.com, ryncsn@gmail.com,
 shakeel.butt@linux.dev, surenb@google.com, hughd@google.com,
 willy@infradead.org, matthew.brost@intel.com, joshua.hahnjy@gmail.com,
 rakie.kim@sk.com, byungchul@sk.com, gourry@gourry.net,
 ying.huang@linux.alibaba.com, apopple@nvidia.com, qun-wei.lin@mediatek.com,
 Andrew.Yang@mediatek.com, casper.li@mediatek.com,
 chinwen.chang@mediatek.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-mm@kvack.org, ioworker0@gmail.com, stable@vger.kernel.org
References: <20250922021458.68123-1-lance.yang@linux.dev>
 <aNGGUXLCn_bWlne5@arm.com> <a3412715-6d9d-4809-9588-ba08da450d16@redhat.com>
 <aNKJ5glToE4hMhWA@arm.com> <aNLHexcNI53HQ46A@arm.com>
 <f2fe9c01-2a8d-4de9-abd5-dbb86d15a37b@linux.dev> <aNOwuKmbAaMaEMb7@arm.com>
 <17dabd83-0849-44c9-b4a2-196af60d9676@redhat.com> <aNO7MrQt9oPT8Hic@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <aNO7MrQt9oPT8Hic@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UZavp4G7wmQO4kBYhpvpCOSpa6B0I5ljhOZyypOyRCQ_1758707063
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_024426_446734_7D576560 
X-CRM114-Status: GOOD (  20.04  )
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

On 24.09.25 11:34, Catalin Marinas wrote:
> On Wed, Sep 24, 2025 at 11:13:18AM +0200, David Hildenbrand wrote:
>> On 24.09.25 10:50, Catalin Marinas wrote:
>>> On Wed, Sep 24, 2025 at 10:49:27AM +0800, Lance Yang wrote:
>>>> On 2025/9/24 00:14, Catalin Marinas wrote:
>>>>> So alternative patch that also fixes the deferred struct page init (on
>>>>> the assumptions that the zero page is always mapped as pte_special():
>>>>
>>>> I can confirm that this alternative patch also works correctly; my tests
>>>> for MTE all pass ;)
>>>
>>> Thanks Lance for testing. I'll post one of the variants today.
>>>
>>>> This looks like a better fix since it solves the boot hang issue too.
>>>
>>> In principle, yes, until I tracked down why I changed it in the first
>>> place - 68d54ceeec0e ("arm64: mte: Allow PTRACE_PEEKMTETAGS access to
>>> the zero page"). ptrace() can read tags from PROT_MTE mappings and we
>>> want to allow reading zeroes as well if the page points to the zero
>>> page. Not flagging the page as PG_mte_tagged caused issues.
>>>
>>> I can change the logic in the ptrace() code, I just need to figure out
>>> what happens to the huge zero page. Ideally we should treat both in the
>>> same way but, AFAICT, we don't use pmd_mkspecial() on the huge zero
>>> page, so it gets flagged with PG_mte_tagged.
>>
>> I changed that recently :) The huge zero folio will now always have
>> pmd_special() set.
> 
> Oh, which commit was this? It means that we can end up with
> uninitialised tags if we have a PROT_MTE huge zero page since
> set_pmd_at/set_pte_at() skips mte_sync_tags().
> 

This one:

commit d82d09e482199e6bbc204df10b2082f764cbe1f4
Author: David Hildenbrand <david@redhat.com>
Date:   Mon Aug 11 13:26:25 2025 +0200

     mm/huge_memory: mark PMD mappings of the huge zero folio special

     The huge zero folio is refcounted (+mapcounted -- is that a word?)
     differently than "normal" folios, similarly (but different) to the
     ordinary shared zeropage.


It should be in mm-stable, to go upstream in the upcoming merge window. 
It's been lurking in -next for a while now.

As it behaves just like the ordinary shared zeropage now, would we have 
to zero/initialize the tags after allocating it?

-- 
Cheers

David / dhildenb


