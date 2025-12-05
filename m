Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03E37D3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 23:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cX95DhTrbyFbG9i3K22cXMnG8gPM+Wa8O4sa04v8RMA=; b=B0Th//tbbnnfByOLTM3nZXwkzF
	aXZdOl/jA9fd8KLV4wq5JUoMDd9GMG2ZAP7bv4Fy7axNYoOU994cOCVb9is32V1Ckqo38BS8ASv3R
	0HES9EWzfd5ztXXujGR4NueDwZHxR5pBMrc5T51al/qE2jB4n1fTbJgNRWbxeiqzKVie4/+CfH7KP
	a793lDPz+KcMwHkmFhHx+f7GtmLiS6kiYkg2dXhDk28k9F/b+u7eI8roxXcTYxqujXoDJAAaitOma
	rhK3+yVj/bwxvqvVbQtFuNddsa1YQfcvYqCu+2hK35vmjMcwMVLc8VkJxMdSX/hqSGivR8Op4BApN
	i9jPzVxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRfdO-0000000AD9B-0s6s;
	Fri, 05 Dec 2025 23:54:46 +0000
Received: from mail-westus2azlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c007::2] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRfdL-0000000AD8k-0qDI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 23:54:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cTs5ZmEf9JLGHTdT+hRoGoQtCyhxNHeQvtBvzFP8CnEl4UvLofrzkLndVSivKdmKEGPwGPTUzUiNYV8ej2LelOVuA1S1Wg8eRnuefvdHE85UJ0PpAOeQF+JAIMizpuNuVgvAitCeUDLwMIepFXZ8Qxtzi8Rz0QjVe6arZhYu5v66Np0jku8G+AOGH82Byp+U6I2CxS3HFHOUZHvIBEGT0Dm09ouLLfFIaiJM/8LcqWm84n7/4xOJZ7RoidJYrOeMiVLAgwrvfP4Uo4X7dfUd4X1ujKz6tIdIGvotETdX66Ksy32cebzaF97PW9I4OawV/P2H1Yag6uYgCqgzL+i+9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cX95DhTrbyFbG9i3K22cXMnG8gPM+Wa8O4sa04v8RMA=;
 b=GSyoZzJakXI807nYRXVDo4okw+qGPC+vmKJ33uF3vYER8VyhUbW2ZhpMzHASqlSIJ7mmQtiERNGdozkn/z1DwcTqnM+MvvQGk43g63wGlhbZelt7zUa8tpjbDsud8PQoz3pT1qmEH6PtJoINUsWuV8iiWL7G+1JO8V2C2jacj4kJLWuBASEDt+EvqRy7mGhjG/BhoRz4c5JONWEjs/qeMNDs2lKW65a5XIxj1SrkqDaLS0Yw64yMd8cKrwRD5KNzRm65m9PMebA7BIpxNCIFI4K58qzdVFhorpcGvftHXU52wgWa03/mNgdntTosl/mhrcVbTtZci3032iKNcd8oVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cX95DhTrbyFbG9i3K22cXMnG8gPM+Wa8O4sa04v8RMA=;
 b=t5R++DCMnecq6WMGkOiVMCgr7NTf5aVtTZfquTHyDqifuV7jsBwb5OYbc1DL91TVMFukOR0i11+5O5Kj6MksCr9mazu+JBcebaPJM1zfr8pXat/NLxIzCjx+/vsazEyMLwO8yAZBwJZfWYdng2jhEESDmTX3HkmhHifVtD40S9yhk/q4cujD9YKzCUXRa6NOSQlfN1WVD8X+2uGyFhOT4UC6YCGY8Bq2BKNglrTww8z0RH/VfGf8nYqJ4f2E5eY/76n1S6EBAIqAF1FuOgNTmv3707lKdi/6hlimK6JuFr+mwgbQzRnzQb6mYAnTW7YS9heBbvlkvlsOvJthU6ZS2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB2667.namprd12.prod.outlook.com (2603:10b6:5:42::28) by
 LV2PR12MB5846.namprd12.prod.outlook.com (2603:10b6:408:175::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.12; Fri, 5 Dec 2025 23:53:38 +0000
Received: from DM6PR12MB2667.namprd12.prod.outlook.com
 ([fe80::bd88:b883:813d:54a2]) by DM6PR12MB2667.namprd12.prod.outlook.com
 ([fe80::bd88:b883:813d:54a2%6]) with mapi id 15.20.9388.003; Fri, 5 Dec 2025
 23:53:38 +0000
Message-ID: <a3305659-929d-45f6-823d-a886f197d652@nvidia.com>
Date: Fri, 5 Dec 2025 15:53:36 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 01/38] arm64: mpam: Context switch the MPAM registers
To: James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@kernel.org>, Dave Martin <dave.martin@arm.com>,
 Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 baisheng.gao@unisoc.com, Jonathan Cameron <jonathan.cameron@huawei.com>,
 Gavin Shan <gshan@redhat.com>, Ben Horgan <ben.horgan@arm.com>,
 rohit.mathew@arm.com, reinette.chatre@intel.com,
 Punit Agrawal <punit.agrawal@oss.qualcomm.com>
References: <20251205215901.17772-1-james.morse@arm.com>
 <20251205215901.17772-2-james.morse@arm.com>
Content-Language: en-US
From: Fenghua Yu <fenghuay@nvidia.com>
In-Reply-To: <20251205215901.17772-2-james.morse@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY1P220CA0020.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::7) To DM6PR12MB2667.namprd12.prod.outlook.com
 (2603:10b6:5:42::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB2667:EE_|LV2PR12MB5846:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c6ab46e-ca4a-492b-8a95-08de345982a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ajFXZmVMM1RXWmFLTnVPRUFNbGlqeTdzNlJCa0lUTmpjVHZKYjlGTDRMOUdV?=
 =?utf-8?B?bGZWdU1QVzdRRmZ0TWxlaEordWZIY05na0ZNdy93TTBPbW1iTFRrMDVCd243?=
 =?utf-8?B?R3BpakRPcTVjUks5VTdwWi9ZN0FBNlU2aG1NQkFRYWV6dVZ6WGRIUWhNUEdM?=
 =?utf-8?B?M2hOalh3REFKb0x6TjlVYVMwNTFla2Z5MGJ3TVVFUW1rb3hSWWQ4ME5pMXR0?=
 =?utf-8?B?N2FTYjBCclpEMEtZUm5hNGlPd1ptR201cGJNN3hpV2FYVHp2d1pXbmRHbVAx?=
 =?utf-8?B?Qlhjb3VjSjVCTG5HTXVYTmFXUEhqSVpvcVJLT2c4R0Z6cXpIRkxONXVIZU9X?=
 =?utf-8?B?cjZ5OWRMZ0hvTUhZdlBNYkZ5ZHBJVXp1RUJTa2hRcU1JWTZvNG9MSCsweVBL?=
 =?utf-8?B?TXpXbHZrLzczWXo4WDV2MjNkaEliNmNWRFVycmFyam52K2FNYmR3eTBRWUF5?=
 =?utf-8?B?Q3BHNU9LUEdGVmhiUUlXMzE5ZHRpS2JSYit3OXBkN0J0aFVjL3ZCQkc4RWF6?=
 =?utf-8?B?ZkNFWSswMFZrOGg5eEhDMHViYk4vYzVyVUljclVieWZCWVNJelZNeGVUSWtq?=
 =?utf-8?B?OGorL2ZaUVluOTV6NjdyUVBmZ1ZtY2JLZjRuQzV5cnJpblpQcGk2M3NRRmVk?=
 =?utf-8?B?K3VPRmpLWVYzYU0ydERhTWVpazZMWDRyVmhHbitFbFNoMzhNUkVJOWNURkhK?=
 =?utf-8?B?eVg1QjNJRHZYM1Y2Uis1RE5EVG9wUy9uSkVua1JMclZ6c0ZMU2pmM0RUQVlx?=
 =?utf-8?B?TDduenN6QTZqbWs5TjVyZ3IxNFJJT0xaaFdGRWRWSHRoU2hraG1xQlpzUjhu?=
 =?utf-8?B?c1JnNWRxcUdBOEdEVDFXdFZsOGtoZ1RDc1kvL0I2Vks0b2VUVHNLeUVQWlhB?=
 =?utf-8?B?VFJhLzVDaDkvMzZRdGxGQVVNS1ZHS0tvSnRJQUhaVzNzUVRvVW9sNkRzb3Qv?=
 =?utf-8?B?SGt1b0VtMkk0cWRJcFo3MXI4YWQzNElBbkNHR2xxMm5UWkJDWEJDeW85bTlC?=
 =?utf-8?B?dExCWTRjWk8vT2FJVkozNjNDbzZkeWpMRkd6UTB1dGI1VEluSVpPSkUzYWlI?=
 =?utf-8?B?TTFERWhLUm02RkM1VFVXVXkyTCtWVklwUGpZa05ncmxNN0hUMkpicWVLVGdx?=
 =?utf-8?B?aXdpR0RLd2xyNzhwNWpJTGlmQkVMR0FhWkVWeGNEZjlMTnpWNkFsYklMQkF0?=
 =?utf-8?B?RmdIUWk1UzNmVVFvVEJ3L2QrUkw0MkZsdFowNGM1bFFIS3AzeHluYXB2NnJL?=
 =?utf-8?B?L2JmSVhNc0p1UXFsZW1Wa2FZcEwvb2x3N3Q5R3FvRjlWVzhaQzIyajNZa1pS?=
 =?utf-8?B?Y1loYVl6MUV6RVdjVS9aUE5wRGVMaGVLLzNscFBRQmVlbXVrb1FZbzlZcEZU?=
 =?utf-8?B?ek5NZk44K092NHNOWEtEZ0xOZ3BGNGVwS25yWDBKdU5pbjVYdkxrQUNZQU02?=
 =?utf-8?B?bDNVc25OSS9oMkg0U3VEYWFSaUhjdnNzRVczamVZd3F6K0QyKzY3T0F1M1di?=
 =?utf-8?B?TG81eDRVNjBEVXRYS2pUeE05ckNhNmtvOTAzdUZDZ0dEcXJrOGh3VkxVWWNj?=
 =?utf-8?B?WE50UVorZmVrRzBWeWxTWHBVM1VucmhiRm5la3RjU0tYSTMvRmQ1ZElXbmRo?=
 =?utf-8?B?ZGl0R2x1TDZlV055TDRJRmhqb0w5WmdxcksvaTF4aUpoMXpjQ1lsZ0YrdWw1?=
 =?utf-8?B?RkhqMFBMdDA1RVR3UzlVa2xVSE9GN0l1SjdmZXlidXpXZlJsUncrMkVPZDVG?=
 =?utf-8?B?VXQ2eTNLenFEczhoZHVCMUhYS1l5MkoySmphTWlWaDhuSGRaK2kyc1c5ckpT?=
 =?utf-8?B?Z1daYTRRUW4xeFRsYXpjYTlkcFRqSEFnZm5neHBoMld1MCs1OW5jMjhCRU1u?=
 =?utf-8?B?ZTJLSHQ1enZFbnF5TUQ1VmU1TGlIT1JMUk4vQk9BWXp5c1I5akwrazBORDZp?=
 =?utf-8?Q?LEDRtS6qwhXxgf7TWlRcfautpql4kro6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB2667.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWtUWlR0SUgwOFRvbUU4MnhvRDJpN1FQMGVWVXhOa29JMHFRTWtmR0JzMXkx?=
 =?utf-8?B?TTRoSDVIeXhWQlEvZFFma1VYOWhTSWxNbm83d3hKa3VheTR2KzBTSFJRS3Rr?=
 =?utf-8?B?ZlZsQWZLUjN5VTIzYlFKOU1ic3ZxMzA2dnJiekpHU3RWZzZ1dGNlM25DSEtT?=
 =?utf-8?B?b2ZUOWpiTWxDRnNZVmp2TkszZVcvVjlScUxpYzhleThFSHNkcjNXVGV4S0dI?=
 =?utf-8?B?ZUMzT25QeFBmTmFDOGRGMHpYYlBDa1YzL3hjakltd3cvdDJBRVhMMGNSNHBr?=
 =?utf-8?B?WTJUc1YyYjJjcmFqc1piZExES2tic0xpV3A1VE5kVUZ5T25aUjhQUkVIYlZQ?=
 =?utf-8?B?dmFNTzZaS2dBUW5RYzcyT2JqaFR2c3luT1kzQnpaT09mRUFaU29JalFHNWMr?=
 =?utf-8?B?NWRLTmdaZDN2Ly9CNVVvNW5weTdjSms0VTVtMC9PRTBILzN4SExabzAzMlVW?=
 =?utf-8?B?MEd4UWFRZWFjR3FHQnBIMDhFTXdiUWJHR2FpV1NxVGgwMWt0cTVIWGtRaDZm?=
 =?utf-8?B?SzFXL2FOOWZFaU1EWjFuNlFWaTYzaGhyWTlmOGZDMVZPTjdlcjgxZXV4eG1H?=
 =?utf-8?B?T2FVUXRjR21BMDQvdVYwb0NOTzY2Tit1YTYrZVArQXJ1NUVUemhXeU8xTnFT?=
 =?utf-8?B?L0tjM1JraEY1SnB2ZGJjNTc2SFAzUnpaZTFsRHAwenF2RHI1b0lLUmh6NUdG?=
 =?utf-8?B?Y1R4dGNqa3pzWlgzbE5yMWV2M2xIb2lJc1N1TUlKOEIwU2I5ZFpFWkR2M1ZX?=
 =?utf-8?B?cFNMSWdJcG1Ic0JkRHgwZ08wOGREUjJVemtBVHV4Zk9EY25EUk9GMHhVeVpp?=
 =?utf-8?B?SFdvQ3pmbDZtWjdlMXc5bVJmUzdWdDZVLzVSUURHZUxhTVY1NDk4cG82VTVT?=
 =?utf-8?B?cUgxSHBEQUNMVENvK0Fnd0NrbzZGcXBQdDFqVkpDYUFiTVFWTitUT0NxTUZ2?=
 =?utf-8?B?SFZrMzJ0dDRrSW05VnBqWjVQTFpncmlyckdrZUtJci9PZVkzRnh5Zk05cjB5?=
 =?utf-8?B?aDBZNzN5czd5dUZxb0w3SkJoQ0o3Qm8zUm9DTS9TejExRHloZ3JrMi9rNTNQ?=
 =?utf-8?B?ME9JNU52cVRQQlQ0T3NacUhzMllmbFFNMGs2N3prclNBYk5vRU9ISmhJemdG?=
 =?utf-8?B?TmFQSlBKVnhleVNXS2drU3BKdWVMQlVDYnJKT01nUHNhUFRuTEQ1RUVKY0ZQ?=
 =?utf-8?B?NTdpem44TFAxZ3pyY1R5VlJYVE1vREFJeW5WdGlybWtod1FuVUtkaHFFQlA3?=
 =?utf-8?B?Q2dEQmc2dzY4T2s1TzNIQitVNmtuWS9McHgrOVdqcC81THIrRG13ckltNmpX?=
 =?utf-8?B?RVY5WGFlaE1nVlUzcmtjV0FhRTljV0trcnowNm81a3FlZzVWc3VZY2FVTlFz?=
 =?utf-8?B?T1pRMk9RSnV5Ymt0TE1EUFgrWjBPUy92RFhzbjJJenBoNzNBclYxMTBRenht?=
 =?utf-8?B?ZWxUSVJZdEZVVkQwSUltOUlQM1I3UTFIQlpNTFgxSlZtdkZub3cvNDFJUXdE?=
 =?utf-8?B?VWlla0Rtbis2aURSWDY0U0gydlNwZXR2b1AyaXd6V3NZbjYxdGlOZkFMR05O?=
 =?utf-8?B?VW5pcm5BOXMvekU3RkZJTlZVUCtMeHAxNHRFdW1xN0J0U0RBSjhsUS9veko0?=
 =?utf-8?B?N2RYeVdaejA0ZjRsd1Z1VWovNFYrVlhkcERkR2ZWVFBKM3FpMHZ1UWtMaC84?=
 =?utf-8?B?UURCQ3hmbElpcDE3N2swM21pZnhzOGVnbnlDVTBVcUZkbnY5dDd6dTRGUDd4?=
 =?utf-8?B?MWtYUHp4VlVYUU9nRHVvdHA5Q29Rb2dwMlF2SnI4MlhyS3JRUzYxc0RyL0c3?=
 =?utf-8?B?M0RuUnVBZnFFVVozNSs1SjN2MnlkRTRMR0RYNnpPeHdOeDdZeXp0ZjZZdVpa?=
 =?utf-8?B?ZS80enFKRTFWaVJoaURGRzVGSG4xVkpiTHc1RnRJVy80MzRpaTBBeitqNWpC?=
 =?utf-8?B?a1lObmlJNUZSVXVjcStKdkZCK1NQZE92Yy9xeWxFRm1NSXZtZlVnTTRvdURQ?=
 =?utf-8?B?ZmNMU1RWaEF1K0ptS0ltbHdzTStRbDdYWjVSbEF0c2dwSlljN3pXODhvdWNk?=
 =?utf-8?B?U0hhblA2TnFlcDR5cEFucG95V3MyVGx6TDZuK0lqTHdqWURvUTk5S3A1Mzl4?=
 =?utf-8?Q?8k3D478Y7MxEMZ0BjqA40Oq78?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c6ab46e-ca4a-492b-8a95-08de345982a6
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 23:53:38.3543
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dFDTmgy9MHPJOAQL5+adz6VgCpp6u8tgOIh0XQqYSjjI9vVNedbxcH7FD0EgpVFHVziB4Tfunvhkh1FLNa46+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5846
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_155443_317260_16C3B3A3 
X-CRM114-Status: GOOD (  38.15  )
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

Hi, James,

On 12/5/25 13:58, James Morse wrote:
> MPAM allows traffic in the SoC to be labeled by the OS, these labels
> are used to apply policy in caches and bandwidth regulators, and to
> monitor traffic in the SoC. The label is made up of a PARTID and PMG
> value. The x86 equivalent calls these CLOSID and RMID, but they don't
> map precisely.
> 
> MPAM has two CPU system registers that is used to hold the PARTID and PMG
> values that traffic generated at each exception level will use. These can be
> set per-task by the resctrl file system. (resctrl is the defacto interface
> for controlling this stuff).
> 
> Add a helper to switch this.
> 
> struct task_struct's separate CLOSID and RMID fields are insufficient
> to implement resctrl using MPAM, as resctrl can change the PARTID (CLOSID)
> and PMG (sort of like the RMID) separately. On x86, the rmid is an
> independent number, so a race that writes a mismatched  closid and rmid
> into hardware is benign. On arm64, the pmg bits extend the partid.
> (i.e. partid-5 has a pmg-0 that is not the same as partid-6's pmg-0).
> In this case, mismatching the values will 'dirty' a pmg value that
> resctrl believes is clean, and is not tracking with its 'limbo' code.
> 
> To avoid this, the partid and pmg are always read and written as a pair.
> Instead of making struct task_struct's closid and rmid fields an
> endian-unsafe union, add the value to struct thread_info and always use
> READ_ONCE()/WRITE_ONCE() when accessing this field.
> 
> Resctrl allows a per-cpu 'default' value to be set, this overrides the
> values when scheduling a task in the default control-group, which has
> PARTID 0. The way 'code data prioritisation' gets emulated means the
> register value for the default group needs to be a variable.
> 
> The current system register value is kept in a per-cpu variable to
> avoid writing to the system register if the value isn't going to change.
> Writes to this register may reset the hardware state for regulating
> bandwidth.
> 
> Finally, there is no reason to context switch these registers unless
> there is a driver changing the values in struct task_struct. Hide
> the whole thing behind a static key. This also allows the driver to
> disable MPAM in response to errors reported by hardware. Move the
> existing static key to belong to the arch code, as in the future
> the MPAM driver may become a loadable module.
> 
> All this should depend on whether there is an MPAM driver, hide
> it behind CONFIG_MPAM.
> 
> CC: Amit Singh Tomar <amitsinght@marvell.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> ---
>   arch/arm64/Kconfig                   |  2 +
>   arch/arm64/include/asm/mpam.h        | 74 ++++++++++++++++++++++++++++
>   arch/arm64/include/asm/thread_info.h |  3 ++
>   arch/arm64/kernel/Makefile           |  1 +
>   arch/arm64/kernel/mpam.c             | 13 +++++
>   arch/arm64/kernel/process.c          |  7 +++
>   drivers/resctrl/mpam_devices.c       |  2 -
>   drivers/resctrl/mpam_internal.h      |  2 +
>   8 files changed, 102 insertions(+), 2 deletions(-)
>   create mode 100644 arch/arm64/include/asm/mpam.h
>   create mode 100644 arch/arm64/kernel/mpam.c
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 004d58cfbff8..558baa9e7c08 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -2048,6 +2048,8 @@ config ARM64_MPAM
>   
>   	  MPAM is exposed to user-space via the resctrl pseudo filesystem.
>   
> +	  This option enables the extra context switch code.
> +
>   endmenu # "ARMv8.4 architectural features"
>   
>   menu "ARMv8.5 architectural features"
> diff --git a/arch/arm64/include/asm/mpam.h b/arch/arm64/include/asm/mpam.h
> new file mode 100644
> index 000000000000..86a55176f884
> --- /dev/null
> +++ b/arch/arm64/include/asm/mpam.h
> @@ -0,0 +1,74 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/* Copyright (C) 2025 Arm Ltd. */
> +
> +#ifndef __ASM__MPAM_H
> +#define __ASM__MPAM_H
> +
> +#include <linux/bitops.h>
> +#include <linux/init.h>
> +#include <linux/jump_label.h>
> +#include <linux/percpu.h>
> +#include <linux/sched.h>
> +
> +#include <asm/cpucaps.h>
> +#include <asm/cpufeature.h>
> +#include <asm/sysreg.h>
> +
> +DECLARE_STATIC_KEY_FALSE(mpam_enabled);
> +DECLARE_PER_CPU(u64, arm64_mpam_default);
> +DECLARE_PER_CPU(u64, arm64_mpam_current);
> +
> +/*
> + * The value of the MPAM0_EL1 sysreg when a task is in resctrl's default group.
> + * This is used by the context switch code to use the resctrl CPU property
> + * instead. The value is modified when CDP is enabled/disabled by mounting
> + * the resctrl filesystem.
> + */
> +extern u64 arm64_mpam_global_default;
> +
> +/*
> + * The resctrl filesystem writes to the partid/pmg values for threads and CPUs,
> + * which may race with reads in __mpam_sched_in(). Ensure only one of the old
> + * or new values are used. Particular care should be taken with the pmg field
> + * as __mpam_sched_in() may read a partid and pmg that don't match, causing
> + * this value to be stored with cache allocations, despite being considered
> + * 'free' by resctrl.
> + *
> + * A value in struct thread_info is used instead of struct task_struct as the
> + * cpu's u64 register format is used, but struct task_struct has two u32'.
> + */
> +static inline u64 mpam_get_regval(struct task_struct *tsk)
> +{
> +#ifdef CONFIG_ARM64_MPAM
> +	return READ_ONCE(task_thread_info(tsk)->mpam_partid_pmg);
> +#else
> +	return 0;
> +#endif
> +}
> +
> +static inline void mpam_thread_switch(struct task_struct *tsk)
> +{
> +	u64 oldregval;
> +	int cpu = smp_processor_id();
> +	u64 regval = mpam_get_regval(tsk);
> +
> +	if (!IS_ENABLED(CONFIG_ARM64_MPAM) ||
> +	    !static_branch_likely(&mpam_enabled))
> +		return;
> +
> +	if (regval == READ_ONCE(arm64_mpam_global_default))
Why is this check needed? We need to read arm64_mpam_default in any 
case, right?> +		regval = READ_ONCE(per_cpu(arm64_mpam_default, cpu));
> +
> +	oldregval = READ_ONCE(per_cpu(arm64_mpam_current, cpu));
> +	if (oldregval == regval)
> +		return;
> +
> +	write_sysreg_s(regval, SYS_MPAM1_EL1);
> +	isb();
> +
> +	/* Synchronising the EL0 write is left until the ERET to EL0 */
> +	write_sysreg_s(regval, SYS_MPAM0_EL1);
> +
> +	WRITE_ONCE(per_cpu(arm64_mpam_current, cpu), regval);
> +}
> +#endif /* __ASM__MPAM_H */

[SNIP]
Thanks.

-Fenghua


