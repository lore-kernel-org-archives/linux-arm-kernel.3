Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AABF7C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Mar 2025 16:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rOb09eDfRreA7Ky6moGlxy8PbP6wGE+oKv371IUngk8=; b=KJGcrutr7YG9uu9lBEq6Sd3HRR
	Q7f/mel67s1yX+CE9TchL2TjdXTMjmFYzVAMjjZOpoRtVxOXnFtu/xhV14186XWiVyp7NUxqMrywF
	zv3isE8xe01zYEO78JnpU9j7OWY8WtZp61kVin4UAXQ5Oa55ekzP6eCblEscT4Xp5VK2TjvU+CaX5
	8ejYfUwbXmezj44VUnYzHDTY4ldA3SbvNRDafS30ABUY6Pz9/m/30NlXcKRSDWZoRFvu2ZbZh3X2h
	VDIdQ5/KlfYM/aLZFzjDHcPFISyZ/FpEUmsNE7ArzzwmcTp2Zw1c6fcCQgu3kcl086BOe2Gz1tl34
	eJWyGcow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tolrt-0000000GHVY-0ZiF;
	Sun, 02 Mar 2025 16:08:41 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tolqK-0000000GHEw-20hx;
	Sun, 02 Mar 2025 16:07:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9715961135;
	Sun,  2 Mar 2025 16:06:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E607C4CEEE;
	Sun,  2 Mar 2025 16:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740931621;
	bh=6Z1K2XeEqTJ+PjSTHPmZvbQCAwrBgXMnsTzeuQ32us4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=TLEwWNmRzoxu50gGetzLmCrV55ix9FhhrsO+ah2335y0pn9Qi3RFBfkZYkYOMS2ab
	 j9TjFANBQb+7XL6fMzePFbbvwAN7fMzd+fPngIunbIpQ5mhvfdDzuEFiBkS9YU4WVs
	 zpJ38yLhwZYTN79b/EvKXeFBpHgyPRR1LG8yei1iV882TMyauEBkHI0lhsvb9Udwhj
	 khewVtukix9yqVAnPHB5w3JAXCfWS0Vtx3NR/1vcQp8NkoOoZZ97hBHfMdKuOTWxK3
	 MpXDyRlc4Btp+XN74DkPAyeUa0/j+hd/C0QFzKjkDfGb4Ke4tQ/96asbH8mU6mELPR
	 oVWCFltGcEQvg==
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2fef5c978ccso644255a91.1;
        Sun, 02 Mar 2025 08:07:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWU/ZGBX1tBWS+uj/xgFg5aOZ+SGmdGnyazXF2ONDLtl9VJHRYqnxM+l9eY8WWjO7JnAiHVveQkVwVEPZ659jw=@lists.infradead.org, AJvYcCXSYVyEvTXbdD5PJMxuBw4mAR9a61CZg5b3oAyqr+sjUfCYQu7ZiwePYG68kFoT+bY6I4dOv2X9UrqYWC0mjoaK@lists.infradead.org
X-Gm-Message-State: AOJu0YyUHXJ7WbOSN0LUi6oaVEOMyGIVLE48uAg36hEXnznFeVkMctp7
	rOc49Eq/wnZ10uzr9zyDGW5w9jAZ4OejPTD3nlO/wTJV4MJ5zh+hXhisRfNRwECqPULF7OSdMv4
	yWaOvp4tR0+1bV3D+tPMbZE8pRQ==
X-Google-Smtp-Source: AGHT+IGgpVK4aKVTw1AYLTQHunnH0lP0Xo7e0HySRK7+dlps4YjnoiELgWFMnKkx9EIddZ2irPPWBjpXbYwY6LnMy7Q=
X-Received: by 2002:a17:90b:3511:b0:2fa:1f1b:3db2 with SMTP id
 98e67ed59e1d1-2febabcfedfmr14936364a91.25.1740931620948; Sun, 02 Mar 2025
 08:07:00 -0800 (PST)
MIME-Version: 1.0
References: <20250218090427.20318-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250218090427.20318-1-angelogioacchino.delregno@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 3 Mar 2025 00:07:48 +0800
X-Gmail-Original-Message-ID: <CAAOTY__aFqL=LnE5vU2RP9JHmQEgkrvPmiYjxmETWo9CvwiwLA@mail.gmail.com>
X-Gm-Features: AQ5f1JrHQ_avSblgi4HZQ7x19rsI4_LP2M6FFBaV9IRM5Ur_SJsfW7MiHzcF_cw
Message-ID: <CAAOTY__aFqL=LnE5vU2RP9JHmQEgkrvPmiYjxmETWo9CvwiwLA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display: mediatek: dsc: Add MT8188 compatible
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kernel@collabora.com, pablo.sun@mediatek.com
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

Hi, Angelo:

AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> =E6=96=
=BC
2025=E5=B9=B42=E6=9C=8818=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=885:0=
4=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Add compatible for Display Stream Compression (DSC) IP found in
> the display controller of the MT8188 SoC.
>
> This IP is fully compatible with the one found on MT8195.

Applied to mediatek-drm-next [1], thanks.

[1] https://web.git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.=
git/log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,dsc.yaml     | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
dsc.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.=
yaml
> index 846de6c17d93..a5b88eb97e3b 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yam=
l
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yam=
l
> @@ -22,6 +22,9 @@ properties:
>      oneOf:
>        - enum:
>            - mediatek,mt8195-disp-dsc
> +      - items:
> +          - const: mediatek,mt8188-disp-dsc
> +          - const: mediatek,mt8195-disp-dsc
>
>    reg:
>      maxItems: 1
> --
> 2.48.1
>

