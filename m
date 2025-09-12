Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C2D7CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 14:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gn3WhgefbhqadhZ+e2VS3g6y1n7EinfOM5ykIxfpPls=; b=DSRkkUp8+mQGQS7oRyrnujyil7
	9t7YyVHidRu8awhpPvX2ARxHdVEAEutCrvYzp8yAw1+FcBcS5vx/hbfhWpFQ0esraQmNexTAVw6sI
	8H7nXarejjr1YtkV/oRZBFofZdORd/T9TzM36lOtBVBc3oSpBt9US3+4CdFTo0iLsvgY2fl7cZyeG
	7ORjJCKDYOnBhuykKNMLji/QCxHMmRNvUzpgkquL2SUgoIn8KOqOLJ569hPa2fgcrCqKSWqjoTSQT
	8tt02QrPu5aY0wlX4M/z58V7OIuvcc3rPRuwC71IqOXi9WzxvK9hrcQkieYZGS4I7s3kJYxYA7FG0
	F12JP+Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux4iF-00000009s9A-0a5X;
	Fri, 12 Sep 2025 14:25:19 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux4iC-00000009s7r-2Njo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 14:25:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757687115;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=gn3WhgefbhqadhZ+e2VS3g6y1n7EinfOM5ykIxfpPls=;
	b=ITTGI8IEYS693XakVLg4WSSwvqZfefn4zoC6E5WjV3iT0cFkdZWBeSeclogqG4jEhly3kB
	pdC5wm3yG0MelWA1BRdbKZXpd/ncPvRNwykYF8uUlWAQy9fp7cMYMosnn7iMOTvgOODv7s
	h7dTnNYn4D7i8o7ceO1t/ILVDXBlozg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-492-rFdLJTSgPm2-YeU3f0xTjA-1; Fri, 12 Sep 2025 10:25:14 -0400
X-MC-Unique: rFdLJTSgPm2-YeU3f0xTjA-1
X-Mimecast-MFC-AGG-ID: rFdLJTSgPm2-YeU3f0xTjA_1757687113
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3e7696b36d9so419700f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 07:25:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757687113; x=1758291913;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gn3WhgefbhqadhZ+e2VS3g6y1n7EinfOM5ykIxfpPls=;
        b=Jh08a/1Z0SdlF37aRzqnJr+axCFvc67ZnQqYo2IUPQKUBCOkKuIOuXJzmnzA42QRR4
         Cq0CibCcCK9g2owabi983LkOnUafVcTH02BiD9FULZYKbgRPFCjTcM/MERhy/rnqT2bm
         NaQMpwgpPK7WzvGbykabDtgIkeqGfIfouWIGUn6o7hPmjWZVoR1rvkOlG+jZ4dsJyviJ
         1kT3bLdBvjkHhGMMcBZzrIh2yjwquxFSvxEO6/RE6Q5lHXaISoNTzukp02Puj9b1tBIk
         VKFaPC353/PQOafCgxsypLYKL2QCNLTxtLt31CLuF0Jz5W9yaPOqVw2hU4VzO7vxXiwy
         hOzg==
X-Forwarded-Encrypted: i=1; AJvYcCWWgL8IbFgWj64DrxdXqKAcNmaB9GKbpULY2gOQguQ7l8/PORTuwg4dJX4NgHSiV9QCCXcRqU6deOUB3FA/QaVc@lists.infradead.org
X-Gm-Message-State: AOJu0Ywz/JrJKN/KVOLvHcj2CEQJCBGPallGeebzoL0JZlMBWaLGUSPs
	+ayMpC7xXsMsqkeiLZw5h9/yv82cqp7fEaX7KZZ64aOIJSzQmgAaaodMRZROnvjeRzary/FnU5K
	z9oNY4Q/U+ERcqXu77A4eFR+rP57coCz1BZ42aHQxHeB747+LrCr5btbc4oRSzYn4kwwAMhXfzj
	h3
X-Gm-Gg: ASbGnctFoLgJzTxNivv2CgUSiz88JLBChCATqTD1dSJUH5nSCIPKlPHrv1Zu4/LtNAv
	jQHt9sVwt63Eg0fBUR+LZJWYGyFHDG03lasejfHqHb1aAFBeqdVFu/eudXYaxJhaz8T15L0zDk9
	4GfMBwXQo6961Vj/IbxlZFsTTFAlbfdIiETao+7VR4iMMyojzBHjpTnQpyLmyeAIIxxYhbxap0X
	Z9Xzb1BJ3HMg+GEKQ8S5nnD2FAccL2jz76zsNiz/QSihD2Fq5qRMWqsI7JPbPrAiwyvuRBbscXT
	UDxxQHUZ3QJXEqSH0j6LCMbPqwQVuPEG8YElL8kt6At4v99uz4zAAHatUSFZ4pcq9QofK/f1zD+
	fU2sm0zq11Ka8dEyMUN1YJ9U71+zGc07arWT/Lo7yK4bbMo3O1uZ4UzS9mORu2N9QM3g=
X-Received: by 2002:a05:6000:186a:b0:3c6:c737:d39f with SMTP id ffacd0b85a97d-3e765792e71mr3311131f8f.3.1757687112682;
        Fri, 12 Sep 2025 07:25:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5Dw0WMhxC0tkHYzo2PeBegNsNsLTmAmmO9jpDPgYtz3v1hBhfjXrJHgGEloPWOm+UgdFZUw==
X-Received: by 2002:a05:6000:186a:b0:3c6:c737:d39f with SMTP id ffacd0b85a97d-3e765792e71mr3311069f8f.3.1757687111967;
        Fri, 12 Sep 2025 07:25:11 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f20:da00:b70a:d502:3b51:1f2d? (p200300d82f20da00b70ad5023b511f2d.dip0.t-ipconnect.de. [2003:d8:2f20:da00:b70a:d502:3b51:1f2d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607e9e6asm6786163f8f.62.2025.09.12.07.25.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 07:25:11 -0700 (PDT)
Message-ID: <852d6f8c-e167-4527-9dc9-98549124f6b1@redhat.com>
Date: Fri, 12 Sep 2025 16:25:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] mm: introduce local state for lazy_mmu sections
To: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>, "H. Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
 Juergen Gross <jgross@suse.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org,
 Mark Rutland <Mark.Rutland@arm.com>
References: <4b4971fd-0445-4d86-8f3a-6ba3d68d15b7@arm.com>
 <4aa28016-5678-4c66-8104-8dcc3fa2f5ce@redhat.com>
 <15d01c8b-5475-442e-9df5-ca37b0d5dc04@arm.com>
 <7953a735-6129-4d22-be65-ce736630d539@redhat.com>
 <781a6450-1c0b-4603-91cf-49f16cd78c28@arm.com>
 <a17ab4e3-627a-4989-a5a5-d430eadabb86@redhat.com>
 <9ed5441f-cc03-472a-adc6-b9d3ad525664-agordeev@linux.ibm.com>
 <74d1f275-23c3-4fd8-b665-503c7fc87df0@redhat.com>
 <248b4623-8755-4323-8a44-be4af30e4856-agordeev@linux.ibm.com>
 <b46d3430-fb84-464b-b053-490c6ea083da@redhat.com>
 <cdd9bc60-96d4-4f19-86c3-dcf598ccbd92-agordeev@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <cdd9bc60-96d4-4f19-86c3-dcf598ccbd92-agordeev@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Y7Mws8x-on9bkyql26RUZayvEKRXGd_gTxASuk8WaAc_1757687113
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_072516_683584_FBAE1B4E 
X-CRM114-Status: GOOD (  23.58  )
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

On 12.09.25 16:05, Alexander Gordeev wrote:
> On Fri, Sep 12, 2025 at 03:02:15PM +0200, David Hildenbrand wrote:
>> How would that work with nesting? I feel like there is a fundamental problem
>> with nesting with what you describe but I might be wrong.
> 
> My picture is - flush on each lazy_mmu_disable(), pause on lazy_mmu_pause()
> and honour only top-level arch_enter_lazy_mmu_mode_pte(mm, start, end, ptep)
> context on all nested levels.
> 
> In theory (and if I got it right, you leave the door open for this possibility)
> every (mm, start, end, ptep) context could be stored for each nesting level
> (as an opaque arch-specific data?).

Yes, I explained that we could do that, for example, by returning a 
"struct arch_lazy_mmu_state" from enable() and feeding it into disable().

I would just wish that we could avoid that ...

As an alternative, you could store it somewhere else as an array (percpu 
variable? task_struct) and support only a limited number of nesting 
levels. The current nesting level could always be retrieved from the 
task_struct, for example.

Maybe s390x really wouldn't need support for more than one nesting level 
right now.

> 
> But I do not really expect it ever, since arch_enter_lazy_mmu_mode_pte()
> is only to be called in PTE walkers that never span more than one page
> table and follow the pattern:

Well, the cover letter here states:

"Unfortunately, a corner case (DEBUG_PAGEALLOC) may still cause nesting 
to occur on arm64. Ryan proposed [2] to address that corner case at the 
generic level but this approach received pushback; [3] then attempted to 
solve the issue on arm64 only, but it was deemed too fragile."

So I guess we should support nesting cleanly, at least on the core-mm side.

I guess we could start with saying "well, s390x doesn't fully support 
nesting yet but doing so just requires changing the way we manage this 
per-nesting-level state internally".

s390 is trying to do something different than the other archs here, so 
that naturally concerns me :)

But if it's really just about forwarding that data and having s390 store 
it somewhere (task_struct, percpu variable, etc), fine with me.

-- 
Cheers

David / dhildenb


