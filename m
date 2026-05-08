Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B0CDCD3445
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 15:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B3kVqp2D30ZiifaCkY7PynVemZLjHxNADA2gX5jVbtM=; b=CIAIbOaJIy0WiRX68L+7ejEcAe
	mBQIUO9jWJmcdZVhFU/371mXU/AlCB/81cQT0gR6cXvf7LLKiZB7qZKRzsZU6Bi1qfCETDL7/Qao3
	FFBfg3wz2PRWZjiMYkbe+6TADgQinw+DoNRUH2ERQPpzLdD6NzAf8lM8piQaCPNUnEfOY0tjEoZCd
	JNOphhVk4WBMWhKSvPXirUiGbdF8edC4ywuizFNlGdyCLrqKjEEKzoQFKYVIJRZWclgoDpzAkv8uB
	XyptdJwoaEzBIY0xZGxrA+LrTF2THAVb8UQDKzi7TRTIPhUIHT7D060ejJtfC/zFJ1OCSF19HoWxO
	vdNg14MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLNCz-00000006r8e-1sul;
	Fri, 08 May 2026 15:33:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLNCs-00000006r3w-0Cil
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 08 May 2026 15:33:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=B3kVqp2D30ZiifaCkY7PynVemZLjHxNADA2gX5jVbtM=; b=TqFSExhVaeT7dArMcjFsTxott3
	Wpc/zhqiR7c3QqBFjYc+nljUJl8xonewbKEkfpGgaUGFy8ODLjAOmmSK7/4uw478/1PsbfcKO6YZX
	OAmN0CGM99WS89mSq3GIhNhC/lN9uhMppgKQ2A0SKlzewM1elk/vGddsTpWeznR7qsDjQCZcDsX25
	ztWD0ORuqAPs5tUMnCQEjAJ5pbz7OBDeDtK6vvVEUxA8rJiOKPvh9jrDQuk55a4e1tAvhMYTQXRv+
	Aur17nAjpGjzz7OQ3l+CPdwM1PePYRFcioPKGxMQBtwCmB5wx1qomxoScyiyUv5i+gU+AYFsW4YNR
	xT5f2j5A==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLNCo-00000006iHD-3RzL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 15:33:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C6325359E;
	Fri,  8 May 2026 08:33:28 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 743F63F836;
	Fri,  8 May 2026 08:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778254414; bh=FouQA+bv5j1EdgH3z1eqPEIT8/R9xB/bagn+V+J4Zec=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CkBDpsTPkap51NtTKTkH61LfsmVJoygGaWWLw8PJ7Vyb/nPrHR7mwKoCQhjuEa2md
	 FwIUj/E+qbclws9F2vloxdYT52jBqVw6HZthpC7ou0JC6lOaOGHkIlFofw422jTZWO
	 RAawwhAvzEzusEPfZE6op+RZxN63fFDL1MkeGxms=
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
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v4 02/15] firmware: arm_scmi: Add clock determine_rate operation
Date: Fri,  8 May 2026 16:32:47 +0100
Message-ID: <20260508153300.2224715-3-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260508153300.2224715-1-cristian.marussi@arm.com>
References: <20260508153300.2224715-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_163335_510945_A25B0F88 
X-CRM114-Status: GOOD (  18.00  )
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


