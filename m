Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AD7BFD4F16
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 18:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t2oV2koMfpIC4K+PJeHOSY50TcXkzLHkhL+QFnGLi9M=; b=C7YaTmMKQzZtTI3c09LJtNBX8E
	/2zlCnIHZzIFRrG3gHn+atpmYHGnhNB9COBwF9yWURD+5lGRNjY6DzGMFUuiOJeX1qR+Aev4fuiH9
	US1ULKlvQBV7VL+SRs0nn/tqTjt+foa29+cry9pIUfNa0fpHbjbD4wjlAm1EQ7WRf5or6LAs1+F+u
	tiewW/9z9HwhsRvwx4bEm5BN5ZUQ5H5TqK2h47B+I5Uu2X6lXVYl03OdIs4NZ6c2GsRQTUU0+yt+Z
	p/faZECFzM05RJqyQ0Lh5+KGBs+/3wd8/ThzUGJ2fV8rkGQI9LklfiyKdULlWpK+FMJFRFPDXiZPz
	/D8IunWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w020v-0000000A6PB-3gXW;
	Tue, 10 Mar 2026 18:41:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w020t-0000000A6Ml-0i4V
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 18:41:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9C1DD14BF;
	Tue, 10 Mar 2026 11:40:55 -0700 (PDT)
Received: from pluto.guest.local (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 080643F7BD;
	Tue, 10 Mar 2026 11:40:57 -0700 (PDT)
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
	dan.carpenter@linaro.org,
	geert+renesas@glider.be,
	kuninori.morimoto.gx@renesas.com,
	marek.vasut+renesas@gmail.com,
	Cristian Marussi <cristian.marussi@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v2 05/13] clk: scmi: Use new simplified per-clock rate properties
Date: Tue, 10 Mar 2026 18:40:22 +0000
Message-ID: <20260310184030.3669330-6-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310184030.3669330-1-cristian.marussi@arm.com>
References: <20260310184030.3669330-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_114103_259086_499850CD 
X-CRM114-Status: GOOD (  11.44  )
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


