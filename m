Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF01CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Oct 2025 21:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lKSHGS57h5QMYQrbbvJNlsAmOl9zd72iqB/F09y743Y=; b=uxHZpk687mzcNzwQQeGj5QhHB6
	blGDpziSCtBxE3ohMlDXK8Deaot1VcIowvyKMrPWoaWjhsrndh+aidpwZmaq/gr9IYZdDeJNXPSVs
	FRun6wqKmAIFda3cCBhn/ZYG016dhhN+ZN+8DkhrUpC6zCpAUbXT5u8hkVuZN3lTfSDDT+LB+0aQk
	HO56dKXmK52eabRlxq0GhVESOIVpSSAs7JGtKw+p2jVY/trt+FuOKwgSPbpDAe1hTyD4FPmfiWLBb
	Etyma/aTtitHXJI8DdkV69JbuLTmeH3Aq8rvTkBwVklXM6XLh6DCLEQwvCLfIi27bhrVxFyDmPsfO
	qeFIS1aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5Vyp-0000000Ge2V-10Wo;
	Sun, 05 Oct 2025 21:09:19 +0000
Received: from mail-eastus2azlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c110::1] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5Vym-0000000Ge2A-3013
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Oct 2025 21:09:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KLr7dSOPUEARGaLyyF58ctWWv6srclVRoBz7zcJYbmyb+XdBcoxwYoGxm2QJGNinTuZJCWSbj0k6pUkQ8c/iTM9CbdP9GkO9FN3brGrzyGRenndDH5pvUrobXPmXfSjtjo0sQuxXX9PwXjwWVZB8f29BzoZBUOVD4jMbJ5EoiymL/hHYl06VzrJQsjW4Wc7KYTBMuPIN4TfGjLc3led7KKqOmtZNgLmeQCS4Bs1eEsLAxwZURdRivk891+Q2fCsyEs+FczcgXvS4LAscVi45g8KYk9ViOFkbe7WCO3fugTS1Wbi7fQxEwITceAu7kqgYDNOD3oLrRgI3p/dbqu62Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lKSHGS57h5QMYQrbbvJNlsAmOl9zd72iqB/F09y743Y=;
 b=SztrPO6lwcmaV4rss19QXButDdZEVCgcZ/Ump6MzpNHTPkMv+RGq83hZLjsEJKnipynlVsLgZfVHJlGygNzRXgrUFCYfI1LYYlZRtfEEMdqoNNa5q45T/qMZaSeIQ4fSvZaVFUcRYiy9Gqs1oCSUxRcnmGvO3iEDTj7zO3RK2VDkM0C0e4jOHA/ExESTzv0UR3o1LSonYCtc6eXL0i3t0qJ6fzItU4TJGTwsmCfMtfDQ04oKZZjgloGbwZCJ7foQIFobaX3uOonbFFXgRyPNQT7eWk840B2iES36zynSPqZI1pTI8bbwQm2rUtbnfvJ39rdDivwW0iktxzGzlzIVyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lKSHGS57h5QMYQrbbvJNlsAmOl9zd72iqB/F09y743Y=;
 b=B57gKo7XSBXH1FkNID7CyHXg8wasmIgsL5j4l7njAb/ELRJvfNpjNlNZSBQjWQIeE78TbmakjNLff7GrIcw8QU6/dACSPabX1ArKXv/7P29C8zdQ2XEIZwgjK+hBOnaal9Glv45R0zYMOgJ1aNFPUWyFLuhKBh7RKkQKZB3YVhoJ5dmTxRHV1Kgi73yytzN5kCO8F12Bzf/Ip5oLuRWfyHMKjdnkfEoxbkd0FxpePq3oPc9hRKdHZFsPB3/S6tVgxapDXVO0FBXLmsqRNvbL/HPdpvb3EIq+srtGAuiN8zLhuONnhxXppmFnKA9jgDqans8VKIZN/04PUznoFTH7NA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB2667.namprd12.prod.outlook.com (2603:10b6:5:42::28) by
 CH2PR12MB4245.namprd12.prod.outlook.com (2603:10b6:610:af::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.20; Sun, 5 Oct 2025 21:09:02 +0000
Received: from DM6PR12MB2667.namprd12.prod.outlook.com
 ([fe80::bd88:b883:813d:54a2]) by DM6PR12MB2667.namprd12.prod.outlook.com
 ([fe80::bd88:b883:813d:54a2%6]) with mapi id 15.20.9182.017; Sun, 5 Oct 2025
 21:09:02 +0000
Message-ID: <46bfa3cb-3f8a-4780-bf69-c6fedd673649@nvidia.com>
Date: Sun, 5 Oct 2025 14:08:59 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/29] arm_mpam: Add a helper to touch an MSC from any
 CPU
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
 Danilo Krummrich <dakr@kernel.org>, Ben Horgan <ben.horgan@arm.com>
References: <20250910204309.20751-1-james.morse@arm.com>
 <20250910204309.20751-17-james.morse@arm.com>
Content-Language: en-US
From: Fenghua Yu <fenghuay@nvidia.com>
In-Reply-To: <20250910204309.20751-17-james.morse@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0260.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::25) To DM6PR12MB2667.namprd12.prod.outlook.com
 (2603:10b6:5:42::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB2667:EE_|CH2PR12MB4245:EE_
X-MS-Office365-Filtering-Correlation-Id: c9338445-fbeb-4d43-e79c-08de045368d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NGdHbVh4a3FXUitDYThjZWdDb0c2QWVGejN5b1U4OWtCUTB0WkJldTJyaUZE?=
 =?utf-8?B?WklRUytkTHkxeTBJcjQ0ZXBDNHpqSy8raVlhcUQ1ZjVoNlQ0RC80c0h0ZXBC?=
 =?utf-8?B?Y2JiMThJOWxlWU1uNzBPQ2J2VGU2aFI3SGlObjhDdjEwdXNvczA1aU5nN2Nw?=
 =?utf-8?B?NUsxSDlCVnZxUUQzUVpmWEh1WEUzQVllUDR5L1ZCTU5NYWtUU0VuMXExcGt2?=
 =?utf-8?B?b0pHeGl2N3d5T0UwNVhqV1lNVTZncmZ6bS8vQ3RHSWJqSlFSNndyM0tkYndI?=
 =?utf-8?B?SUxqKzduYTN1RGhWcnN1bXBLSWtjcEhVQjNKNmNFazdNR2svc0tDRGRnTlJW?=
 =?utf-8?B?MFczakdWSTVwL1N3NGZvTFpmNnBNN0FwSkZZQWwyV2NGNUE0NTg3TlBQZGxE?=
 =?utf-8?B?blNWb1RWL0ZvSDFQSjF5V25jbktabnZVY2ZHeFdQSjhHTDVKaXhRc1BUSy9V?=
 =?utf-8?B?WnVEeFhZSER5ZXhWMWpXOHV5TWxwdUwrMnhSOFVaN1ljN2FLZ2o0NE51QmZ4?=
 =?utf-8?B?Q2NncE8xRzh6N0s4TFZQbmQ1bThNdEZkOFVnOGhidFd5ekRRRWYrWDQ0NEdS?=
 =?utf-8?B?Y3M2ZG4wQkV2Uy9xWkFaWDBUeFJ1dnA3RkVPVWQwNS9nVFl0eVRjd3lZVlZ1?=
 =?utf-8?B?L0lrSkRHeitkSFRhbG1zTnBlWTQ4TWlHL3lyMW0zTGhBTG03VDcyUFZpQ0pu?=
 =?utf-8?B?QjNxT2Z2M0d6cXFEVVhKYXVRTlVzZVhqUVF4NTM1TDBLSlhnSW5od0hEU3dD?=
 =?utf-8?B?aWV6U1dUSy9TZVdBcHhIUW10cGpzOTJRSTA1bkVPaUFIZ2NDNzdWQ1kzRHZE?=
 =?utf-8?B?TklDWXlwc2NBakVRS0lKY0Y4UmtPRUkyeHdrUi95R01FYzJTdUVlbUtJRDh0?=
 =?utf-8?B?L3FWYlBORndYeDZIbmtaSXJYU3RJVjZKZGlEL2hiNGp5NmUrQURkYmZHLzYv?=
 =?utf-8?B?eDkydlAzVS9IVFhPcGtZa3FId1FRbXU5QWpDa2dqVGhRU2VRZ1ljYzZHdXpk?=
 =?utf-8?B?SkZTbzRGMFlBZ0l1RVlMdWowbmR5OUFSZ1J1Tk9KRnhnYWdMcjU5Y2FIK2Ra?=
 =?utf-8?B?bTZiV2Q5K0diWjd2YzhTbnV4aERMa0J3V1drL3dVNGtHeHBXWWVGa29WYlpF?=
 =?utf-8?B?RTN6SkdQNjlIN1hEQW1sM1dQODVHc0hqSG9lYThFZWpKdHJOS1RzK2Nvcy8y?=
 =?utf-8?B?Q3pOYUo3TStCT0tZOE5UL21vYzBDbUtaRXBPUitWVHRCZFZITE40aHBWT3p0?=
 =?utf-8?B?ZWJTdUwyMXQ1ck1zUFhDbnhkdGIzUkRiaFpYZU5FWVQyWVFwc1pnRlQyTUZV?=
 =?utf-8?B?VUwwUWNzRVEzS0NsSW5XM3FCdEZQRGVCSmkvV0U0WFk0ZC9yczNPUUE5RFY4?=
 =?utf-8?B?bDRKaTZsYzJHUXkyWVVNWFNmMW9wRVcvbFdyZnl1QjROdmRpanJSYzNqMVZH?=
 =?utf-8?B?UE94TXU0MW52K3d0U0hYZUVQc096UVZEQ3k5N3JmZENiTmFNVmZLeGI3Tk1l?=
 =?utf-8?B?ai80ekRHVllJNjdCNktVM2l0SDR3OXVmeEJFQURzRmdZWXFZRXlGU3hrWnhG?=
 =?utf-8?B?K2JLR1d0b1l6bGNwRjBMZUFBMk5xbklZYSs4SUJTRVVkejdaVnlmYkxTUFZj?=
 =?utf-8?B?dzlvcWlOMjMyZDQvU3J5dVVTbkdIRWE3aHhjcXBXR0JiWkJWZ1B2L1FCVkJE?=
 =?utf-8?B?OW9rcEhSMDNMa2Y2YlhNV2tBOS9nWU5ML3djRnkyV0ttWFlkVllIdE8zZUVk?=
 =?utf-8?B?cFJVY3didVN3bTZqZERSclE5KzEybERtZ3Jtc0hLRkg5ekxtK2lNWUYvUisz?=
 =?utf-8?B?ZmRqVnVPN05HWlg0cThOVWp0UURFN29aZ1FzUlNzSWMrbktRcnZheTNKdWxn?=
 =?utf-8?B?aUkrMUdsQXMxaVFyS2VhYTlQSUFTeDJSYStvK0pxc0wzOGJSa2xubW0yYlJh?=
 =?utf-8?Q?6rK7fUTdKZbPZiNPwOmKhmbkiYNQRC75?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB2667.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K29SS2VxWjVLVjdTcE9TaDJ4eHd6aW1EZXdoRkZDb0VJOStzRk93d2wrclI0?=
 =?utf-8?B?Q2RTQWUzZVZyc2pGUWZyMkFkVSswOCtKd1doZnpzQ2VqbkljWS8wWFdXOGd1?=
 =?utf-8?B?Y1NZUEowMVdHSFJoRyt5dVMxdWNMSktBS0J0TmR6NHpvOEFvVXA5ZE9ZWXdH?=
 =?utf-8?B?N2lVeVZWUlhoRW81MVhBS1ZuZFcrankvZGJ0MG5kUGk0aGg4WkRQS3ZWRDhW?=
 =?utf-8?B?Q1Rib2ZHOWtHTW9oK3VHcnNrRnhNbkU4elFnL1RCT1ArdVFmRHFlRE1XZUVM?=
 =?utf-8?B?L1poS3dRaTBENUFkNXFRYzVOdVducEU5aFEyU0ZVVjFzK3dmR0toRU9wR2Zn?=
 =?utf-8?B?dGg2SFR6UGtkRUVRWXd6UXpNMFI2dWxOQWticXlHVXhiVlNJVmpRbFl3MDhQ?=
 =?utf-8?B?V0J0ek1oYlRzVVcyUmtzSmlBdUN5NUdtd3VISFo4UTJMU1BWeTg1VUpxOW1T?=
 =?utf-8?B?TVZUQkZIWUx2Ym95azZwNkIyK2o5emxkclE0VTRmdFFjRXVqU0JwTE9ZUW5v?=
 =?utf-8?B?a3l3eC9wdlozUVM2Vjh0dG5aNFBwb2w1Y3hKVTZvOXpCenFSS3pBOTNtdTll?=
 =?utf-8?B?ZE5PQXFEYlBvb0FraWNWTkFzSWNkZEE1MDJ6VTJkYys4TFluaUNMa09YZzZM?=
 =?utf-8?B?V0EzODgrTi9ZR2ZaZ0lSYmY0WGVUQVV0Q05heFJEWTZaV243dWMwWERvMFI1?=
 =?utf-8?B?a050ckdtRS9FSUhtK3RvRjZiSElWUmx4Z0xINDBoQnI2VDRkL2VLUitzb0pz?=
 =?utf-8?B?OUhjbFlFL2k1dXBZS0YzRXRON20zMzlhWnFtSWtid1hzaUdpajhIOGRUR3VW?=
 =?utf-8?B?RmNYL3Q1ODlUOXlndDJvRENSdk43MGZYcXoxOW90QWtVV0tBVTBRakRwMVVz?=
 =?utf-8?B?S0hiL0FGWGl2eU95QlB3dEJRNG9QS2NkZ0txbUdTR0R6dzFHbWJidytkN2Iy?=
 =?utf-8?B?R04wZFdYTmFleHZlZ21uNGlMaGEvTGFkK0F1Z1ZRdEdIaVF4bDg5ZE5ORWNU?=
 =?utf-8?B?ZlFsTUVpT0ZZSmdndTVua1hXV0VrK2FIZUp1S0kwVTN4aVFMME5qMjlFaE15?=
 =?utf-8?B?K2RYbHROTDkrSmVpbHhkNHlaamxuOXh2TUgzc2w3S1RGSnBhNWt6S1ZwU1Ir?=
 =?utf-8?B?K0pnL3hEN2Y0U3dxVjNGeDNyRjFXUEVDazEvYmhlTGJML2QxSW9NYWhnSVha?=
 =?utf-8?B?dVJBd0hOOHNnY29XV1MrNWZEdm8wOG4rdE1mT1h1bmRzYkFaeVRXR05PRjlW?=
 =?utf-8?B?dHZJZG9BVDdmTm1tN3RrSUg0SlRXR2p3VE43OVpPdUlETS9nYU16TEYxdXBq?=
 =?utf-8?B?KzJqbGxUaHpLcDFOTFgra0JRNS95R3RubmZXeGVvdVBBNHVad0xGVlZldG5k?=
 =?utf-8?B?QUxlR1JwckE0cmNPbjRPWXczZHVoUjZ5ZURsbWNXVXE1UXUxYk5aRFRuOGQw?=
 =?utf-8?B?bEs2MEc4L0k1cFRqeTVJa1hjRmlCUXdHOW5NdXV1L1Yram15eHN2cytGN2E3?=
 =?utf-8?B?N0tQZVpBVjVvVkxhdDF4TGtwOWdVUXhvZHBZL3pac20vTnJxbXZiNGFmcXN0?=
 =?utf-8?B?MjFCdXJWVExDNDliWXNlSUszOFZqeTFLR09iRHE5YjFJN3BGa2p6MzdWbzZz?=
 =?utf-8?B?Uis5Q3cvMy9STUppQTBSSDE0YWRSR2dUYUl5YllxeU4ralNJWXAwR2NOVTdW?=
 =?utf-8?B?a3k5ZzlsWmVFSkxrMXZDVTZONW5wUXVUZHJpZnRCdlZhTVdYQ3lZMWU0TGR6?=
 =?utf-8?B?OFpScnhHbTJDYW9sOTQ1WndBb1cxRWhlWGRTYzJEZnhnalppOFNnalBPODlm?=
 =?utf-8?B?UVRkcUtFdzF6VmRiUUJJa3Nmakdsa3VCaHYraFlJUHluM1FTeUFyUjhDSnJ0?=
 =?utf-8?B?YmNRTDhnaUZUNzFsZjAwZnVRNmlCdGozMzd4dndwQ3IzQTJtL2FoNEJoTDhU?=
 =?utf-8?B?TnZCaXFBeWdLNlF0b3N0aHh0Wk5CVFlQTUVlRGUvNmFmL2VXMzFkb3VNU1Mr?=
 =?utf-8?B?ZXlKUHNDbUIrM2xIRThmLzNjY3RyYVdoTmJBRHBRRTJlZzgrT05yM0lKSGV4?=
 =?utf-8?B?NmtKaEZjRWpGSFVuNGFuL3FzaFFLczVQODA4SGkxV3JqQk8rZzBaWlNIcWcw?=
 =?utf-8?Q?chmR+C5X+MnUWwbZcvOk9HwEN?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9338445-fbeb-4d43-e79c-08de045368d9
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2025 21:09:02.7496
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: va3YWa7en1/swHlI5UkUVUvdd5skXXc5j+Kf+HfCBd7bZmiCfiOYnE0iyEnyAjPg3plELQgwOwzv00qauQJkJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4245
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251005_140916_772615_62954CFA 
X-CRM114-Status: UNSURE (   9.71  )
X-CRM114-Notice: Please train this message.
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
> Resetting RIS entries from the cpuhp callback is easy as the
> callback occurs on the correct CPU. This won't be true for any other
> caller that wants to reset or configure an MSC.
>
> Add a helper that schedules the provided function if necessary.
>
> Callers should take the cpuhp lock to prevent the cpuhp callbacks from
> changing the MSC state.
>
> Signed-off-by: James Morse <james.morse@arm.com>
> Reviewed-by: Ben Horgan <ben.horgan@arm.com>

Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>

Thanks.

-Fenghua

[SNIP]

