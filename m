Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6FEAC79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 22:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1j9wKnDiaxLYDigh//DVrIH6H0+dbok0XcHonVWQW7A=; b=1OwTkqXUUHhgMBmhCbHFNwCSI8
	nRhBfrUjcO2PEG6prIpCA9bI4tjRLWjM3gBPZzEdMjaZErb3uZFv8GbGVtBnEulAi3ancSk7ldKoh
	7Oq5J/+KAT3iLviBO8YD0fKhlsSdYXQl6/rn+wv2JBnszHqYjyS+Ty9VWBIacQLw4j+cwNTsFtwcN
	bVQjmK9pWxFmpKETaTJEjCB/FhCTTMMrgirlm59Vy0d99lIhyOnBQN8d/8UPKpvvbkILt16qGxlAm
	8JLPO9QquBNRTJ/LwIIJcbh8wKi7XO5XmCJ76HPLLTFENZPfSiQVIWcgf5SAru9x63nk/aB4LegjA
	sx2rizYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4QPt-0000000CyDg-21kf;
	Wed, 09 Sep 2026 22:05:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4QPk-0000000Cy52-36GF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 22:05:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0F9BB176B;
	Wed,  9 Sep 2026 15:05:02 -0700 (PDT)
Received: from oss-apollo7005.lab.cambridge.arm.com (oss-apollo7005.lab.cambridge.arm.com [10.7.15.171])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 949DE3F7D8;
	Wed,  9 Sep 2026 15:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788991505; bh=AUmRRBG0p3l7xe1VGSaebjSPrd7WncpTGO59D2nhsYY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q/dhNs1YZkvYwakWRwUu+QSJrodOSlEEzb0bDry+wlhrWCq5AiHFIlSg/ZzK7JYAP
	 j1uMwxtdXrjPJ9RP5fiKBDN5hq88YthCUrFb4pUifMK7T75JWOX11ohLdRxg6h/A0i
	 p1BC5o/Pl4k1wPEOD5YbMQQrH1z9gcZ3CY8wAJ38=
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
	philip.radford@arm.com
Subject: [PATCH v9 07/13] firmware: arm_scmi: Extend powercap report to include MAI
Date: Wed,  9 Sep 2026 22:04:31 +0000
Message-Id: <20260909220437.1254412-8-philip.radford@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260909220437.1254412-1-philip.radford@arm.com>
References: <20260909220437.1254412-1-philip.radford@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_150508_863156_0D76B0AF 
X-CRM114-Status: GOOD (  17.05  )
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

Extend scmi_powercap_meas_changed_report to include MAI change
notifications.

Signed-off-by: Philip Radford <philip.radford@arm.com>
---
 drivers/firmware/arm_scmi/powercap.c | 28 +++++++++++++++-------------
 include/linux/scmi_protocol.h        |  1 +
 2 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/drivers/firmware/arm_scmi/powercap.c b/drivers/firmware/arm_scmi/powercap.c
index 0357784a1e8d..b032c8181458 100644
--- a/drivers/firmware/arm_scmi/powercap.c
+++ b/drivers/firmware/arm_scmi/powercap.c
@@ -11,6 +11,7 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/scmi_protocol.h>
+#include <linux/stddef.h>
 
 #include <trace/events/scmi.h>
 
@@ -21,6 +22,8 @@
 #define SCMI_PROTOCOL_SUPPORTED_VERSION		0x30000
 
 #define CPL0	0
+#define SZ_V3 (sizeof(struct scmi_powercap_meas_changed_notify_payld))
+#define SZ_V2 (SZ_V3 - sizeof(__le32))
 
 enum scmi_powercap_protocol_cmd {
 	POWERCAP_DOMAIN_ATTRIBUTES = 0x3,
@@ -164,6 +167,7 @@ struct scmi_powercap_meas_changed_notify_payld {
 	__le32 agent_id;
 	__le32 domain_id;
 	__le32 power;
+	__le32 mai;
 };
 
 struct scmi_msg_powercap_cpc {
@@ -1250,24 +1254,18 @@ static int scmi_powercap_notify(const struct scmi_protocol_handle *ph,
 		struct scmi_msg_powercap_notify_thresh *notify;
 
 		/*
-		 * Note that we have to pick the most recently configured
-		 * thresholds to build a proper POWERCAP_MEASUREMENTS_NOTIFY
-		 * enable request and we fail, complaining, if no thresholds
-		 * were ever set, since this is an indication the API has been
-		 * used wrongly.
+		 * Build the POWERCAP_MEASUREMENTS_NOTIFY enable request using the
+		 * most recently configured thresholds.
+		 *
+		 * The absence of thresholds is not considered an error:
+		 * notifications can still be generated to report MAI changes, even
+		 * when low and high are set to zero.
 		 */
 		ret = scmi_powercap_measurements_threshold_get(ph, domain,
 							       &low, &high);
 		if (ret)
 			return ret;
 
-		if (enable && !low && !high) {
-			dev_err(ph->dev,
-				"Invalid Measurements Notify thresholds: %u/%u\n",
-				low, high);
-			return -EINVAL;
-		}
-
 		ret = ph->xops->xfer_get_init(ph, message_id,
 					      sizeof(*notify), 0, &t);
 		if (ret)
@@ -1385,13 +1383,17 @@ scmi_powercap_fill_custom_report(const struct scmi_protocol_handle *ph,
 		const struct scmi_powercap_meas_changed_notify_payld *p = payld;
 		struct scmi_powercap_meas_changed_report *r = report;
 
-		if (sizeof(*p) != payld_sz)
+		if (payld_sz != SZ_V2 && payld_sz != SZ_V3)
 			break;
 
 		r->timestamp = timestamp;
 		r->agent_id = le32_to_cpu(p->agent_id);
 		r->domain_id = le32_to_cpu(p->domain_id);
 		r->power = le32_to_cpu(p->power);
+		r->mai = 0;
+		if (payld_sz == SZ_V3 && PROTOCOL_REV_MAJOR(ph->version) >= 0x3)
+			r->mai = le32_to_cpu(p->mai);
+
 		*src_id = r->domain_id;
 		rep = r;
 		break;
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index ce00106d2b65..583122037bf6 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -1138,5 +1138,6 @@ struct scmi_powercap_meas_changed_report {
 	unsigned int	agent_id;
 	unsigned int	domain_id;
 	unsigned int	power;
+	unsigned int	mai;
 };
 #endif /* _LINUX_SCMI_PROTOCOL_H */
-- 
2.25.1


