Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E441E6C617
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 08:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xg+F5KKw2r0vQLOAe4QkycJMBq/a07Abzd6JRFG4e9A=; b=Bk1M0MfFxY9otXgmsfXOACcrrF
	+H/h1UYUp65kbr3cRXn5HSfty6od557RXE12p2Hl7k17ppBg28Wr0ioIauBUfiCjKZtJEbrD1U83q
	V5nYIMcYbt1Hr5rQb05dmmvVZaNVR87EMohckksuWDYbQ5wyrlf4sT4hhzGVObSc5mVWjyzmwiLGn
	Kp5/BfSlnvibo5ev96KdNHlYvbcnlo5fEZSs/9bV8qj9wIjEO+p8WcYfQ8n2qFoOU4BclZ9S1dM3x
	OLlfJ7SE/ETAxX79h+TqXiO7LAluf5SMf/GALfXP5UOpsfOLvf8M2oReaQZ0+ggRzmpDQhpUpaaNz
	6Ynk7mdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIOGh-00000008h9Y-0HBH;
	Tue, 03 Dec 2024 08:28:27 +0000
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIOFf-00000008gsa-15oF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 08:27:24 +0000
Received: by mail-ua1-x92b.google.com with SMTP id a1e0cc1a2514c-85b88a685e6so1053875241.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 00:27:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733214442; x=1733819242; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Xg+F5KKw2r0vQLOAe4QkycJMBq/a07Abzd6JRFG4e9A=;
        b=H7bngeQYFDlO+LtPMCWurqWsNAAOeWneRg6aeHwp+DjTKBIS44tugln2fFeJYCGeHB
         Fhc9jMXq3ghwviH01FfLJKmwG+PSvfYwY4Whd0ZBqFYgfvYWeGrEKFFU6A99m6vvZFH0
         JamXHVZahpW5V0rrthz/i3L5FaR5jKBsEomKMlH6QjKu+KsZ94d+ipRWRqrNe7GrsKqb
         rfkZX5mSSbOmikzBNaTSdXRlxiHzcimlnF5O63MkRcqrGq9vq/a+WjPQM44n3wHbqI8t
         G5SGLDWl+mPuNVx6O39WH2o0Mk9wjHOvC1pR781fRk3BsyrFbSUNDB+WRTv2Yc8ME77y
         FNSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733214442; x=1733819242;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xg+F5KKw2r0vQLOAe4QkycJMBq/a07Abzd6JRFG4e9A=;
        b=gvA5INtJmWtKvwYG23yyhwUWzKmbBNa5XFk2Xw1eTJ5MgkH0i7vxMbSedRxc1xpJMS
         E6++HvN3wvC2C+YRf5J4AAPhScN6CUkNLOTm4CW1ZPzMurBWdCxwdB8QkqMGYrMq2HmS
         8TcMEUkRAbdwfy76tpvJ+c+XumAqnHsRu9VDdNQ1l+oGQnvQTMYVYloETifd8cau16zc
         8tRckH6xLBu49tebLXyWs0RodDqmLFQPlt5FK9hY7ngNl3eyrEnZDexA6HzeHIreZf+9
         CCSK59lUjqc4ny23pKzMTCR4CVFDZVwwA1UUPsBRAKOfDyfYEA/6oJjne53CSY7lvV+8
         +Omw==
X-Forwarded-Encrypted: i=1; AJvYcCUGKje6VMGSTqQqbSxGxXdMUorAjF6dToIlnzVQiu9TUmNfo/o6oQJH3kinCbClE3mEI8upDzJLZAzGpAMCcz27@lists.infradead.org
X-Gm-Message-State: AOJu0YycWepCV9HPNtVO8KpmBMQYnLh3CP2KpwT3ar1M3ClHVB8kOrKE
	e1d9r0qXA+ksb2C4ffW5gqv7bmw5fdu72UMfqdkN5V8wCQs9Fz0TqiudLCwGwe/BV9bnKOg0+Z2
	NyLrUWw9LSirKaPE+bXGFM2h/tMsnITpBPSoChA==
X-Gm-Gg: ASbGncvkxG7gRyUsK0aXB3WEvGGGn8Py918XGmICYZuKVM2iqC2TEwzwrk+1eo33JGp
	huJQLpQH/tGn1Ql1I4Ldj0pc7it/I6zujPQ==
X-Google-Smtp-Source: AGHT+IGaTN/p8BULgFdyOAJGuWzvkuLZQWmA9o3EM8C85tJ7kIMh9XKXlTdWPk7y0YLXtY2NHUh28nknRnSVJahtofg=
X-Received: by 2002:a05:6102:d87:b0:4af:58f7:15ed with SMTP id
 ada2fe7eead31-4af971838d3mr2334917137.1.1733214441776; Tue, 03 Dec 2024
 00:27:21 -0800 (PST)
MIME-Version: 1.0
References: <20241128150927.1377981-1-jens.wiklander@linaro.org> <20241128150927.1377981-3-jens.wiklander@linaro.org>
In-Reply-To: <20241128150927.1377981-3-jens.wiklander@linaro.org>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Tue, 3 Dec 2024 13:57:10 +0530
Message-ID: <CAFA6WYPEqCWyvD=pCj6DEkZWN9SCfXMnq4tKbSx1-e8UmgXb=Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] optee: account for direction while converting parameters
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
	Olivier Masse <olivier.masse@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, azarrabi@qti.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_002723_309529_5D8400BB 
X-CRM114-Status: GOOD (  31.05  )
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

Hi Jens,

On Thu, 28 Nov 2024 at 20:39, Jens Wiklander <jens.wiklander@linaro.org> wrote:
>
> The OP-TEE backend driver has two internal function pointers to convert
> between the subsystem type struct tee_param and the OP-TEE type struct
> optee_msg_param.
>
> The conversion is done from one of the types to the other, which is then
> involved in some operation and finally converted back to the original
> type. When converting to prepare the parameters for the operation, all
> fields must be taken into account, but then converting back, it's enough
> to update only out-values and out-sizes. So, an update_out parameter is
> added to the conversion functions to tell if all or only some fields
> must be copied.

Is this patch just a refactoring of TEE params handling? Or are we
fixing a real ABI issue here? Also, is this required for restricted
shared memory support to work? Just asking if we want to consider it
as a fix for backporting or if we can handle this refactoring patch
independently of this series?

-Sumit

>
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
>  drivers/tee/optee/call.c          | 10 ++--
>  drivers/tee/optee/ffa_abi.c       | 43 +++++++++++++----
>  drivers/tee/optee/optee_private.h | 42 +++++++++++------
>  drivers/tee/optee/rpc.c           | 31 +++++++++----
>  drivers/tee/optee/smc_abi.c       | 76 +++++++++++++++++++++++--------
>  5 files changed, 144 insertions(+), 58 deletions(-)
>
> diff --git a/drivers/tee/optee/call.c b/drivers/tee/optee/call.c
> index 16eb953e14bb..f1533b894726 100644
> --- a/drivers/tee/optee/call.c
> +++ b/drivers/tee/optee/call.c
> @@ -400,7 +400,8 @@ int optee_open_session(struct tee_context *ctx,
>         export_uuid(msg_arg->params[1].u.octets, &client_uuid);
>
>         rc = optee->ops->to_msg_param(optee, msg_arg->params + 2,
> -                                     arg->num_params, param);
> +                                     arg->num_params, param,
> +                                     false /*!update_out*/);
>         if (rc)
>                 goto out;
>
> @@ -427,7 +428,8 @@ int optee_open_session(struct tee_context *ctx,
>         }
>
>         if (optee->ops->from_msg_param(optee, param, arg->num_params,
> -                                      msg_arg->params + 2)) {
> +                                      msg_arg->params + 2,
> +                                      true /*update_out*/)) {
>                 arg->ret = TEEC_ERROR_COMMUNICATION;
>                 arg->ret_origin = TEEC_ORIGIN_COMMS;
>                 /* Close session again to avoid leakage */
> @@ -541,7 +543,7 @@ int optee_invoke_func(struct tee_context *ctx, struct tee_ioctl_invoke_arg *arg,
>         msg_arg->cancel_id = arg->cancel_id;
>
>         rc = optee->ops->to_msg_param(optee, msg_arg->params, arg->num_params,
> -                                     param);
> +                                     param, false /*!update_out*/);
>         if (rc)
>                 goto out;
>
> @@ -551,7 +553,7 @@ int optee_invoke_func(struct tee_context *ctx, struct tee_ioctl_invoke_arg *arg,
>         }
>
>         if (optee->ops->from_msg_param(optee, param, arg->num_params,
> -                                      msg_arg->params)) {
> +                                      msg_arg->params, true /*update_out*/)) {
>                 msg_arg->ret = TEEC_ERROR_COMMUNICATION;
>                 msg_arg->ret_origin = TEEC_ORIGIN_COMMS;
>         }
> diff --git a/drivers/tee/optee/ffa_abi.c b/drivers/tee/optee/ffa_abi.c
> index f3af5666bb11..02e6175ac5f0 100644
> --- a/drivers/tee/optee/ffa_abi.c
> +++ b/drivers/tee/optee/ffa_abi.c
> @@ -122,15 +122,21 @@ static int optee_shm_rem_ffa_handle(struct optee *optee, u64 global_id)
>   */
>
>  static void from_msg_param_ffa_mem(struct optee *optee, struct tee_param *p,
> -                                  u32 attr, const struct optee_msg_param *mp)
> +                                  u32 attr, const struct optee_msg_param *mp,
> +                                  bool update_out)
>  {
>         struct tee_shm *shm = NULL;
>         u64 offs_high = 0;
>         u64 offs_low = 0;
>
> +       if (update_out) {
> +               if (attr == OPTEE_MSG_ATTR_TYPE_FMEM_INPUT)
> +                       return;
> +               goto out;
> +       }
> +
>         p->attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT +
>                   attr - OPTEE_MSG_ATTR_TYPE_FMEM_INPUT;
> -       p->u.memref.size = mp->u.fmem.size;
>
>         if (mp->u.fmem.global_id != OPTEE_MSG_FMEM_INVALID_GLOBAL_ID)
>                 shm = optee_shm_from_ffa_handle(optee, mp->u.fmem.global_id);
> @@ -141,6 +147,8 @@ static void from_msg_param_ffa_mem(struct optee *optee, struct tee_param *p,
>                 offs_high = mp->u.fmem.offs_high;
>         }
>         p->u.memref.shm_offs = offs_low | offs_high << 32;
> +out:
> +       p->u.memref.size = mp->u.fmem.size;
>  }
>
>  /**
> @@ -150,12 +158,14 @@ static void from_msg_param_ffa_mem(struct optee *optee, struct tee_param *p,
>   * @params:    subsystem internal parameter representation
>   * @num_params:        number of elements in the parameter arrays
>   * @msg_params:        OPTEE_MSG parameters
> + * @update_out: update parameter for output only
>   *
>   * Returns 0 on success or <0 on failure
>   */
>  static int optee_ffa_from_msg_param(struct optee *optee,
>                                     struct tee_param *params, size_t num_params,
> -                                   const struct optee_msg_param *msg_params)
> +                                   const struct optee_msg_param *msg_params,
> +                                   bool update_out)
>  {
>         size_t n;
>
> @@ -166,18 +176,20 @@ static int optee_ffa_from_msg_param(struct optee *optee,
>
>                 switch (attr) {
>                 case OPTEE_MSG_ATTR_TYPE_NONE:
> +                       if (update_out)
> +                               break;
>                         p->attr = TEE_IOCTL_PARAM_ATTR_TYPE_NONE;
>                         memset(&p->u, 0, sizeof(p->u));
>                         break;
>                 case OPTEE_MSG_ATTR_TYPE_VALUE_INPUT:
>                 case OPTEE_MSG_ATTR_TYPE_VALUE_OUTPUT:
>                 case OPTEE_MSG_ATTR_TYPE_VALUE_INOUT:
> -                       optee_from_msg_param_value(p, attr, mp);
> +                       optee_from_msg_param_value(p, attr, mp, update_out);
>                         break;
>                 case OPTEE_MSG_ATTR_TYPE_FMEM_INPUT:
>                 case OPTEE_MSG_ATTR_TYPE_FMEM_OUTPUT:
>                 case OPTEE_MSG_ATTR_TYPE_FMEM_INOUT:
> -                       from_msg_param_ffa_mem(optee, p, attr, mp);
> +                       from_msg_param_ffa_mem(optee, p, attr, mp, update_out);
>                         break;
>                 default:
>                         return -EINVAL;
> @@ -188,10 +200,16 @@ static int optee_ffa_from_msg_param(struct optee *optee,
>  }
>
>  static int to_msg_param_ffa_mem(struct optee_msg_param *mp,
> -                               const struct tee_param *p)
> +                               const struct tee_param *p, bool update_out)
>  {
>         struct tee_shm *shm = p->u.memref.shm;
>
> +       if (update_out) {
> +               if (p->attr == TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT)
> +                       return 0;
> +               goto out;
> +       }
> +
>         mp->attr = OPTEE_MSG_ATTR_TYPE_FMEM_INPUT + p->attr -
>                    TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT;
>
> @@ -211,6 +229,7 @@ static int to_msg_param_ffa_mem(struct optee_msg_param *mp,
>                 memset(&mp->u, 0, sizeof(mp->u));
>                 mp->u.fmem.global_id = OPTEE_MSG_FMEM_INVALID_GLOBAL_ID;
>         }
> +out:
>         mp->u.fmem.size = p->u.memref.size;
>
>         return 0;
> @@ -222,13 +241,15 @@ static int to_msg_param_ffa_mem(struct optee_msg_param *mp,
>   * @optee:     main service struct
>   * @msg_params:        OPTEE_MSG parameters
>   * @num_params:        number of elements in the parameter arrays
> - * @params:    subsystem itnernal parameter representation
> + * @params:    subsystem internal parameter representation
> + * @update_out: update parameter for output only
>   * Returns 0 on success or <0 on failure
>   */
>  static int optee_ffa_to_msg_param(struct optee *optee,
>                                   struct optee_msg_param *msg_params,
>                                   size_t num_params,
> -                                 const struct tee_param *params)
> +                                 const struct tee_param *params,
> +                                 bool update_out)
>  {
>         size_t n;
>
> @@ -238,18 +259,20 @@ static int optee_ffa_to_msg_param(struct optee *optee,
>
>                 switch (p->attr) {
>                 case TEE_IOCTL_PARAM_ATTR_TYPE_NONE:
> +                       if (update_out)
> +                               break;
>                         mp->attr = TEE_IOCTL_PARAM_ATTR_TYPE_NONE;
>                         memset(&mp->u, 0, sizeof(mp->u));
>                         break;
>                 case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT:
>                 case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT:
>                 case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT:
> -                       optee_to_msg_param_value(mp, p);
> +                       optee_to_msg_param_value(mp, p, update_out);
>                         break;
>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
> -                       if (to_msg_param_ffa_mem(mp, p))
> +                       if (to_msg_param_ffa_mem(mp, p, update_out))
>                                 return -EINVAL;
>                         break;
>                 default:
> diff --git a/drivers/tee/optee/optee_private.h b/drivers/tee/optee/optee_private.h
> index dc0f355ef72a..20eda508dbac 100644
> --- a/drivers/tee/optee/optee_private.h
> +++ b/drivers/tee/optee/optee_private.h
> @@ -185,10 +185,12 @@ struct optee_ops {
>                                 bool system_thread);
>         int (*to_msg_param)(struct optee *optee,
>                             struct optee_msg_param *msg_params,
> -                           size_t num_params, const struct tee_param *params);
> +                           size_t num_params, const struct tee_param *params,
> +                           bool update_out);
>         int (*from_msg_param)(struct optee *optee, struct tee_param *params,
>                               size_t num_params,
> -                             const struct optee_msg_param *msg_params);
> +                             const struct optee_msg_param *msg_params,
> +                             bool update_out);
>  };
>
>  /**
> @@ -316,23 +318,35 @@ void optee_release(struct tee_context *ctx);
>  void optee_release_supp(struct tee_context *ctx);
>
>  static inline void optee_from_msg_param_value(struct tee_param *p, u32 attr,
> -                                             const struct optee_msg_param *mp)
> +                                             const struct optee_msg_param *mp,
> +                                             bool update_out)
>  {
> -       p->attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT +
> -                 attr - OPTEE_MSG_ATTR_TYPE_VALUE_INPUT;
> -       p->u.value.a = mp->u.value.a;
> -       p->u.value.b = mp->u.value.b;
> -       p->u.value.c = mp->u.value.c;
> +       if (!update_out)
> +               p->attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT +
> +                         attr - OPTEE_MSG_ATTR_TYPE_VALUE_INPUT;
> +
> +       if (attr == OPTEE_MSG_ATTR_TYPE_VALUE_OUTPUT ||
> +           attr == OPTEE_MSG_ATTR_TYPE_VALUE_INOUT || !update_out) {
> +               p->u.value.a = mp->u.value.a;
> +               p->u.value.b = mp->u.value.b;
> +               p->u.value.c = mp->u.value.c;
> +       }
>  }
>
>  static inline void optee_to_msg_param_value(struct optee_msg_param *mp,
> -                                           const struct tee_param *p)
> +                                           const struct tee_param *p,
> +                                           bool update_out)
>  {
> -       mp->attr = OPTEE_MSG_ATTR_TYPE_VALUE_INPUT + p->attr -
> -                  TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT;
> -       mp->u.value.a = p->u.value.a;
> -       mp->u.value.b = p->u.value.b;
> -       mp->u.value.c = p->u.value.c;
> +       if (!update_out)
> +               mp->attr = OPTEE_MSG_ATTR_TYPE_VALUE_INPUT + p->attr -
> +                          TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT;
> +
> +       if (p->attr == TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT ||
> +           p->attr == TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT || !update_out) {
> +               mp->u.value.a = p->u.value.a;
> +               mp->u.value.b = p->u.value.b;
> +               mp->u.value.c = p->u.value.c;
> +       }
>  }
>
>  void optee_cq_init(struct optee_call_queue *cq, int thread_count);
> diff --git a/drivers/tee/optee/rpc.c b/drivers/tee/optee/rpc.c
> index ebbbd42b0e3e..580e6b9b0606 100644
> --- a/drivers/tee/optee/rpc.c
> +++ b/drivers/tee/optee/rpc.c
> @@ -63,7 +63,7 @@ static void handle_rpc_func_cmd_i2c_transfer(struct tee_context *ctx,
>         }
>
>         if (optee->ops->from_msg_param(optee, params, arg->num_params,
> -                                      arg->params))
> +                                      arg->params, false /*!update_out*/))
>                 goto bad;
>
>         for (i = 0; i < arg->num_params; i++) {
> @@ -107,7 +107,8 @@ static void handle_rpc_func_cmd_i2c_transfer(struct tee_context *ctx,
>         } else {
>                 params[3].u.value.a = msg.len;
>                 if (optee->ops->to_msg_param(optee, arg->params,
> -                                            arg->num_params, params))
> +                                            arg->num_params, params,
> +                                            true /*update_out*/))
>                         arg->ret = TEEC_ERROR_BAD_PARAMETERS;
>                 else
>                         arg->ret = TEEC_SUCCESS;
> @@ -188,6 +189,7 @@ static void handle_rpc_func_cmd_wait(struct optee_msg_arg *arg)
>  static void handle_rpc_supp_cmd(struct tee_context *ctx, struct optee *optee,
>                                 struct optee_msg_arg *arg)
>  {
> +       bool update_out = false;
>         struct tee_param *params;
>
>         arg->ret_origin = TEEC_ORIGIN_COMMS;
> @@ -200,15 +202,21 @@ static void handle_rpc_supp_cmd(struct tee_context *ctx, struct optee *optee,
>         }
>
>         if (optee->ops->from_msg_param(optee, params, arg->num_params,
> -                                      arg->params)) {
> +                                      arg->params, update_out)) {
>                 arg->ret = TEEC_ERROR_BAD_PARAMETERS;
>                 goto out;
>         }
>
>         arg->ret = optee_supp_thrd_req(ctx, arg->cmd, arg->num_params, params);
>
> +       /*
> +        * Special treatment for OPTEE_RPC_CMD_SHM_ALLOC since input is a
> +        * value type, but the output is a memref type.
> +        */
> +       if (arg->cmd != OPTEE_RPC_CMD_SHM_ALLOC)
> +               update_out = true;
>         if (optee->ops->to_msg_param(optee, arg->params, arg->num_params,
> -                                    params))
> +                                    params, update_out))
>                 arg->ret = TEEC_ERROR_BAD_PARAMETERS;
>  out:
>         kfree(params);
> @@ -270,7 +278,7 @@ static void handle_rpc_func_rpmb_probe_reset(struct tee_context *ctx,
>
>         if (arg->num_params != ARRAY_SIZE(params) ||
>             optee->ops->from_msg_param(optee, params, arg->num_params,
> -                                      arg->params) ||
> +                                      arg->params, false /*!update_out*/) ||
>             params[0].attr != TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT) {
>                 arg->ret = TEEC_ERROR_BAD_PARAMETERS;
>                 return;
> @@ -280,7 +288,8 @@ static void handle_rpc_func_rpmb_probe_reset(struct tee_context *ctx,
>         params[0].u.value.b = 0;
>         params[0].u.value.c = 0;
>         if (optee->ops->to_msg_param(optee, arg->params,
> -                                    arg->num_params, params)) {
> +                                    arg->num_params, params,
> +                                    true /*update_out*/)) {
>                 arg->ret = TEEC_ERROR_BAD_PARAMETERS;
>                 return;
>         }
> @@ -324,7 +333,7 @@ static void handle_rpc_func_rpmb_probe_next(struct tee_context *ctx,
>
>         if (arg->num_params != ARRAY_SIZE(params) ||
>             optee->ops->from_msg_param(optee, params, arg->num_params,
> -                                      arg->params) ||
> +                                      arg->params, false /*!update_out*/) ||
>             params[0].attr != TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT ||
>             params[1].attr != TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT) {
>                 arg->ret = TEEC_ERROR_BAD_PARAMETERS;
> @@ -358,7 +367,8 @@ static void handle_rpc_func_rpmb_probe_next(struct tee_context *ctx,
>         params[0].u.value.b = rdev->descr.capacity;
>         params[0].u.value.c = rdev->descr.reliable_wr_count;
>         if (optee->ops->to_msg_param(optee, arg->params,
> -                                    arg->num_params, params)) {
> +                                    arg->num_params, params,
> +                                    true /*update_out*/)) {
>                 arg->ret = TEEC_ERROR_BAD_PARAMETERS;
>                 return;
>         }
> @@ -384,7 +394,7 @@ static void handle_rpc_func_rpmb_frames(struct tee_context *ctx,
>
>         if (arg->num_params != ARRAY_SIZE(params) ||
>             optee->ops->from_msg_param(optee, params, arg->num_params,
> -                                      arg->params) ||
> +                                      arg->params, false /*!update_out*/) ||
>             params[0].attr != TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT ||
>             params[1].attr != TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT) {
>                 arg->ret = TEEC_ERROR_BAD_PARAMETERS;
> @@ -401,7 +411,8 @@ static void handle_rpc_func_rpmb_frames(struct tee_context *ctx,
>                 goto out;
>         }
>         if (optee->ops->to_msg_param(optee, arg->params,
> -                                    arg->num_params, params)) {
> +                                    arg->num_params, params,
> +                                    true /*update_out*/)) {
>                 arg->ret = TEEC_ERROR_BAD_PARAMETERS;
>                 goto out;
>         }
> diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
> index e9456e3e74cc..d1f79947f58a 100644
> --- a/drivers/tee/optee/smc_abi.c
> +++ b/drivers/tee/optee/smc_abi.c
> @@ -81,20 +81,26 @@ static int optee_cpuhp_disable_pcpu_irq(unsigned int cpu)
>   */
>
>  static int from_msg_param_tmp_mem(struct tee_param *p, u32 attr,
> -                                 const struct optee_msg_param *mp)
> +                                 const struct optee_msg_param *mp,
> +                                 bool update_out)
>  {
>         struct tee_shm *shm;
>         phys_addr_t pa;
>         int rc;
>
> +       if (update_out) {
> +               if (attr == OPTEE_MSG_ATTR_TYPE_TMEM_INPUT)
> +                       return 0;
> +               goto out;
> +       }
> +
>         p->attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT +
>                   attr - OPTEE_MSG_ATTR_TYPE_TMEM_INPUT;
> -       p->u.memref.size = mp->u.tmem.size;
>         shm = (struct tee_shm *)(unsigned long)mp->u.tmem.shm_ref;
>         if (!shm) {
>                 p->u.memref.shm_offs = 0;
>                 p->u.memref.shm = NULL;
> -               return 0;
> +               goto out;
>         }
>
>         rc = tee_shm_get_pa(shm, 0, &pa);
> @@ -103,18 +109,25 @@ static int from_msg_param_tmp_mem(struct tee_param *p, u32 attr,
>
>         p->u.memref.shm_offs = mp->u.tmem.buf_ptr - pa;
>         p->u.memref.shm = shm;
> -
> +out:
> +       p->u.memref.size = mp->u.tmem.size;
>         return 0;
>  }
>
>  static void from_msg_param_reg_mem(struct tee_param *p, u32 attr,
> -                                  const struct optee_msg_param *mp)
> +                                  const struct optee_msg_param *mp,
> +                                  bool update_out)
>  {
>         struct tee_shm *shm;
>
> +       if (update_out) {
> +               if (attr == OPTEE_MSG_ATTR_TYPE_RMEM_INPUT)
> +                       return;
> +               goto out;
> +       }
> +
>         p->attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT +
>                   attr - OPTEE_MSG_ATTR_TYPE_RMEM_INPUT;
> -       p->u.memref.size = mp->u.rmem.size;
>         shm = (struct tee_shm *)(unsigned long)mp->u.rmem.shm_ref;
>
>         if (shm) {
> @@ -124,6 +137,8 @@ static void from_msg_param_reg_mem(struct tee_param *p, u32 attr,
>                 p->u.memref.shm_offs = 0;
>                 p->u.memref.shm = NULL;
>         }
> +out:
> +       p->u.memref.size = mp->u.rmem.size;
>  }
>
>  /**
> @@ -133,11 +148,13 @@ static void from_msg_param_reg_mem(struct tee_param *p, u32 attr,
>   * @params:    subsystem internal parameter representation
>   * @num_params:        number of elements in the parameter arrays
>   * @msg_params:        OPTEE_MSG parameters
> + * @update_out:        update parameter for output only
>   * Returns 0 on success or <0 on failure
>   */
>  static int optee_from_msg_param(struct optee *optee, struct tee_param *params,
>                                 size_t num_params,
> -                               const struct optee_msg_param *msg_params)
> +                               const struct optee_msg_param *msg_params,
> +                               bool update_out)
>  {
>         int rc;
>         size_t n;
> @@ -149,25 +166,27 @@ static int optee_from_msg_param(struct optee *optee, struct tee_param *params,
>
>                 switch (attr) {
>                 case OPTEE_MSG_ATTR_TYPE_NONE:
> +                       if (update_out)
> +                               break;
>                         p->attr = TEE_IOCTL_PARAM_ATTR_TYPE_NONE;
>                         memset(&p->u, 0, sizeof(p->u));
>                         break;
>                 case OPTEE_MSG_ATTR_TYPE_VALUE_INPUT:
>                 case OPTEE_MSG_ATTR_TYPE_VALUE_OUTPUT:
>                 case OPTEE_MSG_ATTR_TYPE_VALUE_INOUT:
> -                       optee_from_msg_param_value(p, attr, mp);
> +                       optee_from_msg_param_value(p, attr, mp, update_out);
>                         break;
>                 case OPTEE_MSG_ATTR_TYPE_TMEM_INPUT:
>                 case OPTEE_MSG_ATTR_TYPE_TMEM_OUTPUT:
>                 case OPTEE_MSG_ATTR_TYPE_TMEM_INOUT:
> -                       rc = from_msg_param_tmp_mem(p, attr, mp);
> +                       rc = from_msg_param_tmp_mem(p, attr, mp, update_out);
>                         if (rc)
>                                 return rc;
>                         break;
>                 case OPTEE_MSG_ATTR_TYPE_RMEM_INPUT:
>                 case OPTEE_MSG_ATTR_TYPE_RMEM_OUTPUT:
>                 case OPTEE_MSG_ATTR_TYPE_RMEM_INOUT:
> -                       from_msg_param_reg_mem(p, attr, mp);
> +                       from_msg_param_reg_mem(p, attr, mp, update_out);
>                         break;
>
>                 default:
> @@ -178,20 +197,25 @@ static int optee_from_msg_param(struct optee *optee, struct tee_param *params,
>  }
>
>  static int to_msg_param_tmp_mem(struct optee_msg_param *mp,
> -                               const struct tee_param *p)
> +                               const struct tee_param *p, bool update_out)
>  {
>         int rc;
>         phys_addr_t pa;
>
> +       if (update_out) {
> +               if (p->attr == TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT)
> +                       return 0;
> +               goto out;
> +       }
> +
>         mp->attr = OPTEE_MSG_ATTR_TYPE_TMEM_INPUT + p->attr -
>                    TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT;
>
>         mp->u.tmem.shm_ref = (unsigned long)p->u.memref.shm;
> -       mp->u.tmem.size = p->u.memref.size;
>
>         if (!p->u.memref.shm) {
>                 mp->u.tmem.buf_ptr = 0;
> -               return 0;
> +               goto out;
>         }
>
>         rc = tee_shm_get_pa(p->u.memref.shm, p->u.memref.shm_offs, &pa);
> @@ -201,19 +225,27 @@ static int to_msg_param_tmp_mem(struct optee_msg_param *mp,
>         mp->u.tmem.buf_ptr = pa;
>         mp->attr |= OPTEE_MSG_ATTR_CACHE_PREDEFINED <<
>                     OPTEE_MSG_ATTR_CACHE_SHIFT;
> -
> +out:
> +       mp->u.tmem.size = p->u.memref.size;
>         return 0;
>  }
>
>  static int to_msg_param_reg_mem(struct optee_msg_param *mp,
> -                               const struct tee_param *p)
> +                               const struct tee_param *p, bool update_out)
>  {
> +       if (update_out) {
> +               if (p->attr == TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT)
> +                       return 0;
> +               goto out;
> +       }
> +
>         mp->attr = OPTEE_MSG_ATTR_TYPE_RMEM_INPUT + p->attr -
>                    TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT;
>
>         mp->u.rmem.shm_ref = (unsigned long)p->u.memref.shm;
> -       mp->u.rmem.size = p->u.memref.size;
>         mp->u.rmem.offs = p->u.memref.shm_offs;
> +out:
> +       mp->u.rmem.size = p->u.memref.size;
>         return 0;
>  }
>
> @@ -223,11 +255,13 @@ static int to_msg_param_reg_mem(struct optee_msg_param *mp,
>   * @msg_params:        OPTEE_MSG parameters
>   * @num_params:        number of elements in the parameter arrays
>   * @params:    subsystem itnernal parameter representation
> + * @update_out:        update parameter for output only
>   * Returns 0 on success or <0 on failure
>   */
>  static int optee_to_msg_param(struct optee *optee,
>                               struct optee_msg_param *msg_params,
> -                             size_t num_params, const struct tee_param *params)
> +                             size_t num_params, const struct tee_param *params,
> +                             bool update_out)
>  {
>         int rc;
>         size_t n;
> @@ -238,21 +272,23 @@ static int optee_to_msg_param(struct optee *optee,
>
>                 switch (p->attr) {
>                 case TEE_IOCTL_PARAM_ATTR_TYPE_NONE:
> +                       if (update_out)
> +                               break;
>                         mp->attr = TEE_IOCTL_PARAM_ATTR_TYPE_NONE;
>                         memset(&mp->u, 0, sizeof(mp->u));
>                         break;
>                 case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT:
>                 case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT:
>                 case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT:
> -                       optee_to_msg_param_value(mp, p);
> +                       optee_to_msg_param_value(mp, p, update_out);
>                         break;
>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
>                         if (tee_shm_is_dynamic(p->u.memref.shm))
> -                               rc = to_msg_param_reg_mem(mp, p);
> +                               rc = to_msg_param_reg_mem(mp, p, update_out);
>                         else
> -                               rc = to_msg_param_tmp_mem(mp, p);
> +                               rc = to_msg_param_tmp_mem(mp, p, update_out);
>                         if (rc)
>                                 return rc;
>                         break;
> --
> 2.43.0
>

