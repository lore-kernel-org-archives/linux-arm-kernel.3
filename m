Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56FEBFF8868
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 09:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CqeCF8jgBL7WeLx3cJsDtGjbHqiNTCngREx3jtwEHR8=; b=ht8sDC4ODqJpbHwPi8d3kbH2Ew
	CxtZCG8b0uTV7dcjZPKfRgswrey2J+AdVp08L7BP1SQO256lZzT0b9S1l7X3yT8nlUw+R5ITyako6
	jOz51hF+cQxQt8hbwf/i45jfXt60Spp84JE9ucgULXChTgQgPkD0857p4pkXPZt5qZK+cPJEe87PP
	DJtaLDTFv2fKbSkIwsiyGM+AfKZHGal98yX8PPNfxMuwibAGbB3U0kGvkaq88i74B4ow5KBhRbxtM
	SEJdrBhHXGeYRVYxO5zaIDxgFJGzRA0/hx8neq6d+YVsjIU16QKDojIP+SCpbPYJnv0+Oux2g3hs5
	Bs5bYIbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHeSX-000000012Mu-1jcT;
	Tue, 28 Apr 2026 09:10:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHeSE-00000001251-31Hy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 09:10:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6C50515A1;
	Tue, 28 Apr 2026 02:10:00 -0700 (PDT)
Received: from donnerap.manchester.arm.com (donnerap.manchester.arm.com [10.33.8.81])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 98DD43F62B;
	Tue, 28 Apr 2026 02:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777367405; bh=oOi5+FezjQ1e4aYyhZu1Gg6yAKds2xcysyHCBosKTyo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PB4Qye368hQF247pfeKONgd9KffNTVB+6mns4vpxfnYS3Af2Sm3C8nFbGy7yirghc
	 +BtF6RgfwYNP49ABKyT43K7eMq7QvtvBPHSXn4Vott8GDxcmWUN6zg02SNvoRkkBV6
	 WdWTEabO8+9fpkBOpMHcD19jqr86xTlb8vsXEEt0=
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
Subject: [PATCH v5 11/12] powercap: arm_scmi: Add get_power_uw to synthetic node
Date: Tue, 28 Apr 2026 10:09:20 +0100
Message-ID: <20260428090922.346069-12-philip.radford@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260428090922.346069-1-philip.radford@arm.com>
References: <20260428090922.346069-1-philip.radford@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_021006_859906_C9B0B869 
X-CRM114-Status: GOOD (  12.32  )
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

Exposes the current power usage from the immediate children of
the synthetic (root) powercap node. Iterates over pr->spzones and
sums per-zone power.

Signed-off-by: Philip Radford <philip.radford@arm.com>
---
 drivers/powercap/arm_scmi_powercap.c | 29 ++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/powercap/arm_scmi_powercap.c b/drivers/powercap/arm_scmi_powercap.c
index d74869af1633..81b5214acda4 100644
--- a/drivers/powercap/arm_scmi_powercap.c
+++ b/drivers/powercap/arm_scmi_powercap.c
@@ -270,9 +270,34 @@ static int instance_root_release(struct powercap_zone *pz)
 	return 0;
 }
 
-static int instance_root_get_power_uw(struct powercap_zone *pz, u64 *v)
+static int instance_root_get_power_uw(struct powercap_zone *pz, u64 *power_uw)
 {
-	*v = 0;
+	struct scmi_powercap_zone *root = to_scmi_powercap_zone(pz);
+	struct scmi_powercap_zone *child;
+	struct scmi_powercap_root *pr;
+	u64 acc = 0;
+	u64 p;
+	int ret;
+
+	if (!pz || !power_uw)
+		return -EINVAL;
+
+	pr = container_of(root, struct scmi_powercap_root, instance_root);
+	if (!pr)
+		return -ENODEV;
+
+	list_for_each_entry(child, &pr->registered_zones[0], node) {
+		if (child == &pr->instance_root)
+			continue;
+
+		ret = scmi_powercap_get_power_uw(&child->zone, &p);
+		if (!ret)
+			acc += p;
+		else
+			dev_dbg(child->dev, "Failed to read child power: %u\n", ret);
+	}
+
+	*power_uw = acc;
 	return 0;
 }
 
-- 
2.47.3


