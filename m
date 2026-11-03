Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF896606A330
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 23:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oYYkaSAE;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=NZnzBvrd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=l8CeoFAiWciwWHbMHzBEA3tAAikKBiiZd2x+URbDIqs=; b=oYYkaSAEsxhYPk
	pxSTRBWgFJlCEW0X4X4Vu7RHss6ab/VA5IKnxLG4zOMFhxxTBBnqNPAN4apMkr3TCx2Hert7cE2mS
	Yw/MrgSUkHTHQiCiKv8izVAZ7mlLvxg9z9PW8Llx/xmvrp2NSwcQXf6EgaJHOr4BU+Xe8GDAIELzY
	UmySe4aSPfHu010pWUsq46aiaFo3hpFgs2VPMuyV0lev5N0U2g9bIAv+UANbiqlnMSe4bT/sQD95j
	+WM6LIl9AKXbXKVOC67PP4IB90xFUazlvOxxz33cpMvE9ZTYJ3yp9xjrqCAo2deU1JgSStGJVtzO/
	cI7z2jeyNiJGF5pDIM6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xONeY-00000003vCy-2qeT;
	Tue, 03 Nov 2026 23:10:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xONeU-00000003v6A-3SlD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 23:10:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4BDE41595;
	Tue,  3 Nov 2026 15:10:46 -0800 (PST)
Received: from e121740.manchester.arm.com (e121740.arm.com [10.33.8.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 720B63F673;
	Tue,  3 Nov 2026 15:10:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793747449; bh=V2Dfh3i0wYp9MNOKvKOfAQgrxIlDapReeG/2i0tOW5U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NZnzBvrdOnrdJ0HZ0/sE/3uxl4dJ0SzVJxfQRb7YD+tHKjkJNvcYMKbAkDLeRaWFL
	 ciRYzrrbpnWbd2Sd/Jv/ejZBBFDgWLyloyy+w2lZ3cWfCLL2BBCOrI+9QdmrSX3nH/
	 CcFuZ4YBAk6qo4AZzg2+zuZrUSvIwbLUXqUSjXu4=
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
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Philip Radford <philip.radford@arm.com>
Subject: [PATCH v10 09/13] powercap: arm_scmi: Enable multiple constraints support
Date: Tue,  3 Nov 2026 23:10:03 +0000
Message-Id: <20261103231007.537082-10-philip.radford@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261103231007.537082-1-philip.radford@arm.com>
References: <20261103231007.537082-1-philip.radford@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_151051_024862_0CC8CE9E 
X-CRM114-Status: GOOD (  11.08  )
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

From: Cristian Marussi <cristian.marussi@arm.com>

Initialize the domains with all the discovered available constraints,
making available multiple per-domain constraints when the platform has
advertised support for multiple concurrent power limits.

CC: "Rafael J. Wysocki" <rafael@kernel.org>
CC: linux-pm@vger.kernel.org
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
[Philip: Amended Copyright]
Signed-off-by: Philip Radford <philip.radford@arm.com>
---
V9->V10
- clamp exposed constraints to MAX_CONSTRAINTS_PER_ZONE instead of failing probe
- warn when firmware advertises more CPLs than the powercap core can expose
---
 drivers/powercap/arm_scmi_powercap.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/powercap/arm_scmi_powercap.c b/drivers/powercap/arm_scmi_powercap.c
index 0753a6938512..0c2a20f06979 100644
--- a/drivers/powercap/arm_scmi_powercap.c
+++ b/drivers/powercap/arm_scmi_powercap.c
@@ -2,7 +2,7 @@
 /*
  * SCMI Powercap support.
  *
- * Copyright (C) 2022 ARM Ltd.
+ * Copyright (C) 2022-2026 ARM Ltd.
  */
 
 #include <linux/device.h>
@@ -461,15 +461,23 @@ static int scmi_powercap_register_zone(struct scmi_powercap_root *pr,
 {
 	int ret = 0;
 	struct powercap_zone *z;
+	unsigned int nr_constraints;
 
 	if (spz->invalid) {
 		list_del(&spz->node);
 		return -EINVAL;
 	}
 
+	nr_constraints = min_t(unsigned int, spz->info->num_cpli,
+			       MAX_CONSTRAINTS_PER_ZONE);
+
+	if (spz->info->num_cpli > MAX_CONSTRAINTS_PER_ZONE)
+		dev_warn(spz->dev, "Powercap domain %s advertises %u CPLs, exposing only %u constraints\n",
+			 spz->info->name, spz->info->num_cpli, nr_constraints);
+
 	z = powercap_register_zone(&spz->zone, scmi_top_pcntrl, spz->info->name,
 				   parent ? &parent->zone : NULL,
-				   &zone_ops, 1, &constraint_ops);
+				   &zone_ops, nr_constraints, &constraint_ops);
 	if (!IS_ERR(z)) {
 		spz->height = scmi_powercap_get_zone_height(spz);
 		spz->registered = true;
-- 
2.34.1


