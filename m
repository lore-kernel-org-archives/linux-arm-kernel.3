Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6D9DC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Jul 2025 12:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HkqkLUUHoHn+FGLSeGS0ggYifLS1t97d7N/03d5pqQ0=; b=fYwJKatxkvJlCz
	Pg0AAcqIvx00fz9Xpy0mpU5FBcG9SgA43nvOrtsYFxdu4HmtTcV+KpG0SjgjVygVzW5/COQNB/8eH
	6iWK5+rKUfiwSFLIZCVT5UkOOwpRmmvSunZR86MZyYn2jhhkh8VkIxYCSdyCnT4reACRnygObJ/CU
	oZ1ZDMcyClmjIHHqEkA03fmuxjdLVVDarORrTZxdS5bQ82doVB1G5vXLyUNSTI6JJ7/jMjhE119BT
	LFrVQcPYQQ5v/Xre5rSd7d28zj6G1wVVoZDNeHNqJH5dcsnJ6i1GBlfWrizQCnY3kWfB7sm4S1dBC
	EqqxrdgTPloLR7bdAoIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uY1vB-0000000GUNj-1stA;
	Sat, 05 Jul 2025 12:23:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uY1sq-0000000GUIy-3gqg
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Jul 2025 12:20:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0D9225C5288
	for <linux-arm-kernel@lists.infradead.org>; Sat,  5 Jul 2025 12:20:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DAC3C4CEE7
	for <linux-arm-kernel@lists.infradead.org>; Sat,  5 Jul 2025 12:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751718043;
	bh=w6JVrjNC7s+w46VT5qoV9Am1SjT66OpW5xDi+rFdRiw=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=NO97l4Uh1TnQv0IgibQlK8jSxdy5+saaJFnqpoZJ32HXznZja1vuRpy6IEPbvBFjn
	 U9ZDGiwSWzANC3fWbivFHWhkM9K2BrjwbNV6Lf+0PmbSRMSrPyZ8ZNdRL6pCWZnvJ6
	 3I6skH+H3KsDvrEFB1VYPUU5v8nQDvn1vTUsZ/96mjDKVuanBfyzoU2bB3XD6felBG
	 ksweZSvZdDnorhAx4dzGBd6rWikZ07JTWcl4q0ueZeSjKIGqgppB6oMFevOQeU2CbZ
	 YCYMZpVTcqVfDCZQQQ9JlQs4R4kkCWpKuI634EhdyLXGu83HPKjWbs4gCXuNyC1bMj
	 5Dz37HNSncqpA==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-32f1df5b089so2351451fa.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Jul 2025 05:20:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXiYcLGQ72AZAV33G9qN6r3pho1BaxsFj4mLdnPpTOclRoZpou6Bj2a/KNKtl/bseqZMGZ7yH0eG78yN/0TZhNp@lists.infradead.org
X-Gm-Message-State: AOJu0YxlM502q09C9ObWb+HNxRgePF7lRQ4SQn31ccWjZihXoBRU+E1P
	tqaN2HQuGLA7cvCwCciArZqXbxWDP7FgiuLQ8tLspSs/Cmu42eHi2cfv7+UYYRAyd4HFPFSXfQS
	9i0hmhXCfysuknqEx3hMsbNlnI1fJAgw=
X-Google-Smtp-Source: AGHT+IE2FeBYZ8ZmnNW0SV5XaswcVwlOSGE5JRdJuwk2CAsSkNvjgDvq3feTe9kdVd6rU22ciEC8vE3JOGVj9L4sHqY=
X-Received: by 2002:a2e:ae1c:0:b0:32a:74db:f3c1 with SMTP id
 38308e7fff4ca-32f19ad68d4mr4847691fa.24.1751718042043; Sat, 05 Jul 2025
 05:20:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250628054438.2864220-1-wens@kernel.org> <20250705083600.2916bf0c@minigeek.lan>
In-Reply-To: <20250705083600.2916bf0c@minigeek.lan>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sat, 5 Jul 2025 21:20:29 +0900
X-Gmail-Original-Message-ID: <CAGb2v64My=A_Jw+CBCsqno3SsSSTtBFKXOrgLv+Nyq_z5oeYBg@mail.gmail.com>
X-Gm-Features: Ac12FXyj5gh1iUI7aiMezVsM5cn9-cQcjwImIe4vvpZrS6Hd_ny1T0St79tYcpI
Message-ID: <CAGb2v64My=A_Jw+CBCsqno3SsSSTtBFKXOrgLv+Nyq_z5oeYBg@mail.gmail.com>
Subject: Re: [PATCH net 0/2] allwinner: a523: Rename emac0 to gmac0
To: Andre Przywara <andre.przywara@arm.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250705_052045_004350_3C70E292 
X-CRM114-Status: GOOD (  40.95  )
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

On Sat, Jul 5, 2025 at 4:37=E2=80=AFPM Andre Przywara <andre.przywara@arm.c=
om> wrote:
>
> On Sat, 28 Jun 2025 13:44:36 +0800
> Chen-Yu Tsai <wens@kernel.org> wrote:
>
> Hi,
>
> > From: Chen-Yu Tsai <wens@csie.org>
> >
> > Hi folks,
> >
> > This small series aims to align the name of the first ethernet
> > controller found on the Allwinner A523 SoC family with the name
> > found in the datasheets. It renames the compatible string and
> > any other references from "emac0" to "gmac0".
>
> To be honest I am not a big fan of those cosmetic renames when it
> touches DT files. It seems to not break compatibility in this case,
> since we don't use the specific compatible string, but leaves a bitter
> taste anyway. Also I pick DT patches out of -rc releases for U-Boot,
> and did so internally already, so it's not without churns.

I'd say that new stuff shouldn't really be considered stable until
it is actually released, hence why I wanted to get this series merged
now. Picking from an -rc release is a tradeoff of getting new stuff
faster vs having something changed or reverted during the -rc process.
I'm sorry that it went the other way this time.

> So is this really necessary, and what is the purpose of this patch?

It's really about aligning the names used throughout the kernel with
the ones seen in the datasheet.

> I am fine with using GMAC for the GMAC200 part in the SoC, but the A64,
> H6, H616, A133 all use the same IP - as the fallback compatible proves -
> and they call it all EMAC.

There's also an EMAC in the A10 and A20 that only does up to 100 Mbps,
and there's no lineage there. Also, not all datasheets for SoCs with
this gigabit-capable EMAC call it the EMAC. Off the top of my head, I
believe the R40 calls it the GMAC. And the R40's compatible string
in this binding even uses the string "gmac".

So it's really whatever Allwinner wants to call it. I would rather have
the names follow the datasheet than us making some scheme up. We just
have to remember that this funky gigabit-capable Ethernet controller
is this piece of hardware.

Hope that explains things.

Thanks
ChenYu

> That's not a NAK, but just wanted to bring this up.
>
> Cheers,
> Andre.
>
> > When support of the hardware was introduced, the name chosen was
> > "EMAC", which followed previous generations. However the datasheets
> > use the name "GMAC" instead, likely because there is another "GMAC"
> > based on a newer DWMAC IP.
> >
> > The first patch fixes the compatible string entry in the device tree
> > binding.
> >
> > The second patch fixes all references in the existing device trees.
> >
> > Since this was introduced in v6.16-rc1, I hope to land this for v6.16
> > as well.
> >
> > There's a small conflict in patch one around the patch context with
> >
> >     dt-bindings: net: sun8i-emac: Add A100 EMAC compatible
> >
> > that just landed in net-next today. I will leave this patch to the net
> > mainainers to merge to avoid making a bigger mess. Once that is landed
> > I will merge the second patch through the sunxi tree.
> >
> >
> > Thanks
> > ChenYu
> >
> >
> > Chen-Yu Tsai (2):
> >   dt-bindings: net: sun8i-emac: Rename A523 EMAC0 to GMAC0
> >   arm64: dts: allwinner: a523: Rename emac0 to gmac0
> >
> >  .../devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml  | 2 +-
> >  arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi              | 6 +++---
> >  arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts     | 4 ++--
> >  arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts     | 4 ++--
> >  4 files changed, 8 insertions(+), 8 deletions(-)
> >
>

