Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF61A109023F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 15:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OfH8Q5Td26D2zz2vaWeEEQdnUyXBLu9cQNzXDyggGWs=; b=ToHvLHzpe3V0boZQfEGA5ctl1y
	H64l9SkS9DILK1eKskHl8d12NJDrGAX2RN4JkVC3tbg1PYJaFvzwdqBw8NZ9+VBR2v+uHzyj6bpW4
	7FyAgb7V/2t2SEvvEEtKg1FJbKW2w9IDGv4hylpfn9/GcLS13Fnj1HDL6eg7FQaX0EIsMyTSnvbFX
	Pkbpd8YhNTchXsIIHFGAO0+CJaUH4IkZlMYMXMO72UU2bkNNmv4ZI02mS1soVrh0GuajR3+lwF+6k
	EYnNnxKXUC83eS2Tnvf2ehc4mT1wVRJENfy49bR/NGL0OtgGguZADmvWrJ+/5jbnoe2NFfjUrRorf
	Qb/hrdbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3FAA-0000000AtlR-32ZI;
	Thu, 19 Mar 2026 15:19:54 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3FA7-0000000Atk6-37Yo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 15:19:53 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-667cde0fc88so10029a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 08:19:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773933590; cv=none;
        d=google.com; s=arc-20240605;
        b=GsuvexoD+X0T17RPqA9sUO7eQHoc4wtsa3pjQZuK7VENctPmH+LrmBeC61VCnX4ku2
         c/NJ1B+1MI9cCz6xrJK9VV2JPIhhhKWW5UZMdQa5gaAMUdgJxXRnZXjQs/+7+NB+qdQO
         CgSJK9TFWf1Tjh6fuz32ePQf2hroih4sS/nF1kMF3R7t8EVdX9Ox1l47ztVDNRpRgPkO
         KgBfuYXOXznvYPzP5oRW2oGtlFe3RvUq00ILeBqBdAnXn2rkFNHdeisswauZQCHCfmcq
         hlRzMoXsb87IuLNC1adMs0Bf7HsXRlFzxm4ASVW9x4qRyJ/qDCNjUA+U8gyJ7pRRu+rR
         PzYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OfH8Q5Td26D2zz2vaWeEEQdnUyXBLu9cQNzXDyggGWs=;
        fh=/ZEik9hw/0XBlg9GODufXGsB+dnIdeKg8DQWN+khktI=;
        b=D0dHgqkoeGYVcPy63AjdQZu8XiVq/G1XgvhHIfSV/T9J69MquRcIBQmE3AVJtt9DC9
         oSQH6vBvolSyt4Lw/wTicDl7CE6v5l8/WXFqDy95hPa8jt8p3vGGt0RWWM19D+Jv8vW5
         KskPfTW1o5zO3RkIVvTnFYqf0mlnOJn2GDVBk/Q0TLxNww3bFI/Gux9DrwbBOzrDUTBR
         EZSuCvX/O/E2sJVjM/pQVITXVvY6Ldux6tr8k6vuQqJjZfcuxkPxju4XWXPn5WwCJqMM
         NRncLlZLFXf4HNeTb4g+XU3Y6m3dzU9hYU5k8q/zM6A2TXbRVyn9kMVBNTZnznOlxhMi
         zmPw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773933590; x=1774538390; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OfH8Q5Td26D2zz2vaWeEEQdnUyXBLu9cQNzXDyggGWs=;
        b=XFzJnSifjHuYzn9cDjqpCX57R6DA6Cv0koazc2Xc7Yk9FRGKqxIsxh81CTvuGLahE5
         8jRxpr92FB/pR4PASzRz0LlK2jJsGHPnUrmbrYX3MHwbrhKi+4ZIvaaiSH2x9cxFs3RM
         /U2K3N8sIT+gkfLPyNP5VDXmrwzKqGC4J4xhfKvpizxW3Z125RAFKnPuN4ak7D1fv/F0
         byMP2MJfPAD1gY0O4FbFq2Tis/S5GYRLdE6zlKxv7VyiSLtw3jyWUuxwuR+LAuyQMJGW
         JzIpO9bIQUVjAuPDxR+L/IYaleU+nlwpFH6eEPnTnQCrSviQW3jUTf7d85TroTbyOq+l
         DVkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773933590; x=1774538390;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OfH8Q5Td26D2zz2vaWeEEQdnUyXBLu9cQNzXDyggGWs=;
        b=aKbCDi4X+5EfzcXqXrt021qOBEzPxCeeBInc1cdWLGoJ7z+1yD7wdjL8X1RCWE7oHn
         nAb2FmwjGGItQ/oQdArvbcGSh71z5VFmYShe/yUVEFGsPDmlah+CnWu3iOehsdRnxE4v
         PVOazjjLtabQedtQmtCi7/DlCdOCUoLWfD3bt1lydg0zYhKokvRUL+3gTe1U5qHtivCR
         /gU7tZ99FfYYbgspM1nTF8mLBv7wy8ixKsMUcd3xZr3xidU0ZbCbHUTKyNAIentFjf2Z
         9jaWcsMDPJy0lBP2TfeXDpb6EjzHlK98y1U4C+vIgiZ+S7VOa+LIOs/OVAtW0ubhBYK7
         Im9g==
X-Forwarded-Encrypted: i=1; AJvYcCVU0t/5l8gMJTMjXj32wdhZSGj/WurMNx4YWtY6uKe/jOPgqFIgt6gSY+HqbUxlQzBFcQRnHTh9BKR64KFKPOk9@lists.infradead.org
X-Gm-Message-State: AOJu0YwGzmBCNtUzTZOauHuT+/8h0D41cQKFH+JUudYJpDDU8rEDbSX7
	A7kKwmYZ8iGMFtW3PgG3gYPQmn1zv3zDdxuD85yT0bUnmF6mQrFaLeDpdsrvXQr0jtbCR/r+pEL
	Q+kbtskPtRS0ZVttRBCFqiuJWAeKZJnJh9RwT5ooz
X-Gm-Gg: ATEYQzy3IByyiY5+19UryUIUybPttgZdONq58HmiCiwQhr6GFDsTI+amqNslYX0mfW2
	H2Ab698yTfTjt3hgjl95umod0U2HjgOqD+MPmdv8t474wzUu7Ox+52eoZ1W7Q885O9dHrRym6FO
	c2BftUb72J/xpqa5x3wtS6cReQ8I1MtY5B4whvXBb1FPH6ibKIxvke2V4q//CB674nShiHT7cWU
	MNgdgSUCTU1max5Z6lsWW8oja5jF8JZ0rgzjdTIgF0OQiPsfQZdiLKFS3d4qgtaSd91QrAVEOtj
	RBcoda+pgWuGILNs6TB0ldV+1Mop9jYmIPe5
X-Received: by 2002:a05:6402:46c5:b0:665:d39:4b18 with SMTP id
 4fb4d7f45d1cf-66852d6c8abmr48783a12.8.1773933589136; Thu, 19 Mar 2026
 08:19:49 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1773695307.git.ljs@kernel.org> <48c6d25e374b57dba6df4fdddd4830d3fc1105be.1773695307.git.ljs@kernel.org>
 <CAJuCfpFXuHg4KPY27pqMC-xV5y9ZY2W72_R8_rxO0DvrJ=_yvw@mail.gmail.com>
 <CAJuCfpE5qZmi43EeZiRcy78pD6YvJb5n_xnoUJfwEjomowu0=A@mail.gmail.com>
 <8cdad898-b306-40fe-a367-efe7147f83b9@lucifer.local> <CAJuCfpHXqtxZr5s84jCcz513a2pgMeDoobsLBJH9pSON49cM+w@mail.gmail.com>
In-Reply-To: <CAJuCfpHXqtxZr5s84jCcz513a2pgMeDoobsLBJH9pSON49cM+w@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 19 Mar 2026 08:19:35 -0700
X-Gm-Features: AaiRm51bFJ7jnCWExjTkTJWtl61x7cY-2jhtQRDi8xxndWDLsjo0Sko90eA6oXU
Message-ID: <CAJuCfpG4F7r=AMTBRkazFeQsnKocu9OPFyV2TsQccLQc=oLwNA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260319_081951_927004_5BCA5E3B 
X-CRM114-Status: GOOD (  45.63  )
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

On Thu, Mar 19, 2026 at 8:19=E2=80=AFAM Suren Baghdasaryan <surenb@google.c=
om> wrote:
>
> On Thu, Mar 19, 2026 at 7:55=E2=80=AFAM Lorenzo Stoakes (Oracle) <ljs@ker=
nel.org> wrote:
> >
> > On Tue, Mar 17, 2026 at 02:32:16PM -0700, Suren Baghdasaryan wrote:
> > > On Tue, Mar 17, 2026 at 2:26=E2=80=AFPM Suren Baghdasaryan <surenb@go=
ogle.com> wrote:
> > > >
> > > > On Mon, Mar 16, 2026 at 2:14=E2=80=AFPM Lorenzo Stoakes (Oracle) <l=
js@kernel.org> wrote:
> > > > >
> > > > > The f_op->mmap interface is deprecated, so update driver to use i=
ts
> > > > > successor, mmap_prepare.
> > > > >
> > > > > The driver previously used vm_iomap_memory(), so this change repl=
aces it
> > > > > with its mmap_prepare equivalent, mmap_action_simple_ioremap().
> > > > >
> > > > > Functions that wrap mmap() are also converted to wrap mmap_prepar=
e()
> > > > > instead.
> > > > >
> > > > > Also update the documentation accordingly.
> > > > >
> > > > > Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>

Reviewed-by: Suren Baghdasaryan <surenb@google.com>

> > > > > ---
> > > > >  Documentation/driver-api/vme.rst    |  2 +-
> > > > >  drivers/staging/vme_user/vme.c      | 20 +++++------
> > > > >  drivers/staging/vme_user/vme.h      |  2 +-
> > > > >  drivers/staging/vme_user/vme_user.c | 51 +++++++++++++++++------=
------
> > > > >  4 files changed, 42 insertions(+), 33 deletions(-)
> > > > >
> > > > > diff --git a/Documentation/driver-api/vme.rst b/Documentation/dri=
ver-api/vme.rst
> > > > > index c0b475369de0..7111999abc14 100644
> > > > > --- a/Documentation/driver-api/vme.rst
> > > > > +++ b/Documentation/driver-api/vme.rst
> > > > > @@ -107,7 +107,7 @@ The function :c:func:`vme_master_read` can be=
 used to read from and
> > > > >
> > > > >  In addition to simple reads and writes, :c:func:`vme_master_rmw`=
 is provided to
> > > > >  do a read-modify-write transaction. Parts of a VME window can al=
so be mapped
> > > > > -into user space memory using :c:func:`vme_master_mmap`.
> > > > > +into user space memory using :c:func:`vme_master_mmap_prepare`.
> > > > >
> > > > >
> > > > >  Slave windows
> > > > > diff --git a/drivers/staging/vme_user/vme.c b/drivers/staging/vme=
_user/vme.c
> > > > > index f10a00c05f12..7220aba7b919 100644
> > > > > --- a/drivers/staging/vme_user/vme.c
> > > > > +++ b/drivers/staging/vme_user/vme.c
> > > > > @@ -735,9 +735,9 @@ unsigned int vme_master_rmw(struct vme_resour=
ce *resource, unsigned int mask,
> > > > >  EXPORT_SYMBOL(vme_master_rmw);
> > > > >
> > > > >  /**
> > > > > - * vme_master_mmap - Mmap region of VME master window.
> > > > > + * vme_master_mmap_prepare - Mmap region of VME master window.
> > > > >   * @resource: Pointer to VME master resource.
> > > > > - * @vma: Pointer to definition of user mapping.
> > > > > + * @desc: Pointer to descriptor of user mapping.
> > > > >   *
> > > > >   * Memory map a region of the VME master window into user space.
> > > > >   *
> > > > > @@ -745,12 +745,13 @@ EXPORT_SYMBOL(vme_master_rmw);
> > > > >   *         resource or -EFAULT if map exceeds window size. Other=
 generic mmap
> > > > >   *         errors may also be returned.
> > > > >   */
> > > > > -int vme_master_mmap(struct vme_resource *resource, struct vm_are=
a_struct *vma)
> > > > > +int vme_master_mmap_prepare(struct vme_resource *resource,
> > > > > +                           struct vm_area_desc *desc)
> > > > >  {
> > > > > +       const unsigned long vma_size =3D vma_desc_size(desc);
> > > > >         struct vme_bridge *bridge =3D find_bridge(resource);
> > > > >         struct vme_master_resource *image;
> > > > >         phys_addr_t phys_addr;
> > > > > -       unsigned long vma_size;
> > > > >
> > > > >         if (resource->type !=3D VME_MASTER) {
> > > > >                 dev_err(bridge->parent, "Not a master resource\n"=
);
> > > > > @@ -758,19 +759,18 @@ int vme_master_mmap(struct vme_resource *re=
source, struct vm_area_struct *vma)
> > > > >         }
> > > > >
> > > > >         image =3D list_entry(resource->entry, struct vme_master_r=
esource, list);
> > > > > -       phys_addr =3D image->bus_resource.start + (vma->vm_pgoff =
<< PAGE_SHIFT);
> > > > > -       vma_size =3D vma->vm_end - vma->vm_start;
> > > > > +       phys_addr =3D image->bus_resource.start + (desc->pgoff <<=
 PAGE_SHIFT);
> > > > >
> > > > >         if (phys_addr + vma_size > image->bus_resource.end + 1) {
> > > > >                 dev_err(bridge->parent, "Map size cannot exceed t=
he window size\n");
> > > > >                 return -EFAULT;
> > > > >         }
> > > > >
> > > > > -       vma->vm_page_prot =3D pgprot_noncached(vma->vm_page_prot)=
;
> > > > > -
> > > > > -       return vm_iomap_memory(vma, phys_addr, vma->vm_end - vma-=
>vm_start);
> > > > > +       desc->page_prot =3D pgprot_noncached(desc->page_prot);
> > > > > +       mmap_action_simple_ioremap(desc, phys_addr, vma_size);
> > > > > +       return 0;
> > > > >  }
> > > > > -EXPORT_SYMBOL(vme_master_mmap);
> > > > > +EXPORT_SYMBOL(vme_master_mmap_prepare);
> > > > >
> > > > >  /**
> > > > >   * vme_master_free - Free VME master window
> > > > > diff --git a/drivers/staging/vme_user/vme.h b/drivers/staging/vme=
_user/vme.h
> > > > > index 797e9940fdd1..b6413605ea49 100644
> > > > > --- a/drivers/staging/vme_user/vme.h
> > > > > +++ b/drivers/staging/vme_user/vme.h
> > > > > @@ -151,7 +151,7 @@ ssize_t vme_master_read(struct vme_resource *=
resource, void *buf, size_t count,
> > > > >  ssize_t vme_master_write(struct vme_resource *resource, void *bu=
f, size_t count, loff_t offset);
> > > > >  unsigned int vme_master_rmw(struct vme_resource *resource, unsig=
ned int mask, unsigned int compare,
> > > > >                             unsigned int swap, loff_t offset);
> > > > > -int vme_master_mmap(struct vme_resource *resource, struct vm_are=
a_struct *vma);
> > > > > +int vme_master_mmap_prepare(struct vme_resource *resource, struc=
t vm_area_desc *desc);
> > > > >  void vme_master_free(struct vme_resource *resource);
> > > > >
> > > > >  struct vme_resource *vme_dma_request(struct vme_dev *vdev, u32 r=
oute);
> > > > > diff --git a/drivers/staging/vme_user/vme_user.c b/drivers/stagin=
g/vme_user/vme_user.c
> > > > > index d95dd7d9190a..11e25c2f6b0a 100644
> > > > > --- a/drivers/staging/vme_user/vme_user.c
> > > > > +++ b/drivers/staging/vme_user/vme_user.c
> > > > > @@ -446,24 +446,14 @@ static void vme_user_vm_close(struct vm_are=
a_struct *vma)
> > > > >         kfree(vma_priv);
> > > > >  }
> > > > >
> > > > > -static const struct vm_operations_struct vme_user_vm_ops =3D {
> > > > > -       .open =3D vme_user_vm_open,
> > > > > -       .close =3D vme_user_vm_close,
> > > > > -};
> > > > > -
> > > > > -static int vme_user_master_mmap(unsigned int minor, struct vm_ar=
ea_struct *vma)
> > > > > +static int vme_user_vm_mapped(unsigned long start, unsigned long=
 end, pgoff_t pgoff,
> > > > > +                             const struct file *file, void **vm_=
private_data)
> > > > >  {
> > > > > -       int err;
> > > > > +       const unsigned int minor =3D iminor(file_inode(file));
> > > > >         struct vme_user_vma_priv *vma_priv;
> > > > >
> > > > >         mutex_lock(&image[minor].mutex);
> > > > >
> > > > > -       err =3D vme_master_mmap(image[minor].resource, vma);
> > > > > -       if (err) {
> > > > > -               mutex_unlock(&image[minor].mutex);
> > > > > -               return err;
> > > > > -       }
> > > > > -
> > > >
> > > > Ok, this changes the set of the operations performed under image[mi=
nor].mutex.
> > > > Before we had:
> > > >
> > > > mutex_lock(&image[minor].mutex);
> > > > vme_master_mmap();
> > > > <some final adjustments>
> > > > mutex_unlock(&image[minor].mutex);
> > > >
> > > > Now we have:
> > > >
> > > > mutex_lock(&image[minor].mutex);
> > > > vme_master_mmap_prepare()
> > > > mutex_unlock(&image[minor].mutex);
> > > > vm_iomap_memory();
> > > > mutex_lock(&image[minor].mutex);
> > > > vme_user_vm_mapped(); // <some final adjustments>
> > > > mutex_unlock(&image[minor].mutex);
> > > >
> > > > I think as long as image[minor] does not change while we are not
> > > > holding the mutex we should be safe, and looking at the code it see=
ms
> > > > to be the case. But I'm not familiar with this driver and might be
> > > > wrong. Worth double-checking.
> >
> > The file is pinned for the duration, the mutex is associated with the f=
ile,
> > so there's no sane world in which that could be problematic.
> >
> > Keeping in mind that we manipulate stuff on vme_user_vm_close() that
> > directly acceses image[minor] at an arbitary time.
>
> That was my understanding as well. Thanks for confirming.
>
> >
> > >
> > > A side note: if we had to hold the mutex across all those operations =
I
> > > think we would need to take the mutex in the vm_ops->mmap_prepare and
> > > add a vm_ops->map_failed hook or something along that line to drop th=
e
> > > mutex in case mmap_action_complete() fails. Not sure if we will have
> > > such cases though...
> >
> > No, I don't want to do this if it can be at all avoided. You should in
> > nearly any sane circumstance be able to defer things until the mapped h=
ook
> > anyway.
> >
> > Also a merge can happen too after an .mmap_prepare, so we'd have to hav=
e
> > some 'success' hook and I'm just not going there it'll end up open to a=
buse
> > again.
> >
> > (We do have success and error filtering hooks right now, sadly, but the=
y're
> > really for hugetlb and I plan to find a way to get rid of them).
> >
> > The mmap_prepare is meant to essentially be as stateless as possible.
>
> Yes, I also hope we won't encounter cases requiring us to keep any
> state information between the mmap_prepare and mapped stages.
>
> >
> > Anyway I don't think it's relevant here.
> >
> > >
> > > >
> > > > >         vma_priv =3D kmalloc_obj(*vma_priv);
> > > > >         if (!vma_priv) {
> > > > >                 mutex_unlock(&image[minor].mutex);
> > > > > @@ -472,22 +462,41 @@ static int vme_user_master_mmap(unsigned in=
t minor, struct vm_area_struct *vma)
> > > > >
> > > > >         vma_priv->minor =3D minor;
> > > > >         refcount_set(&vma_priv->refcnt, 1);
> > > > > -       vma->vm_ops =3D &vme_user_vm_ops;
> > > > > -       vma->vm_private_data =3D vma_priv;
> > > > > -
> > > > > +       *vm_private_data =3D vma_priv;
> > > > >         image[minor].mmap_count++;
> > > > >
> > > > >         mutex_unlock(&image[minor].mutex);
> > > > > -
> > > > >         return 0;
> > > > >  }
> > > > >
> > > > > -static int vme_user_mmap(struct file *file, struct vm_area_struc=
t *vma)
> > > > > +static const struct vm_operations_struct vme_user_vm_ops =3D {
> > > > > +       .mapped =3D vme_user_vm_mapped,
> > > > > +       .open =3D vme_user_vm_open,
> > > > > +       .close =3D vme_user_vm_close,
> > > > > +};
> > > > > +
> > > > > +static int vme_user_master_mmap_prepare(unsigned int minor,
> > > > > +                                       struct vm_area_desc *desc=
)
> > > > > +{
> > > > > +       int err;
> > > > > +
> > > > > +       mutex_lock(&image[minor].mutex);
> > > > > +
> > > > > +       err =3D vme_master_mmap_prepare(image[minor].resource, de=
sc);
> > > > > +       if (!err)
> > > > > +               desc->vm_ops =3D &vme_user_vm_ops;
> > > > > +
> > > > > +       mutex_unlock(&image[minor].mutex);
> > > > > +       return err;
> > > > > +}
> > > > > +
> > > > > +static int vme_user_mmap_prepare(struct vm_area_desc *desc)
> > > > >  {
> > > > > -       unsigned int minor =3D iminor(file_inode(file));
> > > > > +       const struct file *file =3D desc->file;
> > > > > +       const unsigned int minor =3D iminor(file_inode(file));
> > > > >
> > > > >         if (type[minor] =3D=3D MASTER_MINOR)
> > > > > -               return vme_user_master_mmap(minor, vma);
> > > > > +               return vme_user_master_mmap_prepare(minor, desc);
> > > > >
> > > > >         return -ENODEV;
> > > > >  }
> > > > > @@ -498,7 +507,7 @@ static const struct file_operations vme_user_=
fops =3D {
> > > > >         .llseek =3D vme_user_llseek,
> > > > >         .unlocked_ioctl =3D vme_user_unlocked_ioctl,
> > > > >         .compat_ioctl =3D compat_ptr_ioctl,
> > > > > -       .mmap =3D vme_user_mmap,
> > > > > +       .mmap_prepare =3D vme_user_mmap_prepare,
> > > > >  };
> > > > >
> > > > >  static int vme_user_match(struct vme_dev *vdev)
> > > > > --
> > > > > 2.53.0
> > > > >
> >
> > Cheers, Lorenzo

