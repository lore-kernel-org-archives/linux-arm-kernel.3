Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ABC5CE8D4B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 15:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jk5JSmxEp0HQ6Ptor41fJeYFMKyH+DMMft/X2zxuyiw=; b=uaKrjGw7plmH42FrvF78sr5K6V
	Iev2XDyil4p9p81+cdwiJAg5N9yvSLa+teD/qAW/87FQ5c7xmtKIDikZAHfftot/H0plFf7CGK6+m
	ewqb19croQ9cpjqnue45L0bnFVlmX3wP2xhL/QqM4jYLV/abOS9sbXJtf3Yyi6f3nPJ5s/CytLjBq
	u00Z6UneKcLoQ2FHAgUKLoi4eh17A1TeMVKCI6dsqI+/ruepIOl+i9hDZq41T1p3JaHmNPBDTB8O4
	FSSxC9bgkUJVaClmbF1RyKDtWEIxopOkwfoqnYG0AeVPyXyy1AhBBG/fl1tSztbaOEkK33BdVbI33
	rMX5AQjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJw8R-0000000CdDQ-0oDk;
	Fri, 14 Nov 2025 15:54:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJw8O-0000000CdCJ-3TRE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 15:54:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C8EB243272
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 15:54:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB18BC19422
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 15:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763135687;
	bh=Jk5JSmxEp0HQ6Ptor41fJeYFMKyH+DMMft/X2zxuyiw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UgBmdEKTDGiYVfpy2hkvCXfk3uWC4J3SK6oa1txw8z2OVO6PN5nu/9tj/T32/w6y/
	 BhzL+kNoREA3BP+kJrpg356lrtpmPYQErhimKRw9OLNHU6g7+lzGm9/55a3uOZT3H7
	 GGnzo0mnJVopBvjTd9l5h4T1eR/hCpnGeoiyQt9ze2CYTSeu3yQZnxvX/12ijR7laR
	 oDfeK2iuJED+uWkdIuk8aBjkc+//IwnsqHLxkOEvb2Ej1VA2isGXiNPFbfmGiRgF0O
	 IXKRayKW6fWc2T1fm2kslUudIcL85uCJOWtQE/WXucEft5bMt2MvErrZ1WWh6xxxjG
	 1xguQz98wgNGQ==
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-afcb7ae6ed0so327010266b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 07:54:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVBdi2cdIjDbfEjFniYG/ru8ZO4PhBT2TXtXbHK8vppAIJsDicBgr2QBg2IE4CBw1z4+V9af61Nu/C3zsTcvZsv@lists.infradead.org
X-Gm-Message-State: AOJu0YxbchQQBzhgVOTOQfIahRZ9VqxIBIVzZgZKB8/8fhXSnvJXu7qt
	oXMzDtHQEJIaATc5oa9OKhUsW8y7vR2YBavHGuOfv1RSsPW1FQnZny42tgW85uLnMvkw8Sycvjk
	CtnygXcJ7MC8nhjYuW4DkLhq26bLj2Q==
X-Google-Smtp-Source: AGHT+IF49BCOAXcksr6jxI1XuHeLVxsuwlCSI/U4/vtzUjKtf60KEEkA0yjf+Awa59L5KtlnwetAifVA0/77G7MfGqs=
X-Received: by 2002:a17:907:94d6:b0:b65:b9fb:e4a7 with SMTP id
 a640c23a62f3a-b73677ed936mr342085366b.9.1763135686164; Fri, 14 Nov 2025
 07:54:46 -0800 (PST)
MIME-Version: 1.0
References: <20251111192422.4180216-1-dianders@chromium.org>
 <20251111112158.1.I72a0b72562b85d02fee424fed939fea9049ddda9@changeid>
 <05c833f0-15bc-4a86-9ac4-daf835fe4393@kernel.org> <CAD=FV=XXWK9pmZQvNk6gjkqe6kgLXaVENgz0pBii6Gai7BdL-A@mail.gmail.com>
 <00ea821c-5252-42cb-8f6f-da01453947bd@kernel.org> <CAD=FV=VSxeKgGcsRb9qiXq7nsbOWZjPvzmGEOhFA+pmABWdknQ@mail.gmail.com>
 <6490f20a-2492-4ee0-8f34-d529e0df0bad@kernel.org> <CAD=FV=Us7SU_OifVkS4mdfVhc=xGYSBiBpBk9aA1Ki0y+iYBpQ@mail.gmail.com>
 <abb77afe-c285-46ba-88ac-08574bd67712@kernel.org> <CAD=FV=VcAbgv41tjgWQN4i8Wqk6T6uvdpQ261Q_hcKM4AMpGEw@mail.gmail.com>
 <20251114-elite-refined-yak-bf9e64@kuoka>
In-Reply-To: <20251114-elite-refined-yak-bf9e64@kuoka>
From: Rob Herring <robh@kernel.org>
Date: Fri, 14 Nov 2025 09:54:34 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLUNyMC274cXFcdfY7N6_uY-PrbH5RDiOfrfe2D_OAwjw@mail.gmail.com>
X-Gm-Features: AWmQ_bn39ZgmKmSKZ9R4JlObI-OyA36Q7CJrSlb2twcDbMEmJ4DyC3n98UiHAJg
Message-ID: <CAL_JsqLUNyMC274cXFcdfY7N6_uY-PrbH5RDiOfrfe2D_OAwjw@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: arm: google: Add bindings for frankel/blazer/mustang
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Doug Anderson <dianders@chromium.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, linux-samsung-soc@vger.kernel.org, 
	Roy Luo <royluo@google.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>, 
	Julius Werner <jwerner@chromium.org>, William McVicker <willmcvicker@google.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_075448_906311_A41FE6AC 
X-CRM114-Status: GOOD (  39.15  )
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

On Fri, Nov 14, 2025 at 3:26=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Thu, Nov 13, 2025 at 10:04:53AM -0800, Doug Anderson wrote:
> > Hi,
> >
> >
> > On Thu, Nov 13, 2025 at 9:43=E2=80=AFAM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> > >
> > > >>> Yes, the complexity of just "hooking up" the components on an SoC=
 is
> > > >>> an order of magnitude harder than a Raspberry Pi, but it's still =
just
> > > >>> hooking it up to external components. In both cases, we are model=
ing
> > > >>> the core "brains" (the part that contains the processor) as the D=
TB
> > > >>> and everything else just "hooks up" to interfaces.
> > > >>
> > > >> You mix the topics, so I don't follow. I speak here about bindings=
 - you
> > > >> cannot have the that compatible alone, because it is incomplete, j=
ust
> > > >> like compatible for "transistor" is not correct in that context. Y=
ou
> > > >> speak what could or could be DTB, different topic.
> > > >
> > > > A "SoC" is "complete". It has a processor that can run instructions=
.
> > >
> > > Then show me executing any piece of software, which is the consumer o=
f
> > > the bindings, and runs on the SoC without the rest of the hardware sy=
stem.
> >
> > Show me something that runs on a Raspberry Pi (the models that don't
> > have eMMC) that runs without hooking up power and plugging in an SD
> > card. :-P
>
> It has MMC controller/slot described in the DTS and the SDcard itself is
> DT-transparent, meaning you do not describe it in DTS, plus I can easily
> insert such card, thus for sake of this discussion that RPi still works
> fine with DTS.
>
> This SoC cannot work without other pieces described in DT, that's why it
> is incomplete and unusable on its own.
>
> You are right that my previous arguments of hooking components are
> incomplete, so let me rephrase it - the DTS file should be complete from
> DT point of view and completly usable on its own. That's why DTS
> represents board (with the exceptions of few SoMs as explaiend to me
> long time ago).
>
> SoC does not meet this criteria, therefore it is not suitable for DTS.
>
> And if you claim that SoC could be fitting DTS, then I claim that
> individual transistor or one IP block like DWC USB3 could be there as
> well. With your arguments we could create DTS files for DWC USB3 nodes.
> Fact that transistor or DWC USB3 cannot execute code on their own does
> not matter, because it is nowhere said that DTS represents something
> which can execute code. CPU executes code, so following this argument
> DTS could contain only CPU device nodes..
>
> If we allow subpieces, like SoC components or SoCs (both still unusable
> on their own), as DTS files we open the pandora box of all possible
> styles and formats. I don't see reasoon why would we want it, what
> benefits this would bring to the ecosystem maintenance.
>
> We did not document it that DTS represents usable board, but it is
> implied all over the software projects, like GRUB devicetree [1] which
> takes one DTB to load. Only one.

Obviously at the grub and kernel level we support only 1 DTB. No one
is debating that here. Can we back up and stop debating implementation
details.

The problem is in early boot before there's DT used where you
determine the SoC and/or board at runtime and need to load the DTB
from that information. Both are dynamic in Google's case, but it could
easily be only the SoC or only the board is determined at runtime.
There's another similar usecase of booting a SoM with a SoM DT and
then applying the baseboard DT overlay. You could want to do both in
the same system. Your options are either have every possible
combination as a full DT or have a way to combine them at runtime in
some way. I'm pretty certain the answer for the former will be there's
not enough storage. So that leaves the latter option.

The only real answers here are a) your usecase is not valid or b) how
to implement the usecase.

Rob

