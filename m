Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03D8BC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 12:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XPUNoDWvSljjA54ceG80jPZbf6OhylrzpXhTA4/wG6Q=; b=lnfzqnn/s4ujLtW5r5rjs1D0NJ
	cZx6teIaMAAO756j8gOVGveMnsZEP+tVNxl7ph1WGADKOzSXXLt/dH84c3TS0ImgP00c939c/Y8ry
	m1b/B88KjQoxCTuYhFYCckx64NYeNRoHiHArswc9RSt/r6xhXwijijmWrMj0vB0s1IfkLPtghg585
	jKXUEsG4Y0bmUSclvplQLjN6pRI0ZQJkyLaPH8Xg5nlN2cx+KZ0IKJGp1n1k7XrJsIydFH1izPgYc
	HRzzbbUsZkq+qaWXyC0XxDm8irD5hmZE/igAvyWuqSsXmnvotz2LgLy3Zp2oJfYGoha4Y1DP+NhIQ
	y6dZriIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umAVs-0000000DdRq-0akH;
	Wed, 13 Aug 2025 12:23:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um9wW-0000000DYO3-2hSB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 11:46:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AF4AC12FC;
	Wed, 13 Aug 2025 04:46:47 -0700 (PDT)
Received: from pluto.guest.local (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9B1333F738;
	Wed, 13 Aug 2025 04:46:52 -0700 (PDT)
From: Cristian Marussi <cristian.marussi@arm.com>
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
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH 2/8] firmware: arm_scmi: Add bound iterators support
Date: Wed, 13 Aug 2025 12:46:03 +0100
Message-ID: <20250813114609.1305571-3-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250813114609.1305571-1-cristian.marussi@arm.com>
References: <20250813114609.1305571-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_044656_807097_62A1A2CB 
X-CRM114-Status: GOOD (  14.75  )
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

SCMI core stack provides some common helpers to handle in a unified way
multipart message replies: such iterator-helpers, when run, currently
process by default the whole set of available resources.

Introduce an alternative way to run the initialized iterator on a limited
range of resources.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/firmware/arm_scmi/driver.c    | 21 +++++++++++++++++++--
 drivers/firmware/arm_scmi/protocols.h |  6 ++++++
 2 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 65bd545c0cb1..62f9cdd508c3 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -1832,7 +1832,8 @@ static void *scmi_iterator_init(const struct scmi_protocol_handle *ph,
 	return i;
 }
 
-static int scmi_iterator_run(void *iter)
+static int __scmi_iterator_run(void *iter, unsigned int *start,
+			       unsigned int *end)
 {
 	int ret = -EINVAL;
 	struct scmi_iterator_ops *iops;
@@ -1847,6 +1848,9 @@ static int scmi_iterator_run(void *iter)
 	ph = i->ph;
 	st = &i->state;
 
+	if (start)
+		st->desc_index = *start;
+
 	do {
 		iops->prepare_message(i->msg, st->desc_index, i->priv);
 		ret = ph->xops->do_xfer(ph, i->t);
@@ -1879,7 +1883,8 @@ static int scmi_iterator_run(void *iter)
 		 * check for both returned and remaining to avoid infinite
 		 * loop due to buggy firmware
 		 */
-	} while (st->num_returned && st->num_remaining);
+	} while (st->num_returned && st->num_remaining &&
+		 (!end || (st->desc_index <= min(*end, st->max_resources - 1))));
 
 out:
 	/* Finalize and destroy iterator */
@@ -1889,6 +1894,17 @@ static int scmi_iterator_run(void *iter)
 	return ret;
 }
 
+static int scmi_iterator_run(void *iter)
+{
+	return __scmi_iterator_run(iter, NULL, NULL);
+}
+
+static int scmi_iterator_run_bound(void *iter, unsigned int *start,
+				   unsigned int *end)
+{
+	return __scmi_iterator_run(iter, start, end);
+}
+
 struct scmi_msg_get_fc_info {
 	__le32 domain;
 	__le32 message_id;
@@ -2075,6 +2091,7 @@ static const struct scmi_proto_helpers_ops helpers_ops = {
 	.get_max_msg_size = scmi_common_get_max_msg_size,
 	.iter_response_init = scmi_iterator_init,
 	.iter_response_run = scmi_iterator_run,
+	.iter_response_run_bound = scmi_iterator_run_bound,
 	.protocol_msg_check = scmi_protocol_msg_check,
 	.fastchannel_init = scmi_common_fastchannel_init,
 	.fastchannel_db_ring = scmi_common_fastchannel_db_ring,
diff --git a/drivers/firmware/arm_scmi/protocols.h b/drivers/firmware/arm_scmi/protocols.h
index 8a96b78331f2..a48e212ac0e1 100644
--- a/drivers/firmware/arm_scmi/protocols.h
+++ b/drivers/firmware/arm_scmi/protocols.h
@@ -257,6 +257,10 @@ struct scmi_fc_info {
  *			provided in @ops.
  * @iter_response_run: A common helper to trigger the run of a previously
  *		       initialized iterator.
+ * @iter_response_run_bound: A common helper to trigger the run of a previously
+ *			     initialized iterator, but only within the
+ *			     specified, optional, @start and @end resource
+ *			     indexes.
  * @protocol_msg_check: A common helper to check is a specific protocol message
  *			is supported.
  * @fastchannel_init: A common helper used to initialize FC descriptors by
@@ -273,6 +277,8 @@ struct scmi_proto_helpers_ops {
 				    unsigned int max_resources, u8 msg_id,
 				    size_t tx_size, void *priv);
 	int (*iter_response_run)(void *iter);
+	int (*iter_response_run_bound)(void *iter,
+				       unsigned int *start, unsigned int *end);
 	int (*protocol_msg_check)(const struct scmi_protocol_handle *ph,
 				  u32 message_id, u32 *attributes);
 	void (*fastchannel_init)(const struct scmi_protocol_handle *ph,
-- 
2.47.0


