Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6F65C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 09:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wWaTnxgDJ26OAjNMq/hUinGBTzq0pRUQFrKLwWlGdH8=; b=ul5UEI4Zxn8aAaUIrMTkZZKsk5
	48ITshBkd+6nyvSk7MGAHyCHPUy+prK79TQ6YbFNXIaRdCjf0FR2wgJ3kMBdSjAljIi20GmY80uP/
	CsTfMKnKRw2u/0/XTR6vuh6FRuA6rjoNpF6c1+W0QWdvi2faeFmmDPVMnqX/2edNyFzkPdUilcKyC
	Ju6//RI/cwDIlcFG0o3WgRhJmxUw3ZauzqahEaxTt4ZW3pwUEKgHj2/g9f4tDbWKRyYMJ1G8Zthck
	T4KIVlXw+P4NZ1o/DAs8eCeSVn5yjv6Uehp6Lp3n5c194i/wXDtwAtbGa6RnlOHuXFjWFhEyjHlFy
	JcMaU1rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFVDN-00000000DEa-2KoQ;
	Thu, 15 May 2025 09:49:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFTz7-0000000HYrC-3FJa
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 15 May 2025 08:30:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=wWaTnxgDJ26OAjNMq/hUinGBTzq0pRUQFrKLwWlGdH8=; b=pheGqvmlkvk1EjK9hHhixjzvtK
	f027uv1y9OJoAn517UlLHqgLFXN0BYOx5o0oIy8jTGsJK6aE/FGil2abzJwTCc5GEKrEW1gsGIOdB
	hq+nueJcRFM/pU36cShmSTukIsFxBncyZrQVTAhgeAH1oFHeRwuT56UAXl5B+8T0G9ZCZyssXq0cv
	ZqX6B1n/RPY2Sy7h7TgTuDnYbrHVgKxM/71jWur5PuOxhvPjj/axbC/D+vBd1Kkj29W8Ye/nHjOck
	4MfMDBmej5+Nv5Qb9U+nL7ZHh7rCfZV+MrSC48JXhXwlMrkUgh4PEhR/dM7vX0JSOf1L5832vvJoS
	iDV5xqbw==;
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uFTz2-0000000HNsO-3tgP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 08:30:31 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-7091d7244e8so6628907b3.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 May 2025 01:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1747297826; x=1747902626; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wWaTnxgDJ26OAjNMq/hUinGBTzq0pRUQFrKLwWlGdH8=;
        b=YJFjzJrQsg422Qg/7AGZ9uE/fPiMngXG9tFo313yqRMwXSDGMO9wcC5vswQjxr4Yf9
         TTFSyQKxZMZULUZgCVr3jECQlcMUXxmvZs66tCJMVcD+W/PYUJ5LbL9cEfs1jfj8ba8g
         BHnRBzWp3TZ+7cbHaRe9uni2Ju41YY4SatB6SdSWRpGnoB6pl8mxNRxdbzSJd0JQyy0c
         tGYrCK143+4FT6lsl84r8lsREa6igM67tPXWQe0+oku45OKh/7lsl5IvdOjbtWmDbJAB
         hp7IUy6piTdvyymsVWhc/63PiakMP2rCjlgVT9A8tLyV4sqYUZ7h+MWX6QvhfumTJQgC
         FfUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747297826; x=1747902626;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wWaTnxgDJ26OAjNMq/hUinGBTzq0pRUQFrKLwWlGdH8=;
        b=eHT63sm8ADih6Whmox+qN070Dtuuxw2TNeUaVc7FGIzhCuHdmiL6+xiCe4HdLW3qWu
         awQn2Nu1RCak33reBLX5NySHgb2BnQsOo5vLKDrMnNVBkI6TJE8XAnDt1aNL/HLpDzK6
         4WvRm/Nld/7gWxIB+dlSGRpd9/n/7KbwGXXC7l8IzfxtatFCvLo5G+GxuXOeNE+9G67S
         5I7RzHzvUeYKCjHKSN9G5xjXQlH0HaqevbatnoYtGnCxc+B/kYu2Mq1UVMNJko5OdlGD
         jsCQPSScNyWY9yQ+6w0ZcwbP8NI+aMqAhorBl4hn5FLpo+xNaUauI2xEZ/IOZe0CN/1B
         AlTg==
X-Forwarded-Encrypted: i=1; AJvYcCUSEYSuLXPKuNw/F/wowR08uCcgwidJWOJg9sKpIrb6AMq+j77LEnT+vdt5EH9N3KqP8WWMX79ic+Y/0K6w5r+t@lists.infradead.org
X-Gm-Message-State: AOJu0YyinLPEnqhEzFTyfH7KP0nSKgVSBOo52pxOAweByuztdbinUIx1
	AnXtlFtcGuFa5uTMdBJnjXppGVLupsxOds/G0vz4vYo7RLHLBoW7Z+Sec+RwUmyULsTD0hzqttG
	Irhc=
X-Gm-Gg: ASbGncuCPCZgn1ckLArqXkOKgUl8/aLEOoU9n6zNOdjgrQDp7tysisPLXbn9DqqxHjd
	JeT5zXJaq46fWjl3jAhiNz5OHoNCkYSSJr3qjkKk+pbS6PBGcriSH7RSU8abcd3CKABIS2EaCMQ
	HaN+tTniV/TKv+jEK+8hRqfw8W2fvj04nekMt54o5+VpuiJCJXTQoTP3m8iP88DO9TQwDPcJA6z
	4zlUxbWirTIgduCpTOEBRyiY1+Uoo5i5cR1T40d1mtXxLtXfS9OS3axNERWpiKas6uof/KfmAZR
	koD4jogMIt3SgXYQ5zUoNuLb5XOPAvNVRYs+bPfgmjWovlCJ7FQ+8FsdzuZCl2nAYQZy4abFfJb
	ln33XmzEJcnMg8CTC/Jk=
X-Google-Smtp-Source: AGHT+IEufG2Wtbfo7lQN6N8SNqu5gRVaNiM7KcuQUoiCvfDOZyJ+zp71kYbZoCfUBg7DptROf8Mjzg==
X-Received: by 2002:a05:690c:48c4:b0:702:52fb:462d with SMTP id 00721157ae682-70c947681c1mr21002057b3.29.1747297825912;
        Thu, 15 May 2025 01:30:25 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-70b7c0ca208sm12647817b3.62.2025.05.15.01.30.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 01:30:25 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e733a6ff491so637574276.2;
        Thu, 15 May 2025 01:30:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUOYpHxXMWI3xoZmlGTDiUc62CHf2NQ1cd0+1zkZZunj9KdtnMwpYlO5mPsRqfxIN/nQEauzMtmU7TKs5LAFTmx@lists.infradead.org, AJvYcCUrxw++4pUWr86guRVZBmYoLAH5y/7V240HaPJ5YEDzicxFSd8d2jr1Xa+s3AA0ZEmO/k7o0finHLbdkyxf/zY=@lists.infradead.org
X-Received: by 2002:a05:6902:2611:b0:e75:bf29:8b12 with SMTP id
 3f1490d57ef6-e7b543312fdmr1406612276.29.1747297825420; Thu, 15 May 2025
 01:30:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250225-6-10-rocket-v2-0-d4dbcfafc141@tomeuvizoso.net>
 <14333638.uLZWGnKmhe@workhorse> <CAAObsKAkMhgQsi6hLjbfS5wDaUz-hPQiZn7dVvn+6kDv0_jo9Q@mail.gmail.com>
 <3628015.iIbC2pHGDl@workhorse>
In-Reply-To: <3628015.iIbC2pHGDl@workhorse>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Thu, 15 May 2025 10:30:14 +0200
X-Gmail-Original-Message-ID: <CAAObsKDYpDt15NePk7DZbfwXnn5uaJxCu-pwZd-+PDEi56C73A@mail.gmail.com>
X-Gm-Features: AX0GCFvte7AOvqPUYkPmGZ9uTpeqDK9f7fAooBtsXUmTMNrN8H6cLu-3Yl2rRvk
Message-ID: <CAAObsKDYpDt15NePk7DZbfwXnn5uaJxCu-pwZd-+PDEi56C73A@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] dt-bindings: npu: rockchip,rknn: Add bindings
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Oded Gabbay <ogabbay@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Jeffrey Hugo <quic_jhugo@quicinc.com>, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_093029_511241_CBE243C8 
X-CRM114-Status: GOOD (  68.24  )
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

On Wed, May 14, 2025 at 7:50=E2=80=AFPM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> On Wednesday, 14 May 2025 17:18:22 Central European Summer Time Tomeu Viz=
oso wrote:
> > Hi Nicolas,
> >
> > Thanks for looking at this. Some thoughts below:
> >
> > On Fri, Apr 25, 2025 at 8:50=E2=80=AFPM Nicolas Frattaroli
> > <nicolas.frattaroli@collabora.com> wrote:
> > >
> > > On Tuesday, 25 February 2025 08:55:47 Central European Summer Time To=
meu Vizoso wrote:
> > > > Add the bindings for the Neural Processing Unit IP from Rockchip.
> > > >
> > > > v2:
> > > > - Adapt to new node structure (one node per core, each with its own
> > > >   IOMMU)
> > > > - Several misc. fixes from Sebastian Reichel
> > > >
> > > > Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> > > > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > > > ---
> > > >  .../bindings/npu/rockchip,rknn-core.yaml           | 152 +++++++++=
++++++++++++
> > > >  1 file changed, 152 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/npu/rockchip,rknn-co=
re.yaml b/Documentation/devicetree/bindings/npu/rockchip,rknn-core.yaml
> > > > new file mode 100644
> > > > index 0000000000000000000000000000000000000000..e8d0afe4a7d1c4f166c=
f13a9f4aa7c1901362a3f
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/npu/rockchip,rknn-core.yaml
> > > > @@ -0,0 +1,152 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/npu/rockchip,rknn-core.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Neural Processing Unit IP from Rockchip
> > > > +
> > > > +maintainers:
> > > > +  - Tomeu Vizoso <tomeu@tomeuvizoso.net>
> > > > +
> > > > +description:
> > > > +  Rockchip IP for accelerating inference of neural networks, based=
 on NVIDIA's
> > > > +  open source NVDLA IP.
> > > > +
> > > > +properties:
> > > > +  $nodename:
> > > > +    pattern: '^npu-core@[a-f0-9]+$'
> > > > +
> > > > +  compatible:
> > > > +    oneOf:
> > > > +      - items:
> > > > +          - enum:
> > > > +              - rockchip,rk3588-rknn-core-top
> > > > +          - const: rockchip,rknn-core-top
> > > > +      - items:
> > > > +          - enum:
> > > > +              - rockchip,rk3588-rknn-core
> > > > +          - const: rockchip,rknn-core
> > > > +
> > > > +  reg:
> > > > +    maxItems: 1
> > >
> > > Hi Tomeu,
> > >
> > > as you probably know, RK3576 has quite a similar NPU. This is why I'm=
 currently
> > > poking at this patch series. One of the differences I ran into was th=
at the
> > > IOMMU of each NPU core now sits within the reg address space range of=
 the core
> > > as described by the single reg item binding and assumed by the driver=
.
> >
> > But this is not a difference, right?
>
> It is. E.g. on RK3588, you use reg =3D <0x0 0xfdab0000 0x0 0x9000>; for
> rknn_core_top, and rknn_mmu_top then sits at 0xfdab9000, which is just
> outside the reg range of the rknn_core_top node. That means acquiring the
> iomem as a resource succeeds for you, whereas for me it fails.

Ah, got it now, thanks.

> >
> > > This seemed weird to me at first, since I would've guessed the cores =
would be
> > > exactly the same, but I noticed that they kind of still are; the RK35=
88's NPU
> > > also has a "hole" between 0x2000 and 0x2fff on each core, which is wh=
ere RK3576
> > > put its IOMMU.
> >
> > So this is the same in both RK3576 and RK3588, right?
>
> Yes, both RK3576 and RK3588 have a hole in the same area. RK3562 also has
> the same hole. RK3568 doesn't have the offsets for the individual parts o=
f
> the NPU in the TRM, making all the relative register offsets the TRM then
> goes on to document completely pointless as it omits what those offsets
> are based on, so we don't know if it has a hole there. I vaguely recall
> that it has the IOMMU either before or past the global range (not sure if
> I wrote these findings down anywhere?), so if it has a hole at 0x2000
> then it's unused like on the RK3588. I don't have access to the RV1106
> Part 2 TRM where the NPU is described, so I don't know whether that has a
> hole there unless we dig into the downstream code.
>
> >
> > > This is some information I gleaned from the RK3588 TRM, specifically =
section
> > > 36.4.1 "Internal Address Mapping", which shows where each "part" of t=
he NPU core
> > > has its address space.
> > >
> > > Right now we just represent this as a single reg item per core. I've =
played
> > > with the idea of splitting this up into the distinct ranges the TRM l=
ists and
> > > giving each a reg-names entry, but this would require a major rework =
of the
> > > driver from what I can tell, including to the auto-generated register=
 header.
> > >
> > > For now, my hack on RK3576 is to just ioremap the range defined by re=
source
> > > start to resource end inside rocket manually if I get -EBUSY trying t=
o ioremap
> > > the resource proper. This is quite an ugly hack though, it means the =
IOMMU node
> > > still has its address overlapping with another node in the DT, and it=
 also means
> > > we have an unavoidable error message printed into the kernel log. Thi=
s is also
> > > what the vendor driver seems to do.
> > >
> > > What do you reckon is a reg setup in the binding that is both reasona=
ble to
> > > implement in the driver while accurately describing the hardware?
> >
> > Guess we could go with some smaller granularity and have 3 register
> > areas per core, instead of 10:
> >
> > - CORE: PC+CNA (0x0000 ~ 0x1fff)
> > - AUX: CORE+DPU+PPU+DDMA+SDMA (0x3000 ~ 0x9fff)
> > - GLOBAL (0xf000 ~ 0xf004)
> >
> > So the IOMMU on all the known SoCs can have its own regmap. I have
> > chosen to call the first one CORE because these are the components
> > that are absolutely needed in any NPU that is oriented towards
> > convolutional networks (convolutions, basically). I have named the
> > second AUX because it contains hardware units that are optional and
> > are used to implement operations that may be common but that aren't as
> > computational expensive as convolutions and thus might be skipped in
> > lower-end versions of the IP.
> >
> > What do you think?
>
> I'm personally fine with this approach. I've floated a two-area approach
> to Sebastian Reichel before who, as far as I can recall, expressed his
> distaste for  it as it seemed like an arbitrary division. I do concur in
> that, it seems very arbitrary, so it's hard to say whether the bindings
> maintainers would let us get away with it if they get wind of it.
> Unfortunately they are Cc'd on this E-Mail, so the cat is out of the bag
> in this regard.

Actually, after thinking a bit more about it I'm leaning towards only
having the PC, CNA and CORE areas in the DT, as those are the only
ones that should be accessible from the CPU.

The registers for the other units should be set by the PC, as it reads
the command stream.

So three register areas that can be set to wherever Rockchip has
placed them, and we just ignore the others in the kernel, as we don't
have any business messing with them ourselves.

What do you think?

Thanks,

Tomeu

> What speaks for the 3 register area split is that anything that brings
> more holes and doubly mapped things into the AUX area is probably going
> to be so radically different it'll ideally have its own binding anyway,
> or needs more than just a compatible added to the binding.
>
> I think as far as arbitrary splits goes, the one you propose is probably
> the one most closely aligned with reality. Certain register areas do
> seem like something they'd never move away from its corresponding
> companion, whereas adding parts to the AUX area or removing from it is
> probably going to be quite common. So it can essentially be treated as
> the area where optional things will most likely land as you pointed out,
> which then don't need more bindings fiddling to add those optional things
> as explicitly named areas in the bindings as long as we treat it as just
> one opaque area s far as the binding is concerned.
>
> Also, unless there's some virtual combined sparse iomem API in the kernel
> that I'm not aware of, that's probably the easiest path forward for the
> driver as well.
>
> >
> > Regards,
> >
> > Tomeu
>
> Kind regards,
> Nicolas Frattaroli
>
> >
> > > The RK3568, which uses a similar NPU design has the IOMMU at an offse=
t of 0xb000
> > > from the core's start of PC, so probably after any core specifics but=
 before the
> > > global registers if I hazard a guess.
> > >
> > > For those without access to the TRM: splitting this up into multiple =
reg items
> > > per core precisely the way the TRM does it would result in no less th=
an 10 reg
> > > items on RK3588, if I count correctly.
> > >
> > > Kind regards,
> > > Nicolas Frattaroli
> > >
> > >
> >
>
>
>
>

