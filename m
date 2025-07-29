Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 230F4C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 00:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:
	Content-Type:References:In-Reply-To:Subject:Cc:To:From:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZlYlZuHF9ydmrrppHu/VNAJ3s3DuOvQ/MzSr9aKzaQM=; b=kRNTsgOkKndqpzpgs6tEBdfi0H
	hH3Vwpax18MsncbHEGke7OtC5EbKB6r1Bd9fVPrLLVr7+8RNb1K8OoJ4LAu+d+92TS7AkO/ghgrYS
	P6IEPvp4EZXljoK4J1V5yn4BqZPQ87Lhlj+5XhPC/+6PueALMXnsEgA9M5iJIFhInmtLTBPJaFgJ/
	9dQbgN/wXuk/Xf3Eob75qHNRzBE4wwTV2tmHNQuaoaK0CS6tC/4H0FztQwC6sM1o0qcdPEcdQ4ZOD
	23sMZMXHrmUCqE4s+7DbX0Dri+66LtbYC5p33o4FdXb+ZJbQKc0XKYSxyvwJ3+ygBlGFhMKGwDaA4
	AppIG1dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugY0E-0000000FdCi-2E8u;
	Tue, 29 Jul 2025 00:15:34 +0000
Received: from mail-japaneastazlp170110002.outbound.protection.outlook.com ([2a01:111:f403:c405::2] helo=TYVP286CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugXxk-0000000Fd7J-34Dk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 00:13:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J6cxxc9aLDds+IG+afNOOxuh9LlgTdbmmv8UXj4jq3xS3OXX09J2N79d8JZ8TCMOdpAUFZ0jS3gmwW9dnR7Vk5UP6xtwe+tZO5kJjNdZSDB7PByFKRE3Y9w/VXTWc45CZUnZH1ZHfYlM6f4+13fsxCCS004TpN5ZkDVGv7Ah5NBLMNX6HnB0VooGkn55cYSUtktaE2yLIdSBE9sG7ynsRd02+XnbPE6EwThYzBtEiS7XJ9IJ5LviFa0as8PkRC0L8ro84rupCBByA7kdD4B/qXlF5DXvM21Wxylwl6fyzttWuEu2rEQQOT0tCIiTav3gbCYhLLrLLGLpFcO7HYIVFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZlYlZuHF9ydmrrppHu/VNAJ3s3DuOvQ/MzSr9aKzaQM=;
 b=bJf/HCOBzuQdUeEABXTn2BdNIqFujO/LQw+yq2FtHahu5a61y75PalNgqAPY87JHtZ3uoEkGZYH0WuCoajq0WG6AJ3VpAA6MQ2lteFNBMLHxbEduNIoKQdNO2M5MuPiIpeC1wAONOaHbHUNL9+em8y1vqosuOM6ecT1B3vnQB6J1KyOyX6bl4JLqsj7e+pXb5h6nhQTQ84H0vfiMdEXHgZ60MSsaysr7rWhL4hC5NFm4cIGcf7KYBsukyYKlgZ5H44XEgTW5mTVVVq4zG4pH5tL2deS4DJcGZNnUPA5OZ+5Ab2HiP5s4abfylqYWCGUZ7BemSlKAZLy32NCAL2Q+fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZlYlZuHF9ydmrrppHu/VNAJ3s3DuOvQ/MzSr9aKzaQM=;
 b=Ovm1Qs+KrovCfQTm/y4g7E2kttoWiN7WEenYqxWqSjuj3EQRgRs39iPXCXVPOnRsFtG0rSTJ6FzirfUNaPee/lhSbYZktlLNJM5jEJMymElRefDcaxFmr+AzeTJ1TacEyl0Kv+7LMSy871ICAj9GqxxgzDRC7yP+US0dmfaqBC4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB7338.jpnprd01.prod.outlook.com
 (2603:1096:400:f0::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Tue, 29 Jul
 2025 00:12:43 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8964.025; Tue, 29 Jul 2025
 00:12:43 +0000
Message-ID: <877bzr97no.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: rmk+kernel@armlinux.org.uk,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	Marek Vasut <marek.vasut@mailbox.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>
Subject: Re: [issue report] ARM: compile error of frame size
In-Reply-To: <CAMuHMdV=60U2n7iK1rCX=MecLw9M+afN8cap5GUL-apF49i-rw@mail.gmail.com>
References: <87freu5jxf.wl-kuninori.morimoto.gx@renesas.com>
	<CAMuHMdV=60U2n7iK1rCX=MecLw9M+afN8cap5GUL-apF49i-rw@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 29 Jul 2025 00:12:43 +0000
X-ClientProxiedBy: TYCP286CA0194.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB7338:EE_
X-MS-Office365-Filtering-Correlation-Id: e0e0bda4-76aa-4588-7721-08ddce34a394
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LxW5HL+qMKHB7ZvEJ2bdcUDJd+Oo4EFj+vsq1LOnJEDfqK1I1eIg8aDal8Wl?=
 =?us-ascii?Q?YUzPqbIRn3Zo+26BsYA3mp9z0l58wvtAg58bYKV8b28qdQaFvXT2uH++0Gq9?=
 =?us-ascii?Q?HFKvFFxn9XQpn6EQns8Tjk6+38la2Wm/u/iz7IiWCIvzkoEal961b/bycTRw?=
 =?us-ascii?Q?s6v7VWbg+qCK4Pr9n2xBrplwwEN5bPEvAj7vW0n/ynkK8i12dSn1Avz/5KeU?=
 =?us-ascii?Q?d3Q9MAGcYekp803n8DcZPjcmlD1KF62xnTtj+cBBA8ALpQlvFxA8y9vF8CSq?=
 =?us-ascii?Q?uBoUCFRTjIKSzWhUOmlz+NxFSXiqv3Svjp3jDE1Gu7cvfM+DtnM80/Z9pyPa?=
 =?us-ascii?Q?kcbmsXDqdoaMEn3cvlV8eqJsSOXkEd/6BvjILimgwf37A2m24xuJzXTb4w8y?=
 =?us-ascii?Q?Rlm4OkAfiOC1QX9xJ24TFklY3gCdUTZ6h7ztVZ3Xob1/bq1EWJ5iZ8ul35fF?=
 =?us-ascii?Q?gKDRGsWRa4Pd9sKMmLIymsyZR9S9qW0jE6RfNANGDo0D4JKwNKuL4r80tOtt?=
 =?us-ascii?Q?hIFAln568VghBTvWudo681NawGhOKa8tCOp8uhCFZyRxdLo56GCU+1oGtTMf?=
 =?us-ascii?Q?ExO2TbEqCXIjpWsNUEX4HkL/0WPi2QTTRDd47bDwJCs/zxx1MaWySAPvRI25?=
 =?us-ascii?Q?pMZp1p9LQpPWwif7XxsbZ7H8N3yxRDNUs3wo17PadSQWvGNZDaYwvt68IolK?=
 =?us-ascii?Q?trV4iju0NiW/rqFS2NQ41xwWWppIyz7k7M1TBB3E47+RhiPiNVAlgVOW8ts9?=
 =?us-ascii?Q?7CM/jANSygmGgX3fqbQJ1m2hfSifwCY4Y+iJFQdis6lZLaj+Ov2iJPfFLHuM?=
 =?us-ascii?Q?rPmyl4T8GEwHfcJkoM9nlioXZCAgZmYyMMakqDFvr/gOUVBAUH7LqmYU8qIx?=
 =?us-ascii?Q?QfMhZo1+V1Khd6MjcMU/1BmkGYoirGEAQnFKwLfvD/OLcZMvU/NlHBkVc04X?=
 =?us-ascii?Q?fjk8Qrh9W+7Vq73+9Ol3U1X7FYF+2U4r8ZW2liT3trefvS51/+LhKC/XVWc4?=
 =?us-ascii?Q?tWqfyEONyyCy+IM2a8gYhHjySR0Z2tHAjyTNVU3aUbPBXylf5R8oStzSOHWI?=
 =?us-ascii?Q?P6U/4O2U92Py3GhdWP/ryKtHV3YFqCGI/0jJOwxNY9+8UdoH7omHVPIuSeSa?=
 =?us-ascii?Q?pvDNnlDdF9gnGp2ctYz/zYCKNhY8jNtC9Nk7yVCs61mtZhIs+JCOznDYnpep?=
 =?us-ascii?Q?mNK6VWNv8lIzBN35pYwAgwEU0YNdvZYccpnV3zRF9mg4d6P3RYHjfjLqAtc5?=
 =?us-ascii?Q?GiZEaZxnGohh0Wi1mKb8T40UPYNUZRJk1QEyZYVFJPFKrhu4je+rO3sc1/kW?=
 =?us-ascii?Q?54q1XnbtkkjTDkAztJGSt7XhwRqL1vC3FpVOIo5HKevcus+mXeMQqYHeryZl?=
 =?us-ascii?Q?E9+JgSWjaYeZ4ysRK+0vf0Oq5affMMzR37f6d4DapRvqn1ewOXQTLvWVEkPx?=
 =?us-ascii?Q?JsF+a87FowKvrQx8gPjhx6qZaQyrrqVR4bQXmLH83G5rFn2VyLAaPQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?siDsuewTRffONtXU7/YlOqwfWaCTjorAfCeYDPVa0yCdXiOp5lZcfA9kw68w?=
 =?us-ascii?Q?0rPDkZU6shWSJOyh4PNkF0hDeRz+hZwZNdeS9aYCdRWbU2VkZsccOqkufS9V?=
 =?us-ascii?Q?yfDXFHoJqPyUTDzcAxMus8g8Vy1VMU9ggQ9MPR5ClLYfSsPlJzikHSRVmgI1?=
 =?us-ascii?Q?oleMEVOXsSZCk9YFgYAtLkqa5I7OKiQ4PDFiz6ijcHVl9fpGDRDGu+WRxMQN?=
 =?us-ascii?Q?rFfJDFSHEK78oeGLru9sb4jPLSxXMsGOJKA9EgCYZxkZmSQrIlAeTsNl2EIO?=
 =?us-ascii?Q?r92Zh5dmhdCSsrkt18YgoxBLRvG0cBnXp7hUs2tksLtSN0g4jYp9M+mjlGWv?=
 =?us-ascii?Q?BeAFpSuwyejlv2PevqG0RdnNdqMoyc8eVSW0DIGDyIPnSJoxphNiCs5lyiwZ?=
 =?us-ascii?Q?Y2g6A4b/pOe+VnM0jPiqnp1cshYkf299eLop8JUwe7QerU5ivICzmdMDxcE4?=
 =?us-ascii?Q?a3CFXbfws28u8HrFMKqSUvsJqqVjc1IEeHH91z94vYrhq+5bMPh9KUTHu5x9?=
 =?us-ascii?Q?3s1nSDDITJfU2tPdfrvkffETO5AdT/lZQmfjjeOBkJv8kmfQtFlFnRXtYac4?=
 =?us-ascii?Q?8T27leDoS5IcFRmOuqqFubhQBNt5KAIIYXh21IsCvlf+OFTfyzGNrgragLZn?=
 =?us-ascii?Q?ao66K1lWcEJ+dWIdWm9MbbOWkn8AkCdQN8HxFhn1t2qmfafW6z7v7V0sL2Zw?=
 =?us-ascii?Q?OiKgsitqp0SC6qh02yb9FXJ1t2A8xhyc60KEDCmeNWBPRkX7nZFAnG0gud6f?=
 =?us-ascii?Q?kY0QikOEHlKIoywWJYT2fl1oF8EsZ0o6GnYvc51UrO2C8QOh74k8zp2N+W0R?=
 =?us-ascii?Q?zpclSqt3Avn3BQOgiYm3NLI3AoCVcbhO8P12GhBwrfUw28dVXecYwa0dxBVA?=
 =?us-ascii?Q?YPTV1qmM/EPTEdRUIbEHwJ8dM19H6jGsQV8MXIVVvJR1LlqyQds8RKHlmWwA?=
 =?us-ascii?Q?9oEBWdmYKdLwiN/Di168eM/TfbnjcQ4AjsGg1wAm1Sl0TTEMoRIQh5AoHjPn?=
 =?us-ascii?Q?a4ynfiu00ls1QA2bUN36ILLEvsLXNC8FnSU4/C0HyCGs4Z2sDLDDUGiiRVO0?=
 =?us-ascii?Q?agYNB24pWcNV4T11F48cveQXytG6E7aAvAB82WfcDzmNP0S3+mQrP6N//xC7?=
 =?us-ascii?Q?WM64d2llVeBtUTDONREhuehmfeiiB3x/3Zi6PGVByvL660fd5dX7P6mkBihO?=
 =?us-ascii?Q?2IduiBEwGYToxP9HtAeHJab1XP80bqzGqDvyb0p+XwzOaiWtRh9lojiSoux4?=
 =?us-ascii?Q?LM+5mx7gefVXDr+IMWE53Ju5DQc654cJ8DXEuUPc1EyY3lfbNzdegvdPAnn0?=
 =?us-ascii?Q?LseCJG1Y74lFkIyqFmslZ53aBIXC9bY5tM808YmkFyJr7OzC+0webbx+T1Fq?=
 =?us-ascii?Q?6Ap6qx50H6QuMtYWN9vkwy1q80wn+wmiVLh+d7LzeD5y1r8PvebfeNrFQJQC?=
 =?us-ascii?Q?qCmSXl+UjPMMSxvwlbT5rflcAIWgaj2sNhsfxtxJ/7AZvnbQI+yZLlrYuWk0?=
 =?us-ascii?Q?vY1wyupxl3NZ4ymIfGXi1KusYuCVZhr5ozYjJyE3cZn03bkPsBfUTT1VHkHT?=
 =?us-ascii?Q?WIAGlhnBBcmLj8Qibxfa1/pkBY44VgCx94feQiq5anvgUomGgAVs20FGYXXd?=
 =?us-ascii?Q?bQp82sV7A76dS6wEfyt3fr4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0e0bda4-76aa-4588-7721-08ddce34a394
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 00:12:43.6811
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5YM4U1OYW/FvZIWrXL5clovNY/9n/CCSEpanwNeTHnw6m7oQvWq3lzGl69cUKCssILnHcE55dnECwvCwi3aX0ZQ97RjVbDX55LECX4N8Zvd+CUZ6Jyq/0JgYf3xTA6he
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7338
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_171301_026832_AD9092F7 
X-CRM114-Status: GOOD (  12.42  )
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


Hi Geert
Cc Liam

Thank you for your feedback

> >         > grep CONFIG_FRAME_WARN .config
> >         CONFIG_FRAME_WARN=2040
> >
> >         > git diff
> >         diff --git a/arch/arm/boot/compressed/Makefile b/arch/arm/boot/compressed/Makefile
> >         index d61369b1eabe..c5173bd82380 100644
> >         --- a/arch/arm/boot/compressed/Makefile
> >         +++ b/arch/arm/boot/compressed/Makefile
> >         @@ -80,7 +80,7 @@ libfdt_objs := fdt_rw.o fdt_ro.o fdt_wip.o fdt.o
> >
> >          ifeq ($(CONFIG_ARM_ATAG_DTB_COMPAT),y)
> >          CFLAGS_REMOVE_atags_to_fdt.o += -Wframe-larger-than=${CONFIG_FRAME_WARN}
> > -        CFLAGS_atags_to_fdt.o += -Wframe-larger-than=1280
> > +        CFLAGS_atags_to_fdt.o += -Wframe-larger-than=2040
> >          OBJS   += $(libfdt_objs) atags_to_fdt.o
> >          endif
> >          ifeq ($(CONFIG_USE_OF),y)
(snip)
> Yes it is.  And it is hard to fix, according to the maple_tree maintainer:

Hmm...
Actually I have tried to same solution (= remove or fix the big node), but
noticed there are many such code. My suggested was very simple solution
I guess, but I'm not sure detail of ARM limitation, and/or it can solve all
cases, etc...

But other CPU (like ARM64) doesn't have this issue, so we can follow same
way (= allow large frame) I guess.

Does ARM has some reason which can't use large frame ? If not, do you think
we can allow to use it on ARM ?

Thank you for your help !!

Best regards
---
Kuninori Morimoto

