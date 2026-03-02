Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5364DD58E49
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 02:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UMj31yA8bfuxSfZBl4ytToVHwQIoadKFkTzQUvEIUv4=; b=OInLj+2hoFpbh3XEB+bn5V0oMF
	hvzvhglrPICCrPUBKvyf/wU36ThMZkUrU9skVqjTavsXgZWvCBFEjyM+uJ14XdqRUqoM4WItuDe8R
	/QBBv7hy6jbWvGyOrNBM9ABpJUooyKly8qZRDjD3BLtQ36APTxRAFNMZ1tCwWCYhotSeHDtWmEhYP
	GjOVNjpDXB+qr6aBdv3WadYZ2kDptdGvcf2CHoIV7BubqRiLMYcClVersbP5BJC121JOZrRxrh5Sb
	4IIN86MCGwhDuYRcFBKk/dkmsOpypA8wnMgiL3okLlA2zISwzesD7NDHGf3wkuYVTH1L9h6bJ+dpd
	+5prPUUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwt0P-0000000C7mb-166r;
	Mon, 02 Mar 2026 02:27:33 +0000
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwt0J-0000000C7lw-2Jmm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 02:27:32 +0000
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6222Enlc1211042;
	Sun, 1 Mar 2026 18:27:09 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=UMj31yA8bfuxSfZBl4ytToVHwQIoadKFkTzQUvEIUv4=; b=
	eZhzLQcGmG4IDBeo/eDd2GDJPUk/Hz3776J6frztBm/LSb2VdjHxR3g0LNvoX5FM
	XGbE/WEpkELmnygTmsxH3cxzxUw7Q5LyzOrb41+pmNKsEQdI5/k8z98zOofgsATv
	iwS7dqSJ4rPOipbbHeTYK56g5y543CzaJ4BWf3C0HfP8dZWEyxXpMF6pmEg5t9fi
	dBQNZ0Q9trlO9/1/Nl3SLacE6ENo7FoNjGc1hStwG+3bEiizxKc0mbkh5x/lfLnI
	riMhMqCNPswkgCA5TPgbw1Mlv+3iBw5kPwv/I17AUqTROKBI1owsIyWYs0Y1+9He
	mxs8D4ig+bEJ26MpjHSWCg==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012063.outbound.protection.outlook.com [52.101.43.63])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cm0rghbrj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 01 Mar 2026 18:27:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jxOYPe8cdEaByYvpKaaMliCvn3gUKY8XZsm8r/4enpfLNYI51sYfvOchSgtzL84GbeCjZ6NFMxL7sPjAb5pj6+33tlOcBnv+21U/ti3RULl0UVA7Ojx2hlf+k6wMSqUvR9lEKRYzw7fUeZqkBYIqxhvGB1IAgstjTYW3ztZLRIE4V6aO+XaGDNc28A5A8a/LmqyDmMd01Wqf9M5xXPrg4JLXyy6yZ25uQJ/atlDSoA19AkvzEp7Hg4SpfO/VsWWOrwTvU8GzaYkZfT8Wx12e5n5DT5WxW+krwLXjQaupEUg7pqCbWR4X50zo71WdhmI3MfHruBjzQSVIVjtfvm5ipA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UMj31yA8bfuxSfZBl4ytToVHwQIoadKFkTzQUvEIUv4=;
 b=cBE9dVo137dsmn26XDvEbdWQmZYxeMcuGIahwv14M2XkkaUc4YUpJyA53dNn46E0BQp3sHT1jzpPDzj3kmebbFHJOxShNpAvlBfY0wf4ly0BIfoXJIkG5pP6fohynyCasaKzD6zO5H1L1JMlYdOJPg40X505cWdomaqWaNaY03ocgPT2epFJIitRPZapD+3fewC9qx95tgMvkKYUhit6mCg553+g22RZTt+GPXE5WNf9LFQ6AcQKHi1ceLSlwTAbXds9moWPp710gE2SNIRqg0GvAk0x4aJuqZN0VSUL4G3U0FQ0FdFfMFmwKIiICT8AGKY6zrSLPD8TH1tqgGe8cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7736.namprd11.prod.outlook.com (2603:10b6:8:f1::17) by
 PH8PR11MB7967.namprd11.prod.outlook.com (2603:10b6:510:25e::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.18; Mon, 2 Mar 2026 02:27:06 +0000
Received: from DS0PR11MB7736.namprd11.prod.outlook.com
 ([fe80::f7c7:f271:a7b:7a68]) by DS0PR11MB7736.namprd11.prod.outlook.com
 ([fe80::f7c7:f271:a7b:7a68%4]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 02:27:06 +0000
Message-ID: <cc129fce-fe20-47da-9138-edacb26792a9@windriver.com>
Date: Mon, 2 Mar 2026 10:26:51 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: mm: Add PTE_DIRTY back to PAGE_KERNEL* to fix
 kexec/hibernation
To: Catalin Marinas <catalin.marinas@arm.com>,
        linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
        Will Deacon <will@kernel.org>,
        "Huang, Ying" <ying.huang@linux.alibaba.com>,
        Guenter Roeck <linux@roeck-us.net>
References: <20260227185544.1482632-1-catalin.marinas@arm.com>
From: Jianpeng Chang <jianpeng.chang.cn@windriver.com>
In-Reply-To: <20260227185544.1482632-1-catalin.marinas@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: KL1PR01CA0006.apcprd01.prod.exchangelabs.com
 (2603:1096:820::18) To DS0PR11MB7736.namprd11.prod.outlook.com
 (2603:10b6:8:f1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7736:EE_|PH8PR11MB7967:EE_
X-MS-Office365-Filtering-Correlation-Id: 529191d3-f913-485e-5705-08de78033287
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: dXfMeQKvTDhc++YsPgvWSxfrGp6Pftf9tNTEaEfurGzOoBmZtIp540k5/P+GOUzHDRc4tRVj9twt+96j4Txjxq1mY5rQI8GxlaGzT0Pv9mj2jnTimmVc+19bRCz2Ynh2G2xkBFvyXQGJ5er+5MhtmWVR1wcT+Hh57jkGMnPMU/YjdLDiczQq8cGGoRUyQT79JTp4Mn4vcnLaDrchvaPlOxwSvOn1UFSpoaBiB1XJQa9aG44A3NdA8hsYFZzE6Ky6e5/yen9HnCRIbRGC6EKsiWnTQSpWYJjxEaSL4+tptm1VlTkCMrx5sWNfMjadFiQGCjCJ8/Rvp6IIjkKxVEuYx8FHI4TKt0JuNAXV0fRd9povjz3Ow683P4Nb7waWbEU51VKyeVGgWCa/EYcNnLqCIMct3JhDTAvag9nNGxTc+HantOHM7vxPZmt4gkvatlEwXvScsVKjTJVd0KzHrLm2dtmYy6GHDB3gSY0xPRskr3kNt8xPrnFcF2RJYno+kPgBkDuJIO1IzdDb0iNImvdoU/d5gkkm+ouYbo1d77w5RD8i+gWuEMipGj+90IXPnySDtok7aHHzkc7oU5nglrW7xU73EfS1aa42Mr713CpkQTm97X+ozxeeMrAmOEqZgUY/PdL6lB1woUlEYI1IWFdMSXAOQwgAc/WNzk3hQ/tRkJFuHhTlkpirLSVGbUxFEs4md68lhSBh5UCwKiUkzCM67xlEPcs/zx8t0ZWGI7tpmZs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7736.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SnpCNXdqTXMwT3pxNzAzeWVlcmI4VmxOTnBBTFdyV0FYU3piS21MbkwvT2VB?=
 =?utf-8?B?YXorV3VYdjRtajlmaWhUdFdKK1pLemlvWlNUb1hkeUg4ZE9YZk5aYTFlS2k0?=
 =?utf-8?B?V05IMzdXeFlyandsZkNyUXd1bzdlRHh3dW5pcDlnQlJyWlRZYWNGaGVjSGp5?=
 =?utf-8?B?SWlWZHpzdDkrUGQ4Z2R4aVBxOTR3NFpTNFRsMGcwQzJhaUVIRmljSHpJcnI4?=
 =?utf-8?B?TWhEblMzZHhLcy9ybkRZTVMrbVFLQUx0bkdITUxZZGJwRlAzaUVFYnJHdHVK?=
 =?utf-8?B?WDhtcnlZRjd3amZEQnN1U1JoRGxqdFZOOStDU1dHSnlFSytuKzYwLyt1YzNE?=
 =?utf-8?B?S3pxR1hBbnNRVVFkQzM1WlI0L2FNSGRRVzhXVzNXQWdjTTNjMlFCL3lKRWkw?=
 =?utf-8?B?WTRZR3BvQXVYdmRhNEtnN3ZCWkpQVEFQdGRuak5Sbm5GdGM3T2ZtOW1MZXZP?=
 =?utf-8?B?dVpjOVNIUDRneGRTdjVlWFNPRm0yRHAvNE9HZG9KYWIvZWE5RGYrYnYxK0RB?=
 =?utf-8?B?Vld6NWxvc3dFRHd5czQ0WWJEd0lDU1R4eVd6TXZ1T0lZYjhmdE9SeVMvdTB4?=
 =?utf-8?B?ZlJHaGhJQlZUZmF0THBGcE1jcXMzZy9pZWI0RTVPSEtaR3Q4S3RBS2Jhb0Fn?=
 =?utf-8?B?RDh2VG5OdDVPYjNqQ0VEN0JmcnQ5b3dGazhTZEJuT213bDZhVEwrckpxUDBZ?=
 =?utf-8?B?aGM0UE0vUCt6eDFkL25zUXVGYmZ1NTkvQkZsOEVPbUtvdDkzeTNKUU8yNjA3?=
 =?utf-8?B?a2tQR2lpWVB0VlozbkVRL1NrM3d3Rkwvc0U1R0xXelpzTmpxcklxZ3RxNzRU?=
 =?utf-8?B?WWZjbnpwRkxrdEZaeTM3bnMrYXNkTXJ1UmE0WjQ2SWgyeEpvUEF2TUl3Mm1Y?=
 =?utf-8?B?Z1RPb3FnRUx4Q2g1Y0NVdDlxdkFMZ2NaYWxlTGVML0RmendNY2JuMDhseEt5?=
 =?utf-8?B?d0FqRHVoRzl1YmtLTmRBeGxuaW5VKyt3WGVwemtRd3NjK3VTTUl1VkZWY2lQ?=
 =?utf-8?B?KzYzSDlzc2FWU0l3VUErVjZmZzRmRGNvV1cvVGkvQUtISHAyWTl6WVJ5cXVt?=
 =?utf-8?B?OHgvYUMwaS85aXdsTFE5TFV4YTF0ZzZtd2xaRHNRbkY3M1dMVDBXcnl0ZTRT?=
 =?utf-8?B?M3hoMHBRTHcvWTh5dnlMMyt2RldTbHRxUkxYS1M0WjRLaDkzM2o1bGhzbHR0?=
 =?utf-8?B?a2x3d2hneHoxU24yWHd1NHFoalJhVHphZXRMSE9IMVBwVlI5ODU0VXcrMHhN?=
 =?utf-8?B?M1NNRU1TWS9qb0ord3l6UisrL2NyZlhVaEZsdkt5UEpmMWxLZUZHdzVsRW43?=
 =?utf-8?B?UDBEM2NzNERvVWtCUGw3NHB3aWdWZmg1T01vL0xMV1NjWmJ1cWg2VmdMcFNW?=
 =?utf-8?B?MjhIeU84VkEwZUtoUlIrSHQydGp0YnpndDFKNDR4ZnMrT2txd05yN0o5c2FK?=
 =?utf-8?B?NnVlYnErUitQdG9GdEh6Q0UyUVFjV1JROW1rdzZoK2dGN09zMFNaOXE2Q3ky?=
 =?utf-8?B?czZEMituaVpnUUtvYzdobVVRanhRVitsUWlvd0ZWd0JoQ2FkVzZwWUlGb2dZ?=
 =?utf-8?B?VUQ1dWRJVjZTa2NNK1pDakpZb21DUTJWcXVSSnd6VmpuT2c1WVJSQ2Fkb2FR?=
 =?utf-8?B?S0xvMHVyTC9YSFIvTk52TzBSeEE0VE9ydHZCMVVrMDA0dkNRL0xxOXdBZkJ0?=
 =?utf-8?B?ZXF4eXpocm5aZlNuaHFtQU5GT2oxSVdhb1hnWm0zZXJObVdmMkQ3Uk81NU9M?=
 =?utf-8?B?d2lpZEtOdGVpYS8yczRjTlFvako4NGk3QzNJL3JmMUdvZkY4ODF5UzJDR0lG?=
 =?utf-8?B?a3VONTA3TW54dmt3QVZwMmlyQmQ2aVlhZGhDVlRSRThwMVhRZzVRb04vbldJ?=
 =?utf-8?B?bmZBZjlteDJ6Vk5ZRWRCOXY5VUZWanB6QUxnOXY0UWcwZXJsWU1HQXduMkFi?=
 =?utf-8?B?Y0J3TDRIdUErM3Q4bTdoQklFS3B6N3FwYzFNOWltbW5STmVkOHExR1dQeGlj?=
 =?utf-8?B?SnhmazI3U0c5NE5keGc2SUNlbnV0OHhpL0dHL1JiTXFzQ1cySngxSDJqdm1E?=
 =?utf-8?B?TFlMZklOT2VtcTJaL1R5MU5NV0dQZkVNQVQ3dEcvMEVXMnpGbWpqczRDTjJD?=
 =?utf-8?B?MERxWXAvWTFXcnZYZStiNnB1eFQ3alRiUWpUN1RiNFh1TjVmQmRheW9UVmJa?=
 =?utf-8?B?aGFWcUxqc0NPQitsY21PcWIwOUc0RHphMzZ3SDlWeUw3c3Awdm5ycGdqM0hr?=
 =?utf-8?B?T3R1RWxVRjg5ajJ4Wm9OaWw3eUh0VGdsdTJwV0lscWRKWnA5dDRTSWJySlY3?=
 =?utf-8?B?THQxN3k4MDZTZDB1UWsxWXVXZmF0WWRxeDNsam5EaTd1MkdjZXNkTVZkb3Jn?=
 =?utf-8?Q?g541iWqAcS50CTJY=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 529191d3-f913-485e-5705-08de78033287
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7736.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 02:27:06.5046
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TyB9uV7TB9WnpBStmOiuGPOb6q/2O8W7oAVTEAJ/B/X01rEjmK4WXbjSfsqp8aKUOYsa92/1iGZeZy2CMLVF3Zz0K47850kl6lHCARYJdaY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7967
X-Proofpoint-GUID: S04bGO0ax-c2pNNuo-mvnPuYOIFN46Fg
X-Authority-Analysis: v=2.4 cv=Of+VzxTY c=1 sm=1 tr=0 ts=69a4f57d cx=c_pps
 a=ZIPBhjw7PX4DPdPA1Kx5nA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8 a=7CQSdrXTAAAA:8 a=SRrdq9N9AAAA:8
 a=_jlGtV7tAAAA:8 a=wbCC6A_VFOts2DV_r1IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=nlm17XC03S6CtCLSeiRr:22
X-Proofpoint-ORIG-GUID: S04bGO0ax-c2pNNuo-mvnPuYOIFN46Fg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDAyMCBTYWx0ZWRfX1EEC6EmIVN8q
 ppmRhfK9nVlHkqfFwrY5c6OahHmaCbE9/YYZ5VMxx0CmRBi7+++wYbWh7/PN8T/R0L1f5JFN8iL
 aw+df/xc1VcL1UZTsUpTgdgnd3ZfxkbwhoHn0fV5s7W9XT6nJvXSHcjmWcW6hPLXrRk246Zz1X6
 M6vRlxQjGO4yYfmmm3N1o4yz/seY4/7MyPvw7VuxNQUycv2N5FHev+XBHFH/g/1HxyBDWcBMNo2
 KvtSQSUZE3B4cAPTZbbPwdiRTgl2Iegr+W05mtI80CMS7oWyjvhXEPj3J9PcUOXZvDF/o2YYuIC
 yzFR3BFv8LCrKCFg9mcmzn+kkj3bFBxRJa1Iq7wByhJa6KgHuwpxFuG3/seTiiGnOnJWMKTEvZs
 T0WvjxavwAFbqD8DjXFe9e27gv4Ns9QNbJHTAnkU21qG26wtp3k/aQkTuzRaHCGvmCuEhinhhuY
 oNGjGxuIXka6E0rlv7A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_01,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1011 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_182727_666149_8C8ED061 
X-CRM114-Status: GOOD (  22.45  )
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



在 2026/2/28 上午2:53, Catalin Marinas 写道:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
> 
> Commit 143937ca51cc ("arm64, mm: avoid always making PTE dirty in
> pte_mkwrite()") changed pte_mkwrite_novma() to only clear PTE_RDONLY
> when PTE_DIRTY is set. This was to allow writable-clean PTEs for swap
> pages that haven't actually been written.
> 
> However, this broke kexec and hibernation for some platforms. Both go
> through trans_pgd_create_copy() -> _copy_pte(), which calls
> pte_mkwrite_novma() to make the temporary linear-map copy fully
> writable. With the updated pte_mkwrite_novma(), read-only kernel pages
> (without PTE_DIRTY) remain read-only in the temporary mapping.
> While such behaviour is fine for user pages where hardware DBM or
> trapping will make them writeable, subsequent in-kernel writes by the
> kexec relocation code will fault.
> 
> Add PTE_DIRTY back to all _PAGE_KERNEL* protection definitions. This was
> the case prior to 5.4, commit aa57157be69f ("arm64: Ensure
> VM_WRITE|VM_SHARED ptes are clean by default"). With the kernel
> linear-map PTEs always having PTE_DIRTY set, pte_mkwrite_novma()
> correctly clears PTE_RDONLY.
> 
> Fixes: 143937ca51cc ("arm64, mm: avoid always making PTE dirty in pte_mkwrite()")
> Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
> Cc: <stable@vger.kernel.org>
> Reported-by: Jianpeng Chang <jianpeng.chang.cn@windriver.com>
> Link: https://lore.kernel.org/r/20251204062722.3367201-1-jianpeng.chang.cn@windriver.com
> Cc: Will Deacon <will@kernel.org>
> Cc: "Huang, Ying" <ying.huang@linux.alibaba.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> ---
> 
> Since no-one posted this as a proper patch, here it is. However, I could
> not reproduce the initial kexec failure, so for me kexec is working with
> our without this patch.
> 
> Testing appreciated before we decide to merge it. Thanks.
Tested this patch on latest source with nxp-ls1043. kexec working with 
this patch, here is the log before and after the patch:

root@nxp-ls1043:~# uname -a
Linux nxp-ls1043 7.0.0-rc1-yocto-preempt-rt+ #1 SMP PREEMPT_RT Mon Mar 
2 10:06:01 CST 2026 aarch64 GNU/Linux
root@nxp-ls1043:~# kexec -l /boot/Image
root@nxp-ls1043:~# kexec -e
fsl_dpaa_mac 1ae0000.ethernet end0: Link is Down
Deleting MTD partitions on "spi0.0":
kvm: exiting hardware virtualization
kexec_core: Starting new kernel
IRQ66: set affinity failed(-22).
psci: CPU1 killed (polled 0 ms)
IRQ66: set affinity failed(-22).
psci: CPU2 killed (polled 0 ms)
--- HAGUP HERE ---

root@nxp-ls1043:~# uname -a 
  

Linux nxp-ls1043 7.0.0-rc1-yocto-preempt-rt+ #1 SMP PREEMPT_RT Mon Mar 
2 10:18:17 CST 2026 aarch64 GNU/Linux 

root@nxp-ls1043:~# kexec -l /boot/Image 
  

root@nxp-ls1043:~# kexec -e 
  

fsl_dpaa_mac 1ae0000.ethernet end0: Link is Down 
  

Deleting MTD partitions on "spi0.0": 
  

kvm: exiting hardware virtualization 
  

kexec_core: Starting new kernel 
  

IRQ66: set affinity failed(-22). 
  

psci: CPU1 killed (polled 0 ms) 
  

IRQ66: set affinity failed(-22). 
  

psci: CPU2 killed (polled 0 ms) 
  

Booting Linux on physical CPU 0x0000000000 [0x410fd034] 
  

Linux version 7.0.0-rc1-yocto-preempt-rt+ (aarch64-linux-gnu-gcc (Ubuntu 
11.4.0-1ubuntu1~22.04) 11.4.0, GNU ld (GNU Binutils for Ubuntu) 2.38) #1 
SMP PREEMPT_RT Mon Mar  2 10:18:17 CST 2026
Machine model: LS1043A RDB Board
> 
>   arch/arm64/include/asm/pgtable-prot.h | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/pgtable-prot.h b/arch/arm64/include/asm/pgtable-prot.h
> index 2b32639160de..f560e6420267 100644
> --- a/arch/arm64/include/asm/pgtable-prot.h
> +++ b/arch/arm64/include/asm/pgtable-prot.h
> @@ -50,11 +50,11 @@
> 
>   #define _PAGE_DEFAULT          (_PROT_DEFAULT | PTE_ATTRINDX(MT_NORMAL))
> 
> -#define _PAGE_KERNEL           (PROT_NORMAL)
> -#define _PAGE_KERNEL_RO                ((PROT_NORMAL & ~PTE_WRITE) | PTE_RDONLY)
> -#define _PAGE_KERNEL_ROX       ((PROT_NORMAL & ~(PTE_WRITE | PTE_PXN)) | PTE_RDONLY)
> -#define _PAGE_KERNEL_EXEC      (PROT_NORMAL & ~PTE_PXN)
> -#define _PAGE_KERNEL_EXEC_CONT ((PROT_NORMAL & ~PTE_PXN) | PTE_CONT)
> +#define _PAGE_KERNEL           (PROT_NORMAL | PTE_DIRTY)
> +#define _PAGE_KERNEL_RO                ((PROT_NORMAL & ~PTE_WRITE) | PTE_RDONLY | PTE_DIRTY)
> +#define _PAGE_KERNEL_ROX       ((PROT_NORMAL & ~(PTE_WRITE | PTE_PXN)) | PTE_RDONLY | PTE_DIRTY)
> +#define _PAGE_KERNEL_EXEC      ((PROT_NORMAL & ~PTE_PXN) | PTE_DIRTY)
> +#define _PAGE_KERNEL_EXEC_CONT ((PROT_NORMAL & ~PTE_PXN) | PTE_CONT | PTE_DIRTY)
> 
>   #define _PAGE_SHARED           (_PAGE_DEFAULT | PTE_USER | PTE_RDONLY | PTE_NG | PTE_PXN | PTE_UXN | PTE_WRITE)
>   #define _PAGE_SHARED_EXEC      (_PAGE_DEFAULT | PTE_USER | PTE_RDONLY | PTE_NG | PTE_PXN | PTE_WRITE)


