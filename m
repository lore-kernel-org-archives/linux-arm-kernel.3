Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96F75E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 18:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=doT74MPLQiAop1jxkXAuBzCdqXyBlbCOs0t1hBqtF9w=; b=HVQ4QcT6G8alPxo6KNcy4sDgzz
	jPi70tqf7Y1byPyJWK00ex/yiluredv03HFSNBXPd50X8trkhDSynoGDV5FkdYC0mLhDNc/uHV0Lp
	/DUg6lOWTOpx5ucSTsAJB1khC1t9Bu6j7J8SSrhK7jpHRk6g/MfLp2H/ipJy42e2vISN/DBYXDMhk
	pT0Rk9+KFhW+uO/3HLj94n0/5V/ZWW9+QP3H3IJp7gfpiO4v/cWuyt2iVGhCYW2OCdpoyRiHNgvpP
	0vPIOJjtOfL+18Z5xhgkXSecj94SrnTuBeqAAJx6dJwU/h2EnvFZxVEdzMOKr8Beu1BvZDR4pBoP4
	4maeE2Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIuXU-0000000DaYG-41rp;
	Wed, 04 Dec 2024 18:55:56 +0000
Received: from mail-westcentralusazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c112::5] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIuVj-0000000DZv7-2wf4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 18:54:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NsshSf7S47fJSySPtRJLH+Fsdk6b2InBmInG0pROxPYb6tlnXluJyRAVX4hsRDiYsnSQHY1yf3PA5zdn9HJ8ctt0jGFkYj05JCUifFlKoVsVAmgqhvj2yCnU6GvtK1dd+x3mRdgW2HTDFMuWlI6tvoAOPpIpRBa+zkq2bB6bbhoY7E06XpVwZgLOQHMe2BwjkTFBg14sNSqWrWGTfMKLtgtz317O4qRwb9kN3xnOHAB0+5Lgj6A6l3CvQC0U073qPsKq1tBVjs80lY2dvLo+gXmtIDoNs5El2wYJhm8VcGOUBreBvda4Kx7iOg2cVEmVB9r/Wz3wUilUFEQ1duDVDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=doT74MPLQiAop1jxkXAuBzCdqXyBlbCOs0t1hBqtF9w=;
 b=VWUnXJVxaTHlzUMJVPzLEGDs5wwuiKmYLlVOnfxxCDcISSZ618B4EMO16ON32EsGW9Qjr5aIS/dlTDT93iuEuVEsP8N2IfHBf/LDDjYa+cxXa+6t7geTGhdE47aI/i24nxlsMLtx/BM/QerQmqCO5Z/ax8moEE4vDJRJ76Qk3kt2CLt+yZA+ktvx7MCaLAqO574zGFzlfnOxAz6Rb6Kn9YhYL2Hpuuho2pTe/oVyC7Dts40AjInJyGYyVWdFetSe0Q5NcjHhWd8QIsAE8+O7dvkpD7CZph80Reibz16vGafO4xIaDwhZTZJMEwl4DWYg6zAuUgjAB5YnwivLp4/oVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=doT74MPLQiAop1jxkXAuBzCdqXyBlbCOs0t1hBqtF9w=;
 b=cjHd+SIL4Qar0K8YYZPpYSIvFpKsAsXObU8M5PoFpWPWng77bBSI2nvaXpRAyV5XJGL/12+WW/caJNxN9O9LroUCygGH/EaXOvHYCYksLiK3kOMQMLk5YXcuKhS+rpSgvCkOO/GPzU6to/G7536HQSdnooSp3YHzDU8E32N7YaY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 CO6PR01MB7433.prod.exchangelabs.com (2603:10b6:303:134::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8230.12; Wed, 4 Dec 2024 18:53:50 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460%4]) with mapi id 15.20.8230.010; Wed, 4 Dec 2024
 18:53:49 +0000
Message-ID: <36a74021-6ae9-419c-9501-fe15146c9dd4@os.amperecomputing.com>
Date: Wed, 4 Dec 2024 10:53:45 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: mte: Fix copy_highpage() warning on hugetlb folios
To: Catalin Marinas <catalin.marinas@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Sasha Levin <sashal@kernel.org>, David Hildenbrand <david@redhat.com>,
 Will Deacon <will@kernel.org>
References: <20241204175004.906754-1-catalin.marinas@arm.com>
Content-Language: en-US
From: Yang Shi <yang@os.amperecomputing.com>
In-Reply-To: <20241204175004.906754-1-catalin.marinas@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0180.namprd03.prod.outlook.com
 (2603:10b6:a03:338::35) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|CO6PR01MB7433:EE_
X-MS-Office365-Filtering-Correlation-Id: 47e0d5bd-1847-4ce3-de0e-08dd1494fd12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RkpqWndHMDJRbDBYamsvN3NwaUNxWlpwenkvRVkyK2xBalBCS3FJK0FTVnN6?=
 =?utf-8?B?YndoL3AxVVVyMyt5SGVhQjU2ZHNkSUlEdHQ2UHpqdWhWUFlabkVHM3g1TmRS?=
 =?utf-8?B?SjdKN0Zuek5iUjZPMkJ5TTlFemNYZTRGdVVZRTYwQmxkby9rWXkyb3lvRXV6?=
 =?utf-8?B?K04zRkdmbmJ4ZzJDcHpoZkRRdHZGcmdYVi9uekxtbjBkY0QrZ3lOT0ZvU0Mx?=
 =?utf-8?B?aEZaTmlXT0F6aU95Y1pCVnFBdjhVWmVtZzV2a3U5U05RcGZ0NVRlRGYzcU9L?=
 =?utf-8?B?VzdEbHp4MHRwWklwRWZ4aStQZmpHZ2FjMGRJOUlHRHc1UnF6ZGovR2xDSUk3?=
 =?utf-8?B?TmZTQ1JWTVJQNGgrNUFabWp2d2EyZ0pDWGY2YzhCbXVwSnRzMDE1b0RubG95?=
 =?utf-8?B?VHMvV01mSXJidDZ1VmJhQXVTYm95aytqNlZ6WGtEQUhRTE9UUU5adDgvVGNa?=
 =?utf-8?B?a1hPK0VETTVKdW16RGdDSS92VUUxWlA2bDJ6MFdUUHJ1Y2hVRG1pTmtjMWlx?=
 =?utf-8?B?OWtqbGswU0JiNnVuUmJTYmJlTVQyMzVWdUtWS0l6OEx5b2ViNm16WHZyM29X?=
 =?utf-8?B?ZHNmTnNTdkZBb0NJemZUV1dXaHluSmhIVlZhU1FWTHRoSytDaENXSXFjSisr?=
 =?utf-8?B?aXhDamJUaUJCYlZKZjlvaU9ZKzduY1JuVFN0UGhHODlQQzYrT0llcVhqNkJp?=
 =?utf-8?B?b3l0VHdTalEweXE0Y2dIYkV3dmZjTnFKNDZtUjhOMlRXWm1BSHF5djJHUEl5?=
 =?utf-8?B?V2J5KzFaN0ZXS1JrcExiRklNSDFNRzh0bUoycFBTK3Q4MDU5aUFpUkpSNXI5?=
 =?utf-8?B?SmtRUmxrS25PNTJwSUg1dktKVmhxRWdOQ1A0SDVrRUxFSDZDNFdMejZUampl?=
 =?utf-8?B?TjdvNU8xOXBCbloydW5HdHlxN1RxYitSU2NtbTVlU2FrTi96b3NYak9vRnhL?=
 =?utf-8?B?cHAyVGJqcmVBdzJKUEtFaXNZanNDalJvaUdFR28yMFVqa3g1U0dSNjMzRWs0?=
 =?utf-8?B?V3lKYXhhOEdhQ1BKNVhIRG10Y3BLOHM1SkZLaVFFQTU0UG9UVVBMdTNvcVF0?=
 =?utf-8?B?UHNTNHJKRkZ2b1hsMzZHZ014RnA1c0gwd3MvcjA5V2dPRTJlSTZHTjZQcU9k?=
 =?utf-8?B?U0t2ei82bTFtVUdsMWc3Z1ZGalpJenRGQWJpM0tzdGUycXBUUkFTWUlYOGd3?=
 =?utf-8?B?aU90aFJVeGw4aEk5djc3VVpqWlZQZEl0UzdSVmE0T0lFYk9tNEVsMVF4ak9r?=
 =?utf-8?B?K2pkdUxKcDAyTXhBQlhZMVU1cUdrQ0Jvd1VGNHlkOTNkUlJ5QzhrUW1HSmU0?=
 =?utf-8?B?MTY0STJQNDZOcEtKYThib3FXNHlyVkxnZXJGblVFRzE5R1cySERwZTF3Z2Rj?=
 =?utf-8?B?SUJqazRhVHdFeWtMaW5ZS1RmaU04L0NYM2hMdExBVjJZMHcrS2xlak11dFda?=
 =?utf-8?B?c1A4d2tidUFHRnBWcnJNSWw1RUoxRGJlTExlM2tKYXc2MktCQjE0UVkzRDF1?=
 =?utf-8?B?ZlhRYzljY3FvcEFiNjh3Y2FCRVZpMUNOVDkyR2QvVXdHc1BzRVBaL08xR28x?=
 =?utf-8?B?THYvNC95TU1zOEVRbUhnKzgwRWxYR3I2MW5Dc1l3eG9HKzE0b0Y3dVVCM2Uy?=
 =?utf-8?B?L2pRVEo4TitZenhoT3JJMmxTWUxvZEtCQ2UyeWpxVTR6TWM1b2dZVXJJamRx?=
 =?utf-8?B?OHkxTFBrZWVNM2pMcVRtZHVOWjI2ZVZzeGxTMUZJQ1YwWXlmZHk5R1phYmdP?=
 =?utf-8?B?VGlXeUdkakhpNFRqNWM0cVlEU3pjZUhYL3dmQmhaWnFBRkhOUmdUU0dZaFdE?=
 =?utf-8?Q?NCSbQd0S4/YrBKqqxx7WrbwHuFK/h6381rviM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWtaUXJ3Q1d0emJreDkyUm9Ub2gxWVJSWVRyZ1Q2cWF1bXR5clNmVjBndWl2?=
 =?utf-8?B?RWJUQmI4TzgzREVEeS9ORzdyN2RpbitXODd0SzBweDZ1VENMT1Vmdm9OMlVl?=
 =?utf-8?B?Tk51ZDJKQ3RxYm00MWpMdmRWcHFYa3hESGNqSnJ1VncxVDNaUnhvNjhZcWwz?=
 =?utf-8?B?TjJNYkR4WmlqSnhqeGVYY002bGtLT1VpVnRqTHR5SzZ4ODY4em5TcXNPem1j?=
 =?utf-8?B?VnJlYUhtYmdoZktGYjJ6ZGVXeDFSNHp3SDNZaFhFZVhvQk0wU2FXb3l0MTl4?=
 =?utf-8?B?Z0xJTHp5a1RzWnJESzlJOEZxNDIrYVFON2MwaDZSakl6OExNZEZqcW9ta2ky?=
 =?utf-8?B?TEY2d2xGNlFLVStnUHRJYlg4OEM2ZGYvTERzd0JBU2tEcitQOE4yb0RKYnZ0?=
 =?utf-8?B?MEoyRlZublN0YnQzMXBoaTZOd3J0NVVhZFZXYWUzNEd6eUZVMTBqRGxTdkZz?=
 =?utf-8?B?cS9nVkUzdTlaR2NDRm12cXYwK2dZZ3pnRHpFQ01GZlkyOURRekEwTmVOSy9Y?=
 =?utf-8?B?dVZQOUFjWUVSeCt1bVQ4aHozQkNFYVZscWZqbStmOU1CUmxkaFVUNXBLYmJp?=
 =?utf-8?B?V0ZTU3UyeTlOMzlwNVRWYjVVN1pTYUhxOFlhbkhvdTJ5cEx2Yy9obm5rV2tk?=
 =?utf-8?B?aUNweTJheitZWGczN1o5SGlKanpwU3k5NTByM3hCMDlRdEFOckVtdmlaemJs?=
 =?utf-8?B?NXJqcTBIT0lyNzFMdTQvVGpNZ0YwSmYwUGd0Q2prUEd1cm13V1RwR0c5VW9U?=
 =?utf-8?B?eUN5YWdiOHNEN3JMQm0xYjU1dU9uQ2hyd0lxa0hPeUd5TEFjN3NFd1RLVGhQ?=
 =?utf-8?B?M1E0ZDJJQlBYcmQwYWxFK0dJb1BhZjhqR0daUjQwMk9OL05ubm43ZktuNTdK?=
 =?utf-8?B?MDF2SzRiRjd0Vmh2d1psdjlCTjQ3KzBqWXJRRkl0Lzk2RXI5VXR4dk4zRU81?=
 =?utf-8?B?WGIydHZIQUpnZ2gvdTM2Tmx4dmpBWmhBYlBIMzVXWTRMUkZIcW1hMXJCeWJI?=
 =?utf-8?B?YXVVTUZhaFFVMUJTSkw3MjJPb24vNWMvWGF0Z1BhNnRNS3RLR0ZSMWZ3cnF0?=
 =?utf-8?B?MnlqU2NLQk4xTncweE42UlZVa2ZuUVFnbkdBQlM0MitTczIySVhaSEVSaVVF?=
 =?utf-8?B?WmY1dXJhZVpHSVZDTENjS01QRWhFdXV0TWRKQkNVbXVnanBCUG5RSXdJYXVM?=
 =?utf-8?B?bXF6aWhQci94RnZFTmZaQUZhQkNxbUpMVWo5dG53clVCVFcycUdCVkxCVDFI?=
 =?utf-8?B?a0RLdzlFWTJWZGU1Vnc1TDV0MEJ3a1RVYnFtTDMwUXlkbStaNEpwR3lGZDQr?=
 =?utf-8?B?dG4wQ0xhb1oray9ackhXVHQvVTJMSUpDYXNPMDEzL01KZ3NvZnhGMTBKY0Fi?=
 =?utf-8?B?TDZmcFlac1YxcEdyYkVZQ1pjV2FPZXZtY21vOC91dlBoTmxHUDRMNGpzQnZ2?=
 =?utf-8?B?QlNIeENGTmJFajd3elZkblhtOHZubDFPdHpubEtmRURNYTJzRmluajBaYTQ0?=
 =?utf-8?B?b0JIcTcwUkdiWDhzQlprRUdGenVEMVp5ZlZLbXdjaWp6NWpNdk9GbUlvdDZC?=
 =?utf-8?B?UktMOTBXbnRiWTlHTGRmcjM0UHhuOXlUSzJ6OHo0OEtTVmFwbWZXQlhRdnBi?=
 =?utf-8?B?c2Q2bFBmY3dhRkxQdE1zK1grNGp2Y3FsR2dFcXJSLzZUVkNta0pCMEI3Qk1L?=
 =?utf-8?B?RDhWdHFxWDRYbGZJWVFMQ21sbUs3VDROaENRcFRHQ2VyQ0JMOVZKN2dTSVBj?=
 =?utf-8?B?SjdBUkd1SUI1alFNSnZIa0ZsbHdtRW5TcHgwUHpWS0FRUmNRNlpqcm85dnJy?=
 =?utf-8?B?aG90Y3czY3llZVIyeE5SNmlyTHlhUEhSQ1dnMlFqMENjZDk1eWlsN2J0VCtR?=
 =?utf-8?B?aGxRNFluQklIM0lpYzZLVXI2OXpsS24yRk1sMElTK2g3OUtaNXN4WHdTVDFj?=
 =?utf-8?B?SlA4L2NreTArYzlKU2NPRzFBQmhyZ2I1U3lzRFZVSXZBVU1GRWxlanFLaUxj?=
 =?utf-8?B?L0pPaFE2L0hFVzY5eUNiUjBtdHd0K3ZETG5mOUpkdnRhN0hJN3ZvcEdnYVlV?=
 =?utf-8?B?cWVQOE1iRHVzQ0JQREk0SUlZVnk1SEt3c1NXWStZa2VYVm5TZEpBay9scUZT?=
 =?utf-8?B?cGY2TkZ2SHQ1SHZaTXFvWFJ2ejVOdmdjMVQxVFpKVXhJT0lVSmVRTkRKQVN1?=
 =?utf-8?Q?2+cUwdHOyD5jKAbStAtW5i0=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47e0d5bd-1847-4ce3-de0e-08dd1494fd12
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2024 18:53:49.8184
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QBhYuIEosqoxS+F41K7WHpgds4vKxzXC8tQW7dJNbiksPpVJwfCGC3Vq4/Nrr60pasbpXkIge3D4q8uIT9Z2hR6sW0K4Ok7jHRvFzz/TUZk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR01MB7433
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_105407_758903_9FC5333A 
X-CRM114-Status: GOOD (  22.58  )
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



On 12/4/24 9:50 AM, Catalin Marinas wrote:
> Commit 25c17c4b55de ("hugetlb: arm64: add mte support") improved the
> copy_highpage() function to update the tags in the destination hugetlb
> folio. However, when the source folio isn't tagged, the code takes the
> non-hugetlb path where try_page_mte_tagging() warns as the destination
> is a hugetlb folio:
>
>    WARNING: CPU: 0 PID: 363 at arch/arm64/include/asm/mte.h:58 copy_highpage+0x1d4/0x2d8
>    [...]
>    pc : copy_highpage+0x1d4/0x2d8
>    lr : copy_highpage+0x78/0x2d8
>    [...]
>    Call trace:
>     copy_highpage+0x1d4/0x2d8 (P)
>     copy_highpage+0x78/0x2d8 (L)
>     copy_user_highpage+0x20/0x48
>     copy_user_large_folio+0x1bc/0x268
>     hugetlb_wp+0x190/0x860
>     hugetlb_fault+0xa28/0xc10
>     handle_mm_fault+0x2a0/0x2c0
>     do_page_fault+0x12c/0x578
>     do_mem_abort+0x4c/0xa8
>     el0_da+0x44/0xb0
>     el0t_64_sync_handler+0xc4/0x138
>     el0t_64_sync+0x198/0x1a0
>
> Change the check for the tagged status of the source folio so that it
> does not fall through the non-hugetlb case. In addition, only perform
> the copy (for the full folio) if the source page is the folio head and
> warn if the destination folio is already tagged, for symmetry with the
> non-hugetlb case.
>
> Fixes: 25c17c4b55de ("hugetlb: arm64: add mte support")
> Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
> Reported-by: Sasha Levin <sashal@kernel.org>
> Cc: Yang Shi <yang@os.amperecomputing.com>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Will Deacon <will@kernel.org>
> Link: https://lore.kernel.org/r/Z0STR6VLt2MCalnY@sashalap

Thanks for fixing this. Reviewed-by: Yang Shi <yang@os.amperecomputing.com>

> ---
>   arch/arm64/mm/copypage.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm64/mm/copypage.c b/arch/arm64/mm/copypage.c
> index 87b3f1a25535..a86c897017df 100644
> --- a/arch/arm64/mm/copypage.c
> +++ b/arch/arm64/mm/copypage.c
> @@ -30,11 +30,13 @@ void copy_highpage(struct page *to, struct page *from)
>   	if (!system_supports_mte())
>   		return;
>   
> -	if (folio_test_hugetlb(src) &&
> -	    folio_test_hugetlb_mte_tagged(src)) {
> -		if (!folio_try_hugetlb_mte_tagging(dst))
> +	if (folio_test_hugetlb(src)) {
> +		if (!folio_test_hugetlb_mte_tagged(src) ||
> +		    from != folio_page(src, 0))
>   			return;
>   
> +		WARN_ON_ONCE(!folio_try_hugetlb_mte_tagging(dst));
> +
>   		/*
>   		 * Populate tags for all subpages.
>   		 *


