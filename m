Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C130CD4F52
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 13:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jz4V+l2gDp4HUzq0FFgc9h+pu+X5Hs2dUFR69Y3a8qE=; b=Ncuv2wt2eUgII1OqpKfl9JFqva
	YM/y88gw1g5YCbbPxdKf140IqytpLQCaI7bM/8yh28ED4qFT+gdaZNoGju+AK8W2swHy5BZAYA8lA
	M8sPA8YBfHhxC0g/R0YGsFaPyk/v1AkA9n9xCAi1ZmebKitD78QWk8diY2AYlx9PQJx0I479vQpGN
	HfR789toSQoVAjDVicNHMmsmLGLDHdyDHjS5Inn4BAJryqSEJ1h6Zgo6cTNp2nYsLONGLpwN1Urs8
	hsPMsN7mkqAM5uBoku6mhmsSgO1azX1cRgeZXLiQwseYc6Xl8pw2qklbVPH3/uDfh13o+vgHiitHw
	GG++KPVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOyPJ-0000000Fs9h-1vLp;
	Mon, 18 May 2026 13:53:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOyPD-0000000Fs3T-37LL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 13:53:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D6672328;
	Mon, 18 May 2026 06:53:09 -0700 (PDT)
Received: from donnerap.manchester.arm.com (donnerap.manchester.arm.com [10.33.8.81])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9BB493F7B4;
	Mon, 18 May 2026 06:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779112394; bh=f9VAJAVk33CvV3c3BskgiL++l1yOos1V84XA6CDRE/c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y5q/kekgjz4HNRp5Vc6ajdvOol+jMXdHs4+O0bYIMyroet0jSlkQpvThUgby2+zuE
	 dfHMc19qJ4hKOv54JM1DpxfajiS0MvFSxkQcyQLS+co2i3ig6+0pqjvN3efEge6Gxd
	 gOtw0gOzCW9GC2shh6/DN8Te7nmlL9cbFsugRK/k=
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
Subject: [PATCH v6 11/12] powercap: arm_scmi: Add get_power_uw to synthetic node
Date: Mon, 18 May 2026 14:52:33 +0100
Message-ID: <20260518135234.2953532-12-philip.radford@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260518135234.2953532-1-philip.radford@arm.com>
References: <20260518135234.2953532-1-philip.radford@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_065315_825230_2786045A 
X-CRM114-Status: GOOD (  14.87  )
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

Exposes the current power usage from the immediate children of the synthetic
(root) powercap node. Iterates over pr->spzones and sums per-zone power.

Signed-off-by: Philip Radford <philip.radford@arm.com>
---
V5->V6
- Moved multiple u64 values to the same line
- Reworked logic to walk SCMI zones and filter by parent
- Added to_scmi_powercap_root macro
---
 drivers/powercap/arm_scmi_powercap.c | 35 ++++++++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/drivers/powercap/arm_scmi_powercap.c b/drivers/powercap/arm_scmi_powercap.c
index 5e7b7a3b79f2..f1cb25a408bb 100644
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
@@ -273,9 +276,37 @@ static int instance_root_release(struct powercap_zone *pz)
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
+	if (!pr)
+		return -ENODEV;
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


