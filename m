Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE7CBC3ABA9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 13:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rW1MhyT91saKVAFuqB6OQab7qD4mL9UWcfPujvEtR98=; b=FEgutDUBsMuLwpQU/iGebg8b9/
	DAXeS6lZWOjIydtFJZsMmWDTu+l9j7+ZR9BiN9JsEBMcghj3ViNl/eDOa9wD/DFcrK9t9oYax44WK
	8mTSqlT63MiFxCMyLVcBK/X9KsIqHB8mEu9f6dfcNGU/ZmffdFj/tl0gz79jal+qUayrOpmfX3yzG
	RYdYDVsHwfm/P2O+NnJv4kcA8FRX9T1leoumZP4//HxX93os2PJqSroA1DnqVcautstteo4s/vYOp
	v1JSoTvf2LmRI+S9bxCQVfYr5enZ/sM52nSGcBzzuHspv3E6aEqIYLq9HyGmIu1sDvyGAWlun61H1
	7cOU9Ypw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA77v-0000000Cvfs-2iBU;
	Wed, 30 Apr 2025 13:05:27 +0000
Received: from mail-qk1-f176.google.com ([209.85.222.176])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA75x-0000000CvFE-3shK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 13:03:27 +0000
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7c922734cc2so113481785a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Apr 2025 06:03:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746018204; x=1746623004;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rW1MhyT91saKVAFuqB6OQab7qD4mL9UWcfPujvEtR98=;
        b=nmKqPrKwccXKZCO+ZBeKNkukEchgA0AgSqKvRHopsGH0qxX+KlKUQZT8CIVYQRlRxB
         V2D1XlUadNZLfXkYuKLNCmsy1qu1s97X3622gxiFsam+mnOwDS8rlNyL7kxmVwFuX+wC
         sTY7/r+Yu8U5+aVeY0ibOwuMmjR9zTFq+34xe2JM0Abu5OkEoX1qISqk/fZBcW9wJG5c
         0ohEnI8N8FT5a1xoa8znArZdFmGLpMA7HPBZLhksK90jTca3/ICK52D8niRXMFv8BI1C
         5CWAomcClFkDdtCV/W8aRYAGDXUTzzoCJ2M/YUWTA/JHuVZAFIWdqrk5EA+ikQJq7mOV
         zgFw==
X-Forwarded-Encrypted: i=1; AJvYcCX1CHpskidm94xPOmh2Sx7FjAtVt9iTjyGxy1oocMX7Jn6zPJr+zn8LNHcun9jIVOoGmAq5Pf/igYyBHzv36ZS+@lists.infradead.org
X-Gm-Message-State: AOJu0YwUsVOnLVtV42GVuqDaPBkNKnwI7CkOl/TuB7789QSYQXVYR2oS
	Uz0EpwkX7SU6Gw13ZH3lQ3XiDZ+N1oZR72C9XtlSGhYnZ7ukqH7u+PE0Df/7
X-Gm-Gg: ASbGncuEGyYkOp1y+B8Ymn2frxTEY8ssJZXUaOG58A+EQY+jgzIhr1UN1PFtaxwzUlm
	r/rqHeu4jxUKuuXQRL0PGJWOZ20/0KmA7hFbpBsO6Zjo9TnDW8+2OO4xsw9zRLkU4pjp617gPZN
	G9MxGHGkAjdUpi17ChJm2zD9+0NGqF81e8/eLgjRo+zlHtjRBUtuz9c9FzifEraTPnPf27ENCKN
	kvoLvEHgZ9llDMoKPYy7510jyGirMAnVShqalQi28x2jeMl5LbX/yHIK+ZhWrPflocR9muEOcqH
	uOO6M8HQIReby+UA33pizmvzkk7E5bPeKWmT8lODBcEKuV4QQarkBLtDWV0cXHU9ysNwy/ue0q8
	n9posIiE=
X-Google-Smtp-Source: AGHT+IEzMmANgZXnBM2tlH4q60y7ld/JXj40gHqRGEtlWbYnPS61WfTz/38ehSY2ukIOpNIw3ur5Kg==
X-Received: by 2002:a05:620a:1793:b0:7c5:95e6:62c9 with SMTP id af79cd13be357-7cac7b5c420mr455757285a.29.1746018203489;
        Wed, 30 Apr 2025 06:03:23 -0700 (PDT)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com. [209.85.222.178])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c958e9f4c6sm851825085a.92.2025.04.30.06.03.23
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 06:03:23 -0700 (PDT)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7c9376c4dbaso110825685a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Apr 2025 06:03:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWRAWa16EL9P1H1ylPDwnYVODTKlDdBk4TMcrTaOOOTCvyjDsjEabE1iuq/59jL2Jxpjb/RNg/h2h6PNYItTheh@lists.infradead.org
X-Received: by 2002:a05:620a:2890:b0:7c9:574d:a344 with SMTP id
 af79cd13be357-7cac7b5c591mr351112885a.25.1746018203056; Wed, 30 Apr 2025
 06:03:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250430125322.2808528-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20250430125322.2808528-1-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 30 Apr 2025 15:03:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVXrHVugCMoWkCRVGotOEeTuuJJ6rC7CC7Kf_seo3J5og@mail.gmail.com>
X-Gm-Features: ATxdqUF5SmUHR6IS83F_BlSTuqKqxW8yJEwc4_Me4L0hReYlvlJOP5xqk2h4aew
Message-ID: <CAMuHMdVXrHVugCMoWkCRVGotOEeTuuJJ6rC7CC7Kf_seo3J5og@mail.gmail.com>
Subject: Re: [PATCH] media: dt-bindings: sony,imx290: Update usage example
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_060325_964168_CC3BD82E 
X-CRM114-Status: GOOD (  22.21  )
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

Hi Niklas,

On Wed, 30 Apr 2025 at 14:58, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Since commit 98e0500eadb7 ("media: i2c: imx290: Add configurable link
> frequency and pixel rate") the driver expects two specific
> link-frequency settings 2-lane (445500000, 297000000) and 4-lane
> (222750000, 148500000) operation. The driver fails to probe without
> these exact settings.
>
> Update the example in the bindings to match this to make it easier for
> users to incorporate this sensor in their device tree descriptions
> without having to read the driver sources when the driver fails to
> probe.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
> @@ -136,7 +136,7 @@ examples:
>              port {
>                  imx290_ep: endpoint {
>                      data-lanes =3D <1 2 3 4>;
> -                    link-frequencies =3D /bits/ 64 <445500000>;
> +                    link-frequencies =3D /bits/ 64 <222750000 148500000>=
;
>                      remote-endpoint =3D <&csiphy0_ep>;
>                  };
>              };

I guess the link-frequencies property should gain a rule that it
needs two values, too?

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

