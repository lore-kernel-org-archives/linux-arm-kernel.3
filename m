Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D428C7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 05:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sm4hHqZdHlJKjq+/RMjrxVZ+kQH4qjoP0GpZOg4z/2c=; b=hEd0aWl4rYv6In7+o68aXSzFkf
	XbAIbeydYEtf26dn2zlVB3y64yz1exajj506z3eaKPiDgBZxygBYxp6IQB2+FGiem/dL7fbENZj/D
	lRR8eKw7/U0DORln3F6GG1aqp+qy7LuW+FV9vZlJHJQI7Ue2U0itPxreIS2eWL11SawDp6jmO9Al+
	I9XhXjromEZeNvmbeg0uoa/a4hhuGT1CEH096/8VMHVFgkU/p8uxLQY+evIerjD5xg0iRldvWFIYb
	RHrV/bPlpWCvuTKpuAJ3TyRYBcnFQTPENT9qKTichcGHg6Qac+AoHirIEjfaXIkf3Rv3CD+2xhreM
	69s4t5Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV1Ns-0000000Dc1M-1lEv;
	Fri, 27 Jun 2025 05:12:20 +0000
Received: from mail-ua1-x934.google.com ([2607:f8b0:4864:20::934])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV1F5-0000000DbA7-0DyX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 05:03:16 +0000
Received: by mail-ua1-x934.google.com with SMTP id a1e0cc1a2514c-88150e9fba7so1048839241.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Jun 2025 22:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751000594; x=1751605394; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sm4hHqZdHlJKjq+/RMjrxVZ+kQH4qjoP0GpZOg4z/2c=;
        b=O7jhvJVfOqMr6QfhGq44jKfP8NXKLYJPmW8dI0OjgekmTyJZFyrPbAcmeuECOGcX+D
         jQwBhtdwvLBa6M4KEHb4ap8tsiDQrzoJ97kHSPOVMdTqwywhYYubykiYlh0wQQ5CGuO3
         xhJ8s5VjpFNbB3HE2vz++rA0VVxN1KAQ173DCvngkuErNlhs48M+UM63nckU6BwDBVhU
         YimPiGow5nyL8UmVopAp6C83MsjHjPHOYZjba1CKmigN8Etc0P2AGdz7oxzSXhAYvDFQ
         /8TFh3djbGfwcGFdvoZzdylTH9XAr2n5oeveEzCF1JOlzKHaKhWUKD3BJV6wPl/xIGTN
         HQUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751000594; x=1751605394;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sm4hHqZdHlJKjq+/RMjrxVZ+kQH4qjoP0GpZOg4z/2c=;
        b=ajKKtaTlnlGfNuc1FiqhE/qWtDgErq8mjROBYnuscuDJCfU/KlDKwF0U0WytEa0jMs
         Igq6XIumqii6JtG8PFAPMKtol/F6vJXFT6E+al0pd+wPTf1atyikrhshKBkcm+xLHkH4
         SMvqayC5hhneScEioiSO5GevRdeL4AOXccz65B/eCKlc/GOWvMmC22ApXiUhJ15VEKnI
         6yE2GrULbMOH071LZ64+C1SxA7KepHf3ykROHshpT5rNvdsdXYc9SvEKwb/755VQ5c5r
         6o1h0NTrdQtA/uCZUU5opJfnbWePM3CQyDhYpglZF9cz8pQKYjYVeaovqJlGzoSs1Msb
         FfHA==
X-Forwarded-Encrypted: i=1; AJvYcCUchza2jtj8fF6XMcS2r1YFwVDL57tLlHqJEqC2DNGSWF+N/xK1Js728yJAywDGpQNpoNDNitNu+lzGiniieU8u@lists.infradead.org
X-Gm-Message-State: AOJu0YySgu0WrnQ3R6hkRFwVRS23nzdfSIpQJYWP7kWoSnbhW9bQXlRe
	AvO9YYw7FCKCHRGxeOscl+SWICEo3mANnzgUlnZbmtArbSsHLT7Q5N2w5OqYCbKDXcrepXLBn3o
	n5vkxEjwoqb8c5Oka/JTIlt/iAsdLGSk=
X-Gm-Gg: ASbGnctXPkGjoBmk5/zTf1H0PUqPa8C8QWhL27YxEKABOlDreQbtxQKmScVLBuWnBvQ
	gM4YtDW+QQlVEeLajdxcqXWIlTRm5cWM3sqsH88DyF9r+xfXvZRPvbPR8JqExaqFJWHrwqtpiAD
	oZnZFJIUx9nwINvRkgTDGT9toqAxvA81+fr6knLioqVvEJoAEI0pgq
X-Google-Smtp-Source: AGHT+IF4cUJtxH83RDJft3O2FqQ5XUKOZe1zx/Bmli/7Ru2jER/I3z6z3oYtVafld19HMBo5LW8Ej/HPfe6pAovzDOo=
X-Received: by 2002:a05:6102:2ac3:b0:4ec:e1fa:ed7b with SMTP id
 ada2fe7eead31-4ee50a67c4bmr1229948137.9.1751000593950; Thu, 26 Jun 2025
 22:03:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250627-exynosdrm-decon-v3-0-5b456f88cfea@disroot.org> <20250627-exynosdrm-decon-v3-1-5b456f88cfea@disroot.org>
In-Reply-To: <20250627-exynosdrm-decon-v3-1-5b456f88cfea@disroot.org>
From: Inki Dae <daeinki@gmail.com>
Date: Fri, 27 Jun 2025 14:02:37 +0900
X-Gm-Features: Ac12FXz2dc5tsxsGmjdAH92okDL5yeiAijcWTCVAjDOYfNAbUY5poc38568eg-s
Message-ID: <CAAQKjZPAsE8LGE00fWE1aPj03b6tu1rk9ScTDSN+HeKzVXMZvw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: display: samsung,exynos7-decon: add
 properties for iommus and ports
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Ajay Kumar <ajaykumar.rs@samsung.com>, Akshu Agrawal <akshua@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_220315_096557_90E0B6BB 
X-CRM114-Status: GOOD (  14.33  )
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

2025=EB=85=84 6=EC=9B=94 27=EC=9D=BC (=EA=B8=88) =EC=98=A4=EC=A0=84 4:21, K=
austabh Chakraborty <kauschluss@disroot.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=
=84=B1:
>
> Similar to FIMD and Exynos5433's DECON, the Exynos7 DECON hardware:
> - May optionally require an IOMMU to initialize a display region.
> - May require a port connection to another block, say an MIC or a DSI
>   master.
>
> Document these bindings in the devicetree schema.

Applied.

Thanks,
Inki Dae

>
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  .../bindings/display/samsung/samsung,exynos7-decon.yaml           | 8 ++=
++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/samsung/samsung,ex=
ynos7-decon.yaml b/Documentation/devicetree/bindings/display/samsung/samsun=
g,exynos7-decon.yaml
> index 53916e4c95d8c0369138941a556c23f5d42fbd39..1e9500c86590d555cfa6f0479=
0e2b64da291b78b 100644
> --- a/Documentation/devicetree/bindings/display/samsung/samsung,exynos7-d=
econ.yaml
> +++ b/Documentation/devicetree/bindings/display/samsung/samsung,exynos7-d=
econ.yaml
> @@ -80,6 +80,14 @@ properties:
>        - const: vsync
>        - const: lcd_sys
>
> +  iommus:
> +    maxItems: 1
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    description:
> +      Contains a port which is connected to mic or dsim node.
> +
>    power-domains:
>      maxItems: 1
>
>
> --
> 2.49.0
>
>

