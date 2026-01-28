Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2C9DD3F06A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 14:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=06r3ry7I70lRQ3WUitTO3gPI56HJOgQVtCUV6n6r200=; b=SGvWO50p45z3918WokakomZUtk
	RjxnULRXJLZN4jArH+TuXb2zYpLQIwNZiRcnacCnOfLBp1JzeMPzINgvYJJeVVCc4sum+4yKmS+DL
	1AgVvuNPUry2u2XG5jdMwUWKjI4Ah0RPDFRjbkYybmfbAzQ++gbSLLum+x52Kx381nPMKpHE+vKyn
	OAMttT0Hfrg9/SdP+BhBZxswa5+FcgXYSbap9gtSikeNwP0okwm+1WWly44Z5FhKmeo1ymx/fORDK
	cM+GNVR/+lXEQ+n8ShnnjshS823x9a1M0kJkQNO0Fy79O0+2gXLK3bBOnvMce6YM+kyM1WnCwLCYq
	i3bF8z+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl6H8-0000000G973-46WI;
	Wed, 28 Jan 2026 14:12:07 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl6H6-0000000G96S-3zgj;
	Wed, 28 Jan 2026 14:12:06 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1769609502; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=C2e+E4pPdtRU0uXKZqe0nGXZf0SD6zxByFcRW+JwfXGQnTkXetHKuYPcnJ0MqYB60iGKY+Kuq8UEkdD8kelCKUfOZ0M4ghaLWTq7FOBrpzOZYFlEb8NKF2r56PYF+XvCqiyux3DLMH8lFfyKjEf1sEM0mdGSf5S02U6XEf6krTc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1769609502; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=06r3ry7I70lRQ3WUitTO3gPI56HJOgQVtCUV6n6r200=; 
	b=XeiaJatdZKx0rA2QFkUb/OdlU4exgFCcrssdGOQzKfxH3TlKLmXRqrqOSO4joicpbyRdOy2RH6BF9OJfjVPqBNpKgIJeQKhsAEconTVJZEcGmVC/QQqObSezSKErn49tqmx9X934TdB99Vefa7S8geJIbVlyDV7KZOmWbshr8Aw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769609502;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=06r3ry7I70lRQ3WUitTO3gPI56HJOgQVtCUV6n6r200=;
	b=K6YN9xrtYa7BF8aF2GW5pAk0tIphh5M/0YPNQ9IsjnU6gA1m723rjekaC2ThSrBC
	BsNFXBL3E7Jka14k//5dnNQ0Q3uDKylIbgVlgfVdqEjZhlJNfH/In6iCjaRcU0imMkp
	0dxE03fCnQ+EkKwmThtp26djyKpcWOL+IgvZt454=
Received: by mx.zohomail.com with SMTPS id 1769609499860744.4033332740098;
	Wed, 28 Jan 2026 06:11:39 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Chia-I Wu <olvaffe@gmail.com>,
 Dong Aisheng <aisheng.dong@nxp.com>, Laura Nao <laura.nao@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gIFIuICBBLg==?= Prado <nfraprado@collabora.com>,
 Yassine Oudjana <y.oudjana@protonmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH RESEND v3 1/5] clk: Respect CLK_OPS_PARENT_ENABLE during recalc
Date: Wed, 28 Jan 2026 15:11:33 +0100
Message-ID: <5791016.31r3eYUQgx@workhorse>
In-Reply-To: <6239343.lOV4Wx5bFT@steina-w>
References: <20251215-mtk-pll-rpm-v3-0-5afb3191e869@collabora.com>
 <176913273374.4027.10690199843699119944@lazor> <6239343.lOV4Wx5bFT@steina-w>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_061205_039532_75088814 
X-CRM114-Status: GOOD (  19.57  )
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

On Tuesday, 27 January 2026 15:55:29 Central European Standard Time Alexander Stein wrote:
> Hello,
> 
> Am Freitag, 23. Januar 2026, 02:45:33 CET schrieb Stephen Boyd:
> > Quoting Nicolas Frattaroli (2025-12-15 03:23:58)
> > > When CLK_OPS_PARENT_ENABLE was introduced, it guarded various clock
> > > operations, such as setting the rate or switching parents. However,
> > > another operation that can and often does touch actual hardware state is
> > > recalc_rate, which may also be affected by such a dependency.
> > > 
> > > Add parent enables/disables where the recalc_rate op is called directly.
> > > 
> > > Fixes: fc8726a2c021 ("clk: core: support clocks which requires parents enable (part 2)")
> > > Fixes: a4b3518d146f ("clk: core: support clocks which requires parents enable (part 1)")
> > > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > > Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> > > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > > ---
> > 
> > Applied to clk-next
> 
> Unfortunately this breaks my board TQMa8MPxL+MBa8MPxL on next-20260126.
> Last lines on bootlog (earlycon is necessary)
> > [    1.175639] Initialise system trusted keyrings
> > [    1.178907] workingset: timestamp_bits=42 max_order=19 bucket_order=0
> > [    1.185822] NFS: Registering the id_resolver key type
> > [    1.190295] Key type id_resolver registered
> > [    1.194473] Key type id_legacy registered
> > [    1.198515] nfs4filelayout_init: NFSv4 File Layout Driver Registering...
> > [    1.205235] nfs4flexfilelayout_init: NFSv4 Flexfile Layout Driver
> > Registering... [    1.213235] cryptd: max_cpu_qlen set to 1000
> > [    1.274689] Key type asymmetric registered
> > [    1.275939] Asymmetric key parser 'x509' registered
> > [    1.280896] Block layer SCSI generic (bsg) driver version 0.4 loaded
> > (major 242) [    1.288278] io scheduler mq-deadline registered
> > [    1.292840] io scheduler kyber registered
> > [    1.299245] ledtrig-cpu: registered to indicate activity on CPUs
> 
> Reverting commit 669917676e93fca5ea3c66fc9539830312bec58e fixes the problem.

Hi Alexander,

sorry for breaking -next.

Can you try the following patch to print which clock+parent is causing
the hang on your platform?

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

Thanks for reporting this.

Kind regards,
Nicolas Frattaroli

> 
> Best regards,
> Alexander
> 





