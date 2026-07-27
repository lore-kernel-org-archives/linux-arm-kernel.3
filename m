Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E57C9C53219
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 11:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KbWGLoamsRqt9EF91CYlnFd2rzTQDmCXIFAkw07Z+E8=; b=rRHvaqIwffL0B4YCGHcgK7SSAI
	jNrmrhjwNTiZ2zF5jrrBDXsgW8ZsAmUFqQ8qYWo4yd8TClWTWQ6rk+r9+xXcgtgOgloiZnkNMyuRp
	q15WtLXMD0wbdkP+/td9dey/KKAQQ2wZ9U8O6dh8lev9urXJiNty0gQWlo968qTXeP6Xhaz3p05mM
	nlIm32JU9yD7h23WGiC4z8WDU5ec9G4bm+qCeb71GC5gjOqFElcGHVbZSvXiPk9ZL9uFNHUd0gmoN
	TjiYWDjFFyKWYjc9khI76BrRen/spisJ5qo3USH5n4yVqAJYXYhed3wuhcbLDg6UnK0+BKLaGSBvG
	zknWbacw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woJIg-00000002ZDr-3QeN;
	Mon, 27 Jul 2026 11:15:14 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woJIe-00000002ZD6-0s2Y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 11:15:13 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-47f7854678cso1443198f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 04:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785150910; x=1785755710; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=KbWGLoamsRqt9EF91CYlnFd2rzTQDmCXIFAkw07Z+E8=;
        b=dmX295cPja+XZn0nuUtvPSwkiujfD/xEvNjtlxwP58LevqShlDj+/h6XIKE3zmkpjV
         o59vi+dDDv/r6VsfnVC2tbAqH6LmghMXL7s79UoOKL6+lVa9ecS1D2b14UAFiUZdHW6Y
         RdIDXgevaFTRKwqJi6kC+y3SaMOCpVsHPLnLVtgEv43iY2FBHVXJH2Ngh/Xu5g/SAUwP
         5BDW8dkUqwz95nlg0l189vHEknd+kGTjAa35TzmCLlev8rG6ijjbb4gH5HRNTOsqYnoT
         0yuuKkNJjc+elr32IdCk+ducGWbIRlxW+0k53QV+Jlse+yicL4jsS727JG3NcORttuH/
         AXZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785150910; x=1785755710;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KbWGLoamsRqt9EF91CYlnFd2rzTQDmCXIFAkw07Z+E8=;
        b=B7PJoITHkyb0eJPzj83oS2cx+Yu20UX4clU2nMmXaoncBFXo1zosiU+2APqx3dXWNt
         ymtJctKO04nrEiWQguoSxBawSv62k1jAmcgV4SdcvnvsZ79iDQ2whBY1bDiSh4PjYr8s
         jExqo7kLfpzkYAAogVkEOV3jQ+vNJmNyyJnzfBM5cAdOXGI7o5k30O31Ff3h45XDTiia
         RHRC7qjp810Kmre3QiPUEeZfcro2bYA4YqxD4XEqdVjlUjtSTVipz/Ob8DB7EYmZeV4B
         ahXouQtSMHTwelXUiffkesAgJD7dFnmCFQjU3r6758HI5+eE5QXEsOn48oF+u4zL57hk
         cGkg==
X-Gm-Message-State: AOJu0YzVofYvTYKWLmq1lZ/32KAxd6Q5pFhBAPLzb0GCtuDG21MAsXLx
	FLN5y5eWcJsHceMntwF14XsI+YqLnDP92w/vf5pQ88OAv9ZXBjSk9QLZOGaM7TbFv0M=
X-Gm-Gg: AR+sD10meUwqsbavqYaB10eW/KE0SHOAkEWBNWnUV0giucA2ugyMHH2iC8QRfOsGKsq
	UjQpO6m/KySRO9NFKh6hJBwE51Hwq/1A7KrF2WQpL5zcmgQjVS5LqCHs+iBBr2pREVvfTbBUjeN
	ShYbltCPQ/aZQdsNDuvVGN0UEL5jjDE7uJDioUROjHswiLzTbQfZzoW3RSchvXskNBVG2DRxzUx
	15IOHg3Rev3ZJ7uYJovb0aWGHfPTAwBFIz0R3UJuGXbulwwNfFr8tRB35YaH/LUZNTZPPW48JhC
	420NZX2d61ct/z0n7RzkzTtgclVG+15FFwZbwV55DLZonf7frSkZPwSb6WehrPj2EeMn8dV36JA
	JffHldnqUn9mcyOGO9Aj7Eg5awoL2cU7Z9pzeFoC9E5OeCDcn9EyUnvkIlF+QzN8XM2lHGEnDcV
	RIktVcJA==
X-Received: by 2002:a5d:64c3:0:b0:47f:838c:4256 with SMTP id ffacd0b85a97d-47f9fc92c01mr10623612f8f.16.1785150910326;
        Mon, 27 Jul 2026 04:15:10 -0700 (PDT)
Received: from [10.1.1.59] ([109.255.181.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f939c1465sm33628401f8f.26.2026.07.27.04.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 04:15:09 -0700 (PDT)
Message-ID: <d97c2e514a7c97c311a98ecbb4d3da47adef27af.camel@linaro.org>
Subject: Re: [PATCH 2/8] arm64: dts: exynos: Align continued properties and
 add missing blank lines
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Ivaylo
 Ivanov	 <ivo.ivanov.ivanov1@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Griffin	 <peter.griffin@linaro.org>, Alim
 Akhtar <alim.akhtar@samsung.com>, Sam Protsenko
 <semen.protsenko@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>,
 Krzysztof Kozlowski	 <krzk@kernel.org>, linux-fsd@tesla.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 27 Jul 2026 12:15:28 +0100
In-Reply-To: <20260726-b4-dts-coding-style-strict-v1-2-e9e3e9879d05@oss.qualcomm.com>
References: <20260726-b4-dts-coding-style-strict-v1-0-e9e3e9879d05@oss.qualcomm.com>
	 <20260726-b4-dts-coding-style-strict-v1-2-e9e3e9879d05@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8+build1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_041512_311586_DD2A0192 
X-CRM114-Status: UNSURE (   9.32  )
X-CRM114-Notice: Please train this message.
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

On Sun, 2026-07-26 at 19:43 +0200, Krzysztof Kozlowski wrote:
> Trivial white-space only changes to adjust to DTS coding style and fix
> dt-check-style strict warnings like:
>=20
> =C2=A0 [required-blank-lines] child node must be preceded by a blank line
> =C2=A0 [continuation-alignment] continuation should align to column 39 (u=
nder < or ")
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
> =C2=A0arch/arm64/boot/dts/exynos/exynos5433-bus.dtsi=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 19 ++
> =C2=A0arch/arm64/boot/dts/exynos/exynos5433-pinctrl.dtsi |=C2=A0=C2=A0 8 =
+-
> =C2=A0.../boot/dts/exynos/exynos5433-tm2-common.dtsi=C2=A0=C2=A0=C2=A0=C2=
=A0 | 120 ++++++-----
> =C2=A0arch/arm64/boot/dts/exynos/exynos5433-tmu.dtsi=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 45 ++++
> =C2=A0arch/arm64/boot/dts/exynos/exynos5433.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 230 ++++++++++++---------
> =C2=A0arch/arm64/boot/dts/exynos/exynos7-espresso.dts=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 3 +-
> =C2=A0.../arm64/boot/dts/exynos/exynos7-trip-points.dtsi |=C2=A0=C2=A0 7 =
+
> =C2=A0arch/arm64/boot/dts/exynos/exynos7.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 34 ++-
> =C2=A0arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 4 +-
> =C2=A0arch/arm64/boot/dts/exynos/exynos7870.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 9 +-
> =C2=A0arch/arm64/boot/dts/exynos/exynos7885.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 9 +-
> =C2=A0arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi=C2=A0 |=C2=A0=C2=
=A0 1 +
> =C2=A0arch/arm64/boot/dts/exynos/exynos850.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 16 +-
> =C2=A0arch/arm64/boot/dts/exynos/exynos8855.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 5 +
> =C2=A0arch/arm64/boot/dts/exynos/exynos8895.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 9 +-
> =C2=A0arch/arm64/boot/dts/exynos/exynos9810.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 9 +-
> =C2=A0arch/arm64/boot/dts/exynos/exynos990.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +-
> =C2=A0arch/arm64/boot/dts/exynos/exynosautov9.dtsi=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 9 +-
> =C2=A0arch/arm64/boot/dts/exynos/exynosautov920.dtsi=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 7 +
> =C2=A019 files changed, 359 insertions(+), 188 deletions(-)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

