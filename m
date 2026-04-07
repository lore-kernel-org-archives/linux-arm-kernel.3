Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECED5FEEF50
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 14:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iMJ932icSsAvixcpk7bfZVoJ+QQ+IxSzkCPu6ctaCgQ=; b=SDqKsWv+KzYzQDCAVjpbst0c/s
	/7zKn8tuOrijypwXcznYBCDV0AXs5mVe+35fqaLWc8Vl0DnWcSDa6BCG+ddeN26ZICL9JHbi1k4Lv
	k9uu90TBQuAGPpcK53l8Os4OV9Nml8WlHOcIPRiqMQnwOyLCvPjj/VDnjhP1GJCFogrfYq5sqaSM1
	Ohmhq8Mk8e+2RNtLdNBFwIiYeEOUv+Ur7LT2+A0RiN+GR5owXvzdDkKZjFfDlmqUIVrFBSxrxz4CZ
	X3H/aRjzmfzV6cUXYuS1Vqja1WuhaIa6vhZK43VfIwOnO/vkmLFK9WBl06xvusof1cHvZsTXBHC81
	dBL2xEDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA7Mz-00000006az5-30uP;
	Tue, 07 Apr 2026 14:25:33 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA7Mv-00000006awd-1YtW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 14:25:30 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A8A50C5B18F;
	Tue,  7 Apr 2026 14:26:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DBCB7603C7;
	Tue,  7 Apr 2026 14:25:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 478401045017A;
	Tue,  7 Apr 2026 16:25:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775571926; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=iMJ932icSsAvixcpk7bfZVoJ+QQ+IxSzkCPu6ctaCgQ=;
	b=GJF1ltdls/1X1//AzlFXJbKPAN03vdapfCZk+2+kriDG9NOlOVp9u+6hCCEYhjp7+F1Q+m
	/sv3V4a4alyBZLfAM7WCH06R7liVycvurfOU1D1kIknkcHbpfaDUWcqr1mU2mJmeNB6nZW
	eu+tavofWl6kYSy7nwE0V9bIDT/341IwGTmJxDY4AK2LZuFKSfEV+9tUzd019tFWiMcyCk
	4lsckMRt1PJbWkmy/tjgdbuehTYd/QNUxfwUiNf4XYDVn4PvjNDiICtM5AjJOdHTuYwTRr
	r+Gvtk93QWx+MUmANmWkdfoQLTV2doTYvECjsBmcLWkGQSeAslsFfMOqCPp2LA==
From: "Thomas Richard (TI)" <thomas.richard@bootlin.com>
Date: Tue, 07 Apr 2026 16:25:08 +0200
Subject: [PATCH v5 3/4] clk: keystone: sci-clk: add restore_context()
 operation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260407-ti-sci-jacinto-s2r-restore-irq-v5-3-97b28f2d93f9@bootlin.com>
References: <20260407-ti-sci-jacinto-s2r-restore-irq-v5-0-97b28f2d93f9@bootlin.com>
In-Reply-To: <20260407-ti-sci-jacinto-s2r-restore-irq-v5-0-97b28f2d93f9@bootlin.com>
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
 "Thomas Richard (TI)" <thomas.richard@bootlin.com>, 
 Dhruva Gole <d-gole@ti.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_072529_698101_4E24DA88 
X-CRM114-Status: GOOD (  12.69  )
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

Implement the restore_context() operation to restore the clock rate and the
clock parent state. The clock rate is saved in sci_clk struct during
set_rate() operation. The parent index is saved in sci_clk struct during
set_parent() operation. During clock registration, the core retrieves each
clock’s parent using get_parent() operation to ensure the internal clock
tree reflects the actual hardware state, including any configurations made
by the bootloader. So we also save the parent index in get_parent().

Reviewed-by: Dhruva Gole <d-gole@ti.com>
Signed-off-by: Thomas Richard (TI) <thomas.richard@bootlin.com>
---
 drivers/clk/keystone/sci-clk.c | 42 ++++++++++++++++++++++++++++++++++--------
 1 file changed, 34 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/keystone/sci-clk.c b/drivers/clk/keystone/sci-clk.c
index 9d5071223f4c..428050a05de3 100644
--- a/drivers/clk/keystone/sci-clk.c
+++ b/drivers/clk/keystone/sci-clk.c
@@ -47,6 +47,8 @@ struct sci_clk_provider {
  * @node:	 Link for handling clocks probed via DT
  * @cached_req:	 Cached requested freq for determine rate calls
  * @cached_res:	 Cached result freq for determine rate calls
+ * @parent_id:	 Parent index for this clock
+ * @rate:	 Clock rate
  */
 struct sci_clk {
 	struct clk_hw hw;
@@ -58,6 +60,8 @@ struct sci_clk {
 	struct list_head node;
 	unsigned long cached_req;
 	unsigned long cached_res;
+	u8 parent_id;
+	unsigned long rate;
 };
 
 #define to_sci_clk(_hw) container_of(_hw, struct sci_clk, hw)
@@ -210,10 +214,16 @@ static int sci_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 			    unsigned long parent_rate)
 {
 	struct sci_clk *clk = to_sci_clk(hw);
+	int ret;
+
+	ret = clk->provider->ops->set_freq(clk->provider->sci, clk->dev_id,
+					   clk->clk_id, rate / 10 * 9, rate,
+					   rate / 10 * 11);
 
-	return clk->provider->ops->set_freq(clk->provider->sci, clk->dev_id,
-					    clk->clk_id, rate / 10 * 9, rate,
-					    rate / 10 * 11);
+	if (!ret)
+		clk->rate = rate;
+
+	return ret;
 }
 
 /**
@@ -237,9 +247,9 @@ static u8 sci_clk_get_parent(struct clk_hw *hw)
 		return 0;
 	}
 
-	parent_id = parent_id - clk->clk_id - 1;
+	clk->parent_id = (u8)(parent_id - clk->clk_id - 1);
 
-	return (u8)parent_id;
+	return clk->parent_id;
 }
 
 /**
@@ -252,12 +262,27 @@ static u8 sci_clk_get_parent(struct clk_hw *hw)
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
+
+	if (clk->rate)
+		sci_clk_set_rate(hw, clk->rate, 0);
 }
 
 static const struct clk_ops sci_clk_ops = {
@@ -269,6 +294,7 @@ static const struct clk_ops sci_clk_ops = {
 	.set_rate = sci_clk_set_rate,
 	.get_parent = sci_clk_get_parent,
 	.set_parent = sci_clk_set_parent,
+	.restore_context = sci_clk_restore_context,
 };
 
 /**

-- 
2.53.0


