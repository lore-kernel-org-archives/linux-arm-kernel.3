Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0051CD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 16:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KWtO+Cm0lNTInBgJnuOAA7rsS2PQlzVHcG5eHNk6Df4=; b=Rf0uBSj9YioTXHKkbO4nL3RS6+
	kBMQ2HFX3lKARsD1PPDcvZXb540JvpGKSVgqxkeUCb4NM2dF/gOO43cUH3QXF9vMKIW9hviDSAy5/
	IfS8sjaVkR/L0r1a/hekZiet77SAVXQo/DCdPxwVeQEWRF9cXT+2SzcSYYc78r8VX+rTghDY875Ih
	e2kmcoMNkuDY73VNNnXu9ofa6lVN2vF/xvACd84mAQ+/A2nL26SbGZqaO6/eg4zbahA1Jfu1v41pW
	NNX/oXqz32qIGRMZ243cK1emn3kiryiCjkrJ1ZwWAlnIKRw2zm3iS3kLMG0UuW/cMPeWx6nHlidzs
	WEFSF4YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWcnH-000000043nK-1fs3;
	Mon, 08 Jun 2026 16:25:43 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWcnE-000000043mV-3BNd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 16:25:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I1sMeLAonbI6AkqeNFOvg/BbSgMooXtZDUJi8trrnrP4LV/+OWWxRY6CiDwYbtxH3z/bwoLoymrh+RZubb+jM8qv6ZDBsGki2QJhFSLSCe6Dp/hlpXN4JfVQyU7ybKtXN7SzzRcUDe27wfDSUnGf7lJrsT11nReWt20woChFsKCvuqa1ufbambTBCoJqmlHcNMPN2m6xaxJC6DunSN36xiaRifwIPSIMfIV4ZrTXP8r1joqVueZ01Fr+BAzMU0kVOYQBnWNJppViDmO3UtewbxXnD5mQ7tDcEQ1JUwHYgnx8ZPDl8nPsD6yZm3wEYR6XV74txSPFKZuas39uBWfbAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KWtO+Cm0lNTInBgJnuOAA7rsS2PQlzVHcG5eHNk6Df4=;
 b=Hf0Ee9q5Me9R+jPldAQMFdj8lYcUXIkSKXvN0dYX4tzcQAlR18CCZlenNiQL0/kI4J5x7eyieBQtCI9WYaSQqi/6fnKnMc6/HRFfdjroz9wjDScfcG9vTDN++9z75zBMVlmPZVymaetafBoOhMdFWwcbGg+gPWNE0/Xe7p7yg/gN/pzMRSsL9ZdX1KrhipFXnq27ZI3RmeeZyrV9MC7dOmKM3xunUfg//4uUAFL2rsEsLhujP58Cj5eSoOb8XxuJvIcQUEOTShKemwl7Ue+n0bvAfqiLyW0ndFucn9vJLrXlbnJXO48j2SbAq/k7HGj3AenTsaJ9UcTbmEYDnyyKfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KWtO+Cm0lNTInBgJnuOAA7rsS2PQlzVHcG5eHNk6Df4=;
 b=go+4wNQQeKd2ALKLcaW2MtEYdpAuIi8mjUYaCkvCtxBa/DC1qRD5xBNI18I+2Cf6RuFQdMzocy2tYDecSAa+fIi/9y1eRZYy2qHno8HUS136RujPeOh/MjvsFFKACVQxKT5Evuu5ZI5heR4NnwEC/BVRdBFdVKA/jupR8YQor+Q7cW21AT+9uf7kzdJ0KSSNreiv/BUpn0kx6uGSnTh6JUbXk9gkVVJUIp56xRfyKqtJb5uUU0mWGqP5mZzbZ0PzUJYfABuUiEwquGSLPAnvtsoQfc75JUd/kQoaMLEkTXRj6ryg7G1CQundj1DfQG937RiSWxMcK01Tc7M1cqvhKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DB9PR04MB11560.eurprd04.prod.outlook.com (2603:10a6:10:608::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 16:25:36 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 16:25:36 +0000
Date: Mon, 8 Jun 2026 11:25:26 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	"moderated list:ARM/STI ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be|_ptr)?b" <linux-hardening@vger.kernel.org>
Subject: Re: [PATCHv2] dmaengine: st_fdma: simplify allocation
Message-ID: <aibs9gb5M4-gbCFY@SMW015318>
References: <20260608051829.7390-1-rosenp@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608051829.7390-1-rosenp@gmail.com>
X-ClientProxiedBy: PH7P221CA0064.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:328::18) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DB9PR04MB11560:EE_
X-MS-Office365-Filtering-Correlation-Id: 9959639b-9d4d-4b71-3d07-08dec57a9201
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|1800799024|7416014|376014|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: UKn+sgmXV7whsM+UyGDFah/m/Qou4heDJ7eZy7lKKoXlen8m6NXJ332Tr/edVIY8tWAfovkdNqz0cAG/XwuAZ8OS++9RFJmkEFM0sFXHuLJv0kiJLhpFSXDQgwnvjNUq8ioIw7qajpVL2UMiILkaR6TBXlQolg6HVgu/137hDG73GK9g7j1/tprYQ3uxAsWaGBHStlqkIilw6dtSLcdg9ca+YLOo36xXIvU5lvQwWGJSX9EeZXDDEFzGbDN9bCmVC0/+RHsB3D5BcpNW9zP1jMoARes4Xx/y7QwcSzkRiqZESyp1RMw1hriQqbSb5VkXe+9IIy04B4Aq98VQDBV/zkj0QmRiCzTcq7+mWTcflnAQ14YpZhg85BE4lHDIUDklO0yJ6HxgA9f60hBtun62nFxeU0xLO/K2MY/BLl1qc2I/89tMfQ2QNHMc0AIyp0T4s9A4n73dNSxSeqe8cRk9gTuGCfb5GtG7DmuHOSK1fRvqC/i+y+xbRlUWesAmYH6caP81v6f31Pn6DE+RSCw/pz5GIJaVeaQ3J72axXXZV/z10+1yihOtzCC54RWQG8sOp0Zisi8SlzqvqVr7C2gF+u3bj8dUIbUZv989G1sbsbC+yYvn1I+aYGVIXHQKnEWLqfCjbAVrYIbJwlY9kInEsSfVxdq9i+5tfgbwlx98EgPSfGfPA54USTgtOysw/lj3
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(7416014)(376014)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HXDbEy6oNSopdTDMxXVs4a4ACm5Zb9uAj1nd7zejFrZMM46SnUyGSPARuYwK?=
 =?us-ascii?Q?RkhVOfMrLKlyUewqE3eY93dZiiC1eismQZ5CJo28a4Obm7jU97m8mEvuN4dr?=
 =?us-ascii?Q?WbJoHd3FFZp+t6Hki69cn9h2oRx/n/zBxyh/I+S4cRXc7d2Fiw0q7XRZ0T1E?=
 =?us-ascii?Q?qyqysrfdHfoLh02UVgTDvERHRVA9+3DtSRcZNnf9i3W+LJv/W/JO+N9Xyqk0?=
 =?us-ascii?Q?rLnIFbYoSEGA0xUt8UhclUqNns4Grbw/OfqX7p6Mm3/IWEBxKo6TXadg+pdk?=
 =?us-ascii?Q?nF9t3TaSfWWvRY6jv1LA1a3MOasNVM8mvQ3nHatBoCrICCc78XzHUOGmNSuE?=
 =?us-ascii?Q?bLwYCVB8uAA8t3kW5+OntsewQmMxZXv7nx6/jDVM4hEE6Y9od8CKOxg4qMuj?=
 =?us-ascii?Q?WD3uj/ci98wFcv+Ga79jl3I8yf/lBo4b9527+sGQDuQD1Z2QTi0HzN7sgsi1?=
 =?us-ascii?Q?35sXnCRhNjtwmMfeLwmcNNzhqSFtScaafxDVXWVzmitZjumLTOPBZY6U2O/K?=
 =?us-ascii?Q?GNXwEeswlN4XLpnPW47fQm+gy8vUA0WJLJl9ApWv45I/YTWDjxkseIP87SR8?=
 =?us-ascii?Q?A6VgPNUQrbkWOhzcbjmuZmCx7jCmFdwyyzr4yUqrzPGHVCgjBaWACnDLSEI6?=
 =?us-ascii?Q?t437grx6qG/IZFFMG3vsI8yqyApJ5yBAIYKjr4x13OD7CtgK66ki2Em1gZeF?=
 =?us-ascii?Q?AbFLJZ2lV1ZOG3yRjG4uY23v18UWKlhDELi2RJoBcxAPWSn4V5hbBWcWNUX9?=
 =?us-ascii?Q?16/m6m/44CFhZ03/lL9IWmY/v2SMxdC2BKi2/ZMTrhFNVMHFLmUKEYzn64vj?=
 =?us-ascii?Q?bqo2IVqOTJjp3aMC6O4RNLBGA3gbUVi6g/+zBkUdLWkZz7YB6O9a7msaxiLm?=
 =?us-ascii?Q?t+kft5YIqMdSW1IyPywt17dPtZLlB5fZ25r3x/ytP7R2NYMNwEBL2wqm/aM0?=
 =?us-ascii?Q?jiuYxm7A0uyk4JR3gAeOI18CrrhJCki3fhHiDs5ulLXV2llNB9ddIhwGKBSm?=
 =?us-ascii?Q?y2e9dVYqnB3jFNIdGqWFybBPaIUKFk4/bCn2sJFtul0E2hWZCEN7QIngwpBg?=
 =?us-ascii?Q?NKlEPFxoHv4E7HCOBQMqDRZzcKgqFP7Xz9DAYLhWfwbbBMftwFotY0MH7Tw+?=
 =?us-ascii?Q?sn4vTZixKHG4fRMp3hcYYISP2NCw3G4CrTRkpYl2CeUM/+qZJIYks4fhk46+?=
 =?us-ascii?Q?Czk5ANArGi2h6O8Rw9q8wTO+OQRPFvmur+vu7m1QH5Nw2xzFeL3iOY10HV6w?=
 =?us-ascii?Q?UMT9FDZntiCvqSINzsDvEBh+KHE1jOV3/Bx+lmp4qwW+KmVbOCYSnPU1a+f0?=
 =?us-ascii?Q?No84e1ZH6gn/zVRkhOxeZhiOlUrQg5zn9vNJQyzGsMsoU1Tg3/WGhVFyY+Lx?=
 =?us-ascii?Q?ZoL5qFdnSUGqLIGXburcmXGZohBGnqBnZt/swHd8C40Ot+RuWYfDJKT3OgKs?=
 =?us-ascii?Q?nhfD3ODbvWxAGN6iMcu47Eg7v02zM2xO9fEVwV5r4uOmwbj/xpKdETGWGFeq?=
 =?us-ascii?Q?WstQ/lD/Yu5rKMArjjJyRl+46hnPgMLEDjYuNWUpnZu8oCTG21KKYZtWFrfm?=
 =?us-ascii?Q?gHejsarZiw3QiuwotNHIz/n13AW77ncw3a96erTD81jogJnx3vz2ud13MpYo?=
 =?us-ascii?Q?vfGIM6xyQH4obaBMK6cXPejk04zYIh+9++xAc6gRC8n6VaMAwv8Tqms0qbmT?=
 =?us-ascii?Q?6FqjPf94JoFvvsRo8t58WEa5aPcyumSvqjBCf/X0h5G8kaYzsgOfcvYpiGHG?=
 =?us-ascii?Q?7vS7+JcL/Ht18yG0/bA3niePivMnU2Q9RLwEwJCEuOYBG2eNmstU?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9959639b-9d4d-4b71-3d07-08dec57a9201
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 16:25:36.2682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b+vkisIt7eau71STZEajW5dhhDuE3Vfhw0ZpGlJzE6wQF2Ax2VszFvwqdNGsKDPmmsp6tQT3S/C1dAARedM4CROtiWDYUQ+JE63xcurD6JDwRY3IjDEJn1NRQIr8/kyZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11560
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_092540_796556_8B6F0B7D 
X-CRM114-Status: UNSURE (   7.37  )
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

On Sun, Jun 07, 2026 at 10:18:29PM -0700, Rosen Penev wrote:

Nit: dmaengine: st_fdma: simplify allocation by using flexible array

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Use a flexible array member to combine kzalloc and kcalloc to a single
> allocation.
>
> Add __counted_by for extra runtime analysis. Assign counting variable
> after allocation before any array accesses.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>

