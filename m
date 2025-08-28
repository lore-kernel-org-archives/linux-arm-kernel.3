Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B938DCA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 19:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7spOg3nN7+wjYOn3viJ/P9wE+2Wlkux1gxXAc7q7RXw=; b=oBSRPaSvB07JT++FnTmW26OMWc
	D7KDJ0kxLgUw0bDg8BmCNc3Nw3pAsR1osa6ElktJG0CnLK6SnLj2haz5iPgR9fQmNVecKYFm09BRb
	SGZKQhYgQWXR9Z7QyaFGcF3oxk9Y5h/XQ0XU1U4jJJy/EBlLunFuMGb/MhHnSl1ThaQXGnRBf41tT
	R7GhCuy/t7tyrumTtM+gV3iLxcJbrPS8u3xAoIrIF0cqwbxgYyhTvytMsfnnTDYosfU1p0hL/tEsH
	XVkXnQmkUsoIcRKbsGoDfp4o7YuEznaxKh491+pG/yW5kJVtxOcvmPIU0/k8Dy7eQVxoimMw0cLeU
	XP9WXZZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uriKN-000000032DG-3ioH;
	Thu, 28 Aug 2025 19:30:31 +0000
Received: from mail-dm3nam02on2061e.outbound.protection.outlook.com ([2a01:111:f403:2405::61e] helo=NAM02-DM3-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urg5s-00000002MlJ-1KwJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 17:07:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zI/Yp7+vZgEtsEwbHE34aoIH4pX9BWIltHrZbY0ZvQXVNdaSSxL7jP7rsgkkE1ZhsDnoyis/9FqxgZCLdeghUtKhfImvG1NNBnBWufvvaD2AyJ1NGt4lU880YXMmBfBLd43ok2AMvghX6LWw+F38mSJ3Aeh0jfkCUDrxFxJb2nNRFF2uCfxlZbG+n+rlzzVtzTuVzeb1Jj3GiVPwkw/Oa6gSutFAZb9FZCU3mGNN1UHpe5Oqsceg4jY7EuyqJ6ghyvmhvoiNpCGFRrU2y/RX2ZJknlnK0baytMyVgyT3unEATyCQb3twWXxdyuDHVE8BFoUout+e6dheI9rGats+0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7spOg3nN7+wjYOn3viJ/P9wE+2Wlkux1gxXAc7q7RXw=;
 b=qQpsA+yeF6luwRz65JLWqcOsf+GUGgwH1bpiIMPd7TN4UegB4S+J+CptoJolKD+kFUfpnqWReSrn+xjh6vt5ObuJvsQ9oGWqJgVrY6cgKqGhrX5lFIVzFLSyBeJl/4dRQr8k90QcRZYDDRY7qS5lY3s7F949B3hCxuCCPpQBNrYimjp587cKGZtfiQYKw6kf9Sl2cdOkNU6C+3kkIppy7DfO5ljIRdNrgPZOZ9ZczPpDG3YuDgEr/V7c42JfsFBqYg+36tCodAh4wadjcp7vKAcHTHSECXGVN4ozN7+oN+5WQWVW7ngw/CQEohjOxrlGpum62WiB1tQH6G6v46pkRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7spOg3nN7+wjYOn3viJ/P9wE+2Wlkux1gxXAc7q7RXw=;
 b=lgqxhhOCDh8G3+TSA9a9eBTZDgvXnubuu9trvwVqe/1qV2rkLtn7jh65dv/spajZo7k7EzO+2jKqUO/tt6uPmhoKcmR3rua3OWGhS0So+BOmIMQ62mi+pBiJgefKzorsBIrkISPiJtbYvy0iWTJ1lblbCOrLJNISk57+AUKcyudnYW2duPh4rNpNbiqjzkJywVbCJZJtF8k2Kf4WaiKS8dcq5RFGKJopJLqg/nGnIAVS41P5mA3BJwavRhn/PeC9xsGsc03dU88HSxDAvXVKgtoIFgIJcDfmQ9HB5M62bLA67BMe/3Z3ktD+gXzMTivM6N+UL9i2hxCc0U2mDbMYkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB2667.namprd12.prod.outlook.com (2603:10b6:5:42::28) by
 SA5PPF5D41D38AD.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8cb) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.17; Thu, 28 Aug
 2025 17:07:07 +0000
Received: from DM6PR12MB2667.namprd12.prod.outlook.com
 ([fe80::bd88:b883:813d:54a2]) by DM6PR12MB2667.namprd12.prod.outlook.com
 ([fe80::bd88:b883:813d:54a2%3]) with mapi id 15.20.8989.017; Thu, 28 Aug 2025
 17:07:07 +0000
Message-ID: <4c8da7b3-6235-4d0a-aeb1-81c8bdfd051a@nvidia.com>
Date: Thu, 28 Aug 2025 10:07:03 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/33] arm_mpam: Add helpers for managing the locking
 around the mon_sel registers
To: James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: shameerali.kolothum.thodi@huawei.com,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, baisheng.gao@unisoc.com,
 Jonathan Cameron <jonathan.cameron@huawei.com>, Rob Herring
 <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
 Rafael Wysocki <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>
References: <20250822153048.2287-1-james.morse@arm.com>
 <20250822153048.2287-17-james.morse@arm.com>
Content-Language: en-US
From: Fenghua Yu <fenghuay@nvidia.com>
In-Reply-To: <20250822153048.2287-17-james.morse@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0081.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::26) To DM6PR12MB2667.namprd12.prod.outlook.com
 (2603:10b6:5:42::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB2667:EE_|SA5PPF5D41D38AD:EE_
X-MS-Office365-Filtering-Correlation-Id: 5aaf59d8-6831-4275-cbde-08dde6555143
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VW9iaXpqUm94WmtDeXBCQlUrM3Q4bWRhOXJNQS95dUZLTG5iTkRpUlEzNnYy?=
 =?utf-8?B?cFNnMGJjOFZFdllYbTlmQkhnV213ZFpZNk9pcUJHWmdUamxvN1E5MUkzL2l2?=
 =?utf-8?B?VnhtSFBpU0lBcHBPTUdaODVGRXBPQU9Wa0xlVXNlekM2NTR3T2hhYVlTNjdX?=
 =?utf-8?B?bXExU0UvbnJkUzJRYlQ4U2ZucHNKb3dnZGF1dzdvRGJyWGNOdEtEN1dmNzN5?=
 =?utf-8?B?VkoxOGx2QmNkUzNmZVQ0TFRHSXd0ZE1odFBLVTdqWXoxR1FYUGJsM2ZnZDgz?=
 =?utf-8?B?dmowYkoxMjBteWJlQjRwdTlUV3N0RHphNlVSYlFDeXR5WHlHVzRLU0ZRR3hY?=
 =?utf-8?B?L2RGV0VKWEpNSXBDbk1LYjBzSit2ald4VFNaMEM1eGw4VFEwQWFlUndzeXdo?=
 =?utf-8?B?TStRSTl2dlRBVFJucUIrMWc5SXRkd0dOK0FSUkdYNW5kRkRpVFNsZHlCeEtt?=
 =?utf-8?B?clB0dm5SMVlWeEtPWm05MGovQURXTnJsd3liQ3JDTVRvbjFCRHFmcXVQTzRz?=
 =?utf-8?B?SHZxakpSK0tEdUUxZXkxanNkTXdUTHZmaE9LcDBqUjE0NStnQm5IYVdjTnp2?=
 =?utf-8?B?VjVnNXE0UGVJTWxSR2NXYitzTmtaZEFsbngyOGI3alQwWkFRSDRnbHdQbVEz?=
 =?utf-8?B?aEF2UGQ3NXV5U2ZwZXBNUWptT2g4UW1NZEtqUnNPMUU4N2FTeW5pa2NDZVh4?=
 =?utf-8?B?SHh3RXRIblZObWxwTENrMU9BSGhZRWc3QWxGdkxqbURCa0Z0aHVWSVZ5aFBN?=
 =?utf-8?B?Qk5CM0hEV1F6bDFORkwzWW5Oek43UHo1MDNjTDI1UE9WR1BZNFVKeXA5NWF6?=
 =?utf-8?B?WUk4NjRSd005Qlo4aHVEUmdYb1ZXekhGOXFpSkJvVU56NUFKYnAyejZOVk5O?=
 =?utf-8?B?d0RESUVQVC93OWRyc3hqY3h1NDd3bmYrZDRyNDBuQnprN25zdlBTQmVwMktk?=
 =?utf-8?B?TlVOclpyVlFLV21ydlZVUm40WDUxNmlPTElmdG1Id01Ya3FRR00rTWV6Z2lC?=
 =?utf-8?B?UmEyRHBXQ3BFWlVPYXdSTmhsSHVHbXRvdU93WkkwS01ZVGsreDVRTER3L1cy?=
 =?utf-8?B?UDU1UDRwb1VPTC9IcEFpeEJUZDdWUGM1RDVNZmRDd1Fzam11VlY1QlZnWTRK?=
 =?utf-8?B?RzFiL1pEM3dEMXZhU3MyT1BtNkpGQmJMWUZLRXlhemF1eUU2WHFoWmFINW5a?=
 =?utf-8?B?VklIUzFncmdWTWlSNGYwNVk5cklqUzYvZUY4ajNPNldZWWcxRlBCMWRxR2pS?=
 =?utf-8?B?ZVBqL3Myb29PbDhpaGI1Z1Zydzk1ZVJWc3JwbGZGVkpsM2lNR082OWdweVpG?=
 =?utf-8?B?NHRraUtnUFhmczMweFI4UEpaeHRjTnFFeldDV01Wa0o5bGtHNmR1TFkycS9R?=
 =?utf-8?B?QmZVTVZMazUxVmtSbUFqNWpLNmtTNldyYUN3K3J5TFNlNGZ1ZElVajZsVmFI?=
 =?utf-8?B?NDNhOG10cEwydkVOeHpCaTV0Rnd1Qmd2MFlwOFU3Q3M4S0h0Wm1hUy9wTVFr?=
 =?utf-8?B?dmZ0bFU0TU9NUHVmZDJYVVlBKzVPNnFDYTUyOFpNZ0NnS1lFODFUVDVWMHVq?=
 =?utf-8?B?Zk9uUmo0bWtzd3RBMXdBSVI2TzFpU3I2b3BEYUdXUkFyeVFwaG5mQWlEaExm?=
 =?utf-8?B?eEpsTUJvSVVVY25LN3JPbVM4ck1lTkFUWlNJL0VUUlQ5VnZYVzBMM3NmY0FJ?=
 =?utf-8?B?N3djZFV5Yy9QbkN4N0xRUzdTWCsrSTE4Wk4vb1hncGVyK3VlT210VWp1SnF1?=
 =?utf-8?B?QnY4a1V3MmR2UWVveDJTSUJRQmd3RFFZcUxsTWtiMFhvQ213emczcVhMSUZs?=
 =?utf-8?B?dVdpVk1zNEdxT0pMSTNNczdyaWk1SmZsTS9tMlQvZEV1eG9BazFvNW5hV0Nj?=
 =?utf-8?B?OHVvem1ZTko1YldzdDl4LzYvcmRkZXFscnpYYlo0cmZMd1E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB2667.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmp5bld0RlprZkNWei9WQmdqNTZuWVZPTjBFOGhVdjdBdTkvVjgzSkhjd1pt?=
 =?utf-8?B?VkJHS1BGeWNkV0U3VGJzOENaZklWNUpTNG0ydDJwUFFWV0NVZjgzWlhEYVZy?=
 =?utf-8?B?SUVmV2p6TTdpTTFqcHJBN2RaOHlGU3FMYjZEVUhpWTc5ZHVUaDhWU3Y4bEJ0?=
 =?utf-8?B?SGhkQjhEQXR3aEtPZ0lhM0plTStPNk9aVWxIRWZUMCszUnBDTDBXeW1ENmQv?=
 =?utf-8?B?cXIxY0VDOGVkdjFyV2paSHVBTlFIR1A3UHFCbXkvUEdNMi95WVhkam9uc0Nz?=
 =?utf-8?B?OGlzZHdybE5OTkZMVVEzVyttdkFUMnlDamZHUmRoSEp5THRoZWJLK2lrcTQ5?=
 =?utf-8?B?SzZienpwRXFXUzA0VVNrQ1Q4UGc0VVYwd1RZaXFCN0E4eXZkUnF1UEJKejdJ?=
 =?utf-8?B?MnNxS1hJaGtyc1hoYUExU0tqcSt1WkNKcXVxbTJJSmFmcVBOVVVKMmRzV09h?=
 =?utf-8?B?K2F1cWc1UGtuWWVhZko0b21GcmhWS01kMGtpRjlueENKTG1JTHpTQXFyQ2w0?=
 =?utf-8?B?cUx1ZmNZTGloM3U4Z2tobUhvcCs5dEYwZ0QzUTNwMFg4bXJBejA4MlgwSTMv?=
 =?utf-8?B?eG1qU0pTMWF1SGRXcEpHWlUwdjcxcGJnNHhiS2VWRU44UWpKZm1uV3RqMWx4?=
 =?utf-8?B?S1JHbW81d3N4UmIyWVNRRTBWUHNSNVFPdHJmVVBkWWFXZmdhd05EV1ZjZDNh?=
 =?utf-8?B?SDU2NGxGWGZjTkUzcVhSWEVKNjVvN09YUmRlODNPajRCcXlDOXZlOGtRU0Jk?=
 =?utf-8?B?U2NBQ2pWWnhNRm9ibTJvYnlnYU15VFUvYUl1Y2tjSXhhTDZSYWJSZTFxdFkz?=
 =?utf-8?B?UlJTUmVtRlBLb3BhY1gwNnNub2psOThrNlE5SVVLd1B5YUJBa0dlK3VIL1VV?=
 =?utf-8?B?eFBlZVNyNVo1YzNneVp1U1FPWjFtMUlFMEpKbyt1QUtvZGNxVUFSdGxxWnY0?=
 =?utf-8?B?UnArLzBlM2g5NmczSjB1L053QUtET2VGQnp6MEQ1VWphWU90ZW1HQWl5Z29F?=
 =?utf-8?B?TDJ4cU44aHhjTTQ4V2N3MUV5aUpmdHhNNVFqYk9VK2hlRW5hNmllME9RS2Q5?=
 =?utf-8?B?UmcyYnFLN3ZLb2Rqb21nN05KenZpbytYVnF6MkJZV2h3ZlhpVnEzcGkxNFRL?=
 =?utf-8?B?YjdacElML0dBdFN6dUJiVWdEdDAvRUVQSllnY0N5ZVhLWlJ6emsraGJIbC9x?=
 =?utf-8?B?RnNzSlpZQ0hYMVd0a2dnWVAvVXZ4Ukd0ZTlMYmFEeUpzYTZ1M0NzR2x0MWdr?=
 =?utf-8?B?cHh4UUUwalpnMUxQWnRMdWF0cThDOGJFcjZTQkloZmI3NW9qV1o3R2diVUl4?=
 =?utf-8?B?dWVrQk43QlFnTVZPdmRRaFNRT2c4REp0bVphbjJxNy83WXpjMy9KZEx1WWFT?=
 =?utf-8?B?bmlYMVFsRnArOE5tbHo3VGE4WnlGVWxzTXk0TVhhb0FMc0NIeTVOVW9ybXF5?=
 =?utf-8?B?cWFzcjhMVzJzRnZBYVAyMHZIK2w0Nm51M1JESEZLWTRKNUJQbXZMZjdyZldK?=
 =?utf-8?B?OERmblphS2tGY2NUYURhOFMrZmk4QWpwSy9ReW5XTVBYSWU1a0JyYjVqM2RZ?=
 =?utf-8?B?WHRaSC80NHJvS0NQcDFJQnBKTkprbmkySHhDSllxU251VUJNaGE1UGFGYjE1?=
 =?utf-8?B?a1FDU1J0ZzloZ2piaWduM2k0TENWVThiSlJ6VjZqSXZOVDJ3eEg2SXA0MW9H?=
 =?utf-8?B?TlJXYTF0SXpXdmpFYjUwQW9jaC81OGNTWURmZW13QlpBbk9tanZERUI1RDFx?=
 =?utf-8?B?RVJ3SHM4T2VDb2VrTE8zTVI5QWVURlVEa0pIWkx6cExhVTR3YWk3dGEySGwr?=
 =?utf-8?B?SzNuVTN5bzU4cmFFc2VKUlE3M0o3TWtsWkpCVWVHSTQzYXBGTXN0dEtjMzBO?=
 =?utf-8?B?VzVpY0N4K21MOEpVbjI5N3NjNlJnWHUrcmhDbzVUMjcza242c1VkK3Z2eTRI?=
 =?utf-8?B?TVZyUFI0Y1JtMkNHSUpPSThqQllNbHljVFFKb1k2MTRBcmovakUzclVzbFFj?=
 =?utf-8?B?RG8vTmNhemZiQTdZQmVHN0luQi96cVdPaHpwbDJuWFU0RFMybGdOQWR3TjNi?=
 =?utf-8?B?czkyYTVDSEwrNVByRDlnMnRFdTlTSE9OYmFqNDdLSC9USEVWb1grR2ZPdERE?=
 =?utf-8?Q?ahNp5TzL4cm1NiDiOpIK18CtC?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5aaf59d8-6831-4275-cbde-08dde6555143
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 17:07:06.9086
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SCWLdbVqWqrDJrh2AmtBcPc2Tmt/4rRb+QtubfozMV/IiE0UZun/4jhsBKlTtPzM77UL9BZJ8FHL74shqGI1sA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF5D41D38AD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_100724_769193_54A22C2F 
X-CRM114-Status: GOOD (  32.31  )
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

On 8/22/25 08:29, James Morse wrote:
> The MSC MON_SEL register needs to be accessed from hardirq context by the
> PMU drivers, making an irqsave spinlock the obvious lock to protect these
> registers. On systems with SCMI mailboxes it must be able to sleep, meaning
> a mutex must be used.
>
> Clearly these two can't exist at the same time.
>
> Add helpers for the MON_SEL locking. The outer lock must be taken in a
> pre-emptible context before the inner lock can be taken. On systems with
> SCMI mailboxes where the MON_SEL accesses must sleep - the inner lock
> will fail to be 'taken' if the caller is unable to sleep. This will allow
> the PMU driver to fail without having to check the interface type of
> each MSC.
>
> Signed-off-by: James Morse <james.morse@arm.com>
> ---
>   drivers/resctrl/mpam_internal.h | 57 ++++++++++++++++++++++++++++++++-
>   1 file changed, 56 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
> index a623f405ddd8..c6f087f9fa7d 100644
> --- a/drivers/resctrl/mpam_internal.h
> +++ b/drivers/resctrl/mpam_internal.h
> @@ -68,10 +68,19 @@ struct mpam_msc {
>   
>   	/*
>   	 * mon_sel_lock protects access to the MSC hardware registers that are
> -	 * affeted by MPAMCFG_MON_SEL.
> +	 * affected by MPAMCFG_MON_SEL, and the mbwu_state.
> +	 * Both the 'inner' and 'outer' must be taken.
> +	 * For real MMIO MSC, the outer lock is unnecessary - but keeps the
> +	 * code common with:
> +	 * Firmware backed MSC need to sleep when accessing the MSC, which
> +	 * means some code-paths will always fail. For these MSC the outer
> +	 * lock is providing the protection, and the inner lock fails to
> +	 * be taken if the task is unable to sleep.
> +	 *
>   	 * If needed, take msc->probe_lock first.
>   	 */
>   	struct mutex		outer_mon_sel_lock;
> +	bool			outer_lock_held;

Is it better to define outer_lock_held at atomic_t?


>   	raw_spinlock_t		inner_mon_sel_lock;
>   	unsigned long		inner_mon_sel_flags;
>   
> @@ -81,6 +90,52 @@ struct mpam_msc {
>   	struct mpam_garbage	garbage;
>   };
>   
> +static inline bool __must_check mpam_mon_sel_inner_lock(struct mpam_msc *msc)
> +{
> +	/*
> +	 * The outer lock may be taken by a CPU that then issues an IPI to run
> +	 * a helper that takes the inner lock. lockdep can't help us here.
> +	 */
> +	WARN_ON_ONCE(!msc->outer_lock_held);

At this point, msc->outer_lock_held might not be true yet due to no 
memory barrier on it on this CPU. If it's atomic_t and it's set as true 
on another CPU by smp_store_release(), it's guaranteed to be visible as 
true on this CPU. Without atomic setting, we may see a false warning 
here and cause debug difficult.

> +
> +	if (msc->iface == MPAM_IFACE_MMIO) {
> +		raw_spin_lock_irqsave(&msc->inner_mon_sel_lock, msc->inner_mon_sel_flags);
> +		return true;
> +	}
> +
> +	/* Accesses must fail if we are not pre-emptible */
> +	return !!preemptible();
> +}
> +
> +static inline void mpam_mon_sel_inner_unlock(struct mpam_msc *msc)
> +{
> +	WARN_ON_ONCE(!msc->outer_lock_held);
> +
> +	if (msc->iface == MPAM_IFACE_MMIO)
> +		raw_spin_unlock_irqrestore(&msc->inner_mon_sel_lock, msc->inner_mon_sel_flags);
> +}
> +
> +static inline void mpam_mon_sel_outer_lock(struct mpam_msc *msc)
> +{
> +	mutex_lock(&msc->outer_mon_sel_lock);
> +	msc->outer_lock_held = true;
> +}
> +
> +static inline void mpam_mon_sel_outer_unlock(struct mpam_msc *msc)
> +{
> +	msc->outer_lock_held = false;
> +	mutex_unlock(&msc->outer_mon_sel_lock);
> +}
> +
> +static inline void mpam_mon_sel_lock_held(struct mpam_msc *msc)
> +{
> +	WARN_ON_ONCE(!msc->outer_lock_held);
> +	if (msc->iface == MPAM_IFACE_MMIO)
> +		lockdep_assert_held_once(&msc->inner_mon_sel_lock);
> +	else
> +		lockdep_assert_preemption_enabled();
> +}
> +
>   struct mpam_class {
>   	/* mpam_components in this class */
>   	struct list_head	components;

Thanks.

-Fenghua


