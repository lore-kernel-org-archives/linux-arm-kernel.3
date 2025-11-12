Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C5EDCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 08:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ey6LDiXkumCT+pUbQCWZsNxNHeWFqIF+kAZraexImRs=; b=RZd91D9Wd7OBlV
	vBhN5npkooQl8SCDcrkSuhTbnecZZrzBxNk6rqf9Ttj7PsrfuAIwxEcugLmIBHqVxssvgGbY6Pwc4
	GnnqZHOynV+Qux6MP0r00er/FLkxkchuC1m1XKA45+HDWt5PNTzTVArq1PIPgTo/dsw6SGVxNsOkx
	OWfO1mKBmXCRpyBNAkphq+wwPuAbI0UUeoD6NIvRhAiR1mB7KR82Do8F+qvA/TfiifkPbml9xupC1
	ib6q4B6vSMxdpRBaAq2kPhmBjacsGPiJcSeE13mrzJtlAmgI9+PeUpZrneIGZuXSPtB9mU+Lkgwh4
	dlav95dMQwYzJLenTLHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ6G3-00000008M2V-3yxs;
	Wed, 12 Nov 2025 08:31:15 +0000
Received: from mail-centralusazon11010070.outbound.protection.outlook.com ([52.101.61.70] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ6Fv-00000008Lzz-2i1Y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 08:31:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bEbQi6YcZjwXiT/cf5q4UC39g0bjwGcvZ21wlhx889A49vWi5oFNpqRqHzbpAgswygsfFsdo3BRZyp4vWuadCgQ8ae+/ivuWdWH0jE6lSe9wcSNT0ePw74wMmFYE+Um10w2YXUMp4neFkqwVTfK9aPe4sA5N+gaBPJZdEqrCus+LI6DtL+cE28Af67Wzhp+YBaK3KifdqyYsBpcj212m+N5C4Lyt9fQwMhV2XVSyaZWlZEfOcmsoeZ78WyqcVhNrzLMcbLYbkZVWywNynkHOX+5pRsggS2WjNMvszJz/d5A0/Ldpjsh7DkYDJCKoAiltuHPmmHE/ZoVkgIqgZ9tomQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ey6LDiXkumCT+pUbQCWZsNxNHeWFqIF+kAZraexImRs=;
 b=audjFuuiwdWk2q0gB5gTh/MOKNsKsylbea7Eqz0KCcEInNwwxQtMOrk6/6ECt2VGh+dpMcYST9JaRRQnDNi8x9zS/UqdMCXAa5NAigQUvzhr2de57iQ8BdXoRuq1DNwCqh10XLfpitthEwEF3HIzpEvwLv6gWUX0lpVjjzrJgPLgfhXXB9mEUr/zYPS8HKqaC6duRvQD7zm2CW3lvuIiKYCosapBm338NJJlLbYpCIwOWatBigvhYzT6bkX3FvgwnlKzXOcpzKFhu12PlvcU3ikICn6A9vcPc5uVeclCwulHLXlaeKzx4RFzO4Vw7rkQ9zrQepNqihN8gtECupSMhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ey6LDiXkumCT+pUbQCWZsNxNHeWFqIF+kAZraexImRs=;
 b=oeEHGkTzW+QgDPOYWOYxCVtmrvE5W+BB/di2Md7VUZQWjD582qaBTQtT4s5sykPrl1W5DL5hbM9MCwBKjBqyfD27T9ibnCtja/IkmjtThjRMvSCr6CJkMueIQ9kk1LDRuK+kfrJe5JI3M0+91VyhDsm8usYRhocPJjrrVtnbCM0=
Received: from BN0PR03CA0026.namprd03.prod.outlook.com (2603:10b6:408:e6::31)
 by CO1PR10MB4513.namprd10.prod.outlook.com (2603:10b6:303:93::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 12 Nov
 2025 08:31:02 +0000
Received: from BN2PEPF00004FBF.namprd04.prod.outlook.com
 (2603:10b6:408:e6:cafe::21) by BN0PR03CA0026.outlook.office365.com
 (2603:10b6:408:e6::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.16 via Frontend Transport; Wed,
 12 Nov 2025 08:31:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN2PEPF00004FBF.mail.protection.outlook.com (10.167.243.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Wed, 12 Nov 2025 08:31:02 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 12 Nov
 2025 02:31:01 -0600
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 12 Nov
 2025 02:31:00 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 12 Nov 2025 02:31:00 -0600
Received: from localhost (dhcp-172-24-233-105.dhcp.ti.com [172.24.233.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AC8UxtU2389830;
	Wed, 12 Nov 2025 02:31:00 -0600
From: Anshul Dalal <anshuld@ti.com>
Subject: [PATCH v2 0/2] dt-bindings: arm: keystone: ti,sci: add entries for
 boot mboxes
Date: Wed, 12 Nov 2025 14:00:52 +0530
Message-ID: <20251112-k3_syscon_add_boot_mailboxes-v2-0-aebc1e47b391@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALxFFGkC/33Nyw6CMBCF4VchXVvDjJbbyvcwpCm0yERhTEsIh
 PDuVuLa5X8W39lEcJ5cEFWyCe9mCsRjDDwlou3N+HCSbGyBKSqAVMnnRYc1tDxqY61umCc9GHo
 1vLggi6vCxtqyKDMUkXh719Fy8Pc6dk9hYr8ebzN81x8M8B+eQYJUWBrMO4Q0z24TnVseRL3v+
 wcAhS+pxQAAAA==
X-Change-ID: 20251105-k3_syscon_add_boot_mailboxes-8452bdd98962
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, "Santosh
 Shilimkar" <ssantosh@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
	"Anshul Dalal" <anshuld@ti.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762936259; l=1180;
 i=anshuld@ti.com; s=20251022; h=from:subject:message-id;
 bh=68FxSSMF36gqwG2iIUMfVvcnWtjX1Dmj7OBqO+Nn9uk=;
 b=tTdyiO5tHARSufrm0GtB4VZFEWlFNtEk6Po4AkvfVx+zlhxwJiMrFoACSWbCbprZxBsEiOO4Q
 8GLWYVblVO9ANUHCFtIaD9+XnLi4AJm0ndQkCz9fKLfjFNSLyN5Fk/U
X-Developer-Key: i=anshuld@ti.com; a=ed25519;
 pk=Kv8FlQElcrR6efyEHmjtE83y8e0HKvqPyvVY+PJ4UFw=
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBF:EE_|CO1PR10MB4513:EE_
X-MS-Office365-Filtering-Correlation-Id: 942c2fbe-7c6d-44de-5ce7-08de21c5d066
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NEhtU3J1SUZWQ3J6U05jVnROd3MrQ1k4NHAvVmhCUjFnVkZrdjVoRHVrUDl6?=
 =?utf-8?B?UkxmRVNoRkNBTzh6S2phaWRVUEw0WlYvUzVsTzJDMjZuRVRmUTJhaWlHNlQw?=
 =?utf-8?B?T3hlMlg5R3Q1dE5HbnM1a3BIRXJyMG5yNFRPc1JZYjByMHI5bHM1MzBvMnp3?=
 =?utf-8?B?UVhSNXpJdGNhRGR2eEJOMzRGSjdoUkIwZW5HZFRtdmR3K1pqU3hvSk80aXpQ?=
 =?utf-8?B?dlFHeG1WaWExdFVsSG5Uck9DSkVualpROUMwdi9hZERWV2NTam1wZHFDN082?=
 =?utf-8?B?Y0lCR0IxYlZzdWEzRFY5b2d1TUtackVORTd2WGxVeE5Bayt6N3hNUDFMK2NQ?=
 =?utf-8?B?TG5CNytyOGNPZTMydktVRkUycHZ2eWRuVEdyRFFhRDVXQzRGV1dscEVwUHdz?=
 =?utf-8?B?eFBrQmF3c0k2S0lPbkxUT1JsOVFYQkdYN0pTUis0bXV5V2QzdVExSGdJYTRs?=
 =?utf-8?B?aHZnZ1YyYlMyL0JCTUpTbXE1RnY2MkVJVmVaYlgxZkZxOUNBakZhS1BrN0ZT?=
 =?utf-8?B?cnBXbzZWN3ByUGppdGV4L2UvYmJ5K1ZkTmMrVUovY0U5THFWellydUdza2Fq?=
 =?utf-8?B?SkorZmxKM21MZkc1RW45MTVWMksxbkEvanNuUUt3UzRyME1CWWdpSEhmakth?=
 =?utf-8?B?NW40YkN3Mm1OQVNkemRadHliM3poRXVGM0E0dFdadWQ3Z2YwU0RCQzd2YU4r?=
 =?utf-8?B?QkcrRWRqbXZUS0o1YzQwVnl0Z0ZRT2dwcDMvTUVxelJleXEwdi9pZ1YxMmY0?=
 =?utf-8?B?ekIvb2o3TXBzUXZSMGs2ZHpLYUVHSlllQms3eXlNQ2xEb2NNUjJCWEhwTzZF?=
 =?utf-8?B?TFdNV2UwTk9rR1lWalBjS095VlczbURjdXBRRFIyV0pkTDJhemlHTWpBYkE0?=
 =?utf-8?B?MUhLL2p6aEtEeXpiU3hJeGovR2RJbThKRVg1UXVGSzFRKytVbFVOWG9QbGkv?=
 =?utf-8?B?SDdIY1I4dk9RYlpLSC80Tmc5YWVYQVJHcHFxeVpueXlDMTJmeStOUlU0RkZL?=
 =?utf-8?B?aDlacEVYT2tjMGZmcC9ROVhLOWFrZG15VmNIRnFMN0p3ak85cS9OMVJyS3d6?=
 =?utf-8?B?cE5Bb3YycjF6TG5HUTdDK1RrUnFwYy9HcVVzZ050Und6K1VvTjU1K2t5d1Ux?=
 =?utf-8?B?NVVDVW1icXZEbmR1KzhscDhaRTFmd1I2RWFqRW1IaWR5NlFLSFRtT1VrMVZx?=
 =?utf-8?B?UjJMUzBnall0OStJQlcrYTZPYW12aHZiYUUyQVJSOU1kS21xSzl2L1BEckJI?=
 =?utf-8?B?dExDTGJzWFNpVmxpc0pPQXI1Ujl6cWgzeVVXYnpSa0MrM2MyZWdJMGo0UmF4?=
 =?utf-8?B?RUJQTUVYQWkxMmp5TW1lS0hLb1ROdFVQczg3dVZmcVhUajJQeG5SUDlNSXUy?=
 =?utf-8?B?MVYzelYwYUdYa0tDWHFsOThzWmVCMi9vMGt5OGdOQUZoVGh4Nm1RQ05EUWMx?=
 =?utf-8?B?R2Nwa3BpQ0ZpUy9MclJwUE9ERXhqNUNpRTIxdUV0a00ySDZ0SG5ydCtLRDQ3?=
 =?utf-8?B?K3o3STBmRGJ1Smc5cVlRQWU5NzBkYlg1Z1VRL3FOdkZuWTBUUWRXd2M3dTZu?=
 =?utf-8?B?aGJJZWRVa1NvSmRQd0pzdVRGM2FialR2VlZtWXcxUnhTemw3ZlpJWGE4eDVB?=
 =?utf-8?B?MUh4WTJTVUVoWTRYenJOdDBBSVpGTERRM0ZyT291Y0d3N3pIdDV1NytRVTV5?=
 =?utf-8?B?ZkpTK3FnUkhlamY3OUJZMTZ5YzVyMzloT3dXaXJHNHJDMk04TC9PYkJ3eTNR?=
 =?utf-8?B?TGZOV0Rqa3FqeGN2YVd5S040M2J0bW0vMnU4aW1TMUd4amhkU2FsUERpcldr?=
 =?utf-8?B?aUlSSnRnUkkrb3JjUXZBSnlNYnk5ZzRVUGlMdXJFb3NSeXNPYTRacGxBbDc5?=
 =?utf-8?B?cUxKaUdMSVVRRWNsOWV0d1Z0SFEwdERHcDY2RWEvTEg0b003dThjMy8vVlBH?=
 =?utf-8?B?SDBhQ2Rrb1pPc1NqZDNxREdhRjJRdVNsZE1RZWN0a1lOeXhUQXV4UFIyWHdu?=
 =?utf-8?B?Mzg0VVc1SHI1YVIxTkNhOHZzbkxtaHFqbml2TUw1R2ZVc3ZGRmlJcHpsT1ln?=
 =?utf-8?B?WTVnaTJ6ZWkyanZzZHB4NlJYc0ltbzl5UWFraVFWQTZpQmlxbUx6TkQ0dEwz?=
 =?utf-8?Q?ReY0=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 08:31:02.0710
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 942c2fbe-7c6d-44de-5ce7-08de21c5d066
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FBF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4513
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_003108_385326_A1A2B2B0 
X-CRM114-Status: GOOD (  10.92  )
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

K3 devices use the system controller HW block to run the TIFS firmware,
currently we document the RX and TX channels only however before the
firmware is loaded, a different set of  mailboxes are required to load
firmware to the HW block.

This patch set documents the missing mailboxes in the binding.

Signed-off-by: Anshul Dalal <anshuld@ti.com>
---
Changes in v2:
- Remove maxItems entry
- Remove RFC tag from patch (added by mistake in v1)
- Document the new mailboxes in mboxes instead of mbox-names
- Provide example with all the mailboxes set
- Update commit title to have "ti,sci"
- Split into two patches
- Link to v1: https://lore.kernel.org/r/20251111-k3_syscon_add_boot_mailboxes-v1-1-529a27f21076@ti.com

---
Anshul Dalal (2):
      dt-bindings: arm: keystone: add missing items to mboxes
      dt-bindings: arm: keystone: add boot_* mboxes to ti,sci

 .../devicetree/bindings/arm/keystone/ti,sci.yaml   | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)
---
base-commit: 4427259cc7f7571a157fbc9b5011e1ef6fe0a4a8
change-id: 20251105-k3_syscon_add_boot_mailboxes-8452bdd98962

Best regards,
-- 
Anshul Dalal <anshuld@ti.com>


