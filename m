Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74F17C35FF2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 14:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LJsBCZAbkaqGsMqWjDYIUsmWMaDSGMkISy1d3AfV0dM=; b=JFGm7SM2VWkNyGIULc8lqavVRT
	hzER7z4MT0zsPmS6Uh2zYL5tIC4Qv3ck1JzZxC4zXiVwtZg+7CJa/c39Lx1IFNTc+QA+J/VmUo61T
	ElQQKHpdzMPzLM8VZWSGzzZJbXSideuPxNuQRX/YB1BVR/DuTmecK5nLBYwDTZpN/weYmTnKYy62M
	jlaxZgx3HaREdFdjwFZhphq3IkeftK8jnqYugu3pnvqU2S1V3dIBd0E8p0vyQQtK+7V8oEaUAITXu
	JC6nb1O4MxwKFU0w0/NIbR7NC1hqLsUBQNDjQ2HuFQzrq75SU1r/F/8tBs+U25e09Nko9O7L6jJQk
	XmOksavQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1treNu-00000002yDn-0IHv;
	Mon, 10 Mar 2025 14:45:38 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trcm0-00000002iim-16hS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 13:02:25 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3914bc3e01aso452454f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Mar 2025 06:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741611742; x=1742216542; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LJsBCZAbkaqGsMqWjDYIUsmWMaDSGMkISy1d3AfV0dM=;
        b=eKcHrwFFpyd/13NGMT5efKgs5QdIpGLAiPusSgWOuBCXOnb/Bkrc3IDzfc3FrInJ6C
         ezsFgSlGH9eVpk3v0xiwxT0mJc8DeUh3NHib8BFosNJAY+VtaKrC0OKphIh+fxWBX8hD
         KdRs/Zkc89W4MRYLSRLqHnVsjfZybpu8zFxfFIxFXvk+PcppOYCjXOR5bHS6PE5L789Q
         j+6JIoRZV4xSUcjrpWBy/f/AckStIMTK77umKy2CCBDW6kt+QO4bUQ3fEjBHjDyEwE3+
         5S4LRAznYRnhKTl35fQr5aPOlH/GojwLnksAMdnGwipU70J9k1bAtb0tYF02pMmqk9Rx
         4cgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741611742; x=1742216542;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LJsBCZAbkaqGsMqWjDYIUsmWMaDSGMkISy1d3AfV0dM=;
        b=WqMhuukag+xiaOHV8NztE/maJPs8NTvzmdKLu3gPonYp295Wdkqw7k8dVJzTqLENOZ
         8WitGoGWk2mSWAZd2IazFWJSYH+H07r3CQAh/ozWzX+j0/5ZrCIwjhywgfTthO6fvXjP
         wi7VEZZKv4FnL9QWXpB/GiA2PXbvUJ+nHWpUZgoFAJfPybz5oZRH5rqJ6Zt1PEKclBZ/
         EdjBxJRz971BArhva/FR8FzFGbPBBbL3e80J3KD8kh9abw0UvZ2ki4KP961lA5rpLc5J
         gQj0n1l+PHrK70BSGEF8zB1Dy2TGEVpHY8jn73AMVM0nBLAGgu2XQG5TSX+HH6+wFnU3
         ytTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUE6pI9NGWoVxkJ4TAHZRdultDIxXVZ4IVR4g0c8p2PbC6vk1SEO7RGvRUWUbqXsYXQRIbGwdc3TFfS1RKHyIO7@lists.infradead.org
X-Gm-Message-State: AOJu0Ywvckml1K/xCNJtaVSYzE+qXZ5j1JKRP1N0w49xHowWxwX8l0cG
	XSIPuC1JNC6X4EDsfPaIkzPRlJpCwkVTVvje+q+oIC5od/N6Cx5NfFm1B+zkIMUZNomWcFQfk2s
	CR+9N4p5d63PqIAuyBXdNLW6WkCk=
X-Gm-Gg: ASbGnctSDX+78oru62mYXpQi0I/lGNSRs9eKK4a7LYDV1VieoNVDvFwg5Ea90OciyyA
	zQFszGU5XjW8RHMkSQ0X2gipp2InxmHplLvp+76VW9+qXcPgemryfeoaD65idq4BL0VxReiWbTa
	w4Gxr7FqtwrLyP3RiPx2w993htgyFHGIl0VcI8tu9xi8xo
X-Google-Smtp-Source: AGHT+IGaxbWiEzsbhn8u7OT4l7aLcqESH5XxF4YWsiFb1XdbKvnztHuQze3R8m7aqPgVjjpK0+JYaE4xvj1QZAkWR9c=
X-Received: by 2002:a05:6000:1f8f:b0:391:304f:34e7 with SMTP id
 ffacd0b85a97d-39132d985f6mr9687116f8f.44.1741611742101; Mon, 10 Mar 2025
 06:02:22 -0700 (PDT)
MIME-Version: 1.0
References: <1740611284-27506-1-git-send-email-nunodasneves@linux.microsoft.com>
 <1740611284-27506-8-git-send-email-nunodasneves@linux.microsoft.com>
In-Reply-To: <1740611284-27506-8-git-send-email-nunodasneves@linux.microsoft.com>
From: Tianyu Lan <ltykernel@gmail.com>
Date: Mon, 10 Mar 2025 21:01:45 +0800
X-Gm-Features: AQ5f1Jq0GptIRLQ74YOF7jUY6vVGVBckkuZztDE6uDxvc_UbKBeBzzaPI8HiFPA
Message-ID: <CAMvTesAW-9Mo0oY6UUh2anp6DQCSsVCUhBiV2-bKp2VD_N0DYw@mail.gmail.com>
Subject: Re: [PATCH v5 07/10] Drivers: hv: Introduce per-cpu event ring tail
To: Nuno Das Neves <nunodasneves@linux.microsoft.com>
Cc: linux-hyperv@vger.kernel.org, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-acpi@vger.kernel.org, kys@microsoft.com, 
	haiyangz@microsoft.com, wei.liu@kernel.org, mhklinux@outlook.com, 
	decui@microsoft.com, catalin.marinas@arm.com, will@kernel.org, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, hpa@zytor.com, daniel.lezcano@linaro.org, 
	joro@8bytes.org, robin.murphy@arm.com, arnd@arndb.de, 
	jinankjain@linux.microsoft.com, muminulrussell@gmail.com, 
	skinsburskii@linux.microsoft.com, mrathor@linux.microsoft.com, 
	ssengar@linux.microsoft.com, apais@linux.microsoft.com, 
	Tianyu.Lan@microsoft.com, stanislav.kinsburskiy@gmail.com, 
	gregkh@linuxfoundation.org, vkuznets@redhat.com, prapal@linux.microsoft.com, 
	muislam@microsoft.com, anrayabh@linux.microsoft.com, rafael@kernel.org, 
	lenb@kernel.org, corbet@lwn.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_060224_304145_5D4CFDB5 
X-CRM114-Status: GOOD (  27.68  )
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

On Thu, Feb 27, 2025 at 7:09=E2=80=AFAM Nuno Das Neves
<nunodasneves@linux.microsoft.com> wrote:
>
> Add a pointer hv_synic_eventring_tail to track the tail pointer for the
> SynIC event ring buffer for each SINT.
>
> This will be used by the mshv driver, but must be tracked independently
> since the driver module could be removed and re-inserted.
>
> Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
> Reviewed-by: Wei Liu <wei.liu@kernel.org>

It's better to expose a function to check the tail instead of exposing
hv_synic_eventring_tail directly.

BTW, how does mshv driver use hv_synic_eventring_tail? Which patch
uses it in this series?

Thanks.


> ---
>  drivers/hv/hv_common.c | 34 ++++++++++++++++++++++++++++++++--
>  1 file changed, 32 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/hv/hv_common.c b/drivers/hv/hv_common.c
> index 252fd66ad4db..2763cb6d3678 100644
> --- a/drivers/hv/hv_common.c
> +++ b/drivers/hv/hv_common.c
> @@ -68,6 +68,16 @@ static void hv_kmsg_dump_unregister(void);
>
>  static struct ctl_table_header *hv_ctl_table_hdr;
>
> +/*
> + * Per-cpu array holding the tail pointer for the SynIC event ring buffe=
r
> + * for each SINT.
> + *
> + * We cannot maintain this in mshv driver because the tail pointer shoul=
d
> + * persist even if the mshv driver is unloaded.
> + */
> +u8 __percpu **hv_synic_eventring_tail;
> +EXPORT_SYMBOL_GPL(hv_synic_eventring_tail);
> +
>  /*
>   * Hyper-V specific initialization and shutdown code that is
>   * common across all architectures.  Called from architecture
> @@ -90,6 +100,9 @@ void __init hv_common_free(void)
>
>         free_percpu(hyperv_pcpu_input_arg);
>         hyperv_pcpu_input_arg =3D NULL;
> +
> +       free_percpu(hv_synic_eventring_tail);
> +       hv_synic_eventring_tail =3D NULL;
>  }
>
>  /*
> @@ -372,6 +385,11 @@ int __init hv_common_init(void)
>                 BUG_ON(!hyperv_pcpu_output_arg);
>         }
>
> +       if (hv_root_partition()) {
> +               hv_synic_eventring_tail =3D alloc_percpu(u8 *);
> +               BUG_ON(hv_synic_eventring_tail =3D=3D NULL);
> +       }
> +
>         hv_vp_index =3D kmalloc_array(nr_cpu_ids, sizeof(*hv_vp_index),
>                                     GFP_KERNEL);
>         if (!hv_vp_index) {
> @@ -460,6 +478,7 @@ void __init ms_hyperv_late_init(void)
>  int hv_common_cpu_init(unsigned int cpu)
>  {
>         void **inputarg, **outputarg;
> +       u8 **synic_eventring_tail;
>         u64 msr_vp_index;
>         gfp_t flags;
>         const int pgcount =3D hv_output_page_exists() ? 2 : 1;
> @@ -472,8 +491,8 @@ int hv_common_cpu_init(unsigned int cpu)
>         inputarg =3D (void **)this_cpu_ptr(hyperv_pcpu_input_arg);
>
>         /*
> -        * hyperv_pcpu_input_arg and hyperv_pcpu_output_arg memory is alr=
eady
> -        * allocated if this CPU was previously online and then taken off=
line
> +        * The per-cpu memory is already allocated if this CPU was previo=
usly
> +        * online and then taken offline
>          */
>         if (!*inputarg) {
>                 mem =3D kmalloc(pgcount * HV_HYP_PAGE_SIZE, flags);
> @@ -485,6 +504,17 @@ int hv_common_cpu_init(unsigned int cpu)
>                         *outputarg =3D (char *)mem + HV_HYP_PAGE_SIZE;
>                 }
>
> +               if (hv_root_partition()) {
> +                       synic_eventring_tail =3D (u8 **)this_cpu_ptr(hv_s=
ynic_eventring_tail);
> +                       *synic_eventring_tail =3D kcalloc(HV_SYNIC_SINT_C=
OUNT,
> +                                                       sizeof(u8), flags=
);
> +
> +                       if (unlikely(!*synic_eventring_tail)) {
> +                               kfree(mem);
> +                               return -ENOMEM;
> +                       }
> +               }
> +
>                 if (!ms_hyperv.paravisor_present &&
>                     (hv_isolation_type_snp() || hv_isolation_type_tdx()))=
 {
>                         ret =3D set_memory_decrypted((unsigned long)mem, =
pgcount);
> --
> 2.34.1
>
>


--=20
Thanks
Tianyu Lan

