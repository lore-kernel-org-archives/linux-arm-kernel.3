Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCE4CCD4F39
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 02:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W//7caATWt8JlWokW537C8n+uCEwo0LBjNalFf5cy24=; b=2G79h2dI+8AVASTJpUCDpLyeMK
	QSNcVb2UzRyhtzOCidnH3Omo0KeImGDf1W52Gki0rFB96e5+Cje7re1mbghKe0m9LWx2XzbI7/xcv
	VZ3sVCYEa9OupbDMA6jB88aA2KFfNF5C7IooJ0PCz/QYKFxVM87gQ1z62RBRhk5uhq3+NdXe3nyGA
	wRLIEWHXRenU4r+qZU7o+ol49N4/1ho6K8Nn+ocA00w+2YormzcYeSpKKIAobf7q1weCfY0g61gki
	UKdLgz6Y7fnPHSwp2vpTNs+GSxuQ1Cm++ptWzZWGF3gLosgGo6kCg08R6ucMaYO/r1QaDvGrpQWQM
	Ii+MuLZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJNA1-00000009nuv-45xM;
	Thu, 13 Nov 2025 02:34:10 +0000
Received: from mail-westus2azlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c007::2] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJN9z-00000009nuT-3Ml5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 02:34:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XIQNP4wzu9pmnfY4FylHIudWH8ss5YK0FHxfsjHoveu+kzuBkz5Qd2S4qCDudJ9T3jKk9MjpTgRPBe/Z+PUs4O8vAMv0I8ZMjo1d3WEBPUNFsZEU6wDLKLIj/+zmy4xjSrHvwRNN5noK9TsUh3QqMpDYWbnqglee9m5z6Ld3RH1YqYEPa5+ycx+6vvWfsqI6byHuUt4eG2yDXSiIYFyc/x9NgT1F575JmReTyG0Tfmv5DfF05FLOKVNuuxs8fDNLEGn2UzPRndntSFl1jte9NQr9s03nfyKaEDtkgRRCChKjzVjWJYtzt9zfNZOMR50bTlbW8s6OvKsxJEMYv6t+aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W//7caATWt8JlWokW537C8n+uCEwo0LBjNalFf5cy24=;
 b=aHKC8+xt9F/pOvBZ195e/v17oHrtmgkZUN7cEi6+hrdjmkkZaKLPB0CI4RHoaeITBNvYRiL/OpxV8Epm5rRU3dB8QUw7lx+vc4vUChR9ARTUR6/fDAhn0SXFYLA3s/BtlF20O0uhxvH4jLLoQsulu8TgjMFJq5cNHjxhVff/og77i/pe2wtAN+dHaX1w4mT84GSHBpYRRYwS12NuKEsP0nWA0VzW5tLVVqQUSq42keznyo3Nb9DvL9CxX8UPuviKACiUhL0HTDBYFDiEP37qMzW8E/ZzpzntEB0CN7mMf9ejvwMy7u4bS9/anet2ZEkP71xIqzOhCzp0bExdF7dF+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W//7caATWt8JlWokW537C8n+uCEwo0LBjNalFf5cy24=;
 b=WGt3Hg/atZL5WSgK0ieYbqYNB5HaiRBapR/l7htSaRC1cQs8gi/sLXPTB+lpRhuy26UsnvOpxiFWKMkYex4/05uIw9KR1vjXFkBWdozXLEP8CT5hvdE0ZUtaj6jxGDH7IODuz8KPQCZZE9DFgazAXPSk4F0Wawxs1GMYhKQht1ffTJsp1RvrlVqwjfL3BdQiLuCVst2V1/zk92rgdGJkX0msrA0BOeUyPoxiKv4VVTGkreSOBZjaocP2WmqZdVaJMAby33MnEeFdR+Od2hgneEIzLFaZ7bR78JyguiQ/bZA6iWo0QwQNj+n5KxZYm5tzXLqD9vZt9FaTIQXRl+GLqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB2667.namprd12.prod.outlook.com (2603:10b6:5:42::28) by
 PH8PR12MB7256.namprd12.prod.outlook.com (2603:10b6:510:223::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Thu, 13 Nov
 2025 02:33:51 +0000
Received: from DM6PR12MB2667.namprd12.prod.outlook.com
 ([fe80::bd88:b883:813d:54a2]) by DM6PR12MB2667.namprd12.prod.outlook.com
 ([fe80::bd88:b883:813d:54a2%6]) with mapi id 15.20.9275.015; Thu, 13 Nov 2025
 02:33:51 +0000
Message-ID: <498b5814-28fb-4b5d-91a8-1aab02f3f5d6@nvidia.com>
Date: Wed, 12 Nov 2025 18:33:48 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/33] ACPI / MPAM: Parse the MPAM table
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
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
References: <20251107123450.664001-1-ben.horgan@arm.com>
 <20251107123450.664001-10-ben.horgan@arm.com>
Content-Language: en-US
From: Fenghua Yu <fenghuay@nvidia.com>
In-Reply-To: <20251107123450.664001-10-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0010.namprd05.prod.outlook.com
 (2603:10b6:a03:254::15) To DM6PR12MB2667.namprd12.prod.outlook.com
 (2603:10b6:5:42::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB2667:EE_|PH8PR12MB7256:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f68f794-4fa3-488d-d908-08de225d14e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TlBlMUIzbW5MaXJtVHBtWXlQVUJHdlFZZVFscXdYYlZZUWVYd2xTbURDRGQr?=
 =?utf-8?B?RUpSRmVqYi9WN205eWdHODlJOFdlbWRlS0duRG1vd1laMVU0QXhQM2VQSFhB?=
 =?utf-8?B?R2lRSWJtQmxWMEVqLzd5akFuSTBibUNQR05xSmNMZnRkNFB3YUpNUkNHemtJ?=
 =?utf-8?B?N3JibFlQSTFUV0dhU3BKVndQalVPZ1UzT2pWNGpXRG0yUzVEQVB6NXE3ODdi?=
 =?utf-8?B?alhockVTRmNlRnR1SHB6OHBuanVHaHV6N0JpYTdpY2FZOVVLaCthcjZBeEtM?=
 =?utf-8?B?VDdLODNrNmwvb0EvL2R2OGNVYmtvWWJVS2tjVjEwN0x0ZmZRTEFodSs2ZDVH?=
 =?utf-8?B?bnZGTEEydDM0UExYbHhXWndYbjRCMng0M0FURFdhcEpmWUVFcnB1K3ZzbWZ3?=
 =?utf-8?B?VWYxVHNuTjdXSk04RHFhQVZ2WUhmTnZVQ2E5eFZwVzhaRHN4SjlQSUV4SXZY?=
 =?utf-8?B?WG1abktsRlFUQ283TC9Ra2Y0WSt0cXNxaFJIbjA0a291VkJXUGpaeXdLeHhP?=
 =?utf-8?B?V3lVVm81aDZWdVNGaXNMbkNLUWtOdit3ZjVVZEg2bEtWUnRsN05mRTdDbDBy?=
 =?utf-8?B?Rkx0T0ZUM3FucjhHMS8xOTNBRm1Ic2dtSHpLVFFXNCtBYVNMMWtiNlVTU0o3?=
 =?utf-8?B?ZUIrT0hrSG4wRUMzdkRNbjFsbTlOaVFFTWUxZVJMUjVTYW5MVjRHekljaFAz?=
 =?utf-8?B?OFVCOHh4QmczdXIxN2tGWUVkNWE4a1J0bDloeGliemhUMFJmQTN5d2NraVE0?=
 =?utf-8?B?Z2FsZkd4ODN0NnFpV3dNOURMZTlXVjJxY1o4UGFqakc3Nm1CS2FSeDJOM3Fn?=
 =?utf-8?B?ZXhQcjBvbENLVjJYYm4xY2kveTJpK0twS05pRWJoZ05qZDlxOUt1dE43M3Y4?=
 =?utf-8?B?OGVFSHZ2THU2WExieXFuclNPZUJFUW00RlVLQ0tXVlpidWhxeHprbDF1WktJ?=
 =?utf-8?B?QmIzaFlrSVlIbEVOdjZPOE5mUnNiOVpOek16d2xiL2F3MDkxTXo0Wk1xbnpw?=
 =?utf-8?B?ajRTeGhCemJDVld6eVh1MkJvL0QwQzZtSXNlQ3lTMHpYZ3Jza0NPUEl3eWpB?=
 =?utf-8?B?bERVWEJ2MjVJTVdmT3drelZSU3lKTUVKVFNpZlZyOG9HcW5tOG5vQ3p0UFB4?=
 =?utf-8?B?UkplVEVYMGkyaFI3Sy8xcGJ6YjNZb3ZjZXVoR3dJMzJwdFh4dGh1blRGcHV5?=
 =?utf-8?B?L2NycG0vdEpvWWJ4MGlpUmYyVWdSTGpGbjRLamFTdjdXVUtlZ0pncG42YVZm?=
 =?utf-8?B?ZmlYSlBxTFRDS1YwbEdWNFNYeEo5b1BBZTl3blpaUWQ3dk1GTFUzcndycE11?=
 =?utf-8?B?dG16eVJUemV6ZDJMQ3hyY0ZQcE16cnVidy93bDd2WTZyYVFlRncvWWpGeHVv?=
 =?utf-8?B?VWR4OS9TQTFyN0xJMmFvaFk4c0Z2UWlWYWRDTTdYc2k4eWVKZFdwa1M3eWRi?=
 =?utf-8?B?UTBwZC8vOWNJdHFzZ29IeWRYcnA2RUpuVDZhU25wUWIzOTBNNlB1OURzVnZx?=
 =?utf-8?B?VG03VUE4ajU3UE5NM1ZZTEFLOENNMGx3RjNydTkrQmQzbjVqZDBVMWZoR2pt?=
 =?utf-8?B?V1gzNnRTZ3Vzd09XL2FVSU5aM3dnb2FkSnFyRDI5MmRXazhFNlphMzNvWnZG?=
 =?utf-8?B?YkNVL3l4QURZWXFtY2ZwbWZRMEZLUDNFSjZ0eUc1MFV1OG5DMlRoZ3hKRzFR?=
 =?utf-8?B?SXdyL0lOREVLbk40YTRpSUFFNWVpOFRzL0tHYy9leEU2SHEvUCs1K21YcWpB?=
 =?utf-8?B?bytxNWQ1czlLYWFiaFQ3aHUzb3g5SXlLVCszY2t1OXI5dktoeTBiSTNPTmhY?=
 =?utf-8?B?WXlpdGdaZHRjbEFNZ2lSdzJYWEJnak9rZmtOcFdHSmo0SVNibTkzTUlFbktH?=
 =?utf-8?B?TnZQYkVBVTJyQ28yUnNadENwS2MyVTlKVjhMcmEwMGNKeHlTTGZqVHJhM1RJ?=
 =?utf-8?Q?U26PYKb50Fn2WVVfDfvmoZZQF0kKjiD0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB2667.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0tzK25vd0FLWU5EaUVpemd3NzdpUjkybERmK3UrKzNWWUtDWjZyaXRmUFIy?=
 =?utf-8?B?MVZYMTJsTHpER2xFdUF4N1dVUlRiNlgzRG5ya1RMU0k5VVByQjAzWmQwUDg4?=
 =?utf-8?B?Y3FWRUFxL3BjeDgyV1N3K1M5eFpXZTQ0TjVaUzR5VllBd0gyWm5XZ2dKTlV1?=
 =?utf-8?B?eVc3VVlybFBnS2U3T2d1a0RBbnB3Q0xsMjlJd2h5V3NLNitsL2dZYjM0NkIv?=
 =?utf-8?B?NFdkWWErK21XT0M0bjNrZUtkNGdPUlZXdUFmSEp5amRhRnlwbmNIdG5nK1dB?=
 =?utf-8?B?UTlMWEw2dkpGWHVIUWhSUnRucUl4UnVaVjJZc0tlNXF5YWI1aTZUVFlDbnFj?=
 =?utf-8?B?SjVnMVBGMEVSM3NZOHBEQXNBWmZrMFY2SnFYOU5wVytFSjFnMkIzeGQxYmhU?=
 =?utf-8?B?NDVzeENBajlibUNzOXplbExsMW41L0ZaRmZqUVRyL0gzbEdwSnVWbEFYYUdR?=
 =?utf-8?B?cVdEUEpkVks0dWJrdVZ1bjJ2WjE5dlRPU0VONkJmS2dNaGE0dWEzd2JMb1Jw?=
 =?utf-8?B?VUl5a1VXQUY1QS9kdGlJYnZhUTE3clgxeGJSTkNVSU1PczA2TExqZ3hQc3Bn?=
 =?utf-8?B?WEhXd2VRZzVDNlFueThLQWs2VXY1TTVBWjdXNmc2cXEvQUk1WWpqNUluL3VF?=
 =?utf-8?B?QVRqeUxPdVZIdSt5UXN6RmJ1WW1RWDJhdncwNkFtUWZuMW4xWWhVaUdiR2ZW?=
 =?utf-8?B?NjJZVGJ2V3VtaGZMeWdZcXZzdGJXTytJem1sQ2t6dUdsQStiQXJoOHZvRjF6?=
 =?utf-8?B?aFBJelFSNWRjUEhJait3OTFGaXk2UzVReXZtbkZFSklaS2tZZWltODltR1ds?=
 =?utf-8?B?KzVEY0dFNUlNQnRwTSthMWo4UkZ4NTV0T01kSE90dE9Rc0JhOTBUa3RwaVox?=
 =?utf-8?B?ckIzTWJ3V1d3Vm5TNm85TE9QZ3hmeFFOL0N2RG5WNU1qc3orY0NXSWl0QmFN?=
 =?utf-8?B?WXpFWTQ5dDRqbTdLSFZXc3JxTmhBZUJiOWtXMStDQVpNOW4vYmpIaWxlbncr?=
 =?utf-8?B?MzN4b2xJWTlXTlVuV295citXVDNSSkMvWTlheTMyRDdkdSt5MHRSQllrZzBL?=
 =?utf-8?B?L1NXV2JTS1QyY2xjNzBZdGxFbFFQV1AzVkFjZHJ0U3MwcVBnK0dyRTlvUFBy?=
 =?utf-8?B?TU4wOUxzZmlpR2haZFdaTWxaZ3VXMHUxcHBXTklSdlVIOXJUSElNOFpyWDdB?=
 =?utf-8?B?ZzdWbURTaUFzWUhFdVNVU2NoMlNGaUtGWXZvai9sMXVIUWZCZ2xlWlFGNWts?=
 =?utf-8?B?SXRSN01GUm92ZDNzRG1xUjd5WUZEK1JMNmtwTXBSbFJ1WklGWUxmM3o1NkZQ?=
 =?utf-8?B?emhITFlLZ3VZVUtxVWJBdVJPelZPMUdXQm9jUVFKV29mRFNMSGd2YUUzaDFT?=
 =?utf-8?B?WUFMSFNDSXRueHpPME5LaFRwNTBya3UxeVJDUzl2Q0Vzbk5DWW16SmtOOUly?=
 =?utf-8?B?djFPR2ZuVmIvYlptSHZQRmxBWFpkTEVtNVArbjRTNGsrR2h4dHRyNUlVYXNX?=
 =?utf-8?B?Yzk0QlRrcUtGdGdKTTFUVWtqSWhIN0dXcjFnSlUvbTJMZ1QxV24xM29FMERX?=
 =?utf-8?B?bTdXL3l3M0tjTHE4anNNY29vQjA0dXEyV010OUpkYStNSDhyTFBEaU5saUdx?=
 =?utf-8?B?QVlFdmQwTjFaY1dyWHNKendISFVJanQyeHZMWUFTTEo3cjkxQTgrWTJhRVcx?=
 =?utf-8?B?ZWQzS0J0ZnJGdEUrU2pmUE84SFJCZWZwTjNNaFRKQ0QwQndrMU51ZG1tVzdr?=
 =?utf-8?B?R1ZPWVBIa3ZKWFExdi8xcS9FR1NVWDBuL1JndllmZEhXb1Y4VVVPK1ZyMXYr?=
 =?utf-8?B?dWt3VVpySURsNHVyellma1VuUW94TFZUZnJZUy9qbCtRTUVIUUF4dWlrSU43?=
 =?utf-8?B?WmY4b2FEWjk0Qk1LNlhTcXFpcDlTdTBTOEM1SFFJUktSQ0x4cXZqZFYrRm9p?=
 =?utf-8?B?QjZzcmVrTXhsek9IamYrSXl5TEhsTitGTHNyN0FjMU4xU1NoalRLTVl5ZlM1?=
 =?utf-8?B?Z0dCT00vQVNKZ3gxRTUvZCttcFM5bnBTRzRGbHduanpYeU1FL0ZqdkdPc1lG?=
 =?utf-8?B?NkNkRndVL2pYU1lISE8xMmhxVnM0N0t4NDZSOHg3Nng3M2NGYU01NE1nbmlI?=
 =?utf-8?Q?e2NridTLyrO85L2wifmVFl1ek?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f68f794-4fa3-488d-d908-08de225d14e5
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 02:33:51.3670
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Er7SHwWNmt0dRFsThNfufwX38CT0YSijmb4iUqlvUoBMDL8Ne9QJhdt/OCk58rHIwmJPGtY1RQ49+hidLgyWwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_183407_848096_97F7D29D 
X-CRM114-Status: UNSURE (   9.42  )
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

Hi, Ben and James,

On 11/7/25 04:34, Ben Horgan wrote:
> From: James Morse <james.morse@arm.com>

[SNIP]

> +static int acpi_mpam_parse_resource(struct mpam_msc *msc,
> +				    struct acpi_mpam_resource_node *res)
> +{
> +	int level, nid;
> +	u32 cache_id;
> +
> +	switch (res->locator_type) {
> +	case ACPI_MPAM_LOCATION_TYPE_PROCESSOR_CACHE:
> +		cache_id = res->locator.cache_locator.cache_reference;
> +		level = find_acpi_cache_level_from_id(cache_id);
> +		if (level <= 0) {
> +			pr_err_once("Bad level (%d) for cache with id %u\n", level, cache_id);
> +			return -EINVAL;
> +		}
> +		return mpam_ris_create(msc, res->ris_index, MPAM_CLASS_CACHE,
> +				       level, cache_id);
> +	case ACPI_MPAM_LOCATION_TYPE_MEMORY:
> +		nid = pxm_to_node(res->locator.memory_locator.proximity_domain);
> +		if (nid == NUMA_NO_NODE) {
> +			pr_debug("Bad proxmity domain %lld, using node 0 instead\n",
> +				 res->locator.memory_locator.proximity_domain);
> +			nid = 0;
> +		}
> +		return mpam_ris_create(msc, res->ris_index, MPAM_CLASS_MEMORY,
> +				       255, nid);

nit.

Seems "255" is an ad-hoc value which won't be used for memory type?
The "class_id" in mpam_ris_create() is confused: it may be level for 
cache or it may be 255 for memory.

To be clearer, maybe it's better to define and enum for class_id? 
Something like:
enum mpam_class_id {
	CLASS_ID_LEVEL_1 = 1,
	CLASS_ID_LEVEL_2,
	CLASS_ID_LEVEL_3,
	CLASS_ID_NOT_USED = 255  <--- for memory type
};

Thanks.

-Fenghua

