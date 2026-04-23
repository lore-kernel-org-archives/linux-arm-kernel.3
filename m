Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47D01F589AE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 12:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lPQ0wGwknf87KCyxpZgTOzK1e605K9MM9iwmk1ThPFA=; b=UfR2dkxFYU8XMR2dx15WqDaIJ+
	Id7agpF56Ygvkhdw/RyJTez9j3239qrps+trAZPPmbreNoT4UPzlZ4E0P7l75LCbavVball0v10tR
	rS2rjMGjoH3Jjmnbivpz1vDhJZ991u7BP+pjZHGVbAY2ffYQFYtpGiez/X7s2RqsRpfBOGlVMsdvl
	9FourgcAqP9pjSaI9k6F2HBGwQ0rAcL2qpfF2YXhuN2sKkVS+XOKAleq9rnghYZ/ZUtYLV8de8wlt
	hCru/HzVVwMohmO9h51vY4S/Rm0I3OxeXwNCxHn6YrmNAxBGeRwqEiZw8NQc6bu5zhB8ePa9rWLBg
	q0HlUraQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFtBu-0000000BcPw-0YcD;
	Thu, 23 Apr 2026 12:29:58 +0000
Received: from mail-canadaeastazon11020112.outbound.protection.outlook.com ([52.101.191.112] helo=YQZPR01CU011.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFtBo-0000000BcPZ-0azx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 12:29:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cmZ6lUUqAATVV8Zo8Mm6HiB0b+PWYEdp+z+MnePIPoxdBftCsogJZExrL12KzHENcqE4be0CGtCWP1Tt0SkCnNmIRfl+QYlbfrSFOiFEDZlEPVuybkw2RWS8/HhMYJzBZH2Qhly+mm6aYPQTOCM0PKM1m7Htjusn+nAMZqQhbFxtHCl4MA/oBeUlwsg7ed84z9Ri/A6XLJcWHxn3LgUPDtGuOPC0qrprtKvTbXJ42Es03kGmox5yM5Ikygw/ai1YpyNk7oto2OLAIj0USvakWT8LLXMj6jblSgIUPlZjBpkVGAFS6MSrcoFE1HMJdENZ7yAtIAzUUbCLzjjqhcIWqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lPQ0wGwknf87KCyxpZgTOzK1e605K9MM9iwmk1ThPFA=;
 b=qOr4GxtI3eiS+0VAB8XE7e3i0PCZpFALW8E7C+vR6M3gz42G+aMDTuo7tdzaqVZmE72MCfudGB63MtTUcBGBa9AUED7VHrvxPVqIjTfRBFH+5e/KzrXIXb9TfGh7OBu+vzRPgx4gFiQ6ef10ubXhzrVa2Qofxfu2TuRwBqXaLXPsYQZvUbjySQUggYoGEwFiKYiM6KajmC47cTrm/cKQ1iTtIqXYjzLQY6hE/ouCz7N+Tq3O48e2pFQsYKhenMx0/WRLxHlSggypZsKcPxfQhzeF3N/BshQGXtxI1Q2rX9dibi1q4G2zRcaUqhqGKG/tpMcD603D45MSytRFT63Khg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lPQ0wGwknf87KCyxpZgTOzK1e605K9MM9iwmk1ThPFA=;
 b=oWxmwlXVDHbsNhIdGMOQ+xX6cJDC/OKp1lOndv5FINOkEi9uFC9AKt7pF7gmJSPjcwZBYHJbJ3vyacXAEDzU/Ul9hnSLNQso8cUbxmo2DWmipjiZX9vNjKxVzXezQNr6V/awdTPsA/X6b45d2XhbQZBb4h0bXEwCyzbD82vLSaxeTaBdvTu4kO9aBLmCaDOwosbinJdY6QRKh3mGHzI3VpYvp9NFZ18rT+fBMAuQgIG0tBTZNXsgNGAs2LaI8ME/ZBhji9RnJgq38mP9GOPSGoZ4xQLd0QCCOZOACCWSgrY7WqLda41A6V5qCPndCCwcYgHKlg4+x3R8Bct1SeHQlA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:be::5)
 by YT2PR01MB8952.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:bc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Thu, 23 Apr
 2026 12:29:42 +0000
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6004:a862:d45d:90c1]) by YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6004:a862:d45d:90c1%3]) with mapi id 15.20.9846.021; Thu, 23 Apr 2026
 12:29:41 +0000
Message-ID: <1e839a25-d15f-40d3-ad6a-20469fb6137c@efficios.com>
Date: Thu, 23 Apr 2026 08:29:39 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] rseq: refactoring in v6.19 broke everyone on arm64
 and tcmalloc everywhere
To: Dmitry Vyukov <dvyukov@google.com>, Jinjie Ruan <ruanjinjie@huawei.com>,
 linux-man@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Mark Rutland
 <mark.rutland@arm.com>, Mathias Stearn <mathias@mongodb.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>,
 Chris Kennelly <ckennelly@google.com>, regressions@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>,
 Blake Oler <blake.oler@mongodb.com>
References: <CAHnCjA25b+nO2n5CeifknSKHssJpPrjnf+dtr7UgzRw4Zgu=oA@mail.gmail.com>
 <aejCaG6n9s7ak5TO@J2N7QTR9R3.cambridge.arm.com> <87zf2u28d1.ffs@tglx>
 <aekPXvvuKHKlETjm@J2N7QTR9R3.cambridge.arm.com> <87wlxy22x7.ffs@tglx>
 <c5331cd6-76c8-430d-978e-fcad164e48f6@huawei.com>
 <CACT4Y+bxnQyHGdVNE1BYTx+Z2-cscLb38HYS9jBM5gPAz8=4bw@mail.gmail.com>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Language: en-US
In-Reply-To: <CACT4Y+bxnQyHGdVNE1BYTx+Z2-cscLb38HYS9jBM5gPAz8=4bw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0344.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:fc::29) To YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: YT2PR01MB9175:EE_|YT2PR01MB8952:EE_
X-MS-Office365-Filtering-Correlation-Id: 7da60632-af83-42b9-03ea-08dea133fe33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: i2NUQQDoVDevkj/T+MdX43Ry3wyV6rOuTuKtsB9RhT0ETZE07Jb5mYovqmaHnwhj9Simfs+1cmDS0rTXczSx53DKfGkNHhC+vylIaQZub5q2tCn9kDqTnYGiae6r2Dmceeu/Qqv7eY1xaoXUsoZQZKgNEjGZL581A09RGf9Aku6zby66ebEaX0+k2JOapjnJ8EJTF+wxpoNIqczDoDeYoGI8+W+2fQ5PzV6qJOHbAUM9La6KiGlfNHd1NlgbgRYkGiGr6AG/MSktOMjObDWjklLAl+jkHKNqWTPWyAY5aMgU0O28gY4TQgsb4R5f0mB29KbbdA8gJ9aySwtIxwEryzZ8QGk6HWa7Qqq/YGcCyHOlk33/9rQgRdHUK8sRbgJ09mcT6NAvvTx9rPJvwL5HeNB+1tZWbvMbvC2FQ3Jje7t5nqFR2/AWq9Fv2S0a4u6kSV0IAqBX0ESMrL1jmDTnY1brqmqFXjw2HvPFyZzjxgH0jGfHNuAO9xJaFKLmRihvmM51/HJXQ7ajiqaDkG6ivKOpKgU8SAAFTV9EjR3CNCQ9wIfRc37puE/d0u8Oh9S0MYYj5PzpZ8SVtk9rSZD8b3D9G9HjQJzUc9UhRQ7+ftkvC+sEJG37loASTWiEfAkpZEnyohtxx4gT3NHIbXLaOH+ohl9/hqImibacr3wI0yGuWJ4OEHR3LKHZJeK4pzTV
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHlHMzRkbm9iZVlqWndqZmxyQlpYYmxscjhnTXExb3NMQy9vS0NhUkpXQXc5?=
 =?utf-8?B?M0ttMUpRR3E2REE1VGtIdlUxM3hwNXJmNVNZenZBOHJCUU1la2xFaXlkUkdy?=
 =?utf-8?B?c09iL2theWQ4a3R1cm9uZ2Z0MUJWYng1U3JjK3dWRW1OOWRYalJMaWhncEVS?=
 =?utf-8?B?U0dVTVJTbUNUVDF5UGE3ZStRZ0xYK2VGeWJlZWFQY3c4bVFyZmQwa1B3Ykdi?=
 =?utf-8?B?ck1OZDJOSk1BQmkyMzJhU2ZZQkhzSnJVTmcrYlNGUXFUbVZCUGVYbExiL3dE?=
 =?utf-8?B?UnlxTDNTTm5BSitEUldkTXpCM3BhOXphK1dDZVVqclR1bkZDZHlFTFRBVFpV?=
 =?utf-8?B?VlhLOCtLdEFFVXhuM281ZEZqZm9JbWh2bHRxb2ZDMDNiZ1Q2Q283NW91cnVr?=
 =?utf-8?B?dXRxQ2FPakRya0l4MTFVbzBhOWczQlg3VGF3YW9USXVaTXpUcHVvVHpCcGFm?=
 =?utf-8?B?bURUY0k4REJxOXJ5bFBITGp5QWR5MVI2U2tiSDI0MytDZjJtUnlTdDB1NjNU?=
 =?utf-8?B?RnROWmRVdU1EcVdwcy9kSHRka09CNFpQdmpDYVV6VlFuMWRkb2piaGNSdUtr?=
 =?utf-8?B?eUdETmgrRkIvQS9IeFhxODhqRXJhYjUwb04yNk1DdHp2a3BQdGg1SzhxK3M5?=
 =?utf-8?B?eHpBN0lXRmI1M0JSeG1IZytlK2M2NnFmTWpKbU9wSW1jeTZOcm9HanhmOXZj?=
 =?utf-8?B?dzBaM2ZjcnU4TGdnQm0wbFhscEtLSTlVclExNFZBVTJuOXBCbTh3dkFqT1lT?=
 =?utf-8?B?QmtOR3RuYXB6THZsMkR5YXdsSW9GNEFDeFJVYXh4clVtaTdsZE5JMENVL1RR?=
 =?utf-8?B?eG1icnNsM2czaUhPMmg0OE1PRFUrSFRnUmJtbXJHTlBqWlJGTlZmQko1Qitm?=
 =?utf-8?B?cXl4MXBBZXNEUXBNRUd1K2ppYkM5dW1udWtLLy9ubzdDTCtMNkFFSWY4YTgy?=
 =?utf-8?B?UkIwTHluOHNWT05pNUZ5ZENoMWJhL0JvVFFzeEEzaUt2ZXJqWkR2V3ZWamhs?=
 =?utf-8?B?WWpabEU0alFsUVdrUmFUMlRFek9VNzFoMU1UdzhDWXBEZXVWWmU2UzFYK2ZZ?=
 =?utf-8?B?VlJTemxzUEdiUFRyMEhXd3MwWDVwWmg3NG9UazZwUytiMG5uMVRZZmNYc0tY?=
 =?utf-8?B?akVMQkowbUJrY1hPdXpYYTVmRFRMdkc0U2UrVTNiV1d0dzVXZmdFUHYrR1Ba?=
 =?utf-8?B?eGs1eW1KV0tJM1lvbjdVMnE5dkgrWmFsUnVIUmZaTGZBcVFmN0NtVVFaL3V2?=
 =?utf-8?B?dzRid2FzTEFJeCtOTERjWFJUOHVFMmhmM0MwbEdmVHpyZlVXNmZqZ2RxUnVy?=
 =?utf-8?B?eURYYS92NDRQSEZRajZnZ3owK1dacDBxOHdBQUFkVGtGanVRblVLQklKL3Q4?=
 =?utf-8?B?NUMrRDNYeFhqMUxvcFZDb0NlMy9tMEJLNkRUZy82Wi8rS1pHN2c4SjM4Rk5z?=
 =?utf-8?B?Y3Z4ck90Y1AycFJTbElXUmNpYSt2UUVsVHE2QVRQNTNBWEc2UUlBQnpjcGcx?=
 =?utf-8?B?eWpTUWJWNlFYaGNnTVhvVE5yNXFnb0I4UU5jSDhaWGJZbkx3N1IvelRETEpN?=
 =?utf-8?B?WmVFdVF1TFpNWnppbmd5SDA3ays4bXZwcGlmYzUvVDVCUVR2Rzd6Vm5wL1cv?=
 =?utf-8?B?b3laY1Fzbi9pcjZydXh1NlQ3U25yaGVhNFpjN3pBdkQ3bHVMczMxcFVWV2Yv?=
 =?utf-8?B?SWhLajlqbmVRcFBNOVhZQTcwNWU2ZEpFOWxiM3dhOFhpc2ZEYlo3aTNFeUNl?=
 =?utf-8?B?UWhIcFRWT05xd2tyMFMwQ3c3QVhGWXd2NUNJUkx0ZUcxZXFsNm80dVFEQzNZ?=
 =?utf-8?B?QkdWRmI1R08rL21tZVl0NDQ2ci9DL3drb1hzM1dWMktDVUhxQUJuMS9VV0RI?=
 =?utf-8?B?NUZRZ216Q3Q5SnFxOUtEUnFSZ2ZsZ2x3Vlp0RVl4V003YlFwN0ZOajB2MTd3?=
 =?utf-8?B?V1E5ek5RK2NBMmE3SGNVc21ZWU5YZDZEZXNxNUdkRGJDWDhCTmt6aXA1aDJj?=
 =?utf-8?B?b2pCNWVMemVVaEpoTVdIRE9waVBzRWYzamErWkUvVWRTenRlL1FMZE10TnU3?=
 =?utf-8?B?Vm04eWRUWU9yamxzWkQ5MGhqL0prdFR3OVRVWlluOUdNdHhGc2Z2d0czQlMy?=
 =?utf-8?B?MmNSajl6ckhTVTRKR0NNZ1VXUXF5Ykx2UThpamxFdWNwU0hCWmlzdEFGOC9X?=
 =?utf-8?B?bkk1NGwrZ3ZqVkdRM2VXazhIQWlzVlNsUE1JZ0gvc2ZvcDJneElFb3UrZUt4?=
 =?utf-8?B?NUpVWk95anlGZUFHT0o2dlhUc3hoREQrN1JHYklZdHZQa1ZwL295eW5TZUFJ?=
 =?utf-8?B?WUQyMldNWmZCNXZJUkV5d0VxV056Z1FYaUFlZEk3M3IvckRtWGk5OHo2SE03?=
 =?utf-8?Q?GwKUbeMeMDQeItl0=3D?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7da60632-af83-42b9-03ea-08dea133fe33
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 12:29:41.5331
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZBNG/YXUUfslMOA+TJ7TWhF5soRtslx/2ib8g3Xt5ghsBIVsBglMbiOzC5BKyEK4zq7O29d7lORTAISlQDTHBVM3vdURMyBGCpnjtf4NyoA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT2PR01MB8952
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_052952_200844_8CEACF16 
X-CRM114-Status: GOOD (  13.73  )
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

On 2026-04-23 01:53, Dmitry Vyukov wrote:
[...]
> +linux-man
> 
> This part of the rseq man page needs to be fixed as well I think. The
> kernel no longer reliably provides clearing of rseq_cs on preemption,
> right?
> 
> https://git.kernel.org/pub/scm/libs/librseq/librseq.git/tree/doc/man/rseq.2#n241

I'm maintaining this manual page in librseq.

> 
> "and set to NULL by the kernel when it restarts an assembly
> instruction sequence block,
> as well as when the kernel detects that it is preempting or delivering
> a signal outside of the range targeted by the rseq_cs."

I think you got two things confused here.

1) There is currently a bug on arm64 where it fails to honor the
    rseq ABI contract wrt critical section abort. AFAIU there is a
    fix proposed for this.

2) Thomas relaxed the implementation of cpu_id_start field updates
    so it only stores to the rseq area when the current cpu actually
    changes (migration).

So AFAIU the statement in the man page is still fine. It's just arm64
that needs fixing.

Thanks,

Mathieu

-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com

