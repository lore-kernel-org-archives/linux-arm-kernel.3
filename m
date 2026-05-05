Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4AF0CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 16:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KfAZMsgRa0hd95LG3ZQy3NrFxgXPiQ+9pGnm3p6tz6o=; b=B8Oj3wsOI8rIGx+mEpKdAOlcMu
	QiPaTfxsq1CjWcltIXhckn1qAcJhE2w/TV+HyNmeokhpZy0sW/o5XmFOo/eD6oftTI4Kvp4hp9/Ii
	sHGqtWvnVqaTR4E/JhWW0l3Ivl4F8PKeKl2UGpEeAT9jhDBCfbZ1Sn9ILau8Px91E1ukvELMKWuf7
	/ZBYZZb81kAgMBOeCl7xmg2l/KUZfl2vDnXACXb/0+wSgiXYsWQnT4UKiehhgdwx5RyF9Rjp0cyoP
	6flpGipNP+H+RmbQ3xsiMGpvoJlxSpsD37AVrc+3W8XDAIigjzX6MFp6p2uxbVUkHyuJs8W/Gi+Z2
	P+U7fmeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIW0-0000000GrOS-02WY;
	Tue, 05 May 2026 16:20:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIVy-0000000GrNn-2P3v
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 16:20:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 887F21C2B;
	Tue,  5 May 2026 09:20:48 -0700 (PDT)
Received: from ryzen.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0581E3F763;
	Tue,  5 May 2026 09:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777998053; bh=C8efCugq5/wF4si+DgA/qFTAdUR0kg1MpKn17jk6yuM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=FnqFTI+oE0YtcnjRCbvYHUF8oZI18TcjaZur9kjU8zGkkPPaFMnJykcV6ZwmQYroB
	 QbYiwMfaZHg/ifnCvZ4ddY0gQIN1gwFUQRdBnC6UlAhZdUMKM4Lyw2RZVYYj4YV56p
	 0EZDUcGxKllp0vr0FwW5BhjWUmsBTMH/KDsod0II=
Date: Tue, 5 May 2026 18:20:17 +0200
From: Andre Przywara <andre.przywara@arm.com>
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 08/14] clk: sunxi-ng: a523: add system mod clocks
Message-ID: <20260505182017.10d71c11@ryzen.lan>
In-Reply-To: <afoRe6DI4GJIVtg4@shepard>
References: <20250307002628.10684-1-andre.przywara@arm.com>
	<20250307002628.10684-9-andre.przywara@arm.com>
	<afoRe6DI4GJIVtg4@shepard>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_092054_672968_2EC82E2E 
X-CRM114-Status: GOOD (  22.09  )
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

On Tue, 5 May 2026 17:49:15 +0200
Paul Kocialkowski <paulk@sys-base.io> wrote:

Hi Paul,

> On Fri 07 Mar 25, 00:26, Andre Przywara wrote:
> > Add the clocks driving some core system related subsystems of the SoC:
> > the "CE" crypto engine, the high speed timers, the DRAM and the associated
> > MBUS clock, and the PCIe clock.
> > 
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > ---
> >  drivers/clk/sunxi-ng/ccu-sun55i-a523.c | 135 +++++++++++++++++++++++++
> >  1 file changed, 135 insertions(+)
> > 
> > diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
> > index 17a4ffc0b7f52..c59f3f789d052 100644
> > --- a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
> > +++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c  
> 
> [...]
> 
> > +static const struct clk_parent_data hstimer_parents[] = {
> > +	{ .fw_name = "hosc" },
> > +	{ .fw_name = "iosc" },
> > +	{ .fw_name = "losc" },
> > +	{ .hw = &pll_periph0_200M_clk.hw },
> > +};
> > +static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(hstimer0_clk, "hstimer0",
> > +				       hstimer_parents, 0x730,
> > +				       0, 0,	/* M */  
> 
> I was looking at the A523 ccu code and see lots of
> SUNXI_CCU_MP_DATA_WITH_MUX_GATE with no M.
> 
> Was there a particular reason for not using SUNXI_CCU_M_DATA_WITH_MUX_GATE
> instead? It would surely be less confusing.
> 
> One difference would be that the ops end up as ccu_div_ops instead of
> ccu_mp_ops. Do you need ccu_mp_ops for some reason?

Yes, please double check that (as it *is* confusing), but to me it
looks like the CCU_M_ version has just a pure divider, whereas in
CCU_MP_ the P is a *shift*, and the M a divider. Those timer clocks just
feature a shift, which I don't think we have seen before?

Cheers,
Andre

