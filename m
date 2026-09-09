Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 620B7C79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 15:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2xIh1wPKDMe5t+fT3IE0obOGyRNurvI4tDRD2p56gTg=; b=OBwvL2euZTkNRHNUMm6MiofZwa
	AMa6KSmfPNvBeOOGQQ3ZmSdlstf6QYeIMowdwvzgwWsaBkXVSx+GdierCrUid25+/m3M07t91SQmr
	1M/VHBUlED4spwfGrDDKT2HIoWTzR9RaIkxkQFOdzSxCxEg7zttxFeUYikkkgNzgZ6zsbCCqWqSUg
	oipAiGD4pv7PjVJzQhqxIYXVwtnnep25GKVRETPr1gCvFF+f2YxjxGYyF/TZjqN8o4keJwstB+Uew
	t8zQdKVEDia6i/a9aQzkb4hQFDVYUlH6Dz8RDLT36RPcPxa7HAG9BZmPfWJPZQ3aIIwYmoyloBWxy
	GQrY1bPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4K6w-0000000C7tZ-1PXd;
	Wed, 09 Sep 2026 15:21:18 +0000
Received: from mail-vs1-f50.google.com ([209.85.217.50])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4K6q-0000000C7rx-1UW1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 15:21:17 +0000
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-78a220b5778so4636108137.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 08:21:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788967270; x=1789572070;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2xIh1wPKDMe5t+fT3IE0obOGyRNurvI4tDRD2p56gTg=;
        b=S+D2pO5bKtA7RV1i96Mh+KDHWAqyJflc+fPZprNGkLO3n31ca3J0hRGd3aQ8ZxfSHK
         pw/9uSL5cYdN2xDueedH7p+VvsbrdSI+ayI9xqIGkcoHLLzbeF2x5zPlXWXbNMhafBw7
         hzgt399XVmBgcTIRqM/fom/VOk7fYHYwqArfVu6zyzxROV/kcc9buzSCWSVNxa2cqCZH
         UoT8Hey1yyeGnunegu0e5umk8DC6sEZhuhZP/Yj2eBMlbIYXpDVrlQFtTHafuS+bXjSO
         wrGw9Dawt2vp5Lkk9BOQIVQldc+rK+ZcHoX8jNyCFP+exMFq8xrIg2flQ9PhjUutjYdo
         eCJQ==
X-Gm-Message-State: AFuF++lxj+GcB7hkCtJ6gbAg9x5XXki5DYlfZx8QLCffNmpA+rkdoWf6
	gkhXVocdP8rDsJYn0tTRbVvxiimHU8yaj4JaftJQNK7MWN+2OtLun5gJL/LfGt8r9nM=
X-Gm-Gg: AYBFou2+vsWrXHHDgJj2gVB/W4cnhOkhlS/O4cQP14g1bEpkhwavUpk0Gh82HKts0a1
	E1y3bKdbOHMEt7CSyplGbacFuW0F4PyMr73slnaS0ru58mKKbwk5CQH0E0HYaoGBjxOk78b+4Hm
	+O4RCeoOfSzmO+JpflNGTxifpyr9btfScE+aeCoNt28fzYW1C3FhGjG9KKcPyaHxnc63hHY8RKw
	EKB3YYsS+3Q+V77sPCn+mXeGuvbq4/xLr1XhnHys9/5OLrCdrr97kIgagJgFk+8ASLgpMuTtYLa
	j1f+8L3qHTn9X3VpOjpjax5zErbAZjpAK+lPgNfheJBpxEVssysssHe1OtCFll1ahYFangVhBJ8
	bCjn46B52GVcBaXq1pXZWNbkbZTGChIaiuiTZfKH3ODGyn244j8aQLwWFr4BOP4CQIDVgZ9XCm/
	CODfG8F1rzFE0ZCwvb/giXTK16MaIWQuT83Fxzc7juWy+kAYheyIadkC0ntNw29B3Ech00DFu4P
	24S7MI75vqWHczRQ7k9PemxBuc/GBxnKLMGZoNqa5Zf+us=
X-Received: by 2002:a05:6102:1676:b0:785:6719:abb1 with SMTP id ada2fe7eead31-78a2ef7b044mr8496507137.11.1788967269945;
        Wed, 09 Sep 2026 08:21:09 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a47ae8dd2sm11518167137.8.2026.09.09.08.21.09
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 08:21:09 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-78a66ef3468so3051996137.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 08:21:09 -0700 (PDT)
X-Received: by 2002:a05:6102:8308:b0:76b:2548:560a with SMTP id
 ada2fe7eead31-78a2efe5c6fmr8198191137.16.1788967264493; Wed, 09 Sep 2026
 08:21:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260808025724.131943-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdWvLX7OZSkfEBA34wKtnoZ4asB6rWFJiLa=2+=fezqsCA@mail.gmail.com>
 <f82ae578-fbe7-4834-bdde-d11e194a507f@mailbox.org> <CAMuHMdXQKL_srr80mUmsnznqJ_qxAoh0TdwyvJ41=CN=2pDjCQ@mail.gmail.com>
 <c784aab5-c0c9-424f-9f9d-a0330f60a0ef@mailbox.org>
In-Reply-To: <c784aab5-c0c9-424f-9f9d-a0330f60a0ef@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Sep 2026 17:20:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWi7ou=pbTfHXHfjCLShwqWOcYYd3vpLPmUHzMMNFJ+fA@mail.gmail.com>
X-Gm-Features: AcwNN1X2mn0ov-erdE-79oChYQokKwSLC2Xb3xUhMRJG7PmcUAF6Kj0jO0aTaU0
Message-ID: <CAMuHMdWi7ou=pbTfHXHfjCLShwqWOcYYd3vpLPmUHzMMNFJ+fA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: sparrow-hawk: Add overlay for
 WaveShare 2CH CANFD HAT
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_082112_409461_CC4CA35C 
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

Hi Marek,

On Wed, 9 Sept 2026 at 17:16, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 9/9/26 9:56 AM, Geert Uytterhoeven wrote:
> > On Tue, 8 Sept 2026 at 19:02, Marek Vasut <marek.vasut@mailbox.org> wro=
te:
> >> On 9/8/26 2:02 PM, Geert Uytterhoeven wrote:
> >>>> +&pfc {
> >>>> +       msiof0_pins: spi-ws-2ch-canfd0 {        /* SPI_0 */
> >>>
> >>> Node name should be "msiof0".
> >>
> >> Do we also have to fix up
> >> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts this:
> >>
> >> "
> >>    755         msiof1_pins: sound {
> >>                             ^^^^^
> >> "
> >> ?
> >
> > Might be a good idea, to increase consistency.
>
> Submitted as
>
> [PATCH] arm64: dts: renesas: sparrow-hawk: Align MSIOF1 PFC node name
> with label

Thanks!

> >> But I wonder, shouldn't the DTOs contain unique pinmux node names, whi=
ch
> >> cannot accidentally overlap with the base DT or other DTO node names ?
> >
> > In general, the answer is yes.
> > In this case it is about pin control subnodes. If the base DTS already
> > uses msiof0, its original user needs to be disabled by the overlay
> > anyway.
>
> The original DTS does not use MSIOF0 .
>
> I think the proper solution here would be DT connector ?

Keeping an eye on Herv=C3=A9's work...

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

