Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89F97C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 18:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IY5J62XlxijCckyZ/pkjNOZZ3YBU4KFWYGvD0yPE7dA=; b=tKdQbYP3X+bVHyj07DKSv8YeAL
	RunmSujhfxUp9GMDt1OeOlMW4ncvTpJQel09OALYwnQHhTAWFREPTuYZcw4KPVHuUOqu76ZzKMbmF
	l8LLp8QUVIUsuObQX0Kfdr3sJ2uCJvuZfnNvEt5I1WNRdDD2OHiGUP4Q791Kfc+ZJi/pEOPoZ6JzY
	ILWPb5dCGRUPvtw9000S3/bKgTOu/ohqdHf4gmpGG7MoFXs+DemmmtwWwLcs/K3bWeJHEkF5dKIro
	G80Aw9AajoZA6Izb2K7H0N6X9oHQeER+uvIZ2JCiSxaqwAVkUEAlJ8tv9lzfeREQLSW/qYqzfd2uk
	SNneXn6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts4Zw-00000006fNW-3HMA;
	Tue, 11 Mar 2025 18:43:48 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts4HY-00000006cGH-1tuA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 18:24:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 21EC7A4614D;
	Tue, 11 Mar 2025 18:19:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA252C4CEEC;
	Tue, 11 Mar 2025 18:24:46 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id 6624F5FA01;
	Wed, 12 Mar 2025 02:24:43 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20250307002628.10684-1-andre.przywara@arm.com>
References: <20250307002628.10684-1-andre.przywara@arm.com>
Subject: Re: [PATCH v4 00/14] clk: sunxi-ng: add A523 clock support
Message-Id: <174171748337.1740144.15952522850275241981.b4-ty@csie.org>
Date: Wed, 12 Mar 2025 02:24:43 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_112448_563980_EFFBA1A0 
X-CRM114-Status: GOOD (  14.11  )
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

On Fri, 07 Mar 2025 00:26:14 +0000, Andre Przywara wrote:
> this is the fourth drop of the series introducing basic clock support for
> the Allwinner A523 family of SoCs, comprising A523, A527, T527, H728. [1]
> This times just a small rename of a macro name, and fixing the DT
> binding, where the separate patches for the two CCUs got merged into
> one. For a more detailed changelog, see below.
> 
> *************
> Please note that the clock numbers changed compared to v1 and v2, (but
> not against v3) so DTs from that older era cannot be used anymore with
> this driver: you have to update the DTB. Just copying the binding header
> and recompiling the DTB should do the trick, since the symbols stayed
> mostly the same, at least as far they are used in the basic DTs we use
> today.
> *************
> 
> [...]

Applied to clk-for-6.15 in git@github.com:linux-sunxi/linux-sunxi.git, thanks!

[01/14] clk: sunxi-ng: mp: introduce dual-divider clock
        commit: af7a221c12137271e8c31bc0c205ef4c57e89b4c
[02/14] clk: sunxi-ng: mp: provide wrappers for setting feature flags
        commit: 24ad1a7e8a3eca04dfe225b3e7935ab4ec326bb8
[03/14] clk: sunxi-ng: Add support for update bit
        commit: 38ea575784d3121b9c2e4c0bf425bc669e1c5e1b
[04/14] dt-bindings: clk: sunxi-ng: document two Allwinner A523 CCUs
        commit: 17bed1817f11b7d3c4ea0b38254f1bab78531a3d
[05/14] clk: sunxi-ng: Add support for the A523/T527 CCU PLLs
        commit: 04f6ff49525a8ba8ef3297de3e1a0e15ea3f5102
[06/14] clk: sunxi-ng: a523: Add support for bus clocks
        commit: 2d47dae9398135a48b58da9b059c23027b0e345e
[07/14] clk: sunxi-ng: a523: add video mod clocks
        commit: 4b759de121c46c693b61d6a22bf77d62333838e9
[08/14] clk: sunxi-ng: a523: add system mod clocks
        commit: 9bc061e57b4d97e187a767e45bff06b63f2a3126
[09/14] clk: sunxi-ng: a523: add interface mod clocks
        commit: dd19c52e686eb9f66816cd55fddfae8c7be2e6ea
[10/14] clk: sunxi-ng: a523: add USB mod clocks
        commit: 5fd7421770fb31a1ec35dd2400a849598466ac3b
[11/14] clk: sunxi-ng: a523: remaining mod clocks
        commit: 680f52d723e2ee9d97d167040eacc6a3af0b9cda
[12/14] clk: sunxi-ng: a523: add bus clock gates
        commit: 4548c0414839989be821e106b5128d5e7e13f2a4
[13/14] clk: sunxi-ng: a523: add reset lines
        commit: 9c8d960c13ab41c7e678eab5396b9258eaf8a159
[14/14] clk: sunxi-ng: add support for the A523/T527 PRCM CCU
        commit: 575464821eb0f72c86d93794a79900a853b256b5

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>


