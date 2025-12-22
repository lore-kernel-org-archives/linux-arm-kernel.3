Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31F06E6748D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 08:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kAqiz6XB7CDs3cHGETeSe8UB5lp4HnPiPOiCxdguPqM=; b=sx6KgOKTt3Ke/4dquRTG97OP3Y
	hLCXAH1WmhG3ZhBle2JrMycDPjUw/Kzt9M9m0CNId4Vu2ddKEeAiAuHbKrsvAcRPdS90+I8wHXNEZ
	lY9F9P2rRIJQRGjjcm1zenre5oKVWq915PQMToiK0WhQFEFt4gm8MmwHxCEiuEYZZ3xzvhDePh62M
	KhIoueP3wP1c2cyA5PY3DjMX9nfOe8T1PvqHJ/WAS+wG9KUVH27bXFEpySxegz3+JDmSbCFGCYiKx
	m6LZ/7E459u9YmByxaIORbHQfvxth1uT2QeamtCXaiG3Pb/zGkZ6KQqyvVjusjFv+Zn00IV3nYvrx
	eVpcc2Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXbVv-0000000DSTP-0Fej;
	Mon, 22 Dec 2025 08:43:35 +0000
Received: from mail-eastusazlp170120007.outbound.protection.outlook.com ([2a01:111:f403:c101::7] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXbVr-0000000DSSw-498E
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 08:43:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZMFZArzqipxkDajQDVCmlu54CHJBBsUGnCLdXxI+ifgzUllJoa6CwetLszmSRB/POcn2mgJkk/D/WjyIIQvTTNs7eqqMhTVuzVHuRhKr0Ued0voKx1uCDX/8BlTcr2ERgfZubEjGCAvMp3mCBu6gm+pVo5kuyHbLvNNJLZ9mrDpw4ILhxXStpR8M7DB1d8WHskTdqehv4IjerOKWpPNOstcN/ymC91lDTceMCxIk1Gc3ndQh1ruqYVYAe392VqVoT2dsz5pNVXxtiVPLUq4mq5X4BluwMcKzvcwmmwm1ucX/RvsAtVbwy+c+FFOSzyhRKiEgic821lIHobLh/LIjOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kAqiz6XB7CDs3cHGETeSe8UB5lp4HnPiPOiCxdguPqM=;
 b=s7gyh0AX+bAepWGI0mms9TyaAkbhFpNyrE/h25czlkVPZO3TTj8rWS2LQ/SPAQVGgut54yhLqR6J95++bV3jjSTLavmNoqlNaugnSuWC5b4MJBAlHrcRb3oBX/m8B15suUr72yLlMBPavNSwjKP/Hxvs4gFSX9U0WUe+cFddAkKDYO+ZLlXzWS2srS1sBaEdrNBSkxH09UaeQjPec83mpyTB/GChK+LbGiK0JBQvHM/Z3k512/Qo8F9tIdA4B5UnTvefGrZKH2lsJXU8mQhE9bF7DFNrfyBI4ddPqncpaiJzF1HaGigPHvB3YFEZapmq0wWDjaPcuUVnpQk+ArKHUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kAqiz6XB7CDs3cHGETeSe8UB5lp4HnPiPOiCxdguPqM=;
 b=I41QMdz8VY9uIUIAG12QF/zJ8oiw1FBXhDQmkDGP3cmpVaWHulBSZoblSthLSGWG/Cr6ns+zJipA/wdVC07aJU34gTlA2u5iKZ1IdPzhfs1u/ZcceneWFL0hSyRI9tyk5aipDhcNfFBgtB6yiYDbtfmF9ZubZGxRMDj0tCAYWMU=
Received: from BY5PR17CA0037.namprd17.prod.outlook.com (2603:10b6:a03:167::14)
 by DM4PR10MB5966.namprd10.prod.outlook.com (2603:10b6:8:b2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Mon, 22 Dec
 2025 08:43:24 +0000
Received: from SJ5PEPF000001F6.namprd05.prod.outlook.com
 (2603:10b6:a03:167:cafe::14) by BY5PR17CA0037.outlook.office365.com
 (2603:10b6:a03:167::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.10 via Frontend Transport; Mon,
 22 Dec 2025 08:43:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ5PEPF000001F6.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9456.9 via Frontend Transport; Mon, 22 Dec 2025 08:43:22 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 22 Dec
 2025 02:43:20 -0600
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 22 Dec
 2025 02:43:20 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 22 Dec 2025 02:43:20 -0600
Received: from localhost (dhcp-172-24-233-105.dhcp.ti.com [172.24.233.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BM8hJQZ978694;
	Mon, 22 Dec 2025 02:43:19 -0600
From: Anshul Dalal <anshuld@ti.com>
Date: Mon, 22 Dec 2025 14:13:14 +0530
Subject: [PATCH v6] dt-bindings: arm: keystone: add boot_* mboxes to ti,sci
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251222-k3_syscon_add_boot_mailboxes-v6-1-b93ada9f1d47@ti.com>
X-B4-Tracking: v=1; b=H4sIAKEESWkC/5XQy2rDMBAF0F8JWlfFM3pY6qr/UYrRsxFtrGIZk
 RD875VDIfGmpss7izOXeyUlTCkU8nK4kinUVFIeW5BPB+KOZvwINPmWCXYoADpBP9lQLsXlcTD
 eDzbneTiZ9GXzORSquEDrvVZaImnE9xRiOt/4t/eWj6nMebrcvlVYr78wwN9wBQpUoDbYR4Sul
 69zenb5RFa14qOEOxLSjppgHQTeW6ZhI7H/SKx1khKEMByZ9G4j8buEe7NV3iQVEGS0Smm+7SQ
 eJNiTxLqTUTEI2UfP7tKyLD/13L1v7QEAAA==
X-Change-ID: 20251105-k3_syscon_add_boot_mailboxes-8452bdd98962
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, "Santosh
 Shilimkar" <ssantosh@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Andrew
 Davis" <afd@ti.com>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
	"Anshul Dalal" <anshuld@ti.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766392998; l=5738;
 i=anshuld@ti.com; s=20251022; h=from:subject:message-id;
 bh=cEl4qRZ+nuG7aUBu8OXm33K8UUfWym+lunqyLGqlSWE=;
 b=GYrdZl+I5SwCNEEfIv41qr+ZAgt620OqaYrLeqOFgnyjpBIiXdoCLCKaje06SDXUO3hJ+FKoj
 k71P71CHSFiDQd63uI2aHaS9lXCtlzOz3KbvJeJVsAnv9z+DHaErkzl
X-Developer-Key: i=anshuld@ti.com; a=ed25519;
 pk=Kv8FlQElcrR6efyEHmjtE83y8e0HKvqPyvVY+PJ4UFw=
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F6:EE_|DM4PR10MB5966:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e7ccd36-a433-4de5-4e59-08de41362a54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aGRLTC9aVXZLY2JSQU13UFRTcjU0RHBkK2tSa2xKejdmaElFSzJhMzBjS3BI?=
 =?utf-8?B?ak1pVlI4RDRnVUh0WXlzcGg1cjAxRXdGd0QrbzQ3aHdtWXk3VHJDRWMzVVBw?=
 =?utf-8?B?V29mOWl6OVY1RUNPY0Q3bUFFMit5dEFvTGxVeEN0Y1U4eHdkVUkrckZuamJv?=
 =?utf-8?B?a2dqWHdZZGxFTGpwM05DRHUyQzc4c0JzdDhPQmtRMVlRRXlpMkx3cGdoQWRV?=
 =?utf-8?B?QUppR2o2TzYxYit0ZGVRMUxqSG9sN0NISDhNQkNrUEdXZkhEWkdXR0pOcWF6?=
 =?utf-8?B?VmhXMDR6SUdiYlgrY2RPZlRUNzhXcmExY2FrdGxwTHgwdDc3VWtkWU5NTGx6?=
 =?utf-8?B?LzhuSC9kZ2NPWnFDVW1Zb3YvMmhBU0w0UXh6KzRVUFFSaTJlUUk3MjB2STNV?=
 =?utf-8?B?c1JIZm5aM2poOEIvK1Nyd0QybWRaN1I3MVlaUGhnMFlTZG5tNDdtc0N0V1hi?=
 =?utf-8?B?TGhEbjFhZ29zR2Y3L2VLMTJQa2VrSWRVQnJIcW1pUVN3Kyt3UFFydkptSDll?=
 =?utf-8?B?d1loWElCdFdENGpNT1MvY0xFT3c3OVZYNlVKYWlUWU04V3VlZlhwTWtHbDI2?=
 =?utf-8?B?RC8wdk1DaDVPMTdBbS8rWit5ekFpSWRIT3hDcElmZHFYVzVGOTNqcFk4RU9H?=
 =?utf-8?B?bUxYL0hEWHplSmExZ3k3T0JibEdaYlpvaTJaVERlbG9GUlJ2cGFBRjJjcjkx?=
 =?utf-8?B?ZkM0dDFIMUMyeDFoR0Z5OThHKzRzZjFNaDVxWG41VTJZYmNscUpIODVwUDlk?=
 =?utf-8?B?RGgrM0piYUxTUDg0NlhXMTdhdTR3UHJ3L3FXRHlFWGI4cG9vcUFvaG83czA4?=
 =?utf-8?B?UnhmejRuWk1mb0F3M0xVL2VNRXBEaDA0Z2U1MmdTck12ZDFYSTFlUjVZaWJi?=
 =?utf-8?B?VmVWc3BTa0l1clVjSTRYOHVST21oRkpiSGpVazg0bGkySCsrZ2x3ajFhNGEw?=
 =?utf-8?B?MnZiQ3FEZFFSbnEzK3cvMWk2MXh5TDZMVjZPcXdtaFI0bW1CM0pjc0FzOEdB?=
 =?utf-8?B?SWlEWXg5T1BzS0ZWc2hXUDc5ZHk0VDRIemx6S25RanU3Ylg0Y1o1a3hBQWcv?=
 =?utf-8?B?RUhicy92UUkxd3F5QlJ4bFBIUC9td3NsV3p5MVI0R3RFc0dCMStRVSsxU2U1?=
 =?utf-8?B?Rno5bDB3eHhMZlRHUVJGMHlhZDZNeVdaK1cxNHRUZnNnVGswQ2N4WVpHUFZL?=
 =?utf-8?B?cUwrNVBWK095UHdwYmhWQnFQVUlkK3ZPbHNHWG5qQnRKakZheDdGRGpMQmw2?=
 =?utf-8?B?c2ptYnhlR2ZqMTdjaGV2cHllZXc0dWpjMDdDd09DVlpWeDBEMHA2N1g0Wi80?=
 =?utf-8?B?Z0RyZHFJRE1Ld3FkK2ZQYjBibWFpYkRxVkdFK1NkU0JiTnhlSXAvUitucWRa?=
 =?utf-8?B?OWFSTlhQK3phVmJkRmowRFA1OGRteXpkeldLajNHS1l4NU9rb2ZsZmsxcGVw?=
 =?utf-8?B?cUNqaVpvMkFFb1NQbjFxUzVRK2w4UStOWjVnQldrUy9TS3MwRDZ1Z3N4WitM?=
 =?utf-8?B?bWZMZzVWSkxhazJmWmliZTF2MTV0Q2puQkl3OWwrVi96QlN2dkJESCthZ2Ex?=
 =?utf-8?B?OEVCbVdOK0xURHNzWkJzL1VQSUZtanlRbWxjTTZNRmtLbE9oRjFXRWQvaEZQ?=
 =?utf-8?B?WmF4VE5sRXF1YWszcEdINzVVUGR2ckJZNk5BbWdNSlFpbEh5MzVUbldhR0I1?=
 =?utf-8?B?Zy81MDAxNlV1ZGtxU3JXbTNaZEFqMDMrZHU5bFIzV3F5MWZqRk5mZ2taendr?=
 =?utf-8?B?ZDZLaWpLdURXSlVhWjE4Q2YwS1hRcXROaEIvU1dtRndOWWR5Mkx5RkRObHdr?=
 =?utf-8?B?RTlTUkQ2ZVI4bnhHbCtiK003bjY3QjdHOHRKTml3dFJERWtQcVF2WUo5R21j?=
 =?utf-8?B?dGkvWHNDYlFRL0hwSTk1ek8vYXRxUm5IMUYzY1Z3cC90WDZKYVBvakVkUXZI?=
 =?utf-8?B?eTBENzdxd085SUtZWmo1SzFITWU1ckg2UnBtMFBRMkZ5T21HQmpPZ1JKRE5C?=
 =?utf-8?B?R3ptYi9janZna2FMaEJGYmFSK05mVFRuT1R0YklhLy9iU05vTmpabjN1QUcz?=
 =?utf-8?B?YzNwcFhIOHk1OEJhOE41eGxnMnljbXQrMDYreXRWVk9VSTJsekx1WWxiQVM5?=
 =?utf-8?Q?N4lg=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2025 08:43:22.6643
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e7ccd36-a433-4de5-4e59-08de41362a54
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001F6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB5966
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_004332_236312_709060DF 
X-CRM114-Status: GOOD (  16.42  )
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
firmware.

The new ti,am642-sci compatible is also added to represent SoCs which do
not expose a "notify" channel as part of their TI-SCI spec such as AM64x
or the AM62 family. The newly added mboxes are made optional by keeping
minItems as 2 to remain compliant with existing device-trees.

Signed-off-by: Anshul Dalal <anshuld@ti.com>
---
Changes in v6:
- Added ti,am642-sci compatible to represent SoCs without a "notify" channel
- Added new examples instead of editing existing ones
- Link to v5: https://lore.kernel.org/r/20251215-k3_syscon_add_boot_mailboxes-v5-1-5a8fe567fd31@ti.com

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
 .../devicetree/bindings/arm/keystone/ti,sci.yaml   | 94 +++++++++++++++++++++-
 1 file changed, 91 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml b/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml
index 25a2b42105e5..0f2c764eae5a 100644
--- a/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml
+++ b/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml
@@ -40,6 +40,9 @@ properties:
       - description: System controller on TI AM654 SoC
         items:
           - const: ti,am654-sci
+      - description: System controller on TI AM642 SoC
+        items:
+          - const: ti,am642-sci
 
   reg-names:
     description: |
@@ -51,15 +54,15 @@ properties:
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
@@ -79,6 +82,66 @@ properties:
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
+  if:
+    properties:
+      compatible:
+        contains:
+          const: ti,am642-sci
+  then:
+    properties:
+      mbox-names:
+        minItems: 2
+        items:
+          - const: rx
+          - const: tx
+          - const: boot_rx
+          - const: boot_tx
+          - const: boot_notify
+      mboxes:
+        minItems: 2
+        items:
+          - description: RX thread
+          - description: TX thread
+          - description: boot stage RX thread
+          - description: boot stage TX thread
+          - description: boot stage Notify thread
+  else:
+    properties:
+      mbox-names:
+        items:
+          - const: rx
+          - const: tx
+      mboxes:
+        items:
+          - description: RX thread
+          - description: TX thread
+
 required:
   - compatible
   - mbox-names
@@ -122,3 +185,28 @@ examples:
         #reset-cells = <2>;
       };
     };
+
+  - |
+    system-controller@44083000 {
+      compatible = "ti,am654-sci";
+      ti,host-id = <4>;
+      mbox-names = "rx", "tx", "notify", "boot_rx", "boot_tx";
+      mboxes = <&secure_proxy_mcu 6>, <&secure_proxy_mcu 8>,
+        <&secure_proxy_mcu 5>, <&secure_proxy_mcu 5>, <&secure_proxy_mcu 4>;
+
+      reg-names = "debug_messages";
+      reg = <0x44083000 0x1000>;
+    };
+
+  - |
+    system-controller@44083000 {
+      compatible = "ti,am642-sci";
+      ti,host-id = <35>;
+      mbox-names = "rx", "tx", "boot_rx", "boot_tx";
+      mboxes = <&secure_proxy_main 0>, <&secure_proxy_main 1>,
+        <&secure_proxy_main 0>, <&secure_proxy_main 1>;
+
+      reg-names = "debug_messages";
+      reg = <0x44083000 0x1000>;
+    };
+

---
base-commit: 4427259cc7f7571a157fbc9b5011e1ef6fe0a4a8
change-id: 20251105-k3_syscon_add_boot_mailboxes-8452bdd98962

Best regards,
-- 
Anshul Dalal <anshuld@ti.com>


