Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7779CF9C72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 17:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fR7rWKD62pyRucVEynDB6VI7E5WoV9QlA3MJths/JTo=; b=ygKYQO2yPC3flj8EcxMsA0OHUb
	GlF1BEuG491yUD8g+NV49uKbp4VC7uDWJewaQGnP/V3OBqRU2Lb4N9IZg9ODIGWlyHZkG8Y/LaVgs
	LNugjZirhomuOgOPPHEXjFFqqcV14oa62KnzNmmtZdE1VS8QnH8JZZwMbVGGLIq7mZrOnekEO/0Q1
	DxLym0Q6560rv408HJIFm4v2JnRPXSzADVwvCnavGkE/LeEZvtpyBT46dxhbzH/zWjBw3Uvg8luRM
	NGzewmi1QaUqm9wvBLBzkI4Lmc6kmRCFLUgHBosHZRWsqoakmMUDdmzkXzC/XAChAGxbzXIgwrpR7
	/xItGvXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8B9-000000073mQ-3g0e;
	Thu, 20 Nov 2025 17:10:43 +0000
Received: from mail-westus3azon11022103.outbound.protection.outlook.com ([40.107.209.103] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8B4-000000073lv-2PPn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 17:10:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mNHJ76/oeX3QJa+8c8k8+o1QdSx8eBwqx8joeFkpjcc3CcK/8bpItFVRPhoMupsp8s5WOmjp89k7T4kOkUQd2XVQgkkvEnn2MOCqdbS+5i3+HXfPZwkcFW4T9d0hMWkHG3kUc7ztixpO6MVrn8i0T1koyL26vPZyV5Ps2xUt+y7IJHWuRr90zqJaUeFw0welG1+Zrmh7gFlDcoP+xl0/r3HSUt7e2WAcIkOEU8qds0aUfl/7k/gHZ747l5reSw+BHnGYAdgr9z1hx7LiDNZdG2H4ZL0kPa/WCxFVeJvkxctOW8+ENLHE66ihTPb6PcNpPfA0bQ1HNY+sdpXRsjFHdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fR7rWKD62pyRucVEynDB6VI7E5WoV9QlA3MJths/JTo=;
 b=DUqJ+yOFDWXjB4+0SNHUkp4m37A40LnbJQhkEjGLeVwIJDYTvN+ozarqO2k3gawx4xO6o9skudCmnPXgEuh8BPnEKWtLrmjpZUMosdmwuKBwqqRmzBopPIT2p1xWnJCYo+CERv7yj3jtRulMvSXbon10VVyAB+hooXsrS2HCUq4FBFrzPZy9cu/qGDfK9gFXZ0vchLkYoTqwXhrAA4uDuYZuVid1HyBtBK8mxTtV0wp8tz9ievDg21mKk3QihQfAuRj9CXj8vuQ+E5uwHEVxWiCoKvKFfJb3ELcIAqSlh7p2pyEQLgf42HKUkAVqslg4YtXQ9C7OLrUbNMn9r/GJqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fR7rWKD62pyRucVEynDB6VI7E5WoV9QlA3MJths/JTo=;
 b=OddoaKyPUTF0gUJFn8PKohcbUVqo3hLuUu6yhJSiuF1oPg6CD1dPPAVPqg2F1GyczmW4dfUn4bv8qJcoOva3zczRsV46fG13lPNm3Gvb6IESoc+u7ucDPGmbtKsO3QyEGVOEfzCldtxVWNupiXxMWozq0loxkVPkamvZ5ewquJg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 CH3PR01MB8247.prod.exchangelabs.com (2603:10b6:610:170::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.10; Thu, 20 Nov 2025 17:10:28 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460%3]) with mapi id 15.20.9343.011; Thu, 20 Nov 2025
 17:10:28 +0000
Message-ID: <241b6085-47c2-477b-954b-f03f7ef94138@os.amperecomputing.com>
Date: Thu, 20 Nov 2025 09:10:24 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: mm: fix direct map use over accounting
To: Ryan Roberts <ryan.roberts@arm.com>, catalin.marinas@arm.com,
 will@kernel.org, cl@gentwo.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251119235706.1944517-1-yang@os.amperecomputing.com>
 <dc8a1580-a3ca-45dc-a82f-ab697011345c@arm.com>
Content-Language: en-US
From: Yang Shi <yang@os.amperecomputing.com>
In-Reply-To: <dc8a1580-a3ca-45dc-a82f-ab697011345c@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CYZPR02CA0011.namprd02.prod.outlook.com
 (2603:10b6:930:a1::9) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|CH3PR01MB8247:EE_
X-MS-Office365-Filtering-Correlation-Id: 96d06fe7-540a-4d06-0f85-08de2857b3cf
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RDYvemVzb0FRbU9hV3NLWkpBamMyK3kyNGd5dW1SenprcjRSOVlwbjdsTUt4?=
 =?utf-8?B?NDBhUmtUU05NZFM0QjltVW0xTDRnRUZXdVQvNWN5cFFGR00zWlkzVWtTa1Bh?=
 =?utf-8?B?UkQ5RjU0UEduMDBQaml2UEFKOTgwNG9QMUxTcEVFWjFDVUhMYVdTS0dYankr?=
 =?utf-8?B?RFBVeGd0alFDZkNsMUJueUFSdVE0MTBGdGh5cWNRUDRqQVV3aE95SmlsazV2?=
 =?utf-8?B?K1d5eWtidUFwVGptaXN4QjVNVVhmeHNXQ2ZHa1U4QkVXc3VrbDBabEIzR0pM?=
 =?utf-8?B?VVIrTGJFamxwYUJZUE9YOGV1Zkx6bmVjbWcwaDlMdVd2eVhDZG80S1QyU3ho?=
 =?utf-8?B?c3JBQ2tmc0VhUElMSm5CUEROOGpOVCtGcitRVUdIN3hPQkdUdythZFY2dWVI?=
 =?utf-8?B?bExKVm05ZGdtTVQ2Z1hTUVJxSlRNSWF6OEVnODN2WmwvRWRwdWxnWjRTRE9U?=
 =?utf-8?B?Wis0MFY5YTdXem1zK0ZWQ1hxdUhyWUV5d3Vmb09CMmdCNGl3b3dub1BqVXpt?=
 =?utf-8?B?Qm1qOVhJZ0I1VXpuMHF5RFo0dkFhWFBsQTloZUtkNEJqNkNRMXlORHBOSmdF?=
 =?utf-8?B?Ri9ZelNWYzFjV09sTHpjTU9aR08zTjNremJDRHk1eXNRSU02M1pKZUhpMFlj?=
 =?utf-8?B?M014dHRvc2JPUUlDOENBYk80bUtBZ3VFY3ZZZVRWZmtjYWJScmJmUE1FUVRh?=
 =?utf-8?B?ZFhhczZUZFpiOGZsTlRWeXdvdThaVHdRN3h3UlhQdjdXRGFFY3JLTE43WE55?=
 =?utf-8?B?L3Z4VjJ4endYc3VHb3ZCbWZ0OXQ4eWVqV1lreWR6R2phN1N6c3dLVklpMmxr?=
 =?utf-8?B?RTJTY3prOThJM3FlUEZ0bWhMR3RxTk9zM0hYYk54cmp5M2tHVjd3WFJaRHQ4?=
 =?utf-8?B?WTRkTDhKdzdOdTJZTUN0OUNudFNvZFc2UkllbTA0aVlkOFFCNWIwUWgvRGVE?=
 =?utf-8?B?MksxM3A4Z2haVUNOWUNLcDdhUjVQdWYzQXlKWTFzNFpLNUtnZnNORGpyVHVo?=
 =?utf-8?B?dFVXNmxHN3hpQUthNzNXZHVOV0F4RU8rVHRwRVorV2hJZjVHbEJqSTAzVHhX?=
 =?utf-8?B?TTNWWHRQRmZ1N0luN1ZReUFtblBNckFMVmN2UlZCeWZET1NyOXU5ZHRDbjFs?=
 =?utf-8?B?cFpJS1RLWjY0VTlCV2VEZk1FODFaT2xJNHhvME1tRUhGMG5nS09NdzlJc01s?=
 =?utf-8?B?UnBBeFhHNlpxblNzeE1rRjhCcjk3N2VxTzVTOHpTdHdmb3JnU0FxTzc3ejVs?=
 =?utf-8?B?SDJ1ZHBUYkdZdzgzWHFjekhldytReTBOY1hERHN5b2grVnJlakFZbXFVeEg5?=
 =?utf-8?B?VndzU2xvbEdHNmVVUzhaQTBSaVlONGdSSjhrUnY5QWx5bk91MWRPRUJDM09L?=
 =?utf-8?B?czR5emQ0c0x4cDVQWmxad1pMYjRyejlLdnRwa0ZWbnZJcjE0NXhmSFY1bjhU?=
 =?utf-8?B?L3U5MFhRY0JQeUhBL0Vna2VBRmlsM1V6ZDhhcEN2SzlkMVA5c3Bhb3Vsenl5?=
 =?utf-8?B?QU1XZXoxNmtJeXdCR2YrcStuSVduUGlQdVBUNXo5TzhIMWluamw5THdyeFhx?=
 =?utf-8?B?L1JCWENxV3BHeHNWM2Znd3doUjRhZHhaaHhBOVpnU1kvZnd5UVFtaGFjTi9x?=
 =?utf-8?B?azc4QndwVHB2ZFE3eWFxWGFrdDg3N3ByeEtHR2hFN005Y0s2WUpScU52Y0Jj?=
 =?utf-8?B?eTBYTTlQK1ZFQmRlbnU5aVdBR05vSHo1WGtpWFlDbm9UaTVTczY3a0lPSEx2?=
 =?utf-8?B?NUZrOEhhcGVKeFpMQnFjN1lBK3RrK3NFMlRQTG9WaTFIRURBUjVRV1ZvMlFa?=
 =?utf-8?B?U2paZFFlK2RRRXpwNElrVGVkM054aUx1V1lhcjJVU1J0dEhvaGZDZ29tTUFZ?=
 =?utf-8?B?bmJyNlc0eDlXTDZtRUZuYWJzMXh0MGZBSEg0R1RWaVZ0bzVhc2Q1aHRzOHRK?=
 =?utf-8?Q?Hn//f5HzeTvAAqZ/Y3cvUHkxEY6wFXJz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXF5MEs3VkUwNzZyR1dpUktCWEpnZm8wcVdRaTNVYkRhbjNzemZOQ3NuQmw4?=
 =?utf-8?B?WUNNV2Z1SVNJamd3RXpMbzR3T1hJd1pjZ2gyN3FTUnY5TTJKZUtKR01DeThH?=
 =?utf-8?B?RTRJa3BrOUhhSnJXQUJ5T0R1bFFnRWNnUXdFTFNOMDVodS94djlSSXFmUVBO?=
 =?utf-8?B?TGJ3QmoxMEJ6NE9JV2QwRW9vNjdwekFZNDdzSExRRmwwWW9PNkl5ditLNk51?=
 =?utf-8?B?a2tncEs5UXlPWWJDMlZBUi8ydnM2VFQrSVRjalFRb2E5K3lGRThDT0FvbWFV?=
 =?utf-8?B?bkNqMlVrSW5RZGNYRnBEVWFJUEczZS9LTm5HRlBFdWh2QXdBNnRLb1pDV24v?=
 =?utf-8?B?UVNlbnpiTEJZRFRKbDZxc0NnTjdUYzM1ZXM1ZFpwUldJVlErZ2pvZmV3L2Z5?=
 =?utf-8?B?cDJwY21rMlREYVdlMXBkenZZTG0rTkJFK3pBcTdTUTRNV1AyVDNQUmhLTDVR?=
 =?utf-8?B?Q0toMFI4ZEdHL3pvOW81eDV1MEptMW9MQm9XbEpNSG1LbFpwZ25ZVUtRRTU1?=
 =?utf-8?B?RXZSQ1d2RldvNUFMdVBCb3IvcUZoMndLTUZQTDVwQnVVR2hveW1nNHQ5RlYy?=
 =?utf-8?B?YlprY2ltaFIwRy9EcEEveU5OKzh4WUZBWVgyQVZyc1NkT3hrNEkydkxFK01z?=
 =?utf-8?B?TlhVSnd6anJnR3FIYWFFRlNGNTJmV2xQdlpMRjBaR3dZc2V4WnZXNi9waitX?=
 =?utf-8?B?V1hUc3c2c1NxK1kvSnR6ckxlTm1ISnNoNmd0c0lpWnhzM1hkK3FYMFEwU1Zy?=
 =?utf-8?B?MFZqeEdNeTZCQ1pUVURFbzNKSFQ1MTN2QkYxSWFZcEZ4ZG1HVjVDcXU5Sytt?=
 =?utf-8?B?RFJzSVBYL2o3THc3Uys3cENYVWUzanFRdS9EcU9WcGMvOUZNWi9PSTF6Wm9i?=
 =?utf-8?B?U2J5QmRxMHI2elhNY3VNSi9yV2VpcytqRTZQN0QxTjQ1NkdNVVE1dHdUMTRl?=
 =?utf-8?B?NEhNRW1qRE5qbDlrUGhEVjFSZEdGYy9PbWNPOU1yMmRFdjVYWENKNTM4dDRY?=
 =?utf-8?B?M2NJOEFvcUpzNGx6SW5oYmdrNTlXRm5GYVA4VjRqc1ZHSGNkSFNUYzdGN1NQ?=
 =?utf-8?B?aGI0YWZDTUNoSDdwRWtFc01mZFM5ZEtJSlc3WVlFUVBWUGRpOTJkamZnOHNC?=
 =?utf-8?B?aS9Wb2xpa1pyM21sU0JkZzBvTHRSdXV5MURobmJLU0dIb09pUzlBTmFjVnk5?=
 =?utf-8?B?TGRzOWwxa05LUldvTHNLeWtFSXpqTlVKTnVyYzRzTEFvT01XWUpUanZzKzBU?=
 =?utf-8?B?Y092Zm4rR3ZsUmpsL1FLNit3OGRleGZ3dUZIeEcrblZuTzNaVGJScHpUM1dp?=
 =?utf-8?B?cUQxcDF1V3dtWGhEbXFybm9SemZ4UXNrVjAySnRLT3Ezc1RDaTJ2Qi9WMkZK?=
 =?utf-8?B?NjNGU21nbkFTQ09VeWZzQlRJU21jYzgwcGhQY3BzWEhieTA1SFhTelE4d2N4?=
 =?utf-8?B?ZGNVQWsxV0VpTUxQOFp5d0FaWnhLb24xUzZrckdvMEdHK1NTVU1rOS9WaHRn?=
 =?utf-8?B?MUtwaTBkTlNSVFo1dS8vU3ZPVFBnTHBXd2V6Y2Y4d0UrTkk5dTBWUE5NamlL?=
 =?utf-8?B?QVRKM1lzYmpWMXpPeGdTNTVBUVdlYm80dzZCVlJJZjRNSk1KT1k3cmcvL2s5?=
 =?utf-8?B?amZoaWRIMkxtcjNjQVcwU1V3YTYxamw5cXVwU2RoREhDaU9PMjBvbzIwaTJ3?=
 =?utf-8?B?TkdUa3hxSmFGdWxYVC9DYzJIZGNhNnZVSC9KQm9yR3ZBQi85WEZDdjROZEhH?=
 =?utf-8?B?cUJjRm5VbHhra1ZOOWpBVGxXVHRFNjA2T2R6b2JCTUY1OTlHaTNKbDVDMDJT?=
 =?utf-8?B?ODdaOHhMSytFeHhYYnNVVVY1MmhzQUl1dm9tKzczRWhvU2dXQjIzWVZkN2w5?=
 =?utf-8?B?USt6Qkp4WEhQL29WdUtJb2hvQ1lYL0I4SDBLWTNQSnV6TTdSdjRSUUEvL3ls?=
 =?utf-8?B?MW1PQ0ZlSUJBQUIvMS9xazczbndxb3JjQjZaTTloUWtla3VKMWtreTc2RUF2?=
 =?utf-8?B?RzlWVk5wb1ZpNkJ1bnJxNUpaMFNHN1JDaXlKdkdzVFBzSmVDSUduZExPckRx?=
 =?utf-8?B?TlNZYWMzamN6NVVEVXdnWDdzZXhDTE02eU94aVA0a2NBTmVQM1YzVjFPM0xX?=
 =?utf-8?B?bHlvdTllU1NDTEFTMk9kVCtjZkxHQmZIeVRkaHVtNDRHZ2NzMWZPb0pkYUhS?=
 =?utf-8?Q?Lh8xdtct7k62DuUOKa3N4TY=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96d06fe7-540a-4d06-0f85-08de2857b3cf
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 17:10:28.2233
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4XOX3lnDsCu3MaWO7LPs9djxYqrbp8aWdAo1cHkH4HdnNisNocayFI8H5lNRTtml3LDA3h+BeK0y3jgrludv8MgN79UPZbeFu5GuLoKk7r8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR01MB8247
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_091038_683698_52B03EA7 
X-CRM114-Status: GOOD (  31.99  )
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



On 11/20/25 7:11 AM, Ryan Roberts wrote:
> On 19/11/2025 23:57, Yang Shi wrote:
>> The create_pgd_mapping() families may be used in other paths other than
>> creating the linear map. And spliting kernel page table may be used for
>> non-linear map either. So we need check whether the address is linear
>> map address or not before accounting to direct map use. Encapsulate the
>> linear map address check in the new add/sub helpers. The new helpers are
>> nop if CONFIG_PROC_FS is not enabled.
>>
>> Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
>> ---
>>   arch/arm64/mm/mmu.c | 107 ++++++++++++++++++++++++++++----------------
>>   1 file changed, 69 insertions(+), 38 deletions(-)
>>
>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>> index 8e87a80aa4f3..4f3f0dc23faa 100644
>> --- a/arch/arm64/mm/mmu.c
>> +++ b/arch/arm64/mm/mmu.c
>> @@ -52,17 +52,6 @@
>>   
>>   DEFINE_STATIC_KEY_FALSE(arm64_ptdump_lock_key);
>>   
>> -enum direct_map_type {
>> -	PTE,
>> -	CONT_PTE,
>> -	PMD,
>> -	CONT_PMD,
>> -	PUD,
>> -	NR_DIRECT_MAP_TYPE,
>> -};
>> -
>> -static unsigned long direct_map_size[NR_DIRECT_MAP_TYPE];
>> -
>>   u64 kimage_voffset __ro_after_init;
>>   EXPORT_SYMBOL(kimage_voffset);
>>   
>> @@ -183,7 +172,18 @@ static void init_clear_pgtable(void *table)
>>   	dsb(ishst);
>>   }
>>   
>> +typedef enum direct_map_type {
>> +	PTE,
>> +	CONT_PTE,
>> +	PMD,
>> +	CONT_PMD,
>> +	PUD,
>> +	NR_DIRECT_MAP_TYPE,
>> +} direct_map_type_t;
> Why the typedef? I think the Linux coding standard prefers `enum
> direct_map_type` right?

I'm not aware of such preference. The simple grep "typedef enum" shows 
thousands of results.

Anyway I don't have strong preference.

>
>> +
>>   #ifdef CONFIG_PROC_FS
>> +static unsigned long direct_map_size[NR_DIRECT_MAP_TYPE];
> All of these symbols are getting long. How about we call it dm?
>
> enum dm_type;
> static unsigned long dm_meminfo[NR_DM_TYPE];
> dm_meminfo_add();
> dm_meminfo_sub();
>
> That's a bit more plesent to my eye, at least.

OK, fine to me.

>
>> +
>>   void arch_report_meminfo(struct seq_file *m)
>>   {
>>   	char *size[NR_DIRECT_MAP_TYPE];
>> @@ -220,6 +220,35 @@ void arch_report_meminfo(struct seq_file *m)
>>   		seq_printf(m, "DirectMap%s:	%8lu kB\n",
>>   			size[PUD], direct_map_size[PUD] >> 10);
>>   }
>> +
>> +static inline bool is_linear_map_addr(unsigned long addr)
> So we are calling it direct map everywhere else but linear map here?
>
> Perhaps is_dm_addr() ?

OK

>
>> +{
>> +	return (addr >= PAGE_OFFSET) && (addr < _PAGE_END(VA_BITS_MIN));
> I'm not sure if this is definitely correct? We have:
>
> #define DIRECT_MAP_PHYSMEM_END	__pa(PAGE_END - 1)
>
> Where PAGE_END is not _PAGE_END(VA_BITS_MIN) if KASAN is enabled. Not sure if we
> should be using PAGE_END here or not?

Thanks for catching this. Took a deeper look at it. It seems 
_PAGE_END(VA_BITS_MIN) may cover kasan shadow area with 52 bits VA IIUC 
(< 52 bits VA should be not affected). Currently kasan doesn't use 
create_pgd_mapping() families to create page table, and we don't split 
kasan shadow area either, so there should be no over accounting problem, 
but it is fragile. So it looks like PAGE_END should be used, which ends 
at KASAN_SHADOW_START.

>
>> +}
>> +
>> +static inline void direct_map_meminfo_add(unsigned long addr, unsigned long size,
>> +					  direct_map_type_t type)
>> +{
>> +	if (is_linear_map_addr(addr))
>> +		direct_map_size[type] += size;
>> +}
>> +
>> +static inline void direct_map_meminfo_sub(unsigned long addr, unsigned long size,
>> +					  direct_map_type_t type)
>> +{
>> +	if (is_linear_map_addr(addr))
>> +		direct_map_size[type] -= size;
>> +}
> Given these are non-atomic RMW operations, is there any risk of racing which
> would break accounting? i.e.
>
> THREAD A		THREAD B
>
> read
> 			read
> modify (+ N)
> write
> 			modify (+ M)
> 			write
>
> We would fail to account N here.
>
> I think this is probably safe for the split case; we have the split lock for
> that already. And I think for populating the initial linear map, that's single
> threaded during boot.

Yes, split and initial linear map are safe.

>
> But what about hot[un]plug? Is there anything stopping concurrent split with
> linear map population due to hotplug?

Yes. When hot adding memory, the memory can't be allocated until they 
are fully onlined; when hot removing memory, the memory has to be 
offlined first, then we can have linear map unmapped. The offline will 
guarantee there is no concurrent use or split.

But this reminds me I need to take care hot remove path which calls 
__remove_pgd_mapping(). Will fix it in the new version.

>
>
>> +#else
>> +static inline void direct_map_meminfo_add(unsigned long addr, unsigned long size,
>> +					  direct_map_type_t type)
>> +{
>> +}
>> +
>> +static inline void direct_map_meminfo_sub(unsigned long addr, unsigned long size,
>> +					  direct_map_type_t type)
>> +{
>> +}
>>   #endif
>>   
>>   static void init_pte(pte_t *ptep, unsigned long addr, unsigned long end,
>> @@ -286,9 +315,9 @@ static void alloc_init_cont_pte(pmd_t *pmdp, unsigned long addr,
>>   		init_pte(ptep, addr, next, phys, __prot);
>>   
>>   		if (pgprot_val(__prot) & PTE_CONT)
>> -			direct_map_size[CONT_PTE] += next - addr;
>> +			direct_map_meminfo_add(addr, (next - addr), CONT_PTE);
>>   		else
>> -			direct_map_size[PTE] += next - addr;
>> +			direct_map_meminfo_add(addr, (next - addr), PTE);
>>   
>>   		ptep += pte_index(next) - pte_index(addr);
>>   		phys += next - addr;
>> @@ -326,9 +355,9 @@ static void init_pmd(pmd_t *pmdp, unsigned long addr, unsigned long end,
>>   			 * to avoid double counting.
>>   			 */
>>   			if (pgprot_val(prot) & PTE_CONT)
>> -				direct_map_size[CONT_PMD] += next - addr;
>> +				direct_map_meminfo_add(addr, (next - addr), CONT_PMD);
>>   			else
>> -				direct_map_size[PMD] += next - addr;
>> +				direct_map_meminfo_add(addr, (next - addr), PMD);
>>   			/*
>>   			 * After the PMD entry has been populated once, we
>>   			 * only allow updates to the permission attributes.
>> @@ -435,7 +464,7 @@ static void alloc_init_pud(p4d_t *p4dp, unsigned long addr, unsigned long end,
>>   		    (flags & NO_BLOCK_MAPPINGS) == 0) {
>>   			pud_set_huge(pudp, phys, prot);
>>   
>> -			direct_map_size[PUD] += next - addr;
>> +			direct_map_meminfo_add(addr, (next - addr), PUD);
>>   			/*
>>   			 * After the PUD entry has been populated once, we
>>   			 * only allow updates to the permission attributes.
>> @@ -596,20 +625,21 @@ pgd_pgtable_alloc_special_mm(enum pgtable_type pgtable_type)
>>   	return pa;
>>   }
>>   
>> -static void split_contpte(pte_t *ptep)
>> +static void split_contpte(unsigned long addr, pte_t *ptep)
>>   {
>>   	int i;
>>   
>> -	direct_map_size[CONT_PTE] -= CONT_PTE_SIZE;
>> +	direct_map_meminfo_sub(addr, CONT_PTE_SIZE, CONT_PTE);
>>   
>>   	ptep = PTR_ALIGN_DOWN(ptep, sizeof(*ptep) * CONT_PTES);
>>   	for (i = 0; i < CONT_PTES; i++, ptep++)
>>   		__set_pte(ptep, pte_mknoncont(__ptep_get(ptep)));
>>   
>> -	direct_map_size[PTE] += CONT_PTE_SIZE;
>> +	direct_map_meminfo_add(addr, CONT_PTE_SIZE, PTE);
> We have a pattern here where memory disappears from one bucket then reappears in
> another. Userspace could sample in between the 2 operations. Is that ok? Nobody
> has told me what the use cases for this feature are yet (beyond "it might be
> useful for debug"). So I can't tell...

Isn't it a very common problem for other counters in /proc/meminfo? For 
example, inactive and active, the core mm can move folios between 
inactive lru and active lru. The /proc/meminfo never guarantees to show 
accurate number for any moment. It just shows current snapshot. So it is 
basically used to monitor the trend, then the users can find some 
correlation in the trend.

>
>
> Overall, my opinion is that this patch is not quite cooked yet. Personally I'd
> prefer to see the first half reverted then we can wait another cycle until this
> is ready and apply it all in one go.

No problem for me. Will work on the new version. Thanks for taking time 
to review it.

Yang

>
> Thanks,
> Ryan
>
>
>>   }
>>   
>> -static int split_pmd(pmd_t *pmdp, pmd_t pmd, gfp_t gfp, bool to_cont)
>> +static int split_pmd(unsigned long addr, pmd_t *pmdp, pmd_t pmd, gfp_t gfp,
>> +		     bool to_cont)
>>   {
>>   	pmdval_t tableprot = PMD_TYPE_TABLE | PMD_TABLE_UXN | PMD_TABLE_AF;
>>   	unsigned long pfn = pmd_pfn(pmd);
>> @@ -631,13 +661,13 @@ static int split_pmd(pmd_t *pmdp, pmd_t pmd, gfp_t gfp, bool to_cont)
>>   	if (to_cont)
>>   		prot = __pgprot(pgprot_val(prot) | PTE_CONT);
>>   
>> -	direct_map_size[PMD] -= PMD_SIZE;
>> +	direct_map_meminfo_sub(addr, PMD_SIZE, PMD);
>>   	for (i = 0; i < PTRS_PER_PTE; i++, ptep++, pfn++)
>>   		__set_pte(ptep, pfn_pte(pfn, prot));
>>   	if (to_cont)
>> -		direct_map_size[CONT_PTE] += PMD_SIZE;
>> +		direct_map_meminfo_add(addr, PMD_SIZE, CONT_PTE);
>>   	else
>> -		direct_map_size[PTE] += PMD_SIZE;
>> +		direct_map_meminfo_add(addr, PMD_SIZE, PTE);
>>   
>>   	/*
>>   	 * Ensure the pte entries are visible to the table walker by the time
>> @@ -649,20 +679,21 @@ static int split_pmd(pmd_t *pmdp, pmd_t pmd, gfp_t gfp, bool to_cont)
>>   	return 0;
>>   }
>>   
>> -static void split_contpmd(pmd_t *pmdp)
>> +static void split_contpmd(unsigned long addr, pmd_t *pmdp)
>>   {
>>   	int i;
>>   
>> -	direct_map_size[CONT_PMD] -= CONT_PMD_SIZE;
>> +	direct_map_meminfo_sub(addr, CONT_PMD_SIZE, CONT_PMD);
>>   
>>   	pmdp = PTR_ALIGN_DOWN(pmdp, sizeof(*pmdp) * CONT_PMDS);
>>   	for (i = 0; i < CONT_PMDS; i++, pmdp++)
>>   		set_pmd(pmdp, pmd_mknoncont(pmdp_get(pmdp)));
>>   
>> -	direct_map_size[PMD] += CONT_PMD_SIZE;
>> +	direct_map_meminfo_add(addr, CONT_PMD_SIZE, PMD);
>>   }
>>   
>> -static int split_pud(pud_t *pudp, pud_t pud, gfp_t gfp, bool to_cont)
>> +static int split_pud(unsigned long addr, pud_t *pudp, pud_t pud, gfp_t gfp,
>> +		     bool to_cont)
>>   {
>>   	pudval_t tableprot = PUD_TYPE_TABLE | PUD_TABLE_UXN | PUD_TABLE_AF;
>>   	unsigned int step = PMD_SIZE >> PAGE_SHIFT;
>> @@ -685,13 +716,13 @@ static int split_pud(pud_t *pudp, pud_t pud, gfp_t gfp, bool to_cont)
>>   	if (to_cont)
>>   		prot = __pgprot(pgprot_val(prot) | PTE_CONT);
>>   
>> -	direct_map_size[PUD] -= PUD_SIZE;
>> +	direct_map_meminfo_sub(addr, PUD_SIZE, PUD);
>>   	for (i = 0; i < PTRS_PER_PMD; i++, pmdp++, pfn += step)
>>   		set_pmd(pmdp, pfn_pmd(pfn, prot));
>>   	if (to_cont)
>> -		direct_map_size[CONT_PMD] += PUD_SIZE;
>> +		direct_map_meminfo_add(addr, PUD_SIZE, CONT_PMD);
>>   	else
>> -		direct_map_size[PMD] += PUD_SIZE;
>> +		direct_map_meminfo_add(addr, PUD_SIZE, PMD);
>>   
>>   	/*
>>   	 * Ensure the pmd entries are visible to the table walker by the time
>> @@ -746,7 +777,7 @@ static int split_kernel_leaf_mapping_locked(unsigned long addr)
>>   	if (!pud_present(pud))
>>   		goto out;
>>   	if (pud_leaf(pud)) {
>> -		ret = split_pud(pudp, pud, GFP_PGTABLE_KERNEL, true);
>> +		ret = split_pud(addr, pudp, pud, GFP_PGTABLE_KERNEL, true);
>>   		if (ret)
>>   			goto out;
>>   	}
>> @@ -764,14 +795,14 @@ static int split_kernel_leaf_mapping_locked(unsigned long addr)
>>   		goto out;
>>   	if (pmd_leaf(pmd)) {
>>   		if (pmd_cont(pmd))
>> -			split_contpmd(pmdp);
>> +			split_contpmd(addr, pmdp);
>>   		/*
>>   		 * PMD: If addr is PMD aligned then addr already describes a
>>   		 * leaf boundary. Otherwise, split to contpte.
>>   		 */
>>   		if (ALIGN_DOWN(addr, PMD_SIZE) == addr)
>>   			goto out;
>> -		ret = split_pmd(pmdp, pmd, GFP_PGTABLE_KERNEL, true);
>> +		ret = split_pmd(addr, pmdp, pmd, GFP_PGTABLE_KERNEL, true);
>>   		if (ret)
>>   			goto out;
>>   	}
>> @@ -788,7 +819,7 @@ static int split_kernel_leaf_mapping_locked(unsigned long addr)
>>   	if (!pte_present(pte))
>>   		goto out;
>>   	if (pte_cont(pte))
>> -		split_contpte(ptep);
>> +		split_contpte(addr, ptep);
>>   
>>   out:
>>   	return ret;
>> @@ -875,7 +906,7 @@ static int split_to_ptes_pud_entry(pud_t *pudp, unsigned long addr,
>>   	int ret = 0;
>>   
>>   	if (pud_leaf(pud))
>> -		ret = split_pud(pudp, pud, gfp, false);
>> +		ret = split_pud(addr, pudp, pud, gfp, false);
>>   
>>   	return ret;
>>   }
>> @@ -889,8 +920,8 @@ static int split_to_ptes_pmd_entry(pmd_t *pmdp, unsigned long addr,
>>   
>>   	if (pmd_leaf(pmd)) {
>>   		if (pmd_cont(pmd))
>> -			split_contpmd(pmdp);
>> -		ret = split_pmd(pmdp, pmd, gfp, false);
>> +			split_contpmd(addr, pmdp);
>> +		ret = split_pmd(addr, pmdp, pmd, gfp, false);
>>   
>>   		/*
>>   		 * We have split the pmd directly to ptes so there is no need to
>> @@ -908,7 +939,7 @@ static int split_to_ptes_pte_entry(pte_t *ptep, unsigned long addr,
>>   	pte_t pte = __ptep_get(ptep);
>>   
>>   	if (pte_cont(pte))
>> -		split_contpte(ptep);
>> +		split_contpte(addr, ptep);
>>   
>>   	return 0;
>>   }


