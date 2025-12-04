Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC7BD1D89D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 09:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FwHMACL8I2vUWXgFvKC3EzhaNkrzQ7URykbo4F7+P4E=; b=uYXCgA5haCgau6iQ0G+YYnsafn
	BGCjwSMqVbIslwh5q8OCV3xR9/zxqEK9QfNDKGjeNTqMjQNEIUjxvnoWbvv/7kA1TdVblnUekFyjs
	U5aMUqBeTkd9va7+JV5yoj2+HY8mMTKyicuX0u6LbevA4c1rREuni5f/pghaSG/X18jqePNP58JZB
	Xu64hXV7yOh21pfflaUPwMWSe8stVeoCC4igHOB6I6d1VzpFOv1guUItw1QINPOvN/m2G1k70pk5o
	AhYV+9ludblz0QQf18xhSIcEblP/ZxoN2rCLkNS/AXK5NCUAXdCIx6He7a6ShvZCQVB2OnLeX2rcb
	UvLmLFXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR5ML-00000007jy3-06JR;
	Thu, 04 Dec 2025 09:10:45 +0000
Received: from mail-francecentralazon11013057.outbound.protection.outlook.com ([40.107.162.57] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR5MI-00000007jwh-0gLb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 09:10:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nv1d1zFTX4gEGB3RofknHH6waoMPHQY3gEOhyQzaDtoCMb0xDN8ithHlDLcp9upHMzxSA3/ILvZVxr0SiN2Y02mTfX7sgPcSFVTX7Roj90ZF0x8z3dB4WVC9a995WEkTMyUs2bEPRrrVuCrTIN6c7v3AU68FG8Gd68FK9pNiM1IRuK1Ohb+qVUGla/Oq6P0s2AB+laJ9Xw2yk4eU27ZnoA9f6m3nPaLmtIm9fdCVn/vh3IVWF3ztZ68zdPH1M35mom27He8+idvbZ89JhoDxhNQXJubpzT5RRgqRYjToF9ohVL5JuhIxcPBCQzAZFKoi57mwajOCmIcyjgmMHaiRMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FwHMACL8I2vUWXgFvKC3EzhaNkrzQ7URykbo4F7+P4E=;
 b=P4SLNJBi0P8mTHby1CzPfp5FD+Esed5TDjxiP3ITx5Ny9UnZJE/yOGuYOUvaNAsWdTC9LkNPc1jRmtXP588YzTUI/BBJejltaBboMFQfla8PfpbAtmX6ZVWnzV2ppg7dyv/b61SPD7/6zgpWDIfgV86ZVoDDARFLVax3qpjW+E/YetabRKPts5cPhGAMvkxG+zAmYmLe7d/53m325UG5XMOKPK03FYYE3PwBt5Iilxl9bQSBpLO1GrehG7/If1UbeDs6nhHD9Uc+UnrF+4fiZcPuaOXOV+MlUCd1dlgarQktmgfKZkD4fLIO/qzTyDeBxXTIPRIxNyCo/AW62UM2PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FwHMACL8I2vUWXgFvKC3EzhaNkrzQ7URykbo4F7+P4E=;
 b=R95bP74wJ6wYdO5OLlbfZKcbY3QGR60rr4ufIB91UA1yddQlyUFVMmabSJepnRoNBRXv+zBE3SFAJMjyDi0I1VM8tM87G2YXolzgPAApjtJWCFKl6v8laBh5YKMTpYxGQjJHU/Q+kaYolrUSGTtKw2x7N/GXWGO0yiRSW7GZS490gicefjqwPd7deTKjxVwV5afV20ZVyaOx5bgI6581fjp+a426yuJ2CFkUVdEtRLXISwOWNPpezIN4iCTdAf5VIN458n/31KyAZO5Flnyens35mxhb+doGQdAYm6rNFm0PtR9Tj5euth0SbQpmfTG9JU0xNUNGzYQbhRjTMC70JA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by AS1PR04MB9558.eurprd04.prod.outlook.com (2603:10a6:20b:482::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.11; Thu, 4 Dec
 2025 09:10:36 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.9388.003; Thu, 4 Dec 2025
 09:10:36 +0000
From: ming.qian@oss.nxp.com
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	nicolas@ndufresne.ca,
	benjamin.gaignard@collabora.com,
	p.zabel@pengutronix.de,
	sebastian.fricke@collabora.com,
	shawnguo@kernel.org,
	ulf.hansson@linaro.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-imx@nxp.com,
	l.stach@pengutronix.de,
	Frank.li@nxp.com,
	peng.fan@nxp.com,
	eagle.zhou@nxp.com,
	imx@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 2/3] pmdomain: imx8m-blk-ctrl: Remove separate rst and clk mask for 8mq vpu
Date: Thu,  4 Dec 2025 17:08:10 +0800
Message-ID: <20251204090813.595-2-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.48.1.windows.1
In-Reply-To: <20251204090813.595-1-ming.qian@oss.nxp.com>
References: <20251204090813.595-1-ming.qian@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0113.apcprd03.prod.outlook.com
 (2603:1096:4:91::17) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|AS1PR04MB9558:EE_
X-MS-Office365-Filtering-Correlation-Id: 95e692a1-2a97-4c81-ed90-08de3314fc8a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?g6xDpacTPOownp9DdIzlgsfjbwVtteUEtCkxfNF4wBkKIRqZROXhtHsE0OJU?=
 =?us-ascii?Q?Ejzz2C/hEco+JYvEGLlT6QeE8mhxnfl6uofzGz57nFI9FPqPo1Nn+UqNNCY0?=
 =?us-ascii?Q?wJjfWpwDNdFJ48ksAxC3BKhNJ+LUgE/c67fy68OOSJtJpl1mF0qH2baRgbF6?=
 =?us-ascii?Q?B8fDuy/ADIqkNeNKmNIFWVjI1rA8Iuipsano+6Qu8C7OFo0+up6D6nkmgzm+?=
 =?us-ascii?Q?FaZxn+O0bFK3YwrU4t/GFHAIAqcdB7YBCancMyqowJxDJSrkHUlvvARh+6jv?=
 =?us-ascii?Q?zF7rVXZlZo/GfKcHcFkbBP2PNmKp5VxvHtQNGmy8Once+hafISR+GwybQ7GY?=
 =?us-ascii?Q?te4R5t8H763XvovQssAgiqaxIR7PBrVd+GCoFdyCd5U5ReNLWIZPH3pktExu?=
 =?us-ascii?Q?krOkwduzW1EvFNKeWMPfN1Pew75vUwviyRu0c/p+jsCSL+sDcrPY7WRNqSlR?=
 =?us-ascii?Q?QPDYzSxab9u7R/mEyvyzYNOlMkUXpKH+1U66xBCCzjNZNE8/2SbUA4aH3stD?=
 =?us-ascii?Q?cOFPovmfAMsH1DxLY5U+gNkYTLlso9Ceh2NFanaDxZP9+J68guLituLon7V0?=
 =?us-ascii?Q?SOMoTWptfYZU5daHCMP5NBMeIaxqu2X2Zrjn7pFMV9+lzJzSI0j0mZl8l/LC?=
 =?us-ascii?Q?VatluzySUYyvrPBdxcszb62ssMEldxH4wxep7Hkqicenp7X9KAMTA6PMQx+H?=
 =?us-ascii?Q?41WMuAhEsSvsjdfvbdzM5FTAWIcmM4Q9nyU9tw9eTEoWm08DQPSMIaORN9Vf?=
 =?us-ascii?Q?8sQ8WRZaahNpLdbidJpfYtyBwRRFIho3op26Zg1MsvIyLTLml02C4EyGsPy7?=
 =?us-ascii?Q?hqzcmSM+jSNt8PkEhWFoqGs0nSZqoA9PPT2nKwUDNiZnTFU/V1BxVAFDf4pj?=
 =?us-ascii?Q?0hzp+cYCPUAB1g3wuGuRgPLPB0UqAtHIJSE6svs21kRdi2+OkOSRDsvMDF/i?=
 =?us-ascii?Q?ojRQIgLLXa6MZ/bNpYMv1TysD1kIfo9IfYw50lp2IkYdkrc2uXV5qgFLDKX6?=
 =?us-ascii?Q?VWMzsZO5jQF6836FIjrYKuEt4LfvbL19t+rki/w9DtNChGXb5ui7gTYgVw6s?=
 =?us-ascii?Q?RBUMiWec0lZm0yzJiMyNW+H/PFsANvGLIvnEj/X4qZulKjp6Re0qUl7Wy6Bi?=
 =?us-ascii?Q?LcP8o7ppTm2SOeyoM+7Lnbpc9J6koPWPtDdb/8Ea1K7Rrth8GLrVipkZrzQA?=
 =?us-ascii?Q?B9PRHQYiB5uX+fvDNabWsLPErGQy+C4cPF/XWzuAmbfUreQnRY8xNLma+ffC?=
 =?us-ascii?Q?CoYZ5SA1MMbUAiVHryj6/CofHVoAskqTqlIA6HFJ4HGEkstkzOPthp45eMb7?=
 =?us-ascii?Q?Xn1MM8cArQG0yl3H5usdwfNHkzRd+xr8FETXtPvFV8RBDcS+J3JlkkA0FNNe?=
 =?us-ascii?Q?6oK9Yg8wtzRJSoDGrIMrzX6kkXEdPLavXeycjnOQMndA8x26GzdBpVHbq3T2?=
 =?us-ascii?Q?Z0vslYAvph+ctgTnWbaiN4bFDafh8kvsiqwf2m2eGZVxbfMZfbU29MlOrLRU?=
 =?us-ascii?Q?v5PgjFzLAsUtz0Obp6LEqBJu784IkZR9jrzn?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0I1QjC1ljzEqJavS+E66I0l3+9dIzcR24f75E3Ba86G5LMmg1CMBeauExiae?=
 =?us-ascii?Q?ZBQmhtWkITE6v7XK5RmpUecwdnPJDBFIEQ7nb3oZZQRSzNQDnXmMdmVg3UaK?=
 =?us-ascii?Q?pR4m6oIo5xLCxmKcPkBMXtWiqp78gZnrlV/ZnmFCm6sk064GUXDA6alWpZaK?=
 =?us-ascii?Q?nyKWcEMP59xlne+ExrbFCoeRajEwyBbFkfAUnMdvpMQ1EsuJMHvjGMgK5H8A?=
 =?us-ascii?Q?g0uaCiG2neWGO/fS4vhAY0QilntkWDkhMf3Ii2k3DE/bvRnASUqliIHetGwL?=
 =?us-ascii?Q?TAy84XTL6WNKDaX5Q51uRAUUDB/FG1w7/5/mFXh3cI9GTqWi0D1zoNkJgb0m?=
 =?us-ascii?Q?zFHnxqGUhjIRzZEfclHBShdAmU0Xxqmu4FpG7vjUJX7iqyH0Ny+bbWTASZ2X?=
 =?us-ascii?Q?oZxkFSkv7+MesuK1c4Fw6czkGJP1c96i5pWJpI/wSFDt1Z4RJTyFHjMRZsb3?=
 =?us-ascii?Q?YYuy9QF82USGXHE1GFrUI49BEQ8tlD0cGP2EAgoEitYosEPhJPN48RFDCz8l?=
 =?us-ascii?Q?obgQNdU7x2Oq267ci4eDph9Mbob/3GGQplw20VEQNbfBPfyI4uLtsNGWsrFT?=
 =?us-ascii?Q?KagejdybqzStNskn3UXs7I9xCwztgqhZUgG9UJ8GNsxuOzD5IJowvLWhK7vz?=
 =?us-ascii?Q?aL+3/1TUqMiVVQ/GJqufXngn8rHFkL2+3EB81IL5eZ2NxS8LecYxzlNP9pNX?=
 =?us-ascii?Q?BrIY0cs371R5l/tHU9zedmt5VIM9krihVki5dqnb3Cm/ZNcO7GmDaLxQUMKH?=
 =?us-ascii?Q?E/opX9Fi6Nm2P7EmPeRbt64WNFxF3uSVEHEUfx5u/AGi6dvu2Q0PYHMT8ofs?=
 =?us-ascii?Q?x39HtEx0UcdTdJm75f9Pi54/o2ZISkaFm0MA5UYdtT4ahyJdbjBgHO+9A9pE?=
 =?us-ascii?Q?vUf0CnO4C15e+7Dg7JgdWuISleMxy8hZ54kbnuLe8Nrm8NeZmSS6gXy10oRX?=
 =?us-ascii?Q?gORJkKsFPcA0n1pwOkFNVziRknVRLOUZwOfIofpoY1wGXEu/wZ0cOYosBHUw?=
 =?us-ascii?Q?OhT8G+hRe+UunOrY8UwDX5MnsUv2iucKmpyqYWobVjHugps/IwvDNNfdh64R?=
 =?us-ascii?Q?7tEJZa20y3OHxPLEp/TsEL4dS4DBTV9cScO0YqOq8SwErOw7g3KlMD+dyFpj?=
 =?us-ascii?Q?+u2GKmRnImOg5wEzsKWzjeJIBokfKPAUhM/HGvLMaD/V/ffSFI2sfFWoDnFj?=
 =?us-ascii?Q?iOn0jylbsJgYRPtpqziD6Toj9YTmSdVNCjWxhDMDZLQST4uvCKPnR2QTQHtn?=
 =?us-ascii?Q?vJ+UT3QRktRzc9CQzhauweplivbnzRlmK8MW8AXdWOE9fCPeyv8JQKtks2sn?=
 =?us-ascii?Q?MQIndLNUIiLfk3vQw6WwZ2jNplO9u/MYV0Truov5JlEe+F1BIm7WLE5psLYl?=
 =?us-ascii?Q?2lWIZJxr0YLeJmppOvu9A+i6+Uj5kJ6fUCQygiSRf7EtB6qxSWO46mr4Eeio?=
 =?us-ascii?Q?mjbVgn9eNeT9XZKdFgxXS1VwvP4Xe7z8s44F/vDZYsPp2bFEOtra16nv631f?=
 =?us-ascii?Q?x7fEGZ12kk935GJnBTXl08kjRDb1tUM+/UKr+cRgGMY7kLgARGas+cyEJlpm?=
 =?us-ascii?Q?Kb3/kabP78B+t5J20VaSfgGFnoM1MAe59Tm5Ud9G?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95e692a1-2a97-4c81-ed90-08de3314fc8a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 09:10:36.5537
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2V8P/QvhDVgUsxV4s3ktMoa9u+6PQlcOIaGlI5Q7miXctKngSX6teRpiOTjFbclFLqjOVyHRUhQBzgQ7HxP5DA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9558
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_011042_202972_73F0801B 
X-CRM114-Status: GOOD (  11.01  )
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

From: Ming Qian <ming.qian@oss.nxp.com>

For i.MX8MQ platform, the ADB in the VPUMIX domain has no separate reset
and clock enable bits, but is ungated and reset together with the VPUs.
So we can't reset G1 or G2 separately, it may led to the system hang.
Remove rst_mask and clk_mask of imx8mq_vpu_blk_ctl_domain_data.
Let imx8mq_vpu_power_notifier() do really vpu reset.

Fixes: 608d7c325e85 ("soc: imx: imx8m-blk-ctrl: add i.MX8MQ VPU blk-ctrl")
Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
Reviewed-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
---
v3
- Add some comments
v2
- Update commit message

 drivers/pmdomain/imx/imx8m-blk-ctrl.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/pmdomain/imx/imx8m-blk-ctrl.c b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
index 5c83e5599f1e..74bf4936991d 100644
--- a/drivers/pmdomain/imx/imx8m-blk-ctrl.c
+++ b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
@@ -846,22 +846,25 @@ static int imx8mq_vpu_power_notifier(struct notifier_block *nb,
 	return NOTIFY_OK;
 }
 
+/*
+ * For i.MX8MQ, the ADB in the VPUMIX domain has no separate reset and clock
+ * enable bits, but is ungated and reset together with the VPUs.
+ * Resetting G1 or G2 separately may led to system hang.
+ * Remove the rst_mask and clk_mask from the domain data of G1 and G2,
+ * Let imx8mq_vpu_power_notifier() do really vpu reset.
+ */
 static const struct imx8m_blk_ctrl_domain_data imx8mq_vpu_blk_ctl_domain_data[] = {
 	[IMX8MQ_VPUBLK_PD_G1] = {
 		.name = "vpublk-g1",
 		.clk_names = (const char *[]){ "g1", },
 		.num_clks = 1,
 		.gpc_name = "g1",
-		.rst_mask = BIT(1),
-		.clk_mask = BIT(1),
 	},
 	[IMX8MQ_VPUBLK_PD_G2] = {
 		.name = "vpublk-g2",
 		.clk_names = (const char *[]){ "g2", },
 		.num_clks = 1,
 		.gpc_name = "g2",
-		.rst_mask = BIT(0),
-		.clk_mask = BIT(0),
 	},
 };
 
-- 
2.52.0


