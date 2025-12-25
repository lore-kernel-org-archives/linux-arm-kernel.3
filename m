Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C60BE7AD62
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Dec 2025 18:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EeP3w6mxZsd240QO+T3jiig23vz+oT72Plo2mHGY5pE=; b=DoW0W/i/9Joee4v/TSgvclmFcy
	OzJcHn0W1OlvkXNMpkCMpBJcHEGTAETb/O+Q7TDwgBF5/G1ExhGgx5jmCKwkRc4/ahD+1wnhbB1Eq
	6MJ74Rk9JcdiGp9JYlvLzV89IsTDQVvNGZEHX+PIV6cVEngCL21uSetgHcJ6qgY5uyU4kI1UkCVY4
	EeHY5DTlXKoEoBdFdbJLOIhmipvIi9WC6DtgZ9eCdu+1KSCbCu9XZDm/szdbgfXZe+AcnVOVSE2Qk
	mDwFtZZFXF+Oy2TE+sDdfxzB6xVojJ6xMcKFbkIzWmyUOKZoptZ3iJ7HXm3+efQNk1K9GPbvY17pc
	qvWM7d7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYqDG-00000000c6k-1jsC;
	Thu, 25 Dec 2025 18:37:26 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYqDD-00000000c6E-1Cx6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Dec 2025 18:37:24 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-b73161849e1so1312562666b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Dec 2025 10:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766687841; x=1767292641; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EeP3w6mxZsd240QO+T3jiig23vz+oT72Plo2mHGY5pE=;
        b=GctC6mnQxnfEuQzPsQ+uzJJH9WQ2Rg0D7mA2s+50Fdqav4BTGJ+ughzVcLemSU3G01
         2ErdMFtvIFoN0elyDdN8+cU+txOllFuquGnL1AHKtlxtGSa6voV531yGfSs9gFPCImyU
         ibwwSUNl+t7C2CaJM+yv6CTSNQg1HoNIB9FcZC9ZsQaRzQLNJLKxYza/2Nd+pFShuugh
         sTvSbxRLZaALR1rnx2vH4xdIiDlS4Y1S4bFCQFbVOHpgWGq2Wu7qTQnoeBscJ9igcsu4
         mJekUO/UL5WlwTcedJasOj/0yv39PZBDAFF91ovnEUB2yuLIzjp9mEgULnU5DNn/aSNI
         pfYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766687841; x=1767292641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EeP3w6mxZsd240QO+T3jiig23vz+oT72Plo2mHGY5pE=;
        b=uyTzS/QtfyWCxB8C9ZM8CvrIUiBxQw3dOa99qY9Xsy76/G3R3lWWQT5IA00Z4jwezk
         sMyhYLp8He/5Kzl9bWbDr+Y8zt7M722hIhZXT86QseqgvJOMuoQx/E7NxNfYCl70OPjB
         yxb3Q3Uhny1rCqT8RxgYb7a8TscewgjRzTPnhXqu7R1R2Xp9Ipr9DSxYYNPKrE/JEGdZ
         dBLaW+KORQFdYEw46BvBPUxrJsGJqjbGoi+oanIDTDRuNP+nFBP6mtdwSyWZyG00OsPA
         nNb5FUMLU+tp0uBPCD4i/a+PX9KwpgcvdMNJYjlIIwI86u46NJKeox3h8kok1zPnBrie
         q7AA==
X-Forwarded-Encrypted: i=1; AJvYcCUcH2OdlSQmP8nORVVMS6snEmsekEzUU+p9PlVhRL95KYIldP0aQiJySo4Ufi91g5uqumtVAd0+iQigLZ9Iq5bm@lists.infradead.org
X-Gm-Message-State: AOJu0YygT9+eHdP5X8tC7yXXiLbCJEJmGeR/wz6w47OHL+q9903oWzn8
	DrluRvlJg7bwNytJuLKdOHyMXcRxGz2pgC4ebIKGpb04C0cQoy7MN5PV
X-Gm-Gg: AY/fxX4K0UCxPj/8Q5mdtTXuQ10sgd0uq/ZEodNhqityUOLLEJL2M6LCG2xvnyLBQKp
	+/jEplj5b/tY3hDqj+lTjU5fhbM9OUvLyUDcXgwxc7dhi9ReErOqWr4f8AzYKYsLKmSJtaq0dvi
	Qhdq/lGmilZcBgGmHq+xABu4uAsgQ0PVv/QXjLpOQqeFeTGxozNGm4zh/4Ji7Qb++gYbbTGl9TO
	ZQ9VC3BgGdUGgIaP//zpnKPvL3NAkHDWhXSKeKmIdD9bX4cLEHaCS2ETm3NEQClJtMs6oNiq0hG
	dLtKxNZI4PyCPmE6EwXrYKsJIQfI7qp+tAj80XmPxUbYO5pVRH5hInk+YtxWISHKXArOYlmh3yd
	zBWJzY/8sjmOflD2A0GplCz8CwTxKpGRtQpKNjoMIb9VRJv5IZHM6LnG44Lz5RSJT2Y2p0hkVQ4
	yo1bJIsyY+ZH5SyC8v+Dp6jpEvBkyGozoC
X-Google-Smtp-Source: AGHT+IH4B3XzX8QXujzZunFfKEc/cY4W3MiVUX7/1rzA6qLulDTYIhj8orR5H1uD8QCD+qBxL3d2xw==
X-Received: by 2002:a17:907:1c27:b0:b7c:eb19:6a3f with SMTP id a640c23a62f3a-b803705e31cmr2146669666b.35.1766687841205;
        Thu, 25 Dec 2025 10:37:21 -0800 (PST)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b803d3cea32sm2033127866b.34.2025.12.25.10.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 10:37:20 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Linus Walleij <linusw@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-gpio@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 3/4] ARM: dts: allwinner: sun5i-a13-utoo-p66: delete "power-gpios"
 property
Date: Thu, 25 Dec 2025 19:37:18 +0100
Message-ID: <2409366.ElGaqSPkdT@jernej-laptop>
In-Reply-To: <20251225103616.3203473-4-wens@kernel.org>
References: <20251225103616.3203473-1-wens@kernel.org>
 <20251225103616.3203473-4-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251225_103723_330889_FF0D1BA5 
X-CRM114-Status: GOOD (  10.91  )
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

Dne =C4=8Detrtek, 25. december 2025 ob 11:36:14 Srednjeevropski standardni =
=C4=8Das je Chen-Yu Tsai napisal(a):
> The P66's device tree includes the reference design dtsi files, which
> defines a node and properties for the touchpanel in the common design.
> The P66 dts file then overrides all the properties to match its own
> design, but as the touchpanel model is different, a different schema
> is matched. This other schema uses a different name for the GPIO.
>=20
> The original submission added the correct GPIO property, but did not
> delete the one inherited from the reference design, causing validation
> errors.
>=20
> Explicitly delete the incorrect GPIO property.
>=20
> Fixes: 2a53aff27236 ("ARM: dts: sun5i: Enable touchscreen on Utoo P66")
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
>=20

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



