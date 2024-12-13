Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D76B9E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 02:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FTg/cfpbpEdq4zqUU3lTcCM2xrPU0e0ELzEkGVCsKow=; b=jd2o+80ymRrN8qrjzDJN5t57qG
	EBGyBbdXdq1/BCJD2hy9VFktIgSjxWokS/9KfkfnI8KDO2fEQp1Qiz0jo5/CSfWPC4auF7mv9P1jZ
	0f46fWoj1zhtFSSXK6VSi2w650mJFSW/e7UJHu6+WvFVM+wV6SBeLGWw6PIcbAAr6QjaOW6CIK6B3
	Y2UGdawZ29WR3exGQrjN3lqhQUgA8xqAimaiXMYLg+nxkauZ29XblCQ5cjsdH4l8A967TuVS2jkRe
	rBGznvGI+4v8hrn261apyuWsN3EJcG9I3Zem80zBShvBw2zvJtW4pyxfwfONJFVvchVJEJklg0iVr
	uL4dtoTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLvsK-00000002Y8o-2CuJ;
	Fri, 13 Dec 2024 02:57:56 +0000
Received: from mail-eastasiaazlp170110002.outbound.protection.outlook.com ([2a01:111:f403:c400::2] helo=HK3PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLvrE-00000002Xxp-2g0Y;
	Fri, 13 Dec 2024 02:56:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WjSiV5NwhvyGWgd5Ml23R0+9Tyx/Ry96BMSbtgDrLSZCNuoo0cFjtnYgCpaT9hwAccHWxCAX1H9XuoeNTbaHrQCLK7ZgRQaQemrqs6hivjPfxecLZb/EUtZRV2jWEQ3VXtLJXR0XyQfVDuMjprd+GoRe6z0HjMEzs7g19LNFIeIufdg9d7yBQiwt0kCMyakp7XwjGoSP5MOKa6odu0pBx8f9h0oumEGvcqSVGTj2lSnAc3N+6cOodBQKrxy72oMo9fKK3/3m5s3jZGVE2rleeFe9VuK67mdEjFmF/XTzwH+y4YQVoTqBBL/3LVHvKT4Lrc3PZWYqHegZvRGDi2/3zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FTg/cfpbpEdq4zqUU3lTcCM2xrPU0e0ELzEkGVCsKow=;
 b=GKpDrmdFNws/M1PMSedMjn/+C23WqFvPXApANQR8pQEEYOhYz8R3ePzxgpjIsbN01Yteis4pG2RRaLJUT0yrdkWQNXWwgP60yRl45WU70ZkAq7aXClyw53thJuoVXZQIjqXGj5cSHVEnz25QUdNtMKSlD6kXADP9cJYMbGcke1LW4LH1Wf7d/lwCYeeNUdKe27KEOSPIejyGMG6GrRVkygKKU8RIhhFOsbHMp7ZKB8zyLxBuSjhcfBWB8DST+4o2p2zQX1twn7Zozaf4HpffdKt08l+nAOpv4TTv/is7NMUC+liHPOPL6te6TkS32nAIs65hC7YWe3k33UFIhmXx5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fibocom.com; dmarc=pass action=none header.from=fibocom.com;
 dkim=pass header.d=fibocom.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fibocomcorp.onmicrosoft.com; s=selector1-fibocomcorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FTg/cfpbpEdq4zqUU3lTcCM2xrPU0e0ELzEkGVCsKow=;
 b=wt1CfV74bj1/foa/FJIGCyz5lSYnKQSrLhRnlRYl/wzvP750YpyfKqVBsblXZHW0ER9LS5jh9QSKEErFzmgdgNdipGjrSjXW8Qt3kdrG1O+2wEFe9uZuRyCIm00mwci24nF+jsqTcq1kjguKV44rPseIqstBRafVGH3W02kY3To=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fibocom.com;
Received: from TY0PR02MB5766.apcprd02.prod.outlook.com (2603:1096:400:1b5::6)
 by JH0PR02MB6869.apcprd02.prod.outlook.com (2603:1096:990:53::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Fri, 13 Dec
 2024 02:56:27 +0000
Received: from TY0PR02MB5766.apcprd02.prod.outlook.com
 ([fe80::f53d:47b:3b04:9a8b]) by TY0PR02MB5766.apcprd02.prod.outlook.com
 ([fe80::f53d:47b:3b04:9a8b%5]) with mapi id 15.20.8230.016; Fri, 13 Dec 2024
 02:56:27 +0000
From: Jinjian Song <jinjian.song@fibocom.com>
To: mateusz.polchlopek@intel.com,
	Jinjian Song <jinjian.song@fibocom.com>,
	chandrashekar.devegowda@intel.com,
	chiranjeevi.rapolu@linux.intel.com,
	haijun.liu@mediatek.com,
	m.chetan.kumar@linux.intel.com,
	ricardo.martinez@linux.intel.com,
	loic.poulain@linaro.org,
	ryazanov.s.a@gmail.com,
	johannes@sipsolutions.net,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: andrew+netdev@lunn.ch,
	angelogioacchino.delregno@collabora.com,
	corbet@lwn.net,
	danielwinkler@google.com,
	helgaas@kernel.org,
	horms@kernel.org,
	korneld@google.com,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	matthias.bgg@gmail.com,
	netdev@vger.kernel.org
Subject: Re: [net-next v1] net: wwan: t7xx: Fix FSM command timeout issue
Date: Fri, 13 Dec 2024 10:55:55 +0800
Message-Id: <20241213025555.113779-1-jinjian.song@fibocom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <b409c23a-0b6f-458c-8e34-039338e799c0@intel.com>
References: <20241212105555.10364-1-jinjian.song@fibocom.com>
Content-Language: pl
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0204.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::13) To TY0PR02MB5766.apcprd02.prod.outlook.com
 (2603:1096:400:1b5::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY0PR02MB5766:EE_|JH0PR02MB6869:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f1c9f12-82ab-4993-13b0-08dd1b21bc62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|7053199007|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RPgLwiyiOaZJ2i4J1GCdYubY8M8ndpjCyP2F8PKH09KaI8NXCap1l/9pvY+O?=
 =?us-ascii?Q?DOAUq46ico/kFXI62b2lOjOfPMFkil6b+IMi6Gy86SzMkTzob3cympbmI1ky?=
 =?us-ascii?Q?3DAdOsrq0P++2+BBobbTDqtHHs5E+Msyh9k0FaTiDW4fhxBAPt7w7xydAcNy?=
 =?us-ascii?Q?+R09UHe7+FknWvMeI66jbLLGrUw2nEOmIWBmEjjgVSNgViK6Am3M8WysG/iB?=
 =?us-ascii?Q?RY/zGdQIf/RCPMnF0XoX1s5BnN/ejsUv6slCYH8z5pE2tiRN1a3nBgTm6VF/?=
 =?us-ascii?Q?2BigygLrWwymipFoVDu2JtyaAmxC3Tqmd6Bau34eAAVhipVTVvat+BUeakVH?=
 =?us-ascii?Q?IhCwpYObARODpBIRTUFSUn+VaXQOrm83hahFBBY1gXGwBCLIDyumvIVl/Nnw?=
 =?us-ascii?Q?CpXWehgXT/e5T3Y3VUoTFoTpR+7zcAMOEzo8d8VFlzEPNg5WB5oVr68bqigK?=
 =?us-ascii?Q?jOeaQrYU+Qt0U9Cf2lOtqJHQuleUZuSyMHnpxv2bdDsyeoiyLJhbfg0zk2ib?=
 =?us-ascii?Q?s3O6EJDdAmBvkEZbm0sb+Dv6m7R6d+iH63ZLCqr8VkZLwrVNRXDJWdYzaI0R?=
 =?us-ascii?Q?PRJh5LScgMTGkVTquyce8NigC4B0I+SQQzHmn4dVAppEMVGlFc80RihxMIrx?=
 =?us-ascii?Q?bYY28/V+LKJXEz8oG2Mq9YIjOUQUdYhOhGcvQEi8dyhBn8EDdFhXgECt2XyT?=
 =?us-ascii?Q?e59+CtF1Py9GYdfHjjVITh+ZkQvFhq/MgAyY60/KN0yDc3oW8bcihZHW4omG?=
 =?us-ascii?Q?Wav3wJW5ddpqhyZ1KNl7DZlBlN2xp0pPDSdHiq9hA8gx43o1V1Ys1c8MD64D?=
 =?us-ascii?Q?ops24ui+SfWCEnXSD+19SPBDbGu3Pf14lka3k/OD9K4NI4/eH0tDARUc09Xv?=
 =?us-ascii?Q?WQfvxprKnCMFaYhDjGq5S3Iy4rpPp9xkHDDEAbbkzfJRfnPgT4uTLN5GoDXl?=
 =?us-ascii?Q?IK/Yx7wWhtt7/XF4uAF5aRwENrGor6Bb1gDPnkJyMJXDncQo3JpSsGGskYEw?=
 =?us-ascii?Q?NXLMuYZgZRGolKz9HDf+cW5JKXy9IuyNFLfQn3pzWUVxWlZnKzl8aBo8hVa5?=
 =?us-ascii?Q?443kCZEJL7tz/q19LqnObkLeQxXL4gosE1EEdqm+LaancocjlmLu2VsWoqMY?=
 =?us-ascii?Q?80DRM5SkSP2BR0743Om42xCqUE9aQ4YrpdxM9tUihwnazI8gBOr1evsq2PKL?=
 =?us-ascii?Q?zpbJGJdJ91qwnVUJ73qON4u4aOK0DKIvFr7QCtPj0gRMrUwuMdW8xO0ysdyT?=
 =?us-ascii?Q?zmXpto33ZuVnrtGLNXG2x9oi4blobbNTTkU9dvvNew1os18KNsNWrVbqvoA7?=
 =?us-ascii?Q?mTCEnttQekIzlkspReBwyWXv+jdlqN1We9es9JwLehmbde8jLWVDPGWNyVKs?=
 =?us-ascii?Q?CPVZVmVwy5rUcKs1Awy+kac5KJweWkuSSdsPRQ0PQ1OjlB26BemwksZ2sAef?=
 =?us-ascii?Q?ESCOp+2pRp4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY0PR02MB5766.apcprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(7053199007)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gC33ddMAtCcDXn34i4/N/J8k+iOj1siAmY+Klbuev+uSQP6P6GwWZjCgplM6?=
 =?us-ascii?Q?PXey6gPZEMQB7yqkTQdXdsumz/rZV4zw/AnKJwoXpVZ3xpsJV6rAEkU4apVI?=
 =?us-ascii?Q?iUG3+JoAv0X11WZHUGDHPs2YDdw1rXSZVy7omiYEOm1JIz0jmnjjFGqMOCo1?=
 =?us-ascii?Q?1aerNVI/gtNTUfstsySq0YuFHNUN40Lju4oqCM2lNb3ofdkHQDkq4YKHRc6S?=
 =?us-ascii?Q?UMkyrqUuGvqcWbS0kylILISl7nSUYMjjVxi1WMa7fYCT8oAL76G7uFh7D2k6?=
 =?us-ascii?Q?8xgbEFHo8z/8LoV82y1b4iyQeKCgP2pVeEAjEkqlOdN3zlikKi2wgQytiTCq?=
 =?us-ascii?Q?CdOPCN2tI7T2+BJZi+pVTQsZuMPQk5vAePv4W3RIfuh5c8Cy4mhW/Y4dlMqk?=
 =?us-ascii?Q?OPm06S+ia7f+9pl4iSBOuD+Ot2A/JCt3leW32jlhkIcQ8mrJShB56IWGBTHW?=
 =?us-ascii?Q?8AxDgFjHRsXk761UpOPFiAozlPmD8GIyBpj9NuytPrqRCIYvC4Xd1I8BaF95?=
 =?us-ascii?Q?SIrkNhKFN0YFzbJ/M6tsumBIembgqtk6FxQiLa2Tq3Ped7yRxw03mYFW2CtI?=
 =?us-ascii?Q?17S9K/hld/RZ17L1j03DrysNVjS+d+S8VbB4nidqfkcdcc0ckuUyRK99NYUE?=
 =?us-ascii?Q?hp4iXIBCo8dZPpFOVgl5hbgIxbjM1Z6pELjpvp6YjUty+tq/LCWRE2qZvTvG?=
 =?us-ascii?Q?D3eXfURMu+9lLWvRD5ITRKQ/242e20V/wVzJ5URxjzeo5SW7pgftmfHCngwg?=
 =?us-ascii?Q?YzsWPNqKT+F7S2+t4Cb3NPD6feJ9tkCZ+xazNxKaP8iJG17p4cO0n+ttDCNz?=
 =?us-ascii?Q?UJ7yS79hmugHcpf1u/v1in5pjkv4Xqw/WDXWcI+C5V+YutNXThE9T6XwYsFI?=
 =?us-ascii?Q?T68k8Zj9DcHMSuy/wGVvC74nd63SWLDR6ancaEsBx9RS1etnBM3TEVNEhdEk?=
 =?us-ascii?Q?zaRlGz4jNSSQdomI5cfm7FmMQvOL91cATaGhibvr1E00vom2aycybxwn9j2I?=
 =?us-ascii?Q?wDr5GDCAWnhc2dpzAKCHbIorSBCzRPpRBzfR0M4iZSgZwhtOGuGbw7tl405P?=
 =?us-ascii?Q?1Aeoa9/lUUgEmzBy71z4dDk6DX9SI65g2WYEP/1DYzbNOAiCcrE+NZ3GrHuH?=
 =?us-ascii?Q?6swPZ/yHx1fCEXordglbuzz3F+2X+SEWZdDyb2SP4FFdP+CkzG66ml+RVbVy?=
 =?us-ascii?Q?+ltadYc7POfM6+9WnsvbThQIo4VuYF5Dt81tc2zJDqV0nTSpvsSJk6/On8Y4?=
 =?us-ascii?Q?lRdmHh9ybmBmVxhS+uDxp+nbmb4XtKfv01ksEn+nqx1Z4Fx4hysNEFHGxIZg?=
 =?us-ascii?Q?FBZMd/rcbBEiNDEoDEMfPF98KqDBJIDkA0VIgPQAdwnfMK69z/OP/GsKwIU7?=
 =?us-ascii?Q?n2d4ML9JBGk0M8avWybDQDyACNIAvKitAO9KLhYQi7SbeJne+de4KgVteOvs?=
 =?us-ascii?Q?oKC2FWo1yVOjFjOMkphnjJxkOD7OnZaaExAvz7sM8b/vWBecwcsY9P24xvJP?=
 =?us-ascii?Q?BXNdpGsLXB8LoAQE97W5EcBR5ZmP4CbIw1kX1Kwi6B/B3kmsjxR79HwwA6op?=
 =?us-ascii?Q?p/NlqE77Y4+FGYxN8Hz848H1aWwpvjn/YCWp2pE/NT3rGyxuU7z+xUkjH8lm?=
 =?us-ascii?Q?aw=3D=3D?=
X-OriginatorOrg: fibocom.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f1c9f12-82ab-4993-13b0-08dd1b21bc62
X-MS-Exchange-CrossTenant-AuthSource: TY0PR02MB5766.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2024 02:56:27.0509
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 889bfe61-8c21-436b-bc07-3908050c8236
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BDexC9zkpLyQNkLgMi72CeyATKYW1TvYrjhCus9mH4OjBYnOF8lfVkSynsZEdZyBd1BzCPt1xnt6pyioj0//7VgKyzCiNWkkKe6VyvhoKyI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR02MB6869
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_185648_841886_0FBD7A78 
X-CRM114-Status: UNSURE (   5.65  )
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

From: Mateusz Polchlopek <mateusz.polchlopek@intel.com>

>On 12/12/2024 11:55 AM, Jinjian Song wrote:
>> When driver processes the internal state change command, it use
>> asynchronous thread to process the command operation. If the main
>> thread detects that the task has timed out, the asynchronous thread
>> will panic when executing te completion notification because the
>> main thread completion object is released.
>> 
>[...]

>If this is a fix then should be targeted to net and not net-next
>and probably should have Fixes: tag.

Hi Mateusz,

Please let me request to net and add the Fixes: tag.

Thanks.

Jinjian,
Best Regards.

