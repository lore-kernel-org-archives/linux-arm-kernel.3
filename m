Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA79BE9A02C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 10:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qtFL4Gr+NMzaKnHrqDZUrr3yZyC/N+sQXSv6Tl0FZWw=; b=VjP0ketQF+9sbZhPTbUhxrRjeI
	1GKB2ZCgBK/p/iAkCfMuMgolxldjYhJtUlWvr8Q4qwe/ImXJQ01PQfddnCLtPUjsxpVPBVp78+hRq
	OQ7f6jqOf6hRrQmRuokiriciF2RwpuDNOTbfQo165Qcf2+AuosM3H3NGYbw9am5jKJgPRxoTFP5ma
	jJW7EGEg9v7PHRubkDEDn06Mv8pPCn2rSfJ/tokTKtB7qspov98qJH9fESiF926NxvsSmHpAgb8SG
	cCHfNkGK7+QDFPDmw1YMzvPRflvFWGA8rHAcSRNS4anLZsqRkS6040EsEe1oYg9OVzmHsZ9kVQ1WT
	jni8Itew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuTZD-000000005rP-2SaG;
	Mon, 23 Feb 2026 10:53:31 +0000
Received: from mail-westcentralusazon11010057.outbound.protection.outlook.com ([40.93.198.57] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuTZB-000000005qz-1e5J
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 10:53:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DlFg1dD/PVF/raEnScGgvpwG1G9JgYaUHoqJ3+LebLXVxJiLaAi0XyWDkHhfC6hr+F6SHQCoY/tELeoIhBe0n9N+jf/TblTe9e/atPn1KAW8wJRZwe47qU3SrTTAj5GCaBrp5pzLarOO2JVXJjJWUu47K6ah0J0nvdiIS3cEzZ36u8hiHY5kRcAeavqwkyISwJq/OpFVqqFRjEpME6lOz79uyMZM54/lEKfe+aVx5f19BdVDzUPHcxLixQaDI8HpmZaQqjWk/oL76EImCTYv3jfjhy4CT2Tbtv15ZfUr+xAXYidcmjwT528oIxlEyLhVLGG/yty6x6B3vM7E74eFJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qtFL4Gr+NMzaKnHrqDZUrr3yZyC/N+sQXSv6Tl0FZWw=;
 b=GRhyOMtza2YViikFEA4tAbNJKYht55ILWsp1FCXFheKnfLvdP2Gdz/OBrqycP5K3u3h/JfFIQN6Gub1B5Fv9EsekuIZ1jPic5m+qTm8AAreC56Kmnxa0xlDZANPtJRTgnwahvdiiwYtuUu8N9Hxqlud5k9yryVO26NfkTYWS08Oah/7pDSDGAD6SgxH4oUbjVjLImKdwtGQTErHwFkj92l+Pvt7ogvsCPzKi9mn1to3SqDoK2BAAGc6HnX4Cm189pIVdptw+VdvxUjZjBbxLZ7Bfg6b9VG3EZHNew4giVT6KpFkGM6uo4pFQoq/9DLgx+8WnEIsp7l5WX/vMySteMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qtFL4Gr+NMzaKnHrqDZUrr3yZyC/N+sQXSv6Tl0FZWw=;
 b=EYmCNQWcEA8yQZMXTNDrhJtu7Q0wCMQ3jxYtuzgnHrfmKFC+3lOcerds9oAgq+xT1iYhOoyI674wQWRDLakqhzMscp0yRIRjQQy94S134LRg7TebOFHW1WUSeLPj3/PFTgbLy+I9gZcXTGfPrI0LNecwH7Vuqkw5biL9DQT135c=
Received: from BYAPR11CA0103.namprd11.prod.outlook.com (2603:10b6:a03:f4::44)
 by CHAPR10MB997747.namprd10.prod.outlook.com (2603:10b6:610:2f6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 10:53:23 +0000
Received: from SJ1PEPF00001CE4.namprd03.prod.outlook.com
 (2603:10b6:a03:f4:cafe::c4) by BYAPR11CA0103.outlook.office365.com
 (2603:10b6:a03:f4::44) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Mon,
 23 Feb 2026 10:53:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF00001CE4.mail.protection.outlook.com (10.167.242.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Mon, 23 Feb 2026 10:53:23 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 04:53:22 -0600
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 04:53:22 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 23 Feb 2026 04:53:22 -0600
Received: from toolbox.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.73.74])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61NArIFD179443;
	Mon, 23 Feb 2026 04:53:19 -0600
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <srk@ti.com>, <s-vadapalli@ti.com>
Subject: [PATCH 0/4] TI: k3-{am64,am65,j7200,j721e}: Add ti,min-output-impedance
Date: Mon, 23 Feb 2026 16:24:11 +0530
Message-ID: <20260223105448.1110428-1-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE4:EE_|CHAPR10MB997747:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c76bef0-e947-41da-64e5-08de72c9c3cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4RBVL8BUvjwC0uP2iOQ+BW8BVPRi99vK/gh5UrlVJno4dPc8l+ypeRpSAD7a?=
 =?us-ascii?Q?nAk/Yh/1a/wPcpj0vs4wzDBDjseSeuUCbfJ1KiD+oB8OUxYLtLR6VH9N0IJc?=
 =?us-ascii?Q?jMF2Qp8zcAxcwhqPVYLZcUKRbwfdALDyUj1hEHLAni1FQkW8X76EwS20WENG?=
 =?us-ascii?Q?zm+rPe9HZyI55rn1g5F+jLxK+eozIKuntlSxttwVCpToDx+Qfo56sE4BDrLM?=
 =?us-ascii?Q?3UGzZvYqD6o6UBGcvcrcdxa+39EB98LpR/g5mqiPB9ELke7maaP9wQMn09pR?=
 =?us-ascii?Q?lm3ScfqPnY5ZlApkuyF0ahZz4u6rwqgXbxh3SP41yQDRs8CTvbooZx8ce2iV?=
 =?us-ascii?Q?dgwzCbmTbdFoNT7NRakMJx21lmER+Vk+wpbW6ZKJzvr/OWXNBvPrALQ21GJ+?=
 =?us-ascii?Q?QWRemM4JIwl3dAQ9LwhC5OhlK4hymlEGTc6PuDP23gSoa85/pKXAEcwlkv7E?=
 =?us-ascii?Q?OuotTs0/PDx0IFlDPbFS3AzO1FcUQ6yL5c6+frbPvR5W6kT1GOhj+gypra3X?=
 =?us-ascii?Q?YxVjCDOVA5whxPAD4JwJVAqkcNg3zjCcLAp8qfpQDUU7ZvWaPMbGcuBbtMEC?=
 =?us-ascii?Q?imY5QDVMh7dlE984BHgpKa+SwJ2DpcQYnIs3ZoWOLNKDhnPAcmLT7oC4k2vP?=
 =?us-ascii?Q?9xQ2GvbPF3vr4/oCJsgUN6PUvmWKRqyTC3IwVqOM/5+dC6nWpLEvGnDJXrEo?=
 =?us-ascii?Q?nZPYs/IM0JAzNLDfYvTIeBFW1+771Q//m/9K69DLnB36NUl0jUX3QypAg7hj?=
 =?us-ascii?Q?7t6dUsav/FE2bjivSbRVXS8KddpFIAHZvJ+02lq7PUUBn/Tmuimi6NdX+68O?=
 =?us-ascii?Q?U1GQxRiDOshmDIdyN5hxlpq2gXxKbEgTFDy8po+xnX0d1c2N65uD26EYqf+r?=
 =?us-ascii?Q?t/Ol9dIkVjTivZVpQtEHjJRdntSMkJUtmKyWzw7A9bblbxz731ElVN8NJevD?=
 =?us-ascii?Q?XxL0gnQkHD3hSV0+PEr5Hf96lmHjc1/uTxfE1AO2CI8RVVsEEAHrGkUwY6QQ?=
 =?us-ascii?Q?btS8PGVKU3WVR5qC/csqNUNbCyMpsV90q5xyml+zIHlVS2PsoW7EUp9BOdnq?=
 =?us-ascii?Q?cnN1k+tYPzjvgsYnmjBj4pAgTXon30KKgzJTb8ojuwVvbV8EBV/mHpM8JHA4?=
 =?us-ascii?Q?vw1GhO+vpXSAsSXUPWZvZpxeWbeOA8PQZeSOO2Xdxnx0bUi99sXbVYNDvpux?=
 =?us-ascii?Q?FTyqckYTnGagEz+seFNpDzoNAujsgD7ANzxDKaM42aYMMqsVs0nSZK/gca51?=
 =?us-ascii?Q?yJuhH3t5Rq4yiHQTQ0bSwXgU0ZFet6eNMs0PpFRt/e7Fjrig3BDZRyES2idW?=
 =?us-ascii?Q?u52SwbNHVnlqA888S16GPaxm0EkQWLnS+7jqzhTmor4HUsCeGp9ERnKUVKPU?=
 =?us-ascii?Q?yvt/9wEVXjZIg4X9USjXzMBpkcE6PbZnAwNjx1ER9hCJfvt3jPDtNoucoExu?=
 =?us-ascii?Q?2RJJrQnMQlS5fn0+vz4BbYr1Y/7nvlhS64tM4acxV2OkOlv0KrziWWbKvHqo?=
 =?us-ascii?Q?3LccFO1NhEEsraOsfwKEAzOpa3DSiaI5SWmjntP8Gjd2BBST84LcAIU4wLg3?=
 =?us-ascii?Q?sZ7Gi4gKFkHE3xAmHFjWrsYWtSt99dqUPgCI5zazMfVgXA5+/OYJZrgNNrvk?=
 =?us-ascii?Q?9UZZ5BLPqy1dloDRzz5Vo2i9Kbq7mVjnbtNQ//az+z5RQBgkgrcfQgNJaWLB?=
 =?us-ascii?Q?UvF+XQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: LnF5aSPfHhwcHH3gBNjLUCoVI39mTREAtFOAu03B2muJ5Me0VK9yIU0SOB+uY4XGaC3nAKrAtRHSxDhcIgHEqolqPC0s+1jf3EovtZk3dpCDR91Df2J+kjh+y28wn5SvMVjyVDis+2FCfPTOJ3CKo4HXIw/lGH369BOKEYv7SptuDKWoPwZQeeNRVx1QeTX+u23OLs6rtERST9xYH/IMFqQY0mutBokSdv+zbD3uIsh8V7oS+Ovvf2MOE8TebHEXq/IPciy70N/KC7L/3l/tP9u0KNnehBz67tct6ZPpgdJG1PgqHBCjrdCVL2+PBtDjhJV0j9U8heFIImT4JCUT7+7qnSdzxu6i/GEuuYQZ9+msJggcx6ktCiY8eCUgSi2qJSWE7AnF0mZaGHgAcZvxcuJDVTZMxRzU+dXbZjV8GGNjRMY1ssI2c3NsFDJAqjn6
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 10:53:23.1000
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c76bef0-e947-41da-64e5-08de72c9c3cf
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHAPR10MB997747
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_025329_480558_D5D5A867 
X-CRM114-Status: UNSURE (   6.91  )
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

Hello,

This series adds the "ti,min-output-impedance" device-tree property for
the DP83867 Ethernet PHY present on the following boards:
	1. AM642-SK/EVM
	2. AM654-Base-Board
	3. J7200-Common-Processor-Board
	4. J721E-Common-Processor-Board
The "ti,min-output-impedance" device-tree property is used to program
the I/O Impedance Control of the DP83867 Ethernet PHY, with the
impedance of the MAC I/O lines to/from the PHY being lowered to 35 Ohm.
The board traces are such that the default impedance of 50 Ohm results in
voltage undershoot on the MAC I/O lines resulting in CRC errors for the
Ethernet Packets.

Series is based on linux-next tagged next-20260220.

Regards,
Siddharth.

Siddharth Vadapalli (4):
  arm64: dts: ti: k3-am642-{evm,sk}: add ti,min-output-impedance
  arm64: dts: ti: k3-am654-base-board: add ti,min-output-impedance
  arm64: dts: ti: k3-j7200-common-proc-board: add
    ti,min-output-impedance
  arm64: dts: ti: k3-j721e-common-proc-board: add
    ti,min-output-impedance

 arch/arm64/boot/dts/ti/k3-am642-evm.dts               | 1 +
 arch/arm64/boot/dts/ti/k3-am642-sk.dts                | 2 ++
 arch/arm64/boot/dts/ti/k3-am654-base-board.dts        | 1 +
 arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts | 1 +
 arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts | 1 +
 5 files changed, 6 insertions(+)

-- 
2.51.1


