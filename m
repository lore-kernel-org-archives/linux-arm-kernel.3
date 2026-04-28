Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6921FF886D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 20:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t2oV2koMfpIC4K+PJeHOSY50TcXkzLHkhL+QFnGLi9M=; b=jPeDcsquy+0iDHEgqHsACoQpxo
	7nLNMDUPpptHGlMROgustsdHgAkLspoGB9fZeE9wJhu/0CXIPOcDqL/fdV94nO/Hu3I2ScO1Dz/Gv
	TVb/NVy5LpbN3QVOkyY1Xw+80cLvnyt9+pCt6dzIrQ+stAEKzMiYurd9e9FhzAeGTGE3rd/QjfdX2
	/hDFKa284VbARN2HydIPrgC+bzcqvF/6c3zRZ9IUgAdQ+tpEy6rZ4Lv/7cWIqkQhj7uTj2gxvyRsa
	TytqzxDaJ+h32hrn+OdFg05dB2JAYgqXfCYrpVBMDQACxAAQqeUvrKM/iuN115a5v8AiV5gAS55en
	eJSxBtpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHorj-00000002PJH-2dLa;
	Tue, 28 Apr 2026 20:17:07 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHorX-00000002P2A-0lhV
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 28 Apr 2026 20:16:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=t2oV2koMfpIC4K+PJeHOSY50TcXkzLHkhL+QFnGLi9M=; b=D0OKrLlOrTDJj8/F9ZEikNijIr
	IZaqR7LcgqsAkF9zt+vTehnn3C6MQRFJMJJqpCFS+xKmhTJ4GZ8tk28Lh9ZzpeGnM0DDD42l3xzqC
	srIP6OFdwmz9NYURSPyZy16OEFrHUtDIcGVGhM5TLlvq1bJTQOWXhjpUX19tvD60kSrjtfkxaEgXU
	BVvc9kTXiAFy1tVxYhP2Al015DNyKZH45SzyFAQVeZ8zNBnz6eO+sERbS5jbTawG2kXjCl/Y+Y3hk
	CtOcDbqjphq2y1jrwXJgrlD6P0M+fJz3BKVvUYe8ktk4hQ7+qip5yP/vrQIbIyNG0VAhQ0Re3mJ6h
	wI+ks5dQ==;
Received: from foss.arm.com ([217.140.110.172])
	by casper.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHorS-00000004Oq5-17kR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 20:16:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 642DF3295;
	Tue, 28 Apr 2026 13:16:42 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7DBB53F763;
	Tue, 28 Apr 2026 13:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777407407; bh=AxDBdwk/l4DP4oCMpuyPHG7biswl244Z7Wb0hlRCNKM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M2A31r0Kaq8GNq9yXH8N4fFR25LcJGqKWN1DSOluFfiFblJk7ZVNWym76fXAc4fr8
	 wtqmPRO0QdvobTJeYwTV1ORk/GoWYqby8VZ+UZ+0OpBsYEkFNSgZWCvGtGeB/Ly5Y3
	 3QNcpvs2P/PXI4Y2Hg+1L8nY358RPM+0RL/rpuRo=
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: sudeep.holla@arm.com,
	philip.radford@arm.com,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@foss.st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	geert+renesas@glider.be,
	kuninori.morimoto.gx@renesas.com,
	marek.vasut+renesas@gmail.com,
	Cristian Marussi <cristian.marussi@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v3 05/15] clk: scmi: Use new simplified per-clock rate properties
Date: Tue, 28 Apr 2026 21:15:12 +0100
Message-ID: <20260428201522.903875-6-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260428201522.903875-1-cristian.marussi@arm.com>
References: <20260428201522.903875-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_211650_545752_984D6C6C 
X-CRM114-Status: GOOD (  13.47  )
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

Use the new min_rate and max_rate unified properties that provide the
proper values without having to consider the clock type.

Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v1 --> v2
 - Collected Peng Reviewed-by tag
---
 drivers/clk/clk-scmi.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/clk/clk-scmi.c b/drivers/clk/clk-scmi.c
index c223e4ef1dd1..7c562559ad8b 100644
--- a/drivers/clk/clk-scmi.c
+++ b/drivers/clk/clk-scmi.c
@@ -202,7 +202,6 @@ static int scmi_clk_ops_init(struct device *dev, struct scmi_clk *sclk,
 			     const struct clk_ops *scmi_ops)
 {
 	int ret;
-	unsigned long min_rate, max_rate;
 
 	struct clk_init_data init = {
 		.flags = CLK_GET_RATE_NOCACHE,
@@ -217,20 +216,8 @@ static int scmi_clk_ops_init(struct device *dev, struct scmi_clk *sclk,
 	if (ret)
 		return ret;
 
-	if (sclk->info->rate_discrete) {
-		int num_rates = sclk->info->list.num_rates;
-
-		if (num_rates <= 0)
-			return -EINVAL;
-
-		min_rate = sclk->info->list.rates[0];
-		max_rate = sclk->info->list.rates[num_rates - 1];
-	} else {
-		min_rate = sclk->info->range.min_rate;
-		max_rate = sclk->info->range.max_rate;
-	}
-
-	clk_hw_set_rate_range(&sclk->hw, min_rate, max_rate);
+	clk_hw_set_rate_range(&sclk->hw, sclk->info->min_rate,
+			      sclk->info->max_rate);
 	return ret;
 }
 
-- 
2.53.0


