Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4010CC44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 21:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QOSXPs572gwC1zNEaba3iUlnyvy4QAECU2owztJON50=; b=n1u2EsKHCb/Rby0VwFi6MOERCi
	HTQsjKE1qlJtonzjb6yTN5X9F8c8fivLFtto+Bp436QgxHx4MqRrlmApJp2jx4iLtzyzcXSJPcsBB
	X5F6P8AUsIfeRtuZ2KUIijaqR2FYo1wJo9zrn4JYwXK80GCWA+qS7bZ19GKBqH+NhyIyUsKS8FCcm
	zKel/xsHc4XmbzdM6CkOLKzGmB+MR7Le0uRoZUARduOe5ZtKhgdbnWNHNvF0gtoMNzISRfMel8iC3
	1kfY80mPilBDTh/gvcFqNEP06ZyPqOqyAemBOF7gkwuH77p05piFGSbRFgp4KeFg6aYW43KMIBeyR
	4+eSvwgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whZut-00000000S3d-1flH;
	Wed, 08 Jul 2026 21:34:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whZur-00000000S2t-1dH2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 21:34:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7D343601ED
	for <linux-arm-kernel@lists.infradead.org>; Wed,  8 Jul 2026 21:34:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E5961F0155D
	for <linux-arm-kernel@lists.infradead.org>; Wed,  8 Jul 2026 21:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783546488;
	bh=QOSXPs572gwC1zNEaba3iUlnyvy4QAECU2owztJON50=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=oLWiMIEJ0W+2X8o0NSe2rZ6aZ3sA6U0G3Dq+g9ru8SeVgFY7ajC/IFv/EZWpsR5Xk
	 geK/gPYk+UMZRfpa7k1QenCnUGWTbPm3ZsHpkyFzbIAayQBkS6sjilk9ExJRQu8Fs8
	 7EUnOZAdU1U0xEUWoDATI9FLYwtAhcc2Ly8+nhDxtj4JA8NlBLjGZxSP1Y6GZSOwvI
	 c+vM8ee3gvlIvJVR8u83IXaNI3/rRtMq7NuqbKXPpIyvrNqSEkSKhU01Jg0EunLJhk
	 uLfFyYjwY7928goknVNQYJCKy4nlHiR+Dd4FM77K/mm76Z7uNJh7YJTm+FHDnLrUBz
	 pC+WHzxSmARzw==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-698c0ff45b5so453576a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 14:34:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ro3PXKehieLFcuJ1R8rnRt0j0DpPGFd9HdRaz/vIbviX0vkgQO1OOqd6OnVIT6dXTh0K8KUAH1VDmSqoB8I6NIY@lists.infradead.org
X-Gm-Message-State: AOJu0YziBXmL53DMr+6z0lSMgcK7PIt4mTA3Sa0pdvKHTVy7MpzDgLwW
	j8d+7qSBltsop233mAXjCsTC5tBBm8W8zslGRAs5dtfSQ2UnGW3rcCqeav5lnLkD46vW7+fxBsZ
	XVncP+sVJXyQjVgprdh6gP5aXLD/wbA==
X-Received: by 2002:a17:906:2099:b0:c15:c323:36e5 with SMTP id
 a640c23a62f3a-c15e744ffafmr1138866b.10.1783546486746; Wed, 08 Jul 2026
 14:34:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260701-mt8189-clocks-system-base-v1-0-2b048feea50a@collabora.com>
 <20260701-mt8189-clocks-system-base-v1-2-2b048feea50a@collabora.com>
 <20260701193311.GA1402559-robh@kernel.org> <d1e37bd4f2a05fed6c7bfdc5d9a0fa90c892d608.camel@collabora.com>
In-Reply-To: <d1e37bd4f2a05fed6c7bfdc5d9a0fa90c892d608.camel@collabora.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 8 Jul 2026 16:34:35 -0500
X-Gmail-Original-Message-ID: <CAL_JsqK8mmkhp8rM1QVB8cqLmTVqy5toFdt3Y1AFLJ5-wOdhgQ@mail.gmail.com>
X-Gm-Features: AUfX_mw1Ig80oWjopfC3vG9UTQnueKyNCwAlWOrtHD_SpQ7K2JXbmkzTxRjcs9w
Message-ID: <CAL_JsqK8mmkhp8rM1QVB8cqLmTVqy5toFdt3Y1AFLJ5-wOdhgQ@mail.gmail.com>
Subject: Re: [PATCH 02/15] dt-bindings: clock: mediatek: regroup MT8188
 dt-bindings into MT8186
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Chun-Jie Chen <chun-jie.chen@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Edward-JW Yang <edward-jw.yang@mediatek.com>, Richard Cochran <richardcochran@gmail.com>, 
	kernel@collabora.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
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

On Wed, Jul 8, 2026 at 8:45=E2=80=AFAM Louis-Alexis Eyraud
<louisalexis.eyraud@collabora.com> wrote:
>
> Hello Rob,
>
> On Wed, 2026-07-01 at 14:33 -0500, Rob Herring wrote:
> > On Wed, Jul 01, 2026 at 03:11:07PM +0200, Louis-Alexis Eyraud wrote:
> > > Regroup the MT8188 clock and system clock dt-bindings into MT8186
> > > ones
> > > to ease maintainability and have common files for several currently
> > > supported SoC or new future ones, that have the same kind of clock
> > > controller design.
> > >
> > > Note:
> > > The `#clock-cells` property is a required property for all
> > > compatibles
> > > declared in MT8188 clock and system clock dt-bindings but not in
> > > MT8186
> > > ones.
> > > To avoid ABI breakage, conditional blocks to check this requirement
> > > for MT8188 compatibles are added, rather than enforcing it for
> > > MT8186
> > > compatibles.
> >
> > If the existing DTs are just wrong, then I would just make #clock-
> > cells
> > required. But please update the .dts files so the warnings don't
> > grow.
> >
> I've tested to make the #clock-cells required for the MT8186, MT8192
> and MT8195 system and functional clock controllers.
> I did not see new warnings, so no extra dts patches would be needed.
>
> I'll add new patches (one per SoC) in the next revision of the series
> for this, as it simplifies the grouping patches (no more if/then to
> require #clock-cells for the MT8188/MT8189 clock controllers) and the
> note in commit message could be removed.
>
> > The grouping I would do here is:
> >
> > - clock controller only
> > - reset controller only
> > - both clock and reset controller
> >
> > That should avoid any if/then schemas.
> >
>
> By this grouping, I understand you suggest having separate dt-bindings
> files, that could look like:
> - mediatek,mt8186-clock.yaml: clock controllers
> - <name to be found>: reset controllers
> - <name to be found>: clock controllers with reset controller
> - mediatek,mt8186-sys-clock.yaml: system clock controllers.
> - <name to be found>: system clock controllers with reset controller
>
> Is that what you meant?

I think so, but not sure I understand the distinction with clock
controllers and system clock controllers.

> There is no pure reset controllers for those SoC so no dedicated file
> would needed at the moment.
> The system clock controllers all have reset-controllers, even they may
> currently be not all implemented, so no separate files for system clock
> controllers would needed as well.
>
> Also, from what I see the current dt-bindings, the system clocks
> controllers for the MT8186/MT8188/MT8192/MT8195 SoC have the #reset-
> cells property but it is not required for them (examples:
> mediatek,mt8188-infracfg-ao or mediatek,mt8195-infracfg_ao).
>
> With the patches to make the #clock-cells property required, I already
> removed the biggest if/else block in mediatek,mt8186-clock.yaml, so
> only the one regarding #reset-cells property remains.
>
> So, should I create separate files, following the grouping suggestion,
> for the v2 of this patch?

Shrug. There's no hard rule here, it's a judgment call. With one
if/then block dropped, it's a bit more tolerable to keep it as-is. If
the if/then schemas are as long as the rest of the schema (minus any
example), then I would say to split the schemas.

Rob

