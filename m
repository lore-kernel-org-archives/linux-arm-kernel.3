Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD4E1CC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 18:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=woro4Y2qnFHe0aIyx4cnmRuA10wmKxQEHreCK8YbS8c=; b=VyTYSi7hflqlQ5Y/TwNWMYSzW8
	aZH+dTk+ZVctYw7G87gdm29QsJk/8Bc20pRTs6qPwE6Mnbjz4daxhucbts2iONNno1RxYlduYFtN2
	Tpq+N6ZnUB9wNBSbjXq0at1Rl/KatyacrGCZAAH5c1FtpWPee8ojgkT+waeG2+jTRgY7QKtL6yto4
	ib3r4SPLk33X3zq+EHohDvu34r9bXpIMGXvFQATAc+qcoHFzjd5PHv5wsxgytfz1bvvfa9v5Va/2s
	y1rQlrwfaUmOvMeFyoDySm1bYrDttnmbwaYz3z555Wwymq3PpsVrsJimbT9fUzJq/wKoryNqRzZjZ
	l8wfaGTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHn7u-00000003krU-17cZ;
	Fri, 16 Oct 2026 18:57:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHn7f-00000003keD-3Rhg
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 16 Oct 2026 18:57:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=woro4Y2qnFHe0aIyx4cnmRuA10wmKxQEHreCK8YbS8c=; b=eiznTkNk0vRVECFk/HwU2DAhfo
	yzh2wB6KuCdAC23Eco1DRb7YLXNroFiXwRNI5fQGrIHI49IJ48CAPHTDOyitgZ4npOLxjFJ8INSM2
	s6IEaDDlGhyu0XHKVsy24/b0I2A03plqD+n8RAuMd1HYIy6fKjXbfW/+pewangnaOL4h01SzwbTBx
	R1E0stLj9U34qtoRWs4Fdjw+Bc6hoYIYa5w17QzKtsWAIVCKl+n0WIYgsfvdrBneBiEbiGXVualgP
	3dQAKJh+R0uJCqvdHqvSFH51lMgtvEphJ09k866hACkH2FSGa8LREoHNEAmzCTd5kY7kxOapDYyXt
	LvyXfo+Q==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHn7c-00000001rno-43gC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 18:57:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7CDFD1516;
	Fri, 16 Oct 2026 11:57:36 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 34A2B3F7B4;
	Fri, 16 Oct 2026 11:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792177059; bh=i4iwi8vXN/zCSC/Hr5lg193BlICgS/pJueKSLf7oWv0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q//aOHc6zuhZRmvzooNgqY4b00BOEyQZEa+oojwfG0NX/ZLa0oyeVlBTxGkKfROVb
	 +fg/4mEygvzWSh287PINsmaXv6zY9MBiKeueMyBkYTj++4CVUYayV/T5oAo3TDVewy
	 ebWvipcQP38gKFQD0vhbx79OBcqtvaLWcxz+P3II=
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
	jonathan.cameron@oss.qualcomm.com,
	elif.topuz@arm.com,
	lukasz.luba@arm.com,
	philip.radford@arm.com,
	david@kernel.org,
	souvik.chakravarty@arm.com,
	leitao@kernel.org,
	kas@kernel.org,
	puranjay@kernel.org,
	usama.arif@linux.dev,
	kernel-team@meta.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v14 17/32] firmware: arm_scmi: Add Telemetry reset logic
Date: Fri, 16 Oct 2026 19:55:38 +0100
Message-ID: <20261016185553.2794459-18-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261016185553.2794459-1-cristian.marussi@arm.com>
References: <20261016185553.2794459-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_195741_365854_5A8188A5 
X-CRM114-Status: GOOD (  20.81  )
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
v13 --> v14
 - add a barrier to acquire rinfo->num_des on reset
 - avoid lock inversion on config_mtx
v12 --> v13
 - relocate tde->mtx guards higher up and add lockdep assertions
 - unlink BLKTS under tde->mtx on local free
v11 --> v12
 - using config_mtx to sync with ongoing configurations
 - use proper helpers to update cache state
v10 --> v11
 - protect TDE updates on reset
 - use des_enable mutex when clearing des cache
 - zero also active_update_interval
v8 --> v9
 - add a commment on why NOT unlinking UUID
v6 --> v7
 - add proper cleanup of sid/offs/uuids and caches on RESET
v5 --> v6
 - added missing reset of global state
v3 --> v4
 - reset tracked Telemetry DE state
v2 --> v3
 - split from monolithic Telemetry patch
 - use scmi_telemetry_de_unlink
---
 drivers/firmware/arm_scmi/telemetry.c | 80 +++++++++++++++++++++++++++
 include/linux/scmi_protocol.h         |  2 +
 2 files changed, 82 insertions(+)

diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
index 0825a0d38296..a5ba21fbfed7 100644
--- a/drivers/firmware/arm_scmi/telemetry.c
+++ b/drivers/firmware/arm_scmi/telemetry.c
@@ -3340,6 +3340,85 @@ static int scmi_telemetry_des_sample_get(const struct scmi_protocol_handle *ph,
 	return ret;
 }
 
+static void scmi_telemetry_local_resources_reset(struct telemetry_info *ti)
+{
+	struct scmi_telemetry_res_info *rinfo;
+	unsigned int num_des;
+
+	ti->info.enabled = false;
+	ti->info.notif_enabled = false;
+	ti->info.current_mode = SCMI_TLM_ONDEMAND;
+	ti->info.active_update_interval = 0;
+
+	/* Get rinfo without triggering an enumeration, cannot be NULL anyway */
+	rinfo = __scmi_telemetry_resources_get(ti);
+	/* Make sure to see the latest num_des */
+	num_des = smp_load_acquire(&rinfo->num_des);
+	/* Clear all local state...*/
+	for (int i = 0; i < num_des; i++) {
+		struct telemetry_de *tde = to_tde(rinfo->des[i]);
+
+		scoped_guard(mutex, &tde->mtx) {
+			tde->last_ts = 0;
+			tde->last_val = 0;
+			tde->last_magic = 0;
+			if (!tde->de.fc_support) {
+				tde->sid = SHMTI_ID_INVALID;
+				tde->base = NULL;
+				tde->offset = 0;
+				tde->eplg = NULL;
+			}
+
+			scmi_telemetry_de_state_update(ti, ENA_STATE,
+						       &tde->de.enabled, false);
+
+			if (tde->de.tstamp_support)
+				scmi_telemetry_de_state_update(ti, ENA_TSTAMP,
+							       &tde->de.tstamp_enabled,
+							       false);
+
+			/*
+			 * Unlinking ONLY BLK_TS lines since, per the SCMI spec,
+			 * the UUID/DE associations are permanent within the same
+			 * session boot: after a reset has cleared the server-side
+			 * configuration the next time SHMTIs will be re-populated,
+			 * these same UUID/DE associations will be re-instated.
+			 */
+			scmi_telemetry_blkts_unlink(tde);
+		}
+	}
+
+	for (int i = 0; i < rinfo->num_groups; i++) {
+		rinfo->grps[i].enabled = false;
+		rinfo->grps[i].tstamp_enabled = false;
+		rinfo->grps[i].current_mode = SCMI_TLM_ONDEMAND;
+		rinfo->grps[i].active_update_interval = 0;
+	}
+}
+
+static int scmi_telemetry_reset(const struct scmi_protocol_handle *ph)
+{
+	struct telemetry_info *ti = ph->get_priv(ph);
+	struct scmi_xfer *t;
+	int ret;
+
+	/* Stall concurrent configuration request */
+	guard(mutex)(&ti->config_mtx);
+
+	ret = ph->xops->xfer_get_init(ph, TELEMETRY_RESET, sizeof(u32), 0, &t);
+	if (ret)
+		return ret;
+
+	put_unaligned_le32(0, t->tx.buf);
+	ret = ph->xops->do_xfer(ph, t);
+	if (!ret)
+		scmi_telemetry_local_resources_reset(ti);
+
+	ph->xops->xfer_put(ph, t);
+
+	return ret;
+}
+
 static const struct scmi_telemetry_proto_ops tlm_proto_ops = {
 	.info_get = scmi_telemetry_info_get,
 	.de_lookup = scmi_telemetry_de_lookup,
@@ -3350,6 +3429,7 @@ static const struct scmi_telemetry_proto_ops tlm_proto_ops = {
 	.de_data_read = scmi_telemetry_de_data_read,
 	.des_bulk_read = scmi_telemetry_des_bulk_read,
 	.des_sample_get = scmi_telemetry_des_sample_get,
+	.reset = scmi_telemetry_reset,
 };
 
 /**
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 52c9031c266b..7656db822f30 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -1016,6 +1016,7 @@ struct scmi_telemetry_de_sample {
  *		    the ones belonging to a specific group when provided.
  *		    This causes an immediate update platform-side of all the
  *		    enabled DEs.
+ * @reset: reset configuration and telemetry data.
  */
 struct scmi_telemetry_proto_ops {
 	const struct scmi_telemetry_info __must_check *(*info_get)
@@ -1043,6 +1044,7 @@ struct scmi_telemetry_proto_ops {
 	int __must_check (*des_sample_get)(const struct scmi_protocol_handle *ph,
 					   int grp_id, int *num_samples,
 					   struct scmi_telemetry_de_sample *samples);
+	int (*reset)(const struct scmi_protocol_handle *ph);
 };
 
 /**
-- 
2.54.0


