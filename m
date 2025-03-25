Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B21D6C36005
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 11:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uY6OiXQYVOm2a0bCFFbT3GDw62MtON0FRvOzcBeNYK4=; b=g+MPeqiS3WmapyNXhGTk0r+4Q8
	D2AMvg5SZXQfUkBMXZ/1JfLfB/fRzbWGZ8YyZJYGcVGX6pJa4abTmNsXOrAlsfTXYDZeckFgQKs1w
	RHEYBslEUGb60Jy/EGXxUlBCpZRxsuYn/hTec/0J9lQNf3S8oy1jV2d8XTGNnVkuUpgSyidm/ADtX
	fLh3hJoK3ze0y1Dq+w3PAhOYT7OS2HLseVbS+s0PyWBlES4xWJgqOHheG3P1yWWOqC0FM7hTOTCdh
	7VSOGDUjaTt0lRrnU4Ea8w46yILW/Gsd7qu9lly4N3PIcSfHBHja8xZAcIE7zA6+rK70w3pPxKZcr
	uLd5dGyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx2Lx-00000005cwI-1ERC;
	Tue, 25 Mar 2025 11:21:53 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx2Hl-00000005cTL-3T2h
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 11:17:35 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-72bd5f25ea6so1378595a34.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Mar 2025 04:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742901453; x=1743506253; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uY6OiXQYVOm2a0bCFFbT3GDw62MtON0FRvOzcBeNYK4=;
        b=cQ1hhEcd+oFaFz4/+ILtxmsiLGlqzarlriPxlhMImw3eTHhF7RHz6g8a2DoJsKDFYF
         mem8h2R5GdMHBWXMMaKnKpKVjvOt0mUTSVspF7SCWHKA02P0hn78P4XHgBdFqFTCYVPb
         EAESvKJuAqNF+fM33DsX1fFquzMjNw4kxoq6hFhqXQJzwDX6wNIR7ahVJVDXQZOGXzf3
         X2mY4dksIBMUqNqKxEYGqc00gH2RdtuO6h31fEplHBeQ5gtzDbeOwgYP+ENDsTwNW8Mr
         NrTwm1OP5/9HZh5gHTk4oQyTmcvn29XNRli2hXVpJnyRGh60/NWzm564yUgIz/ftV/jb
         iV7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742901453; x=1743506253;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uY6OiXQYVOm2a0bCFFbT3GDw62MtON0FRvOzcBeNYK4=;
        b=oGvVlL6OIR6tXXsW1bkyK65sq6j8hgEIDMhcBvScMM7uYYp3Xf7ZAI82huglXO/A4f
         Mb2zVG2G7YpLBXc7zbEQtEI6POxUHaiMn2TibaqxJM/zadGtu5HKnmMJ+W5Un5hMajnQ
         RgYrHljp5HcSG1I8Ved8681yXbJWTdNpm+y7VUo1QCljhbaPdM6zo+6ecw1/1dJH0j9L
         Dfg8NtOwcIk3B+iB7RizgoB3CjoOD4aUiQMjDLqAUbsynSOQ9I/1z/Hw4ae0szDvs+G4
         gBvUJhcMgY3Nv05yK5WrY6T2Gg7mXjyHXi2L2TrDx1zdtTR060hryedZuJFc1b4+c2ms
         SB7Q==
X-Forwarded-Encrypted: i=1; AJvYcCW98QrWqZfv3k/bLAtXuJ+V5/sNQocWGzFQ6lcUy65SgOoi5WvFcxlygGtXTRe8rEAfe6cvDZcF/c/HaAXxzZYd@lists.infradead.org
X-Gm-Message-State: AOJu0YwwEJA2fpr84VQIMSnwU4lLrumVtWcLmVGYJwtfnX7qO22Xjln7
	cFhrOrPTT6ZlfmWfl12Qa+FPwOy7593XOsqha9Nwc6d8agSWduCU6erop1ug4yGtkQOxyHC6aZG
	aFS3jVYR1QwQ3+VHFEog9pYADnbCM5UqGMaG16A6ayLlLgxczU2ffbw==
X-Gm-Gg: ASbGncsTp61MY+9qhIVRULaNvgu0n5sxy1NXJsDvRcXgzqMNa5tLGWxs+q9xk31bbKK
	mzt96jcsKBSN5YzDyC2o5+ZvMrL+ToEU2/SWEwbZn4zwt5wtriv4G1iXUj2LZ1HgArXK09LVSLA
	IdY1MQPu1P42QX9cyLCC3f0ir2Irc=
X-Google-Smtp-Source: AGHT+IHZ023NKRIEjsmFIsIW+EijU7J7ZlRwn6wwtDMvpIHwlfuDyD7cd8Acwd9DmUqP5YGSo1fkx6r+sKRWLUQ3tT4=
X-Received: by 2002:a05:6870:538d:b0:2c2:2b76:7506 with SMTP id
 586e51a60fabf-2c780543e98mr10077025fac.28.1742901452364; Tue, 25 Mar 2025
 04:17:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250305130634.1850178-1-jens.wiklander@linaro.org>
 <20250305130634.1850178-7-jens.wiklander@linaro.org> <Z-JSNoALMOoyfOXu@sumit-X1>
In-Reply-To: <Z-JSNoALMOoyfOXu@sumit-X1>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 25 Mar 2025 12:17:20 +0100
X-Gm-Features: AQ5f1JoSTc-BzmIx0vu2WigRZgP4ag_16LHrPwLrhGtKna4fFq3Fx8IpQYycxwU
Message-ID: <CAHUa44FMou3O+2MeRtEe+WDjoGdB_3U56Z0RUpFLMFR1ebTkKQ@mail.gmail.com>
Subject: Re: [PATCH v6 06/10] tee: new ioctl to a register tee_shm from a
 dmabuf file descriptor
To: Sumit Garg <sumit.garg@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
	Olivier Masse <olivier.masse@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, azarrabi@qti.qualcomm.com, 
	Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>, 
	Etienne Carriere <etienne.carriere@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_041733_889755_2D15329A 
X-CRM114-Status: GOOD (  44.93  )
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

Hi Sumit,

On Tue, Mar 25, 2025 at 7:50=E2=80=AFAM Sumit Garg <sumit.garg@kernel.org> =
wrote:
>
> Hi Jens,
>
> On Wed, Mar 05, 2025 at 02:04:12PM +0100, Jens Wiklander wrote:
> > From: Etienne Carriere <etienne.carriere@linaro.org>
> >
> > Enable userspace to create a tee_shm object that refers to a dmabuf
> > reference.
> >
> > Userspace registers the dmabuf file descriptor as in a tee_shm object.
> > The registration is completed with a tee_shm file descriptor returned t=
o
> > userspace.
> >
> > Userspace is free to close the dmabuf file descriptor now since all the
> > resources are now held via the tee_shm object.
> >
> > Closing the tee_shm file descriptor will release all resources used by =
the
> > tee_shm object.
> >
> > This change only support dmabuf references that relates to physically
> > contiguous memory buffers.
> >
> > New tee_shm flag to identify tee_shm objects built from a registered
> > dmabuf, TEE_SHM_DMA_BUF.
> >
> > Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
> > Signed-off-by: Olivier Masse <olivier.masse@nxp.com>
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > ---
> >  drivers/tee/tee_core.c    | 145 ++++++++++++++++++++++++++-----------
> >  drivers/tee/tee_private.h |   1 +
> >  drivers/tee/tee_shm.c     | 146 ++++++++++++++++++++++++++++++++++++--
> >  include/linux/tee_core.h  |   1 +
> >  include/linux/tee_drv.h   |  10 +++
> >  include/uapi/linux/tee.h  |  29 ++++++++
> >  6 files changed, 288 insertions(+), 44 deletions(-)
> >
>
> I am still trying to find if we really need a separate IOCTL to register
> DMA heap with TEE subsystem. Can't we initialize tee_shm as a member of
> struct tee_heap_buffer in tee_dma_heap_alloc() where the allocation
> happens?

No, that's not possible since we don't have a tee_context availble so
we can't assign an ID that userspace can use for this shm object.

We could add new attribute types TEE_IOCTL_PARAM_ATTR_TYPE_MEMFD_*,
but it's a bit more complicated than that since we'd also need to
update for the life cycle.


> We can always find a reference back to tee_shm object from DMA
> buffer.

Yes

Cheers,
Jens

>
> -Sumit
>
> > diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
> > index 685afcaa3ea1..3a71643766d5 100644
> > --- a/drivers/tee/tee_core.c
> > +++ b/drivers/tee/tee_core.c
> > @@ -353,6 +353,103 @@ tee_ioctl_shm_register(struct tee_context *ctx,
> >       return ret;
> >  }
> >
> > +static int
> > +tee_ioctl_shm_register_fd(struct tee_context *ctx,
> > +                       struct tee_ioctl_shm_register_fd_data __user *u=
data)
> > +{
> > +     struct tee_ioctl_shm_register_fd_data data;
> > +     struct tee_shm *shm;
> > +     long ret;
> > +
> > +     if (copy_from_user(&data, udata, sizeof(data)))
> > +             return -EFAULT;
> > +
> > +     /* Currently no input flags are supported */
> > +     if (data.flags)
> > +             return -EINVAL;
> > +
> > +     shm =3D tee_shm_register_fd(ctx, data.fd);
> > +     if (IS_ERR(shm))
> > +             return -EINVAL;
> > +
> > +     data.id =3D shm->id;
> > +     data.flags =3D shm->flags;
> > +     data.size =3D shm->size;
> > +
> > +     if (copy_to_user(udata, &data, sizeof(data)))
> > +             ret =3D -EFAULT;
> > +     else
> > +             ret =3D tee_shm_get_fd(shm);
> > +
> > +     /*
> > +      * When user space closes the file descriptor the shared memory
> > +      * should be freed or if tee_shm_get_fd() failed then it will
> > +      * be freed immediately.
> > +      */
> > +     tee_shm_put(shm);
> > +     return ret;
> > +}
> > +
> > +static int param_from_user_memref(struct tee_context *ctx,
> > +                               struct tee_param_memref *memref,
> > +                               struct tee_ioctl_param *ip)
> > +{
> > +     struct tee_shm *shm;
> > +     size_t offs =3D 0;
> > +
> > +     /*
> > +      * If a NULL pointer is passed to a TA in the TEE,
> > +      * the ip.c IOCTL parameters is set to TEE_MEMREF_NULL
> > +      * indicating a NULL memory reference.
> > +      */
> > +     if (ip->c !=3D TEE_MEMREF_NULL) {
> > +             /*
> > +              * If we fail to get a pointer to a shared
> > +              * memory object (and increase the ref count)
> > +              * from an identifier we return an error. All
> > +              * pointers that has been added in params have
> > +              * an increased ref count. It's the callers
> > +              * responibility to do tee_shm_put() on all
> > +              * resolved pointers.
> > +              */
> > +             shm =3D tee_shm_get_from_id(ctx, ip->c);
> > +             if (IS_ERR(shm))
> > +                     return PTR_ERR(shm);
> > +
> > +             /*
> > +              * Ensure offset + size does not overflow
> > +              * offset and does not overflow the size of
> > +              * the referred shared memory object.
> > +              */
> > +             if ((ip->a + ip->b) < ip->a ||
> > +                 (ip->a + ip->b) > shm->size) {
> > +                     tee_shm_put(shm);
> > +                     return -EINVAL;
> > +             }
> > +
> > +             if (shm->flags & TEE_SHM_DMA_BUF) {
> > +                     struct tee_shm *parent_shm;
> > +
> > +                     parent_shm =3D tee_shm_get_parent_shm(shm, &offs)=
;
> > +                     if (parent_shm) {
> > +                             tee_shm_put(shm);
> > +                             shm =3D parent_shm;
> > +                     }
> > +             }
> > +     } else if (ctx->cap_memref_null) {
> > +             /* Pass NULL pointer to OP-TEE */
> > +             shm =3D NULL;
> > +     } else {
> > +             return -EINVAL;
> > +     }
> > +
> > +     memref->shm_offs =3D ip->a + offs;
> > +     memref->size =3D ip->b;
> > +     memref->shm =3D shm;
> > +
> > +     return 0;
> > +}
> > +
> >  static int params_from_user(struct tee_context *ctx, struct tee_param =
*params,
> >                           size_t num_params,
> >                           struct tee_ioctl_param __user *uparams)
> > @@ -360,8 +457,8 @@ static int params_from_user(struct tee_context *ctx=
, struct tee_param *params,
> >       size_t n;
> >
> >       for (n =3D 0; n < num_params; n++) {
> > -             struct tee_shm *shm;
> >               struct tee_ioctl_param ip;
> > +             int rc;
> >
> >               if (copy_from_user(&ip, uparams + n, sizeof(ip)))
> >                       return -EFAULT;
> > @@ -384,45 +481,10 @@ static int params_from_user(struct tee_context *c=
tx, struct tee_param *params,
> >               case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
> >               case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
> >               case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
> > -                     /*
> > -                      * If a NULL pointer is passed to a TA in the TEE=
,
> > -                      * the ip.c IOCTL parameters is set to TEE_MEMREF=
_NULL
> > -                      * indicating a NULL memory reference.
> > -                      */
> > -                     if (ip.c !=3D TEE_MEMREF_NULL) {
> > -                             /*
> > -                              * If we fail to get a pointer to a share=
d
> > -                              * memory object (and increase the ref co=
unt)
> > -                              * from an identifier we return an error.=
 All
> > -                              * pointers that has been added in params=
 have
> > -                              * an increased ref count. It's the calle=
rs
> > -                              * responibility to do tee_shm_put() on a=
ll
> > -                              * resolved pointers.
> > -                              */
> > -                             shm =3D tee_shm_get_from_id(ctx, ip.c);
> > -                             if (IS_ERR(shm))
> > -                                     return PTR_ERR(shm);
> > -
> > -                             /*
> > -                              * Ensure offset + size does not overflow
> > -                              * offset and does not overflow the size =
of
> > -                              * the referred shared memory object.
> > -                              */
> > -                             if ((ip.a + ip.b) < ip.a ||
> > -                                 (ip.a + ip.b) > shm->size) {
> > -                                     tee_shm_put(shm);
> > -                                     return -EINVAL;
> > -                             }
> > -                     } else if (ctx->cap_memref_null) {
> > -                             /* Pass NULL pointer to OP-TEE */
> > -                             shm =3D NULL;
> > -                     } else {
> > -                             return -EINVAL;
> > -                     }
> > -
> > -                     params[n].u.memref.shm_offs =3D ip.a;
> > -                     params[n].u.memref.size =3D ip.b;
> > -                     params[n].u.memref.shm =3D shm;
> > +                     rc =3D param_from_user_memref(ctx, &params[n].u.m=
emref,
> > +                                                 &ip);
> > +                     if (rc)
> > +                             return rc;
> >                       break;
> >               default:
> >                       /* Unknown attribute */
> > @@ -827,6 +889,8 @@ static long tee_ioctl(struct file *filp, unsigned i=
nt cmd, unsigned long arg)
> >               return tee_ioctl_shm_alloc(ctx, uarg);
> >       case TEE_IOC_SHM_REGISTER:
> >               return tee_ioctl_shm_register(ctx, uarg);
> > +     case TEE_IOC_SHM_REGISTER_FD:
> > +             return tee_ioctl_shm_register_fd(ctx, uarg);
> >       case TEE_IOC_OPEN_SESSION:
> >               return tee_ioctl_open_session(ctx, uarg);
> >       case TEE_IOC_INVOKE:
> > @@ -1288,3 +1352,4 @@ MODULE_AUTHOR("Linaro");
> >  MODULE_DESCRIPTION("TEE Driver");
> >  MODULE_VERSION("1.0");
> >  MODULE_LICENSE("GPL v2");
> > +MODULE_IMPORT_NS("DMA_BUF");
> > diff --git a/drivers/tee/tee_private.h b/drivers/tee/tee_private.h
> > index 6c6ff5d5eed2..aad7f6c7e0f0 100644
> > --- a/drivers/tee/tee_private.h
> > +++ b/drivers/tee/tee_private.h
> > @@ -24,6 +24,7 @@ void teedev_ctx_put(struct tee_context *ctx);
> >  struct tee_shm *tee_shm_alloc_user_buf(struct tee_context *ctx, size_t=
 size);
> >  struct tee_shm *tee_shm_register_user_buf(struct tee_context *ctx,
> >                                         unsigned long addr, size_t leng=
th);
> > +struct tee_shm *tee_shm_get_parent_shm(struct tee_shm *shm, size_t *of=
fs);
> >
> >  int tee_heap_update_from_dma_buf(struct tee_device *teedev,
> >                                struct dma_buf *dmabuf, size_t *offset,
> > diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
> > index daf6e5cfd59a..8b79918468b5 100644
> > --- a/drivers/tee/tee_shm.c
> > +++ b/drivers/tee/tee_shm.c
> > @@ -4,6 +4,7 @@
> >   */
> >  #include <linux/anon_inodes.h>
> >  #include <linux/device.h>
> > +#include <linux/dma-buf.h>
> >  #include <linux/idr.h>
> >  #include <linux/io.h>
> >  #include <linux/mm.h>
> > @@ -15,6 +16,16 @@
> >  #include <linux/highmem.h>
> >  #include "tee_private.h"
> >
> > +/* extra references appended to shm object for registered shared memor=
y */
> > +struct tee_shm_dmabuf_ref {
> > +     struct tee_shm shm;
> > +     size_t offset;
> > +     struct dma_buf *dmabuf;
> > +     struct dma_buf_attachment *attach;
> > +     struct sg_table *sgt;
> > +     struct tee_shm *parent_shm;
> > +};
> > +
> >  static void shm_put_kernel_pages(struct page **pages, size_t page_coun=
t)
> >  {
> >       size_t n;
> > @@ -45,7 +56,23 @@ static void release_registered_pages(struct tee_shm =
*shm)
> >
> >  static void tee_shm_release(struct tee_device *teedev, struct tee_shm =
*shm)
> >  {
> > -     if (shm->flags & TEE_SHM_POOL) {
> > +     struct tee_shm *parent_shm =3D NULL;
> > +     void *p =3D shm;
> > +
> > +     if (shm->flags & TEE_SHM_DMA_BUF) {
> > +             struct tee_shm_dmabuf_ref *ref;
> > +
> > +             ref =3D container_of(shm, struct tee_shm_dmabuf_ref, shm)=
;
> > +             parent_shm =3D ref->parent_shm;
> > +             p =3D ref;
> > +             if (ref->attach) {
> > +                     dma_buf_unmap_attachment(ref->attach, ref->sgt,
> > +                                              DMA_BIDIRECTIONAL);
> > +
> > +                     dma_buf_detach(ref->dmabuf, ref->attach);
> > +             }
> > +             dma_buf_put(ref->dmabuf);
> > +     } else if (shm->flags & TEE_SHM_POOL) {
> >               teedev->pool->ops->free(teedev->pool, shm);
> >       } else if (shm->flags & TEE_SHM_DYNAMIC) {
> >               int rc =3D teedev->desc->ops->shm_unregister(shm->ctx, sh=
m);
> > @@ -57,9 +84,10 @@ static void tee_shm_release(struct tee_device *teede=
v, struct tee_shm *shm)
> >               release_registered_pages(shm);
> >       }
> >
> > -     teedev_ctx_put(shm->ctx);
> > +     if (shm->ctx)
> > +             teedev_ctx_put(shm->ctx);
> >
> > -     kfree(shm);
> > +     kfree(p);
> >
> >       tee_device_put(teedev);
> >  }
> > @@ -169,7 +197,7 @@ struct tee_shm *tee_shm_alloc_user_buf(struct tee_c=
ontext *ctx, size_t size)
> >   * tee_client_invoke_func(). The memory allocated is later freed with =
a
> >   * call to tee_shm_free().
> >   *
> > - * @returns a pointer to 'struct tee_shm'
> > + * @returns a pointer to 'struct tee_shm' on success, and ERR_PTR on f=
ailure
> >   */
> >  struct tee_shm *tee_shm_alloc_kernel_buf(struct tee_context *ctx, size=
_t size)
> >  {
> > @@ -179,6 +207,116 @@ struct tee_shm *tee_shm_alloc_kernel_buf(struct t=
ee_context *ctx, size_t size)
> >  }
> >  EXPORT_SYMBOL_GPL(tee_shm_alloc_kernel_buf);
> >
> > +struct tee_shm *tee_shm_register_fd(struct tee_context *ctx, int fd)
> > +{
> > +     struct tee_shm_dmabuf_ref *ref;
> > +     int rc;
> > +
> > +     if (!tee_device_get(ctx->teedev))
> > +             return ERR_PTR(-EINVAL);
> > +
> > +     teedev_ctx_get(ctx);
> > +
> > +     ref =3D kzalloc(sizeof(*ref), GFP_KERNEL);
> > +     if (!ref) {
> > +             rc =3D -ENOMEM;
> > +             goto err_put_tee;
> > +     }
> > +
> > +     refcount_set(&ref->shm.refcount, 1);
> > +     ref->shm.ctx =3D ctx;
> > +     ref->shm.id =3D -1;
> > +     ref->shm.flags =3D TEE_SHM_DMA_BUF;
> > +
> > +     ref->dmabuf =3D dma_buf_get(fd);
> > +     if (IS_ERR(ref->dmabuf)) {
> > +             rc =3D PTR_ERR(ref->dmabuf);
> > +             goto err_kfree_ref;
> > +     }
> > +
> > +     rc =3D tee_heap_update_from_dma_buf(ctx->teedev, ref->dmabuf,
> > +                                       &ref->offset, &ref->shm,
> > +                                       &ref->parent_shm);
> > +     if (!rc)
> > +             goto out;
> > +     if (rc !=3D -EINVAL)
> > +             goto err_put_dmabuf;
> > +
> > +     ref->attach =3D dma_buf_attach(ref->dmabuf, &ctx->teedev->dev);
> > +     if (IS_ERR(ref->attach)) {
> > +             rc =3D PTR_ERR(ref->attach);
> > +             goto err_put_dmabuf;
> > +     }
> > +
> > +     ref->sgt =3D dma_buf_map_attachment(ref->attach, DMA_BIDIRECTIONA=
L);
> > +     if (IS_ERR(ref->sgt)) {
> > +             rc =3D PTR_ERR(ref->sgt);
> > +             goto err_detach;
> > +     }
> > +
> > +     if (sg_nents(ref->sgt->sgl) !=3D 1) {
> > +             rc =3D PTR_ERR(ref->sgt->sgl);
> > +             goto err_unmap_attachement;
> > +     }
> > +
> > +     ref->shm.paddr =3D page_to_phys(sg_page(ref->sgt->sgl));
> > +     ref->shm.size =3D ref->sgt->sgl->length;
> > +
> > +out:
> > +     mutex_lock(&ref->shm.ctx->teedev->mutex);
> > +     ref->shm.id =3D idr_alloc(&ref->shm.ctx->teedev->idr, &ref->shm,
> > +                             1, 0, GFP_KERNEL);
> > +     mutex_unlock(&ref->shm.ctx->teedev->mutex);
> > +     if (ref->shm.id < 0) {
> > +             rc =3D ref->shm.id;
> > +             if (ref->attach)
> > +                     goto err_unmap_attachement;
> > +             goto err_put_dmabuf;
> > +     }
> > +
> > +     return &ref->shm;
> > +
> > +err_unmap_attachement:
> > +     dma_buf_unmap_attachment(ref->attach, ref->sgt, DMA_BIDIRECTIONAL=
);
> > +err_detach:
> > +     dma_buf_detach(ref->dmabuf, ref->attach);
> > +err_put_dmabuf:
> > +     dma_buf_put(ref->dmabuf);
> > +err_kfree_ref:
> > +     kfree(ref);
> > +err_put_tee:
> > +     teedev_ctx_put(ctx);
> > +     tee_device_put(ctx->teedev);
> > +
> > +     return ERR_PTR(rc);
> > +}
> > +EXPORT_SYMBOL_GPL(tee_shm_register_fd);
> > +
> > +struct tee_shm *tee_shm_get_parent_shm(struct tee_shm *shm, size_t *of=
fs)
> > +{
> > +     struct tee_shm *parent_shm =3D NULL;
> > +
> > +     if (shm->flags & TEE_SHM_DMA_BUF) {
> > +             struct tee_shm_dmabuf_ref *ref;
> > +
> > +             ref =3D container_of(shm, struct tee_shm_dmabuf_ref, shm)=
;
> > +             if (ref->parent_shm) {
> > +                     /*
> > +                      * the shm already has one reference to
> > +                      * ref->parent_shm so we should be clear of 0.
> > +                      * We're getting another reference since the call=
er
> > +                      * of this function expects to put the returned
> > +                      * parent_shm when it's done with it.
> > +                      */
> > +                     parent_shm =3D ref->parent_shm;
> > +                     refcount_inc(&parent_shm->refcount);
> > +                     *offs =3D ref->offset;
> > +             }
> > +     }
> > +
> > +     return parent_shm;
> > +}
> > +
> >  /**
> >   * tee_shm_alloc_priv_buf() - Allocate shared memory for a privately s=
hared
> >   *                         kernel buffer
> > diff --git a/include/linux/tee_core.h b/include/linux/tee_core.h
> > index 16ef078247ae..6bd833b6d0e1 100644
> > --- a/include/linux/tee_core.h
> > +++ b/include/linux/tee_core.h
> > @@ -28,6 +28,7 @@
> >  #define TEE_SHM_USER_MAPPED  BIT(1)  /* Memory mapped in user space */
> >  #define TEE_SHM_POOL         BIT(2)  /* Memory allocated from pool */
> >  #define TEE_SHM_PRIV         BIT(3)  /* Memory private to TEE driver *=
/
> > +#define TEE_SHM_DMA_BUF              BIT(4)  /* Memory with dma-buf ha=
ndle */
> >
> >  #define TEE_DEVICE_FLAG_REGISTERED   0x1
> >  #define TEE_MAX_DEV_NAME_LEN         32
> > diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
> > index a54c203000ed..824f1251de60 100644
> > --- a/include/linux/tee_drv.h
> > +++ b/include/linux/tee_drv.h
> > @@ -116,6 +116,16 @@ struct tee_shm *tee_shm_alloc_kernel_buf(struct te=
e_context *ctx, size_t size);
> >  struct tee_shm *tee_shm_register_kernel_buf(struct tee_context *ctx,
> >                                           void *addr, size_t length);
> >
> > +/**
> > + * tee_shm_register_fd() - Register shared memory from file descriptor
> > + *
> > + * @ctx:     Context that allocates the shared memory
> > + * @fd:              Shared memory file descriptor reference
> > + *
> > + * @returns a pointer to 'struct tee_shm' on success, and ERR_PTR on f=
ailure
> > + */
> > +struct tee_shm *tee_shm_register_fd(struct tee_context *ctx, int fd);
> > +
> >  /**
> >   * tee_shm_free() - Free shared memory
> >   * @shm:     Handle to shared memory to free
> > diff --git a/include/uapi/linux/tee.h b/include/uapi/linux/tee.h
> > index d0430bee8292..1f9a4ac2b211 100644
> > --- a/include/uapi/linux/tee.h
> > +++ b/include/uapi/linux/tee.h
> > @@ -118,6 +118,35 @@ struct tee_ioctl_shm_alloc_data {
> >  #define TEE_IOC_SHM_ALLOC    _IOWR(TEE_IOC_MAGIC, TEE_IOC_BASE + 1, \
> >                                    struct tee_ioctl_shm_alloc_data)
> >
> > +/**
> > + * struct tee_ioctl_shm_register_fd_data - Shared memory registering a=
rgument
> > + * @fd:              [in] File descriptor identifying the shared memor=
y
> > + * @size:    [out] Size of shared memory to allocate
> > + * @flags:   [in] Flags to/from allocation.
> > + * @id:              [out] Identifier of the shared memory
> > + *
> > + * The flags field should currently be zero as input. Updated by the c=
all
> > + * with actual flags as defined by TEE_IOCTL_SHM_* above.
> > + * This structure is used as argument for TEE_IOC_SHM_REGISTER_FD belo=
w.
> > + */
> > +struct tee_ioctl_shm_register_fd_data {
> > +     __s64 fd;
> > +     __u64 size;
> > +     __u32 flags;
> > +     __s32 id;
> > +};
> > +
> > +/**
> > + * TEE_IOC_SHM_REGISTER_FD - register a shared memory from a file desc=
riptor
> > + *
> > + * Returns a file descriptor on success or < 0 on failure
> > + *
> > + * The returned file descriptor refers to the shared memory object in =
kernel
> > + * land. The shared memory is freed when the descriptor is closed.
> > + */
> > +#define TEE_IOC_SHM_REGISTER_FD      _IOWR(TEE_IOC_MAGIC, TEE_IOC_BASE=
 + 8, \
> > +                                  struct tee_ioctl_shm_register_fd_dat=
a)
> > +
> >  /**
> >   * struct tee_ioctl_buf_data - Variable sized buffer
> >   * @buf_ptr: [in] A __user pointer to a buffer
> > --
> > 2.43.0
> >

