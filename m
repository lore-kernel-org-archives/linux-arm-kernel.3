Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 180C9C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 09:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=a9dLB9qMC1VWxr88frK7ML0Lzec5YHO8OL8Ql9y1Xn4=; b=msetYyVpQwIX/s0B3boKKtuAEf
	rF5mN3U5cCpmR4db6FzOV7qUIFIAT1N19y5gAKEQx/a/iwmQRlJvqBzP7i7UohWXmITVz6ZGyY2d5
	p/xvbYazgxvDQ3cT/6JOGB9Hlv+RxnY1z5eb0zOTsfz3F1otfY4Ue0Hc2Xy23JJfPqjFuGzbMG+ar
	SWoIPUVgIdpJnNVBqwT/gPWL7unnSSjcFn4EdxxtWBFSjqPC5Kx0+ftSV2UOZwuZHgNoWEOmEdWEp
	B2PCKtl4s/ty0NlClIsll01wU50+m+a5vJKeWFS4Tscz3hO422x5dfFD1Fbwm1bPptqP0JJoh7rkn
	hs0r3eaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x249Q-0000000H0V6-3WOl;
	Thu, 03 Sep 2026 09:54:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x249P-0000000H0Uy-0awU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 09:54:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1F889600C8;
	Thu,  3 Sep 2026 09:54:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ECD71F000E9;
	Thu,  3 Sep 2026 09:54:28 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] firmware: arm_scmi: Merge scmi_reset_proto_ops.name_get() and .latency_get()
Date: Thu,  3 Sep 2026 11:54:25 +0200
Message-ID: <77c9651a11715013c0eaa8a56dbbc7dc3d9ddeec.1788429130.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The SCMI reset domain protocol operations structure does not provide a
.info_get() method, unlike most other protocols.  Instead, it provides
two separate methods to get a domain's name and reset latency.

Merge the .name_get() and .latency_get() methods into a single
.info_get() method, to increase uniformity.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
There are no callers of the .name_get() and .latency_get() methods.
---
 drivers/firmware/arm_scmi/reset.c | 36 ++++++++++---------------------
 include/linux/scmi_protocol.h     | 13 ++++++-----
 2 files changed, 19 insertions(+), 30 deletions(-)

diff --git a/drivers/firmware/arm_scmi/reset.c b/drivers/firmware/arm_scmi/reset.c
index 4bc5c24c2d72d398..2cdddc28ba47a2b4 100644
--- a/drivers/firmware/arm_scmi/reset.c
+++ b/drivers/firmware/arm_scmi/reset.c
@@ -60,8 +60,7 @@ struct scmi_reset_issued_notify_payld {
 struct reset_dom_info {
 	bool async_reset;
 	bool reset_notify;
-	u32 latency_us;
-	char name[SCMI_MAX_STR_SIZE];
+	struct scmi_reset_domain_info info;
 };
 
 struct scmi_reset_info {
@@ -134,10 +133,10 @@ scmi_reset_domain_attributes_get(const struct scmi_protocol_handle *ph,
 		if (pinfo->notify_reset_cmd)
 			dom_info->reset_notify =
 				SUPPORTS_NOTIFY_RESET(attributes);
-		dom_info->latency_us = le32_to_cpu(attr->latency);
-		if (dom_info->latency_us == U32_MAX)
-			dom_info->latency_us = 0;
-		strscpy(dom_info->name, attr->name, SCMI_SHORT_NAME_MAX_SIZE);
+		dom_info->info.latency_us = le32_to_cpu(attr->latency);
+		if (dom_info->info.latency_us == U32_MAX)
+			dom_info->info.latency_us = 0;
+		strscpy(dom_info->info.name, attr->name, SCMI_SHORT_NAME_MAX_SIZE);
 	}
 
 	ph->xops->xfer_put(ph, t);
@@ -149,7 +148,7 @@ scmi_reset_domain_attributes_get(const struct scmi_protocol_handle *ph,
 	if (!ret && PROTOCOL_REV_MAJOR(ph->version) >= 0x3 &&
 	    SUPPORTS_EXTENDED_NAMES(attributes))
 		ph->hops->extended_name_get(ph, RESET_DOMAIN_NAME_GET, domain,
-					    NULL, dom_info->name,
+					    NULL, dom_info->info.name,
 					    SCMI_MAX_STR_SIZE);
 
 	return ret;
@@ -162,28 +161,16 @@ static int scmi_reset_num_domains_get(const struct scmi_protocol_handle *ph)
 	return pi->num_domains;
 }
 
-static const char *
-scmi_reset_name_get(const struct scmi_protocol_handle *ph, u32 domain)
+static const struct scmi_reset_domain_info *
+scmi_reset_info_get(const struct scmi_protocol_handle *ph, u32 domain)
 {
 	struct reset_dom_info *dom_info;
 
 	dom_info = scmi_reset_domain_lookup(ph, domain);
 	if (IS_ERR(dom_info))
-		return "unknown";
-
-	return dom_info->name;
-}
-
-static int scmi_reset_latency_get(const struct scmi_protocol_handle *ph,
-				  u32 domain)
-{
-	struct reset_dom_info *dom_info;
-
-	dom_info = scmi_reset_domain_lookup(ph, domain);
-	if (IS_ERR(dom_info))
-		return PTR_ERR(dom_info);
+		return NULL;
 
-	return dom_info->latency_us;
+	return &dom_info->info;
 }
 
 static int scmi_domain_reset(const struct scmi_protocol_handle *ph, u32 domain,
@@ -241,8 +228,7 @@ scmi_reset_domain_deassert(const struct scmi_protocol_handle *ph, u32 domain)
 
 static const struct scmi_reset_proto_ops reset_proto_ops = {
 	.num_domains_get = scmi_reset_num_domains_get,
-	.name_get = scmi_reset_name_get,
-	.latency_get = scmi_reset_latency_get,
+	.info_get = scmi_reset_info_get,
 	.reset = scmi_reset_domain_reset,
 	.assert = scmi_reset_domain_assert,
 	.deassert = scmi_reset_domain_deassert,
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index fd2d648964f68f53..06914851c4620979 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -528,22 +528,25 @@ struct scmi_sensor_proto_ops {
 			  u32 sensor_id, u32 sensor_config);
 };
 
+struct scmi_reset_domain_info {
+	char name[SCMI_MAX_STR_SIZE];
+	u32 latency_us;
+};
+
 /**
  * struct scmi_reset_proto_ops - represents the various operations provided
  *	by SCMI Reset Protocol
  *
  * @num_domains_get: get the count of reset domains provided by SCMI
- * @name_get: gets the name of a reset domain
- * @latency_get: gets the reset latency for the specified reset domain
+ * @info_get: gets the information of the specified reset domain
  * @reset: resets the specified reset domain
  * @assert: explicitly assert reset signal of the specified reset domain
  * @deassert: explicitly deassert reset signal of the specified reset domain
  */
 struct scmi_reset_proto_ops {
 	int (*num_domains_get)(const struct scmi_protocol_handle *ph);
-	const char *(*name_get)(const struct scmi_protocol_handle *ph,
-				u32 domain);
-	int (*latency_get)(const struct scmi_protocol_handle *ph, u32 domain);
+	const struct scmi_reset_domain_info __must_check *(*info_get)
+		(const struct scmi_protocol_handle *ph, u32 domain);
 	int (*reset)(const struct scmi_protocol_handle *ph, u32 domain);
 	int (*assert)(const struct scmi_protocol_handle *ph, u32 domain);
 	int (*deassert)(const struct scmi_protocol_handle *ph, u32 domain);
-- 
2.43.0


