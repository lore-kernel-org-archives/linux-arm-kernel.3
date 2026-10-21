Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB05606A322
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 13:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dq+jQS/n;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=SrmTiNem
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mpk35UQzSCThcQ2HIscEzzLYQpXL9G1v7IFBsf5dB+0=; b=dq+jQS/nMHqzfddRo/dMTY2a+k
	PvdOKmlv2XSAkYdKiWQc4pGTXUWMevQZjbTcOYV9oiQD9Nj01Mg2Fw4JbM3JTow9pbItzjhcLla6T
	/l4E9zsC0TmwzHpx9WkDTz+fin5Cre6VKniTIp7i3p3IHavbSBkQGfzlAmIDSkYMMkTDzlHCTEAN1
	iNEjfMQJiciDQLslYEInkN7pgewYaE+gZd0uaWNZlHJ/sZshztJWEv9Ef5GTex4B9m0FnYh7xORAH
	RwmnyiwE3PBnTaJ6elq6vakOHS03kAC4KAZWKdq75Ggj0WTBJh0TYutm+ngX4vbcTk2VK2KUyyynm
	YDNzuh7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJW5S-0000000BsAL-2vFX;
	Wed, 21 Oct 2026 13:10:34 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJW5O-0000000Bs8M-2vnC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 13:10:32 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B6DC5C5CD77;
	Wed, 21 Oct 2026 13:11:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C5896606E3;
	Wed, 21 Oct 2026 13:10:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0C56D10328D6E;
	Wed, 21 Oct 2026 15:10:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792588222; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Mpk35UQzSCThcQ2HIscEzzLYQpXL9G1v7IFBsf5dB+0=;
	b=SrmTiNem7VT+cyyb/vOhxaf3McTOepM2b7mDBy9twYYzYAey65fHKV8Ibm6Qlnu2gCU+mO
	BuU5CaxD+VjJfWdpI20oVH7TS3wa441D8CGHbhZt0muR9SwD27xKtC2sPO5peUZ2axKOTR
	OLGQ6cVd8OZJXF3RYkEitiAhN1cQSSgfYDav3ZCJdObfZgrOMehXTQMPCj9ZQzC1NhsStT
	v60ODVO2WUTkrQkJkA9xGIvMKf9YfkFnTAV/gqAY8Oj3smkPl5joeA/K+mslxFcICtC6NI
	+Xy6uuYcChopsGY5wmpFoDgUKZQKQR24HCXUaPKV6+MUeys7249cXfMUyxVXIg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 21 Oct 2026 15:09:57 +0200
Subject: [PATCH 1/5] clk: composite: Initialize inner hw clocks during
 registration
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-ge-clk-lcm-v1-1-246cc35b5ffb@bootlin.com>
References: <20261021-ge-clk-lcm-v1-0-246cc35b5ffb@bootlin.com>
In-Reply-To: <20261021-ge-clk-lcm-v1-0-246cc35b5ffb@bootlin.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Abel Vesa <abelvesa@kernel.org>, 
 Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Ian Ray <ian.ray@gehealthcare.com>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_061030_919707_68297C0D 
X-CRM114-Status: GOOD (  13.81  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The mux, rate and gate clk_hws of a composite are not registered as
clocks on their own. Only the ->clk pointer was set to the composite
clk, but their ->core remained unassigned.

Provider ops may call into clk_hw_* helpers, such as clk_hw_get_flags()
or clk_hw_get_rate() for instance. In these cases, hw->core will be
dereferenced.

The composite callbacks kind of papered with this situation by (almost)
always calling __clk_hw_set_clk() before
use. clk_composite_determine_rate() never did it, but it probably did
not fail because the core likely called callbacks like get_parent() or
recalc_rate() before.

Add a clk_composite_init() callback that sets up the inner core pointers
once for all just after the core clock registration, and before any
other callback call from the core. Thanks to this, each per-callback
assignement can be dropped.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/clk/clk-composite.c | 34 +++++++++++++++-------------------
 1 file changed, 15 insertions(+), 19 deletions(-)

diff --git a/drivers/clk/clk-composite.c b/drivers/clk/clk-composite.c
index 11842bce5918..332b38a326fa 100644
--- a/drivers/clk/clk-composite.c
+++ b/drivers/clk/clk-composite.c
@@ -8,14 +8,26 @@
 #include <linux/err.h>
 #include <linux/slab.h>
 
+static int clk_composite_init(struct clk_hw *hw)
+{
+	struct clk_composite *composite = to_clk_composite(hw);
+
+	if (composite->mux_hw)
+		__clk_hw_set_clk(composite->mux_hw, hw);
+	if (composite->rate_hw)
+		__clk_hw_set_clk(composite->rate_hw, hw);
+	if (composite->gate_hw)
+		__clk_hw_set_clk(composite->gate_hw, hw);
+
+	return 0;
+}
+
 static u8 clk_composite_get_parent(struct clk_hw *hw)
 {
 	struct clk_composite *composite = to_clk_composite(hw);
 	const struct clk_ops *mux_ops = composite->mux_ops;
 	struct clk_hw *mux_hw = composite->mux_hw;
 
-	__clk_hw_set_clk(mux_hw, hw);
-
 	return mux_ops->get_parent(mux_hw);
 }
 
@@ -25,8 +37,6 @@ static int clk_composite_set_parent(struct clk_hw *hw, u8 index)
 	const struct clk_ops *mux_ops = composite->mux_ops;
 	struct clk_hw *mux_hw = composite->mux_hw;
 
-	__clk_hw_set_clk(mux_hw, hw);
-
 	return mux_ops->set_parent(mux_hw, index);
 }
 
@@ -37,8 +47,6 @@ static unsigned long clk_composite_recalc_rate(struct clk_hw *hw,
 	const struct clk_ops *rate_ops = composite->rate_ops;
 	struct clk_hw *rate_hw = composite->rate_hw;
 
-	__clk_hw_set_clk(rate_hw, hw);
-
 	return rate_ops->recalc_rate(rate_hw, parent_rate);
 }
 
@@ -126,10 +134,8 @@ static int clk_composite_determine_rate(struct clk_hw *hw,
 		req->rate = best_rate;
 		return 0;
 	} else if (rate_hw && rate_ops && rate_ops->determine_rate) {
-		__clk_hw_set_clk(rate_hw, hw);
 		return rate_ops->determine_rate(rate_hw, req);
 	} else if (mux_hw && mux_ops && mux_ops->determine_rate) {
-		__clk_hw_set_clk(mux_hw, hw);
 		return mux_ops->determine_rate(mux_hw, req);
 	} else {
 		pr_err("clk: clk_composite_determine_rate function called, but no mux or rate callback set!\n");
@@ -144,8 +150,6 @@ static int clk_composite_set_rate(struct clk_hw *hw, unsigned long rate,
 	const struct clk_ops *rate_ops = composite->rate_ops;
 	struct clk_hw *rate_hw = composite->rate_hw;
 
-	__clk_hw_set_clk(rate_hw, hw);
-
 	return rate_ops->set_rate(rate_hw, rate, parent_rate);
 }
 
@@ -161,9 +165,6 @@ static int clk_composite_set_rate_and_parent(struct clk_hw *hw,
 	struct clk_hw *mux_hw = composite->mux_hw;
 	unsigned long temp_rate;
 
-	__clk_hw_set_clk(rate_hw, hw);
-	__clk_hw_set_clk(mux_hw, hw);
-
 	temp_rate = rate_ops->recalc_rate(rate_hw, parent_rate);
 	if (temp_rate > rate) {
 		rate_ops->set_rate(rate_hw, rate, parent_rate);
@@ -182,8 +183,6 @@ static int clk_composite_is_enabled(struct clk_hw *hw)
 	const struct clk_ops *gate_ops = composite->gate_ops;
 	struct clk_hw *gate_hw = composite->gate_hw;
 
-	__clk_hw_set_clk(gate_hw, hw);
-
 	return gate_ops->is_enabled(gate_hw);
 }
 
@@ -193,8 +192,6 @@ static int clk_composite_enable(struct clk_hw *hw)
 	const struct clk_ops *gate_ops = composite->gate_ops;
 	struct clk_hw *gate_hw = composite->gate_hw;
 
-	__clk_hw_set_clk(gate_hw, hw);
-
 	return gate_ops->enable(gate_hw);
 }
 
@@ -204,8 +201,6 @@ static void clk_composite_disable(struct clk_hw *hw)
 	const struct clk_ops *gate_ops = composite->gate_ops;
 	struct clk_hw *gate_hw = composite->gate_hw;
 
-	__clk_hw_set_clk(gate_hw, hw);
-
 	gate_ops->disable(gate_hw);
 }
 
@@ -237,6 +232,7 @@ static struct clk_hw *__clk_hw_register_composite(struct device *dev,
 	hw = &composite->hw;
 
 	clk_composite_ops = &composite->ops;
+	clk_composite_ops->init = clk_composite_init;
 
 	if (mux_hw && mux_ops) {
 		if (!mux_ops->get_parent) {

-- 
2.56.0


