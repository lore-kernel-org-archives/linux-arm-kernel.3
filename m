Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F89BD3F08F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 16:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sb3AGPYrr0/fo4jbw4irixmJe3vsgCbc9Ej4of+Z+E4=; b=gYrGa3OfvqtMcjWn44A4uksoal
	S+ERlIscSUVwSHNyPHQh3ffhnvsZRL8h9ogZsWiV0SsSDd9WLV/DJ/vsqXTo5fiWQHTeMGwAwddC/
	CgXj5zne8qQFFbXYTzuTvsSXJDYeey7HNHZyzMm60TMnjtIiz+Ta5LiLKshJuiDJM1D9hSnqnpmUt
	BV4PV9FlDz2rjKTtdokl72cy2y8Q5Sjj6UYKhbg6bXCad9npXXYKDixxQtlFaQL3wlyr6EfjdUP7o
	YpA92A9q/U6z9ifT1/ZUcdLyXsNNK9Z9Ec3I7dx1fDOV1il5SZLNveP71tSj4I+R+OjXGV7xoApLx
	P4d6uyoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl82q-0000000GLCS-3UnT;
	Wed, 28 Jan 2026 16:05:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl82p-0000000GLC1-1vRj;
	Wed, 28 Jan 2026 16:05:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=sb3AGPYrr0/fo4jbw4irixmJe3vsgCbc9Ej4of+Z+E4=; b=neYOycGb7SC4n4UMsYhafkeCRs
	gQF/vD+wubqkseUpJiHX/uRyQXG1Ubm5gCMA6lzOzqZyhU5WO+dQbOFE4WAkRk6gRWmer0I31Du/W
	P+SA6BQVhVSPqsj07VbFWf7K97cQpJ7PAU+g9xx5CnoUoYZgdV/qkTfS9QDlTSbar9JZYEPBI/qPK
	F13cEai211Lfk9q7wra+fLjFzuj0EZqsRVX/ajsirr5C9Ny2iK6QZaDKXmf7yk36Hsx/y9P36cQkm
	NY0K+YcEFHESJyOspNB1PwD0lAWYesU5sRHAM7MTQYhvoQGsajUfxxixQ4xXdv5gRT+CBiq7LF8Ji
	LrPMilgQ==;
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl82l-00000008tqZ-2uuZ;
	Wed, 28 Jan 2026 16:05:26 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1769616302; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Pvqg3/gTn76an7M2H0plJ+A/j0grY9QpWSR+zfMFtvdWHwgv20NMo0gexCxzJcmX+dqeRI7/aqalvmsb/Tg/38Zy0Ej/J8l4YWq1awgBRqWF3CNnnKfHadiC324aoDz05ruxQrDDYBylbQ0uWQOxznCSx8ezv4O7dF6NIwbd5/c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1769616302; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=sb3AGPYrr0/fo4jbw4irixmJe3vsgCbc9Ej4of+Z+E4=; 
	b=huaMjNg+D8TELmKporfZ8/M4DDDtQz4QI9YmdjJRBq4sxqm/zQg0mKsVbJ+Ve6mufwVyq9itV8Urlr/z9CDAWj04iEhgyWs1aA1JOH8Gg7E1M7S9DKLTwmiEkuI1ZZlBxXG/X7igu4Uo7UAjjGCcIFypz3WRgXb7R/lP1d9W0/c=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769616302;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=sb3AGPYrr0/fo4jbw4irixmJe3vsgCbc9Ej4of+Z+E4=;
	b=UF+V3FD7yc6+2BlnxYazVLbjwN7ep+KvPNlM/7z/vII5PVMAjtlM4PnfBxYw4sfa
	SVZL0HcDwpQVzVXTZ8FhHpKjU2nisCjqpLlNPc/EGgQL0ZEajUfL62bAWTB+Hc02OSb
	Ntiv/tE5rO4TxW2gXfWEYl6Od+8dTiHrEyrMKmIM=
Received: by mx.zohomail.com with SMTPS id 1769616300860635.7323383170847;
	Wed, 28 Jan 2026 08:05:00 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Mark Brown <broonie@kernel.org>
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
Date: Wed, 28 Jan 2026 17:04:55 +0100
Message-ID: <3745487.e9J7NaK4W3@workhorse>
In-Reply-To: <daa1906b-a112-4158-aec2-ad1d29b4fe35@sirena.org.uk>
References: <20251010-mtk-pll-rpm-v3-0-fb1bd15d734a@collabora.com>
 <6678782.DvuYhMxLoT@workhorse>
 <daa1906b-a112-4158-aec2-ad1d29b4fe35@sirena.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_160524_016143_E015307C 
X-CRM114-Status: GOOD (  20.38  )
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

On Wednesday, 28 January 2026 15:47:08 Central European Standard Time Mark Brown wrote:
> On Wed, Jan 28, 2026 at 03:09:46PM +0100, Nicolas Frattaroli wrote:
> > On Wednesday, 28 January 2026 00:14:29 Central European Standard Time Mark Brown wrote:
> 
> > > Do you have a debugging patch we could run which would say which clocks
> > > are impacted?  I guess it's more of an issue for the platforms that give
> > > no output but for at least Avenger96 I was getting earlycon output.
> 
> > Try this one
> 
> For the Avenger96 that says:
> 
> [    0.347816] __clk_core_init: enabling parent ck_hse for ck_per
> [    0.352230] __clk_core_init: disabling parent ck_hse for ck_per
> [    0.358207] __clk_core_init: enabling parent pll1_p for ck_mpu
> [    0.364005] __clk_core_init: disabling parent pll1_p for ck_mpu
> 
> https://lava.sirena.org.uk/scheduler/job/2412562#L563
> 

Okay, on this one, there may be a problem in the clock tree.
ck_mpu is marked CLK_IS_CRITICAL, but its parent, pll1_p, is not. Clock
core doesn't seem to check whether any children of a clock are marked as
critical before disabling it.

I'm not super familiar with the intended semantics of critical clocks.
If we need to manually mark all parents of critical clocks as critical
as well, then a (potentially partial) fix for the Avenger96 might be:

---
diff --git a/drivers/clk/stm32/clk-stm32mp1.c b/drivers/clk/stm32/clk-stm32mp1.c
index 2d9ccd96ec98..6bf3fad1e0dc 100644
--- a/drivers/clk/stm32/clk-stm32mp1.c
+++ b/drivers/clk/stm32/clk-stm32mp1.c
@@ -1783,12 +1783,12 @@ static const struct clock_config stm32mp1_clock_cfg[] = {
 	PLL(PLL4, "pll4", ref4_parents, 0, RCC_PLL4CR, RCC_RCK4SELR),
 
 	/* ODF */
-	COMPOSITE(PLL1_P, "pll1_p", PARENT("pll1"), 0,
+	COMPOSITE(PLL1_P, "pll1_p", PARENT("pll1"), CLK_IS_CRITICAL,
 		  _GATE(RCC_PLL1CR, 4, 0),
 		  _NO_MUX,
 		  _DIV(RCC_PLL1CFGR2, 0, 7, 0, NULL)),
 
-	COMPOSITE(PLL2_P, "pll2_p", PARENT("pll2"), 0,
+	COMPOSITE(PLL2_P, "pll2_p", PARENT("pll2"), CLK_IS_CRITICAL,
 		  _GATE(RCC_PLL2CR, 4, 0),
 		  _NO_MUX,
 		  _DIV(RCC_PLL2CFGR2, 0, 7, 0, NULL)),
@@ -1803,7 +1803,7 @@ static const struct clock_config stm32mp1_clock_cfg[] = {
 		  _NO_MUX,
 		  _DIV(RCC_PLL2CFGR2, 16, 7, 0, NULL)),
 
-	COMPOSITE(PLL3_P, "pll3_p", PARENT("pll3"), 0,
+	COMPOSITE(PLL3_P, "pll3_p", PARENT("pll3"), CLK_IS_CRITICAL,
 		  _GATE(RCC_PLL3CR, 4, 0),
 		  _NO_MUX,
 		  _DIV(RCC_PLL3CFGR2, 0, 7, 0, NULL)),
---

I just looked for CLK_IS_CRITICAL clocks in that file that have the
CLK_OPS_PARENT_ENABLE flag, and marked their PLL parents as critical
as well.

An alternate approach would be to skip the parent enable/disable pair
in the problematic patch in __clk_core_init for clocks that are marked
as critical, because if the parent wasn't on for a critical clock then
we wouldn't be in that function, we would be dead.

Kind regards,
Nicolas Frattaroli



