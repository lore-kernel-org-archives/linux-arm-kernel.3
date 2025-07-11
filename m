Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9761AC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 17:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KVqtR2y37+fGKASYTrCFwyYcRTeea2/g0YbtiZzMR3k=; b=VO7exXFngIuRDzv8CfB78z7O4S
	unRHCKsRNoOCaKgTFjah1Qv1tb9w1EEXNxcnBBaFQoX0zAjGLJKZjSyJM4KxQuMDWl3WSyVIE/TqF
	ExATUdn3q61jWjqtJTSDDYL6p86yHIuqba6it6WFGAqllgllLs6H/C+jTqcgnbVfJftsu9ha96YOn
	kPs7xDS9CE3yeC/+572AO6mOBNYl5+3U8enK7911NX9NlRGOCHg+/DA+GI04iXN6grawHJbIEYrbR
	onthasQJZYKH03KyKDw+sUHj9GonWKryRLhslRYsB3Fwo+rCk+row+rcJVEAFb1HtVdJVJjs31reT
	dZ/mIJag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaHOl-0000000FNsP-1HNV;
	Fri, 11 Jul 2025 17:18:59 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaGsr-0000000FKQU-1GUY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 16:46:02 +0000
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-e740a09eae0so2341538276.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 09:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1752252360; x=1752857160; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KVqtR2y37+fGKASYTrCFwyYcRTeea2/g0YbtiZzMR3k=;
        b=BcECeeox9Jh5YwObZThyGJVThzVgbmesPS16A4xQ3t3h93xW01CgsEIcNh8ugBpWH/
         FPYZ/x6CoYaP+1GtKi6xNttzH0OJ86YzAfNp6lcDiI2lxRtHfYU/Iye5s+lQfcW2fbqo
         Lkndcp0HGSVoA1FBuG4HWSj1ZEYi8Jd2bMh3iUjg+4wdujnpYLEgKhgetNoDYO2YJAse
         DlMX0V6rKPSbzj4IGZPoYcggffu82A7gW1j0kSAYJLbJZpeJHh9nZqUpUwF9+9K4REgy
         SBmy8eVNCSlw0dHCkPoN0ap0ubUxmcxAEykoB/sh6BTLplP6gMbIX8clYWtx50V9XRkz
         sKfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752252360; x=1752857160;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KVqtR2y37+fGKASYTrCFwyYcRTeea2/g0YbtiZzMR3k=;
        b=e7Fe3YhGNY+4x0F07cnq5o8P5dTbuiKYcsNbUiPHaIrW32R1LGcLG0pllUFM6gu8YR
         cQ4BuQG1SZJc8XgWnmU05yQBxJXLNw2JuN4A3z47ijngqBEcRreT4Lniv9UQ8MKu8qhf
         yVSEdEj4CD0R17dUqyLzIwrtaMLjwwy8UaDUACprvBQiTAGv62rctSYlilr0e+CwUoCr
         V9l2dhW284fz8J4MWYHKG2yBdeuvWmy3XKrM2QraDI3QriAZw91m5Fp/qCTxCnVl3JQ8
         bBBgTZYBIffhjTgw4ykDvphZzuA2UG+bcUTgHRz5Q0PzTm7GokN4sDkAEM6p6Kch0HNi
         j4cQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrSFyvxIJgNvIN7d1NUWTlJeyN4MOubELMzOuTvqRoZ4SRh6BpcOrAQzunE+IaFBCyJ84lrkwIyUThRVs3Otdu@lists.infradead.org
X-Gm-Message-State: AOJu0YxhpdHz/DrhQc8AwSkEn+1Vd7QEpsphO6wss8JD85ol/IvPlsG0
	dSAMF2g+fvri3o2ZKNvgZgzR1EXuTAPLUog0At9v0vg8slSK+xmdlSstoOrEn6mjqIdGVlcX4DT
	UajiveoKbwQ==
X-Gm-Gg: ASbGnct3lzVAJGiMswZ1uF3HODeR6D+oBCWI8UTkM88rD+9zK+NbzXve/2GdVLU5yDy
	nI3T1DCbMb/Th72ecC+ijRq41/XHc8CbpCH3e9mKcb/FoxUabg8qrhEeGQgz5xTEi2d8AEH948L
	sqg3weDFx89FUGWXETJlWkGcPWZSgzLFbaHtsEqiYzUoI4AH2R4oO3r73umP4ypcJLvGE6FENwW
	GEeO59FDTjvIwADA0dklO3eCdQPO/77iHQMTQoaJhna67BXn2D8mGxfffdeLGMLeXgPW7aZ1LaM
	YLDWjtOc4ws23uTrhndxMMX/C+ufaG0/GBf6V0qyvwzhEmTJjFESdhPX0jSynCYnaIA9pia3mX3
	Jox/MFgeLWCCQHLH2ZGIrgnrzA15Fc62jWH2DIc5SXuK0I2hieAMFu+57L2ZrDOBuLpDCgwsgO3
	2V
X-Google-Smtp-Source: AGHT+IGtVS9SdGaNkm12NB6sgpUZkmcGlzbATSLa3Xe3qzCmWhoozVo6W1zjM9hTj8Gto2Is1sv7rg==
X-Received: by 2002:a05:690c:4b92:b0:70e:185b:356d with SMTP id 00721157ae682-717d5d7bb05mr67681657b3.14.1752252360357;
        Fri, 11 Jul 2025 09:46:00 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-717c61b4b7dsm8196597b3.58.2025.07.11.09.45.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jul 2025 09:45:59 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e740a09eae0so2341503276.1;
        Fri, 11 Jul 2025 09:45:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXH5R7bZid+t8AL+rv3ag5lstJf69ESeEcic51U0m6CgVxswSXL7vXyef/jPrMnRg3RvthrYuM7a2+8/r9P3S8=@lists.infradead.org, AJvYcCXS9fzB/In5TCGKuS+zZmpyw2lLLE/8kpJdhjNR8e8IJNAqzk1dc9V+y0oyWebGrn5pkpvtvaErcsqSmFBCFlaq@lists.infradead.org
X-Received: by 2002:a05:690c:fc9:b0:711:406f:7735 with SMTP id
 00721157ae682-717d5d7b900mr75779167b3.13.1752252358549; Fri, 11 Jul 2025
 09:45:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250606-6-10-rocket-v7-0-dc16cfe6fe4e@tomeuvizoso.net>
 <20250606-6-10-rocket-v7-4-dc16cfe6fe4e@tomeuvizoso.net> <fcb3ca23-7ebd-4f48-92d2-969b24936b9b@arm.com>
 <CAAObsKBiSX0HcxJJjTNGgE4FD4eAYW5wvY=bROtdkZ1mqf_0VQ@mail.gmail.com> <a1a93c41-4c21-4b7a-a8b8-5d4e83d73931@arm.com>
In-Reply-To: <a1a93c41-4c21-4b7a-a8b8-5d4e83d73931@arm.com>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Fri, 11 Jul 2025 18:45:46 +0200
X-Gmail-Original-Message-ID: <CAAObsKAgmDANvWop-GRAqE6eFRHeQiVHkF1nSwEqyWWY=mdRfg@mail.gmail.com>
X-Gm-Features: Ac12FXx7z145GnPjkDCiCeIztHHyJGSgIFJExInPlpkFTI1qLEtbnsvv5usQDuA
Message-ID: <CAAObsKAgmDANvWop-GRAqE6eFRHeQiVHkF1nSwEqyWWY=mdRfg@mail.gmail.com>
Subject: Re: [PATCH v7 04/10] accel/rocket: Add job submission IOCTL
To: Robin Murphy <robin.murphy@arm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Oded Gabbay <ogabbay@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Kever Yang <kever.yang@rock-chips.com>, 
	Daniel Stone <daniel@fooishbar.org>, Da Xue <da@libre.computer>, 
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-doc@vger.kernel.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_094601_340273_FB0EB00D 
X-CRM114-Status: GOOD (  23.02  )
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

On Fri, Jul 11, 2025 at 6:40=E2=80=AFPM Robin Murphy <robin.murphy@arm.com>=
 wrote:
>
> On 11/07/2025 5:00 pm, Tomeu Vizoso wrote:
> > On Tue, Jun 24, 2025 at 3:50=E2=80=AFPM Robin Murphy <robin.murphy@arm.=
com> wrote:
> >>
> >> On 2025-06-06 7:28 am, Tomeu Vizoso wrote:
> >> [...]
> >>> diff --git a/drivers/accel/rocket/rocket_device.h b/drivers/accel/roc=
ket/rocket_device.h
> >>> index 10acfe8534f00a7985d40a93f4b2f7f69d43caee..50e46f0516bd1615b5f82=
6c5002a6c0ecbf9aed4 100644
> >>> --- a/drivers/accel/rocket/rocket_device.h
> >>> +++ b/drivers/accel/rocket/rocket_device.h
> >>> @@ -13,6 +13,8 @@
> >>>    struct rocket_device {
> >>>        struct drm_device ddev;
> >>>
> >>> +     struct mutex sched_lock;
> >>> +
> >>>        struct mutex iommu_lock;
> >>
> >> Just realised I missed this in the last patch, but iommu_lock appears =
to
> >> be completely unnecessary now.
> >>
> >>>        struct rocket_core *cores;
> >> [...]
> >>> +static void rocket_job_hw_submit(struct rocket_core *core, struct ro=
cket_job *job)
> >>> +{
> >>> +     struct rocket_task *task;
> >>> +     bool task_pp_en =3D 1;
> >>> +     bool task_count =3D 1;
> >>> +
> >>> +     /* GO ! */
> >>> +
> >>> +     /* Don't queue the job if a reset is in progress */
> >>> +     if (atomic_read(&core->reset.pending))
> >>> +             return;
> >>> +
> >>> +     task =3D &job->tasks[job->next_task_idx];
> >>> +     job->next_task_idx++;
> >>> +
> >>> +     rocket_pc_writel(core, BASE_ADDRESS, 0x1);
> >>> +
> >>> +     rocket_cna_writel(core, S_POINTER, 0xe + 0x10000000 * core->ind=
ex);
> >>> +     rocket_core_writel(core, S_POINTER, 0xe + 0x10000000 * core->in=
dex);
> >>
> >> Those really look like bitfield operations rather than actual arithmet=
ic
> >> to me.
> >>
> >>> +
> >>> +     rocket_pc_writel(core, BASE_ADDRESS, task->regcmd);
> >>
> >> I don't see how regcmd is created (I guess that's in userspace?), but
> >> given that it's explicitly u64 all the way through - and especially
> >> since you claim to support 40-bit DMA addresses - it definitely seems
> >> suspicious that the upper 32 bits never seem to be consumed anywhere :=
/
> >
> > Yeah, but there's no other register for BASE_ADDRESS address in the TRM=
.
>
> That only reaffirms the question then - if this value is only ever
> written verbatim to a 32-bit register, why is it 64-bit?

Ah, sure, it will be 32-bit in v8.

Thanks,

Tomeu

> Thanks,
> Robin.

