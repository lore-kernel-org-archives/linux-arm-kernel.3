Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1227BCD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 15:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=szBb9VN5OI/LxN852+H6x+3LXcGPvGU0m4BLzBAkL+k=; b=yjRUKeul1DBt3Y86XNS1bAbtD6
	+XeeUdntj4J6Y7U5jPdHhs5Atjiigwo5C9lQsO6FHGaUHIQcetezJu+S7zIRqR0tUs7FOxpH5mrrh
	sA9iiAw5N9ZcNl4M/mF3X1AG6g7Yv6ZrCnf3jPdjEDc5IBi1FPpfRUx7goKyRUtPwvFspNUh4s/AK
	EDbllntMJnD3b3A01giL3McDWFQxsBQIH1wUXI+bs5nJaJ2JlkjIi9c/mEWvm1m4zZU8VAoT/tEmC
	AjWh58RjMzb+tS/UJ+AISUUnWCofa31cEw99dq4R3kvLWivAxfo12JlKObZ4Kb3FuRx1hHibiYft1
	NI549pDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQRny-0000000BFgB-1mPJ;
	Fri, 22 May 2026 15:28:54 +0000
Received: from mail-vk1-f178.google.com ([209.85.221.178])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQRnw-0000000BFf7-0z1F
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 15:28:53 +0000
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-56f70865797so4673725e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 08:28:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779463731; x=1780068531;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=szBb9VN5OI/LxN852+H6x+3LXcGPvGU0m4BLzBAkL+k=;
        b=JKOl5JlTVZmyZ5iseBFOTKCtcs79DdZCATANVNU8pcVsl8N5TheBDg8lIuhKTfOQmH
         sOtUm3Z35FLiPiirbL3lta+U/wAVluFNiWheF3bUd2vy5YDR0RkL/jreiJbqAYNDoOdD
         +Hk/1Jqwo3engV3QxYxseu9yH7dr3Et1uz4ZdTAfGq61Z5xF1y1eiW7C5fYvytECrLWL
         D8oygFrGVNby7/ZD/D+KxbBaUsIf+sP9Ie/VD3fYGU0bciW1RCGBmqB+hrSodIWTW4e+
         rHWvNLN3po2ZDRM6iLM+Vd1X3V6rX32XHnmHtGzkrhTws0fT/1d8q8dKusVg4cBF3ZAT
         pXZQ==
X-Gm-Message-State: AOJu0YxcHexENJUUMHQIH7vB5CKwG0y15zCmjDmpnceX1uER422vmcqq
	N4STTRNue53DlbuMgSIO/FKKEv35lxQHtBh2FIxTDO08cUjKoak/b5wgX6QpOpo+tCo=
X-Gm-Gg: Acq92OFZtI/ZjbokQd9YI0yvxRo1aT61ZgnzctFPGhtxadvcrBnFg78oLoP018qjH7M
	qyDbbj0XOMVnan4tJsxljD30/90fYpSVODPOz2o1QxgaxbebtXUFPTzTKGO+Lc7EtWXrFhNhOIQ
	morMt4SgTq+nDi5Ivt9lfx04t3W5wqbVCwleSFp+/8VIOLUTHGY7GQpfa01UW0LioQoj8G85Pkd
	zR/dm0wpFYq7Nva3eLkdfWggrXKg+fMfY7eAyxQ3iXQnwlGEYxbPOaLV4iup8ZcSHZ8q0sD3ist
	BcKW9fMGvnXAeUBvjglMYwBwvD/y/k1pn3O1WeCp/GeXCqR70/XePKUNmrtutrg1YN8bj3Pv8Cn
	sK1Tm79/zHwdZt7nu2sj3jRvKFt1aPj73MZGOny//epT4aEbw9rNPYn+FuNRtowv1dhI9v4E7WH
	En6MZDDhFINj49qTFlo6IgXMME1DER3onkjjq/v/BQGXFvdWrECH/cSHzpSq1s
X-Received: by 2002:a05:6122:469d:b0:56f:6b46:28be with SMTP id 71dfb90a1353d-58661b20011mr2447286e0c.8.1779463730902;
        Fri, 22 May 2026 08:28:50 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-586f791f719sm2519965e0c.11.2026.05.22.08.28.47
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 08:28:47 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-6313b7e3d03so4678560137.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 08:28:47 -0700 (PDT)
X-Received: by 2002:a05:6102:f8e:b0:604:f29d:84be with SMTP id
 ada2fe7eead31-67c70e5f66cmr2706370137.3.1779463726809; Fri, 22 May 2026
 08:28:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260504144534.43745-1-marek.vasut+renesas@mailbox.org> <20260504144534.43745-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260504144534.43745-5-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 17:28:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUTsoEH60DBWCNnXzaZmfOcDfZ7vEaUgJetqqU-qwBxXA@mail.gmail.com>
X-Gm-Features: AVHnY4K2cO6mOrwYyMVCwX6fOKSnvdh0vCSY19G3lWwxUQ8j7rXhdTpY2ZF4U8M
Message-ID: <CAMuHMdUTsoEH60DBWCNnXzaZmfOcDfZ7vEaUgJetqqU-qwBxXA@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] dt-bindings: soc: renesas: Document Renesas R-Car
 R8A779MD Geist
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor.dooley@microchip.com>, Brian Masney <bmasney@redhat.com>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_082852_277048_51F31891 
X-CRM114-Status: GOOD (  20.08  )
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

On Mon, 4 May 2026 at 16:46, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Document the compatible value for the Renesas R-Car M3Le (R8A779MD)
> SoC and the Renesas Geist development board. The Renesas M3Le SoC is
> a register-compatible variant of the R8A77965 (M3-N) with reduced set
> of peripherals. The Geist board is derived from Renesas Salvator-X/XS
> boards, with adjustment for the R8A779MD SoC.
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

> V2: - Add AB from Conor
>     - Fill in Geist (RTP8A779MDASKB0F10S)
>     - Add RB from Geert

Thanks, will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

