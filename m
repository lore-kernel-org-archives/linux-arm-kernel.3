Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12F09CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 16:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KAEUNIM+MOwI31HF4BnvUSBiOCBHcJPGV+SFXgxbBtA=; b=O9H+RjDiN535siH/uP8G7xQzaI
	Y7w5zoG8GsNIdBtaYYk87aqZ0QEFQDXsoR4sXyzebHVwPpJzwRD1D+DF99BpfD8octO1a+/XZuBfO
	QUVKuHPHZOujDSUBTbDQ9LSFT7qyUetlzsH+K2lcuEsAPFn8B+eViPplIukIUtC2gucbN6lFzEsQb
	aXOJKeRh5+8litF2yf6QMiA4TZM5vE/CUsreHQ1jTrrtJW7mnGkDpzkic1SAg53uJFRLOeiIVKLd9
	ar9bIzU1p9t68Do50f14SlMEgOSdU9jzh1TLoWmH+kXuPY2IvYiUQ1jVKZx4Au8Rv/id0AUUmWoWL
	ZvSNPATA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6WhW-00000004GDm-3yLU;
	Wed, 08 Oct 2025 16:07:38 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6WhU-00000004GCZ-39g6;
	Wed, 08 Oct 2025 16:07:37 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1759939551; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SsVJW/jBc4xhU88WK+icPeqXFzWpsp52Jss2hT3mrMRvyfqPIZdGCDgIaPCDsKtb8wVB42s1uxmrSlybQesWz8DxfJP9dMZMZF6jQvJ9m9f/QMf/m5fQ2oZ0ASN63ZmtXvlcYfLmPxQYSpj6W5VpVMoLyrD+YDpjq6gfRkN0/xU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1759939551; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=KAEUNIM+MOwI31HF4BnvUSBiOCBHcJPGV+SFXgxbBtA=; 
	b=b4QTnt5WL73ZpuyrD/VZstO0xD36HCXAxX/432g2I868gDuYbtpyuzOcw1oFn9w/QME7Zz8Ak2IVCxdmBSVGvaGQ/+f8Q/huSMTnLgZ/ojL+XeAJhsEdP1bw8eQxguKAmlO0+Ij1XnmHbViMyCKMg9qVEYLzKA5WqrMMfnGqe2c=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1759939551;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=KAEUNIM+MOwI31HF4BnvUSBiOCBHcJPGV+SFXgxbBtA=;
	b=kbbkGIuevmaBPxoclGVxsw99bBxLxRLlISpktfgXZ6AAfk6KQxUA4vYk4kUf/ncc
	VWrTIsycvbtNSgW6zGgLEzfHlo9zShBNPW4hP1VJdN/uG6+u/nHGx5OIzGahKLjMocK
	Smz4WC+EDxgdTPDrVkVPB6bqLChrHoE91HjttaZk=
Received: by mx.zohomail.com with SMTPS id 1759939548907265.7349199019691;
	Wed, 8 Oct 2025 09:05:48 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Wed, 08 Oct 2025 18:05:35 +0200
Subject: [PATCH v2 1/5] clk: Respect CLK_OPS_PARENT_ENABLE during recalc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251008-mtk-pll-rpm-v2-1-170ed0698560@collabora.com>
References: <20251008-mtk-pll-rpm-v2-0-170ed0698560@collabora.com>
In-Reply-To: <20251008-mtk-pll-rpm-v2-0-170ed0698560@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Yassine Oudjana <y.oudjana@protonmail.com>, 
 Laura Nao <laura.nao@collabora.com>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Chia-I Wu <olvaffe@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Stephen Boyd <sboyd@codeaurora.org>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_090736_851378_6D07A86F 
X-CRM114-Status: GOOD (  12.15  )
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

When CLK_OPS_PARENT_ENABLE was introduced, it guarded various clock
operations, such as setting the rate or switching parents. However,
another operation that can and often does touch actual hardware state is
recalc_rate, which may also be affected by such a dependency.

Add parent enables/disables where the recalc_rate op is called directly.

Fixes: fc8726a2c021 ("clk: core: support clocks which requires parents enable (part 2)")
Fixes: a4b3518d146f ("clk: core: support clocks which requires parents enable (part 1)")
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/clk/clk.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 85d2f2481acf360f0618a4a382fb51250e9c2fc4..1b0f9d567f48e003497afc98df0c0d2ad244eb90 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1921,7 +1921,14 @@ static unsigned long clk_recalc(struct clk_core *core,
 	unsigned long rate = parent_rate;
 
 	if (core->ops->recalc_rate && !clk_pm_runtime_get(core)) {
+		if (core->flags & CLK_OPS_PARENT_ENABLE)
+			clk_core_prepare_enable(core->parent);
+
 		rate = core->ops->recalc_rate(core->hw, parent_rate);
+
+		if (core->flags & CLK_OPS_PARENT_ENABLE)
+			clk_core_disable_unprepare(core->parent);
+
 		clk_pm_runtime_put(core);
 	}
 	return rate;
@@ -4031,6 +4038,9 @@ static int __clk_core_init(struct clk_core *core)
 	 */
 	clk_core_update_duty_cycle_nolock(core);
 
+	if (core->flags & CLK_OPS_PARENT_ENABLE)
+		clk_core_prepare_enable(core->parent);
+
 	/*
 	 * Set clk's rate.  The preferred method is to use .recalc_rate.  For
 	 * simple clocks and lazy developers the default fallback is to use the
@@ -4046,6 +4056,9 @@ static int __clk_core_init(struct clk_core *core)
 		rate = 0;
 	core->rate = core->req_rate = rate;
 
+	if (core->flags & CLK_OPS_PARENT_ENABLE)
+		clk_core_disable_unprepare(core->parent);
+
 	/*
 	 * Enable CLK_IS_CRITICAL clocks so newly added critical clocks
 	 * don't get accidentally disabled when walking the orphan tree and

-- 
2.51.0


