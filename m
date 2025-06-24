Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC1B4C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 08:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/btdfiDxU5+NfLXwgveKgggXqAGO0bFMTRE67tAX7B4=; b=w03cJu84epZx5VRwwZxkixxJus
	fdlgcjqeDZfOLfVy/Ty8aY+1cSVas1oXy/bIHdUtQV5evRS8Mfl/Lp6y7T08imOYqabjS7SmJKgoi
	Dx8dL/ElXobDpoFEGQWFoi7RTbf4CiH0YvpX/GwKZlcmtMBoube6GkEafw54Sd2k0kcSPLGzsQbb1
	ntPcvIUy0dWUPvWQAOg7/QdgSmaKChoLM57Og4HYCiOBTV2B+Gz690gWVjSSKcmnqi6oQWs9sPMtj
	oEz6NSUjYa9tnlx+sAPFZdbwOy3QOs2lCzOtwXA/ZDyS2zqi7DcxeQCbPzHImu+Z1z4BZElNQtqfv
	NyNoyyvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTynV-00000004yw3-2Xbe;
	Tue, 24 Jun 2025 08:14:29 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTyF6-00000004tvD-2h2O
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 07:38:58 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-6118c1775dbso26876eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 00:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750750735; x=1751355535; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/btdfiDxU5+NfLXwgveKgggXqAGO0bFMTRE67tAX7B4=;
        b=NOLEBiNhuD+GpNT6/UjKH3BmsF/9snmuYkEgwoKTkLyX9B20HC5AwxEgDBL9O74fwW
         xdTqvuY4psY0wNb3QwfcgvlOcU5p618FZcRAhqbVwg8fingjwh+84BYedXGVGHzXCLJP
         AcX5ZpnkI9tt5wGS0qa7u04sj2Pbjoy+bH/+4/HJucyxwt/1r9nJCig0XKyOf9cq8vqT
         YijMu6yl6u/rVBPZ3GTQS0jVIRU6GYWcXSHObKOhzzy8zVG10NYNbNNxtfcdx0U+rsdI
         wvClYmexe0Dji1SBNo5oU2ZqbUm0nIqWIoQ6eyWmgvlaptC93GdhZLkEe3tqJzjpRlxN
         UbKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750750735; x=1751355535;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/btdfiDxU5+NfLXwgveKgggXqAGO0bFMTRE67tAX7B4=;
        b=q637aU/UN0+DV1wffmLn/EFTUpg4A+OHf+2SGPpdS7lyxtw00TCmpISqcBeg81J+FM
         mUMhNkhGqVRoCzzqxLypMgjpg34H7JBCw0r0eaH80UyhFtMPn00t0MeiexJzB8r5asmf
         x1TF1Den81HLj6c9KccHzP2ztB3yHb/hY0dQ2JXpMd1tJ7CXz/VYjEhkXUMUBBky+eTW
         FsOtLdmhK0lNZaRkCS/VuAbfiv6uQmfRP6mViWT2edgsJY8i2x+JQnuN9p/pbRXf1TBZ
         IDIdLpyb8dT1P4M9dip4tDCuDX5lhTCLU7J1I/3PX4I68NM4kDtZe08KCGJ6wRkL225b
         xImA==
X-Forwarded-Encrypted: i=1; AJvYcCXuInu7FNpq/Q08W2Y1MyCyd8Yvyt8BDNwPmksQ/wKtmsmyNLGBFOC8On8VM3EzRoVhUSjCmDy2IenVauM+/EWX@lists.infradead.org
X-Gm-Message-State: AOJu0YxR0BZilm7oCCqWH7aV/fIphJz0jpbd0Vel681+rOhlOl4qp5jh
	XSMg8fSA+UDRYbnFrGTji2n59cIDxz9Gf6ob1og40wiSMR0gfFDLnwdfOLpETvYcGti3lYaSVtl
	dS/PtjJRul360r0U2yGzXeLvtnFCqwfwde+bJoPfYHQ==
X-Gm-Gg: ASbGnct++WpWM1U19aBvJxiGN2kN8GyO2a3HdOjnK46ydPTlFqMfVIGfGwELlP9sKdr
	kmJ9CM68J42zMxyyO+9aM1T5/t2kEh8zIEOk/kSAv70RP9wr38O02no9AZ1iVasS7RpYJCO8q69
	66sj/XHzoeOYybexh2oD2It95bqmCWrQRRoLWQbVt4JMVj
X-Google-Smtp-Source: AGHT+IFv5Vd9I2g8ShfadWNai4MGcPsTVNYM9JBJbAh0Rl83gxR175ZIBNF3BJDM4El7jyE4KTKddR9JG2+zTp5dAx4=
X-Received: by 2002:a05:6820:f08:b0:611:4042:bcfa with SMTP id
 006d021491bc7-6115ba3be83mr13813272eaf.6.1750750735187; Tue, 24 Jun 2025
 00:38:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250610131600.2972232-1-jens.wiklander@linaro.org>
 <20250610131600.2972232-8-jens.wiklander@linaro.org> <2d93ee96-0c36-4651-b6ad-9fddd0f6ad88@oss.qualcomm.com>
In-Reply-To: <2d93ee96-0c36-4651-b6ad-9fddd0f6ad88@oss.qualcomm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 24 Jun 2025 09:38:43 +0200
X-Gm-Features: AX0GCFuM5JcuB2movGdmuDiMPV5NoYMd-NK6xp4w95s0PznpYBirMN1LlHfC1B8
Message-ID: <CAHUa44GXCVaShPhw_Yw0+CWovX+pi7=UOXXGr5dKKSXz4JppeA@mail.gmail.com>
Subject: Re: [PATCH v10 7/9] optee: support protected memory allocation
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
	Olivier Masse <olivier.masse@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Sumit Garg <sumit.garg@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, azarrabi@qti.qualcomm.com, 
	Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>, 
	Rouven Czerwinski <rouven.czerwinski@linaro.org>, robin.murphy@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_003856_692964_6B8541AB 
X-CRM114-Status: GOOD (  33.20  )
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

Hi Amir,

On Tue, Jun 24, 2025 at 8:54=E2=80=AFAM Amirreza Zarrabi
<amirreza.zarrabi@oss.qualcomm.com> wrote:
>
> Hi Jens,
>
> On 6/10/2025 11:13 PM, Jens Wiklander wrote:
> > Add support in the OP-TEE backend driver for protected memory
> > allocation. The support is limited to only the SMC ABI and for secure
> > video buffers.
> >
> > OP-TEE is probed for the range of protected physical memory and a
> > memory pool allocator is initialized if OP-TEE have support for such
> > memory.
> >
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > ---
> >  drivers/tee/optee/Kconfig         |  5 +++
> >  drivers/tee/optee/core.c          | 10 +++++
> >  drivers/tee/optee/optee_private.h |  2 +
> >  drivers/tee/optee/smc_abi.c       | 70 ++++++++++++++++++++++++++++++-
> >  4 files changed, 85 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/tee/optee/Kconfig b/drivers/tee/optee/Kconfig
> > index 7bb7990d0b07..50d2051f7f20 100644
> > --- a/drivers/tee/optee/Kconfig
> > +++ b/drivers/tee/optee/Kconfig
> > @@ -25,3 +25,8 @@ config OPTEE_INSECURE_LOAD_IMAGE
> >
> >         Additional documentation on kernel security risks are at
> >         Documentation/tee/op-tee.rst.
> > +
> > +config OPTEE_STATIC_PROTMEM_POOL
> > +     bool
> > +     depends on HAS_IOMEM && TEE_DMABUF_HEAPS
> > +     default y
> > diff --git a/drivers/tee/optee/core.c b/drivers/tee/optee/core.c
> > index c75fddc83576..4b14a7ac56f9 100644
> > --- a/drivers/tee/optee/core.c
> > +++ b/drivers/tee/optee/core.c
> > @@ -56,6 +56,15 @@ int optee_rpmb_intf_rdev(struct notifier_block *intf=
, unsigned long action,
> >       return 0;
> >  }
> >
> > +int optee_set_dma_mask(struct optee *optee, u_int pa_width)
> > +{
> > +     u64 mask =3D DMA_BIT_MASK(min(64, pa_width));
> > +
>
> nit: Why not dma_coerce_mask_and_coherent() instead of bellow?

Good point, I'll update in the next version.

Thanks,
Jens

>
> - Amir
>
> > +     optee->teedev->dev.dma_mask =3D &optee->teedev->dev.coherent_dma_=
mask;
> > +
> > +     return dma_set_mask_and_coherent(&optee->teedev->dev, mask);
> > +}
> > +
> >  static void optee_bus_scan(struct work_struct *work)
> >  {
> >       WARN_ON(optee_enumerate_devices(PTA_CMD_GET_DEVICES_SUPP));
> > @@ -181,6 +190,7 @@ void optee_remove_common(struct optee *optee)
> >       tee_device_unregister(optee->supp_teedev);
> >       tee_device_unregister(optee->teedev);
> >
> > +     tee_device_unregister_all_dma_heaps(optee->teedev);
> >       tee_shm_pool_free(optee->pool);
> >       optee_supp_uninit(&optee->supp);
> >       mutex_destroy(&optee->call_queue.mutex);
> > diff --git a/drivers/tee/optee/optee_private.h b/drivers/tee/optee/opte=
e_private.h
> > index dc0f355ef72a..5e3c34802121 100644
> > --- a/drivers/tee/optee/optee_private.h
> > +++ b/drivers/tee/optee/optee_private.h
> > @@ -272,6 +272,8 @@ struct optee_call_ctx {
> >
> >  extern struct blocking_notifier_head optee_rpmb_intf_added;
> >
> > +int optee_set_dma_mask(struct optee *optee, u_int pa_width);
> > +
> >  int optee_notif_init(struct optee *optee, u_int max_key);
> >  void optee_notif_uninit(struct optee *optee);
> >  int optee_notif_wait(struct optee *optee, u_int key, u32 timeout);
> > diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
> > index f0c3ac1103bb..cf106d15e64e 100644
> > --- a/drivers/tee/optee/smc_abi.c
> > +++ b/drivers/tee/optee/smc_abi.c
> > @@ -1584,6 +1584,68 @@ static inline int optee_load_fw(struct platform_=
device *pdev,
> >  }
> >  #endif
> >
> > +static struct tee_protmem_pool *static_protmem_pool_init(struct optee =
*optee)
> > +{
> > +#if IS_ENABLED(CONFIG_OPTEE_STATIC_PROTMEM_POOL)
> > +     union {
> > +             struct arm_smccc_res smccc;
> > +             struct optee_smc_get_protmem_config_result result;
> > +     } res;
> > +     struct tee_protmem_pool *pool;
> > +     void *p;
> > +     int rc;
> > +
> > +     optee->smc.invoke_fn(OPTEE_SMC_GET_PROTMEM_CONFIG, 0, 0, 0, 0,
> > +                          0, 0, 0, &res.smccc);
> > +     if (res.result.status !=3D OPTEE_SMC_RETURN_OK)
> > +             return ERR_PTR(-EINVAL);
> > +
> > +     rc =3D optee_set_dma_mask(optee, res.result.pa_width);
> > +     if (rc)
> > +             return ERR_PTR(rc);
> > +
> > +     /*
> > +      * Map the memory as uncached to make sure the kernel can work wi=
th
> > +      * __pfn_to_page() and friends since that's needed when passing t=
he
> > +      * protected DMA-buf to a device. The memory should otherwise not
> > +      * be touched by the kernel since it's likely to cause an externa=
l
> > +      * abort due to the protection status.
> > +      */
> > +     p =3D devm_memremap(&optee->teedev->dev, res.result.start,
> > +                       res.result.size, MEMREMAP_WC);
> > +     if (IS_ERR(p))
> > +             return p;
> > +
> > +     pool =3D tee_protmem_static_pool_alloc(res.result.start, res.resu=
lt.size);
> > +     if (IS_ERR(pool))
> > +             devm_memunmap(&optee->teedev->dev, p);
> > +
> > +     return pool;
> > +#else
> > +     return ERR_PTR(-EINVAL);
> > +#endif
> > +}
> > +
> > +static int optee_protmem_pool_init(struct optee *optee)
> > +{
> > +     enum tee_dma_heap_id heap_id =3D TEE_DMA_HEAP_SECURE_VIDEO_PLAY;
> > +     struct tee_protmem_pool *pool =3D ERR_PTR(-EINVAL);
> > +     int rc;
> > +
> > +     if (!(optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_PROTMEM))
> > +             return 0;
> > +
> > +     pool =3D static_protmem_pool_init(optee);
> > +     if (IS_ERR(pool))
> > +             return PTR_ERR(pool);
> > +
> > +     rc =3D tee_device_register_dma_heap(optee->teedev, heap_id, pool)=
;
> > +     if (rc)
> > +             pool->ops->destroy_pool(pool);
> > +
> > +     return rc;
> > +}
> > +
> >  static int optee_probe(struct platform_device *pdev)
> >  {
> >       optee_invoke_fn *invoke_fn;
> > @@ -1679,7 +1741,7 @@ static int optee_probe(struct platform_device *pd=
ev)
> >       optee =3D kzalloc(sizeof(*optee), GFP_KERNEL);
> >       if (!optee) {
> >               rc =3D -ENOMEM;
> > -             goto err_free_pool;
> > +             goto err_free_shm_pool;
> >       }
> >
> >       optee->ops =3D &optee_ops;
> > @@ -1752,6 +1814,9 @@ static int optee_probe(struct platform_device *pd=
ev)
> >               pr_info("Asynchronous notifications enabled\n");
> >       }
> >
> > +     if (optee_protmem_pool_init(optee))
> > +             pr_info("Protected memory service not available\n");
> > +
> >       /*
> >        * Ensure that there are no pre-existing shm objects before enabl=
ing
> >        * the shm cache so that there's no chance of receiving an invali=
d
> > @@ -1787,6 +1852,7 @@ static int optee_probe(struct platform_device *pd=
ev)
> >               optee_disable_shm_cache(optee);
> >       optee_smc_notif_uninit_irq(optee);
> >       optee_unregister_devices();
> > +     tee_device_unregister_all_dma_heaps(optee->teedev);
> >  err_notif_uninit:
> >       optee_notif_uninit(optee);
> >  err_close_ctx:
> > @@ -1803,7 +1869,7 @@ static int optee_probe(struct platform_device *pd=
ev)
> >       tee_device_unregister(optee->teedev);
> >  err_free_optee:
> >       kfree(optee);
> > -err_free_pool:
> > +err_free_shm_pool:
> >       tee_shm_pool_free(pool);
> >       if (memremaped_shm)
> >               memunmap(memremaped_shm);
>

