Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58FABC36017
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 15:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Orn2weosT5jJana/hCRXI9hGoRi//FUlVXh3Bn5kQew=; b=pUXnLuoZQOAAseFQUhNZG0Jjoz
	+W8kDcBP1O4Jn5R4IWFi/EF78DHs6UVkk6f5UNI1AYNOxeGfeAWd+QvIF0ittYJfmWS2mVDeZKBI0
	eVQ7MLVWKNYuQMbaQhEhDtOmiuCqLPXZiei9uMbWeMhTVeXfpmuZc6qoYoskadIvhDLAy7edI2Bvv
	xTfi3U5+N0S0IjiAo7a74VhN1+6y8cm0gz6i0kwTeUsiDx0UGs2ICnM6ud7dyxDRjcv/o0sbnU06y
	ZvoN0c4f+EzDoAkw8Sau/7wrmI49KpzUjG7zmYynqP76fvBX1gudns1Zcd0UXB/18Ho6rEx/msVBX
	OtUpBG5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyC2D-0000000Dp74-1JVc;
	Fri, 28 Mar 2025 15:54:17 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyBHm-0000000Di73-0IrE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 15:06:19 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-7c5e1b40f68so261337685a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Mar 2025 08:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743174377; x=1743779177; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Orn2weosT5jJana/hCRXI9hGoRi//FUlVXh3Bn5kQew=;
        b=M8H/InXtpcLkQBUwVQ7E8m7NnrtmeeBg2J2bTwclcFDP2A1ANNDDlaGP2+0Jm/5Y15
         uzbVuSEzvs6pCoK0IiHi3nkk1mL6REZod8ul3/5e+wf8oR9ghQSdkOCYWujzcoJSD6sI
         v15eJaXyqHy3Uku1kpahoSV6qTbssCFc68Z3+GmAjrhjXl3tubyOmZ83eQjA9NvvRuP0
         gBtGxlj9ZTGxerPdOCN55vsRvAToqdJJ9FhltIWDxrWqfwsONbIptf6GYBJ8u7GAYODV
         ih8C3XUL8iHIUkCM86eCwlY59a+cNiNr7/3OqPMpoNa+60ZFoYSCvMBgrS02x/DcSYFA
         13kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743174377; x=1743779177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Orn2weosT5jJana/hCRXI9hGoRi//FUlVXh3Bn5kQew=;
        b=Zkw9amfJMr45Hav+z+oWuCgvc3PmsMOR+nFUCWKa8nAR83Tdw/y0A/xANdlFSmI1o0
         kemLYjnHWVL2zF8DSRJUwcI1Lraq0pIvntFNCa3GK5s1Xb41iRDzq/J1qZfla4t0XP2t
         4b9+hlPtwYsUNfJBzrc+hqms8g1R7eySGFAMBxKZua/IsjuvFS4e7CrFnFK2L6/PkNzN
         RLwHwqmKynYfDU6Y86GmocVvhSRO57trR01tOrEa6C3jXm2fXG/stAwCUca7uAmeBrAz
         vlxzozD2Dm7GEx4S2vIgSeqCpULF/gYIn022BfeTraJYVFWMyEqrorNZAWAm/FwSUMQw
         DNTg==
X-Forwarded-Encrypted: i=1; AJvYcCWS7mrkooYHpahmG1v7Y3WT5kzNJ9cItL+qgzUB1NEsYB9h55kieqwXm2TMvpgN2m+7VGeYF8NZ1CPoHsUvK40e@lists.infradead.org
X-Gm-Message-State: AOJu0YxmS7aQO19+dKhZhfRfapsMTCa9PaVzJ962HqgUq27NGHkxY73U
	7bGwQtJ40InNLuPxwkYprIAOIqT1BZRxUk41S+4tGj7pIWzgNCB8uFO7u13ur2kAnsc/eswPGOe
	XlX1VVfbMxLLvqOKZE95UUfHLksI=
X-Gm-Gg: ASbGncutKGxvR+zmzstYuCUFiM+T5jn4mDEkQRkAmmeF/116n9DfxPJp7iLiU8nVHxL
	e0b6y/E5Fd52+P1jIT3Px4KfaHn2NT0wi8UwN0O4VoPBs7kKeoHVzMUOsNDSy1xV2gbYo/+MOJg
	eSDwCIgNCSRZ0vttkNKfO4sUeq4b5TyKN8P82CNoDEW8/bRXPVGYf/pIuG
X-Google-Smtp-Source: AGHT+IFW0VA4Zv/33X4FCYRGbXWAjJlO3mDUtzxWY6BkmxfmFBxzZdcJa6RDKtHjQ59yi8kozYRD8j9xZb2ykNzJwVU=
X-Received: by 2002:a05:620a:1a85:b0:7c5:42c8:ac82 with SMTP id
 af79cd13be357-7c5ed9fd9bdmr1032660085a.23.1743174376627; Fri, 28 Mar 2025
 08:06:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250326143945.82142-12-prabhakar.mahadev-lad.rj@bp.renesas.com> <3d88eee6-1401-4ffc-85bb-3ea91f28d186@kernel.org>
In-Reply-To: <3d88eee6-1401-4ffc-85bb-3ea91f28d186@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 28 Mar 2025 15:05:50 +0000
X-Gm-Features: AQ5f1Jo64DhVhvivaBJ7_luXnb-ReN0FMIj63tAndBnF_2sTF5NPerz6hjb5DLs
Message-ID: <CA+V-a8uckO7thK15Oa=+eDwtECzUS9e6tqa32MFU_mHmk+_Kew@mail.gmail.com>
Subject: Re: [PATCH 11/15] dt-bindings: pinctrl: renesas: Document RZ/V2N SoC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_080618_112184_B9639736 
X-CRM114-Status: GOOD (  17.70  )
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

Hi  Krzysztof,

Thank you for the review.

On Thu, Mar 27, 2025 at 7:48=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 26/03/2025 15:39, Prabhakar wrote:
> > +#define RZV2N_P3     3
> > +#define RZV2N_P4     4
> > +#define RZV2N_P5     5
> > +#define RZV2N_P6     6
> > +#define RZV2N_P7     7
> > +#define RZV2N_P8     8
> > +#define RZV2N_P9     9
> > +#define RZV2N_PA     10
> > +#define RZV2N_PB     11
>
> Same comments as before - not useful to repeat the name.
>
> It is the third patch in this patchset, which receives exactly the same
> comments as given before.
>
> I expect that given feedback somehow stays within group of contributions
> or company in form of internal knowledge. Or just read other people's
> patchset to learn from them and do not make the same mistakes.
>
For the RZ/V2H and RZ/G3E SoC similar changes were accepted, to keep
consistency with these SoCs this header file was added.

[0] https://lore.kernel.org/all/20241218192202.GA2184154-robh@kernel.org/

> > +
> > +#define RZV2N_PORT_PINMUX(b, p, f)   RZG2L_PORT_PINMUX(RZV2N_P##b, p, =
f)
> > +#define RZV2N_GPIO(port, pin)                RZG2L_GPIO(RZV2N_P##port,=
 pin)
>
> Not a binding. If you claim otherwise, point me to the line of driver
> code using this binding.
>
Note, since OF data of V2H was mostly reused in the pinctrl driver due
to similarities there wasn't a need to include this header file in the
driver code. My intention here was to use this header file in DTS/I to
keep similarities. Maybe I'll create a
r9a09g056_variable_pin_cfg{} so that this header file gets included in
the driver.

Cheers,
Prabhakar

