Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6B04C282D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 12:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GJoUAjuJfQu4k4fnMcjGL7udW/5S8lHd1rnjul2G4xk=; b=NOJL3Z52CaWnLKI1c1jwkHt5iQ
	xVWsA34uUT8DGf/fG3BaW340D0i1HccdIV9AV6WDKG00jibqmXAzPgMpQbLcQeXEp2i8k6dfYiEy8
	GZGNJMYeIXxSk/hRymF8qs5K1Fqh+VWqVZuCZxxo8Mp+xbhiJAZfdjzD7hlR9trL3mIVHSfDzVXl/
	Thz/akgUY8PfrvNa4gZ63ULAm6O96qVXHmu3JLBib2q3wE6Bn0SB5YZgOnlEuAaKbSX3WFefcUI3R
	xBtMJ7iJYyf1JqsoNAmukNwvdtihMkUsQPVyhgA0wG9ZiNkdKmr0HmoGZ248tkBikEXftBQX9YwT3
	UO8r8BhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpR4v-00000004Wkb-0pE0;
	Tue, 04 Mar 2025 12:08:53 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpPye-00000004Ipt-11B0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 10:58:21 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 524AwBOV3625150
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 4 Mar 2025 04:58:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741085891;
	bh=GJoUAjuJfQu4k4fnMcjGL7udW/5S8lHd1rnjul2G4xk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=wUy+Ul4YTkxaqnM4o7M6Ezc7YyXZXewjAjF8Y+TW+u7jFc7moTh4UGj+09Ke1fhfv
	 nrcDV5v6MDGHn8nm/FhxIn5kG5Mbwyvfjxs5VPAIN9IlXzcEk83NtAytPVuavyQ1NZ
	 1vF+DwVIqe77o13vyOTlC0O9ij2YAPjzPtFLFnzc=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 524AwBsh111976
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 4 Mar 2025 04:58:11 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 4
 Mar 2025 04:58:10 -0600
Received: from fllvsmtp7.itg.ti.com (10.64.40.31) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 4 Mar 2025 04:58:10 -0600
Received: from lelv0854.itg.ti.com (lelv0854.itg.ti.com [10.181.64.140])
	by fllvsmtp7.itg.ti.com (8.15.2/8.15.2) with ESMTP id 524AwARO044329;
	Tue, 4 Mar 2025 04:58:10 -0600
Received: from localhost (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
	by lelv0854.itg.ti.com (8.14.7/8.14.7) with ESMTP id 524Aw9Wr016831;
	Tue, 4 Mar 2025 04:58:10 -0600
From: Meghana Malladi <m-malladi@ti.com>
To: <javier.carrasco.cruz@gmail.com>, <diogo.ivo@siemens.com>,
        <m-malladi@ti.com>, <horms@kernel.org>, <richardcochran@gmail.com>,
        <pabeni@redhat.com>, <kuba@kernel.org>, <edumazet@google.com>,
        <davem@davemloft.net>, <andrew+netdev@lunn.ch>
CC: <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>,
        Roger Quadros <rogerq@kernel.org>, <danishanwar@ti.com>,
        Jacob Keller <jacob.e.keller@intel.com>,
        Kory Maincent
	<kory.maincent@bootlin.com>
Subject: [PATCH net-next v4 1/2] net: ti: icss-iep: Add pwidth configuration for perout signal
Date: Tue, 4 Mar 2025 16:27:52 +0530
Message-ID: <20250304105753.1552159-2-m-malladi@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250304105753.1552159-1-m-malladi@ti.com>
References: <20250304105753.1552159-1-m-malladi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_025820_367865_D6990DE7 
X-CRM114-Status: GOOD (  19.86  )
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

icss_iep_perout_enable_hw() is a common function for generating
both pps and perout signals. When enabling pps, the application needs
to only pass enable/disable argument, whereas for perout it supports
different flags to configure the signal.

But icss_iep_perout_enable_hw() function is missing to hook the
configuration params passed by the app, causing perout to behave
same a pps (except being able to configure the period). As duty cycle
is also one feature which can configured for perout, incorporate this
in the function to get the expected signal.

Signed-off-by: Meghana Malladi <m-malladi@ti.com>
Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
---
Changes from v3 (v4-v3):
- Move flag checks out of mutex lock as suggested by Kory Maincent <kory.maincent@bootlin.com>
- Collected RB tag from Kory Maincent <kory.maincent@bootlin.com>

 drivers/net/ethernet/ti/icssg/icss_iep.c | 47 ++++++++++++++++++++++--
 1 file changed, 44 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/ti/icssg/icss_iep.c b/drivers/net/ethernet/ti/icssg/icss_iep.c
index d59c1744840a..2981c19c48b1 100644
--- a/drivers/net/ethernet/ti/icssg/icss_iep.c
+++ b/drivers/net/ethernet/ti/icssg/icss_iep.c
@@ -406,9 +406,16 @@ static void icss_iep_update_to_next_boundary(struct icss_iep *iep, u64 start_ns)
 static int icss_iep_perout_enable_hw(struct icss_iep *iep,
 				     struct ptp_perout_request *req, int on)
 {
+	struct timespec64 ts;
+	u64 ns_width;
 	int ret;
 	u64 cmp;
 
+	/* Calculate width of the signal for PPS/PEROUT handling */
+	ts.tv_sec = req->on.sec;
+	ts.tv_nsec = req->on.nsec;
+	ns_width = timespec64_to_ns(&ts);
+
 	if (iep->ops && iep->ops->perout_enable) {
 		ret = iep->ops->perout_enable(iep->clockops_data, req, on, &cmp);
 		if (ret)
@@ -419,8 +426,9 @@ static int icss_iep_perout_enable_hw(struct icss_iep *iep,
 			regmap_write(iep->map, ICSS_IEP_CMP1_REG0, lower_32_bits(cmp));
 			if (iep->plat_data->flags & ICSS_IEP_64BIT_COUNTER_SUPPORT)
 				regmap_write(iep->map, ICSS_IEP_CMP1_REG1, upper_32_bits(cmp));
-			/* Configure SYNC, 1ms pulse width */
-			regmap_write(iep->map, ICSS_IEP_SYNC_PWIDTH_REG, 1000000);
+			/* Configure SYNC, based on req on width */
+			regmap_write(iep->map, ICSS_IEP_SYNC_PWIDTH_REG,
+				     div_u64(ns_width, iep->def_inc));
 			regmap_write(iep->map, ICSS_IEP_SYNC0_PERIOD_REG, 0);
 			regmap_write(iep->map, ICSS_IEP_SYNC_START_REG, 0);
 			regmap_write(iep->map, ICSS_IEP_SYNC_CTRL_REG, 0); /* one-shot mode */
@@ -447,6 +455,8 @@ static int icss_iep_perout_enable_hw(struct icss_iep *iep,
 				   + req->period.nsec;
 			icss_iep_update_to_next_boundary(iep, start_ns);
 
+			regmap_write(iep->map, ICSS_IEP_SYNC_PWIDTH_REG,
+				     div_u64(ns_width, iep->def_inc));
 			/* Enable Sync in single shot mode  */
 			regmap_write(iep->map, ICSS_IEP_SYNC_CTRL_REG,
 				     IEP_SYNC_CTRL_SYNC_N_EN(0) | IEP_SYNC_CTRL_SYNC_EN);
@@ -474,7 +484,36 @@ static int icss_iep_perout_enable_hw(struct icss_iep *iep,
 static int icss_iep_perout_enable(struct icss_iep *iep,
 				  struct ptp_perout_request *req, int on)
 {
-	return -EOPNOTSUPP;
+	int ret = 0;
+
+	/* Reject requests with unsupported flags */
+	if (req->flags & ~PTP_PEROUT_DUTY_CYCLE)
+		return -EOPNOTSUPP;
+
+	mutex_lock(&iep->ptp_clk_mutex);
+
+	if (iep->pps_enabled) {
+		ret = -EBUSY;
+		goto exit;
+	}
+
+	if (iep->perout_enabled == !!on)
+		goto exit;
+
+	/* Set default "on" time (1ms) for the signal if not passed by the app */
+	if (!(req->flags & PTP_PEROUT_DUTY_CYCLE)) {
+		req->on.sec = 0;
+		req->on.nsec = NSEC_PER_MSEC;
+	}
+
+	ret = icss_iep_perout_enable_hw(iep, req, on);
+	if (!ret)
+		iep->perout_enabled = !!on;
+
+exit:
+	mutex_unlock(&iep->ptp_clk_mutex);
+
+	return ret;
 }
 
 static void icss_iep_cap_cmp_work(struct work_struct *work)
@@ -553,6 +592,8 @@ static int icss_iep_pps_enable(struct icss_iep *iep, int on)
 		rq.perout.period.nsec = 0;
 		rq.perout.start.sec = ts.tv_sec + 2;
 		rq.perout.start.nsec = 0;
+		rq.perout.on.sec = 0;
+		rq.perout.on.nsec = NSEC_PER_MSEC;
 		ret = icss_iep_perout_enable_hw(iep, &rq.perout, on);
 	} else {
 		ret = icss_iep_perout_enable_hw(iep, &rq.perout, on);
-- 
2.43.0


