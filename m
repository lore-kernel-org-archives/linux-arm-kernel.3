Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B853C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 16:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1PQdGB1FYqvz5N0gqZKMZqdoQqXWfL3zsIxPqFbwLXE=; b=HacweeKAz013xE56Jq55HRMYXK
	L0jAHFBsqJW+98yxT+Bh4TVaWr918b1fhjbd76biGB76EOFtSrO95YOneL5ZHleKOMdYx8Ko5OnO+
	Aitz7Tq+WOVMOptTHXWOPRxwB7FVyNjx+DLW7pRmH0yu58ntFVsM7ENkUPP30NQ+hylNXh5C/m03P
	TKuXHzpmKCtFLv/psY0wz/Wpi/KMs6aanRf52Lb3HEFz5FIZUZ4soIMJf+iKY2LX1ZKok88CJ0ixX
	49m1PtbedcV3241UV+g+/sTB/u/Wt8r9U/jvkxabag1Y6t61JnAKxQWUUDMEobEsV4mnHQlyh2EGO
	luFujooA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9R9p-00000006t5A-1FV4;
	Mon, 28 Apr 2025 16:16:37 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9R7q-00000006sc4-1twa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 16:14:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dmZVWe+EOdg/VHFUZirZvCDlEI8jmbSyYZC5DqA/OKeYSbKXULgV0qIGCq0DRULnjnBX5WNhAPzMFrjP3nO318aZCnmFmXaDjJT4P7c8rtLyS/+V7r1zG1feuvSEX0UvxnEFLKaeaSRKTJ03IDQbtZIjj4Pn9VkBTLRj1S+DezEzVicFf+Oj+ipvwonXj5Eh2XuP2Cpl2J2oVRCosHl5F62SA/2juKnBLc7vrxWPQpsqKH4SH83KhTVRxyqotgRXDYe3aWbAW5rdPuj98mw/yHnzVhN0bzmkdW9yG0V5UXpleB0qK3mXQ0enfp7Y98CKJav87z2q5thLXDvCWJPRQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1PQdGB1FYqvz5N0gqZKMZqdoQqXWfL3zsIxPqFbwLXE=;
 b=TBYckw9PPNXhjQ/ib+VQNinc9AVi7pCrEUIPRbZgG5mj8YGXs8WojX9nedjmNcU2PxNwhsifSdrb6inH513WYZCZiqMi/BYqwKgehVfpCmy2D6Ngc4WOioXEb781Z2s87486ERAPvRkx6wJyRo1SBFjQ35GbjV83lVa/JRI0mmGItdR3D5aa3mb8kt8YQyxaj1SKgKW7TsFhfFcqmXbQE1gQ7pF1vOQcX0VZaAGqyyTkNFvJvvrYN5WFmFfHmLLd4nvjPbzc7rlooFhCWa7T643ynkqUva6uOdvbaoKRCinSNTQHszUqCe42CC43XoQCHWVNXu/8EREnAVt8E0GFFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1PQdGB1FYqvz5N0gqZKMZqdoQqXWfL3zsIxPqFbwLXE=;
 b=Q40QU6HQcX2+yYw5m8VTOQauEd7MHpOIv5Uz+lyqNS/5oqK5ZQESR1yXkCApvzUJqUyaYApZIhDBntCU2He6Yh18kFjBd8ZHLpFGL+pDtR8YVeAxbJZo1XiZM0PkGKHJG0PsaY4cAizL+1/5IjBjuScM5PYaNWt3kLIxIPLCE2PUcKrt4w8u71QskkbzI1JLHNNRD2kWsIIujdwS23E/o3/gBKM/kiH+1dRgJm0aEohfrIqO+tzgWpDqpred2ROgkKxgSzvu0I3BpUxxEk6V4m20W182mWK9nm2LNJKxe3qJGYd6EkiMpztQ+JDL0yaKnTCa/waCUc7zOhfBzvySYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by DUZPR04MB9726.eurprd04.prod.outlook.com (2603:10a6:10:4e3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Mon, 28 Apr
 2025 16:14:26 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%4]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 16:14:25 +0000
Date: Mon, 28 Apr 2025 19:14:20 +0300
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Wei Fang <wei.fang@nxp.com>
Cc: claudiu.manoil@nxp.com, xiaoning.wang@nxp.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, christophe.leroy@csgroup.eu,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 net-next 09/14] net: enetc: change enetc_set_rss() to
 void type
Message-ID: <20250428161420.alfrz6gew2aygh7m@skbuf>
References: <20250428105657.3283130-1-wei.fang@nxp.com>
 <20250428105657.3283130-10-wei.fang@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428105657.3283130-10-wei.fang@nxp.com>
X-ClientProxiedBy: VI1PR09CA0173.eurprd09.prod.outlook.com
 (2603:10a6:800:120::27) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|DUZPR04MB9726:EE_
X-MS-Office365-Filtering-Correlation-Id: c0be99d6-f91d-4fa3-98e7-08dd866fbe03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3si1tWwVzjhm4fxsqnsf1nRfL776ZPYXglzvhVJtD1O1MIL5NagCnfGNlRBr?=
 =?us-ascii?Q?KeuZeOp6iuNDSThmIvDORx3IRm+3Qo+ESLGpsy3muDh9o/rtjpSeCKOTegF7?=
 =?us-ascii?Q?bAlBMChpCnh+s21nbrGt6pgLl2QmD7AQC3Sn7ODEapeT5ykHu/9ga/jVlaMr?=
 =?us-ascii?Q?FWnCOVeeXRCKUJXY7huvNs2vewIr36b6eX3FPm/3kQFsrI6veBvKJsoQ/ATQ?=
 =?us-ascii?Q?DjduOsG/MkrQeFf13rgOY5Qr5pu5q9zAI6GDnRjgTILalI4rTuDJd2glu8Zq?=
 =?us-ascii?Q?VPOEMH+kJzCKEi2x5Q2IiFDfeaMU7tkOWqQ43Wyqyc7iD0ASwM0Ve8kj6Foz?=
 =?us-ascii?Q?DEakF77I3JsF01zBYUOQv/hWQ8uLR6vhFwsef1NUkF3ZS7gSIKN3v5BAyc7j?=
 =?us-ascii?Q?ec64aN2OLFOlRz8QcSQHOQini+V0NEJB/XHDoWsweRMuO9WNqFB33hMCSwV0?=
 =?us-ascii?Q?ot4Woiyf3p6VlAlSpkwl7Lgp13STRYgLS2LUI40cMFzPfH6Z+bxh58wf2FFt?=
 =?us-ascii?Q?G0FnZ41aU+QX21WbzcIFL4HmMj0d0bNdSN4Xx+1jNjfO4WiBCY2yS5PP1tED?=
 =?us-ascii?Q?9RTgCirTbYZpnX9X4W7YnFPQDdP7jbJ26qZgZjFjpxSHoMXPURmK9IbWjHsv?=
 =?us-ascii?Q?sXB9F/+cTBkAUNfRK43yxCzJtk6JGp85hDyYBrbB/t9ewjVsEdO1WE6RV3lm?=
 =?us-ascii?Q?nrS4uImlqxc+kquavm1sgwFQNflq6DApeV4QF9gojzc+VtrGBHB285qOF93U?=
 =?us-ascii?Q?xVVojY6aeWgx9lILreC/lntYOAOUdvJ/gheE/sI9f1NxmG30s3MOCoBGzz07?=
 =?us-ascii?Q?RIVgwNA3OR5Y2gl6oZm+nC9GzRnMlzr3qpfU8pDva7BAh7EsZNQQ3MIp16Jg?=
 =?us-ascii?Q?8KAUXkkv4Q21SnhCM5QUuZf9ayw7YXc1FT83RGJq0mnyZjaCpnK/KxDVafuI?=
 =?us-ascii?Q?OP6bqkDDDBBk7AA/7LHwZZv2+EUPedge1yHsHcI1KfglcMCdr/QpY6X3cBLF?=
 =?us-ascii?Q?RjelsirRIASU01Zs/Yi80Bw+KKz2Msm2revag5IWaWNzJp+NTdis9DM/E7Ji?=
 =?us-ascii?Q?gYbee5NAjFaerZC5Inlm0X2xnUjImE8ILSEW4/dppKlZzQPu8AAEXBfX7yNM?=
 =?us-ascii?Q?4JL+hmhIuukanKbv1rUUmOlDM+GMj9KTMGkzVKPAGNwiIbAToBgU8PJXYVfz?=
 =?us-ascii?Q?oluA4vmVOvf/m7cJIrc6LWYmLpSYh6k9iZ0947LDidWe/L/ISPr4THT2JOxt?=
 =?us-ascii?Q?Bp1J9alMVwUJ86p/s1eCf0vlosuKikjNTwxKTgLe3I6VHYdQbTwn/ir4yVfs?=
 =?us-ascii?Q?6pJNW7nzY9bjuH79Sy7FMULkEJLB8oPfX+BLfKga3ICeD85m1QDYNQJgcKcF?=
 =?us-ascii?Q?Fm2Isg3fFyAZXH/4ffsRbuvm4W+lknkcCZRsoJcGOMStKVkmKJLK7UUzmJen?=
 =?us-ascii?Q?evo9yYN0hTc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7779.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+yxRNRE1QMt4v09EV4U46AxanFmybwkaS6QVwKLrtG+jVe2CP5vov740G7OE?=
 =?us-ascii?Q?jViWnY7IFxjpLEIbBuxXWGbCYzPXj0/GzLwi4C3B+YgbhaPs9Bb9aAUMtVtX?=
 =?us-ascii?Q?y9+k/ozap7r5CH7j/9U9T9ho0lD0cHc+sUjJjrhG+cFgFQF9hHMd8dDAZfFG?=
 =?us-ascii?Q?Y+a47uUET2elF4mmz7bbGVkslCC9QR6dhamdf0gfrNoLDd+Qzwd1A77sV5gw?=
 =?us-ascii?Q?ct24pW5yqM+bbe5CPKrySF4TwMNB92hWdY6N3BY03F5sbkpmqIF41cpQ4THb?=
 =?us-ascii?Q?j+biwd4Ye4UU2yeWMI6KGuDD2b2UAhaoevEO1DzZ/Pv6+BLNj88WmO1E+c/j?=
 =?us-ascii?Q?BKuyosvsX+gjGmpBPxIQ7JDCD2KFMgkrj5p2xKm8M6+qBAhNZWSlnh/mbBfl?=
 =?us-ascii?Q?qSzfDo9sdiOCUofQ/M0fdyt6bJpmXEWK7nbdwQq7gtYTMuuelAoZsnPVhwF2?=
 =?us-ascii?Q?rk6ijTmygEzU6CwhYiobiVJYwiQFHUFwffP20Vv3Tef5vLSMEjYM/F0W1sy0?=
 =?us-ascii?Q?X1jeKqZRuoYCTgBBa1KItrYwCHXRDcNM8wUfKcqc+fiFI2SU7s1YHNNWDpVm?=
 =?us-ascii?Q?+CE4LWrdB/HMMjHhs8XytwByboUkDtQ/FHqyB8yrnC/0rmZks6Ml9nfJsePg?=
 =?us-ascii?Q?ymhbO0Z4NWRkqKHOk10Fn0cBBCMsdnvf22T53Qq+KCFonTDZaqLhZM3MODQF?=
 =?us-ascii?Q?YA3wgxErmFznDIbS884x7iBno3/2UDI2DbMjcfV1o0jNxaWIBODXZxp+B3GW?=
 =?us-ascii?Q?5cARRtFNhvJ6Eu/Ks63slOjjvg7nYYDwKM9tsTTcaHCKLKhU1y4w3G7AGl+d?=
 =?us-ascii?Q?sb8c5dG9z5fgvxua+9a9O+omroydtrDmNOmnuj2ukEv40kvfuH6rEGFpDmOe?=
 =?us-ascii?Q?Fm97FOvvfQd5I8Hc4967tv6bm2E9qs+Op8DNDCUPj8z/cq9MA6zOK4IJgEIT?=
 =?us-ascii?Q?Cb9wtBjWB3ZaVnWqg8OdY3NYO7weqAU5/HRms8WQGgqy7E+8jWbYChe5TPag?=
 =?us-ascii?Q?/sCSdgV6V+WlpRbFOcqDyOzYA6NL6oELYdls3gsRzd48YJBdwgxH9wl56Fe0?=
 =?us-ascii?Q?tB7nzJzOsJHPr+d0VYbTdsgJTmGy0aBzcVbv1+rq+EL2dkARUebUtXqPE5ka?=
 =?us-ascii?Q?CG3XCrv8IKKCgJ4/gkNj5awfPHTe0z29zp7q0GsgZvumNr2j1D4g7nYZzRNX?=
 =?us-ascii?Q?89wctVE2bJOkSJRQcxOWS9TQagV8wfOC6z6Vw0vzc+sI58t+q5QtZZRc7Lu7?=
 =?us-ascii?Q?ez/N7tpFNZmY7eSVy5u+QNSNIt7psaypGfh7P9pWbUehKOtYbdQ5oqq2FSb2?=
 =?us-ascii?Q?5tTObT5NN56bpWeA5L2DXNm3tVpI68vPPWcQrW4KQSjxZdy8fjUXahRaYX1o?=
 =?us-ascii?Q?IQ73fJ2zpV1UEb5mN0gcdMxBU2/bEX52iZYPxy7gchlAGJ2cnaUQHQXW6Dlm?=
 =?us-ascii?Q?RLOjCxmu9t5HB30t8yOrjbGTFq0dBzt0rJlf7+ipGTfWoZ2D5ofSGK3QseBx?=
 =?us-ascii?Q?7bIql2KZW25NREMu9dxz4AVL0tbJWAFujviVdfS1s39LQO65e7zL/BHZ/AIg?=
 =?us-ascii?Q?IO9hRLFirDyZF+e1+JHb+m9EltOrS8Opc0AAO0omHNsu8BHlB54rkWQd9VuC?=
 =?us-ascii?Q?Fg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0be99d6-f91d-4fa3-98e7-08dd866fbe03
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7779.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 16:14:25.7052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6u5iO8tJBPlw1xBXpsgiKy1w7KoZDGRR8qR/3Wb+7mbof/XCKudfkqiQDlACXhP3nbCx3SXY6S0cadZ2yyVTpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9726
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_091434_516476_35356F98 
X-CRM114-Status: UNSURE (   9.49  )
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

On Mon, Apr 28, 2025 at 06:56:52PM +0800, Wei Fang wrote:
> Actually enetc_set_rss() does not need a return value, so change its
> type to void.
> 
> Signed-off-by: Wei Fang <wei.fang@nxp.com>
> Acked-by: Vladimir Oltean <vladimir.oltean@nxp.com>

The Acked-by: was supposed to be on patch "net: enetc: enable RSS
feature by default".
https://patchwork.kernel.org/project/imx/patch/20250311053830.1516523-10-wei.fang@nxp.com/

