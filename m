Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C42EC44503
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 11:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RJub5ZPZsJzcOi4zRa+ExZyiUH46huzX/t4vX9Ke4aw=; b=KyxujjS1Mup7RxTdfEtYan2j4f
	HRWs38PMgnYEnxPelJ/u8gTLd7XF95yLnFLr7c10xFRmV+18povxtbZSZYbXXhQshpWhzP3dWtaQ8
	GJKbOUHqrsehiVoCotWWzoHdWmt22IrotcneBMXNSCFSKakg57K99QszZ27Chw5+8xyf9+dDxdrD7
	spMBXYVrbfc87tZxv2IDyiRcBT9oX1h5l39YemdZQV9ErPP6QUSysDaOsxEczCkHSFT9kHoK9m58I
	xJ/KxV/vEnrS/JAeCGc1Ry+2CyxJS/ykDEefXdW718GyEFCh3QRZmpPALKxgEcm3ltoFbMFw00d/O
	T7Oomhgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viW0t-00000005Jxz-2Jj5;
	Wed, 21 Jan 2026 11:04:39 +0000
Received: from sender4-op-o16.zoho.com ([136.143.188.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viW0r-00000005Jwp-04C7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 11:04:38 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1768993466; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=eb3hiUC5Koqr6vPcmvWzPJdUAk915tMpGc9bHh6mTEzVZkdNkI31Kcb+a+cCH5VnoYmKFQIwzhMb0b1Dio0W7MDZFwVU1OlmBR6phV+BJRTQ0utXykSc8s9eprViyX1tSDUrkPqaeOkrT0QqYyb7B6S8HyURO7yhiuh7lQoge6E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1768993466; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=RJub5ZPZsJzcOi4zRa+ExZyiUH46huzX/t4vX9Ke4aw=; 
	b=La7j1YqmWwPHritPc1rW6d/gW2BBoLpO4JJYoav6aSKBh1omjZ4y4uQeLAUgXtBoU+9MQXqpxw8veqsAOe+Zi6quU3R7uYasONH6y8PKKrrFqbc8Pkzln5PUE7AWVGUsLBBXZnejcw/zZ3yvoumWJqEuIMxOP6vUZlW/liUilTI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768993466;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=RJub5ZPZsJzcOi4zRa+ExZyiUH46huzX/t4vX9Ke4aw=;
	b=ZLE+eB6rErOyEkMgFBto2im1xQ1ZOrIIEN34eLu/sMWlIkv2VW5LwlIj5xzxTMMp
	+I3O7gh+WN7qfM92e2T+qc5HoIGZ2V+GYb4wz6CG14JooRAdyFVBNv0ltE/NR+n7H1m
	0y2fSfg/P2MYgqKb/mi197s87zrNNAss3Xqzu5W8=
Received: by mx.zohomail.com with SMTPS id 1768993464430169.99826292706462;
	Wed, 21 Jan 2026 03:04:24 -0800 (PST)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Wed, 21 Jan 2026 18:59:11 +0800
Subject: [PATCH 5/7] clk: sunxi-ng: mux: Add mux read-only clock operations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-a733-rtc-v1-5-d359437f23a7@pigmoral.tech>
References: <20260121-a733-rtc-v1-0-d359437f23a7@pigmoral.tech>
In-Reply-To: <20260121-a733-rtc-v1-0-d359437f23a7@pigmoral.tech>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 Junhui Liu <junhui.liu@pigmoral.tech>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768993386; l=1825;
 i=junhui.liu@pigmoral.tech; s=20251228; h=from:subject:message-id;
 bh=yie5eDb9BUEl0Aid6eA7yIm0Tl3wT/Y7FXEWcLOUikU=;
 b=9BCMuiNZQfMjro/P67t39fZX/nmh4DdJ8jFx/n3oo2WozsR3OdLUMu9+Ny/e+pHwGOx4vg8F3
 MQI2nQiRjoaBkyMIgonRuwoTrp3vuKfvUKFUaHVZ6FdvzaIXv7d+5eW
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=3vU0qIPJAH8blXmLyqBhKx+nLOjcLwwYhZXelEpw7h4=
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_030437_114299_2A08005B 
X-CRM114-Status: GOOD (  12.82  )
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

The Allwinner A733 SoC introduces some mux clocks (such as the one
indicating the DCXO frequency) that use read-only registers to report
their current hardware configuration. Writing to these registers is not
supported by hardware and should be avoided.

Add ccu_mux_ro_ops to support these clocks, which omit .set_parent()
and .determine_rate() to prevent changing the mux state.

Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 drivers/clk/sunxi-ng/ccu_mux.c | 11 +++++++++++
 drivers/clk/sunxi-ng/ccu_mux.h |  1 +
 2 files changed, 12 insertions(+)

diff --git a/drivers/clk/sunxi-ng/ccu_mux.c b/drivers/clk/sunxi-ng/ccu_mux.c
index 74f9e98a5d35..d48e7c3e065d 100644
--- a/drivers/clk/sunxi-ng/ccu_mux.c
+++ b/drivers/clk/sunxi-ng/ccu_mux.c
@@ -277,6 +277,17 @@ const struct clk_ops ccu_mux_ops = {
 };
 EXPORT_SYMBOL_NS_GPL(ccu_mux_ops, "SUNXI_CCU");
 
+const struct clk_ops ccu_mux_ro_ops = {
+	.disable	= ccu_mux_disable,
+	.enable		= ccu_mux_enable,
+	.is_enabled	= ccu_mux_is_enabled,
+
+	.get_parent	= ccu_mux_get_parent,
+
+	.recalc_rate	= ccu_mux_recalc_rate,
+};
+EXPORT_SYMBOL_NS_GPL(ccu_mux_ro_ops, "SUNXI_CCU");
+
 /*
  * This clock notifier is called when the frequency of the of the parent
  * PLL clock is to be changed. The idea is to switch the parent to a
diff --git a/drivers/clk/sunxi-ng/ccu_mux.h b/drivers/clk/sunxi-ng/ccu_mux.h
index eb1172ebbd94..887c164d00f4 100644
--- a/drivers/clk/sunxi-ng/ccu_mux.h
+++ b/drivers/clk/sunxi-ng/ccu_mux.h
@@ -129,6 +129,7 @@ static inline struct ccu_mux *hw_to_ccu_mux(struct clk_hw *hw)
 }
 
 extern const struct clk_ops ccu_mux_ops;
+extern const struct clk_ops ccu_mux_ro_ops;
 
 unsigned long ccu_mux_helper_apply_prediv(struct ccu_common *common,
 					  struct ccu_mux_internal *cm,

-- 
2.52.0


