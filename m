Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40C27E9410B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 10:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VqSnE0f5i+F8MVq6rjgxnoU496AbIAb3GVZ4oWXbbtA=; b=emH4VCHTTrKGdmTllSCZ5/Wp7w
	SghNqTrPNoWDHYLw/7mk2hF3aickfI1G6/QSDbpnPXNMsxyEkfm1a2HxJa7nV2MU55mPVCU3F9bZZ
	XOVQdimGOqSEHJ+TS6X23auPK+ECdXeiFQTvuyBf6z/fXNsvgW6I/lB/yHqSmANdIMxt5gQP6FDVK
	xAmNai3rX41YSjM6fx/jTqRXh4IlBzMhmtbi3fW+xjVYVWiJeRyss9+XJYpGfZZJ6rfPfAYpUQ1Os
	mIL5QFrOKVj0fX7LO9pF/3BdhKkgQLpSdaGnRAfPv5oVonxJPqf9YIbtKAmAvMcEWk2I8HnWu2ZNJ
	xR/5HTCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbc2q-000000083He-0r4S;
	Fri, 02 Jan 2026 10:06:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbc2o-000000083HW-1haT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 10:06:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 274AB6013B
	for <linux-arm-kernel@lists.infradead.org>; Fri,  2 Jan 2026 10:06:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80169C2BCB3
	for <linux-arm-kernel@lists.infradead.org>; Fri,  2 Jan 2026 10:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767348364;
	bh=gchyAxkFCm31zIKqZC5yld6T9YtZLl36hqgAgO5bNfA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GZSAsRtGHFfgeoTVK33CkuT63zYzQxc0+NFc5Iy5UrH7TxPBQBt+9sQrDIDkP90Sf
	 JUv7c33zMLlROsCZXUAdhPRJLj/CUcb4F4seEJScZHGWhHdOxx+zjFI+TlwRzAMSl4
	 pkYtn8UCGs0DXwwGfc7z6u/twcFCK+HiZCH6ijKhQ1HTjX3903/lZVJzUxihxmuwMX
	 YrZQoGndxqELJBKEimE4VmEsEheiW/URzXqP8QxWp3V6oIYlpbs4UXW37ez6Uo+WAZ
	 0CIiWOEkCTiwly2W1zkmuNPhCw3Tv9PU8TxfOe8aqsf71nfLgt6BU14qburCTS+lqU
	 QUTBzfAadJNEg==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-598eaafa587so13651583e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Jan 2026 02:06:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVNOfsa1xyw7QgJsFJr9e4bYGDDvuyl01SAnlcGh7pVjcXX+uQy+/X8NpHs0D3eDRFJV2YEUBTlMwqpkmgLIKir@lists.infradead.org
X-Gm-Message-State: AOJu0YxaGpOvVCwJwlE0JLmwDMPjZQh6F5gMsC9X7CKyR2450GqKdLTR
	ZGf+If9gZkInsPR10SZxjVjOlfHwGJpDsC062QM9orITKCesUGDBxt9F3aycZVQfFtuT/5hj58x
	4bulEkNcAGAckhuXhNXL8EnTAIqzzx1gQy1C3E+nt0g==
X-Google-Smtp-Source: AGHT+IFGdco3IkndyZVqVIrcNxSfB0QYH1orte4zZsqd4dtQJlhjdGqzpakv3I4zCBg3a81gJfH5GvwcXtaxtjuHS/o=
X-Received: by 2002:a05:6512:131c:b0:593:ffa:6988 with SMTP id
 2adb3069b0e04-59a17d9707fmr14535500e87.21.1767348362869; Fri, 02 Jan 2026
 02:06:02 -0800 (PST)
MIME-Version: 1.0
References: <20251228-arm-psci-system_reset2-vendor-reboots-v19-0-ebb956053098@oss.qualcomm.com>
 <20251228-arm-psci-system_reset2-vendor-reboots-v19-1-ebb956053098@oss.qualcomm.com>
In-Reply-To: <20251228-arm-psci-system_reset2-vendor-reboots-v19-1-ebb956053098@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 2 Jan 2026 11:05:50 +0100
X-Gmail-Original-Message-ID: <CAMRc=McEB+yVYxropzsqLExZCU5Pd_iy_=5N3pTxu28-ZX=7_w@mail.gmail.com>
X-Gm-Features: AQt7F2p5KpT_VMscgdeBfPWopnrQ29TsIsrUWNt-I0niquK6j9g2Sp51yPziFyA
Message-ID: <CAMRc=McEB+yVYxropzsqLExZCU5Pd_iy_=5N3pTxu28-ZX=7_w@mail.gmail.com>
Subject: Re: [PATCH v19 01/10] power: reset: reboot-mode: Remove devres based allocations
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Bjorn Andersson <andersson@kernel.org>, Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
	Sudeep Holla <sudeep.holla@arm.com>, Souvik Chakravarty <Souvik.Chakravarty@arm.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Andy Yan <andy.yan@rock-chips.com>, 
	John Stultz <john.stultz@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Moritz Fischer <moritz.fischer@ettus.com>, Mark Rutland <mark.rutland@arm.com>, 
	Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Andre Draszik <andre.draszik@linaro.org>, 
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	Srinivas Kandagatla <srini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Sun, Dec 28, 2025 at 6:20=E2=80=AFPM Shivendra Pratap
<shivendra.pratap@oss.qualcomm.com> wrote:
>
> Devres APIs are intended for use in drivers, where the managed lifetime
> of resources is tied directly to the driver attach/detach cycle. In
> shared subsystem code, there is no guarantee that the subsystem
> functions will only be called after a driver has been attached, nor that
> they will not be referenced after the managed resources have been
> released during driver detach.
>
> To ensure correct lifetime handling, avoid using devres-based
> allocations in the reboot-mode and explicitly handle allocation and
> cleanup of resources.
>
> Fixes: 4fcd504edbf7 ("power: reset: add reboot mode driver")
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---
>  drivers/power/reset/reboot-mode.c | 34 ++++++++++++++++++++++-----------=
-
>  1 file changed, 22 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/rebo=
ot-mode.c
> index fba53f638da04655e756b5f8b7d2d666d1379535..3af6bc16a76daee686e8110b7=
4e71b0e62b13ef8 100644
> --- a/drivers/power/reset/reboot-mode.c
> +++ b/drivers/power/reset/reboot-mode.c
> @@ -3,6 +3,8 @@
>   * Copyright (c) 2016, Fuzhou Rockchip Electronics Co., Ltd
>   */
>
> +#define pr_fmt(fmt)    "reboot-mode: " fmt
> +
>  #include <linux/device.h>
>  #include <linux/init.h>
>  #include <linux/kernel.h>
> @@ -10,6 +12,7 @@
>  #include <linux/of.h>
>  #include <linux/reboot.h>
>  #include <linux/reboot-mode.h>
> +#include <linux/slab.h>
>
>  #define PREFIX "mode-"
>
> @@ -71,9 +74,11 @@ static int reboot_mode_notify(struct notifier_block *t=
his,
>  int reboot_mode_register(struct reboot_mode_driver *reboot)
>  {
>         struct mode_info *info;
> +       struct mode_info *next;
>         struct property *prop;
>         struct device_node *np =3D reboot->dev->of_node;
>         size_t len =3D strlen(PREFIX);
> +       u32 magic;
>         int ret;
>
>         INIT_LIST_HEAD(&reboot->head);
> @@ -82,19 +87,17 @@ int reboot_mode_register(struct reboot_mode_driver *r=
eboot)
>                 if (strncmp(prop->name, PREFIX, len))
>                         continue;
>
> -               info =3D devm_kzalloc(reboot->dev, sizeof(*info), GFP_KER=
NEL);
> +               if (of_property_read_u32(np, prop->name, &magic)) {

Please use device_property_read_u32() if you have access to a device struct=
.

> +                       pr_err("reboot mode %s without magic number\n", p=
rop->name);

If this is an error, shouldn't we bail out?

> +                       continue;
> +               }
> +
> +               info =3D kzalloc(sizeof(*info), GFP_KERNEL);
>                 if (!info) {
>                         ret =3D -ENOMEM;
>                         goto error;
>                 }
>
> -               if (of_property_read_u32(np, prop->name, &info->magic)) {
> -                       dev_err(reboot->dev, "reboot mode %s without magi=
c number\n",
> -                               info->mode);
> -                       devm_kfree(reboot->dev, info);
> -                       continue;
> -               }
> -
>                 info->mode =3D kstrdup_const(prop->name + len, GFP_KERNEL=
);
>                 if (!info->mode) {
>                         ret =3D  -ENOMEM;
> @@ -102,8 +105,7 @@ int reboot_mode_register(struct reboot_mode_driver *r=
eboot)
>                 } else if (info->mode[0] =3D=3D '\0') {
>                         kfree_const(info->mode);
>                         ret =3D -EINVAL;
> -                       dev_err(reboot->dev, "invalid mode name(%s): too =
short!\n",
> -                               prop->name);
> +                       pr_err("invalid mode name(%s): too short!\n", pro=
p->name);
>                         goto error;
>                 }
>
> @@ -116,8 +118,12 @@ int reboot_mode_register(struct reboot_mode_driver *=
reboot)
>         return 0;
>
>  error:
> -       list_for_each_entry(info, &reboot->head, list)
> +       kfree(info);
> +       list_for_each_entry_safe(info, next, &reboot->head, list) {
> +               list_del(&info->list);
>                 kfree_const(info->mode);
> +               kfree(info);
> +       }
>
>         return ret;
>  }
> @@ -130,11 +136,15 @@ EXPORT_SYMBOL_GPL(reboot_mode_register);
>  int reboot_mode_unregister(struct reboot_mode_driver *reboot)
>  {
>         struct mode_info *info;
> +       struct mode_info *next;
>
>         unregister_reboot_notifier(&reboot->reboot_notifier);
>
> -       list_for_each_entry(info, &reboot->head, list)
> +       list_for_each_entry_safe(info, next, &reboot->head, list) {
> +               list_del(&info->list);
>                 kfree_const(info->mode);
> +               kfree(info);
> +       }

The code is repeated here, maybe factor it out into a separate function?

>
>         return 0;
>  }
>
> --
> 2.34.1
>

Bart

