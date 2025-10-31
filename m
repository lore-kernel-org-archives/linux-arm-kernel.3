Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3A7ECCFA07
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 14:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=afMCd5oEeVoIa+OoTubBjb1KR2h+YySiJlwRYYF1ijY=; b=xagEocJUFpc/2K6GoGYPPjN6QV
	wImepp2nuMf0Ei0bq8YvfTkhGPJGJ2mC5jqujzgOgrz6+bWygHHWS3iNlkWEswcBR3Gdnop4W9AyY
	Ia+4inn0JZGeSQ+D/SxNabWDEDd1NhHVreBQfkgZWNHuegnKxWGqc5q8IFItJFW8OA7FS0igkYQ4f
	QUY8a4yBbKFsTCNazHq8gE4HRsgsUktW7rQH4UfrA99Wkr8CE9s5ZpL4JVG1LI4fuStDZIN+wEWiK
	idZuZlRTkBcMKsEK9tKwJI//F6eV20MW7JqgmvZpp4LJpB4EJx7bqGIoUbkp+i/zbZBeCoUkKUuWS
	4zowzhbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEqLi-00000006FsE-1goL;
	Fri, 31 Oct 2025 14:43:31 +0000
Received: from mail-westus2azlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c005::5] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEqLa-00000006Fob-0IMu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 14:43:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LfzXP+Y6ON5I/NMiyt0dCed96nBl1kNmu//BVLvTDOTqcl5Q4MEVnVN/wcaz+1qDLwhQV1iU9+l+mPkkov5QkFTAuy80k3arpk1IhdzdfzB5/7Vpx5ph08LQetiCVrQBGhCi2Wjfu5D3+W1+UPwQxbC7Yi5QYN3tkjtg8QLvbzD/rC1lUco0aFoGSapR8DQJjAVjheNNWNDAXlZrY5eIMdl/uT3k4IjmPp+qezMuB1l/6POJ5hsJTq1TXGFh7kKxUEFp9aNu3WVONunErwtG07kTmckcjaWAVOnrkP287BsrzbNxpDcojhxYOTk6GExalhSsh17bq+5xSeq3rHVBzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=afMCd5oEeVoIa+OoTubBjb1KR2h+YySiJlwRYYF1ijY=;
 b=SoVbRr9qEXdNxp766mM7j7Vs9XnzpNDH7skfQmiOKBNeeKRTo9CnFzxWhf0iMajiDlyEAF3ZSel71342KOL4OFNHJrZ9jfdEqDEXP7LUqHxM3KMZ392DPv10lRzZR2Lz2gCMM1cDxeinjQsdvLVoqhIqkbrfJeQ3HsDOeC7OD4TwjfbMlqCmkpTPku4I8Vzm6vu9JO5ejyDCwBGQZ33M+yc22KE3pqmqMEMoL8Hz/J1/x/t72QBBC6aUoNoQ0AdUoyEQX+Cm3sa26XPFgKToR5WWKAxgGBRa6um9fMpbc3wa1QHFR7deFHnDdYt2pYnA8ouvg5F0++SZ8pWhYTnjMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=afMCd5oEeVoIa+OoTubBjb1KR2h+YySiJlwRYYF1ijY=;
 b=vH4coX8lLsF+1LzD6AltzQZq8U6vbMknSEHxPK1HEAsubKFfX2kmmJ+JUjO23NtvCx38JgkxdMpA6nKyT6a/HO/1QhbYZNO9598KGNJeVxkZBlO+HH3tYdDmga+5sM2a8ldOWOLyk5PtHg1wBsMCxF+aXF2ci7m1MgRNyB6qNdY=
Received: from BL1P221CA0039.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:5b5::17)
 by CH3PR10MB6787.namprd10.prod.outlook.com (2603:10b6:610:14c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Fri, 31 Oct
 2025 14:43:14 +0000
Received: from BL02EPF00021F6E.namprd02.prod.outlook.com
 (2603:10b6:208:5b5:cafe::7b) by BL1P221CA0039.outlook.office365.com
 (2603:10b6:208:5b5::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.15 via Frontend Transport; Fri,
 31 Oct 2025 14:43:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL02EPF00021F6E.mail.protection.outlook.com (10.167.249.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Fri, 31 Oct 2025 14:43:13 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 31 Oct
 2025 09:43:04 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 31 Oct
 2025 09:43:04 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 31 Oct 2025 09:43:04 -0500
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [172.24.233.103])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59VEgf5a4024498;
	Fri, 31 Oct 2025 09:43:00 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: <nm@ti.com>, <praneeth@ti.com>, Paresh Bhagat <p-bhagat@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, <kristo@kernel.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <khasim@ti.com>, <v-singh1@ti.com>,
	<afd@ti.com>, <bb@ti.com>, <s-ramamoorthy@ti.com>
Subject: Re: [PATCH v2 0/2] Add PMIC support for AM62D
Date: Fri, 31 Oct 2025 20:10:58 +0530
Message-ID: <176192142806.427883.17692174298587747881.b4-ty@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251028213645.437957-1-p-bhagat@ti.com>
References: <20251028213645.437957-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6E:EE_|CH3PR10MB6787:EE_
X-MS-Office365-Filtering-Correlation-Id: f13a188f-5f53-4626-ba4a-08de188bd1d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|36860700013|34020700016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OUwwMEdVWVYzOUFQSlZxRWN1Mjl0ZUdWbUViYkkvY29nRFFVbXZCZldYUkl5?=
 =?utf-8?B?eW5PRit4RlFTdXJVNzN5NWMydi9iYTRTSWxOS3NiNVFCSTR5bkc1TWpBbTFS?=
 =?utf-8?B?Z2tQRWExTlJyVnZPTkwxYkcxNXI1Zm85Rmo1VE9DcmxZcUdHbkVGY04zTW5F?=
 =?utf-8?B?YW93QkNEc2U0M2JTOWlnZnpSeStONzlmcFVPOHBoNS82aFdwNVhWdTRBQThH?=
 =?utf-8?B?VWpjaWQvVnB1QncxdzY1cGduRFczSmRXWUdzMHZhdDI0eDBhcmdGV2dNZ3kx?=
 =?utf-8?B?c3dzMkNiRUFTa1hXWVNZOVhBWnFnUjdtY2xpamQvL1lQZG1kYnF1bS8xOU8z?=
 =?utf-8?B?OUdyTnRsTW5LV3BYYUlZbDJDOXo0STV3clBteHJmc2F1aFk5c0lQTFR4Mmx4?=
 =?utf-8?B?OThIamJsSkNlVVJqdE1oeUhSYS9FSmh1M1VKb2VSR3pzSXRvS1dpMUFOK3dD?=
 =?utf-8?B?Zm1WVlJ5N2lRcmpLVzN3TnBlQ3dMV1I1U3JOOXd0cmpaZlBKa2xMNnRGZ1JB?=
 =?utf-8?B?bGdtNy94c1lrVFltS0NFa3haek0vRVhLVkdKM3dOZTNkUVJvcHZkQnBVcTM1?=
 =?utf-8?B?bWtMcDJGQnJtUjlzSTVMdlVmcHBoeW5wTXM4SUxDMmxKZTRZR3pDSW5VK3o1?=
 =?utf-8?B?NXdCUWtrajY1T05pcXR2MnFUMGhwODErRllrKzVpbXRnOTkwbWs0RzRrb25h?=
 =?utf-8?B?THBnN2RQeHptSUNnSkI0dUQwd0hCc0kxWHd4czJCRWNvWXR6dGNYTU02Y0JU?=
 =?utf-8?B?WmdyUXljelVxNWFwZU5Ga3lPMnQvTjdlazJqYlI4OVRSWDN4Vm8waURnSDFk?=
 =?utf-8?B?TVlRWlBOb3h1dlRjZUZkOU9hRElKcHBDeXg1aVdDREs0QjZYYzJhNHIyelFC?=
 =?utf-8?B?N3NlNU1jdkIrWk1ZZ09GZHI1emJWNjc0NmV3aU0rcXFmaVE1bXo3K056aE56?=
 =?utf-8?B?YkFnZ2x2ZHlZRTkyek15TXRIYVp2TDJySlYxdDFxcXRUc04veWk2dGVqWkJx?=
 =?utf-8?B?SFpmV2w0R1ErcGYrSnRqazdtU29BaHhwVnJPNG81SmhhT3FDcDNJTGdmVzRO?=
 =?utf-8?B?em93Vk96UW15NXE2bHpIRUJHSUMzbG9oYWIvUittZU8vQ2p4UDg2d2NCSUM0?=
 =?utf-8?B?b3BDbE16NlQxQmhWdjBLYmp5a0x2eUN6YlR1QWMvRkVtZnFqKzNLTUVYNHRC?=
 =?utf-8?B?MlZ1VkN1NG1wQy9INUl6NitlOWtGRll1L293U0NhYTNjdGhnS3d3Z0RkV2FI?=
 =?utf-8?B?MXVkeUg5TlA4TTRvMWNjSXZNMldQcXdpcGE4bTlGb1Rjc2FUVVhPdXp0eVB3?=
 =?utf-8?B?SXpqN1JLWkhUc2luSmlpNERrQWRmbks5d2JXUERXZHBJZk1YRHRqQ2J4U2w2?=
 =?utf-8?B?aFpiLzBWdW5Hamg4Tnp4aXR2VndpK1Jhc0J0bE5ZR0VPNFNndElHUW9sdWxl?=
 =?utf-8?B?WGEwUGFLRFRYUUJCVE9Scyt2VEgzTmFjQmROU29pWGcxNGVMb2p6MXBiVVp3?=
 =?utf-8?B?K2FyeE41QVZHRTVSelJIK3ZIZGxoOUJMYnd1TzUyQm93T25ueEw1b3gzZC9D?=
 =?utf-8?B?V2MxenZ1bHoxWTQ3YkEzNmh0L0NBZmVMNCtOeHU4SkRET1lQY24xaDBlN1pY?=
 =?utf-8?B?ZG5qTitiM2EyNnAyWHZkc3RJU0VJY0craW1ueW5Ec2dsSDAyelNHS3VsT2h1?=
 =?utf-8?B?Q0d3V0ZZL3RUNWt6S0twRGVZcmhUMS94WHBkNWxoVU1DVzhVNjZ2QVpRTDNq?=
 =?utf-8?B?TURKdGVzZ0pmOVVLaTdrT2hOK1lGelVxRnZ0aDMvQVRzZ2FISW5XOGkwVnBK?=
 =?utf-8?B?NHhHcnY2YURWWS95YnFNOW4yWUhMYXppa1dLekFENDBhb2dpclg1dmh3Ymts?=
 =?utf-8?B?akl5c3BXTWh2aHNxSTA1a3JpN3I0YVZTaWVtNkJhTXBib3E3M2VabC9kcGla?=
 =?utf-8?B?U1ZWdlBteFEzR1RTVXdNQ3NHSm1mZ282MHZxSUhhWHBMRWZmWGM0R1dyM3o0?=
 =?utf-8?B?cFJTaWM1S2t5YWIyNlcrWHQ5dlg4SHcra0tPcmxObWNyTjE4dVJSblpRTngy?=
 =?utf-8?B?VitxaGNoRWZuckhtbHFkdjJobGdKanlqVG9IT0tPbUdFSEFFNXpGSlJoaWFU?=
 =?utf-8?Q?asFw=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(34020700016)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 14:43:13.2163
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f13a188f-5f53-4626-ba4a-08de188bd1d7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00021F6E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6787
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_074322_114508_865B3775 
X-CRM114-Status: GOOD (  14.95  )
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

Hi Paresh Bhagat,

On Wed, 29 Oct 2025 03:06:43 +0530, Paresh Bhagat wrote:
> This series adds PMIC support for the AM62D2-EVM.
> 
> The first patch corrects the PMIC pad configuration by wiring the
> PMIC’s INT pin to the SoC’s EXTINTn input.
> The second patch enables the TPS65224 PMIC on the wakeup I2C0 bus.
> 
> Boot logs
> https://gist.github.com/paresh-bhagat12/11dee1b07be3019d5f92f893fa11229d
> 
> [...]

I have applied the following to branch ti-next on [1].
Thank you!

[1/2] arm64: dts: ti: k3-am62d2-evm: Fix PMIC padconfig
      commit: 394b02210a81c06c4cb879d65ba83d0f1c468c84
[2/2] arm64: dts: ti: k3-am62d2-evm: Enable PMIC
      commit: 50856649d6d6df88266a34955a03a693f5629499

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent up the chain during
the next merge window (or sooner if it is a relevant bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git
--
Vignesh


