Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1904E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 11:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t4dlcaH2CKa+SEeb9mNt7wLgohLESub7EKOQ+sS7kcQ=; b=re3X+Ydnlx822bWWIB4W9HG1Rn
	BYRDbziVCVRONwqJbaf0CUBCnlCIgJCfGcvq5QOU2zPpVj0gf/33cdSrnv+wAlR1GjRddx3cIt1K9
	Ou17N9jAaxZ930W/6H2Y6aCEYCrY9ZFgOfKLPAQsc6b2laCQ3xcVnt8M09EHeosxwlCefOjul3q8O
	8SnUvj3lZyX/QdqqCjfE5eWCsXVMo1glpkKcbMu79ibuq298ATF6N5ikzUiJjeFBLsU63Fif5bfcf
	/80peia7FXu+Usjh609cdAUI8oGann4V0NOOl3JZKQXaa0MPgTDmFTqijhehqrNZTm8O+BN6j4Zd/
	nU3Nrf+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ3B4-0000000BsEw-2rlV;
	Tue, 24 Dec 2024 11:34:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ39s-0000000Bs2J-2NNe;
	Tue, 24 Dec 2024 11:33:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 471D15C5EB8;
	Tue, 24 Dec 2024 11:32:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0D94C4CEDE;
	Tue, 24 Dec 2024 11:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735039983;
	bh=RDQAjNOAdC8KLqZh7kvEfTA7Zk449zVSYCNgtWtHXMk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OiLxFpAiR56DYABPtJKsbmozRm+7qCsdT+CsY94qwJ/LPZoK7rAcobBkuwSUPyENn
	 eWPaliTjS9rjywxLZR/Ksss7Jb7IRyk9SmdRirifHnI5O72xs/OVJhaZWsCMEsYSdP
	 5m3gcB3iFkLHR7v9yUxwArzoiYSUhIaDCjXlS9fTPPpIY3oFY3uJo9LgWbI/E00Vo3
	 rBLKoXmVo92L5C0eyJUL2WF6Vmsx4eoS9cjY9ktCdXSVvWXPiewtCca60GT1Bnr7Y0
	 k0CRRbLive4FS26PtlGoODE8I+FsHwrlAaXekMSlFTTZHpwHZ90vVBw+XXYwcdYu5m
	 sf9St7Bk1ZXVw==
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2f43da61ba9so4443110a91.2;
        Tue, 24 Dec 2024 03:33:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVUvGMDM7K4iselEaFHWNuuMxwMrz8aQHnAT/OntwEoUFIGvqm1zDqVaGL4Lk2q87OyweACjllUPo0KH96iki8=@lists.infradead.org, AJvYcCXn4XZd0hgmtWXegR3oaZKRlbr9y9pYurqqu8rvXlaam3E1LR/5hVThFfxtDybZXk6VEVdNm1fDkT0EXJZqV3aG@lists.infradead.org
X-Gm-Message-State: AOJu0YyrAvSFxino4tZckudpoj8cu9IRt/gip2lrhK1L/uZfI4A9VqRS
	+ZViss4t45GlEXXeTnaWr6Lcz72xETYAP1elEU+a3C/7SJROVj1FVUbnWa97NnjppOqWCIVzxiv
	y20whxx2QSJsjjwUYEjevgLwWWg==
X-Google-Smtp-Source: AGHT+IGjk5EjNkRdP4/egK3HpkP0kg9EvE0XRDFf66/0s82KLvsrvKxQ79Fnquu0pdesdRpeuQ8UYTFz1+bWSm5jFBI=
X-Received: by 2002:a17:90a:d64e:b0:2ee:a4f2:b311 with SMTP id
 98e67ed59e1d1-2f452dfae72mr26965676a91.8.1735039983380; Tue, 24 Dec 2024
 03:33:03 -0800 (PST)
MIME-Version: 1.0
References: <20241219181531.4282-1-jason-jh.lin@mediatek.com> <20241219181531.4282-3-jason-jh.lin@mediatek.com>
In-Reply-To: <20241219181531.4282-3-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 24 Dec 2024 19:33:35 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9dApKQ2C_rYBQ8eH7b17dmZntvAND+BYfgkRms1gEbmw@mail.gmail.com>
Message-ID: <CAAOTY_9dApKQ2C_rYBQ8eH7b17dmZntvAND+BYfgkRms1gEbmw@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] dt-bindings: display: mediatek: ovl: Modify rules
 for MT8195/MT8188
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, 
	Shawn Sung <shawn.sung@mediatek.com>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, 
	Fei Shao <fshao@chromium.org>, Pin-yen Lin <treapking@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_033304_695369_FE25A7B6 
X-CRM114-Status: GOOD (  11.04  )
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

Jason-JH.Lin <jason-jh.lin@mediatek.com> =E6=96=BC 2024=E5=B9=B412=E6=9C=88=
20=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=882:15=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> From: Hsiao Chien Sung <shawn.sung@mediatek.com>
>
> Modify rules for both MT8195 and MT8188.
> Hardware capabilities include color formats and AFBC are
> changed since MT8195, stop using the settings of MT8183.

Acked-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

>
> Acked-by: Rob Herring <robh@kernel.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>  .../bindings/display/mediatek/mediatek,ovl.yaml          | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
ovl.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.=
yaml
> index 33542211507f..4f110635afb6 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yam=
l
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yam=
l
> @@ -26,6 +26,7 @@ properties:
>            - mediatek,mt8173-disp-ovl
>            - mediatek,mt8183-disp-ovl
>            - mediatek,mt8192-disp-ovl
> +          - mediatek,mt8195-disp-ovl
>            - mediatek,mt8195-mdp3-ovl
>        - items:
>            - enum:
> @@ -36,16 +37,14 @@ properties:
>            - enum:
>                - mediatek,mt6795-disp-ovl
>            - const: mediatek,mt8173-disp-ovl
> -      - items:
> -          - enum:
> -              - mediatek,mt8188-disp-ovl
> -              - mediatek,mt8195-disp-ovl
> -          - const: mediatek,mt8183-disp-ovl
>        - items:
>            - enum:
>                - mediatek,mt8186-disp-ovl
>                - mediatek,mt8365-disp-ovl
>            - const: mediatek,mt8192-disp-ovl
> +      - items:
> +          - const: mediatek,mt8188-disp-ovl
> +          - const: mediatek,mt8195-disp-ovl
>        - items:
>            - const: mediatek,mt8188-mdp3-ovl
>            - const: mediatek,mt8195-mdp3-ovl
> --
> 2.43.0
>

