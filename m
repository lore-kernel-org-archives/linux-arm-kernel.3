Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDD38D2E009
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 06:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VIy8ZUB/NgfjeefF4i6i7qY3bhCt9eOE3nzDD9DMYVM=; b=FUKls+z3ofW068cnsU/UraZVtC
	FpVB453nVhPiL2XU5F1ox9AORKkxV84IxglVCft9LIDdqVXJx+nllEwD20LB9b618fR3ybg8cZYZc
	TIVoEUXxXBPZmNKSg5DxKXVTTzswsNH6zRt6ye7Sv3c1o8PaU+4Ix9rCiGt2D0axKlzRlQQmsZ4+W
	nWvvndO8lTOQhc9vz11uujeTsIgbVlKWEwxJfygJVvQQ/rgP8mds+wbwbFqj1/EETJvJxN2I//BiJ
	1yq36zz+OFO0sPdb60zig641wpusKarnjBF0n3FYUs5Ojv5BwUUWxxh/5y2HQU9TOE6KFAZKm5oTj
	+4chmU2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRP6n-000000095Vh-2DN3;
	Fri, 05 Dec 2025 06:16:01 +0000
Received: from mail-westus2azon11010049.outbound.protection.outlook.com ([52.101.46.49] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRP6k-000000095VF-17bM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 06:16:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ewjqvuGikIXIiMekJF0MgomY5FpIA3hcq6EHVz3swT5WowfJ05l7L9d2c37EnYV8nzcARydN2C1yI/1dIBiL3wgatsrcNkwaE0dJxt7rIM9kACD69yaNUe7vpyvolm9Q1Owlpk0CBGHvgMa36fNyVLcxlFsboYctkZXlsj8ubNQZ0Ih4gImZCzoxc9cKIeoJ4LnGQwDOCpnbXBdklBuodmJsNc9RWBj3gwlqBqX18GXVVDhuMhcS1WZ/L3BNqY+jeyhCG4i+bLtR0jxtXjjI6sHquBYm2jo/5y/KbO7B1kMAibeVZrCTSy+oQ2Zw080XCS1XF4uqYAukrRKgSRPDww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VIy8ZUB/NgfjeefF4i6i7qY3bhCt9eOE3nzDD9DMYVM=;
 b=r/NFQ8XQ7L3WbaQGms5QJSrEtpTU+We2QMmT9x0p0p3PsPzSuwk7M22hLSn7Pqh2XebQINnq3o0wYl+XVScD5yPpYiF4q4HImEuI98vwD1WiVOr4BTkSXQGMMNasyrrgw8bmAlsKFrTYNygQq6QwyJfN9DEyikDS7W/Eu0qCrtz0XuMucPNr1djhD0eoS44y5TvSHdp4tZdDiYh3wkOnfo2j+hAVNeYDtZUnxpEWJLSvkneLO9V9uKM8WxPsQObPw+0cE5AxW8XzrvcupTF9GL5EWkiMC8rGCNuoY1O9z9bJZKAz2p+aMIpuxmwKvwX28lc2BK/cgEfrSHC3Z/jhig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VIy8ZUB/NgfjeefF4i6i7qY3bhCt9eOE3nzDD9DMYVM=;
 b=tyIOBi3K9AYhwVkHBdfbZ6W75s/4hgLRqbn2BKB8AM4L+q8bRngHIg/VhOkVeTDv6cH6pXH+vsvwAGX3hvqD3YqMSpgJmOuaRMBebwGxn7bUQ1QsqNPMq6PsBkMLJfMQWrFJiyw/idB9Ly2YWyLL0owkm/3+E2MRWdoSiWjDZoI=
Received: from CY8PR22CA0015.namprd22.prod.outlook.com (2603:10b6:930:45::14)
 by SJ0PR10MB5718.namprd10.prod.outlook.com (2603:10b6:a03:3ed::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.11; Fri, 5 Dec
 2025 06:15:50 +0000
Received: from CY4PEPF0000FCBF.namprd03.prod.outlook.com
 (2603:10b6:930:45:cafe::2d) by CY8PR22CA0015.outlook.office365.com
 (2603:10b6:930:45::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.11 via Frontend Transport; Fri,
 5 Dec 2025 06:15:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY4PEPF0000FCBF.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Fri, 5 Dec 2025 06:15:49 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 5 Dec
 2025 00:15:46 -0600
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 5 Dec
 2025 00:15:46 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 5 Dec 2025 00:15:45 -0600
Received: from localhost (dhcp-172-24-233-105.dhcp.ti.com [172.24.233.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B56Fi0H2818346;
	Fri, 5 Dec 2025 00:15:45 -0600
From: Anshul Dalal <anshuld@ti.com>
Date: Fri, 5 Dec 2025 11:45:43 +0530
Subject: [PATCH v4] dt-bindings: arm: keystone: add boot_* mboxes to ti,sci
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251205-k3_syscon_add_boot_mailboxes-v4-1-8e216fb88941@ti.com>
X-B4-Tracking: v=1; b=H4sIAI54MmkC/5XOTQrCMBCG4auUrI10Jk3auvIeIiV/atA2kpTSU
 np3o4joRnH5zuL5ZibRBmcj2WQzCXZw0fkuRbHKiD7J7mipM6kJ5sgBck7PrIlT1L5rpDGN8r5
 vWukuyo820qrgqIypq1ogScQ12IMbH/xun/rkYu/D9Fgb4H59wgDf4QEoUI61xPKAkJdi27u19
 i25qwO+S/hDQppTaZUGW5SK1fAhsX8kln4SAjiXBTJh9EtaluUGu9DwTlkBAAA=
X-Change-ID: 20251105-k3_syscon_add_boot_mailboxes-8452bdd98962
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, "Santosh
 Shilimkar" <ssantosh@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Andrew
 Davis" <afd@ti.com>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
	"Anshul Dalal" <anshuld@ti.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764915344; l=3828;
 i=anshuld@ti.com; s=20251022; h=from:subject:message-id;
 bh=mOP6aw6KUkFg4y1CegBX2z9CY7qxPxIcluWsqDS7ANY=;
 b=6K5KTiIGsyY9br44fjYZZr+X9C0P9WQA2xAlxXuiy+EY6aQajPKWzFYpPXUvsPVNCdCel+mAm
 S/k9LAiCmFECpRRsc0+zA7qbd/+HrXsOUJ4+lcKo84ZivbAgJdBeLjO
X-Developer-Key: i=anshuld@ti.com; a=ed25519;
 pk=Kv8FlQElcrR6efyEHmjtE83y8e0HKvqPyvVY+PJ4UFw=
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBF:EE_|SJ0PR10MB5718:EE_
X-MS-Office365-Filtering-Correlation-Id: fcfbd553-c9b5-4f69-fa72-08de33c5bca8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Mkp3dFF0bjNmRTNPV2NDd0Z5S2pYT1hzL3NYTkt3Wlg2OUxqRU9KRnRCOWxX?=
 =?utf-8?B?ekhabEg5K25ESVl4UWZ1L2tRRFVOeTZnU2NaTFJZQ2NCd1ZuWHNFTTVBLy9D?=
 =?utf-8?B?L05WNHdVMUx4N3NCR1Z0U2hlV09uYk5kRktMdCtVU2tCb3VPSERldjJnbjVE?=
 =?utf-8?B?aW5TUmlrNWcwL1k2bGFwWWxDMHg0WGVPVFp0YXFCT1RMbDNkUzZXenI5dlBI?=
 =?utf-8?B?bnNVbmw2YXJOZlN5dkdnY3ZFdSs0WTBST1VCQkRGaVdTRlgyNHoreGM5TFFZ?=
 =?utf-8?B?MmJpeHIzR083MDBWcWdJd1VtM1NHRXdMZHRUVFNPY0wrSDBwWFM2MVVJVThE?=
 =?utf-8?B?SlZUUkNkckFGQXQzMm82V3h0cFNPeG1hTXFFcEdYSWNFem9tMlM4S2IxbmxQ?=
 =?utf-8?B?SHZOMWdGVGdlcWt5dWdOR0w5SWJjV29qWUdaLzZ1R1hDUU5BNkllRFBUSi81?=
 =?utf-8?B?Wi8vTjQyNXZhelJJN3lQb0N4MUhWaFc1dzdQbVYvd0Y3ODlWcllkVmZCekVm?=
 =?utf-8?B?MHd1dG5FV3dsK1JwejVLZEFNckJRVHEyKytnQkx1dXc4RksxQjVXKzB4aElo?=
 =?utf-8?B?MDR5WDFNOFRXS2c0eGF3N3lNUjY1WkdZVHhyNzF0eEpYb1JUWUdxTW1haDZI?=
 =?utf-8?B?SnRWcm54RHpHVEJYZ3RPdFYxYXVuZjl1QU4zTDJ1UGJNSDJiUzJQSVNlUFh1?=
 =?utf-8?B?NlBETVR0amxVS204VEF2NTBuNEh3NlIyL1ozM2p6OFNNOUpHbVd0aDJEOW5r?=
 =?utf-8?B?YmhuT2tTUGgxcTkyTTNIOE5JMUlpdXQ5RHBVWGlEVDl4b0JRUWJ4L1IyNG9O?=
 =?utf-8?B?R1J2SGlRdm43c0dvM05icW5vY1hPQ1RjZ0RQVzZGampwUW80QU9KeGJJWDR4?=
 =?utf-8?B?K0d2bWZSeXY3Y2xXVFI1WlJXa3ptekk1YmhPZ2FDSEY4MUNEbXRZc1F4eE5I?=
 =?utf-8?B?VlB2TTRBNzVMa014bnFpb2diUTl0aktUYjhDZkNWbDdRR3NzRWNHay9NeVVW?=
 =?utf-8?B?UFRQVFdNblR4WEg1SGlwQWJITUlma3poK3MxWllteWhtaUdXdm5mdlN4Nk5i?=
 =?utf-8?B?UjdiNWN0aDZwVHVxRnQ2YmI1QXlRY3pPb2M2Z3RVVEk0c0RuMGxISURmaWJ4?=
 =?utf-8?B?VnU0TTFCNWRqY3o1dnphY0liTkZ1aUl3UGJMNWFKM1dIVWJQc2Y3YUxwenR4?=
 =?utf-8?B?VjJoemJYd2pDNlpaZVdJSWc4aDJieGVsWjFSUktHOGhRUUJIT3g1am5tWXJ1?=
 =?utf-8?B?QVNPcEhvYUMvcDVoYUk2TUF6UFhsT09sZ3p6NlhnR3pTcnZXcWpiTjd0WlFZ?=
 =?utf-8?B?Tk51QWpsMkNqNGRPK1diS3FUZEFJZjJHcnkwZzd2TFVEY2g1RTB4alArbHlE?=
 =?utf-8?B?MVZGK0FzbjcyMGhoeWx4UFdEWnVxMHJ0dE9NSVhSajA5bUtpK1hwK0NtRGM2?=
 =?utf-8?B?NlZGczZmZGxFVXlRTnVZdjljZnMrYzJjZHBwTjNOaFI2ZG4zMmZzRXh5OUNz?=
 =?utf-8?B?UXdvTTJFMVBhL29MZFYvS2p3ZXl1czVOMzRpa1puMTdGZ3JtTVJIM214OURw?=
 =?utf-8?B?RWFCK0JRYzRidEYwVUV5cDRlQWFrL1F6eDFoMERsbTY1SmVNaFN2T29NMkUz?=
 =?utf-8?B?djFoWVFKbHFOSHdwZ21VT0JEVnFLcXZEbDVwek1UNjZyZHExaXY1SEdXM0Jh?=
 =?utf-8?B?bnp6d0VOd2w3RSt4Yk9kMXRKWUFBR01Wd0JEanV5ZWNKNHE2TjFYSFFsbkNX?=
 =?utf-8?B?cWFSNWV4VCsrQUtJaDc1bTJqaUJtNitZdkpGREZPbHNiL2ozZDRhZHJaR25p?=
 =?utf-8?B?ejRUQktTeExYTHZ1M2tkdUNsK0gvOXBuc2l2VXdYQ0tOTm1LU2FVcm5HNDRS?=
 =?utf-8?B?Rnk5b3g1TlVLVWp5djZVQUNvR2VXOEJaYjA0NnN0cFZPMzJoMk9CWkJ3UVBs?=
 =?utf-8?B?OUxDcllST0pPejFibU9MQ2NIakNqOG5aZlFYWkVHODh2NWdBdjh6M2VGblM1?=
 =?utf-8?B?d0taOTRkZDZwVDhGRmFVTHZlajh6Vk9qbGQ5UzU1Zm1DTGRCanRtWVdLa2F1?=
 =?utf-8?B?bUFiemFnVHpObHltdEM2cGhJa0x0TVN1ZTRSMjVpcW9Lb0U3YUt0MFJScFQ1?=
 =?utf-8?Q?1iIo=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 06:15:49.9041
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fcfbd553-c9b5-4f69-fa72-08de33c5bca8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCBF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5718
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_221558_450604_0F742E2E 
X-CRM114-Status: GOOD (  13.00  )
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

Signed-off-by: Anshul Dalal <anshuld@ti.com>
---
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


