Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 390ABC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 07:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=egAKscK3QoP1kYQu5KkN3aoibVnnNSd6rVfa6InXH/s=; b=LKeXMzhiB4CTga+CjGQYVakxOh
	KU6BRyC2OgI8KX5ZMlw0x3EYFUpgTHz9SHNVVPjA3h/M8c/GvsNMgV3xjIZPQhzZEUdeEVevnWaJH
	42qAVyjP2fxRzGWd78Ns4u8SE7ZzHVZfgUZZgKqkQbBQYr7nU/t84EJbeHj8wyu6nyiUANFnarnqj
	b3l++N87bXNGd/tdfYJpLF9GYnyDU+Gz4xBdWyBWpuwvnRazusS38maDwyszKcb57232mdOcPxtik
	dbyoExhlBE0eSZj8k0xRfv3y8O4HmZnKfqlOt069TJRHA1GMkpHuYX/f0tiVd+6bKnogBcwZI6dI1
	alofJOSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMiLy-0000000CkMQ-0U9S;
	Wed, 04 Jun 2025 07:16:02 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMiJL-0000000Ck9E-3G1N
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 07:13:21 +0000
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-e733a6ff491so5910189276.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Jun 2025 00:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1749021198; x=1749625998; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=egAKscK3QoP1kYQu5KkN3aoibVnnNSd6rVfa6InXH/s=;
        b=PahDTohP6/bGt2OF+5bjWT+T9Thc6aTb9EBaVqc9AE40cG52gtko5p9x9xPHUSp7bA
         HSHm2U76WbwIAfcHySmnGQ4TawzukflkuqAMAOlstCnGKvKG8TGPdVjWI+NY3lcwDTMG
         DhR1Fnh1498hIG/PWaRfOLJFp0fEaeNHfRjCLk91vef3vAKuCR+b0Pp52N4Eudp1pDhb
         I/RPESVE7l+HfWZP3kLDEMkwWBf3QIPGSGP7poovN05P8UPCsNYTAnzKsMT+JS+QPHLh
         sC3NDRLvs2jEuaQL5IqKpXcCHiiKdEb/8332LSv8aQ1JJCfF9IVeQuDetFNgF7eijQ8H
         /Fdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749021198; x=1749625998;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=egAKscK3QoP1kYQu5KkN3aoibVnnNSd6rVfa6InXH/s=;
        b=vXgNSHMYIxrhOD5QSQC3tF9y6SR60+txeDdtEx3GSTPi8opEDIUVkeDJwtWBgQnCOF
         hfxpuuAnjkThnCRw4cHsObClos/F9Tj2uChMRjxwWMdpSZ0nzZ41TrTq8ApQOgzlDJPF
         LneGmkAqxjKMuB4T3WRxFiq9tDWAOTcSCNRqqC3ky+i70klvMvv2XEEtrmH32GWLSCPO
         QY1+w72uVtgUjEmex0XfFAUfYZQ4I998ZM2TYgjwIufKL9IRWlr3IQ+iksTTy8DF/Gdg
         MyHE484tcKUu8CEkhwDeykjE9Gw1BloN+ASa9pQLkpHqGmB1ozjPvmbPb0rad9ZAGR0Y
         Es1A==
X-Forwarded-Encrypted: i=1; AJvYcCVNY2LT5aP1LJOU+xx8M2EOv5+igr0W69NFcAjwFizk+FtWIVFUP0bs5TdR8eLpElKrlGhlupgeC+O5mYKpOAUL@lists.infradead.org
X-Gm-Message-State: AOJu0Yw05pXMeoBU7SKPBul8P73wBAonwLepnzhRHVnQiegm/9T7nPJk
	wcnbOXBRqJuf61klms0Ui+KVrYN3QqFikIeSUO+z2qshGs9K7hg7YtL7LdILwRQWbFJKZPBfWOr
	qmE6KdJgNDQ==
X-Gm-Gg: ASbGncu9ygjGXKEG+rrLjOFOsEOcGu6dGmlkUdFWHu4YYDomPXahiTTRsL4ZPnYWZiQ
	ye9pjXcI+GpdjKl2LEUjFOcVCWMCHSDTowLWyhzyccIN5zS/47A02eSZAbDSk3x4Ix3/Hm3ZL2X
	635WTUuQpq5IeAo3AYCfZNp5Pv2TeK8Yv7QP8oor4B0aLEST8dHc5rmTKIuz6g+teSFql5cH2DD
	hePonkH4yN5Cfy7W2DxMYwelfAk8kKE/2wPr9Qncpj5JuMc9+c9KiswRzPHgC5EQib2aihOPF8l
	qKEP4i8/qiA8w88NXlPPLx/5MbQ3KyYSR70Q53H3eWSHJc+AHpn9nLge5+DS/MG/diGddTtaY4/
	bVCMqRW+si7JAYezQlns=
X-Google-Smtp-Source: AGHT+IEioYZr7Pl+HyE8GQyHn5JFYfPVNgHWYa1W9Zaw6rlkHM/hfWhk7sFvb+lXfkDx1TMN/tre9w==
X-Received: by 2002:a05:6902:1a4a:b0:e7e:fa65:8fec with SMTP id 3f1490d57ef6-e8179dad833mr1938620276.41.1749021198665;
        Wed, 04 Jun 2025 00:13:18 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e7f733af341sm3034374276.11.2025.06.04.00.13.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 00:13:15 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e733a6ff491so5910115276.2;
        Wed, 04 Jun 2025 00:13:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVdRpOQgaDpyi6xIdrhKsdV/a/apUMtzapK/b/ltJYR6u1UcGGngNXs/qJXwJvgJIdmywVzPXV76gACH4ucu9pv@lists.infradead.org, AJvYcCX6R7LSD3stIu9AEDue6YiJBpqU/xY47ESx8tDPdmJE9Qw1NbAk4TcHoMiFjV9mMlEl+gOPFMnKm9De9Jnn1ok=@lists.infradead.org
X-Received: by 2002:a05:6902:1009:b0:e7d:b06c:709d with SMTP id
 3f1490d57ef6-e8179dac9c2mr2086427276.37.1749021193915; Wed, 04 Jun 2025
 00:13:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250520-6-10-rocket-v5-0-18c9ca0fcb3c@tomeuvizoso.net>
 <20250520-6-10-rocket-v5-1-18c9ca0fcb3c@tomeuvizoso.net> <CAL_Jsq+2mvUDWWvtPSryAiCNJP_=1vNRxARxWTS=-O-LTQO3Dg@mail.gmail.com>
In-Reply-To: <CAL_Jsq+2mvUDWWvtPSryAiCNJP_=1vNRxARxWTS=-O-LTQO3Dg@mail.gmail.com>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Wed, 4 Jun 2025 09:13:03 +0200
X-Gmail-Original-Message-ID: <CAAObsKCUusE68Bzce5fxukpOJ34M_w5vt7+gLSHZuMC8KXqtLA@mail.gmail.com>
X-Gm-Features: AX0GCFujZUaEEoiRSaHh2B6hjHyNEBOF25EbCsvQFur0Wj0AZ2p1QcOal7DajJE
Message-ID: <CAAObsKCUusE68Bzce5fxukpOJ34M_w5vt7+gLSHZuMC8KXqtLA@mail.gmail.com>
Subject: Re: [PATCH v5 01/10] dt-bindings: npu: rockchip,rknn: Add bindings
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Jeff Hugo <jeff.hugo@oss.qualcomm.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_001319_816215_D263434B 
X-CRM114-Status: GOOD (  30.05  )
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

On Wed, May 28, 2025 at 3:41=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Tue, May 20, 2025 at 5:27=E2=80=AFAM Tomeu Vizoso <tomeu@tomeuvizoso.n=
et> wrote:
> >
> > Add the bindings for the Neural Processing Unit IP from Rockchip.
> >
> > v2:
> > - Adapt to new node structure (one node per core, each with its own
> >   IOMMU)
> > - Several misc. fixes from Sebastian Reichel
> >
> > v3:
> > - Split register block in its constituent subblocks, and only require
> >   the ones that the kernel would ever use (Nicolas Frattaroli)
> > - Group supplies (Rob Herring)
> > - Explain the way in which the top core is special (Rob Herring)
> >
> > v4:
> > - Change required node name to npu@ (Rob Herring and Krzysztof Kozlowsk=
i)
> > - Remove unneeded items: (Krzysztof Kozlowski)
> > - Fix use of minItems/maxItems (Krzysztof Kozlowski)
> > - Add reg-names to list of required properties (Krzysztof Kozlowski)
> > - Fix example (Krzysztof Kozlowski)
> >
> > v5:
> > - Rename file to rockchip,rk3588-rknn-core.yaml (Krzysztof Kozlowski)
> > - Streamline compatible property (Krzysztof Kozlowski)
> >
> > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> > ---
> >  .../bindings/npu/rockchip,rk3588-rknn-core.yaml    | 147 +++++++++++++=
++++++++
> >  1 file changed, 147 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn=
-core.yaml b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-cor=
e.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..9eb426367afcbc03c387d43=
c4b8250cdd1b9ee86
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.y=
aml
> > @@ -0,0 +1,147 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml#
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
> > +  There is to be a node per each core in the NPU. In Rockchip's design=
 there
> > +  will be one core that is special and needs to be powered on before a=
ny of the
> > +  other cores can be used. This special core is called the top core an=
d should
> > +  have the compatible string that corresponds to top cores.
>
> Is this really a distinction in the h/w? If you change which core is
> the top one in the DT, does it still work?

I asked Kever about it, and he confirmed that the core 0/top is
special in that it is able to relay register writes and share data
with the other cores.

Regards,

Tomeu

> > +
> > +properties:
> > +  $nodename:
> > +    pattern: '^npu@[a-f0-9]+$'
> > +
> > +  compatible:
> > +    enum:
> > +      - rockchip,rk3588-rknn-core-top
> > +      - rockchip,rk3588-rknn-core
> > +
> > +  reg:
> > +    maxItems: 3
> > +
> > +  reg-names:
> > +    items:
> > +      - const: pc
> > +      - const: cna
> > +      - const: core
> > +
> > +  clocks:
> > +    minItems: 2
> > +    maxItems: 4
> > +
> > +  clock-names:
> > +    items:
> > +      - const: aclk
> > +      - const: hclk
> > +      - const: npu
> > +      - const: pclk
> > +    minItems: 2
>
> It is odd that the non-top cores only have bus clocks and no module
> clock. But based on the clock names, I'm guessing the aclk/hclk are
> not shared, but the npu and pclk are shared. Since you make the top
> core probe first, then it will enable the shared clocks and the
> non-top cores don't have to worry about them. If so, that is wrong as
> it is letting the software design define the bindings.
>
> Rob

