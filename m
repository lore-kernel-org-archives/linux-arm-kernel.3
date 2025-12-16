Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A4DDD5B87C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 07:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QgpN+D1lecvgy0BvLfgYRhtABAMPEjn1xJUS2gav0ZE=; b=MUaSpu/XByvtFl/8xUVB/5w09N
	5bcdJhjg0mB9nI9KdoYHYhGupf5AAVuZIrU8YyzEeQyLUMFNPPOa3CQZibeUrW2Ms1fb94HyOI70+
	scAXmVGUl0rX8vHeA4h9zER2iKRK/ziy5phJzHRXPW5PqM01ozqjj11U3+7iqpz3nx7+hP76OQUyP
	bMg2RrZKkWhwDPT7T0ToeXONKSauHUGB7o9S6tOD+jFBwO3q8L2x4+5QKD7E7Q5s54mlc6FAFVohf
	edAvZBbugBhlKPLYnCA6RHFHeAlCw5OOrOnkKAFUcAq0ZgWLO9pgDeej+ZQT8OAN4ZmfVMlFHOJQa
	OQRO7hwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVPEZ-00000004pe7-0H64;
	Tue, 16 Dec 2025 07:12:35 +0000
Received: from mail-westcentralusazon11013011.outbound.protection.outlook.com ([40.93.201.11] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVPEV-00000004pdY-2pij
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 07:12:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vSwl5AAPLIP3epYAury1wylbWPsQ23Gf9oZRxOQv5IiPie6UWGmw+QsJtlaBx3jyPl4/VhCM1eRIWIotHPcZHRQGwDZxT4sjxENYiZyWEBXoUkbjZ1f7V1krW89Zu53FZ8VpIrwroL8jvfiYZXNv+yNdx6lijKE4mnrcRQXQcO2zJNp5LYKR8J3HCh05MwHMg6m5K2Quez+t7yvqORliqxGDCk87NbsZ1T2Lx2xg92G0tx80OKq3e20YnNjgHxocedvYpjd4kMW4fHSa0m4qrBEABZa72gR8CLvzYRSSqwtc89BDCFzBfpABMz2cFr3yCxTmZtV/vpSe3XnWyRyp+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QgpN+D1lecvgy0BvLfgYRhtABAMPEjn1xJUS2gav0ZE=;
 b=C1Rt3bp4fH3xxT5YKoXNyz/nMZxAde4fQAZ/a7u/z00Eex4YmoieStenWXqdb6oci+gQl3/IPHp0C7iXzzymTrwzv14/A+eJdBKzOUVZUi/bfFs/qdJKwDfesrkyCB+bRaJt/Y5ZbakbcMnVbdEoWlRnD2Jb0Gy0TnNG+bOwY1biII0PAIeMFCBTqzM7XZeTTiEgYZjz0xqrDWKHeyaSAIwSgizU2BzwihmOr3IIt+03dADrJ/k7UoTJZVEjfo6VBeT+icTfTIbi+tpsbq3M4aew4JGOoJyUaUxeMbuiwiqD/elAhGFWNRDHaFtOV4TunBw2av7Rb8faowZ+TT6EAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QgpN+D1lecvgy0BvLfgYRhtABAMPEjn1xJUS2gav0ZE=;
 b=hhf51gPgys3yBW7oxLflBJemoi9hf5oo0jhakEjhL8hHzzT64Y7weXxcNxIrvE8WwEwV/HrXbtqCD/iCSN4GLawtKfbiR1owdt6tlaWrx+4zcC3kFVmpDijXvtlQfppe2AyYk4JFpMZs00pq+lkCtJ09YMnZQ18KMWIL4jeaQhU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com (2603:10b6:a03:4f5::8)
 by CY5PR12MB6083.namprd12.prod.outlook.com (2603:10b6:930:29::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Tue, 16 Dec
 2025 07:12:26 +0000
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30]) by SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30%4]) with mapi id 15.20.9412.005; Tue, 16 Dec 2025
 07:12:26 +0000
Message-ID: <24e9397f-ddb9-4e6e-aaa8-3f0c0f647019@amd.com>
Date: Tue, 16 Dec 2025 08:12:22 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "arm64: zynqmp: Add an OP-TEE node to the device
 tree"
To: Tomas Melin <tomas.melin@vaisala.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20251125-revert-zynqmp-optee-v1-1-d2ce4c0fcaf6@vaisala.com>
 <88b72343-e86f-4b13-adcc-ba09683eb898@amd.com>
 <199062ba-9a0d-40ae-ac8c-0fbed5615cf8@vaisala.com>
 <3654c600-553f-429a-8bec-1add7f6eb5c6@vaisala.com>
 <db79cd4a-548d-46f1-b498-aac82ca53010@amd.com>
 <0435af95-a3bc-4ec7-b07b-bdec42f25c56@vaisala.com>
 <7e82a871-0234-409a-8fd3-a548cbb789e8@amd.com>
 <d4b2d17c-37f0-4089-b0a1-b790da36827b@vaisala.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <d4b2d17c-37f0-4089-b0a1-b790da36827b@vaisala.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0333.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::8) To SJ2PR12MB8109.namprd12.prod.outlook.com
 (2603:10b6:a03:4f5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8109:EE_|CY5PR12MB6083:EE_
X-MS-Office365-Filtering-Correlation-Id: 331314a7-3ea3-4425-382c-08de3c727773
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eUoxdWFkb3lVY0hKRFpBL0pSUWNHQjcrNU4vdVQyemFXVEI1S3d1aDhlVk1w?=
 =?utf-8?B?YlBXNnJ0bm8vTHoxWDlxS3ZlNHMxbndxVC80R0NlTnZ6blV5aDdqSndHeWRG?=
 =?utf-8?B?d29QVTA0TUNhclJSSE10REtXRkx4V2pzVGJRTjJNRmhqV01ZdUMxWExucktl?=
 =?utf-8?B?ZG1YK3A1L0VCdDBTYnN5SElTemo2bGpVSHlPQ1BwSDA0cGJtREZidGlJNEJ5?=
 =?utf-8?B?eGdRa3YvYWtrVThmWWNVdWQ2TmhZeXlsNW42dVh3M2dXUDVSdWM4S05KSFJr?=
 =?utf-8?B?Q3R1RlhlNGVxRFppcEx3MnEvSFhYUmZrV00xT0h2SGRvVUpxbld5d2ZKYU1U?=
 =?utf-8?B?R1Y0SGwyN1pRSHNzaFN2aHNsaDFONkNueGkrYy9lZEd1SFlsZmJ5b1ZSK3I0?=
 =?utf-8?B?WHVPYmtlN1Y3OFpkd0F5STVxUUdBczYrYjFyemZJTEFXeDEvbGlJZXcxQk4v?=
 =?utf-8?B?Z211cTdHQklYZCtOemtZZllrQlZ4WlFPOFVmSzIvWlNtSyszQVAxaE5jbDMz?=
 =?utf-8?B?U2ttZ0RITGM4aitrTVIxR2s2UjdiV2l0dVdNNjRvd0xSQVFvanNleEdEU0RR?=
 =?utf-8?B?TXNHUkZPUURmTFJiWWlmdTNvZ0UzUEpIV2tQVVF6TCtWUi9lNHdsemdXZ0No?=
 =?utf-8?B?aldKT2EwcmdaZ0FHb2VMZHViN3p5d1dnMmJSZjdRNm5QblBpUHZZbGh5Zkh5?=
 =?utf-8?B?UmVBbGp6N3hTWXUvNy8wVjRCNXpPeEdXMW9pc1hNcGcvc01WVE8wVkhWQTlM?=
 =?utf-8?B?VWZZM3dpVWc4SWJRS2lBSXdhTXo4VC9ORnp6VVJGbW5YbGszM3o3eUdJbUxP?=
 =?utf-8?B?K0owVmxCQVozMzZIQUQ3WmNWSUp1TUhhTENrUXlhMDI4MWM5WDZjK2U2cWt4?=
 =?utf-8?B?NXhUcC9yaHVsMFViYVFqWjZhTnlJZlVIRDVVaHFuQTZSRGZHSkpBL1JxNnRY?=
 =?utf-8?B?NkQ3SDZQb0ttZm9EbkVGUE5UdjVLbFlUejNxMjFzNTZBd0l5WC9TbFRyYnUw?=
 =?utf-8?B?ODVmTmVhSVZURzJ0MXBmN1JOY1cyZmMwODlGMEU0QXAyNU50a2xOeGFKaTNS?=
 =?utf-8?B?R0xkL1BLV2JxMmxBTzZoRjZqZTlHRmpuWWpiaVhNem5RbXJVdEk2SUFBK1Ru?=
 =?utf-8?B?WVYyRVpHWVhHR2hHdzhGZE9KMzI5YWJkbUc5eDAxZmt5eVhLeUYzYkhvc05q?=
 =?utf-8?B?M3E3NzNXVDBIU0xZSnErdnFLUEtlNm9wemQxdGp4NzFDYi9obDVVMzZNVTlx?=
 =?utf-8?B?ai9BeXFZcGR0M3RHT3lPWkV6cC84K3ZwTFZveUpaZlU0N0p4YXJuUkkycHFY?=
 =?utf-8?B?UTgrMGJrOWVJOGFkQ3VTSEZsallxZkJQOU12S3BlV3E0V05QVkZKMi9ldUtR?=
 =?utf-8?B?eTI0aGlxYWRQTEJ1TmN1SzZLRStNZ05lZ1RSdENJZmhhWWg2aTByazRENWRT?=
 =?utf-8?B?UWRaOC9TK1RPYXd6Ulh5UWdzZmxab1BJaEZUWE1jdnpUd0dsWm5wK2NFSEZW?=
 =?utf-8?B?czZuNUc5NmhHcTRpOWtxQll2N2FDOU1nTE12VGdtM0hFVFhMYkNOQXBXTjRl?=
 =?utf-8?B?VWtsU3dBS2NZcXEyUTBzYmhXMlFDME9mVzVsTHpMSTJRM2x3TWYyOGFHOXF3?=
 =?utf-8?B?MEFZQzZVSVFnR3poYTNiMXd2dFBXYnFIdE5xTzE5Vkw5eWJNeUR3dTFqMVNi?=
 =?utf-8?B?Q3N3Z2ZLZWRjOUU5Qmh3M2V4VFphRTBvaEh6cWd3VkZtU1RvSERLNFVVQ1Vx?=
 =?utf-8?B?cEtNN1IxcGtGNWtIQUJyc2dvSHFPQlFlMWNSQ21YbXBaWUplWGJ3RDVGQVR4?=
 =?utf-8?B?Q0M1SHorQmpMVUF1a1VQakJ2Z09EMytwRjBKT0lzcXpFWmRLTkdXcGVrYWxD?=
 =?utf-8?B?SWZPcWlOSU94ZFJjRnlqeElhaXBRckpZL3V1TzZzelFsdDRiMEgwOEhBeCs3?=
 =?utf-8?B?OEVHTmoyZ2sxMnhrR29DYVZsdnMwekJFenhHNU93eCtCV2lsakYrellYUHFZ?=
 =?utf-8?B?ek1tbGt2Z2dBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8109.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aERnbXNqWkc2YldSaFFtVFhaUFlRV2t6Rk4yQjZGYU15K0FXRmtKSUJZWEVp?=
 =?utf-8?B?MW5SeFhzZnNnNWVVQ2txQy9ZV2JCVHB0emVPTU9WNUJWUHRYZ003MStXVTl2?=
 =?utf-8?B?Nm42K29oRlhxS2hzMkJhTTM4MDVpdnpkVXhqQno5b0tROENHTVlHbUxtNTVI?=
 =?utf-8?B?MzBlZndtTXovUXA0R3hnaWxNOWpiNlBORm8xd0NDTWM1UWdQbFVlUUxFbWpo?=
 =?utf-8?B?UWZ1bk00TjYvS0tDSTl6NXZsU1BqOURSWHY3bmIvNm9CbmFqZE9zbFViOFcx?=
 =?utf-8?B?SHZvYnlQSjlHMVF6MUxVVGVUMXpxTUhsd0lReTZnTlczODZrbTZHSDE4VHZk?=
 =?utf-8?B?alRoWDZteTc1azdyRDA3NE0wRmk5alkxd2lDU2FaR1N4eUlVeFhpem52dnFw?=
 =?utf-8?B?VEQzOEF6VlBrQlNWeUZ1cGY3TlFTTkRpSE53cXppaDA5RWhTTjV5UDNJT203?=
 =?utf-8?B?ZjhqY0lMcFIwM1ptZUMvcGllVlRYdUZpUllpa0ZvRWFmSXpJM2cvMmpSZUox?=
 =?utf-8?B?d2RmcStQNmpwY2huM09pbi9UTTNjWDV4RTlLSWIxQ29BQlBuUC8xTzhLRURX?=
 =?utf-8?B?SWFMeUc5VG1FMFluZFBaTWx2VXg5MUo4cWN4UXlxTElCMERrS0FmbXd6L250?=
 =?utf-8?B?ZjlPNEtydm05WDNubzNENERzcTMzSThkR3l2eXBpSHVMRWRreDFQTkYwaEJo?=
 =?utf-8?B?MDhkVTNGRmw1dUljVG0xdVFIQXkrWFIwa1owWFhOcFJYY2dlazdPVHJKYUdR?=
 =?utf-8?B?T2Fsa0JTWjdnbU9oZkx5ekxSamtDcnJGWmRySWpMRnlkSGxvVDUxNCt0UDJQ?=
 =?utf-8?B?MTFNQ0MwM1hMV2E1T3ZsS2VXWEhCeERLbWtPb3FFR2hmSC80VjYzWHhvU2gv?=
 =?utf-8?B?cnVKQmMzR1dXTUJHN0ZQWTl4c251endvRSsrQmdPV3lzTDNtQU94Y2NNbEJW?=
 =?utf-8?B?TktHUzVXdEpzWGYzVS80UzlaMEgrU1pPZWIySFc1bWptUkVnZUtyVHUwR1A5?=
 =?utf-8?B?N2tpYXZ1eisrNVp3N0ZHYy9LSVNUZFY0NWVUR3kwR0EzN0w0WlFXR0Mzai9w?=
 =?utf-8?B?T0ErSUw2VUdNRkdtdnR4dUtXQUdacnp3b2xtVXpBQmZNSmhld3JvcHp3TDZx?=
 =?utf-8?B?clY1bVc4ZGY1N0RabGdhWXdIVkNycDI5YzErUGg1S3dCVEkrWmt5dUNiY0RH?=
 =?utf-8?B?SXBMNDF5blBPUW1VaUc5VDIxck9odWUwZHc4dmdPdCtzaWlISGpNdDhwamZK?=
 =?utf-8?B?NU5IY2xhUG9Jdzd2SDY0V0lwdEhUb1crQkZhVEJxTlpHUFRqU0QrUVdyZkZz?=
 =?utf-8?B?eTFzTnhRaXRpMVFnU3Z6YmRicmRHenRwWXJYa0RhR0RJSzh1ZCtCT1NyeERp?=
 =?utf-8?B?TUcyMTdtZDhlT0ZXaEZWNUxNcTJnYVFZUStHamx6QnpKOUdMUmlGYTlZWkdQ?=
 =?utf-8?B?dUxVNFlMWEZOdEllM21VUlBKZi9idCtiYm5kTjR5TXZzZUZIUWcxQ3hUcm9t?=
 =?utf-8?B?WFJkd3dyN2NaUzVmVzNxcDJ4cU1IT3lqOXVnTVYyYmR3ZmFxMThqU3BMQ054?=
 =?utf-8?B?WnFWV3EyL29jaVloYTJmbzFId1MyZDFueWFxNnp4REdHWUJBQkxDNGg2WkhD?=
 =?utf-8?B?UHlIMHkwY3orM1d5cU9HQmo0WnViVTVTTFpKV0VGVzRxekZUOUFvc29UcDla?=
 =?utf-8?B?Vy8zbGdyMHhTOHMweTFONStkcitTWHZ6eUs1ZWJqbjIzdTBLMUs0eDByZDRL?=
 =?utf-8?B?dSs0cVcyWTVPaGF2bmRCRmJnNWswZEY3MnBSMklTRjdrbmtjVGNxa1hzV2Ry?=
 =?utf-8?B?eGxyVUN1VUVzY0ppZ3k4TWVGdUJZV3hsUFZ6MndQaEV6RlpPSSt2RjR4Njc4?=
 =?utf-8?B?U0Z0TXRwYlg1dzlEbXFXbkcyOGw3b3NSRnVkQkp6c0crTjNTMTRNQStjc0JM?=
 =?utf-8?B?M2EzTWRKckJEeWhUVTVyVmNUZkExaEpFcU9jZ3krZHVNV2hqOEQ5UzNZWnJB?=
 =?utf-8?B?a2VGRElRcnZCd0NJUXhVRm90VXZodzlCVmxFaCt6NGsxWVVFdnplcVFHcGRw?=
 =?utf-8?B?NHc3ZUpIV1FCbWROOWV4cU9XbUpwS1FHdXdHNVh3NEF3SUJLZ0RZZFZ6QWlP?=
 =?utf-8?Q?FX8JhouR842WyCCxfK6jP7WAJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 331314a7-3ea3-4425-382c-08de3c727773
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 07:12:26.2041
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zB/so7SAeDYyoeZBgYU+QG2/XoJ4C6fGeHSOTs5bdROEnNjlisSJUbDae1jenuVa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_231231_859514_36FBD8C4 
X-CRM114-Status: GOOD (  12.21  )
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



On 12/16/25 08:00, Tomas Melin wrote:
> On 15/12/2025 18:10, Michal Simek wrote:
>>
>>
>> On 12/15/25 16:43, Tomas Melin wrote:
>>> Hi,
>>>
>>> On 15/12/2025 17:21, Michal Simek wrote:
>>>> Hi,
>>>>
>>>> On 12/12/25 13:09, Tomas Melin wrote:
>>>>> Hi,
>>>>>
>>>>> Is there some more specific information I can provide regarding this patch?
>>>>
>>>> I am trying to identify U-Boot code (2026.01-rc4) which does what you have
>>>> described in the commit message but I can't find it out.
>>>> Can you please point me directly to file, line number where that described logic
>>>> is skipped?
>>>
>>> Please check lib/optee/optee.c, in particular lines 128 ->
>>> Target dt being linux kernel devicetree where the reserved-memory nodes
>>> are automatically injected. When node is already there, it bails out early.
>>
>> I don't really mind that's why applied.
> Sorry I didn't really understand, where is it applied?

https://github.com/Xilinx/linux-xlnx/tree/zynqmp/dt

And it is from today also in linux-next
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/log/arch/arm64/boot/dts/xilinx/zynqmp.dtsi?h=next-20251216

At the end of cycle it will go via soc tree to Linus.

Thanks,
Michal



