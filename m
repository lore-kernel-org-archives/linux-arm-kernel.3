Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73A2CCAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 04:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:
	Content-Type:References:In-Reply-To:Subject:Cc:To:From:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GuM1mfGm1FPA5YxxYmHOXywkhSHTo0ggixjHg07JZS4=; b=EyMdpF48WXWpstGbaBmWgp6OVh
	bAzbvsWflB1B4YRYFKN583T8ZjJF+1x6J8IyZTMDpWZ/MLMtIOXDF8W2hIUX6uRdDEvWa4mSteYj/
	nofUg8Z3Lkv8Fc6xZzn2f20wzBjToGm+Ys4qlP/Gf4oUh6rIrBJLQuZMYnTBfH2sbdmaRiTkoMNKI
	+54cKRhHnvp2qQ5NVVo6d2IcPZvxgNJBlksNMNNoWOaet3CszEd4C+WxUD2GvMN8EsbyNLjZO+sxK
	6mXehd+IO+Vd2drvClQ2nfAr8hyxLl97VN0GRC506oUGxhO/shm8Rg5WG4cEgp+Gaa3gLGHEB74gi
	qjC1xfAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5zSt-00000001G76-0tP6;
	Tue, 07 Oct 2025 04:38:19 +0000
Received: from mail-japaneastazlp170100000.outbound.protection.outlook.com ([2a01:111:f403:c405::] helo=TY3P286CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5zSp-00000001G6d-3t7E
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 04:38:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K9+b7ReucNzIw1JYe8yK4BgRZoFvct6QZbd04izvZK1GRkOo75tD9jNAcBK/75NPr+PriMKjY6dfysngYFN8UPc4lBtcYaQ6Si/Qj5L739KWvuB0FLsL2GomXFQVwnNLDk9sRKAiNeJoqhddJC7jrE9eVd9OCTn2jGOmI4q99/bXFO43Zr0Pa7RWUHD6DowRbjYqSvdaQG6UEqBkSbXV7wa+/tWfRDjwLdlkD9G3qNKYR72yyrLDwNVdWdp+QzXGt9Fh5dRN0c3C/xShuKUHbYlPG1aqbWadcjYODZY5udBcagRVbo6gdLVKw+Xul6DYgf9YRbUpzrNqBFyvKf1JYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GuM1mfGm1FPA5YxxYmHOXywkhSHTo0ggixjHg07JZS4=;
 b=M2eQo7phdXmkGTfL1GRl/mC7/4XPtNXyoi4EIlnsJCPPi4whr9DOMIIwwLT4IUe/8gKkekmtz21VeIarQ1H3Wvw65IFgYv3jmN6y+jNeJ9enKsNBE2y/NvZop/3hDzT027vQkyP2p8y8nQ7b30k3xko2QwRNvKYtmALXE3TC1B9s0KBDmcTisDJimVjQAd7AbCvTgyj3DDmEoQB+oEHzzpPeg8EVaqI8wAOqqRXZbYtQjbWyY8iIviBsMsG54/LlUjvqojDDFV/X1pu/R6wJqrcGxqeQlamo/b29XNN/tGreSWUZy2vATwrWYZWaVURxbl5t8NXFdkG7Ho4oebl5Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GuM1mfGm1FPA5YxxYmHOXywkhSHTo0ggixjHg07JZS4=;
 b=mx2dOO3+1sC4YZwWmE3Cf2DlhBzLcz50NK9iYxukVWyjRSxnrdpzGIjak78sHh3cXqUtNUnL7BAfM2uvmL1hwbccK5acGq2k5x7j9aPeFluSvhqLjko6d8bmyx/L0bZZw98GUlhOm7Jza+JBJPnloYYQrfgOHpOPJ5BjKz7nwwo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB11711.jpnprd01.prod.outlook.com
 (2603:1096:400:389::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Tue, 7 Oct
 2025 04:37:59 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9203.007; Tue, 7 Oct 2025
 04:37:59 +0000
Message-ID: <87ecrf5ntl.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 00/13] ARM: dts: renesas: Move interrupt-parent to root node
In-Reply-To: <cover.1759414774.git.geert+renesas@glider.be>
References: <cover.1759414774.git.geert+renesas@glider.be>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 7 Oct 2025 04:37:59 +0000
X-ClientProxiedBy: TYCP286CA0173.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB11711:EE_
X-MS-Office365-Filtering-Correlation-Id: 19c73255-5ac1-412b-5916-08de055b4b0b
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NI+NeU9zLjq8Tpq3EAIpAuToT1UHmpi1RekNAmw7gy6pZ+s/GtBwWvqWAbQC?=
 =?us-ascii?Q?NGN+ubwK5tmRztjBRuwtikOKtXxw+3uraMwMi1/Wj9PJBMV0/3Pk5esyxf/z?=
 =?us-ascii?Q?aPpEpKYbcZ4lIDyJbe/AqBaUUyMT/V/3f23sn6P4lNcV2MHEbLj9FBjek3FK?=
 =?us-ascii?Q?Parc96XBDRit349qL6QOHf6Nj1pQD9GSxbF2t5sQUPRCyb0jpbHtV2lrW427?=
 =?us-ascii?Q?rZcrCi1XsZHfGrXZxA8DNICuA0l3EhGNajw/eRdNQ0h2U8Vpl8O9i6oYNl5r?=
 =?us-ascii?Q?4eti4E5pBvJpYIUbNdHbMr9bF9xCd9Y5BOtH8rCkN59pI/HlyAepldWHtZal?=
 =?us-ascii?Q?3XKB1TyV9d8bqiAR9kXk5e0FO6tR3yw5gfYYaG6S5isbBw9vEJ6T2fwFPmJX?=
 =?us-ascii?Q?5nj0aFUEMq9yUyYRVHW5h4zzvLD7nOuEZVvr4nVH21b1aR9wFD+uNDxHYDm8?=
 =?us-ascii?Q?tl7I2F9kxNgvWtdBvid0DpmEqq4zswCbwwvGFiGHHakjLGuyAxt+g0IqU0Hq?=
 =?us-ascii?Q?tAjf4Yjv5+2VTrATPaXGAvXVX91b/DUe231grTN1xFV1HnL98WDAZh3g97fK?=
 =?us-ascii?Q?hgUOrz/CsqwfTxZsNLh6FZkMunLDgFfteO5DFFs5mhACkqzGdmxB6OcbGgEz?=
 =?us-ascii?Q?3O6WD3O6Ha1bBbR4ZQYUR8UkrMxWVCPrYbaH+hEUkG5gmcC9KVXWeK6Z0Hbp?=
 =?us-ascii?Q?TKSrigiBNatFY7cKBcOzUi4bj7Rw1FZMj+WL05hwBCtt8b8jeNgZBFqI272/?=
 =?us-ascii?Q?JMhVNyFdHFpX4dfLz2a5ItytapyZuMYGI8mmQeQVZhdTFGgfRDTOuTMPWQZ5?=
 =?us-ascii?Q?+WZLYTqT2UOAzJFqq5uIrcun3syaPZLN6RzWZI7Lq+dS4uHzUZI5asSl8xtL?=
 =?us-ascii?Q?/TIb0efXbZ73hR1btqKLVkj9AcWwiuD8xlJ5QCD+lsovR7GQT15HP7VoCBtB?=
 =?us-ascii?Q?2D/ilIYw6Tg63/0JvK1Kkjq01uuzMRDIFwpjmC3twO5ox68tuQf2AlP/kvcz?=
 =?us-ascii?Q?YlahOON6ePfOQiSTnByCIz5vnpG7AWLpVvl3Effv0I4aU9nFcMiXb6awg4U2?=
 =?us-ascii?Q?H96jIOxKlOUFFbpbppbEw2fb9r4iza9XA3umWjp+lnK9iWqDXect3VmlZffX?=
 =?us-ascii?Q?16ZYKwvAI3kgMYuFxjYEi8VBBuu1hqvOahARq+lbjjxkJIsQBk05tLhzbNfr?=
 =?us-ascii?Q?Xri10/5duQL/gq1nbPnpRdBv1dzj2q+xy7VWkXUnnBQNbX9L4HLcB/A/8D4H?=
 =?us-ascii?Q?86Mjia5fac3kNnnC1IMiTwvEcJ35vzx5IL4XrfqKzKdn7OdR9WHljTduTYPM?=
 =?us-ascii?Q?baXbHzmOgNMU7NgeooeMva7+CX8TjCs84/ND4WBm1RG8w6admVYa47ci1SNj?=
 =?us-ascii?Q?Ga4oF5NWARqR/8lWGgcqLzvHU9yXxDejU7+Wv2It5I3AiiCf7lLN4wSPD2p9?=
 =?us-ascii?Q?elxYi8x+xZDX6ELemAGR6hFuZSuVc3RGQbEb8iRonZp0+IDR8zYpKL+KJher?=
 =?us-ascii?Q?zw2HgwdAnq5xIHOaFMBFxvI7W+r9XB7HG2j2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?h6+Yl47/YGgimYsWwkcTYLDYUYn8PMJEGaCRt8HkkBeel1x9X6PcsVC4w+cQ?=
 =?us-ascii?Q?bPUaAgVShI/4lLFeMPW8uh3nOzBD6rBMRybeT9CF/Tb4wIQMjBcP+AOKYmbV?=
 =?us-ascii?Q?0zciVqWLl44UfXbJF/5KYidM6qbDs4BINupmJbbG00E3e7wZBpjA8YOSRZm9?=
 =?us-ascii?Q?fR+5jtpWO/ukWsaprXl35jKct2UXK5NeDtGhIaQdsngmCDwsF+yqrhm5o0SL?=
 =?us-ascii?Q?WGm+PF640rXGOMmc3yilXmVj24e+iznh76gMEfw5jtuGVHtJy5BLZB4CKlvc?=
 =?us-ascii?Q?SqU1BIcXnkTd5ja36eJTKdfF7O7Y3xHyNtKlKR4GpX7VwNLajecG4JC4C3t0?=
 =?us-ascii?Q?xnmRxZ3VQSEYS2j6Uti9ZPEYWBchrdAwtfjdYMbFeHc5GqSaAKcCGA2PjEUd?=
 =?us-ascii?Q?iOECWwqh6yiSCdH6KOlmfjYymc1W7BfGwZ9F4MJ+3VrBWcnSfIf+/st2CeIy?=
 =?us-ascii?Q?p6Bs2vRySl3rueOYOuC7ZOLLcO2i2kdYB+w4uEHqF9+gpAqO9yUALZLnB92f?=
 =?us-ascii?Q?jffCv5uJI5uPdEkJBJfDUIkwNw5lq0lrahdSHoOCLU13f/4ACqObVh9CHxsB?=
 =?us-ascii?Q?ivTVbedXHDzV/BMu6N1xVnkMfJ3l1CHcbjjpVYM2XB+bmojiCn9hS8JNlMSj?=
 =?us-ascii?Q?jjBRbkZnRlRzuGTcHUt7MqhKhWU7CoXL31yQ+z3q6C3P7+uAkjf3E521cFDt?=
 =?us-ascii?Q?jtH7sxP0eYZZRTWU/GUZcaktNJPSgkQyftDhDZ1rSYLN1OwwPbvkljqVRzmy?=
 =?us-ascii?Q?BpBDslpC9UtP12nEeV76ul65iEkl1H6bxijQFwb0T6P6wy2KSPUo6qsQhFD4?=
 =?us-ascii?Q?qA17dfkcB8I6435bwMCJj0WNC46Ctgb1EEMv4mukbOKMVkwT5jvaCivihCvV?=
 =?us-ascii?Q?/9JCLwqexxDZP6v8cOD1Kq24hBy4TY9zd5otIVTWi85RrfQCbs/RzcBFG2IZ?=
 =?us-ascii?Q?GS4fXazTdY/Q9CT+ZGGh2hM9ABXAKpoKO5Gpzl/22S2r4ICYMKNsZKqMRmVv?=
 =?us-ascii?Q?HAX4/9ttkFjUkasBnsNZYv8GLICNh1w3TyA7JxT/jbSWtC0YX0IBC+8ml2/7?=
 =?us-ascii?Q?HsnU7PZze4ZY7Oyf36YD53oTXTMXMvZhkcloLW7DjHh8xPWzQH3bDopKPXsH?=
 =?us-ascii?Q?Oq+PNQTO2ztJo0KuL3tc3eYpN3ATjFvCKjO1kgsJV8IBkO3V2PHVuoTNbN/R?=
 =?us-ascii?Q?Q5cr3k0OM84NcQ0Hgt9jxZKP0DoQwjon+14azf+bb2tOqxMh49KVciqF5eQ6?=
 =?us-ascii?Q?o70bzuyXK8WC/hpQ4qNEtloAIZoNtb+y7OiEQoNh+YroiqK3EC0DPBjTa5hP?=
 =?us-ascii?Q?Azrv6+6muOLNEMii2zVbNaHjqXkYb/Vyo0vNjVeGcKinLc8LHetpI47PF7yN?=
 =?us-ascii?Q?qUceaGb4qNATe14lhvMRMPFhrpE6XtWV9iJt1Zi5+WfqlD1cP1kTYKKArkfi?=
 =?us-ascii?Q?KSQdz1/aGeUmPWbVYR3kmY31uDOFrzh+aWnJe9DSsnadF9YXGQrYX3pR/qOW?=
 =?us-ascii?Q?hVn/C3UlrANuj9bYCPl3+/Z1YMMqg1MbfJXAo51ZONSsi1RbHk25ac5ghmJ2?=
 =?us-ascii?Q?cmuLZZlgQUprLjuJclBwoWo/VoedNmipf9gt+C8XndyqbVlhvdbACJL4krSf?=
 =?us-ascii?Q?/z7vgbo+PBKlMsgnTUYfOI4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19c73255-5ac1-412b-5916-08de055b4b0b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 04:37:59.4355
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bvskJ7x6LA5eHxVRcEbdsPJ08dmZhoMz5aliOxYK6PQFmZ41O1rGAYTbQXunXYgm5fPDYn34SHGNSYDA0X+xpazI618oggkbLQ3kbT7mH8X4YmjiA5/N/676ZKI1W8d5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11711
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_213816_492672_00E7177C 
X-CRM114-Status: GOOD (  10.19  )
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

> 	Hi all,
> 
> This patch series is a follow-up to Morimoto-san's series[1] to move
> interrupt-parent properties to the root nodes in Renesas ARM64
> SoC-specific .dtsi files, which lets us replace several
> interrupts-extended properties by the more concise interrupts
> properties.  This series repeats the exercise for Renesas ARM32 SoCs.
> 
> Note that several .dtsi files predating the concept of the "soc" node
> already had their GIC interrupt-parent properties at the root node.
> Of the modified files, some had duplicate interrupt-parent properties.
> 
> I intend to queue this in renesas-devel for v6.19.

Looks good to me

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thank you for your help !!

Best regards
---
Kuninori Morimoto

