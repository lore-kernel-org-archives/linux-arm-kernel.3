Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AAFDCAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 17:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f1qaSSi0nRHf4Ura+Jrbs/qo0Sm8+V20rOO2eRR9INs=; b=OKwadJ/jnuzbwKSEhS7tvB+MMU
	A3mKNWNms8uzff1VaHfmyv217D/SvU3F5FxdxeyhPV/4KjcRDq65ivtonXr+NH4lJzvEhc4DVyLaK
	xW+YHwSCtS0XEg34OA32F9Pr2pwEEbaJ5VBlvE83XDyW4ZZguRypE2sWWRCSLDN79vEcNQyk8Nn4U
	lOU5mHA/zzPqPVXSMtZkDZMF6j3Q8ewU0qEFufyD0iXdqsaJ2t//I7K4FswyFzRcmJQjFR+uEW6nc
	2UpUywAdjnEu4dqH5Q1lpsAQTJpg+Fsl2HOo9wae5tkEW3fBhc4xmxCy2yTt2g2iJLJKO7mEp/paz
	EYiXVm6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v172y-0000000EQ8N-2Ljf;
	Tue, 23 Sep 2025 17:43:24 +0000
Received: from mail-southcentralusazlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c10d::1] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v172v-0000000EQ7o-2GBe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 17:43:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XH1Q+vDb7DNviIt5hEaQzHczUR3zvzTZ1xXKQOnRWPfhzLOfJDVivGYK5GNmp8u983LIzbeAhgTf6+4BmpButStWVGYIHVR0YnzbFcU02P8rgfTYyy3Ul3KzHGhh1I+zE+35CaT41mxrRPhNeZLSvhJbEsoAQewjm3RLiYcVgwI3UQXWLIf2GYf+wzziXEc90212HpDnO6VGY3tzOrZzMzCuKFewb31C4syRobrGo8NUhPoOAspTA7pcVZwA59OA863m31zoi+gLRS7Ldji1LY8DowLf8nCdh2XCfJOjXX3OPrkgxwSaMQGVa85PqMozKivSF56tKppz9VDQDyrVOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f1qaSSi0nRHf4Ura+Jrbs/qo0Sm8+V20rOO2eRR9INs=;
 b=EyBzJ6SdIS1MDc1dAk3bXTA47HPtvrs0EV1HX/VVDhDJ4qjQosCZdFsTWArbd+LPBwZiOmX45TYhA7hM3d/8nkDXAVHR2fehs0ceks4fLso5qRPeLupDQpeUSJedBDAn6ra1AS+CVQu2YPUaM8UAhdmVkrjRJUU7PnhcSBFZVO74+qA2gtT91eQj7xZ7COHpOCaLEU6Iv0qs/sQczAHMMGBII0LJKL8BjNn/4OoPQWii4mdsnWRb1FDh3ajUaGIgGhAn6Vc5kIWkn9yz2+6m1T8nnjyGC01PLkcLqbpdkQOHk3KBPIZT+jLZvYyd4u02G5K54iERJKd89MSvNa5WVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f1qaSSi0nRHf4Ura+Jrbs/qo0Sm8+V20rOO2eRR9INs=;
 b=o0EzmfZOBpg7EDhzP/xztbkB38Wi2SxPjbK+wXe79yuMu/k9PKf9ToC2CH3MWILvl2XRm3CnDt/MXG8mqZWPSc0DwxOxf4zWG4Ekl4j/rKKTYdEN8syJF87JD304MZCz5HNOU/xNkZLONHDAMTGLp87nnpp8zSL9WvmKzxhOuuA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 SJ0PR01MB6368.prod.exchangelabs.com (2603:10b6:a03:29d::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.20; Tue, 23 Sep 2025 17:43:15 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460%3]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 17:43:15 +0000
Message-ID: <fe1f4484-776c-466f-8b5d-46469c4bc5ad@os.amperecomputing.com>
Date: Tue, 23 Sep 2025 10:43:12 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [v2 PATCH] arm64: kprobes: call set_memory_rox() for kprobe page
To: Mike Rapoport <rppt@kernel.org>
Cc: Will Deacon <will@kernel.org>, catalin.marinas@arm.com,
 ryan.roberts@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20250918162349.4031286-1-yang@os.amperecomputing.com>
 <aMxAwDr11M2VG5XV@willie-the-truck>
 <8df9d007-f363-4488-96e9-fbf017d9c8e2@os.amperecomputing.com>
 <aM-rDD-TRqmtr6Nb@kernel.org>
Content-Language: en-US
From: Yang Shi <yang@os.amperecomputing.com>
In-Reply-To: <aM-rDD-TRqmtr6Nb@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CY5PR15CA0047.namprd15.prod.outlook.com
 (2603:10b6:930:1b::29) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|SJ0PR01MB6368:EE_
X-MS-Office365-Filtering-Correlation-Id: 544b7dfc-252b-49f6-8f4a-08ddfac8ac99
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b1VENGhiQ21reEFVdFUyMEM5dVVFcnZBR2c2cGQ2ZzgrZDlVTUpuenFDK2VR?=
 =?utf-8?B?RnpjdU1LYnkyQVFUWEhVdUZKZzRPcWNMOTJ3SDBNMVBCam5iV2V4R0JiU2Ex?=
 =?utf-8?B?ekFMVW9PcmxpRkprZ3dEUllDSktNUzc5ZzRiY05mRUpDdm9TWS9MUytuMkxU?=
 =?utf-8?B?bkZwTTFtZjh5MjUxUVk3OEY1WkNadzRFSjQ4MnByYWt1TkxkRjd2bFVWYjZw?=
 =?utf-8?B?bCt1MjZiKzFqUGlQVjRCZXBoY3VxK3h4bHg0UFh4c0Z2Z29aM3ZxcFZBSFBq?=
 =?utf-8?B?cjJlV0RmbTRVOWUwbUp1TVhwTEttTUtld2dOdlRHUktyTlZHQktyM3lzY2dl?=
 =?utf-8?B?dko1ZExzYUEyYnZ1Z3lraVE3SUNjL2svYWp3Tk9kVkJkVzB4eEN3ZzN2RVox?=
 =?utf-8?B?SnJ1ODd4MFBqVkxIY2p2TGhIL2thVk9OVXh6Y0UzWS94Mi91Q1l4K1IrVFhy?=
 =?utf-8?B?WFBBaWdUR1JBVUF0T0ZQVWFsU1o2U2JDZklueEVXTWJ1dmltdVdwNmtYeFdC?=
 =?utf-8?B?ajEwdmw3ZjFJaW9YZ1RuQUwwcm9ucUp6N3drektnTGlVb0ozSXJzTHZiSGNB?=
 =?utf-8?B?TlhWQ1NORWxpV0xqak9UTEYvMm1BQkpmSWZXUjJjc3JrYWY3dWpUdy9OdXl1?=
 =?utf-8?B?Si9aa3RCcWE2czBKZGlQT3QyYXZDalZVQm4yQjdIZXRTZ0R6NXorc2ZkZDJn?=
 =?utf-8?B?bnNNZ09NQ0I1V3c4YTZsSlBEYU1zRDA4d1VaUDNTM1YvYmNiZ1pzOVNwWVZz?=
 =?utf-8?B?OXFRTTUwU29aMkJWZEJBeHhtWnQ4SDE0Y29OSTRQR01QdzljSmI4WUYrM0dQ?=
 =?utf-8?B?QXZIWFA0Y3A3WE90MkdYOTZzRElMaU5NVXFQY0p6WTNkRG5EdnJZYzNrLzNy?=
 =?utf-8?B?Z2FHK3JQWXRTdzNYbGY5NUxpVnVTd1gyOUJKUFZ5aFpreWxxUXB5R2xGengx?=
 =?utf-8?B?MTN3SUhCUUxrL0FFOGp4NEd6N21XdGZHcU5MbGRnMjFIdkVzalJFMXJzbXFl?=
 =?utf-8?B?WDlST0VjUlp5bDJmWTg0azg3Ymd3dXo1NnR1Tll2akl5VEs3MGJQMzcrUk9E?=
 =?utf-8?B?b3MyenUzWmZJekFpY0FPMVljc2RRZ3QrMnMxajNHU1BJN1lRTUJtdzZBZm5k?=
 =?utf-8?B?ZTNOR0tFZUJlbWpYenNNOFFudG5GVGZYRGRYVGd1NjY5eUh3N0NRU21JYmdL?=
 =?utf-8?B?eFdkVWNwSmZEYnZKWlorN205WFBNdjVpT0RFaVBLSHZUQzgvblA4Z3oybXll?=
 =?utf-8?B?MUJMWGlFdUpQU3hxWFNvUkFhMHFNSktUbDRRRVFycDNmM20zUFVPUjF3TUtG?=
 =?utf-8?B?QjIydEMrU3ZEQ2lxTzhYN0k4akd2R2x0NXY4UjFBcmtNd1lJenczWWtXVWJw?=
 =?utf-8?B?dldEWmV4TjV0VWMrOUN1b24wVHlpLzdadGhybE5mREF1RUxuT1FPdWhGcWJm?=
 =?utf-8?B?R0FQVG9nQUs2ejBBaDYyQ2FQeFlvbW1Mazk5L1pXTXVMeE01RTNmeC8yS1RP?=
 =?utf-8?B?MFE2M2JFMUhjcS9VMmpFSExhTjkxWkwvN1lkbTBHTm1paW1RTzIvZHJVWFNN?=
 =?utf-8?B?VUVtZ052QVhybWlGN3dXTlpnVjM4amtMUWRrK0tpajdlRVJVS0NjVHVuYmxE?=
 =?utf-8?B?TTFmWnZZSXd1QzhvOEpMSTJ4bi9xdnlETEZiK0VPR3RjWGJpNkQ2TnJNMC9W?=
 =?utf-8?B?eXROaWxBUzgwM0xSbmtRbm92VXJWWWxNcUk4N1BBS0ZrYUlkdTI3c280K1VB?=
 =?utf-8?B?UFFPamQrUWJvS3ZBa2RjaEJjMGo4WCtLT1JJQ3JqWnUvLyt1azgwRVFBOWJR?=
 =?utf-8?B?ems0WE5SSmlJYmhvUU9tbnJ3K0FrVEVaVVI4OUJPTlJBVDV4WHlQVjAvMVB1?=
 =?utf-8?B?RVFUYVVqZ3U5N08yUEhrYTk0MERYTVhWNG5JWXBlZ05qbHZwR3RFRUp6RVZv?=
 =?utf-8?Q?Nfm01EFWpWs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?alNteEkyRStGUEhCanRDcEtNM2JJOGYyL3B3SDNIb1ZvTUtYejdzZzBxNTVY?=
 =?utf-8?B?dXdVWlVMQlE1bitjY0owb1BXQ0tMMVB6dmdiUUFBRWxrZmdTTlA1T3BLRXNw?=
 =?utf-8?B?V0hjZnhzOVdsNkJQMkVSUHkzbThvcTYxeWRMYW1oYjJLT3F6aVFXa05RVWxy?=
 =?utf-8?B?UzZ4NWRoREhnc2t0THBIRzhOdzJUVzlFQXVqTEtCb2hWQk91dG00b3kvMlYz?=
 =?utf-8?B?Q0l5dDdBbFdpdzZ5SmEvTFVmbTk3ZGpSV3FHTnEwN0gzWVhSR0wzaTNYa05t?=
 =?utf-8?B?cUIyb0NuKzBxWE5xVWx6ZW1aNEhHTWV0WE1BQ28veXJLellSZDMwUHhPcVVL?=
 =?utf-8?B?bG41QXBQbWkyQ29IS1EveWNMSW1XWHM1MTRQVUJvaUFpK1IrMDhUcGxqL3g2?=
 =?utf-8?B?QlJEdDBabTNaTzl1TGxZUXNYSDd4WVNQclZuc3NlNVlwUzlWZ3pyTG52QU4w?=
 =?utf-8?B?UDZ2RkFZN1pLY3VndkpIRjNHMUFkQXN6azB2bDFhb2o3ekhjZkFOWjRHcjBK?=
 =?utf-8?B?VlNzNlpNVGdBUWVWSWsxdG1OWG1xQzRWVlRUeG9sOU56bHdicWpKRmR2R00z?=
 =?utf-8?B?U0p5alhnbEhJYUVPSThEQW9SeEZ3c2xBWFBkWlN0NmVqeW5BOHZ4WW1YOTRt?=
 =?utf-8?B?SzhkUnVVKzYrZURta2wwNnNPRE9iSkhmbXVWd2krMWJBNkxWaGR2UEsyOHRI?=
 =?utf-8?B?K0JQVlVjUGpVWUlSN0I3aDFGYmxZUGhjOUhXUThLaWRsRkhNaG9sQmRUOS9Z?=
 =?utf-8?B?Z0NINlpzRmdEcDNyRzEvQzQ4aEM2K3paNW5VYTFxQi9uWjJRQUxQVnR4N25R?=
 =?utf-8?B?MlAzbloweWVOc3RIVXFmSUVJVXVUdHdXMnB3cUJFTnB1YmlMWUxEcXFkYjhm?=
 =?utf-8?B?cFo3SmVCNVRlRVUvQkdxYWZpVUovdXZtcm1lRGZVdzI5eU9tQTNLRGJQNE85?=
 =?utf-8?B?VGFVWnc0UkVsbnBCakVzYTFOcm9YZHJIV3RTb2lXekg0ck0wV3FoRHVFL1hU?=
 =?utf-8?B?bW1LY1pSTUtNN0JyR2pWMlZpckk3RE9ZZ2c0dGVKdW1UYjRFdnFxQ0xMRE5J?=
 =?utf-8?B?YWJ3L0ljRGVuV2JLbzIyZHNnZW01bFdDYWIzeTR2ajBjdnpaTit6ZG1iMnFa?=
 =?utf-8?B?eFhzajN3S2QwcS92dXVnbk9TVml1MFE1MW9TVktVYzQvcjBqMTFXNmcwYXk4?=
 =?utf-8?B?NjhjWTdXRTdnbjFFUlpJYzZoTUlacG1ITW1FODlmQW50M1VGRXV0Tkh2TzVJ?=
 =?utf-8?B?eFJva0kzZHpBUXVNQ0JiL2pKMngxZWM0SXFWZzZBRGd5VitTME9xSjNMRU40?=
 =?utf-8?B?UGJSdkIxdmsxVUN6cTRaSXJNVGdnUDdqTmltMC9lcWlJRkRuRGRZY2ZLcG9j?=
 =?utf-8?B?SFFmbVZNTVhFd3hmbm9jNW40ZFVGY1BUYUhRUFFWd1ZFWWNwSzZiMi9qdVEw?=
 =?utf-8?B?N2R6YWNaNkVscVkwZkp3UEFHRlE3eDVRM1JyVEZRY3pvUGk2Nlh1MGdIMWlS?=
 =?utf-8?B?Q09NVmhxdjd1cFFuTWJKeitJcUswZDRQUThmaU9Ga3BQeUc3WSs0QWx0RVhj?=
 =?utf-8?B?TnY2UzhJKzg3SzZ4aDZRbGhBTVlUZkZwV2FVM0ZLRjhDUUlNbm9Pbm5iYWUx?=
 =?utf-8?B?Lzdyb20yZUd5clJNOUEyUkE4Zk1uWXFZcnhjMXdISEhGZmM5cVdFanJxYzMx?=
 =?utf-8?B?M2NKMmRFWDErOUtvcWQyaFVJR0FpK1h1VmlESkVpSVVUa3NHbDlXYndEbGl4?=
 =?utf-8?B?QzN2aERXTzd3TVgzb2FHUFRqRWtPS2hjUnhFRGo5TXIyNmR4MEZMWDlXaVo2?=
 =?utf-8?B?R0E0aVBTc1BuRit3YUpoRllpdHpaMDVIQmNZb0RhaDJlOUQzZmlXNXZEaVlD?=
 =?utf-8?B?ZmxSKytLZHJmNGpSdmJVNGRFQmMvVUszK2RON2lWTUhHYlg3a2tKbE1LRE56?=
 =?utf-8?B?WDRIU2lJSVc4VGI0ZVVVckJvc2Z2K2x2UTRUK3pLUWYwbGMrLzVWY1EwTnds?=
 =?utf-8?B?WFJoVjZ4OU1oaWJSMXF6YklBZW5sREhoeTVxWCtRN2g3OEJUb1dSOEVNeTdh?=
 =?utf-8?B?RGZRenpOTjRwdzVBZ1pHdnhRbjhsMy91T2krSnA3VERYSU5ISU1tVXFGOGk2?=
 =?utf-8?B?MU5sZVVzZXo4TDZydnhvT1JqZHpTYzMzUzYvaFdaT2xpUEZHcHQ2UjQvZnA4?=
 =?utf-8?Q?W49oz6Hgqu9C8z7jQrN5dXI=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 544b7dfc-252b-49f6-8f4a-08ddfac8ac99
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 17:43:15.5000
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sNbrfGkrqsxnggZbB2gORGnTRQtVOdB210H5YtT35cc1vL8jcqhk+EUu1hlkpxwfmj1OD4FAgafn8bhlzKqB5/TYkWF19hef+vOkOZqjmok=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR01MB6368
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_104321_598770_21121A58 
X-CRM114-Status: GOOD (  23.34  )
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



On 9/21/25 12:36 AM, Mike Rapoport wrote:
> On Thu, Sep 18, 2025 at 10:33:26AM -0700, Yang Shi wrote:
>>
>> On 9/18/25 10:26 AM, Will Deacon wrote:
>>> On Thu, Sep 18, 2025 at 09:23:49AM -0700, Yang Shi wrote:
>>>> The kprobe page is allocated by execmem allocator with ROX permission.
>>>> It needs to call set_memory_rox() to set proper permission for the
>>>> direct map too. It was missed.
>>>>
>>>> Fixes: 10d5e97c1bf8 ("arm64: use PAGE_KERNEL_ROX directly in alloc_insn_page")
>>>> Cc: <stable@vger.kernel.org>
>>>> Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
>>>> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
>>>> ---
>>>> v2: Separated the patch from BBML2 series since it is an orthogonal bug
>>>>       fix per Ryan.
>>>>       Fixed the variable name nit per Catalin.
>>>>       Collected R-bs from Catalin.
>>>>
>>>>    arch/arm64/kernel/probes/kprobes.c | 12 ++++++++++++
>>>>    1 file changed, 12 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/kernel/probes/kprobes.c b/arch/arm64/kernel/probes/kprobes.c
>>>> index 0c5d408afd95..8ab6104a4883 100644
>>>> --- a/arch/arm64/kernel/probes/kprobes.c
>>>> +++ b/arch/arm64/kernel/probes/kprobes.c
>>>> @@ -10,6 +10,7 @@
>>>>    #define pr_fmt(fmt) "kprobes: " fmt
>>>> +#include <linux/execmem.h>
>>>>    #include <linux/extable.h>
>>>>    #include <linux/kasan.h>
>>>>    #include <linux/kernel.h>
>>>> @@ -41,6 +42,17 @@ DEFINE_PER_CPU(struct kprobe_ctlblk, kprobe_ctlblk);
>>>>    static void __kprobes
>>>>    post_kprobe_handler(struct kprobe *, struct kprobe_ctlblk *, struct pt_regs *);
>>>> +void *alloc_insn_page(void)
>>>> +{
>>>> +	void *addr;
>>>> +
>>>> +	addr = execmem_alloc(EXECMEM_KPROBES, PAGE_SIZE);
>>>> +	if (!addr)
>>>> +		return NULL;
>>>> +	set_memory_rox((unsigned long)addr, 1);
>>>> +	return addr;
>>>> +}
>>> Why isn't execmem taking care of this? It looks to me like the
>>> execmem_cache_alloc() path calls set_memory_rox() but the
>>> execmem_vmalloc() path doesn't?
> execmem_alloc() -> execmem_vmalloc() consolidated __vmalloc_node_range()
> for executable allocations. Those also didn't update the linear map alias.
>
> It could be added to execmem_vmalloc(), but as of now we don't have a way
> for generic code to tell which set_memory method to call based on pgprot,
> so making execmem_vmalloc() to deal with direct map alias is quite
> involved.
>
> It would be easier to just remove the direct map alias. It works on x86 so
> I don't see what can possibly go wrong :)
>   
>> execmem_cache_alloc() is just called if execmem ROX cache is enabled, but it
>> currently just supported by x86. Included Mike to this thread who is the
>> author of execmem ROX cache.
>>
>>> It feels a bit bizarre to me that we have to provide our own wrapper
>>> (which is identical to what s390 does). Also, how does alloc_insn_page()
>>> handle the direct map alias on x86?
> s390 had its version of alloc_insn_page() long before execmem so there I
> just replaced module_alloc() with exemem_alloc().
>
> arm64 version of alloc_insn_page() didn't update the direct map before
> execmem, so I overlooked this issue when I was converting arm64 to execmem.

Thanks, Mike. It is not your fault. The set_memory_rox() was called in 
arm64's alloc_insn_page() before, but it was mistakenly removed by 
commit 10d5e97c1bf8 ("arm64: use PAGE_KERNEL_ROX directly in 
alloc_insn_page") before execmem.

Yang

>   
>> x86 handles it via execmem ROX cache.
>>
>> Thanks,
>> Yang
>>
>>> Will


