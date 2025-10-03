Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7839CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 01:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zgov3mqg1JWQnOI+E7/IFHeQFC41StHTfUVf14re2lo=; b=NVCG3iupvHmtxJ6NLD7OndKZdA
	vGkrAlCrYZq29sFUTSkI37NoGLtkzpRLLEnZ+7sgX5rjs91F/XGRkJCM/z7jyqdDxzEvc2euKZ+rS
	pFkcHaYBNWmcQynULk2QNYPdlgKc5S8Zs42pmmVWv3ch0fDAICvZQStsMa54j2eun9EkOjd6IDwRV
	B8sH5ezJRkQJdhNQWbef3EObeZuZUHDRs4XLqwC3qaxX6p8jKM9wG0sI7JwWF8uWCfWUvR5OQkULm
	g4iCIm7HMHKuuqPS6sloRCr7u9eSWuIQ8LA3ASWDP9nFowzp/mme0pxS+XMgirc4aJMy0b0sfxf/g
	9XQ+Hsbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4Ue2-0000000BVPh-0to4;
	Fri, 03 Oct 2025 01:31:38 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4Ue0-0000000BVOO-05Zf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 01:31:37 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-3322e6360bbso1634478a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Oct 2025 18:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759455095; x=1760059895; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zgov3mqg1JWQnOI+E7/IFHeQFC41StHTfUVf14re2lo=;
        b=i1j4yo5PE02WuZrdjn2qJ7K6J+e5tWslBfCdWpX31iS/W6hmByJy7PG829dQXcgMjf
         uO/wq8NQOUOoGi7TthsTEJF0CgRSHT0Y1hB1kARRQvNFeb232XqcET2Mwo+FHqqeIFKx
         V4Qdapaziu2pWk38M66dRSQaoYdOu6fDKnt4KNkSL0iA6RdkqmbEHgOl3xM6+yIbgyL7
         ES+XkpoPRHcgo1kzkErU4YdiIC3lG8TWDFEGBVVHT9iBO7+FtsaZ8gtiqrJfN4oXzBBM
         4Q8VJpQexH9QWwfsVGmrwkPGMpyG85HfQhj7mTDqmr4f72dhIgO8MEy8tbx2vFqsn+n9
         Z3Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759455095; x=1760059895;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zgov3mqg1JWQnOI+E7/IFHeQFC41StHTfUVf14re2lo=;
        b=vev/4pZOwabuKBD5HRPXsd5rPuND8ceJKZh0cvHB8Yhj0Mxt4s6TyXtIm9gJP6SQuS
         WOE31JsZ5IV1+Ccy2uEcINzOyG/lhbxr8pi2Pl+wF++C5jKKqXeNo4FgbtTyhz/rQzX0
         qv+Ip2eub2WqKwb+czxGJI7wn8uFQDIwJ9uGm3q8ik7ZVHVIQLMR6YR7P/T0vWOZ0zHz
         90uOsjxsFk+xjQvGpGKz4Jgd7mEzkJk7G8thwtXjIFfX6L7EmWUbNCOBM6agLvJqIrsR
         dQPzg+6fApdoURfzF6D0hoYuD0oAZ/jFqZoCOa6FvBM83D26OLywCKCgI/OGkbPp1EiZ
         NYPw==
X-Forwarded-Encrypted: i=1; AJvYcCWHIgEx2WVde3ldG+h8DFnor+lGguAIGeTuMrNMVWVisuuU5f9riefRoR2i+b/7hD22r7/bzCnaub05Uq8NwHjj@lists.infradead.org
X-Gm-Message-State: AOJu0YzWo0hAFULFrfq5q+I6u+w0Y3MZAZa5ZFluoru6t/ws8tN0bcy/
	ozaP2BLfnng32oMAB4GDJBw+oaIUY58b88D+z/JEx8iFHKilcLg9H3PdstAEUT9F5WiGVMMF+3V
	2U/7JRCBJ+hBT+h7wb8LJqiHyPRKAqWY=
X-Gm-Gg: ASbGncsJhoWy4zTal1A/+IzHF45kbHGxy93wHE+H/IBRFpuzgP5CtX65Q/23SH5xN0U
	LdIbhKiOYrSzC5sx6Zg5mSXuPCUkJkTlJVEkN1fzulcB6h8rFQBzOUY0J5JpA/8b1aK4IlmrG9q
	6Z78RhlyV9Z283Tf/Uo/SuGPXE8auIJTYdJg1XhIj0BNkfQU1ZD4jLfNIazruxFGaKfjfc9fIqp
	viLTZlty/Yi8W85+KPtzmRitLSmutd0
X-Google-Smtp-Source: AGHT+IFBBcoMSyrE+QoQm3Vaigr5y1LjVm/kF3OscSB6SjPP3hDzPLZ08qOkm20G5zQLmkLNSTYxFMbrlzXKgiaBYPw=
X-Received: by 2002:a17:90b:1c83:b0:32e:7270:94aa with SMTP id
 98e67ed59e1d1-339c27ba06cmr1415539a91.19.1759455094873; Thu, 02 Oct 2025
 18:31:34 -0700 (PDT)
MIME-Version: 1.0
References: <20251001-yv5_add_dts-v3-0-54190fbc0785@gmail.com>
 <20251001-yv5_add_dts-v3-1-54190fbc0785@gmail.com> <20251001-bonding-surging-af8cd0d09e07@spud>
 <CABh9gBcKt1zqvMQ=390HESPR5KrA42jaMFj9Ca4qmeS0d0ToAw@mail.gmail.com> <20251002-outmost-epic-9cb3bab4d352@spud>
In-Reply-To: <20251002-outmost-epic-9cb3bab4d352@spud>
From: Kevin Tung <kevin.tung.openbmc@gmail.com>
Date: Fri, 3 Oct 2025 09:31:23 +0800
X-Gm-Features: AS18NWAaCZIp75UYU-ToloKyuCFQ_kzh-3GlXmpsdfd_oQHvUv7DZqqak8PB7Qk
Message-ID: <CABh9gBebhm3o49o81JcZTLAJZhQDEocJs7inUS+Gn46zOK5DNw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: aspeed: add Meta Yosemite5 board
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Amithash Prasasd <amithash@meta.com>, Kevin Tung <Kevin.Tung@quantatw.com>, 
	Ken Chen <Ken.Chen@quantatw.com>, Leo Yang <Leo-Yang@quantatw.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_183136_061062_21281D14 
X-CRM114-Status: GOOD (  25.68  )
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

On Fri, Oct 3, 2025 at 2:35=E2=80=AFAM Conor Dooley <conor@kernel.org> wrot=
e:
>
> On Thu, Oct 02, 2025 at 12:23:47PM +0800, Kevin Tung wrote:
> > On Thu, Oct 2, 2025 at 2:33=E2=80=AFAM Conor Dooley <conor@kernel.org> =
wrote:
> > >
> > > On Wed, Oct 01, 2025 at 04:47:50PM +0800, Kevin Tung wrote:
> > > > Document the new compatibles used on Meta Yosemite5.
> > > >
> > > > Signed-off-by: Kevin Tung <kevin.tung.openbmc@gmail.com>
> > >
> > > You've repeatedly ignored my ack, so I assume you don't want it.
> > > Maybe you want a nak instead?
> > >
> >
> > Apologies for ignoring your ack repeatedly, that was not intentional.
> > I truly value your review and will make sure to include it. Would you
> > suggest that I send a v4 to pick it up, or is it fine to carry it
> > forward in the next revision?
> > Thank you again for taking the time to review my patches.
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>
> The maintainer will add it when they apply, there's no need to make
> another version for this alone.
>
Got it, thanks for clarifying.
> >
> > Kevin
> > > > ---
> > > >  Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.ya=
ml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> > > > index 456dbf7b5ec8f4442be815284e1ad085287dc443..6f2b12f96bd6ce31b41=
75e109a78d931dffdfe28 100644
> > > > --- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> > > > +++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> > > > @@ -89,6 +89,7 @@ properties:
> > > >                - facebook,minerva-cmc
> > > >                - facebook,santabarbara-bmc
> > > >                - facebook,yosemite4-bmc
> > > > +              - facebook,yosemite5-bmc
> > > >                - ibm,blueridge-bmc
> > > >                - ibm,everest-bmc
> > > >                - ibm,fuji-bmc
> > > >
> > > > --
> > > > 2.51.0
> > > >

