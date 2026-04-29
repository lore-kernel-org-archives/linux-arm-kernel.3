Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B75FFFF8875
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 11:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=07iUR/sIOeK9OY28Ao/jBJ40ezKJgRa8Xi1S5qNmXhs=; b=KiFamANG9eU07pF2dAAuI13vla
	uqsG1kiQLdsjBVpl3Y38i81jLzn3cKk+fTGtSkJFM4a00YLDDqKOw5n3WRGiji6CdF7RH39uxe6i2
	TDw9G7XapQPGgVyjjSamgtVNTGicLs9frOvDflt5oXA5ImYhqKXowrIX1ZxibtTkhptjeLtjPX/T6
	gRQpUr2Is2DIu905vl/W9+TkBdB9gwQhgqqab6wwoYsKpOHNUmV1qj+xOBggLAxH/a0TycAmcdHvd
	gM4WJTF9p88NuKACx2h/FgfRJdcfyNYQQYIQLFjSyTA/Fnvw4I9jBKaIR3jypPf/narbXKqrgc14u
	ZD1E993g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI3Ls-00000003XKS-2v8L;
	Wed, 29 Apr 2026 11:45:12 +0000
Received: from mail-vk1-f182.google.com ([209.85.221.182])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI3Lq-00000003XJR-0aQh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 11:45:11 +0000
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-56faf1cfe04so3756659e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 04:45:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777463108; x=1778067908;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=07iUR/sIOeK9OY28Ao/jBJ40ezKJgRa8Xi1S5qNmXhs=;
        b=mK85pw1mslLQIPAS+xhWtXnBzhuqZUD9Ey8VFbI/WlRr39UyPxvGwlIfcRZ0zHcwRH
         bkBMyeGsQozh2A9TA3BHOUt77pILqkUHXL2HoBqT4oP4hdwJgQEgLd+fY4Q9PEU2y3xJ
         5Vp15njpdGFkxPinoKUTKNrYCVic7WnQuoBEiyPmlANef6cm/mcrgQ1ahmPg2zE3LFm4
         tuSSOtXxJXvGuJzEb46xDb82z86ZumNuosOsUG2BmgebdMxFKi8u4S7IlbtB7hfeUbaX
         gqB10ckFHBjvQbQ2NAHE9gmRlbxoTHFerobkc58Svgsp1EnsaSHRo6aONXfhnecVVHpM
         V1sw==
X-Gm-Message-State: AOJu0YyJlUJaNcC8quAWsVtB+F8+0KbLpIzZbvpznTljGdN4M/U/vPdA
	FpC9e3XTFwq0t/1O3zBwkE3Pe6aQyFPkUcFenzUh9dFurFTtjdyHALSxrJpXQso1IrY=
X-Gm-Gg: AeBDiethc49pBrI7Qd6st35rd/6JAEvB1SIiH1zYS2h378e1A794NJp7OLheijX8jNi
	BaCSvZw72RWb6Z70guUy+wL7UGLSIDAGq8pTF0JNlovHSlNo7JlxqC9Wk/KEgw7ga2yTbsni0li
	DQPNlE5c1xXQhoUuqQJWn/qNsyscunsmwTZW80AI2aGl2zdq7z5NgYUG/veicfbgq99+AZ8v/55
	3Pag1SeNl++mBx0WfiMJpm4zS8UL0/kxRNN/S81wcgTPICqpG+ANhvyJvxUwGQx9pmcxQ1jIC+b
	PVuDpARQceeyu0YPs+AsLU34TGmMNMnApj83ekv8L5vLvdLx2NrYxalymiAovYe59gdo4yfPcOp
	ifOrQSVba9QCxmX3YcBq0oCzIGhBSlk6Scu8lHGyQifNQQaFEx9npdgCqJM/709nAmRrClisYKv
	xyhEJN7Lz+cqPz8sSuqjyNhL4cYgN5aLWPntnZUOGN2I+tnD8aKqB7h2zii3abpwPbt2ds2yZLH
	ak=
X-Received: by 2002:a05:6122:253:b0:56f:694e:1f10 with SMTP id 71dfb90a1353d-573b355f88amr1266761e0c.5.1777463108508;
        Wed, 29 Apr 2026 04:45:08 -0700 (PDT)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-573b6bc23e2sm962921e0c.6.2026.04.29.04.45.07
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 04:45:07 -0700 (PDT)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-56f3e6bbecdso4198894e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 04:45:07 -0700 (PDT)
X-Received: by 2002:a05:6122:8b0c:b0:56f:7300:37c9 with SMTP id
 71dfb90a1353d-573b368cf79mr1448638e0c.10.1777463106983; Wed, 29 Apr 2026
 04:45:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260419193718.133174-1-marek.vasut+renesas@mailbox.org> <20260419193718.133174-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260419193718.133174-5-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Apr 2026 13:44:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVLUFZzwUjvMuZOOTJk9jn-pTM4-rYHE8OZzp9RpQd2tw@mail.gmail.com>
X-Gm-Features: AVHnY4LhTK0YHEkXOgViPxtDX3drSx5eXMIsHWPwRkcxiJzGfAV6beExDjAOpFs
Message-ID: <CAMuHMdVLUFZzwUjvMuZOOTJk9jn-pTM4-rYHE8OZzp9RpQd2tw@mail.gmail.com>
Subject: Re: [PATCH 4/7] dt-bindings: soc: renesas: Document Renesas R-Car
 R8A779MD Geist
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Simona Vetter <simona@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_044510_189909_CA7F36F0 
X-CRM114-Status: GOOD (  20.50  )
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

Hi Marek,

On Sun, 19 Apr 2026 at 21:38, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Document the compatible value for the Renesas R-Car M3Le (R8A779MD)
> SoC and the Renesas Geist development board. The Renesas M3Le SoC is
> a register-compatible variant of the R8A77965 (M3-N) with reduced set
> of peripherals. The Geist board is derived from Renesas Salvator-X/XS
> boards, with adjustment for the R8A779MD SoC.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> +++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> @@ -473,6 +473,12 @@ properties:
>            - const: renesas,r8a779mb
>            - const: renesas,r8a7795
>
> +      - description: R-Car M3Le (R8A779MD)
> +        items:
> +          - const: renesas,geist    # M3Le Geist

"Geist (RTP8A779MDASKB0F10S)"

> +          - const: renesas,r8a779md
> +          - const: renesas,r8a77965
> +
>        - description: R-Car X5H (R8A78000)
>          items:
>            - enum:

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

