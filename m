Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9E25E7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 08:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+/NJI+xsMwC2ZaiGrYbKttbYCAhIk4oabrielzqyPHM=; b=XrwpB8VL643i65IOVEorcseL86
	oxdmMyul0vDl+ST7bUmsC17C56cNlYURJe4VmPPU55npUrB+L6dSEKwiW0/PQ+f9p+kH2lsi0JskU
	oasuY/vg79ExFsXWmc8rxUOTJ/h1ALTggrvvqMTJZid5DqhdznOypKIigZeljsR7TXJUAy/XWknVK
	5/RGXYYE4+DgvqQgj/dBzRb/qEjX5GMr0AyXI+iNshCuD0gNqRC6nUfYS1gCEsKrqHzu3Uz3WRSz8
	rxhBzpx29i9tywSet4g30ntxWqb3LHY7lUK9yo6DY/oy1Cy7wIL2QcauveBXODTQKOZMsLzkqdc9u
	PKzjffiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ7H9-0000000FBhN-3YSF;
	Thu, 05 Dec 2024 08:31:55 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ7EX-0000000FBBx-47gV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 08:29:15 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4B58T0dQ2175164
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 5 Dec 2024 02:29:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733387340;
	bh=+/NJI+xsMwC2ZaiGrYbKttbYCAhIk4oabrielzqyPHM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=QZS8SI7Lh8PBFOUTH/uObH6mP7nC5Nw0GOMTjmEUg+dc+vbzufwuIqe+X+2zEm/2P
	 xLX4RecvMADbX4n804y2sVIzbNm/xFqfU31E+Xtuewqa0vKuhD/z0oQR0jh15yk8z4
	 ffvqt5hy2+y0JTnFOP4e1vneEzYBW+4u94DCSpsI=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4B58T06c006590
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 5 Dec 2024 02:29:00 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 5
 Dec 2024 02:29:00 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 5 Dec 2024 02:29:00 -0600
Received: from fllv0122.itg.ti.com (fllv0122.itg.ti.com [10.247.120.72])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B58T0m4039999;
	Thu, 5 Dec 2024 02:29:00 -0600
Received: from localhost (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
	by fllv0122.itg.ti.com (8.14.7/8.14.7) with ESMTP id 4B58Sxl0021724;
	Thu, 5 Dec 2024 02:28:59 -0600
From: Meghana Malladi <m-malladi@ti.com>
To: <vigneshr@ti.com>, <jan.kiszka@siemens.com>,
        Roger Quadros
	<rogerq@kernel.org>, <m-malladi@ti.com>,
        <javier.carrasco.cruz@gmail.com>, <diogo.ivo@siemens.com>,
        <jacob.e.keller@intel.com>, <horms@kernel.org>, <pabeni@redhat.com>,
        <kuba@kernel.org>, <edumazet@google.com>, <davem@davemloft.net>,
        <andrew+netdev@lunn.ch>
CC: <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <danishanwar@ti.com>
Subject: [PATCH net v3 2/2] net: ti: icssg-prueth: Fix clearing of IEP_CMP_CFG registers during iep_init
Date: Thu, 5 Dec 2024 13:58:31 +0530
Message-ID: <20241205082831.777868-3-m-malladi@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241205082831.777868-1-m-malladi@ti.com>
References: <20241205082831.777868-1-m-malladi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_002914_107079_D3496811 
X-CRM114-Status: GOOD (  13.50  )
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
Reviewed-by: Roger Quadros <rogerq@kernel.org>
---

Hi all,

This patch is based on net-next tagged next-20241128
v2: https://lore.kernel.org/all/20241128122931.2494446-3-m-malladi@ti.com/

* Changes since v2 (v3-v2):
- Collected Reviewed-by tag from Roger Quadros <rogerq@kernel.org>

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


