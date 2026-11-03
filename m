Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A14606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 23:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HyiwoLIU;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=M1MrVBR3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mOCyYrBGB+XIqTdJaPvQ3XTFsjQ/DBugx4t6eCqUCuA=; b=HyiwoLIU17TDvz
	RxnDvMA8PA4Gk2Ea1vDm6/SYSZOUIjl9vUJFvwzx0O/owBqBFgPWrebE01oCtdN5PjJ0YEebwJ9X5
	5aE9OSHYH/gliBOzmQIX/z4H9UuIJcWP07hhnwOKfZO8bNAwCdDzcXU3GVbQ7tuW0lj7C2c+LCq4m
	z2UnSS1Uw0IKmZOuxCkfiKANBVKiOgyjB4u7JSsGGT+zAxTgDVMQO4hMDOJ42QI1rmXqo95YXidzO
	jeKqkHHW3mTg8yNhG4PgDi63zs1KcEhnegRp5RQEJOs9EWFu4C0Noy8rRk11zU0wwpR8/GRxrU24b
	H1PZQDwn4WNoQi4Qnjfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xONeD-00000003uov-42k0;
	Tue, 03 Nov 2026 23:10:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xONe8-00000003unX-3MSI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 23:10:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EA22D1595;
	Tue,  3 Nov 2026 15:10:23 -0800 (PST)
Received: from e121740.manchester.arm.com (e121740.arm.com [10.33.8.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 42F373F673;
	Tue,  3 Nov 2026 15:10:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793747427; bh=y2g9X2SaQHYi4HusJgestLX4YsHc6wB3lzeyqQD1keY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M1MrVBR3HMrT3VqeqqrBt00IDvrB1gA5hmZEdfOJkOEANROTihNq/a4RtfN7ZcUSy
	 JeL1CwturmS8eYO/TIjglpplCeePssPQHoBXvL0WUXN43Bq4gsTCciXjUvLVzRfymR
	 ZdRpq4PAjgj7M8uhtJJv7GcrzW05xui5UsBgwMyA=
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
	Philip Radford <philip.radford@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v10 02/13] firmware: arm_scmi: Add an optional custom parameter to fastchannel helpers
Date: Tue,  3 Nov 2026 23:09:56 +0000
Message-Id: <20261103231007.537082-3-philip.radford@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261103231007.537082-1-philip.radford@arm.com>
References: <20261103231007.537082-1-philip.radford@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_151028_916808_24FDFB52 
X-CRM114-Status: GOOD (  13.14  )
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

Starting from SCMIv4.0 the protocols DESCRIBE_FASTCHANNEL commands allow
to specify one additional per-protocol custom field in the outgoing message
request in order to, optionally, further narrow down the scope of the
fastchannel discovery request; the related message-reply format is instead
unchanged.

Add an optional custom protocol parameter to the common fastchannel helper
so as to enable the caller to choose the kind of message to send based on
the detected protocol version.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
Signed-off-by: Philip Radford <philip.radford@arm.com>
---
 drivers/firmware/arm_scmi/driver.c    | 12 ++++++++++--
 drivers/firmware/arm_scmi/perf.c      |  8 ++++----
 drivers/firmware/arm_scmi/powercap.c  |  8 ++++----
 drivers/firmware/arm_scmi/protocols.h |  2 +-
 4 files changed, 19 insertions(+), 11 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 1e6f69b14321..c49130dbadc3 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -1934,6 +1934,11 @@ static int scmi_iterator_run_bound(void *iter, unsigned int *start,
 struct scmi_msg_get_fc_info {
 	__le32 domain;
 	__le32 message_id;
+	__le32 custom;
+#define MSG_FC_INFO_SZ_EXTENDED	\
+	(sizeof(struct scmi_msg_get_fc_info))
+#define MSG_FC_INFO_SZ		\
+	(sizeof(struct scmi_msg_get_fc_info) - sizeof(__le32))
 };
 
 struct scmi_msg_resp_desc_fc {
@@ -1962,7 +1967,7 @@ struct scmi_msg_resp_desc_fc {
 static void
 scmi_common_fastchannel_init(const struct scmi_protocol_handle *ph,
 			     u8 describe_id, u32 message_id, u32 valid_size,
-			     u32 domain, void __iomem **p_addr,
+			     u32 domain, u32 *custom, void __iomem **p_addr,
 			     struct scmi_fc_db_info **p_db, u32 *rate_limit)
 {
 	int ret;
@@ -1993,13 +1998,16 @@ scmi_common_fastchannel_init(const struct scmi_protocol_handle *ph,
 	}
 
 	ret = ph->xops->xfer_get_init(ph, describe_id,
-				      sizeof(*info), sizeof(*resp), &t);
+				      custom ? MSG_FC_INFO_SZ_EXTENDED :
+				      MSG_FC_INFO_SZ, sizeof(*resp), &t);
 	if (ret)
 		goto err_out;
 
 	info = t->tx.buf;
 	info->domain = cpu_to_le32(domain);
 	info->message_id = cpu_to_le32(message_id);
+	if (custom)
+		info->custom = cpu_to_le32(*custom);
 
 	/*
 	 * Bail out on error leaving fc_info addresses zeroed; this includes
diff --git a/drivers/firmware/arm_scmi/perf.c b/drivers/firmware/arm_scmi/perf.c
index 4583d02bee1c..7f283f457e02 100644
--- a/drivers/firmware/arm_scmi/perf.c
+++ b/drivers/firmware/arm_scmi/perf.c
@@ -835,25 +835,25 @@ static void scmi_perf_domain_init_fc(const struct scmi_protocol_handle *ph,
 		return;
 
 	ph->hops->fastchannel_init(ph, PERF_DESCRIBE_FASTCHANNEL,
-				   PERF_LEVEL_GET, 4, dom->id,
+				   PERF_LEVEL_GET, 4, dom->id, NULL,
 				   &fc[PERF_FC_LEVEL].get_addr, NULL,
 				   &fc[PERF_FC_LEVEL].rate_limit);
 
 	ph->hops->fastchannel_init(ph, PERF_DESCRIBE_FASTCHANNEL,
-				   PERF_LIMITS_GET, 8, dom->id,
+				   PERF_LIMITS_GET, 8, dom->id, NULL,
 				   &fc[PERF_FC_LIMIT].get_addr, NULL,
 				   &fc[PERF_FC_LIMIT].rate_limit);
 
 	if (dom->info.set_perf)
 		ph->hops->fastchannel_init(ph, PERF_DESCRIBE_FASTCHANNEL,
-					   PERF_LEVEL_SET, 4, dom->id,
+					   PERF_LEVEL_SET, 4, dom->id, NULL,
 					   &fc[PERF_FC_LEVEL].set_addr,
 					   &fc[PERF_FC_LEVEL].set_db,
 					   &fc[PERF_FC_LEVEL].rate_limit);
 
 	if (dom->set_limits)
 		ph->hops->fastchannel_init(ph, PERF_DESCRIBE_FASTCHANNEL,
-					   PERF_LIMITS_SET, 8, dom->id,
+					   PERF_LIMITS_SET, 8, dom->id, NULL,
 					   &fc[PERF_FC_LIMIT].set_addr,
 					   &fc[PERF_FC_LIMIT].set_db,
 					   &fc[PERF_FC_LIMIT].rate_limit);
diff --git a/drivers/firmware/arm_scmi/powercap.c b/drivers/firmware/arm_scmi/powercap.c
index 27e3c805e927..31b19967452f 100644
--- a/drivers/firmware/arm_scmi/powercap.c
+++ b/drivers/firmware/arm_scmi/powercap.c
@@ -726,24 +726,24 @@ static void scmi_powercap_domain_init_fc(const struct scmi_protocol_handle *ph,
 		return;
 
 	ph->hops->fastchannel_init(ph, POWERCAP_DESCRIBE_FASTCHANNEL,
-				   POWERCAP_CAP_SET, 4, domain,
+				   POWERCAP_CAP_SET, 4, domain, NULL,
 				   &fc[POWERCAP_FC_CAP].set_addr,
 				   &fc[POWERCAP_FC_CAP].set_db,
 				   &fc[POWERCAP_FC_CAP].rate_limit);
 
 	ph->hops->fastchannel_init(ph, POWERCAP_DESCRIBE_FASTCHANNEL,
-				   POWERCAP_CAP_GET, 4, domain,
+				   POWERCAP_CAP_GET, 4, domain, NULL,
 				   &fc[POWERCAP_FC_CAP].get_addr, NULL,
 				   &fc[POWERCAP_FC_CAP].rate_limit);
 
 	ph->hops->fastchannel_init(ph, POWERCAP_DESCRIBE_FASTCHANNEL,
-				   POWERCAP_PAI_SET, 4, domain,
+				   POWERCAP_PAI_SET, 4, domain, NULL,
 				   &fc[POWERCAP_FC_PAI].set_addr,
 				   &fc[POWERCAP_FC_PAI].set_db,
 				   &fc[POWERCAP_FC_PAI].rate_limit);
 
 	ph->hops->fastchannel_init(ph, POWERCAP_DESCRIBE_FASTCHANNEL,
-				   POWERCAP_PAI_GET, 4, domain,
+				   POWERCAP_PAI_GET, 4, domain, NULL,
 				   &fc[POWERCAP_FC_PAI].get_addr, NULL,
 				   &fc[POWERCAP_FC_PAI].rate_limit);
 
diff --git a/drivers/firmware/arm_scmi/protocols.h b/drivers/firmware/arm_scmi/protocols.h
index 8583159059e6..08edec705270 100644
--- a/drivers/firmware/arm_scmi/protocols.h
+++ b/drivers/firmware/arm_scmi/protocols.h
@@ -294,7 +294,7 @@ struct scmi_proto_helpers_ops {
 				  u32 message_id, u32 *attributes);
 	void (*fastchannel_init)(const struct scmi_protocol_handle *ph,
 				 u8 describe_id, u32 message_id,
-				 u32 valid_size, u32 domain,
+				 u32 valid_size, u32 domain, u32 *custom,
 				 void __iomem **p_addr,
 				 struct scmi_fc_db_info **p_db,
 				 u32 *rate_limit);
-- 
2.34.1


