Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51B5EC35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 08:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5eOMTRp7OLNI3VGicdgRH0lRnyRYz67Gt/EAnTu6nbQ=; b=SSTSaFxVpbLHW4ULcHJgEuupjq
	8thRJ/PI2KK3Oqw+2OZItZdj+4TSSuE98KjGvnol2H2xIobC/kj7zCEPMqIrfr45mi/gb6s6ttukV
	TApGD7dUb7WWa9bLF7xWk4RkrzQ9v+U83cYXeYlp8lAqMzgaMPV7dD1TXL/K9sHGYHUtO2k2+oS0P
	R2t1cfZ5b0biWje9l4qefVL3zKfebi2Gpg5R/rPDZ5Vl/8rwJcsjnmHYZlDe3Auk679HKzuOPpz40
	vpNUkJ5ZQGoi/9760koJB5wZkWZFUhDDbUJYdjWvi3yUQUWvZfwYzDaDGcYR83/NqKJUX81BMQh9T
	9f+cs+3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tx02M-00000005FNX-3Rt2;
	Tue, 25 Mar 2025 08:53:30 +0000
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twzzl-00000005F4T-0ANp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 08:50:50 +0000
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-6003d977ab7so3121904eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Mar 2025 01:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742892647; x=1743497447; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5eOMTRp7OLNI3VGicdgRH0lRnyRYz67Gt/EAnTu6nbQ=;
        b=yMe+KdQQqbdBev+aPZUo01bwZ+Mr4erxohcbr/cgCjipPN6RGZgZINWHx8m5SPVLuj
         pqb6msRzV4R1IXjFk/az3jW3NPj/4Oh1UavvOzltvrSa1wqWVMNb7JzZXD1LxRjRm5ZW
         4JhYrYeu8xu/dfAHc12FU576u7i5npR0Mx6WFXt94dXdOUuwDNumR29P2ZAeMZRtj+BX
         j5cw11qq4LJR5P88Y5DMAvhGqI21R5b87ZlmF1Ex8TUG7ppnmiheSrNv4uXY8YpAwLFW
         YTN3tT6X7o1M3lIT1BZaO9wCT4RSMyn/NHx39nQJ4r7PcK2iROI9PF4N5TWNgtNfNFPi
         uqEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742892647; x=1743497447;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5eOMTRp7OLNI3VGicdgRH0lRnyRYz67Gt/EAnTu6nbQ=;
        b=nJNCKvmmhvD4tdNINaO43hKecA+0scSKw9HHJYG5r2e+AMrpZKyZdy3WTVMSVzfE3X
         V/LjjsB0d03TZjUax6qJVDlcN4/hyROLqc8eQYEU2KI4nrVurss0wxb27KpA5wre3wax
         mQnfOQeIR5mPZ7BZi/MvBFG/iN2L4BdPMZtZNBMdfq+vG8Vl6u8VXAxL9rD7dE2QmKVQ
         9nWMTiAlnedjlHET7AlyDHc1Sx1U3Ie6fDKJNtVEIRYmWAqIzl0LJJ0FphbCa7UG8tOE
         8DyaOM/Tu/2unaOKlFtcsPxvqBHAuqC3NMqtMaRowSGu9BFzbDYNi4zFdN34oAzunXDC
         7/5g==
X-Forwarded-Encrypted: i=1; AJvYcCVCjXJoDFI/IZkTV3i7ERH42XosZRtpPzXB+P+qZBqjGTA8EURykgzqs1cuTY/ld2xrATbxpIVGqU6ctCfm4Bj1@lists.infradead.org
X-Gm-Message-State: AOJu0YwcVsp8qUXf3PLWd3rBv054k8pAgR4mKJVtyHcVBaI6/G2E79GN
	Vo64qvDsky5zOyzjJ/E2Q4HfauWhOSnyk9wI1I1dp1IRqrJHAlZkqJ3uTQJrb7tIPtlq1OinG28
	eDGJsEBxQJsaKYDa7pl8zz7Fuicny8Fkfw5+yHg==
X-Gm-Gg: ASbGncv9miMNw7BCaOsX2rQszW4OPlHvehmr0TaPeaEUv5I9MgiJYcY9C0s6mkRNfRe
	DfL4hS79jZKwMyX0nlOmslC5cvCpshqN2ulbRy7tmf70reeZGi3MMyVtaH+1flKQ0lFAvscsXwW
	PGNwsi/o6UxFe2ARkjwfe8AZuh5xE=
X-Google-Smtp-Source: AGHT+IE1lc0Le+Xn4IPuxfRnWH1Z92SoqlO8A5APVOUx7ahbqOTcRxJtSaNA/0G1hYCe0KPtkwaeflutY9Bv2ysJ0iU=
X-Received: by 2002:a05:6871:c714:b0:2b8:84d7:ddd5 with SMTP id
 586e51a60fabf-2c78054a998mr9647125fac.39.1742892647207; Tue, 25 Mar 2025
 01:50:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250305130634.1850178-1-jens.wiklander@linaro.org>
 <20250305130634.1850178-4-jens.wiklander@linaro.org> <Z9K2RQYuXSJc8Y1E@sumit-X1>
 <CAHUa44H5Zc_POJ_RWaVd4iFVagRkFaN+8Ajs=19FKboZapbQHw@mail.gmail.com>
 <Z9vfD4UWSrqSTPnP@sumit-X1> <CAHUa44HY-jZCoDXKnx-f4gBoABRVdh1+6PA1AYHSva9aL=rDAA@mail.gmail.com>
 <Z-JFagmbZBQd0hoM@sumit-X1>
In-Reply-To: <Z-JFagmbZBQd0hoM@sumit-X1>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 25 Mar 2025 09:50:35 +0100
X-Gm-Features: AQ5f1JqCL9i7_V-pA06IP3-j62y0ZfeHI3kPwPORgKYNirOFYekFlp01JSrl9PM
Message-ID: <CAHUa44HXHwR1_LbjG6T5OqnafXiS4-kHeKjV9TurGORx3SsprQ@mail.gmail.com>
Subject: Re: [PATCH v6 03/10] optee: account for direction while converting parameters
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
X-CRM114-CacheID: sfid-20250325_015049_104480_CAA4C30E 
X-CRM114-Status: GOOD (  31.58  )
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

On Tue, Mar 25, 2025 at 6:56=E2=80=AFAM Sumit Garg <sumit.garg@kernel.org> =
wrote:
>
> On Thu, Mar 20, 2025 at 02:00:57PM +0100, Jens Wiklander wrote:
> > Hi Sumit,
> >
> > On Thu, Mar 20, 2025 at 10:25=E2=80=AFAM Sumit Garg <sumit.garg@kernel.=
org> wrote:
> > >
> > > Hi Jens,
> > >
> > > On Mon, Mar 17, 2025 at 08:42:01AM +0100, Jens Wiklander wrote:
> > > > Hi Sumit,
> > > >
> > > > On Thu, Mar 13, 2025 at 11:41=E2=80=AFAM Sumit Garg <sumit.garg@ker=
nel.org> wrote:
> > > > >
> > > > > Hi Jens,
> > > > >
> > > > > On Wed, Mar 05, 2025 at 02:04:09PM +0100, Jens Wiklander wrote:
> > > > > > The OP-TEE backend driver has two internal function pointers to=
 convert
> > > > > > between the subsystem type struct tee_param and the OP-TEE type=
 struct
> > > > > > optee_msg_param.
> > > > > >
> > > > > > The conversion is done from one of the types to the other, whic=
h is then
> > > > > > involved in some operation and finally converted back to the or=
iginal
> > > > > > type. When converting to prepare the parameters for the operati=
on, all
> > > > > > fields must be taken into account, but then converting back, it=
's enough
> > > > > > to update only out-values and out-sizes. So, an update_out para=
meter is
> > > > > > added to the conversion functions to tell if all or only some f=
ields
> > > > > > must be copied.
> > > > > >
> > > > > > This is needed in a later patch where it might get confusing wh=
en
> > > > > > converting back in from_msg_param() callback since an allocated
> > > > > > restricted SHM can be using the sec_world_id of the used restri=
cted
> > > > > > memory pool and that doesn't translate back well.
> > > > > >
> > > > > > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > > > > > ---
> > > > > >  drivers/tee/optee/call.c          | 10 ++--
> > > > > >  drivers/tee/optee/ffa_abi.c       | 43 +++++++++++++----
> > > > > >  drivers/tee/optee/optee_private.h | 42 +++++++++++------
> > > > > >  drivers/tee/optee/rpc.c           | 31 +++++++++----
> > > > > >  drivers/tee/optee/smc_abi.c       | 76 +++++++++++++++++++++++=
--------
> > > > > >  5 files changed, 144 insertions(+), 58 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/tee/optee/call.c b/drivers/tee/optee/call.=
c
> > > > > > index 16eb953e14bb..f1533b894726 100644
> > > > > > --- a/drivers/tee/optee/call.c
> > > > > > +++ b/drivers/tee/optee/call.c
> > > > > > @@ -400,7 +400,8 @@ int optee_open_session(struct tee_context *=
ctx,
> > > > > >       export_uuid(msg_arg->params[1].u.octets, &client_uuid);
> > > > > >
> > > > > >       rc =3D optee->ops->to_msg_param(optee, msg_arg->params + =
2,
> > > > > > -                                   arg->num_params, param);
> > > > > > +                                   arg->num_params, param,
> > > > > > +                                   false /*!update_out*/);
> > > > > >       if (rc)
> > > > > >               goto out;
> > > > > >
> > > > > > @@ -427,7 +428,8 @@ int optee_open_session(struct tee_context *=
ctx,
> > > > > >       }
> > > > > >
> > > > > >       if (optee->ops->from_msg_param(optee, param, arg->num_par=
ams,
> > > > > > -                                    msg_arg->params + 2)) {
> > > > > > +                                    msg_arg->params + 2,
> > > > > > +                                    true /*update_out*/)) {
> > > > > >               arg->ret =3D TEEC_ERROR_COMMUNICATION;
> > > > > >               arg->ret_origin =3D TEEC_ORIGIN_COMMS;
> > > > > >               /* Close session again to avoid leakage */
> > > > > > @@ -541,7 +543,7 @@ int optee_invoke_func(struct tee_context *c=
tx, struct tee_ioctl_invoke_arg *arg,
> > > > > >       msg_arg->cancel_id =3D arg->cancel_id;
> > > > > >
> > > > > >       rc =3D optee->ops->to_msg_param(optee, msg_arg->params, a=
rg->num_params,
> > > > > > -                                   param);
> > > > > > +                                   param, false /*!update_out*=
/);
> > > > > >       if (rc)
> > > > > >               goto out;
> > > > > >
> > > > > > @@ -551,7 +553,7 @@ int optee_invoke_func(struct tee_context *c=
tx, struct tee_ioctl_invoke_arg *arg,
> > > > > >       }
> > > > > >
> > > > > >       if (optee->ops->from_msg_param(optee, param, arg->num_par=
ams,
> > > > > > -                                    msg_arg->params)) {
> > > > > > +                                    msg_arg->params, true /*up=
date_out*/)) {
> > > > > >               msg_arg->ret =3D TEEC_ERROR_COMMUNICATION;
> > > > > >               msg_arg->ret_origin =3D TEEC_ORIGIN_COMMS;
> > > > > >       }
> > > > > > diff --git a/drivers/tee/optee/ffa_abi.c b/drivers/tee/optee/ff=
a_abi.c
> > > > > > index 4ca1d5161b82..e4b08cd195f3 100644
> > > > > > --- a/drivers/tee/optee/ffa_abi.c
> > > > > > +++ b/drivers/tee/optee/ffa_abi.c
> > > > > > @@ -122,15 +122,21 @@ static int optee_shm_rem_ffa_handle(struc=
t optee *optee, u64 global_id)
> > > > > >   */
> > > > > >
> > > > > >  static void from_msg_param_ffa_mem(struct optee *optee, struct=
 tee_param *p,
> > > > > > -                                u32 attr, const struct optee_m=
sg_param *mp)
> > > > > > +                                u32 attr, const struct optee_m=
sg_param *mp,
> > > > > > +                                bool update_out)
> > > > > >  {
> > > > > >       struct tee_shm *shm =3D NULL;
> > > > > >       u64 offs_high =3D 0;
> > > > > >       u64 offs_low =3D 0;
> > > > > >
> > > > > > +     if (update_out) {
> > > > > > +             if (attr =3D=3D OPTEE_MSG_ATTR_TYPE_FMEM_INPUT)
> > > > > > +                     return;
> > > > > > +             goto out;
> > > > > > +     }
> > > > > > +
> > > > > >       p->attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT +
> > > > > >                 attr - OPTEE_MSG_ATTR_TYPE_FMEM_INPUT;
> > > > > > -     p->u.memref.size =3D mp->u.fmem.size;
> > > > > >
> > > > > >       if (mp->u.fmem.global_id !=3D OPTEE_MSG_FMEM_INVALID_GLOB=
AL_ID)
> > > > > >               shm =3D optee_shm_from_ffa_handle(optee, mp->u.fm=
em.global_id);
> > > > > > @@ -141,6 +147,8 @@ static void from_msg_param_ffa_mem(struct o=
ptee *optee, struct tee_param *p,
> > > > > >               offs_high =3D mp->u.fmem.offs_high;
> > > > > >       }
> > > > > >       p->u.memref.shm_offs =3D offs_low | offs_high << 32;
> > > > > > +out:
> > > > > > +     p->u.memref.size =3D mp->u.fmem.size;
> > > > > >  }
> > > > > >
> > > > > >  /**
> > > > > > @@ -150,12 +158,14 @@ static void from_msg_param_ffa_mem(struct=
 optee *optee, struct tee_param *p,
> > > > > >   * @params:  subsystem internal parameter representation
> > > > > >   * @num_params:      number of elements in the parameter array=
s
> > > > > >   * @msg_params:      OPTEE_MSG parameters
> > > > > > + * @update_out: update parameter for output only
> > > > > >   *
> > > > > >   * Returns 0 on success or <0 on failure
> > > > > >   */
> > > > > >  static int optee_ffa_from_msg_param(struct optee *optee,
> > > > > >                                   struct tee_param *params, siz=
e_t num_params,
> > > > > > -                                 const struct optee_msg_param =
*msg_params)
> > > > > > +                                 const struct optee_msg_param =
*msg_params,
> > > > > > +                                 bool update_out)
> > > > > >  {
> > > > > >       size_t n;
> > > > > >
> > > > > > @@ -166,18 +176,20 @@ static int optee_ffa_from_msg_param(struc=
t optee *optee,
> > > > > >
> > > > > >               switch (attr) {
> > > > > >               case OPTEE_MSG_ATTR_TYPE_NONE:
> > > > > > +                     if (update_out)
> > > > > > +                             break;
> > > > > >                       p->attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_NON=
E;
> > > > > >                       memset(&p->u, 0, sizeof(p->u));
> > > > > >                       break;
> > > > > >               case OPTEE_MSG_ATTR_TYPE_VALUE_INPUT:
> > > > > >               case OPTEE_MSG_ATTR_TYPE_VALUE_OUTPUT:
> > > > > >               case OPTEE_MSG_ATTR_TYPE_VALUE_INOUT:
> > > > > > -                     optee_from_msg_param_value(p, attr, mp);
> > > > > > +                     optee_from_msg_param_value(p, attr, mp, u=
pdate_out);
> > > > > >                       break;
> > > > > >               case OPTEE_MSG_ATTR_TYPE_FMEM_INPUT:
> > > > > >               case OPTEE_MSG_ATTR_TYPE_FMEM_OUTPUT:
> > > > > >               case OPTEE_MSG_ATTR_TYPE_FMEM_INOUT:
> > > > > > -                     from_msg_param_ffa_mem(optee, p, attr, mp=
);
> > > > > > +                     from_msg_param_ffa_mem(optee, p, attr, mp=
, update_out);
> > > > > >                       break;
> > > > > >               default:
> > > > > >                       return -EINVAL;
> > > > > > @@ -188,10 +200,16 @@ static int optee_ffa_from_msg_param(struc=
t optee *optee,
> > > > > >  }
> > > > > >
> > > > > >  static int to_msg_param_ffa_mem(struct optee_msg_param *mp,
> > > > > > -                             const struct tee_param *p)
> > > > > > +                             const struct tee_param *p, bool u=
pdate_out)
> > > > > >  {
> > > > > >       struct tee_shm *shm =3D p->u.memref.shm;
> > > > > >
> > > > > > +     if (update_out) {
> > > > > > +             if (p->attr =3D=3D TEE_IOCTL_PARAM_ATTR_TYPE_MEMR=
EF_INPUT)
> > > > > > +                     return 0;
> > > > > > +             goto out;
> > > > > > +     }
> > > > > > +
> > > > > >       mp->attr =3D OPTEE_MSG_ATTR_TYPE_FMEM_INPUT + p->attr -
> > > > > >                  TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT;
> > > > > >
> > > > > > @@ -211,6 +229,7 @@ static int to_msg_param_ffa_mem(struct opte=
e_msg_param *mp,
> > > > > >               memset(&mp->u, 0, sizeof(mp->u));
> > > > > >               mp->u.fmem.global_id =3D OPTEE_MSG_FMEM_INVALID_G=
LOBAL_ID;
> > > > > >       }
> > > > > > +out:
> > > > > >       mp->u.fmem.size =3D p->u.memref.size;
> > > > > >
> > > > > >       return 0;
> > > > > > @@ -222,13 +241,15 @@ static int to_msg_param_ffa_mem(struct op=
tee_msg_param *mp,
> > > > > >   * @optee:   main service struct
> > > > > >   * @msg_params:      OPTEE_MSG parameters
> > > > > >   * @num_params:      number of elements in the parameter array=
s
> > > > > > - * @params:  subsystem itnernal parameter representation
> > > > > > + * @params:  subsystem internal parameter representation
> > > > > > + * @update_out: update parameter for output only
> > > > > >   * Returns 0 on success or <0 on failure
> > > > > >   */
> > > > > >  static int optee_ffa_to_msg_param(struct optee *optee,
> > > > > >                                 struct optee_msg_param *msg_par=
ams,
> > > > > >                                 size_t num_params,
> > > > > > -                               const struct tee_param *params)
> > > > > > +                               const struct tee_param *params,
> > > > > > +                               bool update_out)
> > > > > >  {
> > > > > >       size_t n;
> > > > > >
> > > > > > @@ -238,18 +259,20 @@ static int optee_ffa_to_msg_param(struct =
optee *optee,
> > > > > >
> > > > > >               switch (p->attr) {
> > > > > >               case TEE_IOCTL_PARAM_ATTR_TYPE_NONE:
> > > > > > +                     if (update_out)
> > > > > > +                             break;
> > > > > >                       mp->attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_NO=
NE;
> > > > > >                       memset(&mp->u, 0, sizeof(mp->u));
> > > > > >                       break;
> > > > > >               case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT:
> > > > > >               case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT:
> > > > > >               case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT:
> > > > > > -                     optee_to_msg_param_value(mp, p);
> > > > > > +                     optee_to_msg_param_value(mp, p, update_ou=
t);
> > > > > >                       break;
> > > > > >               case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
> > > > > >               case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
> > > > > >               case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
> > > > > > -                     if (to_msg_param_ffa_mem(mp, p))
> > > > > > +                     if (to_msg_param_ffa_mem(mp, p, update_ou=
t))
> > > > > >                               return -EINVAL;
> > > > > >                       break;
> > > > > >               default:
> > > > >
> > > > > Can we rather handle it as follows to improve code readability an=
d
> > > > > maintainence long term? Ditto for all other places.
> > > > >
> > > > > static int optee_ffa_to_msg_param(struct optee *optee,
> > > > >                                   struct optee_msg_param *msg_par=
ams,
> > > > >                                   size_t num_params,
> > > > >                                   const struct tee_param *params,
> > > > >                                   bool update_out)
> > > > > {
> > > > >         size_t n;
> > > > >
> > > > >         for (n =3D 0; n < num_params; n++) {
> > > > >                 const struct tee_param *p =3D params + n;
> > > > >                 struct optee_msg_param *mp =3D msg_params + n;
> > > > >
> > > > >                 if (update_out && (p->attr =3D=3D TEE_IOCTL_PARAM=
_ATTR_TYPE_NONE ||
> > > > >                      p->attr =3D=3D TEE_IOCTL_PARAM_ATTR_TYPE_VAL=
UE_INPUT ||
> > > > >                      p->attr =3D=3D TEE_IOCTL_PARAM_ATTR_TYPE_MEM=
REF_INPUT))
> > > > >                     continue;
> > > >
> > > > You're missing updating the length field for memrefs.
> > > >
> > >
> > > Do we need to update length field for input memrefs when update_out i=
s
> > > set? I don't see that happening in your existing patch too.
> >
> > I'm sorry, I was unclear. The update_out parameter means only the
> > output fields should be updated, not the attribute, offsets, ids, etc.
> > That is, the length field for memrefs, and the value fields a, b, c
> > for value params. Some of the memrefs aren't translated one-to-one
> > with SDP, but the length field can and must be updated.
>
> Isn't it rather better to add another attribute type to handled SDP
> special handling?

This isn't special handling, all parameters get the same treatment.
When updating a parameter after it has been used, this is all that
needs to be done, regardless of whether it's an SDP buffer. The
updates we did before this patch were redundant.

This patch was introduced in the v3 of this patch set, but I don't
think it's strictly needed any longer since SDP buffers are allocated
differently now. I think it's nice to only update what's needed when
translating back a parameter (just as in params_to_user() in
drivers/tee/tee_core.c), but if you don't like it, we can drop this
patch.

Cheers,
Jens

>
> -Sumit
>
> >
> > Cheers,
> > Jens
> >
> > >
> > > -Sumit
> > >
> > > > Cheers,
> > > > Jens
> > > >
> > > > >
> > > > >                 switch (p->attr) {
> > > > >                 case TEE_IOCTL_PARAM_ATTR_TYPE_NONE:
> > > > >                         mp->attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_NO=
NE;
> > > > >                         memset(&mp->u, 0, sizeof(mp->u));
> > > > >                         break;
> > > > >                 case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT:
> > > > >                 case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT:
> > > > >                 case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT:
> > > > >                         optee_to_msg_param_value(mp, p);
> > > > >                         break;
> > > > >                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
> > > > >                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
> > > > >                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
> > > > >                         if (to_msg_param_ffa_mem(mp, p))
> > > > >                                 return -EINVAL;
> > > > >                         break;
> > > > >                 default:
> > > > >                         return -EINVAL;
> > > > >                 }
> > > > >         }
> > > > >
> > > > >         return 0;
> > > > > }
> > > > >
> > > > > -Sumit

