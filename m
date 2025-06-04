Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63076C61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 08:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zJmj/95wgXcHpVI6Ou9qJ8Nq5fJR29OVttEikN7mIco=; b=Pm4jzHIBlHrdNTGSxrXlnZiQdM
	Q0S39zOW1j2+Nct9muxRW171vT2rmgXcnXshEFWyUWFk1LQqJPg5EumdndODg6yKddtORxRRwuPgM
	xMnMxzPphFimKjVzvKYHsSaCU0LhOdlSjSfIVqQBjQcYXct2haKYJdJL/1CusHIcbJzKmyD00JIQZ
	a2m8HcOIqcs6voliLt3Sscj4iUiqY/FNg1xRz8gD2aevVo51//baS/+ryaYL3+8PquQaIcT2cIyKM
	T5BtRa7VvRjOvEl3buaEYuvOgVq2Wu3qzq9fKGg4lDbFlqQgizNYwJkdcmWaqyNRPkle5L7iwovHO
	GKpRTgpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMjk3-0000000CvpD-441d;
	Wed, 04 Jun 2025 08:44:59 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMjcH-0000000Cuct-3wIn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 08:36:59 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-70e2b601a6bso60803177b3.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Jun 2025 01:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1749026215; x=1749631015; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zJmj/95wgXcHpVI6Ou9qJ8Nq5fJR29OVttEikN7mIco=;
        b=sW5sPxBViyoDbvPCt6qhT+yYGoGBnltd/j/pgQ3+AkIVQre23e/hGL4PSD+728TSF0
         bK5FFqpw6zhqOPwldR4K0ZWofir9P0iMycNOy9IZzqjUvRxMVh0+5zvTY40kg3An6eNZ
         fU3HPXpzGpXlKctBGlcR1hOoqNTxQkLzEgeGgfxvQVoJPDu811dijAH53TA3/fMy+Quz
         SODStuvwsJk8ls3JUIuIl2Xrhwfqyx4Xqs3BMAmNgFB6/sgQDWJwvQgqdqeQ/RN42OzN
         qGfrIf6833tkTO4khhgkG9nRLDMqfsHdCqZG0mlXlRr02hy1P4eOY2BPe2daB5C0HycT
         INXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749026215; x=1749631015;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zJmj/95wgXcHpVI6Ou9qJ8Nq5fJR29OVttEikN7mIco=;
        b=QGELyCPxTBjuUg823ahT+cdAEJ83IB5B6fZooeYq7JdTxKZlp8IBFAo5NuszRnFUOC
         0zeDNbi/38YTqNxlFxgzMuCbzRa9RiEZkXuM3ujGFWhkaQwKEir+GftPycgaAXdUYVh2
         bvp8aIk5ok9uuwJ8U907WvUiXGqYjYReB/YZG4ODcxnq6UYAhTncEMvG7A4FXjlU4XL4
         F4jQzU+nDU7LwmLw2OAmDoScka9f6KSc2Er7dn0IOuwqiBIMWHJwBjilTivMAWaJEGPH
         GbV70m3/c92ubMf48oDrIpKzufdgIw0ASsBe45+O59h0JYD4BEBeG5NUKdU/GiDB14EV
         E01g==
X-Forwarded-Encrypted: i=1; AJvYcCWZmZUKFc/0/vHzbBPSeSkRHs5pZbpH3xQEntNvYa+NOsLK9WaGoZYk0+vr0jfvfLWx4hQ9yNE3hwe7+FvmeXGJ@lists.infradead.org
X-Gm-Message-State: AOJu0YxOo0AEeGTgsX5Yuhhp0pu1/pwLwc/LMkZAGmoM6Q2qL/5OddkO
	wf4h1ML5pQVTmy8HW86I3WN2iBDjxPZ5CP5c7xIFyGlTSDc4vElXrXLXjh8SXyfh+D7fQRUVPK1
	N9aKo/LKTcQ==
X-Gm-Gg: ASbGnct7hqwTQ6uJtj3udoH16XGmLeOwXJqpGoJYiDrOweddoP61ch0dgGCuKfriQv1
	pxZiVMmvC7uCKQKIvBPWak/wBJ1kRKC+CJxe53cIinBgihsROB76vdYBiaRQBpx2nncZQskzZHj
	t6/oU7Ty1r3H9yeGCbhRnUEglXrMhvc56mEB83RE6pDU9auamc+CFhZr5JGOR1BEWjxf45yrjnp
	YzLI3++sNoFmKhf4uxcx87Bjt9POX4hB+rLZ0p94+uKprGW9f6ra8rj37FiqCANb4akEvMCn0HU
	fgrnOdLWLQh4wOrFUpFegmUWy5yurIvIZSsxqH79/779jkVaiNP5rITeMhqI0QScJXRzhNQu90O
	1AZM+S6NfwdBUT5zWsmfnzHdm91Pnz48lH4XsYr/S
X-Google-Smtp-Source: AGHT+IFMkzS4Y/7PQ6UUnwKl/jab9ys6WIBNxJDpxdHCq9tIyyzgyoZ9JupQVtyWu+B+0b7AmFDlzA==
X-Received: by 2002:a05:690c:62c7:b0:703:b47a:72f9 with SMTP id 00721157ae682-710d99a1ad4mr22932477b3.3.1749026215119;
        Wed, 04 Jun 2025 01:36:55 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-70f8acd52b2sm29000127b3.82.2025.06.04.01.36.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 01:36:54 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e7dd151f79eso6290893276.2;
        Wed, 04 Jun 2025 01:36:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV3N2HWw/NXXwNOH5l/a3BO18JWZl5ux8ICofTTlwEsFhAtMhyUbn6avonbaj+eNN60L1YIQPbeFl3N67Yl/tI=@lists.infradead.org, AJvYcCWmdr5rLJEvaawGca/aHAukfqijKvYBT7CZXTLYuuOtEuBWMYNfRiy72/p93o9g42N3qUEoUvuA0+vBpQW0FsH7@lists.infradead.org
X-Received: by 2002:a05:6902:2684:b0:e7d:cfd0:957f with SMTP id
 3f1490d57ef6-e8179c4e822mr2337109276.11.1749026214087; Wed, 04 Jun 2025
 01:36:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250604-6-10-rocket-v6-0-237ac75ddb5e@tomeuvizoso.net>
 <20250604-6-10-rocket-v6-1-237ac75ddb5e@tomeuvizoso.net> <2024813.jZfb76A358@diego>
In-Reply-To: <2024813.jZfb76A358@diego>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Wed, 4 Jun 2025 10:36:42 +0200
X-Gmail-Original-Message-ID: <CAAObsKB6UDp-yBE3oNNn0GkiVN0TeYFkL5nzQCroUHaSK47tUA@mail.gmail.com>
X-Gm-Features: AX0GCFvL5nJeCruhYVKFwWz9ImMH3rGz7U0FgI_gqBjbHTrFFbFoGu46LHESGLo
Message-ID: <CAAObsKB6UDp-yBE3oNNn0GkiVN0TeYFkL5nzQCroUHaSK47tUA@mail.gmail.com>
Subject: Re: [PATCH v6 01/10] dt-bindings: npu: rockchip,rknn: Add bindings
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Kever Yang <kever.yang@rock-chips.com>, 
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-doc@vger.kernel.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_013658_135551_E181C7E9 
X-CRM114-Status: GOOD (  24.34  )
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

On Wed, Jun 4, 2025 at 10:25=E2=80=AFAM Heiko St=C3=BCbner <heiko@sntech.de=
> wrote:
>
> Am Mittwoch, 4. Juni 2025, 09:57:14 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb Tomeu Vizoso:
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
> > v6:
> > - Remove mention to NVDLA, as the hardware is only incidentally related
> >   (Kever Yang)
> > - Mark pclk and npu clocks as required by all clocks (Rob Herring)
> >
> > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > ---
> >  .../bindings/npu/rockchip,rk3588-rknn-core.yaml    | 144 +++++++++++++=
++++++++
> >  1 file changed, 144 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn=
-core.yaml b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-cor=
e.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..9a5e9e213912d0997da2f6a=
e26189adf044dcc7b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.y=
aml
> > @@ -0,0 +1,144 @@
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
> > +  Rockchip IP for accelerating inference of neural networks.
> > +
> > +  There is to be a node per each core in the NPU. In Rockchip's design=
 there
> > +  will be one core that is special and needs to be powered on before a=
ny of the
> > +  other cores can be used. This special core is called the top core an=
d should
> > +  have the compatible string that corresponds to top cores.
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
> > +    maxItems: 4
> > +
> > +  clock-names:
> > +    items:
> > +      - const: aclk
> > +      - const: hclk
> > +      - const: npu
> > +      - const: pclk
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  iommus:
> > +    maxItems: 1
> > +
> > +  npu-supply: true
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  resets:
> > +    maxItems: 2
> > +
> > +  reset-names:
> > +    items:
> > +      - const: srst_a
> > +      - const: srst_h
> > +
> > +  sram-supply: true
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - reg-names
> > +  - clocks
> > +  - clock-names
> > +  - interrupts
> > +  - iommus
> > +  - power-domains
> > +  - resets
> > +  - reset-names
> > +  - npu-supply
> > +  - sram-supply
> > +
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - rockchip,rknn-core-top
>
> should be rockchip,rk3588-rknn-core-top I think
>
> > +    then:
> > +      properties:
> > +        clocks:
> > +          minItems: 4
> > +
> > +        clock-names:
> > +          minItems: 4
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - rockchip,rknn-core
>
> should be rockchip,rk3588-rknn-core

Thanks. Actually, all the addOf section is not needed any more as we
now know that from a resources point of view all cores are the same.

Cheers,

Tomeu

> > +    then:
> > +      properties:
> > +        clocks:
> > +          maxItems: 2
> > +        clock-names:
> > +          maxItems: 2
>
>
> Heiko
>
>

