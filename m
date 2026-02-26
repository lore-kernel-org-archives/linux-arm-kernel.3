Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9E45FCE087
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 14:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SKb9qBQ+COjv2wHGcuaB8wKXg1qlcN8WdAY0QPq56sw=; b=sBrlgH+M36SFcwmP7H0jptH9cn
	WPRhSKRCx8d1s+vbQ9f2RVT7LwZDnR8zL3aZvF3VgJoIGg8hJdMmYUA9UmHVoUmdBjBgZAxLRKQ/Q
	et1uFS8SPeEB4MhE0H7wCiw1hzj+60Y5OiP4jR+imz9pWDhMfAxO7KmoduSCYojnlQDjCqwNz/LAB
	gVGJj0GiFtOL2q/bMOe3OyiJDikR1QUB1r3CnsSEW8SQaou57o83ubO82dejg295kX3F15m1Vtbu6
	1BeVqzHPcG3lcD6/3gQETvVq+9uJz8UQp/xcGiYE35yjRm6vtK7A9bqlT8Bga21Wc3PnizcEMXMXn
	Xp1zN1HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvcCs-00000006J5v-1WS4;
	Thu, 26 Feb 2026 14:19:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvcCg-00000006IuF-0zF9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 14:19:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C73BA15A1;
	Thu, 26 Feb 2026 06:18:50 -0800 (PST)
Received: from donnerap.manchester.arm.com (donnerap.manchester.arm.com [10.33.8.81])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AE28A3F73B;
	Thu, 26 Feb 2026 06:18:54 -0800 (PST)
From: Philip Radford <philip.radford@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	linux-pm@vger.kernel.org
Cc: sudeep.holla@arm.com,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	quic_sibis@quicinc.com,
	dan.carpenter@linaro.org,
	d-gole@ti.com,
	souvik.chakravarty@arm.com,
	Cristian Marussi <cristian.marussi@arm.com>,
	Philip Radford <philip.radford@arm.com>
Subject: [PATCH v3 5/9] firmware: arm_scmi: Add SCMIV4.0 Powercap notifications support
Date: Thu, 26 Feb 2026 14:18:26 +0000
Message-ID: <20260226141830.3400924-6-philip.radford@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260226141830.3400924-1-philip.radford@arm.com>
References: <20260226141830.3400924-1-philip.radford@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_061858_319799_77C07C28 
X-CRM114-Status: GOOD (  12.58  )
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

From: Cristian Marussi <cristian.marussi@arm.com>

Extend notification support to the new SCMIv4.0 Powercap format that carry
also a CPL identifier where specified.

Since this addition completes SCMIv4.0 Powercap support bump also the
protocol version define.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
Signed-off-by: Philip Radford <philip.radford@arm.com>
---
 drivers/firmware/arm_scmi/powercap.c | 13 +++++++++----
 include/linux/scmi_protocol.h        |  3 ++-
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/arm_scmi/powercap.c b/drivers/firmware/arm_scmi/powercap.c
index 22bf8e480450..67331d9d4ced 100644
--- a/drivers/firmware/arm_scmi/powercap.c
+++ b/drivers/firmware/arm_scmi/powercap.c
@@ -18,7 +18,7 @@
 #include "notify.h"
 
 /* Updated only after ALL the mandatory features for that version are merged */
-#define SCMI_PROTOCOL_SUPPORTED_VERSION		0x20000
+#define SCMI_PROTOCOL_SUPPORTED_VERSION		0x30000
 
 #define CPL0	0
 
@@ -156,7 +156,8 @@ struct scmi_powercap_cap_changed_notify_payld {
 	__le32 agent_id;
 	__le32 domain_id;
 	__le32 power_cap;
-	__le32 pai;
+	__le32 avg_ivl;
+	__le32 cpli;
 };
 
 struct scmi_powercap_meas_changed_notify_payld {
@@ -1304,14 +1305,18 @@ scmi_powercap_fill_custom_report(const struct scmi_protocol_handle *ph,
 		const struct scmi_powercap_cap_changed_notify_payld *p = payld;
 		struct scmi_powercap_cap_changed_report *r = report;
 
-		if (sizeof(*p) != payld_sz)
+		if (sizeof(*p) > payld_sz)
 			break;
 
 		r->timestamp = timestamp;
 		r->agent_id = le32_to_cpu(p->agent_id);
 		r->domain_id = le32_to_cpu(p->domain_id);
 		r->power_cap = le32_to_cpu(p->power_cap);
-		r->pai = le32_to_cpu(p->pai);
+		r->avg_ivl = le32_to_cpu(p->avg_ivl);
+		if (sizeof(*p) == payld_sz)
+			r->cpli = le32_to_cpu(p->cpli);
+		else
+			r->cpli = 0;
 		*src_id = r->domain_id;
 		rep = r;
 		break;
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 547ab4763a63..299fa8499b3f 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -1125,7 +1125,8 @@ struct scmi_powercap_cap_changed_report {
 	unsigned int	agent_id;
 	unsigned int	domain_id;
 	unsigned int	power_cap;
-	unsigned int	pai;
+	unsigned int	avg_ivl;
+	unsigned int	cpli;
 };
 
 struct scmi_powercap_meas_changed_report {
-- 
2.47.3


