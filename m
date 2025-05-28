Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2238C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 14:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FKPrxfJ6XudwwKoIkUHsmXk2b7ix2VozDGc9y8tY6FQ=; b=M46rs16EILPfnH9Nslm8XmdJ7S
	9Fdfn7QDOK01XUR+wA7ndoLZ4T8+RVqj4Ji9j5f3e04uhB21FHpjTVLj9ZFTREaRybtg+TWWkRuvM
	HWMynJbo5Ow6MB8Q9NnEeYqSeIBBmccvoQun+OSwNUr/4+rqNzXt8hRah4iR43eDAxyGGtNKzDDFP
	PbL3ClX3EG/T9DNxjkq5LqyNb2NHzKkoCfm6KUKWTZhC89sIE4d62C8CvTXIvi9ghLufWswEPITCy
	6Y3gwPGkOaF9F/R4YeOz5Bkx12L9J6vME8wk07ZLggR6dSi7zDaUG/Mn3i2QnpcSJTASY2YitTjHu
	xwIbmaxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKHNx-0000000DJOm-0LfI;
	Wed, 28 May 2025 14:04:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKH2k-0000000DGfe-11mS;
	Wed, 28 May 2025 13:42:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BC11D4AC08;
	Wed, 28 May 2025 13:42:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EF02C4CEF6;
	Wed, 28 May 2025 13:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748439725;
	bh=V9S/2REy6SRPwlWHL+UjOecCAm58nBM9YBmNFi5Tywo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GNsjXw9M9L1DpZv3jViNj4XkRdb+mXI+2m/G47jUDBV7WxLPvUEubGj+1ixOIJqRZ
	 e717/UmjcPxGcIwM1BREjJHjlHf7DQ6xXKLJDrFl1tj04VPf1Nl1KOdgCgSbhZFqe1
	 fB4uuTK4326ar1JEQv1u6vI97cf23A7RHdJvMGc4fpP8miZY3I2LE258OtWM74XvuF
	 uyjjxH7Jkv2eBczrYAMXiiQ4xzeMUCcmt8tKkGRjgdQl+plEZu+sAUbi3CzKXza/g/
	 qkqGVbbTWmfb3tPdTBHScCSnX5dqhvmCdvqDtXY9/jBXm1ah6dywidLzlVPvpGBgkS
	 H/v7sUXokTZ5Q==
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ad1b94382b8so768994466b.0;
        Wed, 28 May 2025 06:42:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUHHQeNl9SrOpRRUCiNNrP5nbdxueOnMxfw7H4E+0I/OG1c87TLGKY+3Rbz8MeS0esvMlC5E81jmXKDgro0BhY=@lists.infradead.org, AJvYcCWV4B1eZGiqN+b1ECyIs8BQCVylObm2WMWc4gfpmGAUwvpFmdFF7j8NCLPdzlAW2v2jzwFQfAcT3IjU6Ex+VCTd@lists.infradead.org
X-Gm-Message-State: AOJu0YwEalSXv8GFMY8486LkMhBmfhi6yVVkfANgM8vkSTr7Fu6we7Ue
	4jGBj9bNAw+mqN5z+BRoQ3Aazyx+GgaDmWEm7LkXmaP52d3+toVrxR8H9xai9b28EcJ2KJuCJJN
	01WtokZjNZNMbcja7j6QkTAFE48w9nQ==
X-Google-Smtp-Source: AGHT+IF33pDJOIkUnFeeemo7C8vEsrRKhSwUSbgBJjMPDXVeNtNZPzFqXBOHGol2WTjwYaKgOgXZo2D8V9wI8E6hrhc=
X-Received: by 2002:a17:907:7f09:b0:ad5:23e3:48b6 with SMTP id
 a640c23a62f3a-ad85b2b586fmr1522153166b.45.1748439724013; Wed, 28 May 2025
 06:42:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250520-6-10-rocket-v5-0-18c9ca0fcb3c@tomeuvizoso.net> <20250520-6-10-rocket-v5-1-18c9ca0fcb3c@tomeuvizoso.net>
In-Reply-To: <20250520-6-10-rocket-v5-1-18c9ca0fcb3c@tomeuvizoso.net>
From: Rob Herring <robh@kernel.org>
Date: Wed, 28 May 2025 08:41:51 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+2mvUDWWvtPSryAiCNJP_=1vNRxARxWTS=-O-LTQO3Dg@mail.gmail.com>
X-Gm-Features: AX0GCFtEoojAQ2L7InqgVIis2qLVvXMe-zX4FDkooFBAAdsDZZRxWtAdT4YSjTY
Message-ID: <CAL_Jsq+2mvUDWWvtPSryAiCNJP_=1vNRxARxWTS=-O-LTQO3Dg@mail.gmail.com>
Subject: Re: [PATCH v5 01/10] dt-bindings: npu: rockchip,rknn: Add bindings
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
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
X-CRM114-CacheID: sfid-20250528_064206_333935_B7E02698 
X-CRM114-Status: GOOD (  24.67  )
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

On Tue, May 20, 2025 at 5:27=E2=80=AFAM Tomeu Vizoso <tomeu@tomeuvizoso.net=
> wrote:
>
> Add the bindings for the Neural Processing Unit IP from Rockchip.
>
> v2:
> - Adapt to new node structure (one node per core, each with its own
>   IOMMU)
> - Several misc. fixes from Sebastian Reichel
>
> v3:
> - Split register block in its constituent subblocks, and only require
>   the ones that the kernel would ever use (Nicolas Frattaroli)
> - Group supplies (Rob Herring)
> - Explain the way in which the top core is special (Rob Herring)
>
> v4:
> - Change required node name to npu@ (Rob Herring and Krzysztof Kozlowski)
> - Remove unneeded items: (Krzysztof Kozlowski)
> - Fix use of minItems/maxItems (Krzysztof Kozlowski)
> - Add reg-names to list of required properties (Krzysztof Kozlowski)
> - Fix example (Krzysztof Kozlowski)
>
> v5:
> - Rename file to rockchip,rk3588-rknn-core.yaml (Krzysztof Kozlowski)
> - Streamline compatible property (Krzysztof Kozlowski)
>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> ---
>  .../bindings/npu/rockchip,rk3588-rknn-core.yaml    | 147 +++++++++++++++=
++++++
>  1 file changed, 147 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-c=
ore.yaml b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.=
yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..9eb426367afcbc03c387d43c4=
b8250cdd1b9ee86
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yam=
l
> @@ -0,0 +1,147 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Neural Processing Unit IP from Rockchip
> +
> +maintainers:
> +  - Tomeu Vizoso <tomeu@tomeuvizoso.net>
> +
> +description:
> +  Rockchip IP for accelerating inference of neural networks, based on NV=
IDIA's
> +  open source NVDLA IP.
> +
> +  There is to be a node per each core in the NPU. In Rockchip's design t=
here
> +  will be one core that is special and needs to be powered on before any=
 of the
> +  other cores can be used. This special core is called the top core and =
should
> +  have the compatible string that corresponds to top cores.

Is this really a distinction in the h/w? If you change which core is
the top one in the DT, does it still work?

> +
> +properties:
> +  $nodename:
> +    pattern: '^npu@[a-f0-9]+$'
> +
> +  compatible:
> +    enum:
> +      - rockchip,rk3588-rknn-core-top
> +      - rockchip,rk3588-rknn-core
> +
> +  reg:
> +    maxItems: 3
> +
> +  reg-names:
> +    items:
> +      - const: pc
> +      - const: cna
> +      - const: core
> +
> +  clocks:
> +    minItems: 2
> +    maxItems: 4
> +
> +  clock-names:
> +    items:
> +      - const: aclk
> +      - const: hclk
> +      - const: npu
> +      - const: pclk
> +    minItems: 2

It is odd that the non-top cores only have bus clocks and no module
clock. But based on the clock names, I'm guessing the aclk/hclk are
not shared, but the npu and pclk are shared. Since you make the top
core probe first, then it will enable the shared clocks and the
non-top cores don't have to worry about them. If so, that is wrong as
it is letting the software design define the bindings.

Rob

