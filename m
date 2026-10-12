Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50491CA9EDE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 18:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/MEr9TnYRLEADPm5dzJuPJHXku6tQFEe33VUaq9byuA=; b=BGQaY1zIFXs22iUwEzFVV3fL0F
	WbYLAn0xWUygpAJzDEcZIkcZS3+32VWPgGbMb2tJDB6XtEFe93NteaMT0cPeXsdZ2mOVgwZcV8+Z/
	mVi573dHZBmBJXXXRCk4550hRNH8UNAP0IbiUJyiro2uBUfY1L09WvCfKpIr41bpu1lHnPsYS8Wyk
	+0VLAZMFpPqZvPehFjPdXXqE2XLUqY+Gz6RXUHMoy1RGNJv8n7SidvVHlFp/OoPB7ZwN3QZgYAdTn
	fVyuThbGRjtknq3VOmi7V/7gVZJzQkEYMc1gX1628w1T8Ad6OpN8IXfoS18G75NUC+4uisr0+vc1n
	qhfOUFQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGL2F-0000000BHSx-42Gy;
	Mon, 12 Oct 2026 18:46:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGL2E-0000000BHRl-1eVA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 18:46:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D3BD16025F
	for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 18:46:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BFC81F008BF
	for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 18:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791830765;
	bh=/MEr9TnYRLEADPm5dzJuPJHXku6tQFEe33VUaq9byuA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=fhNT1XW5NUlRnPw2Fivx9Ih549qwrcSW7eJTooUp25OG4U85bx6y89U9yu2QZezoY
	 VYoo4RGdZ6fSJH/oRLNPTdWosFIZecXQLfy/s3P+kr0gaMAqFeFRxOoYDDZSWPIo8r
	 PMoE4XuJwzcX0Jip3GzH1i69yARx2MqavXPoGexxo6Uffc9PqLsd4/JVyJOx/1BqTH
	 fxi5he5vJ0kwD+zUpA8Qwdh1Ydjtz0rPtA4GQEUQx2yljoU19u8sKkcNSiWzb42gJL
	 mpWT8s5HfHE0EKb/II9Ec0U82pY4wU0wLeCLlEZpHuPn47kcbwAb24z9OEwjntz2wU
	 O6jKN4SiBHveg==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5bc18f54abbso507789e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 11:46:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx2B3Wi/fJCF97sV4R3k1LyjBSuhPEFhMlXh/DgP8OsQ+cpEw1mMgSLPy2jVz8C5bh8hRxycEgxDYtu/vvYm142@lists.infradead.org
X-Gm-Message-State: AFq9FYKS95UtjD6N107n/cv1nEddRjMvcN+G1C618ao59j//ONCjsZUV
	oOioJYSHLs/q9aIT385pj987PpuWv40oDSG4sUFbkAES1Zc6Z5Sq0GHPT8+MEq0sSfpXlwcqmqf
	OBSrxDRCkpDwKzi+Do9PCOZb4MXkpxxM=
X-Received: by 2002:a05:6512:3a92:b0:5b8:eb3a:759b with SMTP id
 2adb3069b0e04-5bcde8bdabdmr3719119e87.42.1791830763879; Mon, 12 Oct 2026
 11:46:03 -0700 (PDT)
MIME-Version: 1.0
References: <20261009-adma-pm-fix-and-per-channel-reset-v4-0-55f5fe409c55@amd.com>
 <20261009-adma-pm-fix-and-per-channel-reset-v4-2-55f5fe409c55@amd.com>
In-Reply-To: <20261009-adma-pm-fix-and-per-channel-reset-v4-2-55f5fe409c55@amd.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Mon, 12 Oct 2026 20:44:00 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0iLOJ49Zn_vPbpbqhPQ_F3W5PCpFN1VnxOzoxL7Y4PN+A@mail.gmail.com>
X-Gm-Features: AclHuK_xrLBr4L5nslTfPR7n5tDlLGvjFUHFyA86wwCkbsTjUQQ1gKk2AD2PTHM
Message-ID: <CAJZ5v0iLOJ49Zn_vPbpbqhPQ_F3W5PCpFN1VnxOzoxL7Y4PN+A@mail.gmail.com>
Subject: Re: [PATCH v4 2/6] PM: runtime: Add pm_runtime_if_active guard and
 conditional variant
To: Golla Nagendra <nagendra.golla@amd.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Michal Simek <michal.simek@amd.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Kedareswara rao Appana <appana.durga.rao@xilinx.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Tretter <m.tretter@pengutronix.de>, Harini Katakam <harini.katakam@amd.com>, 
	Shyam Pandey <radhey.shyam.pandey@amd.com>, dmaengine@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, git@amd.com
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

On Fri, Oct 9, 2026 at 6:00=E2=80=AFAM Golla Nagendra <nagendra.golla@amd.c=
om> wrote:
>
> Add a pm_runtime_if_active base guard and its _try conditional variant
> to pm_runtime.h for drivers that need to conditionally acquire a runtime
> PM reference only when the device is already active.
>
> The base guard must not be used directly via guard()/scoped_guard()
> because pm_runtime_get_if_active() only acquires a reference when it
> returns 1; the destructor unconditionally calls pm_runtime_put(), which
> would underflow usage_count on a suspended device. The base guard
> exists solely to back the DEFINE_GUARD_COND _try variant.
>
> The _try variant (used via PM_RUNTIME_ACQUIRE_IF_ACTIVE) satisfies the
> _try API contract that guards must not produce an error when runtime PM
> is disabled for the device. When pm_runtime_get_if_active() returns
> -EINVAL (runtime PM disabled), the expression calls
> pm_runtime_get_noresume() to pre-balance the destructor's unconditional
> pm_runtime_put(), then returns 1 so the guard condition succeeds
> (bypass). This mirrors the behaviour of pm_runtime_active_try which
> uses RPM_TRANSPARENT for the same purpose. When the device is genuinely
> runtime-suspended (return value 0), the guard condition fails and
> ACQUIRE_ERR returns true, allowing callers such as interrupt handlers to
> skip MMIO accesses.
>
> Signed-off-by: Golla Nagendra <nagendra.golla@amd.com>
> ---
>  include/linux/pm_runtime.h | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>
> diff --git a/include/linux/pm_runtime.h b/include/linux/pm_runtime.h
> index 64921b10ac74..ae2a8740ffb3 100644
> --- a/include/linux/pm_runtime.h
> +++ b/include/linux/pm_runtime.h
> @@ -609,6 +609,13 @@ DEFINE_GUARD(pm_runtime_active, struct device *,
>              pm_runtime_get_sync(_T), pm_runtime_put(_T));
>  DEFINE_GUARD(pm_runtime_active_auto, struct device *,
>              pm_runtime_get_sync(_T), pm_runtime_put_autosuspend(_T));
> +/*
> + * Do not use directly -- the destructor calls pm_runtime_put()
> + * unconditionally, which underflows if no reference was acquired.
> + * Use only via the _try variant below.
> + */
> +DEFINE_GUARD(pm_runtime_if_active, struct device *,
> +            pm_runtime_get_if_active(_T), pm_runtime_put(_T));
>  /*
>   * Use the following guards with ACQUIRE()/ACQUIRE_ERR().
>   *
> @@ -624,6 +631,23 @@ DEFINE_GUARD_COND(pm_runtime_active_auto, _try,
>                   pm_runtime_get_active(_T, RPM_TRANSPARENT), _RET =3D=3D=
 0)
>  DEFINE_GUARD_COND(pm_runtime_active_auto, _try_enabled,
>                   pm_runtime_resume_and_get(_T), _RET =3D=3D 0)
> +/*
> + * The _try contract is that no error is produced when runtime PM is dis=
abled,
> + * so bypass the guard when pm_runtime_get_if_active() returns -EINVAL: =
take a
> + * reference with pm_runtime_get_noresume() to pre-balance the destructo=
r's
> + * pm_runtime_put() and return 1 so the guard condition succeeds. Interr=
upt
> + * handlers then keep servicing interrupts when runtime PM is disabled f=
or the
> + * device or CONFIG_PM is not enabled.
> + */
> +DEFINE_GUARD_COND(pm_runtime_if_active, _try,
> +                 ({
> +                       int _r =3D pm_runtime_get_if_active(_T);
> +
> +                       if (_r =3D=3D -EINVAL)
> +                               pm_runtime_get_noresume(_T);
> +                       _r =3D=3D -EINVAL ? 1 : (_r ?: -EAGAIN);
> +                 }),
> +                 _RET =3D=3D 1)
>
>  /* ACQUIRE() wrapper macros for the guards defined above. */
>
> @@ -639,6 +663,9 @@ DEFINE_GUARD_COND(pm_runtime_active_auto, _try_enable=
d,
>  #define PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(_dev, _var)  \
>         ACQUIRE(pm_runtime_active_auto_try_enabled, _var)(_dev)
>
> +#define PM_RUNTIME_ACQUIRE_IF_ACTIVE(_dev, _var)       \
> +       ACQUIRE(pm_runtime_if_active_try, _var)(_dev)
> +
>  /*
>   * ACQUIRE_ERR() wrapper macro for guard pm_runtime_active.
>   *
>
> --

For the record, I'm still unconvinced about the guard definitions above.

Please try to reimplement the series without them for the time being.

Thanks!

