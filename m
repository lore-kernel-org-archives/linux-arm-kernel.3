Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9518C2A069
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Jan 2026 07:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DQG+9n53WIxJJNfHp4iNFV0akiIl7sfjr300am5UgZk=; b=eIapAqLK5CaY81eW08nhuCNRxF
	fJax8n0fqM/Cw9VtF2YMpErhFA7kCVmIkaqnCNdPNBFekTyZ/srDRUCB0e36ryrnZrJtohx+CA5ZN
	Jc0NRiSlizgDCErObMaMPMuKeMzvDVMKJq1TiSYTu04ygtHuZcTv8CKNnB8IPl/sXQ4xKPaMLSHqu
	FT6a27NtYTAZPz+SPXHSZFaWmgBCW69lmIBHR1ksY2lxzZPwUK7hOSNcyFrNg6zkTNYvzIhW4VVmi
	eMnm7TmA6FUKUOAzK6cFZr1LjqGtvc2yjBd8lLpwQizNdVNAs5gK4va7jEYDWFpDF6KMgt3QCeSX9
	eAkAEWRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcIwT-0000000A60w-2LF2;
	Sun, 04 Jan 2026 07:54:25 +0000
Received: from mail-japaneastazon11022112.outbound.protection.outlook.com ([52.101.126.112] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcIwK-0000000A5zH-3NQ7
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Jan 2026 07:54:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wF8VNVHCEnkaR6FRrw2ZqHWsrKMXgWxMAt0jKuAHz3ZiDZui8cmRcK7MHC7nFJOOFWGwmbwgcMO8q+XkMTphaPx6dS5u2aHCkYun/fMCS+tCME2Xq42eIXWCKknSO5dNFyf3EVXl1cIqDuDQeWlefZP0j/mZFJ/CQF+Ua/JLgkaG0QD8e7oncUOJCevhnyoUyWuzlDu1k5iosaVFY+n2koAW84kO/Vd7aUh+uJeikEYcqHq7hz7fKvseyiQeTn4GPDuPzYOEYs/ZQ5R8tbEHDh5LP5LB65Yz6rStbaaFUCAQaH9chZqOoqNPFXW98ssX2zSiQyAAtzjzXwfwIZ2MBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DQG+9n53WIxJJNfHp4iNFV0akiIl7sfjr300am5UgZk=;
 b=l3G7SqqF5frloz7Jgwl6HLpX3Y+pXxNaYTRr/f8/Vj0iqVacNazkw47O1oc8ZeYTvRDCbb6LZ1ggT/kDp3+DqZRLC0XnaxuCTMTRWmF6n1pgz3GXi4FuN/GEM5khSZHHMlFM1BG+Pt+riN8nfu2tBVLz/V++gB+Uvz8wKPCG1sRFJmZ6sXhTgNNBhQf+rg86kpWKatskD1D3H5fK36tgiNzFahnqVj7glP6+gpqSVrKTRlXGMuGWwZfppijLxjqkTOWC/6gyhTXrcB7H0ZvpRAnHCXI/sgWEdYFk28vlGjzytTbG23hTjKm8j5EHsLzkhi+ThBZP/QlCT8OaQsNcuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2P153CA0034.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::17) by
 TYZPR06MB5369.apcprd06.prod.outlook.com (2603:1096:400:1f2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Sun, 4 Jan
 2026 07:54:02 +0000
Received: from SG2PEPF000B66CE.apcprd03.prod.outlook.com
 (2603:1096:4:190:cafe::bb) by SI2P153CA0034.outlook.office365.com
 (2603:1096:4:190::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.0 via Frontend Transport; Sun, 4
 Jan 2026 07:54:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CE.mail.protection.outlook.com (10.167.240.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Sun, 4 Jan 2026 07:54:01 +0000
Received: from localhost.localdomain (unknown [172.16.64.196])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 079E540A5A2B;
	Sun,  4 Jan 2026 15:54:01 +0800 (CST)
From: Gary Yang <gary.yang@cixtech.com>
To: peter.chen@cixtech.com,
	fugang.duan@cixtech.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-cix-kernel-upstream@cixtech.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gary Yang <gary.yang@cixtech.com>
Subject: [PATCH v3 1/2] dt-bindings: arm: cix: add OrangePi 6 Plus board
Date: Sun,  4 Jan 2026 15:53:59 +0800
Message-ID: <20260104075400.1673101-2-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260104075400.1673101-1-gary.yang@cixtech.com>
References: <20260104075400.1673101-1-gary.yang@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CE:EE_|TYZPR06MB5369:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 95872f5e-ad75-4c0d-5d7f-08de4b666ce8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pULk+wBNdzQGEB2TCSMds9L/KesBWF+jQZ93Z0U5z1WcbX9Xo+nRIGtERdnD?=
 =?us-ascii?Q?+ZanguedxOMUzux0NFwLEltyM7QDJ11R7KGUMNM75B7L0FsRvSfi172CThgH?=
 =?us-ascii?Q?4aXc2akDPPcVZykEtI9a6MFUZ7RbkVIqNpMpMDe0Oywgiphp7HCOCWSnBKpN?=
 =?us-ascii?Q?ItDpHmwapNvygQqcYhJw9iRcG9kjbvcfmJju5HFPgZNVOBDEaqzXOSDBFvVV?=
 =?us-ascii?Q?FJfqWeMTKjZnh6bEHrvhU23Jc62SZJczxsPTGr8ZNTWa6zORamyRIRlKJ6SS?=
 =?us-ascii?Q?jbI/j3g3lXfg8Wo+XHOnL+4zJClcQxF3sWPT+IM4fCWXyQsr+hKO/dHymGrQ?=
 =?us-ascii?Q?hsXRDTCItc/kI+Yk5MJgiOSY+rhN2bpNRIiWdWTeImyqqGaikUZ83nh+0TZJ?=
 =?us-ascii?Q?W3uGDa4yAoOnXMFlRnhZkh1XuNePehtA2cNR4HkUEeG49cECrq6uyLEhy8vi?=
 =?us-ascii?Q?RolvxIcIIWz7lw5hRnvYD3QfLEz2tymsXTRBUp4lxvJT3tZ+phGwkYE8H+nm?=
 =?us-ascii?Q?GCTsr97sOueVra+ZDmwMPCW6Z5B/Tuut5mb+XQghyGZ12Zd7wgw+ZP05huW3?=
 =?us-ascii?Q?EUkrlyZykVOlzovRPA89czzJupQwmEeylpow41usC6+xTn3LipMuHwLoWNnq?=
 =?us-ascii?Q?YQWO/OXPoVvldN3hDoVWJqEVHOSa96C9gv6B22NgbOWAYXo8mBc1Z3f89nTv?=
 =?us-ascii?Q?WpN+BnToEV45GBMr3VR4mvyi4WQnl5ibA0IDDbwraOoOvkIdVnImliL5weKp?=
 =?us-ascii?Q?CsuTLLsXrVV5Hu+3PG5VefwMEOdS1Eli6IzkT4GDxMu8+jNCMjbr5+N7l7ge?=
 =?us-ascii?Q?f+0SBwn4CCy0vDL2Mqr9t575x8/OR/m3sYbOG8rkA8viKwSRhSuxQuLE30tH?=
 =?us-ascii?Q?MJVGFBO5r16h12UGCgxwta++ZTqkhQmSkt9i6Z4KeFNawqBVsNeQI/tZlMRd?=
 =?us-ascii?Q?jkMPT7DBsO/eLUpvMRnal2GUH1YQwIcmdJv4LHFrSTeqh3thnRRpbcKEFFwe?=
 =?us-ascii?Q?KtGylHXGGNj4zQb8XKsU9JqrWG1KpNneFGGDbGz6DBUgCUmd3pDzKPPOYAmU?=
 =?us-ascii?Q?nrrXyPsPtaI+KOzvE4B1KfwrmdFCKr35qkUUAB2hChWel5iR/md4lEpxkQyU?=
 =?us-ascii?Q?GFgLatXYkJLuIOHahrRDAZLY/psSQsY7Gh7oEYe5/IazxN8tLmVlOjoWua4c?=
 =?us-ascii?Q?W7Y/5+Hg8sWdH2jLeeWh+3NgSw0kVehXQf8qT257OZLe0F/GqCadu3vva2qU?=
 =?us-ascii?Q?0+XnmSTmfKZY3k28O6nakh2SSsSVqGzyGL3lqmdRRWdRd3R0lBMHIDBrOc21?=
 =?us-ascii?Q?PKEMmwZR0dIAwsvASWALDMYyNfmgXL3lyTnikSZEd8h+cEGXxzUlH0hNRZQl?=
 =?us-ascii?Q?W0fAwCdxtukJPvSZVBeJ8pfYTTa2GsWw1xhbIucX/C1j41M+/cwm2hqyytpx?=
 =?us-ascii?Q?DOB+y0C7cnKTWuRSSc2FSpIMKuc7/qmzA2U78vnpPSIg2FP5ySzNEf4nO6lH?=
 =?us-ascii?Q?rDVO1cpEu+8irTOV1gdr/4KyE4Slb7/vCmrev5rU+q+CimRZXMZVonU8umKd?=
 =?us-ascii?Q?S5re5rsV7UbdNmFuwBI=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2026 07:54:01.6965
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95872f5e-ad75-4c0d-5d7f-08de4b666ce8
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2PEPF000B66CE.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5369
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260103_235416_840908_4313CB12 
X-CRM114-Status: UNSURE (   8.81  )
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

OrangePi 6 Plus adopts CIX CD8180/CD8160 SoC, built-in 12-core 64-bit
processor + NPU processor,integrated graphics processor, equipped with
16GB/32GB/64GB LPDDR5, and provides two M.2 KEY-M interfaces 2280 for NVMe
SSD,as well as SPI FLASH and TF slots to meet the needs of fast read/write
and high-capacity storage

Signed-off-by: Gary Yang <gary.yang@cixtech.com>
---
 Documentation/devicetree/bindings/arm/cix.yaml | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/cix.yaml b/Documentation/devicetree/bindings/arm/cix.yaml
index 114dab4bc4d2..9e132e609b7b 100644
--- a/Documentation/devicetree/bindings/arm/cix.yaml
+++ b/Documentation/devicetree/bindings/arm/cix.yaml
@@ -16,9 +16,16 @@ properties:
   compatible:
     oneOf:
 
-      - description: Radxa Orion O6
+      - description: Radxa Orion O6 board
         items:
-          - const: radxa,orion-o6
+          - enum:
+              - radxa,orion-o6
+          - const: cix,sky1
+
+      - description: Xunlong orangepi 6 plus board
+        items:
+          - enum:
+              - xunlong,orangepi-6-plus
           - const: cix,sky1
 
 additionalProperties: true
-- 
2.49.0


