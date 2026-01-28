Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6387D3F068
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 14:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iMbNGVhll/+ocb6IszXEkRjXM+PIU7cVCloG+GE0bCE=; b=Y1R6tDaPwaxZwCht6Pij5E/6ed
	JyRn22O7SAjJMXVA4nO/6RsqS8I4OhJKXy8W5Ci1GeQ7TsLaDlNtFJ6hdpUWhfBd7kq9gyya9DpJI
	csU/f196rk8J/VvfDyown9uNAPXQm8vH9mObuu3B8sxVCBoj8O8XGeJFym5rBRcxAQ97gxsxrUUY7
	M/G0j3yDcwd8UeRgYiL+JkXDUcR1r1eKOiRpR+K70hLTEIMo2owLr0/PPBfkLvuQglmv8PxsyQ2yk
	CqxRna6Vx2N9j9LUW+sWGkjgWzVtl0p/55JdchTV7Qpa07OTZzlUoC6tj7o766NT5K1uBobY8ppDz
	dBZqOncg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl6FK-0000000G8t1-2GiW;
	Wed, 28 Jan 2026 14:10:14 +0000
Received: from sender4-pp-e108.zoho.com ([136.143.188.108])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl6FH-0000000G8sX-1C2g;
	Wed, 28 Jan 2026 14:10:12 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1769609393; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=M7VdwtgmLpTPD+XdXfAf+6/rDXlXHTkaHk8YL0Auv/F2RuipqxBlAJ31ELa36PQ+t4p73lVxahc52mnyLF+7srM5BPdrnCm0ynwJAMEvOEfcp1/49ovY4Bnp6gYfDyr0NYKT4dqSrdbqKMOzG1FeuSiphcSNkUsBl1xRLOmOX1A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1769609393; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=iMbNGVhll/+ocb6IszXEkRjXM+PIU7cVCloG+GE0bCE=; 
	b=MWOOlFCaUyXrxPZMAOBIfrhN/FQJDiVgqAqSMyRF+3xs5klTI/bFtsFOveZNuwMH/7hmYhi0I1dMNRoKq9Q1jkleac2FnuZvl0Vao66E0P/sXRzxOdUzYSFUGnc2AdMDok2HtC8VpZTJD0lu6HqzzGmWO4nx2nDpfsF019CVAXk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769609393;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=iMbNGVhll/+ocb6IszXEkRjXM+PIU7cVCloG+GE0bCE=;
	b=B43akB57UtMcwBr7dl7RHCuCsG3P3RQGAVC/tABf/zQYJvfRjaMNoaWI961T2kbA
	YuU2PM3d66dd34nIdJz0c35AXc1xTFTiB6vtX7vBxnLS6kFxjW8ut8tPnvcSWJzw3be
	B6dEp0ovW7aeWBLdlpj2LrHhT050r/awgXydzx2A=
Received: by mx.zohomail.com with SMTPS id 1769609392312198.3122843443805;
	Wed, 28 Jan 2026 06:09:52 -0800 (PST)
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
Date: Wed, 28 Jan 2026 15:09:46 +0100
Message-ID: <6678782.DvuYhMxLoT@workhorse>
In-Reply-To: <1cbf0f37-13de-46a5-a3c0-0509048c519e@sirena.org.uk>
References: <20251010-mtk-pll-rpm-v3-0-fb1bd15d734a@collabora.com>
 <6800096.lOV4Wx5bFT@workhorse>
 <1cbf0f37-13de-46a5-a3c0-0509048c519e@sirena.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_061011_379164_EB283D07 
X-CRM114-Status: GOOD (  23.55  )
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

On Wednesday, 28 January 2026 00:14:29 Central European Standard Time Mark Brown wrote:
> On Tue, Jan 27, 2026 at 07:18:02PM +0100, Nicolas Frattaroli wrote:
> 
> > Can someone let me know which clocks (with which parent) in those
> > affected devices is causing this? I'm wondering if this change
> > unmasked some undeclared dependency that it's now stumbling over
> > because it's enabling the parent earlier than ever.
> 
> Do you have a debugging patch we could run which would say which clocks
> are impacted?  I guess it's more of an issue for the platforms that give
> no output but for at least Avenger96 I was getting earlycon output.

Try this one
---
diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 1b0f9d567f48..fa1443517768 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1921,13 +1921,21 @@ static unsigned long clk_recalc(struct clk_core *core,
 	unsigned long rate = parent_rate;
 
 	if (core->ops->recalc_rate && !clk_pm_runtime_get(core)) {
-		if (core->flags & CLK_OPS_PARENT_ENABLE)
+		if (core->flags & CLK_OPS_PARENT_ENABLE) {
+			pr_info("%s: enabling parent %s for %s\n", __func__,
+				core->parent ? core->parent->name : "(null)",
+				core->name);
 			clk_core_prepare_enable(core->parent);
+		}
 
 		rate = core->ops->recalc_rate(core->hw, parent_rate);
 
-		if (core->flags & CLK_OPS_PARENT_ENABLE)
+		if (core->flags & CLK_OPS_PARENT_ENABLE) {
+			pr_info("%s: disabling parent %s for %s\n", __func__,
+				core->parent ? core->parent->name : "(null)",
+				core->name);
 			clk_core_disable_unprepare(core->parent);
+		}
 
 		clk_pm_runtime_put(core);
 	}
@@ -4038,8 +4046,12 @@ static int __clk_core_init(struct clk_core *core)
 	 */
 	clk_core_update_duty_cycle_nolock(core);
 
-	if (core->flags & CLK_OPS_PARENT_ENABLE)
+	if (core->flags & CLK_OPS_PARENT_ENABLE) {
+		pr_info("%s: enabling parent %s for %s\n", __func__,
+			core->parent ? core->parent->name : "(null)",
+			core->name);
 		clk_core_prepare_enable(core->parent);
+	}
 
 	/*
 	 * Set clk's rate.  The preferred method is to use .recalc_rate.  For
@@ -4056,8 +4068,12 @@ static int __clk_core_init(struct clk_core *core)
 		rate = 0;
 	core->rate = core->req_rate = rate;
 
-	if (core->flags & CLK_OPS_PARENT_ENABLE)
+	if (core->flags & CLK_OPS_PARENT_ENABLE) {
+		pr_info("%s: disabling parent %s for %s\n", __func__,
+			core->parent ? core->parent->name : "(null)",
+			core->name);
 		clk_core_disable_unprepare(core->parent);
+	}
 
 	/*
 	 * Enable CLK_IS_CRITICAL clocks so newly added critical clocks
---

I don't remember if printk buffers are flushed after each invocation and
couldn't quickly find a kernel parameter to control this, but from
experience I think these prints should show up if it then hangs the SoC
on the very next line.

> > To not have me break everyone's -next for days on end, feel free
> > to drop this patch. MT8196, which this was added for, doesn't boot
> > with mainline yet anyway.
> 
> Please, this is making my test lab miserable.
> 

The good news is that the rest of the series can stay without doing
any harm if this single patch gets dropped, and I can re-attempt
this in the next cycle.

Kind regards,
Nicolas Frattaroli



