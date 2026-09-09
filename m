Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B886C79FBB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 22:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=97mazIhGY7mVGLQBzxN6/bgmj1qB3JVSopvlscOqnRo=; b=zKhs03xMuCVubOVkabS/OSwrC8
	YljefYZ9fRwWDZgK90+QQLrkAlbGx7ATxrmBI6kbQLogLWLsMpM3NrcPS/q3qkxgggxOpjfz5guSq
	IVeH6b80WQvXT1viMxstnWZMEEys+DzI/0SqBLYghs/XM8n+5ip1dEFqHY3r60/hHVO4LWEuGXP5X
	AuIPnFgm/mb26Y5oZayzQb3elMMODMijgbPdcW1Phk46ObAGgxKTCgpbi4uGaaljey0dRPa3Jq/Ib
	78PEl9sWQAeXjl6WgGWmxpXPg3VPMCWqHjFlkufgw/5ySaBUfS3hO86kXZuKWG1jv5TtQ0WahFEWq
	H3vPjaYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4QPt-0000000CyES-2ox3;
	Wed, 09 Sep 2026 22:05:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4QPo-0000000Cy8D-0ZYw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 22:05:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F21BD1D31;
	Wed,  9 Sep 2026 15:05:06 -0700 (PDT)
Received: from oss-apollo7005.lab.cambridge.arm.com (oss-apollo7005.lab.cambridge.arm.com [10.7.15.171])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4908E3F7D8;
	Wed,  9 Sep 2026 15:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788991510; bh=aknyCKmZa6bn8Vc/kSGrTAa8/4N0iLTZTK5+nRuMgKU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gplb/gyJeohXIPitwZP2G3RjpNt5XEw/W5q73ElKR0adExkca+Fs7Yhsj5yVMIvls
	 MeVGIiqdKhnRFCrEvlYiN4OXBJgN7kYFpRd+AnuRf6dI07fcJ6y71Ij3cJU0ZdHc6v
	 PS7lY+TCP65/Tpsw6xv1cIK19qC7QcWutQj4UUcA=
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
	philip.radford@arm.com,
	Cristian Marussi <cristian.marussi@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Subject: [PATCH v9 09/13] powercap: arm_scmi: Enable multiple constraints support
Date: Wed,  9 Sep 2026 22:04:33 +0000
Message-Id: <20260909220437.1254412-10-philip.radford@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260909220437.1254412-1-philip.radford@arm.com>
References: <20260909220437.1254412-1-philip.radford@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_150512_217222_59E330D4 
X-CRM114-Status: GOOD (  10.60  )
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

Initialize the domains with all the discovered available constraints,
making available multiple per-domain constraints when the platform has
advertised support for multiple concurrent power limits.

CC: "Rafael J. Wysocki" <rafael@kernel.org>
CC: linux-pm@vger.kernel.org
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
[Philip: Amended Copyright]
Signed-off-by: Philip Radford <philip.radford@arm.com>
---
V8->V9
- Added validation check to make sure powercap domain doesn't have too
many constraints
---
 drivers/powercap/arm_scmi_powercap.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/powercap/arm_scmi_powercap.c b/drivers/powercap/arm_scmi_powercap.c
index 2d9370aaaf5d..bcd1ba0bde8c 100644
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
@@ -491,7 +491,7 @@ static int scmi_powercap_register_zone(struct scmi_powercap_root *pr,
 
 	z = powercap_register_zone(&spz->zone, scmi_top_pcntrl, spz->info->name,
 				   parent ? &parent->zone : NULL,
-				   &zone_ops, 1, &constraint_ops);
+				   &zone_ops, spz->info->num_cpli, &constraint_ops);
 	if (!IS_ERR(z)) {
 		spz->height = scmi_powercap_get_zone_height(spz);
 		spz->registered = true;
@@ -649,6 +649,13 @@ static int scmi_powercap_probe(struct scmi_device *sdev)
 		 */
 		spz->info = powercap_ops->info_get(ph, i);
 
+		if (spz->info->num_cpli > MAX_CONSTRAINTS_PER_ZONE) {
+			dev_err(dev, "Powercap domain %s has too many constraints: %u > %u\n",
+				spz->info->name, spz->info->num_cpli,
+				MAX_CONSTRAINTS_PER_ZONE);
+			return -EINVAL;
+		}
+
 		spz->dev = dev;
 		spz->ph = ph;
 		spz->spzones = pr->spzones;
-- 
2.25.1


