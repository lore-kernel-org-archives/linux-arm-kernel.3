Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C759CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 16:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:Date:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+mwdpEtZUkKLd4HieJ0n4xeeNKNrAgrCllkk+QdYNeo=; b=a5GwiXywrdIESlgicnfuAnGgs0
	5SVjdUGtvthkATQ409i7h1L0xr5ie6RRT8PZ4QCk/sDvjGpwQVKBqkRsSOAuunR9iAgTVT/Mr8gOR
	Ymp1kVwl+hCZyLEad/gmrBb7XkvFZGUMwDtqjJ/WVWFcG9OYDjdLx4OUuQaiuKg1ffhndImguLu+O
	3h3HiBYmyBqZH5D27hNKBpf4uGid7jEU8ImJTdAQ/gzzj4WqHXb3aGdAcneCHJaiurGdBrx+G+Vtd
	nRf/p4VbUfkU3VNRYGa5DJaqTbYwWsEQPVJD9VOEiW+BJ5Uvfe3e5AXiZnRY7sFjFMLT5ar67mPGB
	RRcIiuYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH3K0-0000000FyYT-3MjB;
	Thu, 06 Nov 2025 16:58:52 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH3Jy-0000000FyY6-0HEY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 16:58:51 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-29470bc80ceso14513945ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 08:58:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762448329; x=1763053129; darn=lists.infradead.org;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=+mwdpEtZUkKLd4HieJ0n4xeeNKNrAgrCllkk+QdYNeo=;
        b=JXW6hOcczpz1igoXnnZQPSSe7x5pNXVAdutqWMJzrX7dSFZzop9zTq7pRi3ow+F1n0
         vsDTa0oxfF6h3Ya2eGRlecojZYOd7V/gk+9H3fDDC8co5pAJG1r7/1XdHE9cx9DlyauO
         YKLVKVwN6A45Zp3BwaP/EsF/0P5bN0hP9hGjBC/KRAFVF1eDjRyFWPSe15AHdaZKe9G1
         DBz85ZR+NUYV5romWgm6fR0A49+lAQuvPheasZA01AbFtzMBv+5lvWbU05wne9yAqA1T
         D1DZcQoXAXKWbQx379qSa52OBK+E38EubNOjncvJ29Gu0dKalUM+7Ciphoij0dUYXVCt
         v1nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762448329; x=1763053129;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+mwdpEtZUkKLd4HieJ0n4xeeNKNrAgrCllkk+QdYNeo=;
        b=IGQsz6c3lgNLtUHcSSAg5Jb1v/1F0GoO0cRk/3J9mgsyeZ7f1CiqTPlVVNAlYZIC1X
         TW79Euk98uzvTwR5qfXLeEOd7JhW8j8iMLHcpBjLo5AQrETbBggfMoQf5gK4ukaFTtd6
         ukDStEuCHTmNCqUnNcWCEOc5TIpExbAvNCieo7tGxpQr8mQsnHSH3ZBRMAM7IHkKHmAF
         hIFw4r66bxmoZITkzxISl8/+zPpE9qdzK/EYjNfSo6y/6aaJT77KFoAlzRsYgwY3kk9B
         JoO9K7aayp3Jz4b1jOSs3ckapd2dJGkSWg0GThfc555lUjhTy266ow0+z5G4C+iMABHu
         JY+A==
X-Forwarded-Encrypted: i=1; AJvYcCX3A8a1LcdWpB/MB64YwF5iKCj92v61y89eTeaPCImRdrPK7rZsW3S1jInxKKfPJGO9I52+AER6SQfkhALlzodn@lists.infradead.org
X-Gm-Message-State: AOJu0Yx79eY+uNyvCJ9Rsrd/caM4mXzq5/1rxCgArSwFIOE2n2yiCknN
	HbRKbe9GRe5duuw5pAwQCGRP9a7jzMFS/fnBPl/17XiYqw2457S30Vme
X-Gm-Gg: ASbGncs+yPLSlDfFDFpCbwmQpleZmgtbZtTK1wz3Cc7zGXEQF9Q5LWPq2qlFuK3gmaD
	5cG8djSXKLtPb2AkvcRfYkVajEinJSZ7WQb0IhiHMYkSlRJHczdgeaw771ImBbqINFXEe9sjwas
	nb5wAeQbJ0njPATgWLneT/ZRk0I4D61RthYyDl1/tb2KPUBx37gjyB+T0YuerxsTug+QAcE5w0A
	+mbsd41bFkC1U6hxxT0IUvXEELLO4wmmBQ6CsIT2Xwb58L4nZzO3Ovi6mEDh1OJT/mvaRA3o6dq
	14yQPfQckItua00BhPlb+gWoLLekgGU/vyaoWmUVmRhIUmQCrl3FSTnElDZ/PiZBeYdAK6ns4WR
	J3ckmD0VCxzuGt0Y5KcqLaQuwxY/PpjPG1/ayvvnBw8N535qG2LnEa8J7i2BalGreaIp3WA==
X-Google-Smtp-Source: AGHT+IEmGC1fJcE4OAtV0Owu2fNKpRqQY3VzTeskRzxNQPbLVeyWOXOzToL4xIfj+nPDKGb1lmA/VA==
X-Received: by 2002:a17:902:ce07:b0:295:50f5:c0e3 with SMTP id d9443c01a7336-297c00b9141mr3517035ad.14.1762448328641;
        Thu, 06 Nov 2025 08:58:48 -0800 (PST)
Received: from dw-tp ([171.76.85.117])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba8f8c880c5sm3013244a12.6.2025.11.06.08.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 08:58:47 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
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
	xen-devel@lists.xenproject.org, x86@kernel.org
Subject: Re: [PATCH v4 07/12] mm: enable lazy_mmu sections to nest
In-Reply-To: <50d1b63a-88d7-4484-82c0-3bde96e3207d-agordeev@linux.ibm.com>
Date: Thu, 06 Nov 2025 22:02:39 +0530
Message-ID: <87ikfn3yvs.ritesh.list@gmail.com>
References: <20251029100909.3381140-1-kevin.brodsky@arm.com> <20251029100909.3381140-8-kevin.brodsky@arm.com> <87ms5050g0.ritesh.list@gmail.com> <50d1b63a-88d7-4484-82c0-3bde96e3207d-agordeev@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_085850_131214_2E90BE22 
X-CRM114-Status: GOOD (  18.88  )
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

Alexander Gordeev <agordeev@linux.ibm.com> writes:

> On Wed, Nov 05, 2025 at 02:19:03PM +0530, Ritesh Harjani wrote:
>> > + * in_lazy_mmu_mode() can be used to check whether the lazy MMU mode is
>> > + * currently enabled.
>> >   */
>> >  #ifdef CONFIG_ARCH_HAS_LAZY_MMU_MODE
>> >  static inline void lazy_mmu_mode_enable(void)
>> >  {
>> > -	arch_enter_lazy_mmu_mode();
>> > +	struct lazy_mmu_state *state = &current->lazy_mmu_state;
>> > +
>> > +	VM_WARN_ON_ONCE(state->nesting_level == U8_MAX);
>> > +	/* enable() must not be called while paused */
>> > +	VM_WARN_ON(state->nesting_level > 0 && !state->active);
>> > +
>> > +	if (state->nesting_level++ == 0) {
>> > +		state->active = true;
>> > +		arch_enter_lazy_mmu_mode();
>> > +	}
>> >  }
>> 
>> Some architectures disables preemption in their
>> arch_enter_lazy_mmu_mode(). So shouldn't the state->active = true should
>> happen after arch_enter_lazy_mmu_mode() has disabled preemption()? i.e.
>
> Do you have some scenario in mind that could cause an issue?
>
No not really. But that's a deviation from what previous arch hooks were
expecting. Although thinking this through - I don't have any usecase
where this can be a problem. 

But let me re-visit some of the code paths on ppc64 lazy mmu... 

Looking at the arch specific usecase I see we always do get_cpu_var()
for accessing the per-cpu batch array which disables preemption before
accessing the per-cpu structure.. This per-cpu structure is where we
batch pte updates... 

For e.g... 
  
    arch_enter_lazy_mmu_mode()
        hpte_need_flush()
            get_cpu_var()   // this takes care of preempt_disable() 
            adds vpns to per-cpu batch[i]
            put_cpu_var()   // 
    arch_leave_lazy_mmu_mode()

> IOW, what could go wrong if the process is scheduled to another
> CPU before preempt_disable() is called?

So from above - I don't think your sequence to update
   state->active = true 
before calling arch_enter hook should be a problem.
Based on above this looks mostly ok to me.

-ritesh

