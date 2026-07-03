Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEDE4C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 12:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7dN5JJcDJefKv1blTe+E8nWAngWNIKaaBh4OnpXo15E=; b=uXi/YFrfSW7dy+mlkC2igH4GxT
	ewQZD8XaA+6ATJzpWLYts6kbAR6smpD3JLOIDUkdnMrYowIsoEiwhQs9ObKrUzExv6YSSZotu8wMl
	6J5nrKEnt63mx8UrjqivEhuAlEaD7nPh8bMJhYgzo+CdET0yyyRyp69uQezyfljNZ6wYivpyQiSKH
	v4V7JfO3bm7pCPcEjl9KUa9XtUmjMIYHtNqTkYiOvPibSYWYNWhtm1ez7VN1kaiRAMnvUfQbYY3/T
	eXy/NFAA2Z8UThszQ5Qp+psNhqRjHsGX4HDySMsq8ZpiDVc0FrkHzIMtmctTOZMtwU0VLr9Zyjdv+
	1/paLuhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfd8x-00000006xNO-2YUu;
	Fri, 03 Jul 2026 12:37:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfd8t-00000006xKF-3u18
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 03 Jul 2026 12:37:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=7dN5JJcDJefKv1blTe+E8nWAngWNIKaaBh4OnpXo15E=; b=KPFGF1kj+BHAZMw3RJ+DUUoqe6
	m72Ks8ijey4xVlg2KGdxWT5AuDG1bFreAKQg2jC9Iom6GuH8IHl+EgdXjTTbMvNcESllOIrHArA7N
	YQqtNgRdJS/xP1czg9AbP+7Cd9Lajhc+rrItDYHIeR9bwID2vBjhwKeXwq/R3XqnxhkLDuDOn/EA3
	MWKcep6jVjkZApn5DdONE92hyl7dw62zicO5WzlAP7JSJqKCZMGEfLIaXnnANpERTTPqJVJM0Mgqg
	UtVz29c3/DPp/IX0jTkA57iIWyADQOpi4DO3gwzCWOS8ojI+pgHGflmX9I7rqKSosohXm64GJYofQ
	H/7fB3pA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wfd8q-00000004ot1-3YKK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 12:37:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3E575464B;
	Fri,  3 Jul 2026 05:37:07 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 32C3A3F905;
	Fri,  3 Jul 2026 05:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783082231; bh=vIqtMpT6CBJeRHkaZoAhfLBxkNoxLuuYxII5Aqu1Q/Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=W2x1+JrQkXqWbnYUc7/h3mFJ/4dO6Xsq7JPBig/UCXR6HlELJZu3F1V+FVMcR9cww
	 7Tz3FaNUMuvzrUrywOxCwisyr+iD9lyXwwCvPgeFrtPzxkFsJPPw1Z+8Pbptz09ooL
	 Xa4csZsVm+S+z6t1k6w1lhz3EAcPx76IIV/9fmJc=
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: sudeep.holla@kernel.org,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	d-gole@ti.com,
	jic23@kernel.org,
	elif.topuz@arm.com,
	lukasz.luba@arm.com,
	philip.radford@arm.com,
	brauner@kernel.org,
	david@kernel.org,
	souvik.chakravarty@arm.com,
	leitao@kernel.org,
	kas@kernel.org,
	puranjay@kernel.org,
	usama.arif@linux.dev,
	kernel-team@meta.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v5 11/23] firmware: arm_scmi: Add support for Telemetry reset
Date: Fri,  3 Jul 2026 13:35:49 +0100
Message-ID: <20260703123601.381275-12-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260703123601.381275-1-cristian.marussi@arm.com>
References: <20260703123601.381275-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_133713_257161_18C51C17 
X-CRM114-Status: GOOD (  15.01  )
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

Add support for Telemetry operations needed to request platform to
reset telemetry current configuration and data events values.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v3 --> v4
 - reset tracked Telemetry DE state
v2 --> v3
 - split from monolithic Telemetry patch
 - use scmi_telemetry_de_unlink
---
 drivers/firmware/arm_scmi/telemetry.c | 47 +++++++++++++++++++++++++++
 include/linux/scmi_protocol.h         |  2 ++
 2 files changed, 49 insertions(+)

diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
index 2623d764b805..1541b94c38cb 100644
--- a/drivers/firmware/arm_scmi/telemetry.c
+++ b/drivers/firmware/arm_scmi/telemetry.c
@@ -2530,6 +2530,52 @@ static int scmi_telemetry_des_sample_get(const struct scmi_protocol_handle *ph,
 	return ret;
 }
 
+static void scmi_telemetry_local_resources_reset(struct telemetry_info *ti)
+{
+	struct scmi_telemetry_res_info *rinfo;
+
+	/* Get rinfo as it is...without triggering an enumeration */
+	rinfo = __scmi_telemetry_resources_get(ti);
+	/* Clear all local state...*/
+	for (int i = 0; i < rinfo->num_des; i++) {
+		rinfo->des[i]->enabled = false;
+		rinfo->des[i]->tstamp_enabled = false;
+
+		scmi_telemetry_de_unlink(rinfo->des[i]);
+	}
+	for (int i = 0; i < rinfo->num_groups; i++) {
+		rinfo->grps[i].enabled = false;
+		rinfo->grps[i].tstamp_enabled = false;
+		rinfo->grps[i].current_mode = SCMI_TLM_ONDEMAND;
+		rinfo->grps[i].active_update_interval = 0;
+	}
+
+	atomic_set(&ti->des_enabled[ENA_STATE], 0);
+	atomic_set(&ti->des_enabled[ENA_TSTAMP], 0);
+}
+
+static int scmi_telemetry_reset(const struct scmi_protocol_handle *ph)
+{
+	struct scmi_xfer *t;
+	int ret;
+
+	ret = ph->xops->xfer_get_init(ph, TELEMETRY_RESET, sizeof(u32), 0, &t);
+	if (ret)
+		return ret;
+
+	put_unaligned_le32(0, t->tx.buf);
+	ret = ph->xops->do_xfer(ph, t);
+	if (!ret) {
+		struct telemetry_info *ti = ph->get_priv(ph);
+
+		scmi_telemetry_local_resources_reset(ti);
+	}
+
+	ph->xops->xfer_put(ph, t);
+
+	return ret;
+}
+
 static const struct scmi_telemetry_proto_ops tlm_proto_ops = {
 	.info_get = scmi_telemetry_info_get,
 	.de_lookup = scmi_telemetry_de_lookup,
@@ -2541,6 +2587,7 @@ static const struct scmi_telemetry_proto_ops tlm_proto_ops = {
 	.de_data_read = scmi_telemetry_de_data_read,
 	.des_bulk_read = scmi_telemetry_des_bulk_read,
 	.des_sample_get = scmi_telemetry_des_sample_get,
+	.reset = scmi_telemetry_reset,
 };
 
 /**
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 8dc9187e6bb9..4d72a5fbf1bc 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -1015,6 +1015,7 @@ struct scmi_telemetry_de_sample {
  *		    the ones belonging to a specific group when provided.
  *		    This causes an immediate update platform-side of all the
  *		    enabled DEs.
+ * @reset: reset configuration and telemetry data.
  */
 struct scmi_telemetry_proto_ops {
 	const struct scmi_telemetry_info __must_check *(*info_get)
@@ -1040,6 +1041,7 @@ struct scmi_telemetry_proto_ops {
 	int __must_check (*des_sample_get)(const struct scmi_protocol_handle *ph,
 					   int grp_id, int *num_samples,
 					   struct scmi_telemetry_de_sample *samples);
+	int (*reset)(const struct scmi_protocol_handle *ph);
 };
 
 /**
-- 
2.54.0


