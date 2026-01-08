Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9365D232C1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 23:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=imKV5kPsk5q9GcWMMI6dFRquiia5zpOBg9BeNYRulYs=; b=tq46rXqj+mWGRL7yAtWfejeeqa
	2Tv/fQwrdFqXg+A3v6ts5b60Sr77HeoyGG6CinKSJHAccDGEJ8XXDXQK6HP2R3d9e/OOPygb0NitP
	qUa5wUZwHpCRfmoONVFf0OEoWC2XJTGtEa7LZoPm9LoUfTGu+4M9JwpvlGLlryxccMei1HEFtfUNb
	A5txujny8QdqqBdPe0O5S+VrY+Q1ZeTM9cBvg/SMtOUk2BUfoGlGufYmpUxJ7F4W9RiZT+VcCfirw
	WOLPDj9Ac8i14PNxNIuPHMVjUIjUemJvOMVMu1LqeFeYZezMRcHuRXNUcCMiByc7Kek1BtPXXx07k
	E49ZrL/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdzHy-00000000zmO-0QBa;
	Thu, 08 Jan 2026 23:19:34 +0000
Received: from mail-westusazon11020134.outbound.protection.outlook.com ([52.101.85.134] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdzHv-00000000zlj-1oIN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 23:19:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yi1qYZeipcHnBAQVk5Ugn5Ib21vFFGN81OOSbRuXm2tDb3/Oqzc/gqetK+WCzokjFDOs0Vz4PIsjbW9aV70b4bqFyagKqAJjWk6ek63qwedNuoo48S7tsBDN9f7bCGQQlKngAPa41EiQjF2dfJfBP6UH4xZkhtfkcFwGcJkYILl874klTwKI3xjNqmJyROAtUkTd2X8WGteB9noDOAG3oBdnges0hCpo2nhztO7OZhlXU5quZQ2fOhVAkTKM4eGlV9mcc0A3/nRLl1xJrtM/ZZ569pjRppqphyqYKij0/AMtEGcHrwtBtzYO97ma6hBDXsc6KOOJvUFZepyhZ2NeBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=imKV5kPsk5q9GcWMMI6dFRquiia5zpOBg9BeNYRulYs=;
 b=E4eUa7HlyUdXx4qw9YkBmOd9cfjE/rox98J8OrNZhlIFeu5o1W1r1QQF2Fo3I4xZ11ntK0sXiF/WXBUZsoxsHj4Xy4RTmLM3qvQUdjZpX5n/qt+mInHEf79usFxoe7TIwPvJFRYSXM7yp4/r2EquvM7f9wKD38P0+TUaQ/4wIORma8Mzut4282RJxat8+57c0wzZ/5kZG11HnfgEFjQiw2HiHo3ED+A3BY9RaidYhLfqP4Pbv/PugBTEXhLHs7yIhQl3MtbnUHBBRTMCMLR0OWg8q7UNRCRHYrhIr8O+5GPFLodHIBdNKpY1zzo03KRzZGUuU3cn5GrQT6N9B9dcmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=imKV5kPsk5q9GcWMMI6dFRquiia5zpOBg9BeNYRulYs=;
 b=uq8dAe+EenLtPow7izTwjwjd6M5zVrysTeHT/DhYrnePH/6UdFAMTYNZguMG5H7tl47lFEqmmdd/i8yhULYYL8Pee3si24TwgVwjDZgJ24kAG0pNs+uOMOA+iWSyVZmfLKdmjQdO5M/MYyWArQdrqdg+bVwh21j7f3Xyf8afzoA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from BN0PR01MB6862.prod.exchangelabs.com (2603:10b6:408:161::11) by
 BY1PR01MB8970.prod.exchangelabs.com (2603:10b6:a03:5b5::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.4; Thu, 8 Jan 2026 23:19:21 +0000
Received: from BN0PR01MB6862.prod.exchangelabs.com
 ([fe80::8a1e:34a8:2ad9:7f83]) by BN0PR01MB6862.prod.exchangelabs.com
 ([fe80::8a1e:34a8:2ad9:7f83%5]) with mapi id 15.20.9499.003; Thu, 8 Jan 2026
 23:19:21 +0000
From: Carl Worth <carl@os.amperecomputing.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Taehyun Noh <taehyun@utexas.edu>, andreyknvl@gmail.com, pcc@google.com,
 yeoreum.yun@arm.com
Subject: Re: [PATCH 2/2] arm64: mte: Defer disabling of TCO until
 user_access_begin/end
In-Reply-To: <aV_7Sm96Zf1Gfg9v@arm.com>
References: <20251030-mte-tighten-tco-v1-2-88c92e7529d9@os.amperecomputing.com>
 <aV_H9h-nSM1HlWnR@willie-the-truck> <aV_7Sm96Zf1Gfg9v@arm.com>
Date: Thu, 08 Jan 2026 15:19:17 -0800
Message-ID: <87o6n3ae16.fsf@rasp.cworth.amperemail.amperecomputing.com>
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0310.namprd04.prod.outlook.com
 (2603:10b6:303:82::15) To BN0PR01MB6862.prod.exchangelabs.com
 (2603:10b6:408:161::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR01MB6862:EE_|BY1PR01MB8970:EE_
X-MS-Office365-Filtering-Correlation-Id: 59fbdab0-0b8a-4285-62ff-08de4f0c5a92
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|376014|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dPXv1LRVSz5jlr7SfvV+Hb7eAwDA2ajPdFlZHcQ6aVt3TcY2p7ZPr/ykXi+8?=
 =?us-ascii?Q?RrFW3IDgDOQWchg8NNc3dIOJIcMpb2r8yXgdgW7tQr3BTBQQRxXiyigH7atT?=
 =?us-ascii?Q?FstMrGx0BTVqSibpSSGxXwNwA/O9Gc/9DxnSnV332CP72C5B9htUmhnhOJzX?=
 =?us-ascii?Q?a7Nl20NigqZS5ePiGnLsOFMcMQWaSu1+Zh4ebJB3KP/ZX49l1Nom7b/i+MIc?=
 =?us-ascii?Q?BiGDNS0omVgBescr+AifW3ilHObn5KIaDMKXeZOCV1q+rqrol86gcKQGHsRB?=
 =?us-ascii?Q?CB6Bfu4qSFo7zSaVnSX7Pp1ej1uCJhL4zvokrkXBoomk2KL+9gXfM0svJHG6?=
 =?us-ascii?Q?Supn5cCILT7T3C8JDA3+Hm3V926dXa4evUY76Lm617nCd2mMZFkX5wPG/YQz?=
 =?us-ascii?Q?Gh0oxJuhI2SG04dWc8JfYA9Bkpw0lgp1SpjiOIxQZpHmQSujrTdSJyx/5Tca?=
 =?us-ascii?Q?NjF7dJmPSTADtNMx91oXXwIYLVpVEFgIdlc59GkTZ8/cOOsJhUuPSLU/MyND?=
 =?us-ascii?Q?HhKnLk3aDoxqeMVrPKCZ2ZKoPl5rEVRbkLw/+hu7mjBSOvnuzW+KKFgHWjtd?=
 =?us-ascii?Q?d0LQqsqTejaNSHvxWr4vw3bNgF0R38HtdF8cSc0sNrQ5JeaQLNiNEfS2MkOq?=
 =?us-ascii?Q?juWRiw0ohs84b787PbMJtpUS6mX/AZUw1AcdFMx+UozWmMpMpDnNSZLl3eEJ?=
 =?us-ascii?Q?hN7Sldm4bu0i4Kfw1Bire7mmkoMWiGkARe3tnt1YGqJwBqNOBMm3cb8hQ1iw?=
 =?us-ascii?Q?WaKrzc/eLuuvJp1M6ifttptTWxIPa4MBRNPzRx/hdA5TuXfAz9/BbqmqOKRR?=
 =?us-ascii?Q?p02wzMB/aku+vObhwJp/DIa4eFbGTaXGKUadmnvfwrKZkRjaZJ8W6JBStUUc?=
 =?us-ascii?Q?xBuPZ938dT51m6PF8IouLc8YUySeFIAN5DYWGHxJwicA47PFoiLUyO2WBZwr?=
 =?us-ascii?Q?BPWrHe7p0A8UfJZyFlv8Cxa+YHD64fTG3HaGvWH2TESqAHubSIaaYtGAm3M6?=
 =?us-ascii?Q?Fv4CuUM8Wm7H3ABGKcEn4BmgZyHixcVeyJxeOSu9b0rOcNxywxEFZ+dU0qzi?=
 =?us-ascii?Q?RBJ27309b0UHXDzs6qojah8JS4CXSSAHeuS+ocjYAHJM4IbeVIF0gjZSGOzU?=
 =?us-ascii?Q?jhW9QdrBdYxW6suKdqi+wDpi6CKKoKtYfOtQ9D6gA6xqMeV5u3YL4gbdDjho?=
 =?us-ascii?Q?k1FDSc6ff+4gtziQM/y60bA+wv5/jnF/fgSjEoMjqFCku+gBp99dTjr2B6w3?=
 =?us-ascii?Q?GML1qrl5ioNusDe+T3EJNftdXtlGXVgkkMeyIRnG2NXI0cNWlUUR4XV8bLrD?=
 =?us-ascii?Q?IXhEtB4uTqoVw1gvWyiG++G+xWme3l3YgCLXMCyUumBQjYStUB+Jfx0MokbK?=
 =?us-ascii?Q?GPdAc+/4QtPKdJWdyBzy/CZAF5A4JThsjYicvUEknqtaXDOF5RaQ2CtqWSX7?=
 =?us-ascii?Q?LVrhkwYNHDBvwY0pe44O0S1JsSaztph9qXEDiK7FsPrx55dW9sT9S0LsebHS?=
 =?us-ascii?Q?fTsyJIZs9qNsQlG6OGKGgMQ41X2cJcQICMFQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR01MB6862.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mfBKfaitkXm0oc9lbU482qZGshDqSG7uyc/ebPpfLNe7C3ugBZNPU4q8PsVb?=
 =?us-ascii?Q?jfCn5zRvYU9rZPZVzIW/da7liSd1VLx23SzSfxe61+nEW9iGo+FV2djXeAMO?=
 =?us-ascii?Q?3FP/TZDL8AOyZB0yy70lN4o6WXzD81YaKFaCO3TNZbRdcJcs9ECTSJqvVbqI?=
 =?us-ascii?Q?xr/Dw3MtMCUYmtcLZY1m0+71vQcLKCkMfZDdPJ6f+rR5FinGJLMA37Mi84R+?=
 =?us-ascii?Q?SRI0R1prjZ5vHp1v84wFPeBOdpIYvHL7LLsly7PaaIREaGsOhkMUWZ8Q/KIz?=
 =?us-ascii?Q?n/1SKQtfJH6LKjE0PDixNJqCJQL73gNiO03gsEwzyngs427dwvBZWBaINYGE?=
 =?us-ascii?Q?LOybHjce5KEFWiiFalIEOKsP2Z4fmu5t0s21A8K9Rdvh/7vaQhUg1S6rdvxI?=
 =?us-ascii?Q?lQEWOCyhJX7HmyX1GVqmR2sLWZsZhrJzSIIvUPURJaj6NB6QXH9ey8TRRsaJ?=
 =?us-ascii?Q?IVCSZsdQBQezWg+ruvPeWP0jVLMHorbtQb1ANoGg4YjWGvcOFASh2MNupFvl?=
 =?us-ascii?Q?MnZoS7kXeNEjPetrgm5Rc8LI0BGlS81tPD0mU9UJ9KhYfE3adQY1GhD7j9rd?=
 =?us-ascii?Q?t2AKGJP2tYnemz4upd02kN0MPPAovzmDSxvYW1P5NF+WDNofscC04ILmuLUQ?=
 =?us-ascii?Q?TojK9Jfap61LbEBNcr7LFAZuyH0QtsF1WtijvjJLtsiDTEfFmXj/6BnGiaDn?=
 =?us-ascii?Q?n7JkYs/5+W1lVS/yKDf5PwyLyR0yhHJTW1ovElWv6oxxcE47U6tO3LGEQi2b?=
 =?us-ascii?Q?i7w0PHnVl69s56zdQyRq3Kr98ct4SuH/1y7zRiZjwTondg0wqVflVCuvVin4?=
 =?us-ascii?Q?S5JrvYe/F/vroxCXE+oPBL9W54aefytNtloEmylCu76yRrdAT1ZdVfSDy0UP?=
 =?us-ascii?Q?fVhae95+GVNyj23v4StdxHv0WtyafU3ECVLQDmEWtqSwrXlIFcRlreJwqLpD?=
 =?us-ascii?Q?NvhiFQmTghDorexIne1W5abLBKjoiT0bJJsDAitUcHv7/Lx/hCHsBOfG38pB?=
 =?us-ascii?Q?uH10Wt1qNuPUB5PJG35Qr7nNpjtp252bgOC4+Evd4U6TQ9rfLqCCGWAurHql?=
 =?us-ascii?Q?sWzqHIgVJVuN2kV/hb9t/eF69pfoMkOnkyGpj4vGnI+IFfGb4gt94a/e7A4T?=
 =?us-ascii?Q?giOzDFJv9lz+KktqLohLJejKuZuiOgbSrLrU4ScV9dEsxKXy/enaZ6dqLut0?=
 =?us-ascii?Q?FGfxhsEK3HV5y5FG6gcScB3uqqZKMeJwWfCNDBbplnBtnGI/PWvbp/GuUJbC?=
 =?us-ascii?Q?NXyNCP+TI8i76uD6+KaZ/hfP6DbOJmDv8r4MApujG/j85/tLHMtCSqppunQ/?=
 =?us-ascii?Q?VzPHLsw/B76N783e0IASzlPgc6HWXFO5CcKUgeT8eNNyq07Q2yvRIzthuGrU?=
 =?us-ascii?Q?gyIpUSSp6qLzAPsvLFLv/00JuiWikXLswzxaio1r5tF9jBQVo/3NG1szm9Fq?=
 =?us-ascii?Q?yaO8bedzBULueIqzfj6RLf4zsaWhvNdhWMOf7SlzvfAe+mNtGwt49gPyY2y5?=
 =?us-ascii?Q?7KkBl9E3+MZhrE9/B1e36TvElQqJLlpw4LPH+aMOSkka44QLTZu9vKW6o2Kw?=
 =?us-ascii?Q?OjpSWsd6AYwWt5vkmCWCoS8KQ3CvIhcintHBxn3NZPNxPXZWyC7e/LI4p0z2?=
 =?us-ascii?Q?xm0/yxe7fM6Js/30N1qFh1q75JcSlL7Q6xDpFusRd4w53Bh3Q34eGYxZBYgv?=
 =?us-ascii?Q?K3XM2ba0SxluKV7zHkB+XICBF/onRIdtFvxhoRLz+Tptt1ywb8/FtIn2Nfcr?=
 =?us-ascii?Q?GjnzIkdV+Wcz894CefDkSUtic14TTzo=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59fbdab0-0b8a-4285-62ff-08de4f0c5a92
X-MS-Exchange-CrossTenant-AuthSource: BN0PR01MB6862.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 23:19:21.2521
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jfShy1dSHnOB2cJ+K+e6r9WznD5l/zaYRUKJnFH+0Rq4RYj+zuKaqJq2EqYcXNIlzRw41Ppz5XXnTKKP4gY0TUWlSTlC8duONX4FanJppP0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR01MB8970
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_151931_488731_C6A50049 
X-CRM114-Status: GOOD (  22.46  )
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

Catalin Marinas <catalin.marinas@arm.com> writes:
> On Thu, Jan 08, 2026 at 03:06:30PM +0000, Will Deacon wrote:
>> 
>> What about all the uaccess routines that don't call user_access_begin? For
>> example, copy_from_user().

It's possible I missed some code paths here. Thanks for pointing that
out.

> We might as well ignore tag checking for all uaccess for specific
> hardware. It's a relaxation but you get this with futex already and some
> combination of read/write() syscalls with O_DIRECT.

I'm not sure I agree with that. I mean, you could argue that since the
current implementation doesn't guarantee all uaccess gets tag checking
we have cover for skipping tag checking in other cases.

But I think the system is strictly better if we prefer to have kernel
uaccess use tag checking wherever possible.

> Reading the Arm ARM section again, I wonder whether always setting TCMA1
> does the trick for the Ampere hardware. With KASAN disabled in the
> kernel, all addresses will star with 0xff... so behave as match-all. We
> do this with KASAN_HW_TAGS enabled but it won't have any effect with
> kasan disabled.

I'm not familiar with any "match-all" semantics associated with a
tag-value of 0xf. Maybe I'm missing something?

But I'm clearly not aware of everything regarding MTE, since TCMA1 was
new to me too.

Having read up on it now, I agree it looks like a good approach to try
addressing the performance problem here. And this would let us leave the
TCO handling as-is so we could skip past Will's two concerns above,
(potential performance slowdown to other uses cases than what I've
reported on, and potential code paths where I missed the toggling of
TCO).

> Carl, could you please try the patch below?

I'll do that and report back here soon.

Thanks,

-Carl

> ----------------8<----------------------------------------
> diff --git a/arch/arm64/mm/proc.S b/arch/arm64/mm/proc.S
> index 01e868116448..8b1f0de00fd3 100644
> --- a/arch/arm64/mm/proc.S
> +++ b/arch/arm64/mm/proc.S
> @@ -48,14 +48,14 @@
>  #define TCR_KASAN_SW_FLAGS 0
>  #endif
>  
> -#ifdef CONFIG_KASAN_HW_TAGS
> -#define TCR_MTE_FLAGS TCR_EL1_TCMA1 | TCR_EL1_TBI1 | TCR_EL1_TBID1
> -#elif defined(CONFIG_ARM64_MTE)
> +#ifdef CONFIG_ARM64_MTE
>  /*
>   * The mte_zero_clear_page_tags() implementation uses DC GZVA, which relies on
> - * TBI being enabled at EL1.
> + * TBI being enabled at EL1. TCMA1 is needed to treat accesses with the
> + * match-all tag (0xF) as Tag Unchecked, irrespective of the SCTLR_EL1.TCF
> + * setting.
>   */
> -#define TCR_MTE_FLAGS TCR_EL1_TBI1 | TCR_EL1_TBID1
> +#define TCR_MTE_FLAGS TCR_EL1_TCMA1 | TCR_EL1_TBI1 | TCR_EL1_TBID1
>  #else
>  #define TCR_MTE_FLAGS 0
>  #endif

