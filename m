Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAA0AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 09:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wsRw80zDwDZQ4PLwpx8BCnI9GvjRCTrEN4gTDXyyYNA=; b=VLRtJqt1yWqn1hMo/f4CWLOP+c
	CaBfChkhfQ0Uil/FFhASZci4iwJFm61BuPmvzafxRurXUL945Lz0suTWqxXi5HAvPVYQqn1yt8WOZ
	ieI381yWcXWOeDUHrLTL8HUXYCBYVJWLCYTX9rDwMIb/9cQk6EDPemDX0lPpEIkI/PbS1t3Z74yqA
	aRi5FhMoQe65Gx647LCjOukwfm6+kbpjL9HW159wcWf3Mh0kimHmtlTP1L9Im1QjsfdGoZOqP+l4j
	Zk1i+esPNEhOQ2yN3Fxdkni0aEoUEamozibKsHC+6rhj0iRrIfFCrajRx5JvwkS6v0FRMnSVqHUWb
	S2dvBQXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfDhR-000000040tG-206g;
	Thu, 02 Jul 2026 09:27:13 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfDhO-000000040st-3gdt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 09:27:12 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-493c1950518so1831045e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 02:27:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782984429; cv=none;
        d=google.com; s=arc-20260327;
        b=En9L5osOMy4k1llP/ULczX+XWtdKrb6qCi17WJp15/NL4XY7gpg+zIg2hPA7uXbKbZ
         P6iwJeL0VE9+jv/Xmx4nUnGjxV2qyhXKGhd1TpG5bD1KGclBzxZgH3J+Kqc4R/5g58Yb
         F6pTy4mK/NJbpgzpfEcHxbFM9uYuRJzICeujBTn3c5Owv0vKrKTKGBpElNSqhvmqXgFl
         m+G2omGsdxDZwOlNsryUl7CKiAebqtjU8Vn5yQQzIyeR8UdmQD2FpU+P+VGRRgDtcKvG
         sm5corhEscCdWIrz7Y0AT+loKVsMt0T12QgpbMno4dAwDbq4TUzPsWTOgUlWU5VgYXSF
         dJig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wsRw80zDwDZQ4PLwpx8BCnI9GvjRCTrEN4gTDXyyYNA=;
        fh=9Bw5J/toWtBtCCS3ErP7QXs/uThqI5hRZ5NR4o6dyts=;
        b=Ao14f0BAF0DE5pEQWLNdmfsykQf5SMU14QpZn6doIE/veuzlsjePOYoMZhi4SUiNd+
         Z2lOWSBK4sJddrFSSx+BZX1C7KXVvMsUq5DcZ2vTxMfhi/O3TK4+uyJwRaLByQDuOMzL
         JTq4D2dxdzoXUx8xNSCxo3WoG+yZlEH7lL/i8SHhzVxBlYTgnsLzKMZMWw3qcNAewJMa
         UseN+aTxqFSYO8QUthy2ige3tx+cm+L8HSwtyYpXtp9zKVhMDZ4O5pZpPUJeVQ2JbYAi
         SNcxYArxquQzQttM7GxYhwnLwRVhnhTmlMp5J4xIwfJPbFKgUdG963VKhfcGcdl/W2Cl
         NLQw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782984429; x=1783589229; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wsRw80zDwDZQ4PLwpx8BCnI9GvjRCTrEN4gTDXyyYNA=;
        b=dqbSVxrRItC/Lsg1zjnlc1+da0Qvx1CBPVy/gHkX0uFkr6b7SkgWVI3IA9zjjAVY4I
         HV3imkX+hlTWfJc9OMaAXMg/YiJgxuMlOwm/yHkrWqOwz/dClFfyoejejzdFbxsGpCnb
         b7WZxQ7zNXVT45sdPgZZ0+JSxvinhHYcCAUmI4HAsOT2eZjqWcBtb6sNJOFSMZboKAsF
         BaseOkdfgtx0f4E1/ZTMUOIGZs+ijhIdoHVTyBoFtTEhbIdc8zbEn8O9Lx4wLuWY5jmo
         ibtBjwk+jSkll0dbKhnxsOJMT6SPT590spkIobEGN++IfrvilVgdOUWv7FCw0yEfHpIE
         fY8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782984429; x=1783589229;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wsRw80zDwDZQ4PLwpx8BCnI9GvjRCTrEN4gTDXyyYNA=;
        b=JFutJsGeE4FNE/3dJsmzs8QiosrkXbtl6C6X+XaNsBdIZ8NzRQ1/S0HtWPhtb/Fxb0
         eu1CMzvGT0YqRbfpa0susmkgTrShs0Fup/bI+Dba/BmZpelWqJ3VhVPaBhI2lHU9qmjl
         iKGoWidKpxzQ/7+U89PejNMkyrArqe75Z4af2Tv2NH/9VKxSBQx/s4AZ/1Q7ynEjJkjH
         LzTJXaTBFwCuWDLutbfmAmeOINr1KEaLVxFsjV45i9x3V94fc5V/jqfsTnMcFrlR2aBr
         DYKv2SuMUcNZ2qDsMTZRt/LCTBZnXzgFqrrfQR9x4/yOeUgv6TcRoy6oQeAPtdd6doHK
         WpOA==
X-Forwarded-Encrypted: i=1; AHgh+RoqqjxXZuTE/fqlFdsD1Ct7lvUrANY5kjklhUleAncerdbbGawsBW3WkOwAcuu3VBgR6Ih30ch9DF8lmpHT8pXe@lists.infradead.org
X-Gm-Message-State: AOJu0YwH7UqNIJoc4eIQikuExm280+s7Dby9y96rrL/5nVIwPqrEGz4q
	/8cr5+14bzngE+av/hNDWokv9lyIKbOobLVE8Hib9hgySDm2Sv0RnXxFQtKaNu44Qcd3Xnyrq11
	cok/T8+vQ1Zg+CoVh4jw+Evu+lFeroZ12dg==
X-Gm-Gg: AfdE7cljjLt2UYYvALLIGHMihSEzuihPs34EJny2XxpgAACeXEKprDYApNSqYSJ44Vt
	AZv7QA+XcK+NDY7jSTppMFhM8i5ptauun7LxtDqr92Lld9Jd00hh9BDk3xBRm1o9eDIXd6DSPc7
	ZrlGaeRWF4Uk3i5ncaciUVQmfVKToyBeDTNRPpoJpyE6HGDxSZOJFECRq259cybgfcjFa0celDV
	Em3EWNBlABWZdNNF96yLR9HrfKzqdtixO/cN+h2poOHa9945TBv4GYwjPYti9FRPEyGR7uIOA==
X-Received: by 2002:a05:6000:5c7:b0:474:88ef:cdec with SMTP id
 ffacd0b85a97d-477437a9b08mr7395689f8f.6.1782984429009; Thu, 02 Jul 2026
 02:27:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260618084726.1070022-1-jiangwen6@xiaomi.com>
 <20260618084726.1070022-7-jiangwen6@xiaomi.com> <aecf8ea2-43e3-4aad-810a-120b036d8bc2@arm.com>
In-Reply-To: <aecf8ea2-43e3-4aad-810a-120b036d8bc2@arm.com>
From: Wen Jiang <jiangwenxiaomi@gmail.com>
Date: Thu, 2 Jul 2026 17:26:57 +0800
X-Gm-Features: AVVi8CfUfrvsU20BysATCWTVmUJJqcyPW0V-Irz79R4IQfzozFHfLThFzMhnPis
Message-ID: <CAHKocdF6MhPMFp7MEsXRg-6Tu4Toox7UAxxLvwq26Vtc51rzqg@mail.gmail.com>
Subject: Re: [PATCH v4 6/6] mm/vmalloc: align vm_area so vmap() can batch mappings
To: Dev Jain <dev.jain@arm.com>
Cc: linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, 
	catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org, 
	urezki@gmail.com, baohua@kernel.org, Xueyuan.chen21@gmail.com, 
	rppt@kernel.org, david@kernel.org, ryan.roberts@arm.com, 
	anshuman.khandual@arm.com, ajd@linux.ibm.com, linux-kernel@vger.kernel.org, 
	jiangwen6@xiaomi.com, shanghaoqiang@xiaomi.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_022710_945390_EDD996F3 
X-CRM114-Status: GOOD (  28.88  )
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

On Mon, 29 Jun 2026 at 14:47, Dev Jain <dev.jain@arm.com> wrote:
>
>
>
> On 18/06/26 2:17 pm, Wen Jiang wrote:
> > From: "Barry Song (Xiaomi)" <baohua@kernel.org>
> >
> > Try to align the vmap virtual address to PMD_SHIFT or a
> > larger PTE mapping size hinted by the architecture, so
> > contiguous pages can be batch-mapped when setting PMD or
> > PTE entries.
> >
> > Add __get_vm_area_node_aligned_caller() as a wrapper over
> > __get_vm_area_node() to simplify repeated calls with fixed
> > arguments.
> >
> > Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> > Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> > Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> > ---
> >  mm/vmalloc.c | 37 ++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 36 insertions(+), 1 deletion(-)
> >
> > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > index fffb885cb2158..bc9fa93e2bdc6 100644
> > --- a/mm/vmalloc.c
> > +++ b/mm/vmalloc.c
> > @@ -3628,6 +3628,41 @@ static int vmap_batched(unsigned long addr, unsigned long end,
> >       return err;
> >  }
> >
> > +static struct vm_struct *__get_vm_area_node_aligned_caller(unsigned long size,
> > +             unsigned long align, unsigned long flags, const void *caller)
>
> There are 3 similar functions below __get_vm_area_node: they are __get_vm_area_caller,
> get_vm_area and get_vm_area_caller. You can put this one just below them.
>
>
> > +{
> > +     return __get_vm_area_node(size, align, PAGE_SHIFT, flags,
> > +                     VMALLOC_START, VMALLOC_END,
> > +                     NUMA_NO_NODE, GFP_KERNEL, caller);
> > +}
> > +
> > +static struct vm_struct *vmap_get_aligned_vm_area(unsigned long size,
> > +             unsigned long flags, const void *caller)
> > +{
> > +     struct vm_struct *vm_area;
> > +     unsigned int shift;
> > +
> > +     /* Try PMD alignment for large sizes */
>
> This comment feels excessive. Can remove it.
>
>
> > +     if (size >= PMD_SIZE) {
>
> Need an arch_vmap_pmd_supported() check here.
>
>
Will add the check here.

> > +             vm_area = __get_vm_area_node_aligned_caller(size, PMD_SIZE,
> > +                             flags, caller);
> > +             if (vm_area)
> > +                     return vm_area;
> > +     }
> > +
> > +     /* Try CONT_PTE alignment */
>
> Comment feels excessive, and again no need to mention arm64 specific stuff here.
> Just remove it.
>
> > +     shift = arch_vmap_pte_supported_shift(size);
> > +     if (shift > PAGE_SHIFT) {
> > +             vm_area = __get_vm_area_node_aligned_caller(size, 1UL << shift,
> > +                             flags, caller);
> > +             if (vm_area)
> > +                     return vm_area;
> > +     }
> > +
> > +     /* Fall back to page alignment */
>
> This comment can also be dropped, but I am fine either way.
>
>
Will do.

> > +     return __get_vm_area_node_aligned_caller(size, PAGE_SIZE, flags, caller);
> > +}
> > +
> >  /**
> >   * vmap - map an array of pages into virtually contiguous space
> >   * @pages: array of page pointers
> > @@ -3666,7 +3701,7 @@ void *vmap(struct page **pages, unsigned int count,
> >               return NULL;
> >
> >       size = (unsigned long)count << PAGE_SHIFT;
> > -     area = get_vm_area_caller(size, flags, __builtin_return_address(0));
> > +     area = vmap_get_aligned_vm_area(size, flags, __builtin_return_address(0));
>
> So the effect is that now we search for an aligned vm_struct unconditionally. Better
> to mention in the commit message that we do not expect any significant overhead for
> this.
>
Yes, I'll mention this in v5.

Thanks.
>
> >       if (!area)
> >               return NULL;
> >
>

