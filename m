Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43630D2F356
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 18:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ktFARcL7abjEswMdxHANS1AOCLFu8aD4rHTTseQcdl0=; b=jTEYdQ/ok1ksMQFYS0FVbURnSU
	e8VUhRSqPCNBW56CiZ4HN2cVkmpeavxFCjaRxTi27bC20GfxG2zhsQBV/W7jhEQZPuGZtDiv1GavU
	do54bWH+5oPIwwp1CeGQ4VEUVc3JXiWn+5mxoEImbWCiEMHVMi9o7HTNdDVyWr0x3zlB3zXJ/MYFN
	A7PNbEC3VCdN5weu8OAj+TFQlwEfcbULqhdnShv624YVKawwQTkL/J5C08vjFcOK3qVCcdNfW2/ay
	JzbQUzLZxRNwnWjGy72nURGeLpcJSywlpNfb86t5/iKo6NEqZqxMSU4+TfO8C38sKCR90lHVAm1cm
	tv8N5L1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfj2p-00000007a4Y-2qiP;
	Tue, 13 Jan 2026 18:23:07 +0000
Received: from mail-dl1-x122b.google.com ([2607:f8b0:4864:20::122b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfj2n-00000007a4B-31Sy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 18:23:06 +0000
Received: by mail-dl1-x122b.google.com with SMTP id a92af1059eb24-121bf277922so9375277c88.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 10:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768328584; x=1768933384; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ktFARcL7abjEswMdxHANS1AOCLFu8aD4rHTTseQcdl0=;
        b=PZGacLS7dR+bGtZdndvyY1B7qn5/W1bAHA22x+BnhaLp4AhsRaN+o4G0L5MP0ckIN6
         265F998ifOGWneVSdRjcdONbUgaYkU5WT+iPXHO4L/RLP/NUh80syMpCY1BV3z+CrQtG
         def6ZJWC0jYsHA6Q/K4GFuGE9n38uTTj+Gi1oGMHkP/us6JCyyMojrpfuANbKCROWw9G
         A1tlUC52Yv1VfInHyP3F61cRHgAqH9UtwWjQtew7yDhgKRB2nlKVbM+En4PHXdIcAmzb
         uMM83q3MOi+zJvMw0zrlWVlyDMJoQ7WCQ/WP3zXdB0f7FcoKnJJXUWHbstTxiksJV8Rv
         oUpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768328584; x=1768933384;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ktFARcL7abjEswMdxHANS1AOCLFu8aD4rHTTseQcdl0=;
        b=CVtbPR1x4MKc0IqTVA9dGTDDUsZ5YaUIGotsW3JW0K5n2Se5zQn0uotb3+ZDJaOnwx
         JVqsoOnY8Sn+SdFAofsxnVK6cCUuAyq2/DnTm6oOxCM56DWvkVQ+Mdm3Fjma9tpD3of0
         I1Gv7FwztroCS3nh7RWQED3kQLArTlX//WrkscTqxhtKMTnyBXPW8Iodz+iCmLhiNX0J
         iONznxAerBM7BgYhkx3CBEaLjJ7hE+JdT9SlJsQAcX1azrr+5KuiTw4dhD3yaLA1x5yX
         63A9cQTn2lOpGRwUdg1jnjKDz1PBLVtdhjtis15Ulwtpi3ZmZVWplwMSbsUeRkOg0JpB
         lheA==
X-Forwarded-Encrypted: i=1; AJvYcCVkLaOCHpJL9Ug40bTQ1sTT3hAirJWc4Tgh+JmmqDADfEfGcKDQ4RNqEjx0KmA+ckRygK4oHaDlNwH1C/EjB9oT@lists.infradead.org
X-Gm-Message-State: AOJu0Ywg7gIvjSgsPKBiJhuzyKzXzIHw5wgw0af9DAoo88p5RQXOtHY2
	ErWxAqkbwSDbgW/xMXe9wHqyeAahQozfYBYHx+GC10b+Rb/B+YoPK0KvtDD0VCFLbE45qA4dTOP
	6cBlYSPJj8z54tVI8sg3g8haEhObUrCI=
X-Gm-Gg: AY/fxX7MMEcVnyxRpzE00R0XvLi9PvHUioaReDXzjIYc40f/2JYaEnbIdOqVf07GlNu
	2vgHvbelvgv49ffh5OLi6GiZw9ok2od0QkWinflFSxAmdWpFHDUHUcbPYrb2eEBAjxziaisjCxF
	o/alGF40DAnE9eQ9sigTL6Mg0PhOcgczzP9AgOpucTACAgi0KzkOtVJgYpPM2L2QlzEAl/96Bee
	Q8fkFhseBjJpHNXWoY0Ru7dVWpII7p4PJAhY10bO6OLrmiTlMQhm3SOR699SMy78YZIERxoLK9I
	ZFtl9jv5fsiE/AFu7b0Xr012gwD+u1jwH+FNnpH2aCKmTEgVj+6DhU8LLLHtyw1SiT5zzqQIuQR
	82g0FUzorB0UNxZ0=
X-Google-Smtp-Source: AGHT+IFry5mrp+qhfmaTmFowwpyilhTDV99e4+YsYHR4eczlm0CCEKca1hIFDilnVzeT/ocGVM7wlP2rRttk0FeEdcc=
X-Received: by 2002:a05:7022:613:b0:119:e569:f62e with SMTP id
 a92af1059eb24-121f8b8d73amr21681821c88.39.1768328584025; Tue, 13 Jan 2026
 10:23:04 -0800 (PST)
MIME-Version: 1.0
References: <20260113-thames-v1-0-99390026937c@tomeuvizoso.net> <20260113-thames-v1-2-99390026937c@tomeuvizoso.net>
In-Reply-To: <20260113-thames-v1-2-99390026937c@tomeuvizoso.net>
From: Robert Nelson <robertcnelson@gmail.com>
Date: Tue, 13 Jan 2026 12:22:37 -0600
X-Gm-Features: AZwV_QgGjFNmrIcWdIpWbLrkpdUzkEwOLFO_r4C0G38vOy1_mGAz7cr1Zzr72TQ
Message-ID: <CAOCHtYgW4Gzyed3oTofjZYzZ+Umr1Q2fxNm7uGDEUmnG-kXyOg@mail.gmail.com>
Subject: Re: [PATCH 2/5] accel/thames: Add driver for the C7x DSPs in TI SoCs
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Nishanth Menon <nm@ti.com>, "Andrew F. Davis" <afd@ti.com>, Randolph Sapp <rs@ti.com>, 
	Jonathan Humphreys <j-humphreys@ti.com>, Andrei Aldea <a-aldea@ti.com>, Chirag Shilwant <c-shilwant@ti.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-doc@vger.kernel.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_102305_767553_B2C1FBF5 
X-CRM114-Status: GOOD (  26.62  )
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

On Tue, Jan 13, 2026 at 11:45=E2=80=AFAM Tomeu Vizoso <tomeu@tomeuvizoso.ne=
t> wrote:
>
> Some SoCs from Texas Instruments contain DSPs that can be used for
> general compute tasks.
>
> This driver provides a drm/accel UABI to userspace for submitting jobs
> to the DSP cores and managing the input, output and intermediate memory.
>
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> ---
>  Documentation/accel/thames/index.rst |  28 +++++
>  MAINTAINERS                          |   9 ++
>  drivers/accel/Kconfig                |   1 +
>  drivers/accel/Makefile               |   3 +-
>  drivers/accel/thames/Kconfig         |  26 +++++
>  drivers/accel/thames/Makefile        |   9 ++
>  drivers/accel/thames/thames_core.c   | 155 ++++++++++++++++++++++++++
>  drivers/accel/thames/thames_core.h   |  53 +++++++++
>  drivers/accel/thames/thames_device.c |  93 ++++++++++++++++
>  drivers/accel/thames/thames_device.h |  46 ++++++++
>  drivers/accel/thames/thames_drv.c    | 156 +++++++++++++++++++++++++++
>  drivers/accel/thames/thames_drv.h    |  21 ++++
>  drivers/accel/thames/thames_ipc.h    | 204 +++++++++++++++++++++++++++++=
++++++
>  drivers/accel/thames/thames_rpmsg.c  | 155 ++++++++++++++++++++++++++
>  drivers/accel/thames/thames_rpmsg.h  |  27 +++++
>  15 files changed, 985 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/accel/thames/index.rst b/Documentation/accel/t=
hames/index.rst
> new file mode 100644
> index 0000000000000000000000000000000000000000..ca8391031f226f7ef1dc210a3=
56c86acbe126c6f
> --- /dev/null
> +++ b/Documentation/accel/thames/index.rst
> @@ -0,0 +1,28 @@
> +.. SPDX-License-Identifier: GPL-2.0-only
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> + accel/thames Driver for the C7x DSPs from Texas Instruments
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The accel/thames driver supports the C7x DSPs inside some Texas Instrume=
nts SoCs
> +such as the J722S. These can be used as accelerators for various workloa=
ds,
> +including machine learning inference.
> +
> +This driver controls the power state of the hardware via :doc:`remotepro=
c </staging/remoteproc>`
> +and communicates with the firmware running on the DSP via :doc:`rpmsg_vi=
rtio </staging/rpmsg_virtio>`.
> +The kernel driver itself allocates buffers, manages contexts, and submit=
s jobs
> +to the DSP firmware. Buffers are mapped by the DSP itself using its MMU,
> +providing memory isolation among different clients.
> +
> +The source code for the firmware running on the DSP is available at:
> +https://gitlab.freedesktop.org/tomeu/thames_firmware/.
> +
> +Everything else is done in userspace, as a Gallium driver (also called t=
hames)
> +that is part of the Mesa3D project: https://docs.mesa3d.org/teflon.html
> +
> +If there is more than one core that advertises the same rpmsg_virtio ser=
vice
> +name, the driver will load balance jobs between them with drm-gpu-schedu=
ler.
> +
> +Hardware currently supported:
> +
> +* J722S
> diff --git a/MAINTAINERS b/MAINTAINERS
> index dc731d37c8feeff25613c59fe9c929927dadaa7e..a3fc809c797269d0792dfe520=
2cc1b49f6ff57e9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7731,6 +7731,15 @@ F:       Documentation/devicetree/bindings/npu/roc=
kchip,rk3588-rknn-core.yaml
>  F:     drivers/accel/rocket/
>  F:     include/uapi/drm/rocket_accel.h
>
> +DRM ACCEL DRIVER FOR TI C7x DSPS
> +M:     Tomeu Vizoso <tomeu@tomeuvizoso.net>
> +L:     dri-devel@lists.freedesktop.org
> +S:     Supported
> +T:     git https://gitlab.freedesktop.org/drm/misc/kernel.git
> +F:     Documentation/accel/thames/
> +F:     drivers/accel/thames/
> +F:     include/uapi/drm/thames_accel.h

Oh where is this "thames_accel.h" ? ;)


2026-01-13T18:16:11.881084Z 01E
drivers/accel/thames/thames_drv.c:8:10: fatal error:
drm/thames_accel.h: No such file or directory
2026-01-13T18:16:11.881086Z 01E     8 | #include <drm/thames_accel.h>
2026-01-13T18:16:11.881087Z 01E       |          ^~~~~~~~~~~~~~~~~~~~
2026-01-13T18:16:11.881115Z 01E compilation terminated.
2026-01-13T18:16:11.884552Z 01E make[8]: ***
[scripts/Makefile.build:287: drivers/accel/thames/thames_drv.o] Error
1
2026-01-13T18:16:11.884694Z 01E make[7]: ***
[scripts/Makefile.build:544: drivers/accel/thames] Error 2
2026-01-13T18:16:11.884926Z 01E make[6]: ***
[scripts/Makefile.build:544: drivers/accel] Error 2
2026-01-13T18:16:11.884976Z 01E make[6]: *** Waiting for unfinished jobs...=
.

$ find . | grep thames_accel.h
$ grep -R "thames_accel.h" ./*
./drivers/accel/thames/Kconfig:      include/uapi/drm/thames_accel.h
and is used by the Thames userspace
./drivers/accel/thames/thames_job.c:#include <drm/thames_accel.h>
./drivers/accel/thames/thames_drv.c:#include <drm/thames_accel.h>
./drivers/accel/thames/thames_gem.c:#include <drm/thames_accel.h>
./MAINTAINERS:F:    include/uapi/drm/thames_accel.h

Regards,

--=20
Robert Nelson
https://rcn-ee.com/

