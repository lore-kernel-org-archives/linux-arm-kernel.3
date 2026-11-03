Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5FF606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 23:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xyisnY5Y;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=RTuddFAr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LnOzBWeCsjUw1h6fXfCR3vjrNRNAr3ftSxC9SVMuRK4=; b=xyisnY5YZBud3Y
	/Qg9JrklZOHZ6foOanF3wFahzyPWzaAH0zpvydNkCv3bkglkPRZ2qYKqhahw6W5zOv2c70ezTRCIn
	cir52Ai57BK0zmBRV19JqkgvCJWwHWqGESdNWjkk9B/nCDJIF+xRNP/5h7RRu8CmA5BbdEUyYRGnF
	4BnwArEMG3I0S+BbZOf6X73FYBsWoVc3VrKgwGRIAJ1gd0399nngomIQ8aK1/NrtCOZJu4qtqWHyv
	xzNay0YiVM24t3oTF3jcyL9qXks8Os3e0YwDSVzT8ybSLC03lyn5BwujFbKWmPiz1iSSN4hVXbCy6
	sueteYk7XJyr5ycp1EqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xONeK-00000003uuo-3BED;
	Tue, 03 Nov 2026 23:10:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xONeH-00000003urV-20bw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 23:10:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A87631650;
	Tue,  3 Nov 2026 15:10:33 -0800 (PST)
Received: from e121740.manchester.arm.com (e121740.arm.com [10.33.8.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F1F863F673;
	Tue,  3 Nov 2026 15:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793747436; bh=L3qbxB0fBg0Nkr0q+Ri1dBlqCR5EI6mWKJN+Kheq5rc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RTuddFArSdTnkM1ObBQX5LSev6seO7uyn2gPYHbAlmZz8+U8KIVq8R7OPGD2OBkdx
	 GvxxBe9Qmyz3Si1GC/vRhXmMUKgGCFAr+XuHWp2oYe82nxM4tgzqjzihNlUa5Ijz27
	 vG1NJryC3SZ/o29TwOdnJHH934J1GmHtk9J+LU6M=
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
Subject: [PATCH v10 05/13] firmware: arm_scmi: Add SCMIv4.0 Powercap FCs support
Date: Tue,  3 Nov 2026 23:09:59 +0000
Message-Id: <20261103231007.537082-6-philip.radford@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261103231007.537082-1-philip.radford@arm.com>
References: <20261103231007.537082-1-philip.radford@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_151037_645043_01523731 
X-CRM114-Status: GOOD (  16.84  )
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

Add support for new SCMIv4.0 Powercap Fastchannels.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
[Philip: removed reference to old versioning logic]
Signed-off-by: Philip Radford <philip.radford@arm.com>
---
V9->V10
- pass the powercap domain descriptor to avg interval get/set helpers
- use firmware CPL identifiers for CAI_GET and CAI_SET instead of array
  index
- use firmware CPL identifiers when describing SCMIv4.0 Powercap fastchannels
---
 drivers/firmware/arm_scmi/powercap.c | 336 ++++++++++++++++++---------
 1 file changed, 232 insertions(+), 104 deletions(-)

diff --git a/drivers/firmware/arm_scmi/powercap.c b/drivers/firmware/arm_scmi/powercap.c
index 8bc52cebc24f..dd99f3eae9e9 100644
--- a/drivers/firmware/arm_scmi/powercap.c
+++ b/drivers/firmware/arm_scmi/powercap.c
@@ -27,19 +27,25 @@ enum scmi_powercap_protocol_cmd {
 	POWERCAP_CAP_GET = 0x4,
 	POWERCAP_CAP_SET = 0x5,
 	POWERCAP_PAI_GET = 0x6,
+	POWERCAP_MAI_GET = POWERCAP_PAI_GET,
 	POWERCAP_PAI_SET = 0x7,
+	POWERCAP_MAI_SET = POWERCAP_PAI_SET,
 	POWERCAP_DOMAIN_NAME_GET = 0x8,
 	POWERCAP_MEASUREMENTS_GET = 0x9,
 	POWERCAP_CAP_NOTIFY = 0xa,
 	POWERCAP_MEASUREMENTS_NOTIFY = 0xb,
 	POWERCAP_DESCRIBE_FASTCHANNEL = 0xc,
 	POWERCAP_CPC_ATTRIBUTES = 0xd,
+	POWERCAP_CAI_GET = 0xe,
+	POWERCAP_CAI_SET = 0xf,
 };
 
 enum {
 	POWERCAP_FC_CAP,
-	POWERCAP_FC_PAI,
-	POWERCAP_FC_MAX,
+	POWERCAP_FC_XAI,
+	POWERCAP_FC_MAI,
+	POWERCAP_FC_MEASUREMENT,
+	POWERCAP_FC_MAX
 };
 
 struct scmi_msg_resp_powercap_domain_attributes {
@@ -91,12 +97,12 @@ struct scmi_msg_resp_powercap_domain_attributes_v3 {
 	__le32 cai_step;
 };
 
-struct scmi_msg_powercap_get_v3 {
+struct scmi_msg_powercap_cap_or_cai_get_v3 {
 	__le32 domain_id;
 	__le32 cpli;
 };
 
-struct scmi_msg_powercap_set_cap_or_pai {
+struct scmi_msg_powercap_cap_or_pai_set {
 	__le32 domain_id;
 	__le32 flags;
 #define CAP_SET_ASYNC		BIT(1)
@@ -104,13 +110,20 @@ struct scmi_msg_powercap_set_cap_or_pai {
 	__le32 value;
 };
 
-struct scmi_msg_powercap_set_cap_v3 {
+struct scmi_msg_powercap_cap_set_v3 {
 	__le32 domain_id;
 	__le32 cpli;
 	__le32 flags;
 	__le32 power_cap;
 };
 
+struct scmi_msg_powercap_cai_set {
+	__le32 domain_id;
+	__le32 flags;
+	__le32 cai;
+	__le32 cpli;
+};
+
 struct scmi_msg_resp_powercap_cap_set_complete {
 	__le32 domain_id;
 	__le32 power_cap;
@@ -201,6 +214,10 @@ struct powercap_info {
 	int (*xfer_cap_set)(const struct scmi_protocol_handle *ph,
 			    const struct scmi_powercap_info *pc,
 			    u32 cpl_id, u32 power_cap, bool ignore_dresp);
+	int (*xfer_avg_ivl_get)(const struct scmi_protocol_handle *ph,
+				const struct scmi_powercap_info *pc, u32 cpl_id, u32 *ivl);
+	int (*xfer_avg_ivl_set)(const struct scmi_protocol_handle *ph,
+				const struct scmi_powercap_info *pc, u32 cpl_id, u32 ivl);
 };
 
 static enum scmi_powercap_protocol_cmd evt_2_cmd[] = {
@@ -544,17 +561,6 @@ scmi_powercap_domain_attributes_get(const struct scmi_protocol_handle *ph,
 	return ret;
 }
 
-static int
-scmi_powercap_domain_initialize(const struct scmi_protocol_handle *ph,
-				struct powercap_info *pinfo, u32 domain)
-{
-	struct scmi_powercap_info *dom_info = pinfo->powercaps + domain;
-
-	dom_info->id = domain;
-
-	return scmi_powercap_domain_attributes_get(ph, pinfo, dom_info);
-}
-
 static int scmi_powercap_num_domains_get(const struct scmi_protocol_handle *ph)
 {
 	struct powercap_info *pi = ph->get_priv(ph);
@@ -602,7 +608,7 @@ static int scmi_powercap_xfer_cap_get_v3(const struct scmi_protocol_handle *ph,
 {
 	int ret;
 	struct scmi_xfer *t;
-	struct scmi_msg_powercap_get_v3 *msg;
+	struct scmi_msg_powercap_cap_or_cai_get_v3 *msg;
 
 	ret = ph->xops->xfer_get_init(ph, POWERCAP_CAP_GET, sizeof(*msg),
 				      sizeof(u32), &t);
@@ -664,7 +670,7 @@ static int scmi_powercap_xfer_cap_set(const struct scmi_protocol_handle *ph,
 {
 	int ret;
 	struct scmi_xfer *t;
-	struct scmi_msg_powercap_set_cap_or_pai *msg;
+	struct scmi_msg_powercap_cap_or_pai_set *msg;
 
 	ret = ph->xops->xfer_get_init(ph, POWERCAP_CAP_SET,
 				      sizeof(*msg), 0, &t);
@@ -707,7 +713,7 @@ static int scmi_powercap_xfer_cap_set_v3(const struct scmi_protocol_handle *ph,
 {
 	int ret;
 	struct scmi_xfer *t;
-	struct scmi_msg_powercap_set_cap_v3 *msg;
+	struct scmi_msg_powercap_cap_set_v3 *msg;
 
 	ret = ph->xops->xfer_get_init(ph, POWERCAP_CAP_SET,
 				      sizeof(*msg), 0, &t);
@@ -810,8 +816,9 @@ static int scmi_powercap_cap_set(const struct scmi_protocol_handle *ph,
 				       power_cap, ignore_dresp);
 }
 
-static int scmi_powercap_xfer_pai_get(const struct scmi_protocol_handle *ph,
-				      u32 domain_id, u32 *pai)
+static int
+scmi_powercap_xfer_avg_interval_get(const struct scmi_protocol_handle *ph,
+				    const struct scmi_powercap_info *pc, u32 cpl_id, u32 *ivl)
 {
 	int ret;
 	struct scmi_xfer *t;
@@ -821,61 +828,108 @@ static int scmi_powercap_xfer_pai_get(const struct scmi_protocol_handle *ph,
 	if (ret)
 		return ret;
 
-	put_unaligned_le32(domain_id, t->tx.buf);
+	put_unaligned_le32(pc->id, t->tx.buf);
 	ret = ph->xops->do_xfer(ph, t);
 	if (!ret)
-		*pai = get_unaligned_le32(t->rx.buf);
+		*ivl = get_unaligned_le32(t->rx.buf);
 
 	ph->xops->xfer_put(ph, t);
 
 	return ret;
 }
 
-static int scmi_powercap_pai_get(const struct scmi_protocol_handle *ph,
-				 u32 domain_id, u32 cpl_id, u32 *pai)
+static int
+scmi_powercap_xfer_avg_interval_get_v3(const struct scmi_protocol_handle *ph,
+				       const struct scmi_powercap_info *pc, u32 cpl_id, u32 *ivl)
+{
+	int ret;
+	struct scmi_xfer *t;
+	struct scmi_msg_powercap_cap_or_cai_get_v3 *msg;
+
+	ret = ph->xops->xfer_get_init(ph, POWERCAP_CAI_GET, sizeof(*msg),
+				      sizeof(u32), &t);
+	if (ret)
+		return ret;
+
+	msg = t->tx.buf;
+	msg->domain_id = cpu_to_le32(pc->id);
+	msg->cpli = cpu_to_le32(pc->cpli[cpl_id].id);
+
+	ret = ph->xops->do_xfer(ph, t);
+	if (!ret)
+		*ivl = get_unaligned_le32(t->rx.buf);
+
+	ph->xops->xfer_put(ph, t);
+
+	return ret;
+}
+
+static int scmi_powercap_avg_interval_get(const struct scmi_protocol_handle *ph,
+					  u32 domain_id, u32 cpl_id, u32 *val)
 {
 	struct scmi_powercap_info *dom;
 	struct powercap_info *pi = ph->get_priv(ph);
 
-	if (!pai || domain_id >= pi->num_domains)
+	if (!val || domain_id >= pi->num_domains)
 		return -EINVAL;
 
 	dom = pi->powercaps + domain_id;
 	if (cpl_id >= dom->num_cpli)
 		return -EINVAL;
 
-	if (dom->cpli[cpl_id].fc_info && dom->cpli[cpl_id].fc_info[POWERCAP_FC_PAI].get_addr) {
-		*pai = ioread32(dom->cpli[cpl_id].fc_info[POWERCAP_FC_PAI].get_addr);
-		trace_scmi_fc_call(SCMI_PROTOCOL_POWERCAP, POWERCAP_PAI_GET,
-				   domain_id, *pai, 0);
+	if (dom->cpli[cpl_id].fc_info &&
+	    dom->cpli[cpl_id].fc_info[POWERCAP_FC_XAI].get_addr) {
+		int trace_cmd = (PROTOCOL_REV_MAJOR(ph->version) < 0x3) ?
+			POWERCAP_PAI_GET : POWERCAP_CAI_GET;
+
+		*val = ioread32(dom->cpli[cpl_id].fc_info[POWERCAP_FC_XAI].get_addr);
+		trace_scmi_fc_call(SCMI_PROTOCOL_POWERCAP, trace_cmd, domain_id, *val, 0);
 		return 0;
 	}
 
-	return scmi_powercap_xfer_pai_get(ph, domain_id, pai);
+	return pi->xfer_avg_ivl_get(ph, dom, cpl_id, val);
 }
 
-static int scmi_powercap_avg_interval_get(const struct scmi_protocol_handle *ph,
-					  u32 domain_id, u32 cpl_id, u32 *val)
+static int
+scmi_powercap_xfer_avg_interval_set(const struct scmi_protocol_handle *ph,
+				    const struct scmi_powercap_info *pc, u32 cpl_id, u32 ivl)
 {
-	return scmi_powercap_pai_get(ph, domain_id, cpl_id, val);
+	int ret;
+	struct scmi_xfer *t;
+	struct scmi_msg_powercap_cap_or_pai_set *msg;
+
+	ret = ph->xops->xfer_get_init(ph, POWERCAP_PAI_SET, sizeof(*msg), 0, &t);
+	if (ret)
+		return ret;
+
+	msg = t->tx.buf;
+	msg->domain_id = cpu_to_le32(pc->id);
+	msg->flags = cpu_to_le32(0);
+	msg->value = cpu_to_le32(ivl);
+
+	ret = ph->xops->do_xfer(ph, t);
+
+	ph->xops->xfer_put(ph, t);
+	return ret;
 }
 
-static int scmi_powercap_xfer_pai_set(const struct scmi_protocol_handle *ph,
-				      u32 domain_id, u32 pai)
+static int
+scmi_powercap_xfer_avg_interval_set_v3(const struct scmi_protocol_handle *ph,
+				       const struct scmi_powercap_info *pc, u32 cpl_id, u32 ivl)
 {
 	int ret;
 	struct scmi_xfer *t;
-	struct scmi_msg_powercap_set_cap_or_pai *msg;
+	struct scmi_msg_powercap_cai_set *msg;
 
-	ret = ph->xops->xfer_get_init(ph, POWERCAP_PAI_SET,
-				      sizeof(*msg), 0, &t);
+	ret = ph->xops->xfer_get_init(ph, POWERCAP_CAI_SET, sizeof(*msg), 0, &t);
 	if (ret)
 		return ret;
 
 	msg = t->tx.buf;
-	msg->domain_id = cpu_to_le32(domain_id);
+	msg->domain_id = cpu_to_le32(pc->id);
 	msg->flags = cpu_to_le32(0);
-	msg->value = cpu_to_le32(pai);
+	msg->cai = cpu_to_le32(ivl);
+	msg->cpli = cpu_to_le32(pc->cpli[cpl_id].id);
 
 	ret = ph->xops->do_xfer(ph, t);
 
@@ -883,48 +937,42 @@ static int scmi_powercap_xfer_pai_set(const struct scmi_protocol_handle *ph,
 	return ret;
 }
 
-static int scmi_powercap_pai_set(const struct scmi_protocol_handle *ph,
-				 u32 domain_id, u32 cpl_id, u32 pai)
+static int scmi_powercap_avg_interval_set(const struct scmi_protocol_handle *ph,
+					  u32 domain_id, u32 cpl_id, u32 ivl)
 {
 	const struct scmi_powercap_info *pc;
+	struct powercap_info *pi = ph->get_priv(ph);
 
 	pc = scmi_powercap_dom_info_get(ph, domain_id);
 	if (!pc || cpl_id >= pc->num_cpli || !pc->cpli[cpl_id].avg_ivl_config ||
-	    !pai || pai < pc->cpli[cpl_id].min_avg_ivl ||
-	    pai > pc->cpli[cpl_id].max_avg_ivl)
+	    !ivl || ivl < pc->cpli[cpl_id].min_avg_ivl ||
+	    ivl > pc->cpli[cpl_id].max_avg_ivl)
 		return -EINVAL;
 
-	if (pc->cpli[cpl_id].fc_info && pc->cpli[cpl_id].fc_info[POWERCAP_FC_PAI].set_addr) {
-		struct scmi_fc_info *fci = &pc->cpli[cpl_id].fc_info[POWERCAP_FC_PAI];
+	/* Note that fc_info descriptors for any unsupported FC will be NULL */
+	if (pc->cpli[cpl_id].fc_info &&
+	    pc->cpli[cpl_id].fc_info[POWERCAP_FC_XAI].set_addr) {
+		int trace_cmd = (PROTOCOL_REV_MAJOR(ph->version) < 0x3) ?
+			POWERCAP_PAI_SET : POWERCAP_CAI_SET;
+		struct scmi_fc_info *fci = &pc->cpli[cpl_id].fc_info[POWERCAP_FC_XAI];
 
-		trace_scmi_fc_call(SCMI_PROTOCOL_POWERCAP, POWERCAP_PAI_SET,
-				   domain_id, pai, 0);
-		iowrite32(pai, fci->set_addr);
+		trace_scmi_fc_call(SCMI_PROTOCOL_POWERCAP, trace_cmd, domain_id, ivl, 0);
+		iowrite32(ivl, fci->set_addr);
 		ph->hops->fastchannel_db_ring(fci->set_db);
 		return 0;
 	}
 
-	return scmi_powercap_xfer_pai_set(ph, domain_id, pai);
-}
-
-static int scmi_powercap_avg_interval_set(const struct scmi_protocol_handle *ph,
-					  u32 domain_id, u32 cpl_id, u32 val)
-{
-	return scmi_powercap_pai_set(ph, domain_id, cpl_id, val);
+	return pi->xfer_avg_ivl_set(ph, pc, cpl_id, ivl);
 }
 
-static int scmi_powercap_measurements_get(const struct scmi_protocol_handle *ph,
-					  u32 domain_id, u32 *average_power,
-					  u32 *pai)
+static int
+scmi_powercap_xfer_measurements_get(const struct scmi_protocol_handle *ph,
+				    const struct scmi_powercap_info *pc,
+				    u32 *avg_power, u32 *avg_ivl)
 {
 	int ret;
 	struct scmi_xfer *t;
 	struct scmi_msg_resp_powercap_meas_get *resp;
-	const struct scmi_powercap_info *pc;
-
-	pc = scmi_powercap_dom_info_get(ph, domain_id);
-	if (!pc || !pc->powercap_monitoring || !pai || !average_power)
-		return -EINVAL;
 
 	ret = ph->xops->xfer_get_init(ph, POWERCAP_MEASUREMENTS_GET,
 				      sizeof(u32), sizeof(*resp), &t);
@@ -932,17 +980,42 @@ static int scmi_powercap_measurements_get(const struct scmi_protocol_handle *ph,
 		return ret;
 
 	resp = t->rx.buf;
-	put_unaligned_le32(domain_id, t->tx.buf);
+	put_unaligned_le32(pc->id, t->tx.buf);
 	ret = ph->xops->do_xfer(ph, t);
 	if (!ret) {
-		*average_power = le32_to_cpu(resp->power);
-		*pai = le32_to_cpu(resp->pai);
+		*avg_power = le32_to_cpu(resp->power);
+		*avg_ivl = le32_to_cpu(resp->pai);
 	}
 
 	ph->xops->xfer_put(ph, t);
 	return ret;
 }
 
+static int scmi_powercap_measurements_get(const struct scmi_protocol_handle *ph,
+					  u32 domain_id, u32 *avg_power,
+					  u32 *avg_ivl)
+{
+	const struct scmi_powercap_info *pc;
+	struct scmi_fc_info *fci;
+
+	pc = scmi_powercap_dom_info_get(ph, domain_id);
+	if (!pc || !pc->powercap_monitoring || !avg_ivl || !avg_power)
+		return -EINVAL;
+
+	/* Note that fc_info descriptors for any unsupported FC will be NULL */
+	fci = pc->cpli[CPL0].fc_info;
+	if (fci && fci[POWERCAP_FC_MEASUREMENT].get_addr) {
+		*avg_power = ioread32(fci[POWERCAP_FC_MEASUREMENT].get_addr);
+		/* See SCMIv4.0 3.10.2 - Payload is 32bit ONLY avg_power */
+		*avg_ivl = 0;
+		trace_scmi_fc_call(SCMI_PROTOCOL_POWERCAP, POWERCAP_MEASUREMENTS_GET,
+				   pc->id, *avg_power, *avg_ivl);
+		return 0;
+	}
+
+	return scmi_powercap_xfer_measurements_get(ph, pc, avg_power, avg_ivl);
+}
+
 static int
 scmi_powercap_measurements_threshold_get(const struct scmi_protocol_handle *ph,
 					 u32 domain_id, u32 *power_thresh_low,
@@ -1076,37 +1149,86 @@ static const struct scmi_powercap_proto_ops powercap_proto_ops = {
 };
 
 static void scmi_powercap_domain_init_fc(const struct scmi_protocol_handle *ph,
-					 u32 domain, struct scmi_fc_info **p_fc)
+					 struct scmi_powercap_info *dom_info)
 {
-	struct scmi_fc_info *fc;
-
-	fc = devm_kcalloc(ph->dev, POWERCAP_FC_MAX, sizeof(*fc), GFP_KERNEL);
-	if (!fc)
-		return;
-
-	ph->hops->fastchannel_init(ph, POWERCAP_DESCRIBE_FASTCHANNEL,
-				   POWERCAP_CAP_SET, 4, domain, NULL,
-				   &fc[POWERCAP_FC_CAP].set_addr,
-				   &fc[POWERCAP_FC_CAP].set_db,
-				   &fc[POWERCAP_FC_CAP].rate_limit);
-
-	ph->hops->fastchannel_init(ph, POWERCAP_DESCRIBE_FASTCHANNEL,
-				   POWERCAP_CAP_GET, 4, domain, NULL,
-				   &fc[POWERCAP_FC_CAP].get_addr, NULL,
-				   &fc[POWERCAP_FC_CAP].rate_limit);
-
-	ph->hops->fastchannel_init(ph, POWERCAP_DESCRIBE_FASTCHANNEL,
-				   POWERCAP_PAI_SET, 4, domain, NULL,
-				   &fc[POWERCAP_FC_PAI].set_addr,
-				   &fc[POWERCAP_FC_PAI].set_db,
-				   &fc[POWERCAP_FC_PAI].rate_limit);
-
-	ph->hops->fastchannel_init(ph, POWERCAP_DESCRIBE_FASTCHANNEL,
-				   POWERCAP_PAI_GET, 4, domain, NULL,
-				   &fc[POWERCAP_FC_PAI].get_addr, NULL,
-				   &fc[POWERCAP_FC_PAI].rate_limit);
-
-	*p_fc = fc;
+	struct scmi_fc_info *fc_cpl0;
+
+	for (int id = 0; id < dom_info->num_cpli; id++) {
+		struct scmi_fc_info *fc;
+		u32 *cpl_id, zero_cpl_id = 0;
+		u32 cpl_fw_id = dom_info->cpli[id].id;
+
+		fc = devm_kcalloc(ph->dev, POWERCAP_FC_MAX, sizeof(*fc), GFP_KERNEL);
+		if (!fc)
+			return;
+
+		/* NOTE THAT when num_cpli == 1 the arg *cpl_id is 0 */
+		cpl_id = (PROTOCOL_REV_MAJOR(ph->version) >= 0x3) ? &cpl_fw_id : NULL;
+
+		ph->hops->fastchannel_init(ph, POWERCAP_DESCRIBE_FASTCHANNEL,
+					   POWERCAP_CAP_SET, 4, dom_info->id,
+					   cpl_id,
+					   &fc[POWERCAP_FC_CAP].set_addr,
+					   &fc[POWERCAP_FC_CAP].set_db,
+					   &fc[POWERCAP_FC_CAP].rate_limit);
+
+		ph->hops->fastchannel_init(ph, POWERCAP_DESCRIBE_FASTCHANNEL,
+					   POWERCAP_CAP_GET, 4, dom_info->id,
+					   cpl_id,
+					   &fc[POWERCAP_FC_CAP].get_addr, NULL,
+					   &fc[POWERCAP_FC_CAP].rate_limit);
+
+		if (PROTOCOL_REV_MAJOR(ph->version) >= 0x3) {
+			ph->hops->fastchannel_init(ph, POWERCAP_DESCRIBE_FASTCHANNEL,
+						POWERCAP_CAI_SET, 4,
+						dom_info->id, cpl_id,
+						&fc[POWERCAP_FC_XAI].set_addr,
+						&fc[POWERCAP_FC_XAI].set_db,
+						&fc[POWERCAP_FC_XAI].rate_limit);
+			ph->hops->fastchannel_init(ph, POWERCAP_DESCRIBE_FASTCHANNEL,
+						POWERCAP_CAI_GET, 4,
+						dom_info->id, cpl_id,
+						&fc[POWERCAP_FC_XAI].get_addr, NULL,
+						&fc[POWERCAP_FC_XAI].rate_limit);
+			ph->hops->fastchannel_init(ph, POWERCAP_DESCRIBE_FASTCHANNEL,
+							POWERCAP_MAI_SET, 4,
+							dom_info->id, &zero_cpl_id,
+							&fc[POWERCAP_FC_MAI].set_addr,
+							&fc[POWERCAP_FC_MAI].set_db,
+							&fc[POWERCAP_FC_MAI].rate_limit);
+
+			ph->hops->fastchannel_init(ph, POWERCAP_DESCRIBE_FASTCHANNEL,
+							POWERCAP_MAI_GET, 4,
+							dom_info->id, &zero_cpl_id,
+							&fc[POWERCAP_FC_MAI].get_addr, NULL,
+							&fc[POWERCAP_FC_MAI].rate_limit);
+
+			ph->hops->fastchannel_init(ph, POWERCAP_DESCRIBE_FASTCHANNEL,
+							POWERCAP_MEASUREMENTS_GET, 4,
+							dom_info->id, &zero_cpl_id,
+							&fc[POWERCAP_FC_MEASUREMENT].get_addr, NULL,
+							&fc[POWERCAP_FC_MEASUREMENT].rate_limit);
+		}
+
+		dom_info->cpli[id].fc_info = fc;
+	}
+
+	if (PROTOCOL_REV_MAJOR(ph->version) < 0x3) {
+		fc_cpl0 = dom_info->cpli[CPL0].fc_info;
+		ph->hops->fastchannel_init(ph, POWERCAP_DESCRIBE_FASTCHANNEL,
+						POWERCAP_PAI_SET, 4,
+						dom_info->id, NULL,
+						&fc_cpl0[POWERCAP_FC_XAI].set_addr,
+						&fc_cpl0[POWERCAP_FC_XAI].set_db,
+						&fc_cpl0[POWERCAP_FC_XAI].rate_limit);
+
+		ph->hops->fastchannel_init(ph, POWERCAP_DESCRIBE_FASTCHANNEL,
+						POWERCAP_PAI_GET, 4,
+						dom_info->id, NULL,
+						&fc_cpl0[POWERCAP_FC_XAI].get_addr, NULL,
+						&fc_cpl0[POWERCAP_FC_XAI].rate_limit);
+		}
+
 }
 
 static int scmi_powercap_notify(const struct scmi_protocol_handle *ph,
@@ -1343,9 +1465,14 @@ scmi_powercap_protocol_init(const struct scmi_protocol_handle *ph)
 	if (PROTOCOL_REV_MAJOR(ph->version) < 0x3) {
 		pinfo->xfer_cap_get = scmi_powercap_xfer_cap_get;
 		pinfo->xfer_cap_set = scmi_powercap_xfer_cap_set;
+		pinfo->xfer_avg_ivl_get = scmi_powercap_xfer_avg_interval_get;
+		pinfo->xfer_avg_ivl_set = scmi_powercap_xfer_avg_interval_set;
+
 	} else {
 		pinfo->xfer_cap_get = scmi_powercap_xfer_cap_get_v3;
 		pinfo->xfer_cap_set = scmi_powercap_xfer_cap_set_v3;
+		pinfo->xfer_avg_ivl_get = scmi_powercap_xfer_avg_interval_get_v3;
+		pinfo->xfer_avg_ivl_set = scmi_powercap_xfer_avg_interval_set_v3;
 	}
 
 	ret = scmi_powercap_attributes_get(ph, pinfo);
@@ -1370,18 +1497,19 @@ scmi_powercap_protocol_init(const struct scmi_protocol_handle *ph)
 	 * formed and correlated by sane parent-child relationship (if any).
 	 */
 	for (domain = 0; domain < pinfo->num_domains; domain++) {
-		ret = scmi_powercap_domain_initialize(ph, pinfo, domain);
+		struct scmi_powercap_info *dom_info = pinfo->powercaps + domain;
+
+		dom_info->id = domain;
+		ret = scmi_powercap_domain_attributes_get(ph, pinfo, dom_info);
 		if (ret)
 			return ret;
 
-		if (pinfo->powercaps[domain].fastchannels)
-			scmi_powercap_domain_init_fc(ph, domain,
-						     &pinfo->powercaps[domain].cpli[CPL0].fc_info);
+		if (dom_info->fastchannels)
+			scmi_powercap_domain_init_fc(ph, dom_info);
 
 		/* Grab initial state when disable is supported. */
 		if (PROTOCOL_REV_MAJOR(ph->version) >= 0x2) {
-			ret = __scmi_powercap_cap_get(ph,
-						      &pinfo->powercaps[domain], CPL0,
+			ret = __scmi_powercap_cap_get(ph, dom_info, CPL0,
 						      &pinfo->states[domain].last_pcap);
 			if (ret)
 				return ret;
-- 
2.34.1


