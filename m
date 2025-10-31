Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 410D4CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 14:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fjByNTnTVNKRSTTWCFQYgfMHd/jImXJocam2CPKeRUE=; b=DGoGmGOWZwSO9z5ArYgVO1nsgw
	P0nd4+VjgAQE7BK4hfZvcj3yC1HmYRP21AJbZPg2Pgtbq0FQmcMv2xpiI24DkXwPkHOQK2iOCXQgv
	F3CLSCVpJJGHTePi34LlZ4uivbu74EysrwWIcoLgXpHQkgllrKk9cW9xISJCV+AEjMDcHsAhNxaN+
	WLJVUsI7YabXWPE7zUKsNS+USH5y2fiZI8X1nSigxRDf46AUVC2Wfe2++w0rZZqvEFCLbu1JUHhXO
	0LIg9XOTtURX13YsVuAtfLItJM/a1jjuHf1U0IfFmSYTxh4624HmtFVDCoURzyygm4evJoCmDDsNb
	mOs5PM9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEqLi-00000006Frp-0Hs5;
	Fri, 31 Oct 2025 14:43:30 +0000
Received: from mail-eastus2azon11010034.outbound.protection.outlook.com ([52.101.56.34] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEqLX-00000006Fnf-23yZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 14:43:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ggzn6E3OiZeE8W+ZPpDZ8/KQg6k45GFGJQARUPXheu7gBch2h7PXZo6jWkXiQgfIc3FgyPmlbB3UO8kHjZUKwiSBX6Nfnfpz2NnW/5yy5yF7hn8khpIXiGmhrSMmYOSAfQGa/zM2J3b4Le1R3304bXNr1iPb0OX79fGtFblXGXhXfOiXnXFQzO6UYuZLM0hMbqFhqx+nMwU4SeTeWvWsYAg2ba1kEK+SzXM31Us7c9tA0oHBBqeb8gSmS1Zg+98JRHhiRxY24IQMM/L0DFiRIf7o+dgkjc5nogJ8+blPAk17ZPeMj5sP2get4ITRBlRbTxN241xZ/lK1/43Qvvp9+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fjByNTnTVNKRSTTWCFQYgfMHd/jImXJocam2CPKeRUE=;
 b=elJq1/Ksim97QEEd5EoqQs3XBBrEcBt8PqrPUEQijyYTxF66MzrXMVXqiFPhJi07JcVi9+GLKjzJZA2P4YE0bsR+CraKEnzRV8zblxYlX7pNgi+XN4cGn+Hd6po9/luU1aDdyA4Adsy1kCO0s3fRA4AqKDF5L1fpRgwT9WRbHpysI5C958aE+aRrVCKeTvqJRRvrlG71tB1vixhGqQAlATz+4Sz1022wlvH+NHfjDKZ6gXms/aqnnPc1xvPHNK3xORrZZ/TAGmXvgXebyWS80W3DfhGnaot2pnOnvOw6tfaJ6QxfUEuf93s7KRf3bcvNdSCoQ2C++mRFU9Jr5sKbjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fjByNTnTVNKRSTTWCFQYgfMHd/jImXJocam2CPKeRUE=;
 b=E+XNLXxu+dUUEhKL3wOmSFgBj2VqaRBAjKUNP49chZhSPwh1SPAqUjroWcCTXHxmHvsbE4k+Ix3HUrdamz2QuDOzRQ1SwwvV5JgbrzGbMze7spt6A5OTzHksstROg50fDaXoQjnV/hmFvG1GWqUJsKLQp71KaUA9Afa2z8V5uk4=
Received: from BL1PR13CA0197.namprd13.prod.outlook.com (2603:10b6:208:2be::22)
 by MW5PR10MB5665.namprd10.prod.outlook.com (2603:10b6:303:19a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Fri, 31 Oct
 2025 14:43:13 +0000
Received: from BL02EPF00021F6A.namprd02.prod.outlook.com
 (2603:10b6:208:2be:cafe::3e) by BL1PR13CA0197.outlook.office365.com
 (2603:10b6:208:2be::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.5 via Frontend Transport; Fri,
 31 Oct 2025 14:42:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL02EPF00021F6A.mail.protection.outlook.com (10.167.249.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Fri, 31 Oct 2025 14:43:13 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 31 Oct
 2025 09:43:09 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 31 Oct
 2025 09:43:08 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 31 Oct 2025 09:43:08 -0500
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [172.24.233.103])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59VEgf5b4024498;
	Fri, 31 Oct 2025 09:43:04 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: <nm@ti.com>, <praneeth@ti.com>, Paresh Bhagat <p-bhagat@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, <kristo@kernel.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <khasim@ti.com>, <v-singh1@ti.com>,
	<afd@ti.com>, <bb@ti.com>, <s-ramamoorthy@ti.com>
Subject: Re: [PATCH v2] arm64: dts: ti: k3-am62d2-evm: Fix regulator properties
Date: Fri, 31 Oct 2025 20:10:59 +0530
Message-ID: <176192142805.427883.7335862448396149747.b4-ty@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251028210153.420473-1-p-bhagat@ti.com>
References: <20251028210153.420473-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6A:EE_|MW5PR10MB5665:EE_
X-MS-Office365-Filtering-Correlation-Id: db891b64-93cf-442f-7192-08de188bd1bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|1800799024|34020700016|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K2E2OFVCQkovT2pDaWp2VVZoYWtSSWsyK3AzUHBJMDdYbkkwOS9OT3JmUFJD?=
 =?utf-8?B?enIwd2pSc1NGeGNZQ3Eva3NWUmMwTmlGS3pGbEcvM2liNUhNODUraTRjMVFT?=
 =?utf-8?B?cHpqckc1QnU0Q3E0NlFISW4yV2VhS29DT2kxTHBhWWpCa2FnNExOR0VMOUpB?=
 =?utf-8?B?Q1R1Z3p3WDU3L041WnIwNjJNN2FpbWVGYkRvekp1ckN1Y3JEcnU3dGFaQW52?=
 =?utf-8?B?QnZZMWNrRm4xb0VaaFBxYllxSCtCV09jSEFXNXNseVUwV1ZhbXlDZW9XaThD?=
 =?utf-8?B?TUJxclR5T0prTHZKSlR3M3UxWnB1UEkvWTVrKzRzTWVNRnFZb2ZRbVdBOFc3?=
 =?utf-8?B?UG5FRmRKRzVoOFlKTjhOeU9pNk52YzdJOXhsQjM5QkN2VElMYjNGSVRhak1q?=
 =?utf-8?B?c3RJZ2lhblpRdW02amVHYmh1aHBsWEZaWDI4c1hFNUVCL3BLb21lVFNGSWFs?=
 =?utf-8?B?cmlEYUtuMTQ2WkZaTG1jMEFwNDFJSnJ6RTlIeXRYNk1BTGJTOHhUZ0JrVzRx?=
 =?utf-8?B?WGluUE9YN0VmcFpidVh3c1VRSXRJQldhaHhNR3FHWHRiOWxlNW81MGNhTGJ3?=
 =?utf-8?B?cEQyVmh2OUxWS3EybVBNNnpBaDBWeTVXTDdoU1RmMWJTSFN6R05SWVRKR0pN?=
 =?utf-8?B?UzJjNS9jclozUEVlTXJNdGt0cVJhK0lHcHcxd2xMOFBJN1JnNy9RL0tJNDAv?=
 =?utf-8?B?ME1tSG15VDBqcG9JSUlTZHFleEZaWGFJTXIzR2JwZ3RwM1JaUncwMTZrUy9M?=
 =?utf-8?B?cDhTdCtSNWlVdyt2WWZjU0hSMGVVVi9USWllOWJsZnA0WjNQcWZIREtLQ0tp?=
 =?utf-8?B?QkF3RlNONThWem53SmFUQUtRYlREZVJnV050TnNOb0JCRGhHTHE5VVNuSk1V?=
 =?utf-8?B?eXRVWktSYlBjbkEwSXNscDJCbVBMVG9rU2N4UnlCZFVGRmFJdS9HeGgxWi9F?=
 =?utf-8?B?TEkvcm55ZE9JUG1IenJ4VzVBS0FCNmtESWE2N3lhcTRCVUt2ZHZEb3d2RFor?=
 =?utf-8?B?WGJ3ZlF3aGloYWZqa0hKQTFLVUFkaFZUTDZMTVc1eVlvRlFBYnQxTkFGVkgz?=
 =?utf-8?B?ekdCVWh0MUF1cjN4U05RU1NJNkNUb1ExS01lL1JGQ3lhZzJZMnNGa0VNRXd3?=
 =?utf-8?B?WWlqMDNXVEJvV3gwTGc5SVE2UzlJbU5kWXVDaEtLbWxTMjdGejdsb0dhcTcr?=
 =?utf-8?B?U0xxVlRYWHRPTmt0OUErTjExQm4wdVlPV1VuUUtyNDJ0aXBjcFMxUlJydFFS?=
 =?utf-8?B?c3Y3bXUwSWxvQm5qRklrUExsdHpkeUlyU0JzVHJYc0xGd0M4U1N3VDBBRk44?=
 =?utf-8?B?TmJRdm9mRjU5a1RuS1lrUnV1Mk5zWXFrTGxkTnFUVk96cHRRZXlObTMrSldM?=
 =?utf-8?B?ZFc0TElYcTV6ZTFtTXNkdzluZFdvemd0ZXAvejBJQ1Vxc001ZGdjZkduZ3hE?=
 =?utf-8?B?WkxJRnpvM1dpTm1KN3U2VWhlRTIzc2U4YlBxQThJbHI5QVFLOWp0VTZjbTVE?=
 =?utf-8?B?Qi9Jb0ZpZ0R5dlZjZ09PZ1pXZWttbmNXcnRmWm5CMUlPT0JQdDdkNkdDVlVR?=
 =?utf-8?B?QTlSK0dqemNFbTRWb2RDTWRKWVZzaGUrK0dkRzBrSmJTbEl5RG1BNGFNbDFq?=
 =?utf-8?B?NTdUd0lnVUtlTzdFZ1pDcmhrbmM3Q09sTWVwRExLbENGLzVkOG0rU3NsS1hK?=
 =?utf-8?B?aTM1SFk2dHhTYWJGSDQ5WGJBbGdWd1pTdUlLNHVsSVdvV1RFMGY4SU5QNm0v?=
 =?utf-8?B?U3dMS2tobk8zeHc0T2VXV3Zqa2hFdVJMU0gwSXhIK25UaXRoT0VQRTNZaVBC?=
 =?utf-8?B?K3NwL1NtVWs0b3dPR0R6eUdtbEdjdHBHak8waGdMOHBmWmQxMGVtb2JlNFdB?=
 =?utf-8?B?T0RCNmJzd3BDcmhrOVkvdVhNNXhua0dvMjhoTFpWbytYN0Y4YVFKWjNtekJQ?=
 =?utf-8?B?Ykx4Q2hheFZwNVFmbGdNR1ovUVlpQjZNdVhqTlp2WGJESTl5Y2VDTVFTaVd1?=
 =?utf-8?B?RDY2cHFQR0lIWmYycUNjbFdlNmU0aW5tbWdCN05TWDEzbGZ1M2NRdjMzSitn?=
 =?utf-8?Q?rtlmw0?=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(34020700016)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 14:43:13.0260
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db891b64-93cf-442f-7192-08de188bd1bb
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00021F6A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5665
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_074319_540522_2BEC5B60 
X-CRM114-Status: GOOD (  10.93  )
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

On Wed, 29 Oct 2025 02:31:53 +0530, Paresh Bhagat wrote:
> Fix missing supply for regulators TLV7103318QDSERQ1 and TPS22918DBVR.
> Correct padconfig and gpio for TLV7103318QDSERQ1.
> 
> Reference Docs
> Datasheet - https://www.ti.com/lit/ug/sprujd4/sprujd4.pdf
> Schematics - https://www.ti.com/lit/zip/sprcal5
> 
> [...]

I have applied the following to branch ti-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-am62d2-evm: Fix regulator properties
      commit: 0103435072bf5c54bb43d1a9376d08396c825827

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


