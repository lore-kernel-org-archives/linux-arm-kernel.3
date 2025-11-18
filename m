Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CA82CEDDA4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 16:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y/YdKuIUd4DaSIFjFbSv3PjnialY7pk3K/1I0WttsaI=; b=vqctIVx10Bb4oAqfWF8SvfjKMU
	DFfX+TcZy+nLnVmbb/q+YGSmXAAXT7y0a/93zaA3jo8cd+85jvO8+3p4p1h4r7htD06NtsumXbFkC
	jLoZ2nU7rkmc41LiiCS3Dq9BpehwHdG36FGe6KqpCQr4OV6naSX03M7iFIiX7sMeoVGnLX+gmJyGS
	M2Gdr2jGbXvRuUtSkdZ8NyfjeLA1fi3hTIuCFuJLXijmb5t2J3EVGZMuaGd45rm1wPAcHaB86ZqdC
	+zTe1FLCMibWfesbwPKp/VR+RI7tU2PdQy5rEtJmPZBGCd5wTVK8+mPdSIqXFlvgCE4t4Ar+z3rSE
	+wqiwOaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLOyP-00000000muT-0nps;
	Tue, 18 Nov 2025 16:54:33 +0000
Received: from mail-westusazon11012001.outbound.protection.outlook.com ([52.101.43.1] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLOyM-00000000mu0-1gEP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 16:54:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BR3+jtKYcaefBKPTDg2thagnN60lMo4gobems51YQFJ2CK3dcjoHwEShpgBsZOpSV7/2ZYSrATAisNOSp2KZNSeVKXJ0CTINItlZnMf326Gd2w+nM2CenHvfeJaSowe9XsRJN3ali+hh3nk0l/5wDdCsllJx5FYerWGIs4eC+noG3h3eNtNpnqkUI7mBm6DK8pwXkmgb2PDfdG5wkgcBcpmoDJu6QLDSOEZVmzgMyjiKP6UszNWWsHjVkT+kISIQtkeS4k0bYcQffxcjbpInmPO7Gung6FJpWqnwvNsC0ddjnEHn/Fo4Gufyv8vPnQcGeAvsGRo4A6V2syPwf7Nf+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y/YdKuIUd4DaSIFjFbSv3PjnialY7pk3K/1I0WttsaI=;
 b=pSk+WFsDDlvQRfbtZdACCgA+7bvLJBzyEY0ife93+l4NvvRDYoO4koiseAy1knT7/uhfnL/Mgxolral3TGKTfwi2beex02FzoDrrmGQeifVxzBxnynKfCy+P3VrzQi4R2RfEDtmQvjveWBYB1LZTtdSdrmR8bcRCQUeyoFTF3mxX1yjZ4wu/0boqTSHUqVy1FcM5Xa+PgD7mDFotV7x9SOk4871tITbWGdOg+bex5ZdTo8L8mMgaqxj/pe69zizsj/SY7VuenwqcIX9XFO7jUZHy7TjSX+Z7hzowy72DSlhsO594hzTXrI7qGhyt9+bX6TGFWUPRhOJTDpjVFdA+kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y/YdKuIUd4DaSIFjFbSv3PjnialY7pk3K/1I0WttsaI=;
 b=ap1TdLzXJ8yvmfUZtGU8na3dBR64RR4kPGnrFtIP+KAdMx+EctNLB023DVEbnDQ6mHsIeDdMzO7u5m8Oo6fdODjzDzSy565y+eHQE0CPSuiv7NBdje8VsEF/DLMlMRkwtDFPskEfo0ThXjmNFSfQfIJzVE3tevf1BbV61/XSBsxnonQKGWLKA/VBZqLWdHPrPgZPFp4pvuZvNhACl72uMW5LbMOPSS35Ox+l8i1QlNu5+FJ3WTRr1k9/n4mowA4Ag4Y/vAzoGDdkGY19vnGhnUSeSnPocMWcnjX4hkLPorlAL2JEcS7uCtb0GaUQTR7OEiO0qcwyMS0DauJkfw55ow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB2667.namprd12.prod.outlook.com (2603:10b6:5:42::28) by
 DM4PR12MB7741.namprd12.prod.outlook.com (2603:10b6:8:103::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.22; Tue, 18 Nov 2025 16:54:25 +0000
Received: from DM6PR12MB2667.namprd12.prod.outlook.com
 ([fe80::bd88:b883:813d:54a2]) by DM6PR12MB2667.namprd12.prod.outlook.com
 ([fe80::bd88:b883:813d:54a2%6]) with mapi id 15.20.9275.015; Tue, 18 Nov 2025
 16:54:25 +0000
Message-ID: <268c2bdf-9eb5-4436-8f3c-40c9690d9322@nvidia.com>
Date: Tue, 18 Nov 2025 08:54:22 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 24/34] arm_mpam: Probe and reset the rest of the
 features
To: Ben Horgan <ben.horgan@arm.com>, james.morse@arm.com
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, bobo.shaobowang@huawei.com,
 carl@os.amperecomputing.com, catalin.marinas@arm.com, dakr@kernel.org,
 dave.martin@arm.com, david@redhat.com, dfustini@baylibre.com,
 gregkh@linuxfoundation.org, gshan@redhat.com, guohanjun@huawei.com,
 jeremy.linton@arm.com, jonathan.cameron@huawei.com, kobak@nvidia.com,
 lcherian@marvell.com, lenb@kernel.org, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 lpieralisi@kernel.org, peternewman@google.com, quic_jiles@quicinc.com,
 rafael@kernel.org, robh@kernel.org, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com, sudeep.holla@arm.com,
 tan.shaopeng@fujitsu.com, will@kernel.org, xhao@linux.alibaba.com,
 Zeng Heng <zengheng4@huawei.com>, Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
References: <20251117170014.4113754-1-ben.horgan@arm.com>
 <20251117170014.4113754-25-ben.horgan@arm.com>
Content-Language: en-US
From: Fenghua Yu <fenghuay@nvidia.com>
In-Reply-To: <20251117170014.4113754-25-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0040.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::15) To DM6PR12MB2667.namprd12.prod.outlook.com
 (2603:10b6:5:42::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB2667:EE_|DM4PR12MB7741:EE_
X-MS-Office365-Filtering-Correlation-Id: b1aafe6e-9741-449e-d3d1-08de26c3212d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ckQrRVV4UFhobnNLa2tWTzhHVVllVGJubUVzRjQ5aGV5YnFwaVArMDcxUG5U?=
 =?utf-8?B?KzF3Ylp1Nlp5aEtFR05UaTR4aWlaZTFqb1l4QnNzU0VnSHNPeG1UamU1dk5l?=
 =?utf-8?B?MUwrdnc1R1d2b0VTWmFVbWV0b0dXOGdyTFVBTHdHUEF6cjBIaTJ4aXZGcXFE?=
 =?utf-8?B?WFBoYXNzcDc3VTdpYlQvdGJxOFdSWU1oai9Obm4xNDhtWmp0Nll4cllmczlO?=
 =?utf-8?B?VktsM0w2b2VlQlJUVEJmbGxEbW1GYUU5RnIxaGFzdDJFZUZQZHROVG1WSmp0?=
 =?utf-8?B?c3pkSHRRUGk4TjZYcHFEYlFyMCsyTHppenZ3QmowVEI0SnJmUUltVjVMWVVS?=
 =?utf-8?B?MkdreXRpSU9HQm1Rd1hWMjZXSVRWSDUwaFhmVnc3eFZwOXVIbGRRVzY4N2kr?=
 =?utf-8?B?Ti9tSmZFNVp3ZkhLM1hhbGg4cGliVkp0b3VmWHFNRHd0K1dzN3N6MG92K2py?=
 =?utf-8?B?VE9vaDMwQUs4R0VyenZPRWxncXowblRpYVpMSWg3MkVZQ0lJeWNTZzhtZDdT?=
 =?utf-8?B?RGVNQ0c3NFBhSW9pZTUwK2xiVTR5ZmRpU0ZCU1ZlOXdLb2Znd3lhbTdzRTV4?=
 =?utf-8?B?ZEVaWU15U2NNT1REcVhlWW53L3ZlVUl6M0djVmxLdXdrMGhUbnVydXJKVEFx?=
 =?utf-8?B?NGNPb0pEUFZ4dmgwaXFIQjFGTTJHVUMxVHdmdUZOSmloRElJVXMySWx3Y0JL?=
 =?utf-8?B?M1Rqd1RPdmUyVHlvdDhEMjZVNUsrdnVQekVxSTRRSFRsTjNpeDR4WWovbTBU?=
 =?utf-8?B?MTM1akJ6M3dWZnVRNDNHeUhaSFRYdUZWRGpXbm9SU0VSajB3bWs4elVqY0Zn?=
 =?utf-8?B?b3pxK2d0Ni9vT1cxaWFHc1RodXdQdjVsVWZxaFErczhObFVlZHB1WGRSNXZH?=
 =?utf-8?B?Q0owd0RHbGNnNDlIWm11blJ3SDdTUGNMeG1QV1AwR0RyaHdmN2tHbHRnWW9v?=
 =?utf-8?B?UDUxMjY5dzV1QzNHM2NwY25HUWl4R3dMZXVsTmkrdVRlR1RyalV6UnFKelIz?=
 =?utf-8?B?allqcWVrSFVVRjVnY21VWUtyaTZIWnV3QndrdUpFbVgvNGFKV0l2SE5JTU1k?=
 =?utf-8?B?YTF4eUpJeWF1U3hkMTM4Q09KSDkrVzhRNmlFd3FDcHBPZ24zQlV1d2l0ajQ2?=
 =?utf-8?B?aWR2aU8zSS9jaGZtN1hTbXJsd2tJeHNNbk5pcVk3VWNzYUhaNHkzZ3RIM3JI?=
 =?utf-8?B?TjlKaXVQYVM2NzA1NjVRU1lOUUVFZXlzdm1RM2FKVWhXb2o1SXpDYWFaSFAw?=
 =?utf-8?B?TnU0b3JuUCt6NFhraW41K3VGaGRFVzlrZG1zN1ljOStrQ2FUUzRXTUhjSDAz?=
 =?utf-8?B?L3pCZjBSM2p6eWF2dWZBTWt4aEZrek1HN2cvZWNmQ3Vaa1hQUWNnOHdBUU40?=
 =?utf-8?B?bFRmVVVXM2k4bkxUYzdIRWZtQ0pqWGluY2taM255NlFkbXR6SDNRT2x0VGhz?=
 =?utf-8?B?azFieUdlNUlOa0hURWtkK29DOUZXVEpwVkthMVIxaVQ3S0NsSGVZTVhpcFhK?=
 =?utf-8?B?S3dmRG5vb29tZzczRWFac0p3cUNhcVppQWJ6dXlmTjl6cU13WHhaNXdGR1cy?=
 =?utf-8?B?UFcrdHM1R25GbUM1TjNielY5QTF2enJkQVExTUFQSDEvOGNRbU1BWmNSL0pF?=
 =?utf-8?B?VFo3SXI3NTAyOWliL05oR3FrZHA0REZ1TXYvSEdja0pvT2RJeEJGQ0UwY2lo?=
 =?utf-8?B?TythNVhxWFRhNkpIQVVaNExvdUljT1ZjekFwYk54Z1pEamF6VEthaC90V0pW?=
 =?utf-8?B?MHRtek85K3dvQlkrM25yNFk3SjNGczR3UWFrcHJocmZ4QWFPcHVWdWJEVDR4?=
 =?utf-8?B?YkY0bXozbDdETFhjdUdQSWpLSHhEUmVGbEJYQnE4by9MUFNVR3JCVHBGbW8y?=
 =?utf-8?B?T3d2d0s1Z216all2Sjg0T2UwdWVCNzQ0dEtSVHp1UWRYUGEyV3dwaDBKVFNM?=
 =?utf-8?Q?kVIwZ2i0K0Yfmhs9tt+1Z+kaOxVxaHS9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB2667.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkE0YjBjRkFORjAwbUt0Wm5GUzB6OHlDSFowcGUySWNKQW9zUEczNFNmOXcw?=
 =?utf-8?B?Q1dTMGp2VW1FNnpXWTNwS2VRMDJ2TlQwZGZYY1JhSWhIT1JpZStvNHFWUWZ3?=
 =?utf-8?B?NlErck9HRCsrRTV4S0pIUDRLc2hNd2xOWXB0UGNrK2V2b29pbFlPRk5nWkNM?=
 =?utf-8?B?Mnk5NEFKeUVCbllIanV6RzJmSExEemlrKzAzZlM0MWNkNkFlOXN4WXJYVFFp?=
 =?utf-8?B?ZFZHUENYdVFyQzRIejRCdmg5UlRZaEVNQ3dVVE4xclllekhEekIzWkFiM2NE?=
 =?utf-8?B?cTJSUDJFQkVhditDRGhITVkzeUFNMGZUamM0YU5ic1hQbEVWcy82ZlRtQ2Jn?=
 =?utf-8?B?VlhsTW83M0hzaWxNNUhLWEprbzZscVhLMTJvRS9sanpNeGdVdTFHMWxUNE9F?=
 =?utf-8?B?NFRYMzdkZFlsem9sNWZodkRDZHRoNTVqeHAzQjlkc0IxeEFteFBPblNGUXMx?=
 =?utf-8?B?bE1LZkNCRjVVbUlDUDN0Ry9DVWJIbDk5aEpMWXcxb3huWmUzbU5DRmRQZGhS?=
 =?utf-8?B?MFdTS0YvanZ1WTd2aFlaWmJwR3JibjhEcFh2YWxtbmpXZFRWZTVTbFVWTVdM?=
 =?utf-8?B?cDNuVGNtZDVIQWdXNTdyMTdTZG5XWkNqSmdqbVRxVXJiRXRwMXhiT0N6WlhX?=
 =?utf-8?B?bFI1ZmpUWEFGTnMwclUxaG4yQTY1RWdZdVB5elVVbzNXRC82YjNNb2NEazV2?=
 =?utf-8?B?ak9kbDZmNGdZVnBFUHJCbHZwRGlvZ2FiRDVmQ3lZdDRDWmZCNDBpdm5SaGxP?=
 =?utf-8?B?TVFVdzdzOVJrejVsdUVkTTV1L3V5Nnc4WktSR0JqY2R6U0MxVWN4L2oyOEZz?=
 =?utf-8?B?WmdlcjM3ZHluREU1RnYwZ280VmFvYXlrWWZTQ2p1d2M5MjllQ1JpbFkrOWo1?=
 =?utf-8?B?dlkvOFlqNVRGNWVQdVk1MVk4TDhONXAwNW9WUDA3SytYOVMxc2xxd2lza1Ir?=
 =?utf-8?B?YW1JYzUyQWYvM1lTVEVVK3IyNmFvZTgwa3RzVTNyQzJydFU1ME5KMHBPdUpV?=
 =?utf-8?B?TmZmbDMwOUM5NkRvWldobUd3MXlqd3RENHBuaXZiTG5rVGh6YkoxazZVVFor?=
 =?utf-8?B?VEZRNzQvTGpJbmtxRkJnZmtCREwrRm93c1Awa09uckJtanF5dTBrd3FtcTBt?=
 =?utf-8?B?SWZueXJlOVRRcmF4SzQ4eVlTaWo4WU5KY0lDV0hFblp6a0ZuYzdiakNMM0Fq?=
 =?utf-8?B?VW5yVzFVWGZUUTJleTZXQnRMdFZtaGlSZVA4SWFxU1A4RHV5U3pxbHVDNUtO?=
 =?utf-8?B?ZG1TUUxDc08ralE2U3FjRWM3dmlnSGNJOE9najR6clByMjQzVTRMNjdwSnJD?=
 =?utf-8?B?dkZNSGZHZ2FMQ1hpcFdBUHpLSUd5WHJ4MEZkVVdzN0dIdnJkWUFEdEo4Y3dx?=
 =?utf-8?B?ZHhWYUJ5bDUyV1dpeDMzUWRvcjI1UitsYVFUbyswRzNCZ2ZnM1VyTngremlz?=
 =?utf-8?B?ZFdPVGxMWGZSdjNlbU1wS05nZW5aWm5EYURrejJaQVBuc2JXcjBmbHF3Z3hD?=
 =?utf-8?B?RnBEK1FTVXg1RUh6NXluZXVHdG80MHlBMFhPZjhLWXpQbUt0dXUzOGVEaWVx?=
 =?utf-8?B?bWpHajY2Zmt5aHppVGF6RDVGN0o5UHo1eVFka2FIN3ZUR3YvMGcxRDNidFRG?=
 =?utf-8?B?TkNqV0FiTndUcW9sL2hKQjMvaEtMQVpsdFRjelJaN1ZlanNxdVNoYzd1Tkh1?=
 =?utf-8?B?STVaZVZWVmtxMkR1SExtQW9ibG1mMzYxZWdEMFVycFNxZHVyVlpRVVlQbmEw?=
 =?utf-8?B?WE1wSXVuWDUyMVU4TlBISFI2aFIvcnRxNkJ0RmF0bDZHcWJVTmM1NmpvRjlv?=
 =?utf-8?B?UGdHdnVYTHowMXZtQkNwTXI5WnZTUDVRTEFEekx3NUNTd2VSRWVzbGtpSGFR?=
 =?utf-8?B?SGlCWXkrdlloYlBVeVhSdFF0d09FaTFyUXI2dmMrNHJVNEtVemRlekpQWG16?=
 =?utf-8?B?VklFWUtoU2g5ZHpXNStqOStnTndHZjhCR05URllJTlowaFZNT2tyWDJJQ1BZ?=
 =?utf-8?B?MytWeXczK0d3aTRwL0FUSG5Kcks1Q2IrbEFWeTduMUhiaEFDbHBibWxpUFR3?=
 =?utf-8?B?dU1RcXU0NXIvVkY0a3FJWHl1ODBKaUpQN1lFelBhRUFmNnBHVS9kUGVFWlVW?=
 =?utf-8?Q?jUVZ5FEfDuP3fwzN+CM29wOwD?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1aafe6e-9741-449e-d3d1-08de26c3212d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 16:54:25.2110
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zpaTiGp/G4lrjg/ZVG/+3eyfucObJrhcQEVtWBel7MtMCIQV5oGCNe2Frk6SqnVFsV0hOs91iCQRK8l5cqRPcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7741
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_085430_444978_90AA320D 
X-CRM114-Status: GOOD (  10.44  )
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



On 11/17/25 09:00, Ben Horgan wrote:
> From: James Morse <james.morse@arm.com>
> 
> MPAM supports more features than are going to be exposed to resctrl.
> For partid other than 0, the reset values of these controls isn't
> known.
> 
> Discover the rest of the features so they can be reset to avoid any
> side effects when resctrl is in use.
> 
> PARTID narrowing allows MSC/RIS to support less configuration space than
> is usable. If this feature is found on a class of device we are likely
> to use, then reduce the partid_max to make it usable. This allows us
> to map a PARTID to itself.
> 
> CC: Rohit Mathew <Rohit.Mathew@arm.com>
> CC: Zeng Heng <zengheng4@huawei.com>
> CC: Dave Martin <Dave.Martin@arm.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Fenghua Yu <fenghuay@nvidia.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Peter Newman <peternewman@google.com>
> Tested-by: Carl Worth <carl@os.amperecomputing.com>
> Tested-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Zeng Heng <zengheng4@huawei.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>

Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>

Thanks.

-Fenghua

