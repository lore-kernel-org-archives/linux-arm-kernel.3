Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 618B7CCA471
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 17:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4H9qiXspJovDIO5aqJfmFLhoftqxveJ6icsNJpNz7M0=; b=kqnM+b2I7aYvzTLebcaRTyrzlb
	ogLr2grZyaeHW+Jp2+i1DTGkqHKhJLZpdG0YTJVSPErcPvHAd/nAzQY6EkZDgs2wtC6SoMYibnrei
	aPkFOuSwhgbuz4oXi3fmbgSWvq1iSXjiLD0AJT7W1xWcWZOKCssT4xz5o5at0xzkFPF/iRCDZX8f0
	p6MWpaIvnLR0qdk7D90kKgLgfKVJAlLOTTRHk9otF6kYnOXzVp20/BuPgdYDo5u1jsKh+82GQutkS
	Uq+SN+lfZ0CkM3jfNWdh/jUIOXuJAO2+NffOscaNx2a1BK71K/OSNHO88AwnOE9C8wyX/N2u/Gi5G
	k9H2celQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4k1r-0000000CsqP-1zkV;
	Fri, 03 Oct 2025 17:57:15 +0000
Received: from mail-westusazlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c001::2] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4k1p-0000000Csoy-1L3u
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 17:57:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RBnObWtg+BISuL/ZpwENHsqbrajP/EmkpQWYvqJPRL/aKmn+c4tTeYNTK7db5YFAxeb0nNng4qgkOmv1DCt/Q8j+D8p0Blozs3pj94YiIGucghjUgsTgSUXwdhuI8dCrTa3fKVxkrsEoe4rVHr9GW/h/KzVLYxFS3ySyuQpH27DBdnedtMc7NyELVEH+7Ejc2vgw4eppDEs3R5oCzNzAYvrSQ1PjgA1RIXB6k+sr1WXcCsP7HT97xnIWZi/ly2Sot5FMrzTrOQ/P2amgVWgeXQv6TNtgIEx9gfSs8t+N90vo6IN5mWeEPOmqhXJn/SrND3VcOWkTTqsMcXlo6MNjbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4H9qiXspJovDIO5aqJfmFLhoftqxveJ6icsNJpNz7M0=;
 b=GFaGpzuI+lkGKAuXjeig0ypBR5fcV3uRXbE2i6ILcKhx4P4+q5dN+zqnCZU7sDyRjHW7VUJMHJa/8M8pK+vVc3JVMFpcjPYE+sPU3OnQzkSNsq4MERAReE9DJzG/NTPfiVWquAlLEHdf2xGZ6EHDExJ5Xfo3yQBk3afSGd/TSiLz17XoZGZpVxBnwI6OatW70QKzcSmcBpgrBy6bAX3/IAW0dL1X74Pi1FrIscPrrn2FHi6bW2GlxtVP6IOlOFf2sqnYRycXZCFXkwSjDnGtuBtM83yKdf2zGmTGP4lqgy5kYT/HDkgtr1imt47rNNmcxr1C/smT1wB2uDe9+wLo3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4H9qiXspJovDIO5aqJfmFLhoftqxveJ6icsNJpNz7M0=;
 b=PSwual7kXYaduyiVF8nAHJZZS0h3qsIwjFLhK0gHXW/I7xoVrd4uo9G4wJ5TkGNgb0JPRmyHbgFBtspVn/B/19Z9olKLFYWM4NfXhWrIoW4wFmPjImL5e+jfjZsQbuLDpaeiIxPgOIdrDxeei42hfU1jcbVB1FLYKaXd6aeUyB+dcNcWMIMDJpUGYBB7qg3fK9nuyX8pEHPjedOMBboLkLnC4gydPf8XiuZLDniy/SygV+nFbI55ASMG4h76oO9zRgyKMDXCr8sQ/CLO0e5jq62P+dweoFeNvL1Flyx7/tuRrkyI6GS3ZvIuHOEzjB3XBiEu6NsThOWWTfEYWu01oQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB2661.namprd12.prod.outlook.com (2603:10b6:a03:67::13)
 by SA3PR12MB7784.namprd12.prod.outlook.com (2603:10b6:806:317::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Fri, 3 Oct
 2025 17:56:52 +0000
Received: from BYAPR12MB2661.namprd12.prod.outlook.com
 ([fe80::f4fa:1948:9ea6:1ee2]) by BYAPR12MB2661.namprd12.prod.outlook.com
 ([fe80::f4fa:1948:9ea6:1ee2%5]) with mapi id 15.20.9160.017; Fri, 3 Oct 2025
 17:56:51 +0000
Message-ID: <8ef43496-fb11-4007-945e-4bc7166e5c1a@nvidia.com>
Date: Fri, 3 Oct 2025 10:56:49 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/29] arm_mpam: Add cpuhp callbacks to probe MSC
 hardware
To: James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org
Cc: D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Dave Martin <dave.martin@arm.com>,
 Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 baisheng.gao@unisoc.com, Jonathan Cameron <jonathan.cameron@huawei.com>,
 Rob Herring <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
 Rafael Wysocki <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>, Lecopzer Chen <lecopzerc@nvidia.com>
References: <20250910204309.20751-1-james.morse@arm.com>
 <20250910204309.20751-11-james.morse@arm.com>
Content-Language: en-US
From: Fenghua Yu <fenghuay@nvidia.com>
In-Reply-To: <20250910204309.20751-11-james.morse@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0013.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::18) To BYAPR12MB2661.namprd12.prod.outlook.com
 (2603:10b6:a03:67::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB2661:EE_|SA3PR12MB7784:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e2783f8-17f9-48f2-c0e4-08de02a63b44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YzRVaXU3VGc2RnpWV01DZFRod1Y5L2RmSlBqWkZwMWJYR3pLNXgyOTlWU2tX?=
 =?utf-8?B?cWJCdlBUTmhaeUtlQWFXcWEzSXdXQTJTUy9VdThjdWhVQ2pLWEtza1lvTG9r?=
 =?utf-8?B?U3hHQno5YlhtSHJjMjBzK1R2Z1l4cDB4Um1kZ0JiTEtNb2p1eWZuM1lFTjMv?=
 =?utf-8?B?WVluVVAyQysycHh6aUtlVjNheXhtS1FPWWZ1ZE5Pb1RJYnFqQXFiMDdVa0dm?=
 =?utf-8?B?bE0wSjBqM2lwSzRJbWQrVlJLYTU0Wi95SkJLV3hCT1BlckR6U3dHb3ZnZHNJ?=
 =?utf-8?B?MzJaRnlPT0Rua29RV0RTLzhZV2dBcGhxYkpBMUJrSFJKWXkxc3R4UUQ3b3pp?=
 =?utf-8?B?eld5ZUtEUHh5MHBjNG4vRnByWUxyZHpTTVFCRnRrQ2crNXBuTlJicURaR2xz?=
 =?utf-8?B?ZDA4QnN0NE0vVVlLT1VNRWRXM0FzZldWUkVQNnpOb2hwd0xLcjZEQldxRlUw?=
 =?utf-8?B?ZGl4dmNhL0lSRDZaTlNlZDNGeFZyTUszU0lvdHMraE9aZVl4a3J2QTN5MFBv?=
 =?utf-8?B?WGFtcW1yS3kwdElUU0x2ckMwa2JOblVwNlgwNHpjbGxSM0FnU1Y1TDlOTjQr?=
 =?utf-8?B?MWthS3lXZlluOWF0RVNuS2h3WFk4WXdlZHZVdEYvZjBwK0FVeFoxaUwyeXF1?=
 =?utf-8?B?bnNBZDkzU1liLy9wQ09wWkFLQTZpZHFyamdiRG52bXRNUHpmN0YyWWh1K2xK?=
 =?utf-8?B?ays5aVgvZkxTWmtiYXdSMDNZYWxGTmlHQUxsYVVDaytpdFk4L0hPQ2JqMHhM?=
 =?utf-8?B?ak9tcmRlQzRoNUZlbGhhWlZtVnlpc1hodXlkV3FkZVlmNGNldWFUbjB0dVJO?=
 =?utf-8?B?TFNyTjVZUVY2QnBhRzRnOFkvR1BMZnhyMUp0WW1laFg4V0tpMDhNOURDMzRi?=
 =?utf-8?B?WTVjd3JRNDZzWkwwcTNpaytWKzc3TWp6Y1pYbnFabmVhZjNUZTdqbWdOTE4r?=
 =?utf-8?B?dzNvaCtLVlN0TE45c1A1cEFlTHBwelYrOFN4ODRoWDhqeXR2ZHdXVUhuNm5u?=
 =?utf-8?B?bVZnYitMbjRZaENJOTdQWHNxbjI5UE5uOG0wLzNUa3hWUHJtZEYyZVJUU0da?=
 =?utf-8?B?Y3h3QXk1NG1Pd2d6cXduQ2MwL05uZjdiYnlFK1dWZDNSdkZ0ZkxHekwwbUJC?=
 =?utf-8?B?eHp6L3NVaUQybDROU1pCellDMEJtM2pTK1BtYlFNbGhMSmVxNDh4Vm1lTUhQ?=
 =?utf-8?B?U0RXaVZlTmFLaTlpNmVsM2UxTmV1U1NxMS84dEx3eDZXUGU1TVkzcmRQVmVZ?=
 =?utf-8?B?VThpTUZNblBCWGdPdEVWaEYybTRtZGkrUHFiRVh5YnpGYlpENy9CaU9CSUNl?=
 =?utf-8?B?RXg2akFPeGpMVERsV1JQa1RwQmlEUllBemlXZndrLzNZNGNtMWJlSXd4Rm8v?=
 =?utf-8?B?WnpQNWZ3UzFNWVRETHloc2VyRVJIRVByTlFlcllNZHB5WVRXVDRWdFpzTmVF?=
 =?utf-8?B?MlZwZDVvRXNTS2x2ZHp6aU1iKzRrY0ZsZTZocWdlbituajlpblFySTBVcnJ2?=
 =?utf-8?B?L3MxUnlYNnFISUpJZ3NXTnlJNDcyK05mNU9HY1VPRFFQY1hMUjFOMTViSzg2?=
 =?utf-8?B?c0FKclRWWGpSM3A3cXJITlFzMkJqTnNFdjBBRmpZUmNvMzBOaGtXbGhsUnph?=
 =?utf-8?B?dk5OejREZUQyTVQzWFpJMG1ucERkYnRZckFKMG42NVd4eWR5eEFld0p1emVN?=
 =?utf-8?B?cDVjSzNHTVlzdVJwTkt4QjFxc2NCR1NWSSsxS0FybDlYaVBPT0JMWFFzMmd2?=
 =?utf-8?B?WEtSTE5mN2RzTWo4azY5WktsbVB0bEdrU01qY0pKdGEzWUptMG9nalo0N3d3?=
 =?utf-8?B?eDYrUTMrMWZMYjF4RllFREo0cnBvTkMvdDVIY0Y5dUtId0hJVzI2S05HSmJG?=
 =?utf-8?B?RXJaNit6TWtvNVNFb0FVQVVObEdXQW5UbFowYmkvTlg0RFdvWDkvUG5VNHhy?=
 =?utf-8?Q?T7R1cK2wEBi1FXk2jRYUyxjYbl0p7i6L?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB2661.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SWNoeWJZRTFYczRqSnZHQ0tOV0ZFQ0dBZjlMd0lpajZmYWVadncxQVZ6a0pz?=
 =?utf-8?B?MlordHhoUXhGTzhTNkdRaUdLUkxHN1NtNy9lNkx4Ky9HOEluVXlqQlcvSEFv?=
 =?utf-8?B?MUxqNlE1bHRJbkxEQXJLQkZtdVdrMStLWUtpdUdrbWYyM2Z0RCtIVy9hRnpR?=
 =?utf-8?B?RE9kZGQyQ2I1bHFJdVRPL1ZTMjZ4NDI3bTd3V0EwSS92M2tXKzB5eHUwRWxT?=
 =?utf-8?B?QU1oRnFhQ3E2aXU0NzlQb1dXdXd5Nnl1WXZLS0plZFcxZDRETG1DcTdwVkF4?=
 =?utf-8?B?V1dQQXFnblF4M3hnTkRkc0ZTa1lHcDhXZlRMa2J6TUxkYmRmRTI2Nk0zU1lG?=
 =?utf-8?B?ZDdRMGhpUDBzalh0cXgzOGYvYSthNGNmN1ZxUXZnVnFEcDN6SU9vREJKREV2?=
 =?utf-8?B?cDNKTjVHYW5BQzdKd3VDcFZrTzUxV2QzU3pnSHp3Um9mUGIzckM0azVnRXZn?=
 =?utf-8?B?US9ZY0t2dmgwMDhzb21JUkxSR29YWmV0VWFhRENnaktSdUVjVXJueHZPYVlG?=
 =?utf-8?B?VlFKdCtyeGtGMWV6RkRMeVNjNE11MjlsN3JnZ2YxSGd2QnEyVFBhVGlBc2dQ?=
 =?utf-8?B?cTIwM1pRVFZwRE5tVVg4WlZ1UVpia1FHN0lKU2t3S0RHRFRVdjlObXNSUENE?=
 =?utf-8?B?L28vYmZkWWl6WGcyZlFSNzFUd3VUL1hmWEZtQmNPaWk2L0hqWkJYTWpqY2pC?=
 =?utf-8?B?MElxTDlOejArZDMyaTlpTXhIc0lPOWZ5MEltK2I1YmFuT0dTaWdVa0x1WDZj?=
 =?utf-8?B?RUdNL3dqdWRIQzhIOHBtdTYxbGZUNXU4Q21QaDdIK3dKaW9LeCswalU5VE41?=
 =?utf-8?B?Z3lsbmFBZDQwSkx0VXJjTmhzZUFWdUlESnQ0NlVpdVFTY1lrZXFBeXdVUEpQ?=
 =?utf-8?B?a1hWeEpqN2lVQmhEYnc3OFdCQ1dIaVlGVmYraEdwL3BEeVVpRGFCSWxyS3lo?=
 =?utf-8?B?STNSdFU1LzFaMVNWQ2tsK2I0SjE3ZXgzL08vNkpuKzFhci9jbXppeExtTUc1?=
 =?utf-8?B?T2R5Q2NYeFRoeEdLVm53ejNkZVVGVGIxdDRCdm90TW5waG9zTEFqTVV4VFZl?=
 =?utf-8?B?a29LVXllQ05BTXkvTFQ0enVoUDBjVnlaMjZwWnhjZjJaZkd4aWFQUXlhelVy?=
 =?utf-8?B?S1RwK2ZmODNTaWVmQjFvQktUQlBTU3R3dEozSVpLVmhGNjAyYU5QYjJZOWo2?=
 =?utf-8?B?MWcrSTFrRzVJSUx1ZmZ1QkxKU0E4a0gxSVpVRVFISDRNYUl1dGJaU3B5SzJa?=
 =?utf-8?B?dzdLY3dMUDV0SzZqVlI3d1kyTFJ3dTdYM3c0QWI5YTRLb2NvV3FXcFVPUWtC?=
 =?utf-8?B?SC9QbTQvTkxZOStXbEFpcFBCMGxKdVYvbVBDZGorM25EcDFEd25neGpPR0tG?=
 =?utf-8?B?UjdpK3M5d1RtWDgvcUZDTDFEa2ljRWQxWUU4MUpnU3FLQXZIaVNnMEFmb3d0?=
 =?utf-8?B?QjI2Zks5YUUxeXJrM1VERjVGQndvbktHbjZuQzJPMCtsY1FVMDdKVFNUZGUw?=
 =?utf-8?B?RzhMNkFydnpONUJtcjZTOU9hekpsVHB3UVB1eWphMmttSmhXYWJyVi9oRkIw?=
 =?utf-8?B?UXgvWkZseXFsQnp2aEdFbnBrb1hhdE85L0hLdEZxSHdldnRZVDhTUWxhQ3hO?=
 =?utf-8?B?Zk80YjVJV1hiOUlFSTRqZFB0L2Z2ZnlubzV0TGZxM0FLOGVkYUF6YWY5cXQw?=
 =?utf-8?B?RlhPbzRtTDJaV2Q5Sjduc0h0M0t1TXB6YkZ1SWNDUDdmSVVwY3EvRFBaM0Rk?=
 =?utf-8?B?VWhzcEliRWRDSkpGRjloOXgySUphdFpia3BqbDBrNlVOcU92aWw4eExJdlNI?=
 =?utf-8?B?dDJnSVpxWTAxUG9ic1dLTlVBaUFkUVArWXJLdmZPaEtsOFFidmk3ZXJDOUIx?=
 =?utf-8?B?T0dFNG1nMkpnR21YTjJsTG1hMUxQWjdCUGpDakprRnBEd21Ha2NYSXh4dTJM?=
 =?utf-8?B?MGdFeHJnWmZlaTI4bC9oNXVrZlcxb1RNYlhFVVNZemw2bjQ4Y1F6d0I1UnNE?=
 =?utf-8?B?YVlzcHNMVytEcVpLQ2VGeXkrbmNOYVlJVzhzS05tUG1YMVB3T3QweGMyNHVR?=
 =?utf-8?B?U3lZeUN0ekpnaWZoMmw3Y1hYdVNJWnNoUHB1QjBUNnkyWlZCL0FkZXlTaklL?=
 =?utf-8?Q?2sDw2KLw5Fk0TnnREbi4hDd2y?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e2783f8-17f9-48f2-c0e4-08de02a63b44
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2661.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 17:56:51.8119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aLGgud3ccZrI/QmmL9yZcfR+vdx/bHXYmUsz1W6x2DS+lAulUoAXpUqWYfQJOrNw9csmtcWb5tFuYi5c5nx27Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7784
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_105713_355062_F57BE100 
X-CRM114-Status: GOOD (  16.89  )
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


On 9/10/25 13:42, James Morse wrote:
> Because an MSC can only by accessed from the CPUs in its cpu-affinity
> set we need to be running on one of those CPUs to probe the MSC
> hardware.
>
> Do this work in the cpuhp callback. Probing the hardware will only
> happen before MPAM is enabled, walk all the MSCs and probe those we can
> reach that haven't already been probed as each CPU's online call is made.
>
> This adds the low-level MSC register accessors.
>
> Once all MSCs reported by the firmware have been probed from a CPU in
> their respective cpu-affinity set, the probe-time cpuhp callbacks are
> replaced.  The replacement callbacks will ultimately need to handle
> save/restore of the runtime MSC state across power transitions, but for
> now there is nothing to do in them: so do nothing.
>
> The architecture's context switch code will be enabled by a static-key,
> this can be set by mpam_enable(), but must be done from process context,
> not a cpuhp callback because both take the cpuhp lock.
> Whenever a new MSC has been probed, the mpam_enable() work is scheduled
> to test if all the MSCs have been probed. If probing fails, mpam_disable()
> is scheduled to unregister the cpuhp callbacks and free memory.
>
> CC: Lecopzer Chen <lecopzerc@nvidia.com>
> Signed-off-by: James Morse <james.morse@arm.com>

Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>

Thanks.

-Fenghua


