Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED11C2A06C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Jan 2026 11:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=knnn3sMPdpxZU0O9l/+K6qvXz5/xdjHIm9g6Ivjsyng=; b=EnduM9r/HHdp9I9ax+6+H9jNlV
	Zs8FNtYnvFGe0b+eojdJv0zm/NULNlCgcCJR2U/zge3brIi56y0U/ej1EXZ6cCdQBNMmLnccHxcPK
	665JaVwXds4OzjL6jVHACmm2HNu3MLpv0zZn1jZWq8JxJWPwvZjk1wN/8jNmO67EtrxEEXQVpAItl
	Kbh0nksR7TkZDXZngJFnqRmKM7v3KT4B102ldPRIivYNaedvvNEwWEiDuHQjEVMffFo3ZVHmqiz4D
	QcyRwUEV7CQfcGXeNAz9/zJ5SJNA6oVZlXHnXrj6NwU+J2CUackcf4KmH0+qD+qM05pkNZ9mHSzPV
	WNMYw0TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcMWT-0000000ACBp-2zED;
	Sun, 04 Jan 2026 11:43:49 +0000
Received: from mail-centralusazon11011027.outbound.protection.outlook.com ([52.101.62.27] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcMWQ-0000000ACAV-2nIs;
	Sun, 04 Jan 2026 11:43:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qZoIPFGwP4UnSS3p+NmNrpialptmBBeBXAiyb19V4Q8GVEMmgyBzOwj6o/8MqQcUsDSDIpq84rz4LSr+OjfXdwLE8JQMiLBZ6g6ThPEX5TzmzXhtIEPDEhfme18Wo/rqSW+2UXKRc6wvIo03I3uhoqrT9emDv7+6PC4OBi4hjR+vXUdfDS4DQe4so+ACgmADhT7D6tZTS1JjaBReSAnkE6f0YNgnOBufzBQ53UfePrP41pYfju2l11z5cd7GiXlGuDr9SdKGNhGWwzGNjHTGlIVVNChGalDTp1lw3cDERU24B8nWngRQUBLpXCCbFfyUB1Yem1O3/JMggo9lk/r9DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=knnn3sMPdpxZU0O9l/+K6qvXz5/xdjHIm9g6Ivjsyng=;
 b=XFEKIatNkvdgGZt9pFm5b5kiHL8hJuahmYi4RdFUNYyGlYydlHCCH9qdhBGCK27vucVk9+SmTqgADdHVWDu3CfHwJETwcXLvGVxtSjl3cDdA2lEFfwtNVCeqyd2CpP97XDzRi/OdXk88S5tgaqk24OUAESOgK1KzBOZmz0wGLUQOKTD9lkUwAe540N6U5pNy7fHtPKNnL53vAXFGpyvBZ+358/MiYdbaXccBqmG9fF6sCJc6TTU7djhLqWBxB0/6/Ggm8yHSBFu8GX8Mfc8m/jipKUeNBzVG6Mv30kC+CCt61Q06yaO/1DG48qJiDBeIFjRhR1dhE0Nddsp8NzHULg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=knnn3sMPdpxZU0O9l/+K6qvXz5/xdjHIm9g6Ivjsyng=;
 b=o+pZBOOcQzWEIeWryxibSUM/D73LmIF173M/us3Lf3VWUjrh+zm12H6F2NLhlkDvlIMGCMgOMRU5petEXgowX1uB62Ln8JoB5BAGZf1fsYLxkLCxkyrWmYpKIGIPT8fdXOjpdoagOpNPugbPT8I1RMfWOyfwLqUeLd7c8r39+EQ=
Received: from DM6PR12CA0001.namprd12.prod.outlook.com (2603:10b6:5:1c0::14)
 by SJ0PR10MB4670.namprd10.prod.outlook.com (2603:10b6:a03:2dc::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Sun, 4 Jan
 2026 11:43:42 +0000
Received: from DS1PEPF0001709B.namprd05.prod.outlook.com
 (2603:10b6:5:1c0:cafe::16) by DM6PR12CA0001.outlook.office365.com
 (2603:10b6:5:1c0::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Sun, 4
 Jan 2026 11:43:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS1PEPF0001709B.mail.protection.outlook.com (10.167.18.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Sun, 4 Jan 2026 11:43:40 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 4 Jan
 2026 05:43:37 -0600
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 4 Jan
 2026 05:43:37 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Sun, 4 Jan 2026 05:43:37 -0600
Received: from toolbox.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.73.74])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 604BhTlC3538389;
	Sun, 4 Jan 2026 05:43:33 -0600
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <vkoul@kernel.org>, <neil.armstrong@linaro.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <sjakhade@cadence.com>,
	<rogerq@kernel.org>
CC: <krzk@kernel.org>, <linux-phy@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <srk@ti.com>, <s-vadapalli@ti.com>
Subject: [PATCH v2 1/2] dt-bindings: phy: Add PHY_TYPE_XAUI definition
Date: Sun, 4 Jan 2026 17:14:17 +0530
Message-ID: <20260104114422.2868321-2-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260104114422.2868321-1-s-vadapalli@ti.com>
References: <20260104114422.2868321-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709B:EE_|SJ0PR10MB4670:EE_
X-MS-Office365-Filtering-Correlation-Id: 7af9cb8c-534c-43d6-160c-08de4b8681e1
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|7416014|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qjCIcCDJSc3zkxXnBrDCI+S37f7Zuop2q/bnsBhwioejNKwyox172Z0Rk9r4?=
 =?us-ascii?Q?2NycCPui6kLvJ4qKbP6kvn03vjdhXar/45oeZ2XMfA+NSQVO696twnlB+PE5?=
 =?us-ascii?Q?wLJ/oH+V3buB/ewHC+bzUr0DErsMGVCyuBjiT60FrkQaakXRm3edMVfdV6lM?=
 =?us-ascii?Q?KaYEG0vng2qsViZRX1nODjflpKtSm3G8xH0o1ETGMxKQ+W9huRGFkFK6Kt9J?=
 =?us-ascii?Q?WpbrczvVnCrduRUoODpF3jvH5LrZJVycnR7p+NuNgOD2iepAJiA8DfI+pKgM?=
 =?us-ascii?Q?YvGsOOBSbmbhfXeqi7o/7lT7qWqG++I3UKsc60bs5pFTnIJeU0Hqde38ZdA3?=
 =?us-ascii?Q?ni5JDtpaoZ5hbKm422uXbwdq7Nw1cXSxvr3GipKguur9AHGP7XdjCQslExT5?=
 =?us-ascii?Q?2RYOYJJFa3U8Q5YMFahFPn0+fNs20iwLnDsT9Jnc2Tpd/QVSIi4VWgwbED9A?=
 =?us-ascii?Q?25pFoR6srA3NkvlM4b9higTX+1opiIFNht8ZcXQQXxU8a7fTdzz3MPOUUS9I?=
 =?us-ascii?Q?nRRz1AX40/TNPQ7doQ4bnIbIvUaxr09sBxre5ppjcHClzgXFszX2QddIsrQ8?=
 =?us-ascii?Q?qIjRHRq/Wu+ID7JJ3acFTuZAp2ykIDZ8iHERv3mYka1z5yxTV7TAtBgTlZTO?=
 =?us-ascii?Q?fvklLBWdQPcTUTV5lhBFqxHQfv2ACvZbI/8it8WbmF7QOAy0IKjMmvKZYyzv?=
 =?us-ascii?Q?kb1WxANYokQwKfwFXFUDYcc+azIELHY9R5RjgGqMViyJoBwNQFqqOO/ULqgj?=
 =?us-ascii?Q?+mb3yNNZFnT/NcRJC1DCcgNEeUyXLpVbulCM5POkETWK5pxueyYEN/JGfCK3?=
 =?us-ascii?Q?2XlLuCAdUL5xPXWitVWv8CD8Zv7OImxBtTvz9iCknF9JRjpAaXbpa8CcEi8v?=
 =?us-ascii?Q?vWwSfBAi+q3+wMCannheR5oWJNjLEr86gRef0jwd3hL7TTFaTZIO6rIIIx1Y?=
 =?us-ascii?Q?qwFtSptjgtqnBf+hKmvLlXA0UnWH/1dTPosm8hLb+EOIgm/6v8nURtBUpAhZ?=
 =?us-ascii?Q?DMfa3LKRIP8x41jecuMv23lurrF4y2liGkoL0gjhsCNobRbD+1LCTWqrbGLW?=
 =?us-ascii?Q?1L4kIOqZgIrOppeRTrPJHNnL+l1sAml8yJpGErFq15MVrPSdUDM+D5xC418S?=
 =?us-ascii?Q?yjbTF6w/0p2RUGfnldsnKcTQOGoq6QCnuSa8XSiwlzJyY5jsMk9ffh7EWdDl?=
 =?us-ascii?Q?XJB8foHbk2RRBaDQe1uhZMy6R8MA9tJ0I2yM2Sq0OOZ4RGzXNhgvPrlVTpTx?=
 =?us-ascii?Q?JpyC+j2KRKuEb/L2ipfHeqhQ5ISalVTzSxO7fekM5u+jm7pCIL6qmO+bJRrQ?=
 =?us-ascii?Q?ShCfO6Uo7iKDuicvddbDOBv+n09AlO9vZD/b94uiOCGa7JX0Rw0plaHq38QB?=
 =?us-ascii?Q?e/TOLieaCxsXr50s4imtZI830b+5rSb+QQNk6eVCgeoFKOr3q1tznW2yclgO?=
 =?us-ascii?Q?OrA41x/S+1cSWZUB3BqLWyHs7ZHYw0JDcaUZbF8G0s04bxnb4e4YiWsX5kG3?=
 =?us-ascii?Q?HvYvb+3bhAb5a+YOCJgb74tsdTAM36RmcH8YdXpe6cbrYjYw5nxv2BbPDoXZ?=
 =?us-ascii?Q?C5Op+kbQIEVpXO9PiQvl/wK15vECd8+fX5nfClcb?=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2026 11:43:40.9136
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7af9cb8c-534c-43d6-160c-08de4b8681e1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001709B.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4670
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_034346_711074_13C57CDB 
X-CRM114-Status: GOOD (  11.18  )
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

From: Swapnil Jakhade <sjakhade@cadence.com>

XAUI (eXtended Attachment Unit Interface) is a high-speed serial interface
standard for 10 Gigabit Ethernet (10GbE). It uses four lanes with each
lane operating at 3.125 Gbps (totaling 10 Gbps), to extend the XGMII
interface across circuit boards, commonly used in backplanes for
networking switches and high-performance computing. XAUI is defined as a
standardized instantiation of XGMII Extender in the IEEE 802.3
specification.

Add definition for XAUI PHY type.

Signed-off-by: Swapnil Jakhade <sjakhade@cadence.com>
[s-vadapalli: added detailed description of XAUI in the commit message]
Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---

v1 of this patch is at:
https://lore.kernel.org/r/20251224054905.763399-2-s-vadapalli@ti.com/
Changes since v1:
- The commit message has been updated to provide a detailed description of
  XAUI based on feedback from Krzysztof at:
  https://lore.kernel.org/r/20251227-airborne-energetic-kingfisher-adc4fb@quoll/

Regards,
Siddharth.

 include/dt-bindings/phy/phy.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/phy/phy.h b/include/dt-bindings/phy/phy.h
index 6b901b342348..d77b372d302f 100644
--- a/include/dt-bindings/phy/phy.h
+++ b/include/dt-bindings/phy/phy.h
@@ -23,5 +23,6 @@
 #define PHY_TYPE_DPHY		10
 #define PHY_TYPE_CPHY		11
 #define PHY_TYPE_USXGMII	12
+#define PHY_TYPE_XAUI		13
 
 #endif /* _DT_BINDINGS_PHY */
-- 
2.51.1


