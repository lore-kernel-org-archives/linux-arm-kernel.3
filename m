Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25A9DC83F10
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Jul 2025 08:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/qP7E7/w2KURgqg1WXFB1L+O8r74uCulM1NNekV+pGU=; b=CT0YY0+frqlNGzJpPrV2SLPHeI
	dJ9BFf5bSyh2edcc1/d2P1UQRR1/4f3/fbVQ5tB1WuxjWWAts/8TF0pf054XaJEZzptHD44TtO5v2
	DHEmi35CIMJVwFkkCJaJck4nv8Z1fuj9OdyDUDrKXx1Ht7u1DhbJqNu9DA6NaUVx1/sbMJr3a4pmC
	8PrJqo0hSfSfYTbDIqTtTa2T/yaChSOm3Kq1Bh8jmivXfEHGExPZdjDgwPo4ohpToTmY4RvH/Wed8
	oKdzrxrGrukuCz+8yDZdcPaSXjNPBtuL4zE4hbjuBXpXU1DzlmcUrCsKaNIX+A6Jp+4MFhvsP9atC
	fDg50dlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaVMV-0000000GPKb-2ZZa;
	Sat, 12 Jul 2025 08:13:35 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaVK4-0000000GP4d-1GTM
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Jul 2025 08:11:08 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-e7311e66a8eso2579995276.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 12 Jul 2025 01:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1752307863; x=1752912663; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/qP7E7/w2KURgqg1WXFB1L+O8r74uCulM1NNekV+pGU=;
        b=Mp0iEyocYsrLS2WhDg4IDG6022F/Lm1syCRabghWj1MZPfJqVelTABcgGpPOgNhIxF
         v3jExu4c5qz2pKZw5OjKP3ScLv9GPSv5y+SeK/aYky1O+BcnMn1FwIzZYVYu0fUr6QDk
         Eh8VgbW2UsyzkCiX7yomiAoxsUjfZhgq6/RE0/PGbPLEE/cMmdw3cigMDABMxHy4Bx4S
         T/QT5+4tKMRKiwg4L9mQLz/9ZhgqT7n4m+bKjuJRMDb3yd4TubVQddw7kCSAGXpi1TwQ
         BfG5PKREcU6z+w8/Sdc2GS6axl2jc61CFT/rhaSRelR9Ra6tz/9iQ/IS8J4rtVOklrtn
         idng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752307863; x=1752912663;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/qP7E7/w2KURgqg1WXFB1L+O8r74uCulM1NNekV+pGU=;
        b=gOSW/I2+0uh3QL16ysETuTHQ+MCIiVAbZ0eBhXpKbcjWi0ctnFiCZZ5wj7TSJ4Xk8Q
         59spYqFLuasSuMJsWW/twjnjeFHmtJrnXvz9IHpksd26Ccevko1O6b6umTOrNqcH9zDX
         w6NabZQ8cUNaV5Wt0EU0IErbj1TjVysWE0/gDg1UCffk+vKmfHhA72HaRNZ9lM6Ppion
         g0xLxs6FrMk9y0rOga8L8n5dnJExbKjUZgFOFXATqYgttMKmE6W7hrhdabfCt1c30gl6
         uGAqe7huxlRb3ZKYOmH8RiC806/rSxFAIVHZuOA324GwW7wki/j4WuF2uhL4WRGKFdyw
         uc2g==
X-Forwarded-Encrypted: i=1; AJvYcCWMVekVNgILt+KQt5BqHa/Knde/ppkiQzQteMYFpQVArN2W0tb+tOMrfvQvmmiIQoVQJSyhAWPYN4/yFj7huY/R@lists.infradead.org
X-Gm-Message-State: AOJu0Yze9LLlmFLUuvUu+GwBTNWLJ2Sg8rSeQRO0W8RorAG8lCCDxQ+c
	PPCWOPciBhDq7hEWU8quX/kPtax4qL/DlGrvglSWEYyROE8uI2CjEDH8XGIzTUpCxEZ11tXITlN
	lxxJ8N3OxFA==
X-Gm-Gg: ASbGncuiWOPQcyK8Ew7eazDRKjl31B4QhwsR2Rf5/b8oWJQ6j00BgomIgQtPXJv8ijo
	/+GcXc/cFCQ1blo7nYY8g9RxfWhOKJfPB93XF0gQqdS+bDKQU6Z1ZZRplzFV/aNPG+ZKNoKHgUq
	DAZR9RSp6R4cIpVSXYTKgS9wCK2tZHjd02x0mch4CykT1N4ibbQwLRkEGqH5XRfRLYe2qALyiUq
	xEae+3cPwSk5aJP9lbIF3s4tYSnDzxDkUJMwzDEU/ZqXNToXyEssRkTkz25YOU4RS+bymNwiu4K
	UJUhnwzwBUSz0PeBPNZkp7WF9DeNJpn9c28rEpu/2FIhqgukhPygYGVB6RrQFgSGrGoqgZITP4O
	fO9fuHqRhOAYbz4K2rsLxDZvjIgZ9k98mHQ1eDcibkwXWDJOX/Sy/9IaSw2gBuY35Kg==
X-Google-Smtp-Source: AGHT+IFKfUZ746xmkUHq3A/VJ5zLNUrLznn9NonZiNSdNGBEKiX5ljPyPiKluf/U7UOQJVRxNpRGJA==
X-Received: by 2002:a05:690c:a91:b0:70f:83ef:de07 with SMTP id 00721157ae682-717d7a88265mr97212847b3.33.1752307863015;
        Sat, 12 Jul 2025 01:11:03 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-717c5d4faf8sm10814537b3.16.2025.07.12.01.11.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Jul 2025 01:11:01 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-70e1d8c2dc2so26774907b3.3;
        Sat, 12 Jul 2025 01:11:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVB4QefxI5Mo7P+FZxrnvWLwtJf6XyDMfgAPJgqBsW52IwNZoWBV7YVH519BU6VhW0lIuejGLiKOYTcvUMytBDL@lists.infradead.org, AJvYcCXq5WLwByNg/MkS0vJwLAk890NLlFNf5qPAwuvXARu63+BG+zr2ZyarHf7TD3G4Jnje1/Wx2Z2gMmW7VVwlkFE=@lists.infradead.org
X-Received: by 2002:a05:690c:61c8:b0:708:6a2c:147b with SMTP id
 00721157ae682-717d78af809mr88739357b3.7.1752307860175; Sat, 12 Jul 2025
 01:11:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250606-6-10-rocket-v7-0-dc16cfe6fe4e@tomeuvizoso.net>
 <20250606-6-10-rocket-v7-2-dc16cfe6fe4e@tomeuvizoso.net> <d4178216-8440-4c57-bb06-867e96ca7dae@ti.com>
In-Reply-To: <d4178216-8440-4c57-bb06-867e96ca7dae@ti.com>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Sat, 12 Jul 2025 10:10:49 +0200
X-Gmail-Original-Message-ID: <CAAObsKA2WDx-uFWMazsrNwveG2yd+vjM5a9+naSjyDNj7D6_YQ@mail.gmail.com>
X-Gm-Features: Ac12FXxUgpJL2rCGdEdX-Wk4Vgoof0zAcJjiBb9mvOBF1p290MiowfWqJ2HPB9A
Message-ID: <CAAObsKA2WDx-uFWMazsrNwveG2yd+vjM5a9+naSjyDNj7D6_YQ@mail.gmail.com>
Subject: Re: [PATCH v7 02/10] accel/rocket: Add a new driver for Rockchip's NPU
To: Andrew Davis <afd@ti.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Oded Gabbay <ogabbay@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Kever Yang <kever.yang@rock-chips.com>, 
	Robin Murphy <robin.murphy@arm.com>, Daniel Stone <daniel@fooishbar.org>, Da Xue <da@libre.computer>, 
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-doc@vger.kernel.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250712_011104_606659_DBE9F1A6 
X-CRM114-Status: GOOD (  39.64  )
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

On Fri, Jul 11, 2025 at 7:38=E2=80=AFPM Andrew Davis <afd@ti.com> wrote:
>
> On 6/6/25 1:28 AM, Tomeu Vizoso wrote:
> > This initial version supports the NPU as shipped in the RK3588 SoC and
> > described in the first part of its TRM, in Chapter 36.
> >
> > This NPU contains 3 independent cores that the driver can submit jobs
> > to.
> >
> > This commit adds just hardware initialization and power management.
> >
> > v2:
> > - Split cores and IOMMUs as independent devices (Sebastian Reichel)
> > - Add some documentation (Jeffrey Hugo)
> > - Be more explicit in the Kconfig documentation (Jeffrey Hugo)
> > - Remove resets, as these haven't been found useful so far (Zenghui Yu)
> > - Repack structs (Jeffrey Hugo)
> > - Use DEFINE_DRM_ACCEL_FOPS (Jeffrey Hugo)
> > - Use devm_drm_dev_alloc (Jeffrey Hugo)
> > - Use probe log helper (Jeffrey Hugo)
> > - Introduce UABI header in a later patch (Jeffrey Hugo)
> >
> > v3:
> > - Adapt to a split of the register block in the DT bindings (Nicolas
> >    Frattaroli)
> > - Move registers header to its own commit (Thomas Zimmermann)
> > - Misc. cleanups (Thomas Zimmermann and Jeff Hugo)
> > - Make use of GPL-2.0-only for the copyright notice (Jeff Hugo)
> > - PM improvements (Nicolas Frattaroli)
> >
> > v4:
> > - Use bulk clk API (Krzysztof Kozlowski)
> >
> > v6:
> > - Remove mention to NVDLA, as the hardware is only incidentally related
> >    (Kever Yang)
> > - Use calloc instead of GFP_ZERO (Jeff Hugo)
> > - Explicitly include linux/container_of.h (Jeff Hugo)
> > - pclk and npu clocks are now needed by all cores (Rob Herring)
> >
> > v7:
> > - Assign its own IOMMU domain to each client, for isolation (Daniel
> >    Stone and Robin Murphy)
> >
> > Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> > ---
> >   Documentation/accel/index.rst        |   1 +
> >   Documentation/accel/rocket/index.rst |  19 +++
> >   MAINTAINERS                          |  10 ++
> >   drivers/accel/Kconfig                |   1 +
> >   drivers/accel/Makefile               |   1 +
> >   drivers/accel/rocket/Kconfig         |  25 ++++
> >   drivers/accel/rocket/Makefile        |   8 +
> >   drivers/accel/rocket/rocket_core.c   |  70 +++++++++
> >   drivers/accel/rocket/rocket_core.h   |  45 ++++++
> >   drivers/accel/rocket/rocket_device.c |  25 ++++
> >   drivers/accel/rocket/rocket_device.h |  26 ++++
> >   drivers/accel/rocket/rocket_drv.c    | 279 ++++++++++++++++++++++++++=
+++++++++
> >   drivers/accel/rocket/rocket_drv.h    |  15 ++
> >   13 files changed, 525 insertions(+)
> >
> > diff --git a/Documentation/accel/index.rst b/Documentation/accel/index.=
rst
> > index bc85f26533d88891dde482f91e26c99991b22869..d8fa332d60a890dbb617454=
d2a26d9b6f9b196aa 100644
> > --- a/Documentation/accel/index.rst
> > +++ b/Documentation/accel/index.rst
> > @@ -10,6 +10,7 @@ Compute Accelerators
> >      introduction
> >      amdxdna/index
> >      qaic/index
> > +   rocket/index
> >
> >   .. only::  subproject and html
> >
> > diff --git a/Documentation/accel/rocket/index.rst b/Documentation/accel=
/rocket/index.rst
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..300eb3aeab1d8c6514c65af=
4d216b2d5a1669131
> > --- /dev/null
> > +++ b/Documentation/accel/rocket/index.rst
> > @@ -0,0 +1,19 @@
> > +.. SPDX-License-Identifier: GPL-2.0-only
> > +
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > + accel/rocket Rockchip NPU driver
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +The accel/rocket driver supports the Neural Processing Units (NPUs) in=
side some
> > +Rockchip SoCs such as the RK3588. Rockchip calls it RKNN and sometimes=
 RKNPU.
> > +
> > +The hardware is described in chapter 36 in the RK3588 TRM.
> > +
> > +This driver just powers the hardware on and off, allocates and maps bu=
ffers to
> > +the device and submits jobs to the frontend unit. Everything else is d=
one in
> > +userspace, as a Gallium driver (also called rocket) that is part of th=
e Mesa3D
> > +project.
> > +
> > +Hardware currently supported:
> > +
> > +* RK3588
> > \ No newline at end of file
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 96b82704950184bd71623ff41fc4df31e4c7fe87..2d8833bf1f2db06ca624d70=
3f19066adab2f9fde 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -7263,6 +7263,16 @@ T:     git https://gitlab.freedesktop.org/drm/mi=
sc/kernel.git
> >   F:  drivers/accel/ivpu/
> >   F:  include/uapi/drm/ivpu_accel.h
> >
> > +DRM ACCEL DRIVER FOR ROCKCHIP NPU
> > +M:   Tomeu Vizoso <tomeu@tomeuvizoso.net>
> > +L:   dri-devel@lists.freedesktop.org
> > +S:   Supported
> > +T:   git https://gitlab.freedesktop.org/drm/misc/kernel.git
> > +F:   Documentation/accel/rocket/
> > +F:   Documentation/devicetree/bindings/npu/rockchip,rknn-core.yaml
> > +F:   drivers/accel/rocket/
> > +F:   include/uapi/drm/rocket_accel.h
> > +
> >   DRM COMPUTE ACCELERATORS DRIVERS AND FRAMEWORK
> >   M:  Oded Gabbay <ogabbay@kernel.org>
> >   L:  dri-devel@lists.freedesktop.org
> > diff --git a/drivers/accel/Kconfig b/drivers/accel/Kconfig
> > index 5b9490367a39fd12d35a8d9021768aa186c09308..bb01cebc42bf16ebf02e938=
040f339ff94869e33 100644
> > --- a/drivers/accel/Kconfig
> > +++ b/drivers/accel/Kconfig
> > @@ -28,5 +28,6 @@ source "drivers/accel/amdxdna/Kconfig"
> >   source "drivers/accel/habanalabs/Kconfig"
> >   source "drivers/accel/ivpu/Kconfig"
> >   source "drivers/accel/qaic/Kconfig"
> > +source "drivers/accel/rocket/Kconfig"
> >
> >   endif
> > diff --git a/drivers/accel/Makefile b/drivers/accel/Makefile
> > index a301fb6089d4c515430175c5e2ba9190f6dc9158..ffc3fa58866616d933184a7=
659573cd4d4780a8d 100644
> > --- a/drivers/accel/Makefile
> > +++ b/drivers/accel/Makefile
> > @@ -4,3 +4,4 @@ obj-$(CONFIG_DRM_ACCEL_AMDXDNA)               +=3D amdx=
dna/
> >   obj-$(CONFIG_DRM_ACCEL_HABANALABS)  +=3D habanalabs/
> >   obj-$(CONFIG_DRM_ACCEL_IVPU)                +=3D ivpu/
> >   obj-$(CONFIG_DRM_ACCEL_QAIC)                +=3D qaic/
> > +obj-$(CONFIG_DRM_ACCEL_ROCKET)               +=3D rocket/
> > \ No newline at end of file
>
> Couple of these no newline warnings
>
> > diff --git a/drivers/accel/rocket/Kconfig b/drivers/accel/rocket/Kconfi=
g
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..9a59c6c61bf4d6460d8008b=
16331f001c97de67d
> > --- /dev/null
> > +++ b/drivers/accel/rocket/Kconfig
> > @@ -0,0 +1,25 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +
> > +config DRM_ACCEL_ROCKET
> > +       tristate "Rocket (support for Rockchip NPUs)"
> > +       depends on DRM
> > +       depends on ARM64 || COMPILE_TEST
>
> Should this be more specific for now ARCH_ROCKCHIP?

Yep, already queued for v8.

> > +       depends on MMU
> > +       select DRM_SCHED
> > +       select IOMMU_SUPPORT
> > +       select IOMMU_IO_PGTABLE_LPAE
> > +       select DRM_GEM_SHMEM_HELPER
> > +       help
> > +       Choose this option if you have a Rockchip SoC that contains a
> > +       compatible Neural Processing Unit (NPU), such as the RK3588. Ca=
lled by
> > +       Rockchip either RKNN or RKNPU, it accelerates inference of neur=
al
> > +       networks.
> > +
> > +       The interface exposed to userspace is described in
> > +       include/uapi/drm/rocket_accel.h and is used by the Rocket users=
pace
> > +       driver in Mesa3D.
> > +
> > +       If unsure, say N.
> > +
> > +       To compile this driver as a module, choose M here: the
> > +       module will be called rocket.
> > diff --git a/drivers/accel/rocket/Makefile b/drivers/accel/rocket/Makef=
ile
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..abdd75f2492eaecf8bf5e78=
a2ac150ea19ac3e96
> > --- /dev/null
> > +++ b/drivers/accel/rocket/Makefile
> > @@ -0,0 +1,8 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +
> > +obj-$(CONFIG_DRM_ACCEL_ROCKET) :=3D rocket.o
> > +
> > +rocket-y :=3D \
> > +     rocket_core.o \
> > +     rocket_device.o \
> > +     rocket_drv.o
> > diff --git a/drivers/accel/rocket/rocket_core.c b/drivers/accel/rocket/=
rocket_core.c
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..3a6f25f2b41030751027395=
88bcdad96510e2a4e
> > --- /dev/null
> > +++ b/drivers/accel/rocket/rocket_core.c
> > @@ -0,0 +1,70 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/* Copyright 2024-2025 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/dev_printk.h>
> > +#include <linux/err.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/pm_runtime.h>
> > +
> > +#include "rocket_core.h"
> > +
> > +int rocket_core_init(struct rocket_core *core)
> > +{
> > +     struct device *dev =3D core->dev;
> > +     struct platform_device *pdev =3D to_platform_device(dev);
> > +     u32 version;
> > +     int err =3D 0;
> > +
> > +     err =3D devm_clk_bulk_get(dev, ARRAY_SIZE(core->clks), core->clks=
);
> > +     if (err)
> > +             return dev_err_probe(dev, err, "failed to get clocks for =
core %d\n", core->index);
> > +
> > +     core->pc_iomem =3D devm_platform_ioremap_resource_byname(pdev, "p=
c");
> > +     if (IS_ERR(core->pc_iomem)) {
> > +             dev_err(dev, "couldn't find PC registers %ld\n", PTR_ERR(=
core->pc_iomem));
> > +             return PTR_ERR(core->pc_iomem);
> > +     }
> > +
> > +     core->cna_iomem =3D devm_platform_ioremap_resource_byname(pdev, "=
cna");
> > +     if (IS_ERR(core->cna_iomem)) {
> > +             dev_err(dev, "couldn't find CNA registers %ld\n", PTR_ERR=
(core->cna_iomem));
> > +             return PTR_ERR(core->cna_iomem);
> > +     }
> > +
> > +     core->core_iomem =3D devm_platform_ioremap_resource_byname(pdev, =
"core");
> > +     if (IS_ERR(core->core_iomem)) {
> > +             dev_err(dev, "couldn't find CORE registers %ld\n", PTR_ER=
R(core->core_iomem));
> > +             return PTR_ERR(core->core_iomem);
> > +     }
> > +
> > +     pm_runtime_use_autosuspend(dev);
> > +
> > +     /*
> > +      * As this NPU will be most often used as part of a media pipelin=
e that
> > +      * ends presenting in a display, choose 50 ms (~3 frames at 60Hz)=
 as an
> > +      * autosuspend delay as that will keep the device powered up whil=
e the
> > +      * pipeline is running.
> > +      */
> > +     pm_runtime_set_autosuspend_delay(dev, 50);
> > +
> > +     pm_runtime_enable(dev);
>
>
> devm_pm_runtime_enable(dev) here would take care of both functions
> in rocket_core_fini() so you wouldn't need that and can cleanup
> some return paths here.

Unfortunately, that would cause the suspend callback being called
after devm has freed the clocks, so I need to force for the suspend to
happen before any other cleanup.

Thanks,

Tomeu

> Andrew
>
> > +
> > +     err =3D pm_runtime_get_sync(dev);
> > +
> > +     version =3D rocket_pc_readl(core, VERSION);
> > +     version +=3D rocket_pc_readl(core, VERSION_NUM) & 0xffff;
> > +
> > +     pm_runtime_mark_last_busy(dev);
> > +     pm_runtime_put_autosuspend(dev);
> > +
> > +     dev_info(dev, "Rockchip NPU core %d version: %d\n", core->index, =
version);
> > +
> > +     return 0;
> > +}
> > +
> > +void rocket_core_fini(struct rocket_core *core)
> > +{
> > +     pm_runtime_dont_use_autosuspend(core->dev);
> > +     pm_runtime_disable(core->dev);
> > +}
> > diff --git a/drivers/accel/rocket/rocket_core.h b/drivers/accel/rocket/=
rocket_core.h
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..1b1beb9798f03ec2ca32549=
6a4d894674d0b798d
> > --- /dev/null
> > +++ b/drivers/accel/rocket/rocket_core.h
> > @@ -0,0 +1,45 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/* Copyright 2024-2025 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
> > +
> > +#ifndef __ROCKET_CORE_H__
> > +#define __ROCKET_CORE_H__
> > +
> > +#include <drm/gpu_scheduler.h>
> > +#include <linux/clk.h>
> > +#include <linux/io.h>
> > +#include <linux/mutex_types.h>
> > +
> > +#include "rocket_registers.h"
> > +
> > +#define rocket_pc_readl(core, reg) \
> > +     readl((core)->pc_iomem + (REG_PC_##reg))
> > +#define rocket_pc_writel(core, reg, value) \
> > +     writel(value, (core)->pc_iomem + (REG_PC_##reg))
> > +
> > +#define rocket_cna_readl(core, reg) \
> > +     readl((core)->cna_iomem + (REG_CNA_##reg) - REG_CNA_S_STATUS)
> > +#define rocket_cna_writel(core, reg, value) \
> > +     writel(value, (core)->cna_iomem + (REG_CNA_##reg) - REG_CNA_S_STA=
TUS)
> > +
> > +#define rocket_core_readl(core, reg) \
> > +     readl((core)->core_iomem + (REG_CORE_##reg) - REG_CORE_S_STATUS)
> > +#define rocket_core_writel(core, reg, value) \
> > +     writel(value, (core)->core_iomem + (REG_CORE_##reg) - REG_CORE_S_=
STATUS)
> > +
> > +struct rocket_core {
> > +     struct device *dev;
> > +     struct rocket_device *rdev;
> > +     struct device_link *link;
> > +     unsigned int index;
> > +
> > +     int irq;
> > +     void __iomem *pc_iomem;
> > +     void __iomem *cna_iomem;
> > +     void __iomem *core_iomem;
> > +     struct clk_bulk_data clks[4];
> > +};
> > +
> > +int rocket_core_init(struct rocket_core *core);
> > +void rocket_core_fini(struct rocket_core *core);
> > +
> > +#endif
> > diff --git a/drivers/accel/rocket/rocket_device.c b/drivers/accel/rocke=
t/rocket_device.c
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..a05c103e117e3eaa6439884=
b7acb6e3483296edb
> > --- /dev/null
> > +++ b/drivers/accel/rocket/rocket_device.c
> > @@ -0,0 +1,25 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/* Copyright 2024-2025 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
> > +
> > +#include <linux/array_size.h>
> > +#include <linux/clk.h>
> > +#include <linux/dev_printk.h>
> > +
> > +#include "rocket_device.h"
> > +
> > +int rocket_device_init(struct rocket_device *rdev)
> > +{
> > +     int err;
> > +
> > +     /* Initialize core 0 (top) */
> > +     err =3D rocket_core_init(&rdev->cores[0]);
> > +     if (err)
> > +             return err;
> > +
> > +     return 0;
> > +}
> > +
> > +void rocket_device_fini(struct rocket_device *rdev)
> > +{
> > +     rocket_core_fini(&rdev->cores[0]);
> > +}
> > diff --git a/drivers/accel/rocket/rocket_device.h b/drivers/accel/rocke=
t/rocket_device.h
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..b5d5f1479d56e2fde59bbca=
d9de2b58cef9a9a4d
> > --- /dev/null
> > +++ b/drivers/accel/rocket/rocket_device.h
> > @@ -0,0 +1,26 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/* Copyright 2024-2025 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
> > +
> > +#ifndef __ROCKET_DEVICE_H__
> > +#define __ROCKET_DEVICE_H__
> > +
> > +#include <drm/drm_device.h>
> > +#include <linux/clk.h>
> > +#include <linux/container_of.h>
> > +
> > +#include "rocket_core.h"
> > +
> > +struct rocket_device {
> > +     struct drm_device ddev;
> > +
> > +     struct rocket_core *cores;
> > +     unsigned int num_cores;
> > +};
> > +
> > +int rocket_device_init(struct rocket_device *rdev);
> > +void rocket_device_fini(struct rocket_device *rdev);
> > +
> > +#define to_rocket_device(drm_dev) \
> > +     ((struct rocket_device *)container_of(drm_dev, struct rocket_devi=
ce, ddev))
> > +
> > +#endif
> > diff --git a/drivers/accel/rocket/rocket_drv.c b/drivers/accel/rocket/r=
ocket_drv.c
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..b38a5c6264cb4e74d5e381a=
daeba1426e576fa56
> > --- /dev/null
> > +++ b/drivers/accel/rocket/rocket_drv.c
> > @@ -0,0 +1,279 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/* Copyright 2024-2025 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
> > +
> > +#include <drm/drm_accel.h>
> > +#include <drm/drm_drv.h>
> > +#include <drm/drm_gem.h>
> > +#include <drm/drm_ioctl.h>
> > +#include <drm/drm_of.h>
> > +#include <linux/array_size.h>
> > +#include <linux/clk.h>
> > +#include <linux/component.h>
> > +#include <linux/dma-mapping.h>
> > +#include <linux/iommu.h>
> > +#include <linux/of.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/pm_runtime.h>
> > +
> > +#include "rocket_drv.h"
> > +
> > +static int
> > +rocket_open(struct drm_device *dev, struct drm_file *file)
> > +{
> > +     struct rocket_device *rdev =3D to_rocket_device(dev);
> > +     struct rocket_file_priv *rocket_priv;
> > +
> > +     rocket_priv =3D kzalloc(sizeof(*rocket_priv), GFP_KERNEL);
> > +     if (!rocket_priv)
> > +             return -ENOMEM;
> > +
> > +     rocket_priv->rdev =3D rdev;
> > +     rocket_priv->domain =3D iommu_paging_domain_alloc(dev->dev);
> > +     file->driver_priv =3D rocket_priv;
> > +
> > +     return 0;
> > +}
> > +
> > +static void
> > +rocket_postclose(struct drm_device *dev, struct drm_file *file)
> > +{
> > +     struct rocket_file_priv *rocket_priv =3D file->driver_priv;
> > +
> > +     iommu_domain_free(rocket_priv->domain);
> > +     kfree(rocket_priv);
> > +}
> > +
> > +static const struct drm_ioctl_desc rocket_drm_driver_ioctls[] =3D {
> > +#define ROCKET_IOCTL(n, func) \
> > +     DRM_IOCTL_DEF_DRV(ROCKET_##n, rocket_ioctl_##func, 0)
> > +};
> > +
> > +DEFINE_DRM_ACCEL_FOPS(rocket_accel_driver_fops);
> > +
> > +/*
> > + * Rocket driver version:
> > + * - 1.0 - initial interface
> > + */
> > +static const struct drm_driver rocket_drm_driver =3D {
> > +     .driver_features        =3D DRIVER_COMPUTE_ACCEL,
> > +     .open                   =3D rocket_open,
> > +     .postclose              =3D rocket_postclose,
> > +     .ioctls                 =3D rocket_drm_driver_ioctls,
> > +     .num_ioctls             =3D ARRAY_SIZE(rocket_drm_driver_ioctls),
> > +     .fops                   =3D &rocket_accel_driver_fops,
> > +     .name                   =3D "rocket",
> > +     .desc                   =3D "rocket DRM",
> > +};
> > +
> > +static int rocket_drm_bind(struct device *dev)
> > +{
> > +     struct device_node *core_node;
> > +     struct rocket_device *rdev;
> > +     struct drm_device *ddev;
> > +     unsigned int num_cores =3D 1;
> > +     int err;
> > +
> > +     rdev =3D devm_drm_dev_alloc(dev, &rocket_drm_driver, struct rocke=
t_device, ddev);
> > +     if (IS_ERR(rdev))
> > +             return PTR_ERR(rdev);
> > +
> > +     ddev =3D &rdev->ddev;
> > +     dev_set_drvdata(dev, rdev);
> > +
> > +     for_each_compatible_node(core_node, NULL, "rockchip,rk3588-rknn-c=
ore")
> > +             if (of_device_is_available(core_node))
> > +                     num_cores++;
> > +
> > +     rdev->cores =3D devm_kcalloc(dev, num_cores, sizeof(*rdev->cores)=
, GFP_KERNEL);
> > +     if (IS_ERR(rdev->cores))
> > +             return PTR_ERR(rdev->cores);
> > +
> > +     /* Add core 0, any other cores will be added later when they are =
bound */
> > +     rdev->cores[0].rdev =3D rdev;
> > +     rdev->cores[0].dev =3D dev;
> > +     rdev->cores[0].index =3D 0;
> > +     rdev->num_cores =3D 1;
> > +
> > +     err =3D dma_set_mask_and_coherent(dev, DMA_BIT_MASK(40));
> > +     if (err)
> > +             return err;
> > +
> > +     err =3D rocket_device_init(rdev);
> > +     if (err) {
> > +             dev_err_probe(dev, err, "Fatal error during NPU init\n");
> > +             goto err_device_fini;
> > +     }
> > +
> > +     err =3D component_bind_all(dev, rdev);
> > +     if (err)
> > +             goto err_device_fini;
> > +
> > +     err =3D drm_dev_register(ddev, 0);
> > +     if (err < 0)
> > +             goto err_unbind;
> > +
> > +     return 0;
> > +
> > +err_unbind:
> > +     component_unbind_all(dev, rdev);
> > +err_device_fini:
> > +     rocket_device_fini(rdev);
> > +     return err;
> > +}
> > +
> > +static void rocket_drm_unbind(struct device *dev)
> > +{
> > +     struct rocket_device *rdev =3D dev_get_drvdata(dev);
> > +     struct drm_device *ddev =3D &rdev->ddev;
> > +
> > +     drm_dev_unregister(ddev);
> > +
> > +     component_unbind_all(dev, rdev);
> > +
> > +     rocket_device_fini(rdev);
> > +}
> > +
> > +const struct component_master_ops rocket_drm_ops =3D {
> > +     .bind =3D rocket_drm_bind,
> > +     .unbind =3D rocket_drm_unbind,
> > +};
> > +
> > +static int rocket_core_bind(struct device *dev, struct device *master,=
 void *data)
> > +{
> > +     struct rocket_device *rdev =3D data;
> > +     unsigned int core =3D rdev->num_cores;
> > +     int err;
> > +
> > +     dev_set_drvdata(dev, rdev);
> > +
> > +     rdev->cores[core].rdev =3D rdev;
> > +     rdev->cores[core].dev =3D dev;
> > +     rdev->cores[core].index =3D core;
> > +     rdev->cores[core].link =3D device_link_add(dev, rdev->cores[0].de=
v,
> > +                                              DL_FLAG_STATELESS | DL_F=
LAG_PM_RUNTIME);
> > +
> > +     rdev->num_cores++;
> > +
> > +     err =3D rocket_core_init(&rdev->cores[core]);
> > +     if (err) {
> > +             rocket_device_fini(rdev);
> > +             return err;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static void rocket_core_unbind(struct device *dev, struct device *mast=
er, void *data)
> > +{
> > +     struct rocket_device *rdev =3D data;
> > +
> > +     for (unsigned int core =3D 1; core < rdev->num_cores; core++) {
> > +             if (rdev->cores[core].dev =3D=3D dev) {
> > +                     rocket_core_fini(&rdev->cores[core]);
> > +                     device_link_del(rdev->cores[core].link);
> > +                     break;
> > +             }
> > +     }
> > +}
> > +
> > +const struct component_ops rocket_core_ops =3D {
> > +     .bind =3D rocket_core_bind,
> > +     .unbind =3D rocket_core_unbind,
> > +};
> > +
> > +static int rocket_probe(struct platform_device *pdev)
> > +{
> > +     struct component_match *match =3D NULL;
> > +     struct device_node *core_node;
> > +
> > +     if (fwnode_device_is_compatible(pdev->dev.fwnode, "rockchip,rk358=
8-rknn-core"))
> > +             return component_add(&pdev->dev, &rocket_core_ops);
> > +
> > +     for_each_compatible_node(core_node, NULL, "rockchip,rk3588-rknn-c=
ore") {
> > +             if (!of_device_is_available(core_node))
> > +                     continue;
> > +
> > +             drm_of_component_match_add(&pdev->dev, &match,
> > +                                        component_compare_of, core_nod=
e);
> > +     }
> > +
> > +     return component_master_add_with_match(&pdev->dev, &rocket_drm_op=
s, match);
> > +}
> > +
> > +static void rocket_remove(struct platform_device *pdev)
> > +{
> > +     if (fwnode_device_is_compatible(pdev->dev.fwnode, "rockchip,rk358=
8-rknn-core-top"))
> > +             component_master_del(&pdev->dev, &rocket_drm_ops);
> > +     else if (fwnode_device_is_compatible(pdev->dev.fwnode, "rockchip,=
rk3588-rknn-core"))
> > +             component_del(&pdev->dev, &rocket_core_ops);
> > +}
> > +
> > +static const struct of_device_id dt_match[] =3D {
> > +     { .compatible =3D "rockchip,rk3588-rknn-core-top" },
> > +     { .compatible =3D "rockchip,rk3588-rknn-core" },
> > +     {}
> > +};
> > +MODULE_DEVICE_TABLE(of, dt_match);
> > +
> > +static int find_core_for_dev(struct device *dev)
> > +{
> > +     struct rocket_device *rdev =3D dev_get_drvdata(dev);
> > +
> > +     for (unsigned int core =3D 0; core < rdev->num_cores; core++) {
> > +             if (dev =3D=3D rdev->cores[core].dev)
> > +                     return core;
> > +     }
> > +
> > +     return -1;
> > +}
> > +
> > +static int rocket_device_runtime_resume(struct device *dev)
> > +{
> > +     struct rocket_device *rdev =3D dev_get_drvdata(dev);
> > +     int core =3D find_core_for_dev(dev);
> > +     int err =3D 0;
> > +
> > +     if (core < 0)
> > +             return -ENODEV;
> > +
> > +     err =3D clk_bulk_prepare_enable(ARRAY_SIZE(rdev->cores[core].clks=
), rdev->cores[core].clks);
> > +     if (err) {
> > +             dev_err(dev, "failed to enable (%d) clocks for core %d\n"=
, err, core);
> > +             return err;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int rocket_device_runtime_suspend(struct device *dev)
> > +{
> > +     struct rocket_device *rdev =3D dev_get_drvdata(dev);
> > +     int core =3D find_core_for_dev(dev);
> > +
> > +     if (core < 0)
> > +             return -ENODEV;
> > +
> > +     clk_bulk_disable_unprepare(ARRAY_SIZE(rdev->cores[core].clks), rd=
ev->cores[core].clks);
> > +
> > +     return 0;
> > +}
> > +
> > +EXPORT_GPL_DEV_PM_OPS(rocket_pm_ops) =3D {
> > +     RUNTIME_PM_OPS(rocket_device_runtime_suspend, rocket_device_runti=
me_resume, NULL)
> > +     SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_re=
sume)
> > +};
> > +
> > +static struct platform_driver rocket_driver =3D {
> > +     .probe =3D rocket_probe,
> > +     .remove =3D rocket_remove,
> > +     .driver  =3D {
> > +             .name =3D "rocket",
> > +             .pm =3D pm_ptr(&rocket_pm_ops),
> > +             .of_match_table =3D dt_match,
> > +     },
> > +};
> > +module_platform_driver(rocket_driver);
> > +
> > +MODULE_LICENSE("GPL");
> > +MODULE_DESCRIPTION("DRM driver for the Rockchip NPU IP");
> > +MODULE_AUTHOR("Tomeu Vizoso");
> > diff --git a/drivers/accel/rocket/rocket_drv.h b/drivers/accel/rocket/r=
ocket_drv.h
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..3219621afb72acdfa915c11=
0e2ec3aacb66bd940
> > --- /dev/null
> > +++ b/drivers/accel/rocket/rocket_drv.h
> > @@ -0,0 +1,15 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/* Copyright 2024-2025 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
> > +
> > +#ifndef __ROCKET_DRV_H__
> > +#define __ROCKET_DRV_H__
> > +
> > +#include "rocket_device.h"
> > +
> > +struct rocket_file_priv {
> > +     struct rocket_device *rdev;
> > +
> > +     struct iommu_domain *domain;
> > +};
> > +
> > +#endif
> >

