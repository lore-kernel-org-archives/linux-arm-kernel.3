Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8746C55838
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 12:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HgW9krDqxT2FKCqRiY4Ucv2waMe6ob+70M7DoaSCHZ4=; b=KWsrjjU4ij/LZ/oPBtCs+Me9q2
	5aAv0DxhSm3bN9/27FC6u/yAFpne3uSfXBcKIproZfHdWdKSiGLBQPtYlsQm73H4Yov+k2fdp7qC+
	hensMKtpCyJWruQnFQitCt0TeqwNqxxqfAvLpSwI8fXqhDZR62ScrTWXVW+aMwvCBu9Jqx7y/deUY
	Peljqy+kyLEj6PtPkwf8v5Zha4MnXIzGoDrGS/Zw515f/vxT8R/pstubH4z/rEA1yUS7VLIXqxWMQ
	yEW4geJLMkJ3c4c2lgFsts8pIMFISpjtIBwUsMKrxbajkjPTo4swMcj8dmcQpB3NuvKmlrCcoQTHX
	VoNNxt+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrDvx-00000001lh4-3dUG;
	Tue, 04 Aug 2026 12:07:49 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrDvw-00000001lgM-2BpH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 12:07:49 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4980dc26022so21642825e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 05:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785845266; x=1786450066; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HgW9krDqxT2FKCqRiY4Ucv2waMe6ob+70M7DoaSCHZ4=;
        b=Fq3CBCUSTenTKAbtsJYLhlIAgEsUkzrUv2w+/50bfl4P6JW6Ohmm2eCyVhTiI71RSC
         S9eCfwEWzIHbclFjcldw8jQt63pC18904/lGSqLESW1e0PaDmIy939a/nJBIiViYr9tt
         ADAiyK0hhvRfuIEv63mmkWBCUB1CBw8haC6xEV19NXMfnYyoa3Cev4lqpjWOFRNa62sk
         5THyZMPOLcHpmnAHL81HoFiU+RP1FqbpYQZRGSEYVGG1/NQP+OKQTr4JexV/VyEPbT+U
         G4YuLszpYqtmXTCsXE7JRQL2dtNh0ouRugzPFsbuoPpoR1gEpsDmZwL3U8+dz4fOHkW3
         m0Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785845266; x=1786450066;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HgW9krDqxT2FKCqRiY4Ucv2waMe6ob+70M7DoaSCHZ4=;
        b=HrN3nl2d700gVfI3fAizj2rJU7MWaAP9FjfBCNLh8TRt9Mc9YDzGFx3h+pWrzbpII7
         NYx9ejK/SAs5wHmSSCstFgGezRQdGLMozKUmpSSn/J4mge+PXnRJlppKjs/crm0p9eys
         fcUCZKIw+0ui3adS8DHYe9wQIoC5S1ExgwI+Xr9Pn4Blm5R4Dcu4bK7flss2S6OayQ2j
         WtJ3vkbGxU0Exi287DMbD4PFULpoBV/eueScEb9UnKkcPw3xXaQnpiYBOME+fEhPNwSR
         lwGGWCOh7DNe1YwxvM47y+AIIr/zQ7H4n247po6pWNKHWimuoj40PWiDpwZCKsdV/1u3
         Z89A==
X-Gm-Message-State: AOJu0YzFUkQYZQiJ3vNjJjWktsBjqSJgvRncp1fsjJJhATwK0A9KaUFF
	Cfi3SC5HFQFiNAkR3RFV3RYMbS5jprHSpG6f9PnwKQ8YiAEPevLh2UANg0Oud4ovRCI=
X-Gm-Gg: AR+sD11NBvS7AYIH1qKrFBIYKIT5LMjTwfy4tNu5+4o2pyb45I7XG5BmsQzZTVYJL9m
	zt/ZnVJbSfoaU7ONXN0F5MRdxz8xiy0X+FzTyEKHblEi1lgGdMuGVbRz8E1Pgg1sO2xpw+NddNM
	Wfaowq9MlVyj1XeRAXRLS8Wjv2LsJtS/rMVpYrrndmIB3LBUTxSNhGyROnhZrBJuZ88vPjwJYfH
	AfUoA+WJY8pU/8fGF3JXC7iYNeMjLNVjOWN567v5V6biC6kK8EnhfxK89QPSo1Ys+PcLVH65+Vs
	YjV1HNFutp4sxBgBb3OReG9ei3U152578eO5oYtl9qJyWjW4dZY1vPmVhT1jVGltuNTCO/qnq3/
	6xQ2stdC0dojyxXdE1gCQp/ZoAwFo1WkZC7j8ylQdxK6wCtzontfPU4QQbPtiiFTw4XSHomEAQH
	gvx7VYStzRHNYvA8gfm1wzngZcDa9Sn33J7FHcVoNkQicir2Fjq4FfOUFvz0IcoBaB
X-Received: by 2002:a05:600d:8443:20b0:493:e974:41ac with SMTP id 5b1f17b1804b1-4980c6562c5mr262857645e9.16.1785845265916;
        Tue, 04 Aug 2026 05:07:45 -0700 (PDT)
Received: from [10.1.1.59] ([109.255.181.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949fef72esm98922805e9.15.2026.08.04.05.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 05:07:45 -0700 (PDT)
Message-ID: <00b083b57df5107300491fa2023311ca93603a60.camel@linaro.org>
Subject: Re: [PATCH v2 1/8] arm64: dts: exynos: Move 'status' to the end to
 match coding style
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
Date: Tue, 04 Aug 2026 13:07:55 +0100
In-Reply-To: <20260801-b4-dts-coding-style-strict-v2-1-f09a659ab80d@oss.qualcomm.com>
References: <20260801-b4-dts-coding-style-strict-v2-0-f09a659ab80d@oss.qualcomm.com>
	 <20260801-b4-dts-coding-style-strict-v2-1-f09a659ab80d@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_050748_577318_25773DE7 
X-CRM114-Status: GOOD (  12.17  )
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

On Sat, 2026-08-01 at 17:06 +0200, Krzysztof Kozlowski wrote:
> 'status' property is special, thus DTS coding style expects it to be
> always the last property preceded with a blank line, as reported by
> dt-check-style:
>=20
> =C2=A0 [property-order] property 'iommus' out of canonical order (should =
sort before 'status')
> =C2=A0 [required-blank-lines] "status" must be preceded by a blank line
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
> =C2=A0arch/arm64/boot/dts/exynos/exynos2200-g0s.dts=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 2 +
> =C2=A0arch/arm64/boot/dts/exynos/exynos2200.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 98 ++++++++++++++++++++++
> =C2=A0arch/arm64/boot/dts/exynos/exynos5433-bus.dtsi=C2=A0=C2=A0=C2=A0=C2=
=A0 | 10 +++
> =C2=A0.../boot/dts/exynos/exynos5433-tm2-common.dtsi=C2=A0=C2=A0=C2=A0=C2=
=A0 | 47 +++++++++--
> =C2=A0arch/arm64/boot/dts/exynos/exynos5433.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 55 +++++++++++-
> =C2=A0arch/arm64/boot/dts/exynos/exynos7-espresso.dts=C2=A0=C2=A0=C2=A0 |=
 10 ++-
> =C2=A0arch/arm64/boot/dts/exynos/exynos7.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 24 ++++++
> =C2=A0.../boot/dts/exynos/exynos7885-jackpotlte.dts=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 3 +-
> =C2=A0arch/arm64/boot/dts/exynos/exynos7885.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 12 +++
> =C2=A0arch/arm64/boot/dts/exynos/exynos850-e850-96.dts=C2=A0=C2=A0 | 13 +=
+-
> =C2=A0arch/arm64/boot/dts/exynos/exynos850.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 31 +++++++
> =C2=A0arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dts |=C2=A0 1 +
> =C2=A0arch/arm64/boot/dts/exynos/exynos8895.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 47 +++++++++++
> =C2=A0arch/arm64/boot/dts/exynos/exynos990-c1s.dts=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 3 +-
> =C2=A0arch/arm64/boot/dts/exynos/exynos990-r8s.dts=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 3 +-
> =C2=A0.../boot/dts/exynos/exynos990-x1s-common.dtsi=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 3 +-
> =C2=A0arch/arm64/boot/dts/exynos/exynos990.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +
> =C2=A0arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts=C2=A0=C2=A0 |=C2=
=A0 9 +-
> =C2=A0arch/arm64/boot/dts/exynos/exynosautov9.dtsi=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 77 +++++++++++++++++
> =C2=A0arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts |=C2=A0 2 +
> =C2=A0arch/arm64/boot/dts/exynos/exynosautov920.dtsi=C2=A0=C2=A0=C2=A0=C2=
=A0 | 57 +++++++++++++
> =C2=A021 files changed, 485 insertions(+), 24 deletions(-)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

