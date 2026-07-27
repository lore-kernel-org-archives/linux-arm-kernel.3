Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4E62C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 11:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ia0G9LEkGdE7OHYonYczpOBgN2i+djSgDVIwUI3fTYI=; b=uVgMhxpNm4xiCKlWfcVqPkbYUD
	pJ6Z0MNuyDn1EXllzgKbND72G24GGAmr910lu3sIMncR36acbOhq2qcp/xdIrELPmwhKtxyvrX4ET
	h6wDKDzjddOCuSMCF6+fhiyTxA4DxJhP/gnH8LZhHdrH/sTLllb+9v98sJ2GPI3KEgQZsm7fYWbZm
	M1e2UN6Be9AeA+BDYYx9HkE453gcdrClJsQT44xKg1d5z0swcXfd0baGDbqqAA/+rZTC4o0yrK/Z9
	rolf5T7SFS+81HgttfQqxY18F1ajSF7Xagj5i6HWw0wLh0YK8yMD2uPon5oBhoZTcTB2KTGadDK4p
	HnuGTNAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woJ7n-00000002Xim-1mVt;
	Mon, 27 Jul 2026 11:03:59 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woJ7j-00000002Xhi-1xjY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 11:03:57 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-c1691e4ec40so337728866b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 04:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785150233; x=1785755033; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ia0G9LEkGdE7OHYonYczpOBgN2i+djSgDVIwUI3fTYI=;
        b=kUV+JcRbq96ATUDAay9PPm7+ZxN7T6dEDGZWksS+jYIQ2n15XI/q4Ozl+4wDZGiPko
         f6NZq29SXb+xsdGYMP6A4aPFuj5AFYr3UApOaLenG4dFhVxRuYJNA+5hGiN31ekIjRQv
         htrB4ELQOlk3tAKyusgIrUaxgq6hZALC5LSrkzIUcMk3z4otQVktnX27cTDqFNjk0+Of
         kqDtvFayPOnp+KTogh/DriDAtN0SlhzOGnW00Lh9QRpgkH+pzJLkGECJO+CcdnN56/Hy
         rK8Xf//o02gwRKtvHyjSD0elBiEj79PHeGVjWQ5Q2qdJQMyY8OopopINpRyaym5ri9xa
         zIcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785150233; x=1785755033;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ia0G9LEkGdE7OHYonYczpOBgN2i+djSgDVIwUI3fTYI=;
        b=YSOfVUWwIm3f20vOOGAUSYDTsiOtJeshO5r6UMNr0ptSY0AayKZdEHg5I5+CUxj2cv
         oMPkaWy3v3YVyl8uf6UBO2CdX3IEOmwyrDPEeSp/E3joRo1sqbSpmp7VB2Da8G2YrpJr
         R5Jlm02COLj2G8xHZB+OlHrfhmyhuHDPDqLmZWY7rxpueBW/bYvhkowwNGGHQh0254Df
         3nRYXHsBmqvIE9uLbU8IyPJELPztlr9T9ACwcnjZjfrzH3qr4viiIeSd5g2pg2IT/A2z
         oZcGmKxV33HcrZKDROCzLHtGxRgrca29YGJ71onEHCG2bap+gyZto4y+A/5xzp0FW/bp
         Fk/Q==
X-Gm-Message-State: AOJu0YyYlmTc3an+h7+kIUS5S+T2BiYss4Kg+w+U/cBua5UQtMJu5Zdd
	hPptjZsqvcYWpVc8s0w+SMohMoq+pq0cU/BHU8D8NqkXF0Y+ZKN4+Z/OGXyYcSG5TtE=
X-Gm-Gg: AR+sD12y59Z8enY7nIJnlQaJk5cRpqLNjasdItLPstHG/u26dDcQlG//eD1tpzJ2fq/
	naiFNiiVde3s4NT7BLoZ2+F+vxapyoevyeXKudZLTg/+wbTPAJjf4jUWf0z4nQzwSg9LAPTQln/
	TIJOFZuw2EjUMQYXYL5HgF6xx+EnADav20VR1HZ7X5gKirGdXP6jc363YFmnwSr7cWryySaAUql
	atwaJPM6+Gbq7UgLnbcSr/Pjk9o/qfb4/ngdhN+eVqNrLB8nTD8OHi1bXQ3YDGClSIoOBDNmVLZ
	U0kYiZNtK94ZhjEojH99i+UW+qlwTbKQdcNFi4jx0J5IkkjetBAwZJtJ8AsUDYaTLVHMf9wDqcZ
	fNHtLEXhE/9ZCbsg/Lf4aAq/w+AHIAB03A/oq6aSZXkOO1hpTvZJqqDmnKIVpU0L+sB0lVV5r7u
	YLNlArP5TUn1/xPSAf
X-Received: by 2002:a17:907:9994:b0:c1c:22d4:3a9b with SMTP id a640c23a62f3a-c1f1f153e8emr313513666b.43.1785150233167;
        Mon, 27 Jul 2026 04:03:53 -0700 (PDT)
Received: from [10.1.1.59] ([109.255.181.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32ac8c4bsm635352466b.18.2026.07.27.04.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 04:03:52 -0700 (PDT)
Message-ID: <81160ceaf02ad31c4b86c00dd4bcdcf1fe624788.camel@linaro.org>
Subject: Re: [PATCH 1/8] arm64: dts: exynos: Move 'status' to the end to
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
Date: Mon, 27 Jul 2026 12:04:11 +0100
In-Reply-To: <20260726-b4-dts-coding-style-strict-v1-1-e9e3e9879d05@oss.qualcomm.com>
References: <20260726-b4-dts-coding-style-strict-v1-0-e9e3e9879d05@oss.qualcomm.com>
	 <20260726-b4-dts-coding-style-strict-v1-1-e9e3e9879d05@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8+build1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_040355_527054_72B859ED 
X-CRM114-Status: GOOD (  10.03  )
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

Hi Krzysztof,

On Sun, 2026-07-26 at 19:43 +0200, Krzysztof Kozlowski wrote:
> diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot=
/dts/exynos/exynos5433.dtsi
> index fa2029e280a5..17b13a586973 100644
> --- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> @@ -755,6 +755,7 @@ tmu_atlas0: tmu@10060000 {
> =C2=A0				<&cmu_peris CLK_SCLK_TMU0>;
> =C2=A0			clock-names =3D "tmu_apbif", "tmu_sclk";
> =C2=A0			#thermal-sensor-cells =3D <0>;
> +
> =C2=A0			status =3D "disabled";
> =C2=A0		};
> =C2=A0
> @@ -766,7 +767,9 @@ tmu_atlas1: tmu@10068000 {
> =C2=A0				<&cmu_peris CLK_SCLK_TMU0>;
> =C2=A0			clock-names =3D "tmu_apbif", "tmu_sclk";
> =C2=A0			#thermal-sensor-cells =3D <0>;
> +
> =C2=A0			status =3D "disabled";
> +
> =C2=A0		};

This adds an extra empty line.


Cheers,
A.

