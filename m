Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1519C56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 12:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HtDrko0b9u2qZYKEW+zp+qQUu01jh71H+e8wcxP9L40=; b=xcJPWLqZxiWzQMPBJggntIbDgV
	MXDvld0/gs99fB/7nHTuOtkAjkkBdppXQepUxJL+TBLFECzkQadYEczZNMFBDwZ5e5N/DB6wz7gwI
	fTgVeEAakDq1etpabkldbZ50QEQhN3/GAovOXdprpjxsB/mgyhjsoUfxiS0sGbkfpIR8JGD0tp7DR
	4+pDGLSl9ThB+xDVUPJnxUw3dYvLC1g1z/L3vHarNlWI7K3JuIw1vrRbpq9T11YPEwxClqcXEpXQo
	+c85WapDrMtUztH71IJilRq2RRoTXMWYz5v6o7shSW6BT4z/LG37b0M8MVnPgX5YzG7jyCUejltw9
	z8ssxxgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrxFV-00000005mzp-2iEs;
	Thu, 06 Aug 2026 12:31:01 +0000
Received: from mail-southcentralusazlp170130001.outbound.protection.outlook.com ([2a01:111:f403:c10c::1] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrxFU-00000005myB-075a
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 12:31:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ixMHr2euEPJDj4BLNtKr4JJJNRIknhLs8B4HNrjg1f8pkc6eZx/DVBcXwLz2toBzKJbADhx89DiyReOJQNbEzbDmRyMOAGKkgb6hkqdt8KG7BlMb8/gL0AsKP7YfWCERylVVpqxfrTEdWAgCheq6AbxnEhEtK3IAzSxZw9+x+md1vAiKchqlcaUWQFWJjKdmg3RxQAuLQZ8tpo5mn+j9O8On16vqOYsDMxouqjDQ0IndQjiyyspRHi2VxeFCrPqBrou1m/7umuHqbr7ilwG2JmB7qcNX6vumkgd9GwEyuz+duWZa5SMTP+Px25XrBbp+Hh6f+BVlUJEmKaGKQDB+6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HtDrko0b9u2qZYKEW+zp+qQUu01jh71H+e8wcxP9L40=;
 b=nZ0nQNKAADATSN9b/9iqPvqNqh+lPK84QFb5N3Pg+sXWd16cel4UJCUKVbVOHw9O5Kd9EWx4bpK2XVKCkv9xSz9xBeeAl1zIaP+8mYQUkhDckhEG2pIrjSBY7R8m/HSbmfShPEBEpIiXzDZdWTkRvXXoliXI0sWh27B6voez8VzH523uqMZGWa4Q7aL6XwxkeHR9EjrjCphNzxiRQLdAXzfK+4Idn6StR5UhHXKD9F9GFX6gZrh5PMuVA+M1qUCQEpz0SdAqxmkBe55pb0JFwLezRtDjJQClefcfqEFpyVNwBW5fsjd9ZaRUqwjimBnh83DD4Js3mUPO3ylUGNTXJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HtDrko0b9u2qZYKEW+zp+qQUu01jh71H+e8wcxP9L40=;
 b=n7bkV6ZwJLDVdlxGDNPWn6P5nhP/dSDAGOJ0+RA7aPY7tDFC2HaVhaSWekhktk97FbnN3xBCPVgCmy1Bw+RV36jJjvFpovl3vwjW37O4fWaEfUMabWZIjuX/SQZMUgtyBhxxJHbDeYlh9s7BwoAoWHE9qaD3nCACkDeZXzT/y8g=
Received: from CH0PR03CA0076.namprd03.prod.outlook.com (2603:10b6:610:cc::21)
 by LVUPR12MB999137.namprd12.prod.outlook.com (2603:10b6:408:39e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.20; Thu, 6 Aug
 2026 12:30:44 +0000
Received: from CH2PEPF0000009C.namprd02.prod.outlook.com
 (2603:10b6:610:cc:cafe::14) by CH0PR03CA0076.outlook.office365.com
 (2603:10b6:610:cc::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.21 via Frontend Transport; Thu, 6
 Aug 2026 12:30:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF0000009C.mail.protection.outlook.com (10.167.244.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Thu, 6 Aug 2026 12:30:44 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 6 Aug
 2026 07:30:43 -0500
Received: from xhdappanad40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 6 Aug 2026 07:30:40 -0500
From: Golla Nagendra <nagendra.golla@amd.com>
To: <vkoul@kernel.org>, <Frank.Li@kernel.org>, <michal.simek@amd.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <radhey.shyam.pandey@amd.com>,
	<kees@kernel.org>, <sakari.ailus@linux.intel.com>, <yukuai3@huawei.com>
CC: <git@amd.com>, <dmaengine@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<nagendra.golla@amd.com>
Subject: [PATCH 6/6] dmaengine: zynqmp_dma: Remove unused define and duplicate IRQ bit
Date: Thu, 6 Aug 2026 18:00:14 +0530
Message-ID: <20260806123014.2120447-7-nagendra.golla@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260806123014.2120447-1-nagendra.golla@amd.com>
References: <20260806123014.2120447-1-nagendra.golla@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009C:EE_|LVUPR12MB999137:EE_
X-MS-Office365-Filtering-Correlation-Id: 37791acd-1f14-440b-34ab-08def3b6896c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|82310400026|36860700016|23010399003|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: NqEf2vrn0sSqdHWQOd1Nseft/xB+BLA0CXqcLUgwcyjIATN/Q3FVheSQl++VtzC0p10ngHW7Tg2eVFNy6VYp358/C5wRw3Jw3z8Fk2/wlcvw7fhzbb+HRbFYpipWl9AFWRqqvmQ/JsCyeESe0Jk7n1mRPyNvpX///aPGsi/1nVcYh+XRGkfU2J/e4jt6HrmiwVG3R6VPs3poQTEUWfqad9nRy/x3xCOHc5GLGYxts2mck8IJXVkWc4XzCtdGJlADKbrvHDV6+kzy6dvCeaaX7rGhgwfx/QSoiK8RkguTGJk2myQwwjgRA9fC+/1y9yzjiUFu+FyzJdN3nJZ0vYijkQMQuImBb38fQ3WbErXF34nT3PP3fpi55IHVZ9a3pTyssYtuX285qxhrQgALC5yW9R10fjZb0VqChKBAYLvv67DF5zBj19V9fJZLgKqJpasCsppMdMbdm2N9v7rXBFPvARGMUjNbVqwYOsisP71YWCcX2GHkzNRFuRzmukRVgA4voVdVs1RSjTu4BAbz8mWwykWKe1xs8faBtyhJ0AxctnrArasZmSU03VIfFw9TuUOIL2KKaDWpgig9FuCsZAKAIU2+JpH0QX/s/XS8kNCTTc/XYYkSXXR0lBvS8KD2hLjRMaorK4kddaUG5jqC/RRsPg3KvUl/5/0YJUXmyq3YyS0veajB4YNQg7XFpJ5GiyMHBsmZgtB3gAd3y8J9//C5IQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(82310400026)(36860700016)(23010399003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: qzchuBRrEEVpeACRAm7LMe/FYGQQMJUhLpl5i32hSEtMVJLranndWN4YvUDtUn823L9EZvxyCxge6i1M9pxp1jk6cgtlsQn0R3TEwpHHImXFu9Gn60WULlB1sAqzvYpw13cqirZivfDLZU4bHMmtT6W2PY7e/eYgDe6FV4VWW/emH9TBLNlzZhIlh+9MjqvtZGPxuxuwRyfn5Nce7rx3iBQNIxX2Y/bGASqk7PnSj+UFEdIG7dibLohA3Rvg6xdkXWIzkqLgZ9OajbrLO9XKng00vokKhakPMG0jYpIMIfryL4GgbQ0yvIU6Qo7RfwBw/ATrSqHemx6SIsIlPI8dPVHmtiKzF33L2wE01OAPk7G/b3hEuyDwjLyQkZ0s27EZtu3OV6vhJE+d3p/bY96o/zoMS9wFFXYXkEbE0NtQvWRvX4opVUrhf09t/vjFE4wX
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 12:30:44.7712
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 37791acd-1f14-440b-34ab-08def3b6896c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000009C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR12MB999137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_053100_067140_DBAA659A 
X-CRM114-Status: GOOD (  10.55  )
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

Remove the unused ZYNQMP_DMA_SRC_ISSUE_RST_VAL define.
ZYNQMP_DMA_DST_DSCR_DONE was also set twice in the default interrupt enable
mask; remove the duplicate bit.

Signed-off-by: Golla Nagendra <nagendra.golla@amd.com>
---
 drivers/dma/xilinx/zynqmp_dma.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_dma.c
index e70874d65123..fd2dee4ea17f 100644
--- a/drivers/dma/xilinx/zynqmp_dma.c
+++ b/drivers/dma/xilinx/zynqmp_dma.c
@@ -112,8 +112,7 @@
 #define ZYNQMP_DMA_INT_DONE	(ZYNQMP_DMA_DONE | ZYNQMP_DMA_DST_DSCR_DONE)
 #define ZYNQMP_DMA_INT_EN_DEFAULT_MASK	(ZYNQMP_DMA_INT_DONE | \
 					ZYNQMP_DMA_INT_ERR | \
-					ZYNQMP_DMA_INT_OVRFL | \
-					ZYNQMP_DMA_DST_DSCR_DONE)
+					ZYNQMP_DMA_INT_OVRFL)
 
 /* Max number of descriptors per channel */
 #define ZYNQMP_DMA_NUM_DESCS	32
@@ -128,8 +127,6 @@
 /* Reset values for data attributes */
 #define ZYNQMP_DMA_AXCACHE_VAL		0xF
 
-#define ZYNQMP_DMA_SRC_ISSUE_RST_VAL	0x1F
-
 #define ZYNQMP_DMA_IDS_DEFAULT_MASK	0xFFF
 
 /* Bus width in bits */
-- 
2.43.7


