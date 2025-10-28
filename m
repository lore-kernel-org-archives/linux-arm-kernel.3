Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72C1ECCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 14:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B3PhbknjB4rowKoIAFN9ZBuKLVF6qLMdZ+tMOcznx0k=; b=3i21grAJ5jDQrEjsRjm9MDrPBi
	9gxZ/mF4tR6MUXO/hUoC+Js8DamDFVk0XSBUVsMOtVboeCC8l8gq4wreYi3NLWxYCQZLwk825hjwN
	8CClyQUiZlqHSfALCSBGKnKQRfb4ux4EPtsn6liGyJeAx9Ef7gA+z6bsUIc8gfZhYuaOfskUcuOis
	PYSqWMZjU33h3VB462CTJc//sPHvLB7w2Texto+8+RNJx1wOkvSSjrJSEqw+szt9Wf6FlOZYGzRld
	rVO29+d3NCeFH4TbocECsP4EMTp72Zm0Vx8PDO0+XjjRXxrLEi4EeyTZ15aGlmqFOrXSZLWjvK4ZA
	wgYYh6Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDkQX-0000000G4H9-2gkB;
	Tue, 28 Oct 2025 14:11:57 +0000
Received: from mail-canadacentralazon11022131.outbound.protection.outlook.com ([40.107.193.131] helo=YT6PR01CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDkQU-0000000G4Fn-0o1E;
	Tue, 28 Oct 2025 14:11:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=scqSkGXA3DO4DmZ0XJ5EanOWAyYU9py0/YAN79eoDQgQI8Ym4elsfX1ssUgiTSUnW/t5PicYHb1i2XLeysqNgaj90eQICE3ppRmsVJLth388CgaA/ZN1bpVtYdZw+K4hQ6W5vrCmWKHc06r6Y07QHILpHqNoB4DikJMmCwAVnV9BJqKGNNfDqW+h3rSySexOtp2AMKOxKCnZD/zPeuaurwIZuwvbUOLq8Q0W+K+VI9JUjlBy4EQjGYfpW5N/vPdUGW28F/L09F7ZPZaUf7NakZgKj4RhE0W1clx017bb6JvVlmP5QAOlb0leX4V8/do8PAHk9VO60zJYry+WNvOd5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B3PhbknjB4rowKoIAFN9ZBuKLVF6qLMdZ+tMOcznx0k=;
 b=Zw3FS61neI/SRlqkr97XZlfJVtdN5mGsORE0YwhDJQbWCw5topTaxDBwN5wnu8Ab9KpyQqeu8bs/N8CtM3pOLnUsGoJYXinW7QUpPle4I3WsZYanu/btz5TEgB35FFVhBHAFT9iXpQm6QiKsODix7uUtrwBtmBIvT369IfaboZxiyT/EWtkQS3WX/xUPXtzlDhlOq3B4HNxjyQtypROzPPeUrJXmr5MHbQP4ij+GGF2oL5PxwMEk94nyVakCI8Mru9UNjU+T6wbaCreLYztPQOf2+1UqjEc6+ADFzdMCzef47aYBW2gY/mqlmGmwQWE2UCpKoIBHg2DiTFIYWWBjvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B3PhbknjB4rowKoIAFN9ZBuKLVF6qLMdZ+tMOcznx0k=;
 b=eMHtqJAyBUs6oL9fNdY74EjUPzL3lMKEhDTC4ULoplnccEPTJ6ODwrml4yLyYb5C4qwiLCoqUzM/VKNwNNm4mKwoZdGU0ZDu+kQBx61SHvcEN4NU/mC2PiAhrgRqTJ3zHId2Y6p7RErjRLZSP2ApltvJ4NIzkRXBdN/hnH0XzU1m1dlYELv2kB4tES9YfNjiH0JEOWRVAsqdjvtqvyv91HWH85en1bW3m5pHy6WZU/yD5BCC9TU+DjhZcpeuso/U+e1twZknZGecoylarSbpMLeor4iP9XKBwrf+A5Huo3NIq0L0QEt+Fm/iy8OQjFyigWUDoIH2wEkIPmlOC36Otw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:be::5)
 by YT2PR01MB8789.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:b8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Tue, 28 Oct
 2025 14:11:47 +0000
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::50f1:2e3f:a5dd:5b4]) by YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::50f1:2e3f:a5dd:5b4%2]) with mapi id 15.20.9275.013; Tue, 28 Oct 2025
 14:11:47 +0000
Message-ID: <561981b8-4d30-43fd-9deb-47b776f1b032@efficios.com>
Date: Tue, 28 Oct 2025 10:11:45 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [patch V5 07/12] uaccess: Provide scoped user access regions
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 David Laight <david.laight.linux@gmail.com>,
 kernel test robot <lkp@intel.com>, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, x86@kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Heiko Carstens <hca@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org,
 Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>,
 Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>,
 Davidlohr Bueso <dave@stgolabs.net>, =?UTF-8?Q?Andr=C3=A9_Almeida?=
 <andrealmeid@igalia.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org
References: <20251027083700.573016505@linutronix.de>
 <20251027083745.546420421@linutronix.de>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Language: en-US
In-Reply-To: <20251027083745.546420421@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0384.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:fd::13) To YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: YT2PR01MB9175:EE_|YT2PR01MB8789:EE_
X-MS-Office365-Filtering-Correlation-Id: ed607d9d-b573-4aa1-6d66-08de162bee19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b1pmbjBXUUhHQXVJY255ZVZrRysySHg3NHY5U2NjcVNwZkhjaE1rQ3pnQ0Jz?=
 =?utf-8?B?Qm1CNVB1K2V0SFRwT1pBc0IrY0p5ME5nd2d6SjNiTHZSaGs3WThwK0ZNN1M3?=
 =?utf-8?B?NDkyTWU1WHlkMjVCUnRLcTFHUWMwTnRTVnpmT1N5dm5DMEJkVG51Mkloejlh?=
 =?utf-8?B?aFBsRlNtRktTRkZHT2NzVS90aTdzbDlZaktIaGlZNzRKaFBtNzVod0dmNmdF?=
 =?utf-8?B?RDBYVjMyQ3NZWGYyQWZFdDUvSWhZd0xuclNGYXMxQ1hmMmRnWFlKWGErOHdP?=
 =?utf-8?B?VHBLUGxDc0g1dWRtZzh4TkhNMndUQy9mMVJDU1kxUkVaSzVmRU0wRmRmdEtx?=
 =?utf-8?B?SEcrK0ZUZ1ptRWVhc001SlJocXJYNTNDYUQ3R1NSK0JDejQyRC9TcWF0cU4v?=
 =?utf-8?B?USt4clpITWZlZTRyd1J2Qm5oaTBQdExSZkd1VXE3N1ozdFRONWNQbWxTZVFH?=
 =?utf-8?B?TmtpNkNLNUlaaDVBKzhGdGxlRGo5SXZWNlR5S2llRFA4WXNQRzhybjBsWUNL?=
 =?utf-8?B?SlpGKzRvdHdtTHhxMXR2ZzRiS3RVakxDc2dOTzFlTitiQnlPMGx4ZXUxMmhK?=
 =?utf-8?B?STNIUDkwUU94N1EwZVpwbTJ5STlYcnovOExxTWxHc3grK1Q5aGpCaVRkOGRH?=
 =?utf-8?B?bnc1RVRpWkxyd0hiaHRYQjRHZTZQdENhUGJPUG5jeDFPaGZySEdUUnJCUzlP?=
 =?utf-8?B?Qy9tckRXc2t1Mkd1L3k3ZGpIU1Y4N2gyS0gwNjZKMDNGT3JLUnZYR1lHYUNq?=
 =?utf-8?B?bUlwTkgzS1VEMDgvUDJhV1cveGp2WlI5TUVpSVRPWHJmVWRmeFhSVVRNczVl?=
 =?utf-8?B?S3pQY3NzbmZjZ0dHMmpvNUpsVUtHb0RFUk12djR5YzJFQlpQTXdIem1WcEh5?=
 =?utf-8?B?aDNkcHBTbjNZQ1Zld1RJOHRNTmMvWmV4VjBObjdEQmJ6THlqRnUzYXgyVUox?=
 =?utf-8?B?ZHQ2SDErTktQTGliOStGMUdkdURScFR6YjNsbFI0OWZ1YW5uVnNwK3BSWEow?=
 =?utf-8?B?VXVlQ0RNUEkzZ09WVmp1Y3FLcmdYcndEN3kySDVKQXhHU1hKci9rZnRmOGZO?=
 =?utf-8?B?Q1RuUVAzdkQyYUlnakdFQ1l5M1ZXMkJTMWJyZUx1MUEzRERiVG9kNmpFS042?=
 =?utf-8?B?SGpHdWh6Q21VY2RYSXJLTlJtSVA3ekVma3pSQ1ZIS0JsdWVLQkJmRGt0cDE3?=
 =?utf-8?B?MU1SR3NPNy9aaGJBaVIxNm1WQUwvS2M5N1JJK1hNYytiRk1nQXdDeUI3ZjBx?=
 =?utf-8?B?UFlXRnRiZHNCWmVseTJ1TW1VbXdURkowZ0RtV3o4em0vckJFaXFzQlNlMEhu?=
 =?utf-8?B?WmtIZEJxMVFiZzhvdy9KckFXUE83TE02aDAwd1JzL3dRdkhBWDhseU1TYnRQ?=
 =?utf-8?B?aDF3OVNPWWJqNlBNWTIrZ1U5TUdXdURWRW9qZ1RKVGZrRkJVdk1zSlNrWWtr?=
 =?utf-8?B?Zkt0T3JBZm5FUWhsM09za29rby9FeTdkU3JibUxuVFYxVWhQNS9Hd1QyQTZJ?=
 =?utf-8?B?SGxIalZFVFpsZHRGaWIxNzBhN1F3NkpRak9YakFjU2hvb0cvWjhwSDVXeWNS?=
 =?utf-8?B?TkRNK3Z6bEtjdVNxY0hmZHFUR2pnRC9iazkrUG41clpQYU1nRTkxQjRvQVVk?=
 =?utf-8?B?NWhVL0w1RG16N2VXWFg4Y1RxdmpLTkJodFdCTWlNTjZLbzRHUVBsMy9Sc1hu?=
 =?utf-8?B?c0dqSUpITmNXclcwTnh1R1VQOE9hRHUwMk9oelVvaVFnN0VibG1yeURmci9X?=
 =?utf-8?B?Q1JuVG1ibVhvM1hNWXR1Y0VxV1FCSk9iejRDNlF0UXJETHA0cHh6NWtIZmRB?=
 =?utf-8?B?Lyt1WVE1NnNzVHRKb2s3WFBqaHpyMWIwdWxmaXVNVEVoRXhpdFR4cXlEYXpX?=
 =?utf-8?B?V2RxMXFkbHlNMExrNWdHM1dBOXprejJtK3A0YnFoMUF6NHc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vll5OHFDSGtyNEs2VWc5UkE5dFFYUmxrWkF6bDRpbzB1eU9ySXdsdFFNOVNa?=
 =?utf-8?B?MGhUQm9DOEZ4VktOc2wwTUM5eDc3NzNPL1dmTG9nWko0RGN1Y2ZxQlUrVmFN?=
 =?utf-8?B?VjR1MTRHNE9zZldWaHpWa3Nhdm4vcEk0OEZrTUNhejhXMmZIV2xEdzJQSWc0?=
 =?utf-8?B?emJpOGVpdUMrYlI2OWRoQ2NCSFNkUzd0UFZ5cDREUElaS1ZrRVdVVVFiMEZP?=
 =?utf-8?B?amZrZWpCSzV0a1lCN1BpNnNNcFR1Y0FGK1Y4MUVEU29URzF0TFpwRS92aE0z?=
 =?utf-8?B?TUtGSnVXczhxMk44Ymdib3JvWFJiV3Y5cXovQ3pHQW43MXRVNC95K09GMndV?=
 =?utf-8?B?dmlPVjMzNWdjWXJXZkJyc2RhT3hGbExiNXRVUmJtaytqcnJVbG5DS2duMm04?=
 =?utf-8?B?TFprVGhPazdwRHBWdUhWMXk5WXFHSnlUQUpxcGFvWEFuL1JzWi9sYzJnaWZH?=
 =?utf-8?B?eDUvdkNnZ0FCR1hTbm5jemE0d0Y0RG81ZEl4cUgvSGpqTkNqWlVUZ2NBVktt?=
 =?utf-8?B?UXdaNkVqMjUwVFFONGJTZVhCak0rTFZtaVltdDZWbDI2KzlCWUhUQXl5MGdQ?=
 =?utf-8?B?c3lRam9WczdIZ2JqeUhKclVUYmNyUWM3NFdBZE9ISTNxeVhDU2h0UGpnRjEy?=
 =?utf-8?B?MmppUVo4M05xdkF4U3hBbzRKYkxMNmpLS0tlM29KRHRTMlYvQndNeXFDdHlL?=
 =?utf-8?B?NFF6K0ZUVUkyMHhESCs3aGduWk4waFlIdllFb2FSTEZicWtJNnhncjVwaEZ3?=
 =?utf-8?B?akdNTEoySUM0dFBjdWxsUHI5MENSWDVXUGlVbjFlQ1NXVExqTzcyc0lacWNB?=
 =?utf-8?B?bjFmRktrOVY2ZVgweGlyTmFYcnBmUXM3OFlvblBIamRCZVJhWXk4VHY3MnRR?=
 =?utf-8?B?VWkzajBrMmpwTmtmYXVkT1RSQzV3bS9JSDlLOVdQN1FMSWNNZnR0b3M2UGR2?=
 =?utf-8?B?YkFNUm5JYitRNVFlWjBJSG9MY0hHK0VEdzgwMzdzaGdSdEMvQVFveS9Veldk?=
 =?utf-8?B?Tkg0b3VFcThqMFpzaUdsZlNXRGVaVVBCWW1ocDRxSEtVbXR6SklNMlgzenNu?=
 =?utf-8?B?VVJkSjB1S0tmS2Q3SW9Tbm1zamo0THFldk5WVVdyZ3FETHNHV09nTHN1UTJm?=
 =?utf-8?B?anhCcHp2UGErYVBPSWlkaUJ3N1dRVHBYSkxHcytKR1BVeURoTnYwMGRFaHRV?=
 =?utf-8?B?RWJtM1d0SHMzTVZ3UUtKbVpiVGg1NVdNWFZHU3MwQ0t1ZDlPUXFraHFTbXhv?=
 =?utf-8?B?Yk50NmJrL1lXUzlSVGcrMG5WdksxMmtDaG95N2x0M0N2cUxORlNwdFdGenhB?=
 =?utf-8?B?V1ArSnB2YmNINHJIc0Vvc2Y4cGRXMHpwSzg1U2RJbHM4eDJseGpCSTRpbmsr?=
 =?utf-8?B?YkZ2UkVucVhGdVB3Q1V0TUlMbWlWM3JGQ3FzQlpxMFBvTnEzb1N2SXZ5bE1l?=
 =?utf-8?B?Q1hqc0NEcDZNek1lbzFaM2h0Vk5hMFF4eVJ6K3RsRW93MnBZbmVCSkxBNTZL?=
 =?utf-8?B?TVJqTUFIVmpyQmxCcVFFWFYwMC9HZmIvNUJYUmd1Q3paTGN2L3RRcjk4MGVr?=
 =?utf-8?B?YmVKcmlaRXVHaVE0cDJ3VjkxQTdiUmRzVnRyblBhWnFPWDhPUE9DOSsxTlBL?=
 =?utf-8?B?K0NOSUt3MkVGMDlhQ0FQaGpmYVp2Qk5peTgxbkt0NnFjTVo3S0NPeXVVRGMz?=
 =?utf-8?B?TTJ5eDZNQ2JFa1VVZjRjT1NhWnJUTFd3M2tpWEhZbnFRaWxRdHpZN3JCVi9M?=
 =?utf-8?B?Y0FzZGtDNU5ZempPNHBDaGVJTHFNMDVTQzEvQzNFQ1Z3Ky9MMTFjdlhFaEFB?=
 =?utf-8?B?MXFSZ1VrcWE2d0NoUDNleUtqNkZyU1RHcGhKKzFzYWVMb2c0SGtlVUpoZ0h4?=
 =?utf-8?B?azZPY3dEL0NGQkQzVHFxZGxHcW5wU092VHlzd29SQ3I0bVEyYWN0bkpBeE45?=
 =?utf-8?B?dE91TkR6a25ZZEdrM0FlZkZGQ2w5NUxNZnpEQUlORENpRVE3Q2JVUkJjYXFY?=
 =?utf-8?B?OEI0bDR3S05iRURyYTBwWjd6bjJNc3FPK21vdGlsbFB5UG8yNG1DMkN4UUEx?=
 =?utf-8?B?Vmg1RXJvVnN1V1VnaU9jeWdIcmJ3SzIxVVRIQVpnSDdRcjlCSTdFbkMxa0x3?=
 =?utf-8?B?SHA3cG5RVTNZMWJTR2JHTUtNQjNjbTJJRWRpM2sxd2RFSGl6Sjdtd2tCS09H?=
 =?utf-8?Q?l00KehbBiwEdiI+YOtDxL/Y=3D?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed607d9d-b573-4aa1-6d66-08de162bee19
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 14:11:46.9619
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rv1hT0w/RvoPm9oZmw0lS9vOIR2JaOk2dmRUyj8KbD2OqJiBAtgDQ0K6+IKTjX/fhDGpgZ3xs4EEUsngy2Z3ieSEgsIzKs+MwgeLFFu9DCE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT2PR01MB8789
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_071154_261317_0D4BAD86 
X-CRM114-Status: UNSURE (   6.95  )
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

On 2025-10-27 04:43, Thomas Gleixner wrote:
[...]
> + * __scoped_user_access_begin - Start a scoped user access
[...]
> + * Internal helper for __scoped_user_access(). Don't use directly

"directly" -> "directly."

> +
> +/**
> + * __scoped_user_access - Open a scope for user access

[...]

> + * can use @elvl or a different label outside the scope, which requires

elvl -> elbl

Other than those nits:

Reviewed-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>

-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com

