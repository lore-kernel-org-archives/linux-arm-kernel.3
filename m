Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BC3BF483D7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 16:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QNmbo9n65pXEsQ9XFD/j7JU1Z0t6i0RjZvYv9WD3xf8=; b=G3YmJolrHAMpprrvA4Gc4vm9uC
	om8zqOesEsDcMWKL0HHUruELLxolpVYcwX7hElnvrZJMddGT5axhhXbqv6p4szHvo6/6wfXbA0TN9
	FdR3yoMBKUp77EaOMJVE+O6LoUzsvaF+N/yZVOOXbAiZ/lQ8X3+alCAt5eYTsvi4XcxuASoAH8rLt
	WFXFNt2cJpNu+1PCg992KMbpaPdzXoOPq99HYZMqoey+uX++RytbySth+op5o1F4NVLmzE2AF4Npc
	bZv/W+cQR+5trLwr/3qpbBmo1XgkKZJKv/OoVwRUOL2az5vkdoyYM4KLyVyeMMHryfGBjlwTBA773
	B6AbQKyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4iZm-0000000HBCj-2hzS;
	Mon, 23 Mar 2026 16:56:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4iZi-0000000HBA5-0yhq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 16:56:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E58D9404F8;
	Mon, 23 Mar 2026 16:56:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C011C2BCB0;
	Mon, 23 Mar 2026 16:56:20 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/3] firmware: arm_scmi: Fix bound iterators returning too many items
Date: Mon, 23 Mar 2026 17:56:11 +0100
Message-ID: <8d9f0630e7ef2e3415df9800b6d9459063034977.1774283748.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1774283748.git.geert+renesas@glider.be>
References: <cover.1774283748.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_095622_369600_E488D281 
X-CRM114-Status: GOOD (  17.09  )
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

When using a bound-iterator with an upper bound, commands are sent, and
responses are received, until the upper bound is reached.  However, it
is up to the SCMI provider implementation to decide how many rates are
returned in response to a single CLOCK_DESCRIBE_RATES command.  If the
last response contains rates beyond the specified upper bound, they are
still passed up for further processing.  This may lead to buffer
overflows in unprepared callsites.

While the imprecise bound handling may have been intentional (it was
mentioned in the commit message introducing the code), it is still
confusing for users, and may cause hard to debug crashes.  Fix this by
strictly enforcing the upper bound.

Note that this may cause an increase in the number of
CLOCK_DESCRIBE_RATES commands issued, as retrieving the last rate may no
longer be done inadvertentently, but require its own command.

Fixes: 13289addf5a52e1f ("firmware: arm_scmi: Add bound iterators support")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This caused random "kernel BUG at drivers/base/devres.c:135!" crashes
during boot on R-Car X5H, as lazy clock rate discovery does not handle
correctly receiving more rates than expected.

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
Rates [3] to [7] are received, despite being outside the bound.

    scmi_clock_describe_rates_get_lazy: Grabbing rates 7..7
    iter_clk_describe_update_state: Returned 1 remaining 0
    iter_clk_describe_process_response: rates[8] = 1066666666
					      ^    ^^^^^^^^^^
Out of bounds access! ------------------------+    |
Same value as [7] ---------------------------------+
---
 drivers/firmware/arm_scmi/driver.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 2a9183686203b4e7..03fd7caa8b42a12c 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -1820,6 +1820,7 @@ static int __scmi_iterator_run(void *iter, unsigned int *start, unsigned int *en
 	const struct scmi_protocol_handle *ph;
 	struct scmi_iterator_state *st;
 	struct scmi_iterator *i;
+	unsigned int n;
 
 	if (!iter)
 		return -EINVAL;
@@ -1852,13 +1853,17 @@ static int __scmi_iterator_run(void *iter, unsigned int *start, unsigned int *en
 			return -EINVAL;
 		}
 
-		for (st->loop_idx = 0; st->loop_idx < st->num_returned; st->loop_idx++) {
+		if (end)
+			n = min(st->num_returned, *end - st->desc_index + 1);
+		else
+			n = st->num_returned;
+		for (st->loop_idx = 0; st->loop_idx < n; st->loop_idx++) {
 			ret = iops->process_response(ph, i->resp, st, i->priv);
 			if (ret)
 				return ret;
 		}
 
-		st->desc_index += st->num_returned;
+		st->desc_index += n;
 		ph->xops->reset_rx_to_maxsz(ph, i->t);
 		/*
 		 * check for both returned and remaining to avoid infinite
-- 
2.43.0


