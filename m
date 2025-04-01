Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 131AFC36014
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 08:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yiyUylgNj0KhP1gV9OJYcgs4XinI2xVJqn29LGEvQAQ=; b=eCFylKmJMhyMeO2J26UOzUvXAl
	0j5pO8ETLuU4oL9/P1T2Tk3RnEkIstF9DOSgeMRsYj+JOcmi34lt6ikGU58XBb4zU03LMpcZR7Kwr
	DusVZqo1cdVAw6mDA8l5eZM6l1pdEbZQOhsDTLT9D+6QL+b2/yfgCeY6bu4WSAIIJplay2bf4ty1w
	VNfoIZdzj2ziiyGhMJVyU8Y293PC2VtLwjl4A0wjvdRNQ6a0CXbOHnH+58RkrmV6PBJrm83F+NCv+
	/b9YsjuycW/gZPDkn8fsLQmVwIzxNwFhcz8Y7exjyubi69gVUvKhN2earE5ak30qwgACztMaryauY
	8426Merw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzWuZ-00000002Jo8-2gag;
	Tue, 01 Apr 2025 08:23:55 +0000
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzWsm-00000002JXN-2lQZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 08:22:05 +0000
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-2c6ed7ec0a5so1943646fac.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Apr 2025 01:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743495723; x=1744100523; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yiyUylgNj0KhP1gV9OJYcgs4XinI2xVJqn29LGEvQAQ=;
        b=IQBptvDOwR4aIZMr0PHEjCafFMYMgfgbQYT0PmtYYrFI7PY+iwpmRVCS2XjDF3NHCT
         wL7CnCbXF6A63/imTuqjpaXObyUmYM+M79MNm/e+Z5ptHM564D00wACNHucyMu2/CSNn
         vPcpHP484L5t2blG9ae454KQ2NDHM0xLHbzm0TeefPYta8lhDgrxDPxNbMd5awinlZba
         zmkROQmwf77hIInid+w2YCpGszps0L8AkehBi4MHMP3jA3e8H8Y1I9WF2AAz8y5sLoDy
         voWNRpe58yR8BLpXsbFBbpq9UGS1ymAAY/Ob7yqOKi5hYWLllL3VNrah9kz3Y3qjB5Ou
         piOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743495723; x=1744100523;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yiyUylgNj0KhP1gV9OJYcgs4XinI2xVJqn29LGEvQAQ=;
        b=JRgl4hoMp4dXh9BWajExv+EdjxMaCpMfQsEPa6SYb0y7Eicq7//xjTpD4yVVDUVZYO
         SEjC1ncCO7hPtmYsAgzmKYhAI8endrtJVSNSZfiyUspzyqDDHp3yH/JjVWO9vxgqH0QK
         jfsS0aj9i5F39izLFHNp2aQ4HDk+94OvLyPVNU8zp6rFkhRQIXsh9R55Ut73sXMGZCiP
         lpDHZ9raaBQILtWm3Bv19f5CRZzywMM+zxefCCC3WbJ9XO9Inhw2cgnbg/6vO7z1lgGW
         r2dfKL4WE8omrBRMnQara4bPBCNUHcwLR8i3OxkR7/5GYa2FUO5IuAjK4IT+8SXe8NR6
         sQjQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/Z2MaSsyV20OIjnTg/R1KuconMuOTGSKyN4fN73Gf+UjpxFyA7+g0OTfPHpAwZsSOUT2054oNOkj6UPJ9Pyk1@lists.infradead.org
X-Gm-Message-State: AOJu0Yx821VO0cVBi3opHZYX47BLqZoy6+dIGSCXuMu3Rb1tCuRXRjak
	OYbholGZYdGy99iDiVY61hXKd92s94BB02hUnNwuJo8xXTmnRY+AGpeu9hoa/s2W94B5SvdoFts
	ZbzIUobnRutZlPGkkMzHl8Ezhsyi3ikNdS4nlYg==
X-Gm-Gg: ASbGnctISa8I58Dkqc4aN4AmrH9oyEZYTq/bEsOG5KR2q4DwiAKCB1cp2znhOpOotHK
	ci8RD9WSImSCLxUWVc+56KCvUAjvZ30woPRkMLcBjZLWTpfMwenFxT91oEpYkkkdPzY2dv3HiKg
	0rboh3W+zKD3L1a/Fgt0pnqEijMCU=
X-Google-Smtp-Source: AGHT+IHQrLip9KtlOqxbbez8ZnW6S7GCS3wdzafpheotUg4HikBKc88AjJXrfgSQp1f5tosuW11aL0SlwQS0uy8o6Lo=
X-Received: by 2002:a05:6870:4d1b:b0:29e:27b6:bea5 with SMTP id
 586e51a60fabf-2cbcf765f94mr7162033fac.25.1743495721029; Tue, 01 Apr 2025
 01:22:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250305130634.1850178-1-jens.wiklander@linaro.org>
 <20250305130634.1850178-4-jens.wiklander@linaro.org> <Z9K2RQYuXSJc8Y1E@sumit-X1>
 <CAHUa44H5Zc_POJ_RWaVd4iFVagRkFaN+8Ajs=19FKboZapbQHw@mail.gmail.com>
 <Z9vfD4UWSrqSTPnP@sumit-X1> <CAHUa44HY-jZCoDXKnx-f4gBoABRVdh1+6PA1AYHSva9aL=rDAA@mail.gmail.com>
 <Z-JFagmbZBQd0hoM@sumit-X1> <CAHUa44HXHwR1_LbjG6T5OqnafXiS4-kHeKjV9TurGORx3SsprQ@mail.gmail.com>
 <Z-uZfdU94J5yPU78@sumit-X1>
In-Reply-To: <Z-uZfdU94J5yPU78@sumit-X1>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 1 Apr 2025 10:21:49 +0200
X-Gm-Features: AQ5f1Jq7caI7eI2iG0axymTG4KA8wqjbCG7bG2dfLRLI_4bbEaejFDQ1A6KndhA
Message-ID: <CAHUa44F_kKjarz46NVRJ5oeJNOZfSsPN=-JcHz2FZwLMDiPawg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250401_012204_711187_C2FCB5D3 
X-CRM114-Status: GOOD (  33.16  )
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

On Tue, Apr 1, 2025 at 9:45=E2=80=AFAM Sumit Garg <sumit.garg@kernel.org> w=
rote:
>
> On Tue, Mar 25, 2025 at 09:50:35AM +0100, Jens Wiklander wrote:
> > On Tue, Mar 25, 2025 at 6:56=E2=80=AFAM Sumit Garg <sumit.garg@kernel.o=
rg> wrote:
> > >
> > > On Thu, Mar 20, 2025 at 02:00:57PM +0100, Jens Wiklander wrote:
> > > > Hi Sumit,
> > > >
> > > > On Thu, Mar 20, 2025 at 10:25=E2=80=AFAM Sumit Garg <sumit.garg@ker=
nel.org> wrote:
> > > > >
> > > > > Hi Jens,
> > > > >
> > > > > On Mon, Mar 17, 2025 at 08:42:01AM +0100, Jens Wiklander wrote:
> > > > > > Hi Sumit,
> > > > > >
> > > > > > On Thu, Mar 13, 2025 at 11:41=E2=80=AFAM Sumit Garg <sumit.garg=
@kernel.org> wrote:
> > > > > > >
> > > > > > > Hi Jens,
> > > > > > >
> > > > > > > On Wed, Mar 05, 2025 at 02:04:09PM +0100, Jens Wiklander wrot=
e:
> > > > > > > > The OP-TEE backend driver has two internal function pointer=
s to convert
> > > > > > > > between the subsystem type struct tee_param and the OP-TEE =
type struct
> > > > > > > > optee_msg_param.
> > > > > > > >
> > > > > > > > The conversion is done from one of the types to the other, =
which is then
> > > > > > > > involved in some operation and finally converted back to th=
e original
> > > > > > > > type. When converting to prepare the parameters for the ope=
ration, all
> > > > > > > > fields must be taken into account, but then converting back=
, it's enough
> > > > > > > > to update only out-values and out-sizes. So, an update_out =
parameter is
> > > > > > > > added to the conversion functions to tell if all or only so=
me fields
> > > > > > > > must be copied.
> > > > > > > >
> > > > > > > > This is needed in a later patch where it might get confusin=
g when
> > > > > > > > converting back in from_msg_param() callback since an alloc=
ated
> > > > > > > > restricted SHM can be using the sec_world_id of the used re=
stricted
> > > > > > > > memory pool and that doesn't translate back well.
> > > > > > > >
> > > > > > > > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > > > > > > > ---
> > > > > > > >  drivers/tee/optee/call.c          | 10 ++--
> > > > > > > >  drivers/tee/optee/ffa_abi.c       | 43 +++++++++++++----
> > > > > > > >  drivers/tee/optee/optee_private.h | 42 +++++++++++------
> > > > > > > >  drivers/tee/optee/rpc.c           | 31 +++++++++----
> > > > > > > >  drivers/tee/optee/smc_abi.c       | 76 +++++++++++++++++++=
++++--------
> > > > > > > >  5 files changed, 144 insertions(+), 58 deletions(-)
> > > > > > > >
> > > > > > > > diff --git a/drivers/tee/optee/call.c b/drivers/tee/optee/c=
all.c
> > > > > > > > index 16eb953e14bb..f1533b894726 100644
> > > > > > > > --- a/drivers/tee/optee/call.c
> > > > > > > > +++ b/drivers/tee/optee/call.c
> > > > > > > > @@ -400,7 +400,8 @@ int optee_open_session(struct tee_conte=
xt *ctx,
> > > > > > > >       export_uuid(msg_arg->params[1].u.octets, &client_uuid=
);
> > > > > > > >
> > > > > > > >       rc =3D optee->ops->to_msg_param(optee, msg_arg->param=
s + 2,
> > > > > > > > -                                   arg->num_params, param)=
;
> > > > > > > > +                                   arg->num_params, param,
> > > > > > > > +                                   false /*!update_out*/);
> > > > > > > >       if (rc)
> > > > > > > >               goto out;
> > > > > > > >
> > > > > > > > @@ -427,7 +428,8 @@ int optee_open_session(struct tee_conte=
xt *ctx,
> > > > > > > >       }
> > > > > > > >
> > > > > > > >       if (optee->ops->from_msg_param(optee, param, arg->num=
_params,
> > > > > > > > -                                    msg_arg->params + 2)) =
{
> > > > > > > > +                                    msg_arg->params + 2,
> > > > > > > > +                                    true /*update_out*/)) =
{
> > > > > > > >               arg->ret =3D TEEC_ERROR_COMMUNICATION;
> > > > > > > >               arg->ret_origin =3D TEEC_ORIGIN_COMMS;
> > > > > > > >               /* Close session again to avoid leakage */
> > > > > > > > @@ -541,7 +543,7 @@ int optee_invoke_func(struct tee_contex=
t *ctx, struct tee_ioctl_invoke_arg *arg,
> > > > > > > >       msg_arg->cancel_id =3D arg->cancel_id;
> > > > > > > >
> > > > > > > >       rc =3D optee->ops->to_msg_param(optee, msg_arg->param=
s, arg->num_params,
> > > > > > > > -                                   param);
> > > > > > > > +                                   param, false /*!update_=
out*/);
> > > > > > > >       if (rc)
> > > > > > > >               goto out;
> > > > > > > >
> > > > > > > > @@ -551,7 +553,7 @@ int optee_invoke_func(struct tee_contex=
t *ctx, struct tee_ioctl_invoke_arg *arg,
> > > > > > > >       }
> > > > > > > >
> > > > > > > >       if (optee->ops->from_msg_param(optee, param, arg->num=
_params,
> > > > > > > > -                                    msg_arg->params)) {
> > > > > > > > +                                    msg_arg->params, true =
/*update_out*/)) {
> > > > > > > >               msg_arg->ret =3D TEEC_ERROR_COMMUNICATION;
> > > > > > > >               msg_arg->ret_origin =3D TEEC_ORIGIN_COMMS;
> > > > > > > >       }
> > > > > > > > diff --git a/drivers/tee/optee/ffa_abi.c b/drivers/tee/opte=
e/ffa_abi.c
> > > > > > > > index 4ca1d5161b82..e4b08cd195f3 100644
> > > > > > > > --- a/drivers/tee/optee/ffa_abi.c
> > > > > > > > +++ b/drivers/tee/optee/ffa_abi.c
> > > > > > > > @@ -122,15 +122,21 @@ static int optee_shm_rem_ffa_handle(s=
truct optee *optee, u64 global_id)
> > > > > > > >   */
> > > > > > > >
> > > > > > > >  static void from_msg_param_ffa_mem(struct optee *optee, st=
ruct tee_param *p,
> > > > > > > > -                                u32 attr, const struct opt=
ee_msg_param *mp)
> > > > > > > > +                                u32 attr, const struct opt=
ee_msg_param *mp,
> > > > > > > > +                                bool update_out)
> > > > > > > >  {
> > > > > > > >       struct tee_shm *shm =3D NULL;
> > > > > > > >       u64 offs_high =3D 0;
> > > > > > > >       u64 offs_low =3D 0;
> > > > > > > >
> > > > > > > > +     if (update_out) {
> > > > > > > > +             if (attr =3D=3D OPTEE_MSG_ATTR_TYPE_FMEM_INPU=
T)
> > > > > > > > +                     return;
> > > > > > > > +             goto out;
> > > > > > > > +     }
> > > > > > > > +
> > > > > > > >       p->attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT +
> > > > > > > >                 attr - OPTEE_MSG_ATTR_TYPE_FMEM_INPUT;
> > > > > > > > -     p->u.memref.size =3D mp->u.fmem.size;
> > > > > > > >
> > > > > > > >       if (mp->u.fmem.global_id !=3D OPTEE_MSG_FMEM_INVALID_=
GLOBAL_ID)
> > > > > > > >               shm =3D optee_shm_from_ffa_handle(optee, mp->=
u.fmem.global_id);
> > > > > > > > @@ -141,6 +147,8 @@ static void from_msg_param_ffa_mem(stru=
ct optee *optee, struct tee_param *p,
> > > > > > > >               offs_high =3D mp->u.fmem.offs_high;
> > > > > > > >       }
> > > > > > > >       p->u.memref.shm_offs =3D offs_low | offs_high << 32;
> > > > > > > > +out:
> > > > > > > > +     p->u.memref.size =3D mp->u.fmem.size;
> > > > > > > >  }
> > > > > > > >
> > > > > > > >  /**
> > > > > > > > @@ -150,12 +158,14 @@ static void from_msg_param_ffa_mem(st=
ruct optee *optee, struct tee_param *p,
> > > > > > > >   * @params:  subsystem internal parameter representation
> > > > > > > >   * @num_params:      number of elements in the parameter a=
rrays
> > > > > > > >   * @msg_params:      OPTEE_MSG parameters
> > > > > > > > + * @update_out: update parameter for output only
> > > > > > > >   *
> > > > > > > >   * Returns 0 on success or <0 on failure
> > > > > > > >   */
> > > > > > > >  static int optee_ffa_from_msg_param(struct optee *optee,
> > > > > > > >                                   struct tee_param *params,=
 size_t num_params,
> > > > > > > > -                                 const struct optee_msg_pa=
ram *msg_params)
> > > > > > > > +                                 const struct optee_msg_pa=
ram *msg_params,
> > > > > > > > +                                 bool update_out)
> > > > > > > >  {
> > > > > > > >       size_t n;
> > > > > > > >
> > > > > > > > @@ -166,18 +176,20 @@ static int optee_ffa_from_msg_param(s=
truct optee *optee,
> > > > > > > >
> > > > > > > >               switch (attr) {
> > > > > > > >               case OPTEE_MSG_ATTR_TYPE_NONE:
> > > > > > > > +                     if (update_out)
> > > > > > > > +                             break;
> > > > > > > >                       p->attr =3D TEE_IOCTL_PARAM_ATTR_TYPE=
_NONE;
> > > > > > > >                       memset(&p->u, 0, sizeof(p->u));
> > > > > > > >                       break;
> > > > > > > >               case OPTEE_MSG_ATTR_TYPE_VALUE_INPUT:
> > > > > > > >               case OPTEE_MSG_ATTR_TYPE_VALUE_OUTPUT:
> > > > > > > >               case OPTEE_MSG_ATTR_TYPE_VALUE_INOUT:
> > > > > > > > -                     optee_from_msg_param_value(p, attr, m=
p);
> > > > > > > > +                     optee_from_msg_param_value(p, attr, m=
p, update_out);
> > > > > > > >                       break;
> > > > > > > >               case OPTEE_MSG_ATTR_TYPE_FMEM_INPUT:
> > > > > > > >               case OPTEE_MSG_ATTR_TYPE_FMEM_OUTPUT:
> > > > > > > >               case OPTEE_MSG_ATTR_TYPE_FMEM_INOUT:
> > > > > > > > -                     from_msg_param_ffa_mem(optee, p, attr=
, mp);
> > > > > > > > +                     from_msg_param_ffa_mem(optee, p, attr=
, mp, update_out);
> > > > > > > >                       break;
> > > > > > > >               default:
> > > > > > > >                       return -EINVAL;
> > > > > > > > @@ -188,10 +200,16 @@ static int optee_ffa_from_msg_param(s=
truct optee *optee,
> > > > > > > >  }
> > > > > > > >
> > > > > > > >  static int to_msg_param_ffa_mem(struct optee_msg_param *mp=
,
> > > > > > > > -                             const struct tee_param *p)
> > > > > > > > +                             const struct tee_param *p, bo=
ol update_out)
> > > > > > > >  {
> > > > > > > >       struct tee_shm *shm =3D p->u.memref.shm;
> > > > > > > >
> > > > > > > > +     if (update_out) {
> > > > > > > > +             if (p->attr =3D=3D TEE_IOCTL_PARAM_ATTR_TYPE_=
MEMREF_INPUT)
> > > > > > > > +                     return 0;
> > > > > > > > +             goto out;
> > > > > > > > +     }
> > > > > > > > +
> > > > > > > >       mp->attr =3D OPTEE_MSG_ATTR_TYPE_FMEM_INPUT + p->attr=
 -
> > > > > > > >                  TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT;
> > > > > > > >
> > > > > > > > @@ -211,6 +229,7 @@ static int to_msg_param_ffa_mem(struct =
optee_msg_param *mp,
> > > > > > > >               memset(&mp->u, 0, sizeof(mp->u));
> > > > > > > >               mp->u.fmem.global_id =3D OPTEE_MSG_FMEM_INVAL=
ID_GLOBAL_ID;
> > > > > > > >       }
> > > > > > > > +out:
> > > > > > > >       mp->u.fmem.size =3D p->u.memref.size;
> > > > > > > >
> > > > > > > >       return 0;
> > > > > > > > @@ -222,13 +241,15 @@ static int to_msg_param_ffa_mem(struc=
t optee_msg_param *mp,
> > > > > > > >   * @optee:   main service struct
> > > > > > > >   * @msg_params:      OPTEE_MSG parameters
> > > > > > > >   * @num_params:      number of elements in the parameter a=
rrays
> > > > > > > > - * @params:  subsystem itnernal parameter representation
> > > > > > > > + * @params:  subsystem internal parameter representation
> > > > > > > > + * @update_out: update parameter for output only
> > > > > > > >   * Returns 0 on success or <0 on failure
> > > > > > > >   */
> > > > > > > >  static int optee_ffa_to_msg_param(struct optee *optee,
> > > > > > > >                                 struct optee_msg_param *msg=
_params,
> > > > > > > >                                 size_t num_params,
> > > > > > > > -                               const struct tee_param *par=
ams)
> > > > > > > > +                               const struct tee_param *par=
ams,
> > > > > > > > +                               bool update_out)
> > > > > > > >  {
> > > > > > > >       size_t n;
> > > > > > > >
> > > > > > > > @@ -238,18 +259,20 @@ static int optee_ffa_to_msg_param(str=
uct optee *optee,
> > > > > > > >
> > > > > > > >               switch (p->attr) {
> > > > > > > >               case TEE_IOCTL_PARAM_ATTR_TYPE_NONE:
> > > > > > > > +                     if (update_out)
> > > > > > > > +                             break;
> > > > > > > >                       mp->attr =3D TEE_IOCTL_PARAM_ATTR_TYP=
E_NONE;
> > > > > > > >                       memset(&mp->u, 0, sizeof(mp->u));
> > > > > > > >                       break;
> > > > > > > >               case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT:
> > > > > > > >               case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT:
> > > > > > > >               case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT:
> > > > > > > > -                     optee_to_msg_param_value(mp, p);
> > > > > > > > +                     optee_to_msg_param_value(mp, p, updat=
e_out);
> > > > > > > >                       break;
> > > > > > > >               case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
> > > > > > > >               case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
> > > > > > > >               case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
> > > > > > > > -                     if (to_msg_param_ffa_mem(mp, p))
> > > > > > > > +                     if (to_msg_param_ffa_mem(mp, p, updat=
e_out))
> > > > > > > >                               return -EINVAL;
> > > > > > > >                       break;
> > > > > > > >               default:
> > > > > > >
> > > > > > > Can we rather handle it as follows to improve code readabilit=
y and
> > > > > > > maintainence long term? Ditto for all other places.
> > > > > > >
> > > > > > > static int optee_ffa_to_msg_param(struct optee *optee,
> > > > > > >                                   struct optee_msg_param *msg=
_params,
> > > > > > >                                   size_t num_params,
> > > > > > >                                   const struct tee_param *par=
ams,
> > > > > > >                                   bool update_out)
> > > > > > > {
> > > > > > >         size_t n;
> > > > > > >
> > > > > > >         for (n =3D 0; n < num_params; n++) {
> > > > > > >                 const struct tee_param *p =3D params + n;
> > > > > > >                 struct optee_msg_param *mp =3D msg_params + n=
;
> > > > > > >
> > > > > > >                 if (update_out && (p->attr =3D=3D TEE_IOCTL_P=
ARAM_ATTR_TYPE_NONE ||
> > > > > > >                      p->attr =3D=3D TEE_IOCTL_PARAM_ATTR_TYPE=
_VALUE_INPUT ||
> > > > > > >                      p->attr =3D=3D TEE_IOCTL_PARAM_ATTR_TYPE=
_MEMREF_INPUT))
> > > > > > >                     continue;
> > > > > >
> > > > > > You're missing updating the length field for memrefs.
> > > > > >
> > > > >
> > > > > Do we need to update length field for input memrefs when update_o=
ut is
> > > > > set? I don't see that happening in your existing patch too.
> > > >
> > > > I'm sorry, I was unclear. The update_out parameter means only the
> > > > output fields should be updated, not the attribute, offsets, ids, e=
tc.
> > > > That is, the length field for memrefs, and the value fields a, b, c
> > > > for value params. Some of the memrefs aren't translated one-to-one
> > > > with SDP, but the length field can and must be updated.
> > >
> > > Isn't it rather better to add another attribute type to handled SDP
> > > special handling?
> >
> > This isn't special handling, all parameters get the same treatment.
> > When updating a parameter after it has been used, this is all that
> > needs to be done, regardless of whether it's an SDP buffer. The
> > updates we did before this patch were redundant.
> >
> > This patch was introduced in the v3 of this patch set, but I don't
> > think it's strictly needed any longer since SDP buffers are allocated
> > differently now. I think it's nice to only update what's needed when
> > translating back a parameter (just as in params_to_user() in
> > drivers/tee/tee_core.c), but if you don't like it, we can drop this
> > patch.
>
> params_to_user() doesn't take any additional parameter like "update_out"
> which is complicating the program flow here. Can't we rather follow
> similar practice for {to/from}_msg_param() APIs?

I'm afraid something special is needed. handle_rpc_supp_cmd() needs
all the fields to be updated, from_msg_param() prepares input and
attribute type may have changed when to_msg_param() is called.

Cheers,
Jens

