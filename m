Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44CF1E67495
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 04:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WGiP6HlWZhmadCrSZ6fo2DY7mtTP0TzFFlchV7/QzuQ=; b=x2NIW/1fEZ6e7iPAeaGHjwNa+n
	UsXNMYwvoMRCt5CE3z62GHS4s1F3e4uQqcglR0YPW4QSrNIVUfMmCvFFSh90J5gckmJfXLFj2iCSl
	hFQFijJ88lvYk50KJTtPtbVJhv5bKIPXk+oSjaFBeMH+r+8WYV0qDWBtLvqQMVL497gJTfXTtxa2d
	M2OKSbFD6ZgCrb2zO3jdeOlDoiLGuHDb2m3uqr+78SDGp7GlYJQnawfMW8ukp8bUMUINm1Ga+cDcT
	pKOhVXVO6sCwK9Y48ZU5iH+k2Ww42VSzUVokW4qkxfJcvSQNA803DXybrRS7xMq3rqGOvZXgBpbR5
	kOATEncw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXXpC-0000000D5CA-2Dbk;
	Mon, 22 Dec 2025 04:47:14 +0000
Received: from mail-westcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c112::7] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXXp8-0000000D5Bk-3BEE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 04:47:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZqJf3TGie7dretCJFcz7WC1+B+YrLRrH7UDWF1C82uXA8KeJkkmT8CTGPzWdYkSr2LzKpT/tx0GHfDHEgyAJMiFEqx7gC4+mcoQjASyC+4MAj+eMEO9oGOeVPdMQP88tYyYCyYp1ZTHPeTsUqAW8FV8/3ELRWztlwJ4QI9xNj4UzbtobDc/N3p8Gr3Z39Ob8h7Wocpg85NiSARZ5FWuFqPAYfS7UrXdDvmMyCiVXcIqqlRQnCDP38EdDiFQjo1PouAiqAzkT+RCnJL0ahjShGS4i6Wa5YVCquoQ6wwpDj2sV18VwqJ9YxyzpeuIMUcL8fPhQ0o7TCNzHd9oswaP/MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WGiP6HlWZhmadCrSZ6fo2DY7mtTP0TzFFlchV7/QzuQ=;
 b=wFXy+dc508Hyz8uUvbntygIiQoiP3t2iWyARHMjfr6/SyEksDTqnlF3oGNnM73SIc6+Mc12gnH3QF7GDJPl5Iz3VdmtDrEZNrsX/KVKwWcG5fk5JDAifS3nMmJNl6YepiiQnOJQS2A/YMc+C1Cr4HtlFi+sx7tOxUUR3EN1othEjIPE9+TKUktLdPlWntd/FzCzXo13VpqnCoLbbyAJCUfqSyh89B+x4SIk4PN8PGWsmfG0JVe2PdcUiowYlzeMIoOgxnKh2ogL9XUAObIH3qsvOSLiDLpci1rOZljPSn2WdmAGpnfKEUh1v72wxCDnTM3ASbGYO7NWt26CUeoYAZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WGiP6HlWZhmadCrSZ6fo2DY7mtTP0TzFFlchV7/QzuQ=;
 b=KLzSgKYxYc3B1dx469UNfGC+QI8Z7aynfVh8OQyHFHHiyuacfRaqROUbStOlhjrWUNuA+vGNQQyxBCAcmWvebm8WtQRIFbktWUi103Dg9fsf8vZToxy11ahZG9NaKG8oCzQwsMV6R52Zmv6Yg+D1yzCAArhidzhywEQCkA4b4oQ=
Received: from CH2PR07CA0047.namprd07.prod.outlook.com (2603:10b6:610:5b::21)
 by SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Mon, 22 Dec
 2025 04:47:03 +0000
Received: from DS3PEPF0000C37A.namprd04.prod.outlook.com
 (2603:10b6:610:5b:cafe::db) by CH2PR07CA0047.outlook.office365.com
 (2603:10b6:610:5b::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.10 via Frontend Transport; Mon,
 22 Dec 2025 04:46:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS3PEPF0000C37A.mail.protection.outlook.com (10.167.23.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9456.9 via Frontend Transport; Mon, 22 Dec 2025 04:47:02 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Sun, 21 Dec
 2025 22:46:59 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Sun, 21 Dec
 2025 20:46:58 -0800
Received: from xhdharinit40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Sun, 21 Dec 2025 22:46:56 -0600
From: Harini T <harini.t@amd.com>
To: <jassisinghbrar@gmail.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <michal.simek@amd.com>, <shubhrajyoti.datta@amd.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <git@amd.com>, Harini T
	<harini.t@amd.com>
Subject: [PATCH] dt-bindings: mailbox: xlnx,zynqmp-ipi-mailbox: Document msg region requirement
Date: Mon, 22 Dec 2025 10:16:53 +0530
Message-ID: <20251222044653.1757886-1-harini.t@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37A:EE_|SA0PR12MB4430:EE_
X-MS-Office365-Filtering-Correlation-Id: a5fd0d39-cc23-49c0-eb9d-08de41152675
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hK7zbNLQ85PZY79szsXcNJlr0t+2+jmOkc/d3QPzKHJTMwFs0dNDdkvcwD7E?=
 =?us-ascii?Q?PRPj+kG7GzH8+1dfZjoPZhm+EzZdmIea8pYQSx++hIze0abn9pJFd7DvhAEM?=
 =?us-ascii?Q?ZvSr6uaIP91rGApTPAv/w/vWi2i3KmT5PgTk704JZVKuluQ2yKI4WfM/D2L/?=
 =?us-ascii?Q?kVg/Oc9AgXPTKCc8fDJcxptNWEvTg7hfswo0VuG9amSI8oah8lg3VbCp40xJ?=
 =?us-ascii?Q?7cwVY+zZ2yTfKncYa8+vgEbDidBvSjJu6PV1gQUpSsx5WoNLcgit1H9MhMte?=
 =?us-ascii?Q?6sGZmIpIsv7TwJhONDGZPE7kALakZSCKrnRk0MMyvsKGTFXv5l6hDeSM70Vs?=
 =?us-ascii?Q?7irEadktdvk/yGRgq5YBJgI5zqvtF/Ds5jE+Kevsc2TkpljIUV346kVarLHS?=
 =?us-ascii?Q?dMWkNZ+OwSbU8J0V2ql2MhpszuIleYKSVOKzRA5VhGhj4HOaK5RpX+pcTImq?=
 =?us-ascii?Q?pvmiRwyYLM34SuTnB4LAATkfwOxKDaFwJ4JCuOmhBLF8Ookc2k7ozPqkEvUf?=
 =?us-ascii?Q?jaayvQUk60gbpSqwKLUL1QDHtpk1qXvzcQvjwYZPyKsT1zJ1Fsyf0nwdLoGh?=
 =?us-ascii?Q?FAJzjUH4TLGPAzsVwQxWcoMMevQXp+HjREliVP4zFStSXyhxl2A+rU9YxDWh?=
 =?us-ascii?Q?X1UitP0Xc0ZGFxiMO9RvWD0RGJmS9weOi/JMK9XiiDhqn8c+cwe2r0zjPiar?=
 =?us-ascii?Q?dAgD765td/72rTy5jiocX5QkAGbz6Vckbq3soAzPMbtGL0N3B26P5VeU8DPD?=
 =?us-ascii?Q?fRD4XdXJxn8lnyOFaw5I2Id6YO42kW0F8qhVc0W/WlkkCVg5PUa5XrmiEUJU?=
 =?us-ascii?Q?cOx4kXnqC1i3EAX07is5AY2fIOZmjmJDWInhbGSvwaFw7/vJN+9CSFCcFU13?=
 =?us-ascii?Q?eX3FshVgvCPMXVMjRqRp1tPWxn6nasQaHh8oMyZEGx1BW1E7dEANUZLm1grO?=
 =?us-ascii?Q?lcWDAjGJQz4UjLm8TNQoMgHqZ3B/4KLulNtURY7QxABjuuT1n2eukFpNk60T?=
 =?us-ascii?Q?+K7/5YclxvFAOX+DJ7DVWPbhF39QkuZKxS5LuRRrNZLNxWWX7S8M8S5Fv6BK?=
 =?us-ascii?Q?kBIO6yLzv2Lk13f1ICD/jr3uf0AtnNXtJ1ETaskqI6CMQ7Gl+w+L4cJtUEpY?=
 =?us-ascii?Q?IcWyXtyY/7XW1u8PYmj6vbFrKQpYcbuSH7ucjqFt4Z/ZghTM/+8yxBSB4MGz?=
 =?us-ascii?Q?tTDYAHaiBzPIhbCAckfrapjfu72VjxFpPdkZyDkGht4LWKPYS9PzPnhLFBkM?=
 =?us-ascii?Q?pkHQ6E3YN3ttkkY843uTGZQoN+m+BCSazsTBmwDaO0W6G2UNvCgBbszeg5Zj?=
 =?us-ascii?Q?q3DBqxPypxRmHz8+5+oMtTJr4M/aKnK8j1SZcHAWD+Xg9c99T3Xw3WNYDZoa?=
 =?us-ascii?Q?B2HssMnfeym+3kelDHC8aMRS0qUMd+oCzlZEyCZGsz2Smzi6N+CoIIYyuqh5?=
 =?us-ascii?Q?Tzt/aami00fKE458gcqLP9+h+cK19DTb3Pj08TX2WeHr3EFnU4TcizZDu5oF?=
 =?us-ascii?Q?9RKSsPCuQESkR/N/D3CPSxlrW1+82hJRYKZPgIUB4ldETMdBBFKR7507DPnN?=
 =?us-ascii?Q?mWql6z4pJ8/IQ0bE2mM=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2025 04:47:02.7930
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5fd0d39-cc23-49c0-eb9d-08de41152675
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF0000C37A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4430
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251221_204710_942506_F30E3AD3 
X-CRM114-Status: UNSURE (   9.21  )
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

Add description clarifying that for Versal IPI mailboxes, both host and
remote agents must have the "msg" register region defined for successful
message passing. Without both, only notification-based communication
works.

Signed-off-by: Harini T <harini.t@amd.com>
---
 .../bindings/mailbox/xlnx,zynqmp-ipi-mailbox.yaml           | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/mailbox/xlnx,zynqmp-ipi-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/xlnx,zynqmp-ipi-mailbox.yaml
index 04d6473d666f..8fdf77c7935c 100644
--- a/Documentation/devicetree/bindings/mailbox/xlnx,zynqmp-ipi-mailbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/xlnx,zynqmp-ipi-mailbox.yaml
@@ -165,6 +165,12 @@ allOf:
         reg-names: false
 
     else:
+      description:
+        For Versal IPI mailboxes, the "msg" register region is optional.
+        However, for successful message passing via mailbox, both the host IPI
+        agent and the remote IPI agent must have the "msg" register region
+        defined. If either agent lacks the "msg" field, only notification-based
+        communication (without message buffers) will work.
       properties:
         reg:
           items:
-- 
2.43.0


