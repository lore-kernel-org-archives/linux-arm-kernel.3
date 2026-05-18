Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD9CECD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 01:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0I56UPKM+8gYnKMGMPWBdeYasr/JiNk0eXsENrsDC1Q=; b=BUNtXJXQOjtL6L70rxpBa6J+kj
	eutOhRhxYss4pXjjmbHNt9fc2iCDBPFEPyKZH30Jll8hRk5vMQfa/Wg0B3aNTGuSoYCipL9vHiTNU
	PwBXulzMgW77P2JB/CclyW8GU2Ihx6exdHS3IA0IV/7NucODAkzog9jUPhzFT8SuZuqfqWOIjaLWj
	9qW4JmdGpZRCmbRPcO8QCaWpFgqaEuQlgKdqim4+QDFTs0rOEDfx1cpXNSx4Ftq7CK/rXJu7+a8Md
	/VoHfZHB2gwpFle9VLGUwXS8yoBmyQItuA1O5BAQSKrcUvCniAWhwD90DTRPInKSt2hYnzuc2wQ+W
	PfEzZyJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOmkx-0000000DpZG-0jhf;
	Mon, 18 May 2026 01:26:55 +0000
Received: from mail-westeuropeazon11013035.outbound.protection.outlook.com ([52.101.72.35] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOmku-0000000DpY4-0IMG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 01:26:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IwL1qHErVSmH5OdgBx6gDMFr/XhUE+Y9gqmf+7hwgHRqd7AFboy3Eymj1G5kxP3eyCmTTACfbMSBWhr2a9MqGxCbxZKo+KlGku0k2GY5pam5aqdg6/cEPYRaQSX+HwBTm+3XftDji9esNW3phRPxF90nF5lbAPZYJ3GstmFW70TALHkf+oBk5FKrVrB9I40i8FVZPMuMjfLbTE8LLCcBmccJi3P10mNEOcQclKFjbvUgRu/Vf2SUfFpa2QsESbGPO/kO6SLspVkRp/VdDzw6GIiqXimmL7cnNrZSa7NT2AfC20w2Sg9C95g8gZC14dGARYGALnauLeOQsflB33HQag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0I56UPKM+8gYnKMGMPWBdeYasr/JiNk0eXsENrsDC1Q=;
 b=HzN7gvWkHGi/9FLZ7ZhCK55fLUCmRzew6BiUhdWnGQcDcb2NiWLCitIiK+8ebVQTw5gC9PiLVniLs8dJ25C15TE2UuU8W301fiKuAw1pfukw9A4H10a2M3LWza8kNNAGGOoLNiEnjddmbejLxtbGYiUoCt9BJDdP5qzFLWlhcP2C5nbk35+Onw0CVeLQg/iwys68QprykKeoJSsv2qoPgt2s1OQxBGYZRcav5FGlVDmc3rgVL9FpeCd56SU1fLhMy9EpTU23uLeGcVVhNxIhX9qVvOEIL6GDLZzNuBXFBRUGlPDJXGXXR3RtGOo7/1uzcpLQHZBeLputSX6nG6Hejg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0I56UPKM+8gYnKMGMPWBdeYasr/JiNk0eXsENrsDC1Q=;
 b=Sqjd3p6f4RsEoLj911hqOCw3SRamkXVnVBk+nVSC4xy52l+fmUcFm/CKe2JvdrsZiH+gSDnpDwJ+6OXnsnzXhcBQAuoNkKhN6RN2UTTgWzCo/OP6Dau/ffe9CytHSEi1MBH5UQVcw3YFJ9XhbZRH6TS7RIir6hoxD9PqUEmHU8dFNNBhEaBX0ETUxqvoT/IF3aEJqrDwQN0YjG+bMUUdptB8PqobuRXstEPqZmnUryYm3272XHi1N1wY60Jr0N6BZvnPFuYUk2nN+K9+IjZFCaWfVIim0ncvJFQvFxeiHK1u7GVKo99lAHl4LsSwvTLssaNQsQGg0DwPzgkRoWreEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com (2603:10a6:501:7f::23)
 by PA4PR04MB7597.eurprd04.prod.outlook.com (2603:10a6:102:e0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Mon, 18 May
 2026 01:26:46 +0000
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889]) by MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889%6]) with mapi id 15.21.0025.020; Mon, 18 May 2026
 01:26:46 +0000
Date: Mon, 18 May 2026 09:29:38 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Stepan Ionichev <sozdayvek@gmail.com>
Cc: gregkh@linuxfoundation.org, Frank.Li@nxp.com, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, shawnguo@kernel.org,
	hcazarim@yahoo.com, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: imx: scu-irq: accumulate wakeup sources via
 sysfs_emit_at()
Message-ID: <agprgizn9lF7utJ5@shlinux89>
References: <2026051633-doorstep-sequence-6782@gregkh>
 <20260516090726.38362-1-sozdayvek@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260516090726.38362-1-sozdayvek@gmail.com>
X-ClientProxiedBy: SI2PR02CA0031.apcprd02.prod.outlook.com
 (2603:1096:4:195::16) To MRWPR04MB12330.eurprd04.prod.outlook.com
 (2603:10a6:501:7f::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWPR04MB12330:EE_|PA4PR04MB7597:EE_
X-MS-Office365-Filtering-Correlation-Id: 01a59ddf-0949-48e1-29b3-08deb47c86b4
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|19092799006|22082099003|18002099003|56012099003|38350700014|11063799003|4143699003;
X-Microsoft-Antispam-Message-Info: f7DHamWTMYTUOKBq0Hxuo3W7d0ECL9rYpFwBZH2Vaj00E118qrB8QB+XwZfb95Xc4e2oKEJkrqLthah5uxiIUJAc0/GuzGcrej42rd5DVZR8YH4lTv6/dxAwVK2JklOthGLl8kUXGQsds0iQiLz0Mjpt6Y9VOG9MrjE9Fj4A+U7+0uNTQi/jCW6Q+F565OolMCarOjl4We+DJzDwxzO2PNVfE9SugdtpEJ9KJ0R1JFS4+GfepHD46pWZtiE687Tr7ArcuJcjNsXI6d1pL690jiYNedBxS83glBpBGOnT5JT+ASX3Rp1tHnP8YZc8rxrfQGLiyovB7SyG6Xb5gkhAdE13rkJO45vkF2X8UjHBr00hoAmNZ9d9WlrbFH7ID/0UhAcukFEVehZNkWsHwSVrsko6dLzROtXa03lcvR/Lw7UhnraGECu6E2WB6/thqjhY/LfvSTSrRE5xhPuxgxwziqKHT56DEGA7zkwn4t/RBXwzwrLTBAmot6dX5lPAg6xphTBjViznHh7euEfgPFOZf7dqqOvuBrB1/vTO58pCbYDR49vKX5rqs37xx+pi+xYtExxRIZowyUCNgGmFfxvsjEYPBYd5MDZjHFfaqjBGUXB4E2mkdyzppT/HdKyhAFeTaLs2RaOK/Dl9Zd+F/NahDRfiBmSItkTnUULM77OTRPEx46XPauy89VoxrCJ+WiVNAKH6p0wEoZBmX8pM5yaQxMF6uPeQkhmUhDmjSCKzttCEwrwv+MiCqr31SA4UO/lG
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWPR04MB12330.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(19092799006)(22082099003)(18002099003)(56012099003)(38350700014)(11063799003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?La7ZrRP/aKOSjNs83a6WfxbBjmzUAQq0+mLHV9X6hJqaswkYlEQfVl25S+zb?=
 =?us-ascii?Q?vBKa6XZ5gFQRAfA7kfIg8D8kT/efnCT4LrE4kDMBbCo+ilHgEV4X3vhwSjNu?=
 =?us-ascii?Q?27vJYhBzkA0m46VUs9C7qAP6gaFl+EM0/nFjSHEFTq2DlaVkz8mvKJIW65yx?=
 =?us-ascii?Q?Cn92ZWRFI1hQ+VpkHFL0k0ItqMMDJrTZZxU4l8/fFj4aVPWpNrRLqv6/YQBL?=
 =?us-ascii?Q?YNbti3mR22ytB46kpbNFwxK9ORD3+s91vYw+ABcPEJcH1tjmAj/q6v3K4ZBR?=
 =?us-ascii?Q?GzhQLOrIfeySnXDdyjsvQ0yShc1F2CYdv8RybRzbVNBNf/13riLLNdbfaD89?=
 =?us-ascii?Q?oQSkQVmWSIiQXTqBX/GfYvI99NSq2033fEVGfgQhocYuB7YTd1Br675RQU1/?=
 =?us-ascii?Q?K/BDYDj/OgzU/Qw8YiRneRrQy6JQVebZEsOy6BogjAIXVu8I4r+btwnItDYN?=
 =?us-ascii?Q?Ku7bJFCKPzJu2tq0ZLbNhV/Oe4+CgM+O3zxHWxL5M3TLj0VQZT5uw0v0BUFZ?=
 =?us-ascii?Q?QRscOdAd/9gHIezeaZCQ4gMT+ElZMABLNiCsvNKRmb8wFc24eVT79+w9K+yX?=
 =?us-ascii?Q?X9GGwiaAklwYPjULZgaZJVmQ8nOk+kltMWcU/GzRaTDTCProkEf7mnI9pmna?=
 =?us-ascii?Q?L+3kqZ8fq5Cv6mtqgRAfWoC8T7BdQ4pkk5AIop+kzS8HSuzEg+mUNYXf+aR/?=
 =?us-ascii?Q?njzYIUBaWaVHOr3cUuN+6hF3tGLn9ku5nzSlcswBdDOnuWWd1962bnU1HDtL?=
 =?us-ascii?Q?BcHkXTNYe8NL8u+MPYUwK+L56wJ8OWlUmUc6SqdELWLmlT44UTfmwwvO+jQy?=
 =?us-ascii?Q?H23bi3HcQERHziLKwvhocHWltaLR2b1qEwSm/szZOjvFs8zGQNyG6piHpGqq?=
 =?us-ascii?Q?isSghXfA3BS5HHzTh1rRXfhjBnlc81uG3d1V+ozkYnlaOF9xbw0+qawMtRM7?=
 =?us-ascii?Q?KhgFHqEhXS+ksRO06aI+25bDfsnx95uCI42qRWHP2waOtwSCqf5+OYuFck8u?=
 =?us-ascii?Q?DSYfjors4IGZZa/2XgxtjdxhFq2IhkaeeUzLsoD/3xV+UYboIwEx4dEFG7ce?=
 =?us-ascii?Q?kNfiElIGJ0NkjXBFGLZPzgsqrkO3/4+bXQGc0Bik6h6sRbQJayO5HLv5ExPe?=
 =?us-ascii?Q?M2e9ctjcG4uCkGkKgPgbaWBfvQ0DpnTTlREEpgT5IEXoTiLn2IwkixH/rGH2?=
 =?us-ascii?Q?6vB75cvJAPYIfq8y2uf3psi0HTGoKFPZ4/FfWg2xVucBlk3cg+ZOpxEuxyGx?=
 =?us-ascii?Q?5t7+/zMM+DwIsxFbrf7v/+XDoGTDipoAJ/yrO2TADbQ5e/j6VQVyuTMP7kxf?=
 =?us-ascii?Q?MYLuDGFIM3LA4C6oAZbZ481DjoSOK2Bde99S7DoDaUbSS35M5emfzhlI+B0Q?=
 =?us-ascii?Q?miKQwG1BoBRGX/eyT/sLFkmBjXHKDC7fWPrwRajGAoGdjtXtsryYgJGtX1jt?=
 =?us-ascii?Q?bFj27tOjUcKMREbOSoJ+h+eGRX0pBV2YZnaw1Cg/A8a9J/1856ibRl/MEIuo?=
 =?us-ascii?Q?W05/sQwTsLOJo57B6cua6cefPk51iJZC9aMAMpMTd94Jh0ANXJLelbAP+akb?=
 =?us-ascii?Q?X6407fq0ejqIYlIV2V7QVa2AKjM6kmDlfsuAv1hOr8D/dZveZI0P9qe9sXc8?=
 =?us-ascii?Q?2D/FIa6tTk2IOoFlnIGZjPO+DR0qhbbE9hnLzsnB1t9itHh36wY5YqaDR9hP?=
 =?us-ascii?Q?1mRCc9AzITTROiwVcpf6kRyuQ70tSYCB1MGajjXrbcE2I9I4NTgSfydbaJq0?=
 =?us-ascii?Q?diQm2wAdNg=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01a59ddf-0949-48e1-29b3-08deb47c86b4
X-MS-Exchange-CrossTenant-AuthSource: MRWPR04MB12330.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 01:26:46.4326
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +71SzpZLBiadNVIT6JMbvJnP47z8AS9bQRerYGI/7rlPo2CxtwyZAFYkcE30S0bcPwr+aaIPcg2CLlXjqAnaBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7597
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_182652_115678_809B88C2 
X-CRM114-Status: GOOD (  10.32  )
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

Hi Stepan,

On Sat, May 16, 2026 at 02:07:26PM +0500, Stepan Ionichev wrote:
>On Sat, May 16, 2026 at 09:15:54AM +0200, Greg Kroah-Hartman wrote:
>> This is a horrible sysfs file, and breaks all the rules.  Why not just
>> delete it and use the proper api for it instead?
>
>Yeah, fair. The sprintf change just papers over the real issue, which
>is the interface itself.
>
>Quick check: no Documentation/ABI/ entry, github code search returns
>nothing outside the kernel tree itself
>(https://github.com/search?q=scu_wakeup_irqs&type=code), and
>codesearch.debian.net also shows zero hits. So removing the attribute
>looks doable.
>
>Frank, Sascha -- any out-of-tree readers of
>/sys/firmware/scu_wakeup_irqs/wakeup_src I should worry about?  If
>not, I'll send v2 that drops the attribute and logs the wakeup source

I think it is safe to drop, thanks for working on this.

Thanks
Peng

>via dev_info() instead.


>
>Stepan

