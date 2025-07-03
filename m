Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1757C83030
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 07:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ucwgu55QGLZ6hKl5fIjEVIf2VgExDUhP4Eva3MdE09o=; b=rd9KXuToT5068gpjLzRNvqVxCX
	Ra2PNNxilZW7n8pBsvjAHl+szK8qZROcNJicjKTRHq8xpzX9Tk0QjqH4ZEXZZgw1ae6tJ3kxlt3en
	zs6XSmjzrJjrKpMGYSc69Y0CBspUY+gxhEpA94OQ2UYucjKLU8QmOZysDD8ZTyXm5hQ52GiboacWS
	nNsvgVum41xkNFYOXN8JVFxEeL5xXVDztz0doxJMCD3RGuhXADiSJ5pvw9XyZyk/BjK+2yd2h881r
	OLfo+vo3tEdHWN/vmTZo0RNgTPDQFe5YFL+U5zrpW99YZFOVMYlMHOXVkOvyZh7FJuwP412lPPv67
	k693fO3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXEW8-0000000AWxd-3nqf;
	Thu, 03 Jul 2025 07:38:00 +0000
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXESq-0000000AWbd-3lXp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 07:34:38 +0000
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-60bd30dd387so2458306eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 00:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751528076; x=1752132876; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ucwgu55QGLZ6hKl5fIjEVIf2VgExDUhP4Eva3MdE09o=;
        b=W/6/xarR99SE8CTh9lcuKLk9yCgKEwt7xfvSm+Y1gaJIfnZB0kppZg1nUIjW6l0y7Q
         7uGhYADsAJgeMMuS09DO0na74LO7DIWO/7Q5rEtrXAEhfWNzJH7MAHwlfdJ0TQ/ZURRC
         ayYxLlUIPfn7M1H+0wLl5fjV/36/PsgbkrFMtqj4kMRMiZFVtoUf3FFFi8RduEp1CAyw
         jKGAkGNOHEaJPPq2X0PESkvtYmYyxCbwDN1fWCWfLs6P4syaC9u/GYhuA4APYjHSFZWY
         dpkGkmLbuQdxnUMEyVjJWs0GsfXVAw33MAOC1j4Ooouaq94VjBVUQBOfy7UlGQ7lQZhN
         9/tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751528076; x=1752132876;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ucwgu55QGLZ6hKl5fIjEVIf2VgExDUhP4Eva3MdE09o=;
        b=SsDwMiiXHs1OJ51qRNi4d3Bg2dcnM45ne0yDBh//eADOxtG2hwr4EK9w+F6cUxPz0p
         XZ7c3ubsEwsm3GWn8fydJxaLG+lcWMpSM7Te7klmCnG6xb3VqBI1vmm6HD4ycTsSsBN9
         XnmlilRzlHY2zrud8ljkos6wuyNrnEDtrfAcu7KEFY4jw+ZTOWk0TNCwCg1iQGE7IVEo
         coZAKE2lA94n///q6AFoUwXP8W+jCdcuw7v3yJNeWKgzEZSCue6aeIus9Uh7YBwSN7Uu
         hz6IIQgUY3dXv6EyIeYagauopd25Ai94a9izG8rkQ6HTlfK2IE5QfSncPsG+45qI/o12
         WHsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfGxW34k6KWBR+dUUJ3aSQdm6toW3jbWijXRXEspN18Tvtul18Am4jpmoJmFfL4wFJeYLWk60ip3uRqPubizbK@lists.infradead.org
X-Gm-Message-State: AOJu0YxTCZ3ordx6anoHXpHxMGc/SQeGtHYRWQq8LE+67OSmAKsQ3XQp
	EYiLWKZOwjaOhL8Zsy6kq+p5RJ5efpGLTLYhHQN/txYW5CAHKb10UOa2M1dLhFLQyH+VAUd8rgx
	dR+Gz6GrBlvsUykEE1F0W3DvOnqfNxGVolIw7Xn6r7A==
X-Gm-Gg: ASbGncvB3mnuuyzl2r+e3PkCjY1Mvx3wLVW2SAs2gQnui3y2TesPWRWm9x7mwdIEaZm
	1yHRoqfFD+2+SUDB3x4quV74EHSzE4HoA+6bprFEH1SE+wFHfeCAnY1VZKlfjd/Yl/fRv+eEszs
	BTMMirwMFtvBAeWRaifMPLWmCitFNQNzwlPTsKYNCZwMWcQnmegOCAYEA=
X-Google-Smtp-Source: AGHT+IE2ZCgEGfIrkt7r8PkQR4GYt2/+0nWaE1h81qsvFYGMyeA6O+J7BQ0LSF7nIASwgancQR+BLSMFyRPODkVcX8w=
X-Received: by 2002:a05:6808:6807:b0:401:ea47:2c4a with SMTP id
 5614622812f47-40bfde8fceemr1714371b6e.28.1751528075683; Thu, 03 Jul 2025
 00:34:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250610131600.2972232-1-jens.wiklander@linaro.org>
 <20250610131600.2972232-6-jens.wiklander@linaro.org> <aFFIAiU4ZSN1qZXK@sumit-X1>
 <CAHUa44E=nHjLf2guoG6LzTKZwTQGjEReKUF01PL31BfJ22e9EQ@mail.gmail.com> <aGYvwHK2RgIERf_G@sumit-X1>
In-Reply-To: <aGYvwHK2RgIERf_G@sumit-X1>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 3 Jul 2025 09:34:24 +0200
X-Gm-Features: Ac12FXysgTs18zKxnvVCeJnCnf6cHXqQyT2On4ibbHZ0I00ukY1448sMc9nC_hU
Message-ID: <CAHUa44EtthC+f5nvNOP_JEcDrAmBUVyQb0amjMnAYQO_jG2C9Q@mail.gmail.com>
Subject: Re: [PATCH v10 5/9] tee: new ioctl to a register tee_shm from a
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
	Rouven Czerwinski <rouven.czerwinski@linaro.org>, robin.murphy@arm.com, 
	Etienne Carriere <etienne.carriere@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_003436_947001_44D032BF 
X-CRM114-Status: GOOD (  39.62  )
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

On Thu, Jul 3, 2025 at 9:22=E2=80=AFAM Sumit Garg <sumit.garg@kernel.org> w=
rote:
>
> On Wed, Jun 18, 2025 at 08:47:51AM +0200, Jens Wiklander wrote:
> > On Tue, Jun 17, 2025 at 12:48=E2=80=AFPM Sumit Garg <sumit.garg@kernel.=
org> wrote:
> > >
> > > On Tue, Jun 10, 2025 at 03:13:49PM +0200, Jens Wiklander wrote:
> > > > From: Etienne Carriere <etienne.carriere@foss.st.com>
> > > >
> > > > Add a userspace API to create a tee_shm object that refers to a dma=
buf
> > > > reference.
> > > >
> > > > Userspace registers the dmabuf file descriptor as in a tee_shm obje=
ct.
> > > > The registration is completed with a tee_shm returned file descript=
or.
> > > >
> > > > Userspace is free to close the dmabuf file descriptor after it has =
been
> > > > registered since all the resources are now held via the new tee_shm
> > > > object.
> > > >
> > > > Closing the tee_shm file descriptor will eventually release all
> > > > resources used by the tee_shm object when all references are releas=
ed.
> > > >
> > > > The new IOCTL, TEE_IOC_SHM_REGISTER_FD, supports dmabuf references =
to
> > > > physically contiguous memory buffers. Dmabuf references acquired fr=
om
> > > > the TEE DMA-heap can be used as protected memory for Secure Video P=
ath
> > > > and such use cases. It depends on the TEE and the TEE driver if dma=
buf
> > > > references acquired by other means can be used.
> > > >
> > > > A new tee_shm flag is added to identify tee_shm objects built from =
a
> > > > registered dmabuf, TEE_SHM_DMA_BUF.
> > > >
> > > > Signed-off-by: Etienne Carriere <etienne.carriere@foss.st.com>
> > > > Signed-off-by: Olivier Masse <olivier.masse@nxp.com>
> > > > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > > > ---
> > > >  drivers/tee/tee_core.c    |  63 +++++++++++++++++++++-
> > > >  drivers/tee/tee_private.h |  10 ++++
> > > >  drivers/tee/tee_shm.c     | 106 ++++++++++++++++++++++++++++++++++=
++--
> > > >  include/linux/tee_core.h  |   1 +
> > > >  include/linux/tee_drv.h   |  10 ++++
> > > >  include/uapi/linux/tee.h  |  31 +++++++++++
> > > >  6 files changed, 217 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
> > > > index 5259b8223c27..0e9d9e5872a4 100644
> > > > --- a/drivers/tee/tee_core.c
> > > > +++ b/drivers/tee/tee_core.c
> > > > @@ -353,11 +353,49 @@ tee_ioctl_shm_register(struct tee_context *ct=
x,
> > > >       return ret;
> > > >  }
> > > >
> > > > +static int
> > > > +tee_ioctl_shm_register_fd(struct tee_context *ctx,
> > > > +                       struct tee_ioctl_shm_register_fd_data __use=
r *udata)
> > > > +{
> > > > +     struct tee_ioctl_shm_register_fd_data data;
> > > > +     struct tee_shm *shm;
> > > > +     long ret;
> > > > +
> > > > +     if (copy_from_user(&data, udata, sizeof(data)))
> > > > +             return -EFAULT;
> > > > +
> > > > +     /* Currently no input flags are supported */
> > > > +     if (data.flags)
> > > > +             return -EINVAL;
> > > > +
> > > > +     shm =3D tee_shm_register_fd(ctx, data.fd);
> > > > +     if (IS_ERR(shm))
> > > > +             return -EINVAL;
> > > > +
> > > > +     data.id =3D shm->id;
> > > > +     data.flags =3D shm->flags;
> > > > +     data.size =3D shm->size;
> > > > +
> > > > +     if (copy_to_user(udata, &data, sizeof(data)))
> > > > +             ret =3D -EFAULT;
> > > > +     else
> > > > +             ret =3D tee_shm_get_fd(shm);
> > > > +
> > > > +     /*
> > > > +      * When user space closes the file descriptor the shared memo=
ry
> > > > +      * should be freed or if tee_shm_get_fd() failed then it will
> > > > +      * be freed immediately.
> > > > +      */
> > > > +     tee_shm_put(shm);
> > > > +     return ret;
> > > > +}
> > > > +
> > > >  static int param_from_user_memref(struct tee_context *ctx,
> > > >                                 struct tee_param_memref *memref,
> > > >                                 struct tee_ioctl_param *ip)
> > > >  {
> > > >       struct tee_shm *shm;
> > > > +     size_t offs =3D 0;
> > > >
> > > >       /*
> > > >        * If a NULL pointer is passed to a TA in the TEE,
> > > > @@ -388,6 +426,26 @@ static int param_from_user_memref(struct tee_c=
ontext *ctx,
> > > >                       tee_shm_put(shm);
> > > >                       return -EINVAL;
> > > >               }
> > > > +
> > > > +             if (shm->flags & TEE_SHM_DMA_BUF) {
> > > > +                     struct tee_shm_dmabuf_ref *ref;
> > > > +
> > > > +                     ref =3D container_of(shm, struct tee_shm_dmab=
uf_ref, shm);
> > > > +                     if (ref->parent_shm) {
> > > > +                             /*
> > > > +                              * The shm already has one reference =
to
> > > > +                              * ref->parent_shm so we are clear of=
 0.
> > > > +                              * We're getting another reference si=
nce
> > > > +                              * this shm will be used in the param=
eter
> > > > +                              * list instead of the shm we got wit=
h
> > > > +                              * tee_shm_get_from_id() above.
> > > > +                              */
> > > > +                             refcount_inc(&ref->parent_shm->refcou=
nt);
> > > > +                             tee_shm_put(shm);
> > > > +                             shm =3D ref->parent_shm;
> > > > +                             offs =3D ref->offset;
> > > > +                     }
> > > > +             }
> > > >       } else if (ctx->cap_memref_null) {
> > > >               /* Pass NULL pointer to OP-TEE */
> > > >               shm =3D NULL;
> > > > @@ -395,7 +453,7 @@ static int param_from_user_memref(struct tee_co=
ntext *ctx,
> > > >               return -EINVAL;
> > > >       }
> > > >
> > > > -     memref->shm_offs =3D ip->a;
> > > > +     memref->shm_offs =3D ip->a + offs;
> > > >       memref->size =3D ip->b;
> > > >       memref->shm =3D shm;
> > > >
> > > > @@ -841,6 +899,8 @@ static long tee_ioctl(struct file *filp, unsign=
ed int cmd, unsigned long arg)
> > > >               return tee_ioctl_shm_alloc(ctx, uarg);
> > > >       case TEE_IOC_SHM_REGISTER:
> > > >               return tee_ioctl_shm_register(ctx, uarg);
> > > > +     case TEE_IOC_SHM_REGISTER_FD:
> > > > +             return tee_ioctl_shm_register_fd(ctx, uarg);
> > > >       case TEE_IOC_OPEN_SESSION:
> > > >               return tee_ioctl_open_session(ctx, uarg);
> > > >       case TEE_IOC_INVOKE:
> > > > @@ -1300,3 +1360,4 @@ MODULE_AUTHOR("Linaro");
> > > >  MODULE_DESCRIPTION("TEE Driver");
> > > >  MODULE_VERSION("1.0");
> > > >  MODULE_LICENSE("GPL v2");
> > > > +MODULE_IMPORT_NS("DMA_BUF");
> > > > diff --git a/drivers/tee/tee_private.h b/drivers/tee/tee_private.h
> > > > index 6c6ff5d5eed2..308467705da6 100644
> > > > --- a/drivers/tee/tee_private.h
> > > > +++ b/drivers/tee/tee_private.h
> > > > @@ -13,6 +13,16 @@
> > > >  #include <linux/mutex.h>
> > > >  #include <linux/types.h>
> > > >
> > > > +/* extra references appended to shm object for registered shared m=
emory */
> > > > +struct tee_shm_dmabuf_ref {
> > > > +     struct tee_shm shm;
> > > > +     size_t offset;
> > > > +     struct dma_buf *dmabuf;
> > > > +     struct dma_buf_attachment *attach;
> > > > +     struct sg_table *sgt;
> > > > +     struct tee_shm *parent_shm;
> > > > +};
> > > > +
> > > >  int tee_shm_get_fd(struct tee_shm *shm);
> > > >
> > > >  bool tee_device_get(struct tee_device *teedev);
> > > > diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
> > > > index daf6e5cfd59a..e63095e84644 100644
> > > > --- a/drivers/tee/tee_shm.c
> > > > +++ b/drivers/tee/tee_shm.c
> > > > @@ -4,6 +4,7 @@
> > > >   */
> > > >  #include <linux/anon_inodes.h>
> > > >  #include <linux/device.h>
> > > > +#include <linux/dma-buf.h>
> > > >  #include <linux/idr.h>
> > > >  #include <linux/io.h>
> > > >  #include <linux/mm.h>
> > > > @@ -45,7 +46,21 @@ static void release_registered_pages(struct tee_=
shm *shm)
> > > >
> > > >  static void tee_shm_release(struct tee_device *teedev, struct tee_=
shm *shm)
> > > >  {
> > > > -     if (shm->flags & TEE_SHM_POOL) {
> > > > +     void *p =3D shm;
> > > > +
> > > > +     if (shm->flags & TEE_SHM_DMA_BUF) {
> > > > +             struct tee_shm_dmabuf_ref *ref;
> > > > +
> > > > +             ref =3D container_of(shm, struct tee_shm_dmabuf_ref, =
shm);
> > > > +             p =3D ref;
> > > > +             if (ref->attach) {
> > > > +                     dma_buf_unmap_attachment(ref->attach, ref->sg=
t,
> > > > +                                              DMA_BIDIRECTIONAL);
> > > > +
> > > > +                     dma_buf_detach(ref->dmabuf, ref->attach);
> > > > +             }
> > > > +             dma_buf_put(ref->dmabuf);
> > > > +     } else if (shm->flags & TEE_SHM_POOL) {
> > > >               teedev->pool->ops->free(teedev->pool, shm);
> > > >       } else if (shm->flags & TEE_SHM_DYNAMIC) {
> > > >               int rc =3D teedev->desc->ops->shm_unregister(shm->ctx=
, shm);
> > > > @@ -59,7 +74,7 @@ static void tee_shm_release(struct tee_device *te=
edev, struct tee_shm *shm)
> > > >
> > > >       teedev_ctx_put(shm->ctx);
> > > >
> > > > -     kfree(shm);
> > > > +     kfree(p);
> > > >
> > > >       tee_device_put(teedev);
> > > >  }
> > > > @@ -169,7 +184,7 @@ struct tee_shm *tee_shm_alloc_user_buf(struct t=
ee_context *ctx, size_t size)
> > > >   * tee_client_invoke_func(). The memory allocated is later freed w=
ith a
> > > >   * call to tee_shm_free().
> > > >   *
> > > > - * @returns a pointer to 'struct tee_shm'
> > > > + * @returns a pointer to 'struct tee_shm' on success, and ERR_PTR =
on failure
> > > >   */
> > > >  struct tee_shm *tee_shm_alloc_kernel_buf(struct tee_context *ctx, =
size_t size)
> > > >  {
> > > > @@ -179,6 +194,91 @@ struct tee_shm *tee_shm_alloc_kernel_buf(struc=
t tee_context *ctx, size_t size)
> > > >  }
> > > >  EXPORT_SYMBOL_GPL(tee_shm_alloc_kernel_buf);
> > > >
> > > > +struct tee_shm *tee_shm_register_fd(struct tee_context *ctx, int f=
d)
> > > > +{
> > > > +     struct tee_shm_dmabuf_ref *ref;
> > > > +     int rc;
> > > > +
> > > > +     if (!tee_device_get(ctx->teedev))
> > > > +             return ERR_PTR(-EINVAL);
> > > > +
> > > > +     teedev_ctx_get(ctx);
> > > > +
> > > > +     ref =3D kzalloc(sizeof(*ref), GFP_KERNEL);
> > > > +     if (!ref) {
> > > > +             rc =3D -ENOMEM;
> > > > +             goto err_put_tee;
> > > > +     }
> > > > +
> > > > +     refcount_set(&ref->shm.refcount, 1);
> > > > +     ref->shm.ctx =3D ctx;
> > > > +     ref->shm.id =3D -1;
> > > > +     ref->shm.flags =3D TEE_SHM_DMA_BUF;
> > > > +
> > > > +     ref->dmabuf =3D dma_buf_get(fd);
> > > > +     if (IS_ERR(ref->dmabuf)) {
> > > > +             rc =3D PTR_ERR(ref->dmabuf);
> > > > +             goto err_kfree_ref;
> > > > +     }
> > > > +
> > > > +     rc =3D tee_heap_update_from_dma_buf(ctx->teedev, ref->dmabuf,
> > > > +                                       &ref->offset, &ref->shm,
> > > > +                                       &ref->parent_shm);
> > > > +     if (!rc)
> > > > +             goto out;
> > >
> > > One odd thing I find here, why do we bail out on success case here?
> > > Don't we need the DMA buffer attach and map APIs to be invoked on
> > > success case here?
> >
> > No, because if tee_heap_update_from_dma_buf() succeeds, we know
> > everything we need about the buffer. Note that we're returning a valid
> > pointer below to indicate success.
>
> AFAICS, protmem_pool_op_dyn_update_shm() and
> protmem_pool_op_static_update_shm() both return 0 on success case...
>
> > >
> > > > +     if (rc !=3D -EINVAL)
> > > > +             goto err_put_dmabuf;
>
> ...and with this check the below code path is only executed when rc =3D=
=3D
> -EINVAL, is that expected behaviour? Shouldn't we error out when -EINVAL
> is returned?
>
> > > > +
> > > > +     ref->attach =3D dma_buf_attach(ref->dmabuf, &ctx->teedev->dev=
);
> > > > +     if (IS_ERR(ref->attach)) {
> > > > +             rc =3D PTR_ERR(ref->attach);
> > > > +             goto err_put_dmabuf;
> > > > +     }
> > > > +
> > > > +     ref->sgt =3D dma_buf_map_attachment(ref->attach, DMA_BIDIRECT=
IONAL);
> > > > +     if (IS_ERR(ref->sgt)) {
> > > > +             rc =3D PTR_ERR(ref->sgt);
> > > > +             goto err_detach;
> > > > +     }
>
> Given above, have we really tested this code leg?

I haven't tested it in this version of the patchset, but the code path
has been used in the earliest version of the patchset.

The idea was to support DMA-bufs allocated by other means, but it's
not needed in this patchset, so let's remove it.

Cheers,
Jens

>
> -Sumit
>
> > > > +
> > > > +     if (sg_nents(ref->sgt->sgl) !=3D 1) {
> > > > +             rc =3D -EINVAL;
> > > > +             goto err_unmap_attachement;
> > > > +     }
> > > > +
> > > > +     ref->shm.paddr =3D page_to_phys(sg_page(ref->sgt->sgl));
> > > > +     ref->shm.size =3D ref->sgt->sgl->length;
> > > > +
> > > > +out:
> > > > +     mutex_lock(&ref->shm.ctx->teedev->mutex);
> > > > +     ref->shm.id =3D idr_alloc(&ref->shm.ctx->teedev->idr, &ref->s=
hm,
> > > > +                             1, 0, GFP_KERNEL);
> > > > +     mutex_unlock(&ref->shm.ctx->teedev->mutex);
> > > > +     if (ref->shm.id < 0) {
> > > > +             rc =3D ref->shm.id;
> > > > +             if (ref->attach)
> > > > +                     goto err_unmap_attachement;
> > > > +             goto err_put_dmabuf;
> > > > +     }
> > > > +
> > > > +     return &ref->shm;
> > > > +
> > > > +err_unmap_attachement:
> > > > +     dma_buf_unmap_attachment(ref->attach, ref->sgt, DMA_BIDIRECTI=
ONAL);
> > > > +err_detach:
> > > > +     dma_buf_detach(ref->dmabuf, ref->attach);
> > > > +err_put_dmabuf:
> > > > +     dma_buf_put(ref->dmabuf);
> > > > +err_kfree_ref:
> > > > +     kfree(ref);
> > > > +err_put_tee:
> > > > +     teedev_ctx_put(ctx);
> > > > +     tee_device_put(ctx->teedev);
> > > > +
> > > > +     return ERR_PTR(rc);
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(tee_shm_register_fd);
> > > > +
> > > >  /**
> > > >   * tee_shm_alloc_priv_buf() - Allocate shared memory for a private=
ly shared
> > > >   *                         kernel buffer
> > > > diff --git a/include/linux/tee_core.h b/include/linux/tee_core.h
> > > > index 22e03d897dc3..f17710196c4c 100644
> > > > --- a/include/linux/tee_core.h
> > > > +++ b/include/linux/tee_core.h
> > > > @@ -28,6 +28,7 @@
> > > >  #define TEE_SHM_USER_MAPPED  BIT(1)  /* Memory mapped in user spac=
e */
> > > >  #define TEE_SHM_POOL         BIT(2)  /* Memory allocated from pool=
 */
> > > >  #define TEE_SHM_PRIV         BIT(3)  /* Memory private to TEE driv=
er */
> > > > +#define TEE_SHM_DMA_BUF              BIT(4)  /* Memory with dma-bu=
f handle */
> > > >
> > > >  #define TEE_DEVICE_FLAG_REGISTERED   0x1
> > > >  #define TEE_MAX_DEV_NAME_LEN         32
> > > > diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
> > > > index a54c203000ed..824f1251de60 100644
> > > > --- a/include/linux/tee_drv.h
> > > > +++ b/include/linux/tee_drv.h
> > > > @@ -116,6 +116,16 @@ struct tee_shm *tee_shm_alloc_kernel_buf(struc=
t tee_context *ctx, size_t size);
> > > >  struct tee_shm *tee_shm_register_kernel_buf(struct tee_context *ct=
x,
> > > >                                           void *addr, size_t length=
);
> > > >
> > > > +/**
> > > > + * tee_shm_register_fd() - Register shared memory from file descri=
ptor
> > > > + *
> > > > + * @ctx:     Context that allocates the shared memory
> > > > + * @fd:              Shared memory file descriptor reference
> > > > + *
> > > > + * @returns a pointer to 'struct tee_shm' on success, and ERR_PTR =
on failure
> > > > + */
> > > > +struct tee_shm *tee_shm_register_fd(struct tee_context *ctx, int f=
d);
> > > > +
> > > >  /**
> > > >   * tee_shm_free() - Free shared memory
> > > >   * @shm:     Handle to shared memory to free
> > > > diff --git a/include/uapi/linux/tee.h b/include/uapi/linux/tee.h
> > > > index d0430bee8292..d843cf980d98 100644
> > > > --- a/include/uapi/linux/tee.h
> > > > +++ b/include/uapi/linux/tee.h
> > > > @@ -378,6 +378,37 @@ struct tee_ioctl_shm_register_data {
> > > >       __s32 id;
> > > >  };
> > > >
> > > > +/**
> > > > + * struct tee_ioctl_shm_register_fd_data - Shared memory registeri=
ng argument
> > > > + * @fd:              [in] File descriptor identifying dmabuf refer=
ence
> > > > + * @size:    [out] Size of referenced memory
> > > > + * @flags:   [in] Flags to/from allocation.
> > > > + * @id:              [out] Identifier of the shared memory
> > > > + *
> > > > + * The flags field should currently be zero as input. Updated by t=
he call
> > > > + * with actual flags as defined by TEE_IOCTL_SHM_* above.
> > > > + * This structure is used as argument for TEE_IOC_SHM_REGISTER_FD =
below.
> > > > + */
> > > > +struct tee_ioctl_shm_register_fd_data {
> > > > +     __s64 fd;
> > > > +     __u64 size;
> > > > +     __u32 flags;
> > > > +     __s32 id;
> > > > +};
> > > > +
> > > > +/**
> > > > + * TEE_IOC_SHM_REGISTER_FD - register a shared memory from a file =
descriptor
> > > > + *
> > > > + * Returns a file descriptor on success or < 0 on failure
> > > > + *
> > > > + * The returned file descriptor refers to the shared memory object=
 in the
> > > > + * kernel. The supplied file deccriptor can be closed if it's not =
needed
> > > > + * for other purposes. The shared memory is freed when the descrip=
tor is
> > > > + * closed.
> > > > + */
> > > > +#define TEE_IOC_SHM_REGISTER_FD      _IOWR(TEE_IOC_MAGIC, TEE_IOC_=
BASE + 8, \
> > > > +                                  struct tee_ioctl_shm_register_fd=
_data)
> > > > +
> > > >  /**
> > > >   * TEE_IOC_SHM_REGISTER - Register shared memory argument
> > > >   *
> > > > --
> > > > 2.43.0
> > > >

