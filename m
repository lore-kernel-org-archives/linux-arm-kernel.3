Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 577EBF3028A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Mar 2026 22:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uCXOqQYTnzGNhQPDiApCXbqWFijYEREGO2671+swbzA=; b=dpURzVdqMm3auezqvI27XSSQys
	vrJun/hCSuC+gJ4ASc1hQ3PErYq9M1Hh04WEN8jIrMNNXfV0SSHGnmJD5EcUvDolku3HfnvvUISkD
	Zippy7PwgVIuJmMwV5dnTqa2HAKkHpJHNlIswYdoXKd+APR+GRpOmDnIqKS63dEpIeaYJ9+cSwIZT
	+Fsvh1gK/9Voc8jg2ySPjNRk+B/oilxCMMTeBXQDMNh4FSPdr8XlxORTaMRTzawq3rPRIYnwaNvAD
	Jg9NnszxoA6onTzwk1G8HudBJpdBksNKBwOz8xQ5L0c99YW+kt8jXPT1DXwu1BIWFEtt1/C7WoDZI
	X5H3kLeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1uOV-00000002ywd-2Ajy;
	Sun, 15 Mar 2026 22:57:11 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1uOS-00000002yvc-1vz7
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Mar 2026 22:57:09 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-50906a98ffeso710811cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Mar 2026 15:57:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773615426; cv=none;
        d=google.com; s=arc-20240605;
        b=druYFUFSfTA49ibM6f5BjbfAJkB0RLhw2sOIohmiPkE9cJ0CMHleOScHjQAlB5pYRX
         vooaSz+ZChlnQXGlPSgCCab1+e+0Zxg+1e7ybmFCB3WY73qYX6RZ04vyrUJ/ZkjbotRW
         e/LAZtFhgum/tgTKqtk342l8HPtzh/Eu89jb3T5SNWzFxqjA2qvMZw4cUJzzvE2sMX+t
         kf08zd9RGNxcphdIzdRLxon6w8+vlkJ5FvyqHo+PaYaYM9V3xElmQQpvKKMWk9j8CqUq
         LuL30R9w+HUyVB/mxZ3SWFJQ5qrmDdHx76lPLmEib18E+N6ewUJDw8p4IaFSvukGx1go
         es/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uCXOqQYTnzGNhQPDiApCXbqWFijYEREGO2671+swbzA=;
        fh=qYI0u5IIusdE+l8fgq8yY5iZd4pWbriGZOmoAZvtXAI=;
        b=KHfmr+vEvRcQjyLhn0Jo1ZdbqYXstsRy0SDSOxOm7Ml+v+Ju0U8APbcZGpVE/o/hfB
         mFtrMoOVSqWaJ2K/ZN4i+8OOejZBimmUHvxlDxcCZP9noGG2vB/8XBTL532awifVYQa8
         jPJ96ZW+NIPPHlY2Lc5Ud8DZcidllpKRnIs/MRIxkV9UlUhKETaPI/xRXm+GjCCdUztV
         d5YjeiBBoIfzZmlbc6e8nsBYAzWGg2UzbKTpx729VjFiBxAWpOg6ZjsnBDuxP0YhrRcw
         wWDSAFKCTLPXHBfqEY6/EExwbJhwsS+4GGW0jrhGhJvfJ+JQEbM/Rr15jjAWi5oNTTM7
         D6Vg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773615426; x=1774220226; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uCXOqQYTnzGNhQPDiApCXbqWFijYEREGO2671+swbzA=;
        b=uDRQNevONV8z1gGDCapW6/cixhKWqF8+md6skKAWUARZTJ7tTC+oHHoLB3SGm8uOkZ
         7uQFQt+07SjQlv0G68reVwhdVYcHW2qirF68QueLRMR9Le6/oYyYfQIuuNAvzn+y9Wxb
         kQHLSqXbKL+NppjyWk+Ki61mwPXZlzz0fmStatDLDG1+AQutXRGJqkmj1n5UnwlYqMQ8
         51uoOvW+UchXM+zu2GVpBQFKr0wbd4jDcZ9DRku99TAnSUAgyuaXhcUrTu4cZjK1LTTx
         i0vWwM4KUp4+3r/Fz5c+EeOX6NE8sYch6P1ldwKGkkzYmwM0xIyASqWNRtI+Hh3h8tKD
         nzWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773615426; x=1774220226;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uCXOqQYTnzGNhQPDiApCXbqWFijYEREGO2671+swbzA=;
        b=IVIm3pypVAZUYADrMGznIyx5qT96s5ONHelk/UlR41QxxQpWmbPSB9HUoV3asZMeU3
         aoFdXaUk764p0FHgyAPIqivpHUgvw4ZcQrCQGvw15A8FaYsi0+T8kRDF+cPSmpLu1YOW
         6zCN4R43/gDxEsZjlcZefjXkRIQte8WPwyWqpLiOQxdsRKTNzEw1RYNkJLtgT69E4oUs
         c6u8bFAHAHDVFRl8VzNfwnirazmI8GwZb1ZZ+Lo4ioB/Jafskdrx6INc5ZwJnOrE40/G
         IXNWHtSdf+68KsuJMp4rxh7OsXnBMOAtwPcDemm+tM2A8ApOw5N90T/84wTCF1LsRmCg
         lONA==
X-Forwarded-Encrypted: i=1; AJvYcCWL072wNyW4nB5m12x7Hiiv8vQzc3OWsvT+JUW+a/MER23aHsykE3BNo50lErtQL38r12Z2b7QloHj/ljVt/Kp3@lists.infradead.org
X-Gm-Message-State: AOJu0YwWr4uo9x+ZVgWhJqfrGmChcXELYJHSj9XWpouqunM9sWurnXpB
	6RuL6mEG3JYlb2mxao8tMhzJ6474iyZ2s98GRaSFhesuDADhUePpomFfkEqhXfi47UekxbB83X8
	LyVQ8npAKnRcOILbMVGW0eLnHcpA4R2BpUk79Ks1j
X-Gm-Gg: ATEYQzxi10JwLewwyBV/ysarcp9WzZtXL/Et3w1TCyYh4D8rqYzjdr+97ie3FYp+Wtg
	RbVZ3U2JN7/dp8Yh6WxgHSyN9EeOTiXXTdtVNrll6MOz4OvqnM4DWMC5Gk3eovzz61dRUxillMb
	Y8WokUh/CCV6xPAdYYEdkB2nrzsKNZIKpE47Eyi8B1L491bpdXtsDqmgFaBMGzEqVeGweQWZxwR
	RKqJ5ObhjlS34pum2X1jb3POVZcDP+edR7gL/MMBmqRRFBDnR6sNgSrAiNME2U7pHp2V5gShFan
	pL15PDD22Tt0SErZ
X-Received: by 2002:a05:622a:1648:b0:509:72a:ae59 with SMTP id
 d75a77b69052e-509694c63a6mr20842221cf.10.1773615425456; Sun, 15 Mar 2026
 15:57:05 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1773346620.git.ljs@kernel.org> <56372fe273f775b26675a04652c1229e14680741.1773346620.git.ljs@kernel.org>
In-Reply-To: <56372fe273f775b26675a04652c1229e14680741.1773346620.git.ljs@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sun, 15 Mar 2026 15:56:54 -0700
X-Gm-Features: AaiRm51Rev4ufazINlivV2AzV3ufvB013bFH7aap69X4pIxh6gJw0EUx7qrVlHk
Message-ID: <CAJuCfpEsCrFEYNkkTfRLGojGOYAAx1=WOojOhpBb_=WZBr6bnQ@mail.gmail.com>
Subject: Re: [PATCH 01/15] mm: various small mmap_prepare cleanups
To: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
	Clemens Ladisch <clemens@ladisch.de>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "K . Y . Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Bodo Stroesser <bostroesser@gmail.com>, 
	"Martin K . Petersen" <martin.petersen@oracle.com>, David Howells <dhowells@redhat.com>, 
	Marc Dionne <marc.dionne@auristor.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, David Hildenbrand <david@kernel.org>, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, Jann Horn <jannh@google.com>, 
	Pedro Falcato <pfalcato@suse.de>, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org, 
	linux-staging@lists.linux.dev, linux-scsi@vger.kernel.org, 
	target-devel@vger.kernel.org, linux-afs@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	Ryan Roberts <ryan.roberts@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_155708_591653_05694E83 
X-CRM114-Status: GOOD (  35.15  )
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

On Thu, Mar 12, 2026 at 1:27=E2=80=AFPM Lorenzo Stoakes (Oracle) <ljs@kerne=
l.org> wrote:
>
> Rather than passing arbitrary fields, pass an mmap_action field directly =
to
> mmap prepare and complete helpers to put all the action-specific logic in
> the function actually doing the work.
>
> Additionally, allow mmap prepare functions to return an error so we can
> error out as soon as possible if there is something logically incorrect i=
n
> the input.
>
> Update remap_pfn_range_prepare() to properly check the input range for th=
e
> CoW case.

By "properly check" do you mean the replacement of desc->start and
desc->end with action->remap.start and action->remap.start +
action->remap.size when calling get_remap_pgoff() from
remap_pfn_range_prepare()?

>
> While we're here, make remap_pfn_range_prepare_vma() a little neater, and
> pass mmap_action directly to call_action_complete().
>
> Then, update compat_vma_mmap() to perform its logic directly, as
> __compat_vma_map() is not used by anything so we don't need to export it.

Not directly related to this patch but while reviewing, I was also
checking vma locking rules in this mmap_prepare() + mmap() sequence
and I noticed that the new VMA flag modification functions like
vma_set_flags_mask() do assert vma_assert_locked(vma). It would be
useful to add these but as a separate change. I will add it to my todo
list.

>
> Also update compat_vma_mmap() to use vfs_mmap_prepare() rather than calli=
ng
> the mmap_prepare op directly.
>
> Finally, update the VMA userland tests to reflect the changes.
>
> Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
> ---
>  include/linux/fs.h                |   2 -
>  include/linux/mm.h                |   8 +--
>  mm/internal.h                     |  28 +++++---
>  mm/memory.c                       |  45 +++++++-----
>  mm/util.c                         | 112 +++++++++++++-----------------
>  mm/vma.c                          |  21 +++---
>  tools/testing/vma/include/dup.h   |   9 ++-
>  tools/testing/vma/include/stubs.h |   9 +--
>  8 files changed, 123 insertions(+), 111 deletions(-)
>
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index 8b3dd145b25e..a2628a12bd2b 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -2058,8 +2058,6 @@ static inline bool can_mmap_file(struct file *file)
>         return true;
>  }
>
> -int __compat_vma_mmap(const struct file_operations *f_op,
> -               struct file *file, struct vm_area_struct *vma);
>  int compat_vma_mmap(struct file *file, struct vm_area_struct *vma);
>
>  static inline int vfs_mmap(struct file *file, struct vm_area_struct *vma=
)
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 4c4fd55fc823..cc5960a84382 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -4116,10 +4116,10 @@ static inline void mmap_action_ioremap_full(struc=
t vm_area_desc *desc,
>         mmap_action_ioremap(desc, desc->start, start_pfn, vma_desc_size(d=
esc));
>  }
>
> -void mmap_action_prepare(struct mmap_action *action,
> -                        struct vm_area_desc *desc);
> -int mmap_action_complete(struct mmap_action *action,
> -                        struct vm_area_struct *vma);
> +int mmap_action_prepare(struct vm_area_desc *desc,
> +                       struct mmap_action *action);
> +int mmap_action_complete(struct vm_area_struct *vma,
> +                        struct mmap_action *action);
>
>  /* Look up the first VMA which exactly match the interval vm_start ... v=
m_end */
>  static inline struct vm_area_struct *find_exact_vma(struct mm_struct *mm=
,
> diff --git a/mm/internal.h b/mm/internal.h
> index 95b583e7e4f7..7bfa85b5e78b 100644
> --- a/mm/internal.h
> +++ b/mm/internal.h
> @@ -1775,26 +1775,32 @@ int walk_page_range_debug(struct mm_struct *mm, u=
nsigned long start,
>  void dup_mm_exe_file(struct mm_struct *mm, struct mm_struct *oldmm);
>  int dup_mmap(struct mm_struct *mm, struct mm_struct *oldmm);
>
> -void remap_pfn_range_prepare(struct vm_area_desc *desc, unsigned long pf=
n);
> -int remap_pfn_range_complete(struct vm_area_struct *vma, unsigned long a=
ddr,
> -               unsigned long pfn, unsigned long size, pgprot_t pgprot);
> +int remap_pfn_range_prepare(struct vm_area_desc *desc,
> +                           struct mmap_action *action);
> +int remap_pfn_range_complete(struct vm_area_struct *vma,
> +                            struct mmap_action *action);
>
> -static inline void io_remap_pfn_range_prepare(struct vm_area_desc *desc,
> -               unsigned long orig_pfn, unsigned long size)
> +static inline int io_remap_pfn_range_prepare(struct vm_area_desc *desc,
> +                                            struct mmap_action *action)
>  {
> +       const unsigned long orig_pfn =3D action->remap.start_pfn;
> +       const unsigned long size =3D action->remap.size;
>         const unsigned long pfn =3D io_remap_pfn_range_pfn(orig_pfn, size=
);
>
> -       return remap_pfn_range_prepare(desc, pfn);
> +       action->remap.start_pfn =3D pfn;
> +       return remap_pfn_range_prepare(desc, action);
>  }
>
>  static inline int io_remap_pfn_range_complete(struct vm_area_struct *vma=
,
> -               unsigned long addr, unsigned long orig_pfn, unsigned long=
 size,
> -               pgprot_t orig_prot)
> +                                             struct mmap_action *action)
>  {
> -       const unsigned long pfn =3D io_remap_pfn_range_pfn(orig_pfn, size=
);
> -       const pgprot_t prot =3D pgprot_decrypted(orig_prot);
> +       const unsigned long size =3D action->remap.size;
> +       const unsigned long orig_pfn =3D action->remap.start_pfn;
> +       const pgprot_t orig_prot =3D vma->vm_page_prot;
>
> -       return remap_pfn_range_complete(vma, addr, pfn, size, prot);
> +       action->remap.pgprot =3D pgprot_decrypted(orig_prot);
> +       action->remap.start_pfn  =3D io_remap_pfn_range_pfn(orig_pfn, siz=
e);
> +       return remap_pfn_range_complete(vma, action);
>  }
>
>  #ifdef CONFIG_MMU_NOTIFIER
> diff --git a/mm/memory.c b/mm/memory.c
> index 6aa0ea4af1fc..364fa8a45360 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -3099,26 +3099,34 @@ static int do_remap_pfn_range(struct vm_area_stru=
ct *vma, unsigned long addr,
>  }
>  #endif
>
> -void remap_pfn_range_prepare(struct vm_area_desc *desc, unsigned long pf=
n)
> +int remap_pfn_range_prepare(struct vm_area_desc *desc,
> +                           struct mmap_action *action)
>  {
> -       /*
> -        * We set addr=3DVMA start, end=3DVMA end here, so this won't fai=
l, but we
> -        * check it again on complete and will fail there if specified ad=
dr is
> -        * invalid.
> -        */
> -       get_remap_pgoff(vma_desc_is_cow_mapping(desc), desc->start, desc-=
>end,
> -                       desc->start, desc->end, pfn, &desc->pgoff);
> +       const unsigned long start =3D action->remap.start;
> +       const unsigned long end =3D start + action->remap.size;
> +       const unsigned long pfn =3D action->remap.start_pfn;
> +       const bool is_cow =3D vma_desc_is_cow_mapping(desc);

I was trying to figure out who sets action->remap.start and
action->remap.size and if they somehow guaranteed to be always equal
to desc->start and (desc->end - desc->start). My understanding is that
action->remap.start and action->remap.size are set by
f_op->mmap_prepare() but I'm not sure if they are always the same as
desc->start and (desc->end - desc->start) and if so, how do we enforce
that.

> +       int err;
> +
> +       err =3D get_remap_pgoff(is_cow, start, end, desc->start, desc->en=
d, pfn,
> +                             &desc->pgoff);
> +       if (err)
> +               return err;
> +
>         vma_desc_set_flags_mask(desc, VMA_REMAP_FLAGS);
> +       return 0;
>  }
>
> -static int remap_pfn_range_prepare_vma(struct vm_area_struct *vma, unsig=
ned long addr,
> -               unsigned long pfn, unsigned long size)
> +static int remap_pfn_range_prepare_vma(struct vm_area_struct *vma,
> +                                      unsigned long addr, unsigned long =
pfn,
> +                                      unsigned long size)
>  {
> -       unsigned long end =3D addr + PAGE_ALIGN(size);
> +       const unsigned long end =3D addr + PAGE_ALIGN(size);
> +       const bool is_cow =3D is_cow_mapping(vma->vm_flags);
>         int err;
>
> -       err =3D get_remap_pgoff(is_cow_mapping(vma->vm_flags), addr, end,
> -                             vma->vm_start, vma->vm_end, pfn, &vma->vm_p=
goff);
> +       err =3D get_remap_pgoff(is_cow, addr, end, vma->vm_start, vma->vm=
_end,
> +                             pfn, &vma->vm_pgoff);
>         if (err)
>                 return err;
>
> @@ -3151,10 +3159,15 @@ int remap_pfn_range(struct vm_area_struct *vma, u=
nsigned long addr,
>  }
>  EXPORT_SYMBOL(remap_pfn_range);
>
> -int remap_pfn_range_complete(struct vm_area_struct *vma, unsigned long a=
ddr,
> -               unsigned long pfn, unsigned long size, pgprot_t prot)
> +int remap_pfn_range_complete(struct vm_area_struct *vma,
> +                            struct mmap_action *action)
>  {
> -       return do_remap_pfn_range(vma, addr, pfn, size, prot);
> +       const unsigned long start =3D action->remap.start;
> +       const unsigned long pfn =3D action->remap.start_pfn;
> +       const unsigned long size =3D action->remap.size;
> +       const pgprot_t prot =3D action->remap.pgprot;
> +
> +       return do_remap_pfn_range(vma, start, pfn, size, prot);
>  }
>
>  /**
> diff --git a/mm/util.c b/mm/util.c
> index ce7ae80047cf..dba1191725b6 100644
> --- a/mm/util.c
> +++ b/mm/util.c
> @@ -1163,43 +1163,6 @@ void flush_dcache_folio(struct folio *folio)
>  EXPORT_SYMBOL(flush_dcache_folio);
>  #endif
>
> -/**
> - * __compat_vma_mmap() - See description for compat_vma_mmap()
> - * for details. This is the same operation, only with a specific file op=
erations
> - * struct which may or may not be the same as vma->vm_file->f_op.
> - * @f_op: The file operations whose .mmap_prepare() hook is specified.
> - * @file: The file which backs or will back the mapping.
> - * @vma: The VMA to apply the .mmap_prepare() hook to.
> - * Returns: 0 on success or error.
> - */
> -int __compat_vma_mmap(const struct file_operations *f_op,
> -               struct file *file, struct vm_area_struct *vma)
> -{
> -       struct vm_area_desc desc =3D {
> -               .mm =3D vma->vm_mm,
> -               .file =3D file,
> -               .start =3D vma->vm_start,
> -               .end =3D vma->vm_end,
> -
> -               .pgoff =3D vma->vm_pgoff,
> -               .vm_file =3D vma->vm_file,
> -               .vma_flags =3D vma->flags,
> -               .page_prot =3D vma->vm_page_prot,
> -
> -               .action.type =3D MMAP_NOTHING, /* Default */
> -       };
> -       int err;
> -
> -       err =3D f_op->mmap_prepare(&desc);
> -       if (err)
> -               return err;
> -
> -       mmap_action_prepare(&desc.action, &desc);
> -       set_vma_from_desc(vma, &desc);
> -       return mmap_action_complete(&desc.action, vma);
> -}
> -EXPORT_SYMBOL(__compat_vma_mmap);
> -
>  /**
>   * compat_vma_mmap() - Apply the file's .mmap_prepare() hook to an
>   * existing VMA and execute any requested actions.
> @@ -1228,7 +1191,31 @@ EXPORT_SYMBOL(__compat_vma_mmap);
>   */
>  int compat_vma_mmap(struct file *file, struct vm_area_struct *vma)
>  {
> -       return __compat_vma_mmap(file->f_op, file, vma);
> +       struct vm_area_desc desc =3D {
> +               .mm =3D vma->vm_mm,
> +               .file =3D file,
> +               .start =3D vma->vm_start,
> +               .end =3D vma->vm_end,
> +
> +               .pgoff =3D vma->vm_pgoff,
> +               .vm_file =3D vma->vm_file,
> +               .vma_flags =3D vma->flags,
> +               .page_prot =3D vma->vm_page_prot,
> +
> +               .action.type =3D MMAP_NOTHING, /* Default */
> +       };
> +       int err;
> +
> +       err =3D vfs_mmap_prepare(file, &desc);
> +       if (err)
> +               return err;
> +
> +       err =3D mmap_action_prepare(&desc, &desc.action);
> +       if (err)
> +               return err;
> +
> +       set_vma_from_desc(vma, &desc);
> +       return mmap_action_complete(vma, &desc.action);
>  }
>  EXPORT_SYMBOL(compat_vma_mmap);
>
> @@ -1320,8 +1307,8 @@ void snapshot_page(struct page_snapshot *ps, const =
struct page *page)
>         }
>  }
>
> -static int mmap_action_finish(struct mmap_action *action,
> -               const struct vm_area_struct *vma, int err)
> +static int mmap_action_finish(struct vm_area_struct *vma,
> +                             struct mmap_action *action, int err)
>  {
>         /*
>          * If an error occurs, unmap the VMA altogether and return an err=
or. We
> @@ -1355,35 +1342,36 @@ static int mmap_action_finish(struct mmap_action =
*action,
>   * action which need to be performed.
>   * @desc: The VMA descriptor to prepare for @action.
>   * @action: The action to perform.
> + *
> + * Returns: 0 on success, otherwise error.
>   */
> -void mmap_action_prepare(struct mmap_action *action,
> -                        struct vm_area_desc *desc)
> +int mmap_action_prepare(struct vm_area_desc *desc,
> +                       struct mmap_action *action)

Any reason you are swapping the arguments?
It also looks like we always call mmap_action_prepare() with action =3D=3D
desc->action, like this: mmap_action_prepare(&desc.action, &desc). Why
don't we eliminate the action parameter altogether and use desc.action
from inside the function?

> +

extra new line.

>  {
>         switch (action->type) {
>         case MMAP_NOTHING:
> -               break;
> +               return 0;
>         case MMAP_REMAP_PFN:
> -               remap_pfn_range_prepare(desc, action->remap.start_pfn);
> -               break;
> +               return remap_pfn_range_prepare(desc, action);
>         case MMAP_IO_REMAP_PFN:
> -               io_remap_pfn_range_prepare(desc, action->remap.start_pfn,
> -                                          action->remap.size);
> -               break;
> +               return io_remap_pfn_range_prepare(desc, action);
>         }
>  }
>  EXPORT_SYMBOL(mmap_action_prepare);
>
>  /**
>   * mmap_action_complete - Execute VMA descriptor action.
> - * @action: The action to perform.
>   * @vma: The VMA to perform the action upon.
> + * @action: The action to perform.
>   *
>   * Similar to mmap_action_prepare().
>   *
>   * Return: 0 on success, or error, at which point the VMA will be unmapp=
ed.
>   */
> -int mmap_action_complete(struct mmap_action *action,
> -                        struct vm_area_struct *vma)
> +int mmap_action_complete(struct vm_area_struct *vma,
> +                        struct mmap_action *action)
> +
>  {
>         int err =3D 0;
>
> @@ -1391,23 +1379,19 @@ int mmap_action_complete(struct mmap_action *acti=
on,
>         case MMAP_NOTHING:
>                 break;
>         case MMAP_REMAP_PFN:
> -               err =3D remap_pfn_range_complete(vma, action->remap.start=
,
> -                               action->remap.start_pfn, action->remap.si=
ze,
> -                               action->remap.pgprot);
> +               err =3D remap_pfn_range_complete(vma, action);
>                 break;
>         case MMAP_IO_REMAP_PFN:
> -               err =3D io_remap_pfn_range_complete(vma, action->remap.st=
art,
> -                               action->remap.start_pfn, action->remap.si=
ze,
> -                               action->remap.pgprot);
> +               err =3D io_remap_pfn_range_complete(vma, action);
>                 break;
>         }
>
> -       return mmap_action_finish(action, vma, err);
> +       return mmap_action_finish(vma, action, err);
>  }
>  EXPORT_SYMBOL(mmap_action_complete);
>  #else
> -void mmap_action_prepare(struct mmap_action *action,
> -                       struct vm_area_desc *desc)
> +int mmap_action_prepare(struct vm_area_desc *desc,
> +                       struct mmap_action *action)
>  {
>         switch (action->type) {
>         case MMAP_NOTHING:
> @@ -1417,11 +1401,13 @@ void mmap_action_prepare(struct mmap_action *acti=
on,
>                 WARN_ON_ONCE(1); /* nommu cannot handle these. */
>                 break;
>         }
> +
> +       return 0;
>  }
>  EXPORT_SYMBOL(mmap_action_prepare);
>
> -int mmap_action_complete(struct mmap_action *action,
> -                       struct vm_area_struct *vma)
> +int mmap_action_complete(struct vm_area_struct *vma,
> +                        struct mmap_action *action)
>  {
>         int err =3D 0;
>
> @@ -1436,7 +1422,7 @@ int mmap_action_complete(struct mmap_action *action=
,
>                 break;
>         }
>
> -       return mmap_action_finish(action, vma, err);
> +       return mmap_action_finish(vma, action, err);
>  }
>  EXPORT_SYMBOL(mmap_action_complete);
>  #endif
> diff --git a/mm/vma.c b/mm/vma.c
> index be64f781a3aa..054cf1d262fb 100644
> --- a/mm/vma.c
> +++ b/mm/vma.c
> @@ -2613,15 +2613,19 @@ static void __mmap_complete(struct mmap_state *ma=
p, struct vm_area_struct *vma)
>         vma_set_page_prot(vma);
>  }
>
> -static void call_action_prepare(struct mmap_state *map,
> -                               struct vm_area_desc *desc)
> +static int call_action_prepare(struct mmap_state *map,
> +                              struct vm_area_desc *desc)
>  {
>         struct mmap_action *action =3D &desc->action;
> +       int err;
>
> -       mmap_action_prepare(action, desc);
> +       err =3D mmap_action_prepare(desc, action);
> +       if (err)
> +               return err;
>
>         if (action->hide_from_rmap_until_complete)
>                 map->hold_file_rmap_lock =3D true;
> +       return 0;
>  }
>
>  /*
> @@ -2645,7 +2649,9 @@ static int call_mmap_prepare(struct mmap_state *map=
,
>         if (err)
>                 return err;
>
> -       call_action_prepare(map, desc);
> +       err =3D call_action_prepare(map, desc);
> +       if (err)
> +               return err;
>
>         /* Update fields permitted to be changed. */
>         map->pgoff =3D desc->pgoff;
> @@ -2700,13 +2706,12 @@ static bool can_set_ksm_flags_early(struct mmap_s=
tate *map)
>  }
>
>  static int call_action_complete(struct mmap_state *map,
> -                               struct vm_area_desc *desc,
> +                               struct mmap_action *action,
>                                 struct vm_area_struct *vma)
>  {
> -       struct mmap_action *action =3D &desc->action;
>         int ret;
>
> -       ret =3D mmap_action_complete(action, vma);
> +       ret =3D mmap_action_complete(vma, action);
>
>         /* If we held the file rmap we need to release it. */
>         if (map->hold_file_rmap_lock) {
> @@ -2768,7 +2773,7 @@ static unsigned long __mmap_region(struct file *fil=
e, unsigned long addr,
>         __mmap_complete(&map, vma);
>
>         if (have_mmap_prepare && allocated_new) {
> -               error =3D call_action_complete(&map, &desc, vma);
> +               error =3D call_action_complete(&map, &desc.action, vma);
>
>                 if (error)
>                         return error;
> diff --git a/tools/testing/vma/include/dup.h b/tools/testing/vma/include/=
dup.h
> index 5eb313beb43d..908beb263307 100644
> --- a/tools/testing/vma/include/dup.h
> +++ b/tools/testing/vma/include/dup.h
> @@ -1106,7 +1106,7 @@ static inline int __compat_vma_mmap(const struct fi=
le_operations *f_op,
>
>                 .pgoff =3D vma->vm_pgoff,
>                 .vm_file =3D vma->vm_file,
> -               .vm_flags =3D vma->vm_flags,
> +               .vma_flags =3D vma->flags,
>                 .page_prot =3D vma->vm_page_prot,
>
>                 .action.type =3D MMAP_NOTHING, /* Default */
> @@ -1117,9 +1117,12 @@ static inline int __compat_vma_mmap(const struct f=
ile_operations *f_op,
>         if (err)
>                 return err;
>
> -       mmap_action_prepare(&desc.action, &desc);
> +       err =3D mmap_action_prepare(&desc, &desc.action);
> +       if (err)
> +               return err;
> +
>         set_vma_from_desc(vma, &desc);
> -       return mmap_action_complete(&desc.action, vma);
> +       return mmap_action_complete(vma, &desc.action);
>  }
>
>  static inline int compat_vma_mmap(struct file *file,
> diff --git a/tools/testing/vma/include/stubs.h b/tools/testing/vma/includ=
e/stubs.h
> index 947a3a0c2566..76c4b668bc62 100644
> --- a/tools/testing/vma/include/stubs.h
> +++ b/tools/testing/vma/include/stubs.h
> @@ -81,13 +81,14 @@ static inline void free_anon_vma_name(struct vm_area_=
struct *vma)
>  {
>  }
>
> -static inline void mmap_action_prepare(struct mmap_action *action,
> -                                          struct vm_area_desc *desc)
> +static inline int mmap_action_prepare(struct vm_area_desc *desc,
> +                                     struct mmap_action *action)
>  {
> +       return 0;
>  }
>
> -static inline int mmap_action_complete(struct mmap_action *action,
> -                                          struct vm_area_struct *vma)
> +static inline int mmap_action_complete(struct vm_area_struct *vma,
> +                                      struct mmap_action *action)
>  {
>         return 0;
>  }
> --
> 2.53.0
>

