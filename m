Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AF83C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 14:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BsR/BCZpqLnBh6Tj50tqUydZpDow1PYQm4mENOH2V/A=; b=Kw4jVzid7mFHUKpdblVjSnYpCo
	NkqDZe9SJXTJJHvR7Y78DNHopNUDuZU4wD94h376fchbrSs5bHZPPfE0CYxaokCLOcZe7ZMmNXSta
	/VXOqrnmEWvM6VxPpzRj3lcc7LZKntxOoHCRX+XPFu7k2Kro+0YkzPKObNVXqcsQ86nvXhwktvjRI
	AD+zRsA22wumFxpSJf161f80jcsR9NLm90HJb/fql7uQK4n66mFp8pERCS9tH+07FXF2glbwf7TQZ
	n/h77prQTEDxqixZr/PzhY+LZk6QLzotVGwcxaxf3SpUOvPVC1DXz1N9OtXmbrzMFpcUoTm9yVZuq
	zP89Noyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWbaO-00000005d20-2pll;
	Tue, 01 Jul 2025 14:03:48 +0000
Received: from mail-sn1nam02on20619.outbound.protection.outlook.com ([2a01:111:f403:2406::619] helo=NAM02-SN1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWaHF-00000005M2b-27Hy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 12:39:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dKHzDjBqXiCCen7xCJO3JiPO/OG2Llt6y72lxeGQQ8rWfBZBgR0/rThFzNhmVLDtGogpzZ75SM3sXKG4ukrQtPWQJWO2HNTR7feXtM/N/IA6yYAszthXNM5PsufRhSkpVLi3/hNAwt9WDeyRqjKaGAJ9VW3OsLU9/OHwcAS8LGeVmZa7Imbfaq+YacG3WbHjpCUpHP3Zr/+HHIwLrUr4SoySZcxDWGjjPDtd8I//4sWAJ2PktmpPcQG81mIY3DAOmOIZMZ8sZHwk4N3syIIjqbOSkf8CHiYf7YlF95skLl2PnIgQJAC7QjeWDnuJTbZNg4QMk6XqroX8YYUwQnvKqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BsR/BCZpqLnBh6Tj50tqUydZpDow1PYQm4mENOH2V/A=;
 b=dsKXuZhXBbW6KOCJbH2HDXciGR7S5xiKH05fe+AwDMQ2W07en8HxRuNVvsBuKwhva7qlttm8NGc9EYNvho5v6eruPgIufwW6SggTuPmB5XfBwaeTL/n1WLR7rxpgFRzJRtL7yacYKrOMPryyijp7kzmfiYB4NufDomFzwQNW8fNcxiBvOkMpARTmOU292ZhJnfngtIeQEpENspRiojgyhAFJuno0cXHMdD1JpHH3mhPzGh7re60BH2y0RuL1ZtOCUXu5JcY56pKLyrIuskPBQ/98/o9oNFdK7F2MN4pZLgTTzt/jXwlDBZC/moK+j1Yr7FogD/M+TDVLxfEecXNCag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BsR/BCZpqLnBh6Tj50tqUydZpDow1PYQm4mENOH2V/A=;
 b=TKeoFbBrr2LrA9cExGw7guNRZ0V6KYVwji/bDlOeAGQUCMI3gYBx09n/TorhNdZasrZfXqYqIrXm4W6+tyBQl7p6ykjXhSiaytcm/L1Yv0CkNLzhNbDms8BixY+2+h/fPl5JBIiyiuxm7zVd0Z9eOF7w7vm4XsZ4x3raS30F8E0=
Received: from BN0PR03CA0014.namprd03.prod.outlook.com (2603:10b6:408:e6::19)
 by PH7PR12MB9125.namprd12.prod.outlook.com (2603:10b6:510:2f4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Tue, 1 Jul
 2025 12:39:53 +0000
Received: from BN1PEPF0000467F.namprd03.prod.outlook.com
 (2603:10b6:408:e6:cafe::11) by BN0PR03CA0014.outlook.office365.com
 (2603:10b6:408:e6::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.26 via Frontend Transport; Tue,
 1 Jul 2025 12:39:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN1PEPF0000467F.mail.protection.outlook.com (10.167.243.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Tue, 1 Jul 2025 12:39:53 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 1 Jul
 2025 07:39:53 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 1 Jul
 2025 07:39:51 -0500
Received: from xsjarunbala50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 1 Jul 2025 07:39:51 -0500
From: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
To: <michal.simek@amd.com>, <linus.walleij@linaro.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <git@amd.com>
CC: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
Subject: [PATCH 0/3] enhance zynqmp_pm_get_family_info()
Date: Tue, 1 Jul 2025 05:38:48 -0700
Message-ID: <20250701123851.1314531-1-jay.buddhabhatti@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000467F:EE_|PH7PR12MB9125:EE_
X-MS-Office365-Filtering-Correlation-Id: 068273c4-a328-4738-614e-08ddb89c60af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XRuuH/4nr0QiYwy6u/9pz/SuvhFER0alEMKULPgYjg7GBZO1x05YiE5gLBCd?=
 =?us-ascii?Q?du+8eEnXndv6JuuO41rqmITmdlFvLVLcApp8KGaVNsgZcgQ/J8t7QWYnN612?=
 =?us-ascii?Q?keHtXgrilc0TENz6o9rFB3xTwPIeJ1NT/qzAqLZI1/kgETU5DzoFdTkvepV0?=
 =?us-ascii?Q?TjNa37/85669WiQRKsJYBwzwrkoFH5Tf5Zk1r+MVb7z/uklhSD9KH8lKbs0D?=
 =?us-ascii?Q?DHzP9PIfHnfc0vm/PEadpJiHtsdfy0HSzfwv0KjfNSumsvqLVIo18zxdH41B?=
 =?us-ascii?Q?s2qHhZrOMnd3AD0n1VWFIItgb2+YdsS7JB2gNL9BhIdbg3p0LacDHP7Yv9KS?=
 =?us-ascii?Q?sqCeE07KrGxcDhYE9exxlUuKHxZM6xSCnNLVGjH/QhSagkHthpquAnUE1yGW?=
 =?us-ascii?Q?ZmSJliKl5/cKeq5FbPSrR8e2euVbzGoEbCTUR0MbSaE/K6iebcleWdBdoMqZ?=
 =?us-ascii?Q?lj5x0Qr+vHyME8Gz6wnc71DDiKDegFyvCtNLU1isEFlWUxhMT73jwp7smFx2?=
 =?us-ascii?Q?USGKljVm05wECakOdNnyAaiOccA0MrbMSJtezobDYxJsNgoRJzKoisaG5cvv?=
 =?us-ascii?Q?xgTQPJzHbHjovLQS0gIr17GaNaWvh5LCdUTmz514JlpDUytrwIItRbdMuoz8?=
 =?us-ascii?Q?mRjm1tQwdgIrs22Jf/xp1ae5L3A+CugFCfWc6LUpUZIPybOcuoQ6IVt0932/?=
 =?us-ascii?Q?i0Cz39EFX8022KXZbbXM/J4uBuvWo+MWpKgF+0k4C0/ih0jPFPhcMcgU8nZL?=
 =?us-ascii?Q?jRHFkbCjNOzKs9r/Vf0XeJGHsjvtzjz1Bvelf/kw9SFXa8Ae3oNPeNGumNHR?=
 =?us-ascii?Q?kelM6Ky1i5shqRsagxRnhG1DfqJR1MY7hqDbXTvlfBVyZflBSAtqRAMTLN44?=
 =?us-ascii?Q?NGp4REJDTsnKDDmJ5OI7SuWK6w6Fk8O8URCU5DY99a9VDgDKBUh0D+/JV6r/?=
 =?us-ascii?Q?hvld3EHIHMC5Xp0s4cClHN72T5mA22+f7aNfOSyw+QwH3/Phg1PIUh8nWJuo?=
 =?us-ascii?Q?GPHVByKZ/4vxiFGNXXPclW1zCtD8NH7Km/JYIvaYQJ2hD4y+B0Gu4UEVv6P2?=
 =?us-ascii?Q?bmOQQE9n1LPB9/T3TO0qJPtognBA2hJSq9r0VdsCV1MFMQDp7LFGTeIYitSW?=
 =?us-ascii?Q?UmSD8SLAUaijp9mQiDwFAnzP2WFimtjdrIPtoiBfITHsuJGueLehDpj4K+rh?=
 =?us-ascii?Q?fz9K4/Xf6+U5sxb5M0xyZW8d0h2wGqb9LAGIjv+Gu0oUSDub6q/0A3XCGTJ6?=
 =?us-ascii?Q?EeVZ6txP51Rq5MEQpxtdR4RRqEXXX/WOIexJIGzGKARdRQI7dkfRBsgq1fUh?=
 =?us-ascii?Q?dyqiIL9bmN+lZFkg/AzaRG6iHC7Wewz6zp4MQJaGZotoaSfmDchDcqDJ/e2G?=
 =?us-ascii?Q?U2PH3zUS13ErkHIIfIgwK4GEpsWC66iHEjb+E5DLE6B0gV/XkHgaFenlZVMv?=
 =?us-ascii?Q?VwJjM7HR4S/ORU6wZOYpqrFiM6VWo1Ig4y9T/lszrHt+Xab7OIL/gH7jqIFY?=
 =?us-ascii?Q?k+o9Zhdx4acYY+YNUk+DvddNahngEIBt3OfD?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 12:39:53.2556
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 068273c4-a328-4738-614e-08ddb89c60af
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF0000467F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_053957_541780_CCADFD9E 
X-CRM114-Status: UNSURE (   8.36  )
X-CRM114-Notice: Please train this message.
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

Enhance the get family info functionality in the Xilinx firmware
driver. Changes includes adding Versal NET compatible string in
firmware driver, adding a new unique family code for all platforms,
and modifying the get family info function to use the unique family
code.

Jay Buddhabhatti (3):
  firmware: xilinx: Add Versal NET platform compatible string
  drivers: firmware: xilinx: Add unique family code for all platforms
  drivers: firmware: xilinx: Switch to new family code in
    zynqmp_pm_get_family_info()

 drivers/firmware/xilinx/zynqmp.c        | 73 +++++++++++++++----------
 drivers/pinctrl/pinctrl-zynqmp.c        |  7 +--
 drivers/soc/xilinx/xlnx_event_manager.c |  8 +--
 drivers/soc/xilinx/zynqmp_power.c       | 10 ++--
 include/linux/firmware/xlnx-zynqmp.h    | 18 ++----
 5 files changed, 64 insertions(+), 52 deletions(-)

-- 
2.34.1


