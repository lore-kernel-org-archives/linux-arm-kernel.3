Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49A33F483C8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 16:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KUfVB4U6PsjTr0OtZC6D3yWZb9ZhT/+0nVvPkT+DJMg=; b=31IQjT+dnNSFLusNxlI5OwNDHu
	2x+Lqz9SoAUYwmi9w76P/b27iqxmKjAIyfHsvoFZRXEVXOln5aSgWi2wcHE40hFgFmzyVQd8lNRkx
	hCJ1t2x38al52nH4ly5cVSWTK2zWaF3rfgziZjcLOri5YF0NfkGuXtSU5VKFPjOW4jn2lolCq7klS
	Nml2qvyuZJzsPbBdJqhYpPRNHhYp1JrHTzPvdEyIgBuFcI0gCJXlbarfGPQAVU9IgY3w6ScRclSmZ
	f8Sl/NZBWGIFd6QYZGyltqqZwedy7zME/q0DD9ghHOgr4qz0hxcv/6TG6OfnGICvTHpiBPWkDuHP/
	PtXf8aFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4iZm-0000000HBCO-1VbE;
	Mon, 23 Mar 2026 16:56:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4iZh-0000000HB9G-09fB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 16:56:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CFB9C43D63;
	Mon, 23 Mar 2026 16:56:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18083C2BC9E;
	Mon, 23 Mar 2026 16:56:17 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/3] firmware: arm_scmi: Fix OOB in scmi_clock_describe_rates_get_lazy()
Date: Mon, 23 Mar 2026 17:56:10 +0100
Message-ID: <9928133be47a09af0c568bcee0f9a987381a1c15.1774283748.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1774283748.git.geert+renesas@glider.be>
References: <cover.1774283748.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_095621_118330_434C5533 
X-CRM114-Status: GOOD (  15.86  )
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

Lazy discovery of discrete rates works as follows:
  A. Grab the first three rates,
  B. Grab the last rate, if there are more than three rates.

It is up to the SCMI provider implementation to decide how many rates
are returned in response to a single CLOCK_DESCRIBE_RATES command.  Each
rate received is stored in the scmi_clock_rates.rates[] array, and
.num_rates is updated accordingly.

When more than 3 rates have been received after step A, the last rate
may have been received already, and stored in scmi_clock_rates.rates[]
(which has space for scmi_clock_desc.tot_rates entries).  Hence grabbing
the last rate again will store it a second time, beyond the end of the
array.

Fix this by only grabbing the last rate when we don't already have it.

Fixes: a78da552c6f3bff5 ("firmware: arm_scmi: Use bound iterators to minimize discovered rates")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This bug caused random "kernel BUG at drivers/base/devres.c:135!"
crashes during boot on R-Car X5H.

Example for a clock with 8 rates, which are all returned in response to
a single CLOCK_DESCRIBE_RATES command:

    scmi_clock_describe_rates_get_lazy: Grabbing rates 0..2
    iter_clk_describe_update_state: Returned 8 remaining 0
    iter_clk_describe_update_state: Allocating 8 rates
    iter_clk_describe_process_response: rates[0] = 33333333
    iter_clk_describe_process_response: rates[1] = 66666666
    iter_clk_describe_process_response: rates[2] = 133333333
    iter_clk_describe_process_response: rates[3] = 266666666
    iter_clk_describe_process_response: rates[4] = 355555555
    iter_clk_describe_process_response: rates[5] = 533333333
    iter_clk_describe_process_response: rates[6] = 711111111
    iter_clk_describe_process_response: rates[7] = 1066666666
                                                   ^^^^^^^^^^
    scmi_clock_describe_rates_get_lazy: Grabbing rates 7..7
    iter_clk_describe_update_state: Returned 1 remaining 0
    iter_clk_describe_process_response: rates[8] = 1066666666
                                              ^    ^^^^^^^^^^
Out of bounds access! ------------------------+    |
Same value as [7] ---------------------------------+
 drivers/firmware/arm_scmi/clock.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
index 0e7e341171aad829..623dbc2f1e09303d 100644
--- a/drivers/firmware/arm_scmi/clock.c
+++ b/drivers/firmware/arm_scmi/clock.c
@@ -593,8 +593,11 @@ scmi_clock_describe_rates_get_lazy(const struct scmi_protocol_handle *ph,
 	if (ret)
 		goto out;
 
-	/* If discrete grab the last value, which should be the max */
-	if (clkd->r.rate_discrete && clkd->tot_rates > 3) {
+	/*
+	 * If discrete and we don't already have it, grab the last value, which
+	 * should be the max
+	 */
+	if (clkd->r.rate_discrete && clkd->tot_rates > clkd->r.num_rates) {
 		first = clkd->tot_rates - 1;
 		last = clkd->tot_rates - 1;
 		ret = ph->hops->iter_response_run_bound(iter, &first, &last);
-- 
2.43.0


