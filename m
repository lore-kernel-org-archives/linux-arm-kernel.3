Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86017FB5EB0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 04:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YcyQ10La7z7dBA+gaHeygI/JcZo0DlNoTa72Nf5x2Ho=; b=RqJnkcpnr//99sKRIRVfdjSqcc
	f0RnMopxaCbo5J48+KpyxJpp1FQCS/BFTgt+rySIXKWxiX2+nGlQESj7utWr+GRj7e7wvmDpR7RqW
	9p0aw/DWeGnR3GW3Atvf69I29YLkUUkZyEQ7jkvVuZZNpH1zWqc710be2oC3lXlv8234mSAEkxtEy
	/y4jFI6f9Uyqew8ONrzkUNy70/ndULfYc06zGDmXGGwqkpzDzTNWOz4dOfD0m9loemleSrZJM64zG
	ZNTej/ZD4hE1ROwekUOdVxLaoHM2YH3jYB9F7BigZk/w/bLluiMJoeLNoP/MA4lfyxxDpgakiNt2x
	/PWLLZ0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2LpR-00000005NVH-1nO8;
	Tue, 17 Mar 2026 04:14:49 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2LpO-00000005NUL-3ALG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 04:14:48 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-667365131b0so2949a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 21:14:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773720885; cv=none;
        d=google.com; s=arc-20240605;
        b=gEXmxyM1q6tqCu8a2VITcY75WRayumvbKFPToqh67lXZg357Qf19OvyYvCeVyMpFz7
         vXH8w91SOJu9nzVS78OnARpYMIM9Cln9keRKd1IzKSUVEXLc+ocJGxx5iXQzkUr21jWR
         1tLI6meBygqk16VQWEMyyeLSBqsd08bF+H3Y+ebCO2d2T3gMSNI3SJbnp4/gd3DUNwUb
         s1feLeV5EIRR26bEzwE3XfhYNp4wlcpJxMkMFBPRolVaN9/EjPFV249KMKMCWhGlQiQ4
         ueROgWLmhSgRHS/gRRa9XjR1Jd0qjKPM5jvf480Ntb+PLkWXEHov1uQ4J89il+T6UuRL
         eg4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YcyQ10La7z7dBA+gaHeygI/JcZo0DlNoTa72Nf5x2Ho=;
        fh=/DFgQtRwNz1/CYsyhveotle26CuBb5Seu+tGeIuhfO4=;
        b=Ot1wwwdOSe2pVfxaOebqP9q33K3m0jkhyNgajdMT/yMWc1WlBBEOxZEsCyn979sIqI
         XSMhsumGHrPoTjr7+Ti6H6GmMz7R6NUyba+ubwL4TbWVQVCxTLFXeAQXn9+w8WnO03bG
         0zCrbYF4MC8zMXFww58aZZ9rHMabLrjMNzTnOSS76lRKiQ1ugyHw0Fi0etqbRdut9IoF
         Cyr/snwiMB20Jmt+qu49A+WGageeRg57Kq5pG7JEcYfuGdMPqfy/y5sR3qU42t6yZ0lS
         TYzjYCI1sZ+CNDG5QuPa7S1sGDCAuY/HBqqeXE/drwyIPRG3eg5f9xFSr1s7k4NrUAkL
         pLag==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773720885; x=1774325685; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YcyQ10La7z7dBA+gaHeygI/JcZo0DlNoTa72Nf5x2Ho=;
        b=qdX9fgcIKudTpoitLAxlwM3AA53d+9EMa6vOuCV8XV9CP6nR9ng09r07U9vmkPal22
         /Ze6H8TRDqTlmZaSKcZ8dKMsFHf5u9gkYfqwke8eK3wFGeniJ+/+5YMXJGAKmZ4L4ox5
         tIQ2gnrviP8CraYHCgU4NYOeGM38oNJCCqjuxZThdLHQXG+l1LgVHFd5r2HIbVjxbXne
         DPqLpVK7KvstrCyB90q3Dzj6QTE0r254kwjI7TY3jagf3JLU2tSC2a8E0Q5UkiJ8H/kE
         2lu6im6HCTGK23QsjK4lF4eL9lqvTE6+mIc/s6JjEd/SGh6UyWPC32G14mbXUgfa8QFQ
         xMRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773720885; x=1774325685;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YcyQ10La7z7dBA+gaHeygI/JcZo0DlNoTa72Nf5x2Ho=;
        b=tYS2K3kyg5AWsOfVoZ/aANV/+xUmG2foxw6JAHUGndhHqL+rjSW00o/OgvRFINU3bR
         j7F7UhlP09sm1IgTbdZXyC2drw0wY45hZeNLpM0mh6QKwA7Z2LFeAvC3YEVUR7bAkybV
         68ly2OVto0aIoPdSa0820knXSyfBo4Y8fjjtzK8pUT5cTA7DHpu149nxyDGnArNMMCvH
         aPwVHPNXK81lK1OPYy2TS9jXPFdA4cMtgPV4RZSSn1JWj2s1p1pp2ar9vJmnXvh+U/V0
         BrlA1f97PDbVLvbyRC/Njijl35Kkyku2GA+HknpxADAvk3VI7hRh8W6mPE9XNk5tXLkt
         Serg==
X-Forwarded-Encrypted: i=1; AJvYcCV52dMd+WFybhVbwC/2kDO5wMSoMr/h1doaQMAY+BS1obYIFasBZead9/iI3aA6yLhfhVtdG6fbA1VGAajg7S7u@lists.infradead.org
X-Gm-Message-State: AOJu0YzjWGpbUCMpiE11+U7sOylmB/XjK8tfjnuqn8DmhaYJvOXSKg6P
	7/j4fK95ovyou2lS93ti6UAGMdY6JrAYzsxa8mcRf7eUW9LuGMa9iY24ZbQn1K/upNmH6uxtHui
	Q++tBmi8N6UUnQcOgacZ6KXAYs+mcbQkNsF7EYnGv
X-Gm-Gg: ATEYQzzoMSzWtzgTbt2SN0npUbB02WEvR0dQG072yWGvqj32fNHPrDeeOljFZdeR1Jo
	jsdyrH/CtBVDYlNiMFPg5V3/rxaqWcntxkhdOFigrkskco1D8cWZWovD2RzkpRbVxehWTQyaZET
	3GvLHLFafK8lo7tWAOYk3dKtUz0erJl7wP23B4ykum8OrjPqBEdOIEvIMxyWwh6C/du7LShcuTa
	c62i32KE5hWGUYOFZoZSpu+EPlCY4fpQc71krcIhg5gAtT60qnxwai7ce0ql3pGnIguyLQiaZTq
	OWNqXg==
X-Received: by 2002:aa7:db43:0:b0:662:fa40:a4ab with SMTP id
 4fb4d7f45d1cf-6672c04079dmr12810a12.5.1773720884078; Mon, 16 Mar 2026
 21:14:44 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1773695307.git.ljs@kernel.org> <1e58aaf3cdb61cc317d890c12c9a558dfc206913.1773695307.git.ljs@kernel.org>
In-Reply-To: <1e58aaf3cdb61cc317d890c12c9a558dfc206913.1773695307.git.ljs@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 16 Mar 2026 21:14:28 -0700
X-Gm-Features: AaiRm51gRTcyoMqq_XPyOc66DyE9InTC_Zt20apDrYUnF7DiAEmv2zggrx-iJUg
Message-ID: <CAJuCfpGocCSRT0yDxPOLg2NZ+W_ZSTjHGPZRKBd3U90=sQtHCw@mail.gmail.com>
Subject: Re: [PATCH v2 06/16] mm: add mmap_action_simple_ioremap()
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
X-CRM114-CacheID: sfid-20260316_211447_022443_E751912B 
X-CRM114-Status: GOOD (  38.12  )
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

On Mon, Mar 16, 2026 at 2:13=E2=80=AFPM Lorenzo Stoakes (Oracle) <ljs@kerne=
l.org> wrote:
>
> Currently drivers use vm_iomap_memory() as a simple helper function for
> I/O remapping memory over a range starting at a specified physical addres=
s
> over a specified length.
>
> In order to utilise this from mmap_prepare, separate out the core logic
> into __simple_ioremap_prep(), update vm_iomap_memory() to use it, and add
> simple_ioremap_prepare() to do the same with a VMA descriptor object.
>
> We also add MMAP_SIMPLE_IO_REMAP and relevant fields to the struct
> mmap_action type to permit this operation also.
>
> We use mmap_action_ioremap() to set up the actual I/O remap operation onc=
e
> we have checked and figured out the parameters, which makes
> simple_ioremap_prepare() easy to implement.
>
> We then add mmap_action_simple_ioremap() to allow drivers to make use of
> this mode.
>
> We update the mmap_prepare documentation to describe this mode.
>
> Finally, we update the VMA tests to reflect this change.
>
> Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>

A couple of nits, but otherwise LGTM.

Reviewed-by: Suren Baghdasaryan <surenb@google.com>

> ---
>  Documentation/filesystems/mmap_prepare.rst |  3 +
>  include/linux/mm.h                         | 24 +++++-
>  include/linux/mm_types.h                   |  6 +-
>  mm/internal.h                              |  2 +
>  mm/memory.c                                | 87 +++++++++++++++-------
>  mm/util.c                                  | 12 +++
>  tools/testing/vma/include/dup.h            |  6 +-
>  7 files changed, 112 insertions(+), 28 deletions(-)
>
> diff --git a/Documentation/filesystems/mmap_prepare.rst b/Documentation/f=
ilesystems/mmap_prepare.rst
> index 20db474915da..be76ae475b9c 100644
> --- a/Documentation/filesystems/mmap_prepare.rst
> +++ b/Documentation/filesystems/mmap_prepare.rst
> @@ -153,5 +153,8 @@ pointer. These are:
>  * mmap_action_ioremap_full() - Same as mmap_action_ioremap(), only remap=
s
>    the entire mapping from ``start_pfn`` onward.
>
> +* mmap_action_simple_ioremap() - Sets up an I/O remap from a specified
> +  physical address and over a specified length.
> +
>  **NOTE:** The ``action`` field should never normally be manipulated dire=
ctly,
>  rather you ought to use one of these helpers.
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index ad1b8c3c0cfd..df8fa6e6402b 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -4337,11 +4337,33 @@ static inline void mmap_action_ioremap(struct vm_=
area_desc *desc,
>   * @start_pfn: The first PFN in the range to remap.
>   */
>  static inline void mmap_action_ioremap_full(struct vm_area_desc *desc,
> -                                         unsigned long start_pfn)
> +                                           unsigned long start_pfn)
>  {
>         mmap_action_ioremap(desc, desc->start, start_pfn, vma_desc_size(d=
esc));
>  }
>
> +/**
> + * mmap_action_simple_ioremap - helper for mmap_prepare hook to specify =
that the
> + * physical range in [start_phys_addr, start_phys_addr + size) should be=
 I/O
> + * remapped.
> + * @desc: The VMA descriptor for the VMA requiring remap.
> + * @start_phys_addr: Start of the physical memory to be mapped.
> + * @size: Size of the area to map.
> + *
> + * NOTE: Some drivers might want to tweak desc->page_prot for purposes o=
f
> + * write-combine or similar.
> + */
> +static inline void mmap_action_simple_ioremap(struct vm_area_desc *desc,
> +                                             phys_addr_t start_phys_addr=
,
> +                                             unsigned long size)
> +{
> +       struct mmap_action *action =3D &desc->action;
> +
> +       action->simple_ioremap.start_phys_addr =3D start_phys_addr;
> +       action->simple_ioremap.size =3D size;
> +       action->type =3D MMAP_SIMPLE_IO_REMAP;
> +}
> +
>  int mmap_action_prepare(struct vm_area_desc *desc);
>  int mmap_action_complete(struct vm_area_struct *vma,
>                          struct mmap_action *action);
> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> index 4a229cc0a06b..50685cf29792 100644
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -814,6 +814,7 @@ enum mmap_action_type {
>         MMAP_NOTHING,           /* Mapping is complete, no further action=
. */
>         MMAP_REMAP_PFN,         /* Remap PFN range. */
>         MMAP_IO_REMAP_PFN,      /* I/O remap PFN range. */
> +       MMAP_SIMPLE_IO_REMAP,   /* I/O remap with guardrails. */
>  };
>
>  /*
> @@ -822,13 +823,16 @@ enum mmap_action_type {
>   */
>  struct mmap_action {
>         union {
> -               /* Remap range. */
>                 struct {
>                         unsigned long start;
>                         unsigned long start_pfn;
>                         unsigned long size;
>                         pgprot_t pgprot;
>                 } remap;
> +               struct {
> +                       phys_addr_t start_phys_addr;
> +                       unsigned long size;
> +               } simple_ioremap;
>         };
>         enum mmap_action_type type;
>
> diff --git a/mm/internal.h b/mm/internal.h
> index f5774892071e..0eaca2f0eb6a 100644
> --- a/mm/internal.h
> +++ b/mm/internal.h
> @@ -1804,6 +1804,8 @@ int dup_mmap(struct mm_struct *mm, struct mm_struct=
 *oldmm);
>  int remap_pfn_range_prepare(struct vm_area_desc *desc);
>  int remap_pfn_range_complete(struct vm_area_struct *vma,
>                              struct mmap_action *action);
> +int simple_ioremap_prepare(struct vm_area_desc *desc);
> +/* No simple_ioremap_complete, is ultimately handled by remap complete. =
*/
>
>  static inline int io_remap_pfn_range_prepare(struct vm_area_desc *desc)
>  {
> diff --git a/mm/memory.c b/mm/memory.c
> index 9dec67a18116..f3f4046aee97 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -3170,6 +3170,59 @@ int remap_pfn_range_complete(struct vm_area_struct=
 *vma,
>         return do_remap_pfn_range(vma, start, pfn, size, prot);
>  }
>
> +static int __simple_ioremap_prep(unsigned long vm_start, unsigned long v=
m_end,

nit: vm_start and vm_end are used only to calculate vm_len. You could
reduce the number of arguments by just passing vm_len.

> +                                pgoff_t vm_pgoff, phys_addr_t start_phys=
,
> +                                unsigned long size, unsigned long *pfnp)
> +{
> +       const unsigned long vm_len =3D vm_end - vm_start;
> +       unsigned long pfn, pages;
> +
> +       /* Check that the physical memory area passed in looks valid */
> +       if (start_phys + size < start_phys)
> +               return -EINVAL;
> +       /*
> +        * You *really* shouldn't map things that aren't page-aligned,
> +        * but we've historically allowed it because IO memory might
> +        * just have smaller alignment.
> +        */
> +       size +=3D start_phys & ~PAGE_MASK;
> +       pfn =3D start_phys >> PAGE_SHIFT;
> +       pages =3D (size + ~PAGE_MASK) >> PAGE_SHIFT;
> +       if (pfn + pages < pfn)
> +               return -EINVAL;
> +
> +       /* We start the mapping 'vm_pgoff' pages into the area */
> +       if (vm_pgoff > pages)
> +               return -EINVAL;
> +       pfn +=3D vm_pgoff;
> +       pages -=3D vm_pgoff;
> +
> +       /* Can we fit all of the mapping? */
> +       if ((vm_len >> PAGE_SHIFT) > pages)
> +               return -EINVAL;
> +
> +       *pfnp =3D pfn;
> +       return 0;
> +}
> +
> +int simple_ioremap_prepare(struct vm_area_desc *desc)
> +{
> +       struct mmap_action *action =3D &desc->action;
> +       const phys_addr_t start =3D action->simple_ioremap.start_phys_add=
r;
> +       const unsigned long size =3D action->simple_ioremap.size;
> +       unsigned long pfn;
> +       int err;
> +
> +       err =3D __simple_ioremap_prep(desc->start, desc->end, desc->pgoff=
,
> +                                   start, size, &pfn);
> +       if (err)
> +               return err;
> +
> +       /* The I/O remap logic does the heavy lifting. */
> +       mmap_action_ioremap(desc, desc->start, pfn, vma_desc_size(desc));

nit: Looks like a perfect opportunity to use mmap_action_ioremap_full() her=
e.

> +       return mmap_action_prepare(desc);

Ok, so IIUC this uses recursion:
mmap_action_prepare(MMAP_SIMPLE_IO_REMAP) -> simple_ioremap_prepare()
-> mmap_action_prepare(MMAP_IO_REMAP_PFN).

> +}
> +
>  /**
>   * vm_iomap_memory - remap memory to userspace
>   * @vma: user vma to map to
> @@ -3187,32 +3240,16 @@ int remap_pfn_range_complete(struct vm_area_struc=
t *vma,
>   */
>  int vm_iomap_memory(struct vm_area_struct *vma, phys_addr_t start, unsig=
ned long len)
>  {
> -       unsigned long vm_len, pfn, pages;
> -
> -       /* Check that the physical memory area passed in looks valid */
> -       if (start + len < start)
> -               return -EINVAL;
> -       /*
> -        * You *really* shouldn't map things that aren't page-aligned,
> -        * but we've historically allowed it because IO memory might
> -        * just have smaller alignment.
> -        */
> -       len +=3D start & ~PAGE_MASK;
> -       pfn =3D start >> PAGE_SHIFT;
> -       pages =3D (len + ~PAGE_MASK) >> PAGE_SHIFT;
> -       if (pfn + pages < pfn)
> -               return -EINVAL;
> -
> -       /* We start the mapping 'vm_pgoff' pages into the area */
> -       if (vma->vm_pgoff > pages)
> -               return -EINVAL;
> -       pfn +=3D vma->vm_pgoff;
> -       pages -=3D vma->vm_pgoff;
> +       const unsigned long vm_start =3D vma->vm_start;
> +       const unsigned long vm_end =3D vma->vm_end;
> +       const unsigned long vm_len =3D vm_end - vm_start;
> +       unsigned long pfn;
> +       int err;
>
> -       /* Can we fit all of the mapping? */
> -       vm_len =3D vma->vm_end - vma->vm_start;
> -       if (vm_len >> PAGE_SHIFT > pages)
> -               return -EINVAL;
> +       err =3D __simple_ioremap_prep(vm_start, vm_end, vma->vm_pgoff, st=
art,
> +                                   len, &pfn);
> +       if (err)
> +               return err;
>
>         /* Ok, let it rip */
>         return io_remap_pfn_range(vma, vma->vm_start, pfn, vm_len, vma->v=
m_page_prot);
> diff --git a/mm/util.c b/mm/util.c
> index cdfba09e50d7..aa92e471afe1 100644
> --- a/mm/util.c
> +++ b/mm/util.c
> @@ -1390,6 +1390,8 @@ int mmap_action_prepare(struct vm_area_desc *desc)
>                 return remap_pfn_range_prepare(desc);
>         case MMAP_IO_REMAP_PFN:
>                 return io_remap_pfn_range_prepare(desc);
> +       case MMAP_SIMPLE_IO_REMAP:
> +               return simple_ioremap_prepare(desc);
>         }
>
>         WARN_ON_ONCE(1);
> @@ -1421,6 +1423,14 @@ int mmap_action_complete(struct vm_area_struct *vm=
a,
>         case MMAP_IO_REMAP_PFN:
>                 err =3D io_remap_pfn_range_complete(vma, action);
>                 break;
> +       case MMAP_SIMPLE_IO_REMAP:
> +               /*
> +                * The simple I/O remap should have been delegated to an =
I/O
> +                * remap.
> +                */
> +               WARN_ON_ONCE(1);
> +               err =3D -EINVAL;
> +               break;
>         }
>
>         return mmap_action_finish(vma, action, err);
> @@ -1434,6 +1444,7 @@ int mmap_action_prepare(struct vm_area_desc *desc)
>                 break;
>         case MMAP_REMAP_PFN:
>         case MMAP_IO_REMAP_PFN:
> +       case MMAP_SIMPLE_IO_REMAP:
>                 WARN_ON_ONCE(1); /* nommu cannot handle these. */
>                 break;
>         }
> @@ -1452,6 +1463,7 @@ int mmap_action_complete(struct vm_area_struct *vma=
,
>                 break;
>         case MMAP_REMAP_PFN:
>         case MMAP_IO_REMAP_PFN:
> +       case MMAP_SIMPLE_IO_REMAP:
>                 WARN_ON_ONCE(1); /* nommu cannot handle this. */
>
>                 err =3D -EINVAL;
> diff --git a/tools/testing/vma/include/dup.h b/tools/testing/vma/include/=
dup.h
> index 4570ec77f153..114daaef4f73 100644
> --- a/tools/testing/vma/include/dup.h
> +++ b/tools/testing/vma/include/dup.h
> @@ -453,6 +453,7 @@ enum mmap_action_type {
>         MMAP_NOTHING,           /* Mapping is complete, no further action=
. */
>         MMAP_REMAP_PFN,         /* Remap PFN range. */
>         MMAP_IO_REMAP_PFN,      /* I/O remap PFN range. */
> +       MMAP_SIMPLE_IO_REMAP,   /* I/O remap with guardrails. */
>  };
>
>  /*
> @@ -461,13 +462,16 @@ enum mmap_action_type {
>   */
>  struct mmap_action {
>         union {
> -               /* Remap range. */
>                 struct {
>                         unsigned long start;
>                         unsigned long start_pfn;
>                         unsigned long size;
>                         pgprot_t pgprot;
>                 } remap;
> +               struct {
> +                       phys_addr_t start;
> +                       unsigned long len;
> +               } simple_ioremap;
>         };
>         enum mmap_action_type type;
>
> --
> 2.53.0
>

