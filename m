Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15E5ACAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 14:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=au0N8UjUCdJyaXYgEI+pwEcqeIAVB1l8ChmB40Jysug=; b=CDQMPD9M6uMzJwpZGLygVoxek7
	a6zq7Pd6hP/e6bwbpATq9KXwForXDY227ouUSbBc8y9HkDqeyNv0RsZR9uB4nrfeVTlh/EPrM7ofe
	A2mfEEZPUm/A9keozVc9UX1o6u2t33DWKl5NO37/xKdywFv8Jah/WbtlKuMan89qN2qe1DvR5dFwl
	WwVcK4AI381PQJp3uON0pqdUfHS/y63YdqUr88yu/8G4ngTK72MIZc9R/G9tmnP0no2zxXMZjJa1N
	OhPQbfAuj/L0SPegfWLLY6Jb+WXEsC45lRDlc0iB+fFTgtfMlU+slW01+/osqNxnqqhbsvIrk8zUo
	hAxJe4ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzG5P-00000000EcU-0G28;
	Thu, 18 Sep 2025 14:58:15 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzG5M-00000000EaZ-2TO6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 14:58:14 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-ea473582bcaso2603902276.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 07:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758207491; x=1758812291; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=au0N8UjUCdJyaXYgEI+pwEcqeIAVB1l8ChmB40Jysug=;
        b=q6zRfNZvkuxvX5c7Indnz0vej3bkiBbeTrfxzn7qf+q4PtLgLfrq53Ha/jIB67NPA3
         d2PrVvyHGzCjivR4amGSsTUcsatduoztmUcMXeUf7t3R+akDpkszBY54yWcIpM79tMXv
         jDAdxV9Kp5tCV++i1GbHFmvTw4SuWIAvblxJPx+QCR7Fc2GTeNvs5ykPWXbNHry1QoBu
         tvtW5eDfgRd4+2K45+L/H52+VHOXTCgwvX5n34p3J+SRdln4eCvS/zp/jvglEw8pBF8N
         //pxZxxdniOMbY76MVolsE3HuMLf2H4+cv8kt/hwQgs/0d4yrZD89OFUmJPdcRhSrlN7
         lwwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758207491; x=1758812291;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=au0N8UjUCdJyaXYgEI+pwEcqeIAVB1l8ChmB40Jysug=;
        b=ldWHAM3bFvRqFwGtJcFsIBbflrSqCpLsw4Pv7hsv85behkuKZzAmRbje5ayV9FZKC1
         DbUofqFc2JIbXwV0Eo4oL9iXcVkaRseMpJul1HrpHZpmr9J2pcdFxuhfscxHc89OtBo9
         DX9jV77KIU7OKrWuZP9hQYwv8r3oeBO1QoMIgXkpStZPZ9OOFsnRsrVgbWcPGZ8o0oE9
         1Y+GVzcVMt0SVxMZwiMV2x4tXl544Uty2OAscEs0/TAZ3t05CGipExjjOod6Nq3/Bdk0
         oqwggAL1BfxxV6F7cnKjl+P+8F29U16LZZCCPYyrybNEHQYvgEoxJnvfWJ1xbvXhxt7G
         arPA==
X-Forwarded-Encrypted: i=1; AJvYcCUThExnHE9xcWclWGBYp0H0KgzQ+eO68ktrYzx4mYfHUcQiqHEAt0Otvlf9Pr9Y6/OwqLaKcrlraWPLPrzJnFIk@lists.infradead.org
X-Gm-Message-State: AOJu0YxxiOTzCi7pXFSO+m2CDHZmAPB5xlh8RZdUypmDHlONiU0kd67h
	SZI7dvD1vVHQDiVI0BBcmz0u+BynrT+sLUzRMaCenhIKZyksylXkksQEa1eQsgYiL+vd8HnjISi
	b5hiwykd4EBqD9A5YjcrgmndTfzfiZfxjCw4aliHgVg==
X-Gm-Gg: ASbGncsV27lIvXK8b13FKXktAhiE98l2BOoau4WCQfiB2gAlIYqGH2XDYaBHVnI4EYt
	2tL/UZfWn38FfNhykpdZ5FUZnoLHFBBqyJq4dFI6+7gGtLJVS2t5+gZHQHZt7FsHaLg2DbU7SAa
	FsrlnmKwtiOMMLyqnq1CmjCs9BCuSj7/patOakV3JRQbgKThU3z/MfSWcUwFPhzf89fyOp9pj5M
	Q+WAtw9gcePZWkvK9JuoAyToPo=
X-Google-Smtp-Source: AGHT+IFu/Hil6zUPihFVRvZ9DUy8R4zMDZj2S8OaE0GEEgl5Uq2FPzOER6rzX/6cmX1azbC/FOh27T6/OPOtiqBGMW4=
X-Received: by 2002:a05:690e:2515:b0:633:bc86:a1d2 with SMTP id
 956f58d0204a3-634773d6120mr24947d50.0.1758207490799; Thu, 18 Sep 2025
 07:58:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250902-pm-v3-0-ffadbb454cdc@nxp.com> <20250902-pm-v3-1-ffadbb454cdc@nxp.com>
In-Reply-To: <20250902-pm-v3-1-ffadbb454cdc@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 18 Sep 2025 16:57:34 +0200
X-Gm-Features: AS18NWDnkEmKtjLXZgraEdCqo9-wmrIQesU05v7Yd2QIwo9qUnvKejYI9I4FOEI
Message-ID: <CAPDyKFrui-Vr1rvE01w+n4ttWeUk4cmr2jqgqk0BWe98eQtkcg@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] pmdomain: core: Introduce device_set/get_out_band_wakeup()
To: Peng Fan <peng.fan@nxp.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Peter Chen <peter.chen@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Xu Yang <xu.yang_2@nxp.com>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, imx@lists.linux.dev, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_075812_662867_D98BAF43 
X-CRM114-Status: GOOD (  27.93  )
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

On Tue, 2 Sept 2025 at 05:33, Peng Fan <peng.fan@nxp.com> wrote:
>
> For some cases, a device could still wakeup the system even if its power
> domain is in off state, because the device's wakeup hardware logic is
> in an always-on domain.
>
> To support this case, introduce device_set/get_out_band_wakeup() to
> allow device drivers to control the behaviour in genpd for a device
> that is attached to it.

Would you mind trying to extend/clarify this commit-msg a bit more, to
make the benefit more clear.

For example, today we may be wasting energy, by unnecessarily keeping
PM domains powered-on during system-wide suspend, when a device has
been enabled for system-wakeup...

In regards to terminology, I would appreciate if we could use
"system-wakeup" and "out-band system-wakeup logic" and "system-wide
suspend".

>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/pmdomain/core.c   |  6 ++++--
>  include/linux/pm.h        |  1 +
>  include/linux/pm_wakeup.h | 17 +++++++++++++++++

Please split this into two separate patches.

>  3 files changed, 22 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index 0006ab3d078972cc72a6dd22a2144fb31443e3da..8e37758cea88a9ee051ad9fb13bdd3feb4f8745e 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -1549,7 +1549,8 @@ static int genpd_finish_suspend(struct device *dev,
>         if (ret)
>                 return ret;
>
> -       if (device_awake_path(dev) && genpd_is_active_wakeup(genpd))
> +       if (device_awake_path(dev) && genpd_is_active_wakeup(genpd) &&
> +           !device_get_out_band_wakeup(dev))
>                 return 0;
>
>         if (genpd->dev_ops.stop && genpd->dev_ops.start &&
> @@ -1604,7 +1605,8 @@ static int genpd_finish_resume(struct device *dev,
>         if (IS_ERR(genpd))
>                 return -EINVAL;
>
> -       if (device_awake_path(dev) && genpd_is_active_wakeup(genpd))
> +       if (device_awake_path(dev) && genpd_is_active_wakeup(genpd) &&
> +           !device_get_out_band_wakeup(dev))
>                 return resume_noirq(dev);
>
>         genpd_lock(genpd);
> diff --git a/include/linux/pm.h b/include/linux/pm.h
> index cc7b2dc28574c24ece2f651352d4d23ecaf15f31..5b28a4f2e87e2aa34acc709e146ce729acace344 100644
> --- a/include/linux/pm.h
> +++ b/include/linux/pm.h
> @@ -684,6 +684,7 @@ struct dev_pm_info {
>         bool                    smart_suspend:1;        /* Owned by the PM core */
>         bool                    must_resume:1;          /* Owned by the PM core */
>         bool                    may_skip_resume:1;      /* Set by subsystems */
> +       bool                    out_band_wakeup:1;
>         bool                    strict_midlayer:1;
>  #else
>         bool                    should_wakeup:1;
> diff --git a/include/linux/pm_wakeup.h b/include/linux/pm_wakeup.h
> index c838b4a30f876ef5a66972d16f461cfba9ff2814..c461c7edef6f7927d696b7d18b59a6a1147f53a3 100644
> --- a/include/linux/pm_wakeup.h
> +++ b/include/linux/pm_wakeup.h
> @@ -94,6 +94,16 @@ static inline void device_set_wakeup_path(struct device *dev)
>         dev->power.wakeup_path = true;
>  }
>
> +static inline void device_set_out_band_wakeup(struct device *dev, bool capable)
> +{
> +       dev->power.out_band_wakeup = capable;

I suggest we drop the bool as in-parameter and just do:
dev->power.out_band_wakeup = true;

Moreover, I think we should clear the flag in device_prepare(), next
to where dev->power.wakeup_path is cleared.

This makes the behavior better aligned for users of these flags.

> +}
> +
> +static inline bool device_get_out_band_wakeup(struct device *dev)

Nitpick: I would rename this into device_out_band_wakeup(). At least
the "get" part is a confusing in my opinion, as indicates there is
reference taken too.

> +{
> +       return dev->power.out_band_wakeup;
> +}
> +
>  /* drivers/base/power/wakeup.c */
>  extern struct wakeup_source *wakeup_source_register(struct device *dev,
>                                                     const char *name);
> @@ -162,6 +172,13 @@ static inline bool device_wakeup_path(struct device *dev)
>
>  static inline void device_set_wakeup_path(struct device *dev) {}
>
> +static inline void device_set_out_band_wakeup(struct device *dev, bool capable) {}
> +
> +static inline bool device_get_out_band_wakeup(struct device *dev)
> +{
> +       return false;
> +}
> +
>  static inline void __pm_stay_awake(struct wakeup_source *ws) {}
>
>  static inline void pm_stay_awake(struct device *dev) {}
>
> --
> 2.37.1
>

Otherwise, from an overall functionality point of view, this makes sense to me!

Kind regards
Uffe

