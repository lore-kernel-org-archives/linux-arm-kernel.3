Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27AD1CF539D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 14:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dKAMRbftUhDsnB3DO79E2412q0qL9eT88TYwlyR5GDU=; b=4C9Z+GWbF5kX+38qAGbl+q2c9G
	/y9xVNj1ZJLoDAQaFn+67+cxOJfiRYYNDeix2TzO7rN76Z2JNkxyHqyxCeubT3J/JZ1W+wNC6zcAg
	D2R5sO4vowZ4diZP2K7j4eYhRTgyVH9k4oHWhXt88zgbp+MHa5sSeeB6qOGARYQSxyEgCCIIxnelb
	5WI/kt1Eg34m1deD24Ms0h5ZSCj2UglRKOBhvsYRObpfHPEPNNtEuwHjuyZcngfkjyzRfjINWiBi4
	rEG51V8wIk2r3aKxH0vLI1CW8bujdBfuA8C+2CQ7rTWS4t8ygFy5TAEFN5hzVMof7Vm0ofoDlHg6f
	Ab43jYFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3clX-0000000EphR-0tlU;
	Wed, 23 Oct 2024 14:55:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ci6-0000000Eofy-0WPr;
	Wed, 23 Oct 2024 14:51:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B5CE95C5ECA;
	Wed, 23 Oct 2024 14:51:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8EF0C4AF0B;
	Wed, 23 Oct 2024 14:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729695099;
	bh=V0WnmKHkiubGXH7powCeniKJAeXlAH+b4/k8QVVp3oY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZI5jh9RfHhvV8BXkELReKNk+DT5nZqXcJQanuVnxbnJiUgBsPdOYsrZ4QuA6Vuq+a
	 8E75CpBgCCLrwe7L+V580X5wva+3hC4FC5gD1J+WnmyMBAYMCRHkE1nOTY19p+OlGC
	 8GmNkH2/H8NL+4iF41aadGcdnmWOCFp9tdYr8v2ZxeMO48fhIJ+XZtLd09ZtI4goW4
	 aq2+0nIlPcOtIx8f3RTUJXJYXIP4Z47kWuuTIYCui5KPSnfl0RgWnoB32USvY/CqT8
	 jL0ZX85cCrSW7lldtTW0H7wxv16fFYmGswFSIE3yUaUR3HMnvCYUBgkgFwNrlJzYPJ
	 WMs3m3CbPiqmA==
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2e3d523a24dso5156495a91.0;
        Wed, 23 Oct 2024 07:51:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWUyqkGxTCHS+cgSvM/k21z8qnaoFMbiKypL9HkRIOYZR9dGuPniytdtc6n0mDYFu9XoFkwcSloEo8KHOo/avEz@lists.infradead.org, AJvYcCXQDxtvmZDDnk7o3e9icql44PUI1p0jwE4Cz1AdoZmlmsNFnSPqUWHSesBFwWoFYxMcGD2VGl7hUGQobAIE3j8=@lists.infradead.org
X-Gm-Message-State: AOJu0YxQmsO5x8TlYa88CgUqMR9EljNz2WGArDFuI4ylIQd58J8OClJN
	05C3J9vlmDiOejG7O5QtpeZ/SuN6Vh0ol2WfC/OHIa5GEa3+m/RfKTIr2ZlCHp+94JjPP/rFqcg
	Yg6mGE/YIF+TgPHHXoWXp3PUJRQ==
X-Google-Smtp-Source: AGHT+IGiOV49HPeVWqZgqUDfen8sjZxWmSvuRAGE4z98/inzDbsAH3T7NKTZ/wjACKOgmYMVQ+VQCdv4ftbQedq6e9Q=
X-Received: by 2002:a17:90a:d512:b0:2e2:e545:82c5 with SMTP id
 98e67ed59e1d1-2e76b5b7edcmr3019116a91.3.1729695099200; Wed, 23 Oct 2024
 07:51:39 -0700 (PDT)
MIME-Version: 1.0
References: <20241007022834.4609-1-moudy.ho@mediatek.com>
In-Reply-To: <20241007022834.4609-1-moudy.ho@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 23 Oct 2024 22:52:00 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-jPWv1nHf9NnxNkVW2+ZOFOagAPf1DFQu5AD1KnCQNYw@mail.gmail.com>
Message-ID: <CAAOTY_-jPWv1nHf9NnxNkVW2+ZOFOagAPf1DFQu5AD1KnCQNYw@mail.gmail.com>
Subject: Re: [PATCH v5] dt-bindings: display: mediatek: split: add subschema
 property constraints
To: Moudy Ho <moudy.ho@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Macpaul Lin <macpaul.lin@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_075142_279813_BBB47BE4 
X-CRM114-Status: GOOD (  18.48  )
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

Hi, Moudy:

Moudy Ho <moudy.ho@mediatek.com> =E6=96=BC 2024=E5=B9=B410=E6=9C=887=E6=97=
=A5 =E9=80=B1=E4=B8=80 =E4=B8=8A=E5=8D=8810:28=E5=AF=AB=E9=81=93=EF=BC=9A
>
> The display node in mt8195.dtsi was triggering a CHECK_DTBS error due
> to an excessively long 'clocks' property:
>   display@14f06000: clocks: [[31, 14], [31, 43], [31, 44]] is too long
>
> To resolve this issue, the constraints for 'clocks' and
> other properties within the subschemas will be reinforced.

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Fixes: 739058a9c5c3 ("dt-bindings: display: mediatek: split: add compatib=
le for MT8195")
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
>
> --
> This is based on [v2] dt-bindings: display: mediatek: split: add clocks c=
ount constraint for MT8195
>
> Changes since v4:
>   - Eliminate the possibility of varying quantities in the 'clocks'
>     property of mt8195.
>   - Move the constraint for 'power-domains' to the top-level.
>
> Changes since v3:
>   - Correct the compatible name for the mt8173 split in the subschema.
>
> Changes since v2:
>   - Revise the commit message.
>   - Enhance the descriptions of 'clocks'.
>   - Strengthen the conditions within the subschema.
>
> Changes since v1:
>   - Adding functional descriptions and quantity restrictions.
> ---
>  .../display/mediatek/mediatek,split.yaml      | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
split.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,sp=
lit.yaml
> index e4affc854f3d..4b6ff546757e 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,split.y=
aml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,split.y=
aml
> @@ -38,6 +38,7 @@ properties:
>      description: A phandle and PM domain specifier as defined by binding=
s of
>        the power controller specified by phandle. See
>        Documentation/devicetree/bindings/power/power-domain.yaml for deta=
ils.
> +    maxItems: 1
>
>    mediatek,gce-client-reg:
>      description:
> @@ -57,6 +58,9 @@ properties:
>    clocks:
>      items:
>        - description: SPLIT Clock
> +      - description: Used for interfacing with the HDMI RX signal source=
.
> +      - description: Paired with receiving HDMI RX metadata.
> +    minItems: 1
>
>  required:
>    - compatible
> @@ -72,9 +76,24 @@ allOf:
>              const: mediatek,mt8195-mdp3-split
>
>      then:
> +      properties:
> +        clocks:
> +          minItems: 3
> +
>        required:
>          - mediatek,gce-client-reg
>
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mediatek,mt8173-disp-split
> +
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 1
> +
>  additionalProperties: false
>
>  examples:
> --
> 2.34.1
>

