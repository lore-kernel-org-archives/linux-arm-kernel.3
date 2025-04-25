Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 539B9C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 14:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+8EGQMM5MLAqPVyFlvBwKLH6Mrq8JE7W4/Wms+xUCS0=; b=0UEfa9PrdeGECYxwzR+NVDuDJI
	AA+ieCd807X+AUkIfPjt04IegKIGFbRAhqOlySSIXewLTP2DTTi4pNJDFy3aCmSbM9hlTBpJdqb2Y
	Nlx4mmVUfgJ1+GAYOClU2Ol2ip8v+G40DGsE1vwfyIf+5sBXfsUAeFhAqO01Y7xCD9Ot+9Zu281ta
	5UJi8VTq5TWk9A0KE9Pw5ODqfgu7wc8Dqp1v4lVWYqU7ZPNL++2xIE6F9ZYV/zcJ9H0Nt79YovUES
	/J+zUo3/dFJMsUWajAdgSyAm1O40yPXxxqZPz14ZKDkhp2c7wCiwItNuv6X9ZFAwkJyHyfAk1djql
	K1NIU0oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Jes-0000000HNCc-2Xpu;
	Fri, 25 Apr 2025 14:04:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8IYV-0000000HBRm-0RN5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 12:53:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3AE2C168F;
	Fri, 25 Apr 2025 05:53:17 -0700 (PDT)
Received: from pluto.. (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CC82D3F59E;
	Fri, 25 Apr 2025 05:53:19 -0700 (PDT)
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
Subject: [PATCH v2 3/4] firmware: arm_scmi: quirk: Fix CLOCK_DESCRIBE_RATES triplet
Date: Fri, 25 Apr 2025 13:52:49 +0100
Message-ID: <20250425125250.1847711-4-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250425125250.1847711-1-cristian.marussi@arm.com>
References: <20250425125250.1847711-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_055323_270915_2D92805D 
X-CRM114-Status: GOOD (  16.34  )
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
V1 -> V2
- reduced the quirk size by placing the warn outside
- using new compatibles conditions
---
 drivers/firmware/arm_scmi/clock.c  | 33 ++++++++++++++++++------------
 drivers/firmware/arm_scmi/quirks.c |  2 ++
 drivers/firmware/arm_scmi/quirks.h |  3 +++
 3 files changed, 25 insertions(+), 13 deletions(-)

diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
index 2ed2279388f0..afa7981efe82 100644
--- a/drivers/firmware/arm_scmi/clock.c
+++ b/drivers/firmware/arm_scmi/clock.c
@@ -11,6 +11,7 @@
 
 #include "protocols.h"
 #include "notify.h"
+#include "quirks.h"
 
 /* Updated only after ALL the mandatory features for that version are merged */
 #define SCMI_PROTOCOL_SUPPORTED_VERSION		0x30000
@@ -429,6 +430,23 @@ static void iter_clk_describe_prepare_message(void *message,
 	msg->rate_index = cpu_to_le32(desc_index);
 }
 
+#define QUIRK_OUT_OF_SPEC_TRIPLET					       \
+	({								       \
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
+	})
+
 static int
 iter_clk_describe_update_state(struct scmi_iterator_state *st,
 			       const void *response, void *priv)
@@ -450,19 +468,8 @@ iter_clk_describe_update_state(struct scmi_iterator_state *st,
 			 p->clk->name, st->num_returned, st->num_remaining,
 			 st->rx_len);
 
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
+		SCMI_QUIRK(clock_rates_triplet_out_of_spec,
+			   QUIRK_OUT_OF_SPEC_TRIPLET);
 	}
 
 	return 0;
diff --git a/drivers/firmware/arm_scmi/quirks.c b/drivers/firmware/arm_scmi/quirks.c
index 9e93a8242182..120ac933ed2e 100644
--- a/drivers/firmware/arm_scmi/quirks.c
+++ b/drivers/firmware/arm_scmi/quirks.c
@@ -167,6 +167,7 @@ struct scmi_quirk {
 	__DEFINE_SCMI_QUIRK_ENTRY(_qn, _ven, _sub, _impl, ##__VA_ARGS__)
 
 /* Global Quirks Definitions */
+DEFINE_SCMI_QUIRK(clock_rates_triplet_out_of_spec, NULL, NULL, NULL);
 
 /*
  * Quirks Pointers Array
@@ -175,6 +176,7 @@ struct scmi_quirk {
  * defined quirks descriptors.
  */
 static struct scmi_quirk *scmi_quirks_table[] = {
+	__DECLARE_SCMI_QUIRK_ENTRY(clock_rates_triplet_out_of_spec),
 	NULL
 };
 
diff --git a/drivers/firmware/arm_scmi/quirks.h b/drivers/firmware/arm_scmi/quirks.h
index 28829b4f0646..7fdc496c94c7 100644
--- a/drivers/firmware/arm_scmi/quirks.h
+++ b/drivers/firmware/arm_scmi/quirks.h
@@ -45,4 +45,7 @@ static inline void scmi_quirks_enable(struct device *dev, const char *vend,
 
 #endif /* CONFIG_ARM_SCMI_QUIRKS */
 
+/* Quirk delarations */
+DECLARE_SCMI_QUIRK(clock_rates_triplet_out_of_spec);
+
 #endif /* _SCMI_QUIRKS_H */
-- 
2.47.0


