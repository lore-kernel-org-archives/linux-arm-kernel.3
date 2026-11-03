Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962AD606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 23:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=X4pk5Szb;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=jvmYy7OF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uC6BgPvNlF/5g1lcsRTy3xYeGVm1mRnFm48t9CTnYYQ=; b=X4pk5Szb5z168A
	f0tWhRXULUPP0FWLoG1Doi1052Y9mK/sY/Op5bwEyLL2h26WZExKztiD8jKFA9UR8/aHTfEvOctRf
	ieU1ZxsU3ZJM9XyQKx1ntUZ/fAFFRkOx0su1pN6Vpgg7LfiwluUskpO7U4lRy1Ck6xNHHqUwhP5T6
	GWwsV6izrtD3oynkKPU5fJ2668Ti2DUdz9byuGTj+lpDzELVjChQBzyOKGoqtg65VmmyCPCghPjQJ
	1+oollK9COspAmQEVbiWHQVQfmYEdKvGoy/Cwg4FsboUGZZrSzIgiTWNJjQwVZb+PHjA7m0K1HxjA
	BLcDU+D9RHU+G+wZ9onA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xONeM-00000003uxL-48RK;
	Tue, 03 Nov 2026 23:10:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xONeK-00000003uur-43Ii
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 23:10:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C9DB11650;
	Tue,  3 Nov 2026 15:10:36 -0800 (PST)
Received: from e121740.manchester.arm.com (e121740.arm.com [10.33.8.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 21F9D3F673;
	Tue,  3 Nov 2026 15:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793747439; bh=cRGgnFZQVKHOiOSQ+qbNegRvTsybdbXb0bPTQ3rcxgc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jvmYy7OFyiqj/Oxv4U/tg34FJq5n5VbgGKOPBceHWCa6WsRjet03K+FyrBM4g8wwF
	 uiUX98MtlZ7Gibddr1AvS6XTgE0UZj/eXQhve4AJBjoN4UwOzge5Psw+pCMCF1if+N
	 iM0jJpHfVHG7h74y76bKaCIuWRV3qycm+tz8184Y=
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
Subject: [PATCH v10 06/13] firmware: arm_scmi: Add SCMIV4.0 Powercap notifications support
Date: Tue,  3 Nov 2026 23:10:00 +0000
Message-Id: <20261103231007.537082-7-philip.radford@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261103231007.537082-1-philip.radford@arm.com>
References: <20261103231007.537082-1-philip.radford@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_151041_112352_E92CDCCF 
X-CRM114-Status: GOOD (  14.48  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Cristian Marussi <cristian.marussi@arm.com>

Extend notification support to the new SCMIv4.0 Powercap format that carry
also a CPL identifier where specified.

Since this addition completes SCMIv4.0 Powercap support bump also the
protocol version define.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
Signed-off-by: Philip Radford <philip.radford@arm.com>
---
V9->V10
- use interval-specific validation for CPC-reported CAI values
- allow all--zero CPC CAI values to mean teh platform did not report the interval
---
 drivers/firmware/arm_scmi/powercap.c | 37 +++++++++++++++++++++-------
 include/linux/scmi_protocol.h        |  3 ++-
 2 files changed, 30 insertions(+), 10 deletions(-)

diff --git a/drivers/firmware/arm_scmi/powercap.c b/drivers/firmware/arm_scmi/powercap.c
index dd99f3eae9e9..bcfc2d8c5abb 100644
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
@@ -339,6 +340,7 @@ iter_powercap_cpls_process_response(const struct scmi_protocol_handle *ph,
 	const struct scmi_msg_resp_powercap_cpc *r = response;
 	struct scmi_cpls_priv *p = priv;
 	struct scmi_powercap_cpl_info *cpl;
+	int ret;
 
 	cpl = &p->cpli[st->desc_index + st->loop_idx];
 
@@ -348,17 +350,28 @@ iter_powercap_cpls_process_response(const struct scmi_protocol_handle *ph,
 	cpl->min_power_cap = le32_to_cpu(r->desc[st->loop_idx].min_power_cap);
 	cpl->max_power_cap = le32_to_cpu(r->desc[st->loop_idx].max_power_cap);
 	cpl->power_cap_step = le32_to_cpu(r->desc[st->loop_idx].power_cap_step);
-	if (!cpl->power_cap_step && cpl->min_power_cap != cpl->max_power_cap)
-		return -EINVAL;
+
+	ret = scmi_powercap_validate(cpl->min_power_cap,
+				     cpl->max_power_cap,
+				     cpl->power_cap_step,
+				     cpl->cap_config);
+
+	if (ret)
+		return ret;
 
 	cpl->min_avg_ivl = le32_to_cpu(r->desc[st->loop_idx].min_cai);
 	cpl->max_avg_ivl = le32_to_cpu(r->desc[st->loop_idx].max_cai);
 	cpl->avg_ivl_step = le32_to_cpu(r->desc[st->loop_idx].cai_step);
-	if (!cpl->avg_ivl_step && cpl->min_avg_ivl != cpl->max_avg_ivl)
-		return -EINVAL;
-
 	cpl->avg_ivl_config = cpl->min_avg_ivl != cpl->max_avg_ivl;
 
+	ret = scmi_powercap_interval_validate(cpl->min_avg_ivl,
+					      cpl->max_avg_ivl,
+					      cpl->avg_ivl_step,
+					      &cpl->avg_ivl_config);
+
+	if (ret)
+		return ret;
+
 	strscpy(cpl->name, r->desc[st->loop_idx].name, SCMI_SHORT_NAME_MAX_SIZE);
 
 	return 0;
@@ -1370,14 +1383,20 @@ scmi_powercap_fill_custom_report(const struct scmi_protocol_handle *ph,
 		const struct scmi_powercap_cap_changed_notify_payld *p = payld;
 		struct scmi_powercap_cap_changed_report *r = report;
 
-		if (sizeof(*p) != payld_sz)
+		if (payld_sz < offsetofend(struct scmi_powercap_cap_changed_notify_payld,
+					   avg_ivl))
 			break;
 
 		r->timestamp = timestamp;
 		r->agent_id = le32_to_cpu(p->agent_id);
 		r->domain_id = le32_to_cpu(p->domain_id);
 		r->power_cap = le32_to_cpu(p->power_cap);
-		r->pai = le32_to_cpu(p->pai);
+		r->avg_ivl = le32_to_cpu(p->avg_ivl);
+		if (payld_sz >= offsetofend(struct scmi_powercap_cap_changed_notify_payld,
+					    cpli))
+			r->cpli = le32_to_cpu(p->cpli);
+		else
+			r->cpli = 0;
 		*src_id = r->domain_id;
 		rep = r;
 		break;
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index b6bc7fabd099..e41e972c7e4f 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -1129,7 +1129,8 @@ struct scmi_powercap_cap_changed_report {
 	unsigned int	agent_id;
 	unsigned int	domain_id;
 	unsigned int	power_cap;
-	unsigned int	pai;
+	unsigned int	avg_ivl;
+	unsigned int	cpli;
 };
 
 struct scmi_powercap_meas_changed_report {
-- 
2.34.1


