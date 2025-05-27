Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 513E3C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 14:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=95DgJLZjEvQybIlPP+VCo5ApfOw6ewx9PjK94wls/Kk=; b=BnB3xVSPYbJMboF8KwOPtCZj7F
	yOy9oXTuV7u56EFSI7VAFfB60keRxC0t1wgh7MSQiaTcBB+B0L5H+PdFQC3nPFXKKgKnaMS4+LQkS
	UVfYzEYpJvMXmG0/FgkE+wNQ3ICzWWCwtt3SqDmFl/JaxMqhNk3250DC3atbe5AO5X1WKPNwzNCk5
	30ywwVR+x0w9/GQYpBoPciPQZSH1qrOh5U9Hkhll0mre3TYivT8xC2K+dIqAPr3Imur6zqLeZ2X0A
	rk5plz6VMXav2lHrJWUnO6YX5PZAlxw6XyaILodD0YzEDme4z9s/FKaD7J4dxPfnJkBQC9QKGsz4n
	jbtA18TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJvZI-0000000AyF0-3PlK;
	Tue, 27 May 2025 14:46:16 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJvX3-0000000AxpV-3ppA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 14:43:59 +0000
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-3fbc00143d6so2062934b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 May 2025 07:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748357037; x=1748961837; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=95DgJLZjEvQybIlPP+VCo5ApfOw6ewx9PjK94wls/Kk=;
        b=aKa2R7qJ2aXLZocz1bNjRu4a3lN4SM705gOAkCiMjGghcyrKKMZ29XZMLAsOaEA3rB
         2C/hozv13B87UoT/y8DObWBoqf1tqi0FV8vE5EzlpnKspMh1wJFfwK2batY4C7vd8Rg5
         BqC9imS706UaWfC7nEtzyEGNjfp2XZXB+rClNyzXsQaJLbcDt5MrZKvTLkL2WuRK5nGN
         9rrFg0SVaDohoM2LCbFaXwMUYZVc90EilWn0AIBo+K55apHNKSXDONJy6PNyfgB/EdCT
         wKUykR0PS/KIBH6I42oyTt3oN0oo6hKcBCcuYYZXF6RU5+5s68YZ/Q06tp73hJpKZOTC
         9wqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748357037; x=1748961837;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=95DgJLZjEvQybIlPP+VCo5ApfOw6ewx9PjK94wls/Kk=;
        b=ExLAtCkr2Nr3os+lInnK1oDN1QAL+uplDmX9p5EkSW9c9Zbu/eCzsclqgaavchWLJ9
         VuzqyyONvv3SqgFbviTBfR5qsJsJlhkQ4xOPxOryZQWiPGKesXT0uQ1L6KoNGq4MWLVd
         3Xn5iEoyQohKzDhDJL2IcyDUQYGpWmTqsejaSYZ24WeH7tZ1QDtiHw+HD+cyZprxs+e0
         Ch6fkYpGfxMo45UjP87pYXpkGZAKCIRc7FF6FVulp+IBBUoRwbNSu3aSXe8t1N6xXvoQ
         T+pv61xdWXYUr/vbfxjm59GZccrQutfEXP+Qp7Jc/p6lmkptoIrS8hpZI37NohBInkNz
         LsEA==
X-Forwarded-Encrypted: i=1; AJvYcCWev+bec9gofVph19/gPvHtCGN+t9jsITDC6x5RK9TY7JBYYdHGpZrQuwlbYHkpmdFx6OZK2lzileV/FoDXdcGl@lists.infradead.org
X-Gm-Message-State: AOJu0YzSPC0WUxtths4/Ibwc6LTfNfS2DZL1tZyd5yTSv4/OCVUZatUu
	qlfTjBOVobdsl148LPCZUobpGsVLf/rKxvF7XKXnnosFgf1fYB7Z+I0pXMp1wG1xGf9QsJ5q2ah
	DR1DbxFft/1H737a2ArUQunbByZIGbQbVXpn5Fo9RJgrX2LPweffi
X-Gm-Gg: ASbGnctwSiTNGx+MBxXLUi9U5uAPnZ+MmRnFCpqhptmhLWiyl7i4wUWXfBHpM+alOA3
	QXlfWHstRrYhYbJjH/tYGYW7PYX61KW8iL8fDt41hJzIdDMwmEGKjjrrskUovdm2LMOUMdHEIdP
	+mfa3pJe19EHBrExw/S4lWQrf5VKtCHndFlQ==
X-Google-Smtp-Source: AGHT+IHpSqYMZnJIwMvd/4lAF+O9cYNaktKk9pOe7eLVIejN5m7i3i+I+Kqp9vE8g8yw+eb4yKgrKppgkbkYaaS4u4c=
X-Received: by 2002:a05:6808:3a19:b0:403:3195:58cf with SMTP id
 5614622812f47-406467f6a5emr7481831b6e.1.1748357036861; Tue, 27 May 2025
 07:43:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250520152436.474778-1-jens.wiklander@linaro.org>
 <20250520152436.474778-10-jens.wiklander@linaro.org> <aDQitSd27Z4qC0xT@sumit-X1>
In-Reply-To: <aDQitSd27Z4qC0xT@sumit-X1>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 27 May 2025 16:43:44 +0200
X-Gm-Features: AX0GCFsAg3SlBrsMFYU7wBuZbNCOqXi00PEfamwreFmZfzirEP5JjBZls3rnlgg
Message-ID: <CAHUa44E=FKAGWk-pjq176b9ri7kgL8PqN6rpBeoPKgfj5EuWTA@mail.gmail.com>
Subject: Re: [PATCH v9 9/9] optee: smc abi: dynamic protected memory allocation
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
X-CRM114-CacheID: sfid-20250527_074357_962043_DED666BE 
X-CRM114-Status: GOOD (  26.40  )
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

On Mon, May 26, 2025 at 10:13=E2=80=AFAM Sumit Garg <sumit.garg@kernel.org>=
 wrote:
>
> On Tue, May 20, 2025 at 05:16:52PM +0200, Jens Wiklander wrote:
> > Add support in the OP-TEE backend driver for dynamic protected memory
> > allocation using the SMC ABI.
> >
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > ---
> >  drivers/tee/optee/smc_abi.c | 102 ++++++++++++++++++++++++++++++------
> >  1 file changed, 85 insertions(+), 17 deletions(-)
> >
> > diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
> > index f3cae8243785..6b3fbe7f0909 100644
> > --- a/drivers/tee/optee/smc_abi.c
> > +++ b/drivers/tee/optee/smc_abi.c
> > @@ -965,6 +965,70 @@ static int optee_smc_do_call_with_arg(struct tee_c=
ontext *ctx,
> >       return rc;
> >  }
> >
> > +static int optee_smc_lend_protmem(struct optee *optee, struct tee_shm =
*protmem,
> > +                               u16 *end_points, unsigned int ep_count,
> > +                               u32 use_case)
> > +{
> > +     struct optee_shm_arg_entry *entry;
> > +     struct optee_msg_arg *msg_arg;
> > +     struct tee_shm *shm;
> > +     u_int offs;
> > +     int rc;
> > +
> > +     msg_arg =3D optee_get_msg_arg(optee->ctx, 2, &entry, &shm, &offs)=
;
> > +     if (IS_ERR(msg_arg))
> > +             return PTR_ERR(msg_arg);
> > +
> > +     msg_arg->cmd =3D OPTEE_MSG_CMD_LEND_PROTMEM;
> > +     msg_arg->params[0].attr =3D OPTEE_MSG_ATTR_TYPE_VALUE_INPUT;
> > +     msg_arg->params[0].u.value.a =3D use_case;
> > +     msg_arg->params[1].attr =3D OPTEE_MSG_ATTR_TYPE_TMEM_INPUT;
> > +     msg_arg->params[1].u.tmem.buf_ptr =3D protmem->paddr;
> > +     msg_arg->params[1].u.tmem.size =3D protmem->size;
> > +     msg_arg->params[1].u.tmem.shm_ref =3D (u_long)protmem;
> > +
> > +     rc =3D optee->ops->do_call_with_arg(optee->ctx, shm, offs, false)=
;
> > +     if (rc)
> > +             goto out;
> > +     if (msg_arg->ret !=3D TEEC_SUCCESS) {
> > +             rc =3D -EINVAL;
> > +             goto out;
> > +     }
> > +     protmem->sec_world_id =3D (u_long)protmem;
> > +
> > +out:
> > +     optee_free_msg_arg(optee->ctx, entry, offs);
> > +     return rc;
> > +}
> > +
> > +static int optee_smc_reclaim_protmem(struct optee *optee,
> > +                                  struct tee_shm *protmem)
> > +{
> > +     struct optee_shm_arg_entry *entry;
> > +     struct optee_msg_arg *msg_arg;
> > +     struct tee_shm *shm;
> > +     u_int offs;
> > +     int rc;
> > +
> > +     msg_arg =3D optee_get_msg_arg(optee->ctx, 1, &entry, &shm, &offs)=
;
> > +     if (IS_ERR(msg_arg))
> > +             return PTR_ERR(msg_arg);
> > +
> > +     msg_arg->cmd =3D OPTEE_MSG_CMD_RECLAIM_PROTMEM;
> > +     msg_arg->params[0].attr =3D OPTEE_MSG_ATTR_TYPE_RMEM_INPUT;
> > +     msg_arg->params[0].u.rmem.shm_ref =3D (u_long)protmem;
> > +
> > +     rc =3D optee->ops->do_call_with_arg(optee->ctx, shm, offs, false)=
;
> > +     if (rc)
> > +             goto out;
> > +     if (msg_arg->ret !=3D TEEC_SUCCESS)
> > +             rc =3D -EINVAL;
> > +
> > +out:
> > +     optee_free_msg_arg(optee->ctx, entry, offs);
> > +     return rc;
> > +}
> > +
> >  /*
> >   * 5. Asynchronous notification
> >   */
> > @@ -1216,6 +1280,8 @@ static const struct optee_ops optee_ops =3D {
> >       .do_call_with_arg =3D optee_smc_do_call_with_arg,
> >       .to_msg_param =3D optee_to_msg_param,
> >       .from_msg_param =3D optee_from_msg_param,
> > +     .lend_protmem =3D optee_smc_lend_protmem,
> > +     .reclaim_protmem =3D optee_smc_reclaim_protmem,
> >  };
> >
> >  static int enable_async_notif(optee_invoke_fn *invoke_fn)
> > @@ -1586,11 +1652,14 @@ static inline int optee_load_fw(struct platform=
_device *pdev,
> >
> >  static int optee_protmem_pool_init(struct optee *optee)
> >  {
> > +     bool protm =3D optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_PROTMEM;
> > +     bool dyn_protm =3D optee->smc.sec_caps &
> > +                      OPTEE_SMC_SEC_CAP_DYNAMIC_PROTMEM;
> >       enum tee_dma_heap_id heap_id =3D TEE_DMA_HEAP_SECURE_VIDEO_PLAY;
> > -     struct tee_protmem_pool *pool;
> > -     int rc;
> > +     struct tee_protmem_pool *pool =3D ERR_PTR(-EINVAL);
> > +     int rc =3D -EINVAL;
> >
> > -     if (optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_PROTMEM) {
> > +     if (protm) {
> >               union {
> >                       struct arm_smccc_res smccc;
> >                       struct optee_smc_get_protmem_config_result result=
;
> > @@ -1598,26 +1667,26 @@ static int optee_protmem_pool_init(struct optee=
 *optee)
> >
> >               optee->smc.invoke_fn(OPTEE_SMC_GET_PROTMEM_CONFIG, 0, 0, =
0, 0,
> >                                    0, 0, 0, &res.smccc);
> > -             if (res.result.status !=3D OPTEE_SMC_RETURN_OK) {
> > -                     pr_err("Secure Data Path service not available\n"=
);
> > -                     return 0;
> > -             }
> > -             rc =3D optee_set_dma_mask(optee, res.result.pa_width);
> > +             if (res.result.status =3D=3D OPTEE_SMC_RETURN_OK)
> > +                     rc =3D optee_set_dma_mask(optee, res.result.pa_wi=
dth);
>
> This change should be folded in patch 7/9.

OK

>
> >               if (!rc)
> >                       pool =3D tee_protmem_static_pool_alloc(res.result=
.start,
> >                                                            res.result.s=
ize);
> > -             if (IS_ERR(pool))
> > -                     return PTR_ERR(pool);
> > +     }
> >
> > +     if (dyn_protm && IS_ERR(pool))
> > +             pool =3D optee_protmem_alloc_dyn_pool(optee, heap_id);
> > +
> > +     if (!IS_ERR(pool)) {
> >               rc =3D tee_device_register_dma_heap(optee->teedev, heap_i=
d, pool);
> >               if (rc)
> > -                     goto err;
> > +                     pool->ops->destroy_pool(pool);
> >       }
> >
> > +     if (protm || dyn_protm)
> > +             return rc;
> > +
> >       return 0;
> > -err:
> > -     pool->ops->destroy_pool(pool);
> > -     return rc;
> >  }
> >
> >  static int optee_probe(struct platform_device *pdev)
> > @@ -1788,9 +1857,8 @@ static int optee_probe(struct platform_device *pd=
ev)
> >               pr_info("Asynchronous notifications enabled\n");
> >       }
> >
> > -     rc =3D optee_protmem_pool_init(optee);
> > -     if (rc)
> > -             goto err_notif_uninit;
> > +     if (optee_protmem_pool_init(optee))
> > +             pr_info("Protected memory service not available\n");
>
> This change can be folded in patch 7/9.

Yes, that makes sense.

Cheers,
Jens

>
> Rest looks good to me.
>
> -Sumit
>
> >
> >       /*
> >        * Ensure that there are no pre-existing shm objects before enabl=
ing
> > --
> > 2.43.0
> >

