Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE94EC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 13:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z7HaqtWWyuFzFnOJ20NGJ/FsNpK67oSNX57atoEk7Hw=; b=zdbuAvsUiiW5vuUt0YBnv0fgF1
	PWIsEaGEVAbr7FxvDB2Ssi6Zlq7YOdSs6NDCQYpn9ow0zlWZhw8zJP0X6oXJODc0vmbLDJSx5+KGM
	K4rhjVElnc7by0T2TP4Dygkn8Q9fF7tAPduZrYic54P4cRiBWRqCEfU5taltdesPf/x8pkeD63XvO
	nrWZS9Rgc5GXYcmJI7p9UWuQxVFa4VQHz+3aRTXXoavPqvA22y4nC1Ereg5gJwlvmu7Y9MTMMb24A
	XFcCxPhNT6eVkW3j3JuxEu8wHRAVbx+h7m77JWNsPSpJ+EQL8ZWZt5berIewHyzyLuizp4GnwVKjF
	DyUdU1Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp698-00000000yc9-3Ngt;
	Mon, 03 Mar 2025 13:47:50 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp5kJ-00000000tYu-2R8Q;
	Mon, 03 Mar 2025 13:22:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 28A4C611E3;
	Mon,  3 Mar 2025 13:22:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56406C4CEED;
	Mon,  3 Mar 2025 13:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741008130;
	bh=cyAIDvH42HlK42zH1AZZ7W0u8yvqehARnSYevut+Mvw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=c/AhB5qEabaK+aGFMVK/mFIuucVYjGzZAk7HdUEOEz2mZCuWZRzB9TmVLCrERWDN5
	 OC3uJ8TorONGnXWfIFQmcnQmo1J+tPz7jKCiWTOrHgzEzM6TjKgawRn5EjTjpfa+Vd
	 hQbJAAo8DaI/V4nFvyoBVzOlg2VyPBFMczw0uHOJF4cvkb3FC2jgJWI9k3gCwACoBT
	 QyXng99JRn6+4oOBzcoxgc+0yF81Wre66HialtHEmysgApJfX9TYc/pCrPFm0+nEWV
	 YlKl7U1UpJaE6vvS5QoHCrEsqQCKCMysMl4JglksrOiXPPCibfyukuN5ukmr78zUnS
	 SCd6ppVo7A+6g==
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2feb9076a1cso6824203a91.0;
        Mon, 03 Mar 2025 05:22:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCULaMUfW66/OtgmzSPMWPv1fpx1klUTkt7rfUVdspwIeT+4p95zREAbLWSGofGJ9bYf7FtCKv3ZExzCKJTOAeY=@lists.infradead.org, AJvYcCVlVHJ1AUVGp+/4I8JEZmtUntl+p1F1VUwLzVEEh/KVIKmzfkFcxkNYdJ06kX5F6KdhbZU1TCeQ9yqhv6dQQbi7@lists.infradead.org
X-Gm-Message-State: AOJu0YylxvhdUuyzJLoryAKqOfKBAbiFUjZEa3NWnuP/S6xl401eB2QR
	Tz8/nRIP7RTxsNVqVgL8I+iWWcBIOb/5+9rgw6/C3u7JgZSryI1t5Ssc2nNAlRterkERY96dpzP
	99NTqA4L++IaYA5PcnkR6GmTFMw==
X-Google-Smtp-Source: AGHT+IHQLK7la/7RxxVx5xQub2rrCyzIXTBwqCYNHPZA1L5Z+HvrKvHgKF1EVP50ng2pCoNbxnqwqT1ThMWF+DeLMfM=
X-Received: by 2002:a17:90b:1cc6:b0:2fc:3264:3657 with SMTP id
 98e67ed59e1d1-2febaa92594mr25361600a91.0.1741008129875; Mon, 03 Mar 2025
 05:22:09 -0800 (PST)
MIME-Version: 1.0
References: <20231023-display-support-v7-0-6703f3e26831@baylibre.com> <20231023-display-support-v7-1-6703f3e26831@baylibre.com>
In-Reply-To: <20231023-display-support-v7-1-6703f3e26831@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 3 Mar 2025 21:22:55 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8c4xeE=c4MTGopenORaP-PL66exLG+erKSV1fpoGJU+g@mail.gmail.com>
X-Gm-Features: AQ5f1JrckMOh9P4yJQbwlfuWcX_03D8O22eeIcknRD2YAlMiCLxngtVQQLy-TeY
Message-ID: <CAAOTY_8c4xeE=c4MTGopenORaP-PL66exLG+erKSV1fpoGJU+g@mail.gmail.com>
Subject: Re: [PATCH v7 1/6] dt-bindings: display: mediatek: dpi: add
 power-domains example
To: amergnat@baylibre.com
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Fabien Parent <fparent@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi, Amergnat:

<amergnat@baylibre.com> =E6=96=BC 2025=E5=B9=B41=E6=9C=8810=E6=97=A5 =E9=80=
=B1=E4=BA=94 =E4=B8=8B=E5=8D=889:31=E5=AF=AB=E9=81=93=EF=BC=9A
>
> From: Fabien Parent <fparent@baylibre.com>
>
> DPI is part of the display / multimedia block in MediaTek SoCs, and
> always have a power-domain (at least in the upstream device-trees).
> Add the power-domains property to the binding example.

Applied to mediatek-drm-next [1], thanks.

[1] https://web.git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.=
git/log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Fixes: 9273cf7d3942 ("dt-bindings: display: mediatek: convert the dpi bin=
dings to yaml")
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml | 2=
 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.=
yaml
> index 0f1e556dc8ef..d5ee52ea479b 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yam=
l
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yam=
l
> @@ -116,11 +116,13 @@ examples:
>    - |
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
>      #include <dt-bindings/clock/mt8173-clk.h>
> +    #include <dt-bindings/power/mt8173-power.h>
>
>      dpi: dpi@1401d000 {
>          compatible =3D "mediatek,mt8173-dpi";
>          reg =3D <0x1401d000 0x1000>;
>          interrupts =3D <GIC_SPI 194 IRQ_TYPE_LEVEL_LOW>;
> +        power-domains =3D <&spm MT8173_POWER_DOMAIN_MM>;
>          clocks =3D <&mmsys CLK_MM_DPI_PIXEL>,
>               <&mmsys CLK_MM_DPI_ENGINE>,
>               <&apmixedsys CLK_APMIXED_TVDPLL>;
>
> --
> 2.25.1
>

