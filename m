Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC18D35167
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 09:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BDxU+FIIHTuHLJlvb+zdbHMKRbA2RSp8wMYHwQx0huU=; b=aK2Jko4VpSIzji04QofwZH0Tx3
	rFgDwshXTZH9Ktl0h/JuKRpsXJ1LTz9Wrq0Iw7cLwt+aQKgnq/bt402hZWq2F6ljdK7LesxenUNnd
	4KCFhDBNky3QSvSLZ6uKe/PJJCkpyMZFji4OVZ0SD3Cl5JmF5UWj2e74a/NxkcCKo1WMPgFgEMnW9
	8JVzbHY857kDfxJcYYX05lFzk512LceLDwvm901C0JB4WWTQAineMKQcn7Nh9iciO8KYRHCP0rtW3
	CmtDVXJMEYEukuqlXQDSC2zVBWSdtyyPPXFRLjLGbkGz9vA3mr3pN/3Y5Wz6ak/iv6CDstSd0uUHX
	YRZBZKoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7sH3-0000000ERla-2DQY;
	Wed, 01 Apr 2026 09:54:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7sH0-0000000ERk1-0zSo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 09:54:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ABB0016F2;
	Wed,  1 Apr 2026 02:53:57 -0700 (PDT)
Received: from donnerap.manchester.arm.com (donnerap.manchester.arm.com [10.33.8.81])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 813B23F7D8;
	Wed,  1 Apr 2026 02:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775037243; bh=AFmoGdAzzlGicMLyyvT/raKse66uTXCR3BNZqq7juc8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LboLcnwy4UA9X0I7n9dPZu5dxI2dPtVTNGZ24i4CWs1GtseInsq2RtMSeaXTeu7mi
	 ln1/7ikZVTGrRaS1+6bmsYNwbPMaVQfWJRAqFFyHetvpag/+I/DfQk4pnACyfiSDtY
	 lVb+uI/ZuJuGBNRU1ZmhQ9VQQQv+/YDNB5CpSxZ4=
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
Subject: [PATCH v4 01/11] firmware: arm_scmi: Add an optional custom parameter to fastchannel helpers
Date: Wed,  1 Apr 2026 10:53:39 +0100
Message-ID: <20260401095349.2217840-2-philip.radford@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260401095349.2217840-1-philip.radford@arm.com>
References: <20260401095349.2217840-1-philip.radford@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_025406_364795_C1026D0F 
X-CRM114-Status: GOOD (  13.60  )
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
index 3e76a3204ba4..f7b71cf19d46 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -1872,6 +1872,11 @@ static int scmi_iterator_run(void *iter)
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
@@ -1900,7 +1905,7 @@ struct scmi_msg_resp_desc_fc {
 static void
 scmi_common_fastchannel_init(const struct scmi_protocol_handle *ph,
 			     u8 describe_id, u32 message_id, u32 valid_size,
-			     u32 domain, void __iomem **p_addr,
+			     u32 domain, u32 *custom, void __iomem **p_addr,
 			     struct scmi_fc_db_info **p_db, u32 *rate_limit)
 {
 	int ret;
@@ -1931,13 +1936,16 @@ scmi_common_fastchannel_init(const struct scmi_protocol_handle *ph,
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
index ab9733f4458b..22aff71c75e9 100644
--- a/drivers/firmware/arm_scmi/powercap.c
+++ b/drivers/firmware/arm_scmi/powercap.c
@@ -716,24 +716,24 @@ static void scmi_powercap_domain_init_fc(const struct scmi_protocol_handle *ph,
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
index 4c75970326e6..516bf7c77745 100644
--- a/drivers/firmware/arm_scmi/protocols.h
+++ b/drivers/firmware/arm_scmi/protocols.h
@@ -280,7 +280,7 @@ struct scmi_proto_helpers_ops {
 				  u32 message_id, u32 *attributes);
 	void (*fastchannel_init)(const struct scmi_protocol_handle *ph,
 				 u8 describe_id, u32 message_id,
-				 u32 valid_size, u32 domain,
+				 u32 valid_size, u32 domain, u32 *custom,
 				 void __iomem **p_addr,
 				 struct scmi_fc_db_info **p_db,
 				 u32 *rate_limit);
-- 
2.47.3


