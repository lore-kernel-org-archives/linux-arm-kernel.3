Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9EA9D41D74
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 06:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SOpWSwCg/oRh/zGgMjMeNm1tQUhCuszhprxHLEaXYfs=; b=xKicZPxe5TX55H6Hr6jzTax6eh
	idAQThszANP2cdm4lLU05CsjwoJe6HN0P3gsUSRlzu+UeHnCzvtAtrPJGF/oJ1myKQ9QZ6jWdmVxl
	JlzPKLyzwuXcAF6Pyn8wd5YbCU72wnFKdl5s2AN3HPywe3mNanuA4UaZXXQ2pgyS9MmdmCujsM/1v
	2lC3/GPu1PGi3ZGYAxtNqPMYqwn7S72059HhmbAQEo3AcxGEQv4gZC3PGmbH/1Bg0hoNfcqkiyDrS
	Jcw3tqinrJff+EvhjZAwiWS0BB7U+8+PmiuG2DvtMlXK6FEcQCBrAfyg5qBJTZZGUOVTCQu2qb+ap
	fN4V5NhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV1lu-000000038ma-48db;
	Mon, 15 Dec 2025 06:09:26 +0000
Received: from mail-westus3azon11011036.outbound.protection.outlook.com ([40.107.208.36] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV1lq-000000038ku-276Q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 06:09:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V7TynDGEi1yz8x33XRvThLAlNL1vjhR233YC5BJgVQtKIGjQpUu22hyx9xr/24xXTF8twztznSMCBcK1Qjdzy2pqm4hOWzD9GOxoio0maq19dh23ndhFYqvgW5h1kqpD2ANFPl9gT0EboSDtO+wKhNQxjyN+dQbgFW1kWDLehuB3Gy38dJNcYB9TUKalZetaLZsjb/O6++EgZjlpWUHI4eaywUthWx0e8yUWRcOrARZ2ve6VImoQ4FzooOljg1wFLawLG8ho4tbSDNck2dM51et/TGmTVrfnwk2DsdW6TZl95yGmcKBsU8fZuYJyg6HHvyZlaVyoXPQ7QxCXD7Fjfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SOpWSwCg/oRh/zGgMjMeNm1tQUhCuszhprxHLEaXYfs=;
 b=suqgby1oBwZAUaYBzIobOJc6iafm8UgN9pu6M22l2aNQrDfxYxs6mBvg5NHzALxQqh2isjx92+dCYGia8EsvZWPS4K9Z8OisQG2iNZ4VcN2vrPMy1vdkS/WRpHyiiv444hlhJnjdnr87j6Wh4pK0cICSsnVul1qA0niFZ4YmAGcGcymW/loY3AsOZTfZAMZ6Y7XGYcD96VwBc24pd0tk60T1AF2evVvIvdXohpr90+XD9aJmQ+KF7Hj9tVuPSqrGhBpiuExZs+fhiktieLdCr2sH655NRhLrMJuFh976rQISMTl6xJdWJtjQW1Zw/+7gBxJiJe7V55AXaRAMz3X05A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SOpWSwCg/oRh/zGgMjMeNm1tQUhCuszhprxHLEaXYfs=;
 b=S68a5gQMVsFzp9LupygWg/MnDXm4XP1Obp3LwV9nrgT8Cx2jTwFMDASfK4iJxNJ7HzukAL5foQm8IvQlnN7FYNf4ametjETGJcYfP/hQO7GUVE2nnPTKvIxug7TgYIPcObGV5j3vLOol81EpN69ceG0zp7EaTkbrpmgf/SYR2nU=
Received: from PH8P220CA0032.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:348::10)
 by CYXPR10MB7924.namprd10.prod.outlook.com (2603:10b6:930:e6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 06:09:16 +0000
Received: from CY4PEPF0000EE3F.namprd03.prod.outlook.com
 (2603:10b6:510:348:cafe::5b) by PH8P220CA0032.outlook.office365.com
 (2603:10b6:510:348::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.13 via Frontend Transport; Mon,
 15 Dec 2025 06:09:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CY4PEPF0000EE3F.mail.protection.outlook.com (10.167.242.17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Mon, 15 Dec 2025 06:09:14 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 15 Dec
 2025 00:09:08 -0600
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 15 Dec
 2025 00:09:07 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 15 Dec 2025 00:09:07 -0600
Received: from localhost (dhcp-172-24-233-105.dhcp.ti.com [172.24.233.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BF696eN1882401;
	Mon, 15 Dec 2025 00:09:07 -0600
From: Anshul Dalal <anshuld@ti.com>
Date: Mon, 15 Dec 2025 11:38:58 +0530
Subject: [PATCH v5] dt-bindings: arm: keystone: add boot_* mboxes to ti,sci
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251215-k3_syscon_add_boot_mailboxes-v5-1-5a8fe567fd31@ti.com>
X-B4-Tracking: v=1; b=H4sIAPmlP2kC/5XQy2rDMBAF0F8JWlfFM3pYyqr/UYrRY5yINFaxj
 EgI/vcqoZBm09DlncW5l7mwQnOiwrabC5upppLy1IJ62bCwd9OOeIotM+xQAXSKH8RQziXkaXA
 xDj7nZTi69OnziQo3UqGP0RqrkTXia6YxnW78+0fL+1SWPJ9vbRWu1x8Y4G+4Ageu0DrsR4Su1
 29Leg35yK5qxd8SPpGQd9yRD0Cy98LCgyT+I4m2SWtQykkUOoYHSd4lfPa2KptkCEGP3hgr75v
 Wdf0GTvE9+6MBAAA=
X-Change-ID: 20251105-k3_syscon_add_boot_mailboxes-8452bdd98962
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, "Santosh
 Shilimkar" <ssantosh@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Andrew
 Davis" <afd@ti.com>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
	"Anshul Dalal" <anshuld@ti.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765778946; l=4120;
 i=anshuld@ti.com; s=20251022; h=from:subject:message-id;
 bh=lRgM9wR4H5FhVMrsDviUNtmwEqhCX1l81b6qe8nYiZY=;
 b=oDimSZnLBcpjmGRxW0MBqGmPo7EMcdNHqyGt5n0XGhEga+Ph7xLyuf5GXICkQHHWXPsb1ii3p
 Kh3M0ah0MSRB5uM1GK18kt/eOJC9Mehn6wmT4pyFcPJ4lDC5OqwBVUL
X-Developer-Key: i=anshuld@ti.com; a=ed25519;
 pk=Kv8FlQElcrR6efyEHmjtE83y8e0HKvqPyvVY+PJ4UFw=
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3F:EE_|CYXPR10MB7924:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c0f0c6a-4a7c-4870-84df-08de3ba0794f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?THNQeWhLNWVoR25XckNqd2RpcWk4V3lOdUQvM0VVRVZXNlBNaWYzUTl5bjMx?=
 =?utf-8?B?ak1FZEQ4Q0ZDVkZtQkVHY2NUZ2l4WnQycDE1NFBKT2dkZmd1MmZpc3B4ZzZz?=
 =?utf-8?B?UGlzUkVCSit5K2t4THJCem1zQ3JJYjlEU0NYbVhYejVKN3NvVSthZmNQOXVD?=
 =?utf-8?B?aFRkZ0ZHanFWbmdZWjNyd2VhVE1iMUpaT3ZweExmYkZLOENYYjdzNTRQN2ZR?=
 =?utf-8?B?c3NDaEREWDJPby9ZR05oUjMzZE9zdjdnL1ptaEFoVEQxRlowZUlpNGR5ZDRC?=
 =?utf-8?B?MTZnUDZIYW5MN0ZkOFBUTVdDWmJqcHhFb044dUFFWWJCVlZDVGpaank4WVd1?=
 =?utf-8?B?L1MvUXBPd1VoeU9MQTkyRysxdmRBYWZpS2lJN1hiVWZzNmJKemw0RGpmMllJ?=
 =?utf-8?B?amJSTDIzRkxUSXRlM3hHOFpyUXFpVHZXQkoxOGd0T0dWMGFzOFpuL2VFTldi?=
 =?utf-8?B?UUVpZkxTWTdWY1R0ZTBjaEFxUEVRby8yRG1Ma3RkTFgyZDB2bHdlMW5tOFJr?=
 =?utf-8?B?WFp5eEZCM1BxeHFrV0VoNzB3RWliSloxK3phZ3YvSHgxbExvL3VIcTVYMlhM?=
 =?utf-8?B?SjZNMVJITWE2ZDdna2k1Rjk4VXU3bTZIZ3laZjdlQTV6a0lidGVoZzZUVFAx?=
 =?utf-8?B?WjFoYTdGcHpUcmZGcTdlUE03OXNGVGE5TFZ2MzJUcXcwYjRhZHhDMDJsREVs?=
 =?utf-8?B?R3VMMFEyZkl5UXNoZnVSdFdicXBnWDhOMktveVBDQ01RUDFrR1k5bWMzRlJr?=
 =?utf-8?B?U21Cd2dTenovV0xCZzQ5UlJ0MERLSzVqYjd5UWc4ZFpPRklNY3UzS3p1a1NX?=
 =?utf-8?B?UjZmMWFxUnQrYWtSck5vb2RQZ3VaYTVMRmJkdStjL0VTMzJrbDN5Yk8yS29m?=
 =?utf-8?B?dmpkSk52RDRYVGpVbzVtS1loSnpRb0tsb1ZMU2laT3oveXc5blAwNGxJMW9S?=
 =?utf-8?B?UFdHYUsralE4TnJCcVdEOWVlMzg4bVhaeXd4YzJiUXZ2QUt1bzFVV09xWkNW?=
 =?utf-8?B?bTBEKzlXVFFDQWl5TldDTUo1V1E3dnUrS3BPU0pwSlJYeXArZ0xmdXZmSFR0?=
 =?utf-8?B?eGExbW1OVjhjT2ozeWlBMVJtaWx4Rk9KS2JMOTUyYkU1a0NnNnBLNmttZnFY?=
 =?utf-8?B?a1NvRmJKUml0bDlNT2Uvc01helZzUys0YW04Ym5WdUJqMEJCNm9zNDQrbTJO?=
 =?utf-8?B?dkQxNHZ5TEtjTk9DdWRkM21iK1pEZ3hsL2dweXFBQWVTZU5KVW9YOUo4OVB0?=
 =?utf-8?B?VlV2eUFPUEEycDh1U0M2MzI4UzV2VzhVSGpuS0phU3B2NVA2bFRzRFE1VDRm?=
 =?utf-8?B?aGxJclVOaWI5TFRjYUNYR2FudVJENmJ5N1NhQnJrYzIyREl4bUQ0a09xZG9N?=
 =?utf-8?B?Q1ArOGZ4NjJUTjRGMUFKeVhQY1F5YjNUa0svc3VmZUJLek9GeXNDeW12MzEw?=
 =?utf-8?B?S0c5UEdwVHg1Y1lLMm5VMk5oZmQvbHZFYnl3VUNYbGNERWR5c1JQN0dRS0xm?=
 =?utf-8?B?RHNQcFMvcFRDZTA5T0RLYmV2bkVUcS9zUThLYWRPQkVSb2FZbmYvOHlvdFFl?=
 =?utf-8?B?cVhYVDJpS29pSVRSOS9wbzNvSEpicTBjc2ZyZFZSd2Q1TnFXVFhqb3Q5bW5k?=
 =?utf-8?B?bDlJM3lNS04yRGphaW9vS0hWYll1WHdHbmdlUUU2cFpqMTFlYUhVd0dVMDk3?=
 =?utf-8?B?M1QrYjZsV09WTjBKQjJVdmdZMzZITDBoR0xRbXkreERJSFg2U0pJaDFEaDl1?=
 =?utf-8?B?MGQ4aWRqUUs2aE9XZ3RrN2xBNkFJODZ5SUI2bDBZQ1Q0dzZmLzhXUm1WaWY5?=
 =?utf-8?B?TWJuUjQ0L3FnRGE1ZzFCdUNabC9CdjluL2pGZkZiUnhMSWpwdTlGT1dGQlpZ?=
 =?utf-8?B?QXduMTNhd0N0SzJ1Zm5pSmUvTXh0d1JOWEN3WmhtbWFOcWpLQ1I5TzdYd091?=
 =?utf-8?B?U2JXV2hKQmhqL1dhMzAyZVEwUTdFV3ZpaHRIYW90RE5xdjREemYwTlUzVUtK?=
 =?utf-8?B?U3VCYnEzL3EzUkpSejFoRzRsMjlGUEhGbmN3WWgwSDgydWdxMDJBbzVXWVoy?=
 =?utf-8?B?S1M2dzFiUC80UmJ0TWZ4UUlBMVBnZnFkT2Znc0tibElaVldFR2hBalBxUml4?=
 =?utf-8?Q?g1Ls=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 06:09:14.8965
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c0f0c6a-4a7c-4870-84df-08de3ba0794f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE3F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR10MB7924
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251214_220922_662460_DA4E1854 
X-CRM114-Status: GOOD (  13.70  )
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

The bootloader on K3 devices makes use of mailboxes as per the ROM spec
which might be different than one's available to the kernel (firmware
spec).

Therefore, this patch adds the missing mailbox entries to the DT binding
if the matching compatible is ti,am654-sci to represent the mailboxes
exposed by the hardware during boot for the purpose of loading the
firmware. The newly added mboxes are made optional by keeping minItems
as 2 to remain compliant with existing device-trees.

Signed-off-by: Anshul Dalal <anshuld@ti.com>
---
Changes in v5:
- Added commit description for the optional mailboxes
- Link to v4: https://lore.kernel.org/r/20251205-k3_syscon_add_boot_mailboxes-v4-1-8e216fb88941@ti.com

Changes in v4:
- Make new boot_* mboxes conditional on ti,am654-sci compatible
- Link to v3: https://lore.kernel.org/r/20251112-k3_syscon_add_boot_mailboxes-v3-1-66155a4236dc@ti.com

Changes in v3:
- Drop [1/2] of the last patch series
- Update existing example with boot_* mailboxes instead of adding a new one
- Link to v2: https://lore.kernel.org/r/20251112-k3_syscon_add_boot_mailboxes-v2-0-aebc1e47b391@ti.com

Changes in v2:
- Remove maxItems entry
- Remove RFC tag from patch (added by mistake in v1)
- Document the new mailboxes in mboxes instead of mbox-names
- Provide example with all the mailboxes set
- Update commit title to have "ti,sci"
- Split into two patches
- Link to v1: https://lore.kernel.org/r/20251111-k3_syscon_add_boot_mailboxes-v1-1-529a27f21076@ti.com
---
 .../devicetree/bindings/arm/keystone/ti,sci.yaml   | 50 +++++++++++++++++++---
 1 file changed, 43 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml b/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml
index 25a2b42105e5..d9eb2a81e539 100644
--- a/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml
+++ b/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml
@@ -51,15 +51,15 @@ properties:
     minItems: 1
 
   mbox-names:
+    minItems: 2
+    maxItems: 6
     description: |
       Specifies the mailboxes used to communicate with TI-SCI Controller
       made available from TI-SCI controller.
-    items:
-      - const: rx
-      - const: tx
 
   mboxes:
     minItems: 2
+    maxItems: 6
 
   ti,host-id:
     $ref: /schemas/types.yaml#/definitions/uint32
@@ -79,6 +79,42 @@ properties:
     type: object
     $ref: /schemas/reset/ti,sci-reset.yaml#
 
+if:
+  properties:
+    compatible:
+      contains:
+        const: ti,am654-sci
+then:
+  properties:
+    mbox-names:
+      minItems: 2
+      items:
+        - const: rx
+        - const: tx
+        - const: notify
+        - const: boot_rx
+        - const: boot_tx
+        - const: boot_notify
+    mboxes:
+      minItems: 2
+      items:
+        - description: RX thread
+        - description: TX thread
+        - description: Notify thread
+        - description: boot stage RX thread
+        - description: boot stage TX thread
+        - description: boot stage Notify thread
+else:
+  properties:
+    mbox-names:
+      items:
+        - const: rx
+        - const: tx
+    mboxes:
+      items:
+        - description: RX thread
+        - description: TX thread
+
 required:
   - compatible
   - mbox-names
@@ -99,11 +135,11 @@ examples:
 
   - |
     dmsc: system-controller@44083000 {
-      compatible = "ti,k2g-sci";
+      compatible = "ti,am654-sci";
       ti,host-id = <12>;
-      mbox-names = "rx", "tx";
-      mboxes = <&secure_proxy_main 11>,
-               <&secure_proxy_main 13>;
+      mbox-names = "rx", "tx", "notify", "boot_rx", "boot_tx";
+      mboxes= <&secure_proxy_mcu 6>, <&secure_proxy_mcu 8>,
+        <&secure_proxy_mcu 5>, <&secure_proxy_mcu 5>, <&secure_proxy_mcu 4>;
       reg-names = "debug_messages";
       reg = <0x44083000 0x1000>;
 

---
base-commit: 4427259cc7f7571a157fbc9b5011e1ef6fe0a4a8
change-id: 20251105-k3_syscon_add_boot_mailboxes-8452bdd98962

Best regards,
-- 
Anshul Dalal <anshuld@ti.com>


