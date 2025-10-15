Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6011CCD194
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 14:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ioOXHAUeOWl9Cx98+VIOdE/MtzEd2iYjV+Axx4XR/9I=; b=XoaIOeEJj3F9FEES3VWPVN85e+
	GKBv2DlQJ32QSxYcGzyDcj808bb3lRGp7fUv7AZjJO7XrrpazC9B9BIGW+nsWFnGRIM3aWdAc9+QQ
	uhQndzRaOlmEk6fL1doKZK2lBXF7XKdB6J1mC8DPJ5/x1poNJy+KXC4WXBgkvVfa4FZ6Jfs6drMrQ
	W/xmNeWeT6d6QgunTP8pVYRO6fSc6bTitkJhRHdD2WsM7MR9+njNg9ImnL4YbWA5vrRFz8GdOz+zX
	mC08zP+buGxQxBmxIH2zxbRvh/y0H0Vfp2hNIGmpVGhXyW2BVt2qHW8NnvEQWum8GHfDyzAdA5LYb
	sBWPVNBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v92gI-00000001wKT-3qpE;
	Wed, 15 Oct 2025 14:40:46 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v92gG-00000001wIo-2d2y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 14:40:45 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-b3e7cc84b82so1254025366b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 07:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760539243; x=1761144043; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ioOXHAUeOWl9Cx98+VIOdE/MtzEd2iYjV+Axx4XR/9I=;
        b=swfFSIX6DpjTwoffh/JXCxGfo888nOsMA2JKvKCmvTYkcQllofS69bGvKf0CwGEgpe
         iUOoLbnkd0HjZg8NwGGk+xxxdO7R/W6s0OQsKf2lAubBbDj6Anw1OVRRnHhxYC+bbTC0
         Z6x22LSq7ZHvXl3z5WuIB1d9Z6YzdSnkaachQlVDGLcveM9ROFz2j5jSIWuGQ2tAV+8r
         wKBcrh2WqxF3PCrhEQndDqOUGuCjcS9wyDj0UQjTsPoTsRdQcFZZcNxn6EDVEaTME8Qr
         9pP6AzCw71wCKpTvr+j6yINAVpxKHdMn+rj0zKnPOqA46i2ma4nCiYUqwoJ82Cezxdc5
         Uq3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760539243; x=1761144043;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ioOXHAUeOWl9Cx98+VIOdE/MtzEd2iYjV+Axx4XR/9I=;
        b=dcUM54CDhaso+DMULdVORAVjkHLY62Y1xA7fE6qLRUPTNEiBWBRGT3KVkGOlkcrva9
         3mqSD0TImGzEvLrCzi0Tl5MyAi4e6l+H+sFoPLAKm8zJgW5+cIpSuQX9LqWys3Zl39zB
         p+s5JeToSNRikjEEuqmMyFqSsnU7uuckQdiEuqDfQcKRKQ4LKVoeH1JqI+bxvIPKHaVn
         35+kxzBWEyixfSy6+qedhCRAnUqnhtyFAVaRkc22gwZgU+ZSFZAmg509zDFrr0Qkvlel
         xxdY94NQJDCjkQkMdUtizC9LP/Lg9LhtyiHghEhfr+WeILNcI6q1vJpPM2E9zAL8QzQu
         Qu+A==
X-Forwarded-Encrypted: i=1; AJvYcCVA17R3Iqgee7GZUp6aNH5Rk/hw7C1ch64jAFIUZOu7oLqoJotmSxweaPNrJKbHR+rdEaoc6GagujbIKRLW/tj1@lists.infradead.org
X-Gm-Message-State: AOJu0YwRdspoeEHLPhw4cFcmTcmtbcq5OQGJor+xqTIhr3ehAVEh5yZy
	epGNedqupBLVljdsZG1vPQ6NZYII+CIEdzBYNBBTvO5Drzh+eWtWO2Mi5IckX8ZoxfrIcGhNwkQ
	pRxx3JF0yW6aaUOiMjtLnbfvpcODeXTUaA35Np1itlg==
X-Gm-Gg: ASbGncv0nPgFHCMajkVVZsHbinh5SWBEGNih/Wps+RJHjEQ9BrMWOibxFX1mRA6y7gw
	3i1XGUYL/4VqERXIi1v+1KANNkrzA4b15M3qrXyBDEL+aMu0at112q2xIHrwVU42iWT/JLBUry7
	pAtO3WBlIpzhLPuOlAOKc5pGIebZzrRbjGUp/7J+40AH+LcTWt1lwyGOxsEshIs2OMA3o5Ayki7
	o3VA6B9pwZYVuzIERRK+KaYHW4HFJIcIgl45vj6zFOa3/DXxzXzWxoRPWmQzA==
X-Google-Smtp-Source: AGHT+IE55tYwWLea5Z6cfLKt4Sgq0GP5juB5/AB0VrwbGmTvtf1jxrqrlQyzV6KgpTsqfhg8Yx84hzotM9p51deCCN8=
X-Received: by 2002:a17:907:7f17:b0:b04:2452:e267 with SMTP id
 a640c23a62f3a-b50ac9f8958mr3155639966b.56.1760539239137; Wed, 15 Oct 2025
 07:40:39 -0700 (PDT)
MIME-Version: 1.0
References: <20251015-arm-psci-system_reset2-vendor-reboots-v16-0-b98aedaa23ee@oss.qualcomm.com>
 <20251015-arm-psci-system_reset2-vendor-reboots-v16-2-b98aedaa23ee@oss.qualcomm.com>
In-Reply-To: <20251015-arm-psci-system_reset2-vendor-reboots-v16-2-b98aedaa23ee@oss.qualcomm.com>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Wed, 15 Oct 2025 16:40:28 +0200
X-Gm-Features: AS18NWCQoc3JRxuhuUVN2sHmwVBBVV2ODuQ3ysvtaltJn61MtT40Ld9OBIYCQNI
Message-ID: <CACMJSesvTLe28Jz83b=zfHD2rvmf7-i_2+2DoV=dgooVqFEYbA@mail.gmail.com>
Subject: Re: [PATCH v16 02/14] power: reset: reboot-mode: Add device tree
 node-based registration
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
	Sudeep Holla <sudeep.holla@arm.com>, Souvik Chakravarty <Souvik.Chakravarty@arm.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Yan <andy.yan@rock-chips.com>, Mark Rutland <mark.rutland@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Konrad Dybcio <konradybcio@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
	Vinod Koul <vkoul@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Moritz Fischer <moritz.fischer@ettus.com>, John Stultz <john.stultz@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Stephen Boyd <swboyd@chromium.org>, 
	Andre Draszik <andre.draszik@linaro.org>, 
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	Elliot Berman <quic_eberman@quicinc.com>, Srinivas Kandagatla <srini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_074044_704927_D09CA709 
X-CRM114-Status: GOOD (  32.63  )
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

On Wed, 15 Oct 2025 at 06:38, Shivendra Pratap
<shivendra.pratap@oss.qualcomm.com> wrote:
>
> The reboot-mode driver does not have a strict requirement for
> device-based registration. It primarily uses the device's of_node
> to read mode-<cmd> properties and the device pointer for logging.
>
> Remove the dependency on struct device and introduce support for
> firmware node (fwnode) based registration. This enables drivers
> that are not associated with a struct device to leverage the
> reboot-mode framework.
>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---
>  drivers/power/reset/reboot-mode.c | 45 +++++++++++++++++++++++++++++----------
>  include/linux/reboot-mode.h       |  3 ++-
>  2 files changed, 36 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
> index 8fc3e14638ea757c8dc3808c240ff569cbd74786..c8f71e6f661ae14eb72bdcb1f412cd05faee3dd9 100644
> --- a/drivers/power/reset/reboot-mode.c
> +++ b/drivers/power/reset/reboot-mode.c
> @@ -3,13 +3,17 @@
>   * Copyright (c) 2016, Fuzhou Rockchip Electronics Co., Ltd
>   */
>
> +#define pr_fmt(fmt)    "reboot-mode: " fmt
> +
>  #include <linux/device.h>
>  #include <linux/init.h>
>  #include <linux/kernel.h>
> +#include <linux/list.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/reboot.h>
>  #include <linux/reboot-mode.h>
> +#include <linux/slab.h>
>
>  #define PREFIX "mode-"
>
> @@ -69,17 +73,26 @@ static int reboot_mode_notify(struct notifier_block *this,
>  /**
>   * reboot_mode_register - register a reboot mode driver
>   * @reboot: reboot mode driver
> + * @fwnode: Firmware node with reboot-mode configuration
>   *
>   * Returns: 0 on success or a negative error code on failure.
>   */
> -int reboot_mode_register(struct reboot_mode_driver *reboot)
> +int reboot_mode_register(struct reboot_mode_driver *reboot, struct fwnode_handle *fwnode)
>  {
>         struct mode_info *info;
> +       struct mode_info *next;
> +       struct device_node *np;
>         struct property *prop;
> -       struct device_node *np = reboot->dev->of_node;
>         size_t len = strlen(PREFIX);
>         int ret;
>
> +       if (!fwnode)
> +               return -EINVAL;
> +
> +       np = to_of_node(fwnode);
> +       if (!np)
> +               return -EINVAL;
> +
>         INIT_LIST_HEAD(&reboot->head);
>
>         mutex_init(&reboot->rb_lock);
> @@ -89,28 +102,28 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
>                         if (strncmp(prop->name, PREFIX, len))
>                                 continue;
>
> -                       info = devm_kzalloc(reboot->dev, sizeof(*info), GFP_KERNEL);

This change is good - devres should not be used in subsystem library
code, only in drivers - but it doesn't seem to belong here, can you
please separate it out and make it backportable?

> +                       info = kzalloc(sizeof(*info), GFP_KERNEL);
>                         if (!info) {
>                                 ret = -ENOMEM;
>                                 goto error;
>                         }
>
>                         if (of_property_read_u32(np, prop->name, &info->magic)) {
> -                               dev_err(reboot->dev, "reboot mode %s without magic number\n",
> -                                       info->mode);
> -                               devm_kfree(reboot->dev, info);
> +                               pr_err("reboot mode %s without magic number\n", info->mode);
> +                               kfree(info);
>                                 continue;
>                         }
>
>                         info->mode = kstrdup_const(prop->name + len, GFP_KERNEL);
>                         if (!info->mode) {
>                                 ret =  -ENOMEM;
> +                               kfree(info);
>                                 goto error;
>                         } else if (info->mode[0] == '\0') {
>                                 kfree_const(info->mode);
> +                               kfree(info);
>                                 ret = -EINVAL;
> -                               dev_err(reboot->dev, "invalid mode name(%s): too short!\n",
> -                                       prop->name);
> +                               pr_err("invalid mode name(%s): too short!\n", prop->name);
>                                 goto error;
>                         }
>
> @@ -123,8 +136,11 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
>                 return 0;
>
>  error:
> -               list_for_each_entry(info, &reboot->head, list)
> +               list_for_each_entry_safe(info, next, &reboot->head, list) {
> +                       list_del(&info->list);

Same here, not deleting the entries currently seems like a bug? Do we
depend on the driver detach to clean up the resources on failure?

>                         kfree_const(info->mode);
> +                       kfree(info);
> +               }
>         }
>
>         return ret;
> @@ -138,12 +154,16 @@ EXPORT_SYMBOL_GPL(reboot_mode_register);
>  int reboot_mode_unregister(struct reboot_mode_driver *reboot)
>  {
>         struct mode_info *info;
> +       struct mode_info *next;
>
>         unregister_reboot_notifier(&reboot->reboot_notifier);
>
>         scoped_guard(mutex, &reboot->rb_lock) {
> -               list_for_each_entry(info, &reboot->head, list)
> +               list_for_each_entry_safe(info, next, &reboot->head, list) {
> +                       list_del(&info->list);
>                         kfree_const(info->mode);
> +                       kfree(info);
> +               }
>         }
>
>         return 0;
> @@ -168,11 +188,14 @@ int devm_reboot_mode_register(struct device *dev,
>         struct reboot_mode_driver **dr;
>         int rc;
>
> +       if (!reboot->dev || !reboot->dev->of_node)
> +               return -EINVAL;
> +
>         dr = devres_alloc(devm_reboot_mode_release, sizeof(*dr), GFP_KERNEL);
>         if (!dr)
>                 return -ENOMEM;
>
> -       rc = reboot_mode_register(reboot);
> +       rc = reboot_mode_register(reboot, of_fwnode_handle(reboot->dev->of_node));
>         if (rc) {
>                 devres_free(dr);
>                 return rc;
> diff --git a/include/linux/reboot-mode.h b/include/linux/reboot-mode.h
> index b73f80708197677db8dc2e43affc519782b7146e..7f05fd873e95ca8249bc167c21aa6b76faba7849 100644
> --- a/include/linux/reboot-mode.h
> +++ b/include/linux/reboot-mode.h
> @@ -2,6 +2,7 @@
>  #ifndef __REBOOT_MODE_H__
>  #define __REBOOT_MODE_H__
>
> +#include <linux/fwnode.h>
>  #include <linux/mutex.h>
>
>  struct reboot_mode_driver {
> @@ -13,7 +14,7 @@ struct reboot_mode_driver {
>         struct mutex rb_lock;
>  };
>
> -int reboot_mode_register(struct reboot_mode_driver *reboot);
> +int reboot_mode_register(struct reboot_mode_driver *reboot, struct fwnode_handle *fwnode);
>  int reboot_mode_unregister(struct reboot_mode_driver *reboot);
>  int devm_reboot_mode_register(struct device *dev,
>                               struct reboot_mode_driver *reboot);
>
> --
> 2.34.1
>

Bartosz

