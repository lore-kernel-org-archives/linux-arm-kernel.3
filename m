Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B00EFC72BE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Mar 2026 13:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OQRUTYgQzIIg7u131wIzsEAQOQhWgOgeqUwoX6W6EIY=; b=eny3Vy55BHRiTygGmP3YTPucBY
	DwZ5lZ0wgq3ebhQcu8ZQBl68YShzbPchmrAFWNiQoNKXMxOEWb2DZBCTmN7Y04CPTzo2cVPwWjNgn
	WGyXmb+C8h3WsubUf5MTKiM1ql9o6dojTbzNA2YI+KkvP/Fpn8qgfCpTcBqrRxqENcqNoBD4hB1HT
	OEBJVfb/tUCJ8WFlD131Ux4/z2sTYLbRkZHx6+i0aOTo5vqeyvwpBCic0PAfmaWhqkp4P14t5wsPn
	gRpjyDjUcSuu660PvSPQnCAbN2NSL0wLutnSSdMpjtOZPtgi0VRTMeehr1nv5GwCbWknTX+oxD7/s
	nhsm964g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4Iio-0000000FMSd-0oBY;
	Sun, 22 Mar 2026 13:20:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4Iil-0000000FMRV-1ImJ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Mar 2026 13:20:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 89B0844025
	for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Mar 2026 13:19:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 598A8C2BCB8
	for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Mar 2026 13:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774185598;
	bh=bcTUujmXxizlUqd1sM50ZYzCfrRpy1teVAj8QUv5Ak0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=afqOq+J4bNtVYGMLZ5UCHcztKaNy5UtEIh62lUMWpb770IdA/OfXE0sYZH48IRBG5
	 SFqddCI+8gDgkyX1HPUVGSw6dBQZ+ywfmXCHhGnrU8qPD9FsfjDGuCDdVcQYy2uhIl
	 4riE5Gy/CcVpcf8mUceyYMUK/FRTRhpkYMuNLRyDsWdyfoTSHP6kNKCs3GltC56C5G
	 4Er4yZd4LXd4kO+k/BdrDGGKBFpUi3gLGCaBUxRT8KqLR7sLEjfDZ/9GfAgADh6fc2
	 x7mYEeEpExV5osub0tEY9tqLCp+tsQ8g+oKru13sSnx1YW9AMjE1NTQjbC4xMxvksM
	 uNHjpaGpHDRPQ==
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-128b9b7e3edso4396129c88.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Mar 2026 06:19:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUrphMSmbMiXI0+XXZF+LYuh3SwZ8CGiE2vKRJSvt9CzI1BgfcHIH5tSKFrpBebnKdPOSHHpkGy8xYY/CjHKzyO@lists.infradead.org
X-Gm-Message-State: AOJu0YzJH59f8qy9tKKX0bJul8Z/dewWxhLZZ2TjqiXg56ZayjB1Ant0
	ovIMtpeSFj5wRWnh3C8ZrVKkX4yz64uxl6XbPr4zzEYY/utYqBv9dOB5sPf4AXpPRHXOHIxN20G
	Mhgims314UETLh0w4Ii2v/00eAyZbQw==
X-Received: by 2002:a05:7022:69a5:b0:11e:163:be60 with SMTP id
 a92af1059eb24-12a726e614fmr4766178c88.31.1774185597620; Sun, 22 Mar 2026
 06:19:57 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1771863641.git.l.scorcia@gmail.com> <66eafae30f9fe00b469e79d385c1ddd24d209475.1771863641.git.l.scorcia@gmail.com>
In-Reply-To: <66eafae30f9fe00b469e79d385c1ddd24d209475.1771863641.git.l.scorcia@gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 22 Mar 2026 13:19:45 +0000
X-Gmail-Original-Message-ID: <CAAOTY_-gy+h904OZ4B0ddECrZ_-TXwhV-oMbnEALzxW9aCvzPg@mail.gmail.com>
X-Gm-Features: AaiRm52s6_W4s0e8TDIj9mPSVyXvcdr13JQX2HjRrQF8FFkKbDLC-ctIP3P5FJ0
Message-ID: <CAAOTY_-gy+h904OZ4B0ddECrZ_-TXwhV-oMbnEALzxW9aCvzPg@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] dt-bindings: display: mediatek: Add compatibles
 for MediaTek mt8167
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260322_061959_412228_8EA5A809 
X-CRM114-Status: GOOD (  13.91  )
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

Hi, Luca:

Luca Leonardo Scorcia <l.scorcia@gmail.com> =E6=96=BC 2026=E5=B9=B42=E6=9C=
=8823=E6=97=A5=E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=884:26=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> Add compatibles for various display-related blocks of MediaTek mt8167.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,aal.yaml    | 1 +
>  .../devicetree/bindings/display/mediatek/mediatek,ccorr.yaml  | 4 +++-
>  .../devicetree/bindings/display/mediatek/mediatek,dither.yaml | 1 +
>  .../devicetree/bindings/display/mediatek/mediatek,gamma.yaml  | 1 +
>  .../devicetree/bindings/display/mediatek/mediatek,ovl.yaml    | 1 +
>  .../devicetree/bindings/display/mediatek/mediatek,rdma.yaml   | 1 +
>  .../devicetree/bindings/display/mediatek/mediatek,wdma.yaml   | 4 +++-
>  7 files changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.=
yaml
> index daf90ebb39bf..4bbea72b292a 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yam=
l
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yam=
l
> @@ -33,6 +33,7 @@ properties:
>            - enum:
>                - mediatek,mt2712-disp-aal
>                - mediatek,mt6795-disp-aal
> +              - mediatek,mt8167-disp-aal
>            - const: mediatek,mt8173-disp-aal
>        - items:
>            - enum:
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,cc=
orr.yaml
> index fca8e7bb0cbc..5c5068128d0c 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.y=
aml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.y=
aml
> @@ -25,7 +25,9 @@ properties:
>            - mediatek,mt8183-disp-ccorr
>            - mediatek,mt8192-disp-ccorr
>        - items:
> -          - const: mediatek,mt8365-disp-ccorr
> +          - enum:
> +              - mediatek,mt8167-disp-ccorr
> +              - mediatek,mt8365-disp-ccorr
>            - const: mediatek,mt8183-disp-ccorr
>        - items:
>            - enum:
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
dither.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,d=
ither.yaml
> index abaf27916d13..891c95be15b9 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.=
yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.=
yaml
> @@ -26,6 +26,7 @@ properties:
>            - mediatek,mt8183-disp-dither
>        - items:
>            - enum:
> +              - mediatek,mt8167-disp-dither
>                - mediatek,mt8186-disp-dither
>                - mediatek,mt8188-disp-dither
>                - mediatek,mt8192-disp-dither
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
gamma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ga=
mma.yaml
> index 48542dc7e784..ec1054bb06d4 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.y=
aml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.y=
aml
> @@ -28,6 +28,7 @@ properties:
>        - items:
>            - enum:
>                - mediatek,mt6795-disp-gamma
> +              - mediatek,mt8167-disp-gamma
>            - const: mediatek,mt8173-disp-gamma
>        - items:
>            - enum:
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
ovl.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.=
yaml
> index 4f110635afb6..679f731f0f15 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yam=
l
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yam=
l
> @@ -23,6 +23,7 @@ properties:
>      oneOf:
>        - enum:
>            - mediatek,mt2701-disp-ovl
> +          - mediatek,mt8167-disp-ovl
>            - mediatek,mt8173-disp-ovl
>            - mediatek,mt8183-disp-ovl
>            - mediatek,mt8192-disp-ovl
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
rdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdm=
a.yaml
> index 878f676b581f..cb187a95c11e 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.ya=
ml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.ya=
ml
> @@ -36,6 +36,7 @@ properties:
>            - enum:
>                - mediatek,mt7623-disp-rdma
>                - mediatek,mt2712-disp-rdma
> +              - mediatek,mt8167-disp-rdma
>            - const: mediatek,mt2701-disp-rdma
>        - items:
>            - enum:
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
wdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,wdm=
a.yaml
> index a3a2b71a4523..816841a96133 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.ya=
ml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.ya=
ml
> @@ -24,7 +24,9 @@ properties:
>        - enum:
>            - mediatek,mt8173-disp-wdma
>        - items:
> -          - const: mediatek,mt6795-disp-wdma
> +          - enum:
> +              - mediatek,mt6795-disp-wdma
> +              - mediatek,mt8167-disp-wdma
>            - const: mediatek,mt8173-disp-wdma
>
>    reg:
> --
> 2.43.0
>

