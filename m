Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9A56C369B5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 09:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zbbMws7/JHr51qmHgB5wtBPMnAvtKhFkR+q7a0rSNgo=; b=pbu/7+hyX8XfFx5gY4c+T6TVRD
	7BqE/McLOYZnjhyksTxLCWIId0Kruc1JkpL0JzBknO93UzHgVFy5YyYaiyZr4o44AuN3ZWA8PZAyN
	Tj9bnh5sUKDKX8qU7K66Yc0YFbMh/LDWXUpISRFIm7atc3QNgaR2UMrqz0aKYi47NmDQ+I8hPPUtz
	A6g6Rm//lb7GpbLP4XpGKBdI4o8TZ8WTuOLoQe7uUq9DYEuG0eWsRNOYKpSQjX3+esu44BPlGxhuK
	p/F0eOZJzGb8e1IXWAMSUIjx9vw1H3Yd1Y7SqeCz4YJGpzaNqUrRL4LSHZNuEUQiTm9mBgVUtc3d7
	Sv0TLLeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4cMN-000000057cG-2Tjc;
	Tue, 15 Apr 2025 09:13:39 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4cFH-000000056YF-2kz5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 09:06:21 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53F95wGH2996245
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Apr 2025 04:05:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744707958;
	bh=zbbMws7/JHr51qmHgB5wtBPMnAvtKhFkR+q7a0rSNgo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Ub4eQxzWW27JJe6N0qadN8dFErC+Lhph4tzFUZi5nNBT8/Cwlw74266Y72rDSgjjj
	 fzq9+wFEhh5JK9HFxuPL60pPI589jFMtfH60pstnROOeddhzyRM8zc4OrllXNMF8WU
	 VWwl6ljMNLKy3tLW62AK6D3NRFeaocOWqwzOZpvw=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53F95wUn012296
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 15 Apr 2025 04:05:58 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 15
 Apr 2025 04:05:57 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 15 Apr 2025 04:05:57 -0500
Received: from fllv0122.itg.ti.com (fllv0122.itg.ti.com [10.247.120.72])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53F95v1N029324;
	Tue, 15 Apr 2025 04:05:57 -0500
Received: from localhost (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
	by fllv0122.itg.ti.com (8.14.7/8.14.7) with ESMTP id 53F95uu5010969;
	Tue, 15 Apr 2025 04:05:57 -0500
From: Meghana Malladi <m-malladi@ti.com>
To: <dan.carpenter@linaro.org>, <javier.carrasco.cruz@gmail.com>,
        <diogo.ivo@siemens.com>, <horms@kernel.org>,
        <jacob.e.keller@intel.com>, <m-malladi@ti.com>,
        <john.fastabend@gmail.com>, <hawk@kernel.org>, <daniel@iogearbox.net>,
        <ast@kernel.org>, <richardcochran@gmail.com>, <pabeni@redhat.com>,
        <kuba@kernel.org>, <edumazet@google.com>, <davem@davemloft.net>,
        <andrew+netdev@lunn.ch>
CC: <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Roger Quadros
	<rogerq@kernel.org>, <danishanwar@ti.com>
Subject: [PATCH net v4 3/3] net: ti: icss-iep: Fix possible NULL pointer dereference for perout request
Date: Tue, 15 Apr 2025 14:35:43 +0530
Message-ID: <20250415090543.717991-4-m-malladi@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250415090543.717991-1-m-malladi@ti.com>
References: <20250415090543.717991-1-m-malladi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_020619_800316_4A9385D0 
X-CRM114-Status: GOOD (  18.80  )
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

The ICSS IEP driver tracks perout and pps enable state with flags.
Currently when disabling pps and perout signals during icss_iep_exit(),
results in NULL pointer dereference for perout.

To fix the null pointer dereference issue, the icss_iep_perout_enable_hw
function can be modified to directly clear the IEP CMP registers when
disabling PPS or PEROUT, without referencing the ptp_perout_request
structure, as its contents are irrelevant in this case.

Fixes: 9b115361248d ("net: ti: icssg-prueth: Fix clearing of IEP_CMP_CFG registers during iep_init")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/all/7b1c7c36-363a-4085-b26c-4f210bee1df6@stanley.mountain/
Signed-off-by: Meghana Malladi <m-malladi@ti.com>
---

Changes from v3 (v4-v3):
- Fix the logic in icss_iep_perout_enable_hw() to clear IEP registers
  when disabling periodic signal

 drivers/net/ethernet/ti/icssg/icss_iep.c | 121 +++++++++++------------
 1 file changed, 58 insertions(+), 63 deletions(-)

diff --git a/drivers/net/ethernet/ti/icssg/icss_iep.c b/drivers/net/ethernet/ti/icssg/icss_iep.c
index b4a34c57b7b4..2a1c43316f46 100644
--- a/drivers/net/ethernet/ti/icssg/icss_iep.c
+++ b/drivers/net/ethernet/ti/icssg/icss_iep.c
@@ -412,6 +412,22 @@ static int icss_iep_perout_enable_hw(struct icss_iep *iep,
 	int ret;
 	u64 cmp;
 
+	if (!on) {
+		/* Disable CMP 1 */
+		regmap_update_bits(iep->map, ICSS_IEP_CMP_CFG_REG,
+				   IEP_CMP_CFG_CMP_EN(1), 0);
+
+		/* clear CMP regs */
+		regmap_write(iep->map, ICSS_IEP_CMP1_REG0, 0);
+		if (iep->plat_data->flags & ICSS_IEP_64BIT_COUNTER_SUPPORT)
+			regmap_write(iep->map, ICSS_IEP_CMP1_REG1, 0);
+
+		/* Disable sync */
+		regmap_write(iep->map, ICSS_IEP_SYNC_CTRL_REG, 0);
+
+		return 0;
+	}
+
 	/* Calculate width of the signal for PPS/PEROUT handling */
 	ts.tv_sec = req->on.sec;
 	ts.tv_nsec = req->on.nsec;
@@ -430,64 +446,39 @@ static int icss_iep_perout_enable_hw(struct icss_iep *iep,
 		if (ret)
 			return ret;
 
-		if (on) {
-			/* Configure CMP */
-			regmap_write(iep->map, ICSS_IEP_CMP1_REG0, lower_32_bits(cmp));
-			if (iep->plat_data->flags & ICSS_IEP_64BIT_COUNTER_SUPPORT)
-				regmap_write(iep->map, ICSS_IEP_CMP1_REG1, upper_32_bits(cmp));
-			/* Configure SYNC, based on req on width */
-			regmap_write(iep->map, ICSS_IEP_SYNC_PWIDTH_REG,
-				     div_u64(ns_width, iep->def_inc));
-			regmap_write(iep->map, ICSS_IEP_SYNC0_PERIOD_REG, 0);
-			regmap_write(iep->map, ICSS_IEP_SYNC_START_REG,
-				     div_u64(ns_start, iep->def_inc));
-			regmap_write(iep->map, ICSS_IEP_SYNC_CTRL_REG, 0); /* one-shot mode */
-			/* Enable CMP 1 */
-			regmap_update_bits(iep->map, ICSS_IEP_CMP_CFG_REG,
-					   IEP_CMP_CFG_CMP_EN(1), IEP_CMP_CFG_CMP_EN(1));
-		} else {
-			/* Disable CMP 1 */
-			regmap_update_bits(iep->map, ICSS_IEP_CMP_CFG_REG,
-					   IEP_CMP_CFG_CMP_EN(1), 0);
-
-			/* clear regs */
-			regmap_write(iep->map, ICSS_IEP_CMP1_REG0, 0);
-			if (iep->plat_data->flags & ICSS_IEP_64BIT_COUNTER_SUPPORT)
-				regmap_write(iep->map, ICSS_IEP_CMP1_REG1, 0);
-		}
+		/* Configure CMP */
+		regmap_write(iep->map, ICSS_IEP_CMP1_REG0, lower_32_bits(cmp));
+		if (iep->plat_data->flags & ICSS_IEP_64BIT_COUNTER_SUPPORT)
+			regmap_write(iep->map, ICSS_IEP_CMP1_REG1, upper_32_bits(cmp));
+		/* Configure SYNC, based on req on width */
+		regmap_write(iep->map, ICSS_IEP_SYNC_PWIDTH_REG,
+			     div_u64(ns_width, iep->def_inc));
+		regmap_write(iep->map, ICSS_IEP_SYNC0_PERIOD_REG, 0);
+		regmap_write(iep->map, ICSS_IEP_SYNC_START_REG,
+			     div_u64(ns_start, iep->def_inc));
+		regmap_write(iep->map, ICSS_IEP_SYNC_CTRL_REG, 0); /* one-shot mode */
+		/* Enable CMP 1 */
+		regmap_update_bits(iep->map, ICSS_IEP_CMP_CFG_REG,
+				   IEP_CMP_CFG_CMP_EN(1), IEP_CMP_CFG_CMP_EN(1));
 	} else {
-		if (on) {
-			u64 start_ns;
-
-			iep->period = ((u64)req->period.sec * NSEC_PER_SEC) +
-				      req->period.nsec;
-			start_ns = ((u64)req->period.sec * NSEC_PER_SEC)
-				   + req->period.nsec;
-			icss_iep_update_to_next_boundary(iep, start_ns);
-
-			regmap_write(iep->map, ICSS_IEP_SYNC_PWIDTH_REG,
-				     div_u64(ns_width, iep->def_inc));
-			regmap_write(iep->map, ICSS_IEP_SYNC_START_REG,
-				     div_u64(ns_start, iep->def_inc));
-			/* Enable Sync in single shot mode  */
-			regmap_write(iep->map, ICSS_IEP_SYNC_CTRL_REG,
-				     IEP_SYNC_CTRL_SYNC_N_EN(0) | IEP_SYNC_CTRL_SYNC_EN);
-			/* Enable CMP 1 */
-			regmap_update_bits(iep->map, ICSS_IEP_CMP_CFG_REG,
-					   IEP_CMP_CFG_CMP_EN(1), IEP_CMP_CFG_CMP_EN(1));
-		} else {
-			/* Disable CMP 1 */
-			regmap_update_bits(iep->map, ICSS_IEP_CMP_CFG_REG,
-					   IEP_CMP_CFG_CMP_EN(1), 0);
-
-			/* clear CMP regs */
-			regmap_write(iep->map, ICSS_IEP_CMP1_REG0, 0);
-			if (iep->plat_data->flags & ICSS_IEP_64BIT_COUNTER_SUPPORT)
-				regmap_write(iep->map, ICSS_IEP_CMP1_REG1, 0);
-
-			/* Disable sync */
-			regmap_write(iep->map, ICSS_IEP_SYNC_CTRL_REG, 0);
-		}
+		u64 start_ns;
+
+		iep->period = ((u64)req->period.sec * NSEC_PER_SEC) +
+				req->period.nsec;
+		start_ns = ((u64)req->period.sec * NSEC_PER_SEC)
+				+ req->period.nsec;
+		icss_iep_update_to_next_boundary(iep, start_ns);
+
+		regmap_write(iep->map, ICSS_IEP_SYNC_PWIDTH_REG,
+			     div_u64(ns_width, iep->def_inc));
+		regmap_write(iep->map, ICSS_IEP_SYNC_START_REG,
+			     div_u64(ns_start, iep->def_inc));
+		/* Enable Sync in single shot mode  */
+		regmap_write(iep->map, ICSS_IEP_SYNC_CTRL_REG,
+			     IEP_SYNC_CTRL_SYNC_N_EN(0) | IEP_SYNC_CTRL_SYNC_EN);
+		/* Enable CMP 1 */
+		regmap_update_bits(iep->map, ICSS_IEP_CMP_CFG_REG,
+				   IEP_CMP_CFG_CMP_EN(1), IEP_CMP_CFG_CMP_EN(1));
 	}
 
 	return 0;
@@ -498,11 +489,21 @@ static int icss_iep_perout_enable(struct icss_iep *iep,
 {
 	int ret = 0;
 
+	if (!on)
+		goto disable;
+
 	/* Reject requests with unsupported flags */
 	if (req->flags & ~(PTP_PEROUT_DUTY_CYCLE |
 			  PTP_PEROUT_PHASE))
 		return -EOPNOTSUPP;
 
+	/* Set default "on" time (1ms) for the signal if not passed by the app */
+	if (!(req->flags & PTP_PEROUT_DUTY_CYCLE)) {
+		req->on.sec = 0;
+		req->on.nsec = NSEC_PER_MSEC;
+	}
+
+disable:
 	mutex_lock(&iep->ptp_clk_mutex);
 
 	if (iep->pps_enabled) {
@@ -513,12 +514,6 @@ static int icss_iep_perout_enable(struct icss_iep *iep,
 	if (iep->perout_enabled == !!on)
 		goto exit;
 
-	/* Set default "on" time (1ms) for the signal if not passed by the app */
-	if (!(req->flags & PTP_PEROUT_DUTY_CYCLE)) {
-		req->on.sec = 0;
-		req->on.nsec = NSEC_PER_MSEC;
-	}
-
 	ret = icss_iep_perout_enable_hw(iep, req, on);
 	if (!ret)
 		iep->perout_enabled = !!on;
-- 
2.43.0


