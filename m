Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4979CDB471
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 15:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BSL3Ji4GUrL1JE/4JUwmqRt8VhO/nTrzRQrvkStmD+k=; b=T2shqZFM2Y8atR
	3ii8Rte0C7iJtOPxhFGWdVsdfxEKIhHCqEPlq8+RtBKZ2s8QGrVISUmd5kHqSXUulVBG2ajGu5x6f
	X2MYkueY3c69jHlAqhUopKj4yI3I+dlcHyFPMIwWNEkbVcLlXMRzu/oR4X9aL4CKk/NtarJ7Q+pQt
	UYwg28jGWHQCQJV/BdtgURNn0VlutK6WTmjsV5fnZ0H3+hRJzRhuabUQv6DNxXuzE1LxH2xYR1+eA
	o4XbXerkv0fw+8F/1pwsUI/Ab4dwigHFUOVkFI3KZMKh4Jwi1t2sL+gNxe7jn7r7tfjP3K8uTMS0M
	hS+i2si/0EjL4UREUKeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc3Gj-00000006YY5-2EAS;
	Tue, 23 Jun 2026 15:42:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc3Gi-00000006YXd-0h6G
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 15:42:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9064B4096C
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 15:42:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72AE41F000E9
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 15:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782229351;
	bh=BSL3Ji4GUrL1JE/4JUwmqRt8VhO/nTrzRQrvkStmD+k=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=PLU/Xe7/8I4p6kQw9d+XwsJJIyv8ger5txXEWfC385pIIaf5tiX0F2wRW4uPOHh09
	 Doh7GOS3oSSHklFWi0LWiWPRmm/Mpi2QPnvez/wBzDonyqGD5lns28H14WJe6Hb/om
	 +6H+5S6d019xHkOLUewLOKj4v7uBXxcwuwt+PVNe8sgF4QDlGqBZXfONZjAblucZOP
	 DFJuxPTEaxDypwhYZjhhqSPoYwstBVtrA+8K3jqEZtKpIb3/TlPvyh0M81I4G0amhs
	 LNPCfm8UhYg1xQBiNwWcyLzDai9Ym8d05n3fGMYl4AJEwxnhpMAXNbiVkysPcaWrmT
	 49OODXw+LAFgA==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3996f80800bso12296031fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 08:42:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8+deVK3O6zuxyLvdIWx68B/KpxRtCeBV23JTZ86mgHjb3IOJezl9wtUl6B+Aih8N3iZ30EFxVL/cKupVlZ6C5L@lists.infradead.org
X-Gm-Message-State: AOJu0YwvEMRitg3JB5gJPor4AxMU1k2Acfd3FMlLRzuj7qM4eHGMR88n
	QhKIbu5Y8R4J68aMs4Wikqx2GPlV1YSDesC41Y1DyQDcp1tvWmGy2Ybk2BgXRqq0D1saSJ3VzeP
	zAfR92SzK34sfnXEzWrdAT982zQMYhAY=
X-Received: by 2002:a2e:ad12:0:b0:38a:5bf2:80d6 with SMTP id
 38308e7fff4ca-399c537553emr12162361fa.5.1782229349894; Tue, 23 Jun 2026
 08:42:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260121-a733-rtc-v1-0-d359437f23a7@pigmoral.tech>
 <20260121-a733-rtc-v1-1-d359437f23a7@pigmoral.tech> <CAGb2v67844OPwE6VJ0PAs5LsmCa2h0FvXOBUomZ50dM5tZ0Zow@mail.gmail.com>
 <1j1pe7elxm.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1j1pe7elxm.fsf@starbuckisacylon.baylibre.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 23 Jun 2026 23:42:15 +0800
X-Gmail-Original-Message-ID: <CAGb2v66dTvBmmtJs_9nScpmudpcnSeUvmUmMSkmBw9MoDc_N0w@mail.gmail.com>
X-Gm-Features: AVVi8CcgLOtVmxPkjYo8ol2JpJAsomRkV2c2-YmPvchv8vYkQh8VbR5Oaj0YqvI
Message-ID: <CAGb2v66dTvBmmtJs_9nScpmudpcnSeUvmUmMSkmBw9MoDc_N0w@mail.gmail.com>
Subject: Re: [PATCH 1/7] dt-bindings: rtc: sun6i: Add Allwinner A733 support
To: Jerome Brunet <jbrunet@baylibre.com>, Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
	devicetree@vger.kernel.org
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Jun 16, 2026 at 1:46=E2=80=AFAM Jerome Brunet <jbrunet@baylibre.com=
> wrote:
>
> On sam. 28 mars 2026 at 20:37, Chen-Yu Tsai <wens@kernel.org> wrote:
>
> > On Wed, Jan 21, 2026 at 7:03=E2=80=AFPM Junhui Liu <junhui.liu@pigmoral=
.tech> wrote:
> >>
> >> The RTC module in the Allwinner A733 SoC is functionally compatible wi=
th
> >> the sun6i RTC, but its internal Clock Control Unit (CCU) has significa=
nt
> >> changes.
> >>
> >> The A733 supports selecting the oscillator between three frequencies:
> >> 19.2MHz, 24MHz, and 26MHz. The RTC CCU relies on hardware to detect
> >> which frequency is actually used on the board. By defining all three
> >> frequencies as fixed-clocks in the device tree, the driver can identif=
y
> >> the hardware-detected frequency and expose it to the rest of the syste=
m.
> >
> > No. The board device tree shall have the exact and correct frequency
> > defined in the external crystal device node. The operating system can
> > use the hardware-detected frequency to "fix" the in-system representati=
on
> > if it is off.
> >
> >> Additionally, the A733 RTC CCU provides several new DCXO gate clocks f=
or
> >> specific modules, including SerDes, HDMI, and UFS.
> >>
> >> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> >> ---
> >>  .../bindings/rtc/allwinner,sun6i-a31-rtc.yaml      | 38 +++++++++++++=
+++++++--
> >>  include/dt-bindings/clock/sun60i-a733-rtc.h        | 16 +++++++++
> >>  2 files changed, 52 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31=
-rtc.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.y=
aml
> >> index 9df5cdb6f63f..b18431955783 100644
> >> --- a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.ya=
ml
> >> +++ b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.ya=
ml
> >> @@ -26,6 +26,7 @@ properties:
> >>            - allwinner,sun50i-h6-rtc
> >>            - allwinner,sun50i-h616-rtc
> >>            - allwinner,sun50i-r329-rtc
> >> +          - allwinner,sun60i-a733-rtc
> >>        - items:
> >>            - const: allwinner,sun50i-a64-rtc
> >>            - const: allwinner,sun8i-h3-rtc
> >> @@ -46,11 +47,11 @@ properties:
> >>
> >>    clocks:
> >>      minItems: 1
> >> -    maxItems: 4
> >> +    maxItems: 6
> >>
> >>    clock-names:
> >>      minItems: 1
> >> -    maxItems: 4
> >> +    maxItems: 6
> >>
> >>    clock-output-names:
> >>      minItems: 1
> >> @@ -156,6 +157,38 @@ allOf:
> >>          - clocks
> >>          - clock-names
> >>
> >> +  - if:
> >> +      properties:
> >> +        compatible:
> >> +          contains:
> >> +            const: allwinner,sun60i-a733-rtc
> >> +
> >> +    then:
> >> +      properties:
> >> +        clocks:
> >> +          minItems: 5
> >> +          items:
> >> +            - description: Bus clock for register access
> >
> >> +            - description: 19.2 MHz oscillator
> >> +            - description: 24 MHz oscillator
> >> +            - description: 26 MHz oscillator
> >
> > No. There is only one input. As in there is only one set of pins for th=
e
> > DCXO. The inputs are the same as on R329 / A523. Just use that list.
> >
> >> +            - description: AHB parent for internal SPI clock
> >> +            - description: External 32768 Hz oscillator
> >> +
> >> +        clock-names:
> >> +          minItems: 5
> >> +          items:
> >> +            - const: bus
> >> +            - const: osc19M
> >> +            - const: osc24M
> >> +            - const: osc26M
> >> +            - const: ahb
> >> +            - const: ext-osc32k
> >> +
> >> +      required:
> >> +        - clocks
> >> +        - clock-names
> >> +
> >>    - if:
> >>        properties:
> >>          compatible:
> >> @@ -164,6 +197,7 @@ allOf:
> >>                - allwinner,sun8i-r40-rtc
> >>                - allwinner,sun50i-h616-rtc
> >>                - allwinner,sun50i-r329-rtc
> >> +              - allwinner,sun60i-a733-rtc
> >>
> >>      then:
> >>        properties:
> >> diff --git a/include/dt-bindings/clock/sun60i-a733-rtc.h b/include/dt-=
bindings/clock/sun60i-a733-rtc.h
> >> new file mode 100644
> >> index 000000000000..8a2b5facad73
> >> --- /dev/null
> >> +++ b/include/dt-bindings/clock/sun60i-a733-rtc.h
> >> @@ -0,0 +1,16 @@
> >> +/* SPDX-License-Identifier: GPL-2.0-only OR MIT */
> >> +
> >> +#ifndef _DT_BINDINGS_CLK_SUN60I_A733_RTC_H_
> >> +#define _DT_BINDINGS_CLK_SUN60I_A733_RTC_H_
> >> +
> >> +#define CLK_IOSC               0
> >> +#define CLK_OSC32K             1
> >> +#define CLK_HOSC               2
> >
> > The DCXO enable control has been present since at least the H6. We just
> > never added it, as we would never disable it anyway.
> >
> > If you compare the RTC clock trees of the A733 and A523, the only addit=
ion
> > besides the new gates seems to be the LOSC auto selection. But even tha=
t
> > is just an illusion, as the A523 has the same registers for that.
> >
> > One could say the A733 RTC is almost backward compatible to the A523, i=
f
> > not for the two fastboot registers the A523 has at 0x120 and 0x124.
> >
> > So I ask that you try to integrate the differences into the existing
> > driver and bindings. You can tweak and export internal clks if you
> > need.
>
> I'd like to help with that. I think it is doable but I have a question
> regarding the binding of the existing driver, more precisely their usage
> here:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/d=
rivers/clk/sunxi-ng/ccu-sun6i-rtc.c?h=3Dv7.1#n370
>
> Clock indexes are supposed to be stable in DT (AFAIK) but with the code
> linked the external 32k is at:
>
> * "ext-32k" - so index 3 - if "clock-names" is present
> * index 0 if clock names is not present
>
> ... but index 0 is supposed to be the bus clock according the binding
> doc, whether "clock-names" is there or not :/
>
> So what are those old r329 bindings ? is there a documentation defining
> them somewhere ?

You can look at

    8487614a8a8a dt-bindings: rtc: sun6i: Add H616, R329, and D1 support

In hindsight maybe the two bindings should be separate. The old SoCs
did not have all these clock inputs from the main clock controller.
The only input it could possibly take was the external 32k crystal.

> Cleaning that part would help with A733 addition in the existing driver
> I think

Yeah. Also, we can treat the bindings and drivers separately. We could
have two bindings but one common driver, or vice versa. As you pointed
out, the bindings are a bit messed up, so we could consider separating
them.

If we end up with separate binding header files, maybe we could use
a different prefix for the new ones so they don't collide? That way
the driver could maybe still be shared?

As for whether to share the headers, I think they should be treated
as part of the binding, so if the bindings are shared, then they can
be shared as well; if the bindings are separate, then they should be
completely separate files as well.


And sorry for the late reply.


Thanks
ChenYu

> >
> >> +#define CLK_RTC_32K            3
> >
> > AFAICT besides being an internal clock, this is also fed to GPIO for
> > debounce? We probably need to expose this on the A523 as well.
> >
> >
> > Thanks
> > ChenYu
> >
> >
> >> +#define CLK_OSC32K_FANOUT      4
> >> +#define CLK_HOSC_SERDES1       5
> >> +#define CLK_HOSC_SERDES0       6
> >> +#define CLK_HOSC_HDMI          7
> >> +#define CLK_HOSC_UFS           8
> >> +
> >> +#endif /* _DT_BINDINGS_CLK_SUN60I_A733_RTC_H_ */
> >>
> >> --
> >> 2.52.0
> >>
> >>
>
> --
> Jerome
>

