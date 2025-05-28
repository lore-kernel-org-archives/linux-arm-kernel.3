Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9117EC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 16:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V50E07Bshe0n5/d4A/sEnbHvwqtDL9kM998TesZAgNI=; b=2/det91zZfsteqjQKvWpYyi4r/
	cm5llrsQmxBUe4Ig5NqHeQPBPHpG+LJtQgB7L/AmfBLAQyAOgF9W/Tefx4oRs912Ud4OJT3HVF2ei
	QRITPURyLGA4u8Zb8YU6X+st/L3hzfr4vz+iXnRwTQX5zpNkXc5xIu8B6TZZIB/qtHHSDbKGmJ65e
	tn8wuBwc+nXWKE0qot+kajcidLXMxhbTaWIxImtCzOT8TTSvh7HX31Gfc3iFLb6CYApGGGOd56+qu
	8eoYywe67XObkOZctjFV7XDnd3vtpRJKjjZ5Zu/sCsRm5EDx3vjL5AgseKWpujRYCNgBv4Ff9F25j
	C739Jb/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKJdO-0000000DetR-3AHj;
	Wed, 28 May 2025 16:28:06 +0000
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKIn4-0000000DYrT-2ROa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 15:34:03 +0000
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-6063462098eso2654540eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 May 2025 08:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748446441; x=1749051241; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V50E07Bshe0n5/d4A/sEnbHvwqtDL9kM998TesZAgNI=;
        b=sa8O1vNrQf5ZJhd5cMIGXbztl0iBSiYblUNazOL6a3/3CAbbKmugBc0qTVTXJMx4DZ
         f0j8bev016rGZ/F8szFty7szXkycV8JK7V7HU167lMG2+SyuX2ZVk9YSudsF12aa+M2N
         Wtdkm8u3J3J7Lm+YYdRjDoU2Bd/N94CHmKp2wyuv6U0QLsTH5WV/v+DQlS3iUhzi/DHT
         9notyZUYwFnBhYIZZ2nT5OxJJ3vrcUrHIL7MbzwFVfb8CSCj3k3riID/tkLePd4hXyr/
         VON8Y+HCMLxaQFVNZmbAUGkvYKxX+Z7HilpzdLMKkKbGJTpo7/gLIDEuadyVLUPjL7ZL
         0lAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748446441; x=1749051241;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V50E07Bshe0n5/d4A/sEnbHvwqtDL9kM998TesZAgNI=;
        b=l2MCK5SzmH9IHQYk8z0BPG4y85OcbPNt8yJkhETSuxfsayGLcRs9haKJJXO8aD2U0s
         Anv40omxqOeJagekqGBwcLf7EDdThXbZLQDEW/bJpI5qd9sD54ZNItuYXIKbE1EiF3uu
         cdKVGrd/21nTsuK5dY7B9Nyfeohb9c7I679XO0uSS6vj9auGYGTPyw/xF4negQE1Qyb0
         S8WKUCt2cmke0s1oTmeo+DH/kYW5aLTpPAvZ4w0ms6DAByNOFEK5CbJGLva/29CW14Ea
         JVTfPD8/lW6vLGGfVFp0N9KvRs2FI854fU23KzsEvVeElA6JHeLnAXRlWKbaZYNiZjYS
         x4WA==
X-Gm-Message-State: AOJu0YxBGXICE3lUweF9Nw3SUQY1SNoVkCqejgLnTO0iGPrECZiayf9j
	Q+Gsh3+zMSwezjvhTUwsQ8GxQ4Nx5pbG+L5CT6QVey49KU0lkr4ADfHkbAabUcleOhXBG2qs4LD
	UswAEYM92ywErPZzKLgd5QJu+AxD89HfuPROsOtzrkq6dW0Jn7iec5AI=
X-Gm-Gg: ASbGncuii7vkwBmy6Vkx3NnJLd6wge9YMgwzS90wv7fHrWs5D+7JgXXqo7Qp7pImObU
	+298deiaKVq6KKgNMbpZJrzlq16DeZnq84nN9nr09BA1gjYlBSMhuA61gds5q3WUKExYxFFZJ1+
	My0XqE/6ux1zK1qSyJWLOS+az1RK+fYXqBVlkh1l6wzKyj
X-Google-Smtp-Source: AGHT+IEniMZHQbxc4dt4F2x1tHo1KsHwEHrIoQNpmjaRPLITmNPATnnXVb6jvput6py+MvQ1YaI5hzeuvZZSY3OtXoY=
X-Received: by 2002:a05:6820:2004:b0:60b:a8e7:b23e with SMTP id
 006d021491bc7-60ba8e7d8damr8600114eaf.8.1748446430509; Wed, 28 May 2025
 08:33:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250528-ffa_notif_fix-v1-0-5ed7bc7f8437@arm.com> <20250528-ffa_notif_fix-v1-2-5ed7bc7f8437@arm.com>
In-Reply-To: <20250528-ffa_notif_fix-v1-2-5ed7bc7f8437@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 28 May 2025 17:33:38 +0200
X-Gm-Features: AX0GCFunGnw6PrwW4snoTeu3Q1n7NKY-YLzkZ5yxhwalJKSoyFy2rAwPEsfJlg4
Message-ID: <CAHUa44EG+SPt8QgMfLmEgLgGyu-EUhd8NL-9R+nbqk9Zf_bFvQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] firmware: arm_ffa: Move memory allocation outside the
 mutex locking
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	=?UTF-8?B?SsOpcsO0bWUgRm9yaXNzaWVy?= <jerome.forissier@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_083402_630648_2E489539 
X-CRM114-Status: GOOD (  21.48  )
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

On Wed, May 28, 2025 at 10:50=E2=80=AFAM Sudeep Holla <sudeep.holla@arm.com=
> wrote:
>
> The notifier callback node allocation is currently done while holding
> the notify_lock mutex. While this is safe even if memory allocation may
> sleep, we need to move the allocation outside the locked region in
> preparation to move from using muxtes to rwlocks.
>
> Move the memory allocation to avoid potential sleeping in atomic context
> once the locks are moved from mutex to rwlocks.
>
> Fixes: e0573444edbf ("firmware: arm_ffa: Add interfaces to request notifi=
cation callbacks")
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>  drivers/firmware/arm_ffa/driver.c | 48 +++++++++++++++++++--------------=
------
>  1 file changed, 24 insertions(+), 24 deletions(-)

Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>

Cheers,
Jens

>
> diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa=
/driver.c
> index 6f75cdf29720993b1cd95eb7d3a36d01b0fdd1de..44eecb786e67b205161e2d486=
02e1f1b53533360 100644
> --- a/drivers/firmware/arm_ffa/driver.c
> +++ b/drivers/firmware/arm_ffa/driver.c
> @@ -1250,13 +1250,12 @@ notifier_hnode_get_by_type(u16 notify_id, enum no=
tify_type type)
>         return NULL;
>  }
>
> -static int
> -update_notifier_cb(struct ffa_device *dev, int notify_id, void *cb,
> -                  void *cb_data, bool is_registration, bool is_framework=
)
> +static int update_notifier_cb(struct ffa_device *dev, int notify_id,
> +                             struct notifier_cb_info *cb, bool is_framew=
ork)
>  {
>         struct notifier_cb_info *cb_info =3D NULL;
>         enum notify_type type =3D ffa_notify_type_get(dev->vm_id);
> -       bool cb_found;
> +       bool cb_found, is_registration =3D !!cb;
>
>         if (is_framework)
>                 cb_info =3D notifier_hnode_get_by_vmid_uuid(notify_id, de=
v->vm_id,
> @@ -1270,18 +1269,7 @@ update_notifier_cb(struct ffa_device *dev, int not=
ify_id, void *cb,
>                 return -EINVAL;
>
>         if (is_registration) {
> -               cb_info =3D kzalloc(sizeof(*cb_info), GFP_KERNEL);
> -               if (!cb_info)
> -                       return -ENOMEM;
> -
> -               cb_info->dev =3D dev;
> -               cb_info->cb_data =3D cb_data;
> -               if (is_framework)
> -                       cb_info->fwk_cb =3D cb;
> -               else
> -                       cb_info->cb =3D cb;
> -
> -               hash_add(drv_info->notifier_hash, &cb_info->hnode, notify=
_id);
> +               hash_add(drv_info->notifier_hash, &cb->hnode, notify_id);
>         } else {
>                 hash_del(&cb_info->hnode);
>                 kfree(cb_info);
> @@ -1303,8 +1291,7 @@ static int __ffa_notify_relinquish(struct ffa_devic=
e *dev, int notify_id,
>
>         mutex_lock(&drv_info->notify_lock);
>
> -       rc =3D update_notifier_cb(dev, notify_id, NULL, NULL, false,
> -                               is_framework);
> +       rc =3D update_notifier_cb(dev, notify_id, NULL, is_framework);
>         if (rc) {
>                 pr_err("Could not unregister notification callback\n");
>                 mutex_unlock(&drv_info->notify_lock);
> @@ -1335,6 +1322,7 @@ static int __ffa_notify_request(struct ffa_device *=
dev, bool is_per_vcpu,
>  {
>         int rc;
>         u32 flags =3D 0;
> +       struct notifier_cb_info *cb_info =3D NULL;
>
>         if (ffa_notifications_disabled())
>                 return -EOPNOTSUPP;
> @@ -1342,6 +1330,17 @@ static int __ffa_notify_request(struct ffa_device =
*dev, bool is_per_vcpu,
>         if (notify_id >=3D FFA_MAX_NOTIFICATIONS)
>                 return -EINVAL;
>
> +       cb_info =3D kzalloc(sizeof(*cb_info), GFP_KERNEL);
> +       if (!cb_info)
> +               return -ENOMEM;
> +
> +       cb_info->dev =3D dev;
> +       cb_info->cb_data =3D cb_data;
> +       if (is_framework)
> +               cb_info->fwk_cb =3D cb;
> +       else
> +               cb_info->cb =3D cb;
> +
>         mutex_lock(&drv_info->notify_lock);
>
>         if (!is_framework) {
> @@ -1349,21 +1348,22 @@ static int __ffa_notify_request(struct ffa_device=
 *dev, bool is_per_vcpu,
>                         flags =3D PER_VCPU_NOTIFICATION_FLAG;
>
>                 rc =3D ffa_notification_bind(dev->vm_id, BIT(notify_id), =
flags);
> -               if (rc) {
> -                       mutex_unlock(&drv_info->notify_lock);
> -                       return rc;
> -               }
> +               if (rc)
> +                       goto out_unlock_free;
>         }
>
> -       rc =3D update_notifier_cb(dev, notify_id, cb, cb_data, true,
> -                               is_framework);
> +       rc =3D update_notifier_cb(dev, notify_id, cb_info, is_framework);
>         if (rc) {
>                 pr_err("Failed to register callback for %d - %d\n",
>                        notify_id, rc);
>                 if (!is_framework)
>                         ffa_notification_unbind(dev->vm_id, BIT(notify_id=
));
>         }
> +
> +out_unlock_free:
>         mutex_unlock(&drv_info->notify_lock);
> +       if (rc)
> +               kfree(cb_info);
>
>         return rc;
>  }
>
> --
> 2.34.1
>

