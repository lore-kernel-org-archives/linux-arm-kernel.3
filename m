Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D45ACCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Nov 2025 02:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:Date:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8bKq5Kbap+TGIzkU08hwTVasn8Atv2TAiFfbpOuCLu4=; b=cv3qT6tJc7+HXiRRVirr1kbiMX
	XaSu32pF6Qkk/SowHvhANlKNpu+SVC4/aiktQy+BRyZoqf22UZCiTNl73uKt4TkvKJM5UKIqDbtLo
	bC9FecxkWrOPIGY8eUWjdlQVWwvVzqvpacuV38ssUkJ1sCGXmbQX6wmSmikkEdBSbLzpNu5KGQ0Bo
	RzFBuGMdjR7IBCjPL+9g0k8AZXD0n2x25+9RvyEcnQw784G9YW9MI1mY6R8u+8O+RIsPyg0IWVqP5
	NTshD6/dCW/nQoOcux+ytic3fisSYkLLzrJQ7ITUql9TnYiS/opYLE36fHlCqBh2lJ4OhlgySQc2t
	e6NlVQpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHYlq-0000000297m-1i9B;
	Sat, 08 Nov 2025 02:33:42 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHYln-0000000296x-2lpl
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Nov 2025 02:33:40 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-b98983bae8eso819299a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Nov 2025 18:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762569218; x=1763174018; darn=lists.infradead.org;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=8bKq5Kbap+TGIzkU08hwTVasn8Atv2TAiFfbpOuCLu4=;
        b=U0g0CEiMqw8TkxGp/PwEfjSL8tEBjqiymKlbKCsGNG1cR6xTITszxSJapYskqVHLmp
         pqMofT0VFBv8KQWfns5oQH8AvWCkXLmaLfYq+Ysve3+NMAt/eEwX5wrM80CD7oSDQkUC
         i09dHufcC0FC63sduLmHmJbr8MljN8NfDZAO3uKldVlxWmOIBDwkow6b3r6q7ksvc+rl
         iZKmI506nQK7sQOpXIY18pgF+ATBlFuNL+7T0L1ju4KB9JVW5eYN7q7Nkf45DCr/AwPQ
         GvBe6bG6DvawZXuoXqILual9zEA8AITp9ieUJzcIrqmzVr0mbGaZcdDZgkRmR/Kad7Da
         tSiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762569218; x=1763174018;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8bKq5Kbap+TGIzkU08hwTVasn8Atv2TAiFfbpOuCLu4=;
        b=NB0Nhix4rwrotmFKPs2HWzu9YNSz7dBtA0I3jjt1GiPnhgZO8VEWyT2na4BUTAznrt
         dMXzyRIIDf6GNaIAoDgoOYm5HqLrk92XR1J2fzyqa1M6UgDjZJDRnEV6T4tSztLt+B0V
         ABuUuR9/KzCJRcvO8pJC3mdNXR8yt+j0iJVTomh7YNPVTJMnc99YqEq0tnrfW6fEca/6
         gCrmZ26t5Y641mtxvpkSavMmOLmRFotg3qBi3TpuMVl4X2GRMYzDRJ1hMjjCfA34ZFPP
         96LJQ7G4t76txBcXQyLd8Xhox7HbBJuFE6xkAFqu80VsPZs/eMPHNgTAEORVlBrseSa3
         AVNQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9hGtRQroYgNxmvNW1I7DfjYoU59bXhr2s41WORoDbQKox3SFm3DpD49frOLJLWz+KN9Qc8fNFczt2Cs2l37/K@lists.infradead.org
X-Gm-Message-State: AOJu0YxcAtigyDHCqjEwaLFDEknsYFYXdSNFWqljhBuvC4B8lSFNPJC5
	JStgpCrewaoSX0+27QhWIwNZzae5DSm1nRxbgztRFaGbOSJyAcdig7aY
X-Gm-Gg: ASbGnctRi2nYLZDhDErsXfNqJECwO3naKBtsSiAt9m4h04QnMj+Oz/SVAJy3DTHC8at
	rhRd0c+/TZv+OB6neOE2uogfXO0LXk+YzrcO7TXRV1+ZioOZE6wc+go21AJdsq7BdJy62cn6fPi
	IBaQmYFr0SdJqqfLIXGrRpzsIvw/+DDI3AZrIZqffWTwcwbvlX8Z3NEv81fTHNJWvyO0aTDXDU+
	LcPTM53GQPpbfCFb7pULXJwQJWWS9J5DnLf/+V4BykEKPZbsCJFxQS90QneS6e+h26azqGEenUb
	a3D9I/mb5LEkGgZMiN2SmxZS49ng6TZ3XBGcq/HzxU0Q4a+M5hJBCWOmbDJwj+RHUomaGNG0Yvs
	9PPUpoMjj37rkESylKAqgr8XKXGNi0qkE58MUC5BG1PuWfk35MbllLIFqb1G5T0jTfkeGdtdBWR
	H4Bd8D
X-Google-Smtp-Source: AGHT+IH/Pe7wf3Ci181tpT0LHXQVq+Kf1iV5vunI2sKT5fx4KiiLBfIeJu3hgL/jAYkDOG6ZWRYxGw==
X-Received: by 2002:a05:6a20:12c5:b0:33f:9581:5d2f with SMTP id adf61e73a8af0-3539f99e63emr1740681637.3.1762569218334;
        Fri, 07 Nov 2025 18:33:38 -0800 (PST)
Received: from dw-tp ([171.76.85.117])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba8f8d7eedcsm6587378a12.2.2025.11.07.18.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 18:33:37 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Andreas Larsson <andreas@gaisler.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov <bp@alien8.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Dave Hansen <dave.hansen@linux.intel.com>, David Hildenbrand <david@redhat.com>, 
	"David S. Miller" <davem@davemloft.net>, David Woodhouse <dwmw2@infradead.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>, 
	Juergen Gross <jgross@suse.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>, 
	Nicholas Piggin <npiggin@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Suren Baghdasaryan <surenb@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>, 
	Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org, 
	xen-devel@lists.xenproject.org, x86@kernel.org, 
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: Re: [PATCH v4 01/12] powerpc/64s: Do not re-activate batched TLB flush
In-Reply-To: <b3e4a92f-5b51-4eee-bfb8-c454add0f0d2@arm.com>
Date: Sat, 08 Nov 2025 06:05:17 +0530
Message-ID: <87cy5t4b0a.ritesh.list@gmail.com>
References: <20251029100909.3381140-1-kevin.brodsky@arm.com> <20251029100909.3381140-2-kevin.brodsky@arm.com> <87qzud42n1.ritesh.list@gmail.com> <b3e4a92f-5b51-4eee-bfb8-c454add0f0d2@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_183339_722771_28DD908E 
X-CRM114-Status: GOOD (  18.28  )
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

Kevin Brodsky <kevin.brodsky@arm.com> writes:

> On 05/11/2025 02:46, Ritesh Harjani (IBM) wrote:
>> Kevin Brodsky <kevin.brodsky@arm.com> writes:
>>
>>> From: Alexander Gordeev <agordeev@linux.ibm.com>
>>>
>>> Since commit b9ef323ea168 ("powerpc/64s: Disable preemption in hash
>>> lazy mmu mode") a task can not be preempted while in lazy MMU mode.
>>> Therefore, the batch re-activation code is never called, so remove it.
>>>
>>> Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>
>>> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
>>> ---
>>>  arch/powerpc/include/asm/thread_info.h |  2 --
>>>  arch/powerpc/kernel/process.c          | 25 -------------------------
>>>  2 files changed, 27 deletions(-)
>>>
>> Since the commit referenced in above disables the preemption in
>> arch_enter_lazy_mmu(), so the expectation is that we will never be
>> context switched while in lazy_mmu, hence the code changes in
>> switch_to() around __flush_tlb_pending() should ideally never be called.
>
> Correct, that's the idea.
>
>> With this analysis - the patch looks good to me. I will give this entire
>> patch series a try on Power HW with Hash mmu too (which uses lazy mmu and
>> let you know the results of that)!
>
> That'd be very appreciated, thanks a lot!
>

I did give this patch series a run on Power10 with Hash MMU. I ran the
following stress-ng tests and didn't observe any issues (kernel warnings) so far.

stress-ng --all 0 -t 60s --perf -v --verify \
--tlb-shootdown 0 \
--fault 0 \
--userfaultfd 0 \
--fork 0 \
--exec 0 \
--memfd 0 \
--numa 0 \
--pkey 0 \
--remap 0 \
--vm 0 \
--rmap 0 \
-x swap,pagemove
(Note not all options shown here will work with --verify)

Let me know what else I can run for validation?
Do you know of any specific tests for validation of lazy mmu feature?

>> For this patch please feel free to add:
>> Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
>>
>>
>> CC: Venkat who also runs CI on linux Power HW for upstream testing :)
>
> Ack, will Cc you both in the next version.

Sure. Thanks!

-ritesh

