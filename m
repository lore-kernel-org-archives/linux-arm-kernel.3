Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A7D5E7719A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 12:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yRxUkFBaH4c5+aRl5KHbDdqo6G8LL+reXmqfNCRj1ow=; b=uE5MFkEO79LlPMsD6UjtziAEqp
	to95n01I/kSH6tz4DlYZXsVlplwT22Qu0MNMoPs0UEAPRltionqyZ8khusXL7/VLQEksWTcNQNE6j
	T5LvTABKCRH2iVd5Jr/krWigF8tyTy+nLoGA1o/369e0h+fdi73uEAIwohzSORTztJyhdR49w4HQK
	2CFpRlZJ2UxN1JChIlCZSNt9Ian2mg7vwbrIdnw2daGUTUlKXVQfnAgq0B1fbEcuGHSFPtaQ3zp72
	gkUlG1Jcd+KBRzL83smPkJgm7NAGP9XsFHuLnewsZ5My6lY8xy0L0XGk8dFc4ZJ1xrf4ZIGoIOpNy
	lJrMZBAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVUx1-00000008NZ0-227z;
	Wed, 08 Jan 2025 12:14:19 +0000
Received: from mail-dm6nam12on20607.outbound.protection.outlook.com ([2a01:111:f403:2417::607] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVUJp-00000008EN9-2XQD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 11:33:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uPunPTpwNvZhr4XY07fCYhmk7j6prNDeKnwcpG1n94j7iyxLWedmRdjd84k65g4K7ZAUhvRIkIrQTQTA6JEPv7v85Zf4lpzzCahRFcf/iBZ0UZd4Dxu+iyvpXLGzXBhOVaMGAYujPf79FqCf3hfbVu93VkmcXfcZ33F+XPZtS8y4ZpNTgLnYKv1ZHZBOI9m3gUIRGjVK1cshELII+Rsn/V0118V4Mw5xrcwCL9mUZ1BZSjfajWO3enMJU5xGVQzR4+YVhpXeOyiGsSyT8luDHw0Crmg93TUa4nQweJHaO5C4Iga2MYJFB3gQ/M0RuqGZn1YQ8bLLo4Zbz70rAWyedA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yRxUkFBaH4c5+aRl5KHbDdqo6G8LL+reXmqfNCRj1ow=;
 b=FbZ66mQQdzwziTSHtKa7baBEQ9FhngTA903QX2bNlKlvZKlMTm696TJzLlhLn6LFCs4Pb/jImnXEJQLSI1z6Yste+y/2HStlXS1+SFlz9HPkZ/JV83aBZdWzXwo3iBo7Ch+Ld0UmWKAVwo+oR18m++n6pihOzsMqBJG4ItaeYcYwFtNRTF8UlLeT01HrnO9A7O6SvIL9nzEGLmPswLPkDz5w+s/b1KJefKIzrAulJ90x5t0qZNsFSxrLJV3TsjOFKid5ITzIi7DHfhNogLs8ch9bZ5tILTppMLrU0by8YkYZGtxABQX3sp2n7NRvBYglkpz//ZmkSynBQsg9VR1W4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yRxUkFBaH4c5+aRl5KHbDdqo6G8LL+reXmqfNCRj1ow=;
 b=gwci/SjEBBhALGS430TLRAOzFxxzu5kRVBDJYMEtL8lwsVQX+nDXF5SMiIix4yVEwQjaH85wZURxfhIaiy4C4qqDooWafqf4C/HDHgPPe1e6iVL3B9yPh/RSSvHe8KvM5ibLWyjuNv7HU5kh6PeRWFdChVVgavrc2II8zWatcak=
Received: from MW4PR02CA0005.namprd02.prod.outlook.com (2603:10b6:303:16d::14)
 by MW4PR12MB6755.namprd12.prod.outlook.com (2603:10b6:303:1ea::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Wed, 8 Jan
 2025 11:33:44 +0000
Received: from MWH0EPF000971E4.namprd02.prod.outlook.com
 (2603:10b6:303:16d:cafe::f4) by MW4PR02CA0005.outlook.office365.com
 (2603:10b6:303:16d::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8314.17 via Frontend Transport; Wed,
 8 Jan 2025 11:33:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MWH0EPF000971E4.mail.protection.outlook.com (10.167.243.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8335.7 via Frontend Transport; Wed, 8 Jan 2025 11:33:44 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 8 Jan
 2025 05:33:41 -0600
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 8 Jan 2025 05:33:39 -0600
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <git@amd.com>, Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Subject: [PATCH] dt-bindings: soc: Add new board description for Versal NET
Date: Wed, 8 Jan 2025 17:03:38 +0530
Message-ID: <20250108113338.20289-1-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: shubhrajyoti.datta@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E4:EE_|MW4PR12MB6755:EE_
X-MS-Office365-Filtering-Correlation-Id: 89f49cb5-fbee-4fc5-e52b-08dd2fd84f17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8rdR2yBy7idVyjF2yFpjxoun9p4M98ytuiiPbtmIZ7gXt/LEsjwtIvc8TZ9Z?=
 =?us-ascii?Q?Almfo6fQvYhgyAKBFx3DOb0VtrDUWq6LMjLHc3D/zaryKR4xyHy9zLVC+Wve?=
 =?us-ascii?Q?v3iAq74MHMFtr2if18QXmh7nfeuBetWJojxK9Wbosmi364qwczpodPgnhNUu?=
 =?us-ascii?Q?ssDADRy22mps7KSCE6AjrNEi1WbbEBoOJwN9YhmlUSqUfBmD6L3X1ee8ulhD?=
 =?us-ascii?Q?k+6FFycPoVCfKqQDJR5yN7JwwsWRxCpoYdR5N/Cho6TDao9mq/h5SLKLzBsp?=
 =?us-ascii?Q?Qmu7k3Fy2q6ZeFtUtdTRH/Wih1h7dHj58Q4FNDn4rW0nhyjibqfJK0fEekJ8?=
 =?us-ascii?Q?sdrZpSdblp9l25XRfkvnp+5I3o//HxdXZLEuSl6O0saz/QmWN+2FWhDaZcVO?=
 =?us-ascii?Q?klKkE9oU7+OEEQ1Gcg1y9oTRddEeTTK3bcVsicaTgx6YaktDTWPxpIHNiyUw?=
 =?us-ascii?Q?DpyuRdPG+foZJvZMYF7K6L5fGxzwT6FfuRC+Q+pZj1p2qRjKEkpUfF4kNIzB?=
 =?us-ascii?Q?TkBXCH0x7BbdHvS/FPH9LcVATGmbeg4j7OYFoK4tuWEyslxEXjyIgovn8DbQ?=
 =?us-ascii?Q?LaoyLofjepylWUJI0HG69n07hKgQEyxHYs3gPJlekAcH9q+T9SyyjG/gsgKl?=
 =?us-ascii?Q?gemopzH6oWXs+3dha++GNYfAy6Vmj1M7irgHUU4zDuI1rL5LbC2u3aPk9bse?=
 =?us-ascii?Q?Z2hevuEoHQtMvDC/zbBKGBzWb2y2eOg55SU+D6RaQ9J51fVAVYOKHjlwupjW?=
 =?us-ascii?Q?ukCtq/fZq7Ee6b9RmBCm2fL9uGqAo7c7/jOlulC4QBxoARSifyRgdE0pTFMJ?=
 =?us-ascii?Q?gqkpeCXEspXw4u7oBvVSfz8NK7UQ14jks9MlOfl3RL7kJqW0np+lXJtEHV2Y?=
 =?us-ascii?Q?pXlNqOekO0gVNatmjMybKM1m0CG6VDb9Dl1HvophPcGzW8mgcN8rjUcYKHFG?=
 =?us-ascii?Q?7qiDdyrbsazKSwDKqbAlNkUnH6rZsbN8X/FpjKKQG2GjaLQLqvgcWepUJbDc?=
 =?us-ascii?Q?OqAhVeALDjaDSbglUFBQEdcVrNTDKtnMSfddYUqmpAK8nKCjUE9YI88xGjQT?=
 =?us-ascii?Q?WMKPxXCX7D1174pH2OLDY4eMDnEaXHxPnRnz3Kh1WQFSfA3AYDQEm7ddMfHM?=
 =?us-ascii?Q?QAbkmg7w+RMFVFLxLicPqOlWeRwf4NixHw0uXVt1GOE88es67q4sKpA91uV0?=
 =?us-ascii?Q?mYl8WIdq4iROL3jz7Z6amjsZNG6uYLDveHfiVvtTWvXhsViEdP6oXM2lOYBE?=
 =?us-ascii?Q?Upar9R6J/YEjpDEnWSqURm1uGGhxUOgv2dKxb/lRDg7XH71rv3KinfgDqYjT?=
 =?us-ascii?Q?AS+/YdhLDxBzRqO5kdxEHHCCmuXJz5n0nw0y8WK2q5xBBZBsJ8Irr279cPZO?=
 =?us-ascii?Q?d7UG7XrHjs187tQsxveLBwB2byDcbiR5L+UwJXpu33aq2z3ddbdEQDStnRcV?=
 =?us-ascii?Q?jXWbzdWssLTegzJOWNrlIGISsjaT4s6HL0GmT2ZXbsmq+eQBjSBkxl4Ub7mS?=
 =?us-ascii?Q?+bNU++S6+N8WtFE=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 11:33:44.1167
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89f49cb5-fbee-4fc5-e52b-08dd2fd84f17
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000971E4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6755
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_033349_643620_C366DBF9 
X-CRM114-Status: GOOD (  10.43  )
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

The Versal NET (Networked Adaptive Compute Acceleration Platform) from
AMD/Xilinx is a next-generation adaptive platform designed for high
performance computing, networking, and AI acceleration. It is part of the
Versal ACAP (Adaptive Compute Acceleration Platform) family.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

 Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml b/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
index 131aba5ed9f4..e0fa36be7e35 100644
--- a/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
+++ b/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
@@ -10,7 +10,7 @@ maintainers:
   - Michal Simek <michal.simek@amd.com>
 
 description: |
-  Xilinx boards with Zynq-7000 SOC or Zynq UltraScale+ MPSoC
+  Xilinx boards with Zynq-7000 SOC or Zynq UltraScale+ MPSoC or Versal Adaptive SoCs
 
 properties:
   $nodename:
@@ -187,6 +187,10 @@ properties:
           - const: qemu,mbv
           - const: amd,mbv
 
+      - description: Xilinx Versal NET
+        items:
+          - const: xlnx,versal-net
+
 additionalProperties: true
 
 ...
-- 
2.17.1


