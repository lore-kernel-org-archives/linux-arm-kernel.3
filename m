Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFF2AC9EC93
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 14:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MS8wKf7u9HcQpruwLfOyUPj69gKiTphjKQB/fIaDSQ8=; b=DHkn+lyTu9DdnoBmN849+UP0mo
	lPKKcctMH1YeHlJCG6m2qzHA6zbk/zOCGcVNCTxHX1xNKy7bKkKGATt7SVhoc37JIs4k6VXrLStM3
	oly9+lzV2yaWc4bgEkUxWCEuTIn/rfY/v+Z//l6joKBBQmxJFow3thXgdKb5JYMqUl1TZprSlSTuo
	msYtW8ENRokssGy7txx3KZTQlkzs9d56mALxJyVPnJiO7bR4uqyXIz1hBNfnndT7Ln8OMvaRQsWbS
	YKeRjVHSBJjd/C/EeeU6fgP5q7CgOVne3NU8WiKpu/8pdnzWNwJM7sV6mpaaHPDLBbc9OTq7MFTga
	/llyathA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfIs2-00000005WhW-2UNg;
	Mon, 12 Jan 2026 14:26:14 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfIs0-00000005Wh1-0D6j
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 14:26:13 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-8c30365ac43so612465985a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Jan 2026 06:26:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768227970; x=1768832770; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MS8wKf7u9HcQpruwLfOyUPj69gKiTphjKQB/fIaDSQ8=;
        b=ONCCt15KaMIj0g2dKj5zPTkIca0FGz8d6LUyTDTipPJK38r/OmPNc2QsE/JA4c0Iux
         BhtUA91ULYQVKrjKekesP3fKAaKdKNEO2UcW/YJufvJ35Pc4zennTq+tJ/Woesq94frX
         n9QLgvPr8NH032xBHSo88HN5balk5YFme2Gq8sXpGUmZ+0E55NDQAoKqnYs4jaZ/lyM7
         8wr5TmTzLCQgReaRo+NIGk0lYekZ0MQM8RuPyluld9cnJiF5uCdKMG7eHsaAr219M3EB
         uS6M6J9IblE/da2OjHL0S1XrJI1zN0vK2HJ4piQ1iZLwWnLLrRJ+clCZc/inOOZN+c4g
         yjtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768227970; x=1768832770;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MS8wKf7u9HcQpruwLfOyUPj69gKiTphjKQB/fIaDSQ8=;
        b=ftetHaQ9UDVCl/LEVYgP+CFRetX8BrAca/zqLFfBOoDwJnhXfEivt5DZ6nxy1VrgXc
         B2VG1G4kBgloPWa2fVGqVcYCV21J/0GgP2L5cDEdg+4jEI7QAQahht7xCaZ0vRspkROd
         fG8bY70Fg4hsbsh4hrCpiI87VNZqvuIB+gRgxu3PcIBxsq3a2IrOJ6tbP22YHEQPY0ag
         qzTyNcjBZ85wVJGwNTM1nytCugwiwPHtILi9XRRvFyPv0ml0EdSTSAetvpW1jM4mGFCL
         0S0ODserjFtwteniggt0RRrbwD/J9sUL87UFU9LdnQZPmt+eVcR9f1zVxYntBeL8+7Bm
         4XaQ==
X-Gm-Message-State: AOJu0Yz3AWpxJmWNVePeWJRApz1KUfb+4Cyk/KPFPFMp4FPtMnUk4gFN
	OLb4AQBuTCh0rbeZvqGDSswh2QBlTkmrgOjDwbQGnFKNg3tBlqTHV8OPG36qODD4Aho=
X-Gm-Gg: AY/fxX4oOXiSnXafKUYUCjzYZQtGka5fbtdryDZOUOCa+SUgPhC5NArx3BTqI4RhMv7
	E8QJSXy4/o1PyquESQaRmDLY+Fn83Uz9lv3NstWa5iq4I+9BK4CTetqoqAmkhOCUi7ZQfJfzkUx
	F4lAnBZalR9aSTpuGtgBugCcs6/pSg6KY2QTiHoHXz/nnvEE9RGE5PGYYhvRo56gr5aibTPaexP
	8Gu+hIffozEvG3Un0oUm/7alcfurDij3qr5Vtr3e0MEAfyH7QQTFGwm5y6oRuVcZOnXn8jSivQR
	OC5SBnAqzzyWP/RJ80DkjoUYSYcgkUlxqU8wxSbJOtUUZ9womTEryOQBOoud1nKBx7Ip94Uutrm
	g9/kLSfGXukzJBRHiSjpGxYtMoaJPn7FU5ZHbSn1HYRdgRRK4SCy8D3fFsfTRDlM7eDYHC/invN
	HCiJ5dy9NqeASLo2bl
X-Google-Smtp-Source: AGHT+IEXjJKk5zH4bo+R8LKpMF4MK489YPX2dESNeMCN9H3Av3eoQMSWyP5H4NLuxZlAI34TDI5m9A==
X-Received: by 2002:a05:620a:708a:b0:8b2:e827:14bc with SMTP id af79cd13be357-8c3893ea256mr2530528585a.56.1768227970407;
        Mon, 12 Jan 2026 06:26:10 -0800 (PST)
Received: from draszik.lan ([212.129.79.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f530f99sm1509223485a.36.2026.01.12.06.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 06:26:10 -0800 (PST)
Message-ID: <ba585515010ab9a9b417d000ba744f8178ca9e24.camel@linaro.org>
Subject: Re: [PATCH v2 1/5] dt-bindings: clock: google,gs101-clock: fix
 alphanumeric ordering
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus	
 <tudor.ambarus@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>, Alim
 Akhtar <alim.akhtar@samsung.com>, Sylwester Nawrocki	
 <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
	kernel-team@android.com, Will McVicker <willmcvicker@google.com>, Juan
 Yescas	 <jyescas@google.com>, Doug Anderson <dianders@google.com>
Date: Mon, 12 Jan 2026 14:26:48 +0000
In-Reply-To: <20260112-dpu-clocks-v2-1-bd00903fdeb9@linaro.org>
References: <20260112-dpu-clocks-v2-0-bd00903fdeb9@linaro.org>
	 <20260112-dpu-clocks-v2-1-bd00903fdeb9@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_062612_103457_AEA49C48 
X-CRM114-Status: GOOD (  13.92  )
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

On Mon, 2026-01-12 at 14:16 +0000, Peter Griffin wrote:
> Fix the places that don't have correct alphanumeric ordering. This will
> make reasoning about where to add future entries more straightforward.
>=20
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> =C2=A0Documentation/devicetree/bindings/clock/google,gs101-clock.yaml | 6=
 +++---
> =C2=A01 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/google,gs101-clock.y=
aml b/Documentation/devicetree/bindings/clock/google,gs101-
> clock.yaml
> index 09e679c1a9def03d53b8b493929911ea902a1763..a8176687bb773ae90800b9c25=
6bcccebfdef2e49 100644
> --- a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
> @@ -27,13 +27,13 @@ description: |
> =C2=A0properties:
> =C2=A0=C2=A0 compatible:
> =C2=A0=C2=A0=C2=A0=C2=A0 enum:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - google,gs101-cmu-top
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - google,gs101-cmu-apm
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - google,gs101-cmu-misc
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - google,gs101-cmu-hsi0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - google,gs101-cmu-hsi2
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - google,gs101-cmu-misc
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - google,gs101-cmu-peric0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - google,gs101-cmu-peric1
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - google,gs101-cmu-top

If we keep 'top' at the top as one outlier, it'd reflect that it is the
top unit and all other CMUs are children of it.

> =C2=A0
> =C2=A0=C2=A0 clocks:
> =C2=A0=C2=A0=C2=A0=C2=A0 minItems: 1
> @@ -70,8 +70,8 @@ allOf:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 contains:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
enum:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 - google,gs101-cmu-top
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 - google,gs101-cmu-apm
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 - google,gs101-cmu-top

And here.

Either way, I don't mind:
Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

Cheers,
Andre'

