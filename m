Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93FE9CAC5A9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 14:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EnEhvz6OsQ0c5BDpW8EOBIlOZ9xei9YXwWhmnVtfKCg=; b=xESjth824s0cZUD+aEfRlqG1G+
	nVg6wnVwsZBWNEgOTNVKXDmPPetwmiiv0siWDnYsFwIQjXL6svEeqi7CsQ5s/0ERR9vykFOAy4qOb
	UQa2pemTpQj/lVnVAkEx948VEps3+DmciaIXEpk7BS7dZbCJQhKouvn1wJQX823hpbXwXfTv7wH5F
	hdNTs3z/xy9vhg+5Yh4bCMd1qS/aJTS/fgmVL/jxSdbCeN9cV1qc6NHgZ6RiNxcn0AWMRz79sL2HR
	/ibWx06gvwfeRlPlx7SqESlOsOhd78/Wk/6Sjn4fDqsCxEb+C4r2n15K3nK4HkWLn+xUMQlwlIRQQ
	WDDOT1EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uysv8-0000000C69f-3qBn;
	Wed, 17 Sep 2025 14:14:06 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uysv6-0000000C67D-3gVk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 14:14:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k4AZngB7BYBt9mAnVPzKoqQXAzZo+XkIJ8bkJ3HYveuwUzTvGzrT3+5okF+yEevUb1ommEZ741ZBRhyJe+RYSoROkrOZp3GrdspnCKzXOq1HY9WEn7ac87MITO9cl8uNtesMeO/B2nTE8Q13oJM6TRkL3SuRNVd2SOnvrwCMGdJ/OQtSrc6Tp9QHGcGZdsqrO5PDYVsYbnqWis0hWE3XjkOiZ0f8o7BAuzU6iyXYUzRsXVp1zUefONJmUMWWgLZqzVbi8nzNxRvXQDEs8Wb/fRNaFTXfp3g++BL7wm2LBd55Eh8w/7MEaLjHQmrNEP+iLDR1hJNrCLWwA20JZVlXDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EnEhvz6OsQ0c5BDpW8EOBIlOZ9xei9YXwWhmnVtfKCg=;
 b=rCCPaUpNJGpmpXO4JuFsqW1LexBHxBZTm+wTvBpxVDdR0phkJ165mcxBcpDvg1cj9mrdK0NANqVAOu22GlO/+ERP5fcjayDbK4rAwi9YzIAKUq4NmoijsSwpG4N3x77xWzrYAT0dkPIyK6PFX8Z1yw6D9f0cSJDnL+D2BzJSiPynS/4rz7zKB1vBu0JvWmafyMKY2xX6AZwDZ+RIY0S2irvi3xcGg+fz/d4FFFElskJbnclmKo4Mm4edxrqYOkGkzb/XJc2nVtiBnlr6H4gN78bJ2SiGRCg5NtZwP477O8eLOVmbHneqNb0KvcxW0oQ/8D8dBJgTsdnR9DjaAedleg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EnEhvz6OsQ0c5BDpW8EOBIlOZ9xei9YXwWhmnVtfKCg=;
 b=D54/FNDEaBi3BFJHQCrhXCzIcDhxqBFz+8yQVYoAraXDIFwGYtue4KTeXIoWsj52s8+MpDm516ny1T3r2C+xT3R1BwwpKivvG+AnIh92M/PR3lFKAFMUkH3Vxqfr2nAsapulczjNmFI2G0sz3l9KspwzcvxWRf2b8NcaeXahZsr6apnwebaaGbmU/EfUy9KEEBZarYHgzWo74PiRDWCur79QB/B+ao8OKYWrBeo7qzALLXVwnsVKRo9014luLcSRfumyEqUZmfqJVIEQFuImQsJ7zipkdt2XukqVtiuIsBqAS3T3LhY32okbgErMCAX5d37jSEUkRIKmknQ23xT42w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA1PR04MB10144.eurprd04.prod.outlook.com (2603:10a6:102:460::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Wed, 17 Sep
 2025 14:13:59 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9137.012; Wed, 17 Sep 2025
 14:13:59 +0000
Date: Wed, 17 Sep 2025 23:25:37 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Harini T <harini.t@amd.com>
Cc: jassisinghbrar@gmail.com, michal.simek@amd.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	git@amd.com
Subject: Re: [PATCH 3/3] mailbox: zynqmp-ipi: Fix SGI cleanup on unbind
Message-ID: <20250917152537.GE28673@nxa18884-linux.ap.freescale.net>
References: <20250822045732.1068103-1-harini.t@amd.com>
 <20250822045732.1068103-4-harini.t@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822045732.1068103-4-harini.t@amd.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2PR02CA0043.apcprd02.prod.outlook.com
 (2603:1096:4:196::12) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA1PR04MB10144:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a0e6a4b-9898-4e0a-d60f-08ddf5f47236
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|19092799006|52116014|376014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xllEbFmTb1a+v9RhsY2j5RPl6HPtq9P7DN/kqfPh/fZpzAKW7Z0JuvWteAwb?=
 =?us-ascii?Q?4439nqcyOKPKCd2cK5NJjxN1kjrFLIUKMpgE7ol+2taePL4p8XzJjTkz1Cc0?=
 =?us-ascii?Q?nItdeOMreKH19BVImhWBtA+fWxVwWvF6Zw0EZN0zHnFZpmqILKUePrvTs1Vh?=
 =?us-ascii?Q?F6L8Hd13q+xZwhi8WBg2zFaz5eOFlrLVFJb/Qggi5y+PH5v822XxWaNKVLYQ?=
 =?us-ascii?Q?9iK40rdKU1QKnC5lc2b6otuymW9M4wuYOaDmEuPfxmJrbWTx//5Qbv+jFHMQ?=
 =?us-ascii?Q?fTP1INdQ8pQFBNaO6jpKOlPbhQQOaBPSVg3omu3QkCLmx7+tMlbXIzEQd2RE?=
 =?us-ascii?Q?pBAXePViyaKtxXLlZ55SOlE+870YyzC8txa2zsycRNV9P+22eNLy2VAS7zLt?=
 =?us-ascii?Q?KDtlNfx16CdyQK6qgjbVPbW/rNY8KDwOcfWFuEp8Gel1qe+krCDjPr8pzGTD?=
 =?us-ascii?Q?0MrmXC50UXU2HSqxnwDQ1VSBAHG2UpBiJlZSekSVCTVEeOicUCA/KQHxWwP1?=
 =?us-ascii?Q?TQbLPfWT1LlD+xNsnIkzliqcVGvCRMEVGktP7IMivYuj53ivOE9qApddMf4i?=
 =?us-ascii?Q?VFL2xNiArYzmOfgHYK6s8bM5phoXG4WPOH6WWgX7P83plrJz+L3ynjri8GYj?=
 =?us-ascii?Q?r6175mRuUIg4AmwSMWPV/Kmp8CU8sMZWlwbVuu4spT2XuyvOBTEARdwPmWkc?=
 =?us-ascii?Q?+bDMdSgp7PyWC6l1xPPfsDx7W6457vX9wvm95qkUNTtQpZiPkl65zeiTQt0k?=
 =?us-ascii?Q?OwAapBv2FsormbjdRmcdjUP9OqcMT77Giuha4atcJMm2Yr2SDF9Y/TDN1QYZ?=
 =?us-ascii?Q?EkSdz6P6DzcXeqPcmu3o8xr27faznct1yZYNcRwqb/WL+A6HyJqO/39GXgXO?=
 =?us-ascii?Q?4Q6BP67F/ULXLnGShTGWla0WhJrPAEYILJblD+yPspA/mITie66Gszbk+9sU?=
 =?us-ascii?Q?I1d49d8HdBKldmwRgAM1jsAexoslnWsRr7ffDjhRkHiksa9WfdZpYUiuXI7c?=
 =?us-ascii?Q?ZNe0+9g4UT+df9ET0QdCTTDAC6tY9lRsaU4UEL8yIaAJgqJtTUlRIarQFins?=
 =?us-ascii?Q?rt1MsJ6LqPG2eGFdhhXp2Y9HWClGOGQsh2ZuDrVhzfdm8QBgUdiG0Jx8eAqm?=
 =?us-ascii?Q?25x4nO/zzAUgwg051V3y50/T+w1e8rZZuwXvh2+n6RkWtCYMdDUzy15DWbe/?=
 =?us-ascii?Q?xpL0+Q6Ku5zukoH5dMkgDqfnlsAC/dcpbLs3CFZiUucavc0k5vWJKJfLwRBy?=
 =?us-ascii?Q?TtIadOWxQZ6SsRkJdJQSXdeLroSuON5t4niRvqYyQYdeawCHgS84dASL17Z4?=
 =?us-ascii?Q?wp85LEXgiwFwqnkORXB3T1+u5fmnpVzY1tTL843q+P0lGpSCDKUGQaq+QyQ7?=
 =?us-ascii?Q?rprygWgwr5Mp3w8my8UW8fAiZebj7+XJJgarN8d9NXSrg3azfw/WMwcWKKvv?=
 =?us-ascii?Q?xea0UjAYOUV5RzbElfjtXj3fJZybWXbf0O0TNFnyozUk9+DmFvye9w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(52116014)(376014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eFGKnzgZU66Wh3vwUaTjH4U3E/oMGdD0oSy0tcBrLuhW8qh4xnZq/T4o5E5p?=
 =?us-ascii?Q?pOqSEesjuE+bLAwYvr7inU7dhLqa7OjjkzU0Dn66qVt4APuSmhr7ChgvORu7?=
 =?us-ascii?Q?NRmK8l0p2EqJQCdFJUwXiZj5knfefVGDMvZ+2lqXNYti1UhWvcKCuUB8gE0l?=
 =?us-ascii?Q?EjlEut5Lk6Ph3IrLD9jkE1KiD65Gpn+wfDxwC95XgUkVxwwSsIZwVY/2t4ya?=
 =?us-ascii?Q?DNTj4BxGcnNE3n5SzdvSN/Tfx7b4Z8kfW8O5k4D2Arq77ibOfLEQTqeoZOfW?=
 =?us-ascii?Q?eQ3YcK/e2SjFFD+Wh1fDUu9Q9VhyENsl1AMwKZrRoJ/vDj5MgKy+n4slikdG?=
 =?us-ascii?Q?9YLxa3ubjbJ3KWxd2TeVMLG7p7Nj7Bw7Jj7iCk6VhEWYdd22Y/7Oi+/5Y1id?=
 =?us-ascii?Q?p+0WMCPUWw6qDiau+v4yxgPL5MWkHkKaH+EDsTQ2EnP5i2/FiGVodQ7EzAyb?=
 =?us-ascii?Q?vN8Q/oEUepQyxXZQqdGuakWfA4B1h1ASmrsffja4BrEZzRcB8j20qpaOtInQ?=
 =?us-ascii?Q?cgsfhxtxe83h8LDEgl5LE1uBbhITmsvTS+DZZ60NrXgHSm5qLFY9mJYlRcnw?=
 =?us-ascii?Q?bsM420F+Zg6uPOL+r+n7Gz0eoK6B2/BpG6kWUuqx5foghWaOAd5dOPzymkZZ?=
 =?us-ascii?Q?AA4/o9cbu4O/VcBNtU20ThXh/rWDO7KQ7AhmgkeiypMC1JgMXFEiafbvYMv0?=
 =?us-ascii?Q?910KUOnlVovRjAx5LaQo9JDcTnsGv6sUH66KNyzWhb0U7fm4Pk3Dr30R17vV?=
 =?us-ascii?Q?BMua8wISdnZLQqDChm39WDUzywveoo9wfRuzRho67RgWMDUvxL2+UxjJ999y?=
 =?us-ascii?Q?UepYCg1pQxgJ+otWaT5EKFXSjEQvo9L9YA38iCjKstu9IFe/KjT3OqKw1BoT?=
 =?us-ascii?Q?bWKRMlMMDkwlGTnS+SAzoDL6okA3E9Z4aetc/4+lx1uYD2IjPxuJm3w5VAeS?=
 =?us-ascii?Q?4mXkLZfaKat1NeJaXXoY2B8aQzPuGLNCN7/E97WeXYOQOGFqwZfywzZiy0Iw?=
 =?us-ascii?Q?A38mhY2PhyNyQrnm0qKEWYxJaIv3O3yuqC5WMg+pcUayK5xbVrp+fb/rYGi0?=
 =?us-ascii?Q?NvHU1zmKY14isCSQr6wPMYlbBJG2SkLWXSnxBMma7F6miTI+z/UGD1fx8TdI?=
 =?us-ascii?Q?N9i991eqENi2NEaDEFK56SqjIpxPGM6C+u+GLjIBZDpD53ExIr5Pf/HjR32F?=
 =?us-ascii?Q?fV5h67ODxufb5xRFfTGUnx3/x/kblKV+Rdqq5W+EQ6gWeA1FXrmcmPmMSWFn?=
 =?us-ascii?Q?IBOGPSXUw8aFnl6kAD1w1N2jlT65qci+X4bGhmgqXfjPt5AqAPI6YfVsr6rh?=
 =?us-ascii?Q?TNjGmBl3Z4Kp/333Qn7yU8ew50jaoRZ8BTSd1vD+zNL4Ok6U5KAPWwNSFLwv?=
 =?us-ascii?Q?M/s7ka9spOzgvXp0m7EAPNipfPZ03kg8Jh90sE0WkfmbQf+K63ZeDTwajtWD?=
 =?us-ascii?Q?Cmrb+T0UANLKuwMc+6XVTp+eI8WOJUuY7IFJgvQJhxO53/9tRGSfbHr9gvVl?=
 =?us-ascii?Q?Y44jFeEqp7ki5iVV+b926e+sUCUVEAJy9o8mGMRz/LLY20gO1N2MnzkopxLE?=
 =?us-ascii?Q?9EjJnLdD69hL1+0FjgTbMz2i6o4f1NpaRM9Itfok?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a0e6a4b-9898-4e0a-d60f-08ddf5f47236
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 14:13:59.4802
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xGPUPOB7SWh9GXSmCxv7h8EMaCfgCQ1jjJtSXfsVhRQSOkNi4pqFN8OfW+alfbR9Pz8GdDiCtbxOdjMtDBwWOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_071404_919776_3B145E2A 
X-CRM114-Status: UNSURE (   5.87  )
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

On Fri, Aug 22, 2025 at 10:27:32AM +0530, Harini T wrote:
>The driver incorrectly determines SGI vs SPI interrupts by checking IRQ
>number < 16, which fails with dynamic IRQ allocation. During unbind,
>this causes improper SGI cleanup leading to kernel crash.
>
>Add explicit irq_type field to pdata for reliable identification of SGI
>interrupts (type-2) and only clean up SGI resources when appropriate.
>
>Signed-off-by: Harini T <harini.t@amd.com>

Fixes tag?

Then Reviewed-by: Peng Fan <peng.fan@nxp.com>

