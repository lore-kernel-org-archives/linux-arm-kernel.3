Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0F73C79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 22:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4P5uW8OANJdu1qQJkd42yjb4jRlQuBbGi6urUBtxQMU=; b=PgavZD5UmAVX8jghHZoLHcY4vq
	zvnmp8sOv9I/W8cF8J6G6RRaWPuQYl9SarxPyE+9q+LEXLqu6McqmjPeAw9K5zohqV8bHspvEM3p/
	1fGiJihsveYR5dupCBjRq8W3rEKNRVt4abWk2FOgLtOi2PNvMPX+WdBzBs+KoBI9hJluYv+mup8nv
	IsR2ayQqp3AE/cxb4LUMJs2MY4vnpyz8QjAkmnu9Zgw/xygmxxNzLzP+/bp+xJXRjM8+D/fIEtdMm
	y7MHrIAzWF1PIevbg5NQjrdzWSflQJ0w2lIev7R08plhO+R2EUuodtPki7JhgOWq8MSUJp9rNMklY
	4YEWOyAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4QQ9-0000000CyXg-0ta2;
	Wed, 09 Sep 2026 22:05:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4QPu-0000000CyF1-00G9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 22:05:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CEB7D1D31;
	Wed,  9 Sep 2026 15:05:13 -0700 (PDT)
Received: from oss-apollo7005.lab.cambridge.arm.com (oss-apollo7005.lab.cambridge.arm.com [10.7.15.171])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5F04E3F7D8;
	Wed,  9 Sep 2026 15:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788991517; bh=yzdZeYTmEZftojUpT9D3ZlNs2/1bcHwNlWKDhmH6rjY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=styYlpZ6A25hcY3/Lug1In80sdVOazJ5jYSfhtg+Einh5vto7DMDCL3X8knill71h
	 sh1xiSZNVwzfkHQJ2PTnJRDLV5KMU3yUnOfAeiT33cOctwnQx4hHdUst4MfStjM0pe
	 i2/3CH2UvjDW5W5M0fk5wWEpYDSgEJykACJrseYo=
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
	philip.radford@arm.com
Subject: [PATCH v9 12/13] powercap: arm_scmi: Add get_power_uw to synthetic node
Date: Wed,  9 Sep 2026 22:04:36 +0000
Message-Id: <20260909220437.1254412-13-philip.radford@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260909220437.1254412-1-philip.radford@arm.com>
References: <20260909220437.1254412-1-philip.radford@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_150518_088857_C5D1CA52 
X-CRM114-Status: GOOD (  14.50  )
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

Exposes the current power usage from the immediate children of the
synthetic (root) powercap node. Iterates over pr->spzones and sums per-zone
power.

Signed-off-by: Philip Radford <philip.radford@arm.com>
---
V8->V9
- Removed redundant if (!pr) check from instance_root_get_power_uw()
- Stopped returning a partial sum if one child read fails
---
 drivers/powercap/arm_scmi_powercap.c | 34 ++++++++++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/drivers/powercap/arm_scmi_powercap.c b/drivers/powercap/arm_scmi_powercap.c
index b5397d7675e6..aac0b00490b2 100644
--- a/drivers/powercap/arm_scmi_powercap.c
+++ b/drivers/powercap/arm_scmi_powercap.c
@@ -17,6 +17,9 @@
 #define to_scmi_powercap_zone(z)		\
 	container_of(z, struct scmi_powercap_zone, zone)
 
+#define to_scmi_powercap_root(z)		\
+	container_of(z, struct scmi_powercap_root, instance_root.zone)
+
 static const struct scmi_powercap_proto_ops *powercap_ops;
 
 struct scmi_powercap_zone {
@@ -453,9 +456,36 @@ static int instance_root_release(struct powercap_zone *pz)
 	return 0;
 }
 
-static int instance_root_get_power_uw(struct powercap_zone *pz, u64 *v)
+static int instance_root_get_power_uw(struct powercap_zone *pz, u64 *power_uw)
 {
-	*v = 0;
+	struct scmi_powercap_root *pr = to_scmi_powercap_root(pz);
+	struct scmi_powercap_zone *child;
+
+	u64 p, acc = 0;
+	int i, ret;
+
+	if (!pz || !power_uw)
+		return -EINVAL;
+
+	for (i = 0; i < pr->num_zones; i++) {
+		child = &pr->spzones[i];
+
+		if (!child->registered || child->invalid)
+			continue;
+
+		if (child->info->parent_id != SCMI_POWERCAP_ROOT_ZONE_ID)
+			continue;
+
+		ret = scmi_powercap_get_power_uw(&child->zone, &p);
+		if (ret) {
+			dev_dbg(child->dev, "Failed to read child power: %d\n", ret);
+			return ret;
+		}
+
+		acc += p;
+	}
+
+	*power_uw = acc;
 	return 0;
 }
 
-- 
2.25.1


