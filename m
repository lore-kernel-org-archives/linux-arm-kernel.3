Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72F6DD29FB0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 07:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SEQBMpZUNFN1GW+nwD1YAozhMyyk0AV9Osd490Zj6Zo=; b=tjMa2y+2MMfp62qxuJ3S+pG5/S
	NY4kPKCyxq1mlEt0zmsCFvs6SUqz9mXT+4QaHTZPXbc32+JG0VrUgPagh1M+7UXRDX7DoiOzF9XB9
	GQJHPoywURsGJgA9Otnl393ops3KaAGtXBlUbbGIy4ZxB3FlENjmaQQDN0d07KPBGcp2ukgOur1Mm
	y3UHDsCohtnZc7Y64o/Zuf95tt/IQZpmCjl/N1GAig0tnRS3KrBB0KyyG1BjoJkNhNBo9hFZc7j9e
	IQpxKtwlC5Jt4RJBXEFingvw9EyrPNYvayUk9iK28DF42GqRRqxLLjrwdbXt6tL/ZneAJnfX8hkHf
	b4EjV59w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8alp-00000002ATr-0haD;
	Wed, 06 Nov 2024 07:48:05 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8afV-000000029D2-2NrU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 07:41:34 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4A67fRg1018043;
	Wed, 6 Nov 2024 01:41:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730878887;
	bh=SEQBMpZUNFN1GW+nwD1YAozhMyyk0AV9Osd490Zj6Zo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=hwqcRC9HUMJLbqtyzj+WAftG0w9BGPaCK7I47LdY83xYPXtqOGsh+JStMX5UvsWmQ
	 CEhU93NQiS1/gcyuxlcNIF86NeuKT0JCibukP5fjM5nAFOpxl64iOBpPk2gy7wOLQZ
	 FCj8cT0RXdJUN8Puv4zip7PF9yQZF9QLlD8iZd04=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A67fRRb111576;
	Wed, 6 Nov 2024 01:41:27 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 6
 Nov 2024 01:41:26 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 6 Nov 2024 01:41:26 -0600
Received: from lelv0854.itg.ti.com (lelv0854.itg.ti.com [10.181.64.140])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A67fQht024993;
	Wed, 6 Nov 2024 01:41:26 -0600
Received: from localhost (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
	by lelv0854.itg.ti.com (8.14.7/8.14.7) with ESMTP id 4A67fPV2014472;
	Wed, 6 Nov 2024 01:41:26 -0600
From: Meghana Malladi <m-malladi@ti.com>
To: <vigneshr@ti.com>, <m-karicheri2@ti.com>, <m-malladi@ti.com>,
        <jan.kiszka@siemens.com>, <javier.carrasco.cruz@gmail.com>,
        <jacob.e.keller@intel.com>, <horms@kernel.org>,
        <diogo.ivo@siemens.com>, <pabeni@redhat.com>, <kuba@kernel.org>,
        <edumazet@google.com>, <davem@davemloft.net>, <andrew+netdev@lunn.ch>
CC: <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        Roger Quadros
	<rogerq@kernel.org>, <danishanwar@ti.com>
Subject: [PATCH net 2/2] net: ti: icssg-prueth: Fix clearing of IEP_CMP_CFG registers during iep_init
Date: Wed, 6 Nov 2024 13:10:40 +0530
Message-ID: <20241106074040.3361730-3-m-malladi@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241106074040.3361730-1-m-malladi@ti.com>
References: <20241106074040.3361730-1-m-malladi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_234133_722529_B90C84FC 
X-CRM114-Status: GOOD (  13.19  )
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

When ICSSG interfaces are brought down and brought up again, the
pru cores are shut down and booted again, flushing out all the memories
and start again in a clean state. Hence it is expected that the
IEP_CMP_CFG register needs to be flushed during iep_init() to ensure
that the existing residual configuration doesn't cause any unusual
behavior. If the register is not cleared, existing IEP_CMP_CFG set for
CMP1 will result in SYNC0_OUT signal based on the SYNC_OUT register values.

After bringing the interface up, calling PPS enable doesn't work as
the driver believes PPS is already enabled, (iep->pps_enabled is not
cleared during interface bring down) and driver  will just return true
even though there is no signal. Fix this by setting the iep->pps_enable
and iep->perout_enable flags to false during the link down.

Fixes: c1e0230eeaab ("net: ti: icss-iep: Add IEP driver")
Signed-off-by: Meghana Malladi <m-malladi@ti.com>
---
 drivers/net/ethernet/ti/icssg/icss_iep.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/net/ethernet/ti/icssg/icss_iep.c b/drivers/net/ethernet/ti/icssg/icss_iep.c
index 5d6d1cf78e93..03abc25ced12 100644
--- a/drivers/net/ethernet/ti/icssg/icss_iep.c
+++ b/drivers/net/ethernet/ti/icssg/icss_iep.c
@@ -195,6 +195,12 @@ static void icss_iep_enable_shadow_mode(struct icss_iep *iep)
 
 	icss_iep_disable(iep);
 
+	/* clear compare config */
+	for (cmp = IEP_MIN_CMP; cmp < IEP_MAX_CMP; cmp++) {
+		regmap_update_bits(iep->map, ICSS_IEP_CMP_CFG_REG,
+				   IEP_CMP_CFG_CMP_EN(cmp), 0);
+	}
+
 	/* disable shadow mode */
 	regmap_update_bits(iep->map, ICSS_IEP_CMP_CFG_REG,
 			   IEP_CMP_CFG_SHADOW_EN, 0);
@@ -778,6 +784,10 @@ int icss_iep_exit(struct icss_iep *iep)
 		ptp_clock_unregister(iep->ptp_clock);
 		iep->ptp_clock = NULL;
 	}
+
+	iep->pps_enabled = false;
+	iep->perout_enabled = false;
+
 	icss_iep_disable(iep);
 
 	return 0;
-- 
2.25.1


