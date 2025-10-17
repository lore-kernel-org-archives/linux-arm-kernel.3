Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3498ECCD195
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 12:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tVS1yjlCPcljk4srWv5SXmg1dIE2H/RRXTrB6Ic2heM=; b=KS+DqL0mS7D6tdWKLQrHiEZ4Yz
	mpw54JEwfGR2LoRzmC8CONmRzgqWjc5Eak0Ylw3uni/yhyAahTy7cvEQQNmzXfapyNWTj0S5AbUqY
	1xaeAyNS/MEUXYCGr+ARmUjDLIZOjK8bOsqbieAohv6bDU7D1rH6n8jGDa8Dfk7HcXgekahAutzRs
	+CKGwvWMvI7PKTsVedqz0vv2JTSLLSt3Hl4GxvH1Uoe3GRUAOr29Go0mMm9K+DlytTon3wA7Jh4s9
	Dvz4Id5VLXc3Ar2gDGL9ORgkDBE0TEkywzragOArMnQoNOZqH4xutn/hgwlwD/WxBHbmp3r8KOwQN
	U0qTE1PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9jTX-00000007nII-3ldF;
	Fri, 17 Oct 2025 12:22:27 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9jTU-00000007nHF-3aBI;
	Fri, 17 Oct 2025 12:22:26 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1760703723; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UMAmICaP0DmVjcDJq0w9peZBvM7IWGqT6pnW/tElYIgtQjckhuM0F0kgxg+7Uy3HIThBhmQ49GYS+aZL+VbQR7/kph9ctT1stl+SlqT5yCJz+W2j8D2pMeNXXehKek03JjLJtP4gDvVaLL4DaAjEbJnqMFagef4FsyVDaLl0Yg0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1760703723; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=tVS1yjlCPcljk4srWv5SXmg1dIE2H/RRXTrB6Ic2heM=; 
	b=j4OoqGZ5DTFOsmf6cr1Emx6wGIfS4Sgu/rFqEX15FgSMns07IsUr6/PYK5okE9PtdtnZSe4jhQC/Vh2acBYC8HZdkTKNUJaHxCzOoU7Lhne2dbHZV5CaZK5oHGa1jP/79gH6XX22jgM/hNlQ8UMyHaD35+aYMIff/5DtiHBAWrQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1760703723;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=tVS1yjlCPcljk4srWv5SXmg1dIE2H/RRXTrB6Ic2heM=;
	b=k8GMJlorX+Qdqv2XyU6q9law0BrDuTrEXukxDoN9+17ciGI0tmTwpxw53XC4zKDy
	f4bpf3dvF4HiEO26sKZilcsYfau85A9okjutkAfx9MLsVbyBf7kRQygXWmaAF+Ts190
	QltcMvkdhpDf0r9NAsDMwIDXnB7V96zLzZNFUhAo=
Received: by mx.zohomail.com with SMTPS id 1760703720868631.1429498538683;
	Fri, 17 Oct 2025 05:22:00 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Brian Masney <bmasney@redhat.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Dong Aisheng <aisheng.dong@nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Yassine Oudjana <y.oudjana@protonmail.com>,
 Laura Nao <laura.nao@collabora.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>,
 Chia-I Wu <olvaffe@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>,
 kernel@collabora.com, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 1/5] clk: Respect CLK_OPS_PARENT_ENABLE during recalc
Date: Fri, 17 Oct 2025 14:21:55 +0200
Message-ID: <3342669.irdbgypaU6@workhorse>
In-Reply-To: <aPFbDl_JKyDay1S5@redhat.com>
References: <20251010-mtk-pll-rpm-v3-0-fb1bd15d734a@collabora.com>
 <20251010-mtk-pll-rpm-v3-1-fb1bd15d734a@collabora.com>
 <aPFbDl_JKyDay1S5@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_052224_949747_C6823252 
X-CRM114-Status: GOOD (  32.35  )
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

On Thursday, 16 October 2025 22:52:30 Central European Summer Time Brian Masney wrote:
> Hi Nicolas,
> 
> On Fri, Oct 10, 2025 at 10:47:09PM +0200, Nicolas Frattaroli wrote:
> > When CLK_OPS_PARENT_ENABLE was introduced, it guarded various clock
> > operations, such as setting the rate or switching parents. However,
> > another operation that can and often does touch actual hardware state is
> > recalc_rate, which may also be affected by such a dependency.
> > 
> > Add parent enables/disables where the recalc_rate op is called directly.
> > 
> > Fixes: fc8726a2c021 ("clk: core: support clocks which requires parents enable (part 2)")
> > Fixes: a4b3518d146f ("clk: core: support clocks which requires parents enable (part 1)")
> > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > ---
> >  drivers/clk/clk.c | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> > 
> > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > index 85d2f2481acf360f0618a4a382fb51250e9c2fc4..1b0f9d567f48e003497afc98df0c0d2ad244eb90 100644
> > --- a/drivers/clk/clk.c
> > +++ b/drivers/clk/clk.c
> > @@ -1921,7 +1921,14 @@ static unsigned long clk_recalc(struct clk_core *core,
> >  	unsigned long rate = parent_rate;
> >  
> >  	if (core->ops->recalc_rate && !clk_pm_runtime_get(core)) {
> > +		if (core->flags & CLK_OPS_PARENT_ENABLE)
> > +			clk_core_prepare_enable(core->parent);
> > +
> >  		rate = core->ops->recalc_rate(core->hw, parent_rate);
> > +
> > +		if (core->flags & CLK_OPS_PARENT_ENABLE)
> > +			clk_core_disable_unprepare(core->parent);
> > +
> >  		clk_pm_runtime_put(core);
> >  	}
> >  	return rate;
> 
> clk_change_rate() has the following code:
> 
> 
>         if (core->flags & CLK_OPS_PARENT_ENABLE)
>                 clk_core_prepare_enable(parent);
> 
> 	...
> 
>         core->rate = clk_recalc(core, best_parent_rate);
> 
> 	...
> 
>         if (core->flags & CLK_OPS_PARENT_ENABLE)
>                 clk_core_disable_unprepare(parent);
> 
> clk_change_rate() ultimately is called by various clk_set_rate
> functions. Will that be a problem for the double calls to
> clk_core_prepare_enable()?

I don't see how multiple prepares are a problem as long as they're
balanced.

> 
> Fanning this out to the edge further is going to make the code even
> more complicated. What do you think about moving this to
> clk_core_enable_lock()? I know the set_parent operation has a special
> case that would need to be worked around.

__clk_core_init also needs special code in that case, as it calls the
bare recalc_rate op with no clk_core_enable_lock beforehand. It's also
wrong, in that recalc_rate does not necessitate the clock being on as
far as I'm aware. (if it did, this wouldn't be a problem in the first
place, as enabling it would enable the parent as well). Changing the
semantics of clk_recalc, and therefore clk_get_rate, to also enable
the clock, would be a major change in how the common clock framework
functions.

In my case, the __clk_core_init callback was the one that crashed,
so it really needs to happen there, and I really don't want to
refactor every location where `CLK_OPS_PARENT_ENABLE` is used for
a bugfix just to avoid potentially checking the same flag twice.

Having `CLK_OPS_PARENT_ENABLE` cleaned up such that every clk op
that has potential register access is never directly called by the
clk core except for one place, an accessor function that does both
pmdomain and `CLK_OPS_PARENT_ENABLE` checks, would be nice, e.g.
by keeping the clk_recalc change and then having __clk_core_init
call clk_recalc instead of the recalc op directly. But then the
__clk_core_init logic needs further refactoring as well.

I'm not sure I want to do that in this series, because it's quite
a bit different from just adding the missing check and parent
toggling, and has the chance of me introducing subtle logic bugs
in what is supposed to be a bugfix.

> 
> Brian
> 
> 

Kind regards,
Nicolas Frattaroli



