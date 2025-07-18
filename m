Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F056C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 02:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:
	Content-Type:Subject:Cc:To:From:Message-ID:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/aKwO8ngPmnHrlXnCbg2gholsZSx5QRgxqthugc8/1Y=; b=XxF6yZjq2aQ3Xk6RE2QwY/EePL
	WozZ7ZyRvjhAgRHniQUw/uWrLjH5ESTfowbpQ/G+3T9Yy62u1eQ2OMxYNBbxJOAYm5Yn/HXA03PRu
	lcID3kw3jnuO3EYcOZV9xuWno0Uye4/7Czca2nHzNM3FknWsmaO7bZaIAIBMqhtJikRpxlBku2pOQ
	m6WktO8Oad8HmgR0m3BTOjme5lkepCm76TOIWu5PAc/ljz5APR6HjHtr8h5Wy8hQwL3zxD1h0i4Id
	H043wO5uaOVRzqc9n6MEHYdTQTYGUAPx1S+16jgrBlmbAVQ2IM8bh1KUEQr2mvOPoMFkkAnzdvWRk
	45ksGUQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucafw-0000000BXLp-18mQ;
	Fri, 18 Jul 2025 02:18:16 +0000
Received: from mail-japaneastazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c405::1] helo=TY3P286CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucaXb-0000000BWKs-1GQR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 02:09:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wYkrIPNQs1K9kz1ioQw3UvGFCW35kQ5WWBgYOJ04oRfo1AGMaeys5nH3EGepd9e64oVQf7ylQvsTQ/VlmgdDJpYN6CEdayDOlvm8oWqP5kAUtIAtph6N5/YKI0CQ0WEvxY3i+Rdsp9pxsbldRZH1pzozT5zMErqM0Hb4TvjtxPcOcWpzt4gJyKymqtv3jJKrDU6nP4D2XXbVdPj3O67IL12FCRui4OhUElNeDhLKlmKQm53ODVgimRm93NU8TxNs21ICSNBz76PSipIpB6hVNc/6cTm8JKPjFeg1h+nXVmTaLEc3JUS/FaQ883Y0ZKN5m7PMF+p1zEbPcW4s6orBNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/aKwO8ngPmnHrlXnCbg2gholsZSx5QRgxqthugc8/1Y=;
 b=NYWmTHV2Vv0K0OLKUo6iyO15zxtDimldWh0iGaTWzBP3KnYY4KxjpFApjGQE/ZNtyEp/tby5dX2e9pabjG7nR94ERwI+AErmkZWunnRr7CgXaa8poSCnq7FJ8fJEGyZ872SZzhPUV+StxSuW0qRBJK1YdmTM+I3tRWcA7dmAP/WlQL/70pMCBX7gemAbtSSr7NDTJWQVt3UWXyJh6JanyAhCPigU1Wfn8sR6jn4BcWXn8n+AhbMqLA/zFk0JR8k18mogsC8Nag/zE3Jybd/vFWhkdMzEzcIJJ3Ikdv3OOw5npujiD89cEUzX4H9JP3o2YG1ZcuafvGp7uTNgvooOfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/aKwO8ngPmnHrlXnCbg2gholsZSx5QRgxqthugc8/1Y=;
 b=hXfMxB9iXApVQxNYy6IntH3fG0yUROaSP5X61LXlZHe788PHyknrVFm3Sgb9/h9W7LhbrqzMX5bD+PmCL11eDx9W420Sjx1UZZl+zaCpPsiGrsWEtWUbc4MKPN6ey5yMCCrvrkLp3qoC2cBtR9wxSy3jMfnWa027b2gSKET1KV8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB11194.jpnprd01.prod.outlook.com
 (2603:1096:400:3f9::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Fri, 18 Jul
 2025 02:09:33 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8922.037; Fri, 18 Jul 2025
 02:09:33 +0000
Message-ID: <87freu5jxf.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: rmk+kernel@armlinux.org.uk, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut@mailbox.org>, Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [issue report] ARM: compile error of frame size
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 18 Jul 2025 02:09:33 +0000
X-ClientProxiedBy: TY4P286CA0045.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36e::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB11194:EE_
X-MS-Office365-Filtering-Correlation-Id: ff5852a6-90fd-4c01-932f-08ddc5a02327
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FVO9/vVqM4nUf+2FUseJFfSbyTPrZsAAXsUWahQVeT+rnNc2crkV8PsuhKi9?=
 =?us-ascii?Q?2+mrf3eP61H07NI1YxbHMe4RgLdPkI1KuezgZO7pGsugZOeUM/EA2duu5c15?=
 =?us-ascii?Q?jP1cp0m4kTMXMy8QWWrebXc8OfPOpLnI/UxeoVcDOv8O8h2CTCQ3I8ez/Z0N?=
 =?us-ascii?Q?+E5EOlQd0ooV/YUO82aaxdGCUm16rMHxcUx95MidlJpr8o1eel2BwBC0q7Du?=
 =?us-ascii?Q?F9yN54IhdYMQ7GPdtZsGyE/uAGUouS0VPI6Tbbd9U4t5Y/8ja1VerOWe2uqs?=
 =?us-ascii?Q?4n6zJ5WTRSm9c3ZpM1VXWEKZYCUAGjmGO0JhyRg8SxFJEsKoCBvUDp91/CvR?=
 =?us-ascii?Q?wSrRrz9pJPP5+9eLI+CDSAW3RkCDakqorUKealwcPwwd0uHzoaqRIiIkEf3E?=
 =?us-ascii?Q?FP3XFj8ZY29kbHPK6H3RAzeqtSc2sGYVQvx6QUtPb+i8xqsjH3qnhYdTcvdc?=
 =?us-ascii?Q?/xtxTCsS68n1CBvj8fDJnTuT6PKFa4+2r4dhEWTHHaaWjoYedX6EgNEc69qY?=
 =?us-ascii?Q?wCU+y/utwJ3gi/dHTV1l5IrUiQgHy9Zx6k+BtrC9CWUzqw1+hjf4e/p1lqsw?=
 =?us-ascii?Q?BdHKRVqsHilCEDecQklX7+AIcggGNPD3ELs1dXkccHB/gm3bRLSXZYIv1pZE?=
 =?us-ascii?Q?EBMEuGT5OYwNiZXk6ezEb2QMRHunpQ+vRKxE4KTL1freSAeYeh0dsGlJITIr?=
 =?us-ascii?Q?xT/1QjS9XbhTVeTpqGVwCC8LPrsVurCLvcPM2ESYPUiSP+ntUZRKA+fLAMbA?=
 =?us-ascii?Q?Q0OTboxjVCoWxOsmwoU/yPWS9xeiITh0QK/q1Y4OBPZRxcBQMr6s+KAXGoq6?=
 =?us-ascii?Q?LLla9FW65Cwd5ij8vAym5sIXeNtrvRoC0d1uMC6dM3YbLrW9rSWnWtRgiy0U?=
 =?us-ascii?Q?R+VZu9vXs8kBMoh0V7YxfJPkg4KOZASqN+IUU6Cb8F9bEbJQPqPf4xPnYQaq?=
 =?us-ascii?Q?YSm1a9mmJbzemHC2f1yHFgyuqN75xlHydUi9YwmZibk2fTjPGEie9aWCVPNg?=
 =?us-ascii?Q?uvEWSvjTrrrFO/qsx26GM0jwQqzdv4YRgt0TokMBKIZFQymMEiV4Qfp9BiGC?=
 =?us-ascii?Q?BlB14lODmzaiWh999Cw6ino4eeJFQCpHbXg1zJwYuo2y/BhXgNHvEYIVbnyZ?=
 =?us-ascii?Q?aapMDKiQiA9W5LdtzQ9Bt3gGPLIe0OmO/eovlK8uXzlYVd4p/8rEmT2WiTsD?=
 =?us-ascii?Q?qjoBzsVLMLGSOw2A1nru6MYmL5bxOnAJ3tAx/KXm/fVkZ9+b7p2yTwVy1Daa?=
 =?us-ascii?Q?5C/YDtLK+UUjLh8zw2ICFv00hyEDsreeGyWUMV8go+Srj9A7La32xkzpK1db?=
 =?us-ascii?Q?Jew1mhw7Y5zGx+PDWAcBitxQhbHwPwsiiQ6jso5TZKu5wFcdM1Ya5n0P+UXr?=
 =?us-ascii?Q?iYjcFPIjPvyAj1abKy+mzz0+ELKZ9cq5MO3USPRtG3Ed7Ub+J0VgOUfBIjR2?=
 =?us-ascii?Q?APm5q/ECMYmSRooIBxLtc0J1L/rzYCiCihqABv9C5vjMzmgJ13B/qg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q5ElbNWh2ZZVoeN/23v2ABbHy6nt1MTFJyF1gfJx7VFON9TVgy925NKro/u/?=
 =?us-ascii?Q?ZPN5iQOgoCd5wrmZhVir99GqdiICSpAvSxCZEV3LswswMfVmfJkJOXtoZw24?=
 =?us-ascii?Q?0CE9GUfc4MXVVGSP9gp5k0r6//ZswsNEuJX3PaKUfmAaB904GGkbymHRH/Zf?=
 =?us-ascii?Q?QN2pZo1ZGSmgtq17PbleWwBBPa8O5SLBzzA8PbER4axXnZRAFJUsOFEgBoiL?=
 =?us-ascii?Q?Eq3sgQBKEsBIlXC+BhuEyp53IDPzr1ZPA0bP+YwgnwxbYOBXDwlkN17WK+5m?=
 =?us-ascii?Q?2jVsYAhjBOlklJ53Dt9yfTBRjl3CBeAGby3eMGUmfI6jJtHNMiB9aWK7siHx?=
 =?us-ascii?Q?N2GuLC4cWFzFxCBluEsesIMTEqVJXzzQa7Q6LqUXjrzR2xUIagzubur1a+GE?=
 =?us-ascii?Q?I14WY7eqv4/jh5KFEprY7hQJ1EM347uHUCAO6bm+rJvIoID40u0DK1P8o8Yl?=
 =?us-ascii?Q?w39AxUtw0ge47vFsKnSEsTuPWOfz4XABBZ1VbdDzdtvvHrbxcHaHatPbwaZS?=
 =?us-ascii?Q?AYQfKmPA34X6tb+LJAnqG620SRaouyX0kGC7hIp9TeDurRx1/sHETUW+iny5?=
 =?us-ascii?Q?zIn0CDrErsZRy3uKPU4MnKtdv31tcrybvT2F8F7FQV0CyUF8JftG1BoYbSE5?=
 =?us-ascii?Q?1PYJSS4G4Bsv8ZHSuhbRKqhrbXgiHem52ZC+EeDrLx5VUx90XN3ro9SxNGVx?=
 =?us-ascii?Q?oKqcpS74RcH6BKs/i0FEH2F+43IChYSkeY5wOpWqWrM3sMtupzCUGMKnIj7j?=
 =?us-ascii?Q?JWD8bPR9aGhFOU2/wOlju/P/+sf685f59ba++RLH+rLP/d/g7QhW20DQf/xU?=
 =?us-ascii?Q?qAjuHhQmZYQX35lHpWPLvr5usjPMn+oWlfeT2EDfRkqYwoo1Az8WkRESJnPc?=
 =?us-ascii?Q?vLkT2LWfVgevkecVyB4Vk86dzezY2a1c/O1OBLVXhIVsoPaYPSQpyIIxgx2Y?=
 =?us-ascii?Q?YXkV1Q5JGzpVVZia7OudMziHnXezVoY5TYFHOmFGPN51Wn905NPMbR0k7BMQ?=
 =?us-ascii?Q?MWG4XwAcwDebwlQcCxzUcfY8IDZDDEfZz8hjwE8aAY8j/Hd+pez95ZbSdgkY?=
 =?us-ascii?Q?EJWlb+32Is3F4He10vnXZG/YfFBy0p07NjsG0lygem6Uk6BV6oMIOdA9htMq?=
 =?us-ascii?Q?GqLyoCPKLhJ7HQ0OhOfyKHyZc3BRwjkiSQllFd/zX7jt4W7Jbz9Z3a5ROD4u?=
 =?us-ascii?Q?w2MVdr5HEcQeMN3W3YT0P2Hby4eSULAyt6B/JOtSpl3uIk5ySpy2nKJ3YQjC?=
 =?us-ascii?Q?W/Ka+uIvYl9Kir6E6ArW5c72DXwhuR/OEzG/nFkyTFYapVd7zytcgnQJFeh/?=
 =?us-ascii?Q?grDaVQ/6ZQNbgFqa6g/Bn8eYDSDvI/55On4HnsQgRwna32tFfrTj0Upgsk8r?=
 =?us-ascii?Q?tvvqZfZlIIaiP9obpy4nMo+RszfwzjWQWEl6PFtXwr9E2UlNqD7aIQsjw47I?=
 =?us-ascii?Q?zLvaIaCH9Ju/vdHu9e4QQFqJPWwnHB+Qk+qqPnOAID45tfRjMrrPs+a1jA6i?=
 =?us-ascii?Q?pO0dv7YogLQ8sp1vjkjcihL1aPhqYr959/DzffydDnURNrwDJaYDgnh9xmMt?=
 =?us-ascii?Q?VlW0NOegu+Av9+CuH8horP+FLrC+wj6S5sMfRrm3oPLiOVtXP29S4mX9FM5g?=
 =?us-ascii?Q?DN0FcqeZmXaTffTW1IW1C2k=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff5852a6-90fd-4c01-932f-08ddc5a02327
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 02:09:33.3129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 667nGuHclng8dSYKlIBBZ6B32ka5nVqrE891P/AfttMYmwDADFusxjb36rO7BlPDvNspLc2LhIiC2jYwQjHjfBgyFlWpUPyiyZCJSk3O5A5ldOFKpWwcQr7epcaGlWpQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11194
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_190939_346896_65DAE79B 
X-CRM114-Status: UNSURE (   7.27  )
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


Hi ARM ML

In these days, I got a lot of compile error about frame size on ARM.
like below.

    ${linux}/lib/maple_tree.c:3818:1: error: the frame size of 1304 bytes is\
     larger than 1280 bytes [-Werror=frame-larger-than=]

I can avoid these errors by modifing like below
(The new size is unreliable)

	> grep CONFIG_FRAME_WARN .config
	CONFIG_FRAME_WARN=2040

	> git diff
	diff --git a/arch/arm/boot/compressed/Makefile b/arch/arm/boot/compressed/Makefile
	index d61369b1eabe..c5173bd82380 100644
	--- a/arch/arm/boot/compressed/Makefile
	+++ b/arch/arm/boot/compressed/Makefile
	@@ -80,7 +80,7 @@ libfdt_objs := fdt_rw.o fdt_ro.o fdt_wip.o fdt.o
 
	 ifeq ($(CONFIG_ARM_ATAG_DTB_COMPAT),y)
	 CFLAGS_REMOVE_atags_to_fdt.o += -Wframe-larger-than=${CONFIG_FRAME_WARN}
-	 CFLAGS_atags_to_fdt.o += -Wframe-larger-than=1280
+	 CFLAGS_atags_to_fdt.o += -Wframe-larger-than=2040
	 OBJS	+= $(libfdt_objs) atags_to_fdt.o
	 endif
	 ifeq ($(CONFIG_USE_OF),y)


Is it known issue ?


Thank you for your help !!

Best regards
---
Kuninori Morimoto

