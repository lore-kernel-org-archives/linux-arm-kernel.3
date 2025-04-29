Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2E2AC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 14:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ewDIGsrTOKcK5t+6x0L4JQIY+2yd00ESNYr2i52+INc=; b=JVD12ikFJgPpdP3hcglUvda5rR
	+/K0K3FusVNc5yr95WnjIfXYElteYbOfczRgZVD0qyhs5v4xrHE7Sr0w+A7D7+yBa44X7CPw5iOlJ
	+kSyCVZhsKLnW17fSrHw5uEAuW58yrh+r41x3Mx8cg83tz8hD7SebIPV/HPgaFU84FtveKZGiqwpm
	GjFU2fwBrJs6b6Agpo1JoDel/AtgQ3EJMvdwEEzfHFCaaShSBXLIgn4+pFAoQC4ss1h/bhjRt7F8z
	0rZQ/fPZEB715L5tCXMQlvxEDx4cWZKq0bk+OtMjsBX62V40OIpZfm7SFMXBQ2cmrIuHgDT8XLWUk
	qN2MnwWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9lqY-00000009wQl-2jAn;
	Tue, 29 Apr 2025 14:22:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9lgR-00000009re1-2Bnj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 14:11:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 071E81516;
	Tue, 29 Apr 2025 07:11:32 -0700 (PDT)
Received: from pluto.guest.local (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9FAF53F66E;
	Tue, 29 Apr 2025 07:11:36 -0700 (PDT)
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
Subject: [PATCH v3 3/3] firmware: arm_scmi: quirk: Fix CLOCK_DESCRIBE_RATES triplet
Date: Tue, 29 Apr 2025 15:11:08 +0100
Message-ID: <20250429141108.406045-4-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250429141108.406045-1-cristian.marussi@arm.com>
References: <20250429141108.406045-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_071139_686476_CE3D6838 
X-CRM114-Status: GOOD (  16.58  )
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
index eff03a89de85..8958f1fa4c89 100644
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


