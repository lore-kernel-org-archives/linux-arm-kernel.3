Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DDD8CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 19:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lu8DXyr9e+174zCCLKyjaz62dq3PQM0ss4FpqXHktAg=; b=aUlMz8LHIsWvGFb0a+ekHRjR/8
	EW6EEEE5L0SHeNjp+BQHv1fYwYM08AXWGaeVDxVo5OgjenjjE81AkNjuN2C2Mp/OsxZZL9e9Mnwrp
	42kICGyB3NRRbOhrSjlF9ip+xB6drg7hnJjXWbVKIg58n/zFcKwir8afyM/yqU6diIgBg3sgDXeD9
	5YIDMA+XQtyaiEHeLI1KIrRpBGy/WYZLL1W07Aly1wathmuEkASn6djSJ2lmTAOpESBXN/iTPVHg5
	+9xkqj0Au+iNz812zxL2ELAU0XvSGWhXQ0Fp0VjPTi4ZycBOUU9ni/9cpxcpkfWy+nkr9n8AyYEuW
	AXrSOUfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC1Mt-00000007Rrw-2JRQ;
	Thu, 23 Oct 2025 19:53:03 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC1Mp-00000007Rkv-10f9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 19:53:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761249178;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=lu8DXyr9e+174zCCLKyjaz62dq3PQM0ss4FpqXHktAg=;
	b=jAKbGxiCK+cvgwHBgB0iTAkYuZZbqjQ5rhZ4s8q9xvBbxiDZOAAjOgnfZN7folnl3jC0YL
	E8tiiY3gc5InHQrw6GpQqV5kt8wuRA4ir/zzMQ4F/LzBek7LApdY/7X6pqXemVw/wLivst
	LthOYgFuoffLumBJUJOuVOunNVCl21A=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-529-5qCsSyvJMFy7iU2CtYlCkA-1; Thu, 23 Oct 2025 15:52:56 -0400
X-MC-Unique: 5qCsSyvJMFy7iU2CtYlCkA-1
X-Mimecast-MFC-AGG-ID: 5qCsSyvJMFy7iU2CtYlCkA_1761249175
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3ecdb10a612so710985f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 12:52:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761249175; x=1761853975;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lu8DXyr9e+174zCCLKyjaz62dq3PQM0ss4FpqXHktAg=;
        b=jfOhuebj4e7M2Sz2M0gagTA1VLvNT2/c5Y8Yww8oZFW6MC8UK0YVISfwsh1xx/PXgo
         xk0soFhWcxMqvkJcMA26U9Y1oi5ktsjdOrCZKfwquhLMVvlo/omzLwf8y6X0E0oXAYjo
         EEGGtE71HaLsigqCP2fQC8G3vUGhLBLn3zBEv0nTTLtWkL0ERkotQgnFvf/yV89dibn+
         HXHfn4obyE2HtKBnXipIJGGyqj49nrLXDTg+IM2TukXTBJfKJvUDvVkXUyjIow8Trz2B
         HpYfX1tkqcfMgSiG59AGkBxi0DGpLKGvdorIL0uh+aMN9np3yV6GQMMMSFnChzI/rhBb
         hKzw==
X-Forwarded-Encrypted: i=1; AJvYcCUKHpckjTZry0jVrePVWuewR6WBBWDzr81wH42iT0HnOd2VNTh8qPv8qopK7xTarfelVxPsBM3k82Wfl6GOM/od@lists.infradead.org
X-Gm-Message-State: AOJu0YwrTNpOHTUp6BCkYgqOO4i8IUrSImyX6Ojkg1UhhTpNw7QQ+SV/
	kKpdgt2NlBuwAU099rlERFP/ngtO7xYqFi2A4euU53t2IrH+OVW73X1SMJ6fzKkZIfmQr5FW/F5
	LARdfkpj5LRHFHh2QKEuXidJxDA6QBT0hdBovKQqPHfjr1VdmxiuBjUttDcpaq4bbcIMc/rtl71
	z6
X-Gm-Gg: ASbGncv1Esq5ix+HVXX7dwrWXbMkmnQ43psY4I4kx3fJmJr7GEjfKH/zc/OHUZs2qDO
	Lf+UHWWTdX17Y8hua1h7F5j1oJlE9xFckpgwY0JDqICvvahitYb9sQd7Wu9gscCcyMzb17b7znd
	lEebwueTB3fPaBLu1zVe3aLI5aTYzQ6f5CQXdEcYE8G4C6cxRvZOLeBcgGyBJCye2Pv4mUgyB7R
	JaTH+judoQ3uKeUPDS2H9EZL7MZ355HqnlQV7jICs6WXC0cVi+BptYnwetH+L4SJQGzObC/GOhI
	RxjQuMQrmWO1/aBwIk83Q9E5oAwXr5B986iI8OsEfEa+bG8Z5w4cMLO5eXtKo7H959Yd3LDplei
	sAKKQ3jYxTasz3lwCbXnCo50muBaIpqM13DqzY16pHYMCDKs0IlACETiyO7L2n8YPwAtn5Tbcw2
	MG5TbEv7ISduGYsC43up61wWcPZJg=
X-Received: by 2002:a05:6000:2911:b0:3eb:df84:62e with SMTP id ffacd0b85a97d-42704d7e9f9mr18404395f8f.3.1761249174887;
        Thu, 23 Oct 2025 12:52:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7U9VemhLNzul4GpnpOHuDDlV+F0CKxszXYKlJ5dnYJh0XFPFjlnxCdm5Nc2+v3zIM+vRJGA==
X-Received: by 2002:a05:6000:2911:b0:3eb:df84:62e with SMTP id ffacd0b85a97d-42704d7e9f9mr18404377f8f.3.1761249174285;
        Thu, 23 Oct 2025 12:52:54 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3? (p200300d82f4e3200c99da38b3f3ad4b3.dip0.t-ipconnect.de. [2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429897ff3f5sm5656361f8f.22.2025.10.23.12.52.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 12:52:51 -0700 (PDT)
Message-ID: <73b274b7-f419-4e2e-8620-d557bac30dc2@redhat.com>
Date: Thu, 23 Oct 2025 21:52:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/13] mm: introduce generic lazy_mmu helpers
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
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
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251015082727.2395128-1-kevin.brodsky@arm.com>
 <20251015082727.2395128-7-kevin.brodsky@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20251015082727.2395128-7-kevin.brodsky@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1lyHS5h6Twz3DerQp9eiY7t5tlMyi0KJUmWmI7XGN4s_1761249175
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_125259_378449_7F04E28E 
X-CRM114-Status: GOOD (  28.40  )
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

On 15.10.25 10:27, Kevin Brodsky wrote:
> The implementation of the lazy MMU mode is currently entirely
> arch-specific; core code directly calls arch helpers:
> arch_{enter,leave}_lazy_mmu_mode().
> 
> We are about to introduce support for nested lazy MMU sections.
> As things stand we'd have to duplicate that logic in every arch
> implementing lazy_mmu - adding to a fair amount of logic
> already duplicated across lazy_mmu implementations.
> 
> This patch therefore introduces a new generic layer that calls the
> existing arch_* helpers. Two pair of calls are introduced:
> 
> * lazy_mmu_mode_enable() ... lazy_mmu_mode_disable()
>      This is the standard case where the mode is enabled for a given
>      block of code by surrounding it with enable() and disable()
>      calls.
> 
> * lazy_mmu_mode_pause() ... lazy_mmu_mode_resume()
>      This is for situations where the mode is temporarily disabled
>      by first calling pause() and then resume() (e.g. to prevent any
>      batching from occurring in a critical section).
> 
> The documentation in <linux/pgtable.h> will be updated in a
> subsequent patch.
> 
> No functional change should be introduced at this stage.
> The implementation of enable()/resume() and disable()/pause() is
> currently identical, but nesting support will change that.
> 
> Most of the call sites have been updated using the following
> Coccinelle script:
> 
> @@
> @@
> {
> ...
> - arch_enter_lazy_mmu_mode();
> + lazy_mmu_mode_enable();
> ...
> - arch_leave_lazy_mmu_mode();
> + lazy_mmu_mode_disable();
> ...
> }
> 
> @@
> @@
> {
> ...
> - arch_leave_lazy_mmu_mode();
> + lazy_mmu_mode_pause();
> ...
> - arch_enter_lazy_mmu_mode();
> + lazy_mmu_mode_resume();
> ...
> }
> 
> A couple of cases are noteworthy:
> 
> * madvise_*_pte_range() call arch_leave() in multiple paths, some
>    followed by an immediate exit/rescheduling and some followed by a
>    conditional exit. These functions assume that they are called
>    with lazy MMU disabled and we cannot simply use pause()/resume()
>    to address that. This patch leaves the situation unchanged by
>    calling enable()/disable() in all cases.

I'm confused, the function simply does

(a) enables lazy mmu
(b) does something on the page table
(c) disables lazy mmu
(d) does something expensive (split folio -> take sleepable locks,
     flushes tlb)
(e) go to (a)

Why would we use enable/disable instead?

> 
> * x86/Xen is currently the only case where explicit handling is
>    required for lazy MMU when context-switching. This is purely an
>    implementation detail and using the generic lazy_mmu_mode_*
>    functions would cause trouble when nesting support is introduced,
>    because the generic functions must be called from the current task.
>    For that reason we still use arch_leave() and arch_enter() there.

How does this interact with patch #11?

> 
> Note: x86 calls arch_flush_lazy_mmu_mode() unconditionally in a few
> places, but only defines it if PARAVIRT_XXL is selected, and we are
> removing the fallback in <linux/pgtable.h>. Add a new fallback
> definition to <asm/pgtable.h> to keep things building.

I can see a call in __kernel_map_pages() and 
arch_kmap_local_post_map()/arch_kmap_local_post_unmap().

I guess that is ... harmless/irrelevant in the context of this series?

[...]


-- 
Cheers

David / dhildenb


