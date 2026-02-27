Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FA35FEFB56
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 15:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ku2XfDfgyYEIDacon5EB2cwfFDg79hxN94SzyKuSAPA=; b=CiGXPclN+A7HiCGXLRLwnc/ktg
	dWZvGByZ6+wnzbThV1cL0FrxvyMBLecYAvfe9xS+ISkDzrqejaACuLw2/CEIL3s1iG9vWiCz7MaGT
	4IFAvTNy86GS3lhNcB4JTO7AuoaVIhT8wQ62opHJsQty8t9IxXI8nj1phxxyT3RZdlLTuY5QLbNMX
	Y9IdERBkm4yOhSih+BMEIwDtlMKWuko0bTZXXPEedlebaClOvkMyOAsN8nomjNVVIw7ldEWMXKZoZ
	wf4y5vskMUQyPSJ8FXFGiSV1YTwXfp1BLO6GomrVFpXXQud6cy5Vw/MNCoAtBO/ZM8gAnpsP22pLO
	lg6nmbCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzq9-00000008dpo-45jj;
	Fri, 27 Feb 2026 15:33:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzq9-00000008dpQ-1mr1
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Feb 2026 15:33:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Ku2XfDfgyYEIDacon5EB2cwfFDg79hxN94SzyKuSAPA=; b=h+ZTbDQK3LYgm75fYL4rtQ5GWI
	ajEG/M6JYXuAnpYY6kboYKfejjjzRsDlh490kyiqSMaiMoZPVsUw4E8ORRL4fT4LgFIn1C/tPIm9+
	rf3A0zMcY8dqm/ZmXn1XpqaPj6r1xpBaDv5wKw2rsYNsOdliDUly3x9D+6P9ggAu6Bq3JIGm1N3ou
	3iYObEe1kBDcJBWjt6xF/7NIhr+t0k2a4Mx64UFATgbQY/2zPEZLAgfHc6Xbjl3gJuzcBo0f+fJnJ
	iKIca6z8r0ZXfcUvV5NpId6OWNKfZLAeGB3pquRqiw9maJwMj8Dyhy5tQOBvz4cfKaCATQaSZ3oo8
	HqBoFTDA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzq6-0000000DNjS-1Ge8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 15:33:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 114D5339;
	Fri, 27 Feb 2026 07:33:07 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1C1593F73B;
	Fri, 27 Feb 2026 07:33:04 -0800 (PST)
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
	Brian Masney <bmasney@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH 02/11] clk: scmi: Use new determine_rate clock operation
Date: Fri, 27 Feb 2026 15:32:16 +0000
Message-ID: <20260227153225.2778358-3-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260227153225.2778358-1-cristian.marussi@arm.com>
References: <20260227153225.2778358-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_153314_545029_CB6F0F37 
X-CRM114-Status: GOOD (  15.46  )
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

Use the Clock protocol layer determine_rate logic to calculate the closest
rate that can be supported by a specific clock.

No functional change.

Cc: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
Note that the calculation logic in the protocol layer is exactly the same
as it wes here.

@Brian I suppose once your CLK_ROUNDING_FW_MANAGED sereis is merged I can flag
such SCMI clocks.
---
 drivers/clk/clk-scmi.c | 31 ++++++-------------------------
 1 file changed, 6 insertions(+), 25 deletions(-)

diff --git a/drivers/clk/clk-scmi.c b/drivers/clk/clk-scmi.c
index 6b286ea6f121..c223e4ef1dd1 100644
--- a/drivers/clk/clk-scmi.c
+++ b/drivers/clk/clk-scmi.c
@@ -12,7 +12,6 @@
 #include <linux/of.h>
 #include <linux/module.h>
 #include <linux/scmi_protocol.h>
-#include <asm/div64.h>
 
 #define NOT_ATOMIC	false
 #define ATOMIC		true
@@ -57,35 +56,17 @@ static unsigned long scmi_clk_recalc_rate(struct clk_hw *hw,
 static int scmi_clk_determine_rate(struct clk_hw *hw,
 				   struct clk_rate_request *req)
 {
-	u64 fmin, fmax, ftmp;
+	int ret;
 	struct scmi_clk *clk = to_scmi_clk(hw);
 
 	/*
-	 * We can't figure out what rate it will be, so just return the
-	 * rate back to the caller. scmi_clk_recalc_rate() will be called
-	 * after the rate is set and we'll know what rate the clock is
+	 * If we could not get a better rate scmi_clk_recalc_rate() will be
+	 * called after the rate is set and we'll know what rate the clock is
 	 * running at then.
 	 */
-	if (clk->info->rate_discrete)
-		return 0;
-
-	fmin = clk->info->range.min_rate;
-	fmax = clk->info->range.max_rate;
-	if (req->rate <= fmin) {
-		req->rate = fmin;
-
-		return 0;
-	} else if (req->rate >= fmax) {
-		req->rate = fmax;
-
-		return 0;
-	}
-
-	ftmp = req->rate - fmin;
-	ftmp += clk->info->range.step_size - 1; /* to round up */
-	do_div(ftmp, clk->info->range.step_size);
-
-	req->rate = ftmp * clk->info->range.step_size + fmin;
+	ret = scmi_proto_clk_ops->determine_rate(clk->ph, clk->id, &req->rate);
+	if (ret)
+		return ret;
 
 	return 0;
 }
-- 
2.53.0


