Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E9EDCCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 10:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8bUUxFGIs8uuVZAitKT4J5uhn4wA0ikddhh/eu32QKk=; b=Xi/2PgmEDAtFmWnHoSkQMgV74q
	zUE8LA3wQwXJyxIvmkFHVZcMqa8SI1NIqpRNN/29MUFE5gOPdQavbsbduqrLFn3XCSsfR6Vi/6WCI
	mpnUMcZtxa0Ieyu0GFFi9aK5UaxCgv2Ztc81/CYMiMp7UCPJHNDBOGKgKlcLe5lopDViTxGS0WveC
	dZXi1FzTUFI7eQqkr+OM2VzboqEiJJ4bGIG7ejD8iZWSk7nwK/PrtO7qT2TyFl2VMMBAMO0I1amT3
	NmchcHV8CfDF92LZt4z8i3uyGcVszTyAR69b+FVOf8fDoxh+Qw2oX/hIfrmD2hWsgxT4+04zvJ6SR
	Gy0Oq4xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGEWg-0000000Bdb1-0ngS;
	Tue, 04 Nov 2025 10:44:34 +0000
Received: from mail-southcentralusazon11012048.outbound.protection.outlook.com ([40.93.195.48] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGEWc-0000000BdaW-3CTu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 10:44:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GWu6Fwt+iwEvow6tdyegzOxN4YDOagJW62eXNbOU3ZslaYX/cVOV3nOwbydF6Q8CFZd/UUYzcM7gvZmsh62htMjKAbEpSaNILHk0YunfX/9xUCIZ4wCI8U6Ep7quRp9U4JVSEX+nPWvxhj8oENSSiE7kkQPjxzAfY9UOcS8DM58JQqA1vJmkiz7JEDFbhaUokJ7hpsDBiY8PA66Q9szGM2YbYzvQsSeV8t33efIG8SAc7xeq+rIVjxd0evbwzMLFPSkZ0mnMKzLJDvs07T80JJZNulBMNSkPcDG3udowC3ZkXvPfVLLK+UMivhHCZiYUC8m7HF/ZYtEVjPoU1OPn5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8bUUxFGIs8uuVZAitKT4J5uhn4wA0ikddhh/eu32QKk=;
 b=ZVXbPSg3wM/tbMO+HXbuFH8mSyQ+ST/PZ+V6MhfC+3PZ4Onp4Foa+2+K7D8WRKvNPb3oVTlYk6txnLvrvfuT3z3CAZFYHrr3CN6yVSuhscRE2FaSwKN5Eh93BzF349zjBgqiSIdna/ync6nQZMGKiSU2n09cDIoRQBa1l8ztSiFiePZvLpOy+0dXpdKrJkP3zAIp/GSk+rQWXbikG8v5nVLlaGrgvez+7QMCBhem/eanXDkPnYPEO9GJ8WZMlneZFzmPPBRqtq0OOWoAo8FFEY5Q8hM0w7/z9KJCKCg5GKxgPnXwTwZ0ZU8jFb82Zj6asOFogy+f5om5GpkZyARERQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8bUUxFGIs8uuVZAitKT4J5uhn4wA0ikddhh/eu32QKk=;
 b=Gx+5l7B/Grk6TBHO1ZR2WlWUouIEGDcdfmRzPT36zcqSu7IVxztB+N1r+5VyItKaRuseI6Bq9TE0O6+GbjplspFoX7aHvFGjyZqGPECOiZeK2Al2Lrwu4/VIcnX4XpLsLXT4MPI+0awHUjDbgx2iX0NFBQdHEye8twl6WrOT+MM=
Received: from BL6PEPF00013DFD.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1001:0:1d) by DS4PPF80E5E852F.namprd10.prod.outlook.com
 (2603:10b6:f:fc00::d2e) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 10:44:23 +0000
Received: from BL02EPF0001A0FB.namprd03.prod.outlook.com
 (2a01:111:f403:f900::2) by BL6PEPF00013DFD.outlook.office365.com
 (2603:1036:903:4::4) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.7 via Frontend Transport; Tue, 4
 Nov 2025 10:44:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL02EPF0001A0FB.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Tue, 4 Nov 2025 10:44:23 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 4 Nov
 2025 04:44:21 -0600
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 4 Nov
 2025 04:44:19 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 4 Nov 2025 04:44:19 -0600
Received: from lelv0854.itg.ti.com (lelv0854.itg.ti.com [10.181.64.140])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A4AiJsF1780132;
	Tue, 4 Nov 2025 04:44:19 -0600
Received: from localhost (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
	by lelv0854.itg.ti.com (8.14.7/8.14.7) with ESMTP id 5A4AiIYX019091;
	Tue, 4 Nov 2025 04:44:18 -0600
From: Meghana Malladi <m-malladi@ti.com>
To: <h-mittal1@ti.com>, <horms@kernel.org>, <m-malladi@ti.com>,
	<pabeni@redhat.com>, <kuba@kernel.org>, <edumazet@google.com>,
	<davem@davemloft.net>, <andrew+netdev@lunn.ch>
CC: <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <srk@ti.com>, Vignesh Raghavendra
	<vigneshr@ti.com>, Roger Quadros <rogerq@kernel.org>, <danishanwar@ti.com>
Subject: [PATCH net v2] net: ti: icssg-prueth: Fix fdb hash size configuration
Date: Tue, 4 Nov 2025 16:14:15 +0530
Message-ID: <20251104104415.3110537-1-m-malladi@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FB:EE_|DS4PPF80E5E852F:EE_
X-MS-Office365-Filtering-Correlation-Id: e8833d2d-6ce2-484b-20a0-08de1b8f1e4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|34020700016|36860700013|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BvNYVlJGe28XnV9LvQTfL14dnt42aZElLX6oMOWBaCpG70PA9WSxGqg8e5vy?=
 =?us-ascii?Q?h0J7ukq6V3+OBpwO6wPyiYR+W9PFrBIIb9V3d63l2hQH/c5MtQUka5st6Klg?=
 =?us-ascii?Q?dRPgs+J0AEn3T81nSZapdC5ZEAgdFlGigPmnPln4hpn4hXDQ9VTI34SZZb+g?=
 =?us-ascii?Q?wNrXS+AywTMmBYh8zuJj/4LVHrXJq/tKIK5jedQAyvQUhpBCHfKf5T67eoJP?=
 =?us-ascii?Q?l+3fBfcNZdqBCFBhb71BUs9NgDtglEFdxlnPtGAOJFeMHKk7FpsuwairtCpg?=
 =?us-ascii?Q?y9ad1RyNfphdQdriv8dzgytDNCUMfxbnt2gq42Jr2HfLsiaiWOZch96BwhTc?=
 =?us-ascii?Q?oK2F8MApgm7iHyQecn+D88rQwztOgW6KjaTedjEiB0/ObJaNGlmk6aqYKajZ?=
 =?us-ascii?Q?4Jj+9RADjFx2jGh8g7Axe2pyDGYbcawpOqO6SWisuuOiXCUj/0V51QkvhxNo?=
 =?us-ascii?Q?1xdJFdGxlny3SfJ4v3iSWz7PBhuskDRR/IICNcS4JKHtJDY0wvdcIiYDKMIv?=
 =?us-ascii?Q?/5hRZ1EJmt0bSTf3V05Jh1sGs/IXfOdh7SdX3HhBlPLzhkYYD7LWCq8/Opcj?=
 =?us-ascii?Q?ZTauLNelZfd8F4eeM+TPGyqDL2MaPEatDxG5RoTfZwv3S3iT2tUziW8FUzLO?=
 =?us-ascii?Q?+VyqtKePBrrPmhY0AxC1TOgzD6o7QkBdYJSY0WpbiMjDUvPfnd7EpP73ACbk?=
 =?us-ascii?Q?SwUs4rUepZHizRdDMXekFWXup7yDddUtBHLTWmOrAlNFcOrfPXyYLcWnXeF3?=
 =?us-ascii?Q?MEkpA/8WA3BSYp9wrhI3fIvZ/G62e9F5Lla8kpZCJB+ZGaQp+lgN7qStGFtu?=
 =?us-ascii?Q?FTeXrWyXCdgMRHPyx+r2hf8GqXHZ6QsSZJmU/wKAircXVuJO1D08Vn3k1eZg?=
 =?us-ascii?Q?b5313rGIB6xzYPGh0dV5UbD0gzFByO2LBzYlDKe8KVve34Dlb+l2zMFFQLJb?=
 =?us-ascii?Q?v9jBE7nmkU08j8uh0VK322zcdb3b8G1ixVOanAvvLbW9gd8k/USx9qLqZTjq?=
 =?us-ascii?Q?ZRsF2Ec2CDhUwQvZw93k8j0T8x5emm3t2FDe7wbJIkm5CqTaDE5+E1tBmAM4?=
 =?us-ascii?Q?4MVM15efW/39TBgSPPgGVkEmyRlSrHtm0OfiDwHEO+uKavLw82GjnnbpkrsS?=
 =?us-ascii?Q?dMxBGJcjw0Cd/TUThoeVLCsDEmOtMnDmK/pVeu3eO6Z15vVFN5ZQVvsgxFwZ?=
 =?us-ascii?Q?litKs6OvdKaStlEhF0xJkc22kp6+3kE/oX2xputsnq514+Ly227LdFwDxyzK?=
 =?us-ascii?Q?wxexSG/arzRiGNUBupt5aaIeMQ3KrPxjV0X7l8XuzpqqODHpb3d2N0QfZTIj?=
 =?us-ascii?Q?GyY74Lojzt57i2ODuz3aBe3RlCABLHEARY28cDP6yG/QMVAO2hr5uWw5vjx4?=
 =?us-ascii?Q?5IXHH0oUVUWh1l5Erp97sFRaiUghPDGWMh4u2U69/Op8/oGICV99vJAjK97o?=
 =?us-ascii?Q?QxAaJf+wBAsqygZZHyusMjDoF9r8pxb+EoE2jQ9WPWlAa5apsOc4zw4H04Dt?=
 =?us-ascii?Q?mmmVKMFG7e97WYKUwsik+p17ZA+eXvfbqcWdDWxiEXbZzTaK7r8lTyL+Sodg?=
 =?us-ascii?Q?UdEt0ikdzVN7L8zrlfY=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(34020700016)(36860700013)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 10:44:23.4596
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8833d2d-6ce2-484b-20a0-08de1b8f1e4c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0FB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF80E5E852F
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_024430_913526_D9EF13FE 
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

The ICSSG driver does the initial FDB configuration which
includes setting the control registers. Other run time
management like learning is managed by the PRU's. The default
FDB hash size used by the firmware is 512 slots, which is
currently missing in the current driver. Update the driver
FDB config to include FDB hash size as well.

Please refer trm [1] 6.4.14.12.17 section on how the FDB config
register gets configured. From the table 6-1404, there is a reset
field for FDB_HAS_SIZE which is 4, meaning 1024 slots. Currently
the driver is not updating this reset value from 4(1024 slots) to
3(512 slots). This patch fixes this by updating the reset value
to 512 slots.

[1]: https://www.ti.com/lit/pdf/spruim2
Fixes: abd5576b9c57f ("net: ti: icssg-prueth: Add support for ICSSG switch firmware")
Signed-off-by: Meghana Malladi <m-malladi@ti.com>
---

v2-v1:
- Update the commit message and give more context w.r.t hardware
  for the fix as suggested by Simon Horman <horms@kernel.org>

v1: https://lore.kernel.org/all/20251013085925.1391999-1-m-malladi@ti.com/

 drivers/net/ethernet/ti/icssg/icssg_config.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/ethernet/ti/icssg/icssg_config.c b/drivers/net/ethernet/ti/icssg/icssg_config.c
index da53eb04b0a4..3f8237c17d09 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_config.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_config.c
@@ -66,6 +66,9 @@
 #define FDB_GEN_CFG1		0x60
 #define SMEM_VLAN_OFFSET	8
 #define SMEM_VLAN_OFFSET_MASK	GENMASK(25, 8)
+#define FDB_HASH_SIZE_MASK	GENMASK(6, 3)
+#define FDB_HASH_SIZE_SHIFT	3
+#define FDB_HASH_SIZE		3
 
 #define FDB_GEN_CFG2		0x64
 #define FDB_VLAN_EN		BIT(6)
@@ -463,6 +466,8 @@ void icssg_init_emac_mode(struct prueth *prueth)
 	/* Set VLAN TABLE address base */
 	regmap_update_bits(prueth->miig_rt, FDB_GEN_CFG1, SMEM_VLAN_OFFSET_MASK,
 			   addr <<  SMEM_VLAN_OFFSET);
+	regmap_update_bits(prueth->miig_rt, FDB_GEN_CFG1, FDB_HASH_SIZE_MASK,
+			   FDB_HASH_SIZE << FDB_HASH_SIZE_SHIFT);
 	/* Set enable VLAN aware mode, and FDBs for all PRUs */
 	regmap_write(prueth->miig_rt, FDB_GEN_CFG2, (FDB_PRU0_EN | FDB_PRU1_EN | FDB_HOST_EN));
 	prueth->vlan_tbl = (struct prueth_vlan_tbl __force *)(prueth->shram.va +
@@ -484,6 +489,8 @@ void icssg_init_fw_offload_mode(struct prueth *prueth)
 	/* Set VLAN TABLE address base */
 	regmap_update_bits(prueth->miig_rt, FDB_GEN_CFG1, SMEM_VLAN_OFFSET_MASK,
 			   addr <<  SMEM_VLAN_OFFSET);
+	regmap_update_bits(prueth->miig_rt, FDB_GEN_CFG1, FDB_HASH_SIZE_MASK,
+			   FDB_HASH_SIZE << FDB_HASH_SIZE_SHIFT);
 	/* Set enable VLAN aware mode, and FDBs for all PRUs */
 	regmap_write(prueth->miig_rt, FDB_GEN_CFG2, FDB_EN_ALL);
 	prueth->vlan_tbl = (struct prueth_vlan_tbl __force *)(prueth->shram.va +

base-commit: e120f46768d98151ece8756ebd688b0e43dc8b29
-- 
2.43.0


