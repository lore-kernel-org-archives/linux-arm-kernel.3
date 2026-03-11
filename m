Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47F4AFD064E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 08:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l5K9WNnIHG5Tn9NTyaMHn7QRZsVak2YKcsDkJ1Iptlo=; b=pFSlABKcPslMwc2K/Hw2kgszj2
	73916U4G8f1F1xmhIhTd341a0OT9T9lnUDsUfrO7JLcsoQ2JQcY+OaqwaLfNThFrlmIoDfQyXTAHp
	JemfxxtO3nTnca3wSOzb4IB8K1pb6s4VdoDX/PdsgbitMQMCxKkdUFK/agUejQ7t5ncxQ4ePww/mj
	oko67xGGEhpQ3mIUgd2A7i/AbTfZoWkNhO8LDnaSlaoy9ltyuADGf/V2QDSPQwTxYjC64/wjvZ1no
	P+3uGro7ftko/BhkwXW/WWMejY3HCwMWL2aOsHxiDsqkXGKUVFKt6mmd8VNiSelfJp87Zaq1iA9FN
	P18nEUFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0EzX-0000000BBA8-2bgK;
	Wed, 11 Mar 2026 08:32:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0EzV-0000000BB92-1FS2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 08:32:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 849B943F47
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 08:32:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 634A6C2BCB2
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 08:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773217948;
	bh=l5K9WNnIHG5Tn9NTyaMHn7QRZsVak2YKcsDkJ1Iptlo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Ejve35w09CSg1zANn983peQm4hzjW6eLKj1vMxnkjK7ZX4tJnpn9dqcgbNIMiauJz
	 7BtlAqkIdAxsNNzXjmOAjEW15/XBXc0BBo47y5AGEQF7gqaKsWzvjdNA1vJ4Pn11R7
	 yXn8FLrmPoKRWKIrEjSKMxaTuPLsHdmqT38UxcEMJrcPdnrO8qxXvv5rQDIm1EPgvQ
	 TACyLCQ5AXsbvyrXIc8JOWAcE6Xz3WDdgbSDkJDzXTPrmiAvhSZe1xK/FamFVVCtqu
	 ADubvEiaKuTmrFXD9s8DGs78KiV0htwA1qMjTbYUt3mdhJu+ZIHijJxvA48erVYrTy
	 tbk8D08nDrz9g==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a12cc20e71so6250618e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 01:32:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXxQDHt+Ub2AgIdJeF2sT84bHPrz6p1pqbOrV7f4/u0nqVQIwgdemtZbSvyNLfm8XoPwTGxgAIJkq0eUA5O1XKR@lists.infradead.org
X-Gm-Message-State: AOJu0Yxp0R52hzVhxJOKgsW5ehPWRS+JHlIbojGV980OY7oXwj8LBFJm
	X+pVR3G1TLryCHql8/tAHisEU3Z4e85BxdYNA09T5fXtOOW9Opkh9vU/ig9f9/M01t6CoilOkXN
	ZqMuLURykB/Kmb+1KUu8iIRjP87hEfp8nWfclJnxIng==
X-Received: by 2002:a05:6512:1085:b0:5a1:3cfa:47cf with SMTP id
 2adb3069b0e04-5a156cd07d9mr580300e87.41.1773217947008; Wed, 11 Mar 2026
 01:32:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260226143615.65788-1-bartosz.golaszewski@oss.qualcomm.com>
 <84da053d-97d5-4d07-8e76-b162a5b23d2a@kernel.org> <CAMRc=MehMLoBL573cWjQNN2eCiTCyqCv1xwVKqfkZ5isBhBUaA@mail.gmail.com>
 <10bb25d3-2f46-4b62-affb-31257d51e24f@app.fastmail.com> <CAMRc=MfupCCr8J+qnJACVeri4nZZCnULWaRgSvi4LWs4J3-5vw@mail.gmail.com>
 <9132501f-76e9-46c0-839d-bde7246c3883@kernel.org> <244fdbad-0d9f-42bc-a005-5f5ef34d067d@app.fastmail.com>
 <20260227-wolverine-slogan-7af0661f6e44@spud> <c9df99ef-9bd6-43a0-9f22-721bd6bfc90c@kernel.org>
 <20260227111748.ddqdf4avpvfzu4cm@DEN-DL-M70577>
In-Reply-To: <20260227111748.ddqdf4avpvfzu4cm@DEN-DL-M70577>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 11 Mar 2026 09:32:14 +0100
X-Gmail-Original-Message-ID: <CAMRc=MdrrzoL3r-Br2pvR=TXxXVdS_ouf1ikNysd=GuhR1V84g@mail.gmail.com>
X-Gm-Features: AaiRm53KKsXxf8jQJ1WFnptZ9zYP_p1KRsNAJsew_UA8_7EgOTDEsxlWJpGXFw0
Message-ID: <CAMRc=MdrrzoL3r-Br2pvR=TXxXVdS_ouf1ikNysd=GuhR1V84g@mail.gmail.com>
Subject: Re: [PATCH] arm64: Kconfig: provide a top-level switch for Microchip platforms
To: Daniel Machon <daniel.machon@microchip.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	robert.marko@sartura.hr, Steen.Hegelund@microchip.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_013229_372487_E768F8B4 
X-CRM114-Status: GOOD (  25.87  )
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

On Fri, Feb 27, 2026 at 12:18=E2=80=AFPM Daniel Machon
<daniel.machon@microchip.com> wrote:
>
> > On 27/02/2026 11:15, Conor Dooley wrote:
> > > On Fri, Feb 27, 2026 at 10:28:53AM +0100, Arnd Bergmann wrote:
> > >> On Fri, Feb 27, 2026, at 10:21, Krzysztof Kozlowski wrote:
> > >>> On 27/02/2026 09:51, Bartosz Golaszewski wrote:
> > >>>> On Fri, Feb 27, 2026 at 9:49=E2=80=AFAM Arnd Bergmann <arnd@arndb.=
de> wrote:
> > >>
> > >>> I don't think this is fixable, that's why I wrote that I accept the
> > >>> negative impact because I like the cleanup more.
> > >>
> > >> Agreed. I remember when we split up the ethernet drivers into per-ve=
ndor
> > >> subdirectories and had to add 'default y' to each one in 88f07484ccd=
f
> > >> ("drivers/net/ethernet/*: Enabled vendor Kconfig options"). Changing=
 the
> > >> default to 'n' would be a regression now as much as it was then, so =
it's
> > >> not something we can expect to do more easily in the future.
> > >>
> > >> If the Microchip maintainers think the change will cause too much
> > >> extra work, we can leave the current version forever, otherwise lets
> > >> apply it for 7.1.
> > >
> > > Here's the previous discussion when this was added not too long ago:
> > > https://lore.kernel.org/all/20250811122053.4bfyoefln7wpz2a4@DEN-DL-M7=
0577/
> > >
> > > Daniel is probably the one that "needs" to answer this, I think the
> > > lan969x is added recently enough for this to not be particularly
> > > disruptive.
> >
> > I don't get arguments there. The policy is one ARCH per vendor, so why
> > exactly upstream would like to "having more granular control with
> > separate"? That's downstream or vendor wishlist, not upstream.
> >
> >
> > Best regards,
> > Krzysztof
>
> The out-of-tree defconfig impact is minimal for us. As Conor mentioned, l=
an969x
> was added fairly recently, so the number of affected users should be smal=
l.
>
> /Daniel

So can this be picked up directly into ARM-SoC please?

Bart

