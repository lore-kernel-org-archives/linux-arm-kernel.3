Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4331FE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 14:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zhapTHXOL6nnyzfeibqtjCKKJ3noEWy6OsULxomBlLw=; b=s4J6YqJdcdczXdLPe6eabQRd75
	BCidENc0pDqBLRs9Vh5emzThHAT9uFyne3GSD5DJYjSsHSuPjiwEaJ/lWvzG317fv2xbdEMR5c1cA
	dOp4AwGKov4eeW+xqdBW9UFgHDRmgpe3eB+OkIYi6Wx1h1JWjakcd5tmWLPWtAyVuMv7N/HPw+ZwQ
	byvehV+IARCRj0amniGAo1F+tmmI/TU8DE1LDz+SGY0OsYWlLohZ4lwuHVCz37desLlLGoqDfouQI
	DUdrzggVVkmTE29m8eiVfhR8f0HkQjip/mqtUKzmUkHJ7t3gwBpn6eZ29gGcgTz+xLaQ/JicQ2K3I
	n1LY+/fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTj7D-0000000DBYu-3mP1;
	Fri, 03 Jan 2025 14:57:31 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTj5z-0000000DBMl-3aJX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 14:56:17 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-e46ebe19489so15125277276.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jan 2025 06:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735916174; x=1736520974; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zhapTHXOL6nnyzfeibqtjCKKJ3noEWy6OsULxomBlLw=;
        b=cNAovuD6+qv8rdfA2j5TK9Nm2O+DMyvdQUJudljspaUtqRGvDN2UgJTwQiWoeice6q
         iAKQH1oYgKGNj/o3wjNp/PzaBn8f6uL700uEO7keyI2olFyXwow0AYwH3UEI4Q8UTvoz
         YkhPdCmkSqTeXVWFVKJ4RSxKXkPUqm8lXDC9Dlo5XBIhVSFnlNJQN+GVKohAPHA6VqIl
         7ZsbBzvgUcLS5OjDBwqqeBk5wKpHNPd+ikBntdIiFKhpoMKYWdCt6Qge5DnySgoh/vRL
         FoySADHeDIRkwUFM9+AooMghETVWR78x/xClRpdZj/JH4rLcVmZA99MD4laU8OnWhpFE
         7tRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735916174; x=1736520974;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zhapTHXOL6nnyzfeibqtjCKKJ3noEWy6OsULxomBlLw=;
        b=CQan7sWmaIX1iuJeRQ6WMMR0xhyd95/K3wfGzUbx3iZVUNNoJiOZ3kJRS1Xw/M2YP5
         ifSEOeDI+xp8CqUw8JwvDJtQE9MkmWaSUTR/Wu2Fm4ThDCBH+zBbn6aEtuLcqS8wQVq6
         850ZYzeX7xPDUd5KxABsNG4G1hDIlU9BuS63sXOpGZ4RoYTtHyvNqhekacIn/jz7D9jA
         ej+LTgD1WiH0usoS0jsz8gS1NqnIgdWJlOx8eRQIKt81NiKG4wYD09Uutrrqvy6KER3F
         fsfNQ+aTPQz82EFkgpMo0xWbUSTU/vVCPUSr6xgfJHkWFWwUa+hF2o1LdRyOqtWvyE7E
         H6fQ==
X-Forwarded-Encrypted: i=1; AJvYcCV40QMR5/zGL+5hUsS/z1ppBI3mx0dtIrvvZwah+DRdXLGJxzfAkpNFqSaelDuHFwH/U/WkljCJrIDQ+WtgEfxv@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7D9GPNOHxDf+vE1X8+zD+E+bq9GWKmA1palnistKXLTjSD1Ma
	n2g09JAscKb9vW8ZqIor9DFO7W/kAafC9oqf9chBEcMaw5PA8iRpfHDgZI61cox6yeRpwOd5j8c
	ylQEFP03m++WXTptVX2p1N8sK3JOpEiRXfsMYdA==
X-Gm-Gg: ASbGnct65Nq2ElYw8M7iJWRqUXiI+qcQW2qy7SvtDdgAPy2Ea3oBFiCoq1O19sQY3OM
	bKRJ6M4jl7/j3dfx+96uZcuzak2kKZC3+KtYgqWkB2htz2LyRwnNeru7W0qxR7HFmokdgt87Z
X-Google-Smtp-Source: AGHT+IF8PgxghS0Yr8Fk32/LsnBMib2ycn/MjDyFQwGcJ2L9c+3xpdMG7fYH2+JRjVmj3XvaZJC4FTktLg/66x4obwQ=
X-Received: by 2002:a05:6902:1589:b0:e4b:3d71:346a with SMTP id
 3f1490d57ef6-e538c20774dmr30599997276.11.1735916173951; Fri, 03 Jan 2025
 06:56:13 -0800 (PST)
MIME-Version: 1.0
References: <20250103082549.19419-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250103082549.19419-1-krzysztof.kozlowski@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 3 Jan 2025 08:56:03 -0600
Message-ID: <CAPLW+4ncvOxj7nmypsw-+Tvj_gk5AHoWVeE9YKL=W=8y_MTjUg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: samsung: exynos-usi: Restrict possible
 samsung,mode values
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_065615_902037_7041BD10 
X-CRM114-Status: GOOD (  13.20  )
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

On Fri, Jan 3, 2025 at 2:25=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> "samsung,mode" property defines the desired mode of the serial engine
> (e.g. I2C or SPI) and only few values are allowed/used by Linux driver.
>
> Cc: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yam=
l b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
> index f80fcbc3128b..5b046932fbc3 100644
> --- a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
> +++ b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
> @@ -64,6 +64,7 @@ properties:
>
>    samsung,mode:
>      $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1, 2, 3]
>      description:
>        Selects USI function (which serial protocol to use). Refer to
>        <include/dt-bindings/soc/samsung,exynos-usi.h> for valid USI mode =
values.
> --
> 2.43.0
>

