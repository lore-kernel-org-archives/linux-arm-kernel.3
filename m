Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FD38D5A6DF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 04:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eHAWaib+jGrJBZBZh5EnoY+Myh/wsDs7WnzVFDUkGnw=; b=G5lewokZIZZOtm
	JL6RH+lxdIAcnc9MQLvmeou03neZvAF45u0FuqxwnWhObUGl0EMY7IpAWjTKoQFHeO7JlQzyNE6iC
	c9Xqr9xLeJ2KQxhsP/eJCYgy19IcfdzyhKFrKF5UKEMcTePuAsmtntS/MmGkTzRIDsYDG+bDzbRcN
	58xFNN2ifRkG1lFlecGcWRfHiCfW1QSDhzmGx695obauxAKeTOJAx97SXo+LV7T7plkt71mQBUxVB
	t3YqOUa+/D4xfmWOB7X6dmaCiusvqv7AwMsdEuwbYjGyQZPhtw/Yko1bcdl4JnxKBH9RJHBmnmo6M
	tPJ1+6UCj/hGIaXehSBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFnKG-00000009cOM-0QQk;
	Tue, 26 Nov 2024 04:37:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFnJI-00000009cGh-2YOa;
	Tue, 26 Nov 2024 04:36:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E87625C5CA6;
	Tue, 26 Nov 2024 04:35:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C917EC4CED3;
	Tue, 26 Nov 2024 04:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732595782;
	bh=n248E6cQcbmvG8TJRwSTTgSI3ENxL08+73ZTFK+rZTc=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=dRO0XKyBjn5Sm3VWOtwEUo+mqxF3CJpxJhf7SGeFt3aAk0EY1RLRSSLYDcV4UFsqa
	 DQbM3IKx+Zh1bZb5C99QSgnqGNG6HFZ+zkcHa0aWVGnSu9mZW9yses0V9y5LpQ9x+d
	 H6qZFutUXdVT0TyU/A1nxrNzHhMhXjyqsV4s2lPnXsV2/c0cS8yPD+EiZfCgYN7PTl
	 kDT29DR1x3H7PmDXixZxEOplD1Y6m6TaNHPhsSZd/BN6NgDnelC9wOaaC38z5ivMTL
	 8D6M99i+s6d6EXL2pGV9QDalRNAGgfJFkD1RbLpxmaQJGDf5qwqitKLRBROHcdY5/T
	 kn4+2MCFbgxUQ==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ffc80318c9so14356291fa.2;
        Mon, 25 Nov 2024 20:36:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWkraFJOPlbkRaAsDqbmQ9WkMc0pc0Q6y8mGfZPAXK01bO/yWbkovxBb7k9ditLSfubSdbhW1AymKNmrUd1YjEz@lists.infradead.org, AJvYcCXCWuifydo6tS1nZYVTNK/VzuxgUHp1nUw4r7DaLOJDXx4SqS+hBy5ZG9oXfmcE1wPPTEdJai6nGpq1bvCfmSs=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzya/EhDm78eDVDuA927rRrzky9CbF29O9ytp6rjH8K/zbZgR2e
	jKw4oOh8ge9nFzwq9+ruW0XOas1W50br84QSszJxdUwBTWjAayFeIhUkI17I7w1FVYo4aZYimVD
	Ys/dHz146lOyz2CDSaPPXQdy98oc=
X-Google-Smtp-Source: AGHT+IHMAT53tm+g3nrPUDVGLRawbIHJgSk3HrbNUkSwnVRCsvyn/bk3pAQYfMYGomGQd/Wz+5r8KSfUblsBUM7L9ck=
X-Received: by 2002:a05:651c:1987:b0:2ff:bae5:90fe with SMTP id
 38308e7fff4ca-2ffbae5952bmr34535991fa.13.1732595781097; Mon, 25 Nov 2024
 20:36:21 -0800 (PST)
MIME-Version: 1.0
References: <20241125082130.2390310-1-wmacek@chromium.org> <20241125082130.2390310-2-wmacek@chromium.org>
 <20241125-snowcap-sulphate-34944bd70cf3@spud>
In-Reply-To: <20241125-snowcap-sulphate-34944bd70cf3@spud>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 26 Nov 2024 12:36:08 +0800
X-Gmail-Original-Message-ID: <CAGb2v655Bfx44XBPH24FKuEFTJ3ngjbAPEpNBn5vyLZfNGKt+Q@mail.gmail.com>
Message-ID: <CAGb2v655Bfx44XBPH24FKuEFTJ3ngjbAPEpNBn5vyLZfNGKt+Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: mediatek: Add MT8186 Starmie Chromebooks
To: Conor Dooley <conor@kernel.org>
Cc: Wojciech Macek <wmacek@chromium.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	Rafal Milecki <rafal@milecki.pl>, Hsin-Yi Wang <hsinyi@chromium.org>, 
	Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_203624_731592_0ACAF598 
X-CRM114-Status: GOOD (  18.09  )
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Nov 26, 2024 at 2:34=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Mon, Nov 25, 2024 at 08:21:28AM +0000, Wojciech Macek wrote:
> > Add an entry for the MT8186 based Starmie Chromebooks, also known as th=
e
> > ASUS Chromebook Enterprise CM30 Detachable (CM3001). The device is
> > a tablet style chromebook.
> >
> > Signed-off-by: Wojciech Macek <wmacek@chromium.org>
> > ---
> >
> > Changelog v2-v1:
> >  - Fixed items/const bidings description in mediatek.yaml
> >
> >  Documentation/devicetree/bindings/arm/mediatek.yaml | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Docu=
mentation/devicetree/bindings/arm/mediatek.yaml
> > index 1d4bb50fcd8d9..6191a5320c148 100644
> > --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> > +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> > @@ -263,6 +263,19 @@ properties:
> >            - const: google,steelix-sku196608
> >            - const: google,steelix
> >            - const: mediatek,mt8186
> > +      - description: Google Starmie (ASUS Chromebook Enterprise CM30 (=
CM3001))
> > +        items:
> > +          - const: google,starmie-sku0
> > +          - const: google,starmie-sku2
> > +          - const: google,starmie-sku3
>
> Compatible order here is back to making little sense. Why is the oldest
> SKU, in both cases, appearing first?

FWIW the SKU number has no particular ordering. They were released together=
.
SKU denotes different configurations (memory, storage, touchscreen and othe=
r
component options). OOTH revisions would actually have chronological meanin=
g.


ChenYu

> > +          - const: google,starmie
> > +          - const: mediatek,mt8186
> > +      - description: Google Starmie (ASUS Chromebook Enterprise CM30 (=
CM3001))
> > +        items:
> > +          - const: google,starmie-sku1
> > +          - const: google,starmie-sku4
> > +          - const: google,starmie
> > +          - const: mediatek,mt8186
> >        - description: Google Steelix (Lenovo 300e Yoga Chromebook Gen 4=
)
> >          items:
> >            - enum:
> > --
> > 2.47.0.371.ga323438b13-goog
> >

