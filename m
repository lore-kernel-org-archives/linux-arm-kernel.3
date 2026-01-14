Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6D8BD30CF5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 00:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wk1MtC65BmzTTj4u6OLX9Z1CSSD/bx5Qfl3TBNC+yNI=; b=dohIzfmyDQxVB01rXu19bo2uiu
	0ZHUox5GM9gUvpcwTIBkuR3uKgNBGh2mHibBIVhRAwnbYQyr4uYqWIiw1iX1e66YGDPb7I9lfJe3A
	qqE4c9QkfKI15mWe5kKJMCuhsxj9FAsdHtzLRrEoq7ihimVnSZBSB6zKMVGOLfdU+/sAKqFub8Ka+
	LmK4kEjLVVQ8z60yedmWEwgHg/aTAUMPQ/4HJ5U6nzSDWwwcBoXNAdT2hu5iOFS6WgPMMWSlDkiL5
	3PbWpYPVUeSJQYl15gmPUaj6VLIbL2TZNDt/sMiEri4E9yOuuVoyz+SkzbEOd2jiPkBGq2CQIPTmo
	XDVXg+Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfos1-00000007uk5-0sbE;
	Wed, 14 Jan 2026 00:36:21 +0000
Received: from mail-westusazlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c001::2] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vforx-00000007ujZ-48OG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 00:36:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PeVIFur2VBgNCqtGoXm90osaNu8dLdqnU27e3HD+o06Lw6jOawbOv7uuH5iuIrZoHb/Z2GnbcEk3izRwpwfReGNlkIfd1bv8FfpK+pBEq+F8ZhaBVHkjc7+QFgpbeCIedA6KA5RvYspLBTIvsKahr4fBniIai3aC7tNG1O0zGfF1jeF4JdAwbXnBOeaKTVVT162loSnkC6cAQYiqaCinPheNCPgDWmRYPJ+EFvvSf68bAwaHVYOlcOfjHrTfPtrtjXa/A2kfFymrwI2v7dNrikU34HrdRyexYGRdbSsg/tcQ0Hbz4QkBZkF71fS3WGYBPxQu7bBMfRJTHhuTm44e1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wk1MtC65BmzTTj4u6OLX9Z1CSSD/bx5Qfl3TBNC+yNI=;
 b=TyiPrlEhvm9uxRkuVumI5qjyH9075dN29fLleTcsyg++INM5qFiIdXL8oHSY0kHyYcS6icdVM7PfIS0I/41omaVd1Od7rqKNn0tkiB1/eoNbrkki6LGWUpYzSaYSMDXXLWa6QbxDyqkuzsO6Q8zaIagz3lLzbamknQJC93+Dmj6wZnz+EAbyd0smyatFvFCw2vjmCEUxWGgLW4UcfelGG99PRDKjn4GOEmHGg8cbcK7krF2Oda3CLGCELhD919ECUko0aRutYDRn3PSh7I8tEVTtsrTD3/Q91agZIHq+iV1/nqfoiYpJNjzHJqOU7R22CTBVi3ZywJYvUDyjIowdfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wk1MtC65BmzTTj4u6OLX9Z1CSSD/bx5Qfl3TBNC+yNI=;
 b=ALNculwIfoe/gTFXf8nvVyNb8aD50ENDmOIbAY7BQQ5GahT33mitl/ZzV1a3dq/3JgWm51PjiYUgRhpXEhzTg9DQwR6wjYqzuoFfj5j5fro6bL4NoRuEVZLkuokAuMqF9OgkxY7nVaZl6N1LMleSA98gS1Ak0tXCZxJA3Ch3OIo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 DM8PR01MB7015.prod.exchangelabs.com (2603:10b6:8:18::5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.7; Wed, 14 Jan 2026 00:36:11 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::46eb:64a3:667c:c1a0]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::46eb:64a3:667c:c1a0%4]) with mapi id 15.20.9520.003; Wed, 14 Jan 2026
 00:36:10 +0000
Message-ID: <5f1bfe55-454c-40d5-ac45-1aed651b3747@os.amperecomputing.com>
Date: Tue, 13 Jan 2026 16:36:06 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [v5 PATCH] arm64: mm: show direct mapping use in /proc/meminfo
To: Will Deacon <will@kernel.org>
Cc: catalin.marinas@arm.com, ryan.roberts@arm.com, cl@gentwo.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260107002944.2940963-1-yang@os.amperecomputing.com>
 <aWZYXhrT6D2M-7-N@willie-the-truck>
Content-Language: en-US
From: Yang Shi <yang@os.amperecomputing.com>
In-Reply-To: <aWZYXhrT6D2M-7-N@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0208.namprd05.prod.outlook.com
 (2603:10b6:a03:330::33) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|DM8PR01MB7015:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d4fd4c1-c02b-4359-a08e-08de5304e9ac
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c1hRVUlDam9VeWJpWVJHUW04aDY5MS9yUmN4bU5pNit1YVFiWmxQcDZoeHFY?=
 =?utf-8?B?a3JzZ08wREtIK2ZpOTUwU3cyLzlKMERZaHg1Q2ttZFQvNDZvelZqZng0RlBu?=
 =?utf-8?B?MFo5SkVGSVZJUkxqVWVOTzlrVnRuU0s0dmlkV0dPMmV5S3JjekdHYnZ3emxO?=
 =?utf-8?B?K0hmTENxa2NheEViOVRjSHRpSnBadCs3ODIvTGplc0dNdDhDWXpidTVhZ0tp?=
 =?utf-8?B?elY3UGt2ZzBDYXgwUTNPdDA0RDE2L05OZ2JGMEo5dEh3UlN6S2I4c29SZ0I5?=
 =?utf-8?B?S3NxdEswOEFKekFhL2RqZzhUTG5acWszR2Vuc3RQcUJYVFNlbnVneElTN1Z2?=
 =?utf-8?B?dGZuZGd4L2taK3ExOXRyeEJvWlBhU1E3V1o2ZlVGWkRHbUJJcHJidzhRMXIx?=
 =?utf-8?B?ckl1cjZUWVdXaU1kWEpPZXBRZE54N3FpMnFTaG9ZS2JXajVZWjhNMDVJdGEv?=
 =?utf-8?B?a0N4MWFwYWRKUngvZEdMaVp2RDJJazV0UStRNTlleGRNSmg1OTFFTU9zVUts?=
 =?utf-8?B?R2NEa0xPbnUxMzBFM2duemplMzRZcmV1ZUhIazdsMjJJdkdJTitSWjh6U0x6?=
 =?utf-8?B?b3FpY1pYY1VwYzN4SGIzOUpueGIvWDV0eVNYWVN0WTRLcVpkaWRPVEp4WWor?=
 =?utf-8?B?WnVKakhSQTJiaHRoV2V1SEFrZWI4ZU0yVmtkUlYxcHZWZGQ3YXFFRUhtWEJt?=
 =?utf-8?B?SCtHUkhVaTJoZVl1enVDc0FXN1BnMXFnNHJ4d3pkL2pvVmFreHBsYldUVG5B?=
 =?utf-8?B?b3F2SG9GdnM5ZzBOM1hzMndiRFdneGM3YjhTaVJoVVY3Ymd6NXNrcTBqeG1s?=
 =?utf-8?B?N1QrbDhjTlVQVWlWMUNESXBpcm1BVytqaFEyYWpseGpOWWtteEE3UXZ2ZVAz?=
 =?utf-8?B?U2ttcVZSQ0I0Nit3LzdWWDVWMFlOdjd3NktIR0dyU3FtRnJTVkNtdzZCaE16?=
 =?utf-8?B?ck03MjZCSzVQRTFyYzNTMEVkZ1l1VVlqd2g1dmZ4bkNnRE5LWUpYQ2tYeFhX?=
 =?utf-8?B?MG0remRFM29FbHFwakVDMlk3bVphMWJBTTIrZzlvMEl1ZVlqYms0ZVNBbTUz?=
 =?utf-8?B?dTNQelFTWUZseFhJL1RuZXM4cmtpKzRNNjEremdoZGNXWXBXeEJRdFl1M1pt?=
 =?utf-8?B?dng0a21uM1dudzBrRVpkdll1cjQrS1JTOUo3NytEM21IM3NmZFVLS3Fla1dI?=
 =?utf-8?B?UVRBcytCK3Vud1hqMWVBTUdTVWRXZ3QxV1U3UU9YcjFqV3hlQU1vcmk3L1RQ?=
 =?utf-8?B?akhsSzJ4SERtVWdFNjNKWGhaMzlPMUhzYzdPU1FZcjduZDQvTEIzUXo4TENj?=
 =?utf-8?B?MVMzRWFCQVZyUHBiUmR2NXFnbGx0YWFxQ1R4U0NHYTJ0b2kzdE0wa0p6ekM4?=
 =?utf-8?B?T2RkemNmNm9CaVVoNU40V3RBVkJhczlhTkRmUDNoUi9sc0lqTStobHRmckIy?=
 =?utf-8?B?TGplSXpQckpyM0ZiS3lYWG9PRFNmVG1UbGJpWmk1cjVBYWhMdG5uRjlDbTlz?=
 =?utf-8?B?SjNsWGVwNlpEc0F2Ky91TE1tYi9OYTdMaSt0LzMvc2d2cllvRVRJc3lYMkhn?=
 =?utf-8?B?cW05RUNROGVJZUVyQlFMb2liRHF5ckRVUUl4TmxtUlJlNm03TlgzbndLUFVZ?=
 =?utf-8?B?SFNGK282UTQxSW92ZmYyamdPNzNjT0dialBMamF4M0wwbU5rZzZrTVlyaktw?=
 =?utf-8?B?YlpFSElYVERGQkpPb09iVWtvVGxpQ0E1VlpCZDByTEY3Y3hUM0RtSUtoTy9S?=
 =?utf-8?B?SjZ3emkzeDB6eno0RmhUUHR6TUJSblhyNkRQME5TU0NreTRiRlgzM3dIRkF3?=
 =?utf-8?B?WndVQmdmY2VsckVKZk12dkVjc2FaVnIzQUJVdU40WVlCd1I3aGlsd1ovRlFG?=
 =?utf-8?B?WnBuQk1ERDlVQWw5N2FHU2dUcVpwMGxKV1dQbTVmVjBwaWFJcS8xQjVjZTgz?=
 =?utf-8?Q?NY7yKyhGTzkZl3ZZdSIKYpyHAwoXtani?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bEFaMzE3M1o3eStBeW9IdEJiVHJBdlJyVzBGSzdDM3ZodFpOQUZZbGV1aFdL?=
 =?utf-8?B?eVpMdWZ4RUU3cFVmQ1ZWNnNLSTl5RW1xQXRzaExkYmNxaSt0aWRrOXpkMXkx?=
 =?utf-8?B?UUZOQy8rdDBLbFdZbkp4YkpXRXhFZEZLQU80ajNiSG13djltZ2Y5OUlzNjhC?=
 =?utf-8?B?NVVjc1h0b2JaV0FuL3JpaUptL0FUaHJla1l1TCthTW0rZldJeHlqMWlEdW9x?=
 =?utf-8?B?T05LUUxuTiszcmxjNVhjK1lRdmNGbVo3RTZYY1ZJMXcrZHlsMENHVXA3TEZ1?=
 =?utf-8?B?VWtzSG15UFFTWmNvZ3BKSzQ1Q0xhSjFFY216QnJzd1pjVFZ6UE01dkNjVDlu?=
 =?utf-8?B?NWtlWk1TZzZEejB3UlFsVFI3Rm9oSkd5eEZpa29BN2xoclBlYkpmdWFERG5h?=
 =?utf-8?B?SjFBN3FPZEs3Z0xoSkREMFhIcVJ5R01TOHpTOUV1bWRxVnQ5cmRFbVp5VjFk?=
 =?utf-8?B?UEx6eXVsQ3B1KzhncFVwdTVqeGNlRkNzZDRSdm82SEptckd2eEpQYW5sa3d6?=
 =?utf-8?B?L0dXeEN6ZFpMdmZkTlhWUGFXbUJDWW45eEdKd2c3a21BNHh5RkdOa1FtemVw?=
 =?utf-8?B?SkI2akNLSWJTZUVoRU5xd1AzdUZjQnRET0JQaXpMaHZvSUlrQWVZVWx2NzAr?=
 =?utf-8?B?dDZhZFN0QjFVNnJCWUtmeHBpYlZtMVlHck1KY2xvckNXOER4WXVnTFhjSTJG?=
 =?utf-8?B?Q1d5cFAvZ3RqZUkvN2k3NlNZSXc0NGg1QmxpcGlxakNwMURvT04xS0NwVEU3?=
 =?utf-8?B?bTNYcEEvSzdQQ0swbmdXc0NaeDN4NjFEUklMeDhwa1pOSForWitCTmhqSDN4?=
 =?utf-8?B?MmNlVUlPMEcrWi9PQkp2TW1zM1FVNGx2dXFRT1hMY24rOExSajRhWmlSQ0tq?=
 =?utf-8?B?Tzg3YTN0bzFabFBHUFJya2s5VUVVM0RYZ1RhVEZId1lHcjhOTlY2QndsQldB?=
 =?utf-8?B?d0RSL1FWbFRqM0kxOUpFVGFOZjJHU0dlbkt4Tm1GSERmNTcwSEQ5eWkwSDVT?=
 =?utf-8?B?LzU4YVRvbExKaktxV3lwYXU2aWNoNjhkdlUrUmxNS0xDQlhGNStUTEJha2xl?=
 =?utf-8?B?akpCRFFXOHhDcnhyOVloa0RVK0JGMkFrL1ZJTDlHOHNBQ29ST3NRd3ZGWSt3?=
 =?utf-8?B?S0Jja2IzU21xRDlDeWhveGFzZGQzZlIrN3Z6ZUppMld4bWsxenVnN0lBTW5Y?=
 =?utf-8?B?RWJkNDR6NUxDeFo3bEpyTEJzTllNMW1NZ1ZBTFBTdHVtKzZ4OXQ5cEt1V2ZH?=
 =?utf-8?B?QWVZVHZMNk5QWXpLRW14Qnc3ZDJjcWhiN3Y3RWVmNG9Kenpwck9XYXBmeDJM?=
 =?utf-8?B?UGJQalAxcXZ0V1M3WG1BbnVXR1FPMEpSN090QnJmbmFGcTFVeDNDT0g1Wks1?=
 =?utf-8?B?TGcyek16VlptaW1HYUJ6QlEva202RTVNdkRlK1ZPZUpad2dVeXhMdEtoUjBy?=
 =?utf-8?B?NVhmSmVsclhaV0tRamdhVk5VUDJkcTMyem9zbGNTZ2RvTjdZTzBPNE1oQnY1?=
 =?utf-8?B?UmpVc0o1OGVHdUtWaHpzaVJtSzdrSkQ5YmR3NXROKzhsU3JkaW9CUmw2QVhS?=
 =?utf-8?B?U29MUmZWTWlUem1zRnJSMTRIMFVEb2VPRU9LU3Uxd1VlaUdmV01mTE8xaUJl?=
 =?utf-8?B?UU1DcmJOa05UZzZESUU1VWJkdm54cjZ1QUVRbVR5bTdVYTVnZUJYdE4ycGdR?=
 =?utf-8?B?eUtpVllSU0tOcEprV1VWenpoVkVaZDJxUkM0WlRlNnhRTnhyQkh0cFZmaVhk?=
 =?utf-8?B?QXRybDdhQ1gyVTBuSi8wNnY5UitVVmlmeFdjdWdjbjZNQlNRQzB1ci9lbU5Q?=
 =?utf-8?B?MXBEOCt3a245ZWlaZFdoZUNiUEwrVmZFbU5SV0JjMk9BUjRaN3YrWjZac1E4?=
 =?utf-8?B?UjBFU05pVlpncDcvZmNQdjUzQmV5cko1b0RUaVNDbE1TaVVUTy9LNW5aUFBa?=
 =?utf-8?B?VWxXRnM3eE9rQ1JvenY2cENEMkFsenJvQlJWdGs4cjdHK3hlVkY2M0c5TjE3?=
 =?utf-8?B?NTdCemNybmVXUUFOYWtnUE5CNE82MFlkbWZhN2VheFh6cGlrd3VMTDFFUFhO?=
 =?utf-8?B?WkFQMkRmUlFNQ09HdllydmYvYVMzc3JJVzhzVVRNdTBmMHpmc0hPcFE5b1Qx?=
 =?utf-8?B?MS9oLzZoL1h1MHJva0NISU9aUSsrK3lDUTdidkgxaG5IR2dYbWkrZno5ekRl?=
 =?utf-8?B?aERzcjYxOUtWTE9QTHE0S1ZTMWRtWHl3U3RPdStTOUN2eWhJdUdVVzFMT2lT?=
 =?utf-8?B?NTdVd1o4bk9aWXlHWFMzR3dEUDRqQnhzMXp0UnVrWDdEa1ZqTGVWT005WkN1?=
 =?utf-8?B?TSttYzdaZHc5NUZFVTlGSHUyWkNJRUZxTzNGUS9xRmZpMVBpNkZ3Qk1JT3JN?=
 =?utf-8?Q?zWS/4h/O+E0Vb7DQ=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d4fd4c1-c02b-4359-a08e-08de5304e9ac
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 00:36:10.0850
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sNyjGh+VsKTJwwFmE5p/DO6mlq1UYBT499wZDLN32LzrDExG8AaZr+x2dPTQmBI022keY/QpMBxUShlf9XERA0A/4rCCDyPfpLPjUZAFUfI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR01MB7015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_163618_043373_71488BF7 
X-CRM114-Status: GOOD (  23.98  )
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



On 1/13/26 6:36 AM, Will Deacon wrote:
> On Tue, Jan 06, 2026 at 04:29:44PM -0800, Yang Shi wrote:
>> Since commit a166563e7ec3 ("arm64: mm: support large block mapping when
>> rodata=full"), the direct mapping may be split on some machines instead
>> keeping static since boot. It makes more sense to show the direct mapping
>> use in /proc/meminfo than before.
>> This patch will make /proc/meminfo show the direct mapping use like the
>> below (4K base page size):
>> DirectMap4K:	   94792 kB
>> DirectMap64K:	  134208 kB
>> DirectMap2M:	 1173504 kB
>> DirectMap32M:	 5636096 kB
>> DirectMap1G:	529530880 kB
>>
>> Although just the machines which support BBML2_NOABORT can split the
>> direct mapping, show it on all machines regardless of BBML2_NOABORT so
>> that the users have consistent view in order to avoid confusion.
>>
>> Although ptdump also can tell the direct map use, but it needs to dump
>> the whole kernel page table. It is costly and overkilling. It is also
>> in debugfs which may not be enabled by all distros. So showing direct
>> map use in /proc/meminfo seems more convenient and has less overhead.
>>
>> Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
>> ---
>> v5: * Rebased to v6.19-rc4
>>      * Fixed the build error for !CONFIG_PROC_FS
>> v4: * Used PAGE_END instead of _PAGE_END(VA_BITS_MIN) per Ryan
>>      * Used shorter name for the helpers and variables per Ryan
>>      * Fixed accounting for memory hotunplug
>> v3: * Fixed the over-accounting problems per Ryan
>>      * Introduced helpers for add/sub direct map use and #ifdef them with
>>        CONFIG_PROC_FS per Ryan
>>      * v3 is a fix patch on top of v2
>> v2: * Counted in size instead of the number of entries per Ryan
>>      * Removed shift array per Ryan
>>      * Use lower case "k" per Ryan
>>      * Fixed a couple of build warnings reported by kernel test robot
>>      * Fixed a couple of poential miscounts
>>
>>   arch/arm64/mm/mmu.c | 202 +++++++++++++++++++++++++++++++++++++++-----
>>   1 file changed, 181 insertions(+), 21 deletions(-)
>>
>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>> index 8e1d80a7033e..422441c9a992 100644
>> --- a/arch/arm64/mm/mmu.c
>> +++ b/arch/arm64/mm/mmu.c
>> @@ -29,6 +29,7 @@
>>   #include <linux/mm_inline.h>
>>   #include <linux/pagewalk.h>
>>   #include <linux/stop_machine.h>
>> +#include <linux/proc_fs.h>
>>   
>>   #include <asm/barrier.h>
>>   #include <asm/cputype.h>
>> @@ -171,6 +172,85 @@ static void init_clear_pgtable(void *table)
>>   	dsb(ishst);
>>   }
>>   
>> +enum dm_type {
>> +	PTE,
>> +	CONT_PTE,
>> +	PMD,
>> +	CONT_PMD,
>> +	PUD,
>> +	NR_DM_TYPE,
>> +};
>> +
>> +#ifdef CONFIG_PROC_FS
>> +static unsigned long dm_meminfo[NR_DM_TYPE];
>> +
>> +void arch_report_meminfo(struct seq_file *m)
>> +{
>> +	char *size[NR_DM_TYPE];
> const?

Yeah, it can be const.

>
>> +
>> +#if defined(CONFIG_ARM64_4K_PAGES)
>> +	size[PTE] = "4k";
>> +	size[CONT_PTE] = "64k";
>> +	size[PMD] = "2M";
>> +	size[CONT_PMD] = "32M";
>> +	size[PUD] = "1G";
>> +#elif defined(CONFIG_ARM64_16K_PAGES)
>> +	size[PTE] = "16k";
>> +	size[CONT_PTE] = "2M";
>> +	size[PMD] = "32M";
>> +	size[CONT_PMD] = "1G";
>> +#elif defined(CONFIG_ARM64_64K_PAGES)
>> +	size[PTE] = "64k";
>> +	size[CONT_PTE] = "2M";
>> +	size[PMD] = "512M";
>> +	size[CONT_PMD] = "16G";
>> +#endif
>> +
>> +	seq_printf(m, "DirectMap%s:	%8lu kB\n",
>> +			size[PTE], dm_meminfo[PTE] >> 10);
>> +	seq_printf(m, "DirectMap%s:	%8lu kB\n",
>> +			size[CONT_PTE],
>> +			dm_meminfo[CONT_PTE] >> 10);
>> +	seq_printf(m, "DirectMap%s:	%8lu kB\n",
>> +			size[PMD], dm_meminfo[PMD] >> 10);
>> +	seq_printf(m, "DirectMap%s:	%8lu kB\n",
>> +			size[CONT_PMD],
>> +			dm_meminfo[CONT_PMD] >> 10);
>> +	if (pud_sect_supported())
>> +		seq_printf(m, "DirectMap%s:	%8lu kB\n",
>> +			size[PUD], dm_meminfo[PUD] >> 10);
> This seems a bit brittle to me. If somebody adds support for l1 block
> mappings for !4k pages in future, they will forget to update this and
> we'll end up returning kernel stack in /proc/meminfo afaict.

I can initialize size[PUD] to "NON_SUPPORT" by default. If the case 
happens, /proc/meminfo just shows "DirectMapNON_SUPPORT", then we will 
notice something is missed, but no kernel stack data will be leak.

>
>> +static inline bool is_dm_addr(unsigned long addr)
>> +{
>> +	return (addr >= PAGE_OFFSET) && (addr < PAGE_END);
>> +}
>> +
>> +static inline void dm_meminfo_add(unsigned long addr, unsigned long size,
>> +				  enum dm_type type)
>> +{
>> +	if (is_dm_addr(addr))
>> +		dm_meminfo[type] += size;
>> +}
>> +
>> +static inline void dm_meminfo_sub(unsigned long addr, unsigned long size,
>> +				  enum dm_type type)
>> +{
>> +	if (is_dm_addr(addr))
>> +		dm_meminfo[type] -= size;
>> +}
>> +#else
>> +static inline void dm_meminfo_add(unsigned long addr, unsigned long size,
>> +				  enum dm_type type)
>> +{
>> +}
>> +
>> +static inline void dm_meminfo_sub(unsigned long addr, unsigned long size,
>> +				  enum dm_type type)
>> +{
>> +}
>> +#endif
>> +
>>   static void init_pte(pte_t *ptep, unsigned long addr, unsigned long end,
>>   		     phys_addr_t phys, pgprot_t prot)
>>   {
>> @@ -236,6 +316,11 @@ static int alloc_init_cont_pte(pmd_t *pmdp, unsigned long addr,
>>   
>>   		init_pte(ptep, addr, next, phys, __prot);
>>   
>> +		if (pgprot_val(__prot) & PTE_CONT)
>> +			dm_meminfo_add(addr, (next - addr), CONT_PTE);
>> +		else
>> +			dm_meminfo_add(addr, (next - addr), PTE);
>> +
>>   		ptep += pte_index(next) - pte_index(addr);
>>   		phys += next - addr;
>>   	} while (addr = next, addr != end);
>> @@ -266,6 +351,17 @@ static int init_pmd(pmd_t *pmdp, unsigned long addr, unsigned long end,
>>   		    (flags & NO_BLOCK_MAPPINGS) == 0) {
>>   			pmd_set_huge(pmdp, phys, prot);
>>   
>> +			/*
>> +			 * It is possible to have mappings allow cont mapping
>> +			 * but disallow block mapping. For example,
>> +			 * map_entry_trampoline().
>> +			 * So we have to increase CONT_PMD and PMD size here
>> +			 * to avoid double counting.
>> +			 */
>> +			if (pgprot_val(prot) & PTE_CONT)
>> +				dm_meminfo_add(addr, (next - addr), CONT_PMD);
>> +			else
>> +				dm_meminfo_add(addr, (next - addr), PMD);
> I don't understand the comment you're adding here. If somebody passes
> NO_BLOCK_MAPPINGS then that also prevents contiguous entries except at
> level 3.

The comment may be misleading. I meant if we have the accounting code 
for CONT_PMD in alloc_init_cont_pmd(), for example,

@@ -433,6 +433,11 @@ static int alloc_init_cont_pmd(pud_t *pudp, 
unsigned long addr,
                 if (ret)
                         goto out;

+               if (pgprot_val(prot) & PTE_CONT)
+                       dm_meminfo_add(addr, (next - addr), CONT_PMD);

                 pmdp += pmd_index(next) - pmd_index(addr);
                 phys += next - addr;
         } while (addr = next, addr != end);

If the described case happens, we actually miscount CONT_PMD. So I need 
to check whether it is CONT in init_pmd() instead. If the comment is 
confusing, I can just remove it.

> It also doesn't look you handle the error case properly when the mapping
> fails.

I don't quite get what fail do you mean? pmd_set_huge() doesn't fail. Or 
you meant hotplug fails? If so the hot unplug will decrease the 
counters, which is called in the error handling path.

>
>> -static void unmap_hotplug_pte_range(pmd_t *pmdp, unsigned long addr,
>> +static void unmap_hotplug_pte_range(pte_t *ptep, unsigned long addr,
>>   				    unsigned long end, bool free_mapped,
>>   				    struct vmem_altmap *altmap)
>>   {
>> -	pte_t *ptep, pte;
>> +	pte_t pte;
>>   
>>   	do {
>> -		ptep = pte_offset_kernel(pmdp, addr);
>>   		pte = __ptep_get(ptep);
>>   		if (pte_none(pte))
>>   			continue;
>>   
>>   		WARN_ON(!pte_present(pte));
>>   		__pte_clear(&init_mm, addr, ptep);
>> +		dm_meminfo_sub(addr, PAGE_SIZE, PTE);
>>   		flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
>>   		if (free_mapped)
>>   			free_hotplug_page_range(pte_page(pte),
>>   						PAGE_SIZE, altmap);
> Is the existing code correct for contiguous entries here? I'd have
> thought that we'd need to make the range non-contiguous before knocking
> out the TLB.

Thanks for pointing this out. I didn't pay too much attention to such 
details to the existing code. Actually I did notice hot unplug code 
doesn't handle contiguous mappings, so I added 
unmap_hotplug_cont_{pmd|pte}_range() in this patch in order to maintain 
the counters correctly. I'm not sure it is intended (or maybe just 
unnecessary) or just an overlook.

You are concerned this may result in misprogramming issue? TBH, I'm a 
little bit confused by the "misprogramming contiguous bit" described in 
ARM ARM. In this case, the TLB flush should remove the large contiguous 
TLB entry, so there should be no overlapping entries in TLB. Or this is 
still a problem because some entries have contiguous bit set, but some 
don't? But when we change the contiguous bit for a range of entries, 
there is always a moment that some have contiguous bit set, but some 
don't. My understanding is it is fine as long as there is no overlapping 
entries in TLB. Anyway I may misunderstand it.

Thanks,
Yang

>
> Will


