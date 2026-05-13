Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C35ABCD4F24
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 12:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EwRPiIEo/L1VPqk9XuGNzrdJYTYEE9HEJYJMUXG5Nd4=; b=XCTp6hI6II0fFQBSTFSqE02lOo
	HY2ea6mxS/9kgy6GHlih8svCSeFDsPHXuRpoASVjI/6CgAKKPkyZo/AW/Thr3OFMF0vO+BJiNkfpB
	b+aSVUYbqUKTjr0qOLA4UBqfwpjt5Itg3yvmrxVEp3H+Mpin68cGKlB80hk9/ysyAj8c8TmqwoXjV
	6422vzNdbR2F7hs7JZJclEMWvh18pxdwyriHhFtUifeJfFaXRyc5rZKiylmx6wgGcr6sdyEH+MEHE
	P5Z32kja5QKzHLPibrbCt0GyIcpBFeM0oTbvl8IVDKSxsRGZx+JFZM1B7qqPJgLTTw9CaoqhYmvKJ
	PLOAsYTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN8zC-00000002XoF-2RNH;
	Wed, 13 May 2026 12:46:50 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN8z5-00000002XjA-1QK5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 12:46:44 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 59173C5DC59;
	Wed, 13 May 2026 12:47:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DFC455FE21;
	Wed, 13 May 2026 12:46:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A31C111AF8AA4;
	Wed, 13 May 2026 14:46:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778676400; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=EwRPiIEo/L1VPqk9XuGNzrdJYTYEE9HEJYJMUXG5Nd4=;
	b=YwQ6HwQAZnfJBcMbDOTFobT25Gfkqf7jOxUDGQGqQOngyoQjMAEiwoolBKaQjxT1eCVTQG
	/H/pi+mxVAhonXu0UOXbTWL5Caq2Oe1bCy5gA1pbErbB1mJJR74koDkRyttl0lfgeU33VE
	ZuYE9wMkU4ZZFBKnx3/6ij5OU5A42fiNQDLs7Ivu7dCKFlGeJf4i67cJLZIzqiYoZYaiSh
	fle+zxIXriR9saaQqpZ8xUEtGKZ7b9LRmmqULFlkfcQoC4eln45d6BgHmFL3P72u1qW13P
	nmpNXocCFV1dHIYQ94iv1oQd1/VWggvpIcApx5+Z9WsCAFjQCZrxy1NjGVDXUA==
From: "Thomas Richard (TI)" <thomas.richard@bootlin.com>
Date: Wed, 13 May 2026 14:46:25 +0200
Subject: [PATCH v8 3/4] clk: keystone: sci-clk: add restore_context()
 operation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260513-ti-sci-jacinto-s2r-restore-irq-v8-3-195b27f91519@bootlin.com>
References: <20260513-ti-sci-jacinto-s2r-restore-irq-v8-0-195b27f91519@bootlin.com>
In-Reply-To: <20260513-ti-sci-jacinto-s2r-restore-irq-v8-0-195b27f91519@bootlin.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Santosh Shilimkar <ssantosh@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, 
 richard.genoud@bootlin.com, Udit Kumar <u-kumar1@ti.com>, 
 Abhash Kumar <a-kumar2@ti.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, 
 "Thomas Richard (TI)" <thomas.richard@bootlin.com>, 
 Dhruva Gole <d-gole@ti.com>, Kendall Willis <k-willis@ti.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_054643_517324_F051B3E7 
X-CRM114-Status: GOOD (  13.83  )
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
set_rate() and recalc_rate() operations. The parent index is saved in
sci_clk struct during set_parent() operation. During clock registration,
the core retrieves each clock’s parent using get_parent() operation to
ensure the internal clock tree reflects the actual hardware state,
including any configurations made by the bootloader. So we also save the
parent index in get_parent().

Reviewed-by: Dhruva Gole <d-gole@ti.com>
Reviewed-by: Kendall Willis <k-willis@ti.com>
Acked-by: Stephen Boyd <sboyd@kernel.org>
Reviewed-by: Brian Masney <bmasney@redhat.com>
Signed-off-by: Thomas Richard (TI) <thomas.richard@bootlin.com>
---
 drivers/clk/keystone/sci-clk.c | 45 ++++++++++++++++++++++++++++++++++--------
 1 file changed, 37 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/keystone/sci-clk.c b/drivers/clk/keystone/sci-clk.c
index 9d5071223f4c..7c0f7b3e89e0 100644
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
+	int parent_id;
+	unsigned long rate;
 };
 
 #define to_sci_clk(_hw) container_of(_hw, struct sci_clk, hw)
@@ -150,6 +154,8 @@ static unsigned long sci_clk_recalc_rate(struct clk_hw *hw,
 		return 0;
 	}
 
+	clk->rate = freq;
+
 	return freq;
 }
 
@@ -210,10 +216,15 @@ static int sci_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 			    unsigned long parent_rate)
 {
 	struct sci_clk *clk = to_sci_clk(hw);
+	int ret;
 
-	return clk->provider->ops->set_freq(clk->provider->sci, clk->dev_id,
-					    clk->clk_id, rate / 10 * 9, rate,
-					    rate / 10 * 11);
+	ret = clk->provider->ops->set_freq(clk->provider->sci, clk->dev_id,
+					   clk->clk_id, rate / 10 * 9, rate,
+					   rate / 10 * 11);
+	if (!ret)
+		clk->rate = rate;
+
+	return ret;
 }
 
 /**
@@ -234,12 +245,13 @@ static u8 sci_clk_get_parent(struct clk_hw *hw)
 		dev_err(clk->provider->dev,
 			"get-parent failed for dev=%d, clk=%d, ret=%d\n",
 			clk->dev_id, clk->clk_id, ret);
+		clk->parent_id = ret;
 		return 0;
 	}
 
-	parent_id = parent_id - clk->clk_id - 1;
+	clk->parent_id = parent_id - clk->clk_id - 1;
 
-	return (u8)parent_id;
+	return (u8)clk->parent_id;
 }
 
 /**
@@ -252,12 +264,28 @@ static u8 sci_clk_get_parent(struct clk_hw *hw)
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
+	if (clk->num_parents > 1 && clk->parent_id >= 0)
+		sci_clk_set_parent(hw, (u8)clk->parent_id);
+
+	if (clk->rate)
+		sci_clk_set_rate(hw, clk->rate, 0);
 }
 
 static const struct clk_ops sci_clk_ops = {
@@ -269,6 +297,7 @@ static const struct clk_ops sci_clk_ops = {
 	.set_rate = sci_clk_set_rate,
 	.get_parent = sci_clk_get_parent,
 	.set_parent = sci_clk_set_parent,
+	.restore_context = sci_clk_restore_context,
 };
 
 /**

-- 
2.53.0


