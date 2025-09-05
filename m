Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67410CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 03:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z7VEF8fsQ16/5eguTcUya9i8sN0CVWScInMAqvxe2C0=; b=VpmsDnK8pe0oqW3G3XHypgRk2l
	gldnlNTXgWRqFZjORFH2fuROFUPRY/xXXS4de4JFYaSBmpv37wchzWufnIboXnrSAeDWflRxUgkFB
	2ea4gqLJkQmFLSuUYyg5DOWPz9CGWr8cOWc5ByXiiMw7CobhoQXyX7h8LwJYG4NLGlVEVuAl6JWkt
	c6ddDWcK4MBxgu4JadE2OEm/z9wYHspcQTO9dibPgrdKVei89u24NMPCA3ifaDwIMMojHq5btIpR6
	UvMCJQyyvSvqueGyt1BJCbs0ewI1W2cEt8Al0ThsBbxWfhfh1O4hVBbCDLh8bcjuUdrh5LXh52O5D
	57ChsMhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuNbN-0000000GaKI-0Qg1;
	Fri, 05 Sep 2025 03:59:05 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuMo9-0000000GLxd-0ldX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 03:08:14 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-336cee72f40so15166541fa.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Sep 2025 20:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757041691; x=1757646491; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z7VEF8fsQ16/5eguTcUya9i8sN0CVWScInMAqvxe2C0=;
        b=oSuueN3Kl/0r92iVpQaojBArPREvzMAjKpj/VvM43cT7MiK9q7ATzeN+u6UxOLttff
         Heh7UvipxyInhc28TJ/4ghWrjyPiJKQOCLyFi0w/JC7pp82580nwCBQmwaBxKqHX+pBF
         pYUqCBK2QFJDm3iBfbTNFajSY06tUCSK2dU5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757041691; x=1757646491;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z7VEF8fsQ16/5eguTcUya9i8sN0CVWScInMAqvxe2C0=;
        b=pAggpfr70BqYv2ib62ZaKX4uFQkxHwEDlg2bwiRWPIzDI76F8czpmdbK1Ni4RmrBz6
         tLvS1qxEw/XNKt0FdglcCMCSJu2K1YZdwNejeZlPbkBHeAiwIUFsXKvlT/WCOICF1bhJ
         7CarPejlqmSZjzENsm9ALDCbkoJ3ognylqNOdjkKtH+xAKRLsdZy3Vu5mAhGwgKw7JsZ
         dZgHomYqCjnoMbFQV6j52TGpD1dL/f7jQqQcsBPyc3oagMyisEo14QMvTYzzRMaogKbW
         VVDbXzlK6DgYQSBOajTTnGYHcdB06l5zdE3TTgx6B+qVWkLxOxtJQdc+twIXXidAgBJR
         GEsw==
X-Forwarded-Encrypted: i=1; AJvYcCVCVzCjTrM4MIqL2yNoEiSkX6pP/GNS4ZXxRYLOpJzv7HIisiThBs87RJ6vOhMNYqvJ2pDTqaET6v1VeLtJk803@lists.infradead.org
X-Gm-Message-State: AOJu0YzGL6v7HjlfFtQHPzjNIE6aI8FhTsIwMybqow8WN1MZ9xioca0H
	GIUGbacMBK+2QJrddwm2XDGDQBtAi2jbaZaSOQgEZWAZaMDQ4/RWySNIxNhWQkYVS2AVLvgjNX1
	7jEw/WjuLaar3+tf+VokM71xCzAUyJRmQXb49tFu9
X-Gm-Gg: ASbGncvh4H51F57UcGCpLm+5zwPvf/A7BBhZu7/L6IOnnVgXb4zx7eQC/JI12+jYhZl
	7Pae3Z0sr0se7b9uXYmbTIzCknkk09eMgDwyufsnqx3oIyTZtzXF6V0j8Ih3ZqojQQK5MTgk0wY
	ix6Cmo4Dr1nE70JhfZcHXawdUpPBPT8MImwFmU/p0XwOBczYfvtFLM7hYWk+tFeXkYBD5VPa4CU
	b7JcGQBzzU8HwXPsLsmIw6xQePhTMIMvxDsHel9cgVWYki1
X-Google-Smtp-Source: AGHT+IGldyHuDYkPWivf90sba85mlu8jLhfEVWhM+CRAtZ5kcPdD6IcKM+CLluf3aDGmO4+qEneV9QzpuYa7Bir4LF8=
X-Received: by 2002:a05:651c:1107:10b0:338:5ec:1dda with SMTP id
 38308e7fff4ca-33805ec1e2cmr23475841fa.9.1757041691297; Thu, 04 Sep 2025
 20:08:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250903225504.542268-1-olvaffe@gmail.com> <5820885.GXAFRqVoOG@workhorse>
In-Reply-To: <5820885.GXAFRqVoOG@workhorse>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 5 Sep 2025 11:08:00 +0800
X-Gm-Features: Ac12FXw182raft1JJYOZIoO33KVRrFPcguj33C1FCebFdDsYEFHlJ4j0UxQM7o4
Message-ID: <CAGXv+5EbEDG3sZjo9BDv_8-HhLNNTH4DLZ3ibvdcsULXgkzjYg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] drm/panthor: initial mt8196 support
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, Steven Price <steven.price@arm.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Chia-I Wu <olvaffe@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_200813_258012_4FE60315 
X-CRM114-Status: GOOD (  40.21  )
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

On Thu, Sep 4, 2025 at 7:20=E2=80=AFPM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> Hi,
>
> On Thursday, 4 September 2025 00:55:02 Central European Summer Time Chia-=
I Wu wrote:
> > MediaTek MT8196 has Mali-G925-Immortalis, for which panthor gained
> > support recently. But the soc also requires custom ASN hash to be
> > enabled. This series introduces panthor_soc_data for per-soc data and
> > uses it to enable custom ASN hash on MT8196.
> >
> > The clk/regulator provider on MT8196 is GPUEB, whose driver[1] needs to
> > be cleaned up and upstreamed separately.
>
> I'm currently working on this, I'm at a functional 800 LoC driver vs the
> more than 30k LoC of the downstream... thing. I intend to send it in as
> an RFC once the clock stuff lands, and I get some responses wrt to
> figuring out what's still missing from linux-next aside from the DT to
> get basic boot working so that I don't send in something that I
> accidentally shredded during a rebase without noticing.
>
> Cleaning up the downstream driver is a fool's errand, it's like 6?
> separate drivers, with lots of global state (and no locking), without
> using the common clock framework, and relying on abusing -supply DT
> properties to force a certain probe order to make all the race
> conditions it would otherwise have turn out fine. A lot of it is
> code that seems dead, or wrappers wrapping wrappers that have nothing
> to do with how the hardware actually works.
>
> My solution adds a small mailbox driver for the GPUEB, and also adds
> a new module that lives in the panthor tree and registers itself with
> panthor's devfreq stuff to be a "devfreq provider". The motivation
> for making it devfreq instead of a clock+regulator provider is that
> the GPUEB seems to have several quite devfreq-like parts to it that
> I am not yet using, namely setting a job completion target time and
> several methods of limiting performance.
>
> As it stands it can set the OPP, but boosting above 1.43 GHz does
> not seem to stick. The boosting stuff may be done by the four or
> five other ways it has to set some frequency target.
>
> I'm hoping I can send this in maybe next week or the week after. If
> things remain blocked by then it'll be compile-tested in its current
> form only and lack some clock stuff.

I suggest posting them when you think they are ready, and not wait for
the clk patches to land. The review is going a bit slower than I expected
and Stephen usually just picks up the patches towards the end of the
cycles anyway.

ChenYu

> Kind regards,
> Nicolas Frattaroli
>
> >
> > This initial support also lacks support for some hw configs. On some
> > configs, panthor is expected to query a mask from efuse to mask out
> > unavailable shader cores from ptdev->gpu_info.shader_present. This
> > requires extending panthor_soc_data with a callback to read the mask.
> >
> > This is an RFC because the dependent drivers are not ready yet. But I
> > would like to gather opinions on having panthor_soc_data for
> > soc-specific data and having CONFIG_DRM_PANTHOR_SOC_MT8196 for
> > soc-specific code.
> >
> > [1] https://gitlab.freedesktop.org/olv/kernel/-/commit/170d5fc90f817dc9=
0bde54b32872c59cf5c77779
> >
> > Chia-I Wu (2):
> >   dt-bindings: gpu: mali-valhall-csf: add MediaTek MT8196 compatible
> >   drm/panthor: add initial mt8196 support
> >
> >  .../bindings/gpu/arm,mali-valhall-csf.yaml    |  1 +
> >  drivers/gpu/drm/panthor/Kconfig               |  6 +++++
> >  drivers/gpu/drm/panthor/Makefile              |  2 ++
> >  drivers/gpu/drm/panthor/panthor_device.c      |  2 ++
> >  drivers/gpu/drm/panthor/panthor_device.h      |  4 +++
> >  drivers/gpu/drm/panthor/panthor_drv.c         |  4 +++
> >  drivers/gpu/drm/panthor/panthor_gpu.c         | 26 ++++++++++++++++++-
> >  drivers/gpu/drm/panthor/panthor_regs.h        |  4 +++
> >  drivers/gpu/drm/panthor/panthor_soc.h         | 26 +++++++++++++++++++
> >  drivers/gpu/drm/panthor/panthor_soc_mt8196.c  |  9 +++++++
> >  10 files changed, 83 insertions(+), 1 deletion(-)
> >  create mode 100644 drivers/gpu/drm/panthor/panthor_soc.h
> >  create mode 100644 drivers/gpu/drm/panthor/panthor_soc_mt8196.c
> >
> >
>
>
>
>

