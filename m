Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0752EC02196
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 20:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wHj6XpVqlqcVKLvhGukWxn0lTz0mVT/QSJIIe3nj92s=; b=iIB8stQgedoGz3q9jbHB/EmAxr
	k3eeuS238iPG2wI+S2TDGJrMOMffRsqldGamkjAsDp/ppSwXS0r/fqgMa+ucpH/j4HxWn39tWtudD
	Sl7PuGqOgAEb/ND6Ly9YUMlSgCzv/1ABD6PJPH+AGP6S+VWgiiOOCegRFsP4dBbOJ+dISOEiIh6af
	H+LZSd6C5dfPKvW2o4KELqHTkN1BHbk3b/ygi/zn1GTkMMNVaifYkeQTA0cBo2ptBbx1qQjyrzq0W
	xVVJwuNwL1MXNgzx0cdDVgM36e1/BWyma50tyhW2StVfd9uQ1MEZcP3Y6Q3bSdAoiJYEcOEKRuPwQ
	3DEP8s8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgUzV-0000000B5JY-42AO;
	Fri, 07 Feb 2025 20:30:21 +0000
Received: from mail-northeuropeazlp170110001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgUmH-0000000B2rl-2PAx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 20:16:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uAzIrR59V+RfUmCm1Fy2sOwQI8XEq06DYgxGAMjZm6o3vIUBMFJlR/t3EIsKclxwuAGhfCtFxkJ3VU7uj3Dq0uUZczsw0MwVfiGRqELa7KfeJDsGqhmp8fwT4GzLqqJXcRFQRCVqBYd+z8H8LwCsmvUiosQTTzez5zpQc4jxXpbxIXy9RDZuleV02IuXgSsx3Yf6d0RxEKVrJwIrVsm4VZ7nJgESzUi0xt4FK6PV6A7+AfHrEDSI1EU3vPdF0E0p29lrau/FkrMkHAJucBr5CACjT6jQYSBjQLOa6lwD21613T8NwNjy/Hr2AuDu3ehIJc7eK9tZx1zgfEjyX78F4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wHj6XpVqlqcVKLvhGukWxn0lTz0mVT/QSJIIe3nj92s=;
 b=tw9k3x2TvQY+oLfvFDqI0lgoHB7dH1PgCIADB51SWb4X06OutrksW7GPPBXT22/mQ4KXvq5WegQIqNwX7ntKamvPe/sqRUSZ6Ttt2MG2r9wr55nYS0VS1rbLbv5W1BvXg4vZ+Qzb7hhPIrSCio34pgUnSuO49wOfxKTBdvMH+QUb1to3g8yfs9zcyU9niliHIiiOubNfCsw6DyYXHfeFhl63t+jMJb2FnNFzUOUJRkRall56HAWN6AL1kiLuxLwc2ak8bgG5eYD+tbb62YYnz25breHEZVLK+quiCB+GI/vQGphTxD3DbgZlSH5YCdTqtgrUBxb2wD9aJcTgckkzhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wHj6XpVqlqcVKLvhGukWxn0lTz0mVT/QSJIIe3nj92s=;
 b=Sve/hfI1FlgE0+xGEQYWnU37Q8tX5is455nIMIGmpTHTWuM91zsb1zR0hMtIVo3flmes8+75GI0xAg30eF+E33Xt81RzBMrbJGgzH0JMkhTp9KXhHpN+g2n/FdeGBJuhG1uO1V4yIPXcbtdh+TWnuH1wXdKd8r0RpFQ9NVPPzHzupAD7caD9Wj/aiTLK+9zWv+o5/DCuahAxsozlJ21NMkfhM8GAK7AePaBt6lYC+083OgXciU4sXuQtkoJ7HqYSZvxNH4P5frsjGIgHFNVvZB0GPccu51Qqivk8DRsBEW1hvhvm+zZDtGNsGipfYu8zl8B5ruxI67U3VEWSgaypYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DBBPR04MB8028.eurprd04.prod.outlook.com (2603:10a6:10:1e0::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Fri, 7 Feb
 2025 20:16:34 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8422.012; Fri, 7 Feb 2025
 20:16:34 +0000
Date: Fri, 7 Feb 2025 15:16:25 -0500
From: Frank Li <Frank.li@nxp.com>
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, NXP S32 Linux <s32@nxp.com>,
	imx@lists.linux.dev, Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Bogdan Hamciuc <bogdan.hamciuc@nxp.com>,
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
Subject: Re: [PATCH v7 2/4] rtc: s32g: add NXP S32G2/S32G3 SoC support
Message-ID: <Z6ZqGeswJDPTlzvo@lizhi-Precision-Tower-5810>
References: <20250207163808.1208552-1-ciprianmarian.costea@oss.nxp.com>
 <20250207163808.1208552-3-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207163808.1208552-3-ciprianmarian.costea@oss.nxp.com>
X-ClientProxiedBy: SJ0PR03CA0059.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::34) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DBBPR04MB8028:EE_
X-MS-Office365-Filtering-Correlation-Id: d45ec630-dfdf-4664-2cb4-08dd47b45135
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LYbhz7nKnPdh1IxMpbfKxgVxQtV+SuCNp5y9TxOeNZD4PxaUTzQ+PCYETrHP?=
 =?us-ascii?Q?DthO3A72LnIfZKQiMtm2Da4CzoJltwE244zq/47BGwVf5arx71e+C98If+Mc?=
 =?us-ascii?Q?F8R7NUPlgtIMmCsxdttosmN1bgd+y1aXYY8gUijOvFPB7pX3hDVjaCSivh4C?=
 =?us-ascii?Q?q61C6VSMkxAOsHQJRenTlgMfU3dx9WViNio7ReIyx0b0e7+G5Ah/uzCtwEWz?=
 =?us-ascii?Q?opPMpFTT9xlWO4/xYnppKTXZE7YzjNdIEUK/igAgICXZlzuWY3+VGOUTBlbn?=
 =?us-ascii?Q?KW+Oh7xKf8EsfYwwOLyTp+AbXAgUdNaF4YWmloQFH05bc+EID7OqiaSJ2apS?=
 =?us-ascii?Q?zB8dgLwjsLOpBvFneOrp0J9+TprwcnFuK16dUtX0zvaYHg0s+12QJcQWNQE+?=
 =?us-ascii?Q?OhAvI/C1Cty/5H8g6BX7Q8Z+jtEYEAZwlVU0NuDVQCogb/zujoY/r2aa1DXw?=
 =?us-ascii?Q?l5XH6Vovk3qCthhQsgU8KgT5HEUHq+LdHsMc84R3u2nnU3yepgHoR0i/zzTk?=
 =?us-ascii?Q?gGxG+kOIr6/cIPVGuHe8JryrNnMytqQ0IqL1XZx8+ZRCyauj+KaB2Vl+BOEM?=
 =?us-ascii?Q?1hdt3NW2bRfINd9LLSmRBPYYPd1F+X/8sxWUlNkSxnWWr3SvTq9CKxmGZWmB?=
 =?us-ascii?Q?UF6cAVMBkwUNGcnUaP/jk7GDxIe5bv0nI5b5cpjGcrEy3jKMscMBUbNuS3Fw?=
 =?us-ascii?Q?FpxbJFbOxHkJ6VyVtZTYK7tYlV0K2XFI5uUlfHx6kE4HuTVFTjBHdIaBEsaF?=
 =?us-ascii?Q?XjEowtvaj/2APaBuccx+mQrh07YqB0S03cNwhouZ+H0aoT7L/QyoStFh0BzZ?=
 =?us-ascii?Q?hWLLhaJ461BY9YlgljaDFduBXeiE9TEwmnmzXfDVauVoIWIe6M2WBugHcDvW?=
 =?us-ascii?Q?cKGTmsCpmvJM1NzEoogIE4Fd4BwOSofR06RLi014xT/YRR2nrOuaeiFzAX7k?=
 =?us-ascii?Q?Ps0P9gFH41khtj01BKmLgPUecRS+pdVgeRc8wrxi1Q6d18NL4DAEbzZ1RExR?=
 =?us-ascii?Q?xzUxN+/ShJWxkjh6i0mXFoCLm9PkB5zKDI6V31AEW8DruNJQTKvu6bZmjxgn?=
 =?us-ascii?Q?nW522rzgfO+w1lRrOCdDI8nyFNJzoTBXu907N00G1LhPHF0IFz/VLEmDcZZ9?=
 =?us-ascii?Q?57WXgL7PkGS4++KIzy5QfvhRb0HsDVymiEpFBqT/gmCcUXKfYnLFfnMaNSQ2?=
 =?us-ascii?Q?Lto0qvAD9h3VKX+1H73TPqnhJy+4eae+TCefevdFvRaXzDVJg/tQ7hCKrEhj?=
 =?us-ascii?Q?iGeyqovvd+nukV7QNVlo1H37wUuh7J58QbAebbCLtfkhsunefmsD3oM01zxz?=
 =?us-ascii?Q?eTlXposJXbqN3X3017tL6uG7MZXglusEanoDDnQlEWvxNP/roClS+xlc8f6l?=
 =?us-ascii?Q?Xm/LhQ6R0hryvTE4KdC/CHg72SZoz39AndWmE74nAMVl00s0aC/evQo98T9U?=
 =?us-ascii?Q?QjlC64KJBh7NyvnCPS4y0G/eMPgJS/Gy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4R6+rKWFJ+9n3uDcvJqhVjcG8ZwqaG9PeJzCVcdZUSlPE2+0JtLhGMcOdJHV?=
 =?us-ascii?Q?0eVRErbGuBH9IstbwOXWuEfiONoLzitVGbjMdFPrRLG5DVZG/zoeamI24kbe?=
 =?us-ascii?Q?RbjhnhagZozuxnkGmHouiZSxmarns80FszyvYLMnzjNFvuI8pkUzAecjuUfv?=
 =?us-ascii?Q?hkyo7XLOjiI81UkhwKOWNf1bWlY9WEvion6m71ArW/lWN1in04XPOu5LX0tr?=
 =?us-ascii?Q?hy+l3jn2aUVqeez6pOnTxAHYdPA0KOky9EKBIr2FmrJZXo3CJTJ9PhU0WtqL?=
 =?us-ascii?Q?AlSqo7XcP5n1XvG/4DJQo90K+XEZmfu+L40is2nYmvU8lNKE5tQRicAnwgCi?=
 =?us-ascii?Q?IoJjyp5dkl5MheuQh3ldzgzht2HTJm5fu56PKH+fiefWFKuYsFGT1ulSjgb6?=
 =?us-ascii?Q?qhiuyLfMZukAEg/YMeBvy4aBej/l2rexPxYXSC97aWLH2G1TK3jYi7QYdjWS?=
 =?us-ascii?Q?J0j2WIms4xmENsW7a0QDAoVQaeGoS4rRXUFybtlFGz51APNbW0SqFt3W1/3c?=
 =?us-ascii?Q?zj0johaePKXnz6lxWjMxKfvY6iawlbfRBpWm2rTTBfV0vRFLCGQ/Wwo/nuFG?=
 =?us-ascii?Q?aobUUJCDv/I+N0/PKz6s75f5O0+58MdRF9+ywm7wb0z14ChwEM2+b2C280Fy?=
 =?us-ascii?Q?uxBFr4Wh6Bqg4GkOenuw3mfJhdRY5qPYYckYq1mOzvAB9baYxGHMK9TsjrOi?=
 =?us-ascii?Q?2lD0iYPZe+RcdL6ARmMkZ51v5VAi/ddBKBfnAKidLeJum/l1SjuLR5Lq2kt+?=
 =?us-ascii?Q?usf68HvJLfRFAvwdlYuO47w+N7dxQEk3iGInMfJUvzTrueUz2SqrIqW3gm3X?=
 =?us-ascii?Q?jsYOcxZvZyZt54OAaGQFL5TVGdzux+eEbnt3Pmmbjucg+D0s+QxWWR7khMPt?=
 =?us-ascii?Q?2UjcM5P5kAR/PifFUtgNC8ftDH3jWiJWkpEbGedzmDFoTWCSKNfbstg3E/qR?=
 =?us-ascii?Q?EU7xZ9UTNDKnehkyP3Ux7DVYc2F3TysxuZ71P0LTTT9yRL61lG8guOXk9w6E?=
 =?us-ascii?Q?H1lq+qSN2bfwDHR7K8vI/SY90TY2wLKPAJV8V0oQZLz1Y8YyheBSz0ixWI6j?=
 =?us-ascii?Q?qpMa1TpoaGmEs52Vdkt+wVbDIBiHOYeP+LFcuoHHgn3lZQG2quQM/JzU5sKr?=
 =?us-ascii?Q?wJeT4J16GtVsUljY5tbNQmzLFhReX5aprtNXwpOnWEGJuRcE7gMhhLzhkK8o?=
 =?us-ascii?Q?Sa19cpGso7bLwPmjaR9lJHlYmm8CqB9FwvxoZGm2JEyaCUiZY/wbYI4/6HvD?=
 =?us-ascii?Q?vcZtKp+zTEDi6bpp4aZb7yuJhHDBDU0ydVnknAgpeQ0aINthh+oPilo6+xTD?=
 =?us-ascii?Q?aHGgkv6b2FthdhSPzomOuqJ7NKVKLilcCuC4oWhZRtWTqfcP805xWbFXUmXL?=
 =?us-ascii?Q?8rherb2oGgaKpgiEoN9PAtDPsVxo13rOPiKaNbkMnbX+g75Mxpd+QgUJWbFU?=
 =?us-ascii?Q?wUSG29Uqb1x8GpgqcoDmralVvwxegdNPNTummKwoUNIKCSMKuGwu3RPC+N0U?=
 =?us-ascii?Q?P5DqNI+6bl+3LGFvxmOOl5HkMTcGjgEjP5iTnch3LMQvZlNoeTTwZw9nW9wL?=
 =?us-ascii?Q?9EBw+CbxcvPlRR9jhhXQPDgvAYg3JahFjXyYxm9s?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d45ec630-dfdf-4664-2cb4-08dd47b45135
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 20:16:33.9461
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tBInp2xAdROQ+fU/4lAYPAL6970BczmvSzRS1yWI/F7gIsrSIPF4vydyEiAiSd8rEGMp/v0+ZIUJSZ6FruUitg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8028
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_121641_613996_3F1ECEA7 
X-CRM114-Status: GOOD (  30.85  )
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

On Fri, Feb 07, 2025 at 06:38:06PM +0200, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>
> Add a RTC driver for NXP S32G2/S32G3 SoCs.
>
> RTC tracks clock time during system suspend. It can be a wakeup source
> for the S32G2/S32G3 SoC based boards.
>
> The RTC module from S32G2/S32G3 is not battery-powered and it is not kept
> alive during system reset.
>
> Co-developed-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
> Signed-off-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
> Co-developed-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
> Signed-off-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> ---
>  drivers/rtc/Kconfig    |  11 ++
>  drivers/rtc/Makefile   |   1 +
>  drivers/rtc/rtc-s32g.c | 383 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 395 insertions(+)
>  create mode 100644 drivers/rtc/rtc-s32g.c
>
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index 0bbbf778ecfa..510dc2db745d 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -2103,4 +2103,15 @@ config RTC_DRV_AMLOGIC_A4
>  	  This driver can also be built as a module. If so, the module
>  	  will be called "rtc-amlogic-a4".
>
> +config RTC_DRV_S32G
> +	tristate "RTC driver for S32G2/S32G3 SoCs"
> +	depends on ARCH_S32 || COMPILE_TEST
> +	depends on COMMON_CLK
> +	help
> +	  Say yes to enable RTC driver for platforms based on the
> +	  S32G2/S32G3 SoC family.
> +
> +	  This RTC module can be used as a wakeup source.
> +	  Please note that it is not battery-powered.
> +
>  endif # RTC_CLASS
> diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
> index 489b4ab07068..e4b616ecd5ce 100644
> --- a/drivers/rtc/Makefile
> +++ b/drivers/rtc/Makefile
> @@ -161,6 +161,7 @@ obj-$(CONFIG_RTC_DRV_RX8111)	+= rtc-rx8111.o
>  obj-$(CONFIG_RTC_DRV_RX8581)	+= rtc-rx8581.o
>  obj-$(CONFIG_RTC_DRV_RZN1)	+= rtc-rzn1.o
>  obj-$(CONFIG_RTC_DRV_RENESAS_RTCA3)	+= rtc-renesas-rtca3.o
> +obj-$(CONFIG_RTC_DRV_S32G)	+= rtc-s32g.o
>  obj-$(CONFIG_RTC_DRV_S35390A)	+= rtc-s35390a.o
>  obj-$(CONFIG_RTC_DRV_S3C)	+= rtc-s3c.o
>  obj-$(CONFIG_RTC_DRV_S5M)	+= rtc-s5m.o
> diff --git a/drivers/rtc/rtc-s32g.c b/drivers/rtc/rtc-s32g.c
> new file mode 100644
> index 000000000000..3244b23c533e
> --- /dev/null
> +++ b/drivers/rtc/rtc-s32g.c

...

> +
> +static int s32g_rtc_suspend(struct device *dev)
> +{
> +	struct rtc_priv *priv = dev_get_drvdata(dev);
> +	u32 apival = readl(priv->rtc_base + APIVAL_OFFSET);
> +
> +	/* RTC registers are being reset in suspend.
> +	 * Thus store standby time.
> +	 */
> +	if (check_add_overflow(priv->sleep_sec, div64_u64(apival, priv->rtc_hz),
> +			       &priv->sleep_sec)) {
> +		dev_warn(dev, "Overflow on sleep cycles occurred. Resetting to 0.\n");
> +		priv->sleep_sec = 0;
> +	}

Strange. If RTC register are reset in suspend. How do it wake up system?

Frank

> +
> +	return 0;
> +}
> +
> +static int s32g_rtc_resume(struct device *dev)
> +{
> +	struct rtc_priv *priv = dev_get_drvdata(dev);
> +
> +	return rtc_clk_src_setup(priv);
> +}
> +
> +static const struct of_device_id rtc_dt_ids[] = {
> +	{ .compatible = "nxp,s32g2-rtc", .data = &rtc_s32g2_data},
> +	{ /* sentinel */ },
> +};
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(s32g_rtc_pm_ops,
> +			 s32g_rtc_suspend, s32g_rtc_resume);
> +
> +static struct platform_driver s32g_rtc_driver = {
> +	.driver		= {
> +		.name			= "s32g-rtc",
> +		.pm				= pm_sleep_ptr(&s32g_rtc_pm_ops),
> +		.of_match_table = rtc_dt_ids,
> +	},
> +	.probe		= s32g_rtc_probe,
> +};
> +module_platform_driver(s32g_rtc_driver);
> +
> +MODULE_AUTHOR("NXP");
> +MODULE_DESCRIPTION("NXP RTC driver for S32G2/S32G3");
> +MODULE_LICENSE("GPL");
> --
> 2.45.2
>

