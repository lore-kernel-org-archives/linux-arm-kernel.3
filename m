Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CBD4C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 15:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4HvNpqBKFOVDi+Mx9KGaepBPynHnQJMRXklI5JhKtbg=; b=Mke06a8BQLozUU71RKzzlSTFL1
	c+vMurmNVPJfKnlImdIe623eecMkVXEliO7fy74nV76aNe3V1ZZqXFDqkRgq+VrgV0WmqHHzH2zRT
	lU+Uv3F/rL5TNyEnSQy03tm8HI5b4dM1OeHUVs93FR6TgraRDKVUbp+n0h9IA53D/405fUfWeX7P/
	Q0kGZ9eAQYTSu0ax/Gfn3SimKfQuzfEUPqMvc3qU9PLS6F5hxPPyOJvx/s+4dUYjgatsPd8ZokXUA
	9ggv0oMPDo+Kwg8oirJk7sYAHpczduAmytGPfMFeIbhBGzY+zU+XujbjHwNQlCp9GgGtzMr0farAc
	SN5Lu6Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJvw2-0000000B15a-35ch;
	Tue, 27 May 2025 15:09:46 +0000
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJvtt-0000000B0wI-1Lay
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 15:07:35 +0000
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-606648c3f9eso749792eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 May 2025 08:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748358452; x=1748963252; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4HvNpqBKFOVDi+Mx9KGaepBPynHnQJMRXklI5JhKtbg=;
        b=oj8Xy8AFkh2YQrHcPSIBDNuhJ3ba4VJ3r+yWoTTEoBmV5Ra3JyjvXMlHBEqBIGk0ah
         L+1ADAuDrfZf69giG5tJKKewoacA3+vORzAophy4SrbfaYRn5sCkY+84U8PBMANejGpr
         JrsUx5VuxTCZzyWz4sYZkgokTSUjpH/4Y6oBnj57GWvV+LZH8l03nYK6PYtYQ6dDDb4+
         A4sEe6hHIFpsexdPFrtGH5kjYaMZe0zOD7geRzVkvtcHdO8MK/5ICjJFPXP4NxgQ9B1a
         6ytlgrVOGZisisfLBOhG11TS6m8R3L/h/0sLY4A+/6tgEsH8oKg9nUcqpYWv6zjjA4l9
         ehXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748358452; x=1748963252;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4HvNpqBKFOVDi+Mx9KGaepBPynHnQJMRXklI5JhKtbg=;
        b=pGgqCmGhx5r6qbJ+e3Czwp/XwMfbIm11wn97/hYNIiaC0SaCuuIzLLMub0f4enQB0I
         q08R0AO5GupChdXC8SrKIZOHhS9RjAL/gx5jsAmC8yqIgZV8R3O/8lciYWI7wKGpgpQa
         v/Fk0dHTZZAWTzVMlkIHdQeMKFyNPz7w1QiPA2WUr1AfioHO+voXghsGHfol65uQSt1V
         6mSdkvAXwuIRVi09mcPmzZMgJrUNqG9y90dO0g0XrxUx6NSro+/2VeiKhXnesy+n5VAC
         YjfyqhhrMQ+/7Em+CVJa450VH6bkW1PIGiS6RgFKWT9C7mo9+C+Dypkh1p5fezb1L0kt
         FhaA==
X-Forwarded-Encrypted: i=1; AJvYcCWSiycry0uAiYEBGm9t2v6nPNYBmj2cn6eAmnPibYVGLee+bqZcSnR15wpx0DH1wumLKugp2yLRpTDsdpc46f2/@lists.infradead.org
X-Gm-Message-State: AOJu0YwgHblI1jepjEqusqmSnezgQfMZD48JLwij5/A5q7wQTI4l6Ble
	dR13rZPEvVlGKozTcBUDxFAf5lqYG93aHP/nA1Mv3XiYAfn073IUTG+vjUO1seU3B2JDS43faV/
	T8CQ5rN7s5ZvuaIWZtO/zbaITCyu0VvPwyOHOkgm6nA==
X-Gm-Gg: ASbGncs1/clt2a59H6kv8JVPWfYaPlAAadvj8qC74lSFGfjX97OZyQ1CWjDP+k1wB2t
	MJs9UD8tUz5p3mUrm+OH083CPrPEbSwbIKSYC8NxoJ3YcSo09wI+uKOUErvKwW8rNU+xuQzuoL8
	Rmc69/AVVEO7V0TEgYiGla0c/6xGKQYvIv9w==
X-Google-Smtp-Source: AGHT+IHcnwyoLk78Sdyqna09vDLwno8N4DKtCoMRIDEgmxMn5EJ8+I+135oFuaEbt0jukPgDX+G63PqFO04gyL6xVSo=
X-Received: by 2002:a05:6820:2610:b0:5fe:9edb:eafe with SMTP id
 006d021491bc7-60b9fba1696mr6694046eaf.5.1748358452253; Tue, 27 May 2025
 08:07:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250520152436.474778-1-jens.wiklander@linaro.org>
 <20250520152436.474778-9-jens.wiklander@linaro.org> <aDQhn9_fezC42GwS@sumit-X1>
In-Reply-To: <aDQhn9_fezC42GwS@sumit-X1>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 27 May 2025 17:07:18 +0200
X-Gm-Features: AX0GCFv4xwxS381XBNqHvZmFreXW7Y4SbgNJb3O8wPMOP2rKatTJj8xDdz14iuA
Message-ID: <CAHUa44HFPu87JCHDxu6HWAp6YaXrHFwi55JHTb9X=JvTz30XpA@mail.gmail.com>
Subject: Re: [PATCH v9 8/9] optee: FF-A: dynamic protected memory allocation
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
	Rouven Czerwinski <rouven.czerwinski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_080733_366631_C99DAF47 
X-CRM114-Status: GOOD (  25.64  )
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

On Mon, May 26, 2025 at 10:09=E2=80=AFAM Sumit Garg <sumit.garg@kernel.org>=
 wrote:
>
> On Tue, May 20, 2025 at 05:16:51PM +0200, Jens Wiklander wrote:
> > Add support in the OP-TEE backend driver dynamic protected memory
> > allocation with FF-A.
> >
> > The protected memory pools for dynamically allocated protected memory
> > are instantiated when requested by user-space. This instantiation can
> > fail if OP-TEE doesn't support the requested use-case of protected
> > memory.
> >
> > Restricted memory pools based on a static carveout or dynamic allocatio=
n
> > can coexist for different use-cases. We use only dynamic allocation wit=
h
> > FF-A.
> >
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > ---
[...]
> > +static int optee_ffa_protmem_pool_init(struct optee *optee, u32 sec_ca=
ps)
> > +{
> > +     enum tee_dma_heap_id id =3D TEE_DMA_HEAP_SECURE_VIDEO_PLAY;
> > +     struct tee_protmem_pool *pool;
> > +     int rc =3D 0;
> > +
> > +     if (sec_caps & OPTEE_FFA_SEC_CAP_PROTMEM) {
> > +             pool =3D optee_protmem_alloc_dyn_pool(optee, id);
> > +             if (IS_ERR(pool))
> > +                     return PTR_ERR(pool);
> > +
> > +             rc =3D tee_device_register_dma_heap(optee->teedev, id, po=
ol);
> > +             if (rc)
> > +                     pool->ops->destroy_pool(pool);
> > +     }
> > +
> > +     return rc;
> > +}
> > +
> >  static int optee_ffa_probe(struct ffa_device *ffa_dev)
> >  {
> >       const struct ffa_notifier_ops *notif_ops;
> > @@ -918,7 +1057,7 @@ static int optee_ffa_probe(struct ffa_device *ffa_=
dev)
> >                                 optee);
> >       if (IS_ERR(teedev)) {
> >               rc =3D PTR_ERR(teedev);
> > -             goto err_free_pool;
> > +             goto err_free_shm_pool;
> >       }
> >       optee->teedev =3D teedev;
> >
> > @@ -965,6 +1104,9 @@ static int optee_ffa_probe(struct ffa_device *ffa_=
dev)
> >                              rc);
> >       }
> >
> > +     if (optee_ffa_protmem_pool_init(optee, sec_caps))
>
> Let's add a Kconfig check for DMABUF heaps support here as well.

I prefer complaining in the log if there's something wrong with the
configuration.

>
> > +             pr_info("Protected memory service not available\n");
> > +
[...]
> > +static int init_dyn_protmem(struct optee_protmem_dyn_pool *rp)
> > +{
> > +     int rc;
> > +
> > +     rp->protmem =3D tee_shm_alloc_dma_mem(rp->optee->ctx, rp->page_co=
unt);
> > +     if (IS_ERR(rp->protmem)) {
> > +             rc =3D PTR_ERR(rp->protmem);
> > +             goto err_null_protmem;
> > +     }
> > +
> > +     /*
> > +      * TODO unmap the memory range since the physical memory will
> > +      * become inaccesible after the lend_protmem() call.
>
> Let's ellaborate this comment to also say that unmap isn't strictly
> needed here in case a platform supports hypervisor in EL2 which can
> perform unmapping as part for memory lending to secure world as that
> will avoid any cache pre-fetch of memory lent to secure world.
>
> With that I can live with this as a ToDo in kernel which can be
> implemented once we see platforms requiring this change to happen.

OK, I'll add something.

[...]
> > +
> > +struct tee_protmem_pool *optee_protmem_alloc_dyn_pool(struct optee *op=
tee,
> > +                                                   enum tee_dma_heap_i=
d id)
> > +{
> > +     struct optee_protmem_dyn_pool *rp;
> > +     u32 use_case =3D id;
>
> Here we can get rid of redundant extra variable with s/id/use_case/.

OK, I'll update.

Cheers,
Jens

