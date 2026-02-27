Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62335FEFB5F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 15:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5eSrfXSzZvz1LM/XZvmKMJ0mtFom4Uf6iPfmgX6UCFw=; b=M/QWgqQZzfLdI1gQcLrdCGjt/v
	ICXc/JYhholfuEUgO8PKP+sovGw4W61E2S/2S7u9QhABBgfSgiuUHUtK6QKMdqW0Zt6aWFRjvVa2b
	m/x8y5+T+5DaIyF/N4s8j6TUv1cFzrrtN+3jF+Mkqml1xUSTQVb4bS3ivUvYbVlUDThVv9is5gdMH
	gMTOdCU2jIU6YQvfW1fzFSFl3x+/k7AzMk0cRDVqhED0Tn6m/16SSEMC6Ld02Fx2o0e+CTL2Z9zdZ
	j7IUj24qzitcusWgtIJvKF44pSv6I4rBh8dSg6g4c9vYkG1UJtNiTXFZmO3/u1MtMTWxoHY1DBdkf
	Wgz5ydHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzqw-00000008eJI-1j4W;
	Fri, 27 Feb 2026 15:34:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzqt-00000008eH0-2S3A
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 15:34:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BCD18339;
	Fri, 27 Feb 2026 07:33:56 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BB7EF3F73B;
	Fri, 27 Feb 2026 07:33:56 -0800 (PST)
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: sudeep.holla@arm.com,
	philip.radford@arm.com,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@foss.st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	dan.carpenter@linaro.org,
	geert+renesas@glider.be,
	kuninori.morimoto.gx@renesas.com,
	marek.vasut+renesas@gmail.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH 09/11] firmware: arm_scmi: Add bound iterators support
Date: Fri, 27 Feb 2026 15:32:23 +0000
Message-ID: <20260227153225.2778358-10-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260227153225.2778358-1-cristian.marussi@arm.com>
References: <20260227153225.2778358-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_073403_706950_FEEB6096 
X-CRM114-Status: GOOD (  20.00  )
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
process by default the whole set of discovered resources.

Introduce an alternative way to run the initialized iterator on a limited
range of resources.

Note that the subset of resources that can be chosen is anyway limited by
the SCMI protocol specification, since you are only allowed to choose the
startindex on a multi-part enumeration NOT the end index, so that the
effective number of returned items by a bound iterators depends really
on platform side decisions.

Suggested-by: Etienne Carriere <etienne.carriere@foss.st.com>
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/firmware/arm_scmi/clock.c     |  3 +-
 drivers/firmware/arm_scmi/driver.c    | 58 +++++++++++++++++++--------
 drivers/firmware/arm_scmi/protocols.h | 13 +++++-
 3 files changed, 55 insertions(+), 19 deletions(-)

diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
index 15faa79abed4..d7df5c45836e 100644
--- a/drivers/firmware/arm_scmi/clock.c
+++ b/drivers/firmware/arm_scmi/clock.c
@@ -505,8 +505,7 @@ iter_clk_describe_process_response(const struct scmi_protocol_handle *ph,
 	struct scmi_clk_ipriv *p = priv;
 	const struct scmi_msg_resp_clock_describe_rates *r = response;
 
-	p->clkd->rates[st->desc_index + st->loop_idx] =
-		RATE_TO_U64(r->rate[st->loop_idx]);
+	p->clkd->rates[p->clkd->num_rates] = RATE_TO_U64(r->rate[st->loop_idx]);
 
 	/* Count only effectively discovered rates */
 	p->clkd->num_rates++;
diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index d9d6edbc1275..299265d05f62 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -1813,48 +1813,50 @@ static void *scmi_iterator_init(const struct scmi_protocol_handle *ph,
 	return no_free_ptr(i);
 }
 
-static int scmi_iterator_run(void *iter)
+static int __scmi_iterator_run(void *iter, unsigned int *start, unsigned int *end)
 {
 	int ret;
 	struct scmi_iterator_ops *iops;
 	const struct scmi_protocol_handle *ph;
 	struct scmi_iterator_state *st;
+	struct scmi_iterator *i;
 
 	if (!iter)
 		return -EINVAL;
 
-	/* Take ownership of the iterator */
-	struct scmi_iterator *i __free(kfree) = iter;
-
+	i = iter;
 	iops = i->ops;
 	ph = i->ph;
 	st = &i->state;
 
+	/* Reinitialize state for next run */
+	st->num_returned = 0;
+	st->num_remaining = 0;
+	st->desc_index = start ? *start : 0;
+
 	do {
 		iops->prepare_message(i->msg, st->desc_index, i->priv);
 		ret = ph->xops->do_xfer(ph, i->t);
 		if (ret)
-			break;
+			return ret;
 
 		st->rx_len = i->t->rx.len;
 		ret = iops->update_state(st, i->resp, i->priv);
 		if (ret)
-			break;
+			return ret;
 
 		if (st->num_returned > st->max_resources - st->desc_index) {
 			dev_err(ph->dev,
 				"No. of resources can't exceed %d\n",
 				st->max_resources);
-			ret = -EINVAL;
-			break;
+			return -EINVAL;
 		}
 
-		for (st->loop_idx = 0; !ret && st->loop_idx < st->num_returned;
-		     st->loop_idx++)
+		for (st->loop_idx = 0; st->loop_idx < st->num_returned; st->loop_idx++) {
 			ret = iops->process_response(ph, i->resp, st, i->priv);
-
-		if (ret)
-			break;
+			if (ret)
+				return ret;
+		}
 
 		st->desc_index += st->num_returned;
 		ph->xops->reset_rx_to_maxsz(ph, i->t);
@@ -1862,14 +1864,36 @@ static int scmi_iterator_run(void *iter)
 		 * check for both returned and remaining to avoid infinite
 		 * loop due to buggy firmware
 		 */
-	} while (st->num_returned && st->num_remaining);
+	} while (st->num_returned && st->num_remaining &&
+		 (!end || (st->desc_index <= min(*end, st->max_resources - 1))));
 
-	/* Finalize and destroy iterator */
-	ph->xops->xfer_put(ph, i->t);
+	return 0;
+}
+
+static void scmi_iterator_cleanup(void *iter)
+{
+	struct scmi_iterator *i = iter;
+
+	i->ph->xops->xfer_put(i->ph, i->t);
+	kfree(i);
+}
+
+static int scmi_iterator_run(void *iter)
+{
+	int ret;
+
+	ret = __scmi_iterator_run(iter, NULL, NULL);
+	scmi_iterator_cleanup(iter);
 
 	return ret;
 }
 
+static int scmi_iterator_run_bound(void *iter, unsigned int *start,
+				   unsigned int *end)
+{
+	return __scmi_iterator_run(iter, start, end);
+}
+
 struct scmi_msg_get_fc_info {
 	__le32 domain;
 	__le32 message_id;
@@ -2048,6 +2072,8 @@ static const struct scmi_proto_helpers_ops helpers_ops = {
 	.get_max_msg_size = scmi_common_get_max_msg_size,
 	.iter_response_init = scmi_iterator_init,
 	.iter_response_run = scmi_iterator_run,
+	.iter_response_run_bound = scmi_iterator_run_bound,
+	.iter_response_cleanup = scmi_iterator_cleanup,
 	.protocol_msg_check = scmi_protocol_msg_check,
 	.fastchannel_init = scmi_common_fastchannel_init,
 	.fastchannel_db_ring = scmi_common_fastchannel_db_ring,
diff --git a/drivers/firmware/arm_scmi/protocols.h b/drivers/firmware/arm_scmi/protocols.h
index 4c75970326e6..487f84239385 100644
--- a/drivers/firmware/arm_scmi/protocols.h
+++ b/drivers/firmware/arm_scmi/protocols.h
@@ -259,7 +259,15 @@ struct scmi_fc_info {
  *			multi-part responses using the custom operations
  *			provided in @ops.
  * @iter_response_run: A common helper to trigger the run of a previously
- *		       initialized iterator.
+ *		       initialized iterator. Note that unbound iterators are
+ *		       automatically cleaned up.
+ * @iter_response_run_bound: A common helper to trigger the run of a previously
+ *			     initialized iterator, but only within the
+ *			     specified, optional, @start and @end resource
+ *			     indexes. Note that these bound-iterators need
+ *			     explicit cleanup via @iter_response_bound_cleanup.
+ * @iter_response_bound_cleanup: A common helper to finally release the iterator
+ *				 for bound iterators.
  * @protocol_msg_check: A common helper to check is a specific protocol message
  *			is supported.
  * @fastchannel_init: A common helper used to initialize FC descriptors by
@@ -276,6 +284,9 @@ struct scmi_proto_helpers_ops {
 				    unsigned int max_resources, u8 msg_id,
 				    size_t tx_size, void *priv);
 	int (*iter_response_run)(void *iter);
+	int (*iter_response_run_bound)(void *iter,
+				       unsigned int *start, unsigned int *end);
+	void (*iter_response_cleanup)(void *iter);
 	int (*protocol_msg_check)(const struct scmi_protocol_handle *ph,
 				  u32 message_id, u32 *attributes);
 	void (*fastchannel_init)(const struct scmi_protocol_handle *ph,
-- 
2.53.0


