Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77DD9C36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 19:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yumHPLuTvhMnE9hl7FGmC0+cXA7qbxp/HLm8xbojwFY=; b=vu9/blP0PGAMTW9cZvrQqpiqdz
	/W6Ru9vmIdx63KKUK8+IKvYBgOgys6lru8fXX1m/byO8RZAFwKqwkPwDjasEtXtGRns/yFe57uUED
	Kq7acf6juky+25E2nj4/Loa7rTpzah7TRP55cecBYpeRa8FbXRaEW21KdUB+n5Xe/kMCdHG/97bqX
	tW5nHPwP+xwSkxXB4hmBJ7fWn7mV6M6js1LxYk3bcWj2t/0uyHVCI9u/17rBt50770+PDgvMDQiIn
	1WV3VxVJY2bTjbwxf3/OfjtA9MIb9oZjS8C8JjMuHP7N7vDjHx/mkSCMpmj8GarrmuMG9roBnaMgu
	qwnvR3Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txWoG-00000009Uox-2OWn;
	Wed, 26 Mar 2025 19:53:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txWmY-00000009UeJ-0br1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 19:51:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6CCEB5C5A6A
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 19:49:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2223BC4CEEE
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 19:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743018681;
	bh=vpNjfjV9EyxkTqodYw2+3oCIshfkkDgO9rKwFnzprFE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hJSadGsSW0/H3IdFtLu1Ffm9kEt+mXwvCGfXmTNmN0KNyA2IE3BjoBwpf0l6m9oH7
	 H9AuoevFkWOyO8SNjPEkyO4hZZbtZnXaXvIpl+Sl2zgkTWS9uj6hkQu12nKzGyTNqy
	 VtksHZo79lgMLVmab+I94xG1woJ3SHBr83zLjh/TdHG06ywgL7+haooEF+qDgHRhRr
	 nxkN38fBC6tFI+aB7GPl7ku+PR70i16/e0oDTAycXFLOrSOkR+vV18aZe0YatPpaZ1
	 0mp3+oofRdRde6wV6yytnbBJhXErHFYVstEzO1RRRN27AFWTrYbEPv9Ji9koR5tojw
	 GP7XLVfTBfYXA==
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e61d91a087so377858a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 12:51:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXk7JcUdKOC9M9x3HX1U6IYKwQh7pFLFDVXlldrmVGYOZF3fhdI1jo9704tW/SI8Uyj/9EpOnXBiuxVEXtXQ/L+@lists.infradead.org
X-Gm-Message-State: AOJu0YwxLGgHsM7qvVnbLzI7RSIfU+8MeE+KLpdV2p40X6Mcl3b9Fp3J
	FHOyGJAd00X1QgIqhICDrmrNJey+K9T2caLP43ol7JQnGyEBYPr+gxOtBfTy4DIb1i2+8+5iqkp
	9N6ErFXTmV0fDfkbTeQAuylRnSQ==
X-Google-Smtp-Source: AGHT+IErvamND+/bzF17Qvrj3EVovyzy2vc413tQ0D0dRY5KJx2kQCEC00XuxHxUOJAIkhyZqX/VrQo5NNwLV7Sr5Hk=
X-Received: by 2002:a05:6402:4304:b0:5e7:b081:8b2f with SMTP id
 4fb4d7f45d1cf-5ed8e28bba0mr700492a12.8.1743018679628; Wed, 26 Mar 2025
 12:51:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250325102610.2073863-1-maz@kernel.org> <20250325102610.2073863-2-maz@kernel.org>
 <87iknx75at.fsf@bloch.sibelius.xs4all.nl> <864izhmkzd.wl-maz@kernel.org>
 <87ecyl6rtw.fsf@bloch.sibelius.xs4all.nl> <87a599qcne.wl-maz@kernel.org>
In-Reply-To: <87a599qcne.wl-maz@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Wed, 26 Mar 2025 14:51:08 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+6B7dL9j+31kAhZ_n0HEQyU8KPHv8W9_RXHfZpC9iwxw@mail.gmail.com>
X-Gm-Features: AQ5f1JqWuCb_FqGMc9ODy56dgNx98tFm3EJA04WKZS1ueKCtpmKEHZhRYL5yOAg
Message-ID: <CAL_Jsq+6B7dL9j+31kAhZ_n0HEQyU8KPHv8W9_RXHfZpC9iwxw@mail.gmail.com>
Subject: Re: [PATCH v2 01/13] dt-bindings: pci: apple,pcie: Add t6020
 compatible string
To: Marc Zyngier <maz@kernel.org>
Cc: Mark Kettenis <mark.kettenis@xs4all.nl>, linux-arm-kernel@lists.infradead.org, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev, alyssa@rosenzweig.io, 
	j@jannau.net, marcan@marcan.st, sven@svenpeter.dev, bhelgaas@google.com, 
	lpieralisi@kernel.org, kw@linux.com, manivannan.sadhasivam@linaro.org, 
	krzk+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_125122_295458_9C993E93 
X-CRM114-Status: GOOD (  22.64  )
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

On Tue, Mar 25, 2025 at 11:49=E2=80=AFAM Marc Zyngier <maz@kernel.org> wrot=
e:
>
> On Tue, 25 Mar 2025 15:41:15 +0000,
> Mark Kettenis <mark.kettenis@xs4all.nl> wrote:
> >
> > > Date: Tue, 25 Mar 2025 11:02:30 +0000
> > > From: Marc Zyngier <maz@kernel.org>
> >
> > Hi Marc,
> >
> > > Hi Mark,
> > >
> > > On Tue, 25 Mar 2025 10:50:18 +0000,
> > > Mark Kettenis <mark.kettenis@xs4all.nl> wrote:
> > > >
> > > > > From: Marc Zyngier <maz@kernel.org>
> > > > > Date: Tue, 25 Mar 2025 10:25:58 +0000
> > > >
> > > > > @@ -50,6 +55,10 @@ properties:
> > > > >        - const: port1
> > > > >        - const: port2
> > > > >        - const: port3
> > > > > +      - const: phy0
> > > > > +      - const: phy1
> > > > > +      - const: phy2
> > > > > +      - const: phy3
> > >
> > > Do we need to make this t6020 specific?
> > >
> > > Obviously, separate PHY registers do not make much sense before t6020=
,
> > > but I couldn't find a way to describe that. I don't even know if
> > > that's a desirable outcome.
> >
> > I don't think there is a way to do that other than creating a separate
> > binding for t6020.  But I'm far from a dt-schema expert.  Maybe robh
> > has some advice here.
>
> Huh, I'd rather not create another binding. The only thing this would
> buy us is a stricter checking of the register ranges.  But it isn't
> like this block is going to find its way in random HW, and this is
> only described in a handful of core dtsi files anyway.
>
> Unless someone screams (and provides a reasonable alternative), I will
> leave it as is.

The simplest thing to do here is (under the 'allOf'):

if:
  properties:
    compatible:
      contains:
        const: apple,t6020-pcie
then:
  properties:
    reg-names:
      minItems: 10

If/when we start having different number of ports with phy entries,
then it gets messy and each variant has to list out the names or we
give up on defining the order.

Rob

