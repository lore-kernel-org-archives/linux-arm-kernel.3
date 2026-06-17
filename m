Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68F47CD98F1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 10:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L1T7sSjbALTxfksDDvc4VFdwBiHm6O65TT/748kLO1Y=; b=m2IAkPt5YnS+EKwjHlIg9ZbF4e
	CvLkrW1Ngmv0x1OmAV1LTyUEzajLFMrO17M6Yyn35MzeQVddUDNvtmfQ0fW0T5GBnpsvyD/cz8SFW
	hx2rsrShrDUTrSyl7WawDYEAYJ0nj0QjQlU83C6Alpsgo8HRrYWi4/M7QZ5QziuoC/HfbF0Io4cx1
	1Glc1v4YlDfx6fTKPT0NpCscnifUCEeg91aqbNq+4HkX4izrDAcgI/EEX3ACZzxr3GdiDmVXJSR84
	EbAAPtES/M3zksfGbV1w1voQR7dWHcNT98kxIESyTxQDafExxlBKCqy96vluK00j1BNdPVCZSNSof
	bXI9Msjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZn43-0000000H078-3yvd;
	Wed, 17 Jun 2026 10:00:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZn3z-0000000H00j-0U6y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 10:00:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B7C1B2E8E;
	Wed, 17 Jun 2026 02:59:57 -0700 (PDT)
Received: from donnerap.manchester.arm.com (donnerap.manchester.arm.com [10.33.8.81])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1511E3F915;
	Wed, 17 Jun 2026 02:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781690402; bh=ysAvUv+uQKD7SvxfHb5LUEwIT9/VWVtRXW6Ysv0mpjY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XBaCmaZHYV/1Vq+XaHmiTF7v+sLjlJed8tDn3PmgDLPVjLmboaRsxR3PdwzgOgoxJ
	 18r1ZNOu5Yh1oALXt7Kwxd2kpwFzKm9F+2VH0iOkNYkDUMJlP704J2jwHaZV/XROXk
	 I3H6rYvqa6I8YXINDWyKIvx9ydyrqp0x1gxmAOS4=
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
Subject: [PATCH v7 13/13] powercap: arm_scmi: Synthetic zone enable/disable
Date: Wed, 17 Jun 2026 10:59:10 +0100
Message-ID: <20260617095910.1963578-14-philip.radford@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260617095910.1963578-1-philip.radford@arm.com>
References: <20260617095910.1963578-1-philip.radford@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_030003_196396_44FE2AC9 
X-CRM114-Status: GOOD (  10.58  )
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

The synthetic instance root contols the same set of top-level SCMI domains
already handled by the control-type enable/disable helpers previously
introduced.

Add synthetic zone enabled attribute to the existing per-instance helpers
instead of duplicating the enable-state tracking and rollback logic.

Signed-off-by: Philip Radford <philip.radford@arm.com>
---
V6->V7
- Re-factored due to new control-type enable disable patch at the beginning
  of the series
- Prevent instance_root_get_enable() reporting a stale state
V5->V6
- Added use of to_scmi_powercap_root macro
- Changed instance_root_set_)enable_state to bail out on any error
- Changed logic in instance_root_get_enable to not check child states
---
 drivers/powercap/arm_scmi_powercap.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/powercap/arm_scmi_powercap.c b/drivers/powercap/arm_scmi_powercap.c
index e1bad4b19990..23708f9934d4 100644
--- a/drivers/powercap/arm_scmi_powercap.c
+++ b/drivers/powercap/arm_scmi_powercap.c
@@ -458,10 +458,34 @@ static int instance_root_get_constraint(struct powercap_zone *pz, int cid, u64 *
 	return -EOPNOTSUPP;
 }
 
+static int instance_root_set_enable(struct powercap_zone *pz, bool mode)
+{
+	struct scmi_powercap_root *pr = to_scmi_powercap_root(pz);
+
+	return scmi_powercap_set_root_children_enable_state(pr, mode);
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
+	ret = scmi_powercap_read_root_children_enable_state(pr, mode);
+	if (!ret)
+		pr->enabled = *mode;
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
2.47.3


