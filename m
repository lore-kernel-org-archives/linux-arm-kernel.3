Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A22A1FEA82F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 08:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g0KgYtYkqUP59BqGGG61EV18AeUer+TehEbvZYdIpWI=; b=f9BvEJRYf8lEiLqiJuEwXe0SHC
	CXw4jh8ingqZ3/krTXHlrgtZkX1kjyzlu+6y/NL1Egr9nWhjY4+7YK767uVkx3LMdyftkTRIA/TDF
	DcIrVC4ATCC0kxtydcvkUZ7fiNoXHsCowZjf4HPSfjVTnWOscFXKa6aYgCnZfwWfJqPHU7Ts5n8YW
	mLjwthm0HIflOHxj0cKQThrGAwf+fZkX1UplsZhacmVdXJGRUOtQlzqdHk3kFtjDDDGuCBgak0CvM
	EaTUUDmjjarbUGjCN3RZUlp9Ge+bHa/Ua9MMhTkznuKGxWwGgVjjGWTDZPB7yhNUxjjHYnfNpurkp
	etvaCDCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5JIV-00000002uiS-2JCX;
	Wed, 25 Mar 2026 08:09:03 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5JIS-00000002ugY-35jL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 08:09:02 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-5a13e1cfa45so5677986e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 01:09:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774426139; cv=none;
        d=google.com; s=arc-20240605;
        b=hHLsxo/kjwVNkzZ+BKkeqDHVS+hV4Dhr50vLZcdK1dVGVWBg0s+aqqnX+A7Ek7gx0+
         kYj4L7MBVZvcMqUaRCckLEMdTLNM+UeW/JdiMEBmTL5+BnirXmktME81eoLrUqTib9pz
         ouxswnUoM6hJLyzwuBZctwgvUXny+OK5Ei1hxGU9DQdyDVgrEuNYfVLkwe7AkgCY3AK3
         tHG7Q0GqSv2oXxEZgmxWeTPBVz3uX1VvEzBkLae0HywZi2sp/QRo9LlJdslI1g92AMLp
         gzo/fT54uG+wQhJhFRQM/CfdVd2Q13KSdsMlOs30UNrezEX9C6qwBv7S6AU3usYMlsyZ
         bWlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g0KgYtYkqUP59BqGGG61EV18AeUer+TehEbvZYdIpWI=;
        fh=n50wVdJU1lZO6hRn54rJh85uGLXE6WiNR7jDjGFPVrM=;
        b=Vb7QxBsUp4fvSZA1V+P5PkwO1em9XnaLWIquQ6pY59kRBI0Jbl7Egmlr3CKCQGzWzM
         27E8u7Z9Z6S9KKoQNvyUr/+aoXhOoICuoeCRr9EQ7MerIz9kxq8+Swam8dloXjt6ZmX2
         zNMS98DKwvoht25j0fhQK60DxhHUQ6q9CIlnDh85+aPBM1ktxc9IGU70zTKpKOJqtizI
         L0+juRMrjxa8Anb+xrGsWNkXG1UKf25zdcjWYIPw2+QFVzYWlORYAWDZiiIoV4PzdYP+
         1wnZfuGkvnTOjFJGMlyVxUxoOk7aUFhEDHlnPtT49zZ0x+Yd6MJydBaN9BYUhnFtTT8V
         bh/A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774426139; x=1775030939; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g0KgYtYkqUP59BqGGG61EV18AeUer+TehEbvZYdIpWI=;
        b=OjTS8k//u/A6R/sLDP7hUHvyue0hUDcZKzQqXfNRUbqCh5OPf5WN+1czmdZvzqgHXp
         BXRNXFcNtg9rMdcRlzae+eDad26Vi46Uw3WY/31EOWhjqo4Dy+wNM2Gj092PluhhlG7g
         NPuNBWENBMcVE6vVdEQUiBaK4J2kLuf1Pd8c4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774426139; x=1775030939;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g0KgYtYkqUP59BqGGG61EV18AeUer+TehEbvZYdIpWI=;
        b=aTNdGvOopjKQptEi/LYYK6cXygfpg3xN9RMb3VIc3VQ3GI1lYEYomyrhWTUsbEcCXk
         GqhMFRsdeHAJBH9Gs5RVUcNZBHC52Xdl6BMIXKecKu1Kecw9Mi+Io7hVCJ4L+KFXfn3H
         EXgLk7shMd2apNfwhpprpbsa7L7NFlmZDsayprFZ10dmMKnxCpkndQMry3qyF1+lKapE
         g2km6VgGTlxm0/R7zB17OrhW9Dm3BfGjGYogWrIrBN9vAKqe2auRr7wgraoldnFqCrSI
         TW4GqBriXmZqkdK71V9J/QSby0vzOe2N+odP4m/tRy2goEaXwNPB+8P3/RgWeXjNFdLB
         4EHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsf5Yk1NgWcMZKPciDZl0zae26p35+GQTH97OVFSDtHbJRGtvn75LZyVnA4W4rgwY5Sh20uSY8BUTeL/nhy4Ko@lists.infradead.org
X-Gm-Message-State: AOJu0YzemyA6rymiPdeF63a/u/1mOHtxmLFiaclIv9vuuQJxPb0NDLEi
	2X7gau2OWIQmtBHKyNKVFSRShp8er5qOeSNz/ry5Ky4fomxp4bWBjGoIl/M2VoI4USc6eq6ADTv
	Kpgpeim69aezEVXUPkAipmRl7GmPt832Wx6DhBzef
X-Gm-Gg: ATEYQzxLhilYd3z1zIEIDD1iALn2wNuLz48/fETsXIzjEsQd+5ebBmErkboffBk3RH9
	oLco2HZThFZvqTjThKHA1eBk5ExAKgsm4ig/R2GX/ZnrCYI3LauFnEiec9oC2LA8ImcZZ2L4iTC
	Kd8t7RaBM4nRiwUQk+7SNCNI0NRNwIVo/g8UUZN9bkzWMs+0TdzG3pesFgG9Bn33p+O8H6gufUw
	+nV8XqQ/I73j3UNlkqQUgwVd1n5vEo7MWuTB3JunhF/9PSuSs2lek5KbJk1zSiLqEYgLOIQB2H3
	lYcwKEXbaZTKN0UhLPS9XGmQgaQLsDVszMlC
X-Received: by 2002:a05:6512:2206:b0:5a2:7ddd:ec16 with SMTP id
 2adb3069b0e04-5a29b99baa7mr981433e87.40.1774426138566; Wed, 25 Mar 2026
 01:08:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260325071951.544031-1-wenst@chromium.org> <93c1d325461cc0ffad890d64870de680506338c4.camel@icenowy.me>
In-Reply-To: <93c1d325461cc0ffad890d64870de680506338c4.camel@icenowy.me>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 25 Mar 2026 16:08:47 +0800
X-Gm-Features: AQROBzAcEDSwfaWS447vAKoAeNwXBwZATTBP1wT6QXTz02f-QcFivNXEvPY79i4
Message-ID: <CAGXv+5FL2rs35V4F0bwq-a4ccvFaWKcr1cuKxT6sfTj9h+d6iA@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] powervr: MT8173 GPU support
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_010900_809987_90D1457E 
X-CRM114-Status: GOOD (  38.61  )
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

On Wed, Mar 25, 2026 at 4:04=E2=80=AFPM Icenowy Zheng <uwu@icenowy.me> wrot=
e:
>
> =E5=9C=A8 2026-03-25=E4=B8=89=E7=9A=84 15:19 +0800=EF=BC=8CChen-Yu Tsai=
=E5=86=99=E9=81=93=EF=BC=9A
> > Hi everyone,
> >
> > This is v2 of my MT8173 PowerVR GPU support series.
> >
> > Changes since v1:
> > - Adapted to changed DT bindings
> > - Dropped driver change
> > - Use same power domain for "a" and "b" GPU power domains
> >
> > This update was requested by Icenowy.
> >
> >
> > This series enables the PowerVR GPU found in the MT8173 SoC, found in
> > some Chromebooks.
> >
> > This version is different from the initial powervr driver submission
> > [1]
> > in that it splits out the GPU glue layer support out of the powervr
> > driver and into a separate clock and power domain driver. The glue
> > code
> > is otherwise the same, and also the same as found in the ChromeOS
> > kernels, with some extra comments and macro names added where
> > possible.
> >
> > Patch 1 adds a binding for the glue layer, called mfgtop. The glue
> > layer
> > contains clock and power controls for the GPU.
> >
> > Patch 2 adds a driver for the glue layer.
> >
> > Patch 3 adds an entry for the MT8173 GPU and 6XT series to the
> > PowerVR
> > binding.
> >
> > Patch 4 adds an entry for the PowerVR 6XT series GPU to the driver.
> >
> > Patch 5 corrects the clock for the GPU (called MFG) power domain.
> >
> > Patch 6 adds device nodes for the GPU and glue layer to the MT8173
> > dtsi
> > file.
> >
> > Patch 2 and 6 depend on patch 1 to build. I suppose some common
> > immutable tree would be needed from the MediaTek maintainers.
> >
> > The kernel driver successfully probes the hardware and loads the
> > "rogue_4.40.2.51_v1.fw" firmware provided by Imagination Technologies
> > [2].
> > Userspace was tested with Mesa 24.0.8 from Debian Trixie rebuilt with
> > the powervr vulkan driver enabled. `vulkaninfo` gives some
> > information
> > about the GPU (attached at the end), but running the `triangle`
> > example
> > from the Sascha Willems demos [3] with -DUSE_D2D_WSI=3DON as
> > recommended [4]
> > failed with:
> >
> >     Can't find a display and a display mode!
>
> I think when using D2D the demos want width and height to be explicitly
> specified, otherwise it seems to hardcode 1280x720.
>
> If you're using an elm, could you try to add `-w 1920 -h 1080` or for
> hana `-w 1366 -h 768` ?

I only did the basic `vulkaninfo` test this time around. To do anything
interesting probably requires the Mesa 26.1 release.

    PVR_I_WANT_A_BROKEN_VULKAN_DRIVER=3D1 \
        vkmark --winsys kms -D b81f54f8568deb0fb70a6a1ed845b65d

just reports "Error: Device specified by uuid is not available"

This is with Mesa 26.0.2 packages from Debian testing. At least now
have the powervr vulkan driver enabled by default, so I don't have
to rebuild the packages again.


ChenYu

> Thanks
> Icenowy
>
> >
> > Same program worked correctly on a BeaglePlay and displayed a color
> > gradient triangle. Not sure what went wrong here.
> >
> > Anyway, please have a look and test.
> >
> >
> > Thanks
> > ChenYu
> >
> > [1]
> > https://lore.kernel.org/dri-devel/20220815165156.118212-2-sarah.walker@=
imgtec.com/
> > [2]
> > https://gitlab.freedesktop.org/imagination/linux-firmware/-/tree/powerv=
r
> > [3] https://github.com/SaschaWillems/Vulkan
> > [4]
> > https://lore.kernel.org/dri-devel/f2b2671e-5acc-4dec-9c2e-3c9cd2e1f19e@=
imgtec.com/
> >
> > Chen-Yu Tsai (5):
> >   dt-bindings: clock: mediatek: Add mt8173 mfgtop
> >   clk: mediatek: Add mt8173-mfgtop driver
> >   dt-bindings: gpu: powervr-rogue: Add MediaTek MT8173 GPU
> >   arm64: dts: mediatek: mt8173: Fix MFG_ASYNC power domain clock
> >   arm64: dts: mediatek: mt8173: Add GPU device nodes
> >
> >  .../clock/mediatek,mt8173-mfgtop.yaml         |  70 +++++
> >  .../bindings/gpu/img,powervr-rogue.yaml       |   1 +
> >  arch/arm64/boot/dts/mediatek/mt8173.dtsi      |  33 ++-
> >  drivers/clk/mediatek/Kconfig                  |   9 +
> >  drivers/clk/mediatek/Makefile                 |   1 +
> >  drivers/clk/mediatek/clk-mt8173-mfgtop.c      | 243
> > ++++++++++++++++++
> >  include/dt-bindings/clock/mt8173-clk.h        |   7 +
> >  7 files changed, 363 insertions(+), 1 deletion(-)
> >  create mode 100644
> > Documentation/devicetree/bindings/clock/mediatek,mt8173-mfgtop.yaml
> >  create mode 100644 drivers/clk/mediatek/clk-mt8173-mfgtop.c

