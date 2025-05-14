Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D48F1C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 16:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hDddi59QfQosyfazvmWzWcoS6I1hEYTqzvGT0OXdo3s=; b=q/1rhFSc9wtYtzuiTLFmLW5hov
	S1QEjuUfJRhX1jHLqV1WTOXpTMSVdQhmFt3CPZ5i0pQW0qC7+164uYC2Cs8v+lDmqjbG5cGQhdgij
	E0Cfic18YZ4n4rAtaoZnKaq7VXiDH5jkF5/HPrQaH2UPNWU+TOOXXRjPYt9EvzF2XqJN/ocUpx1OV
	SiW892rVydpjB/KRkEukDLQuV1GJA5zU0R8pSJxJD7MOiW7QsgyUSo0rrdlgR82N2twGnpqrVLOyM
	N1A9To69tPo04XGLPZZ7W3x7iazT6MIfEnR6NAa8YWNj6mP0PwUBh1LZP0Qpu1c8DBZJ23kaiO+NK
	HONpmD2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFEfX-0000000Fgfe-1x3g;
	Wed, 14 May 2025 16:09:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFDsa-0000000FYv2-0v8G
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 14 May 2025 15:18:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=hDddi59QfQosyfazvmWzWcoS6I1hEYTqzvGT0OXdo3s=; b=Y6e4fAE9TqUypcwp1tfLgfL7v7
	2z3hcmRXDuSMRdXd8Kutdkr9S+WiEZQaUDZcZjhymB4FYGa/aRbIfJd1MmV2jCVOQc5VTYYfGVx4g
	q2I507HFNrnYy4unFYjLDOBgmx/eOLUy/gM6Zx9i72ZeFrl2p7iPeZTvXuddVDBmaHcFKzFmWhr7a
	qadgJhG8jF1gD/2nb6Wodjb6lb8HtVwybjfffxC8kKHD5frCyzDXmEd/IcbjyuVCZA7xGX8NPYn8e
	4V/J1qo3SiDRPrkCP4Il1PyrQndybr0Hb5/MtDsQtlRtkIxTAbl8m+u1qC0melrUA+ta1LuGeICl0
	Bj/zRhqQ==;
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uFDsW-0000000HESl-1iPB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 15:18:42 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-70a2970cb70so56857027b3.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 May 2025 08:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1747235917; x=1747840717; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hDddi59QfQosyfazvmWzWcoS6I1hEYTqzvGT0OXdo3s=;
        b=G0QG5HBIf7QJSKrTbGSUvZa2ea4CzI/nDvfQKnFlLK/dMYpJgDWrrbOyzpXGaMLVuV
         9PiHab8cHqhpl/69vEaiA4CfsqYw/n6q+BWw7FHeeWfgZ8doiYJUsHUjpiVtuYcCvDu2
         ZAiFjIkHrvRhQxwfGzMiaU1LHK7RtBzvI+Fsj8F0NFWQcAW5jM/zremoMeFq9Uu2aHwX
         CeXataAAkw4JwBi4Rj4e0DD1PeMKB0Fl4rcqBOa89VQCLRLe+C9ZK0juT+Qo7ldANQro
         0+ZLFWYzrali9yKGBFZemiu0zj/uVM3BWgE74wW/G+fZGxEnI+yV+gJCi9PvmQiRK+MC
         XbSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747235917; x=1747840717;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hDddi59QfQosyfazvmWzWcoS6I1hEYTqzvGT0OXdo3s=;
        b=ogpGSkHDAQNNZjl0sE3tiHbbymlJ2cFB2lx4S93aKvkcv2qw4JFOcB+pXovfkkG7RL
         2NkQxdrhBFY8Yc0rYmqD55QvwRXI+keTOJgahaDbGBKj0CugoTTWNMC8UFFOogvCd+S2
         UtHThy1Fd/AY0T3vx1O10Yot/PU4nWu5QlHPeHoca6KGGWVNU6QklWMMHVcDwM/Wln5L
         zQ+03YA0jk3hxLImHoYHEpYxNmATjEbaPM3P1yKaq05UJdyChT/45zCMdGCHZkHKm6sb
         By+7sPP0Qc/X8vt+uPr/lkaNzJDGZtjSaU/3akWKotncSoHOpsbYQ/H+oOVtV2eTIF2F
         JfJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGcOWxxGG919E0+TeEgTPPXDxe9Fg4up+7Q1fsMcK2l0FYxI++JEha7L9c/1i0WoqwGwuHeVGfm9FRB7NQgWDf@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5681SCjMatTXeN7Z266Bu9sSfpuqBzJyWbb0EDmEbxKAEDHQz
	cj8Q9lbYfXiuEl3Fe4kWaVrlTMYu6WwXarl9m9v5ERQXH9R7Z5hVrnxMZ0ZvLRE=
X-Gm-Gg: ASbGnctUOWF9wa6U7fIz3tArNgfkNN/MEDGnn9b98D+daFymFKD7/Ssd9PlRIlUp5lI
	wmRNmcK5O25wprlw3gHPDQI8SOOND9QYoDLRSu8ffMgsvUhYOL9tsus3bauboqTlTxEErh/6pOY
	GouByMDUntpIrMC1GToUGoS0qDaOtm0LlhJkck6TyhuKm2mMNmUyX4pCxY8eHz+Me53BiM3PGs9
	QqwrgsXw0z8L++ANtfbRJKowRKfIUs52fcbaf2iFF0WUWo1eE/9dlF26nwPmLa59pWkbVsp6uSL
	PaWhln7saXkaCpviGUu1fD9T0i7OzGMD3VjQbSQJWh+LLO6lwc6DPN3jXF/SvCqSZBQYKhPoUC3
	Gc/0nQGoHSg/tC3T+MpA=
X-Google-Smtp-Source: AGHT+IEDATge5+zDxqbELJEYdAfp8/LXexrAUdXV/26VaCGnAoFIRDjTOltkH9awKWX1W2d81mcL1w==
X-Received: by 2002:a05:690c:3343:b0:709:ad9e:e651 with SMTP id 00721157ae682-70c7f22290amr52512997b3.27.1747235916861;
        Wed, 14 May 2025 08:18:36 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-70a3d9cb5ccsm29491107b3.90.2025.05.14.08.18.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 08:18:36 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e731a56e111so6970568276.1;
        Wed, 14 May 2025 08:18:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU6g2r90oHO2ZZUURs0oWusp1UClGMFfxK1Y2wXnkPtSbaOfSGgEVxXGASDY3s3/iV0bxTu3XrLNe1hQUgTuzci@lists.infradead.org, AJvYcCUzY/uv8552LhE9L8eu28l3NTISIds2neXifkYdQWCkQXmtwmO7OIo5xWJGYtIGtA0nrjpMyu33s80Z0PsfE5c=@lists.infradead.org
X-Received: by 2002:a05:6902:1ac6:b0:e75:b4df:869 with SMTP id
 3f1490d57ef6-e7b3d70dc1dmr4699203276.48.1747235915800; Wed, 14 May 2025
 08:18:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250225-6-10-rocket-v2-0-d4dbcfafc141@tomeuvizoso.net>
 <20250225-6-10-rocket-v2-1-d4dbcfafc141@tomeuvizoso.net> <14333638.uLZWGnKmhe@workhorse>
In-Reply-To: <14333638.uLZWGnKmhe@workhorse>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Wed, 14 May 2025 17:18:22 +0200
X-Gmail-Original-Message-ID: <CAAObsKAkMhgQsi6hLjbfS5wDaUz-hPQiZn7dVvn+6kDv0_jo9Q@mail.gmail.com>
X-Gm-Features: AX0GCFuozUHqFw-Ua1grRU5Zmez8kXjNLPgWkTD1GO7aODfE11uHKf0wUS78uCM
Message-ID: <CAAObsKAkMhgQsi6hLjbfS5wDaUz-hPQiZn7dVvn+6kDv0_jo9Q@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250514_161840_694369_7E748A28 
X-CRM114-Status: GOOD (  39.46  )
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

Hi Nicolas,

Thanks for looking at this. Some thoughts below:

On Fri, Apr 25, 2025 at 8:50=E2=80=AFPM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> On Tuesday, 25 February 2025 08:55:47 Central European Summer Time Tomeu =
Vizoso wrote:
> > Add the bindings for the Neural Processing Unit IP from Rockchip.
> >
> > v2:
> > - Adapt to new node structure (one node per core, each with its own
> >   IOMMU)
> > - Several misc. fixes from Sebastian Reichel
> >
> > Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > ---
> >  .../bindings/npu/rockchip,rknn-core.yaml           | 152 +++++++++++++=
++++++++
> >  1 file changed, 152 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/npu/rockchip,rknn-core.y=
aml b/Documentation/devicetree/bindings/npu/rockchip,rknn-core.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..e8d0afe4a7d1c4f166cf13a=
9f4aa7c1901362a3f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/npu/rockchip,rknn-core.yaml
> > @@ -0,0 +1,152 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/npu/rockchip,rknn-core.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Neural Processing Unit IP from Rockchip
> > +
> > +maintainers:
> > +  - Tomeu Vizoso <tomeu@tomeuvizoso.net>
> > +
> > +description:
> > +  Rockchip IP for accelerating inference of neural networks, based on =
NVIDIA's
> > +  open source NVDLA IP.
> > +
> > +properties:
> > +  $nodename:
> > +    pattern: '^npu-core@[a-f0-9]+$'
> > +
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - rockchip,rk3588-rknn-core-top
> > +          - const: rockchip,rknn-core-top
> > +      - items:
> > +          - enum:
> > +              - rockchip,rk3588-rknn-core
> > +          - const: rockchip,rknn-core
> > +
> > +  reg:
> > +    maxItems: 1
>
> Hi Tomeu,
>
> as you probably know, RK3576 has quite a similar NPU. This is why I'm cur=
rently
> poking at this patch series. One of the differences I ran into was that t=
he
> IOMMU of each NPU core now sits within the reg address space range of the=
 core
> as described by the single reg item binding and assumed by the driver.

But this is not a difference, right?

> This seemed weird to me at first, since I would've guessed the cores woul=
d be
> exactly the same, but I noticed that they kind of still are; the RK3588's=
 NPU
> also has a "hole" between 0x2000 and 0x2fff on each core, which is where =
RK3576
> put its IOMMU.

So this is the same in both RK3576 and RK3588, right?

> This is some information I gleaned from the RK3588 TRM, specifically sect=
ion
> 36.4.1 "Internal Address Mapping", which shows where each "part" of the N=
PU core
> has its address space.
>
> Right now we just represent this as a single reg item per core. I've play=
ed
> with the idea of splitting this up into the distinct ranges the TRM lists=
 and
> giving each a reg-names entry, but this would require a major rework of t=
he
> driver from what I can tell, including to the auto-generated register hea=
der.
>
> For now, my hack on RK3576 is to just ioremap the range defined by resour=
ce
> start to resource end inside rocket manually if I get -EBUSY trying to io=
remap
> the resource proper. This is quite an ugly hack though, it means the IOMM=
U node
> still has its address overlapping with another node in the DT, and it als=
o means
> we have an unavoidable error message printed into the kernel log. This is=
 also
> what the vendor driver seems to do.
>
> What do you reckon is a reg setup in the binding that is both reasonable =
to
> implement in the driver while accurately describing the hardware?

Guess we could go with some smaller granularity and have 3 register
areas per core, instead of 10:

- CORE: PC+CNA (0x0000 ~ 0x1fff)
- AUX: CORE+DPU+PPU+DDMA+SDMA (0x3000 ~ 0x9fff)
- GLOBAL (0xf000 ~ 0xf004)

So the IOMMU on all the known SoCs can have its own regmap. I have
chosen to call the first one CORE because these are the components
that are absolutely needed in any NPU that is oriented towards
convolutional networks (convolutions, basically). I have named the
second AUX because it contains hardware units that are optional and
are used to implement operations that may be common but that aren't as
computational expensive as convolutions and thus might be skipped in
lower-end versions of the IP.

What do you think?

Regards,

Tomeu

> The RK3568, which uses a similar NPU design has the IOMMU at an offset of=
 0xb000
> from the core's start of PC, so probably after any core specifics but bef=
ore the
> global registers if I hazard a guess.
>
> For those without access to the TRM: splitting this up into multiple reg =
items
> per core precisely the way the TRM does it would result in no less than 1=
0 reg
> items on RK3588, if I count correctly.
>
> Kind regards,
> Nicolas Frattaroli
>
>

