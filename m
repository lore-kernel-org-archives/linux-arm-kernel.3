Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62B23CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 22:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XwbGv4J28a1dG4lLmSXG6e+W+t/2iTnwMsiuMvjryc0=; b=StCfWRBsy2kTLUCSXtC807QleH
	BexeUUwVe+vAlsxGEftO4TIvaFELlyq2Yv585Nn/uKDytJnOXFZ8TMnp+gUK0IgqlX0xZUoEgsHfR
	57VB9JYHvj9UMrTFsulGa/ViAAqMW3M4knj5TAASh+FVMtQdQ5vqPi8ZsfjtfwzQq5rE0kxu8W196
	mxJHaHJspY42T2HAgYK5KTCoEeGoXZFDSXn96IlmDzLougWPZdWkcLFSkDqeKo0wv6qJDh/mHLmIj
	BFkO23uc3Uf25me8ITp81uybIeZADIsHz/dpSCmBjwQ0/R8QRZ5hqLm6iFHUf1F+heieMDDiGKpY6
	0ahPWaBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8REG-0000000Ej82-1Ker;
	Mon, 13 Oct 2025 22:41:20 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8RED-0000000Ej7U-2G1A
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 22:41:18 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-7bc626c5467so3711774a34.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 15:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760395276; x=1761000076; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XwbGv4J28a1dG4lLmSXG6e+W+t/2iTnwMsiuMvjryc0=;
        b=hxfZIdfJZRlU0e+WOr/blMgfqYJhKmkCYeVcYBiQRJ3IBiDy7GGx699aQ72H8+D43o
         8PRrN76Bz7TfY6ELIMstN/zhU5S/gD2h11CLG8FleyeML5b1ipJmVG3pjuvPGFRHTeJD
         o6/bBsjPKJvKkVAUsosk46DRcAcDMvxCpDzqs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760395276; x=1761000076;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XwbGv4J28a1dG4lLmSXG6e+W+t/2iTnwMsiuMvjryc0=;
        b=n3JrpfFlbrdhFXY4ZQnxKrgTkTdw5dplWQ/KPuQ424C1nxOxDbw8HJ56iEnUmOV2ec
         1STv2p1KH2b7MLi04EdBVj09rP9xqH1nB3hl4BOrSExSHB7iFPrllBl1KWKZHZbbF/G/
         JzomU3Oys8j+O0DPjs1sNJvLdVAW0h0zmp10i1ZC2OevAPG5jRPAkHDZFQjsdrURC03M
         8+ziKDr/03KI2m8PI8OarqkkeE1yAazN9Ss3xBdPeYYNd3wutG+8+wj3+Yo/wl2a8np9
         F0AdSLQOu2/rFMEu7Nt44TB/iCcz1c9oU8+nIlgNxyqm7ekATikA5UeHMelledgvE9o1
         QD4g==
X-Forwarded-Encrypted: i=1; AJvYcCWecKdfANR5wMm/Jmb0m5XWkFyucYMIEp/4a4hIyiSwU1kgxXyGq1qozdD2EjK+yEmZz1fY2XOuATauLYUwJe5T@lists.infradead.org
X-Gm-Message-State: AOJu0YxXSYMCreMwBV69kTCVBjSlw485FwoUcR4UlEM4rwQxwsgGN0SA
	sDHYDcqVc32EIK2QMmbHvk6ls2jpGLU7sMXIREgIRiPKd8ujmSKFvjuQ7GbbyOmQqllaHcbBTO1
	Nz0A=
X-Gm-Gg: ASbGncttIZ7udarHa7tttZMlP57Fi1EUVOzVuO9Sn7+jb0NKuWwEuhK7B2nauAjsZB9
	uPP0EEJVuTbiwjuPQt5+6ZbkWdVIaeIg8LkUuyQ4DrIm4MngDNaoXnuqjHF5EAUkw0wWZYbggVU
	VqKXRXCg4V5CpKlvoCXtct+d8NsikMShuXizDrNEsfdJx8/0jx+tOLZ8jIqa2Ku90XBqGtaHH5O
	ADij+YuQvrlZxeAOQdJHs9c18xqKlj5+/javfNTN5S1ltK7upWX5f03u2obqY7eW7gG545ZOITo
	kMw0VwIVvW+VOGs85msSSWN3G9uW94v2ekPd95zFWczhMX/QPwprxmM0IviWYRywt12gLk0RIvS
	FR04hYNhYVfPXYsV0qnErVt9JFQhSkzb9IHkXNzEyy1WkQAWXktz/V2ZBOWRPpkKlLymPUFppdk
	umV2QjelGwGcz4q0U=
X-Google-Smtp-Source: AGHT+IHX/kTQ/W3aETKKADee5oFTsC1USGTVLdeI4aVYGQH0LiJhnkRmA/zC3RDF98WTINAD+rgCOg==
X-Received: by 2002:a05:6830:67d4:b0:7b1:6b51:c40c with SMTP id 46e09a7af769-7c0df6c11d1mr12451818a34.1.1760395276040;
        Mon, 13 Oct 2025 15:41:16 -0700 (PDT)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com. [209.85.161.51])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7c0f915efddsm3860835a34.34.2025.10.13.15.41.14
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 15:41:15 -0700 (PDT)
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6500448067dso2584217eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 15:41:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW0e8My+8SQe3jAJi+DtoRI1JoEQBhRlkaUdzwcdFqeYRvwtoudEmiRVLg/3awncLUEh/RnDi5mOY1FXy9nbwb9@lists.infradead.org
X-Received: by 2002:a17:903:11cf:b0:269:63ea:6d4e with SMTP id
 d9443c01a7336-290272c1aa5mr269142435ad.37.1760394855700; Mon, 13 Oct 2025
 15:34:15 -0700 (PDT)
MIME-Version: 1.0
References: <20251009032838.63060-1-cuiyunhui@bytedance.com> <20251009032838.63060-2-cuiyunhui@bytedance.com>
In-Reply-To: <20251009032838.63060-2-cuiyunhui@bytedance.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 13 Oct 2025 15:34:03 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VcgDFk-Ad8nhOYK8Ay_8==3JRxaZ=8j3SHCa2rTKJCTA@mail.gmail.com>
X-Gm-Features: AS18NWDRlpKOc8vUNSnX7EzUSo2l7O6rFyMCga60WeZRtc9k0KplotG4eFs760Y
Message-ID: <CAD=FV=VcgDFk-Ad8nhOYK8Ay_8==3JRxaZ=8j3SHCa2rTKJCTA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] watchdog: move arm64 watchdog_hld into common code
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: akpm@linux-foundation.org, alex@ghiti.fr, anup@brainfault.org, 
	aou@eecs.berkeley.edu, atish.patra@linux.dev, catalin.marinas@arm.com, 
	johannes@sipsolutions.net, lihuafei1@huawei.com, mark.rutland@arm.com, 
	masahiroy@kernel.org, maz@kernel.org, mingo@kernel.org, 
	nicolas.schier@linux.dev, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	suzuki.poulose@arm.com, thorsten.blum@linux.dev, wangjinchao600@gmail.com, 
	will@kernel.org, yangyicong@hisilicon.com, zhanjie9@hisilicon.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_154117_574845_9AB051C7 
X-CRM114-Status: GOOD (  17.52  )
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

Hi,

On Wed, Oct 8, 2025 at 8:29=E2=80=AFPM Yunhui Cui <cuiyunhui@bytedance.com>=
 wrote:
>
> Move the contents of arch/arm64/watchdog_hld.c to kernel/watchdog_perf.c
> to create a generic implementation that can be reused by other arch,
> such as RISC-V.
>
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> ---
>  arch/arm64/Kconfig               |  2 +
>  arch/arm64/kernel/Makefile       |  1 -
>  arch/arm64/kernel/watchdog_hld.c | 94 --------------------------------
>  drivers/perf/arm_pmu.c           | 10 +++-
>  include/linux/perf/arm_pmu.h     |  2 -
>  kernel/watchdog_perf.c           | 83 ++++++++++++++++++++++++++++
>  lib/Kconfig.debug                |  8 +++
>  7 files changed, 102 insertions(+), 98 deletions(-)
>  delete mode 100644 arch/arm64/kernel/watchdog_hld.c
>
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index b5438ff4772ce..4759e4969c4a6 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -231,6 +231,8 @@ config ARM64
>         select HAVE_GCC_PLUGINS
>         select HAVE_HARDLOCKUP_DETECTOR_PERF if PERF_EVENTS && \
>                 HW_PERF_EVENTS && HAVE_PERF_EVENTS_NMI
> +       select WATCHDOG_PERF_ADJUST_PERIOD if HARDLOCKUP_DETECTOR_PERF &&=
 \
> +       CPU_FREQ

nit: the line limit is generally accepted to be ~100 characters now.
It would be nice not to wrap. If you really need to wrap, indent like
the wrapping above.

In any case, this seems like a reasonable thing to do to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

