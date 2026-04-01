Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3AECD35164
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 09:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eqv8RkvqGq9wjRNvTIyh0GmirctOsSB4HKj8zrCkV7Y=; b=KqaDltREWH+aRyHYWePQxr3w6A
	KaPoWX3qbEoKPuVz3rYUy0zpW0V2I5xuEvjM3wl4mRaWyAOMRDieln1Ka+ODrw5x6HJR+i8eHc/iM
	9az0YkU6b0Rrlv8ATXd2PFkdRATWks83SoOZ+/WXA1hQYSOQGhuEHEptcGIT2854nz4tfkFcWDhMm
	r5ADSjQaOqXinYIt5Zq2c+f4Edtghgs5gHbCPyM1KSqkSBTwXflQI6fyj/P+VFwPW+++nDITndsW4
	wFyWQKxvlyGfVu2d13L8Fs/PqroHKumXnrbP3gRFWDcEZ0VdnxVNAVcB/ayiukGBy1IPD0aB3QWee
	BW1X82PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7sHP-0000000ES8q-0DKF;
	Wed, 01 Apr 2026 09:54:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7sHL-0000000ES45-2H92
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 09:54:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E22FA2E98;
	Wed,  1 Apr 2026 02:54:20 -0700 (PDT)
Received: from donnerap.manchester.arm.com (donnerap.manchester.arm.com [10.33.8.81])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D01513F7D8;
	Wed,  1 Apr 2026 02:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775037266; bh=h5Ir1KiWUSZRowTk+VS/ZgfqrlKy67KWydZeVojwgsk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PAZRJbuwARBiu7AxQeVMj7NXhgU3wVCWk5g7zLF09uCYk5TSZkZTR48e5oihFynpu
	 G+PlvaQvI7+9ccGB4s4f8x2eBzCYlpXtN8ZZCeiqwyXH2+qAvU01SB/2M3ajC4k0l/
	 uoMaO/K794QmSSKMWQwPQDEeJKR+8WQE3PKdd5Dk=
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
Subject: [PATCH v4 11/11] powercap: arm_scmi: Add get_power_uw to synthetic node
Date: Wed,  1 Apr 2026 10:53:49 +0100
Message-ID: <20260401095349.2217840-12-philip.radford@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260401095349.2217840-1-philip.radford@arm.com>
References: <20260401095349.2217840-1-philip.radford@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_025427_622917_4751FCD2 
X-CRM114-Status: GOOD (  12.75  )
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
index 6fc2cab30b05..53fcbf178e8c 100644
--- a/drivers/powercap/arm_scmi_powercap.c
+++ b/drivers/powercap/arm_scmi_powercap.c
@@ -270,9 +270,34 @@ static int instance_root_release(struct powercap_zone *pz)
 	return 0;
 }
 
-static int instance_root_get_power_uw(struct powercap_zone *pz, u64 *v)
+static int instance_root_get_power_uw(struct powercap_zone *pz, u64 *power_u)
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
+	pr = container_of(root, struct scmi_powercap_root, agent_root);
+	if (!pr)
+		return -ENODEV;
+
+	list_for_each_entry(child, &pr->registered_zones[0], node) {
+		if (child == &pr->agent_root)
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


