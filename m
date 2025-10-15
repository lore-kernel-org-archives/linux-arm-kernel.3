Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0547ACCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 14:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/GGPPAy1fHT4f0hgkyN0lKffg2M7YAAILDfIXtiBKFM=; b=4GrVpG+07TZ2A+GLuI1SQXz7TN
	JIJUZw++oJggVf2jFxCpdgvAeCs+DmSCllHa/kTqMYjEobYvhkZyxib+iWk9qn+312C2xGNZHrdVa
	LI8Cmmynn6oHZjF8QGXDayNiek2QsWEN+1sc0E0mG0MRyUsttrHjGy2Vb5LlMCp7vYlLaDdUdgkQu
	vMeZ1jjTV5NLbgG4s0I0E3783tQoPwoJasiwn4wjB/F2UBXH7cJ145RoyF/PTVk96t4o5jD2zgoWR
	Uyyd9Gulj0BIBDiYJNsOwQFpRt1lxyMryt28pg12mptfoAq0gXgBuQ2eDtFJDGhGappFV/VG4NStY
	ZLsTAuzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v92Y5-00000001tmO-4Bb8;
	Wed, 15 Oct 2025 14:32:18 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v92Y2-00000001tke-2BoX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 14:32:16 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-b3d5088259eso976350566b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 07:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760538732; x=1761143532; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/GGPPAy1fHT4f0hgkyN0lKffg2M7YAAILDfIXtiBKFM=;
        b=sOBgW0ksFD3Pv9qVpPYn9zobFw0ewLd6Hc9l8h80h/tFaN9dWPiBBeKTKToIvUscEm
         UNToRuRM6Eq8a/XHC3I3s9JYdQdyIN6UQoaloBLM7YpfMo5P7rl+tL8KvzL3pF/g/Rwa
         Ns2bW3gt3ofj/e2OzG6b87AYDMLEY7D5/dozEdjY1K3zcMuGGNyTOixZ5Ncs76sbumQH
         RGBYVvhfH/CxDVQmnB3iCcNN4UAxZsKqdRKgRAJ3ePgzTZ1XFpLT0l6gooUjQ1ssHdI0
         cXbigomyWjpa85tSEF6+b+jieSHRrv+eRpxYOQjyQuxHeABI3CtZiD+7P1LEW7XJKGLa
         T+iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760538732; x=1761143532;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/GGPPAy1fHT4f0hgkyN0lKffg2M7YAAILDfIXtiBKFM=;
        b=oYooNBy8ClkGkBRIbYEUkh9Fi5blf5P/aMfQQP3LZLcbb4/J7VVram8aacbkImEb1W
         JJvory8E1RP3eHrm1fkwB161CZx7TxMUgFWasT4kLvOUPlTMdbx2p8YQCMk7oixpGtyl
         yVVl24ksnqv4fgMGZ7JaEkq2RWv0WBMafBfqsXT4IwiddKM6GlO2Utjn5KZz3W3jIgq8
         EBb1ua7s0ynolmFoLxwC+HrCaiFJ475MSAnp+G0Z756SfVl1I5JM/dYhpSb754zbp3gA
         S5AoR2uKtHgkbky2b/vD8zChzIMIUaBYB4BMrZt7YuU449S8vD1kGWtBce9/f7mdtayO
         n/SA==
X-Forwarded-Encrypted: i=1; AJvYcCUaNgC9Vd2hJyzX5ZDqf8xlzaNfYfzDSDH+tRAhcWWyWA+TIp78OsehQGA+WGQlBEbJJ6R+obntb3iycByxK6VT@lists.infradead.org
X-Gm-Message-State: AOJu0YzXjY7JBRoW/KC6nJoFONSGaCPq38VtiBFzYntWOWQaw87ETwia
	5C3Mym1h+4cEidflrHXuhiBldpqM7+AXwwA5vi2kswCFbWXvl1Np9sFgKPSex9pXubTH47V2iW1
	+4XJGOZmDlCOD/jFw1w7PZ4qPbSksVDuXHHtcEEbtHQ==
X-Gm-Gg: ASbGncvPoV2SCAL76BusBPRMgcAe/2tgZbw2vSRD8XMkOaSQMUmqd24ZBhdQpgqYoSN
	r/PXMdVGdYd2DXPr91aPTBEo58GQoOZUdu2g0zD/r3SmJQ4gsCoACoAgAOs5+84KiqBFUpkQX9G
	Nv2TNz3bwLvfnrjaPozOoWPeZxibBIVZfybMzHVmrwhu+bMGiEZc/x7xnkSrmj1iPsVS78t68pZ
	DJUbbX3Nf850YR1d6NBdft70i2r/1kp6P9/yaLgOeLPako5EKIR7gf4bNVAXGGRrhKMWEVz
X-Google-Smtp-Source: AGHT+IGvbF9vBWEbG0yxHrHoIRF115LWGGkIrcNil1qvyPeGnU0jWQdwZ6i5CqfPgqW4PnBPT+plyU0IoAr45ong62E=
X-Received: by 2002:a17:907:9448:b0:b40:a71b:151f with SMTP id
 a640c23a62f3a-b50ac1c4e7cmr3318624966b.30.1760538732189; Wed, 15 Oct 2025
 07:32:12 -0700 (PDT)
MIME-Version: 1.0
References: <20251015-arm-psci-system_reset2-vendor-reboots-v16-0-b98aedaa23ee@oss.qualcomm.com>
 <20251015-arm-psci-system_reset2-vendor-reboots-v16-1-b98aedaa23ee@oss.qualcomm.com>
In-Reply-To: <20251015-arm-psci-system_reset2-vendor-reboots-v16-1-b98aedaa23ee@oss.qualcomm.com>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Wed, 15 Oct 2025 16:32:01 +0200
X-Gm-Features: AS18NWDYlSPyX3_l7fQSeSlc4Ni_BqTNtU4UYXiSbDcs8VqP7UVRqIDp11dg6gU
Message-ID: <CACMJSeu_Y2Rra8x22kWN0B38jKZEwq7=B9C75zH18QdjDHAWqg@mail.gmail.com>
Subject: Re: [PATCH v16 01/14] power: reset: reboot-mode: Synchronize list traversal
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
X-CRM114-CacheID: sfid-20251015_073214_608798_5ECF1620 
X-CRM114-Status: GOOD (  25.13  )
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
> List traversals must be synchronized to prevent race conditions
> and data corruption. The reboot-mode list is not protected by a
> lock currently, which can lead to concurrent access and race.
>
> Introduce a mutex lock to guard all operations on the reboot-mode
> list and ensure thread-safe access. The change prevents unsafe
> concurrent access on reboot-mode list.
>
> Fixes: 4fcd504edbf7 ("power: reset: add reboot mode driver")
> Fixes: ca3d2ea52314 ("power: reset: reboot-mode: better compatibility with DT (replace ' ,/')")
>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---
>  drivers/power/reset/reboot-mode.c | 96 +++++++++++++++++++++------------------
>  include/linux/reboot-mode.h       |  4 ++
>  2 files changed, 57 insertions(+), 43 deletions(-)
>
> diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
> index fba53f638da04655e756b5f8b7d2d666d1379535..8fc3e14638ea757c8dc3808c240ff569cbd74786 100644
> --- a/drivers/power/reset/reboot-mode.c
> +++ b/drivers/power/reset/reboot-mode.c
> @@ -29,9 +29,11 @@ static unsigned int get_reboot_mode_magic(struct reboot_mode_driver *reboot,
>         if (!cmd)
>                 cmd = normal;
>
> -       list_for_each_entry(info, &reboot->head, list)
> -               if (!strcmp(info->mode, cmd))
> -                       return info->magic;
> +       scoped_guard(mutex, &reboot->rb_lock) {
> +               list_for_each_entry(info, &reboot->head, list)
> +                       if (!strcmp(info->mode, cmd))
> +                               return info->magic;
> +       }
>
>         /* try to match again, replacing characters impossible in DT */
>         if (strscpy(cmd_, cmd, sizeof(cmd_)) == -E2BIG)
> @@ -41,9 +43,11 @@ static unsigned int get_reboot_mode_magic(struct reboot_mode_driver *reboot,
>         strreplace(cmd_, ',', '-');
>         strreplace(cmd_, '/', '-');
>
> -       list_for_each_entry(info, &reboot->head, list)
> -               if (!strcmp(info->mode, cmd_))
> -                       return info->magic;
> +       scoped_guard(mutex, &reboot->rb_lock) {
> +               list_for_each_entry(info, &reboot->head, list)
> +                       if (!strcmp(info->mode, cmd_))
> +                               return info->magic;
> +       }
>
>         return 0;
>  }
> @@ -78,46 +82,50 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
>
>         INIT_LIST_HEAD(&reboot->head);
>
> -       for_each_property_of_node(np, prop) {
> -               if (strncmp(prop->name, PREFIX, len))
> -                       continue;
> -
> -               info = devm_kzalloc(reboot->dev, sizeof(*info), GFP_KERNEL);
> -               if (!info) {
> -                       ret = -ENOMEM;
> -                       goto error;
> -               }
> -
> -               if (of_property_read_u32(np, prop->name, &info->magic)) {
> -                       dev_err(reboot->dev, "reboot mode %s without magic number\n",
> -                               info->mode);
> -                       devm_kfree(reboot->dev, info);
> -                       continue;
> -               }
> -
> -               info->mode = kstrdup_const(prop->name + len, GFP_KERNEL);
> -               if (!info->mode) {
> -                       ret =  -ENOMEM;
> -                       goto error;
> -               } else if (info->mode[0] == '\0') {
> -                       kfree_const(info->mode);
> -                       ret = -EINVAL;
> -                       dev_err(reboot->dev, "invalid mode name(%s): too short!\n",
> -                               prop->name);
> -                       goto error;
> +       mutex_init(&reboot->rb_lock);
> +
> +       scoped_guard(mutex, &reboot->rb_lock) {
> +               for_each_property_of_node(np, prop) {
> +                       if (strncmp(prop->name, PREFIX, len))
> +                               continue;
> +
> +                       info = devm_kzalloc(reboot->dev, sizeof(*info), GFP_KERNEL);
> +                       if (!info) {
> +                               ret = -ENOMEM;
> +                               goto error;
> +                       }
> +
> +                       if (of_property_read_u32(np, prop->name, &info->magic)) {
> +                               dev_err(reboot->dev, "reboot mode %s without magic number\n",
> +                                       info->mode);
> +                               devm_kfree(reboot->dev, info);
> +                               continue;
> +                       }
> +
> +                       info->mode = kstrdup_const(prop->name + len, GFP_KERNEL);
> +                       if (!info->mode) {
> +                               ret =  -ENOMEM;
> +                               goto error;
> +                       } else if (info->mode[0] == '\0') {
> +                               kfree_const(info->mode);
> +                               ret = -EINVAL;
> +                               dev_err(reboot->dev, "invalid mode name(%s): too short!\n",
> +                                       prop->name);
> +                               goto error;
> +                       }
> +
> +                       list_add_tail(&info->list, &reboot->head);

This seems to be the only call that actually needs synchronization.
All of the above can be run outside the critical section.

>                 }
>
> -               list_add_tail(&info->list, &reboot->head);
> -       }
> -
> -       reboot->reboot_notifier.notifier_call = reboot_mode_notify;
> -       register_reboot_notifier(&reboot->reboot_notifier);
> +               reboot->reboot_notifier.notifier_call = reboot_mode_notify;
> +               register_reboot_notifier(&reboot->reboot_notifier);
>
> -       return 0;
> +               return 0;
>
>  error:
> -       list_for_each_entry(info, &reboot->head, list)
> -               kfree_const(info->mode);
> +               list_for_each_entry(info, &reboot->head, list)
> +                       kfree_const(info->mode);
> +       }
>
>         return ret;
>  }
> @@ -133,8 +141,10 @@ int reboot_mode_unregister(struct reboot_mode_driver *reboot)
>
>         unregister_reboot_notifier(&reboot->reboot_notifier);
>
> -       list_for_each_entry(info, &reboot->head, list)
> -               kfree_const(info->mode);
> +       scoped_guard(mutex, &reboot->rb_lock) {
> +               list_for_each_entry(info, &reboot->head, list)
> +                       kfree_const(info->mode);
> +       }

Please destroy the mutex here.

Bart

>
>         return 0;
>  }
> diff --git a/include/linux/reboot-mode.h b/include/linux/reboot-mode.h
> index 4a2abb38d1d612ec0fdf05eb18c98b210f631b7f..b73f80708197677db8dc2e43affc519782b7146e 100644
> --- a/include/linux/reboot-mode.h
> +++ b/include/linux/reboot-mode.h
> @@ -2,11 +2,15 @@
>  #ifndef __REBOOT_MODE_H__
>  #define __REBOOT_MODE_H__
>
> +#include <linux/mutex.h>
> +
>  struct reboot_mode_driver {
>         struct device *dev;
>         struct list_head head;
>         int (*write)(struct reboot_mode_driver *reboot, unsigned int magic);
>         struct notifier_block reboot_notifier;
> +       /*Protects access to reboot mode list*/
> +       struct mutex rb_lock;
>  };
>
>  int reboot_mode_register(struct reboot_mode_driver *reboot);
>
> --
> 2.34.1
>

