Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E7A8CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 08:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S1oIF7XavksgqfJwObOatvwzU0WAoielu1phntwFc58=; b=XPh7QHbaYSf2MsNOdXwSQC4O13
	JV/BHWyrtA7Oe220HMdOO5sVUxnmO2Uj7RHHuXOoWzxKprlnQz/83PUCPKVAwhmfWacvzNqpCUZ0J
	mNoLCumDjKwQMmdYi7EfKNiKUzYY1XevIJ13S/yRIOZ/hEBAn0IKMgqZt9HoKb4l2CBD1y1EghSjW
	ihlRL23GIDdwHsf7bC6oG7ULi5d8PfWeFO4wCsAyigwbh9BfeC1Ar8vIBMU+pDg4l7AWg9Pe2S9UE
	QtoKckETknf77t5bogJ0xr7UnbF4Bp/Bw6FVTuPA/IFtSFO/lHUVOhUOIRJp43ep9FyfN7lNk60qc
	Osf9eirA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUKwq-0000000Cc4F-3IUC;
	Tue, 02 Jun 2026 08:58:08 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUKwo-0000000Cc3n-34dn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 08:58:07 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-45ef82204c6so1711231f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 01:58:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780390685; cv=none;
        d=google.com; s=arc-20240605;
        b=DGtpBSrIsmknclMUR9nTYLfFhh0jy9PjyEqIJQ7MoSc566tGwlDXDhy4l1mZM/o/1Z
         7rhwcThh1tdbL2aOFiDWgl/2TEHAp7P72PbV6C5DSgb177vlVf5qQtdUyfOWo4GrcMEX
         fYkyEmM1bz0JRBHTw77JOEBV3lK4O8mxQ+MTHWzbKI//xrZsW29X5KOg/FHFasuQutSe
         tHqrkh3LXlNEiVSyxJbdfLJ8HMplN9OIotgkiQMXrN2V1i4W2sU5Lj7mlLQdGqqs52p5
         r2uQa9Enwbjs6BhGWxmrFWUUPfqVxvTuDG0TnnAz06XWZMWGimEflaOZjrN0OGs0qvaz
         zkgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=S1oIF7XavksgqfJwObOatvwzU0WAoielu1phntwFc58=;
        fh=2LsM+yx/n+n0oA77i/Nx9xB7oGTZMHmcglmLMjnIauw=;
        b=UNxrj0iVVcmsD1kK60bhQbooNlDLiKk4U9k3Gmzu0zO9csX60oq0KNLVV6WE3+V9Jc
         1A4Y39+tEH4GzOLvOm79jOiNryaONS84iCeK2Exi+9qcb942nH7Ss9vA9Pn2isFzory3
         MX03PEgd2YXWj0CvkxRl/a80LeRv+AqHPK9jpyxtlVsmNhVgLGWd1VOh1/hJNMkY2BkL
         ZMZUbKK4mKwwZlUgN9YD4F8oEXHrYJCmK5mEPldPdsrm0al5FE94LKmA6Qmk7LhFSCGU
         3AicGUyQn0HJLrZ3u6ndcxYrxKBPF6pVmMPf4DjKB6TGXMrzBHxJsOccPPh3F7/9qSri
         7jZg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780390685; x=1780995485; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=S1oIF7XavksgqfJwObOatvwzU0WAoielu1phntwFc58=;
        b=q5gVGV3JDppVVUQj9+9UpOTnLSfUIf2EI6MqVuMt6pbSiJxt/CiJosYmwNGeL2yFX+
         nRLaFlrGqJMbys23dsDxtbD93UdBj29ev9ySO+pi5GWwzh+m3Yg4C5FO5zQMzkyVLbeD
         3vR5oNZD2oPWTNXqfF/UwDdAYzPwhJAy/tSa7tEpe/AtuHQo0PGiCLeaeEQwx5O5nQ5p
         G0dKtImh2xo0+cyu8rOuN2LDDIUuBrbG2EDee46lqUHo8tCTAi4hKAMDBUUGtpmTgq/g
         14piTtEtl7bQ9hBvxgp9O7AIjlpWuoFpiBvho0Z9yPnaRyqhLQImegya2UWH6SyJSbRp
         EG4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780390685; x=1780995485;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S1oIF7XavksgqfJwObOatvwzU0WAoielu1phntwFc58=;
        b=RqgVgRpVyi6JeYSdzH8UQ6TSWZLNWPCyJxiswUlno972d12Ukc74sKxTzrSg7b1AUq
         h7qbU6UmQ72EQogKd0p9WsT6XxxGF5tIzLoYZWByK6xdmBzwNMPCLRe6/aK+MpK5Uz1J
         b1sIMX0zyKmQ2+r0FT7u3YKdLocuNAsI86zHhkk3e5bOz+UDsZsnlIQnYVI5irKmBzsB
         jbrhpSpO1LVttZ89gIgXs0R4TCsoFHz6F8Hypyn6VPQcZmelnzQPyQdomxxHu1pZlwyv
         US2foZXm/W9BYj/V8jWLT1bGR6kFVhQmyRhGxfa8GCLdPQzzxBYBRF3q1L95bSAwwfBY
         QW1g==
X-Forwarded-Encrypted: i=1; AFNElJ96nFPyZuqtsS80h/oUiDHyBPQCdnDaxOQBFNUu/xjDzWtOKLqaykfDpO3qG9p4lqDhOGfio/5z41ke7HxV3lUM@lists.infradead.org
X-Gm-Message-State: AOJu0YyjaT+/LzMnoOr3X5YwIMkjrDwPo1iLVCpsQ+WoJ4UnbVB2w6PP
	j7Ii52h3FbKF1Y1Qp/VIS/IZnFoYokFEmzWPNkdlE0ay2ix2397IMTBW976zfoWtnonMXDK97kO
	j55KMdWbFXJUHk7l+Kqx3HnnQoEVJafs=
X-Gm-Gg: Acq92OH4yJPT7kshBqMFXcVd7UUT68FeaV7I2uJL2zYa9nzBmplb1C3jzOtb/Yl6FtK
	FuVx7Njc3+D5dhuDbKkANrxBjN4/H8FkjG8HDRRuZ+5Iq7gSCJ/0qm09Ab90JmVw6xilIsiNQ+a
	DZ1pOJIZrG4BJRN1o9yboleRV5xRnXyCQIJ+CP6l5VAVITYnwQCng3hPLkgA6bk7umrY1BvZGXs
	kJ8ktxF0NOZLCOfP3GNTCpKX+PcYM/arcUYnFkyqDRHZayfzG+4RftET+FlUYgw8a97QldAuq/O
	yxV1shF8mj2O4VSyees=
X-Received: by 2002:a05:6000:4b19:b0:45f:f142:d55a with SMTP id
 ffacd0b85a97d-45ff142d6bamr20280733f8f.14.1780390684617; Tue, 02 Jun 2026
 01:58:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260522053146.83209-1-jiangwenxiaomi@gmail.com>
 <20260522053146.83209-7-jiangwenxiaomi@gmail.com> <3f55655c-b50b-45fa-9314-23e35d04ae7e@arm.com>
In-Reply-To: <3f55655c-b50b-45fa-9314-23e35d04ae7e@arm.com>
From: Wen Jiang <jiangwenxiaomi@gmail.com>
Date: Tue, 2 Jun 2026 16:57:52 +0800
X-Gm-Features: AVHnY4IW685izywGKg4IIg8w_aDLTDby4_6g3UPUknnDrjCf3XAzk_RAN4y6TTI
Message-ID: <CAHKocdH-CgkFTbcowvs0gEgWrzu_9=928yFJH-dQWQxny2au7w@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] mm/vmalloc: align vm_area so vmap() can batch mappings
To: Dev Jain <dev.jain@arm.com>
Cc: linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, 
	catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org, 
	urezki@gmail.com, baohua@kernel.org, Xueyuan.chen21@gmail.com, 
	rppt@kernel.org, david@kernel.org, ryan.roberts@arm.com, 
	anshuman.khandual@arm.com, ajd@linux.ibm.com, linux-kernel@vger.kernel.org, 
	jiangwen6@xiaomi.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_015806_807140_8ED6BE29 
X-CRM114-Status: GOOD (  25.58  )
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

On Wed, 27 May 2026 at 14:25, Dev Jain <dev.jain@arm.com> wrote:
>
>
>
> On 22/05/26 11:01 am, Wen Jiang wrote:
> > From: "Barry Song (Xiaomi)" <baohua@kernel.org>
> >
> > Try to align the vmap virtual address to PMD_SHIFT or a
> > larger PTE mapping size hinted by the architecture, so
> > contiguous pages can be batch-mapped when setting PMD or
> > PTE entries.
> >
> > Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> > Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> > Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
>
>
> Hmm okay I would have preferred to squash this in the previous, but
> the correctness of previous patch does not rely on this, so it's fine.
>
> > ---
> >  mm/vmalloc.c | 33 ++++++++++++++++++++++++++++++++-
> >  1 file changed, 32 insertions(+), 1 deletion(-)
> >
> > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > index 50642246f4d40..040d400928aab 100644
> > --- a/mm/vmalloc.c
> > +++ b/mm/vmalloc.c
> > @@ -3620,6 +3620,37 @@ static int vmap_batched(unsigned long addr, unsigned long end,
> >       return err;
> >  }
> >
>
> This is screaming for a helper :)
>
> > +static struct vm_struct *get_aligned_vm_area(unsigned long size,
> > +             unsigned long flags, const void *caller)
>
>
> Call this vmap_get_aligned_vm_area, then ...
>
>

Will rename  get_aligned_vm_area to vmap_get_aligned_vm_area.

> > +{
> > +     struct vm_struct *vm_area;
> > +     unsigned int shift;
> > +
> > +     /* Try PMD alignment for large sizes */
> > +     if (size >= PMD_SIZE) {
> > +             vm_area = __get_vm_area_node(size, PMD_SIZE, PAGE_SHIFT, flags,
> > +                             VMALLOC_START, VMALLOC_END,
> > +                             NUMA_NO_NODE, GFP_KERNEL, caller);
>
> Add a wrapper over this called __get_vm_area_node_aligned_caller, which can
> call __get_vm_area_node() with all other arguments fixed, except "align".
>

Will add a __get_vm_area_node_aligned_caller. Will send in v4.

Thanks,
Wen
> > +             if (vm_area)
> > +                     return vm_area;
> > +     }
> > +
> > +     /* Try CONT_PTE alignment */
> > +     shift = arch_vmap_pte_supported_shift(size);
> > +     if (shift > PAGE_SHIFT) {
> > +             vm_area = __get_vm_area_node(size, 1UL << shift, PAGE_SHIFT, flags,
> > +                             VMALLOC_START, VMALLOC_END,
> > +                             NUMA_NO_NODE, GFP_KERNEL, caller);
> > +             if (vm_area)
> > +                     return vm_area;
> > +     }
> > +
> > +     /* Fall back to page alignment */
> > +     return __get_vm_area_node(size, PAGE_SIZE, PAGE_SHIFT, flags,
> > +                     VMALLOC_START, VMALLOC_END,
> > +                     NUMA_NO_NODE, GFP_KERNEL, caller);
> > +}
> > +
> >  /**
> >   * vmap - map an array of pages into virtually contiguous space
> >   * @pages: array of page pointers
> > @@ -3658,7 +3689,7 @@ void *vmap(struct page **pages, unsigned int count,
> >               return NULL;
> >
> >       size = (unsigned long)count << PAGE_SHIFT;
> > -     area = get_vm_area_caller(size, flags, __builtin_return_address(0));
> > +     area = get_aligned_vm_area(size, flags, __builtin_return_address(0));
> >       if (!area)
> >               return NULL;
> >
>

