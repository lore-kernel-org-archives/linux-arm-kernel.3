Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E365E109448A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Mar 2026 17:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7vHL3NHwLvAmvTyDujeMAKynQAKPZxIj2hZIIbS3qhE=; b=iCj/7sAbjv6f5WR13shFomC148
	7EIKALGiQ2t+N2Za5ds0nNg6HHTaGAV6YT2oX94DNnGcoxn8jXJFYVkc6xLsYIXZvHGCeXy0JUm/C
	wPXZlmyZePHsWcLYU5mIBOW4P1r/xw8OchjdGMZlMVKSza889fjkuWHz5hEwowLil9c1fD1KyzqLH
	jWPO5XXETvt3K91k2lbUexDzgb1DGc3pYxLVcW9iioApyPzoitV9JtLBlpZWp5D4aWfx7/D/78tuv
	SXl3nbqSodHOdC1LfyIS0sIf8A0wFnVjdHuUY3mKi2Y2r3cv38NhpcDwOiMpVa8eM5Yntcu9n1goH
	QU08Y1Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3zyt-0000000Efle-3hZL;
	Sat, 21 Mar 2026 17:19:24 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3zyr-0000000EflI-0ZXr
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Mar 2026 17:19:22 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-8cbb6d5f780so173301285a.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Mar 2026 10:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1774113559; x=1774718359; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7vHL3NHwLvAmvTyDujeMAKynQAKPZxIj2hZIIbS3qhE=;
        b=hSBvstdPXL8eTEq0+mN8OxDJcGUJbxl86EXZ6qm4mfgDmVWihKHFuKOd9Zo6RhK8Da
         BX+gMFtIHmrAvkH5YQJ/9UsMO+a92muMOUS8s9tY6dHY3+AmlmgwI1wzMc2cAttyqJ6P
         tMfBm6wHd39BCTGKDXr/NzCLmtyd/W+M93+6Tbv32bDeJ/q7aGwZqDm99jjL6gASQbdY
         ns1PfEgnRl2cpqtiEnrWwxjsRu4zTwRX5+6eXjeLnhq0EF2Y4MMn0rzkwr8oV91lRHlS
         2wVQwS0NiUugwUlqOurk7aioPM8CmksezHNMwcQmnnZXd0uxvXOJJ8cIL8GX36XPbmWT
         /RAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774113559; x=1774718359;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7vHL3NHwLvAmvTyDujeMAKynQAKPZxIj2hZIIbS3qhE=;
        b=MuirT8il6veUZDObkFoVwmTHiGuDhnwarhIfGbYmfHtNEr4QXyCNlx5I5Gjn3t2BeF
         qQXS0csGg5xI13e/on7nWS1KcCC8vpovJLudGvyfLF4/PWctIXambPxH0bZZbhw1E5+T
         Gp1Mc0ny6RfxKBV7BFmYUpy07rPwvK8iZBPrThzo6wnkdRrFonj8Qe2Gp8LfA9rUv/iu
         f0yulgXg14C65F/ZEWGWgJvH4V78Z2AKe6Afa1HgMZFxODXw9A3MKpYb/IEl+49WZfe5
         jjdNDddfoCPvAjtjm5CFNyqDx/c0IGRiXK64l8YLuTtEBFxEZqyCtdlyye0qq/bdiUPk
         Ba4w==
X-Forwarded-Encrypted: i=1; AJvYcCUEOddd4BFMXsq/eN4dELOJiK8VSc1iaHWWg6Q2ljdjTe3ozaFU4paW0ZV30XRIUCZ9Qik1msAbith+WbCOT2Gp@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4d6csqBr675YrUEPJec48MzK30+jQLSGwq11YrPCMJ5zmtjcW
	WCmtymZkQ4hvprkMRjnIT217WR0yPjsDyuJwxgMIdeQarU+yXm6ejOzMTnMSCNFm5Z46p75+CCc
	H4VjfoWvMnu4Z
X-Gm-Gg: ATEYQzxtuDfbWFBEgIdZl2hMU7URoPfwRlYWaF7PqsdnQB1XC5vslFdnav5+Iup6h1V
	PurTgmpKNve7cMol0k3HjjrFAW2bNejKsn+MyurWpQXvoyEO+5sNilnHjAPyOFxnAbv3NzCTkJj
	3j4wKH051i/DWO6jdqu2Yxe/6MeV1hrCqT8wj5E3fb3h5fRMxy+6bX092tw+XXbESlsWZr9SbxE
	3DZUC9h5cObaHDjZjjyttHJUSuxvS2+0UfhmS9dQhVfQVAOmQVXf4RkEwEgc9gR68YPWZ3wmLS3
	JbTvnOsK7MuIVGd3yi4sENuVXnteD4i+f4K03wMxIaAmTZnfnxBjmP4QyCaf52Me7dKxMUPmLDJ
	aQMWC0SJiDPGiOTqWa83SXoUvmbdkbz5TLLgJ0m+/r46oBN2TFerjeX66BE8KRGeMSh926xahLC
	j4iY1HOwhCxH+3tXsEYUpXF0XTIuXClIjPOvgz/sNzK61F4t2ACis9ZjBPquM7Jg==
X-Received: by 2002:a05:620a:4556:b0:8cf:d62a:c819 with SMTP id af79cd13be357-8cfd62acc9dmr529879985a.21.1774113559225;
        Sat, 21 Mar 2026 10:19:19 -0700 (PDT)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com. [209.85.219.47])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cfc8fb9c10sm476806285a.19.2026.03.21.10.19.17
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Mar 2026 10:19:18 -0700 (PDT)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-89c43c4c383so20375106d6.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Mar 2026 10:19:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU+JoicbOz5B+u1RqoUHb5OJN8GnJcBD8Ket6IrWnRS2xIv6RmKWseI0aXO9A/Cl2u9HuEc+N5xTpi7w82kyk4I@lists.infradead.org
X-Received: by 2002:a05:6214:2503:b0:895:4bec:c629 with SMTP id
 6a1803df08f44-89c85a4415dmr120844646d6.31.1774113557567; Sat, 21 Mar 2026
 10:19:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260306-neutron-v2-0-3019bd8c91ef@nxp.com>
In-Reply-To: <20260306-neutron-v2-0-3019bd8c91ef@nxp.com>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Sat, 21 Mar 2026 18:19:06 +0100
X-Gmail-Original-Message-ID: <CAAObsKDAzfib86rXqt9FjXV68yRkBzmijcyR+x=1MsPYd=MQWQ@mail.gmail.com>
X-Gm-Features: AaiRm51EiMaDZyOBoTxsmzhD9LKdQqqk1TUMHYTLZEpIizj3O9FXdJaoYzmTmY0
Message-ID: <CAAObsKDAzfib86rXqt9FjXV68yRkBzmijcyR+x=1MsPYd=MQWQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] accel: New driver for NXP's Neutron NPU
To: Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, Jiwei Fu <jiwei.fu@nxp.com>, 
	Forrest Shi <xuelin.shi@nxp.com>, Alexandru Taran <alexandru.taran@nxp.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260321_101921_435544_31A8952B 
X-CRM114-Status: GOOD (  24.53  )
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

Hi Ioana,

Looks like the userspace portion of the driver is closed source
(libNeutronDriver.so)?

https://github.com/nxp-imx/tflite-neutron-delegate/blob/lf-6.12.49_2.2.0/CM=
akeLists.txt

Regards,

Tomeu

On Fri, Mar 6, 2026 at 2:27=E2=80=AFPM Ioana Ciocoi-Radulescu
<ruxandra.radulescu@nxp.com> wrote:
>
> Introduce a new accel driver for the Neutron Neural Processing Unit
> (NPU), along with associated dt-bindings and DTS node.
>
> The first patch extends the GEM DMA helper APIs to allow bidirectional
> mapping of non-coherent DMA buffers. While not part of the Neutron
> driver, it's a prerequisite allowing us to use the GEM DMA helper.
>
> Neutron is a Neural Processing Unit from NXP, providing machine
> learning (ML) acceleration for edge AI applications. Neutron is
> integrated on NXP SoCs such as the i.MX95.
>
> The NPU consists of the following:
> - RISC-V core running a proprietary firmware
> - One or more Neutron cores, representing the main computation
>   engine performing ML operations
> - Dedicated fast memory (TCM)
> - DMA engine that handles data transfers between DDR and TCM
>
> The firmware is closed source and distributed as a binary here [1].
>
> The Neutron software stack also contains a userspace library [1] and
> a LiteRT custom delegate [2] that allow integration with standard
> LiteRT tools.
>
> [1] https://github.com/nxp-upstream/neutron/tree/upstream
> [2] https://github.com/nxp-imx/tflite-neutron-delegate
>
> Signed-off-by: Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
> ---
> Changes in v2:
> - rebase on newer drm-misc-next
> - dt bindings: clock fixes and renames
> - update DTS to match new names
> - remove unnecessary fields from neutron_job structure
> - fix use of uninitialized variable
>
> - Link to v1: https://lore.kernel.org/r/20260226-neutron-v1-0-46eccb3bb50=
a@nxp.com
>
> ---
> Ioana Ciocoi-Radulescu (9):
>       drm/gem-dma: Add flag for bidirectional mapping of non-coherent GEM=
 DMA buffers
>       accel/neutron: Add documentation for NXP Neutron accelerator driver
>       dt-bindings: npu: Add NXP Neutron
>       accel/neutron: Add driver for NXP Neutron NPU
>       accel/neutron: Add GEM buffer object support
>       accel/neutron: Add mailbox support
>       accel/neutron: Add job submission IOCTL
>       accel/neutron: Add logging support
>       arm64: dts: imx95: Add Neutron node
>
>  Documentation/accel/index.rst                      |   1 +
>  Documentation/accel/neutron/index.rst              |  12 +
>  Documentation/accel/neutron/neutron.rst            | 131 ++++++++
>  .../devicetree/bindings/npu/nxp,imx95-neutron.yaml |  96 ++++++
>  MAINTAINERS                                        |  10 +
>  arch/arm64/boot/dts/freescale/imx95.dtsi           |  28 ++
>  drivers/accel/Kconfig                              |   1 +
>  drivers/accel/Makefile                             |   3 +-
>  drivers/accel/neutron/Kconfig                      |  16 +
>  drivers/accel/neutron/Makefile                     |  12 +
>  drivers/accel/neutron/neutron_debugfs.c            |  34 ++
>  drivers/accel/neutron/neutron_debugfs.h            |  15 +
>  drivers/accel/neutron/neutron_device.c             | 239 +++++++++++++
>  drivers/accel/neutron/neutron_device.h             | 155 +++++++++
>  drivers/accel/neutron/neutron_driver.c             | 262 +++++++++++++++
>  drivers/accel/neutron/neutron_driver.h             |  16 +
>  drivers/accel/neutron/neutron_gem.c                | 116 +++++++
>  drivers/accel/neutron/neutron_gem.h                |  14 +
>  drivers/accel/neutron/neutron_job.c                | 372 +++++++++++++++=
++++++
>  drivers/accel/neutron/neutron_job.h                |  43 +++
>  drivers/accel/neutron/neutron_mailbox.c            |  47 +++
>  drivers/accel/neutron/neutron_mailbox.h            |  42 +++
>  drivers/gpu/drm/drm_gem_dma_helper.c               |   6 +-
>  include/drm/drm_gem_dma_helper.h                   |   3 +
>  include/uapi/drm/neutron_accel.h                   | 130 +++++++
>  25 files changed, 1801 insertions(+), 3 deletions(-)
> ---
> base-commit: 6716101ae42949e98ad4b9e71eeba08c055be410
> change-id: 20260226-neutron-c435e39d167f
>
> Best regards,
> --
> Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
>

