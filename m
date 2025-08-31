Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7A4CCA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 Aug 2025 07:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VG1dpmXquwrf0wjJoNM7TvdvguyNDSwYwcT/tjsmHbc=; b=FVA+vVkVoMAjHLfqrX50+JJYV2
	B3+Ch9s/HjN1bv5ApRc0CaTbmFhCaTfa7aQEbF1BgwU28qszjEUHNzqLwyVyUyl85Xs5niHqtQ5pu
	AL+sOe7Us2ggdmIoOvBqwHfW5paCt32bPmWVKCyK+Z3DJDbx1mVar+uHbNMnnbHff73aw5l7+mk+e
	7VUw6WOoOeGV1c4tJFOePoYhSgKo2xdDdMKIHpirIaKUGKCdAH9vwsSOQ0LtFBxWv2n5AJ+Kj3nNO
	NnXxl1Jpf5nxM5KmRfVYL8qcAxAK8mLjm72eXkej4ONBDahCcZ8h2M85ysvcvOmjLTtw8VyO7v/eD
	36c9Vyeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uscPL-00000009ruS-2nMx;
	Sun, 31 Aug 2025 07:23:23 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uscJb-00000009rXw-2xOw
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 Aug 2025 07:17:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wUR4ygRPl1MZ2bBRzUGRbxJJpFevupvXX5eRQ4j6swMb7z92cujdo+JHe1FxiJUz3S0opI0b7GXdJ+ZNE0+ibtmB0/QgS/ZY98pIUS5FCRZHuUTyFUOBBP1fKnhdilZ5B7eqB+/srqg9x18dKTWJnCeF8KOi5cLqALHQU8EqTDUexHjyegNCvl66E/prqB16cimQ9/Qq2occ7bdpVhp2ICCoh8S7VDUvzVkDQSJN1++L1WCbRcHMLE5/9vRBFd7gr9D5t9qbwh0SkQiC5YcNo6nEwbLzoMPx9xe13Bh859yDCAjXS64+X391EuBXq5RxKfMqP9tSd9vO9tU2xMk8fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VG1dpmXquwrf0wjJoNM7TvdvguyNDSwYwcT/tjsmHbc=;
 b=IiScwKgcm7yMlwSqdO0Q30i/NhK4yU9XgM7J9d2BH7ZXRy9JLboUnKfp+Fvp4U0q3N3t0pm/D5SZxKGFdwsHyb/+z7haHMembLSBUSBGsSipH/qkSL1PTHl6+ytem+bIb+Fs6wAfXCd5frTEIyH5obpDA77plTF32nCzRHQC/PD4WnZesGPMlVXQnjR6T1mZzzhx5cWQBuD1etlUc74ko7Rh5ThmZwxxsrlEUob5QK5aPYKiz50bNvaWAnXKR9fhPKbjFUAqH1Iq5Esn5/1dbxUbje1SmUS+YFcjOnvYfN4rUhAfPIdmdXqUltGBEAuJd50i5btzWWSlwnm7phxe2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VG1dpmXquwrf0wjJoNM7TvdvguyNDSwYwcT/tjsmHbc=;
 b=nXvXZglZHqb/GArR8vkIsUQGv+KYBivTgS9+hxq2tSnB1Ahfg7xtSe1LnJOmqI0fFitsHG23mXuw7KVNmh3LVj9HKF5CBdobMmoDKO6K9yQo6ZWONhMB/YBKPpqJeF+eLvpKfuINFcCHCi+/B+dgd7siH1PCggd+b1q2p7wh62fnfiQwp2iSfGWTEB0L/LOGv3/QSUj0KjVKuVK6mlbgWYxBIBOoXV88mM2I/TDE667jTrDzqfyT7lAU/nAhq/hoQqzQaOsrGE9H9lw9C7LqTdNzK56EvmfaCx1k8nhAMosVXXBB7vkV/kecu4ArP3rUMDKiTij4xXhrc+lnCMAQaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM9PR04MB7715.eurprd04.prod.outlook.com (2603:10a6:20b:285::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.12; Sun, 31 Aug
 2025 07:17:22 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%7]) with mapi id 15.20.9094.011; Sun, 31 Aug 2025
 07:17:22 +0000
Date: Sun, 31 Aug 2025 16:28:39 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Peng Fan <peng.fan@nxp.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, arm-scmi@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/6] firmware: arm_scmi: imx: Support getting syslog
 of MISC protocol
Message-ID: <20250831082839.GF17728@nxa18884-linux.ap.freescale.net>
References: <20250827-sm-misc-api-v1-v3-0-82c982c1815a@nxp.com>
 <20250827-sm-misc-api-v1-v3-5-82c982c1815a@nxp.com>
 <20250829-realistic-dolphin-of-blizzard-2bb398@sudeepholla>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250829-realistic-dolphin-of-blizzard-2bb398@sudeepholla>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SG2PR02CA0060.apcprd02.prod.outlook.com
 (2603:1096:4:54::24) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM9PR04MB7715:EE_
X-MS-Office365-Filtering-Correlation-Id: f78fbba1-d6cb-4a7f-cf04-08dde85e6db8
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|19092799006|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UAQCCzLQbe46PFXL1AYfT4zCpSvjpozAi22+FSuGqbbEBrG9h4018vZF+koJ?=
 =?us-ascii?Q?Zf8Gs8hGxB2OpBHgymr23qrdAdiMm18EelZUEbr8xB5K0SntnbAKP014gyiq?=
 =?us-ascii?Q?7NxyMjpWGckDEDFg1/ten7oRLtCxROxw6MCuGi6cC+Kkbxg0umujVtsxZj+I?=
 =?us-ascii?Q?CosHvmILQy2aUdA/1n5l6smLbt3NesCsYM7ap/Z197nqNp737ZZ8yZvGbaVz?=
 =?us-ascii?Q?3DQMhv7uy2rFjhOoNqtUvRuYhintSFqifov79pQRJrrgbA6tKThwpR/gmoU8?=
 =?us-ascii?Q?TbopnTkCd71LMgzCln4szb9Eth43jO0HfbiTgAvb+yIZ43wtfbRaf32UpXFT?=
 =?us-ascii?Q?lXMx/tunk9SxFDIfH5SKsCPcdu/1p7SOalGtiEVOB9s5PU439si8qfqPmneG?=
 =?us-ascii?Q?6n9SZbOyoj4i/xxqJgqgMFrvdQ1nTnuoGJR72C+qTcizHKYAd/4hHlxngRKN?=
 =?us-ascii?Q?DcYSvsDfiXrvtmQJjuB2r/HOdBcBU55H57OsIkVR6SmpRNionl5tI79vqLs1?=
 =?us-ascii?Q?VQtPg7g9TgMailgtEncR1VVitHwt3nDignbczWQ5Fliyd7PKT/BGRcUB90Sr?=
 =?us-ascii?Q?ZBcJFvwgsQVBgWf+PcVlZNzYr1/7wGtI+QrH3zqeOUxBX7qjMQpL0tWTzn+P?=
 =?us-ascii?Q?u8tVxQnoUXQp9BXEwfRsv7S/ZpQFwpxFf3ahEGo2R4ydJfzxD/owoOr5uXd6?=
 =?us-ascii?Q?n9S4mOgIYJXq3ALmDbjSXe2+Uwy5LuJkUK3b1q0fD4zGlAICDZjC8AuABkdZ?=
 =?us-ascii?Q?c55nprnZwMJjy1lQed/x7A6if9slwU5QSMJuxU5jJZ68i1KyKgK6J8RmfM88?=
 =?us-ascii?Q?+drY0l/AMm3jCOPFkCyRUZ6H+RmcYy1u6VoKD6aAsVlrdhba5BJk+cwkMOO+?=
 =?us-ascii?Q?9YiTxHawkeTczrTQ3bkVPbtGt20N/LeJBcvNqLmlrpLneVpGbyKgjUiHORcd?=
 =?us-ascii?Q?Vmc3LiI3S7oHP7Dw9CBl/a0cR/1IHPt0EpTcoexQISRxJoQKnBUh0U+zFh+G?=
 =?us-ascii?Q?3vHlrZBO8AvZK8vqnfuwRlcKhIybWkpLpqavOjcSOWXoxIZpTxg5ilwI//vD?=
 =?us-ascii?Q?Eret35qliDEnrII/HNLrRVl2OAVopR8nWAIWLtF0Syqrsg/r3GedGGRvv2wv?=
 =?us-ascii?Q?/96DjvhgkroYM+PS93jxgEfYvR319WqEMGeZ6nPY0sAA6TdI3Q42cGsc8+5B?=
 =?us-ascii?Q?g7nKKN2114QFLhkoFWg/Pou1kfHK7FZQkLfw/PT2F+FTWi7PXhQFbtuNOE+G?=
 =?us-ascii?Q?jn1Xg+B8i6Z7X2M2mQumETFDV/bLGKyjoMPfKkw2oFWgBWLY5jy1MBgDIKhn?=
 =?us-ascii?Q?iU38iqBT+2itqBMNQVO9SyZwnyIkJtY/gFA737UmoZcmhKjy1EiEtBIDDuMr?=
 =?us-ascii?Q?iJvzOABxkQtxIDz/+ckv5yva6JwZ+AE/eo79To+jij8wAk/vsyRUQJL6iTwv?=
 =?us-ascii?Q?WLIwaxEkPszEpqY1gIapdiKL1ZEQg46VoINXg2WlRJpsyXvchmzSfA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(19092799006)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NQEKHEXcEBRT+tluDeYz5skw5YgemuIh3ldBTA9KdVXbQPjw8tUM1KbjNIut?=
 =?us-ascii?Q?jBxCBoohZ/qcpCyylncEzOHLQLae0mKuHJ8Swq9jCW6wSw9AEEVrMPNytIJF?=
 =?us-ascii?Q?H2qAxn6GUMQ35ypUou8bk7iMzjK+T+e7ANHo+5xf+WZgLeKKrQE82lY6Dl+h?=
 =?us-ascii?Q?UG6zhB/+tbSZO3qzjsHkOtFP7wN4+sdm1pgeEjXbTwLfGDP2N/49TXTRvqqz?=
 =?us-ascii?Q?1F8YBITZ7JPnMO494m9yuKuOK39fnlj++PaG/upas+RtcserD8xBC1q9B8OH?=
 =?us-ascii?Q?xBT6JLcc3jjUlSSdobeufoPJ4KbreotM5LKvXiPIqE7MfJrNM93cLQg/ZXHP?=
 =?us-ascii?Q?F1x86J0pU6ANYz92SuDGrpSyQgzMwAYQt+ASSKRm+pv0qFQP5oVv6TwvZPz0?=
 =?us-ascii?Q?lzarhpALG056iCcVeQO4AEa3cPvIh3MDu7kxLxAtljsr3wpxl6hbyU+jcUXZ?=
 =?us-ascii?Q?vObZLRUSmIQNv4wHafBxrKK+3n/OiLBaflpdbBKFWm/ew7fazRGExeA1nuoC?=
 =?us-ascii?Q?RtugBoUVHi+EpsoFje0mU/ow3KcaESrGwwMGVe3eQggYzYy7HU+K566dogu2?=
 =?us-ascii?Q?I8bM2zkEw3uNjMNm6g3j/AEPWHouXFzrkx5slyeYamFvZoiiphrpqSwNAzMm?=
 =?us-ascii?Q?ZnL+gfMf3xeqK9A6lEgQQkH7uDjW1KbdcMhb9ZL8Rw4gMnuVdRUDXr4dvdg0?=
 =?us-ascii?Q?AWNYCzZut7vonu4v8vvyy0pR0Yx9ezLSpTN0GXwrXU0WBtEQiZyvIoDeu+7w?=
 =?us-ascii?Q?aBdQ9aT5yGqUV45dYhygbGpk8qypb4UGuU9iChW/ogh787Y/X+TVOTPHzoQf?=
 =?us-ascii?Q?G9EgDhX9sotl/YySovv2unXvpjhTd79ZT61tQYZpH/sc6P5ZbZtrL5JMAIKW?=
 =?us-ascii?Q?Zn9I8OnLJL97I1EklnDdGy2iB+y0QSVmZ9J5rtdubQKH+NVNGNUdXyrdVygR?=
 =?us-ascii?Q?rQkLLdW3ZxuH+j27SpildUabzK6wdluGU7Cl8hTm0R0xuKfXNr6Lnqq30Hsc?=
 =?us-ascii?Q?PpJ2cJX5bD6me1KPAxgtSniO04y7GfYXWxiFy3i5fBoaCC/X8kY6XGX5LvjC?=
 =?us-ascii?Q?um5mkJYYCkCQzE6utn08hkRYDdRiQxqIRfKqiX6qOxR1KaIsJJlSRQeVS7t7?=
 =?us-ascii?Q?4O5I6MnPdpiyLR+N2IPFVwVC77xIGV+Cb0+xHxmgTBn6grn+tUKIUrY3pwFK?=
 =?us-ascii?Q?vWAHlYmBA0/iJrUIYBhZNb19VcjeAp7oqd5NnTy9hLNNsqE5dy1cRoN7vqVI?=
 =?us-ascii?Q?KVeJGCZyzqrZVinbguuFcT239NpJfwyYXZ/l49QYcEJAbeNkfnH4oxjrTjKX?=
 =?us-ascii?Q?c4mtSv83llcP7Aa3EWXhtm41D5UY2z3y1OyrcyVaFUs8dzIIuRVha3smiRAB?=
 =?us-ascii?Q?XddDa+62gRcn0epMJTaPgiFtcO56+d+lVNRbnGoAy1jODRb9KdWCeP9uj/73?=
 =?us-ascii?Q?H9ltlDRxv1D2gfwbwvv/k8nzdj72dBMMYEyirRTn1fxHcDkcxdj1cGHIL62k?=
 =?us-ascii?Q?NiGDyUwkznTB9fXjclvAR60c12VTNWFrxBYyT+GdkKftvVkSv+mn6rjUCDzT?=
 =?us-ascii?Q?0pT6x1pcDMbzJQOGM2trL/bNJH0/bgNfuPUbsk5B?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f78fbba1-d6cb-4a7f-cf04-08dde85e6db8
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2025 07:17:22.5200
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +lqpc2sqURtUn+2CMFjavCWpf7RvzzLDly43plDk9KwVkQBvr/jEXasj/Pao8CzHEQ7j2/vKVsZSse1vxHhdIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7715
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_001727_749056_9BEAD32B 
X-CRM114-Status: GOOD (  17.70  )
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

On Fri, Aug 29, 2025 at 12:07:22PM +0100, Sudeep Holla wrote:
>On Wed, Aug 27, 2025 at 12:59:17PM +0800, Peng Fan wrote:
>> MISC protocol supports getting system log regarding system sleep latency
>> ,wakeup interrupt and etc. Add the API for user to retrieve the
>> information from SM.
>> 
>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>> ---
>>  .../firmware/arm_scmi/vendors/imx/imx-sm-misc.c    | 82 ++++++++++++++++++++++
>>  include/linux/scmi_imx_protocol.h                  | 19 +++++
>>  2 files changed, 101 insertions(+)
>> 
>> diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
>> index f934b4fbc6ec9f1e6b24d1c6c8cd07b45ce548e3..2d3423d83aed857329a9a367d0ec0681a1d77d0b 100644
>> --- a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
>> +++ b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
>> @@ -27,6 +27,7 @@ enum scmi_imx_misc_protocol_cmd {
>>  	SCMI_IMX_MISC_CTRL_GET	= 0x4,
>>  	SCMI_IMX_MISC_DISCOVER_BUILDINFO = 0x6,
>>  	SCMI_IMX_MISC_CFG_INFO = 0xC,
>> +	SCMI_IMX_MISC_SYSLOG = 0xD,
>
>1. Not ordered
>2. Inconsistent command name with the document.

Fix in V4.

>
>> +	*(p->size) = st->num_returned + st->num_remaining;
>
>I think you can drop () above.

Sure. Fix in V4.

>
>> +
>> +	return 0;
>> +}
>> +
>> +static int
>> +iter_misc_syslog_process_response(const struct scmi_protocol_handle *ph,
>> +				  const void *response,
>> +				  struct scmi_iterator_state *st, void *priv)
>> +{
>> +	const struct scmi_imx_misc_syslog_out *r = response;
>> +	struct scmi_imx_misc_syslog_ipriv *p = priv;
>> +
>> +	p->array[st->desc_index + st->loop_idx] =
>> +		le32_to_cpu(r->syslog[st->loop_idx]);
>> +
>> +	return 0;
>> +}
>> +
>> +static int scmi_imx_misc_syslog(const struct scmi_protocol_handle *ph, u16 *size,
>> +				void *array)
>> +{
>> +	struct scmi_iterator_ops ops = {
>> +		.prepare_message = iter_misc_syslog_prepare_message,
>> +		.update_state = iter_misc_syslog_update_state,
>> +		.process_response = iter_misc_syslog_process_response,
>> +	};
>> +	struct scmi_imx_misc_syslog_ipriv ipriv = {
>> +		.array = array,
>> +		.size = size,
>> +	};
>> +	void *iter;
>> +
>> +	if (!array || !size || !*size)
>> +		return -EINVAL;
>> +
>> +	iter = ph->hops->iter_response_init(ph, &ops, *size, SCMI_IMX_MISC_SYSLOG,
>> +					    sizeof(struct scmi_imx_misc_syslog_in),
>> +					    &ipriv);
>> +	if (IS_ERR(iter))
>> +		return PTR_ERR(iter);
>> +
>
>Handle NOT_SUPPORTED if not mandatory, may need update to the document to
>add NOT_SUPPORTED as return value. Currently it's only success in which
>case you don't need any error handling at all ????.

Current imx-sm firmware implemented this API, but indeed it is optional, need
to handle NOT_SUPPORTED.

>
>> +	return ph->hops->iter_response_run(iter);
>> +}
>> +	uint32_t deverrlog;
>
>s/uint32_t/u32/ for consistency ? Just look above 3-4 line e.g.

Fix in V4

Thanks,
Peng

>
>-- 
>Regards,
>Sudeep

