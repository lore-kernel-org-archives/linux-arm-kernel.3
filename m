Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D39CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 16:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rwCwPqassmdFa5GP4LZDb8M62stClOb1kWRYWVT4ujQ=; b=B8MVM6UC/Ge5Ogv7Cxi/zW/T3c
	omtzqLa1uUEUSN1nel/rJnDygP79tfaIl6uuO9P+6pdDxvE23QZ4l/kMmCXHYnr6aigWcdGWHSav2
	VbCyj3Cf6HWsBv39F1cmSGT/IU62Uu1JH3MlBgu/UEkoNgF/uJvmp8b3fKyiyMaSObOIhyANuVE8g
	B8xhcXSPncMHKY8NKmJzhS68LFljKfVND24h+x2UF/YnnziBp/PPTZOfeu4kHTkuU5jXQ7TtxPPqX
	d7s20mJAirp/IOrgi5ixSM+2BMg8e1DKfmXQJQzKwICSKFlBajx1xx59yKg2xRTI+IWXwDC5sspiq
	Jh3eKcqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIR3-0000000Gq7Z-0tYv;
	Tue, 05 May 2026 16:15:49 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIR0-0000000Gq74-3k3b
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 16:15:47 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso64935715e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 09:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777997745; x=1778602545; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rwCwPqassmdFa5GP4LZDb8M62stClOb1kWRYWVT4ujQ=;
        b=Q5emerq6TB+ivoxuam5qAm1GXPIswfprJdCJUeLbrWj41KPVNjRnbZktRDMfz44CWd
         TcmPz5Lb1Ehtf1G7jMjmuU6nH77yC+BHesLw2JoNiWNjwkrqnctpJiqXE1lyLTCiOKuu
         6HXXFGzNSlWJMBdboyT0o6hRwKcS+9TyQjD1lVTRuNcrzVrZ0KNd21XlkLmr6AnGSa86
         kiohaMqH1sbwibFmyYmTymEkV0IAR+BnUNj6ZHWBqfgzXWcW8GltJ2yCBqpbmmqxz85Q
         xroGdjYDThTv8Q9kLfbzNYZxciBZwuI1tIAEXM9oZXoI88M0VC+RAfzcT0Yt5pLbjwKp
         k0kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777997745; x=1778602545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rwCwPqassmdFa5GP4LZDb8M62stClOb1kWRYWVT4ujQ=;
        b=kIgfRUXoLDEbBfipQbyTxpp/xVyYItsuNvtCAep9qiX8GFsoFrOp/wbhcPrx/uOMT9
         m3yTaY9QuITnkoDs5JlgSzdCj0J2YV2plUqe1pnEe75eFLZBLmzx5iGWKu/FJgrVjA14
         PbOGQPHjNXD0GHmFW2Ix0Jr0drLmdSpTb1W0FpkS6OdNX9+BE+UnpCydACNW3OdwEjKy
         /NzWKVWI/hWqWNM40HJTX0z1rHkZOjR1KNGgTwsZYkeexv6HfOyaXNm3b/H1HS4bG04Z
         rGPT5kMfhPNEQF0/0Ko/VUqC/0mBjWLTVObXgcgpaiK5fS5LEXYdeqqzwLKZHqcV76du
         oAAg==
X-Forwarded-Encrypted: i=1; AFNElJ+PlMnD1HSdhfcBWD0oL5idMzXRTIjnPDUdZNBly9pAs/0ZBBbmro/Hb/DTuWw+/aZ+QBSdJWslWGNwYl9bkZJK@lists.infradead.org
X-Gm-Message-State: AOJu0YzhaV3s0/GHwLOgfJf20HDI3EL/etzQkmTNI9KwzHd6wNwWraLQ
	3I1S9qE6wgigWRCvbohg4YMMbLSKQS0t6LW+SeVycbLctagvUCHGlJO+pUAgVIrE
X-Gm-Gg: AeBDieu8Yrm2jFOa9lz8EISBBbrrEyzpT6L5RdU7snvn896qpl8EfhyzpsN4e7hh5vb
	Zx4W3oKCdRg5PYJ6pVCrd6Mr5r322E1lcB5vwf3bWc9y9ALlZbv9pArkJZqJL06Qv29ar6fLgUx
	A1xLKJIpx7LezGIx3sWQAl8sQ4sZ0ZYQM2MQvb5pc/vF7PPfE2uERQR+193V/JzizaWv6IYNGs/
	jHuiWSxv0GJAgTIMpGjun0F+zAigH0JBbsedf3dvixxf5lvrL9jfJ5Em8lqPCY/vxTAHi3HY7bw
	cp/yfjvcCBYZylByzgrn01DyuoNV8yX1o7TS+Rk2mAGHiWFgJVL+NMaHT9k0FcLk+B4NCwWYuZL
	PrZ6/5ovPwtdpuqrB1Wpw9i/2Ef9hlDQyTDXO9YR+6TOnOGXAmYWJZzm/Mix6/31TsueDhaykVL
	y2qMnSXlfvhiv6vMtHDcPvGqGXV8gH3XR9mhhCzQD5kDO6TCY8nfy5p+O7UeW2loL5nbroOMEOC
	ArUv5aX2zHqbTM67Xro6spIKEW8
X-Received: by 2002:a05:600c:3513:b0:489:c57:7836 with SMTP id 5b1f17b1804b1-48e51d6c8cfmr1051235e9.27.1777997744843;
        Tue, 05 May 2026 09:15:44 -0700 (PDT)
Received: from jernej-laptop.localnet (46-150-62-216.dynamic.telemach.net. [46.150.62.216])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a820c8556sm402657765e9.4.2026.05.05.09.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:15:44 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/7] dt-bindings: media: sun4i-a10-video-engine: Fix SRAM count
 for H6
Date: Tue, 05 May 2026 18:15:42 +0200
Message-ID: <A3ZnAVmNS1uZyanwbLT-hg@gmail.com>
In-Reply-To: <20260505134812.408316-3-wens@kernel.org>
References: <20260505134812.408316-1-wens@kernel.org>
 <20260505134812.408316-3-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_091546_963513_531DF377 
X-CRM114-Status: GOOD (  18.53  )
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

Dne torek, 5. maj 2026 ob 15:48:06 Srednjeevropski poletni =C4=8Das je Chen=
=2DYu Tsai napisal(a):
> On the H6, the SRAM C region includes an alias of part of the VE SRAM
> used by the video engine. This region should also be claimed so that no
> access happens through the alias window.
>=20
> Add a second SRAM region phandle to the video engine for the H6.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
> ---
>  .../allwinner,sun4i-a10-video-engine.yaml     | 21 ++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-=
video-engine.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i=
=2Da10-video-engine.yaml
> index 932043d7f0cc..818d815d4732 100644
> --- a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-e=
ngine.yaml
> +++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-e=
ngine.yaml
> @@ -48,11 +48,15 @@ properties:
> =20
>    allwinner,sram:
>      $ref: /schemas/types.yaml#/definitions/phandle-array
> +    minItems: 1
>      items:
>        - items:
>            - description: phandle to SRAM
>            - description: register value for device
> -    description: Phandle to the device SRAM
> +      - items:
> +          - description: phandle to SRAM alias
> +          - description: register value for device
> +    description: Phandle to the device SRAM(s)
> =20
>    iommus:
>      minItems: 1
> @@ -101,6 +105,21 @@ allOf:
>          iommus:
>            maxItems: 1
> =20
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - allwinner,sun50i-h6-video-engine
> +    then:
> +      properties:
> +        allwinner,sram:
> +          minItems: 2
> +    else:
> +      properties:
> +        allwinner,sram:
> +          maxItems: 1
> +
>  additionalProperties: false
> =20
>  examples:
>=20

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



