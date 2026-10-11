Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0362CA9EBD
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Oct 2026 11:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4NIZXz7Klag+OOC+SxNPu1LtKhqsmdelKQr6opJ8pG4=; b=EhnHqZtLxDOa/lEWOjxqE1gFR5
	rhSlwN3dk4FuT1G1SQt3P8v1GaVIhXJDuoObBDxIiDNYSusRsBX+kgRvI0rLKXV7+B6DGp9WvhA0b
	dzJSeW2vrsJ0kWyP1J2mXDiTcVtzvB6Ul9ZGWaRShGKJ7bw2N14H23rFOScl5MpoKbCHP2llDD4f5
	A/oYMqsMnR6fRAHnQ+fH7G9PmMYmt8zsx2J2H02hHittPkgDDD/Nsax6Qsjw+kzcpx8EHRVI+s7k5
	SgqFbj8HBJzZuTpYca4IGmO+AInJaVUn0eH8NcCAnkoQtitDHbhdqQ7rDuvbYT64Eb2f56tQKBEos
	rThwQ+DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFri9-00000008wXl-2tCc;
	Sun, 11 Oct 2026 11:27:25 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFri7-00000008wVc-3gSS
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Oct 2026 11:27:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FMRPtD7yIZ0vSdc0T1s/Y2pUZPGNI8yU0NFt7kFXGhW617MbzXEj4D1leCMDtstYoudFZ5g0FW33/Ofzh1ZgrYNX2R020FGiwxBdKqVvbqrWjVerp8hew9Ipwvr4xuu/U44kqNBoeb8ofmFxWO9euVzWcmIeRIuEXCVVwJosun+a+y3IzDmNg0cvffS8N3zViY1HZxpBJmxkPxZAC3O66yNjLVlwZCvAEP44T/dRUn6kHFUSDJAl7k72xc4R3qyUksyC4jWqnZuYTFxodmmLVi45m4kk5QC6VOfgS40RqNDduW0TXDJpxpXVVfTqmQX+E4flVXSt3Xsn1mn07xk8iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4NIZXz7Klag+OOC+SxNPu1LtKhqsmdelKQr6opJ8pG4=;
 b=qkMto/C3rSwXMR0VpcuF3VbGRFKzXb0bm1e5T/k0NE/55O1e6+R6kh5HK0Sdh0FYzTFZ0m1Ao+NEq7P54wxg0uv7wnGBcuykPSMlCtGLvRkZU63QH2Fi9qGl8/dB1xQME2VJ905Cp60MMh+fmGFK2RGELDUnfJ+i0pIAkvxbyifi9IAPUa3ueNktQQ5RFqDjP748O9F4M1Q4Py4upXw4EH5DGJrbi6hChqYT1RuqlhGjRgeGwURvVbBIV0uPXl8mRbtTiUoBDqhsY1pxWq4fgP9OynXVxugQxRcjpj+Z6elzy9A13gxSPbMcuYyZS61iR0mS+ANXH2azos5E8FbueQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4NIZXz7Klag+OOC+SxNPu1LtKhqsmdelKQr6opJ8pG4=;
 b=QWsCI/ftYyK52PxMnORfEjYo8qUeMBtpzBZFlYZ0mMDc+6fgGF38CXUORdkTbpqAJtZSkAbFjnXAlUic1cH3SKYIAcGR9rnYwGHPUGQNzXVtDKamAwnf+YLmFxjBqGOxa2JaOhogLwuBa/07GibHhYJchohdabgI5hsE/h4Jss17XTNrVgxVo39CB912y5z/e2Rt9e0/QIIG3Nt85m9jjSdjjs7N3S8iLNt0hNqSyv83/B3az0IJh74z1v6i+5fHBTLEnxn3wZMk2Ehdx0SsVi4I8m+KQSFmfek/U06iZlUeaezh3A9tg30eT3K6ZiPOu4otqRb5FGNEsa2kX6eyTw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by VI2PR04MB11171.eurprd04.prod.outlook.com (2603:10a6:800:29a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.20; Sun, 11 Oct
 2026 11:27:21 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0496.019; Sun, 11 Oct 2026
 11:27:21 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sun, 11 Oct 2026 19:31:28 +0800
Subject: [PATCH RFC v6 4/5] iommu/arm-smmu-v3: Group aliasing devices into
 the same IOMMU group
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-smmu-shared-sid-v6-4-cb76b89dc612@nxp.com>
References: <20261011-smmu-shared-sid-v6-0-cb76b89dc612@nxp.com>
In-Reply-To: <20261011-smmu-shared-sid-v6-0-cb76b89dc612@nxp.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, 
 Jean-Philippe Brucker <jpb@kernel.org>, Nicolin Chen <nicolinc@nvidia.com>, 
 Jason Gunthorpe <jgg@ziepe.ca>, Thierry Reding <thierry.reding@kernel.org>, 
 Krishna Reddy <vdumpa@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
 Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.16-dev-7bc12
X-ClientProxiedBy: MA5PR01CA0151.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ac::11) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|VI2PR04MB11171:EE_
X-MS-Office365-Filtering-Correlation-Id: 7dee7de0-0f9b-4dc8-5a66-08df278a9d57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|19092799006|366016|1800799024|23010399003|11063799006|921020|56012099006|22082099003|18002099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info: rPTTtuMi7oNkrq8C3OQstlKeB2SwEtYzJoFrYJntYikKQlv5ULJEr6dA67DF4nvjLsuz5eYe/RH9/cXhE9M7jvDLx5QEIVUHWQqecdJbSJhkrJoLt6O8D7e9F/BQeGuAFFBUhg7/HTzx2CUU8xSaDqSQJM8VFgK+HdzRCdNF+HAyIOOiJH7SpPCwZf4hy9KuXjC2qi0LFD/5+d05PBBmLSiMWhRFt+jM8yhjGlV/s/Wz/RpE+bLKW2t93aEwcro89sDeU9vODpIvOsD79WDKWkoUSQ5XqiDGEeoGOw1J8gjM4GZnLUWWg5nlznZIxrStpuaixszXi8S4Wf5EpiBWHZ/EFmlA22UME3/KZtr/oaQY+HAyv/1J9jFrCkkGPRWw6G0WADmHu0sz49MkwUKYi2uV8DhnQ3nl73KbGBVFNnfmH4+jP5BY+offkl7B1OnRfU9tHKW9deOVJ9zXdnxBq/Ahn/c2QYnTYJzQ/0ZR7QrRUA8PO6dyQt7g4LZnNxQpS1xMClmmp7FNoK162v+/N1FYCI6uhVPMn9CYMEFkH2j9zACbnWe1mtdlT7VMbsYzyeuMFnDbL0iMm6bYLb+AsZd41ZKQn3C864f8avBiDc2EHpVpArGAAVjekEA74FUBeP6r7/zPvRvNYqezS2QEqnhnFdXvN5ugyzVZgcD6WHMYW3cQOG9/IXcvs2coC/StabD/VavflvAK1cYgqe/5jw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(366016)(1800799024)(23010399003)(11063799006)(921020)(56012099006)(22082099003)(18002099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TVJhYUZBRTkyeHpMUjh5bXprMkp5RHFjWVY3TStOLzdObkZxeEVYVkFIRVJ6?=
 =?utf-8?B?VHpyT05KajJ0MTU1WXB0c2h4Rm90T25ENW1zM20wNk9tRUN5OTloU1NreExC?=
 =?utf-8?B?eUNYbzRsZ0lSODRkaUNpNjFnbm5XZCtOMFhrOElqWnVzQXk4QmZkQkM0di9l?=
 =?utf-8?B?ZGxkZ2t5Ti9MUnBPQVU4RkpSVDZnbzA4YjJGbGtPTCs2R0oreXVBZDlya21x?=
 =?utf-8?B?Y1VDZjlWYlkzeTNrYWhSTlRkb0ducHhRclRoMERjUmVvRDBQeUNFMnVzL01X?=
 =?utf-8?B?NFRXM1RMbHNWTjEyaG92STlLNWtiSzhQLzFYR2tKQTgvMjRBbExOclZZcEV4?=
 =?utf-8?B?b0ZJMFZrcUJtMlpYNk14cEVqbGY3OWxYUXN2SWIxNkR5SVU4TnJ6YzJ3Y2pa?=
 =?utf-8?B?bWlEQlVIb28yMVNDK21WN0JzSjhEWFBYT3ZzS3MzRGh5bW5iMHVSQ0lJQzFH?=
 =?utf-8?B?MjJwYlVNaVJsRUtseGEzUk9pWjlJTExVV3NWM0lrSmN2ODQvYnd0b2pVM0ZE?=
 =?utf-8?B?Rzdta0lVRCtCMVNwS1AySisxNG50dk9DTFNDSlpIWVU1OCtJLzNSNDVyUHVL?=
 =?utf-8?B?Q0piMFlqNzB5ZVVEYk93WE05UzM5ZkMvQzhlU2dzM0tic1o1OVRUWVhMMlNJ?=
 =?utf-8?B?RndRRmE3UFV4MVQ3Z1M1MTBYLzBCc3J4Y05HeWxITlRQckFqN2NXYmRYZ0Fp?=
 =?utf-8?B?MGFVWVUrMWx3NUF5SDdDNzFqV3R5ay9RZWZSMWRLTE9BOXJwU3E5c1p1Y3dM?=
 =?utf-8?B?NU9JUnZabVIzclZ1bE1YUHl1MU5QYW9XVlB0VTlBQUw2a3FXOG1LQktTVkZY?=
 =?utf-8?B?WnoremQ3RmJyL2pIWnZ3Y1pocC9zMzZuMGZiNXNqZ2VsMHZOL0hMQ1NPVVBV?=
 =?utf-8?B?cVVUQnk5VGNRMW8zVUpPZ1JzdDVCSmtrOE9yOUNUOThUcEZLWjhCQmxPYXpl?=
 =?utf-8?B?elJkR292dHRsUVVTcEg4ajJpQWY5ZHVyaHo3SzkvQ1oreldUbnAzZVFUZGVu?=
 =?utf-8?B?Vk8wOURobkRXUGx6WmZBY3pmOUp2dnVRT1FsUFd1ZTRlSklhVVhQODh3dkxK?=
 =?utf-8?B?dmZ2REdaWmlKWjZsc3NZa28vVmRWNWxlZ3p1TGRqWVRZbVBKZVVnYXpjQmQ0?=
 =?utf-8?B?amlCbFBBSzJKUi8yOWpoYUhtM3MreGNyZjM1SklzUkQ1bkF0cVQ4SXd2U1gw?=
 =?utf-8?B?MFRqSWRPOG5xRzU3V2VLclB3NFFiWDh0dk1CZXlsV3FTUVNRV1JlZTg1MURS?=
 =?utf-8?B?bFF5OEhqTy9Ocll1bE5PbGluZ3ZvRnpHOUswVFpFZTh1b2gwYWF6K1VETXp5?=
 =?utf-8?B?Wi9JK1paZ2l0REJFN3RoQkd5d3lFTEhKOGpXNUR6dnYzTlBrOXJEU2FxMUUx?=
 =?utf-8?B?bE0xQm9nU1pZSXdkYmJJL2tmL3FIZnBFMGc3UUhpUlF5UzFTbklQeVlnMHdI?=
 =?utf-8?B?T1daVy9SdDZUODVCSXhmOTI3QmZTUGVoUjIrdXVHSXA1dGkrRjk5dmVBdUZU?=
 =?utf-8?B?R1RFWnVhbzBsOGJ3dDJ0UUhKRzY5dXlEaWxCL1h2ekxlY29vYTAyMGhjU1R0?=
 =?utf-8?B?eklOKzlQR0IzTVdEdEFMZ2drWWRqQmlBZ3dDYTg5STNYem5ERWRhSVp2UHJp?=
 =?utf-8?B?cVI5NzluLys5TWtVcmdoUlhrbktNbnBCQmNtT0Y4RmhtZG42OHJJdTNCY1l5?=
 =?utf-8?B?YVNUVTlSdjB2dHNEcTRTeHNuTmVqSHdyN1Z2S1lYbEQ3b1R2NVlQVHdnTGN3?=
 =?utf-8?B?WndmRHBENFhZNFM0RlUxWlNJZjR4VzdQMTRWZ3JXb1pxaWsvZS9wUXpwcC9G?=
 =?utf-8?B?VmJnc3Bmc2JrYVhuUmRQMmhPbms4bGY2ajZmYnFieUQ3dVlHVXVLTTVMTEpL?=
 =?utf-8?B?dUlUbDQ2Ly8xMWZLSUJlZWZsZmpuTDJrSXdkbTAvNnR3MUhVM1pCN2NsVE5R?=
 =?utf-8?B?aGV4VWZJQjIxa0gzTFROa25aSXcvOFd4cGFnSWZoTkVmWkNtRjBFTDNrWmhw?=
 =?utf-8?B?R0dURXU4ZXZ4dGI0RktmdVc0S3JrUmd2SFRIVjVLVmFaSnE3R0JhWlNOL1ph?=
 =?utf-8?B?RTVqSnRXSVRkNUhRRSs0eitZMnNBSkx5ZmFxenZYOXJTNFhLWWpwbkxWM1o5?=
 =?utf-8?B?YjF1ZHlJbVFZcTl4MnZHdGI5anV0Zzc3T0VXOVo3MkY0MUVrNnhkYlFlYm1n?=
 =?utf-8?B?Z2FmU2RpZEhoMG9MMHBvNkh4NjVtTThmZU9YNFRad3MzRUV0eS83UG13QVNW?=
 =?utf-8?B?TlJRcHprY0trUE0rYk9RTzM2T3lpUHdIR0x3YjdhK1VHZ0ZwTzlZK3h6b0Er?=
 =?utf-8?B?S2E2NTdrNUdzdkVnQ1RJTldzRTZMSm4wRStJY3BsZkhWUC9hT0l0cFdNcVAr?=
 =?utf-8?Q?EQIyzgC0+NHorMlGbxHDHajeH7t503M/tFHMg?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dee7de0-0f9b-4dc8-5a66-08df278a9d57
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2026 11:27:20.9529
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dNDo+RBgjee6A6LGjoTVG6UaKiAXyCtVpl0PLoNnjz8OPKqxt7p6iTpS++CLAEieT2wiO8+hf0hRdgcZWmjl25WBIxWIKO0gX8vKuTtTYIDGi9WY2WTugpzykQhPdk1v
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11171
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_042723_946113_A7AB0739 
X-CRM114-Status: GOOD (  13.81  )
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

From: Peng Fan <peng.fan@nxp.com>

Devices sharing a SID must share a single IOMMU domain (and
therefore a single cd_table) because the STE can only point to one
cd_table at a time.

Detect SID aliasing at group-assignment time by looking up the RB
tree for existing owners.  arm_smmu_device_group() is called before
arm_smmu_insert_master(), so any RB tree hit belongs to a
different, already-probed master.

Assisted-by: LLM
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 33 ++++++++++++++++++++---------
 1 file changed, 23 insertions(+), 10 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 351ccdfa765b4..328d580935b96 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -4572,19 +4572,32 @@ static int arm_smmu_set_dirty_tracking(struct iommu_domain *domain,
 
 static struct iommu_group *arm_smmu_device_group(struct device *dev)
 {
-	struct iommu_group *group;
+	struct arm_smmu_master *master = dev_iommu_priv_get(dev);
+	struct arm_smmu_device *smmu = master->smmu;
+	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
+	struct iommu_group *group = NULL;
+	int i;
+
+	mutex_lock(&smmu->streams_mutex);
+	for (i = 0; i < fwspec->num_ids; i++) {
+		struct arm_smmu_stream *stream;
+
+		stream = arm_smmu_find_stream(smmu, fwspec->ids[i]);
+		if (!stream)
+			continue;
+
+		group = iommu_group_get(stream->master->dev);
+		break;
+	}
+	mutex_unlock(&smmu->streams_mutex);
+
+	if (group)
+		return group;
 
-	/*
-	 * We don't support devices sharing stream IDs other than PCI RID
-	 * aliases, since the necessary ID-to-device lookup becomes rather
-	 * impractical given a potential sparse 32-bit stream ID space.
-	 */
 	if (dev_is_pci(dev))
-		group = pci_device_group(dev);
-	else
-		group = generic_device_group(dev);
+		return pci_device_group(dev);
 
-	return group;
+	return generic_device_group(dev);
 }
 
 static int arm_smmu_of_xlate(struct device *dev,

-- 
2.34.1


