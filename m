Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DE51D5B170
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 10:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oQES7RbZPPxkgsateNmUfmiBsLawo8HPYdbXzx6AWUA=; b=GVq2mWrHOvaoy9j+ki2cSvo8le
	BKJAwZdjOF/wbdTIHreWOQpo0Wss0IEvzz+sZeVzav/u+VML9/RLCzx+aTS7x/r+7lviKHl/LdJnD
	FmEGfzUwSuRWQN7Ahk/21HTqRjx975xog2OvcFFADimrLhWCmVE1pWBTzsWCd8SOnou0QCvCEKdZu
	E6/U1t9DqwzOepZz90TLoN8wZg9Sv62+i838F8Xhg5s1FQSvrL433eeu91d2sqb91S5FF6ALZp2FK
	4t4VZf+4lfvPYuBN67YcclU1HMSHjv4G1LCqx+vkYTTW5edNyuUiwfLMZj+7gG9clTS1rnhzwxn4P
	1Q3LtKBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV5kx-00000003RgN-0fY1;
	Mon, 15 Dec 2025 10:24:43 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV5kt-00000003Re1-0v4V;
	Mon, 15 Dec 2025 10:24:40 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1765794264; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TQzOg8qvQn1eHPiJpIWt8Fh9RLoj+P8GiNh+arvhhtSAUxnB2RqSn98kndqe+8X+IeWMijSVVZ8s1N/j1oesfc6SMnOcvGeMZbUJEsUbysqJ9VCO1XHzFrlWie65dK+fh0YS2H6I4NZIW37bLg7sZzA4q8z4aqLJEH7SPbrUP2w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1765794264; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=oQES7RbZPPxkgsateNmUfmiBsLawo8HPYdbXzx6AWUA=; 
	b=EtPlzCC+WacBeUHpuJZYvCR3QBEtdjUXDQgdql7mYUPWnxik6FDNSZCS8/NcUj+kyi3KnRsgnTVuo9Fh2aZ+5jlHcp1xuzomzPE6YxLQPqREKcqbscbE8C7dnFni6p0M00xRe2GM0r4B3Mh3Q9pg34D0FuDuxEEu0WLg3tpjYnA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765794264;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=oQES7RbZPPxkgsateNmUfmiBsLawo8HPYdbXzx6AWUA=;
	b=My4vhPwVyfOc18nr7Ayop4j98O+bXPyL/4YPoDUquMmvcUQNC/iH1Hhp4Vo4F8z/
	QuPjiECH1Gxp7XQWe6YWNyCXT8zAsRW3HGw4IpnTAHB/G+CYTdTSr19Oz4gZJgRj4kf
	neKLw8W9PAY1q5Ci4mY1QEEvJDrVU6H4OzOZ/slg=
Received: by mx.zohomail.com with SMTPS id 1765794263077348.7746226854614;
	Mon, 15 Dec 2025 02:24:23 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 15 Dec 2025 11:23:58 +0100
Subject: [PATCH RESEND v3 1/5] clk: Respect CLK_OPS_PARENT_ENABLE during
 recalc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-mtk-pll-rpm-v3-1-5afb3191e869@collabora.com>
References: <20251215-mtk-pll-rpm-v3-0-5afb3191e869@collabora.com>
In-Reply-To: <20251215-mtk-pll-rpm-v3-0-5afb3191e869@collabora.com>
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
 linux-mediatek@lists.infradead.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_022439_319709_20A8A9FF 
X-CRM114-Status: GOOD (  11.09  )
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
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/clk/clk.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 85d2f2481acf..1b0f9d567f48 100644
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
2.52.0


