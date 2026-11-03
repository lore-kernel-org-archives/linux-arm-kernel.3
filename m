Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF1B606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 23:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OhW+/qpw;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=u+o0mys5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=d4vGSbGLP5QmQjtMYL4YtbBW4RNR7njSMHoefQg68F8=; b=OhW+/qpwbakRhF
	mqhGqimubw0kxrXOCKOR0cB5G23/heTu5sQFS9pt4DHSeez60FlRD3wTHtbGGlBzAweq5MLtXAeed
	2fJsYUI1yjYL4TdlbcdR0wWeTysviraWwwI9Y4CprxywkxEEHK/aZ+dDUh+Mz+xHz5xzHwCmeOkEg
	vX9iud6pDnr7PNpteIUxKbfTH3HeEPkiJ+/f5pRPlaQwN9DNxgCd/UXRAYHH8jKcftWZn7wYxHHOu
	0znbqwcV2BwFdgjmJKgB5UbycMeg+Vw0mWU77iM0aOZTbgyA5+KcWirqjm0oME5GOG7paIcWwvhLR
	IV6BsxEFfh8Kd/Rk2/Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xONek-00000003vUy-2CI0;
	Tue, 03 Nov 2026 23:11:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xONef-00000003vN3-49Rw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 23:11:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5C1661650;
	Tue,  3 Nov 2026 15:10:58 -0800 (PST)
Received: from e121740.manchester.arm.com (e121740.arm.com [10.33.8.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C9AA13F673;
	Tue,  3 Nov 2026 15:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793747461; bh=gtZfVqpym8AznIcNX4e0EWJGiRVBh8hgiCGZKcj+Omg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=u+o0mys5UwYS+xRie1FMPV+oD6wW76RtE1TXoQAw+3f3IGY4J28zZLui5+bRPf8PY
	 +t6DnvQuCMma9aR1Av/fP9VrzF0WYZva5tcG3w2a4/ABnzSqtCZd/FfahO0sIeUItx
	 wpNeLNIu90nYw2pGNEokKq+Q3ncRTHNgSmqhlnU4=
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
	Philip Radford <philip.radford@arm.com>
Subject: [PATCH v10 13/13] powercap: arm_scmi: Synthetic zone enable/disable
Date: Tue,  3 Nov 2026 23:10:07 +0000
Message-Id: <20261103231007.537082-14-philip.radford@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261103231007.537082-1-philip.radford@arm.com>
References: <20261103231007.537082-1-philip.radford@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_151102_958775_3D188A56 
X-CRM114-Status: GOOD (  13.01  )
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

The synthetic instance root contols the same set of top-level SCMI domains
already handled by the control-type enable/disable helpers previously
introduced.

Add synthetic zone enabled attribute to the existing per-instance helpers
instead of duplicating the enable-state tracking and rollback logic.

Signed-off-by: Philip Radford <philip.radford@arm.com>
---
V9->V10
- add synthetic-root enable helper with per-zone state snapshot and roolback
- abort synthetic-root enables writes if any root child zone is not configurable
- restore each changed child zone to its previous state on failure
---
 drivers/powercap/arm_scmi_powercap.c | 104 +++++++++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/drivers/powercap/arm_scmi_powercap.c b/drivers/powercap/arm_scmi_powercap.c
index d0255fd42007..0e86ad605189 100644
--- a/drivers/powercap/arm_scmi_powercap.c
+++ b/drivers/powercap/arm_scmi_powercap.c
@@ -489,10 +489,114 @@ static int instance_root_get_constraint(struct powercap_zone *pz, int cid, u64 *
 	return -EOPNOTSUPP;
 }
 
+static int scmi_powercap_set_root_children_enable_state(struct scmi_powercap_root *pr,
+							bool mode)
+{
+	struct scmi_powercap_zone_state *states;
+	struct scmi_powercap_zone *spz;
+	int num_zones = 0, nr_states = 0;
+	int i, ret = 0;
+
+	for (i = 0; i < pr->num_zones; i++) {
+		spz = &pr->spzones[i];
+
+		if (scmi_powercap_is_control_type_child(spz))
+			num_zones++;
+	}
+
+	states = kcalloc(num_zones, sizeof(*states), GFP_KERNEL);
+	if (!states)
+		return -ENOMEM;
+
+	for (i = 0; i < pr->num_zones; i++) {
+		spz = &pr->spzones[i];
+
+		if (!scmi_powercap_is_control_type_child(spz))
+			continue;
+
+		if (!spz->info->cpli[0].cap_config) {
+			ret = -EOPNOTSUPP;
+			goto out_free;
+		}
+
+		states[nr_states].spz = spz;
+
+		ret = powercap_ops->cap_enable_get(spz->ph, spz->info->id,
+			&states[nr_states].prev_enabled);
+
+		if (ret)
+			goto out_free;
+
+		nr_states++;
+	}
+
+	for (i = 0; i < nr_states; i++) {
+		spz = states[i].spz;
+
+		if (states[i].prev_enabled == mode)
+			continue;
+
+		ret = powercap_ops->cap_enable_set(spz->ph, spz->info->id, mode);
+		if (ret)
+			goto revert;
+
+		states[i].changed = true;
+	}
+
+	pr->enabled = mode;
+	goto out_free;
+
+revert:
+	while (i--) {
+		spz = states[i].spz;
+
+		if (!states[i].changed)
+			continue;
+
+		powercap_ops->cap_enable_set(spz->ph, spz->info->id,
+			states[i].prev_enabled);
+	}
+
+out_free:
+	kfree(states);
+	return ret;
+}
+
+static int instance_root_set_enable(struct powercap_zone *pz, bool mode)
+{
+	struct scmi_powercap_root *pr = to_scmi_powercap_root(pz);
+	int ret;
+
+	mutex_lock(&scmi_powercap_roots_lock);
+	ret = scmi_powercap_set_root_children_enable_state(pr, mode);
+	mutex_unlock(&scmi_powercap_roots_lock);
+
+	return ret;
+}
+
+static int instance_root_get_enable(struct powercap_zone *pz, bool *mode)
+{
+	struct scmi_powercap_root *pr = to_scmi_powercap_root(pz);
+	int ret;
+
+	if (!mode)
+		return -EINVAL;
+
+	mutex_lock(&scmi_powercap_roots_lock);
+	ret = scmi_powercap_read_root_children_enable_state(pr, mode);
+	if (!ret)
+		pr->enabled = *mode;
+	mutex_unlock(&scmi_powercap_roots_lock);
+
+	return ret;
+}
+
 static const struct powercap_zone_ops instance_root_ops = {
 	.get_max_power_range_uw = scmi_powercap_get_max_power_range_uw,
 	.get_power_uw = instance_root_get_power_uw,
 	.release = instance_root_release,
+	.set_enable = instance_root_set_enable,
+	.get_enable = instance_root_get_enable,
 };
 
 static const struct powercap_zone_constraint_ops instance_root_const_ops = {
-- 
2.34.1


