Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A662C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 14:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HfXW1tINyjybFH59i2/tceSOuMsWCGxf0dWvSOQSE9Q=; b=4OOIBUA3Wq+d8Ybv6QbsiQeITy
	umaGs5AonmfloiOGaKtx8K26DH5URa09knkIpYbR/lG0H5Zm8LkI1NObgMY6ko5IdEGRfK6OdxPKa
	LC8kNM+1sBg0rcj3tfEk5IZrSGAeAgJDKCCzmjPixNxW9i4KZ7c/bdEoLqV6XPkhg7jsY9lbs2yny
	8ZcTnWW14rT3d5JhC2T/lWIsx/zZ0X43uQ+XPy8h7jBRoyFpiGkFirOAEwi1tcpRztuX/RUn244F6
	di+dfZL7xXxxRhO4qH1OINfFcgpMWhivBu+h1sgjGgYuHv1HHy1epe/5040wP29fn89E0lcYb+/bZ
	ji6BJEJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx4pf-000000068sJ-2LE5;
	Tue, 25 Mar 2025 14:00:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx4kz-000000068FC-0kdy
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 25 Mar 2025 13:55:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=HfXW1tINyjybFH59i2/tceSOuMsWCGxf0dWvSOQSE9Q=; b=XaGwDtu+Aj+qbXASYWjMwCTFcf
	ogi1W58J5Qn3o1HE8EtX6r04m3TrCcc7XulVlQ4LOh96aeWnwrnbUgCEvaDZjQlBQXJdnGnNJKcTY
	R3W/2iIqMNpB3K3hg+exoEqXz/njv0NROXP767UnXA+cilnnDDrgY53bl/6SYP8blCZYVmL+xMyn3
	ucXYVjxNpZ6LyNOGMZC+B8M9yJVkAlC20ata4q7KM2ZFPuiABEx82shPzqe/AfmVioRFErXX/+mk9
	o+xSLZtElBlqe4kYzy8+jmNPSJ8ROwlYegUNQQe+6aMgBNWoSLAWGx+WaeGrkVlBhwVbJ9DpQ5wN0
	ecer+Zmw==;
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tx4ku-00000005UQX-3RHR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 13:55:52 +0000
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-2b2b6019a74so2799324fac.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Mar 2025 06:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742910944; x=1743515744; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HfXW1tINyjybFH59i2/tceSOuMsWCGxf0dWvSOQSE9Q=;
        b=poMsev3Lyd3cbXVbxLqiayfnMyBR+0Ir0yfvNyLLFFyvs3I/w7YBDu8SxtsuTfMOvM
         5xGse3guT2seBvwPWHwFy3XsCOWwbZLzbJELZ5gk0pAxlumbY4kmbDLEp/ZOndV8WAtX
         d4RfLdo3q5IFJb19BV8TKqG9I5e1+GdhnMWmGW00w7udO7bcziGZQAa6X4YUuIUUh2Ml
         2wwPWc7UpKsx4teb1DueceEULFRfo4XLTmM3iLlPlZWbRqHFp/NrNnS6WuRyt9V0/Mqw
         FPFPOL6D8r649e2DgQO680DLGo2iKH7m8uii0VThjiFcdBiyMJA0cHGDv5BBUY8YWX/A
         AcBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742910944; x=1743515744;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HfXW1tINyjybFH59i2/tceSOuMsWCGxf0dWvSOQSE9Q=;
        b=kwjkjrljTh4W8xrZFLyWJytRgU9Z02lrJYztdXkt2Eb/p6b2QrpBw3Jjq8IqamKPjY
         /eQVGMBrRBeVCdPP0cRFWfxUEMrFzwudfbEa6JvxGQf1zl7ppZ7m7mmcrSYkFI2GqSw2
         KYeQDQTI3B3Z8FdKv/OWpiz5YbPIsxRm3cuQJ/4ox+cLKqde9VFDSAP9y6G+Z9dfHcIH
         qt6L64WCM+7wXJwemjsbdkG2uCD1DqWbCMc+6a/Vh5xm8KXli+dcz8uyNJX5nTYoQlvN
         cnFN12VfDpmeP+UWf9CRGQeGe3q5L/qtg3fcJzY6LBC4BmkEKfYc9ZVNleuFJ2fhINse
         sNug==
X-Forwarded-Encrypted: i=1; AJvYcCXzV1LeTHHQQ/nNuiLSp7OnuqKwh9EdQMVY0RSKDAj8EgCavEZNsy4ZrIcpS9nhUn/iYaHS83bk8LgiqmL0lqTe@lists.infradead.org
X-Gm-Message-State: AOJu0Ywpb/oOZADndoYroKvAOsslJSD2NpSEydEUsaK65FLGuc4/PuhE
	tv1vyfWFWaZjgaEbdye/o9MvRfHYPgW3mcbW7D6x9FoY/Xv7R6J1k+paqO46PCC2RVO2MTndVjv
	Am2mWy/PRXT71CeloERTvwZhiyi4hFvnNdD9VNA==
X-Gm-Gg: ASbGncs17UW7XvzpCwLGdJ5myAI84KAKszYF9AJLfipLd14TevTwDWGeDfAfjmTWdMl
	U7dCqSeXYCrQt3kzDeNsWzyLlIC27TWC8OEcIPHTM5gbOkVwpox1xUxjasCBgj/Y/e+mN++LqB+
	pV9IRLKiSof6qUODcjEfikV+c4s+g=
X-Google-Smtp-Source: AGHT+IEwBPPwUVoRos1sVNedvDmYTl2oPMhg6qa7EWRFlVhYT0/1fPMMFcZLaxlXCLhryoazT9mEtzOs9FsiBb8tVPo=
X-Received: by 2002:a05:6870:f80b:b0:296:bbc8:4a82 with SMTP id
 586e51a60fabf-2c780495379mr12124356fac.27.1742910943713; Tue, 25 Mar 2025
 06:55:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250305130634.1850178-1-jens.wiklander@linaro.org>
 <20250305130634.1850178-9-jens.wiklander@linaro.org> <Z-JWIyd8cKyXQR0H@sumit-X1>
In-Reply-To: <Z-JWIyd8cKyXQR0H@sumit-X1>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 25 Mar 2025 14:55:32 +0100
X-Gm-Features: AQ5f1Jp3D7eSeWP8gWeTN_I1pHWpPzOxKysZVMBSQkU1nox7ff2kFajLYyiQcek
Message-ID: <CAHUa44FXjG1hC9v18Yx1ENPX_Bc9sZW1Z2=+m6+KUsxPMvDE+w@mail.gmail.com>
Subject: Re: [PATCH v6 08/10] optee: support restricted memory allocation
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
	Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_135549_158441_FCC11FF5 
X-CRM114-Status: GOOD (  28.24  )
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

On Tue, Mar 25, 2025 at 8:07=E2=80=AFAM Sumit Garg <sumit.garg@kernel.org> =
wrote:
>
> On Wed, Mar 05, 2025 at 02:04:14PM +0100, Jens Wiklander wrote:
> > Add support in the OP-TEE backend driver for restricted memory
> > allocation. The support is limited to only the SMC ABI and for secure
> > video buffers.
> >
> > OP-TEE is probed for the range of restricted physical memory and a
> > memory pool allocator is initialized if OP-TEE have support for such
> > memory.
> >
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > ---
> >  drivers/tee/optee/core.c    |  1 +
> >  drivers/tee/optee/smc_abi.c | 44 +++++++++++++++++++++++++++++++++++--
> >  2 files changed, 43 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/tee/optee/core.c b/drivers/tee/optee/core.c
> > index c75fddc83576..c7fd8040480e 100644
> > --- a/drivers/tee/optee/core.c
> > +++ b/drivers/tee/optee/core.c
> > @@ -181,6 +181,7 @@ void optee_remove_common(struct optee *optee)
> >       tee_device_unregister(optee->supp_teedev);
> >       tee_device_unregister(optee->teedev);
> >
> > +     tee_device_unregister_all_dma_heaps(optee->teedev);
> >       tee_shm_pool_free(optee->pool);
> >       optee_supp_uninit(&optee->supp);
> >       mutex_destroy(&optee->call_queue.mutex);
> > diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
> > index cfdae266548b..a14ff0b7d3b3 100644
> > --- a/drivers/tee/optee/smc_abi.c
> > +++ b/drivers/tee/optee/smc_abi.c
> > @@ -1620,6 +1620,41 @@ static inline int optee_load_fw(struct platform_=
device *pdev,
> >  }
> >  #endif
> >
> > +static int optee_sdp_pool_init(struct optee *optee)
> > +{
> > +     enum tee_dma_heap_id heap_id =3D TEE_DMA_HEAP_SECURE_VIDEO_PLAY;
> > +     struct tee_rstmem_pool *pool;
> > +     int rc;
> > +
> > +     if (optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_SDP) {
>
> Is this SDP capability an ABI yet since we haven't supported it in
> upstream kernel? If no then can we rename it as
> OPTEE_SMC_SEC_CAP_RSTMEM?

No problem. We can rename it.

>
> > +             union {
> > +                     struct arm_smccc_res smccc;
> > +                     struct optee_smc_get_sdp_config_result result;
> > +             } res;
> > +
> > +             optee->smc.invoke_fn(OPTEE_SMC_GET_SDP_CONFIG, 0, 0, 0, 0=
, 0, 0,
> > +                                  0, &res.smccc);
> > +             if (res.result.status !=3D OPTEE_SMC_RETURN_OK) {
> > +                     pr_err("Secure Data Path service not available\n"=
);
> > +                     return 0;
> > +             }
> > +
> > +             pool =3D tee_rstmem_static_pool_alloc(res.result.start,
> > +                                                 res.result.size);
> > +             if (IS_ERR(pool))
> > +                     return PTR_ERR(pool);
> > +
> > +             rc =3D tee_device_register_dma_heap(optee->teedev, heap_i=
d, pool);
> > +             if (rc)
> > +                     goto err;
> > +     }
> > +
> > +     return 0;
> > +err:
> > +     pool->ops->destroy_pool(pool);
> > +     return rc;
> > +}
> > +
> >  static int optee_probe(struct platform_device *pdev)
> >  {
> >       optee_invoke_fn *invoke_fn;
> > @@ -1715,7 +1750,7 @@ static int optee_probe(struct platform_device *pd=
ev)
> >       optee =3D kzalloc(sizeof(*optee), GFP_KERNEL);
> >       if (!optee) {
> >               rc =3D -ENOMEM;
> > -             goto err_free_pool;
> > +             goto err_free_shm_pool;
> >       }
> >
> >       optee->ops =3D &optee_ops;
> > @@ -1788,6 +1823,10 @@ static int optee_probe(struct platform_device *p=
dev)
> >               pr_info("Asynchronous notifications enabled\n");
> >       }
> >
> > +     rc =3D optee_sdp_pool_init(optee);
>
> s/optee_sdp_pool_init/optee_rstmem_pool_init/

OK

Cheers,
Jens

>
> -Sumit
>
> > +     if (rc)
> > +             goto err_notif_uninit;
> > +
> >       /*
> >        * Ensure that there are no pre-existing shm objects before enabl=
ing
> >        * the shm cache so that there's no chance of receiving an invali=
d
> > @@ -1823,6 +1862,7 @@ static int optee_probe(struct platform_device *pd=
ev)
> >               optee_disable_shm_cache(optee);
> >       optee_smc_notif_uninit_irq(optee);
> >       optee_unregister_devices();
> > +     tee_device_unregister_all_dma_heaps(optee->teedev);
> >  err_notif_uninit:
> >       optee_notif_uninit(optee);
> >  err_close_ctx:
> > @@ -1839,7 +1879,7 @@ static int optee_probe(struct platform_device *pd=
ev)
> >       tee_device_unregister(optee->teedev);
> >  err_free_optee:
> >       kfree(optee);
> > -err_free_pool:
> > +err_free_shm_pool:
> >       tee_shm_pool_free(pool);
> >       if (memremaped_shm)
> >               memunmap(memremaped_shm);
> > --
> > 2.43.0
> >

