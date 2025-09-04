Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0514CA1017
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 02:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VQWcOYSvoGf6CKIlQ65uFWfm+cKJc0xdhOAmhKddvzI=; b=otwAk8HfE5EQw2ncAV1kroJAY3
	YDh0dq/kCKJAr+GK4xAm67ZPMSW36osyp9nFWSN1HW9VKPD0946KjqKqkIxMBkOl3DhTPcTqv1Ls8
	B4k+AFnxsaL9MlfoSiqxH8OWf6AeE4TP9mkN6d0fOzbiAW2ZC8ToQqvaNAmIHpoFManmg8B8SRt2v
	UDgylAfJw1yT76QLTPLxJqd4KAS1xwLXpeTvuru9WX46o2GBOT/zIwZbX5o6Dr/RUa0bgd8ekOer9
	5Ro5XO6F4Ks3Ca8xafK928ue9ViYN+k3vJmgYU0yAz5sXt2X2uroENzpn0XRBFahfFg/1HKW/7hgg
	H7LHe1ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM6Y-0000000G5ey-1pFu;
	Fri, 05 Sep 2025 02:23:10 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuJE5-0000000F6CR-3reS;
	Thu, 04 Sep 2025 23:18:47 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-e970e624b7cso2389684276.0;
        Thu, 04 Sep 2025 16:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757027925; x=1757632725; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VQWcOYSvoGf6CKIlQ65uFWfm+cKJc0xdhOAmhKddvzI=;
        b=j9/QvcgEINcCDCOwRD2W5TOedO38NR29A2rq/m0HUVbjnF/n4j7Qp+4KB8/VEiwTms
         fP2CN0OUw5AvIz1CKRlhYmBkHUrsFZCsOdq0Rzln20iPmtzTR6M7xtju0EXK7LI+CIrv
         3najVgxqnV+dpLWvJmyaYx8291PKyMc9VAtyXnPnd5fpxBO+hdpusE+6+a184J9Socb3
         PdKu0KeqCfJN5YglEBddXQMxET6S2eWxPxLrf0b7ssbrMoGh/V8YWA6H+4oNVHE9Q9F0
         UZsHH80dBGSg50LoFUC+hrb1cKJsgkYY+l7x5kOdabjnXTEnd27Njk6bkYgXSxUfX0ny
         BVhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757027925; x=1757632725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VQWcOYSvoGf6CKIlQ65uFWfm+cKJc0xdhOAmhKddvzI=;
        b=cQbDi+0uXTWLKbjcg6+JbXJuzq+t4KjdFJmKMqScoHm07tcL3E87nnMaejNyaDCAK6
         kfdrnNRTfKDQWTcsWTABxkrpdjMLzlVDr/pp69R7vCx0oWD1J8WSc5a/6OhYaQD/0dM5
         fBI+KxmokIQMjMVqORGQ/kV5WGJNnGkp/H926gf6sXJvf4DMkHPfdhU7LUMf/4WKCJqf
         O/EhEaOO07cbHO43L2yCAbx8GWyojhLBEe5T8kgly1r4MT1lwPgggLtsKWKCLKvfMwMQ
         MijKMc4BB7ManDzJrYs0rZ1gi+bdh2RlHWtfvNbMAfuHcqu5jiEVTZ64HCGYo6vzCpRO
         TPkg==
X-Forwarded-Encrypted: i=1; AJvYcCUbBtjUjCCQ1H0F1AmPE+2jHg8zYYpNSCqcODoZVgmvtu0t6+ZzheoSyxYtRi91WnaeUayguyEVgjcniDbHbX/n@lists.infradead.org, AJvYcCV5BL9CHPHmy2CAphIFApsRgZqdTd/dNV3zNLw6DxVWQ7ETghPHr4OEOCE4K8eYkWhvf2xQs7MusA68CqEYjjw=@lists.infradead.org
X-Gm-Message-State: AOJu0YwlHvC7ppDOgG7LPqtaWjqsxSmC5omdblyq2jvrQgUTLnJ3pgxr
	QTPVF9r58s7+DJF/WvXfJ8GqjrYhDWmrXI8gjXr2jvl2L0CQApszEuR5zDs7Vd8GJN5coSq99YK
	umhdVQ5xMOwTycH0Pm6eRDc7Lrp2+s3I=
X-Gm-Gg: ASbGncsk2aKA5d0PG/Yt+oNyJg8HaDds6+Bx/eCv9Cef815gK9aDRBKqZOn2codPKIa
	ppepKbUX/lIWkOUI62c9N1c/dc2liaP1EWZegYkb5f9vfobomtcbJ4+zBYyphuobEz1sZGcg5vN
	cFno/hAlIesZGIpCNXV+tjHchSGIDrI1sN4GTQ9VdB4ODWWw2wtPGkUegYHB6l9XLDRez096pfS
	w2sklptnXshVll1A3ps4Qi36aSsil5NCx7UiF4U1RODFR0wWblueOXXrBj5EWcy7IxCNCT1
X-Google-Smtp-Source: AGHT+IHQpd6ZtxKh9UtLqej1FEwyk9wicyHA+rk6YLUxpDSr/eJRGonEqV6c9kpMfG14F2QX3PUE82AqC4KP582Ijug=
X-Received: by 2002:a05:690e:682:b0:605:8820:1400 with SMTP id
 956f58d0204a3-60b6663acb9mr1153046d50.6.1757027924783; Thu, 04 Sep 2025
 16:18:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250903225504.542268-1-olvaffe@gmail.com> <5820885.GXAFRqVoOG@workhorse>
In-Reply-To: <5820885.GXAFRqVoOG@workhorse>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Thu, 4 Sep 2025 16:18:34 -0700
X-Gm-Features: Ac12FXxTh1_T9lA63L4EOYeuqGn1KZXof6RHOWwp-aPirUkUxtnZTJ9xkSu8gmQ
Message-ID: <CAPaKu7RpgQiomxSWp8V=8S9QJxapcNNWquLU5XE+_jpzOue44A@mail.gmail.com>
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
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_161845_960885_DC802ABC 
X-CRM114-Status: GOOD (  40.08  )
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

On Thu, Sep 4, 2025 at 4:20=E2=80=AFAM Nicolas Frattaroli
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
That's very true :)

>
> My solution adds a small mailbox driver for the GPUEB, and also adds
> a new module that lives in the panthor tree and registers itself with
> panthor's devfreq stuff to be a "devfreq provider". The motivation
> for making it devfreq instead of a clock+regulator provider is that
> the GPUEB seems to have several quite devfreq-like parts to it that
> I am not yet using, namely setting a job completion target time and
> several methods of limiting performance.
Yeah, gpueb can do dvfs autonomously which is more similar to how
desktop gpus handle dvfs.  We have yet to verify that on our devices.
I also tend to trust devfreq more, but that might be partly because it
is very hard to navigate through the downstream drivers.

Look forward to seeing what you got!

>
> As it stands it can set the OPP, but boosting above 1.43 GHz does
> not seem to stick. The boosting stuff may be done by the four or
> five other ways it has to set some frequency target.
>
> I'm hoping I can send this in maybe next week or the week after. If
> things remain blocked by then it'll be compile-tested in its current
> form only and lack some clock stuff.
>
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

