Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7998FF6E86
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 21:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O9MljJMIpne7nbSW7i1x1Or1SMzjT+hBLrQOgGeQvrk=; b=vyYizXJsj0ek79yg7Yi4RRojzV
	/v+JdjMtkCyI0o1tl5O2P/9OzGeDqqOMOqkiC4m/ZEkFBuz5nwJJRpB1XMId9MWZQwgHzsck+hENC
	gkTM6Ru6anx1xACqc7AIAXIgxwk48aTV1wr10cFBDG8ed29CHeODwFG1b+7Nrh02hTzcaY9g8484E
	KJslUmpOL+7HH2zjJz+m9B32u9I9F4kLoDOGEx2rGRLlO+DvZ7UWqumtaIkscHg3jTS5yTehXIUOJ
	BewoY83OHIhkHMwXjSykDci7/nPM8lUeAk3p5oL7zPv1nW9G8KgVR4vslM5vECEDxsqq13gfrFBjD
	uUb8na1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2bvx-00000007Few-2PLA;
	Tue, 17 Mar 2026 21:26:37 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2bvu-00000007Fdu-3rf0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 21:26:36 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-50906a98ffeso171321cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 14:26:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773782793; cv=none;
        d=google.com; s=arc-20240605;
        b=Y7duVXe1KEkeDblmpj9nU7p0bodn4VCiWrLy688rU8lKCzIarzYUiTBl5B12PVyuxJ
         YUHIwkpQZtoctmthVISNJR9O7wWAnyiTvr6Fg1/9aXsazNzyVOO/OfsbLIslozAnHRpf
         fI+O/POE1CBiMx1gnMGMzeifd+BXE6MVd3uNxnk2I5R1l4aJp46xhd5aXa7W3knJdiBD
         2QFtqycQHYIPAPG973tpCT+iMCRwTPhydM/8gj/2WFNBqLKV9n7ePujMopW1mgQD/YaF
         Ep0zgViHJuSnUdEiXn+YQ3V22xHfEGCOBDSScIaQVnc5alXK8Tp4eAukNfqpektZujyd
         eVeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O9MljJMIpne7nbSW7i1x1Or1SMzjT+hBLrQOgGeQvrk=;
        fh=HieGWA+7QQql+wIaAXQIy1mZPUNIcLJG/DHHjjmKLaU=;
        b=JM3kum0oGVyMO7KXx74vTlXMdIpYnA67ItNCKmCDNnrhO5xyadeW594BriOCHKwJEB
         /R6ESazjN32AJfaUv1kv8EgpkK8JAAeMPfzvbHXIwqzRaxCM+GLJal83zkFBcKIXjX0H
         nT09OH72lfploe/KG6xHA4ci7fR2uCxp0waxRDEirnIOXw7anrIvCa1lICcIB72VibyL
         51JdH82fIuRsmUadTdPVR0sCUoxrv1kqH11agSXtKfTIZ56+SYAjtmkuB2sq+GhGsTdA
         igP5coYSZUCS4By10QUSAS79dIOtRcyPqa9XNtBY7GzP6cgGW/hra4VEz5USEsBN90GW
         XrPg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773782793; x=1774387593; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O9MljJMIpne7nbSW7i1x1Or1SMzjT+hBLrQOgGeQvrk=;
        b=vP4IlTq/8qHjeMbIRJwqylDrCQKVLfVFBRW8AVDsk72Xm86zxfXfTDQxX5ND8T4BV1
         L7JO6KwUU6/XrlytRklfknQA52Eak6yJ4+1yT7s6qYdWzrHUkXtzTAp6LCLRLiGWMsNh
         tlKL9uwQZn1cBh+wYKE3lZWABcajdMXqUM3yjCg5r7HD4Nss9csuSVkvV+9WY7uOBiKR
         27mOHTXq7MZ++QowLZKRs2ZaYDUF5bcDJKAhdzfGJi3A5skgWSgLDDi+nyKLLeLVfbWu
         HxO7htiljjMcsBYflHYUaxhN4yHVz2P+jYhkdGidkvwljOhylVL+uYJProa+1xSLTUSo
         7J1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773782793; x=1774387593;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O9MljJMIpne7nbSW7i1x1Or1SMzjT+hBLrQOgGeQvrk=;
        b=dscV7ie2CXG3tWJ0MBSsvwr2JbF9JmPWt6sACfKCJinaYM4Se272UD3/sScQ8BsBjy
         9yjtpOk+dg2gEs7QqCuCE66hqR6wvtVpClSZT4BlHG4HTTY3jJtaXF9w8xliITp2S1Q/
         OSoSdbUuysiFyPUSyfOfDfjHnU3xHp6Z6b9hkKXF8oe5Nk50SwSgAHQEdtAl8B9SFwQ+
         yNmog0qmUcQ8z1kuCFHfLtqaBJ1zbxGFXWK1zLmu0FEs+zbX7KwoFL83g06SUu4Tw+bK
         ScxjXEt5Tdtdk0cWFavM2jLMhNl71z8oOaVshYp/BotBADpO7KGqcRlzSXri66UMvVqp
         WW+A==
X-Forwarded-Encrypted: i=1; AJvYcCXM/3JYq0SFUeqpGNV1FwJUSjnzTlgTIdCseqaZEwqdHtbvhplwHReN2/8GuCGlUFbwMC+9Hm8I4GuFUQcI9VYS@lists.infradead.org
X-Gm-Message-State: AOJu0YxkOTLGekX0bN73eyxzq0LND/JkHh05ekQbg3+m9Fn7R0bbZL5i
	7+J7VTCjv+ARvnbWUBxc5y/iNrL3CNMaaE9B8RaHAcHkwezyn6FG/mdsSHscXezJOeeUv2f36ct
	Yoh9AC4Wh4Sx9uDDbE8BOBKf4Ncrc5UhL8YNCN8OC
X-Gm-Gg: ATEYQzwfsUK5LmZIsTqQfyeEwgn+D9dIZbp3xyso/gkpVg6Um0s5XDMI9pGrl8CmuHU
	g6gKyZGTDDVlNyIkwVubZxWwTcXHdyjG1nRKt7BN3jtyiZASOaQ5YnMDeFg/3ZFQWAY0NRNfIz9
	7Px3TLi5jN+j4qL14TFaJtTJ+cVFh95xSfz9lPGnghTFNROQ9RUtX8gWatP7Z08vzE5tX6dDsUE
	LOTh4Tak8iaTiil+vtCTDy8h1yEJVkm8HunvHuUEBmgWGYmojHcDIgcQ9T+elKqy426K61UmCig
	aoXxwdv08Z8zG3a6iR/sWpyCAZE5E/T7rSbx2g==
X-Received: by 2002:a05:622a:614:b0:509:1eca:6d24 with SMTP id
 d75a77b69052e-50b1470ee58mr4568251cf.2.1773782792685; Tue, 17 Mar 2026
 14:26:32 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1773695307.git.ljs@kernel.org> <48c6d25e374b57dba6df4fdddd4830d3fc1105be.1773695307.git.ljs@kernel.org>
In-Reply-To: <48c6d25e374b57dba6df4fdddd4830d3fc1105be.1773695307.git.ljs@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 17 Mar 2026 14:26:21 -0700
X-Gm-Features: AaiRm51SJauRxJyG8YD3YuiOnfN0s_6akSz6AhkIFbo6vEz-Gt-mAXyXfHq04tA
Message-ID: <CAJuCfpFXuHg4KPY27pqMC-xV5y9ZY2W72_R8_rxO0DvrJ=_yvw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260317_142635_016338_31D17985 
X-CRM114-Status: GOOD (  32.65  )
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

On Mon, Mar 16, 2026 at 2:14=E2=80=AFPM Lorenzo Stoakes (Oracle) <ljs@kerne=
l.org> wrote:
>
> The f_op->mmap interface is deprecated, so update driver to use its
> successor, mmap_prepare.
>
> The driver previously used vm_iomap_memory(), so this change replaces it
> with its mmap_prepare equivalent, mmap_action_simple_ioremap().
>
> Functions that wrap mmap() are also converted to wrap mmap_prepare()
> instead.
>
> Also update the documentation accordingly.
>
> Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
> ---
>  Documentation/driver-api/vme.rst    |  2 +-
>  drivers/staging/vme_user/vme.c      | 20 +++++------
>  drivers/staging/vme_user/vme.h      |  2 +-
>  drivers/staging/vme_user/vme_user.c | 51 +++++++++++++++++------------
>  4 files changed, 42 insertions(+), 33 deletions(-)
>
> diff --git a/Documentation/driver-api/vme.rst b/Documentation/driver-api/=
vme.rst
> index c0b475369de0..7111999abc14 100644
> --- a/Documentation/driver-api/vme.rst
> +++ b/Documentation/driver-api/vme.rst
> @@ -107,7 +107,7 @@ The function :c:func:`vme_master_read` can be used to=
 read from and
>
>  In addition to simple reads and writes, :c:func:`vme_master_rmw` is prov=
ided to
>  do a read-modify-write transaction. Parts of a VME window can also be ma=
pped
> -into user space memory using :c:func:`vme_master_mmap`.
> +into user space memory using :c:func:`vme_master_mmap_prepare`.
>
>
>  Slave windows
> diff --git a/drivers/staging/vme_user/vme.c b/drivers/staging/vme_user/vm=
e.c
> index f10a00c05f12..7220aba7b919 100644
> --- a/drivers/staging/vme_user/vme.c
> +++ b/drivers/staging/vme_user/vme.c
> @@ -735,9 +735,9 @@ unsigned int vme_master_rmw(struct vme_resource *reso=
urce, unsigned int mask,
>  EXPORT_SYMBOL(vme_master_rmw);
>
>  /**
> - * vme_master_mmap - Mmap region of VME master window.
> + * vme_master_mmap_prepare - Mmap region of VME master window.
>   * @resource: Pointer to VME master resource.
> - * @vma: Pointer to definition of user mapping.
> + * @desc: Pointer to descriptor of user mapping.
>   *
>   * Memory map a region of the VME master window into user space.
>   *
> @@ -745,12 +745,13 @@ EXPORT_SYMBOL(vme_master_rmw);
>   *         resource or -EFAULT if map exceeds window size. Other generic=
 mmap
>   *         errors may also be returned.
>   */
> -int vme_master_mmap(struct vme_resource *resource, struct vm_area_struct=
 *vma)
> +int vme_master_mmap_prepare(struct vme_resource *resource,
> +                           struct vm_area_desc *desc)
>  {
> +       const unsigned long vma_size =3D vma_desc_size(desc);
>         struct vme_bridge *bridge =3D find_bridge(resource);
>         struct vme_master_resource *image;
>         phys_addr_t phys_addr;
> -       unsigned long vma_size;
>
>         if (resource->type !=3D VME_MASTER) {
>                 dev_err(bridge->parent, "Not a master resource\n");
> @@ -758,19 +759,18 @@ int vme_master_mmap(struct vme_resource *resource, =
struct vm_area_struct *vma)
>         }
>
>         image =3D list_entry(resource->entry, struct vme_master_resource,=
 list);
> -       phys_addr =3D image->bus_resource.start + (vma->vm_pgoff << PAGE_=
SHIFT);
> -       vma_size =3D vma->vm_end - vma->vm_start;
> +       phys_addr =3D image->bus_resource.start + (desc->pgoff << PAGE_SH=
IFT);
>
>         if (phys_addr + vma_size > image->bus_resource.end + 1) {
>                 dev_err(bridge->parent, "Map size cannot exceed the windo=
w size\n");
>                 return -EFAULT;
>         }
>
> -       vma->vm_page_prot =3D pgprot_noncached(vma->vm_page_prot);
> -
> -       return vm_iomap_memory(vma, phys_addr, vma->vm_end - vma->vm_star=
t);
> +       desc->page_prot =3D pgprot_noncached(desc->page_prot);
> +       mmap_action_simple_ioremap(desc, phys_addr, vma_size);
> +       return 0;
>  }
> -EXPORT_SYMBOL(vme_master_mmap);
> +EXPORT_SYMBOL(vme_master_mmap_prepare);
>
>  /**
>   * vme_master_free - Free VME master window
> diff --git a/drivers/staging/vme_user/vme.h b/drivers/staging/vme_user/vm=
e.h
> index 797e9940fdd1..b6413605ea49 100644
> --- a/drivers/staging/vme_user/vme.h
> +++ b/drivers/staging/vme_user/vme.h
> @@ -151,7 +151,7 @@ ssize_t vme_master_read(struct vme_resource *resource=
, void *buf, size_t count,
>  ssize_t vme_master_write(struct vme_resource *resource, void *buf, size_=
t count, loff_t offset);
>  unsigned int vme_master_rmw(struct vme_resource *resource, unsigned int =
mask, unsigned int compare,
>                             unsigned int swap, loff_t offset);
> -int vme_master_mmap(struct vme_resource *resource, struct vm_area_struct=
 *vma);
> +int vme_master_mmap_prepare(struct vme_resource *resource, struct vm_are=
a_desc *desc);
>  void vme_master_free(struct vme_resource *resource);
>
>  struct vme_resource *vme_dma_request(struct vme_dev *vdev, u32 route);
> diff --git a/drivers/staging/vme_user/vme_user.c b/drivers/staging/vme_us=
er/vme_user.c
> index d95dd7d9190a..11e25c2f6b0a 100644
> --- a/drivers/staging/vme_user/vme_user.c
> +++ b/drivers/staging/vme_user/vme_user.c
> @@ -446,24 +446,14 @@ static void vme_user_vm_close(struct vm_area_struct=
 *vma)
>         kfree(vma_priv);
>  }
>
> -static const struct vm_operations_struct vme_user_vm_ops =3D {
> -       .open =3D vme_user_vm_open,
> -       .close =3D vme_user_vm_close,
> -};
> -
> -static int vme_user_master_mmap(unsigned int minor, struct vm_area_struc=
t *vma)
> +static int vme_user_vm_mapped(unsigned long start, unsigned long end, pg=
off_t pgoff,
> +                             const struct file *file, void **vm_private_=
data)
>  {
> -       int err;
> +       const unsigned int minor =3D iminor(file_inode(file));
>         struct vme_user_vma_priv *vma_priv;
>
>         mutex_lock(&image[minor].mutex);
>
> -       err =3D vme_master_mmap(image[minor].resource, vma);
> -       if (err) {
> -               mutex_unlock(&image[minor].mutex);
> -               return err;
> -       }
> -

Ok, this changes the set of the operations performed under image[minor].mut=
ex.
Before we had:

mutex_lock(&image[minor].mutex);
vme_master_mmap();
<some final adjustments>
mutex_unlock(&image[minor].mutex);

Now we have:

mutex_lock(&image[minor].mutex);
vme_master_mmap_prepare()
mutex_unlock(&image[minor].mutex);
vm_iomap_memory();
mutex_lock(&image[minor].mutex);
vme_user_vm_mapped(); // <some final adjustments>
mutex_unlock(&image[minor].mutex);

I think as long as image[minor] does not change while we are not
holding the mutex we should be safe, and looking at the code it seems
to be the case. But I'm not familiar with this driver and might be
wrong. Worth double-checking.

>         vma_priv =3D kmalloc_obj(*vma_priv);
>         if (!vma_priv) {
>                 mutex_unlock(&image[minor].mutex);
> @@ -472,22 +462,41 @@ static int vme_user_master_mmap(unsigned int minor,=
 struct vm_area_struct *vma)
>
>         vma_priv->minor =3D minor;
>         refcount_set(&vma_priv->refcnt, 1);
> -       vma->vm_ops =3D &vme_user_vm_ops;
> -       vma->vm_private_data =3D vma_priv;
> -
> +       *vm_private_data =3D vma_priv;
>         image[minor].mmap_count++;
>
>         mutex_unlock(&image[minor].mutex);
> -
>         return 0;
>  }
>
> -static int vme_user_mmap(struct file *file, struct vm_area_struct *vma)
> +static const struct vm_operations_struct vme_user_vm_ops =3D {
> +       .mapped =3D vme_user_vm_mapped,
> +       .open =3D vme_user_vm_open,
> +       .close =3D vme_user_vm_close,
> +};
> +
> +static int vme_user_master_mmap_prepare(unsigned int minor,
> +                                       struct vm_area_desc *desc)
> +{
> +       int err;
> +
> +       mutex_lock(&image[minor].mutex);
> +
> +       err =3D vme_master_mmap_prepare(image[minor].resource, desc);
> +       if (!err)
> +               desc->vm_ops =3D &vme_user_vm_ops;
> +
> +       mutex_unlock(&image[minor].mutex);
> +       return err;
> +}
> +
> +static int vme_user_mmap_prepare(struct vm_area_desc *desc)
>  {
> -       unsigned int minor =3D iminor(file_inode(file));
> +       const struct file *file =3D desc->file;
> +       const unsigned int minor =3D iminor(file_inode(file));
>
>         if (type[minor] =3D=3D MASTER_MINOR)
> -               return vme_user_master_mmap(minor, vma);
> +               return vme_user_master_mmap_prepare(minor, desc);
>
>         return -ENODEV;
>  }
> @@ -498,7 +507,7 @@ static const struct file_operations vme_user_fops =3D=
 {
>         .llseek =3D vme_user_llseek,
>         .unlocked_ioctl =3D vme_user_unlocked_ioctl,
>         .compat_ioctl =3D compat_ptr_ioctl,
> -       .mmap =3D vme_user_mmap,
> +       .mmap_prepare =3D vme_user_mmap_prepare,
>  };
>
>  static int vme_user_match(struct vme_dev *vdev)
> --
> 2.53.0
>

