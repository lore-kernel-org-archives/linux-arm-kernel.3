Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55BB6C02183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 07:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ey+ZYCBrabg+J3FbbElJoiXxsQAyBvrhp01MHvHoRbY=; b=3an5EuWjKXv/bnTe73jaDOhlcq
	HvD7VPSjdxOcUi1lg8+akGf2arzQh25Y8RwBGdje0yyxllnwtjtyZNA0ljUZqwuWo9ct10s9TCDOB
	1itFDjuwZT2dvzezzELZuc/zXbC2BUszNpDcMiI4x9UO3dv88J+3OyJy+3juvDgLI4LLQXnKSqaWj
	9ql5LuAHVhxf74scfpDewTIvCDyVpNVYo1/ia6VMAPClTJbK0aDvv1SCiy8cbyHLhIaqBiZkl8G7I
	n5sZHjBTZbZdxqKYqP4tbm9cFotx4r5wzeJ4uzH+G3kFgtScb8cwbWnxKEiqgB/XxcHJCpX+WrZRE
	mexVu5MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYhFv-0000000HGc5-0UN0;
	Fri, 17 Jan 2025 07:59:03 +0000
Received: from mail-northeuropeazlp170130004.outbound.protection.outlook.com ([2a01:111:f403:c200::4] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYhEd-0000000HGNR-3zhg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 07:57:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h8MwqzveKHmpOAAXCdDlwy7cINgoINj0utd9f8v9MsOWaFOg/GuKx5s4V+HItJVqAvXYikfq/7MpmMWiFwe6UjgmjSRfud/ssX/hTsPs22ICfDlnAqsJtq43cnCAM3r0lK3oTdNVIJYPeliEG6zNkILahEymjM8ZeHI6f8IrmOn3wtffV2KdC+7RDcoqVcCM7gwLyUhPsYNvM+iN2+gmlvQA6T82jeer2PKBrttS/61rdv/Xtpsd1YfcUY7jbBNhdha56dmwj0Mde92KBLOiZENYAuKeseu0FRK/UYmaZwCho5U8iKb+spsZFgrOamWiAl3TgZ2/Vb3YsZskh0aqHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ey+ZYCBrabg+J3FbbElJoiXxsQAyBvrhp01MHvHoRbY=;
 b=HS03T9ljOmgSv9Jsh5/QHuSlV2ZsNZuGTOg2+nPW7AAb2mdC2xAyQnAocqW6Qd1OJYRq59M+yotDG8Rw7GiKdj4MEa6rhneBBSXXidwVDwA3FxSVsGkrM7InYrk0fI58m+81eqrvXxZUdakLhsZdu9FDLXQRUwLKHFY/i5hP0jSERbheoEWvaM3ht3/YmvLguOErZbbgtBBHMHQSwSLbe8hBh2eYwcmXvGaGuVCiiKjTe+dmEQ07z3cvYoLydriLd6RlxJrX9ErrWwJYVIXtgWnZM/MYup7gbALrFUvWsl5mtrAvJ59wlir5t7FmweQKm53cdoTTBHoqbS85tId6kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ey+ZYCBrabg+J3FbbElJoiXxsQAyBvrhp01MHvHoRbY=;
 b=J4Lck2FT6BKw0Xq+At+TvcG/biav9jhU91FtE+uMlpNHng55X/WskpW1WpBEM4cgqFlyVvAXKrBtb+7FO2P7wiAk+2SVYWz0AbVMxhzcrskGD99OsBY/NhYu7ZxFdDX++y/RQ7ykTkalIBbordOPyw4pzdxWk8yrQKJe32WvVV8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by AS8PR08MB8465.eurprd08.prod.outlook.com
 (2603:10a6:20b:569::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.14; Fri, 17 Jan
 2025 07:57:35 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%5]) with mapi id 15.20.8356.014; Fri, 17 Jan 2025
 07:57:34 +0000
Date: Fri, 17 Jan 2025 07:57:32 +0000
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: 1534428646@qq.com
Cc: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
	kristina.martsenko@arm.com, liaochang1@huawei.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] arm64: kprobe: fix an error in single stepping support
Message-ID: <Z4oNbOGSluJlwpvg@e129823.arm.com>
References: <tencent_9DCAEBDF4D9BCDB4687B502DB6B608E4FB0A@qq.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_9DCAEBDF4D9BCDB4687B502DB6B608E4FB0A@qq.com>
X-ClientProxiedBy: LO4P123CA0513.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::23) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB10521:EE_|AS8PR08MB8465:EE_
X-MS-Office365-Filtering-Correlation-Id: d525c78c-eef0-4ab0-5c4d-08dd36cc9a53
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MBTRkxCQs2VGUol+mMFyc13bLjqAt141F54Sf/+yqjJUSideSgM8mm2IotaN?=
 =?us-ascii?Q?EWfBllDkkTYfU4Apbdm37F/POBRKEheXrwdgw9w6hZU3t5K/mNzKYD5OvCJB?=
 =?us-ascii?Q?4L4QUUncIqb8OABxp7DT/ESfIRWTju+f9MmNy0WqfN0YmNfQsfMH04FUMFPO?=
 =?us-ascii?Q?8k8Cj6dAfcP3MD6nN5rw4kI6atW4zRBF7i7JxCuleSJcNEXPx2l4l62hRPdQ?=
 =?us-ascii?Q?D79A26ZR1cekhir276wAwHoZsj84Xh3wSvgdWbDjjpNcARp67m+FoXI7I1XN?=
 =?us-ascii?Q?d0wYkwsLtBAgSx0Mu9JAYwPj9/Et0ulLoqJ04iCx1su2AFHcbN5yP+UfxDYS?=
 =?us-ascii?Q?R3sxj5Y2ZA+/OxPbZT4bfihqTWVCuWeZDHyEpRSbRyXnjrnGX2GldukKgsyN?=
 =?us-ascii?Q?U/ekDGePKdt6upveKcE2pZpZ4bM0s0qnSTWeHiFmwxMPPXUZpLLxDUyDcaQ1?=
 =?us-ascii?Q?XBHP5CObhcldTdBV5+tbOJuN/iyL/vWICIyZ3sLIS84zNPn7G03w/VZzdNrZ?=
 =?us-ascii?Q?vbA4jsRvAL15iBmAJywUuy1VKoG0QPlmmvukLfZ/o61d6X7MjFouMmNQOrtC?=
 =?us-ascii?Q?vMqPmOJVGuia92iL2uRVXtikrDnbwkq+DnZ9Lr0l02tpm8cFoUFkJZgq3DBm?=
 =?us-ascii?Q?ovSGEPkGVdrh7RROea67MSUgtfU9wKMJ9XFTeRMHdTnHfTZL01GjVXg7rky/?=
 =?us-ascii?Q?1rd5vzZUWWfcjj0aB28qpRWPIy1EN7vQU7z/EBCqSeE/SU186AmiCH7s4U4q?=
 =?us-ascii?Q?MYRmewFrgTOordpui/UjLPRmhQwluzQNDdmfMUjA+COEumcJh81nJT34x6YV?=
 =?us-ascii?Q?6X1Nu4mouBdvIm2C7kSe1Wia0HcrYomJp7V4gwJX0mmXx36Yd9m/TtGMKDoX?=
 =?us-ascii?Q?i2ifVXQYYwdHD9ohnfZUBWSw8wb6ppjKbW3ucf4uJFpkP6ef8U2HdJK+8Etx?=
 =?us-ascii?Q?2kw48DKGWva2PZg11miJLnsG1DzgCmc/gY5dViRelAqGWWll/ihdhUzpTm82?=
 =?us-ascii?Q?1vUZaMP1qWAFedSetjWn44UHxLDyyqoujFVlRu9g54Vvy3GsYEntPR//Uw9f?=
 =?us-ascii?Q?najnG6o+WQjx5ShpSki95zFdI+4q1wTJt4s3VOrtAl6kH3NBs5pi2ATYHtAX?=
 =?us-ascii?Q?RYiA5qcHAm95v19fa/+DFTp9BKT/lc42sfiC3jT49hCcvD4AWCSjC/zfTyxJ?=
 =?us-ascii?Q?m3JKs/XvVyV7eju0jXYvsyKchNXMYOwXsldKjH/TCKhfptuXsfkiZdSzGVpz?=
 =?us-ascii?Q?GY1ZUY7jHmx9u5Gq7JmWRwehUPghZ7mzh2xISrjmKFI2FuGMyM3SPE7UsZta?=
 =?us-ascii?Q?N6QpJXDOIzTv/0o48sDBC92BR2I8Su1wI3nW0h+ql6m8MZXRc7IqhnFmwGoO?=
 =?us-ascii?Q?jNfFGGONoQ7qzoLIb0ZTlhR6CKQ+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?utDaCEbse5ORdZwq5j8hLLkwcMhAMLQrbYCqY5aRUjhq4ZudmyUBYm1bbG2p?=
 =?us-ascii?Q?71hqddv6+kwWZvGVXpsCOkPF/2zuPIPxiWtti7rteHfwji1BSvEnAMCzkRs4?=
 =?us-ascii?Q?Cl9s5ZH1HdO94Ybe3Dg5lKGBJbti1YaiJugeBzE+QJd13mGYdlL0TDYaVOMI?=
 =?us-ascii?Q?0MXG68YkVxCMPW/y7sy1UPiXRCMoIZ/+85nqJgDszSzMZz6AcUiIc7eqO0JG?=
 =?us-ascii?Q?ZWmbqnn1txptWKrZIoRNsRkpweyFRzS9kUffNAU0K4nc/17Q5wTI7bokyB/p?=
 =?us-ascii?Q?yg26ZFDt9wRGqzFqWBoXTnerSXUQk0tXwWwafuB98j/IOzK9G4sQlaE02UxF?=
 =?us-ascii?Q?80ZTDutZvIBzdswbgmnnBJePKISsPI0QZlti4ZDrEc7XOSJohliORwQd/WV/?=
 =?us-ascii?Q?OrahTxeKNmp86hvck406PiEFZcSo9CWFRPQdo7aYiSgtSa2prtu/ExvyaFD/?=
 =?us-ascii?Q?jaNVwLeQoO+SMfpd86D/9a6jphQZxMsBQv4ot2LpV9jrMoBIWbezCbDy9FTq?=
 =?us-ascii?Q?+o9ExV+uHobo29hD6ww2lqxyzRQK/QIckifKVP0KNEzT1B1rJayCtFAHjKi9?=
 =?us-ascii?Q?LNxHxeMSPNQ8Cy4ko939bJweKbLTom0myhCHU1iNH4u+Z3F/Wl5CzqKnNxwq?=
 =?us-ascii?Q?JXdsuMn9EjRM+dHikixyPo0pJyCckR+TLcb1tr4opujmHFvBnkWuXRepfve5?=
 =?us-ascii?Q?qVDeDTb73eOB1ssSWzvsSbJgJsUh/k7pOMKfWZ4xwGrVAZXzoNiuvvx39ZeZ?=
 =?us-ascii?Q?BRNG39cb0RG1HI3WtzrN7M66UoHnPhlDp7JjHDu/Eu6c3CBjP629Szk0E5vZ?=
 =?us-ascii?Q?fmIPJj32a1HfbrmlPgYT83tfzrsHFpdFoEr8LBjwKtTvz+5GKn+Vn7ApkJmI?=
 =?us-ascii?Q?kqjV+ZyPFJUfEZPZQsbTbmf+p8Iwdwe8Vs+qK7wLsaU3mllSUWb38jTRl1iY?=
 =?us-ascii?Q?x8E9hBKS2RIg1nCDu2SDsqHy+32y1ggk0j1d4Oo179njLPh0l5KTTpwARl+R?=
 =?us-ascii?Q?gUxZAe660lGRqhL918MqHxxFIjii25OTJxZhvoxioXIOqDR2+vF0tYrocWJF?=
 =?us-ascii?Q?s/0JsLsCivWJWwD5JdAJvs/nROtWLoNwqGkv17p6abN2+Qzq5AgBNnEIrYOL?=
 =?us-ascii?Q?YOnOrsbvv13kxq0ZVxUzKAqkz9c0lZMqnKXuWG87allTy4Qr60Dh/+giekz6?=
 =?us-ascii?Q?TazbtwesmjRW/VXfu2TOAVtb7cHJEtBakjYdP06eLRMGuN7ecE6OB8X1+fw8?=
 =?us-ascii?Q?JdfvvBXNUm5LxIaE3yS6S9Fglt7RlszC0oAFMv0cq0pBUvhFXHh90Dzdy2bE?=
 =?us-ascii?Q?h5i+yqhWQNIXNEq6mWUVX2Qp0J3AwRRqwZJlWWd90W+m82lJK+Fc+n4XGZl/?=
 =?us-ascii?Q?92eA93fc0dWzsDSG6e5SVgG7QR1TwxUbW+g6r7/gYLFhBLCyFlTZxtTuitre?=
 =?us-ascii?Q?JPdZdtfRR10Gdmcfb86bn3UbdUYzR42WKmO2yxtZzbYbBPjajoenA0zZP/TZ?=
 =?us-ascii?Q?+cXWX7Q6V2xz7kGqPANoDjD9+/kCq2zapsAlzVuUB2Uli0hJ8KUZ7/HSP+gi?=
 =?us-ascii?Q?BdIBJMVMjLrq7oQl4v10h3V7a94gY9TKdEWxb1uu?=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d525c78c-eef0-4ab0-5c4d-08dd36cc9a53
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB10521.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2025 07:57:34.8095
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AqMDKt/PYi4VeHjqMVILw7cxu/XCm9NPmKB2kQ05iOASZje92YW+VhKRNQKY59bwuWs631dyC3t4gmmnR7bsRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8465
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_235744_324469_241E6D76 
X-CRM114-Status: GOOD (  24.67  )
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

Hi,

>
> It is obvious a conflict between the code and the comment.
> The function aarch64_insn_is_steppable is used to check if a mrs
> instruction can be safe in single-stepping environment, in the
> comment it says only reading DAIF bits by mrs is safe in
> single-stepping environment, and other mrs instructions are not. So
> aarch64_insn_is_steppable should returen "TRUE" if the mrs instruction
> being single stepped is reading DAIF bits.
>
> And have verified using a kprobe kernel module which reads the DAIF bits by
> function arch_local_irq_save with offset setting to 0x4, confirmed that
> without this modification, it encounters
> "kprobe_init: register_kprobe failed, returned -22" error while inserting
> the kprobe kernel module. and with this modification, it can read the DAIF
> bits in single-stepping environment.
>
> Fixes: 2dd0e8d2d2a1 ("arm64: Kprobes with single stepping support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Yiren Xie <1534428646@qq.com>
> ---
>  arch/arm64/kernel/probes/decode-insn.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/kernel/probes/decode-insn.c b/arch/arm64/kernel/probes/decode-insn.c
> index 6438bf62e753..22383eb1c22c 100644
> --- a/arch/arm64/kernel/probes/decode-insn.c
> +++ b/arch/arm64/kernel/probes/decode-insn.c
> @@ -40,7 +40,7 @@ static bool __kprobes aarch64_insn_is_steppable(u32 insn)
>  		 */
>  		if (aarch64_insn_is_mrs(insn))
>  			return aarch64_insn_extract_system_reg(insn)
> -			     != AARCH64_INSN_SPCLREG_DAIF;
> +			     == AARCH64_INSN_SPCLREG_DAIF;
>
>  		/*
>  		 * The HINT instruction is steppable only if it is in whitelist
> --
> 2.34.1
>

Thanks to correct me. yes the comments seem conflict.

However, I couldn't agree to this change.
As I mention in last, when single-step runs, all DAIF bits set,
so, the result of reading DAIF is different between before install kprobe and after.
Also, I think reading some sys_reg in single-step seems ok (i.e. SYS_MIDR_EL1).

Therefore, allowing only install kprobe on DAIF reading doesn't seem
correct.

Thanks



