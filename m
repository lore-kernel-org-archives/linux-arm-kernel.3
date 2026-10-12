Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 630D1CA9ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 09:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MnzL4pSQakgcHubhE0krEbzc8pSJ8Ibb5Em/+38fXDU=; b=VA9qzg5u4n8nIjcaZNl7HPDdrU
	6GwWlDpMocWt72uOefXQs/Vl6+dAyiri75Thq6vZb5lHglIseotqKCLNCWC2D1haem4pVCj1ZO8hH
	/ylwzCNanpKR2iySx8hstHkVrGBdeCsGY8k4PSbsdcstgNr0kpT4hKlXlSy4cfsKRustUGcKhsf5A
	3BGjjFNMP10WZ+p2YyO/q1CEpM2e3wxQYX3rgW60lEQpKYE/8GnSjgVNuEb4MqaBAvxfx7Qvi9yt4
	QlXbEtuv4hg6qT/M1LZngwL1ys1e2GYjxqfBogxzpotaD9JB52XrM95augFJaHlhXEwbLHqCzWd1m
	1+/gGKnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGCcJ-0000000A6Ld-1zsx;
	Mon, 12 Oct 2026 09:46:47 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGCcH-0000000A6LA-20Jx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 09:46:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SvNVr7mjlaToS1TLvMOWlboskiwP1uzrQjFuTec+5MrV5sPeeJpjdbICUz4k7HZh0nSar6/c30pIjCusgU5JQNd/482YH5d+nUylQTOs4QHPRtdkQHUBmdYK7ZuNFb1DOOJ2mp9qifIF4ZGE58zx4qcq9o4nKKDOMRWwSVJ5Gx16MfeM+CaJoQz4J0C+8TdGftOyZz1Rqo5NXPSo59Hn4qvfsJYYXc2naKmFFDvhpKF7Ar1QdfUHJy0Z2JIjV8vnHLUp6OWWeHKgmd0a7NcItkT1JCO1uye7eeGijBggJN+qjlVO+T0WVG/UR2E+RsA3ChAZKOLUc3XMkUC0LFQX+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MnzL4pSQakgcHubhE0krEbzc8pSJ8Ibb5Em/+38fXDU=;
 b=ciRX9DRNJ2fF9nt3uuZp+x60HgRQLIMpfYgyK5DUPtlR3sHtwSgnO6tydlldj0pizKf/J5nnyH8IKlCTwSw+iysSR49KtcZjofIyZFmeC3Dhycr3cZ+P2vYNAzMoAPoO4QCW3+R6juamWWt47mUxc/FaOW2fAXkfNlQF8VO0bv/aO3DeyS9XQY30cc3AciWW8WT0B/IxeJhHyXG5OrutwmNKpv56KPgQm0GxHvKwMlWrfALqFEG5TgSzYSv4U/O1ISXiXbBfJD5npdyEweknkbz3O2U2gLOx0aIhmgBsgkbY/Hf6qX/9wz7uoNHQz9aKxZNBU/ZfiCLILp2VXDisMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MnzL4pSQakgcHubhE0krEbzc8pSJ8Ibb5Em/+38fXDU=;
 b=cNctp+TvmpPiSv0nNm3Kc3qvWjVC4LgZCOw/kqcHIVTV8UgU3s1vSJgDxJ1XUQQNyDyCAZOeryoE1mG6eWa3Nxgd3NUfZT1nma7wHn8Zja3zsmiFkefvuqX2UezBNVsYuoS5dit4AiRXlyPV/kk6YMAz3nhUyGXERkmg3O0Stoesr1Lwk2FEbVthxeqq2XbvibdLY02aaV6YZHf94wDXKGJD77nFJkgg8VEMyMRaFv0VgUnYRniKAZfbBCCXwmA/gF9EN0J1bcZlsdJEoKWwJ+HfvhWtRpYdKR9CzqzT7DXcI3q+8jHdxienrOvVM8MHvwVv5NQFdRnakN38o6ZzAQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AM7PR04MB7064.eurprd04.prod.outlook.com (2603:10a6:20b:118::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 09:46:40 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 09:46:39 +0000
Date: Mon, 12 Oct 2026 17:51:14 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>, linux-gpio@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v6 03/13] gpio: mxc: fix wakeup_pads bit operations
Message-ID: <asytkrYip+v2vl/i@shlinux89>
References: <20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com>
 <20261011-gpio-mxc-cleanup-v6-3-cb47ce2ad758@nxp.com>
 <CAHp75VfCrQAnVYV-7wiga-R8A4VKgjfV+EHo_7jy=FNmU=Ov6Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VfCrQAnVYV-7wiga-R8A4VKgjfV+EHo_7jy=FNmU=Ov6Q@mail.gmail.com>
X-ClientProxiedBy: SI1PR02CA0055.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::16) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AM7PR04MB7064:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ef16ca8-b5df-4548-2ab4-08df2845b6fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|19092799006|23010399003|1800799024|4143699003|11063799006|56012099006|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info: 90wR2rHowD1XPMylU+8RtCXmx7WkGPf98UjtszsgdzgxTD4kyRhuBr3EsZ2pXqbpbjyneQGL/HE8hRW+JOerYJ6VVSE7AdzB9bT+t0gznXI78uAt2oFWrpfRE5A7+JFYP1e+d1erAOcnzSlCOJYT8ndi/bptt+2uZVCFDKXrmUgHMeVAltZLkvmpKEMLgXsinjKyQcwgrsln1qR4D4/gloPCxQfEEtpd22JqUt2PXd0lMuknsgBvWDtMhk3t8++Hs+HJkDOk5FrDpxGH+i1lG5VNv/rL0AvgYpxc4zzH5sVOJ8GnPkVZLRaKkf8oTVzonaDJk5mDRg+waiPcuFI96q5HPLOjJ0W5SyVvP5kkukdaTaMMjJkleGgr4iUAil+j5ADTqJulBndo7Im+BsNXZSPYPAdUl4JyAkDbTCzgPq3DRMHQQk3vdMVfzdTe2XGaH+oHy1d/UJQJrefNO3VWNbU16NH9UmycY+/IuwaOt79zCo35pKT+Un0qWDyjXPcVHFaEmV3WUq3tc3TxunwvvG6E0b2Vdoko9fOC1YNYiIe8QWVPkIZxNeXzXNb8XyCwgKiPjwkoxxGJe/YGrMlL4DT49T8sdYgse6fdiDBdpWcQVFSP9YWMWcmCbWWRh7uirresus0Gvl9VyN8nldO1zcq6NBK8oW08/jqMe+ykUWo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(19092799006)(23010399003)(1800799024)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TjFGOXp2Mm5RTkZLYjN3Mk9WTG1IMW1QYjZRdmxocHhYWVFLL0I1Nks2QmVy?=
 =?utf-8?B?RWNQcEdmZ2dpZTBXT3lDelh5REpZaG01Znl0VlBMM0ExeDNXdWNQOXZ6SlVW?=
 =?utf-8?B?YTBvc3ZzL1Z1QmZ6amVNd0Q5WUhQUSt3bDExM2NiZk1PZ1R1aEJsQ3J5Umc1?=
 =?utf-8?B?YUNXaU1ha3lNQXZwUkNxZmtOd2YzdGlpN0FHOFR4WkU2a0RJOU9qdW5xMkx1?=
 =?utf-8?B?T2J0eldqY1VuTFU3SjdyRVZmRi9Xc0pTZGROeEZLYWtrMzRmRGxaeFhaMTQw?=
 =?utf-8?B?cWc0NWV3Q1hKdzlGNHBTTklvNFVPaWEyMFovNEZYSkJqUCtVK1VUQ2xycVd3?=
 =?utf-8?B?TnNhY0VYdERKWFU1eU5uYnVrKzcvUjBoMVRZMzB3ZzloNmxMeklzanUrakpH?=
 =?utf-8?B?Wmc3eC9aM2t1Wk9MV0hQQm8zT2NPdHVpazJJMkhvelNKREx5TC9xTnF6QnVx?=
 =?utf-8?B?YWZUUXdjNFlxUlg5VDdnV2hmL1pjRmhYbGgyTk5mVXpBQWZSZVpPcnVFandJ?=
 =?utf-8?B?OTE2RUdkM2FVQzlKQjNzbytNZk5LRXh5WWZOQml4SDdubGVGdU5nYTZwS0R6?=
 =?utf-8?B?c3ZnMTl0WElaRWZraDd0Q0lWb2pXZUZqcXRteTJ5NnRoY3o4STFDcUh4dWl1?=
 =?utf-8?B?V2d0UFg4N3ZhZjZicWlDeXBaSmNhcWRTRmZBK3ZIdzZtc1dMM1JQMGNKTHpC?=
 =?utf-8?B?UzdUTVJvZ21uUVR2bEhFd0RLeEhQTWJCY2YzT3lSMitlUTZXa1ZidSthMEtI?=
 =?utf-8?B?Zk5vZVRtQUd3aWJXdnNTRHpRTDVHa1RUbWlKem9vcE1tZUp4NHFNZlNlcDNr?=
 =?utf-8?B?c2tpekFKenc1QWYyTkNiZ3p0QmlXVFVBQUovMElmTHg1di9UcUZta0NFY0I0?=
 =?utf-8?B?OU9DY2swRk9MUE5NendJREdEemJBbkk0V0JndllnRTZYN01WdXZwdmZXNkFZ?=
 =?utf-8?B?SXd0NXZCT0U5bWRIbStaS1grQTRwY3VnOUZFYWV4eUxpMWZPNGhHQ0VxenZo?=
 =?utf-8?B?d0Q3cVNPYlNlVHNSOXpOUVFXSE9QZzcyQkVHaEFyYkIwczhEbnhjMDdGV01t?=
 =?utf-8?B?ZFhaUGFCMFhYNXM2YjMwL3JzU0txd1VERzUrQlZFRDU5K2xoUjc0OGJyaEIv?=
 =?utf-8?B?a25EbjhMeVEveWNkWWFzNXNnZ0tCZmovaEM1Q2dWWDNsSDRMTWw3ajAzeDNQ?=
 =?utf-8?B?ZnZMUi83VlQvcUVOb0d1QlZkOHFGWkphc2dHUS9TZVA2VWY1YjNOUVhZTFZG?=
 =?utf-8?B?TS9mV1RqY0lZSlE2cGsvQzBIWE9KWmI0eHEyT0lBSGNNU1ZLSWo5UURyZjVh?=
 =?utf-8?B?ZmJydk5aS1dEcWFyQlgwV3pjUGxNd0R1WWxQeHdWVy8vQU5uS2psOVJuaVhE?=
 =?utf-8?B?OTJ3bTFoMFJQMngrRWlqbWlha2RFaEdxZGVwZXhKNFZvY3FFQVdiV2JQeEhi?=
 =?utf-8?B?T3M1eitjMDFIdXFYTHIwUUM5MmNBbU4zM1RyM3JWMDczWG5MRzY4ZEFYejIx?=
 =?utf-8?B?OVJGL1pVMVFOVFNqdUFISHpiSC9kWlhKQzhXWFcwQ3Z1NlVpZHNraXVCQ3Q3?=
 =?utf-8?B?TldCV2RVZ1VweGFXZ2dWdlpUT3o0N2s0WkpmcVpxbUx5d2srNnhsbUJtU2tN?=
 =?utf-8?B?dllKeDR3U01nS3RGTkc2SFBlNHVhTnp4dXBxNk9sdFFBaWV6YVlPbWhOUnlX?=
 =?utf-8?B?VndUOElOOEE5bUtkRkNoL0FKK2FTZWt0QTRuR1ZUaFlxcDAycERMSTUzS0Zl?=
 =?utf-8?B?blFhRnNnemNHNWROanFGQlVQbkxMZTg3bE9ML1ZlMWozRlBFZEREdGxLRWEw?=
 =?utf-8?B?R0dPL0s4SmpYYXlpdUlBZDhuaC9uRENNTG1UVU00blVucUdJWG82NG1uQWsx?=
 =?utf-8?B?djlodlRqRnJ0eXZVcVZtMFNLNGNFMEZYWjk1Rnp5NnI0SmNlVzN3aWdjNHBa?=
 =?utf-8?B?Vkhld3NWb0hoQUFaQXJYZnFFNlhpaWJsb0huZlF6SG5tdFI1aGl4MVl0ZlRp?=
 =?utf-8?B?MjhONmExL0Z6QmxnUGhKZ2VhUkhBcDQrYllSTkdCelVROFdmTzd1TDhNbXV4?=
 =?utf-8?B?aVQ3MUFXU2lmelYwZnk2RWxkSVpiRWZHR2NKSHVzVHFvTU5FOHE2Zm1JOU5T?=
 =?utf-8?B?dDh1bzZxaDV5Qncyc0lRc3U0a1Q1Zy9nOTNoOE9mUkVjRGFSMk4zUVVRWm5q?=
 =?utf-8?B?VndBOS9Mclo4cnpQdFErQ0NPQmJvWlJyaGNKYjNHdFE3UDhpTk5CbVBzeS90?=
 =?utf-8?B?ZjZkNEZ2QXBTUGtPR3lkbUpIUXlna21HK1I1Q0RaRFlnZ21laEhKM2t3L3pk?=
 =?utf-8?B?NUlPdFVERk02dmp5blFrdHBVQWFCVCthWkZ4MWEybnVHY1NxdS9yaHZxR0R6?=
 =?utf-8?Q?fm+E2LWuJqE3YciOxJK9WAvPEEyYOsuFq0cJc?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ef16ca8-b5df-4548-2ab4-08df2845b6fd
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 09:46:39.8921
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +HMbvcCx7iVgyTlwC/7G7gH4hnOltBseD5rSVlnrBt0DJ2Jn3b98JY4O5J1bdq5fxUzsTVS9Op9E+nzYYt3kqt9ObmBCxAIsz0roLEubHdnMF1OQ5DRKRQcdZd2Hs71V
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_024645_524085_E3E4E0D5 
X-CRM114-Status: GOOD (  11.54  )
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

On Mon, Oct 12, 2026 at 12:15:28PM +0300, Andy Shevchenko wrote:
>On Sun, Oct 11, 2026 at 2:54 PM Peng Fan (OSS) <peng.fan@oss.nxp.com> wrote:
>>
>> gpio_set_wake_irq() can be called concurrently for different pins on
>> the same port, so use atomic bitops when modifying wakeup_pads.
>
>The code doesn't modify any reader part of this member. So, the above
>paragraph is incorrect, right? Otherwise it needs to be clarified how
>assign_bit() does change anything.

I will replace with below:

gpio_set_wake_irq() can be called concurrently for different pins on
the same port. The IRQ core serializes per irq descriptor, but
different pins have different descriptors, so concurrent calls for
pins on the same port run without mutual exclusion. The plain |= and
&= on wakeup_pads are non-atomic read-modify-write operations that
can lose updates when two CPUs modify different bits simultaneously.
Replace them with assign_bit() to make the modifications atomic.

Thanks
Peng

>
>> wakeup_pads is a u32, while assign_bit() operates on unsigned long
>> pointers. On 64-bit platforms, this causes an 8-byte read-modify-write
>> on a 4-byte field, corrupting the adjacent is_pad_wakeup. So change
>> wakeup_pads to unsigned long and reorder to avoid wasting words.
>>
>> And fix the enable/disable path unconditionally sets/clears the
>> wakeup_pads bit even when enable_irq_wake()/disable_irq_wake() fails.
>> Only update the bit on success.
>
>-- 
>With Best Regards,
>Andy Shevchenko
>

