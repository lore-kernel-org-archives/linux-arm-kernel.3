Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C320C021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 09:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KCA7vGFgUuQ6upLklkqCE5dso0EBiAyQ0+h7Nfrm9ZA=; b=y+rcqjzv5dTNA/ISLh4FLwutkp
	4YkaBSbo+ym6cEThAIGdNLGBpFWGwgfCaDKsLh+8HxyXF69Hh+Y7MIfKYXAfuwiUnwVOnFmJCHZ93
	XlqLvQb33KA4RDfBvjxKyS1EF2zH3i6oRIRv2cWm8vOLIOxNk3/VGSbTVeDpTUy/D+2OQTJjhDzHX
	wtNLEHTGWXhdRHRwiNOy5T8dvTa8tGUCneWgpb5FR0LKVubNMBobA3n/mqcHrI1UPNv3wOY1zKB11
	ZfvGKQg04KTDBzdi7Vv6VTIb82Kni6NQo5+CZ9Or8DkZnhvfr0WviGGHIX+2wxhog3DDCo92yo0KY
	1HPQImnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnaLj-00000006t6i-1YB2;
	Thu, 27 Feb 2025 09:38:35 +0000
Received: from [198.47.23.234] (helo=lelvem-ot01.ext.ti.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tna8V-00000006qux-3JRC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 09:24:57 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51R9Ojp01812919
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Feb 2025 03:24:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740648285;
	bh=KCA7vGFgUuQ6upLklkqCE5dso0EBiAyQ0+h7Nfrm9ZA=;
	h=From:To:CC:Subject:Date;
	b=qhirS1rO4NBwn4fLqAR+jtMezepnp8TErgeDiH5TLSq6jcmlymYl2pP3aqabN5rc7
	 ZNsVnQ0BtUgpMdrEcDMlHIyShJs/nYVIT9pjksAltzkSLiwjp4j7rK9Lzoq8Hf6MHF
	 lTepNIkNIMaEdjEQ6jFJnDFjE2aMSPwtn1NTAO0M=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51R9Ojtd100312
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 27 Feb 2025 03:24:45 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 27
 Feb 2025 03:24:44 -0600
Received: from fllvsmtp7.itg.ti.com (10.64.40.31) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 27 Feb 2025 03:24:45 -0600
Received: from fllv0122.itg.ti.com (fllv0122.itg.ti.com [10.247.120.72])
	by fllvsmtp7.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51R9Oigi120722;
	Thu, 27 Feb 2025 03:24:44 -0600
Received: from localhost (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
	by fllv0122.itg.ti.com (8.14.7/8.14.7) with ESMTP id 51R9OhMj005119;
	Thu, 27 Feb 2025 03:24:44 -0600
From: Meghana Malladi <m-malladi@ti.com>
To: <vigneshr@ti.com>, <javier.carrasco.cruz@gmail.com>, <m-malladi@ti.com>,
        <jacob.e.keller@intel.com>, <diogo.ivo@siemens.com>,
        <horms@kernel.org>, <richardcochran@gmail.com>, <pabeni@redhat.com>,
        <kuba@kernel.org>, <edumazet@google.com>, <davem@davemloft.net>,
        <andrew+netdev@lunn.ch>
CC: <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        Roger Quadros
	<rogerq@kernel.org>, <danishanwar@ti.com>
Subject: [PATCH net] net: ti: icss-iep: Reject perout generation request
Date: Thu, 27 Feb 2025 14:54:41 +0530
Message-ID: <20250227092441.1848419-1-m-malladi@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_012456_030417_F508F5C3 
X-CRM114-Status: GOOD (  12.17  )
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

IEP driver supports both perout and pps signal generation
but perout feature is faulty with half-cooked support
due to some missing configuration. Remove perout
support from the driver and reject perout requests with
"not supported" error code.

Fixes: c1e0230eeaab2 ("net: ti: icss-iep: Add IEP driver")
Signed-off-by: Meghana Malladi <m-malladi@ti.com>
---

This patch is a bug fix to disable/remove a faulty feature, which will be
enabled separately as a feature addition to net-next, as suggested by
Jakub Kicinski and Jacob Keller:
https://lore.kernel.org/all/20250220172410.025b96d6@kernel.org/

 drivers/net/ethernet/ti/icssg/icss_iep.c | 21 +--------------------
 1 file changed, 1 insertion(+), 20 deletions(-)

diff --git a/drivers/net/ethernet/ti/icssg/icss_iep.c b/drivers/net/ethernet/ti/icssg/icss_iep.c
index 768578c0d958..d59c1744840a 100644
--- a/drivers/net/ethernet/ti/icssg/icss_iep.c
+++ b/drivers/net/ethernet/ti/icssg/icss_iep.c
@@ -474,26 +474,7 @@ static int icss_iep_perout_enable_hw(struct icss_iep *iep,
 static int icss_iep_perout_enable(struct icss_iep *iep,
 				  struct ptp_perout_request *req, int on)
 {
-	int ret = 0;
-
-	mutex_lock(&iep->ptp_clk_mutex);
-
-	if (iep->pps_enabled) {
-		ret = -EBUSY;
-		goto exit;
-	}
-
-	if (iep->perout_enabled == !!on)
-		goto exit;
-
-	ret = icss_iep_perout_enable_hw(iep, req, on);
-	if (!ret)
-		iep->perout_enabled = !!on;
-
-exit:
-	mutex_unlock(&iep->ptp_clk_mutex);
-
-	return ret;
+	return -EOPNOTSUPP;
 }
 
 static void icss_iep_cap_cmp_work(struct work_struct *work)

base-commit: 29b036be1b0bfcfc958380d5931325997fddf08a
-- 
2.43.0


