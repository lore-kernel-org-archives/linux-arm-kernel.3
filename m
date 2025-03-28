Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D7FEC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 15:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W7R2gZBzWBuPUH9E8mLgn5iH+bIAruEwVlJhbgs2hj4=; b=IeRwkW1HrZsnwcs9FgF3m1YM8H
	whNOvdE6Mga5kM/Um32EeQo4/sx50ns5Bgz0RbxCbufUdkg6GDY4cA/ejxHhP0If1g7WOcQIJEPgk
	wGqiONJ/2sjVJpLomCcFxNjMbAVA1SqWryPAwcEsjpEMZKFmSzXGYxxSPI9uxjJrYRPpjLq3+GJrd
	jDgeQpJC8R6J7s+e5rGreqJuB54eCNnUnH87WWYh1YdBS4hd3tueiAykUo+Q1tIxLkUq7y+ow1kZd
	8mNMr0JT2qpQecrT40u634RlVzpKp3Kpq5Xk3JXolJSVQc75OFcMPlcrOBUIRHPm22N0kjld2+oK7
	U1zy0Eyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyBeI-0000000Dm63-0XAr;
	Fri, 28 Mar 2025 15:29:34 +0000
Received: from mail-vk1-xa30.google.com ([2607:f8b0:4864:20::a30])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyB0R-0000000DeFU-3YOK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 14:48:25 +0000
Received: by mail-vk1-xa30.google.com with SMTP id 71dfb90a1353d-523ee30e0d4so1247951e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Mar 2025 07:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743173302; x=1743778102; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W7R2gZBzWBuPUH9E8mLgn5iH+bIAruEwVlJhbgs2hj4=;
        b=Ohhg3683+x2YJQ5McSTnUrDc2Gn/uqlxXkp4nlMhvTRRcl4doicLkWahRDwZJQv3nx
         0cnBRmfwa+MO3bLUNJv9CCmh/BVJoJOU3f+ewCUb4Zsn2FXPdAACEvFGWG79LtZNKac+
         9s6zEe2oO6PyG1EVD0UArtOYuM1NAD0O/rYSxk4LprPOump/pHmDj6E0BNqsZiQ4Wmsh
         gFK5NW6LwYSwBGIdIEFnrR5Imv7JdjnJilxdFzl22Jjh7e31IMCZcBMWIsX+Fyp1+ggn
         zOCMl4iLcyIF1SkCEGKR5x/DBZhPox9tZ6hKWj/bRoSbpYE3mwW54tAOcQGyQmvvoIIW
         P29w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743173302; x=1743778102;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W7R2gZBzWBuPUH9E8mLgn5iH+bIAruEwVlJhbgs2hj4=;
        b=HRMJ2zskwRwGVSv5DE8othO8aXxATdCij/SxIp9EbZgFkqI8nnilCacqldaJCo8HDt
         a45acAaZqQJOicsV4+Uu2g349uK75G2pJ08x2ZxnJPMnXQ70XqaJ/OiuHR7B2hDpN/Ea
         dPlcyFyEWx9L6awncyjhdq41ciq//buqsddy/7gyok4zabyDOFrGFwo1B8OWR7KcZj1o
         wONcXcZDGgpRubjqZ4mm7TQj2MesQG3gq4QiOHBWTB1qOrfdj9I4ZhveDba6UxOjOnNi
         qIz3Yussg1g2eilesteHaD5Bezq4yTcIlwKeID45SqEPAFwGgKHeTQw2vJ6+sm3b4M1+
         AeQg==
X-Forwarded-Encrypted: i=1; AJvYcCW4XEFN6CVd+IxNuerkPrNvmc9Yc6VrwCOOSq3Cb8RHTryhu4D1h5DNffYV81lAUsdJAkKFKSdSXZqXOhsce9Sp@lists.infradead.org
X-Gm-Message-State: AOJu0YygStXBPORXdShXyODnEfnzc7KZSOw84QEQFspYJ869AmsABNLW
	JtI6p05ZIirxt4si2XSnMwTK+ZVSGOQFgvNmp5MZ+QomwS10mEpMtPzfA4RXFZAaACXzSYMyqMr
	XyQiEhoNv+c+DgVGE/5GIwpIaJ3u7iJE/QRc=
X-Gm-Gg: ASbGncs9mFPr3Mzoph+pGptyCJkUcdQ1mLO2r9zcTRnKUoVMoYv7fMdg01sO3cLHx4B
	ycJHvQVXO8Wwg5CBt180utvO3cr658yggmpJpNreA5CNp1ec0BXF1qFyvMOH7YRXwIuykU3ziVI
	vgAHMXAwd2XdiX/OM/ttVD+Jm23PvdCwfDeDSOOsUWZcofo2J4bOvh7z9u
X-Google-Smtp-Source: AGHT+IHouldgTyP6Q/w4w6vBsXV6nSeyEMfHGqZjhRlDBBXFbUfgEyb6My2WMEzsfSI0GSy57EiD1BG9iD1i8bsYjz8=
X-Received: by 2002:a05:6122:3d0a:b0:525:a70d:3110 with SMTP id
 71dfb90a1353d-52600a8712bmr6248996e0c.8.1743173302143; Fri, 28 Mar 2025
 07:48:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250326143945.82142-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <f03c3a6a-aa6c-47be-8a03-7486131f6d32@kernel.org>
In-Reply-To: <f03c3a6a-aa6c-47be-8a03-7486131f6d32@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 28 Mar 2025 14:47:56 +0000
X-Gm-Features: AQ5f1Jr8bCu5jfB7gzVdmCLWSNd82UxgDWDDpWjIQfNCBC-6gPx3a_B0ei82wkA
Message-ID: <CA+V-a8vx2VKoADpw5rG0jH6773=QiHB=reNYBr4ncYZGS-H+XQ@mail.gmail.com>
Subject: Re: [PATCH 02/15] dt-bindings: soc: renesas: Document RZ/V2N EVK board
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
X-CRM114-CacheID: sfid-20250328_074823_894085_8E397672 
X-CRM114-Status: GOOD (  12.12  )
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

Thank you for the review.

On Thu, Mar 27, 2025 at 7:41=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 26/03/2025 15:39, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add "renesas,rzv2n-evk" which targets the Renesas RZ/V2N ("R9A09G056")
> > EVK board.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> Squash, previous patch makes no sense on its own.
>
Agreed, I will squash this as patch patch 1/15.

> You, Renesas, already received exactly that feedback!
>
I truly apologize for the oversight and appreciate your patience. I=E2=80=
=99ll
make sure this doesn=E2=80=99t happen again. Thank you for your understandi=
ng.

Cheers,
Prabhakar

