Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E987D64088
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 20:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bb8ZBS8BWoviHzpqzsDZQvjLxtZQJVjzzOtimOr+0Ek=; b=QXvnYWnEc+URldEZ7q5xCx8HTG
	8jKHwi8tiKnuTGZZ2BoQ9azdCPBhTy8vVxbNrZgjFoFNaVo1LyubCjVTa32BTSZkz5fBTGnYSTsMK
	R5LA6izE8qbM/4PrVm8nV5BIE1IooxPCJ9td44kLIFU/i5bJc2Sn9Ea/EubMMZ4E2efS0E6xlkfbe
	aXnT1ZXzD8KxyX+NZK33A3svAV7pjjUQvJO8j1L3k/IgiqYs60xm30zTpSntrd4dmZUe8Bud9KGpw
	1jnpJw7Xmun85nsfnqmHb3VT1JfyxPprKLXA68gp6k6BatUW1//YmC1LN6mwnorxtvm4OyOXJgbpD
	NlBNrgQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9W3o-0000000Bxwu-23Fk;
	Fri, 08 Nov 2024 20:58:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9W22-0000000BxgI-3Hpo;
	Fri, 08 Nov 2024 20:56:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DFBAD5C5E2B;
	Fri,  8 Nov 2024 20:55:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3225FC4CED5;
	Fri,  8 Nov 2024 20:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731099397;
	bh=Xd+Iv39wDLiv1W/W6pMdvFYFk4KIRUOY6oJ6YP9dP5E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mzDga9rIZXYrJM30wctgArOOLT5gPx9yU7d7Z0xRanvD7SZ5JW+T5s2/BG9jXr770
	 rFs3cm731aajOthU2H5euH5ys7fxVIsjbCvAYofafu90gzNVpR7HbGDYbjnRmQ+lqG
	 TSZ6306R6uj7hahsRihVu/2qO0jR671onJlwTMjRPPQcwJgLD9u7XRL0zL5kmsMKcc
	 NlCJ/WdXojx3LqvSr16ARccUxsUtqgc+nBxVt7V8Eykgee4O9xs7N2O0HpEFhMnMQx
	 G3UkYM+k7Y25aw1UJNdMZbRHUpr01Ito+oHBltuhPIed9eE6EhRNEPI0yC9TrH1v0X
	 0oIeW6243PUQA==
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e30d0d84d23so2372247276.3;
        Fri, 08 Nov 2024 12:56:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVdAKpETsTPKIANbLOw/Q3NQSukuw8NRKEsuHwZr92NlBByYT4XX7njtnG3RqxEif8I5xirxM/Da6FtlUJE3p6d+g==@lists.infradead.org, AJvYcCXKsz5R+eIzcrVqA7ZcoMMg3EoG7LdzVVNu+Wu4fhxZ2j1HscrTrmneF0rCSZKXU6vyz1eRg6vwWDGHnSdn@lists.infradead.org
X-Gm-Message-State: AOJu0YymPLtaH52fPomGUZe1blJy73/XYyo9q+hvAeI5LzI5f30iXNC0
	SHlqS+fMGYmid8H88vATdIv/Xm4rTMU5ldRWn9C/BTPedm7TL/C88ACsyHAnt5tyFWbbnlzymAD
	TGKNFBv8v2c+SP45024Pl3VMzvw==
X-Google-Smtp-Source: AGHT+IGdQ2O/mqrpY+fuNbbmYE2hRSmFJSoBJIRulk6FCq1WPwcawEytFzQE5FWTqqfO81SCd4jqFZOV7jmSgFS088g=
X-Received: by 2002:a05:6902:1101:b0:e2e:3701:7824 with SMTP id
 3f1490d57ef6-e337f8440d2mr5033272276.2.1731099396361; Fri, 08 Nov 2024
 12:56:36 -0800 (PST)
MIME-Version: 1.0
References: <20241107143431.728669-1-ivo.ivanov.ivanov1@gmail.com>
 <a4begcrmbtotl2imd3eaxpdveagvwridy6ev5zmwzvjqt3ovfq@wyj2dj73xe3e> <d5d3f934-4f1c-43d9-aaf9-8de194d1f3b7@gmail.com>
In-Reply-To: <d5d3f934-4f1c-43d9-aaf9-8de194d1f3b7@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 8 Nov 2024 14:56:24 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLkdXKGve5tB_cdO9bG9ge923Hbmkz+1BghLc+KkkDo+Q@mail.gmail.com>
Message-ID: <CAL_JsqLkdXKGve5tB_cdO9bG9ge923Hbmkz+1BghLc+KkkDo+Q@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: clock: actions,owl-cmu: convert to YAML
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_125638_934776_D2D29B6B 
X-CRM114-Status: GOOD (  26.27  )
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

On Fri, Nov 8, 2024 at 2:31=E2=80=AFPM Ivaylo Ivanov
<ivo.ivanov.ivanov1@gmail.com> wrote:
>
>
>
>
> On 11/8/24 14:16, Krzysztof Kozlowski wrote:
> > On Thu, Nov 07, 2024 at 04:34:31PM +0200, Ivaylo Ivanov wrote:
> >> Convert the Actions Semi Owl CMU bindings to DT schema.
> >>
> >> Changes during conversion:
> >>  - Since all Actions Semi Owl SoCs utilize the internal low frequency
> >>    oscillator as a parent for some clocks, require it.
> >>
> >> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> > <form letter>
> > This is a friendly reminder during the review process.
> >
> > It looks like you received a tag and forgot to add it.
> >
> > If you do not know the process, here is a short explanation: Please add
> > Acked-by/Reviewed-by/Tested-by tags when posting new versions, under
> > or above your Signed-off-by tag. Tag is "received", when provided
> > in a message replied to you on the mailing list. Tools like b4 can help
> > here. However, there's no need to repost patches *only* to add the tags=
.
> > The upstream maintainer will do that for tags received on the version
> > they apply.
> >
> > https://elixir.bootlin.com/linux/v6.5-rc3/source/Documentation/process/=
submitting-patches.rst#L577
> >
> > If a tag was not added on purpose, please state why and what changed.
> > </form letter>
> >
> > I cannot add other people's tags - toolsets ignore it.
> >
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> >
> > ...
> >
> >> +maintainers:
> >> +  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> >> +
> >> +description: |
> >> +  The Actions Semi Owl Clock Management Unit generates and supplies c=
lock
> >> +  to various controllers within the SoC.
> >> +
> >> +  See also::
> > Single ':'.
>
> $ rg --files-with-matches "See also:" | wc -l
> 110
>
> $ rg --files-with-matches "See also::" | wc -l
> 94
>
> Having 94 matches of that out of all 110 definitely leads me to
> think that this has been done on purpose, and is still being done.

91 are QCom and 82 are QCom clock bindings... They tend to be
annoyingly consistent sometimes with whatever was their downstream
coding standards.

The double colon is needed in rSt documents to escape a colon. We
don't need that in YAML though. There were some thoughts on embedding
rSt into the bindings for generating documentation from the bindings,
but that's never been more than some experiments. This just looks like
the first QCom clock binding did this and all the others just
copy-n-pasted it.

> Could you elaborate a bit more? If it's wrong, then shouldn't we
> clean all the other bindings from that mistake?

Patches welcome...

Rob

