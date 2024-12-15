Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CA67E7716A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Dec 2024 13:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9DfcljKkBWCiMn19/qRi4mIorttXds7rFjmbFlhgdMg=; b=vXu9cvE10PZJoDeYf272vB0MO1
	bB4hg8DQB5iKOuI6DY+oGsGXWJ78a8lKc1Jo1nuTSetkDagR33Q2xbZfcwAEooUIh2gsm1IfKlYJA
	4f8f5YxA3e3jRTmAbxaz3nkimPa71vPEf+7QYNuYaQ766XBBLkas2a9Pu420TbOjpwuLR59OLOWuf
	g8tU2oID0llbzvAZHRoDCHfJiNtPblE9onPXp2sidMxR5mfLVoMCm3RFH/JEuO9jpKBHdQCjVGfgf
	CVCSpaZnYWAcBCWV1lSL7ndeI+CMmFiqsyO2CiCAhuXjRsZwstNivGUZtU4jvG60xBgwMrCq7jPze
	RkptrLkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMosa-00000007ypF-3CI3;
	Sun, 15 Dec 2024 13:41:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMorU-00000007yjD-1cdN
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Dec 2024 13:40:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8414611FB;
	Sun, 15 Dec 2024 05:41:05 -0800 (PST)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 730863F720;
	Sun, 15 Dec 2024 05:40:35 -0800 (PST)
Date: Sun, 15 Dec 2024 13:39:50 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Vasily Khoruzhick <anarsoul@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, Roman Beranek
 <me@crly.cz>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 0/3] arm64: allwinner: a64: fix video output on Pinebook
Message-ID: <20241215133950.27e5877a@minigeek.lan>
In-Reply-To: <20241215053639.738890-1-anarsoul@gmail.com>
References: <20241215053639.738890-1-anarsoul@gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241215_054044_484308_EB2E0AA1 
X-CRM114-Status: GOOD (  22.60  )
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

On Sat, 14 Dec 2024 21:34:56 -0800
Vasily Khoruzhick <anarsoul@gmail.com> wrote:

Hi Vasily,

thanks for tracking this issue down and sending the fixes!

> Since commit ca1170b69968 ("clk: sunxi-ng: a64: force select PLL_MIPI in TCON0 mux"),
> TCON0 clock parent is always set to PLL_MIPI, but unfortunately it breaks
> video output on Pinebook.
> 
> I did an experiment: I manually configured PLL_MIPI and PLL_VIDEO0_2X
> to the same clock rate and flipped the switch with devmem. Experiment clearly
> showed that whenever PLL_MIPI is selected as TCON0 clock parent, the video
> output stops working.

That is good info, together with what Roman reported in that patch
mentioned above it seems to confirm that the parent clock selection
also determines the output path of TCON0.
Since there does not seem to be another register or switch setting
the path (ignoring the pinmux), I think a DT solution is appropriate
here, and assigned-clock-parents is the right way to go.

So the patch series looks good to me in general, but we thought that of
Roman's series as well, so I would really like to see a Tested-by: from
a Pinephone user and ideally a confirmation from Roman that this still
works for him.

Also I second Dragan's comments about copying the rationale into at
least the commit messages (if not in comments). Having explanations
in the cover letter is good, but having it in the git repo is much
better - as the cover letter will only be in the email archives.

Cheers,
Andre
 
> 
> To fix the issue, I partially reverted mentioned commit and added explicit
> TCON0 clock parent assignment to device tree. By default, it will be
> PLL_MIPI, and the only users with RGB output - Pinebook and Teres-I will
> override it in their dts.
> 
> Vasily Khoruzhick (3):
>   dt-bindings: clock: sunxi: Export PLL_VIDEO_2X and PLL_MIPI
>   arm64: dts: allwinner: a64: explicitly assign clock parent for TCON0
>   clk: sunxi-ng: a64: stop force-selecting PLL-MIPI as TCON0 parent
> 
>  arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts |  2 ++
>  arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts  |  2 ++
>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi         |  2 ++
>  drivers/clk/sunxi-ng/ccu-sun50i-a64.c                 | 11 -----------
>  drivers/clk/sunxi-ng/ccu-sun50i-a64.h                 |  2 --
>  include/dt-bindings/clock/sun50i-a64-ccu.h            |  2 ++
>  6 files changed, 8 insertions(+), 13 deletions(-)
> 


