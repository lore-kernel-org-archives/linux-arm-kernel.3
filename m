Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3734DD35164
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 09:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8snDW0KgpNHeDknnrlGx0WSzqa+MF1sNPfin1tEgUQc=; b=HgLX0x0BOBPrRpfA6qyXKjSksg
	mnwr8/bq92S2ey0Usuh/LUSA02HZz0rWQodaJaTxogHnhiV/wWDdCUpDKCv4w1mFSfh32uLb/dGPQ
	Gjfcvr9pwIpZOuSnoA0Ukm0Rrps1upZ1lmGTG1+wy/4AQvn0mPwxtgQSRceyFPaL2s6KhSAooy2U8
	TUdTd+7Yp0Zchns4CHuwtxwzviVEdlQtSXOiKcFQ7urenyodG8nD9LZf2PQbvtP2CQGdo18rP7KBM
	fl3ioTZ1f6vcjzXwlzViU57QNKoP3KbUy08Yjs4xIyXAbdf+ha1cDeAGZ199V506+E2FH5Wfb/+4Q
	bwNuciHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7sHC-0000000ERuE-2jsO;
	Wed, 01 Apr 2026 09:54:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7sHA-0000000ERrp-0DZk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 09:54:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 912CE2E98;
	Wed,  1 Apr 2026 02:54:09 -0700 (PDT)
Received: from donnerap.manchester.arm.com (donnerap.manchester.arm.com [10.33.8.81])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 752FB3F7D8;
	Wed,  1 Apr 2026 02:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775037255; bh=Tr/I/efDffY7Qd3404yAJht1JzWyp8BMb9/E4Hz3Uv4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NHAccUGcWYNRCCB4AQ3707pX1iXyOlZ4mtsyiw0dQing0yk8QDk5Rgljg+jiuvrIa
	 WXnPaAJTnV3+rgef2gFQ9Eh45k06vJA6BS/DaY1K13jw0s06qRsEp8D59DY1vKVni7
	 z6Zjg1CTQuF53FJJfg2xrB0rFpCXCFjIiPz1/ccg=
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
	Philip Radford <philip.radford@arm.com>
Subject: [PATCH v4 06/11] firmware: arm_scmi: Extend powercap report to include MAI
Date: Wed,  1 Apr 2026 10:53:44 +0100
Message-ID: <20260401095349.2217840-7-philip.radford@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260401095349.2217840-1-philip.radford@arm.com>
References: <20260401095349.2217840-1-philip.radford@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_025416_210361_C8E1E995 
X-CRM114-Status: GOOD (  14.38  )
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
 drivers/firmware/arm_scmi/powercap.c | 20 ++++++++++++--------
 include/linux/scmi_protocol.h        |  1 +
 2 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/firmware/arm_scmi/powercap.c b/drivers/firmware/arm_scmi/powercap.c
index 1d1188e98d49..b9d50f4e8ae5 100644
--- a/drivers/firmware/arm_scmi/powercap.c
+++ b/drivers/firmware/arm_scmi/powercap.c
@@ -11,6 +11,7 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/scmi_protocol.h>
+#include <linux/stddef.h>
 
 #include <trace/events/scmi.h>
 
@@ -164,6 +165,7 @@ struct scmi_powercap_meas_changed_notify_payld {
 	__le32 agent_id;
 	__le32 domain_id;
 	__le32 power;
+	__le32 mai;
 };
 
 struct scmi_msg_powercap_cpc {
@@ -1212,13 +1214,6 @@ static int scmi_powercap_notify(const struct scmi_protocol_handle *ph,
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
@@ -1333,14 +1328,23 @@ scmi_powercap_fill_custom_report(const struct scmi_protocol_handle *ph,
 	{
 		const struct scmi_powercap_meas_changed_notify_payld *p = payld;
 		struct scmi_powercap_meas_changed_report *r = report;
+		const size_t sz_v2 = offsetofend(struct scmi_powercap_meas_changed_notify_payld,
+						 power);
+		const size_t sz_v3 = sizeof(*p);
 
-		if (sizeof(*p) != payld_sz)
+		if (payld_sz != sz_v2 && payld_sz != sz_v3)
 			break;
 
 		r->timestamp = timestamp;
 		r->agent_id = le32_to_cpu(p->agent_id);
 		r->domain_id = le32_to_cpu(p->domain_id);
 		r->power = le32_to_cpu(p->power);
+
+		if (payld_sz == sz_v3 && PROTOCOL_REV_MAJOR(ph->version) >= 0x3)
+			r->mai = le32_to_cpu(p->mai);
+		else
+			r->mai = 0;
+
 		*src_id = r->domain_id;
 		rep = r;
 		break;
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 299fa8499b3f..d0f6c0102559 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -1134,5 +1134,6 @@ struct scmi_powercap_meas_changed_report {
 	unsigned int	agent_id;
 	unsigned int	domain_id;
 	unsigned int	power;
+	unsigned int	mai;
 };
 #endif /* _LINUX_SCMI_PROTOCOL_H */
-- 
2.47.3


