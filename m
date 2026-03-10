Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F208AFD4F1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 18:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B3kVqp2D30ZiifaCkY7PynVemZLjHxNADA2gX5jVbtM=; b=OaoQ4PXvtW2e4SpKr55wZLfKPd
	/xPFX198g04OGpJEQmE19dqXMJ9Mowjcu8qomWUZknjS0cIu+lDShlk+v4fBhES2U9OToK8l1t/M4
	Dgr7C2l2gGy6BHIqL3gu34RPACuFQo17KMnBBTHKaq9De39cy8P6ovU6DiZo9Bx3hEjHFbvQi9+W6
	pgxK9q1KOtnySX3Ii2NO/pEm5VXeEYRoRUdpup5ILmfrfV1GcF2gqFNk3Q6ZHWpDhalzTvaSBhzoO
	FBA4qNaAgQEXK1OeLA2j3uuCuqa61IBcY3v7J8Qig6CS8vmPAAmNj7YIgvCoiN3RGTw6Nsb9dXdSZ
	i2cUVkSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w020k-0000000A6E4-0rth;
	Tue, 10 Mar 2026 18:40:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w020h-0000000A6Bd-1Jnq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 18:40:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 976191596;
	Tue, 10 Mar 2026 11:40:43 -0700 (PDT)
Received: from pluto.guest.local (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BCAD83F7BD;
	Tue, 10 Mar 2026 11:40:46 -0700 (PDT)
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
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v2 02/13] firmware: arm_scmi: Add clock determine_rate operation
Date: Tue, 10 Mar 2026 18:40:19 +0000
Message-ID: <20260310184030.3669330-3-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310184030.3669330-1-cristian.marussi@arm.com>
References: <20260310184030.3669330-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_114051_447171_8FA1020A 
X-CRM114-Status: GOOD (  17.64  )
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

Add a clock operation to help determining the effective rate, closest to
the required one, that a specific clock can support.

Calculation is currently performed kernel side and the logic is taken
directly from the SCMI Clock driver: embedding the determinate rate logic
in the protocol layer enables simplifications in the SCMI Clock protocol
interface and will more easily accommodate further evolutions where such
determine_rate logic into is optionally delegated to the platform SCMI
server.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v1 --> v2
 - use the fixed rounding algo using div64_ul

Spoiler alert next SCMI spec will most probably include a new
CLOCK_DETERMINE_RATE command to delegate to the platform such calculations,
so this clock proto_ops will be needed anyway sooner or later
---
 drivers/firmware/arm_scmi/clock.c | 42 +++++++++++++++++++++++++++++++
 include/linux/scmi_protocol.h     |  6 +++++
 2 files changed, 48 insertions(+)

diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
index ab36871650a1..54b55517b759 100644
--- a/drivers/firmware/arm_scmi/clock.c
+++ b/drivers/firmware/arm_scmi/clock.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2018-2022 ARM Ltd.
  */
 
+#include <linux/math64.h>
 #include <linux/module.h>
 #include <linux/limits.h>
 #include <linux/sort.h>
@@ -624,6 +625,46 @@ static int scmi_clock_rate_set(const struct scmi_protocol_handle *ph,
 	return ret;
 }
 
+static int scmi_clock_determine_rate(const struct scmi_protocol_handle *ph,
+				     u32 clk_id, unsigned long *rate)
+{
+	u64 fmin, fmax, ftmp;
+	struct scmi_clock_info *clk;
+	struct clock_info *ci = ph->get_priv(ph);
+
+	if (!rate)
+		return -EINVAL;
+
+	clk = scmi_clock_domain_lookup(ci, clk_id);
+	if (IS_ERR(clk))
+		return PTR_ERR(clk);
+
+	/*
+	 * If we can't figure out what rate it will be, so just return the
+	 * rate back to the caller.
+	 */
+	if (clk->rate_discrete)
+		return 0;
+
+	fmin = clk->range.min_rate;
+	fmax = clk->range.max_rate;
+	if (*rate <= fmin) {
+		*rate = fmin;
+		return 0;
+	} else if (*rate >= fmax) {
+		*rate = fmax;
+		return 0;
+	}
+
+	ftmp = *rate - fmin;
+	ftmp += clk->range.step_size - 1; /* to round up */
+	ftmp = div64_ul(ftmp, clk->range.step_size);
+
+	*rate = ftmp * clk->range.step_size + fmin;
+
+	return 0;
+}
+
 static int
 scmi_clock_config_set(const struct scmi_protocol_handle *ph, u32 clk_id,
 		      enum clk_state state,
@@ -936,6 +977,7 @@ static const struct scmi_clk_proto_ops clk_proto_ops = {
 	.info_get = scmi_clock_info_get,
 	.rate_get = scmi_clock_rate_get,
 	.rate_set = scmi_clock_rate_set,
+	.determine_rate = scmi_clock_determine_rate,
 	.enable = scmi_clock_enable,
 	.disable = scmi_clock_disable,
 	.state_get = scmi_clock_state_get,
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index aafaac1496b0..28579c145045 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -91,6 +91,10 @@ enum scmi_clock_oem_config {
  * @info_get: get the information of the specified clock
  * @rate_get: request the current clock rate of a clock
  * @rate_set: set the clock rate of a clock
+ * @determine_rate: determine the effective rate that can be supported by a
+ *		    clock calculating the closest allowed rate.
+ *		    Note that @rate is an input/output parameter used both to
+ *		    describe the requested rate and report the closest match
  * @enable: enables the specified clock
  * @disable: disables the specified clock
  * @state_get: get the status of the specified clock
@@ -108,6 +112,8 @@ struct scmi_clk_proto_ops {
 			u64 *rate);
 	int (*rate_set)(const struct scmi_protocol_handle *ph, u32 clk_id,
 			u64 rate);
+	int (*determine_rate)(const struct scmi_protocol_handle *ph, u32 clk_id,
+			      unsigned long *rate);
 	int (*enable)(const struct scmi_protocol_handle *ph, u32 clk_id,
 		      bool atomic);
 	int (*disable)(const struct scmi_protocol_handle *ph, u32 clk_id,
-- 
2.53.0


