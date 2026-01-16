Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 334C4D489A3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 13:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=T6aGvj8XUcgpJs+f++jE/E9QnmUUhj6Md2eb1e6FvkY=; b=EnClrSOqC0tAUk
	ujPwjbnm7R96gbg/g4cpaceOygO4MdVEimeUl6kCMq5Ysa0e4R+T4lAY9x+YKj2t8evDCqSiIDtzK
	PnfVHBX6fZs01ZDqlW0wSuLAvmxmg2pxxaoTQZw/WlhbMafnsSocaEmbGVo4xX84ep8QSLQyyva7O
	VuSPsV24LzV97OXfMrRk5XZHfcZYsKuS1b32xDgWvih0U8hpML1Uac8bF+YDTKtDVLRqdrd3RaljS
	TVE4q0AgXanFkQ0KrKSJvNMwpRZBZly7lbsqSLk8PUfYnd3q86v9xcm7pDFi5X2sW/iHjnrUc59Ic
	SMzJLT6tkRp7aU6WXkRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgjbk-0000000E9SB-2wC4;
	Fri, 16 Jan 2026 13:11:20 +0000
Received: from mail-northcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c105::7] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgjbh-0000000E9Rp-1v1a
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 13:11:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P4nCgbojFL702Yl/yCQ1nHHQxylFSuEO5RAgx4i7D9IOYc+LmdktXexXMyYhUgH/OpKO0XXwVOXQSp3JmfPp8/skW8gr8a2wjF8iGs6D6/qTNKOz2h01lxNv7KJWqUiTB6KIop5On5+hyO3D2d1y58wsLzeDA0mr6zoTj+B+RvkYeeqRkrmY6/+uoICxOu5lXjE4hPMsNvnIGB8OSK5+/cfXq2JTjGkhqHaYb1ZbjXWYX3xLPfRhbafC8ajYsflbBcSUY3jk2mlIYy9ER+d0lKOfrXqfhhPEWdvmyUpszRh8f+ztAVMRkWUieYWRHEBXhH4euf1QaydKcOSFph4nMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T6aGvj8XUcgpJs+f++jE/E9QnmUUhj6Md2eb1e6FvkY=;
 b=TnDQoUMsGR7wCxY7MqfSnfjce9OGSMPQOnEosulwV8t9bgnWD5GoUpMJoj/ihI4uRcq8gX9O0nqgpIUDXQFWN+TWWv3wi9Gu1a7S+D7xqD32vZMY33FoANmcMvCX4unYIwegTdMSiVIUf8GUlB6ioNY3WugnHLysY6nIYY8dP0iE8FpzBwbwMc8xG9rxXoq5WgtI3Iww1CWnRp/OXVCLOKFJS6f1QrSy+PwsNaLNEIw6x/dsDHWOosgZtbO9G8x4SzzcQnKaI9zsRbZjE503EYNCthh32ornKA622JZV0RRjK/JVJALunq/K6UauD7muGGTKu7UQ+bMDltL23tIsuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T6aGvj8XUcgpJs+f++jE/E9QnmUUhj6Md2eb1e6FvkY=;
 b=HRaJPzKEtxVr52H3pBcMeBswqhcnASwlDMiS28gTtbGVgUFYzCqYxfhHw5OzWIcIgXBxg13fUe7UbBUCds78g7Peby7nOhYpPioGfMDA/Z7vrPotBXpm92FeiZUq4WuJfqa9HQPsY7WnwmD/pmrxOPP/hfMWSoqOPspaBMz0EVs=
Received: from DS7PR05CA0042.namprd05.prod.outlook.com (2603:10b6:8:2f::29) by
 MW5PR10MB5852.namprd10.prod.outlook.com (2603:10b6:303:19c::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.5; Fri, 16 Jan 2026 13:11:11 +0000
Received: from DS1PEPF00017090.namprd03.prod.outlook.com
 (2603:10b6:8:2f:cafe::6) by DS7PR05CA0042.outlook.office365.com
 (2603:10b6:8:2f::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.2 via Frontend Transport; Fri,
 16 Jan 2026 13:11:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DS1PEPF00017090.mail.protection.outlook.com (10.167.17.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 13:11:09 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 07:11:07 -0600
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 07:11:06 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 16 Jan 2026 07:11:06 -0600
Received: from psdkl-workstation0.dhcp.ti.com (psdkl-workstation0.dhcp.ti.com [172.24.234.127])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60GDB0HF3181044;
	Fri, 16 Jan 2026 07:11:01 -0600
From: Aniket Limaye <a-limaye@ti.com>
Subject: [PATCH 0/2] ti-sci-intr: Support level+pulse interrupt sources
 together
Date: Fri, 16 Jan 2026 18:38:40 +0530
Message-ID: <20260116-ul-driver-i2c-j722s-v1-0-c28e8ba38a9e@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFg4amkC/x3M3QpAQBBA4VfZ5tqUHfL3KnKBHYy0NBspeXeby
 +/inAcCq3CAxjygfEmQ3UfYxMC49H5mFBcNlFKRWlvguaFTuVhRaMS1JAqYVxNRVtW1GxzE8lC
 e5P6vbfe+HzkmfL9lAAAA
X-Change-ID: 20260116-ul-driver-i2c-j722s-48f223899dbd
To: Vignesh Raghavendra <vigneshr@ti.com>, <u-kumar1@ti.com>, Nishanth Menon
	<nm@ti.com>, Tero Kristo <kristo@kernel.org>, Santosh Shilimkar
	<ssantosh@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Lokesh Vutla <lokeshvutla@ti.com>
CC: <j-mcarthur@ti.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, Aniket Limaye
	<a-limaye@ti.com>
X-Mailer: b4 0.14.3
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017090:EE_|MW5PR10MB5852:EE_
X-MS-Office365-Filtering-Correlation-Id: c87b1604-cd0b-4dd1-0455-08de5500b74f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|34020700016|36860700013|1800799024|376014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dzVDeW9nZ2VVQXZLZDNZZjBYZGZ4aTkvMk1pZ3J2QzVhNHR6YUZjK3ptcTBj?=
 =?utf-8?B?ZkVzeG5NQ3BUQnhnYmhQeVU1Sk42ZkJoWi9xekM5S3dVZGpFVC9WdE03TXZT?=
 =?utf-8?B?K3NzZjBmcGF0cGV2VEsrcU5pdGpmZ29IU1p6VDhJWjd6Nmt0WWNuNVBTOHF6?=
 =?utf-8?B?emQ2dXJFYzZsWG9LMXFIbWdKYzhLS2g2a1dYZFZiS1FOSFVzU0dWK1h5MjFN?=
 =?utf-8?B?L2dqMS9YOGtOK2FueXlUK0J3N0RMNkhOV1VoTW52L1d3cFJpOUVVckhWeXlr?=
 =?utf-8?B?OXdBa0U4RFc1TFllejJzcWZ5amhCQnM2dGlUSDFQVkJnQmtZek90WWFZZ2tB?=
 =?utf-8?B?NGd6MStma0VQRHUxK1ZNZTJTZU9ac011V1ZlbVMvRFBoVUdPaXUrMDZIaU5G?=
 =?utf-8?B?WWhwNDJHdGZSdDNMYXlzcUU1V0dmMDUxRmtrejJXSmdPdEd0Tm83d013d3d6?=
 =?utf-8?B?WWZBNGdVWEExajZIeUVySE85di9xR0FZUm92VW82MTlCUy9wSUtwRUdsRURD?=
 =?utf-8?B?RHM4Y0krcFB6ZmtXLzhUdlk4b2dLeTBoalNRMDZGZ0dRR201YnJZMS9wbHJw?=
 =?utf-8?B?bTV2VVpKVGQ4WG1Nd3RldE1CcDhyUUd6bVlZOGRxd0RlNjJmRStYNEsva0FN?=
 =?utf-8?B?a21Ld2RmamM1Z3FKOGpTM2hMM1AvL3JqVkY3cjkyU1RURjFOWFBOYzdDQm5F?=
 =?utf-8?B?Sm9uUVFvb2laeHllTXp6V1I5dHlmYXRTVGtlSGtoS0VhV1oyWk0xL0c1ZWVo?=
 =?utf-8?B?S210NUxJYzZveWdXcXdmc1NiUUlWWUFkMzM2bGhvUlVGTUFTeHV3aHU3Q0Ux?=
 =?utf-8?B?MkF0NHdnTEFIek5JM1l0WEtvUnZYdnRNRFBpYWU1UHFCWnlGeURjZXZUQmUy?=
 =?utf-8?B?LytmRUFyOFNzVXVOc25GUFJDQlJ6ckRnSTU5RHR5TnU1SFpSeS9wSUw4Q0FB?=
 =?utf-8?B?VC9yd20xN3JTVjdyS3B5RUZQOUYxQmd3NTFhcGE5bE9EbENQTDlMVUw5MGJw?=
 =?utf-8?B?dEVYYkJmbUw2SWE3RExxVlg4Y3k1Yi9abG5HMlIxTWFHZ1BsNFZvNGlwWEZh?=
 =?utf-8?B?bXdhVmp6L21oZnJkSi9uOTRTTE1XQjdCeDkwbm54R2VjNGlEb3JObnJMampT?=
 =?utf-8?B?Ry9LamtxSDZDWWM1MEhISk5lUE5kMXZHUFhpV25WMS80MUJCcWNSb3dERWJ6?=
 =?utf-8?B?MTJVRnFPa3N4RFRpMVNOVjZSNnVrMFhCdkN3Mmxia0VzYWphR2g0Tjd2MW5z?=
 =?utf-8?B?NFRoSnE4V3paUDVzaE5QcWxsdTBaSWhLRERUcDMzN0FUaU1uT1VvUFkyYkxU?=
 =?utf-8?B?MVhNcCtDVW9rMHJhclZ5YXRkcytzMUYyQWE4NTR1TzR4S3hjVDB1RmtZeGQr?=
 =?utf-8?B?NytFTHRkSlRoVHc0ek1leVZSbFJpcHhUR2Y3QThmZ1BvUzNHVnlXOUZma0dM?=
 =?utf-8?B?KytGZGRGN3YvM3dJSGpoYVRqMWkwVk9HR3ZyK2Z6Qnp2bDVEK04xUE13WVU2?=
 =?utf-8?B?aHZKelllc01sanFqL2tsa2trMnZ3dUlIYTVwWDFBcW01eWJ2T1o4OUc0cTVl?=
 =?utf-8?B?YkhxdW5TMEduV040VERNSW1uNnZVLzBXVk03dlNSM2NCenNFK0pwTXozY1NY?=
 =?utf-8?B?YmlEOEdMZTdQUGhFWUUyUkhGR2dGOXBzenpuVnVrQmlqWUo0MWR1Uzl6NmtU?=
 =?utf-8?B?SW5vN0pWdzUySWVCOTNmMnhPSjJoTzdUUzdSMG1na1JxS1hEbSsvMUN0SkM5?=
 =?utf-8?B?bWs3aTMzR0llSWdYNXFUU3pIdXVSaHhncHl4Rng2UjVDZUcwbXhIbGRvN2xT?=
 =?utf-8?B?L1NnMklnNWNOalp5UEJsNXBFWDlKcDRxWVgzTnQ4MDZJWkVXUjI5cFM3N0F3?=
 =?utf-8?B?MXF2RXc5SUxYa241YlVzVWdsYyt2YW03SWt1R2dpa1ROSE5oNmhVakw4YVQx?=
 =?utf-8?B?cWlMcFRTRkpWU2hKMTNWUGhCa3Jlakx6Q2svL3ZZUFZ3YUJrMEFlM1lhdzdI?=
 =?utf-8?B?aElTTWJNc00yaktHRUhyVjVrZVZhc24wSlI3Y25vZWd4QXRueTdid090N1J1?=
 =?utf-8?B?Ti9wU2ZEM2tJRmp3eTFDSlh6SkxaMjdnekowMTlSK2hCVUd6U1dIQlR6OUFw?=
 =?utf-8?B?eUVZNG00Z09CVFZGMEpVQkV5ZWJhd2dRRmN1a1hCbGt4SWpWSkpvVlhuK3Vh?=
 =?utf-8?Q?DO1xBq/Z63RxmBXF9Ne906j02Uaod066mkEy9swuB8Eg?=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(34020700016)(36860700013)(1800799024)(376014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 13:11:09.5929
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c87b1604-cd0b-4dd1-0455-08de5500b74f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017090.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5852
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_051117_502344_F0D006C0 
X-CRM114-Status: GOOD (  11.35  )
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

The interrupt router does not support interrupt type conversion and
forwards both level and pulse interrupts to the parent (GIC) unchanged.

Hence update the INTR bindings and driver such that
1. If "ti,intr-trigger-type" is equal to IRQ_TYPE_DEFAULT, parse the
   interrupt-type declared by the source, per-line, and use that to
   allocate interrupt from its interrupt-parent.
2. Else, the global setting specified for the property is used for all
   output lines. This maintains compatibility with existing platform
   DTs with no changes.

This change is needed because:
main_i2c4 on J722S is a level type interrupt source while the rest of
the interrupt sources for Main GPIOMUX INTR router are pulse interrupts.
main_i2c4 on J722S is not present in it's dts yet and will be added
through another patch series after this one gets merged.

Testing:
- Enable I2C4 (additional DT patch) on j722s-evm and run i2cdetect [0].
- Add testcode to ignore the NACK interrupt, which results in an irq
  storm -> showing that GIC is actually receiving level interrupt from
  the INTR [1].

[0]: https://gist.github.com/aniket-l/01d4e943b7b6db54b38eb7e99ed5e2b9#file-j722s-evm-i2c4-logs-working-txt
[1]: https://gist.github.com/aniket-l/01d4e943b7b6db54b38eb7e99ed5e2b9#file-j722s-evm-i2c4-logs-nack-storm-txt

Signed-off-by: Aniket Limaye <a-limaye@ti.com>
---
Aniket Limaye (2):
      dt-bindings: interrupt-controller: ti,sci-intr: Per-line interrupt-types
      drivers: irqchip: irq-ti-sci-intr: Allow parsing interrupt-types per-line

 .../bindings/interrupt-controller/ti,sci-intr.yaml | 42 +++++++++++++++---
 drivers/irqchip/irq-ti-sci-intr.c                  | 50 +++++++++++++++++-----
 2 files changed, 76 insertions(+), 16 deletions(-)
---
base-commit: b71e635feefc852405b14620a7fc58c4c80c0f73
change-id: 20260116-ul-driver-i2c-j722s-48f223899dbd

Best regards,
-- 
Aniket Limaye <a-limaye@ti.com>


