Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF7E3C369B4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 14:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bTGC1Swmyp5o5ydafC25FiEDYeygl74JbWXdajolsGw=; b=A46kx48K0KUQrAXdPI71vJaLLL
	NrImAKM72PSrUDGTj4lJPFnmjL8pnXHlXDjJ3Ty6n9JPu8L+C6dTmImypv3rHrWTGR16c6CzrQKWs
	N9XTqEzRD20Yf2cnv+bZ4H2wTUkg4xspImwVyZdISvOov9V4tUY0U5W2LlPfLEi68hMH2P3s42+l/
	eGp7rnf0hEXLnOl1QU6N0Ks1F9sHHvklGu4sFutOMObxNeRYuMnVK8jttMwe0uuFwI6jkxyc7QfX5
	Ne2JpGzgtpaMf3Ndl/RiFZwBZhlnyc8aZRl+k87QYRwaEJGG6/xdcs59sCEmovPZsiGoeXiELSe31
	oYqQqU4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4hQB-0000000675s-2Zcn;
	Tue, 15 Apr 2025 14:37:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4hIk-0000000661Q-1uFH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 14:30:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5CC161756;
	Tue, 15 Apr 2025 07:30:12 -0700 (PDT)
Received: from pluto.guest.local (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E2B293F694;
	Tue, 15 Apr 2025 07:30:11 -0700 (PDT)
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@arm.com,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	quic_sibis@quicinc.com,
	dan.carpenter@linaro.org,
	maz@kernel.org,
	johan@kernel.org,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH 3/4] firmware: arm_scmi: quirk: Fix CLOCK_DESCRIBE_RATES triplet
Date: Tue, 15 Apr 2025 15:29:32 +0100
Message-ID: <20250415142933.1746249-4-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250415142933.1746249-1-cristian.marussi@arm.com>
References: <20250415142933.1746249-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_073014_580925_A856E215 
X-CRM114-Status: GOOD (  16.01  )
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

Convert an existing quirk in CLOCK_DESCRIBE_RATES parsing to the new quirk
framework. This is a sort of a peculiar quirk since it matches any platform
and any firmware.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/firmware/arm_scmi/clock.c  | 49 ++++++++++++++++--------------
 drivers/firmware/arm_scmi/quirks.c |  2 ++
 drivers/firmware/arm_scmi/quirks.h |  3 ++
 3 files changed, 32 insertions(+), 22 deletions(-)

diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
index 2ed2279388f0..cb9839ec96d7 100644
--- a/drivers/firmware/arm_scmi/clock.c
+++ b/drivers/firmware/arm_scmi/clock.c
@@ -11,6 +11,7 @@
 
 #include "protocols.h"
 #include "notify.h"
+#include "quirks.h"
 
 /* Updated only after ALL the mandatory features for that version are merged */
 #define SCMI_PROTOCOL_SUPPORTED_VERSION		0x30000
@@ -429,6 +430,31 @@ static void iter_clk_describe_prepare_message(void *message,
 	msg->rate_index = cpu_to_le32(desc_index);
 }
 
+#define QUIRK_OUT_OF_SPEC_TRIPLET					       \
+	({								       \
+	/* Warn about out of spec replies ... */			       \
+	if (!p->clk->rate_discrete &&					       \
+	    (st->num_returned != 3 || st->num_remaining != 0)) {	       \
+		dev_warn(p->dev,					       \
+			 "Out-of-spec CLOCK_DESCRIBE_RATES reply for %s - returned:%d remaining:%d rx_len:%zd\n",\
+			 p->clk->name, st->num_returned, st->num_remaining,    \
+			 st->rx_len);					       \
+		/*							       \
+		 * A known quirk: a triplet is returned but num_returned != 3  \
+		 * Check for a safe payload size and fix.		       \
+		 */							       \
+		if (st->num_returned != 3 && st->num_remaining == 0 &&	       \
+		    st->rx_len == sizeof(*r) + sizeof(__le32) * 2 * 3) {       \
+			st->num_returned = 3;				       \
+			st->num_remaining = 0;				       \
+		} else {						       \
+			dev_err(p->dev,					       \
+				"Cannot fix out-of-spec reply !\n");	       \
+			return -EPROTO;					       \
+		}							       \
+	}								       \
+	})
+
 static int
 iter_clk_describe_update_state(struct scmi_iterator_state *st,
 			       const void *response, void *priv)
@@ -442,28 +468,7 @@ iter_clk_describe_update_state(struct scmi_iterator_state *st,
 	st->num_returned = NUM_RETURNED(flags);
 	p->clk->rate_discrete = RATE_DISCRETE(flags);
 
-	/* Warn about out of spec replies ... */
-	if (!p->clk->rate_discrete &&
-	    (st->num_returned != 3 || st->num_remaining != 0)) {
-		dev_warn(p->dev,
-			 "Out-of-spec CLOCK_DESCRIBE_RATES reply for %s - returned:%d remaining:%d rx_len:%zd\n",
-			 p->clk->name, st->num_returned, st->num_remaining,
-			 st->rx_len);
-
-		/*
-		 * A known quirk: a triplet is returned but num_returned != 3
-		 * Check for a safe payload size and fix.
-		 */
-		if (st->num_returned != 3 && st->num_remaining == 0 &&
-		    st->rx_len == sizeof(*r) + sizeof(__le32) * 2 * 3) {
-			st->num_returned = 3;
-			st->num_remaining = 0;
-		} else {
-			dev_err(p->dev,
-				"Cannot fix out-of-spec reply !\n");
-			return -EPROTO;
-		}
-	}
+	SCMI_QUIRK(clock_rates_triplet_out_of_spec, QUIRK_OUT_OF_SPEC_TRIPLET);
 
 	return 0;
 }
diff --git a/drivers/firmware/arm_scmi/quirks.c b/drivers/firmware/arm_scmi/quirks.c
index 2f95b35b5ca1..b523bd1ca49f 100644
--- a/drivers/firmware/arm_scmi/quirks.c
+++ b/drivers/firmware/arm_scmi/quirks.c
@@ -86,6 +86,7 @@ struct scmi_quirk {
 	__DEFINE_SCMI_QUIRK_ENTRY(_qn, _comp, _ven, _sub, _impl)
 
 /* Global Quirks Definitions */
+DEFINE_SCMI_QUIRK(clock_rates_triplet_out_of_spec, NULL, NULL, NULL, NULL);
 
 /*
  * Quirks Pointers Array
@@ -94,6 +95,7 @@ struct scmi_quirk {
  * defined quirks descriptors.
  */
 static struct scmi_quirk *scmi_quirks_table[] = {
+	__DECLARE_SCMI_QUIRK_ENTRY(clock_rates_triplet_out_of_spec),
 	NULL
 };
 
diff --git a/drivers/firmware/arm_scmi/quirks.h b/drivers/firmware/arm_scmi/quirks.h
index 0f1a14b13ba5..e5252ba4774b 100644
--- a/drivers/firmware/arm_scmi/quirks.h
+++ b/drivers/firmware/arm_scmi/quirks.h
@@ -37,4 +37,7 @@ static inline void scmi_quirks_enable(struct device *dev, const char *compat,
 
 #endif /* CONFIG_ARM_SCMI_QUIRKS */
 
+/* Quirk delarations */
+DECLARE_SCMI_QUIRK(clock_rates_triplet_out_of_spec);
+
 #endif /* _SCMI_QUIRKS_H */
-- 
2.47.0


