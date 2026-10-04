Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28192CA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 08:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wkObbOuzqdxWgE4sfTvJH4kp8+T6ONsNuzHwwHpb9tc=; b=cSco4T+BzEAiS88U3FHCpOW0Xf
	C5iwMsR2Y3OAAmrYdYPCEFnMt3kiR/7ccWN0D/AnAMpiThf0cDeoDa7DUsM0rH/BBC8DFzijUHAkJ
	4qYbyaVYYSDmjkqqVOeSPcot6xkrGHSuIAma3C0imCho/rx6zG+VueHgy03oiVwMpjt7atIRW5OyX
	Hee6CEmEQeev7w5Iuf+LIFjOspsMYzBOLV32pvIEdjRkn/8bKa4XWBliOSQqOFZxiw6BBUA+9rid3
	h2Ua6hnZiV6xmk87Fw7CWTpCEm+XUZ/8d0xJybzUuVzFRUIGD6llUTw6dMWzF7oYxe/8Co7PEciLd
	HZVki8Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDHBE-0000000EVZf-2Ldu;
	Sun, 04 Oct 2026 08:02:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDHB9-0000000EVVS-22E4
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 08:02:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C819D1A9A;
	Sun,  4 Oct 2026 01:02:34 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D1DFF3F85F;
	Sun,  4 Oct 2026 01:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791100958; bh=5EWgnCA9D0w3xyrzxZqo8BY2rShFuOocQXjCYDMRowA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Er9puqos/93qYLuT8ScLyJpP0o1X3e4haNavL2bVlPPruUcvSGxVavwk2iHd0oXtt
	 TITqBvasf46J5d/TwJRuYAheMhOBRMAiRaGu2AHihG59rQYNH+yWW2EjWemweUT2k1
	 yyrns7AaSgC+5rM/riz41/ytEtqn+25Uu06y5zIo=
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
Subject: [PATCH v13 08/25] firmware: arm_scmi: Add Telemetry configuration operations
Date: Sun,  4 Oct 2026 09:00:49 +0100
Message-ID: <20261004080106.3355393-9-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261004080106.3355393-1-cristian.marussi@arm.com>
References: <20261004080106.3355393-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_010239_671137_930376B8 
X-CRM114-Status: GOOD (  30.89  )
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

Add support for basic Telemetry configuration operations to selectively
enable or disable DataEvents monitoring.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v12 --> v13
 - refactored cleanup path
 - generalize payload_offset_safe_calc
 - harden nearest_line_type scanner
 - full refactoring of SET/GET helpers: keep DE and group in
   distinct code path
 - relocate tde->mtx guards higher up and add lockdep assertions
 - cleanup xa_lines under mutex_lock on cleanup
 - unlink stale BTS line when finding a new actibe for the TDE
 - use *alloc_objs
v11 --> v12
 - added a few locking order acquisition comments
 - added more checks on wraparounds and alignment
 - added proper locking around TDE access on state_get
 - added a config_mtx to serialize configuration accesses between collection
   configure and state_set
 - refactored state_cache_update
 - added locking around sid/offset/uuid updates on enable
v10 --> v11
 - refactor reply processing code on DE enable/disable
 - use the new des_ennabled mutex to protect des cache updates
 - clear sid on group disable for each composing DEs
 - add dev_warn_once on ZERO blk_ts offset
v8 --> v9
 - use new scmi_telemetry_shmti_overflow() inline
 - review DE offsets boundary and wraparound checks (Sashiko v8
 - update per-DE ts_rate for DE using BLK_TS too
v7 --> v8
 - Fixes for some Sashiko issues on v7
  - re-add functions unused in previous patch
  - add proper barriers to TDE/UUID binding process
  - update tde->sid on SCAN_UPDATE too
  - check wrap-arounds on shmti_de_offset manipulation
  - fix GROUP enable pollutes status update (was polluting global state)
  - remove .all_disable telemetry_operation since unused
  - add WARN on if a valid SHMTI ID is reported on enabling a FastChannel/DE
v6 --> v7
 - expose per-DE tracked sid/offset/UUIDs
 - trigger a full SHMTI scan when a SHMTI-based is enabled and it still has NO
   associated UUID
v5 --> v6
 - constify a few booleans used as inpurt in telemetry_operations
 - fixes (some) Sashiko reviews
   https://sashiko.dev/#/patchset/20260703123601.381275-1-cristian.marussi%40arm.com?part=9
   - underflow on de_offs
   - SHMTI overflow checks
   - bail out on failed group scan
   - unlink comprising DEs on group disable
   - add boudnary check on message response parsing
v4 --> v5
 - use renamed grp_id instead of old id in group descriptors
 - remove useless grp_ignore param from collection_configure
- fixes sparse warnings
v3 --> v4
 - track configured Telemetry DE states
 - add aggregate Telemetry state query
v2 --> v3
 - split from monolithic Telemetry patch
 - simplify clenaup with scmi_telemetry_de_unlink
---
 drivers/firmware/arm_scmi/telemetry.c | 718 ++++++++++++++++++++++++++
 include/linux/scmi_protocol.h         |  17 +
 2 files changed, 735 insertions(+)

diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
index 74f8a8691380..f9748af45f0e 100644
--- a/drivers/firmware/arm_scmi/telemetry.c
+++ b/drivers/firmware/arm_scmi/telemetry.c
@@ -521,6 +521,8 @@ struct telemetry_info {
 	struct mutex free_mtx;
 	struct list_head free_des;
 	struct list_head fcs_des;
+	/* Protect global and per-group configuration data */
+	struct mutex config_mtx;
 	struct scmi_telemetry_info info;
 	atomic_t rinfo_initializing;
 	struct completion rinfo_initdone;
@@ -1725,6 +1727,101 @@ static void scmi_telemetry_tdcf_uuid_parse(struct telemetry_info *ti,
 	*active_uuid = uuid;
 }
 
+static inline struct payload __iomem *
+scmi_telemetry_payld_offset_safe_calc(struct telemetry_shmti *shmti, u32 offs)
+{
+	struct payload __iomem *payld;
+	unsigned long p;
+	u32 end;
+
+	/* Check if accessing payld->meta is safe. */
+	if (check_add_overflow(offs, sizeof(u32), &end) ||
+	    end > shmti->info.len)
+		return IOMEM_ERR_PTR(-EPROTO);
+
+	if (check_add_overflow((__force unsigned long)shmti->base, offs, &p))
+		return IOMEM_ERR_PTR(-EPROTO);
+
+	payld = shmti->base + offs;
+	/* Check line boundary */
+	if (check_add_overflow(offs, LINE_LENGTH_BYTES(payld), &end) ||
+	    end > shmti->info.len)
+		return IOMEM_ERR_PTR(-EPROTO);
+
+	return payld;
+}
+
+static struct payload __iomem *
+scmi_telemetry_nearest_line_by_type(struct telemetry_shmti *shmti,
+				    void __iomem *last, enum tdcf_line_types ltype)
+{
+	struct tdcf __iomem *tdcf = shmti->base;
+	void __iomem *next, *found = NULL;
+
+	/* Scan from start of the first TDCF payload up to last payld */
+	next = tdcf->payld;
+	while (next < last) {
+		struct payload __iomem *payld;
+		enum tdcf_line_types cur_type;
+		u32 meta, offs;
+
+		if (check_sub_overflow((__force unsigned long)next,
+				       (__force unsigned long)tdcf, &offs)) {
+			trace_scmi_tlm_access(ltype, "LINE_OFFSET_OUT_OF_RANGE", 0, 0);
+			return NULL;
+		}
+
+		payld = scmi_telemetry_payld_offset_safe_calc(shmti, offs);
+		if (IS_ERR(payld)) {
+			trace_scmi_tlm_access(ltype, "LINE_PAYLD_MALFORMED", 0, 0);
+			return NULL;
+		}
+
+		meta = PAYLD_META(payld);
+		cur_type = LINE_TYPE_RAW(meta);
+
+		/*
+		 * Bail-out on malformed lines, since the whole TDCF scan
+		 * could be affected.
+		 */
+		if ((cur_type == TDCF_BLK_TS_LINE && BLK_TS_INVALID_RAW(meta)) ||
+		    (cur_type == TDCF_UUID_LINE && UUID_INVALID_RAW(meta))) {
+			trace_scmi_tlm_access(ltype, "LINE_TYPE_MALFORMED", 0, 0);
+			return NULL;
+		}
+
+		if (cur_type == ltype)
+			found = next;
+
+		next += LINE_LENGTH_BYTES_RAW(meta);
+	}
+
+	return found;
+}
+
+static struct telemetry_block_ts *
+scmi_telemetry_blkts_bind(struct telemetry_info *ti, struct telemetry_shmti *shmti,
+			  struct payload __iomem *payld,
+			  struct payload __iomem *bts_payld)
+{
+	/* Trigger a manual search when no BLK_TS payload offset was provided */
+	if (!bts_payld) {
+		/* Find the BLK_TS immediately preceding this DE payld */
+		bts_payld = scmi_telemetry_nearest_line_by_type(shmti, payld,
+								TDCF_BLK_TS_LINE);
+		if (!bts_payld)
+			return NULL;
+	}
+
+	/* Check for spec compliance */
+	if (BLK_TS_INVALID(bts_payld)) {
+		trace_scmi_tlm_access(0, "BLK_TS_INVALID", 0, PAYLD_META(bts_payld));
+		return NULL;
+	}
+
+	return scmi_telemetry_blkts_get_or_create(ti, bts_payld);
+}
+
 /**
  * scmi_telemetry_tdcf_blkts_parse  - A BLK_TS line parser
  *
@@ -1870,6 +1967,20 @@ static inline void scmi_telemetry_uuid_link(struct telemetry_de *tde,
 	trace_scmi_tlm_access(tde->de.info->id, "UUID_LINK", 0, 0);
 }
 
+static struct telemetry_uuid *
+scmi_telemetry_uuid_bind(struct telemetry_info *ti, struct telemetry_shmti *shmti,
+			 struct payload __iomem *payld)
+{
+	struct payload __iomem *uuid;
+
+	uuid = scmi_telemetry_nearest_line_by_type(shmti, payld, TDCF_UUID_LINE);
+	if (!uuid)
+		return NULL;
+
+	/* Here the nearest UUID line just found has been already validated */
+	return scmi_telemetry_uuid_get_or_create(ti, uuid);
+}
+
 /**
  * scmi_telemetry_tdcf_data_parse  - TDCF DataLine parsing
  * @ti: A reference to the telemetry info descriptor
@@ -2166,10 +2277,602 @@ static int scmi_telemetry_shmti_scan(struct telemetry_info *ti,
 	return 0;
 }
 
+static void scmi_telemetry_group_state_update(struct telemetry_info *ti,
+					      struct scmi_telemetry_group *grp,
+					      const bool *enable, const bool *tstamp)
+{
+	struct scmi_telemetry_res_info *rinfo;
+
+	rinfo = ti->res_get(ti);
+	for (int i = 0; i < grp->info->num_des; i++) {
+		struct scmi_telemetry_de *de = rinfo->des[grp->des[i]];
+
+		if (enable)
+			scmi_telemetry_de_state_update(ti, ENA_STATE,
+						       &de->enabled, *enable);
+
+		if (tstamp && de->tstamp_support)
+			scmi_telemetry_de_state_update(ti, ENA_TSTAMP,
+						       &de->tstamp_enabled, *tstamp);
+	}
+}
+
+static void scmi_telemetry_group_disable(struct telemetry_info *ti,
+					 struct scmi_telemetry_group *grp)
+{
+	struct scmi_telemetry_res_info *rinfo;
+
+	rinfo = ti->res_get(ti);
+	/*
+	 * Unlink the related BLK_TS/UUID lines of DEs composing the group
+	 * and invalidate SHMTI reference.
+	 */
+	for (int i = 0; i < grp->info->num_des; i++) {
+		struct telemetry_de *tde = to_tde(rinfo->des[grp->des[i]]);
+
+		guard(mutex)(&tde->mtx);
+
+		scmi_telemetry_blkts_unlink(tde);
+
+		tde->sid = SHMTI_ID_INVALID;
+		tde->offset = 0;
+	}
+}
+
+static int
+scmi_telemetry_tde_linked_lines_process(struct telemetry_info *ti,
+					struct telemetry_de *tde,
+					struct telemetry_shmti *shmti,
+					struct payload __iomem *payld,
+					u32 bts_offs)
+{
+	struct payload __iomem *bts_payld;
+	struct telemetry_uuid *uuid;
+
+	/* Acquiring order is: tde -> line */
+	lockdep_assert_held(&tde->mtx);
+
+	/*
+	 * On enable if a UUID was NOT already assigned scan
+	 * looking for possible Secondary UUID to bind: if NO
+	 * secondary could be found embedded in the preceding
+	 * SHMTI lines, install the primary UUID for this DE.
+	 */
+	/* Acquiring order is: tde -> line */
+
+	if (!tde->uuid) {
+		uuid = scmi_telemetry_uuid_bind(ti, shmti, payld);
+		if (uuid)
+			tde->uuid = uuid;
+		else
+			scmi_telemetry_uuid_link(tde, ti->primary_uuid);
+	}
+
+	/* Process related BLK_TS lines if any */
+	if (!USE_BLK_TS(payld) || !BLK_TS_CHANGED(tde, payld))
+		return 0;
+
+	bts_payld = NULL;
+	if (bts_offs &&
+	    check_add_overflow((__force unsigned long)tde->base, bts_offs,
+			       (__force unsigned long *)&bts_payld))
+		return -EPROTO;
+
+	/* Check SHMTI overflow on returned offset */
+	if (bts_payld) {
+		if (scmi_telemetry_shmti_overflow(shmti, bts_payld)) {
+			trace_scmi_tlm_access(0, "SHMTI_OVERFLOW", 0, 0);
+			return -EINVAL;
+		}
+	} else {
+		dev_warn_once(ti->ph->dev,
+			      "Received BLK_TS with zero offset.\n");
+		trace_scmi_tlm_access(0, "BLKTS_WITH_ZERO_OFFSET", 0, 0);
+	}
+
+	/* Unlink old stale BTS if existent */
+	scmi_telemetry_blkts_unlink(tde);
+	/* Look for a viable BLK_TS line */
+	tde->bts = scmi_telemetry_blkts_bind(ti, shmti,
+					     payld, bts_payld);
+	if (WARN_ON(!tde->bts)) {
+		trace_scmi_tlm_access(tde->de.info->id, "INVALID_USE_BLK_TS", 0, 0);
+		return -EPROTO;
+	}
+
+	/* Update per-DE BLK_TS if any */
+	if (tde->ts_type == TSTAMP_BLK &&
+	    tde->bts->last_rate)
+		tde->de.info->ts_rate = tde->bts->last_rate;
+
+	return 0;
+}
+
+static int
+scmi_telemetry_state_set_tde_resp(struct telemetry_info *ti,
+				  struct scmi_telemetry_de *de,
+				  u32 sid, u32 de_offs, u32 bts_offs)
+{
+	struct telemetry_de *tde = to_tde(de);
+	struct telemetry_shmti *shmti;
+	struct payload __iomem *payld;
+
+	lockdep_assert_held(&tde->mtx);
+
+	/* A FastChannel DE MUST return an INVALID SHMTI ID on enable */
+	if (WARN_ON(de->fc_support)) {
+		trace_scmi_tlm_access(de->info->id, "INVALID_DE_FC_ON_SHMTI", 0, 0);
+		return -EPROTO;
+	}
+
+	/* Update SHMTI/offset while skipping non-SHMTI based DES */
+	shmti = &ti->shmti[sid];
+	/* Check sanity of received location... */
+	payld = scmi_telemetry_payld_offset_safe_calc(shmti, de_offs);
+	if (IS_ERR(payld))
+		return PTR_ERR(payld);
+
+	/* ...then assign once validated */
+	tde->sid = sid;
+	tde->base = shmti->base;
+	tde->offset = de_offs;
+	/* A handy reference to the Epilogue updated */
+	tde->eplg = SHMTI_EPLG(shmti);
+
+	return scmi_telemetry_tde_linked_lines_process(ti, tde, shmti,
+						       payld, bts_offs);
+}
+
+static int
+scmi_telemetry_tde_state_set_resp_process(struct telemetry_info *ti,
+					  struct scmi_telemetry_de *de,
+					  struct scmi_msg_resp_telemetry_de_configure *r)
+{
+	u32 sid = le32_to_cpu(r->shmti_id);
+
+	/*
+	 * 3.12.4.8 TELEMETRY_DE_CONFIGURE - SHMTI ID
+	 * This field is optional and is set to 0xFFFFFFFF if any of the
+	 * following are true:
+	 *  - no DE or event group is being enabled.
+	 *  - No SHMTI is supported.
+	 *  - SHMTI is not used for this DE or event group. This could
+	 *  be the case for example, if this DE is associated with a FastChannel.
+	 *  the platform does not support returning this information.
+	 */
+	if (IS_SHMTI_ID_VALID(sid)) {
+		u32 de_offs, bts_offs;
+
+		if (sid >= ti->num_shmti)
+			return -EPROTO;
+
+		de_offs = le32_to_cpu(r->shmti_de_offset);
+		bts_offs = le32_to_cpu(r->blk_ts_offset);
+		if (!IS_ALIGNED(de_offs, 4) || !IS_ALIGNED(bts_offs, 4)) {
+			dev_err(ti->ph->dev,
+				"Returned DE/BTS offsets are NOT 32-bit aligned - de_offs:%X  bts_offs:%X\n",
+				de_offs, bts_offs);
+			return -EINVAL;
+		}
+
+		return scmi_telemetry_state_set_tde_resp(ti, de, sid,
+							 de_offs, bts_offs);
+	} else {
+		/* Unlink the related BLK_TS/UUID lines on disable */
+		struct telemetry_de *tde = to_tde(de);
+
+		lockdep_assert_held(&tde->mtx);
+
+		tde->sid = SHMTI_ID_INVALID;
+		tde->offset = 0;
+
+		/* UUID is never unlinked once discovered */
+		scmi_telemetry_blkts_unlink(tde);
+	}
+
+	return 0;
+}
+
+static int
+scmi_telemetry_group_state_set_resp_process(struct telemetry_info *ti,
+					    struct scmi_telemetry_group *grp,
+					    struct scmi_msg_resp_telemetry_de_configure *r)
+{
+	u32 sid = le32_to_cpu(r->shmti_id);
+	int ret;
+
+	/*
+	 * 3.12.4.8 TELEMETRY_DE_CONFIGURE - SHMTI ID
+	 * This field is optional and is set to 0xFFFFFFFF if any of the
+	 * following are true:
+	 *  - no DE or event group is being enabled.
+	 *  - No SHMTI is supported.
+	 *  - SHMTI is not used for this DE or event group. This could
+	 *  be the case for example, if this DE is associated with a FastChannel.
+	 *  the platform does not support returning this information.
+	 */
+	if (IS_SHMTI_ID_VALID(sid)) {
+		if (sid >= ti->num_shmti)
+			return -EPROTO;
+
+		/*
+		 * A full SHMTI scan is needed when enabling a
+		 * group or its timestamps in order to retrieve
+		 * offsets: note that when group-timestamp is
+		 * enabled for composing DEs a re-scan is needed
+		 * since some DEs could have been relocated due
+		 * to lack of space in the TDCF.
+		 */
+		ret = scmi_telemetry_shmti_scan(ti, sid, SCAN_UPDATE);
+		if (ret) {
+			dev_err(ti->ph->dev,
+				"Failed group-scan of SHMTI ID:%d - ret:%d\n",
+				sid, ret);
+			return ret;
+		}
+	} else {
+		/* Unlink the related BLK_TS/UUID lines on disable */
+		scmi_telemetry_group_disable(ti, grp);
+	}
+
+	return 0;
+}
+
+static void
+scmi_telemetry_state_cache_update(struct telemetry_info *ti,
+				  const bool *enable, bool *enabled_state,
+				  const bool *tstamp, bool *tstamp_enabled_state,
+				  struct scmi_telemetry_group *grp,
+				  struct scmi_telemetry_de *de)
+{
+	if ((!grp && !de) || (grp && de))
+		return;
+
+	if (enable) {
+		if (!grp)
+			scmi_telemetry_de_state_update(ti, ENA_STATE,
+						       enabled_state,
+						       *enable);
+		else
+			*enabled_state = *enable;
+	}
+
+	if (tstamp) {
+		if (!grp) {
+			if (de->tstamp_support)
+				scmi_telemetry_de_state_update(ti, ENA_TSTAMP,
+							       tstamp_enabled_state,
+							       *tstamp);
+		} else {
+			*tstamp_enabled_state = *tstamp;
+		}
+	}
+
+	if (grp)
+		scmi_telemetry_group_state_update(ti, grp, enable, tstamp);
+}
+
+static inline bool
+scmi_telemetry_remote_state_update_needed(struct telemetry_info *ti,
+					  const bool *enable, bool *enabled_state,
+					  const bool *tstamp,
+					  bool *tstamp_enabled_state,
+					  bool is_group, void *obj)
+{
+	/* Is anything to do at all on this object ? */
+	if ((!enable || *enable == *enabled_state) &&
+	    (!tstamp || *tstamp == *tstamp_enabled_state))
+		return false;
+
+	/*
+	 * When the object is currently disabled AND no enable state change was
+	 * requested, BUT timestamp is being changed, update only local state...
+	 * no need to send a messagenoew, it will be sent later on enable.
+	 */
+	if (!enable && !*enabled_state) {
+		scmi_telemetry_state_cache_update(ti, enable,
+						  enabled_state, tstamp,
+						  tstamp_enabled_state,
+						  is_group ? obj : NULL,
+						  !is_group ? obj : NULL);
+
+		return false;
+	}
+
+	return true;
+}
+
+static inline void
+scmi_telemetry_state_message_prepare(struct scmi_msg_telemetry_de_configure *msg,
+				     unsigned int id, bool is_group,
+				     const bool *enable, bool *enabled_state,
+				     const bool *tstamp, bool *tstamp_enabled_state)
+{
+	msg->id = cpu_to_le32(id);
+	/* Default to disable mode */
+	msg->flags = CFG_DISABLE_ONE;
+	msg->flags |= cpu_to_le32(FIELD_PREP(GENMASK(3, 3),
+					     !is_group ? CFG_EVENT_DE : CFG_EVENT_GROUP));
+
+	if ((!enable && *enabled_state) || (enable && *enable)) {
+		/* Already enabled but tstamp_enabled state changed */
+		if (tstamp) {
+			/* Here, tstamp cannot be NULL too */
+			msg->flags |= cpu_to_le32(*tstamp ?
+					CFG_ENABLE_WTH_TSTAMP : CFG_ENABLE_NO_TSTAMP);
+		} else {
+			msg->flags |= cpu_to_le32(*tstamp_enabled_state ?
+					CFG_ENABLE_WTH_TSTAMP : CFG_ENABLE_NO_TSTAMP);
+		}
+	}
+}
+
+static inline void
+scmi_telemetry_tde_location_update(struct telemetry_de *tde,
+				   u32 *sid, u32 *offset, uuid_t *uuid)
+{
+	lockdep_assert_held(&tde->mtx);
+
+	if (sid)
+		*sid = tde->sid;
+	if (offset)
+		*offset = tde->offset;
+	if (uuid) {
+		if (tde->uuid)
+			uuid_copy(uuid, &tde->uuid->uuid);
+		else
+			memset(uuid, 0x0, sizeof(*uuid));
+	}
+}
+
+static int scmi_telemetry_tde_state_set(const struct scmi_protocol_handle *ph,
+					const bool *enable, const bool *tstamp,
+					struct scmi_telemetry_de *de,
+					u32 *sid, u32 *offset, uuid_t *uuid)
+{
+	struct scmi_msg_resp_telemetry_de_configure *resp;
+	struct scmi_msg_telemetry_de_configure *msg;
+	struct telemetry_info *ti = ph->get_priv(ph);
+	struct telemetry_de *tde = to_tde(de);
+	struct scmi_xfer *t;
+	int ret;
+
+	/* Stall concurrent configuration request */
+	guard(mutex)(&ti->config_mtx);
+
+	scoped_guard(mutex, &tde->mtx) {
+		if (!scmi_telemetry_remote_state_update_needed(ti, enable, &de->enabled,
+							       tstamp, &de->tstamp_enabled,
+							       false, de))
+			return 0;
+	}
+
+	ret = ph->xops->xfer_get_init(ph, TELEMETRY_DE_CONFIGURE,
+				      sizeof(*msg), sizeof(*resp), &t);
+	if (ret)
+		return ret;
+
+	msg = t->tx.buf;
+	scmi_telemetry_state_message_prepare(msg, de->info->id, false,
+					     enable, &de->enabled,
+					     tstamp, &de->tstamp_enabled);
+	resp = t->rx.buf;
+	ret = ph->xops->do_xfer(ph, t);
+	if (!ret) {
+		guard(mutex)(&tde->mtx);
+		ret = scmi_telemetry_tde_state_set_resp_process(ti, de, resp);
+		if (!ret) {
+			scmi_telemetry_tde_location_update(tde, sid, offset, uuid);
+
+			/* Update cached state on success */
+			scmi_telemetry_state_cache_update(ti, enable, &de->enabled,
+							  tstamp, &de->tstamp_enabled,
+							  NULL, de);
+		}
+	}
+
+	ph->xops->xfer_put(ph, t);
+
+	return ret;
+}
+
+static int scmi_telemetry_group_state_set(const struct scmi_protocol_handle *ph,
+					  const bool *enable, const bool *tstamp,
+					  struct scmi_telemetry_group *grp)
+{
+	struct scmi_msg_resp_telemetry_de_configure *resp;
+	struct telemetry_info *ti = ph->get_priv(ph);
+	struct scmi_msg_telemetry_de_configure *msg;
+	struct scmi_xfer *t;
+	int ret;
+
+	/* Stall concurrent configuration request */
+	guard(mutex)(&ti->config_mtx);
+
+	if (!scmi_telemetry_remote_state_update_needed(ti, enable, &grp->enabled,
+						       tstamp, &grp->tstamp_enabled,
+						       true, grp))
+		return 0;
+
+	ret = ph->xops->xfer_get_init(ph, TELEMETRY_DE_CONFIGURE,
+				      sizeof(*msg), sizeof(*resp), &t);
+	if (ret)
+		return ret;
+
+	msg = t->tx.buf;
+	scmi_telemetry_state_message_prepare(msg, grp->info->grp_id, true,
+					     enable, &grp->enabled,
+					     tstamp, &grp->tstamp_enabled);
+	resp = t->rx.buf;
+	ret = ph->xops->do_xfer(ph, t);
+	if (!ret) {
+		ret = scmi_telemetry_group_state_set_resp_process(ti, grp, resp);
+		if (!ret) {
+			/* Update cached state on success */
+			scmi_telemetry_state_cache_update(ti, enable, &grp->enabled,
+							  tstamp, &grp->tstamp_enabled,
+							  grp, NULL);
+		}
+	}
+
+	ph->xops->xfer_put(ph, t);
+
+	return ret;
+}
+
+static int scmi_telemetry_state_get(const struct scmi_protocol_handle *ph,
+				    const u32 *id, bool *enabled, bool *tstamp_enabled,
+				    u32 *sid, u32 *offset, uuid_t  *uuid)
+{
+	struct telemetry_info *ti = ph->get_priv(ph);
+	struct scmi_telemetry_de *de;
+	struct telemetry_de *tde;
+
+	if (!enabled || !tstamp_enabled)
+		return -EINVAL;
+
+	if (!id) {
+		guard(mutex)(&ti->des_enabled_mtx);
+		/* Returning the all_des_* state */
+		*enabled =
+			(atomic_read(&ti->des_enabled[ENA_STATE]) == ti->info.base.num_des);
+		*tstamp_enabled =
+			(atomic_read(&ti->des_enabled[ENA_TSTAMP]) == ti->num_des_tstamp);
+
+		return 0;
+	}
+
+	de = xa_load(&ti->xa_des, *id);
+	if (!de)
+		return -ENODEV;
+
+	tde = to_tde(de);
+	guard(mutex)(&tde->mtx);
+
+	*enabled = de->enabled;
+	*tstamp_enabled = de->tstamp_enabled;
+
+	scmi_telemetry_tde_location_update(tde, sid, offset, uuid);
+
+	return 0;
+}
+
+static int scmi_telemetry_state_set(const struct scmi_protocol_handle *ph,
+				    bool is_group, u32 id, const bool *enable,
+				    const bool *tstamp, u32 *sid, u32 *offset,
+				    uuid_t *uuid)
+{
+	struct telemetry_info *ti = ph->get_priv(ph);
+	struct scmi_telemetry_res_info *rinfo;
+
+	rinfo = ti->res_get(ti);
+	if (!is_group) {
+		struct scmi_telemetry_de *de;
+
+		de = xa_load(&ti->xa_des, id);
+		if (!de)
+			return -ENODEV;
+
+		return scmi_telemetry_tde_state_set(ph, enable, tstamp, de,
+						    sid, offset, uuid);
+	} else {
+		struct scmi_telemetry_group *grp;
+
+		if (id >= ti->info.base.num_groups)
+			return -EINVAL;
+
+		grp = &rinfo->grps[id];
+		return scmi_telemetry_group_state_set(ph, enable, tstamp, grp);
+	}
+}
+
+static int
+scmi_telemetry_collection_configure(const struct scmi_protocol_handle *ph,
+				    unsigned int res_id, const bool *enable,
+				    const unsigned int *update_interval_ms,
+				    const enum scmi_telemetry_collection *mode)
+{
+	enum scmi_telemetry_collection *current_mode, next_mode;
+	struct telemetry_info *ti = ph->get_priv(ph);
+	struct scmi_msg_telemetry_config_set *msg;
+	bool tlm_enable, *current_state, is_group;
+	unsigned int *active_update_interval;
+	struct scmi_xfer *t;
+	__le32 interval;
+	u32 control;
+	int ret;
+
+	/* Stall concurrent configuration request */
+	guard(mutex)(&ti->config_mtx);
+
+	if (mode && *mode == SCMI_TLM_NOTIFICATION &&
+	    !ti->info.continuous_update_support)
+		return -EINVAL;
+
+	is_group = res_id != SCMI_TLM_GRP_INVALID;
+	if (is_group && res_id >= ti->info.base.num_groups)
+		return -EINVAL;
+
+	if (!is_group) {
+		active_update_interval = &ti->info.active_update_interval;
+		current_mode = &ti->info.current_mode;
+		current_state = &ti->info.enabled;
+	} else {
+		struct scmi_telemetry_res_info *rinfo;
+
+		rinfo = ti->res_get(ti);
+		active_update_interval =
+			&rinfo->grps[res_id].active_update_interval;
+		current_mode = &rinfo->grps[res_id].current_mode;
+		current_state = &rinfo->grps[res_id].enabled;
+	}
+
+	if (!enable && !update_interval_ms && (!mode || *mode == *current_mode))
+		return 0;
+
+	ret = ph->xops->xfer_get_init(ph, TELEMETRY_CONFIG_SET,
+				      sizeof(*msg), 0, &t);
+	if (ret)
+		return ret;
+
+	if (!update_interval_ms)
+		interval = cpu_to_le32(*active_update_interval);
+	else
+		interval = cpu_to_le32(*update_interval_ms);
+
+	tlm_enable = enable ? *enable : *current_state;
+	next_mode = mode ? *mode : *current_mode;
+
+	msg = t->tx.buf;
+	msg->grp_id = cpu_to_le32(res_id);
+	control = tlm_enable ? TELEMETRY_ENABLE : 0;
+	control |= !is_group ? TELEMETRY_SET_SELECTOR_ALL : TELEMETRY_SET_SELECTOR_GROUP;
+	control |= TELEMETRY_MODE_SET(next_mode);
+	msg->control = cpu_to_le32(control);
+	msg->sampling_rate = interval;
+	ret = ph->xops->do_xfer(ph, t);
+	if (!ret) {
+		*current_state = tlm_enable;
+		*current_mode = next_mode;
+		if (!is_group)
+			ti->info.notif_enabled =
+				*current_mode == SCMI_TLM_NOTIFICATION;
+		if (update_interval_ms)
+			*active_update_interval = le32_to_cpu(interval);
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
 	.res_get = scmi_telemetry_resources_get,
+	.state_get = scmi_telemetry_state_get,
+	.state_set = scmi_telemetry_state_set,
+	.collection_configure = scmi_telemetry_collection_configure,
 };
 
 /**
@@ -2282,6 +2985,18 @@ static void scmi_telemetry_resources_free(struct telemetry_info *ti)
 	dev_dbg(ti->ph->dev, "SCMI Telemetry resources freed for instance\n");
 }
 
+static void scmi_telemetry_lines_cleanup(struct telemetry_info *ti)
+{
+	struct telemetry_line *line;
+	unsigned long idx;
+
+	guard(mutex)(&ti->lines_mtx);
+	/* Drop all remaining currently unbound lines and their containers */
+	xa_for_each(&ti->xa_lines, idx, line)
+		__scmi_telemetry_line_put(line);
+	xa_destroy(&ti->xa_lines);
+}
+
 static void scmi_telemetry_uuids_cleanup(struct telemetry_info *ti)
 {
 	uuid_t **cur_uuids;
@@ -2325,6 +3040,7 @@ static void scmi_telemetry_tdes_cleanup(struct telemetry_info *ti)
 
 		guard(mutex)(&tde->mtx);
 
+		scmi_telemetry_de_unlink(&tde->de);
 		scmi_telemetry_free_tde_put(ti, tde);
 	}
 
@@ -2353,6 +3069,7 @@ static void scmi_telemetry_instance_cleanup(void *arg)
 	scmi_telemetry_groups_free(ti->rinfo);
 	scmi_telemetry_tdes_cleanup(ti);
 	scmi_telemetry_uuids_cleanup(ti);
+	scmi_telemetry_lines_cleanup(ti);
 	scmi_telemetry_resources_free(ti);
 }
 
@@ -2475,6 +3192,7 @@ static int scmi_telemetry_instance_init(struct telemetry_info *ti)
 	xa_init(&ti->xa_des);
 	xa_init(&ti->xa_lines);
 	mutex_init(&ti->lines_mtx);
+	mutex_init(&ti->config_mtx);
 	for (int i = 0; i < 1 << PAYLD_HASH_BITS; i++)
 		mutex_init(&ti->payld_locks[i]);
 
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 30067eb8f450..cadb7610c98f 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -994,6 +994,12 @@ struct scmi_telemetry_info {
  * @info_get: get the general Telemetry information.
  * @de_lookup: get a specific DE descriptor from the DE id.
  * @res_get: get a reference to the Telemetry resources descriptor.
+ * @state_get: retrieve the specific DE or GROUP state, if NULL returns the
+ *	       cumulative state of all DEs.
+ * @state_set: enable/disable the specific DE or GROUP with or without timestamps.
+ * @collection_configure: choose a sampling rate and enable SHMTI/FC sampling
+ *			  for on demand collection via @de_data_read or async
+ *			  notificatioins for all the enabled DEs.
  */
 struct scmi_telemetry_proto_ops {
 	const struct scmi_telemetry_info __must_check *(*info_get)
@@ -1002,6 +1008,17 @@ struct scmi_telemetry_proto_ops {
 		(const struct scmi_protocol_handle *ph, u32 id);
 	const struct scmi_telemetry_res_info __must_check *(*res_get)
 		(const struct scmi_protocol_handle *ph);
+	int (*state_get)(const struct scmi_protocol_handle *ph,
+			 const u32 *id, bool *enabled, bool *tstamp_enabled,
+			 u32 *sid, u32 *offset, uuid_t *uuid);
+	int (*state_set)(const struct scmi_protocol_handle *ph,
+			 bool is_group, u32 id, const bool *enable,
+			 const bool *tstamp, u32 *sid, u32 *offset,
+			 uuid_t *uuid);
+	int (*collection_configure)(const struct scmi_protocol_handle *ph,
+				    unsigned int res_id, const bool *enable,
+				    const unsigned int *update_interval_ms,
+				    const enum scmi_telemetry_collection *mode);
 };
 
 /**
-- 
2.54.0


