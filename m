Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6297C5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 07:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8NIMyonBTLl7p5TcLVhooTgWqOCx0uqDr6kFmRrrkQc=; b=Kv8Jd3pZeTtUHNDRloYhEYH6RY
	z+3Oz7J5kg54z8Xi8pCVprQHujHMXDg7SJ+fgskjijv2GnF+nXevCIHRtAEjw7OlpyL/zB2MC50yf
	BNUZ0JWbWcjHrouhXEpqNl0DARcv10wOiURzGUY2FReaoyHgywSnSE9tUoi8DVl6fQotdLdDj7AfV
	cDkQyPXvMkIy7ox652TRdg3wrMWUr6cM70DTl7TvMy8Ur8dNun1eB+P4iU4QSPtv6uXAmnqG68wCW
	1dUWkPt4GunhO0E0cdBGJov7WZRj1+L/F/yjV97PzcTCOR7rboqU0Yip8YvZILbatsTDltAgNcSns
	jvB08VHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu3Zj-0000000Fb8K-3rDC;
	Wed, 12 Aug 2026 07:40:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu3Zj-0000000Fb8C-1anV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 07:40:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C7A0442DAB
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 07:40:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A13B51F00ADF
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 07:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786520434;
	bh=8NIMyonBTLl7p5TcLVhooTgWqOCx0uqDr6kFmRrrkQc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=LpkEHvKv4i+JqSzorjwyomLUtI+GEumeJLV0rdgKKmtQ85BFQ4kA6SXsMMTUPTkYM
	 P5VlIYfTJD8u8o9jB51KRa+12FOpN+SKPS4+tNM8GMzfUNJSbIRcgdpYkx25sxug+V
	 +I9sgt6S/W1KiWEi3UuSSJ03TyY8PsqKv6ueN71q6X9aZJrWvDn4++VMHD9b1IH/5M
	 H3tto67xi6IzkmbvZRuTptMR8ce7jI274fUs6UCKpsqbzrke7fcMpu2fkZCAJE95yB
	 rOGdyS2IekQ2j9nQQu4PgXNKeupPwadWriiRHn3LOMpJiH3A0QH6RT+aHzQcHKW9mf
	 FxLq9kWjawaXw==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b0f19bea2fso775809e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 00:40:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpwgIZVX8fHiVtxpFyLqmwtpnCCKBhx5TP43O5T+h85aOh8XmbKzd0SpUXidnpIdZUKiHGhRTknPr3u+QnacVaW@lists.infradead.org
X-Gm-Message-State: AOJu0YyKGnW7+zRehfUg1xfu52Zgw5hkILR7MyfYSGMFk9+gvm6dyH5D
	NLCbUTmPVFoCDCEFo60q83JPI5pjWQ3w1+pUyotYucvSBVyqtEWBvUrojBescQwm2ZGNl5JD3uy
	SlIcD7HQodnhbW94gV2dqK1r9LmmjQm0=
X-Received: by 2002:a05:6512:668e:10b0:5b0:1dd0:f20b with SMTP id
 2adb3069b0e04-5b44e2db43emr269927e87.6.1786520432729; Wed, 12 Aug 2026
 00:40:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260806-longzhao-upstream-cv75-v2-v2-0-6b09707c5fe9@ambarella.com>
 <20260806-longzhao-upstream-cv75-v2-v2-7-6b09707c5fe9@ambarella.com>
 <CAD++jLk0LoOJk=TXin42AL3_z_7eVVkvMnYr1S8090C6A_B+dQ@mail.gmail.com>
 <DS0PR19MB7925690FD29D578D8AC5D10EDADE2@DS0PR19MB7925.namprd19.prod.outlook.com>
 <CAD++jLkUPU0eujvWc5Hn1tEu4n451LvkuGGT=j6OfirJENpRgg@mail.gmail.com> <CAL_JsqJprX0oC3Gdj=RNNYtPiQ-0NkEPvn-MyQ9ZtFakKcj1ew@mail.gmail.com>
In-Reply-To: <CAL_JsqJprX0oC3Gdj=RNNYtPiQ-0NkEPvn-MyQ9ZtFakKcj1ew@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 12 Aug 2026 09:40:19 +0200
X-Gmail-Original-Message-ID: <CAD++jLn+LNAb-VDsNz94Rj780fn1Z_SF9qxxbBAwLMNuedpccQ@mail.gmail.com>
X-Gm-Features: AUfX_mwKiQhkB2vUPp0CB68UDRKMeWXa67ucLPOGncEJWQU6-LQSzSsOw8NITtk
Message-ID: <CAD++jLn+LNAb-VDsNz94Rj780fn1Z_SF9qxxbBAwLMNuedpccQ@mail.gmail.com>
Subject: Re: Re: [PATCH v2 07/10] pinctrl: ambarella: add Ambarella pin controller
To: Rob Herring <robh@kernel.org>, Konstantin Babin <Konstantin.Babin@arm.com>
Cc: Long Zhao <longzhao@ambarella.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, "soc@lists.linux.dev" <soc@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

(Page Konstantin)

On Tue, Aug 11, 2026 at 6:11=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
> On Mon, Aug 10, 2026 at 2:42=E2=80=AFPM Linus Walleij <linusw@kernel.org>=
 wrote:
> > On Mon, Aug 10, 2026 at 6:02=E2=80=AFAM Long Zhao <longzhao@ambarella.c=
om> wrote:
> >
> > > Thanks for the review. I will rework this to reuse the PL061 driver w=
ith
> > > per-variant register offsets, and evaluate modeling each GPIO bank as=
 a
> > > separate DT entity. The duplicated GPIO implementation will be remove=
d.
> >
> > Thanks Long, I think it will be easier if you break out the pin control
> > bindings and driver from the patch series and work on it separately,
> > the same with the serial driver at least.
> >
> > I understand this can be hard to test on the hardware, I usually
> > put a few patches "underneath" the b4 cover letter, and then the
> > b4 send-email will only send the cover letter and the patches
> > on top.
>
> The problem with that advice is then 'base-commit' is useless.
>
> Maybe b4 could learn an 'ignore the top N commits" or "only track the
> first N commits".

I honestly don't even know what the base-commit is for so that's
I have blissfully ignored this problem...

So the summa summarum is that the current behaviour kind
of encourages people to do large patch bombs for a new SoC
since due to base-commit and the fact that developers tend
to need to boot test the series (and it won't boot without some
other SoC-enablement patches) the series must be kept
toghether.

That explains why it feels like I see *more* of those patch
bombs these days.

My initial stance would be that a useless base-commit is
the lesser evil in cases like this.

Konstantin, what's your take on this dilemma?

Yours,
Linus Walleij

