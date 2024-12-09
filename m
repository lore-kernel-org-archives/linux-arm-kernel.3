Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BDD7E77173
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 07:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:
	Content-Type:References:In-Reply-To:Subject:Cc:To:From:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1RkCfv+KA2T/iTxEXpe0KiL+eEpp2VODG09ljYTMsaM=; b=TfJkMiDkiTztzbKxSubrOJh4op
	D2WfnKQFX2UYBRqprHjgGbrZeA+xfi0165gYpsOBoMdWQk8cGbpaXhQwcEUte2bBRM5S/0lzvdJjO
	ZlcGJltom4HebhvVk1Q1BkUUP/NmTAEkeqHogOMCuiLZ404UYDlrk53h9iLoPvXPiHzHlmop32SLI
	4FEHmowl90vHHj8xtoAcdHAZSx79XXX8XEenEACpm835ErbdlsjUAzqJVnb6+BCawYQQ9LmEQjlJg
	LWC27xGo9KLNJhLODAWS+jPql6P0qycUCQ0MHF07mInfNnVtBTUz50kdyApJQIquiYZzcmfmZA/3I
	ktJolhqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKXli-00000006dpV-0Ego;
	Mon, 09 Dec 2024 07:01:22 +0000
Received: from mail-japaneastazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c405::1] helo=TY3P286CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKXkd-00000006deX-1q0W
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 07:00:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uStgEHv/vn2nciTCgEboQ4sPlgjBjSUv+n3px00Ok6fk2oeSIHdt2JDmprLraBPu5wdg3RFUXz7VS5plYijI9CcxeNvsINo060Ohr4KFLC9axSw/OysrTWeTP94fY3/IaegBCY9J8/5r8X4NEpWWri2fVbeLcTnW71CUiLRAo4rteWUCp/TwW0rrbEfHJJA7hyObOFpN3GQe8Of63u4xd0QyIQOwKieax5HJ9nf1M2QJXH3kDkk27kRDXpWUIv1UipMJ+YkOqJ33k5o+AwiQMbtxV1FYUNyqyPa83MuK4m02d9URjBpCKkcVarqcVungHJXZYfQ+vy3l9djoMn1yXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1RkCfv+KA2T/iTxEXpe0KiL+eEpp2VODG09ljYTMsaM=;
 b=dWVOty6dxo/gOSZ3D1JOc67wlwKXPBWKVvznwvepMTa/FIoFz5UgGLd7Hhtq/CfL+AM1SPxmS9dhEdIEx89fOwcBA8ABz4ZP92hQB+O9AMf9SdDN9VT/AWLacGP13OWenqSQ/3w212HjtmFcwOijU99+3JOf5nXL61WJm7B59zWEg732JxGpLqfy2k+gXbKadx8i9RaqLxDZCO89HDneMBe0IpRDy0CsNYUBx74ZGevc/BlWvfIsZwnJvl23a818WvYgjkbA+6wAdz83RfY1k7Mr7b1LcHwjNUFQo/KHrG4sYXl9S4t0LfTl2HYyhZwPyMqUUFAxsHflEmGQ1SYHIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1RkCfv+KA2T/iTxEXpe0KiL+eEpp2VODG09ljYTMsaM=;
 b=FLKy7hqlH08ZRDns3Wjx+k6wBU06wjBS9T7E/PdQojlT03FmqGnBqEA5eGvkcBxSZj4H1/7Pj9mPJexdAqGNzLNlxoWltbSnKro8fRS77n9pq+MHqjXbWYePxY0jCzWSxuofVIbZuvf38x1QPaJRFplBuEmcdWp9EMSFyRrc2ns=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB11303.jpnprd01.prod.outlook.com
 (2603:1096:400:3bf::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Mon, 9 Dec
 2024 07:00:06 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8230.010; Mon, 9 Dec 2024
 07:00:06 +0000
Message-ID: <87y10pmjd6.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 0/5] arm64: renesas: Add R8A779G3 White Hawk Single support
In-Reply-To: <87y10tvhw1.wl-kuninori.morimoto.gx@renesas.com>
References: <cover.1733156661.git.geert+renesas@glider.be>
	<87jzcg1d2f.wl-kuninori.morimoto.gx@renesas.com>
	<CAMuHMdWF7NcmKYzvF4Dfjh3S5MccbJrpSphK5BhxXNnhxgtmYQ@mail.gmail.com>
	<87y10tvhw1.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 9 Dec 2024 07:00:05 +0000
X-ClientProxiedBy: TYCP301CA0024.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB11303:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e789e25-50bb-454b-e939-08dd181f1c8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RAl8B2WyawHbkudxvzoIEeGWJeKw8g/myD+13fq/W3v1oc5oDO426iuKfltC?=
 =?us-ascii?Q?slquVtKxO/nWitWv9YMvVJkxVAA/bCsC0Pi9WjNYam5prsTkRALBHgMUucrU?=
 =?us-ascii?Q?zQO+vRGvx0ct4DMpJLHYRhcT/lFU05BKY6EJ8OV9rMxSJRdlmQmaLBIXpYvY?=
 =?us-ascii?Q?USAm1bXiaZK3XGu9BAYnF/WlC89vU3qzBwx7IYCIbCz5cC7zPNc36RmNhe6o?=
 =?us-ascii?Q?WaqgSoXbcBT3VVcYhqZYZ2mE6bvfSkGcetRTxZtKFfotj5ceCOBvg9+yG06f?=
 =?us-ascii?Q?JMxLo6XdghcVPWnCi4JbpClHX94lVUuqr25OO9xaGCoPQ7bLEiRxTTfO5n3y?=
 =?us-ascii?Q?ywnJXV7+XfKak06Nf0PhNnWAYmwzwANJMD+u8uEwl3HgIhjoDySz25xuPEKH?=
 =?us-ascii?Q?kXQFp4LiwcoHefO0ysaoALj1TUZzzKHpe4kNRsgO1vd/UBZZTIRBidG40wMa?=
 =?us-ascii?Q?mMwNixIyHlfvcvGwswCmQA9QR8niYU6z4exvQryySAtRCCr9Rm31QQhyiEcf?=
 =?us-ascii?Q?T+6I2e1RuZa2wf0316z5G5vXU+VsonNVm0c/3K0zrAQUPWrqal+oaiZ9DpSN?=
 =?us-ascii?Q?RMo4yLKUcULN18/1g1RmavDDjp+4Xn6t74hcEjCZ4zCFosgVcKxXupXJKs/Z?=
 =?us-ascii?Q?908Um26bQJQAh1MDRQJaYxCcXoQyt5IR5Gh6gAMZHErEh8EBCadj6rl3itmb?=
 =?us-ascii?Q?1f7wyHmgeRVwlM5gN8e/a+NMtPgDV0G2pK3RzttATG38VVrfiBQRJ/LMu8or?=
 =?us-ascii?Q?LGcbJfZ75vZXGOS8qTtrcNwmltdPb/BLquc86nKqNOryX67Jt59SNZQ/zh8o?=
 =?us-ascii?Q?Fwf6XV+cc8I5Xyf7bpdUMG2DUQ1st9u5JdtLNwMMaONxpHjTciunvUpdZsle?=
 =?us-ascii?Q?w2HmXxg6zLTk/WSbWspSRYFYXuAoa/wz+uc1aiGNKoK6ETzqHelNE6eimvuj?=
 =?us-ascii?Q?M1fFbUl7RpHIIGvfHugCQwMkMIlY16iTsTxW4xFC37VmAhNalyVwxmVtxlFg?=
 =?us-ascii?Q?6hTGB/BYpZTfO+4e7/tmiEZT3NYsh7J/FYPF4NtFUodPJfx+tfIP5eSeObgg?=
 =?us-ascii?Q?i4bf4HtyTlWF8BRGZgklSV/jvKH1UyYmhvlJ2TG1YoG8D2jBAGNhSkU5TKUx?=
 =?us-ascii?Q?LMvn5k00pnZCMZxMPmGMsWrdPl5rzVoSX7uYAna7yTbfuQbx5xno5iuvP/L7?=
 =?us-ascii?Q?C0EwbhG+EGoTwnu1TE3VwtaKFPJhGA4xPMGWhls+sk6INa1GOW19ICssLPoX?=
 =?us-ascii?Q?MtKOpvuQ8/fN4gn0vUwkvqp2Edg6rV5DWnGo2igYVhS5jEnmaqcZHJwQ9/Zi?=
 =?us-ascii?Q?FWEe8w2cd9Zy2GCMKmLQE7I+w/AbgUwImqDZiNatshtCYj7rOkpSJsD8pnpp?=
 =?us-ascii?Q?8afEyZ8Dt9vg/AD23hk6ou9aw0UBwqOoTtKLRZBNCbNTNQTEEg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7HbcNXYxM9MZopjP5mQVlfQEhder18q0rsfZqBrjUa31zFbpgk/Gf4PkIP1R?=
 =?us-ascii?Q?MFgyIH96tAI/L5xbIUG5TXArrKHmyFyXHiXiAP04hmIh6Gve7Tb1BbwAOziu?=
 =?us-ascii?Q?O8W7rzAmrXSH2OFoUpVfPtWl2SH28z27QHLXs8sfPIiCy9emmVW3ysgSa9BU?=
 =?us-ascii?Q?MXjGa6n+rHV4ojOS1rERe9uDPeQz6qKQMyvqkPJyPFSfycAvIwPymLKFs1Mu?=
 =?us-ascii?Q?Lj0a8uhlS7hXGt3k1jOH3sg+g9VRtXn2jZTm5KTluwawPNPG+f5CRgsB0Hpj?=
 =?us-ascii?Q?X3mbl4nvjzWn3EaRGpwmSf4MmRxYIErs2q8bn4KygZrW5NPbrbxnfWe2pyOl?=
 =?us-ascii?Q?I5cwb+hKIevAH2ZaJwLk/2QtUkAi34KB7U1Mt0YTo8qUxbyHC9mapIAma+Yq?=
 =?us-ascii?Q?p1Rwhpy2oOXqI8O2AtdGS0tjKliOn85mZ8SXl2Wsy5A93s/VDfwkX6Vbc2ra?=
 =?us-ascii?Q?abGuvs6ggpw/nm5eyPAF95Jb779/tzpcXzvSWxGAAe0li/Rfxtpi7qUQCCu5?=
 =?us-ascii?Q?Y4yJe03XTxD7wS53mBUTKVhwl3AbQfd4BMizZYanjQqkbqmY71T84/9Zvx0V?=
 =?us-ascii?Q?6a9yRc+Wt4JMNGy8BaJCqTwxvvXU28Yn8WwNNgOjyrbA2Cqj/ZPqXL0h587Z?=
 =?us-ascii?Q?NtgasfGV8jQaZsDG8dcM2/4TT8vh3gCkBDiSYm9XRx4ffTgHPLzV+MhcmviQ?=
 =?us-ascii?Q?KS81S6k3/8PkQWJfjXEAIjeBga6PrBSxiQVELC56J47ZEOcmRq/05aRUVEx+?=
 =?us-ascii?Q?wc1bhSYreXtzCfnD3Y/abrJpjolyEt94HHqZZfPnBY0a4igWkkL8TPKGQcQ1?=
 =?us-ascii?Q?jKNwrM8TTaAjcxIKeSfrrHD4TPGKxpUtp5CjJiPzI2RrOfcNAdcIqxdPBJLk?=
 =?us-ascii?Q?NIF/i/GmniIfN9nyOwnRkJQhWrJQzw+SMNUj/RkCy2/rOezOrnLzb4xy6ab+?=
 =?us-ascii?Q?xbtCoG5WOsf4FFo0D0PxGH77Fxod25/u/teqpSUhGMCaHgQIonClFo9WW3TN?=
 =?us-ascii?Q?+2wmQj8hwvJBHL7TtZXw5N817ParoeemF3OhPRLO+/vVwvaH2s9tybwZwNpo?=
 =?us-ascii?Q?7nzKeQe70ZXi26IBuiIm+x0SgApD46gXqjEWbnfGgR/gFccIW64Hw9hov5It?=
 =?us-ascii?Q?llBtadpKn7PmFdGNf19wiIy+HWPg/GyViy3WxOpJ7HO58naLgmC4p2g/gKJB?=
 =?us-ascii?Q?bWXPYnObnHZBzN6oeLs0dwYSjMriBEBLG6oHyoQnzwgJP5cPaZDrXeqSyXVU?=
 =?us-ascii?Q?cISo2wB0Xy6fKptKpEith4su3KgVymm7c2nYAaR+KxItAunXejOBCxtSBIKE?=
 =?us-ascii?Q?8W57JG4TuEjSzkJXkcr0UAMEK/F9nUV6G37w3FZqD5iVxmujI0I/N166YKsN?=
 =?us-ascii?Q?LSdaFlhtZPe7vzZyZjxO+IGS/UYqQPZ3y0Sfu3NYofWkr9XxxBy+vLpo7Kd+?=
 =?us-ascii?Q?H+5UrzAMAFvNxE1Cv9XMWfVtQLZGoNhB2YEGN3fw6oWKfr3jjW1RRj+wNe2H?=
 =?us-ascii?Q?nv9iAm8bxh+WgadGf/PoKgcGkEkM+9a0k7FXG0TbfQvWVHSxX+BtRWGqbXI6?=
 =?us-ascii?Q?WXqK6KHB1vIDFS8SOddnrMT6vJDRwlzvHbJ7J88hBvh2uRGiW3FJl/dHIrQs?=
 =?us-ascii?Q?VPKmB26z68u0CWIh+uydkr8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e789e25-50bb-454b-e939-08dd181f1c8f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 07:00:06.0308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4KtCALKMYIAbe86L3srU0YJ80VHkstd8PQ85H+EbzWP2vOW91oLJEoLMHJo4iI9hhmBXPNojoMSWDbPctiDmw01UnU0AbsC6CTq/6RJpunqUACL6bYWjr1SHRmMgyL63
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11303
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_230015_720116_3A7C117E 
X-CRM114-Status: UNSURE (   6.80  )
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


Hi Geert, again

> > -              - renesas,r8a779g2
> > -              - renesas,r8a779g3
> > +              - renesas,r8a779g2 # ES2.x
> > +              - renesas,r8a779g3 # ES3.0
> > 
> > but decided against doing so, as "ES3.0" would become stale as soon
> > as Renesas releases "ES3.1". Alternatively, I could use "ES3.x"
> > immediately.

It seems using "ES3.x" is a good idea.

Thank you for your help !!

Best regards
---
Kuninori Morimoto

