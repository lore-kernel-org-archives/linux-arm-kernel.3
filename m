Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18F77CF5396
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 14:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=drnjFIvwO+HdWpeU95+K1o2fmj1utumcRZT+ucp+B90=; b=VtRNnniasZgDzDJYyWJ8qmvRY4
	lzefH+px/bdAjGm5EjbHKLpRBK02WHmbWcQ6lVIWrw4nHTonAnBC5PBHRrcVi++SmgQpI5jhRBLKA
	lo9ZOVL+35f8MT2H/NKRJvVEYb1qOVVfvfsVS/CJBquQXwWagPtYKFnqYB1DGG1MobPwCIoqN2hIT
	QAW6l5I7w2GrulBs6D1IvcJ2T1LXPxJFqt5SEPMm5CmgYvtUvoyWDPg7TpIkBLR+QQ+dTJMHGKFPL
	eFReBxcJxqqnqiLGPa3/3L33r419ePxL0QEdYHcMhtBGw5epEZrhHbBRY2kUcDX2uLvjKGBOcQpSv
	1EmUqInw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3cVf-0000000El5s-0JSi;
	Wed, 23 Oct 2024 14:38:51 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3cSa-0000000Ek64-0YjS;
	Wed, 23 Oct 2024 14:35:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DAD1FA44F78;
	Wed, 23 Oct 2024 14:35:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56A0DC4CEC6;
	Wed, 23 Oct 2024 14:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729694138;
	bh=azQJ3eGowkkRjf7a7p4DUvh4rfik/bDhwyFQa/WiKhg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZnYAi8xhKVOwyN23dtadpHuhJyihl2MDeOhcQoE63BUztJTDrQrBBwrL0rvXULRRk
	 /EFa+6zg5Ddujjug7EamJ/cDRT+F0n5FadFPs185ur2IGAhnK07Kmcr8OjBt76bQ89
	 xdKfco3k3sJZQ9GLwbol3zWK6QVhvu+w4FRlxVHZXIFRI2mwDg7qL2wQ+HR6rKvF8G
	 kUo/FrbFc4h6odrkyoxm7pftbyFcU+pO7+Bz6hiRg52IOGIvtWkFV3jNHNRyyPyj+a
	 iXHCBRPQD5/Viy+XTVHPQU2zx7IYfNY9fpUDzARmP5MmPnJpLyUW0Gxe88IYv5BtAg
	 YvuzrVYk9TYRg==
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-71ea2643545so4675785b3a.3;
        Wed, 23 Oct 2024 07:35:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUeLmC8Di9NMphqUkhYZvVRac94FFyHPpZW9LkDHdRPY9b/R9sEZAqvC1PPrgu9gisNYP4ZHMC+A36yz1gSL4A=@lists.infradead.org, AJvYcCXe/AIK/QSa4XzFvfR9PVCRX1EtuknCF/tr2IpKfpP/p4LB8SbAXoJD6L0AQvr3lBWP1UA4CcAEVNTheyXEiLM/@lists.infradead.org
X-Gm-Message-State: AOJu0YxtKh6GxxDcmjhlCGbwte35C0GgurECglvyLD4Mzbd5WtQ9oCQU
	ESXA49e6SG1/hUbVip9PW9ODdDExOr1eP2DxCRU/5WmTaSrrQd6F70/JgklHJuClHIlcyzmkM2+
	Fnxi7VgogWADbn1ijQmEIJ7DvBg==
X-Google-Smtp-Source: AGHT+IGotfPUjuCyXnHej963WsiwtwAVlBk0onYdkHZONBPgcS/jZacTHxq70ShX22L6ObDnMI+HTy8A/5j0aUTa/2E=
X-Received: by 2002:a05:6a00:3d15:b0:70b:176e:b3bc with SMTP id
 d2e1a72fcca58-72030bdca55mr4263603b3a.28.1729694137938; Wed, 23 Oct 2024
 07:35:37 -0700 (PDT)
MIME-Version: 1.0
References: <20241003030919.17980-1-macpaul.lin@mediatek.com> <20241003030919.17980-4-macpaul.lin@mediatek.com>
In-Reply-To: <20241003030919.17980-4-macpaul.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 23 Oct 2024 22:35:58 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-6tHK7xq3JUWSX--2mZqHQE-bzfaCwzuYHY5crFtYNxQ@mail.gmail.com>
Message-ID: <CAAOTY_-6tHK7xq3JUWSX--2mZqHQE-bzfaCwzuYHY5crFtYNxQ@mail.gmail.com>
Subject: Re: [PATCH v6 4/4] dt-bindings: display: mediatek: dpi: correct
 power-domains property
To: Macpaul Lin <macpaul.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yong Wu <yong.wu@mediatek.com>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Rohit Agarwal <rohiagar@chromium.org>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, 
	Alexandre Mergnat <amergnat@baylibre.com>, Bear Wang <bear.wang@mediatek.com>, 
	Pablo Sun <pablo.sun@mediatek.com>, Macpaul Lin <macpaul@gmail.com>, 
	Sen Chu <sen.chu@mediatek.com>, Chris-qj chen <chris-qj.chen@mediatek.com>, 
	MediaTek Chromebook Upstream <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
	Chen-Yu Tsai <wenst@chromium.org>, Jitao Shi <jitao.shi@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_073540_327595_7993EF0E 
X-CRM114-Status: GOOD (  25.64  )
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

Hi, Macpaul:

Macpaul Lin <macpaul.lin@mediatek.com> =E6=96=BC 2024=E5=B9=B410=E6=9C=883=
=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=8811:09=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> The MediaTek DPI module is typically associated with one of the
> following multimedia power domains:
>  - POWER_DOMAIN_DISPLAY
>  - POWER_DOMAIN_VDOSYS
>  - POWER_DOMAIN_MM
> The specific power domain used varies depending on the SoC design.
>
> These power domains are shared by multiple devices within the SoC.
> In most cases, these power domains are enabled by other devices.
> As a result, the DPI module of legacy SoCs often functions correctly
> even without explicit configuration.
>
> It is recommended to explicitly add the appropriate power domain
> property to the DPI node in the device tree. Hence drop the
> compatible checking for specific SoCs.

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Fixes: 5474d49b2f79 ("dt-bindings: display: mediatek: dpi: Add power doma=
ins")
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Pablo Sun <pablo.sun@mediatek.com>
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  .../display/mediatek/mediatek,dpi.yaml        | 24 ++++++++-----------
>  1 file changed, 10 insertions(+), 14 deletions(-)
>
> Changes for v2:
>  - Because of the corresponding dts fix has been reviewed with a Reviewed=
-by: tag.
>    [1] https://lore.kernel.org/all/20240925080515.16377-1-macpaul.lin@med=
iatek.com/
>    We still need this change to fix the 2 dtbs_check errors.
>    So keeps no change here.
>
> Changes for v3:
>  - The origin patch is [2]
>    https://lore.kernel.org/all/20240926111449.9245-2-macpaul.lin@mediatek=
.com/
>  - Thanks for Conor's reminding, after MediaTek's internal discussion,
>    This patch v3 is the replacement of [2] v2.
>    Because the DPI module should has a explicit configuration with power =
domain.
>  - Drop Acked-by: tag since v3 is nearly a new patch for different approa=
ch.
>
> Changes for v4:
>  - No change. Please help to review it again.
>
> Changes for v5:
>  - Add missing Reviewed-by Tag from Krzysztof. Thanks.
>
> Changes for v6:
>  - No change.
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.=
yaml
> index 3a82aec9021c..497c0eb4ed0b 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yam=
l
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yam=
l
> @@ -63,6 +63,16 @@ properties:
>        - const: sleep
>
>    power-domains:
> +    description: |
> +      The MediaTek DPI module is typically associated with one of the
> +      following multimedia power domains:
> +        POWER_DOMAIN_DISPLAY
> +        POWER_DOMAIN_VDOSYS
> +        POWER_DOMAIN_MM
> +      The specific power domain used varies depending on the SoC design.
> +
> +      It is recommended to explicitly add the appropriate power domain
> +      property to the DPI node in the device tree.
>      maxItems: 1
>
>    port:
> @@ -79,20 +89,6 @@ required:
>    - clock-names
>    - port
>
> -allOf:
> -  - if:
> -      not:
> -        properties:
> -          compatible:
> -            contains:
> -              enum:
> -                - mediatek,mt6795-dpi
> -                - mediatek,mt8173-dpi
> -                - mediatek,mt8186-dpi
> -    then:
> -      properties:
> -        power-domains: false
> -
>  additionalProperties: false
>
>  examples:
> --
> 2.45.2
>

