Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A177BC369B4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 14:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wb1IsrpqdyxzkBNIjUspgs8FHl1M9ahIVF+j7HQ6Rtw=; b=zozEsLf+k1+0VCkEEVEDiMHDz4
	ZkXzPmgvKBsPseRI6RL7yCGPQ/v2lYVBPw+25cqqcEOww/IK/VWXTTu0dQlT5SxXvKs/6/IXAuNVN
	1NMJRXoaXHFa1VmTc85WVnzqYyjF4sAoBgIgSTvImS78Cd1NIzcGfe0MFFfhGSwgGC6Z35v96VMyf
	KXOGSVFYsmWLtVKD9BXyzWcAlX19wfJtaCpPAzBnhk3Qvmn62lj4nZ4V9rBpDmbuu1Sl7fZY5X/7F
	IKXokAp46OOpJ5JYyeCdkB/sgHWfw3RzlpBNcxErZ1+SnIc9uCehFbc4k9WJ9byDPJ2TF2Yxoh6wx
	1fVN3hPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4hS3-000000067RM-1UNV;
	Tue, 15 Apr 2025 14:39:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4hIn-0000000662N-0VOy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 14:30:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DED1615A1;
	Tue, 15 Apr 2025 07:30:14 -0700 (PDT)
Received: from pluto.guest.local (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6F3AC3F694;
	Tue, 15 Apr 2025 07:30:14 -0700 (PDT)
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
Subject: [PATCH 4/4] [NOT FOR UPSTREAM] firmware: arm_scmi: quirk: Ignore FC bit in attributes
Date: Tue, 15 Apr 2025 15:29:33 +0100
Message-ID: <20250415142933.1746249-5-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250415142933.1746249-1-cristian.marussi@arm.com>
References: <20250415142933.1746249-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_073017_260356_FE686742 
X-CRM114-Status: GOOD (  14.21  )
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

Some platform misreported the support of FastChannel when queried: ignore
that bit on selected platforms.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
Match features has to be set-up properly before upstreaming this.
Ideally the out-of-spec firmware should be matched with a quirk matching
pattern based on Vendor/SubVendor/ImplVersion....but it is NOT clear if the
platform at hand will ship with future fixed firmwares where the ImplVersion
field is properly handled.
If we cannot be sure about that, we should fallback to a compatible match.

RFC->V1
- fix QUIRKS conditions
---
 drivers/firmware/arm_scmi/driver.c | 8 ++++++++
 drivers/firmware/arm_scmi/quirks.c | 3 +++
 drivers/firmware/arm_scmi/quirks.h | 1 +
 3 files changed, 12 insertions(+)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 1d500663004a..e38cf3c3b157 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -1904,6 +1904,13 @@ struct scmi_msg_resp_desc_fc {
 	__le32 db_preserve_hmask;
 };
 
+#define QUIRK_PERF_FC_FORCE						\
+	({								\
+		if (pi->proto->id == SCMI_PROTOCOL_PERF &&		\
+		    message_id == 0x8 /* PERF_LEVEL_GET */)		\
+			attributes |= BIT(0);				\
+	})
+
 static void
 scmi_common_fastchannel_init(const struct scmi_protocol_handle *ph,
 			     u8 describe_id, u32 message_id, u32 valid_size,
@@ -1924,6 +1931,7 @@ scmi_common_fastchannel_init(const struct scmi_protocol_handle *ph,
 
 	/* Check if the MSG_ID supports fastchannel */
 	ret = scmi_protocol_msg_check(ph, message_id, &attributes);
+	SCMI_QUIRK(perf_level_get_fc_force, QUIRK_PERF_FC_FORCE);
 	if (ret || !MSG_SUPPORTS_FASTCHANNEL(attributes)) {
 		dev_dbg(ph->dev,
 			"Skip FC init for 0x%02X/%d  domain:%d - ret:%d\n",
diff --git a/drivers/firmware/arm_scmi/quirks.c b/drivers/firmware/arm_scmi/quirks.c
index b523bd1ca49f..3e3b61a03780 100644
--- a/drivers/firmware/arm_scmi/quirks.c
+++ b/drivers/firmware/arm_scmi/quirks.c
@@ -87,6 +87,8 @@ struct scmi_quirk {
 
 /* Global Quirks Definitions */
 DEFINE_SCMI_QUIRK(clock_rates_triplet_out_of_spec, NULL, NULL, NULL, NULL);
+DEFINE_SCMI_QUIRK(perf_level_get_fc_force,
+		  NULL, "bad-vend", NULL, "0x20000-");
 
 /*
  * Quirks Pointers Array
@@ -96,6 +98,7 @@ DEFINE_SCMI_QUIRK(clock_rates_triplet_out_of_spec, NULL, NULL, NULL, NULL);
  */
 static struct scmi_quirk *scmi_quirks_table[] = {
 	__DECLARE_SCMI_QUIRK_ENTRY(clock_rates_triplet_out_of_spec),
+	__DECLARE_SCMI_QUIRK_ENTRY(perf_level_get_fc_force),
 	NULL
 };
 
diff --git a/drivers/firmware/arm_scmi/quirks.h b/drivers/firmware/arm_scmi/quirks.h
index e5252ba4774b..f8a7f234b2ae 100644
--- a/drivers/firmware/arm_scmi/quirks.h
+++ b/drivers/firmware/arm_scmi/quirks.h
@@ -39,5 +39,6 @@ static inline void scmi_quirks_enable(struct device *dev, const char *compat,
 
 /* Quirk delarations */
 DECLARE_SCMI_QUIRK(clock_rates_triplet_out_of_spec);
+DECLARE_SCMI_QUIRK(perf_level_get_fc_force);
 
 #endif /* _SCMI_QUIRKS_H */
-- 
2.47.0


