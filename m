Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68CA5C021B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 13:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zF47/8EC2KHEsU4F8AzdjZS60vO+erdRnvGPlyuH6mU=; b=4HpKIyDcUJ5a7mJwLqkhpfPHcU
	2R/RX3Nt9rjr3jV+ytwzgkV9PZ04iB6pJNIyGs6jWHGtuCo2r5YpBlVdHG54N4X92R2eMersx4fpg
	0x0c4i10vXZssEfsTdMP2kzoMKJqbLtaY6x291reg6pkxumEd4Ezb38iKU5LO20fDFkyMIW/XpuWe
	tZ+ADgeyimirrPtiM/93MzqUOtknNs+dxDWOrf5xslsYrCq8LaGj2v9dNvnbnbyEQhdw01tKuGNRU
	wAQpTnKPNx6npVuwH1mm+DcYnluPh+3sXsFLNI8eLepjhJUW5PqRc3vXYzgYgwb2ID7TjEi1zMKJd
	BnHLwEDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkkTJ-0000000D4gi-1uRI;
	Wed, 19 Feb 2025 13:50:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkkRp-0000000D3xN-0FUA;
	Wed, 19 Feb 2025 13:49:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DAE9E5C597C;
	Wed, 19 Feb 2025 13:48:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCDF7C4CEE0;
	Wed, 19 Feb 2025 13:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739972947;
	bh=A1jQdtZvRbIjirpi/QpXD1jZ8tpStZUExtEIfK1U5Cc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IFIwFIYx0ARMx+0zY1HAfpnbVgkm//Wuvx46GSLkxcqt8pyR8cUWXdqQX9Ej8EiXY
	 lOcuGfIVJCls3eng4yKpq6pAOUAIFyjgJeOMXv/uc14jU0fNAWka+TYNrkG31Zby4A
	 q5VS+9iwtZOHE40aGcTDcdLU23EEaiFCpiIqVrn1HUceDqzWSED6ATPKac07FqWy18
	 xGWm3cfbewXnj16OJw5uP5S/dxWwk8fUQBiuNCzCP4YyUOTi2SA4nzyCv46RrN8pxN
	 geAc5o/X9/8YtXZmLfPdQPqnu0SC7k0Hm5aYQkVlcEXfFH68vkhwsmQAihN3TDx49u
	 +73uOfTOqinSg==
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2fc0026eb79so12733446a91.0;
        Wed, 19 Feb 2025 05:49:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW7NFLDK+bqr7TaQgOCs8EfojYDin5I+p1OD8mZ5kzkZ9KZW/CpythNUHWcOc3HyGCAsQz+2vpnzTKSS3eY6G71@lists.infradead.org, AJvYcCXBZtDtYMSCpD26gy8H2YyRKW0mJEZI5QSOvjL4KAx3jhEEU6Ousiac2BVBCbycM/EptT5HnclpZFCo9K3PbsY=@lists.infradead.org
X-Gm-Message-State: AOJu0YwJe9WYNLOE1NjXk69LexK7KzR415NUfaQVc/Z2xZSjB3/N7LIf
	MSi74XF2AQDDPX3vgihFTFfG4B4PZLyT3PpwpOF0VKqeFbUIkFod148WvFJpm128cE++ouxUte0
	GRSc6/Ic6OONzmVmHmBxEpJ7prA==
X-Google-Smtp-Source: AGHT+IHzQqtYsvHwADMmf9VWFRyvbp1G6Xfgzoq4kaeRwD/sC1OC2iDXSHRlVSxq3fcQCkZrXfrGdEMDnJjaCDjhs5g=
X-Received: by 2002:a17:90b:17c4:b0:2ef:2f49:7d7f with SMTP id
 98e67ed59e1d1-2fcb5a39f93mr6272302a91.18.1739972947332; Wed, 19 Feb 2025
 05:49:07 -0800 (PST)
MIME-Version: 1.0
References: <20241218105320.38980-1-angelogioacchino.delregno@collabora.com> <20241218105320.38980-2-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20241218105320.38980-2-angelogioacchino.delregno@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 19 Feb 2025 21:49:51 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9J4TE=qo+00N7T6-daMET+eTt8psp+eV1DXdgrz+avEQ@mail.gmail.com>
X-Gm-Features: AWEUYZkyNYkPz9DDQbj1WmcsisPQynG6ha2xkIpk0KuCjDPQnw0UB2_LYJk3Qtw
Message-ID: <CAAOTY_9J4TE=qo+00N7T6-daMET+eTt8psp+eV1DXdgrz+avEQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] dt-bindings: display: mediatek: Add compatibles
 for MT8188 MDP3
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	mchehab@kernel.org, matthias.bgg@gmail.com, moudy.ho@mediatek.com, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kernel@collabora.com, sebastian.fricke@collabora.com, 
	macpaul.lin@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_054909_185727_B3F02277 
X-CRM114-Status: GOOD (  11.95  )
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

AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> =E6=96=
=BC
2024=E5=B9=B412=E6=9C=8818=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=886:=
53=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Add compatible strings for the AAL, COLOR, MERGE and PADDING
> hardware components found in MediaTek's MT8188 SoC.
>
> This hardware is compatible with MT8195.

Acked-by: Chun-Kuang Hu <chunkuang.hu@mediatek.com>

>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  .../bindings/display/mediatek/mediatek,aal.yaml        |  4 ++++
>  .../bindings/display/mediatek/mediatek,color.yaml      |  4 ++++
>  .../bindings/display/mediatek/mediatek,merge.yaml      |  4 ++++
>  .../bindings/display/mediatek/mediatek,padding.yaml    | 10 +++++++---
>  4 files changed, 19 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.=
yaml
> index cf24434854ff..1479035da409 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yam=
l
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yam=
l
> @@ -25,6 +25,10 @@ properties:
>            - mediatek,mt8173-disp-aal
>            - mediatek,mt8183-disp-aal
>            - mediatek,mt8195-mdp3-aal
> +      - items:
> +          - enum:
> +              - mediatek,mt8188-mdp3-aal
> +          - const: mediatek,mt8195-mdp3-aal
>        - items:
>            - enum:
>                - mediatek,mt2712-disp-aal
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
color.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,co=
lor.yaml
> index 7df786bbad20..799c0b8fc1f9 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.y=
aml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.y=
aml
> @@ -27,6 +27,10 @@ properties:
>            - mediatek,mt8167-disp-color
>            - mediatek,mt8173-disp-color
>            - mediatek,mt8195-mdp3-color
> +      - items:
> +          - enum:
> +              - mediatek,mt8188-mdp3-color
> +          - const: mediatek,mt8195-mdp3-color
>        - items:
>            - enum:
>                - mediatek,mt7623-disp-color
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
merge.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,me=
rge.yaml
> index dae839279950..415a25bc18fa 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.y=
aml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.y=
aml
> @@ -25,6 +25,10 @@ properties:
>            - mediatek,mt8173-disp-merge
>            - mediatek,mt8195-disp-merge
>            - mediatek,mt8195-mdp3-merge
> +      - items:
> +          - enum:
> +              - mediatek,mt8188-mdp3-merge
> +          - const: mediatek,mt8195-mdp3-merge
>        - items:
>            - const: mediatek,mt6795-disp-merge
>            - const: mediatek,mt8173-disp-merge
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
padding.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,=
padding.yaml
> index be07bbdc54e3..86787866ced0 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,padding=
.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,padding=
.yaml
> @@ -20,9 +20,13 @@ description:
>
>  properties:
>    compatible:
> -    enum:
> -      - mediatek,mt8188-disp-padding
> -      - mediatek,mt8195-mdp3-padding
> +    oneOf:
> +      - enum:
> +          - mediatek,mt8188-disp-padding
> +          - mediatek,mt8195-mdp3-padding
> +      - items:
> +          - const: mediatek,mt8188-mdp3-padding
> +          - const: mediatek,mt8195-mdp3-padding
>
>    reg:
>      maxItems: 1
> --
> 2.46.1
>

