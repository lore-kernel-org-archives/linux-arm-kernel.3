Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F59BD1950F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 17:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g6aEOcOvhuS4ZGuZB/fqzQFdyQ7QN/WbBw98eDy7Gl4=; b=FzRxemuSNOAdEoyvpa9KrbFwhM
	aBHU8OurKKASyMJec5yQJ+Pw4s22L5a8xBvCzBqvsHg/5RIrKAwMPnBL8C3wlBgZQsguUUDZmJtML
	r1VNhyZ90YaXCdpYlVYWKBgcHCbGxAC67FcK9VgCN+93uED9A10DYqV+oXt2uOjy2OqjfWWI0gW/W
	EiNQaB6pHtazWxh87l1OCCltPPwIw7gQC19KIgk6UviZponhUKBZuOpI/wJwYs9seVGqP5Nv6S0Zp
	VaTQ8YZfnKiDIXV+V6JsE4CW+QYThtsqDtRQHbEaPdMp8Sn977rE2P2eTHNuFamSZvmbp7SjyHnDe
	D3e4eu6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkQsM-0000000D1aw-43hn;
	Mon, 26 Jan 2026 17:59:46 +0000
Received: from mail-westus3azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c107::3] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkQsK-0000000D1aa-0bQ8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 17:59:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tPYQRf7K0pmfpeQSohBay1V4pEBq36aheTLK+pKNmJjpyQVisA1r1N9Ci1X5KUAPi2Io6/3tLUzggT+b4GFvH2LN2oux8kRkJKo+5h/hGzdyrGPqt2J5vqQ5KOfYOq6oRRrn6rpbhCUbVirDyfJplnZ52UhNP+PsFCaVn8gLHPXcKE0h6Aa4w+fqlt24KgNDASkttkZzUjyK9DfRrq2Kh52duo+svG8xb1GTJXqbN6+Smmmxz1rz4t6brf1C/T4JM8bOUD9jzKqsrIzOil6y7AFnJEi11FvTqhr3Q+QGzOX8FttrQ7+vOGZcooVxKXu/wnR4xswPdq0OZ0j05Shl6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g6aEOcOvhuS4ZGuZB/fqzQFdyQ7QN/WbBw98eDy7Gl4=;
 b=ZMYueGnQCoc8PMqdMkl270GQyE8r5GTKuXDCjJkXLKgB691BQB9NCHwyQ86pUrVia7/qRRF0d+rDbnDNnR1e1MWhXJo8b9iCk2YxerMaXXoDrqgNgP9a5oWh08lHXJNoLhcb05LD2j/jUo2VxYSAp4Xnbfkr3sTASfvopIWekejnyNEob38rxAes7PxeCmttXuctB80gxbzppyJ4Wml65c/yXW0RatZIerzt/pcSJAD2e8tjyfbFi/5xQrDpm4/nhtlDKtnPIkU4ElmirPi8Cj725OCerH9Ptt2kLlRsRTJUCeCmMdGgniqlzQawvbFt0aZZsvqdDJnrf5mjALcJOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g6aEOcOvhuS4ZGuZB/fqzQFdyQ7QN/WbBw98eDy7Gl4=;
 b=rsdDXdnd4VeyTOtWA4IK9aWKDo3plyJLJlJQLD+J+MhMEXA2tksYMmWVo6nrs+aolBq/oYtDAKELG0l82/C0Oau1Cgmh51o6jucnT+yPU05vNUJTWdoUfcIl7GP/ln9hUNMNKdo2ZXTPXnjwDtXEs6Ge9Q3icYxQlyUQaKX1F+4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 SA5PR01MB994141.prod.exchangelabs.com (2603:10b6:806:47d::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.16; Mon, 26 Jan 2026 17:59:42 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::46eb:64a3:667c:c1a0]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::46eb:64a3:667c:c1a0%4]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 17:59:42 +0000
Message-ID: <4fd2ebb8-2587-4a34-9f29-f0daa3f6e08b@os.amperecomputing.com>
Date: Mon, 26 Jan 2026 09:59:37 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [v5 PATCH] arm64: mm: show direct mapping use in /proc/meminfo
To: Will Deacon <will@kernel.org>
Cc: catalin.marinas@arm.com, ryan.roberts@arm.com, cl@gentwo.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260107002944.2940963-1-yang@os.amperecomputing.com>
 <aWZYXhrT6D2M-7-N@willie-the-truck>
 <5f1bfe55-454c-40d5-ac45-1aed651b3747@os.amperecomputing.com>
 <aXd3ralBsv9hPtfe@willie-the-truck>
Content-Language: en-US
From: Yang Shi <yang@os.amperecomputing.com>
In-Reply-To: <aXd3ralBsv9hPtfe@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7PR10CA0008.namprd10.prod.outlook.com
 (2603:10b6:510:23d::14) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|SA5PR01MB994141:EE_
X-MS-Office365-Filtering-Correlation-Id: 43afee01-91e2-476a-d2dc-08de5d04aea4
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WUErem10SkF2a0RBcW1ndXV2RmVDK2FlR2wzSWM4Y3NITW56MVI4NlpVVkpV?=
 =?utf-8?B?UTZtRTVFbUhkV1QzaitER3B0UXlOdzYvbWMyM1dVbTR2VUh5cjlBNDdrN2RX?=
 =?utf-8?B?dzltN0tjdGt1MXk1eTNhSG1QaFd0RktBaVJwb1RIYzhucGJwbGUzajZETk1T?=
 =?utf-8?B?Y3AyeHd4RjRMTTEvRDRaQ2tFTzNSZ1JmYWF2aTBuOFFESFZiQjYyYnRRWTAr?=
 =?utf-8?B?YkIyRVBoMEJRNVBCcGpqMlJsVzBZcWZsVC90WTVsbGpHZzlOdzhFa1hPZ1Zw?=
 =?utf-8?B?eXlQMmNBMjZhYk96TGVjaVJGS2ZyOGZBaEFxNlJUTnZnTGV2emZwY0Vrb2tQ?=
 =?utf-8?B?UzdEdGQ0TE9HUFJsNVJBK0Q3R2lUQ29BUlNqTGlPQkphMmdJR1BTN056ZkFZ?=
 =?utf-8?B?U2gzU2wrZ0J2cTBYaU5oakZBazhIWjh0dnVjalVrNnVpTnlpN29wc1dTRXBE?=
 =?utf-8?B?L3ZVUjJqWWhGTlZ0MjVUSWtUMVl6U1RDTEx2NzZWY25jL0dheEtWSDJFUTBT?=
 =?utf-8?B?T2VIWm84TlpHbkxmZTNJZXh0ekNyRmx5NWNZSGhsRjVTM2tCaEJiZ01taWhF?=
 =?utf-8?B?VDFmNUtIdi9MNXc1bS9maTZqVjFJN25MTWViWTgxVytKemxYWVBzNEJONlAy?=
 =?utf-8?B?aFhlejE3WklFMVdYRDBvamtBcjl5aVk2TGFUYXM0NmlwSjZ0UDlwNUtoY0po?=
 =?utf-8?B?ampFdm1Hdk1BUFdneUpNSGc5Z0NHSXl4ZFY2eDAvVWIvY3FLeDZSRHB3RmR1?=
 =?utf-8?B?bnZpOU1lZng0SDdMN2pSNXRIdlJibGlPempxbmFaUko2cDkyeERFY0xvN0Uw?=
 =?utf-8?B?NDhDejNGUzM3NUlpU1ZQcEJBak1zSXI4eWh2NzRHdlJYOWJZR3pOZmFjUW1L?=
 =?utf-8?B?SG9TdHFOVnRwNkVBNUFpSzkzK0paenZBWElxcDFId0doUUFpNU45UDZoV29q?=
 =?utf-8?B?MEYzaHR3bXQ3Q1RHWTgxZGlORWh3ekh2MjByR3BJZEIxSnVtUWdoWmJISkN1?=
 =?utf-8?B?VXpqQWhIeFdVK3E3cUdXYUtJM3VSY0RKeUFQQmtkRmM2TGdJeEJTZG9lODhh?=
 =?utf-8?B?Mm1aTVU1WHRBK1pJU2dMbE9BTi9sSTZCbVFWT3MzYkw5UXU5SGU4cUhrSjVF?=
 =?utf-8?B?cnZSdUdXbUwrelE2Z0FsMHBIMjBJYTFWUURvQ3NpWDJvcHVXajEyYnJQY25E?=
 =?utf-8?B?T3FNZElIUklTUXFPcWNkYmhkTmZrSGVSaHJDbmE0UXl3WWtSR2NaNHM0REhP?=
 =?utf-8?B?NFVQNS8wZHFzY0k2MHB5WmhuSEVvQUR5TDRPcFgwYit2R1NSNzJOSm96bUFq?=
 =?utf-8?B?cEUwZnJOcm1ISTNkTUduQUR4Y09qZTlDQ3QvdEoxUkI5MFVuUFlweFl6bFZ5?=
 =?utf-8?B?MHRSL1JybnB4WkFNN1p4VUZwM3pHU3VuTWpHd3JhejYvUGljcUtUMEt4aDlM?=
 =?utf-8?B?RC9QTnpUaEhzMFgvOHNQWk53SHp5Wi9aSm5DOHdoYVRyZTgzMUVLMXRqclZ4?=
 =?utf-8?B?OFltc0F1ekV2MndISnZnK3QxMzNtVkx0amJBWlk5bzV2Y2V5SXdibGpOWW42?=
 =?utf-8?B?U0NoZUJIdWlQcW41Ri9RTmhpNTlHalEzS0R4RkdPcEtMdzc1V3Q5b0gvTFBR?=
 =?utf-8?B?T0kya0JOQlRjS2ZNdVNQaDZRVjdJak5VYWoyNHBaMEdmdVlyKzFMZFIvUDRW?=
 =?utf-8?B?ZWdzczFXZFhFcFZvSzg3b2pnZjhlNmR1RHRHTlJsYUFWT0paR0dqNVpaRmh2?=
 =?utf-8?B?WHdCOEVsSDA2QWczY3JKMmFoL2tYZGpaN0hqWk9Fa0MwR2drMmozdkh6cUVv?=
 =?utf-8?B?MDBmSXFCQ2FUcTh5UlZxYXozTWIzM0JaSzlNTyt4emtQMFhQcGxmVnBTMzcv?=
 =?utf-8?B?WmNBZTlwRXliZU1aZnppcnRXcVRuaGtVTkhzRTZLVTdEZmNaVlZQQXAxWUJo?=
 =?utf-8?B?WnpkUkh1M3orQ3l6YXhrakYxcmkyaFRVcGhrQktjY2VqSEdoci9qMno5RlMv?=
 =?utf-8?B?Z1c3QUt5aE1ZODFhcmd1WXowOWsxZ3EySFUzVGZ1SXJDUzVpQk5xeFBJYzRx?=
 =?utf-8?B?OEhZd0krck0zVWptMmhhSTRoZkxrd2RkSGlMSFhtTWwvd0FrMExzeS9WVDQ2?=
 =?utf-8?Q?A6ic=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ekx2a3l6bENiMmVUQUthZU9DbWVCZCt0SDJMWlhLQmVrUk5hcXZ6UXBxUEN5?=
 =?utf-8?B?cFVqSWVhNEJ6WGNYbFU1N3JPbmhHYmN4bW16a09qeGRVd29zWlNJeXFYalI4?=
 =?utf-8?B?Tjl5SFUwSGYxejQ3Ykh6TThtd2FXdUg0OC9ITkdaMUZ2Z3ZyaTRPcWRweENZ?=
 =?utf-8?B?dXFIbE1BVS9iMFpaTzJVVkR0ajRjQ0p4WnJsZUVaN29CL0MrdmZreG41dFVL?=
 =?utf-8?B?ZlFDR3k0ekRVT0h6QkVoSHArQTU1OXpYejM0THpHbUdzaHl6emtyNDhyaG4v?=
 =?utf-8?B?THBYVGsyWFRyRFlOSU82dllpR2E4OUtqOFpKa1QxajNUUXVGK25PNGJubHhV?=
 =?utf-8?B?L29RYk52R1ltcWk1UmxWeElvZ0xIL3hINU1mUnNyb3l2VWRVRE1sbDkxNFA4?=
 =?utf-8?B?MjIxSitTL0dBVkZ6UlM2VEVheXlCZWtrQ0J3TjA4M2ozMGdWOTk1VWlnenI5?=
 =?utf-8?B?d2w1QkgyeEZoTm9TNkN5NFVScXowdW1qMVl6MHdaVWpPR2xjb0ZSUzJkRlhv?=
 =?utf-8?B?a1pjdVBDUmRXelo4S1lPblorUHdyUVBQaDdZVGMwTDhMS0ZpZEp0a1RmaGtT?=
 =?utf-8?B?aXRBWk83NDBqTjV0bGl2UndBMTdLQkFIeFl1aHRXcy9qTUpEZjIzR3BEMS90?=
 =?utf-8?B?dW8zQm5IT3RGckRuZnpVV0tROFJMUDhHNzVSeHdkTCtyeitpQkt2SUZzYWlJ?=
 =?utf-8?B?bGtPTG5lOUdtT0lNK0dWM21IVlNDbEh4MWN3Ry81MEh5RVlSaUo3cktKZVUy?=
 =?utf-8?B?REE4VE83bmNMTVkxaTlhcDlROXU0UE95aXpjcXhod1R2d3NzUVVTekJPcWI4?=
 =?utf-8?B?Tlp6VHU3c2dpM1hwR1ErMlQ0dndJS0tmYkIwZ2VDT0NzdnA4YzRRWEVreE9I?=
 =?utf-8?B?QnR2alFDdWY4ZXgzbUorYW5MdzQ1cGt2eDVpTkV4SnluWFhReHpzR1pPQmVm?=
 =?utf-8?B?WEVBN0Fvelg3WURiVU4vRGdnMkRqeEFGaXhxbUNZSGMxclBvaHJCRjlKVzk2?=
 =?utf-8?B?TXNJUW5nSm54VVZ5cVVuaTJEemdPL3ZGWExtNC9xOVRURjl0bDVOaW5MYlls?=
 =?utf-8?B?ZWRaa3VJa1JEMGxIcWRRL1dZN2xmcFhMUUdXQWY1MXRIajVoK21zOHNrdXRp?=
 =?utf-8?B?RDlIS21EMWtDM2FMU0plRWdGV2xwL1U3eXEwcitaMnhGejRPalZBajdZZk03?=
 =?utf-8?B?N1ZubGRsdzM3ZThyRlJ5OTFyejR5RUFVOWgybXR1Q0x1T1hhTDk0ekRjTlFY?=
 =?utf-8?B?azdScHY2VlZtTkhIVmpLZjVCaVlHc215WHZLZWJEZmJWMWpEMWJ2ZXl5WFBI?=
 =?utf-8?B?d2FXU0h0dWRvajRSQkVtWUpvU3hNMnFpTzRrd1NMQWFKM0x6Q3daWEMyaVc4?=
 =?utf-8?B?U1lWN3RPM0d4Rzk4NFFPWlk4M0ljbXIyRVJvUEh3WDdsUG5MQ3lHNG9MWHRT?=
 =?utf-8?B?Y1F1UFJLaVNiVS9EakRkRnJmMyt1bnhiZnBoNitZWXkyRDErQ01hcHVkenIv?=
 =?utf-8?B?SlJIZHVjVzM1V200RDBVV1BDYkZ0a204OUQ1YXd1T3hEa05vcFhtNVFZZzhP?=
 =?utf-8?B?Ukw5YTYrOTlNN0huY3JRVnR3S2FtU3hGQUI4cFZhbWRCY1pSQzlZN0ova2Q0?=
 =?utf-8?B?Tk1YTnZJeFArQnRXOGlMQkxNR2VQRXZjMWNsQ0EvbzVBOXk1TXRkMFlQVWlQ?=
 =?utf-8?B?aWYrL1FZZFR5NFdYOGZNMEZLVVoxUFdBWFQ5ZXBqZ0d4eHRXa0hYeEhnekQy?=
 =?utf-8?B?UTlnV3krWnNROE9IMU9Za2NjV3dhNzVmaDlZQlUxbkRxQkFONUl1QVlKWndo?=
 =?utf-8?B?K0RyUk1qVmR3cFFqUi8xdTdPditiS1oyVUxIbXJVdlhkT0pMZitIOEhJZUFI?=
 =?utf-8?B?UUNuZkN1eUNKVTN3OFpNV3pqWVc2L2RZclptRWFBQWF5Q2ljQms5dVd5RTg2?=
 =?utf-8?B?QWY3RTRua28wNE1BYU1LYlNHM085eDBSejRRVzJQa1NicWZhQnVQcXVjY1Zl?=
 =?utf-8?B?VW5talBnUjdIdCt1VitmUVlxbWFXd01sWURwK3pZa2prR283aUNhRnFzdnRi?=
 =?utf-8?B?NG9NTjYvNWZSaHNFMkFJcFdHbTVSZHZZY00rWHllbXJmdUtMNitUNDZPRm5n?=
 =?utf-8?B?cmJ2Y3NUbUlFeEtwOHFPc3lGM3NUZ05EdHVOc2l1SUk0cVI4SU1OaU9jMnpP?=
 =?utf-8?B?bDdtalBSa0xyaDRJSkM5Vm1IT3pRYVFlZGFvd3dUK3pwNmVrbm93cnNuaHZS?=
 =?utf-8?B?V3doS01iQU1EaGl5VVRJZGs4V1dGaTU4c1puN1hiQVBlM2ZYREdIKzNUZDJF?=
 =?utf-8?B?MWpiYTJtY0JsNkhRODcyQXVKaFhoZDcwUjhIL3VhQXRFSFpmSGlUUHNQZlVZ?=
 =?utf-8?Q?RzZTGY/YloYmgGFQ=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43afee01-91e2-476a-d2dc-08de5d04aea4
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 17:59:42.6485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZeGspOH3XNFRD5QXM2kC3E3wH0xQq04htZa92YU7pvB+hnu0XRBtCw1AjgvgNfO71tz7dviJlhNzVj8njXPbb5Cn8exmr3+By297Z8d9Rg8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PR01MB994141
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_095944_218045_39E171D0 
X-CRM114-Status: GOOD (  23.72  )
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



On 1/26/26 6:18 AM, Will Deacon wrote:
> On Tue, Jan 13, 2026 at 04:36:06PM -0800, Yang Shi wrote:
>> On 1/13/26 6:36 AM, Will Deacon wrote:
>>> On Tue, Jan 06, 2026 at 04:29:44PM -0800, Yang Shi wrote:
>>>> +#if defined(CONFIG_ARM64_4K_PAGES)
>>>> +	size[PTE] = "4k";
>>>> +	size[CONT_PTE] = "64k";
>>>> +	size[PMD] = "2M";
>>>> +	size[CONT_PMD] = "32M";
>>>> +	size[PUD] = "1G";
>>>> +#elif defined(CONFIG_ARM64_16K_PAGES)
>>>> +	size[PTE] = "16k";
>>>> +	size[CONT_PTE] = "2M";
>>>> +	size[PMD] = "32M";
>>>> +	size[CONT_PMD] = "1G";
>>>> +#elif defined(CONFIG_ARM64_64K_PAGES)
>>>> +	size[PTE] = "64k";
>>>> +	size[CONT_PTE] = "2M";
>>>> +	size[PMD] = "512M";
>>>> +	size[CONT_PMD] = "16G";
>>>> +#endif
>>>> +
>>>> +	seq_printf(m, "DirectMap%s:	%8lu kB\n",
>>>> +			size[PTE], dm_meminfo[PTE] >> 10);
>>>> +	seq_printf(m, "DirectMap%s:	%8lu kB\n",
>>>> +			size[CONT_PTE],
>>>> +			dm_meminfo[CONT_PTE] >> 10);
>>>> +	seq_printf(m, "DirectMap%s:	%8lu kB\n",
>>>> +			size[PMD], dm_meminfo[PMD] >> 10);
>>>> +	seq_printf(m, "DirectMap%s:	%8lu kB\n",
>>>> +			size[CONT_PMD],
>>>> +			dm_meminfo[CONT_PMD] >> 10);
>>>> +	if (pud_sect_supported())
>>>> +		seq_printf(m, "DirectMap%s:	%8lu kB\n",
>>>> +			size[PUD], dm_meminfo[PUD] >> 10);
>>> This seems a bit brittle to me. If somebody adds support for l1 block
>>> mappings for !4k pages in future, they will forget to update this and
>>> we'll end up returning kernel stack in /proc/meminfo afaict.
>> I can initialize size[PUD] to "NON_SUPPORT" by default. If the case happens,
>> /proc/meminfo just shows "DirectMapNON_SUPPORT", then we will notice
>> something is missed, but no kernel stack data will be leak.
> Or just add the PUD sizes for all the page sizes...

Fine to me.

>
>>>> @@ -266,6 +351,17 @@ static int init_pmd(pmd_t *pmdp, unsigned long addr, unsigned long end,
>>>>    		    (flags & NO_BLOCK_MAPPINGS) == 0) {
>>>>    			pmd_set_huge(pmdp, phys, prot);
>>>> +			/*
>>>> +			 * It is possible to have mappings allow cont mapping
>>>> +			 * but disallow block mapping. For example,
>>>> +			 * map_entry_trampoline().
>>>> +			 * So we have to increase CONT_PMD and PMD size here
>>>> +			 * to avoid double counting.
>>>> +			 */
>>>> +			if (pgprot_val(prot) & PTE_CONT)
>>>> +				dm_meminfo_add(addr, (next - addr), CONT_PMD);
>>>> +			else
>>>> +				dm_meminfo_add(addr, (next - addr), PMD);
>>> I don't understand the comment you're adding here. If somebody passes
>>> NO_BLOCK_MAPPINGS then that also prevents contiguous entries except at
>>> level 3.
>> The comment may be misleading. I meant if we have the accounting code for
>> CONT_PMD in alloc_init_cont_pmd(), for example,
> I think I'd just drop the comment. The code is clear enough once you
> actually read what's going on.

Sure.

>
>> @@ -433,6 +433,11 @@ static int alloc_init_cont_pmd(pud_t *pudp, unsigned
>> long addr,
>>                  if (ret)
>>                          goto out;
>>
>> +               if (pgprot_val(prot) & PTE_CONT)
>> +                       dm_meminfo_add(addr, (next - addr), CONT_PMD);
>>
>>                  pmdp += pmd_index(next) - pmd_index(addr);
>>                  phys += next - addr;
>>          } while (addr = next, addr != end);
>>
>> If the described case happens, we actually miscount CONT_PMD. So I need to
>> check whether it is CONT in init_pmd() instead. If the comment is confusing,
>> I can just remove it.
>>
>>> It also doesn't look you handle the error case properly when the mapping
>>> fails.
>> I don't quite get what fail do you mean? pmd_set_huge() doesn't fail. Or you
>> meant hotplug fails? If so the hot unplug will decrease the counters, which
>> is called in the error handling path.
> Sorry, I got confused here and thought that we could end up with a
> partially-formed contiguous region but that's not the case. So you can
> ignore this comment :)

No problem. Thanks for taking time to review the patch.

I will prepare a new revision once we figure out the potential 
contiguous bit misprogramming issue.

Thanks,
Yang

>
> Will


