Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94AD6C369B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 12:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D1V8ghNFhSQVvyCHqapThgtbdBVpNPOOv/+xtuw1fLY=; b=cN+oqNOFz3J19Rrug3KG2FyPow
	H7mSvS9mWrb/T2VpecWG6ARHVW4a8sbSs38br67njv6d6EUw9blMGdwvHgIqv2lYtUoQljboTRPPe
	VD3YxDzvBUZQwvBT3+SikUovMstbeV5pFRVGRKFv6PlN6ZHf+Kuft08sECRsHMj8HjbwB76e72PKW
	4FAIQOeH9AK9bFGLwSbfm1WcMYLmVzzWmA10gkxVODZRww1ZAszeUHIg2aA3PCgy/IOdf8YZPbrVP
	GgGgo3+PMmJhxvrSdWum59Mz178MHP/FxBP8gYYxi4U3/X8gXNHi/TgEUiTjUg4FHy1I2dXSa1lKq
	cI1w6CCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4JCx-00000001zyd-4168;
	Mon, 14 Apr 2025 12:46:39 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4J7C-00000001zDp-1p7v
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 12:40:43 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-4775ce8a4b0so69099091cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Apr 2025 05:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1744634441; x=1745239241; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=D1V8ghNFhSQVvyCHqapThgtbdBVpNPOOv/+xtuw1fLY=;
        b=zqwyLBKxjv0ivYK81HZy0kp4hgngR75vWBqnekDRPRyjoJYzOaVf6BCgFwQHepm1fE
         G3aGfpJTtg+71JJiMye8jy+xJKLz8kQVgc2qxzBqikVT08XXYgP4RrisZ+10aSPYq703
         4bQRrkYN9/D8by1d/U/pE6HOLbjSmFNImD6tk7EoQ3BYEo6WqWbBVPfSJqLMNgs8leEJ
         J/XAj5CnCV/cNmRmxW0hlxcffKTmgUslFLeHTCbjf6VRlNct/fJl/Bl57+0dD/SZQ3Km
         7kl6BkVWnQCUYsfpiurVtaTqpDfgRYlFg4PDG2PTyPvm1Iyl5qPuyhfDcOrwqpZWqNUv
         CR6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744634441; x=1745239241;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D1V8ghNFhSQVvyCHqapThgtbdBVpNPOOv/+xtuw1fLY=;
        b=tWLRJacz3ar6Ilc32zddmADIYuDtylIu1Wy1olBufQT/QK81Zhhnpch247w8v65KsF
         0DLI1f5Dxoix/HIk5Ti6R9CWHpWBJImexmtB46sHZUMTFep96GUbBCJKG+FAihdfvH2e
         bJspCMJZLhVGzOMJuEdvlQMzUIC1CtRabCj7xMoFVkfgwLT1zwOM0OV6emTAhm/pW2dV
         4LT/b4DpVc/qb7+Xeou2PFCPCE+l13Dwaga87VYezV0gM2Bbfs8gDUtyEN8JVuBqaBC0
         40GoN65iyAQLreFte3svoJLPFsmXU/8sl59qe0K2I0yKqdqalhMSNDrmPVpXtIUfTvKO
         nopw==
X-Forwarded-Encrypted: i=1; AJvYcCWxWVeAjslO2VmlEONh9i7XVYkMCUPXFKU+ij//7g+yKSquzr6uR/UtwfswNGLxHWBDTbSHvNK0SIihPdtXvEwg@lists.infradead.org
X-Gm-Message-State: AOJu0YyoEHqpsHhSZWaAQljky/pm+OqkJ9TNNggpnL29eOv1UG0xqSeU
	ROv5/Kh4KjcZ5uSXQqtoEv42Tm69dTNDbaB+QQi5vCotjv8xiQPgLw5qaa88uR4=
X-Gm-Gg: ASbGncuayUcxdfGmIR22If87KRmn8EoGupEwOKe0SARFMjph6xhQ1GfDFCjjwa7LcmO
	u74n52aHhdrJJcW2h2O/o+GW7AmeE8IiopeEZFgIJ2/P8RoohaZfbjAVjbvgQ2DX0eASjX4AF+G
	QRFlXyy8tNw89tz540R0O1upOSCoUTbKVo14LzPgtkrkqu4hm9au9/yPatin15bDPb0Ihl8JfGO
	PkjVEUZOCim4dfWNYEOBy4ewfm00lz8HL4a/nQvFyx/1WiBWMQG/oOPgBBVapbuex7rUG3Vbpmj
	wwwunrgYb8w7iD96OSaMSmupl857P6V2u1IVjTypYLy0iIeoz3hphkQq
X-Google-Smtp-Source: AGHT+IHzRC5MPk4gCdZQDiLMvimp8F/pyevk6/f63+hfdgj8+aLB0yoSTDhdEMEr6WLqPX5YOYzzJQ==
X-Received: by 2002:a05:622a:1892:b0:477:6f2c:4a07 with SMTP id d75a77b69052e-4797750fda2mr191211911cf.4.1744634441327;
        Mon, 14 Apr 2025 05:40:41 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:e976::c41? ([2606:6d00:11:e976::c41])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4796eb2b4easm73431781cf.34.2025.04.14.05.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 05:40:40 -0700 (PDT)
Message-ID: <e79a3bfb0cb57fea17ad7852ce3b4fe720c2cbd2.camel@ndufresne.ca>
Subject: Re: [PATCH v1 2/3] dt-bindings: media: mediatek: mdp3: Add
 compatibles for MT8188 MDP3
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mchehab@kernel.org, 	matthias.bgg@gmail.com, moudy.ho@mediatek.com,
 dri-devel@lists.freedesktop.org, 	linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, 	sebastian.fricke@collabora.com,
 macpaul.lin@mediatek.com
Date: Mon, 14 Apr 2025 08:40:39 -0400
In-Reply-To: <20241218105320.38980-3-angelogioacchino.delregno@collabora.com>
References: <20241218105320.38980-1-angelogioacchino.delregno@collabora.com>
	 <20241218105320.38980-3-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_054042_478041_BD9F03BC 
X-CRM114-Status: GOOD (  10.98  )
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

Le mercredi 18 d=C3=A9cembre 2024 =C3=A0 11:53 +0100, AngeloGioacchino Del =
Regno a =C3=A9crit=C2=A0:
> Add compatible strings for the FG, HDR, RSZ, STITCH, TCC, TDSHP
> and WROT hardware components found in MediaTek's MT8188 SoC.
>=20
> This hardware is compatible with MT8195.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Acked-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0.../devicetree/bindings/media/mediatek,mdp3-fg.yaml=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 8 ++++++--
> =C2=A0.../devicetree/bindings/media/mediatek,mdp3-hdr.yaml=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 8 ++++++--
> =C2=A0.../devicetree/bindings/media/mediatek,mdp3-rsz.yaml=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 1 +
> =C2=A0.../devicetree/bindings/media/mediatek,mdp3-stitch.yaml=C2=A0=C2=A0=
 | 8 ++++++--
> =C2=A0.../devicetree/bindings/media/mediatek,mdp3-tcc.yaml=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 8 ++++++--
> =C2=A0.../devicetree/bindings/media/mediatek,mdp3-tdshp.yaml=C2=A0=C2=A0=
=C2=A0 | 8 ++++++--
> =C2=A0.../devicetree/bindings/media/mediatek,mdp3-wrot.yaml=C2=A0=C2=A0=
=C2=A0=C2=A0 | 1 +
> =C2=A07 files changed, 32 insertions(+), 10 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-fg.yam=
l b/Documentation/devicetree/bindings/media/mediatek,mdp3-fg.yaml
> index 03f31b009085..40fda59fa8a8 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,mdp3-fg.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-fg.yaml
> @@ -16,8 +16,12 @@ description:
> =C2=A0
> =C2=A0properties:
> =C2=A0=C2=A0 compatible:
> -=C2=A0=C2=A0=C2=A0 enum:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - mediatek,mt8195-mdp3-fg
> +=C2=A0=C2=A0=C2=A0 oneOf:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - enum:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - mediatek,mt8195=
-mdp3-fg
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - items:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: mediatek=
,mt8188-mdp3-fg
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: mediatek=
,mt8195-mdp3-fg
> =C2=A0
> =C2=A0=C2=A0 reg:
> =C2=A0=C2=A0=C2=A0=C2=A0 maxItems: 1
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-hdr.ya=
ml b/Documentation/devicetree/bindings/media/mediatek,mdp3-hdr.yaml
> index d4609bba6578..d9f926c20220 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,mdp3-hdr.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-hdr.yaml
> @@ -16,8 +16,12 @@ description:
> =C2=A0
> =C2=A0properties:
> =C2=A0=C2=A0 compatible:
> -=C2=A0=C2=A0=C2=A0 enum:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - mediatek,mt8195-mdp3-hdr
> +=C2=A0=C2=A0=C2=A0 oneOf:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - enum:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - mediatek,mt8195=
-mdp3-hdr
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - items:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: mediatek=
,mt8188-mdp3-hdr
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: mediatek=
,mt8195-mdp3-hdr
> =C2=A0
> =C2=A0=C2=A0 reg:
> =C2=A0=C2=A0=C2=A0=C2=A0 maxItems: 1
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.ya=
ml b/Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
> index f5676bec4326..8124c39d73e9 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
> @@ -20,6 +20,7 @@ properties:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - mediatek,m=
t8183-mdp3-rsz
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - items:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - enum:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 - mediatek,mt8188-mdp3-rsz
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 - mediatek,mt8195-mdp3-rsz
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: med=
iatek,mt8183-mdp3-rsz
> =C2=A0
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-stitch=
.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-stitch.yaml
> index d815bea29154..1d8e7e202c42 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,mdp3-stitch.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-stitch.yaml
> @@ -16,8 +16,12 @@ description:
> =C2=A0
> =C2=A0properties:
> =C2=A0=C2=A0 compatible:
> -=C2=A0=C2=A0=C2=A0 enum:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - mediatek,mt8195-mdp3-stitch
> +=C2=A0=C2=A0=C2=A0 oneOf:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - enum:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - mediatek,mt8195=
-mdp3-stitch
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - items:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: mediatek=
,mt8188-mdp3-stitch
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: mediatek=
,mt8195-mdp3-stitch
> =C2=A0
> =C2=A0=C2=A0 reg:
> =C2=A0=C2=A0=C2=A0=C2=A0 maxItems: 1
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-tcc.ya=
ml b/Documentation/devicetree/bindings/media/mediatek,mdp3-tcc.yaml
> index 14ea556d4f82..6cff7c073ce4 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,mdp3-tcc.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-tcc.yaml
> @@ -17,8 +17,12 @@ description:
> =C2=A0
> =C2=A0properties:
> =C2=A0=C2=A0 compatible:
> -=C2=A0=C2=A0=C2=A0 enum:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - mediatek,mt8195-mdp3-tcc
> +=C2=A0=C2=A0=C2=A0 oneOf:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - enum:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - mediatek,mt8195=
-mdp3-tcc
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - items:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: mediatek=
,mt8188-mdp3-tcc
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: mediatek=
,mt8195-mdp3-tcc
> =C2=A0
> =C2=A0=C2=A0 reg:
> =C2=A0=C2=A0=C2=A0=C2=A0 maxItems: 1
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-tdshp.=
yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-tdshp.yaml
> index 8ab7f2d8e148..cdfa27324738 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,mdp3-tdshp.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-tdshp.yaml
> @@ -16,8 +16,12 @@ description:
> =C2=A0
> =C2=A0properties:
> =C2=A0=C2=A0 compatible:
> -=C2=A0=C2=A0=C2=A0 enum:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - mediatek,mt8195-mdp3-tdshp
> +=C2=A0=C2=A0=C2=A0 oneOf:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - enum:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - mediatek,mt8195=
-mdp3-tdshp
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - items:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: mediatek=
,mt8188-mdp3-tdshp
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: mediatek=
,mt8195-mdp3-tdshp
> =C2=A0
> =C2=A0=C2=A0 reg:
> =C2=A0=C2=A0=C2=A0=C2=A0 maxItems: 1
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.y=
aml b/Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml
> index 53a679338402..b6269f4f9fd6 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml
> @@ -20,6 +20,7 @@ properties:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - mediatek,m=
t8183-mdp3-wrot
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - items:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - enum:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 - mediatek,mt8188-mdp3-wrot
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 - mediatek,mt8195-mdp3-wrot
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: med=
iatek,mt8183-mdp3-wrot
> =C2=A0

