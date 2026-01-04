Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3A37C2A074
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Jan 2026 11:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e4uQTn1+ESOxyNSsQVXvd87WkSOpBRdjyDbi0+Cmnuw=; b=CAeolbl1ZRZjsXxtd8vaLIEeWU
	yg9RCs5FQ7RKWtUHqDp+l+T9sUTtd56GfAiZHFeNvglJ/DddtiFs+N7z73uIqGLxz/v+AJYbIOLhu
	W14l8LUWNrzziFgPkOXo40fjjgckbcZ2iPJ7ZeukcPLWI/GKFIdwWTalRj2sxbNzr/X98yzYMKxKx
	wORNBE1VS7f50Ftt1oHeArU28Oqnd8Jkpz7VgZBht/miXCXDeT7i28P/cQL3jkEOrT1MbPgc4d79S
	e6RdcdhLfx5nOeqy5h3crU53uBOMxevUnn0xJEQA7DGWcF550KmKiSBzstAAivUZ0BBp3v51SLFlB
	muvjmTJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcMar-0000000ACkG-0Za5;
	Sun, 04 Jan 2026 11:48:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcMao-0000000ACjp-2vIs
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Jan 2026 11:48:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 31039437AC
	for <linux-arm-kernel@lists.infradead.org>; Sun,  4 Jan 2026 11:48:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DFC8C2BC86
	for <linux-arm-kernel@lists.infradead.org>; Sun,  4 Jan 2026 11:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767527297;
	bh=I0lPw9M6IVwRkDiioixB1o0oDbNxBQ4cmgrqp3BqxJ0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VTRDI2LV3o0jW3eDCcz3JGlJcAzoTiTJMtQRDQjjL0QcvH/P06AhyP0iDs3E12a08
	 1bfxjFMZZ3CmHsPe1cS9LIXwtY+ZCnVpEbsNrpdOO0s4po/T41MHkk83TlaAGXCXW3
	 kit3OGb+YURbF08TywxCta/NnVWdLxoo2Z3s3rPpew2oo7FhFw/4buvHAyAQp8S64V
	 2UVye59DCf76EBcO+U/qZmAgqFV8OyXJ0uLCj+r7/AS+AudNccgN01p3zQQup9XHEy
	 K+d+idy47k6m7FfYb7fpEOkWSMUWCcznJUpsByww7zU6XLXZCqVl53Ardig/2qjCd8
	 enQA+A6xY/khg==
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-64669a2ecb5so1073320d50.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 04 Jan 2026 03:48:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUJk2wVprAFl6GLCKdb1x+Xj29lSu8HjSG6iTekhi9DFV/Xje362OZLhxzWV2T944WiFJrgRvmtSVygdfX2WpbM@lists.infradead.org
X-Gm-Message-State: AOJu0Yzlyr1Dsun04HkE4JgqqKQUKATlEWAMiYdUgVQUZ4pAwNIB5EiI
	leoUMdkhJYwFIIEpA7kMIpdg/aLRgu3RXSJuyAJlgd4KGgTCWybA/BtUpdNehSrQh0+cH5AMEG6
	rpASwZWWK0O3tVZpCsTgBL+Joi0JKi2w=
X-Google-Smtp-Source: AGHT+IEH4Sm8WJaFK+x+RlCyRzWOrDqAadQrajL3EXv2yzCn2zhpj2YARFH+oUXmFDV1NIRkB+W/xitiP829rCgCnRg=
X-Received: by 2002:a05:690e:4189:b0:645:559f:d7dd with SMTP id
 956f58d0204a3-646e3398ac1mr3243278d50.14.1767527296406; Sun, 04 Jan 2026
 03:48:16 -0800 (PST)
MIME-Version: 1.0
References: <20251227114957.3287944-1-ye.zhang@rock-chips.com> <20251227114957.3287944-6-ye.zhang@rock-chips.com>
In-Reply-To: <20251227114957.3287944-6-ye.zhang@rock-chips.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 4 Jan 2026 12:48:04 +0100
X-Gmail-Original-Message-ID: <CAD++jL=fri43Q1XbMJoOUeoWJw9RwMDJLjcjO8zSbyHb7z+Dzg@mail.gmail.com>
X-Gm-Features: AQt7F2oTWlXUXjidoWo77Ak7o32fHRY2YlKW0oxaqrPEmcpXVDJKxEyAH8MVM9k
Message-ID: <CAD++jL=fri43Q1XbMJoOUeoWJw9RwMDJLjcjO8zSbyHb7z+Dzg@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] dt-bindings: pinctrl: rockchip: Add rk3506 rmio support
To: Ye Zhang <ye.zhang@rock-chips.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	tao.huang@rock-chips.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_034818_784592_34CC0805 
X-CRM114-Status: GOOD (  12.56  )
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

On Sat, Dec 27, 2025 at 12:55=E2=80=AFPM Ye Zhang <ye.zhang@rock-chips.com>=
 wrote:

> +      rockchip,rmio-pins:
> +        $ref: /schemas/types.yaml#/definitions/uint32-matrix
> +        minItems: 1
> +        items:
> +          items:
> +            - minimum: 0
> +              description: RMIO ID (Controller index)
> +            - minimum: 0
> +              description: Pin index within the RMIO controller
> +            - minimum: 0
> +              description: Function Mux ID
> +        description:
> +          Configuration for the Rockchip Matrix I/O (RMIO) block. The fo=
rmat
> +          is <rmio_id pin_id function_id>. This acts as a secondary muxi=
ng
> +          layer when the primary 'rockchip,pins' mux is set to the RMIO
> +          function.

I think this should just use the standard pinmux =3D <>; property
with some shifting and masking.

Yours,
Linus Walleij

