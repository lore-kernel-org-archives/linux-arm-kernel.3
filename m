Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB0A3CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 08:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XxlcfNeRaRWZTwXU0NT8kH+GHpvE/vl/i3zb2pJZvTQ=; b=BkiK25jC33gwmgkjE9z1ngu+kL
	Fcn0M0j3TNSJ+fU0X9Emlzy+OM9T7muIGgVP0Leg6otAXP83m9XvOs0dn79eHxpJEnpNoz871fFgp
	xN1M2zH67wadyRj7exlEEOXT7lEKx9FJUwjhnDmhDdrwrkrHnTt86GD70R1P4Y3VjV2klFzJPYhhh
	zKG2rk4JONPAMEorv2qsluuEA7r8rgjifk8pRYrFTmRJSJk706RNuLN8Za83W4IWbjBCrBlDxNasQ
	LdUKi1+MolRsYUX3s2+8QpQFhrwcVkwFVAP+w9z3aGUepjucPXyUvKEL31/Y099p4D50USSWSvviR
	zkSniIUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOXXH-0000000GDeG-1ruN;
	Thu, 27 Nov 2025 08:39:31 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOXX5-0000000GDaO-3u5s
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 08:39:21 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 876C9C16A19;
	Thu, 27 Nov 2025 08:38:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5AF106068C;
	Thu, 27 Nov 2025 08:39:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 77E1D102F2751;
	Thu, 27 Nov 2025 09:39:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764232757; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=XxlcfNeRaRWZTwXU0NT8kH+GHpvE/vl/i3zb2pJZvTQ=;
	b=GDSY87DhyMjqWSjbdiANf57fcC8hDx8BNRcoDp9crZ/ex1R+DePu29R+7pG0nEAKRHwkiA
	+sPsEeSscmiQz5QvJhccnAp4lnceRs5FXiZHFneHOQWognVetSNohaHUHcHyAXsQPJ0WrC
	+Jj1O0rHW0rEe2tTefEidFjAR4BQHowsUOkdsFsmKlfzoF+yEx0Xu+Y5s8VPULt21eOeS0
	Er6ZgUAkGB1+6rl/0An0eaq3XvG/Qg5MKtKe+Ipxe4i7cc2Yz8YJXTrNqU14vkJlwbEyBZ
	nXdEFk4Pe4Rr1q4kpiYXsuWMnP/EavHqeQ8FAdcqAkXFUTT5QFX/tPdBfAa/EQ==
From: "Thomas Richard (TI.com)" <thomas.richard@bootlin.com>
Date: Thu, 27 Nov 2025 09:38:57 +0100
Subject: [PATCH RFC v2 3/4] clk: keystone: sci-clk: add restore_context()
 operation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251127-ti-sci-jacinto-s2r-restore-irq-v2-3-a487fa3ff221@bootlin.com>
References: <20251127-ti-sci-jacinto-s2r-restore-irq-v2-0-a487fa3ff221@bootlin.com>
In-Reply-To: <20251127-ti-sci-jacinto-s2r-restore-irq-v2-0-a487fa3ff221@bootlin.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Santosh Shilimkar <ssantosh@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, 
 richard.genoud@bootlin.com, Udit Kumar <u-kumar1@ti.com>, 
 Prasanth Mantena <p-mantena@ti.com>, Abhash Kumar <a-kumar2@ti.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, 
 "Thomas Richard (TI.com)" <thomas.richard@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_003920_149839_4BC5BB37 
X-CRM114-Status: GOOD (  14.53  )
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

Implement the restore_context() operation to restore the clock parent
state. The parent index is saved in sci_clk struct during set_parent().
During clock registration, the core retrieves each clock’s parent using
get_parent() operation to ensure the internal clock tree reflects the
actual hardware state, including any configurations made by the
bootloader. So we also save the parent index in get_parent().

Signed-off-by: Thomas Richard (TI.com) <thomas.richard@bootlin.com>
---
 drivers/clk/keystone/sci-clk.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/keystone/sci-clk.c b/drivers/clk/keystone/sci-clk.c
index a4b42811de55d..1e5dd01484d1c 100644
--- a/drivers/clk/keystone/sci-clk.c
+++ b/drivers/clk/keystone/sci-clk.c
@@ -47,6 +47,7 @@ struct sci_clk_provider {
  * @node:	 Link for handling clocks probed via DT
  * @cached_req:	 Cached requested freq for determine rate calls
  * @cached_res:	 Cached result freq for determine rate calls
+ * @parent_id:	 Parent index for this clock
  */
 struct sci_clk {
 	struct clk_hw hw;
@@ -58,6 +59,7 @@ struct sci_clk {
 	struct list_head node;
 	unsigned long cached_req;
 	unsigned long cached_res;
+	u8 parent_id;
 };
 
 #define to_sci_clk(_hw) container_of(_hw, struct sci_clk, hw)
@@ -237,9 +239,9 @@ static u8 sci_clk_get_parent(struct clk_hw *hw)
 		return 0;
 	}
 
-	parent_id = parent_id - clk->clk_id - 1;
+	clk->parent_id = (u8)(parent_id - clk->clk_id - 1);
 
-	return (u8)parent_id;
+	return clk->parent_id;
 }
 
 /**
@@ -252,12 +254,24 @@ static u8 sci_clk_get_parent(struct clk_hw *hw)
 static int sci_clk_set_parent(struct clk_hw *hw, u8 index)
 {
 	struct sci_clk *clk = to_sci_clk(hw);
+	int ret;
 
 	clk->cached_req = 0;
 
-	return clk->provider->ops->set_parent(clk->provider->sci, clk->dev_id,
-					      clk->clk_id,
-					      index + 1 + clk->clk_id);
+	ret = clk->provider->ops->set_parent(clk->provider->sci, clk->dev_id,
+					     clk->clk_id,
+					     index + 1 + clk->clk_id);
+	if (!ret)
+		clk->parent_id = index;
+
+	return ret;
+}
+
+static void sci_clk_restore_context(struct clk_hw *hw)
+{
+	struct sci_clk *clk = to_sci_clk(hw);
+
+	sci_clk_set_parent(hw, clk->parent_id);
 }
 
 static const struct clk_ops sci_clk_ops = {
@@ -269,6 +283,7 @@ static const struct clk_ops sci_clk_ops = {
 	.set_rate = sci_clk_set_rate,
 	.get_parent = sci_clk_get_parent,
 	.set_parent = sci_clk_set_parent,
+	.restore_context = sci_clk_restore_context,
 };
 
 /**

-- 
2.51.0


