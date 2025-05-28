Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 132ACC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 16:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/xxvQd++y7EnTgMMEVQbGeZAD8fz0r4wC/tmiy3K++8=; b=h2tpSHwTdL7g8EVsQJEXwKoD3u
	kfD9T7vo+Nf5L9l4GqlITvD9pGTLKOWcR3zP79CxFZE6QiNnBT+nrRM4oWWN5FDzuANYF1J/nc9hp
	G4HE+S+IYX7fG81MHthrmwTk/8RLej4pLbGiv1SkxM8BFOm1hQAERIoP2DxI2d4UDvCizUctIRfce
	TmAu0L7Mz1v/ke6ug+wkO/QxqtlDxTu0kMnBjx+rEE+glUXkmX81s37kwPz6Ds3LbMvY9pgmaz/0b
	aC5ZaVZ2YE+N6NrGx4c9+UG3HJCrmKkrOIk13a0xUBqjGtBntMUA8xF+ZZVUaUdOmtiLtKd64Pa22
	2EKnLCSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKJdQ-0000000DewT-3ITt;
	Wed, 28 May 2025 16:28:08 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKIoC-0000000DZ4Q-0ppE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 15:35:13 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-e7da099de49so3324412276.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 May 2025 08:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1748446510; x=1749051310; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/xxvQd++y7EnTgMMEVQbGeZAD8fz0r4wC/tmiy3K++8=;
        b=TCfJbF893FmU4tghZk5qv9EAAkolVaWt61vD13VEBkweL0uKvw5DLEEtAWqqZF7LlG
         T2izbtUMyBllSDfgJRbnyJBRz0Hh1Ay5GpX0QucZkKq9Omplvkla1r7ZREoI1e6lMxfu
         tkCoIClsOloUkXGNgHCulF843nOeeFZ0czX/s5KEjf8Sf/jbNTgleb4xel+/WmckPhZt
         G88GTFkQQBqju7ETEvnLdPWexndiTW6ND2Wqdb+rm39c+zEHTTE8hTSfd2Go8xR0gvCT
         zQ3lppr6weOzVDdBbpwfrnaJv1v3MjMpXiJAFeX9J9q59XnBbbWde7zPe0OrO476H1MP
         iaKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748446510; x=1749051310;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/xxvQd++y7EnTgMMEVQbGeZAD8fz0r4wC/tmiy3K++8=;
        b=OZR82ReVuhYBq0F9TV5zTdKoqEJW2yhIn1rwivsqIaxlb4HprGQbyjjHmym+QaHWE4
         DN4VOtJReM4U3BMWFywHLHcU+j6DUlWTrWM6mVQYV9DkRAvFajIIlOLUwTIQLsSx7B44
         lDvxw9ZoDckVrOt6upJRjI9/m02CqSvvNyh/6lbJoSTXYWx3lPKN4gPAXlYYy1JUUUG+
         vPAJvX7JSTdNB/5ngBudo8EVsA2a1jWLlLbxgSf1FniRkTXlRsRdbkl+ZWsryqV9ZdCp
         xsmgt6qHKZGxp41zH//WdGm8rXNW1/vmSayBUEIDDeXqUQ/B1BspXotc2mIAr9vqGLg3
         WZLw==
X-Forwarded-Encrypted: i=1; AJvYcCUhsU7vypvlAIrCcgkZkp0AQyjutEOHBHDXtw3kAZmy4sBkjG1uC5deSRRcJrjR3IDe0TrOXrv4RafaIf88okJq@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2RlAK4ViPVS0n7gcwFb5oHQa4k10jBE3TrrPnlgb8d9IjL+/v
	zzBs3xklkYrJKTutPcJ9avYpqxMnTqSO+41fWeBe8Peiow4NnU/bWgQBg/97nI8gGSn73clTn1g
	AD/JgGwPHug==
X-Gm-Gg: ASbGnctY1zvbRq8rc8EPd2QpvTQaplH6fqp1eu5oeJ9MbzHHRjJbbEOV0/1DPIenjsF
	rC/NjkPUWYp55RBdMC+HTd5p9NuynxcsY/Hzm+mN1RzCVWLHgNqRlehqVY6D3yiVTxAH+IkmsAw
	WAumKYQxDg0qEnsB+K7+YRdboCGUE/iSG68HnZ6I9MEoIVNyM/rNdGgAKWMwUzlYSDQwVRVJKBl
	xXiD2yQdoxZ2JDntZvMQtA/GKBv/mhoTATbe6vqg47s3nSm2UE635g4XIEbHc5ORB0pwE1B3QTv
	EckuXSy8kXkqCXm9yZHDbzRqcXdqRQISzXnEioEgUCxGL6zoP1R/8vuPiKuGBtyKhDyAQbT8GIB
	bsf2TQnv5WfSn+l1MkGo=
X-Google-Smtp-Source: AGHT+IGiOL6x42T0jsPHvb8a5661YLptrmV907N8otuGHZQUTt1oTogSJcKwYAqfLR7NwmGaq2sMbg==
X-Received: by 2002:a05:6902:10c2:b0:e7d:cdca:8ed9 with SMTP id 3f1490d57ef6-e7dcdca9345mr7373955276.14.1748446510592;
        Wed, 28 May 2025 08:35:10 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e7f6185ed68sm312947276.46.2025.05.28.08.35.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 08:35:09 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e7da099de49so3324373276.2;
        Wed, 28 May 2025 08:35:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW7ky+VdrxidqLjXj7/TyyptQOiPxTiygQlqcSmBI1/NatcOahTgiIdnhgwvLelETJ6NIm0JHVyaL/QaTelDgx1@lists.infradead.org, AJvYcCWUGkGxwRUj/cv6nxR/3GF857RAO8BuvcHno79vSrNt4nzG28CWuF39sDXQ6wVNmzAR7B2AmvY/v20s8+saMiM=@lists.infradead.org
X-Received: by 2002:a05:6902:1021:b0:e7d:ca07:a144 with SMTP id
 3f1490d57ef6-e7dca07a23dmr8541656276.5.1748446509068; Wed, 28 May 2025
 08:35:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250520-6-10-rocket-v5-0-18c9ca0fcb3c@tomeuvizoso.net>
 <20250520-6-10-rocket-v5-1-18c9ca0fcb3c@tomeuvizoso.net> <CAL_Jsq+2mvUDWWvtPSryAiCNJP_=1vNRxARxWTS=-O-LTQO3Dg@mail.gmail.com>
In-Reply-To: <CAL_Jsq+2mvUDWWvtPSryAiCNJP_=1vNRxARxWTS=-O-LTQO3Dg@mail.gmail.com>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Wed, 28 May 2025 17:34:57 +0200
X-Gmail-Original-Message-ID: <CAAObsKDE33kZ27XbgeWBqQzrZXDHwHzp2Q6A7y_osC50UG-n7g@mail.gmail.com>
X-Gm-Features: AX0GCFtwrQfY2JjemntUXNTLyymu_4uxtqwB53YlQ42a11mlnVkp6EMD0QhiJuw
Message-ID: <CAAObsKDE33kZ27XbgeWBqQzrZXDHwHzp2Q6A7y_osC50UG-n7g@mail.gmail.com>
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
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	Kever Yang <kever.yang@rock-chips.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_083512_531901_41EB7218 
X-CRM114-Status: GOOD (  32.90  )
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

No, I really need to power on that one before the others can work (the
first core is also marked as special in a diagram in the TRM).

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

Yes, I think it's probably as you say, but I don't know how I could
check. Maybe Kever, Heiko or Sebastian would have any ideas?

Thanks,

Tomeu

