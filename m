Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3A43FF6E85
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 21:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eaVVTt78dt2IOUr/WJrEfVNvHIkRI9uCxJf+IAlfUTo=; b=VjfR/6NKnLRa6y0/qRVGR+JPme
	KGSWXalT5pTw9+8mP5/aQrg/lfQlQJWuCB26iOEWt5CSD2RRlK1dthyEG6BoBxQ9eBzCS+ng/jVhs
	Bshpj1iYOESvIZqAC+cXYV4NUpwBgyWUlE1I5jNzaxbcwmR0tDw9fJaLQErFc8csr6GKJPh6E6Bue
	gb4EJThJvKhbsME+BHUYxd4k5JbRSJE4wLtxhXuFH6QfrLMyUSQcxZ8bNl/kdYOSgGW1S8P1Wbizh
	kXuYEycjcQm8UU8pJicgnSyhgJzraznCIAqOUw1A9Lm2uQQuj7QmObGUJ7VYXqW49CtS/dYqI4xx6
	vAFbA4Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2c1h-00000007G81-36jZ;
	Tue, 17 Mar 2026 21:32:33 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2c1e-00000007G6o-3BEV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 21:32:32 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-5091ed02c54so89031cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 14:32:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773783149; cv=none;
        d=google.com; s=arc-20240605;
        b=H9/csXssWPr67PaSKNf3heb7Y6XkL8+Jv+XEcWtnvKIni7M3vDRkDX38FcYj90r4z3
         QBmr0unSPWL2N1xI5doQ0LtfNpEqCWr2f5Nr8kH8zTlqfoJpMc9+6JrVnf5KeQWZySRP
         MR50aal19kJyq/JIS+tagSo1AbUu16WPH5DxlYPiFa9BmvUcjDGIJ97G0ss/fp05WcyR
         vPZwt8hH4/iI8bQkN8aaM1o/XmorYfGM+Ed5dwWxrnO0Ush+Rd5/naR8giC9sVKwCIGq
         n46zOvZTXNNH4XrZjybCAVpVQ2uEXAt5RxNGFP8kIGLNWaRM2vhVn54phSyvfGeW6+7H
         xbew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eaVVTt78dt2IOUr/WJrEfVNvHIkRI9uCxJf+IAlfUTo=;
        fh=+8kbiT4c8VNgPBqRqmMsaWqp9TZOPHRdLDLmcroT4ns=;
        b=AbfblzZCaHHnt//ywoSfhnBB++J+wWD27j6wWJ0TCngwhTcbvnLUsINh4w93UG0j2F
         Hr4VKLs6B9LA9FM35O9MUFfza6L4k2ZcYYuv6srbBECkY+KC1eFVZyKmS5M72iShidE9
         Blk3n8yVfnc84EBHQhlesnw+kzD2C5JyqzMVIRuUx8+49htyzXswB/nk/wGwDTOrDndP
         pEXtFxBOUDmixBtMoYW21wY02417cSV47J7K8uqRdpp0VAJqLo2Upovl7mui3m3IKKeP
         W2XrvUvlSJiF19zEXFSIIiZeaXvPH4ahoIxoPrfVYxVbs1LHMmfcleAGUHylLrDPjY6E
         bVLQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773783149; x=1774387949; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eaVVTt78dt2IOUr/WJrEfVNvHIkRI9uCxJf+IAlfUTo=;
        b=VS1Sn9jIaAVq/BCkegruZAScAiXvWsUs+h1aM84Xlz4La0UkL8MH1Rnhk54RLD4mYW
         +oxZgI3qfeJGtGqLgwYIsTgCYxQJoohgMGam0X12JGhW/B2JgjYMbFho2uvEdWuCkoo4
         8U/jIHGd7mVD5DfU7y9O7w35B73XK+k/ST7wWEQf8IKFL7gjb1hufwDJZ3/G8XEi6U7K
         qzZiEZBslN947Dtp01XpDQ1wIQZlKOopu6jQKbM6XqdBZP6JRiYbpZ7nz7IdhkiGG9Gj
         H2GKSIlezIh/0tCHMboKlerp/PLEW9LvQnjcn9ZOpxgYVtyoiON2h2Uc6YmeFgBny4dz
         HCdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773783149; x=1774387949;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eaVVTt78dt2IOUr/WJrEfVNvHIkRI9uCxJf+IAlfUTo=;
        b=roYR/9niLYuV1GCJgO65vAcKuCxYiCH4EBdE0R5jxXheiq5/21FbIAadqdxtBDtrb0
         +X4GeRdWEA7zyNCu7nPZ6c+VtiXhYyxnTV5nvzNKvOsjq2DQxAbifm4CpTFswn3n9TBb
         tdyxbBlfE/ZZ3cgRoSA+0jf6C1RhCp8Cp/NjripYDfk6W4JGfvdkyIwSi7LCCMqM2XE3
         ORp29C1abkI/elYBAokcQdr2BNX5VcJ+syohyB9XUgIFw6f5CaT3nDtJZxUZb4qHbBL1
         mWn6sJuaDZ7k6eXUsYhYvrOtu3CZnQLsZvqO+5LLe4/aJpUG1sJAkDxAEWWyF0m+31dx
         zekw==
X-Forwarded-Encrypted: i=1; AJvYcCXR20MLO7qLeVlajagzLc+omaHrPjpNd5vjSEb9Xhv0lOHja371RP0fJARuyT4oBrp52lmzNgjn3A1EwdHyqJkP@lists.infradead.org
X-Gm-Message-State: AOJu0YzmZZE/ih0Raj78DA88DWyLNzjJNm6EjpECIOqBmPE3aPUNx3x4
	HzqvhJcAcMxGRK5eOUWdpBUu+O4TBbKfnxgPDAiP8JbCA05iKcsHzcWUT8O+GvwEu55nIWE7n0z
	6uisCLGh3TLmyNHokJb9lkfE0tw3y0e2bJXduk/bu
X-Gm-Gg: ATEYQzxOb7CH/lHm84mpLQhXB/eR0b5+8hYvmSkFLw4QuOX47XkW1HruGDGmH+NMhU/
	6ygONaAatDAJLvJBzBL6G2xfNKsutg5h/9TPHcP3WBLFoSNfBKX7qa60QMUbapfwEmhcKf3xCjR
	sYjnbI1NfLBdkcvjhsIcVPHDxvEhfbNcJ0dEUrGjco8+v0XlQOTIssSvqdJQw/Q7aZJu1bnGsXe
	8mBihYoRT1RmtZfJ3muvImAD0FzVtkSR9LRnPxqxT+1VXik0Lwt93m6P44N3N45N2LJ81SziPP2
	KT6urJyEllaOdavJcD2GE1+OEhcB1GIIk46gXw==
X-Received: by 2002:a05:622a:1a9b:b0:501:3b94:bcae with SMTP id
 d75a77b69052e-50b1480564fmr4695911cf.8.1773783147340; Tue, 17 Mar 2026
 14:32:27 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1773695307.git.ljs@kernel.org> <48c6d25e374b57dba6df4fdddd4830d3fc1105be.1773695307.git.ljs@kernel.org>
 <CAJuCfpFXuHg4KPY27pqMC-xV5y9ZY2W72_R8_rxO0DvrJ=_yvw@mail.gmail.com>
In-Reply-To: <CAJuCfpFXuHg4KPY27pqMC-xV5y9ZY2W72_R8_rxO0DvrJ=_yvw@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 17 Mar 2026 14:32:16 -0700
X-Gm-Features: AaiRm50LOaxRG8hnm9GByPrpi5KQ-jnLdYLBR44IEnVyj1qDMmlGA-pMovuTqLE
Message-ID: <CAJuCfpE5qZmi43EeZiRcy78pD6YvJb5n_xnoUJfwEjomowu0=A@mail.gmail.com>
Subject: Re: [PATCH v2 11/16] staging: vme_user: replace deprecated mmap hook
 with mmap_prepare
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
X-CRM114-CacheID: sfid-20260317_143230_824164_F094FEF6 
X-CRM114-Status: GOOD (  37.17  )
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

On Tue, Mar 17, 2026 at 2:26=E2=80=AFPM Suren Baghdasaryan <surenb@google.c=
om> wrote:
>
> On Mon, Mar 16, 2026 at 2:14=E2=80=AFPM Lorenzo Stoakes (Oracle) <ljs@ker=
nel.org> wrote:
> >
> > The f_op->mmap interface is deprecated, so update driver to use its
> > successor, mmap_prepare.
> >
> > The driver previously used vm_iomap_memory(), so this change replaces i=
t
> > with its mmap_prepare equivalent, mmap_action_simple_ioremap().
> >
> > Functions that wrap mmap() are also converted to wrap mmap_prepare()
> > instead.
> >
> > Also update the documentation accordingly.
> >
> > Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
> > ---
> >  Documentation/driver-api/vme.rst    |  2 +-
> >  drivers/staging/vme_user/vme.c      | 20 +++++------
> >  drivers/staging/vme_user/vme.h      |  2 +-
> >  drivers/staging/vme_user/vme_user.c | 51 +++++++++++++++++------------
> >  4 files changed, 42 insertions(+), 33 deletions(-)
> >
> > diff --git a/Documentation/driver-api/vme.rst b/Documentation/driver-ap=
i/vme.rst
> > index c0b475369de0..7111999abc14 100644
> > --- a/Documentation/driver-api/vme.rst
> > +++ b/Documentation/driver-api/vme.rst
> > @@ -107,7 +107,7 @@ The function :c:func:`vme_master_read` can be used =
to read from and
> >
> >  In addition to simple reads and writes, :c:func:`vme_master_rmw` is pr=
ovided to
> >  do a read-modify-write transaction. Parts of a VME window can also be =
mapped
> > -into user space memory using :c:func:`vme_master_mmap`.
> > +into user space memory using :c:func:`vme_master_mmap_prepare`.
> >
> >
> >  Slave windows
> > diff --git a/drivers/staging/vme_user/vme.c b/drivers/staging/vme_user/=
vme.c
> > index f10a00c05f12..7220aba7b919 100644
> > --- a/drivers/staging/vme_user/vme.c
> > +++ b/drivers/staging/vme_user/vme.c
> > @@ -735,9 +735,9 @@ unsigned int vme_master_rmw(struct vme_resource *re=
source, unsigned int mask,
> >  EXPORT_SYMBOL(vme_master_rmw);
> >
> >  /**
> > - * vme_master_mmap - Mmap region of VME master window.
> > + * vme_master_mmap_prepare - Mmap region of VME master window.
> >   * @resource: Pointer to VME master resource.
> > - * @vma: Pointer to definition of user mapping.
> > + * @desc: Pointer to descriptor of user mapping.
> >   *
> >   * Memory map a region of the VME master window into user space.
> >   *
> > @@ -745,12 +745,13 @@ EXPORT_SYMBOL(vme_master_rmw);
> >   *         resource or -EFAULT if map exceeds window size. Other gener=
ic mmap
> >   *         errors may also be returned.
> >   */
> > -int vme_master_mmap(struct vme_resource *resource, struct vm_area_stru=
ct *vma)
> > +int vme_master_mmap_prepare(struct vme_resource *resource,
> > +                           struct vm_area_desc *desc)
> >  {
> > +       const unsigned long vma_size =3D vma_desc_size(desc);
> >         struct vme_bridge *bridge =3D find_bridge(resource);
> >         struct vme_master_resource *image;
> >         phys_addr_t phys_addr;
> > -       unsigned long vma_size;
> >
> >         if (resource->type !=3D VME_MASTER) {
> >                 dev_err(bridge->parent, "Not a master resource\n");
> > @@ -758,19 +759,18 @@ int vme_master_mmap(struct vme_resource *resource=
, struct vm_area_struct *vma)
> >         }
> >
> >         image =3D list_entry(resource->entry, struct vme_master_resourc=
e, list);
> > -       phys_addr =3D image->bus_resource.start + (vma->vm_pgoff << PAG=
E_SHIFT);
> > -       vma_size =3D vma->vm_end - vma->vm_start;
> > +       phys_addr =3D image->bus_resource.start + (desc->pgoff << PAGE_=
SHIFT);
> >
> >         if (phys_addr + vma_size > image->bus_resource.end + 1) {
> >                 dev_err(bridge->parent, "Map size cannot exceed the win=
dow size\n");
> >                 return -EFAULT;
> >         }
> >
> > -       vma->vm_page_prot =3D pgprot_noncached(vma->vm_page_prot);
> > -
> > -       return vm_iomap_memory(vma, phys_addr, vma->vm_end - vma->vm_st=
art);
> > +       desc->page_prot =3D pgprot_noncached(desc->page_prot);
> > +       mmap_action_simple_ioremap(desc, phys_addr, vma_size);
> > +       return 0;
> >  }
> > -EXPORT_SYMBOL(vme_master_mmap);
> > +EXPORT_SYMBOL(vme_master_mmap_prepare);
> >
> >  /**
> >   * vme_master_free - Free VME master window
> > diff --git a/drivers/staging/vme_user/vme.h b/drivers/staging/vme_user/=
vme.h
> > index 797e9940fdd1..b6413605ea49 100644
> > --- a/drivers/staging/vme_user/vme.h
> > +++ b/drivers/staging/vme_user/vme.h
> > @@ -151,7 +151,7 @@ ssize_t vme_master_read(struct vme_resource *resour=
ce, void *buf, size_t count,
> >  ssize_t vme_master_write(struct vme_resource *resource, void *buf, siz=
e_t count, loff_t offset);
> >  unsigned int vme_master_rmw(struct vme_resource *resource, unsigned in=
t mask, unsigned int compare,
> >                             unsigned int swap, loff_t offset);
> > -int vme_master_mmap(struct vme_resource *resource, struct vm_area_stru=
ct *vma);
> > +int vme_master_mmap_prepare(struct vme_resource *resource, struct vm_a=
rea_desc *desc);
> >  void vme_master_free(struct vme_resource *resource);
> >
> >  struct vme_resource *vme_dma_request(struct vme_dev *vdev, u32 route);
> > diff --git a/drivers/staging/vme_user/vme_user.c b/drivers/staging/vme_=
user/vme_user.c
> > index d95dd7d9190a..11e25c2f6b0a 100644
> > --- a/drivers/staging/vme_user/vme_user.c
> > +++ b/drivers/staging/vme_user/vme_user.c
> > @@ -446,24 +446,14 @@ static void vme_user_vm_close(struct vm_area_stru=
ct *vma)
> >         kfree(vma_priv);
> >  }
> >
> > -static const struct vm_operations_struct vme_user_vm_ops =3D {
> > -       .open =3D vme_user_vm_open,
> > -       .close =3D vme_user_vm_close,
> > -};
> > -
> > -static int vme_user_master_mmap(unsigned int minor, struct vm_area_str=
uct *vma)
> > +static int vme_user_vm_mapped(unsigned long start, unsigned long end, =
pgoff_t pgoff,
> > +                             const struct file *file, void **vm_privat=
e_data)
> >  {
> > -       int err;
> > +       const unsigned int minor =3D iminor(file_inode(file));
> >         struct vme_user_vma_priv *vma_priv;
> >
> >         mutex_lock(&image[minor].mutex);
> >
> > -       err =3D vme_master_mmap(image[minor].resource, vma);
> > -       if (err) {
> > -               mutex_unlock(&image[minor].mutex);
> > -               return err;
> > -       }
> > -
>
> Ok, this changes the set of the operations performed under image[minor].m=
utex.
> Before we had:
>
> mutex_lock(&image[minor].mutex);
> vme_master_mmap();
> <some final adjustments>
> mutex_unlock(&image[minor].mutex);
>
> Now we have:
>
> mutex_lock(&image[minor].mutex);
> vme_master_mmap_prepare()
> mutex_unlock(&image[minor].mutex);
> vm_iomap_memory();
> mutex_lock(&image[minor].mutex);
> vme_user_vm_mapped(); // <some final adjustments>
> mutex_unlock(&image[minor].mutex);
>
> I think as long as image[minor] does not change while we are not
> holding the mutex we should be safe, and looking at the code it seems
> to be the case. But I'm not familiar with this driver and might be
> wrong. Worth double-checking.

A side note: if we had to hold the mutex across all those operations I
think we would need to take the mutex in the vm_ops->mmap_prepare and
add a vm_ops->map_failed hook or something along that line to drop the
mutex in case mmap_action_complete() fails. Not sure if we will have
such cases though...

>
> >         vma_priv =3D kmalloc_obj(*vma_priv);
> >         if (!vma_priv) {
> >                 mutex_unlock(&image[minor].mutex);
> > @@ -472,22 +462,41 @@ static int vme_user_master_mmap(unsigned int mino=
r, struct vm_area_struct *vma)
> >
> >         vma_priv->minor =3D minor;
> >         refcount_set(&vma_priv->refcnt, 1);
> > -       vma->vm_ops =3D &vme_user_vm_ops;
> > -       vma->vm_private_data =3D vma_priv;
> > -
> > +       *vm_private_data =3D vma_priv;
> >         image[minor].mmap_count++;
> >
> >         mutex_unlock(&image[minor].mutex);
> > -
> >         return 0;
> >  }
> >
> > -static int vme_user_mmap(struct file *file, struct vm_area_struct *vma=
)
> > +static const struct vm_operations_struct vme_user_vm_ops =3D {
> > +       .mapped =3D vme_user_vm_mapped,
> > +       .open =3D vme_user_vm_open,
> > +       .close =3D vme_user_vm_close,
> > +};
> > +
> > +static int vme_user_master_mmap_prepare(unsigned int minor,
> > +                                       struct vm_area_desc *desc)
> > +{
> > +       int err;
> > +
> > +       mutex_lock(&image[minor].mutex);
> > +
> > +       err =3D vme_master_mmap_prepare(image[minor].resource, desc);
> > +       if (!err)
> > +               desc->vm_ops =3D &vme_user_vm_ops;
> > +
> > +       mutex_unlock(&image[minor].mutex);
> > +       return err;
> > +}
> > +
> > +static int vme_user_mmap_prepare(struct vm_area_desc *desc)
> >  {
> > -       unsigned int minor =3D iminor(file_inode(file));
> > +       const struct file *file =3D desc->file;
> > +       const unsigned int minor =3D iminor(file_inode(file));
> >
> >         if (type[minor] =3D=3D MASTER_MINOR)
> > -               return vme_user_master_mmap(minor, vma);
> > +               return vme_user_master_mmap_prepare(minor, desc);
> >
> >         return -ENODEV;
> >  }
> > @@ -498,7 +507,7 @@ static const struct file_operations vme_user_fops =
=3D {
> >         .llseek =3D vme_user_llseek,
> >         .unlocked_ioctl =3D vme_user_unlocked_ioctl,
> >         .compat_ioctl =3D compat_ptr_ioctl,
> > -       .mmap =3D vme_user_mmap,
> > +       .mmap_prepare =3D vme_user_mmap_prepare,
> >  };
> >
> >  static int vme_user_match(struct vme_dev *vdev)
> > --
> > 2.53.0
> >

