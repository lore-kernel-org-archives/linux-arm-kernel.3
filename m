Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F35F2C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 04:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gISrtxFe1XEI3Oi2O6vm+8m4GXkK+giUIqyVFsOJWKk=; b=TZE2iIX7ulGeiA
	fo9TGxLakyZaI6vINRE2tcHXUkKx1G0nBDaKOh8RT5Ho6aBXBHxcVlP+hAKtmzGk9fZV1kI5143CV
	4NtDI5dpto6tTd5rPYz3hq7tFbz/V6wp1yyevz2kRl7m/+HA7j9h6DVXJDpGytEypQm2am9jqBqhE
	Sg8aLsFQ9cJhgWPP2Zsknu1wKCBwDvwLq2XlAbRfgy4Kn/EY3FQ2KB/YJbj6+oCiPAC5MWn9R10pq
	RAROgVABnSPGc6l7v3rz2F9ZzTQBOkgY9fCLVdRrCVF6D18y9xctRslItL2zSXoJKfRnuEG8o3p3l
	NXTcN9M+ih583s53kKrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8ttE-00000002t2Q-1nyQ;
	Sun, 27 Apr 2025 04:45:16 +0000
Received: from mail-il1-f171.google.com ([209.85.166.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8trH-00000002sug-2eQl;
	Sun, 27 Apr 2025 04:43:17 +0000
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3d6d6d82633so12112875ab.0;
        Sat, 26 Apr 2025 21:43:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745728989; x=1746333789;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gISrtxFe1XEI3Oi2O6vm+8m4GXkK+giUIqyVFsOJWKk=;
        b=WDxiI/4s0jicrXIoRlkaEUeFKQib0EK6baYkEpNyuPJcubOHM5PEccO6jTtkYtzlAz
         hgjOo4qqnZGUskiHzzkJaJoKs32/PlMcJu/RWLtXbAryMiZ0J2/pvwhLiu36bbZGfaha
         9JGl/2nDZT916V6PI+n09GflM6lLUp/9x/vggynhY2p8o72j2Mqs2bJUS3vLGZb2EJRV
         4U08E7KVy048pXM2/dJs9nIeBOs1AgLQpHt0JKD8NE0wI91W4b0MleOpuAGUuJfgK8ch
         5P/94sG45hUdoY9SnXC6cW0xRg+Iv7E44tl5jPICAOS0Yyb2KhbsDI0DARaNGHkcfVXx
         i76A==
X-Forwarded-Encrypted: i=1; AJvYcCUrQ5SYAa/pOKTYhCyJvv+7StmYqkv3bmMcK1zncGYYGONZ9U9YM9pQKAyDEOCkuGPPZFl0Roimlu01K8zJQ69Vjw==@lists.infradead.org, AJvYcCVqF/wBL79Yfy81gvsJMxM+i7osYtnxU7oFTmfcJGEcIsabeH1zNpjvt+pepZnBpGG3t2m0YswYMGLg1nU8@lists.infradead.org
X-Gm-Message-State: AOJu0Yxeb7OZ8o9kcIEsj1DFRnMpEwsWMkpRUWnKcy/c4ysGobJgATEM
	03aNpFO118ZI9x+bFAT4+HVUHYeos9C4oxARr3OaSIq10o3eugLlsrlje2gkWpo=
X-Gm-Gg: ASbGncvppM6q01R3Cv6q4iQrpt92sIOncD0F45yUUkv1WjGjP+sbxYhRuUvktvUWKlP
	FclZjG4VAxur/i1dWHNp/GJRNul33+UySy00WJO26amFSV4XMLDkESKQVtjuXjW3Ncny5i8mHU9
	bRqBhgMoiQms/Vrl1AfW+6xjc5wOosfTzG7kWefdN4XDjnwGpN3N7HRcATJCRtm7ktbIksrDsd1
	uUZqhkNxI8tXg4dUXrwUHJ3MRrQ55LR4TU5RpyK/qTmT8YaakE1H6Nwss/V2fZ+5nEznWcJh14W
	nOUj5+0roB5KorIeYxtDic8fPC0He+ad5QU1QUrBvDu2lS+O/qSRN2i3tpgAtURObfPR8roXXtB
	Ci+J3R84S
X-Google-Smtp-Source: AGHT+IEaO1XLEgCNKAfPkRtxyfdKfImrjm7g1/rpN1YO5BTAvo1iIpeAEaHHlZq2LyQGyyepB2MP0A==
X-Received: by 2002:a05:6e02:e:b0:3d5:d6ad:286a with SMTP id e9e14a558f8ab-3d93b47e2ebmr66641265ab.13.1745728989288;
        Sat, 26 Apr 2025 21:43:09 -0700 (PDT)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com. [209.85.166.174])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f824ba34c1sm1596199173.126.2025.04.26.21.43.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Apr 2025 21:43:08 -0700 (PDT)
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3d7f4cb7636so11458945ab.3;
        Sat, 26 Apr 2025 21:43:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU8IMAYErDf5fl3f0OSHCyu+gXqWz5+ikZzW68tZLQWG5H/Klip7HIeHcVyTryO68dB0icec3VFNYPkKjMF@lists.infradead.org, AJvYcCV7+QCvlckqFGI/NDENeCPxXwOiX+yTOHjR5NcfV1q/V/KnsurCiYj5LWM+08/K/kCl6fi0ziyjEzDdGGWve+wNaQ==@lists.infradead.org
X-Received: by 2002:a05:6e02:1847:b0:3d8:1d7c:e197 with SMTP id
 e9e14a558f8ab-3d93b42921bmr71427715ab.7.1745728988001; Sat, 26 Apr 2025
 21:43:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250404-kconfig-defaults-clk-v1-0-4d2df5603332@linaro.org>
 <20250404-kconfig-defaults-clk-v1-5-4d2df5603332@linaro.org> <CAGb2v66v9dc7ydWVT94kwCX9fdQci9wfsFLF1mAOGrnxgGTKnA@mail.gmail.com>
In-Reply-To: <CAGb2v66v9dc7ydWVT94kwCX9fdQci9wfsFLF1mAOGrnxgGTKnA@mail.gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 27 Apr 2025 12:42:41 +0800
X-Gmail-Original-Message-ID: <CAGb2v64WbBnsWRwy_k3BdeDFBqaTH_QpsZN7mxrzvB8inQLyhQ@mail.gmail.com>
X-Gm-Features: ATxdqUGlkS5EQPGwaf23ftJzckW9DcLS2uG0Iv-DsC8_L7KpG4vBmNT4ibxuK1o
Message-ID: <CAGb2v64WbBnsWRwy_k3BdeDFBqaTH_QpsZN7mxrzvB8inQLyhQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] clk: sunxi: Do not enable by default during compile testing
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	=?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, 
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_214315_678585_A7D5594A 
X-CRM114-Status: GOOD (  19.27  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Sun, Apr 27, 2025 at 12:38=E2=80=AFPM Chen-Yu Tsai <wens@csie.org> wrote=
:
>
> On Fri, Apr 4, 2025 at 7:57=E2=80=AFPM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
> >
> > Enabling the compile test should not cause automatic enabling of all
> > drivers.  Restrict the default to ARCH also for individual drivers, eve=
n
> > though their choice is not visible without selecting parent Kconfig
> > symbol, because otherwise selecting parent would select the child durin=
g
> > compile testing.
> >
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > ---
> >  drivers/clk/sunxi/Kconfig | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/clk/sunxi/Kconfig b/drivers/clk/sunxi/Kconfig
> > index 1c4e543366ddb76c1669b577c1ac337dc1be616f..5e2f92bfe4120981ab68b17=
5dce798ac8b3268b0 100644
> > --- a/drivers/clk/sunxi/Kconfig
> > +++ b/drivers/clk/sunxi/Kconfig
> > @@ -2,13 +2,13 @@
> >  menuconfig CLK_SUNXI
> >         bool "Legacy clock support for Allwinner SoCs"
> >         depends on (ARM && ARCH_SUNXI) || COMPILE_TEST
> > -       default y
> > +       default (ARM && ARCH_SUNXI)
>
> Just wondering, shouldn't this change alone be enough? The remaining
> Kconfig options are gated by this one.

Having re-read your reply to the other patch, this one makes sense now.

Sorry for the noise.

> >  if CLK_SUNXI
> >
> >  config CLK_SUNXI_CLOCKS
> >         bool "Legacy clock drivers"
> > -       default y
> > +       default ARCH_SUNXI
> >         help
> >           Legacy clock drivers being used on older (A10, A13, A20,
> >           A23, A31, A80) SoCs. These drivers are kept around for
> > @@ -19,14 +19,14 @@ config CLK_SUNXI_CLOCKS
> >
> >  config CLK_SUNXI_PRCM_SUN6I
> >         bool "Legacy A31 PRCM driver"
> > -       default y
> > +       default ARCH_SUNXI
> >         help
> >           Legacy clock driver for the A31 PRCM clocks. Those are
> >           usually needed for the PMIC communication, mostly.
> >
> >  config CLK_SUNXI_PRCM_SUN8I
> >         bool "Legacy sun8i PRCM driver"
> > -       default y
> > +       default ARCH_SUNXI
> >         help
> >           Legacy clock driver for the sun8i family PRCM clocks.
> >           Those are usually needed for the PMIC communication,
> > @@ -34,7 +34,7 @@ config CLK_SUNXI_PRCM_SUN8I
> >
> >  config CLK_SUNXI_PRCM_SUN9I
> >         bool "Legacy A80 PRCM driver"
> > -       default y
> > +       default ARCH_SUNXI
> >         help
> >           Legacy clock driver for the A80 PRCM clocks. Those are
> >           usually needed for the PMIC communication, mostly.
> >
> > --
> > 2.45.2
> >
> >

