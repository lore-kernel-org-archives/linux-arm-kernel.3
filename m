Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90388EE6B4C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 19:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SZqSUzR9Dgq1s/6HsOSp1d3uhQDcXGZwchMUQqXPBQc=; b=4G4iitbd/hdsTAENRlhGe90Yo/
	ftcWsNekp5Ja1GasvEUn3Blim39Gfdi88vWr3SGUOLbOp2muY4MPqUeLvL9UNSgC0cKKhB14ENG0v
	A8a1zTyfWjPRBNJjhp6RbGIOWpLUBawWWMRecB4WOer9q1kGPunqXKB61KMZAjhz1N4E8fA/g+EXz
	KITqnWUOmsvjVU6n06f/kvJluRiIGxrSHpZ0Yx86m2JXhR+Q2/qVO6LZuQ1wqVM1HfP97hKiB5x5q
	7DQ87wmbVf7SkLFH1mvJjsI2aPb15qIgPISt8zvHMDoVDSUjDWDs+H0JcDvXYNuJP6qB2zG6/oAFE
	UepJUg1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voRXs-0000000BkQe-2hd0;
	Fri, 06 Feb 2026 19:31:12 +0000
Received: from mail-westeuropeazon11011047.outbound.protection.outlook.com ([52.101.70.47] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voRXp-0000000BkPu-2meY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 19:31:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X+HAMSjzDt0+Vc4lY5yg4AZ08ZX9hvZb5imxHP1fI++3y1uZdiU7CNU7gwfOirf0K/bpLQwEr2Rby40vrTFhjA5Y7yaZTqxFBGWdhvAxerZqTzSBSxZGyCyVvkH/3FplaLOewNaIkeqjB9xTbDyT9sv/YRXvp2iFtuRxItKxEm+lRTnXn1O4Jw4FDS6IsTwNO7KzbbBSBlI09SbUNTA28726gRQzQZ/uEIAj5BdsEKRKWS3SUDxcAx2Nn1Y86hLdp+nk0VRX/yYraRZ9JC6OJzQtEvYcsxqTvSvXY+2lJ8Bu+ldjTimM/qxsxXZGfmF3xwKxDL10YfHNV0NeTDblYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SZqSUzR9Dgq1s/6HsOSp1d3uhQDcXGZwchMUQqXPBQc=;
 b=AHN61ofT2VvjCSn8BI7fUG8zUgzD7xQvnPOdShG2jNUFokr91pG6KGj4J4fAwxR/akmJI1N6m4FG0DoDz3IlU3pzaLcQ/O0Ozb1aJbyFRhsMtl8j2zNvJiXNkrg4jkSiltQldO3U/jr8QbWzUsz7IijyZqcLcMU56H1xMY9MRuNBWngzqPjHD6DN/qzPvnG18OBAWXCace9MOG12hdzo4yrWJKAwA4wapy+TguEVXRj2uCA/nv9vOXwr06fLF8LvGHoVZczngZt7wZITK54WjFJSQGvjGX36cWJonfIp6w6r5eleo6SaJV6qZUIJer5pw5U1fnAig31zFifkTrw+yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SZqSUzR9Dgq1s/6HsOSp1d3uhQDcXGZwchMUQqXPBQc=;
 b=Kjsy5FAP55X9ZsN3fyxerb9rye4UTnzrfMIm49QFuqS5i5VhyKObHhtHjA+7O/2H7fJJ/XjGmcZAnR+2RxyjpCnhk69rFd9z9GGKL+7XF7UO9BlYo2wOeY33KCxHLNsQOq71z+FcKpRVFNXONJELrudkw/3wE3a53MMhR0ZrgMubW4EXKLw21wkIpOjDAUqhVXYryLqRB39EmUSfOwAzXcTUGjJwTX/zgtNdt4yPBCyRp3iKwyTJh5FZIeU9EOtrHGx7tps3kTEhOLmLKhtjXbMdd3kDHqfmlauOhrD8kzH5ZPXh/NGmc8ZMQpYnln3IWEKZkmcVz6PytrXCr/9NKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DB8PR04MB6971.eurprd04.prod.outlook.com (2603:10a6:10:113::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 19:31:02 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Fri, 6 Feb 2026
 19:31:02 +0000
Date: Fri, 6 Feb 2026 14:30:53 -0500
From: Frank Li <Frank.li@nxp.com>
To: Pat Somaru <patso@likewhatevs.io>
Cc: Tejun Heo <tj@kernel.org>, Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>, Vinod Koul <vkoul@kernel.org>,
	Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dma: apple-admac: Convert from tasklet to BH workqueue
Message-ID: <aYZBbfktpZyu5u1k@lizhi-Precision-Tower-5810>
References: <20260206090137.1127897-1-patso@likewhatevs.io>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260206090137.1127897-1-patso@likewhatevs.io>
X-ClientProxiedBy: SJ0PR05CA0144.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::29) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DB8PR04MB6971:EE_
X-MS-Office365-Filtering-Correlation-Id: 47b423f3-034f-4812-1288-08de65b6432a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|19092799006|7416014|366016|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?L4l+Tijn+v5gX8j0pB7TQ+pwbI+olFqd9WMLQzatixsdeo0LxW5Lfa2ZQ8o3?=
 =?us-ascii?Q?gB5r6O0Ovor6AzrlxILnYDDObmYUVtmESY8ZpoWVbP/UYEMi7dILOU3RZsoO?=
 =?us-ascii?Q?9Wc1hVsAc9wEohDLPIEuMyAr6FB5Vi5S1KXsnoc8xbA3+9MsLCQIsxHUbKkT?=
 =?us-ascii?Q?jWpfePG3+Q/KxRD4uf7vocP6pZzYMS2mb0xqCKErTRE2Al69dkJMJlLBzEmb?=
 =?us-ascii?Q?kuASo6DXMPhl3hzwJwb54cZXDGswylPG7sS+mct8TsKKt+En2Msj2ahGA3Vj?=
 =?us-ascii?Q?RRaA9kzYQXB4JLilD7yfulN/22pJvvO0nD1xGD87kCvhSY1pFinSNQiQDlsG?=
 =?us-ascii?Q?cRRWq0LK0cplJVCIJL+0vcnLfu2wPYiC6xCBFmXoEq7we9dybBzt6FGEs0iC?=
 =?us-ascii?Q?QX+JiHeHJmVe0UL0uRtdy7mFgCJV1RKilsdzxyG8LVmEG3oqlwe2WVeIt4c3?=
 =?us-ascii?Q?E4rYC+kydYykIcazRXkidIdBxZDxy4QR/wVdjaGU07+pQ4fTaYQ3SZw6DcyT?=
 =?us-ascii?Q?PLasXHQzRFxsFAAVRj39KNEmm6Xl/VmfuU8TyjIboI2r2nrLxYs8TLukXq9z?=
 =?us-ascii?Q?mgIh3zjmZFF9wfn7lOU7FYd8XIe5L8pOY8ilWhz2ql1/ho++jKZ9DT7BVY6k?=
 =?us-ascii?Q?lux8ab2WBlkKntYFzi2wqgxXSX9qzkLqEMKCAaaT1k3qaXKk8QROqSnjcApr?=
 =?us-ascii?Q?ArPNCgWg5E+dHAf6NqekXmItiAx9VyTz7u3yXs/aLpdu/S3WRBGSRGLb0g9O?=
 =?us-ascii?Q?n8ay7h9uJVCJD7nbjZChTuHq2bEe8mEYRjj8eNQAV1hl9iR4aYuXxTyl044Z?=
 =?us-ascii?Q?Wj6EugJz8+pjYMvw2FT5+MeD8es0EiBHv+y70afNYgIrEX8saJRYMFzMTcCc?=
 =?us-ascii?Q?RB2/gJGww+ktdZtL5pWwOXr9wy2lda+PyGKyN9wsZ8KZ3FowTDAwDK6XTsyT?=
 =?us-ascii?Q?TRGzNx97gitw0MILWK4R45ODlu6d6WhaN8BUCL5xEpQn82xfaET+VXV+70X6?=
 =?us-ascii?Q?MxOVC4FSeI35eTR+60vt1UPZkjzfDFoPb5fj59iC0BZprFZxhXF+wruhw86S?=
 =?us-ascii?Q?ZEq89SNp/7/XOIcDwcBIGowr1Gp0g+RYa4d6pONdzFPVidluC0gvxu8iVW4B?=
 =?us-ascii?Q?ShgQU+Vml3ssiN9So5sFC/AA3kxulKExgnRSkdlIJ8cj5gQSU0/RRRWC2Rnr?=
 =?us-ascii?Q?tmpt+zq/GWpu5PccjmTqABMq6lSgMstfsXP5KPqEEYBsn1HpmjuUsiHtxLIm?=
 =?us-ascii?Q?I0U8c0/5ZussmTJ2Qt1SWkvUniY70fOpxF0lIuskEzUUeUqQhMBV0Xnp+aBY?=
 =?us-ascii?Q?T0kw+J0faUHMwC1stFdV10aNBZhG0IMgeIhu/M8DBm77ItY8VDxwaW68FjiS?=
 =?us-ascii?Q?B1N2cWh3dVGWSV8gs8FvfmP6F8QLP6X/GhZUMQwLdY4r7fLVFaO/7dWrhckv?=
 =?us-ascii?Q?KtybsPqoi/x2TDJcZxPl3/ka/RF6ic1zi1+b04U7OAfNX7eP3v4Rk2rTxjab?=
 =?us-ascii?Q?13vOYsXOr7WUyoUd5t+Js4oS1jNxtj40ctXSALB4lKyOPNLrnMSzx3MEtcUg?=
 =?us-ascii?Q?IA5Jltq3BJ76hMeXrCHbKNBJ0wXR7ZSBwkIb/1XeR38ik9kjYuZIu/eqe1gU?=
 =?us-ascii?Q?MDau84/oIUPL/d+chzW8Ays=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(19092799006)(7416014)(366016)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dDCD+S3fJgp7Pl/3Whyw9Dw/c1L85sZZy9wrml61Nlen/hwPgEh0zTce1cxa?=
 =?us-ascii?Q?bjEsRZtwZRSb59b/2K2aaRFQRag7eHIzsYjcebp3jNKi3WdXI4cs38K8TY8i?=
 =?us-ascii?Q?cptHxS6nB3kpABb6W9bqRBaenBf9UL+xms0d2mXZbVfO/wVY55cZf9eB770Q?=
 =?us-ascii?Q?nGo/Y72ZYSVu2JUN23vz8UBaOVI9aNgaTfihpm/eU48EAgeuCgqJPgnHDE+y?=
 =?us-ascii?Q?1lD7znKp+SNPQtZbgEKZlF1Cnwx0wqXupyA3oS7/+TGfhuUWBXQv9+/+N8kZ?=
 =?us-ascii?Q?CFDGD648bTd2lI2u8/kVwVMU6sppzObztqUKHZYD6PGPIZ3X+Oc/cRRxCOKu?=
 =?us-ascii?Q?XGmR0bo+jNZiIkYqkLb5msapG3b/qxg5QnlYbZ/ntr2trU9yzZRMFaG3mnPn?=
 =?us-ascii?Q?9GHDYy79GWy35sefv/HOC5In0qSA8+kHTplTp6UcbX/48vk3bY01qlz9KmJz?=
 =?us-ascii?Q?HUED3idHQWPA5c1bwRYy0QhfXP2puApp7P4OdC/j5mA+yCW1eo+Ygt75Ipik?=
 =?us-ascii?Q?t4TLVYoffOBEqGw0OVtII6yVM0miWmE6nguXHdVVE9W7dBhkj7ArvveNpFXL?=
 =?us-ascii?Q?G7qFt4iXteUld2h0quFaLLvfggXMJbS4rM5TzjMQwLNa0uIS7kSRlKLmcUAo?=
 =?us-ascii?Q?IqqdVqR5AMD63pvhkAPuOepCHKnbpD4REIkASIQlndEvZKEc177pzYGQ9RdI?=
 =?us-ascii?Q?kVtv1vrb7mPah2FhY+F2Nc9a9hwHAJDfY28KvxlCPvZRHfJBaW+NvTcWpwUZ?=
 =?us-ascii?Q?7752r0hboeyFKDVmJI9nXF5UEtnmqBn2JEpbWVAk8wIVbDy8gkwgsMF/bM39?=
 =?us-ascii?Q?x7Vxk01tP5y64zFTv5bvHMesHbBJSanlCG1EQzjmwa0mlK5rTUf+QK+F8Znh?=
 =?us-ascii?Q?oGNqEf/drXjtpXLdM8MC9QEekIVvWrafzSk96BZq6uRCcsl7ou/nYFjNFk3m?=
 =?us-ascii?Q?CnNaxT1FD1QG4ymZDitK8Z1Vgje9KzY94xKHPkanIq9go4inqHxywJr4TQFa?=
 =?us-ascii?Q?lDrB2Lteuyh96DavpTqxsJp/lh2528NrGW+HvblEvhcR7GW6Leqw3JL/toZ6?=
 =?us-ascii?Q?tlm7de4JdlC3KNEyh8tXPE/eK64T63ys8OgUDLw5BHNmfJdfetIPvTrjbDLR?=
 =?us-ascii?Q?cYcA8XOvnuulwET8/VObkE2++4rxeJYidTY9UscEhgjjwViJCz090TYEMwNC?=
 =?us-ascii?Q?FczBIkihBJrJFi4Mfjob7XdixfIlASPVr5M/c1MhovDDsicFB4c169Izxyh4?=
 =?us-ascii?Q?IRSLhsrrXuKH108/O3uYS1EmS8LrJl5nuKWN0pq94Do7M4fgxgGae9kYb3KW?=
 =?us-ascii?Q?Q8CELe1RQWynCDiJ+bw3uJYEUVSkl2ckE5A9gsHmdjD48wprkLftJCcSUoDi?=
 =?us-ascii?Q?QaP2bbQgnGuyoAl91IQLIxWgAIHVhahzBpO/U9yV8o1b7hawV+/bLaV7Gqbj?=
 =?us-ascii?Q?t31VID+lkDLcwsFUCnWFMLTFZZb69m3qZMKES8VAf/paX5RyQ/CkoXmHL1EE?=
 =?us-ascii?Q?kQVAYOOnzF8vXinaeMjsSmLK25dswrk8NL4UVSvLhpH5ol4ILmv1d2rnHrJ0?=
 =?us-ascii?Q?qPUhEPyVhQy+k7yH0/CCCxpPJOhTUMy37ZiO7/wOqhsuQkbO0L0AgQtITqDs?=
 =?us-ascii?Q?/EVmbp4tLo0nZ/4nsIuLomIExyHW22ZPhazInZmUASDhldim+x1+dj8oBoVY?=
 =?us-ascii?Q?vyJtu/9wvGXiEb5zMXhl5DkyYYaHg2HK+/gQGTt/hsgK8AU1?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47b423f3-034f-4812-1288-08de65b6432a
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 19:31:01.9439
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8++kKjweCyYtZ633teaRDo3G0c0HavRUeoopJ8/k2KCzbJb3TTRu5YXrPUeyWkvzSO0Fp6q8fxKe3Y78mgBDVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6971
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_113109_709103_DDBBC788 
X-CRM114-Status: GOOD (  27.74  )
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

On Fri, Feb 06, 2026 at 04:01:37AM -0500, Pat Somaru wrote:
> The only generic interface to execute asynchronously in the BH context
> is tasklet; however, it's marked deprecated and has some design flaws
> such as the execution code accessing the tasklet item after the
> execution is complete which can lead to subtle use-after-free in certain
> usage scenarios and less-developed flush and cancel mechanisms.
>
> To replace tasklets, BH workqueue support was recently added. A BH
> workqueue behaves similarly to regular workqueues except that the queued
> work items are executed in the BH context.
>
> This patch converts drivers/dma/apple-admac.c from tasklet to BH
> workqueue.

Avoid use words "This patch",

Convert apple-admac.c from tasklet to BH workqueue


>
> The Apple ADMAC driver uses a per-channel tasklet to invoke DMA
> completion callbacks for cyclic transactions. This conversion maintains
> the same execution semantics while using the modern BH workqueue
> infrastructure.
>
...

> This patch was tested by:
>     - Building with allmodconfig: no new warnings (compared to v6.18)
>     - Building with allyesconfig: no new warnings (compared to v6.18)
>     - Booting defconfig kernel via vng and running `uname -a`:
>     Linux virtme-ng 6.18.0-virtme #1 SMP PREEMPT_DYNAMIC 0 x86_64 GNU/Linux
>

Should move after ---,

> Semantically, this is an equivalent conversion and there shouldn't be
> any user-visible behavior changes. The BH workqueue implementation uses
> the same softirq infrastructure, and performance-critical networking
> conversions have shown no measurable performance impact.

>
> Maintainers can apply this directly to the DMA subsystem tree or ack it
> for the workqueue tree to carry.

This private talk to maintainer, put after ---

Sorry, the same comments for

https://lore.kernel.org/dmaengine/aYYm2pA6l-ksXvkk@lizhi-Precision-Tower-5810/T/#t

Frank
>
> Signed-off-by: Pat Somaru <patso@likewhatevs.io>
> ---
>  drivers/dma/apple-admac.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/dma/apple-admac.c b/drivers/dma/apple-admac.c
> index bd49f0374291..8a0e100d5aaf 100644
> --- a/drivers/dma/apple-admac.c
> +++ b/drivers/dma/apple-admac.c
> @@ -16,6 +16,7 @@
>  #include <linux/reset.h>
>  #include <linux/spinlock.h>
>  #include <linux/interrupt.h>
> +#include <linux/workqueue.h>
>
>  #include "dmaengine.h"
>
> @@ -89,7 +90,7 @@ struct admac_chan {
>  	unsigned int no;
>  	struct admac_data *host;
>  	struct dma_chan chan;
> -	struct tasklet_struct tasklet;
> +	struct work_struct work;
>
>  	u32 carveout;
>
> @@ -522,8 +523,8 @@ static int admac_terminate_all(struct dma_chan *chan)
>  		adchan->current_tx = NULL;
>  	}
>  	/*
> -	 * Descriptors can only be freed after the tasklet
> -	 * has been killed (in admac_synchronize).
> +	 * Descriptors can only be freed after the work
> +	 * has been cancelled (in admac_synchronize).
>  	 */
>  	list_splice_tail_init(&adchan->submitted, &adchan->to_free);
>  	list_splice_tail_init(&adchan->issued, &adchan->to_free);
> @@ -543,7 +544,7 @@ static void admac_synchronize(struct dma_chan *chan)
>  	list_splice_tail_init(&adchan->to_free, &head);
>  	spin_unlock_irqrestore(&adchan->lock, flags);
>
> -	tasklet_kill(&adchan->tasklet);
> +	cancel_work_sync(&adchan->work);
>
>  	list_for_each_entry_safe(adtx, _adtx, &head, node) {
>  		list_del(&adtx->node);
> @@ -662,7 +663,7 @@ static void admac_handle_status_desc_done(struct admac_data *ad, int channo)
>  		tx->reclaimed_pos %= 2 * tx->buf_len;
>
>  		admac_cyclic_write_desc(ad, channo, tx);
> -		tasklet_schedule(&adchan->tasklet);
> +		queue_work(system_bh_wq, &adchan->work);
>  	}
>  	spin_unlock_irqrestore(&adchan->lock, flags);
>  }
> @@ -712,9 +713,9 @@ static irqreturn_t admac_interrupt(int irq, void *devid)
>  	return IRQ_HANDLED;
>  }
>
> -static void admac_chan_tasklet(struct tasklet_struct *t)
> +static void admac_chan_work(struct work_struct *work)
>  {
> -	struct admac_chan *adchan = from_tasklet(adchan, t, tasklet);
> +	struct admac_chan *adchan = from_work(adchan, work, work);
>  	struct admac_tx *adtx;
>  	struct dmaengine_desc_callback cb;
>  	struct dmaengine_result tx_result;
> @@ -886,7 +887,7 @@ static int admac_probe(struct platform_device *pdev)
>  		INIT_LIST_HEAD(&adchan->issued);
>  		INIT_LIST_HEAD(&adchan->to_free);
>  		list_add_tail(&adchan->chan.device_node, &dma->channels);
> -		tasklet_setup(&adchan->tasklet, admac_chan_tasklet);
> +		INIT_WORK(&adchan->work, admac_chan_work);
>  	}
>
>  	err = reset_control_reset(ad->rstc);
> --
> 2.52.0
>

