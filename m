Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84B27D69105
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 12:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fQO2yb69MdDx8Mnlqh3Ip+U5xpP7Qntvpn0/D4YfxUM=; b=1zvDWHRiNz+v7xKQPtRSPXYigo
	6tL/75V/RiWPai9Jj6/IAnSktXHq9QVinAagag/Upck8nPAcKGbcy8EOVw/GUk60zPQgHMvetE7Wb
	TwUHs6NewIC+EQd0ojZP8u4KXu91h+b8xg5aG0AxEoFVch5MNIiNeX7Fw3AxVrOYP7O4mw89QN1+o
	+fUih9g7uVTSNtGa9UQjG5pRPQAm2T0mWlUb6GYsCHjq39R7wzLLM8giqFJCVQpjkOZmR6GHv+/vH
	qfnPvOmjaFUKjBLQUz9SxAYdnDc7LAH8+0zJENfuK0xshJaxOdf8IHRmG0oE8Ae1kFphGUa/VVeQ1
	AHs/3yOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGdhZ-0000000FUNo-2Gep;
	Thu, 28 Nov 2024 12:32:57 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGdf5-0000000FTtR-1thz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 12:30:24 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4ASCUA9F018871;
	Thu, 28 Nov 2024 06:30:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1732797010;
	bh=fQO2yb69MdDx8Mnlqh3Ip+U5xpP7Qntvpn0/D4YfxUM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=TGddTWQL+c3Gf2QJ418N2E1lhbrJCGUncLCK5YLJTZFSm9LvHYFMsFwSmpiT0y3Bl
	 XQw8DIe+MqYD++IAbLyJio6ZD+nTpKgEfOZi3mTfOi4UVuzavhKkvL6ljo5m29BdRG
	 YS0Rk5F6ivMnhaWS/vmcmedeJzBNJHCyEHFhm1JE=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4ASCUAqj088962
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 28 Nov 2024 06:30:10 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 28
 Nov 2024 06:30:10 -0600
Received: from fllvsmtp7.itg.ti.com (10.64.40.31) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 28 Nov 2024 06:30:09 -0600
Received: from fllv0122.itg.ti.com (fllv0122.itg.ti.com [10.247.120.72])
	by fllvsmtp7.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4ASCUAZg105730;
	Thu, 28 Nov 2024 06:30:10 -0600
Received: from localhost (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
	by fllv0122.itg.ti.com (8.14.7/8.14.7) with ESMTP id 4ASCU9cI015658;
	Thu, 28 Nov 2024 06:30:09 -0600
From: Meghana Malladi <m-malladi@ti.com>
To: <lokeshvutla@ti.com>, <vigneshr@ti.com>, <m-malladi@ti.com>,
        <javier.carrasco.cruz@gmail.com>, <diogo.ivo@siemens.com>,
        <jacob.e.keller@intel.com>, <horms@kernel.org>, <pabeni@redhat.com>,
        <kuba@kernel.org>, <edumazet@google.com>, <davem@davemloft.net>,
        <andrew+netdev@lunn.ch>
CC: <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        Roger Quadros
	<rogerq@kernel.org>, <danishanwar@ti.com>
Subject: [PATCH net v2 2/2] net: ti: icssg-prueth: Fix clearing of IEP_CMP_CFG registers during iep_init
Date: Thu, 28 Nov 2024 17:59:31 +0530
Message-ID: <20241128122931.2494446-3-m-malladi@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241128122931.2494446-1-m-malladi@ti.com>
References: <20241128122931.2494446-1-m-malladi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_043023_579562_9A67FA8E 
X-CRM114-Status: GOOD (  13.84  )
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
cleared during interface bring down) and driver will just return true
even though there is no signal. Fix this by disabling pps and perout.

Fixes: c1e0230eeaab ("net: ti: icss-iep: Add IEP driver")
Signed-off-by: Meghana Malladi <m-malladi@ti.com>
---

Hi all,

This patch is based on net-next tagged next-2024110.
v1:https://lore.kernel.org/all/20241106074040.3361730-3-m-malladi@ti.com/

Changes since v1 (v2-v1):
- Move clear CMP_CFG inside clear CMP_STAT loop as suggested by
Roger Quadros <rogerq@kernel.org>
- Disable pps/perout instead of setting to false as suggested by
Roger Quadros <rogerq@kernel.org>

 drivers/net/ethernet/ti/icssg/icss_iep.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/ethernet/ti/icssg/icss_iep.c b/drivers/net/ethernet/ti/icssg/icss_iep.c
index 5d6d1cf78e93..a96861debbe3 100644
--- a/drivers/net/ethernet/ti/icssg/icss_iep.c
+++ b/drivers/net/ethernet/ti/icssg/icss_iep.c
@@ -215,6 +215,10 @@ static void icss_iep_enable_shadow_mode(struct icss_iep *iep)
 	for (cmp = IEP_MIN_CMP; cmp < IEP_MAX_CMP; cmp++) {
 		regmap_update_bits(iep->map, ICSS_IEP_CMP_STAT_REG,
 				   IEP_CMP_STATUS(cmp), IEP_CMP_STATUS(cmp));
+
+		regmap_update_bits(iep->map, ICSS_IEP_CMP_CFG_REG,
+				   IEP_CMP_CFG_CMP_EN(cmp), 0);
+
 	}
 
 	/* enable reset counter on CMP0 event */
@@ -780,6 +784,11 @@ int icss_iep_exit(struct icss_iep *iep)
 	}
 	icss_iep_disable(iep);
 
+	if (iep->pps_enabled)
+		icss_iep_pps_enable(iep, false);
+	else if (iep->perout_enabled)
+		icss_iep_perout_enable(iep, NULL, false);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(icss_iep_exit);
-- 
2.25.1


