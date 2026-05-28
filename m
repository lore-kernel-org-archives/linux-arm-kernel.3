Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A63D3CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 21:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:Cc:To:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wpHrgIeXXcvDfmuKsXXjHhEfFrUsBGF9Cp2mPrCFg1E=; b=ZI3B9u5oH80PeOi4wVWLT0BLT1
	UW2zTkIm+iWc278nqpH5z3Bn8FIayH0e7xSByfYecx5UopbgZv3PtOZ42fvdlyFVbwbsW7WEp7Yvr
	+8AFudUgpWXA4xUTvxCDno4zHX6Y4+koxikJxbl2o4cne5UDGogPNaLCY//RYwxauWzSEIyDyZM79
	I/5umotU8riSZ7w5n8c4laHky4pCFPOxluiJbNO8IzOcm/XWo4ryqFMX12Cj6AF19+wCtOyT0eM3W
	eeqQHbJer1XSe3AQihm1T7KVxwcB1W9/taQ8JMFcNc/PK5RENQIPTskuYaepg9eKiMqxOtZK/R3gh
	VBGte3Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSiJH-00000006PBc-3yOV;
	Thu, 28 May 2026 21:30:35 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSiJE-00000006PAp-2FdR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 21:30:33 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-7de4a9cb8eeso11831863a34.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 14:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780003831; x=1780608631; darn=lists.infradead.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wpHrgIeXXcvDfmuKsXXjHhEfFrUsBGF9Cp2mPrCFg1E=;
        b=g95+4ZfQnKmDFdfEN2fc/wJe3Mz9EQISThuu0GEKbTB9ZqYNvlZYsFllNUstmqX911
         Dxz3fsbb0uEugwKXCrz69rl4Y/yEud7mv9VJz7g/FNFusk3yJsqgoqc4dA8mXvvzJH2Q
         levp12qSqnuWbn49DKSLt1UEnu1TXBzmDMqazykru9hAYQJVuZe7Y+dCASV/W6grJNKi
         YACfVnKF0i+z8aUyUFReN0vk1a3KPHjTlQfNX7XbvEAPWismwdhcWbz4SQX3Z51CtODZ
         Vmux/qYmqF06HyNG3BpYEUEmXYtIW2ytjZ8ON72kcRCdNexqDawUWnRqvDJNhr87Xt+t
         LW6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780003831; x=1780608631;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wpHrgIeXXcvDfmuKsXXjHhEfFrUsBGF9Cp2mPrCFg1E=;
        b=UUyHbOLdzjMQpNCLo2lC++0uGxlh7f7AIbbsWyazkUpioMETqs8eSEIBk8cu7SI1Lb
         qob7jZsW7i+tBvdQwkqqVpY+e+oU3m68sUvOTYHk73xcyxOp23e+t4ggQX01B12811cI
         nf5d235cVRAyiwe2/i2Zif0jAa7KrBV8q0rLAT5lfnqddklj3kH+VOWz8DuLClPR/rUE
         IDGqCE5DO/Ao35t7bOgzWL3S3RvOudf5kMGx/M+/w2T37HhDgt2FKjmXnepEaCbOCL5G
         93q0JY+o010DeEve2vycLxJ01Y9RrNmNRjvelo1ZIiVTF1oiaZag/rWJNAsqDSSw5aiF
         aWhg==
X-Forwarded-Encrypted: i=1; AFNElJ8D/mkOOkvv+/AlG7RUyjucTtGsk0V1zB0r9E6CzhMXFjQ1Kewhd69XYoEt2g4SiB+51LAFTtUnXW85p2XdN6oG@lists.infradead.org
X-Gm-Message-State: AOJu0Yzhfh9coLqoWSiv0bzjYSru+yD4LHu/G6VcIqwoqEOuD1wlJstA
	/v3zcjR3YzBwlfMsoyN5o6NqSbpvR3NjhJzGXmRiER08KrdOxCU9gmMq
X-Gm-Gg: Acq92OHM0YAChpZljRNQaaBy12sujqeGr+BNoQazHkBcodj/Lib7HmlJ01/9lypoHxS
	RY1kFZvQhBwIIDmyZGFsmQl3FYt2bRzyiGVBOxfFTo8wz6uItbFq09LpCS0MfG1ua0qhE+M85Gk
	YTwcLT6LcXEBstVPZO5/q0vAR4Q6VMS4l2LQclMpYjgCcxcJVteIgsuqPEhcaUeseekpDSnKBWx
	yFm8STQWRmGQJDicjXcN4emwtnSk4KpvW0y73l8iWXX1FQrmhd3/G3djZDkizDLokAO0EJOyM2n
	cpFUw4Ja2COJ0DK5OnCKBbkxJnXnGYfpedwYXzz1u/LbdHqWvQ74N3NqJ10rBIN+ad09d/mCBWQ
	MiDK8GvWK+2JcznjMA+c17yI5mRk0WH6wxEBjpj500J9bJ6i+yiEOqF7vwd4PC07hvs1xQbb4Ou
	rGrn/nQ5ZF5UZrL5+oPOafcXB2JacZ9UOF58Bcpr/rODWDwAb1gmp47c6/joyLLllUqoAKspr51
	B96xRqJg8uTTezTUg9jNFK+d3G0
X-Received: by 2002:a05:6830:81e9:b0:7d7:570b:6800 with SMTP id 46e09a7af769-7e694e30aa5mr218271a34.23.1780003830565;
        Thu, 28 May 2026 14:30:30 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:47::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e695212f9asm129362a34.13.2026.05.28.14.30.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 May 2026 14:30:30 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 28 May 2026 14:30:28 -0700
Message-Id: <DIUMP21RASZI.2VNQV45RIL209@gmail.com>
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>, "Tejun Heo"
 <tj@kernel.org>, "David Vernet" <void@manifault.com>, "Andrea Righi"
 <arighi@nvidia.com>, "Changwoo Min" <changwoo@igalia.com>, "Alexei
 Starovoitov" <ast@kernel.org>, "Andrii Nakryiko" <andrii@kernel.org>,
 "Daniel Borkmann" <daniel@iogearbox.net>, "Martin KaFai Lau"
 <martin.lau@linux.dev>, "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
Cc: "Peter Zijlstra" <peterz@infradead.org>, "Catalin Marinas"
 <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>, "Thomas
 Gleixner" <tglx@kernel.org>, "Ingo Molnar" <mingo@redhat.com>, "Borislav
 Petkov" <bp@alien8.de>, "Dave Hansen" <dave.hansen@linux.intel.com>,
 "Andrew Morton" <akpm@linux-foundation.org>, "Mike Rapoport"
 <rppt@kernel.org>, "Emil Tsalapatis" <emil@etsalapatis.com>,
 <sched-ext@lists.linux.dev>, <bpf@vger.kernel.org>, <x86@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mm@kvack.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/8] bpf: Recover arena kernel faults with scratch page
X-Mailer: aerc
References: <20260522172219.1423324-1-tj@kernel.org>
 <20260522172219.1423324-3-tj@kernel.org>
 <7fd673df-22f3-4d70-a779-ea0b878188b3@kernel.org>
In-Reply-To: <7fd673df-22f3-4d70-a779-ea0b878188b3@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_143032_582950_6342613B 
X-CRM114-Status: GOOD (  20.45  )
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

On Tue May 26, 2026 at 5:45 AM PDT, David Hildenbrand (Arm) wrote:
>
> There is still the chance that apply_range_set_cb() could race with scrat=
ch
> insertion, right?

yes, it can race, but the fix is to remove only:

-       /* sanity check */
-       if (unlikely(!pte_none(ptep_get(pte))))
-               return -EBUSY;

It was sanity check, now it's simply in the way.
It should do set_pte_at() unconditionally.
It's totally fine to set it to proper page instead of scratch or empty.

Tejun,
do you mind sending a patch to remove these 3 lines or should I do it?

Changing topic. re: zap_vma_range() issue.
It's not forgotten, just complicated, since we can't just take
mmap_read_lock under arena->lock, since arena_vm_close()=20
is called with mmap_write_lock held and it takes arena->lock.
Will figure something out.

> Shouldn't we also be using ptep_try_set() there?
>
> The nasty thing is handling whether ptep_try_set() actually works.
>
> Something like the following on top, maybe?
>
>
> diff --git a/kernel/bpf/arena.c b/kernel/bpf/arena.c
> index 49a8f7b1beef5..086bea3f3698e 100644
> --- a/kernel/bpf/arena.c
> +++ b/kernel/bpf/arena.c
> @@ -122,19 +122,27 @@ static int apply_range_set_cb(pte_t *pte, unsigned =
long
> addr, void *data)
>  {
>         struct apply_range_data *d =3D data;
>         struct page *page;
> +       pte_t pteval;
>
>         if (!data)
>                 return 0;
> -       /* sanity check */
> -       if (unlikely(!pte_none(ptep_get(pte))))
> -               return -EBUSY;
>
>         page =3D d->pages[d->i];
>         /* paranoia, similar to vmap_pages_pte_range() */
>         if (WARN_ON_ONCE(!pfn_valid(page_to_pfn(page))))
>                 return -EINVAL;
>
> -       set_pte_at(&init_mm, addr, pte, mk_pte(page, PAGE_KERNEL));
> +       pteval =3D mk_pte(page, PAGE_KERNEL);
> +#ifdef ptep_try_set
> +       if (unlikely(!ptep_try_set(pte, pteval)))
> +               return -EBUSY;
> +#else
> +       if (unlikely(!pte_none(ptep_get(pte))))
> +               return -EBUSY;
> +
> +       set_pte_at(&init_mm, addr, pte, pteval);
> +#endif
>         d->i++;
>         return 0;
>  }


