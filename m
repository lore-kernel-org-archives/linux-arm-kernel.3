Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7666CC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 11:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v+pIXqI4Yn7FIR8fGNeli3S1YAjHULa95SiXJrMUGHo=; b=We/EZjJPJlbPU7Tt9bTpgYINlR
	DrJTePai/phb3DeFK19Ke3ajXl5MOk7QLZnA/qjLwALXl0dEYbPBKduOEfDlxpkrP6/TCYz1jsGaT
	5dD1aYUbXBiRAkQFNOJr/ilQ893QxfYCUU7yVFk3pT+Kp5S4LfMsDuhJG30gkitowl9numBLgAftV
	eoAU5CJxpNrlaKtMgnquo9S0U3tVv0hholquJFr67BE+UIxl/mDM8KU0NrAKmp540t19y1D4bOx+e
	E8yA4bXltTa24t++ezV/5fF9lZGp71pobILaX43mMEknfWo9ho6KMZnBiWLkLd3lHk6ayHhBmxFYo
	74GxaEuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woJAC-00000002Y6a-0k0Z;
	Mon, 27 Jul 2026 11:06:28 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woJAA-00000002Y6E-0bD0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 11:06:27 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-69ffbd2a277so1130189a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 04:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785150384; x=1785755184; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=v+pIXqI4Yn7FIR8fGNeli3S1YAjHULa95SiXJrMUGHo=;
        b=XHNab1E0Pi9yB1iuBovr+37qt6jWxa/9a+++faDsFpSkKGujiVIeBpb1doK/9nyuRV
         er+eHvFrL8qeuuzqo0aUoj8TJVLEzMgwPD0BEJgy9GNwiv4uqQU8YnQckM096DnDrYG0
         oQj1HRBUGZo0UIjpvetG88OT2+Jr1g4UFzjVzGOp44MLkjAHUsd2+Sgs4s6R3vtsjWSa
         zMQmnOJeEa0AqGqDygSUdaUQ3XSek9im6LDqUD5wL2qwWqVJPRFeYkUEORgDxZku1fUM
         N394ZEW+4Rwsy/vAihyZXbD6xah2FpF4Y8/xBnPBqlC74KXnm8A2J7b3wIGQVCKdi0bi
         YARg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785150384; x=1785755184;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v+pIXqI4Yn7FIR8fGNeli3S1YAjHULa95SiXJrMUGHo=;
        b=pk7WZZFG+yMP0dexfkaks5mAvNAXaBjA4WCXn0iMmUUjtHD4EE1XXG9bumtnJf+h1G
         bUvg2y/T9HAFJV4yandScWjx6nhBFrdRx99AyiX1dCXko2vVD/oJueGLx/HWWmxPUqhf
         wG268rKSlDFcH5/MzFgAabND3LOwgIf+S6vIejnfCI9Jz+kIb2Am7DwY1M4NJWR/48LO
         qQBjzb5aTbTD2VaM3JAmAsgLpTe30ltxP3AjdyCjbeHQ1oc5acCrLrbhOVnZ7m+gl1xU
         JiXYMZEmW5vB3JB2I/pQHnkOnkTB9mh27EjQXQiy2xTRdHLK0rmQBWMzWkw85KiCqomC
         vhUg==
X-Gm-Message-State: AOJu0YzjCF5AI6GwBp5ZCeOClae6pjVFjP2p0+w+5FxaOXWsVZKsDzXA
	nORKWrBji34e0RfxoVdwAp3lJVNryBrC0p+hmlsPSE23RK1Kj8RVDH3OJyyOt092BFM=
X-Gm-Gg: AR+sD10IrdmAKMvs5pT9u45hCtxzAuPnSpvRx7GnTlA0dAfZziYj5gJ5bAn1RgAZayu
	H/rkukHFOdrzSVFQkt6zep4k8CHRgSDV+wf/cdrJN8sRX/CgdoPsceLTdKBzxj25sX5j0xqwseL
	ZbLbnATyu5p7+KhTqr/FZr9pKxq7ocqZJhzL+AslS9aeOx2fYCNR3X7JFudOgmvNkxFXgsx1DZI
	IebYbCX2WOW8eFri5JcvaVx3EEbNsf8hTOzSc3TrJLKKYshDxLm6KckMS+2xzpXRVxjPI7wo0Cv
	cJAtu6t/am5CaN08iMR9N4y2kEpnWgXDbk3TZI3jpaGcesKdoCf6Tv1LaFemVX+K07wa7nCOcuH
	PgArvk8GYQ/h9nQQIWdornGWQh9DvpQzn1H7OIPMxFDciYkZ0LK5GlGqRdtLiKhaXSwxxzHCSun
	mf0cButg==
X-Received: by 2002:a05:6402:28c9:b0:699:e496:870e with SMTP id 4fb4d7f45d1cf-69fc1159931mr2804954a12.20.1785150384355;
        Mon, 27 Jul 2026 04:06:24 -0700 (PDT)
Received: from [10.1.1.59] ([109.255.181.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69fb55439absm2454955a12.19.2026.07.27.04.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 04:06:23 -0700 (PDT)
Message-ID: <32582351575d8cbc06fc68ab3d12d598bd317ab5.camel@linaro.org>
Subject: Re: [PATCH 3/8] arm64: dts: exynos5433: Override thermal zones by
 phandle
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
Date: Mon, 27 Jul 2026 12:06:41 +0100
In-Reply-To: <20260726-b4-dts-coding-style-strict-v1-3-e9e3e9879d05@oss.qualcomm.com>
References: <20260726-b4-dts-coding-style-strict-v1-0-e9e3e9879d05@oss.qualcomm.com>
	 <20260726-b4-dts-coding-style-strict-v1-3-e9e3e9879d05@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8+build1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_040626_215606_6B80AEC9 
X-CRM114-Status: UNSURE (   9.89  )
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
> Fix indentation of DTSI file with thermal zones (two opening { brackets,
> but only one indent) by using a safer choice of phandle/label override.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
> =C2=A0arch/arm64/boot/dts/exynos/exynos5433-tmu.dtsi | 4 +---
> =C2=A0arch/arm64/boot/dts/exynos/exynos5433.dtsi=C2=A0=C2=A0=C2=A0=C2=A0 =
| 3 +++
> =C2=A02 files changed, 4 insertions(+), 3 deletions(-)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

