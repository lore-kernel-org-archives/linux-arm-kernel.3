Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92468CA1007
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 01:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kS0eRVrXMVdTSsrinzwyl4LziFG+Xfgo2McFxCw9UeI=; b=hx495R20S6HqLCchlinwXXSBBN
	vkJwXn12ubF2zf9bsSWZaoOOXaM17o0rhxAdkhcyi+6gnFJWjE1lDQsG/WcjpxAJnSSiklwAVTFhc
	KRD2CBr0fJFezjMJeB+uw+/pMpb2HZia3jAH+l97+SCujlvfz9Rw5IgQn4Py2xKC0SUr6V+POhzzo
	s3vhznwj1DFheJxGqZM2aB6el5ZdmW59x2gHFkGcz/hWVjr8L9ykh4+Xg7xf86b5beUiszhMhOMIL
	askP9A4GtY+yHNYctBI8Jrxa0iuJBzlKfwRPPcCrKd5rxM2pbwnjkUiSkTMUqND4nLiszThGIyKQy
	kIwQ1vlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utcRz-000000035PV-3YrU;
	Wed, 03 Sep 2025 01:38:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utcPH-000000034wT-3rBG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 01:35:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4C3FE40968
	for <linux-arm-kernel@lists.infradead.org>; Wed,  3 Sep 2025 01:35:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D834C4CEF5
	for <linux-arm-kernel@lists.infradead.org>; Wed,  3 Sep 2025 01:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756863327;
	bh=kS0eRVrXMVdTSsrinzwyl4LziFG+Xfgo2McFxCw9UeI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Lf4dDe7+J6l0yXw95iXWOF/wm1WdfTiWEELwC53Zh8PYlfuBOfrQXRBxUxHrbVlkS
	 djiA9qcwzo04PZpEwbgNv9IozvADQ9WJHdY96vAYNYFDWOGL9D19mFAEil56iwp9HD
	 9J4LUeW6A34CCKRuN5rOwZ2clprEPCEFwtncogfwQQUqBZaheBfsqnJsaSbgK4HVIZ
	 p8kvIO6WbzGNo8Y6Goi+AJtP6m3KC3/SwNcoc6UXP9CCOWqGD8GGSYWzxgrDr+K02V
	 Mb7d/X7N1FPMlCcfYNo1m3Vu7j5qTfMC7ENTgoHd7/O0zN9d9Vdl2Pc2AC1AU6rL+R
	 HjA620BWFbrHA==
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-619487c8865so793441a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 18:35:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVEhTXGTVjfld/RJQwmsi0iz0pZutNFe0+jJq4/BomaLzTpmzdM5f0ipkXt4c3EDr/3NO2vdR5B11XHD+Gf4Pxw@lists.infradead.org
X-Gm-Message-State: AOJu0YwnwEnylyW10i+rmIkTftRQyURnNWgnHn1btIj9Ve6mSYP073Ol
	FM/dIG8hU9vaEiNlqJ3rOMVf9HZyMTpl9puS5tL86oe8xQp6AIr5NUqv20IQjScadGLZyNj68EA
	x0+BWrni9M6PluJXj64H/05gmans1Fw==
X-Google-Smtp-Source: AGHT+IEyXujD35HTtCO9FAM4YHy4q5+2GF7J4I60L81qqYnXOHcmZ+uGWkffKxS4WQb6DcbLXVDv7SM4I97Y1At2C48=
X-Received: by 2002:a17:907:3e06:b0:b04:5bb5:2745 with SMTP id
 a640c23a62f3a-b045bb52c9fmr290922166b.21.1756863325754; Tue, 02 Sep 2025
 18:35:25 -0700 (PDT)
MIME-Version: 1.0
References: <bug-220479-41252@https.bugzilla.kernel.org/> <20250820184603.GA633069@bhelgaas>
 <20250902203226.u4i43vygl4bl2dqa@pali>
In-Reply-To: <20250902203226.u4i43vygl4bl2dqa@pali>
From: Rob Herring <robh@kernel.org>
Date: Tue, 2 Sep 2025 20:35:14 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+cytAQAtSB7VjR8oKrXJJSSrOouKQZYQAWNvu+tStTnA@mail.gmail.com>
X-Gm-Features: Ac12FXw30tgPmSSwJF2Zx6uteBTHUpxo3W52x3Ym0Mw_DjEpBw5DBBVaxiwsK_w
Message-ID: <CAL_Jsq+cytAQAtSB7VjR8oKrXJJSSrOouKQZYQAWNvu+tStTnA@mail.gmail.com>
Subject: Re: [Bug 220479] New: [regression 6.16] mvebu: no pci devices
 detected on turris omnia
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Jan Palus <jpalus@fastmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-pci@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_183527_974377_AD3FA529 
X-CRM114-Status: GOOD (  16.00  )
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

On Tue, Sep 2, 2025 at 3:32=E2=80=AFPM Pali Roh=C3=A1r <pali@kernel.org> wr=
ote:
>
> These issues have been discussed more times for last 3 years.
> Tested changes which are fixing real bugs and are improving the
> pci-mvebu.c driver from people listed as M: in MAINTAINERS are being
> rejected or silently ignored. And untested changes which are not going
> to fix any bug are being accepted and causing new regressions. People
> then reporting bug reports to M: people who cannot do anything with it.
> The only advice which they can get is to not use mainline kernel.
> This pci-mvebu.c driver in mainline kernel is broken and nobody wanted
> to do anything with this situation for last 3 years, I was pointing for
> it more times. Due to this I'm ignoring bug reports for pci-mvebu.c
> driver for mainline kernel.

This makes no sense. Mainline is broken, but yet there's a regression
in mainline breaking the driver. The pci-mvebu.c maintainers have the
ability to test patches, but refuse to test any submitted patches
other than their own. I guess the only solution here is just remove
the driver...

Rob

