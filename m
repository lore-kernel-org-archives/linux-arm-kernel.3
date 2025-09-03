Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80BB2CA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 11:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wRGL+yvGCt5Y/YQJFhgCAidgUtWHfFyrPOfmPr2jchE=; b=PGbadFtIamh6EL4HHdD81TL3Z7
	X47IKynGa9+qdV88KJZWPmLz/uxAXNfiLPYscr0YRDM+nh8tdtzq1D3Myz6W/kzdYgd7+snMxJX3n
	A4wjd44Tt+irbbLKHqkIQa2CAlQuOjJxN/R7aBCsrplE0Rxoq6RxasvzbGrr/12oRmKkZ5fDN4sWS
	bWdnUtuOd7k1XTa98rw24J45XZJVttp/Vd7e9myRjS5xBBjjrEokkFiktKtDjl5SWRD7oZ9nWXNNx
	AUCEG9zyWwe6Y1ul/nVRWVQZHVvf+bvH7rrbF9YJdz+sFl1jN0zw5dGq/XMPB01tHYDlJsTrY6b0i
	+F79NAFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utlMn-00000006BVw-0JV3;
	Wed, 03 Sep 2025 11:09:29 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utkES-000000060oe-1Jtj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 09:56:49 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-45b7ebe667cso43305605e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 02:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756893406; x=1757498206; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wRGL+yvGCt5Y/YQJFhgCAidgUtWHfFyrPOfmPr2jchE=;
        b=lYObpBmYx6pOPbN6yDHVJusXYYUVRV3j8P3uwHQNpa+zAcJsxGRW57hv3MVFxKqawO
         QjilN6pUXkX/qKA3qwic4WHhXfhQ4Gow3GL0aFqrfvMYed3lwD7C5qgWZ6ViPb9cmRSe
         pJ9CzPScRays1asZ6LTJVCa2F0a8JMDxlT3MtAipY9PgI+gJdl0jIrvm9Qp/4C1cbR/H
         XEFPiOa9dAc1cArl1o8ak9O9z4VSFckDX3W9wnC+iaUXr0vPfYP9WMrBFIkcri4L1PRa
         Dff0iSGsQUn7R64Eke0flxI5xCMbTZW/aqjl8J9PwwalDilJrh6chgCcZbWi2wZU8xr3
         BlYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756893406; x=1757498206;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wRGL+yvGCt5Y/YQJFhgCAidgUtWHfFyrPOfmPr2jchE=;
        b=rz2W4rniTW6qjnNAkM+TyJEvaIgIiyhZlos+yX5TonYcl9QpgHyE9D4jrMaqhHBHxH
         zC2ArydrGQRP/NNoIaSWLptUz/hPLgwmgQ4WOFumdLnhTKd2nJnMvf/egJIUci0vgpU1
         zvDGiAuXSGgbM3gK7C9vZ93myAbZybfuAK9VJu6J3v5b8DbLP5yrfFSpK82jJuJeaJQj
         bLiHTP6VgEpwl5zdI3T9j3/Xyt3H8TKYVzIC7chRSBpay0+RWYo8nMjs9UqKFOI9zalg
         5wdtYOiRPdEZ1P+A2/Nbn9rzUSWyfk2L242+3JYQeqCTL8Nkm8yPo9KiFP5LfX2KBK/d
         6ggw==
X-Forwarded-Encrypted: i=1; AJvYcCUQlSAzzNAhPuaix8sPnEd8WKxHGCisNGS8mHL1uFwD0H8vahsVnzN2C9CPMUN/Rm4PeaXlCFWmbqPrBkJgt6L5@lists.infradead.org
X-Gm-Message-State: AOJu0Yz99e9WxhkmvDAo+Q2RhOhDUaHxvKD9IQOepPJJUgWjVHpSjMk4
	KOqdm+r7YBU0JjZByiGZi6MEC8kXJ/WMLK9073JXX3EiUC/wRq956vDsUHZHn3OCtiXJMg+R5WG
	mtXcOtb2BopXaEr76aZC2KXIS5DAdgEk=
X-Gm-Gg: ASbGncs8zPB7m68/PK9OuoIwCCzW1Dp6Rn4fxHOgIauhXXRKM0xCGMnTLQbpGzh11al
	ls7Nsd2mxnf/aBgn2vIq4NWNPqwoMJEzQLR5aVqWW1M+GaDMXX5eOqeMrYCoQVweUi8YKr9DQ1m
	B7k5ld2BfBwcoHa5cwYR5CFOFueq8F6AxpwV/Ap3KMIXPk9ecJXwEOhxsFfiFoLu9A9w/6qaLzP
	c1E+zPTZ56jrSMZfWE=
X-Google-Smtp-Source: AGHT+IEQUqA1qdyBjSIqEH7yyO8Yto1g3IUsn6wF/lfNaBELqiermAkFpi4/ZOCBGDgVSpzOqFCGaE8gu4cJp0yyq2U=
X-Received: by 2002:a05:600c:8b17:b0:45b:8d61:9d02 with SMTP id
 5b1f17b1804b1-45b8e52fa48mr86888605e9.30.1756893406116; Wed, 03 Sep 2025
 02:56:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250902001302.3823418-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250902001302.3823418-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdU_BHtHznN8C7s0Yf=nxBaXb94MLFD-Pcz73W8hJhxc-w@mail.gmail.com>
In-Reply-To: <CAMuHMdU_BHtHznN8C7s0Yf=nxBaXb94MLFD-Pcz73W8hJhxc-w@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 3 Sep 2025 10:56:19 +0100
X-Gm-Features: Ac12FXzyrhXt8ty31ymC76K4PCsLmoMNIPvsEjNtyJoctbgrdUIEhn5oIWhc6mE
Message-ID: <CA+V-a8sUgu9YgtnkCYEzGtfH=2dQCyj9Q7Wu1+WaKrDWy3vjiw@mail.gmail.com>
Subject: Re: [PATCH net-next 2/4] dt-bindings: net: renesas,rzv2h-gbeth:
 Document Renesas RZ/T2H and RZ/N2H SoCs
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Russell King <linux@armlinux.org.uk>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_025648_352957_83D608A2 
X-CRM114-Status: GOOD (  20.04  )
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

Hi Geert,

Thank you for the review.

On Wed, Sep 3, 2025 at 10:09=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> Thanks for your patch!
>
> On Tue, 2 Sept 2025 at 02:13, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Document the Ethernet MAC (GMAC) IP present on the Renesas RZ/T2H
> > (R9A09G077) and RZ/N2H (R9A09G087) SoCs. The GMAC IP on RZ/N2H is
> > identical to that found on the RZ/T2H SoC.
> >
> > While the RZ/V2H(P), RZ/T2H, and RZ/N2H SoCs all integrate the Synopsys
> > DesignWare MAC (version 5.20), the hardware is synthesized with differe=
nt
> > options compared to the RZ/V2H(P):
> >   - RZ/T2H requires only 3 clocks instead of 7
> >   - RZ/T2H supports 8 RX/TX queue pairs instead of 4
> >   - RZ/T2H needs 2 reset controls with reset-names property, vs. a sing=
le
> >     unnamed reset
> >   - RZ/T2H has the split header feature enabled, while it is disabled o=
n
> >     RZ/V2H(P)
> >
> > To accommodate these differences, introduce a new generic compatible
> > string `renesas,rzt2h-gbeth`, used as a fallback for both RZ/T2H and
> > RZ/N2H SoCs.
>
> Until now, we didn't have any family-specific "renesas,rzt2h-*"
> compatible values.  Instead, we always used " renesas,r9a09g077-<foo>"
> as a fallback for "renesas,r9a09g087-<foo>".
> Is there any good reason to start deviating from this?
>
Right, I missed that! I 'll switch back to the previous approach.

Cheers,
Prabhakar

