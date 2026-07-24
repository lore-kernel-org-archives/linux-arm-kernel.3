Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70A18C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 09:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dROjr8zLdOCauGvKoO4mZTShfegNdWTh+1C7b7Lfur0=; b=n+aVPNoMphGkK2op6xaN5cMyWe
	DRbh4gEzhmAeDF3Ga9nzA7WaBLjj29mdLbIhFVH37SV6I+BmqrjFldQlVUNN/IzX+HCRz53s+QUFS
	Fl7vnHy8QhHi38mC/0JdV/uuaAcZKKHveN0So4012v2Fq+zSwBueS18uk852fbgjU8bvkO4zN5yQz
	q3D6gBhCWURgXqqxEw7A9vYPDKl+LzGBx8cewGjSB23gvGJD+F6qOfaZ1OECCsAbhowM0fYqHE8lO
	9WELdcce5WNw7BtX+mxmu4ro/P5Xo9JvHdKgvAFjVuyfWOFAqVD1vyrIOmZd+7DB87JRbJo3C1vUv
	q/7rruTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnCbz-0000000G16N-1aL0;
	Fri, 24 Jul 2026 09:54:35 +0000
Received: from mail-westus2azon11012070.outbound.protection.outlook.com ([52.101.48.70] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnCbv-0000000G12z-1Zvw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 09:54:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n95fnm4D1Y5nZZ1PA89TIccQ/mIBtfZ1IZ8xjOb+T4nn0ma51gw7Q40me5Qk1nP5XDhx6OLJ1ok71iMmQ5HxFUu/4phJJAMo1nG+zfUXz5pgv9Vv2spisln64KWTLhclSt52fulk+aHPOPXoZiXTHEFCoz0/4q0LbUEXwj++9U9ojkGlZIMaNkJ625Stu3xvyX9jWaeVi0syl0n2rNuHjPJozeZEkbJ92ExMMtqX1bHo9UiffahYUXT/vDw4A5xdjULc7akDzlaGcfQhFzPP1dTCArZ0an60yF4t9r5ODjiP6jTSfEW91KsEtfW6HoFeUbmGLCvFw55DsWDr5aAtjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dROjr8zLdOCauGvKoO4mZTShfegNdWTh+1C7b7Lfur0=;
 b=Rh/DIqR3sXgIWn3uZXZZ3cWMSsmD5epzROdZsDPx2jbVkXhlSk0YnpCy3jEsggz9hVfxybpI5Me2hU7teTF96E6d0qryja3gLx6PGQQoKWFbYSF3L/eiGAeo0D+F7Y4VZZaU9GM/z1eQcPjrCEPvSAid70ibMT1X07eSPpDSHr591kAY/mSTKlW20cSx8Bne2u5CijawdgorfKAyMePakzQaDWLn4sMyZ6GG4Umrc4NzuwnBF8diuIoLyc19VKdHJc7JMOqko1SRACc815niG1rj60olhV85OaCty/zq29drGHSfIK2rA9MbjP0MB8v0jGZCuHoKiPLN5IxtFHAPMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dROjr8zLdOCauGvKoO4mZTShfegNdWTh+1C7b7Lfur0=;
 b=Bj7f8rtPKkMYoBuLZG6TtdCxUroNpuNgMhf5+p1BAg9ly5xNAvWEhk83Bg7QH2ECzWCyI/mfhaOd+QT+MpHHHghmkxBf3nGJ+Nl93NfdOaNktvOjwnLPunTZ5N364Ilwhjay3gpeCYJGx1LKblRY1J6wIexjG8lFa5fVTAMUOfI=
Received: from BN8PR04CA0053.namprd04.prod.outlook.com (2603:10b6:408:d4::27)
 by CYXPR12MB9278.namprd12.prod.outlook.com (2603:10b6:930:e5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.12; Fri, 24 Jul
 2026 09:54:12 +0000
Received: from BN3PEPF0000B075.namprd04.prod.outlook.com
 (2603:10b6:408:d4:cafe::39) by BN8PR04CA0053.outlook.office365.com
 (2603:10b6:408:d4::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.12 via Frontend Transport; Fri,
 24 Jul 2026 09:54:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B075.mail.protection.outlook.com (10.167.243.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Fri, 24 Jul 2026 09:54:12 +0000
Received: from xsjarunbala50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 24 Jul
 2026 04:54:11 -0500
From: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
To: <michal.simek@amd.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<ptsm@linux.microsoft.com>, <radhey.shyam.pandey@amd.com>, Jay Buddhabhatti
	<jay.buddhabhatti@amd.com>
Subject: [PATCH 2/2] firmware: xilinx: Propagate actual error from feature check
Date: Fri, 24 Jul 2026 02:53:52 -0700
Message-ID: <20260724095352.2890326-3-jay.buddhabhatti@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260724095352.2890326-1-jay.buddhabhatti@amd.com>
References: <20260724095352.2890326-1-jay.buddhabhatti@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B075:EE_|CYXPR12MB9278:EE_
X-MS-Office365-Filtering-Correlation-Id: e68b2bb3-2375-4f7b-39e6-08dee96983b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|23010399003|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: g3GYxab/rKLE442ISrlVaPQUQ1MCxde0tyoALSCCOqT35OD0fLl+hJhhaPShFikiewyowyed4l6lCwEpRbcOGKee3sx4TKvAZrBJH/8zLdJT+juzQ83YoxSSO8hQxjv+dgy6MkERwRk+6rCAc5wqmRz80GY6LxI2UD3R3PPrBzYoglr99o5+sayg69dwyRe5yb9EH5AtsrYnIUZB5fw1eBXxDdTqhQhZ4Hlz65/TFzbk466sHlkchKXphBAipUJu3mUnwu69f4Uqbb1nEfcuwDphl34GDTKSCJLCdJyGtvm9lBgFhMr7NEHMF0JocePCuO9FOpwKd2FKScb4zYCzsNkam7cGfNPdiJPFWkgkBP+jFISORHoHcWjVwJvTI9TNcGh2CRyeWDvIQxutMcVmFOvQu+cCABYZluKnzLAsxiU75PBfbAPFZ6jeLoXNblgOSrFYTiJvkTl0QHxWZMQQi2Zn+fwPGeMhh4GqTIO/GD1Pn2wA/ey85Ied8LVRAH5npRrB4clpxdz6QQgRDm/gfr/H+bDeexiZz8KoP3EruThv3TzxVI+m1ik4DvNWduIUIlhE8uXE3mv2941ek7PkkCxtMXrR52ii7fgqrG3cNuxovyQUsdeune7G2rbML1tMD2nah4+aW0Qit65CpgmwTMt5oYUF93VAZq3dMn7zWkglCvykn4PFFJiXoDvBVVlUvHCLeTpEAgOOwI09/DV17Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(23010399003)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: PzBQLsnva/m2ZtYEQ9wiqHfaRjd8x4z02BFj1geloQJPUJDJYb5GNwSrmLoQRA9B4cYzbcUF48oOyhYgti576V998dCXxmV5TmyVilkch4hp9r+PTgv2oJ2OxDuLrD2kWhjmdiZarO93SqZvrqkqS2oHVLflNT+oByXgec156yVGCJoulJr06Hgd1h/rG8Qsne4k7EwnKHsViOIMfvKtZzwrKCM8XSNX7YfGnFimxPaL/M99yOSPEso+8B/UnEs3uGxTZxO4wT/K4c0zFqp+HG6fsLFhfSbWB0A+24M0xL/ICEGLIMA02cGUkkggULE1IAPKMdXfG97um6KjGQYNDhC4nDlYjQAT/3fEzIgsZeYDb8Q2pFX+TOfyRMxl0Ae56aDZ5z0YPlPwxrl0eEEoH3VDiJQGUeId80Mue3eXGxKkN6sugG7K6uhh44xagoTz
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 09:54:12.2941
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e68b2bb3-2375-4f7b-39e6-08dee96983b0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B075.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9278
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_025431_436946_D7350487 
X-CRM114-Status: GOOD (  11.53  )
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

When do_fw_call() fails in __do_feature_check_call(), propagate the
actual errno from zynqmp_pm_ret_code() instead of always returning
-EOPNOTSUPP. This gives callers more precise error information. Existing
callers only test ret < 0 and are unchanged by this.

Signed-off-by: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Reviewed-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
---
 drivers/firmware/xilinx/zynqmp.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
index 95f5941c5ca8..0b6c20a1d8be 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@ -252,11 +252,9 @@ static int __do_feature_check_call(const u32 api_id, u32 *ret_payload)
 	}
 
 	if (ret)
-		ret = -EOPNOTSUPP;
-	else
-		ret = ret_payload[1];
+		return ret;
 
-	return ret;
+	return ret_payload[1];
 }
 
 static int do_feature_check_call(const u32 api_id)
-- 
2.34.1


