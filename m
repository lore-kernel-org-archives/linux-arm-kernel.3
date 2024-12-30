Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 262FBE77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Dec 2024 14:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8vuO3kMZvabJsPi5AjzgLozU2jxjOb2taqZL1JhVCdE=; b=VeDF9nnitYqviSKfjObvWd490U
	kiPuO1kGBtiwZimxzm0J3nr+Sfzc9voNCTfaWccpDYfgt/KdBohaCrOEqe7s7VD9ke+W7lj9vKS9I
	pvCZcNFN72adN6ZxjWwQeRFeqYyXd6d4YO+opNwWNLIYY7scqwDccu4HmyGs1Ycei/5QVaw8gpL/4
	WQNIptakRQDISbBhocOwAw6o0oLqVoZJi9ykceDvBEPR85tKcMMhXEMksJUW7vUC1Gzp3YQfRHHIn
	3CRiXaQ58aTEN1sDPrAdizHJw3UNap63jedr8Sdsajh0FypAZrvtIjSStL228v116YrUqCeQQGQSJ
	5MLFAEyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSH2O-00000005NjD-1aSJ;
	Mon, 30 Dec 2024 14:46:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSH1D-00000005Nd2-1iwc;
	Mon, 30 Dec 2024 14:45:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 726535C5BD7;
	Mon, 30 Dec 2024 14:44:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2E81C4CED4;
	Mon, 30 Dec 2024 14:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735569918;
	bh=WI+NkNOipLWPbdl8Ai0uXMv9gV+VvTtRbrScwl1kVbM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=af8uBNSpUmHH2XfQQmtrPRSmD8YCVHTaGGSZQPmubi1IYmiML95dnAIip4oCfyuwz
	 DB3GV0u2M487Fc2ziWcydABK0oBCOJojpreJPvk4zV5UlTfI9j/u8strJAL6UybdEh
	 SR5h4UxCZJs/UJdYVTnDO9Uzw7KJ1+p90IuN7TiWCozfMLeCfeAyCeqvaQ/1mrQFCq
	 AHdhpjZUIRhkGdGnsegSjCFqfjUEi80Bn+WBCTcAPW0RXjzbYxFOjrtzhlBMixjYb3
	 yzyPu4Zepa25WoqQWOMARw1ohrk9jO8hAoouAkrD36HmF4hQhbkJp5wQxHQLuT5YOc
	 yQyl/IhIt7xjw==
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2eed82ca5b4so11968749a91.2;
        Mon, 30 Dec 2024 06:45:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUWTHv/ptV2hFnHRtC9JOtWACMftTeJLqC0zQ2FHC0k1wCHa6uDyjZskKCI/p/JwXmrtA9gN53TsXX71pZ5Gr4=@lists.infradead.org, AJvYcCX1WT3b3aLQ/pvk9Cr+FYc8/0yofje+eHUKN58QAl0vKADrMFOUq3QQFbNSQhg/XjebbjE2j71GTQAecIzdIM6/@lists.infradead.org
X-Gm-Message-State: AOJu0YwtdpXwULx3Bh83HXwkgkhgN/o9e76lNyTRQQu/DV/WK4yYCBXA
	3t/e61liDfg9wt1Pnt4sgg2d03zZ6/A3djws9MddFW7r6aV4o/ShlaAxO/ZotBN7kCoficNjRU+
	YDWawB0vrBeL9U8jtUOPQ39skxg==
X-Google-Smtp-Source: AGHT+IGqBjofA/9ZD/GcwInvNoJpn3Bcz2gP5ADkT6kMX87x83YxDQetl+FMgD2Y0zy3a2LSykWpXd7X4STelitYQeM=
X-Received: by 2002:a17:90b:518d:b0:2ee:5958:828 with SMTP id
 98e67ed59e1d1-2f452e214admr54708663a91.9.1735569914855; Mon, 30 Dec 2024
 06:45:14 -0800 (PST)
MIME-Version: 1.0
References: <20241105090207.3892242-1-fshao@chromium.org>
In-Reply-To: <20241105090207.3892242-1-fshao@chromium.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 30 Dec 2024 22:45:48 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9tnJbhF2fGzAcjdHb=uMGaHyqeHZvL=Whb9GJZCUupPA@mail.gmail.com>
Message-ID: <CAAOTY_9tnJbhF2fGzAcjdHb=uMGaHyqeHZvL=Whb9GJZCUupPA@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: display: mediatek: dp: Reference common
 DAI properties
To: Fei Shao <fshao@chromium.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_064519_535777_55BD11D6 
X-CRM114-Status: GOOD (  17.76  )
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

Hi, Fei:

Fei Shao <fshao@chromium.org> =E6=96=BC 2024=E5=B9=B411=E6=9C=885=E6=97=A5 =
=E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=885:02=E5=AF=AB=E9=81=93=EF=BC=9A
>
> The MediaTek DP hardware supports audio and exposes a DAI, so the
> '#sound-dai-cells' property is needed for describing the DAI links.
>
> Reference the dai-common.yaml schema to allow '#sound-dai-cells' to be
> used, and filter out non-DP compatibles as MediaTek eDP in the same
> binding doesn't support audio.
>
> This fixes dtbs_check error:
>   '#sound-dai-cells' does not match any of the regexes: 'pinctrl-[0-9]+'

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Signed-off-by: Fei Shao <fshao@chromium.org>
> ---
>
> Changes in v2:
> - reference to dai-common.yaml since the hardware exposes DAI
>   and update to `unevaluatedProperties: false`
> - update commit message
>
>  .../display/mediatek/mediatek,dp.yaml         | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
dp.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.ya=
ml
> index 2aef1eb32e11..75ce92f4a5fd 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
> @@ -42,6 +42,9 @@ properties:
>    interrupts:
>      maxItems: 1
>
> +  '#sound-dai-cells':
> +    const: 0
> +
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
>      properties:
> @@ -85,7 +88,21 @@ required:
>    - ports
>    - max-linkrate-mhz
>
> -additionalProperties: false
> +allOf:
> +  - $ref: /schemas/sound/dai-common.yaml#
> +  - if:
> +      not:
> +        properties:
> +          compatible:
> +            contains:
> +              enum:
> +                - mediatek,mt8188-dp-tx
> +                - mediatek,mt8195-dp-tx
> +    then:
> +      properties:
> +        '#sound-dai-cells': false
> +
> +unevaluatedProperties: false
>
>  examples:
>    - |
> --
> 2.47.0.277.g8800431eea-goog
>

