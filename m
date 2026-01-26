Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3547D1950F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 17:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hELEf+Jz70IHIaHMn9VAaMUlKeBbQR6vN5CQXcEkMxA=; b=e7jbBZ9DpRaNcoPyEON07KK4dt
	+PaYPc3bBPACeKvwZmWU6BhC981vwBmEaBPzRTlQPzSodFRjzOyXwiU2UpgV9FVy3NaBIJzSsuyzb
	P1KWTaMF+UvETwHbqa9RzRTA8wvb2bpZF8dVSQi3lIeE8fOUozX4AWQhxm4faBxNufv7c4OA8651e
	Ihi9HAzlL9gsvu/5FVTB4sbrDLRS3gw8rp/X4AAQZKvCJAGfvO2F5WXrq+cOT5t5w0ylGw5ypBq2z
	tLuiz2ou/EEolo7x9YGo36A9HaC2NLXt/7ZNf5FkWcVa5gRbGn7+YYgFwII+1Pnr0KgpBtGAbKj3X
	LQkAaNwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkQo1-0000000D1La-31VQ;
	Mon, 26 Jan 2026 17:55:17 +0000
Received: from mail-westus3azlp170100009.outbound.protection.outlook.com ([2a01:111:f403:c107::9] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkQnz-0000000D1Kc-11J9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 17:55:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GS8LhZi6sJS7Vk4/yKurcmFnPbnxikbUc5hOxXDODRaIBKTH8T7e8hRAffj7EpmQrrigy1QNvmQAGj6UGIQ0+3h6Y3yfAMW8hS9WdXIPi5GW2mOO+nxQtNxzT4RldGqA3vUhYajRCVTnRZMJjb4bvtsHUyDHOeLyBTwcmmWSIBj1xRtepxImiKRjNUbM7llDBzoNIV1CF10gtPADT2r5sZWRlcnO9x27IxZ12eBczabg0lk2wIuEMobeqyvmXKMI0avBmCnywlWSaktNDe4qGwh87l7WL+SK3Ft+2k3Q4oGCyYv8PJthJK1tl5lQMRvWwIvplvA1bC5cA88TMgyVIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hELEf+Jz70IHIaHMn9VAaMUlKeBbQR6vN5CQXcEkMxA=;
 b=YorNY5jhvRUlEsu0FS5g9Vhova3XRyQjPGl/fw7NQ+kzQZA0P2pTkCVzLFI8ONzGWGcUS4MUJcyzk6TbZG36ARWG31ci8aFcDzEbglqtW4fZlMqHa8kl1CQrg9chOJlIBjFo7CmHPKcaVYbiqvbV4AFwCbp2vthziBDKbRtgJ+/7pyua5HynL3+u6jJGqoT0BDGKnDhPI9sZBXrfiQWkyQr8L5eiMJAIuny1Jg8daVjQxx3x5OJBKPDEiG3OqUsoaNbqOMFzo1IGTtykp04qZecqFB0O2/DYrcr/fRKRasYgZlI/LR8lzttlpO60PJK1aGvGRb6j214/RfKu4nFVOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hELEf+Jz70IHIaHMn9VAaMUlKeBbQR6vN5CQXcEkMxA=;
 b=EFLWH0OF0Hm2R8AupN/oXGvX63ekzxj+K23mDDO5o73c1tljvPwyTVe89tLFFCdXs74R4icL9BudMbLUkBz1bB/BdHJXajBTyoOtwmNwEtYP1fnufIGp+mGkaI+HvWdhjP/JYFLunZHH0ZDt2WmcvGVhi9dHSMtaAe39jGrdkE4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 BN3PR01MB9233.prod.exchangelabs.com (2603:10b6:408:2ca::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.16; Mon, 26 Jan 2026 17:55:10 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::46eb:64a3:667c:c1a0]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::46eb:64a3:667c:c1a0%4]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 17:55:10 +0000
Message-ID: <04f816f9-5533-4fe1-99b0-cd405caac485@os.amperecomputing.com>
Date: Mon, 26 Jan 2026 09:55:06 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [v5 PATCH] arm64: mm: show direct mapping use in /proc/meminfo
To: Will Deacon <will@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>, catalin.marinas@arm.com,
 cl@gentwo.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260107002944.2940963-1-yang@os.amperecomputing.com>
 <aWZYXhrT6D2M-7-N@willie-the-truck>
 <bdd7bd07-dbed-432e-ae87-dc6381c05ddd@arm.com>
 <70b37582-fd26-4d23-a6d6-9a98e3f2eecf@os.amperecomputing.com>
 <b3122ea6-7bbc-4c07-b329-3355bbb16db9@arm.com>
 <a0aeed19-02d2-4d74-b82a-f906dc41e240@os.amperecomputing.com>
 <aXd2rud1E0Gff8-2@willie-the-truck>
Content-Language: en-US
From: Yang Shi <yang@os.amperecomputing.com>
In-Reply-To: <aXd2rud1E0Gff8-2@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR04CA0002.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::12) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|BN3PR01MB9233:EE_
X-MS-Office365-Filtering-Correlation-Id: e7e05328-eb48-41f3-2393-08de5d040c74
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Ti9JR0VvcG5TWlQ2U29QMmFQeFZkOE1JRC8yOHFyREZ6RHc2OHF6Ym52c3ZZ?=
 =?utf-8?B?dHVodmNNVTczVGNvMEE4SHk1OEdMbkZuOFBqS1czTEJCVjFqczl2RndPa0V0?=
 =?utf-8?B?QjhTRGs3V3I3MVBCVExwc00vd3pmU3p3R082cjRSQ0s3cllXOFN1NmdNZXR1?=
 =?utf-8?B?MDNsb1pubXdWc0lXUWdVcmxPeHBGd0R4SGhFelp0QnE4WXBIdXdHYXlZSlV2?=
 =?utf-8?B?MWhPa002Q25TaGVUY2Z5OHJqNnVOWWZzVW5hb1J5bVhINjlqRzhpTDhmc2sz?=
 =?utf-8?B?YzZtWXY2bUtEN0RhT0tpcG03TzByTGNXcGcrcjRwTnFGSHFYTC9IenBXZGh3?=
 =?utf-8?B?RDNERFBFYjdmNnZXRHcxWGUvQUpFSHJrQ1diMm0xZk5jUFUwYTRKK2tKcElW?=
 =?utf-8?B?RlNnTUV4enZKYVhQRUZXNVJ5Q010M1J2cjM0MlhEU2xOaFI5VUxYREFLaTM1?=
 =?utf-8?B?SHBOOS9Fa1RkTG5iRkdXVzJYUWxkUm5xWE9ldlZyUTYyckhJSGtUUERsK0pU?=
 =?utf-8?B?TWxkTmNLVFd6SE8wc2JFY0NyWk1FdVF3U0FXbXdSZmFJWi9ULzNRaXFtVk9B?=
 =?utf-8?B?ZXZzQ3JaaGNQVlBmUXBUVThhaUorNmFSTDI2T2NXUUF2ZnBHMUFSQk9sZUNw?=
 =?utf-8?B?SHRQUFZuN2JMMmZVWnhQNXV2bGtUUHE1aHRPeVZqY3dTMzh5eUhaQ0xHR0Nn?=
 =?utf-8?B?UkxYUUVxcjFqdVhaN1pSYnh3cE4xZlhaSEk3T2RzV3VzeHVIdThGaUp6MVpp?=
 =?utf-8?B?TWNuRmZaamhCcGVRMWtiaE9FaHpYR2pVUVNIMndIYjFYVjBKelZFcTgwU21V?=
 =?utf-8?B?NWJWcUhVTUlRRWZFMVJqQ0EzSWFDTEgzcEdFT3RkcnhEcEkzWGFMVmY3QXRw?=
 =?utf-8?B?VEJQQkZ4cDcyemx2SE96K3RWSGdkZ0tDVU84OXJYWWdHRFhHMmd1YUQwU3Zk?=
 =?utf-8?B?VkZOTmFaNUcvZmJBb1N5ekhSUGpNcDZBN3lUMEZ2dUtEdjAxTEV6MkdoL2Q1?=
 =?utf-8?B?TEsxaENwQzQxbGtwT3QrdmYyUUNOazUvanF2bGY0VWJHZkNCMy9UYlFWQnNo?=
 =?utf-8?B?VnZ4UUJNcHBMZG80UUcvSURibkdkNS9HMXRna251REIwcDZXdXJIOGp3cVFL?=
 =?utf-8?B?dWhOeHhrVXVmNEp1UWNZSklGZDdmcWdmeVlVd0g0Q3VQQ2YvTUk4dCtVeWhH?=
 =?utf-8?B?Q28xNUxWVjVyMVJROXJTSHVjRVljTkJ5RGJHblhIMUxVS0pvQmZWQzQxY2Fx?=
 =?utf-8?B?VmhHUWdKR1F4NlZsUXV2TTZZL1VBMTFjMFJpa1dhVWV0ZjZnbXVaZHg1c0Nv?=
 =?utf-8?B?dVMzMjEvZlMxVkdtTkdUenFIdERvUnZtTUd6NVRQb09SK0JsMUNnWk5VdWNk?=
 =?utf-8?B?d1l0WEl1cisyYjRQRG5wZ2U3NjhkSzJqRysrVUR4MGRLREhKUnVkSi9RL0tj?=
 =?utf-8?B?SkFjbWpEbmxIcStwWlNobDdRWmRsRmMzZWpWQlFTYnI3ZldwWW5QU2VCWVYy?=
 =?utf-8?B?M2hVRmZBRlpXSkd4YXJnYk5GallsQXNxYTNMQXpoV2duYlhyYzZPRVAzSUlW?=
 =?utf-8?B?TWxCV0xjSG0yb2JwRGhUOEhVbVowb1JnaXNNY1RzZUdaNGhmZnI0V0ozb3Uw?=
 =?utf-8?B?b3RsNTBOU0oxdXNra0VxdU83a0JCTnlXYWxzMmNZNHVnQnl5dVY3cmZwRS9p?=
 =?utf-8?B?blFWZUNCcXFZYzdJdmRPWkluZE1YV09aQ1JJMnR4SFVxOFlYc3lpWWRvM2Na?=
 =?utf-8?B?OFl5bWdSVGdoakRlWXFWM242UzM1aW9aWjZtNUVaY1ZzTG5JTjI0TTJJYmRU?=
 =?utf-8?B?L2F0OFkzbHBkbVJEN0QxTlA1RlY0bHF5aVVneXExY3hWTHBpd3B5RjlHK05x?=
 =?utf-8?B?azZEU3dpcG93Y3JCbUplemF6MGxsQXhpYUJKUHdFeWg0QlVaeCtHZUZ5aklQ?=
 =?utf-8?B?dXJoYTlyekRXSDRwTEpvam9rZUdkdWlUQTFxR3JIZ0gwNXZKTE5yUkhiVy9a?=
 =?utf-8?B?VWhyYmZ6TSs0SEJJY2sycmhmN1ZIdkpEOGtoVlhaTUpYU083M25MZTJMVVl4?=
 =?utf-8?B?Yy9uQmNvbmVkVityczZnUHFwWHIybnRtUTdGNTNORHJ2YVlEZ05lYnJ5bW1L?=
 =?utf-8?Q?T6uY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHRidXFieUdzMGhQSklPUEg1YkFxRjVvV2ZzOHFGN3MyL0hXQVJzWW9xbTY5?=
 =?utf-8?B?d1FVcW40S3doUGU3Um1KU285V2N6b3Ntd3dkcVdFdFF6RVdFMEZxRDhJR1Zt?=
 =?utf-8?B?TFlmN2NYdGxkQjFNcTJBK3VIWkZoSHQ3QjJSWEZvRVRJekdGUzJhZFhLWjVF?=
 =?utf-8?B?bXZqcU1LSFhEU0xjaXh2b2ZDcHpXNDBkV2hzbGc3NVNyYnBzc05KNHVwMG5y?=
 =?utf-8?B?MUxhVW1obE05L3FUT0lrTm4xQUxuNHN2NW5rTlVhcTRvem15aVhGUnBNZmlC?=
 =?utf-8?B?N3J0S0h5KzcxMjNINy9rYlJLM2VyM005ZzdQM1JkYk4reGVPdVh0NEc0ZUdY?=
 =?utf-8?B?dHBydTZRYjVlWm1jTzJFd1pwaVFYcVUxUGN0N3ZYVFNTL2pyTTdteXhZTFMy?=
 =?utf-8?B?R0xQRTl1Y2xFN2N6MERvRFdHRG13amlwcW56eWZTbWVXZVVCUWVSalVXVlJE?=
 =?utf-8?B?Sm5GL3MvT0FZeForRitBR2FWODZVbytGQkVlRGhLQ2ZFTzZVcjZtWmNycHF3?=
 =?utf-8?B?TWluT01MVGloTjBNNEx3ZCtIQmhBTEhTd3d3K0pqZm4xOUNKazBoMllVUW5F?=
 =?utf-8?B?djZjSklKTzJyVjdrREVDa0RtaUMvQXVFd2xHV29SeVBRZUFjN3JXeUZBSTFW?=
 =?utf-8?B?UjJTT2NhRTRqTVRTQVpldFAxWlFnNk02T0I1NXNTVk4wU0VCWndxM2hZZVNN?=
 =?utf-8?B?Q2l2MkNQZGZHS2RJUUZVM2VxekVZY2VtSG43MnlIeFJJclBMaFBzdFIxelpu?=
 =?utf-8?B?VVk1TmZrTkZ3aWVRUEtjZ1pYT3JIZER5SXhDRDFGR3RGam54RnZQSDMwdURE?=
 =?utf-8?B?aG5zS3pIL0FDZ2RCdHhPY1lMbmdZbXlwVjU4T2RqcVk1OHp0YUhCeXkyTDkw?=
 =?utf-8?B?U2Z5bE9IbmZDdDdaZVZKUFIxOEpMdWExQzA5K042bGtxWEhQVkdDZW02ZkhY?=
 =?utf-8?B?T2QxcTRxVWFWMXkyZHRoWndLUWRzSGRaeEVGM3FiY010QjNpdUlPSmk2bUJ0?=
 =?utf-8?B?WlMvL1J2WXQ0MlhIRVVia1MzVldRQVBkc1VlWmNwRjB1dVByNGFWN0c2T2kx?=
 =?utf-8?B?My9lR1diRnB3QXpRdGIxb2U5WjRsOWJpejF1UUdCVWRUTHBhMGFBMm1PN3Mz?=
 =?utf-8?B?MjNoOWt3VWNEVzh3d1haZkVxejZseXAva3ZYYllSZm50LzlGSnRDY3MvWFBu?=
 =?utf-8?B?WGQ0cUpyZkpuUkRER05oRWs0UTRpV1YyMnhRMzRnOFdlWG5PbUdkb2MyYXNY?=
 =?utf-8?B?UkcyOUtmRVhEMmF6TGVBS3hFckNKNmxiNURIVG5KZUhoR1FNWXQwa1dscHJC?=
 =?utf-8?B?WE1EZjlhaEp6V081bVR6VFZqVnBmVU1oVFV6L3E2M3VCSGhZVGlNc3Vzb2RC?=
 =?utf-8?B?WGRhSFR5UzIzc3g3UnlYQzhxZWZSNG5aUjRvMVZjclVKOFVKTngzcHF5RGtR?=
 =?utf-8?B?ZzdESnhEbmlXdTNub0xNSFlCUWIzUFFEbVFsYUE5T21OdDhnSHJta3M5UVRE?=
 =?utf-8?B?YnNDUGplWUQ1dnptdzdQQnJGbFlGOFpJQ3FDUENRY1lTZGFFa0lFL0hjalVk?=
 =?utf-8?B?dEw2eDJuZUpyUWpHcjByUTBaRGo4WU1iSjJWUElBOUtFMWZXZUVhWXpxaGJY?=
 =?utf-8?B?ZmVaa0QxcmY4QmR1bkRzSU5naURQV2pQeitjdGdRdFNDa3MyR3RNckRQTHB2?=
 =?utf-8?B?VGFZSVdpaEJIQ3VRZk1rY1RHYWU1eStoK0ZLYW5hUEVwWXIvRURzanJOUzZn?=
 =?utf-8?B?Ujh3dzE2aHlBazU0SERDL2ZETnRSSldHbHFMU0pyMnVZMFVBeENmVE1EWW9Z?=
 =?utf-8?B?SEVOTUNYUHZqWm4vdUEwMWcyU0tYemR6T0p1ZmhpTkFjaWd6Z1NzdVBRKzV4?=
 =?utf-8?B?bTdsZGZMb2gwSjgvSjlDZDh0OXVaOXNObDJkYnQ4ZmZvQldiRWM4Sm9hOTBn?=
 =?utf-8?B?aURBZS94ZTJXYTZTMU5PcHhDQW5xV3dPNmpjejFoRStRM3Q4VGRLaUI2c1k4?=
 =?utf-8?B?YzA0Ulg4MVBjSm8vS2g0QTlLVmJkc2Jud2l5djBjTkhPV1NxM1dqR3Q3ZmtX?=
 =?utf-8?B?aEtFYnRNUnErN0xaalFpOW44SW9GeEQ0RkFUSkFRMy9LNXdhR0lPblh6blhW?=
 =?utf-8?B?MTVsa3RxcFE5dEpneWpqNEowTFJaM3dFdnFXWWQwWk9BMThxYVM5cDZINmV0?=
 =?utf-8?B?ZXZpaWJvbjZ4aGRLOUJkVE5aVnoxNExIWVRJRGZLenZoRGd6MjYrZVlocVc2?=
 =?utf-8?B?dm4ray9tSGQyVmlrZ0cwQkF0L1R4dXhia0VaQnhnOGIyQ2JUcEFWMzcwbkNZ?=
 =?utf-8?B?L2VXOTNFZFJFWTdNSml0R1lFdmsrblA3dk5mM292S1FpUGhRSmxHbWRaOE4r?=
 =?utf-8?Q?sKl/pxcM9h+KGzJM=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7e05328-eb48-41f3-2393-08de5d040c74
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 17:55:10.5511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rrzyoDFwXWbchUm/66XoTSgwOMIFDGvbVyyYnowjReoi2W583ASKaEsD+IGfERPkCLGyUR+YQ2pQoE3Iv0KIKNVsEl3N4Hobuo7Gvfigie4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR01MB9233
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_095515_334628_D20D2893 
X-CRM114-Status: GOOD (  32.07  )
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



On 1/26/26 6:14 AM, Will Deacon wrote:
> On Thu, Jan 22, 2026 at 01:59:54PM -0800, Yang Shi wrote:
>> On 1/22/26 6:43 AM, Ryan Roberts wrote:
>>> On 21/01/2026 22:44, Yang Shi wrote:
>>>> On 1/21/26 9:23 AM, Ryan Roberts wrote:
>>> But it looks like all the higher level users will only ever unplug in the same
>>> granularity that was plugged in (I might be wrong but that's the sense I get).
>>>
>>> arm64 adds the constraint that it won't unplug any memory that was present at
>>> boot - see prevent_bootmem_remove_notifier().
>>>
>>> So in practice this is probably safe, though perhaps brittle.
>>>
>>> Some options:
>>>
>>>    - leave it as is and worry about it if/when something shifts and hits the
>>>      problem.
>> Seems like the most simple way :-)
>>
>>>    - Enhance prevent_bootmem_remove_notifier() to reject unplugging memory blocks
>>>      whose boundaries are within leaf mappings.
>> I don't quite get why we should enhance prevent_bootmem_remove_notifier().
>> If I read the code correctly, it just simply reject offline boot memory.
>> Offlining a single memory block is fine. If you check the boundaries there,
>> will it prevent from offlining a single memory block?
>>
>> I think you need enhance try_remove_memory(). But kernel may unmap linear
>> mapping by memory blocks if altmap is used. So you should need an extra page
>> table walk with the start and the size of unplugged dimm before removing the
>> memory to tell whether the boundaries are within leaf mappings or not IIUC.
>> Can it be done in arch_remove_memory()? It seems not because
>> arch_remove_memory() may be called on memory block granularity if altmap is
>> used.
>>
>>>    - For non-bbml2_noabort systems, map hotplug memory with a new flag to ensure
>>>      that leaf mappings are always <= memory_block_size_bytes(). For
>>>      bbml2_noabort, split at the block boundaries before doing the unmapping.
>> The linear mapping will be at most 128M (4K page size), it sounds sub
>> optimal IMHO.
>>
>>> Given I don't think this can happen in practice, probably the middle option is
>>> the best? There is no runtime impact and it will give us a warning if it ever
>>> does happen in future.
>>>
>>> What do you think?
>> I agree it can't happen in practice, so why not just take option #1 given
>> the complexity added by option #2?
> It still looks broken in the case that a region that was mapped with the
> contiguous bit is then unmapped. The sequence seems to iterate over
> each contiguous PTE, zapping the entry and doing the TLBI while the
> other entries in the contiguous range remain intact. I don't think
> that's sufficient to guarantee that you don't have stale TLB entries
> once you've finished processing the whole range.
>
> For example, imagine you have an L1 TLB that only supports 4k entries
> and an L2 TLB that supports 64k entries. Let's say that the contiguous
> range is mapped by pte0 ... pte15 and we've zapped and invalidated
> pte0 ... pte14. At that point, I think the hardware is permitted to use
> the last remaining contiguous pte (pte15) to allocate a 64k entry in the
> L2 TLB covering the whole range. A (speculative) walk via one of the
> virtual addresses translated by pte0 ... pte14 could then hit that entry
> and fill a 4k entry into the L1 TLB. So at the end of the sequence, you
> could presumably still access the first 60k of the range thanks to stale
> entries in the L1 TLB?

It is a little bit hard for me to understand how come a (speculative) 
walk could happen when we reach here.

Before we reach here, IIUC kernel has:

  * offlined all the page blocks. It means they are freed and isolated 
from buddy allocator, even pfn walk (for example, compaction) should not 
reach them at all.
  * vmemmap has been eliminated. So no struct page available.

 From kernel point of view, they are nonreachable now. Did I miss and/or 
misunderstand something?

Thanks,
Yang

>
> So it looks broken to me. What do you think? If you agree, then let's
> fix this problem first before adding the new /proc/meminfo stuff.
>
> Will


