Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C2ACC28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 10:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5jzZq+FXHFDf0GwibCJbuU5cgZbjZqXB20UpNczHLkw=; b=uQOGt517GoZmP2fVD6M9Vqt0OZ
	8YjTymMAGoWZhh86C4wG/vHwubI8+3xKrvCfNP2gjLLgcrHMUQVKriVpPEkClsE5MjCPkhYNLkXnC
	K0MdE7PKE1GOubBBPvx69Ng6J9uZrjVXdshqUumRCsQCWrN5bJv2j6tQ1Jj6YHfRgxG+UtnPsvm06
	TqUoMyiZhkdKV90wq/PEChARGAPnUbVC54GSIvvf89cDQRli1kf9zau9zUMhUaQ2G+0OVqMcH0fN7
	aKz4TuRgUlQCLALn+5bT1lxaUsRKyqi6H+/RxwIOo9rRe5e4NPhfkhNsCkR+8zqifICPwqO+VmYmd
	RiJzhmew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt1tP-0000000DlY2-06oG;
	Fri, 14 Mar 2025 10:03:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt1oh-0000000Dkh2-3cyy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 09:59:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4CB3E1424;
	Fri, 14 Mar 2025 02:59:09 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C7AC43F5A1;
	Fri, 14 Mar 2025 02:58:57 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: linux-pm@vger.kernel.org,
	arm-scmi@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Peng Fan <peng.fan@nxp.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>
Subject: [PATCH] pmdomain: arm: scmi_pm_domain: Remove redundant state verification
Date: Fri, 14 Mar 2025 09:58:51 +0000
Message-Id: <20250314095851.443979-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_025859_946325_19C7C25B 
X-CRM114-Status: GOOD (  11.80  )
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

Currently, scmi_pd_power() explicitly verifies whether the requested
power state was applied by calling state_get(). While this check could
detect failures where the state was not properly updated, ensuring
correctness is the responsibility of the SCMI firmware.

Removing this redundant state_get() call eliminates an unnecessary
round-trip to the firmware, improving efficiency. Any mismatches
between the requested and actual states should be handled by the SCMI
firmware, which must return a failure if state_set() is unsuccessful.

Additionally, in some cases, checking the state after powering off a
domain may be unreliable or unsafe, depending on the firmware
implementation.

This patch removes the redundant verification, simplifying the function
without compromising correctness.

Cc: Peng Fan <peng.fan@nxp.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>
Reported-and-tested-by: Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/pmdomain/arm/scmi_pm_domain.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/pmdomain/arm/scmi_pm_domain.c b/drivers/pmdomain/arm/scmi_pm_domain.c
index 86b531e15b85..2a213c218126 100644
--- a/drivers/pmdomain/arm/scmi_pm_domain.c
+++ b/drivers/pmdomain/arm/scmi_pm_domain.c
@@ -24,8 +24,7 @@ struct scmi_pm_domain {
 
 static int scmi_pd_power(struct generic_pm_domain *domain, bool power_on)
 {
-	int ret;
-	u32 state, ret_state;
+	u32 state;
 	struct scmi_pm_domain *pd = to_scmi_pd(domain);
 
 	if (power_on)
@@ -33,13 +32,7 @@ static int scmi_pd_power(struct generic_pm_domain *domain, bool power_on)
 	else
 		state = SCMI_POWER_STATE_GENERIC_OFF;
 
-	ret = power_ops->state_set(pd->ph, pd->domain, state);
-	if (!ret)
-		ret = power_ops->state_get(pd->ph, pd->domain, &ret_state);
-	if (!ret && state != ret_state)
-		return -EIO;
-
-	return ret;
+	return power_ops->state_set(pd->ph, pd->domain, state);
 }
 
 static int scmi_pd_power_on(struct generic_pm_domain *domain)
-- 
2.34.1


