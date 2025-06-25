Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98A49C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 02:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	Content-Transfer-Encoding:Content-Type:Message-Id:Date:Subject:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OT6E4PwdM1LZkbARUw2ujeBc4NoaZY/UNj3YgOexBIw=; b=3lFtzPAyAVEzkh2qSls/UZ5KWp
	drP8l0Wr+QbtRPNcOvfZ8BHD1Fju9XMEXZD70a/p20wGSB3O7x+lLXM4+tzO0va8Jphive1OPi1rI
	vDiyolx4hcsqTpLPyMxoSg+hoUf6NHHSgV2JiX1hCjHRGC1J4ycGu5M3jegktC/cNbJYnQZ6qDGWk
	vT8wHmZIBBPq4caP/6n/Ej/rtQt7/nr3r6yrFvfQ+7+5AR8uoZqXZvZsvAlTmRzRgRxbmcDbVUVaY
	J/tTfEfSNtW1jR2H8mc7b8Dyriq7j/WCJ8Vfvdbha8d7cF4Xc0sGUnaUmakjI1sPtZl84Vg+oXHbe
	xgUECS5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUFrd-00000007KW3-3hNM;
	Wed, 25 Jun 2025 02:27:53 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUFpK-00000007KB3-0ksA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 02:25:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iYAwuB+xy5X1lVJdCjS7VZC4/z5fzFFcHFhIHl3qfxYcAGEcxcGhpIiha0JLGnMtku1nbM7lmPyvC+rOInBsHjd/zRCsxD+Hw448ZyYh2IuciYHio+PhP/cgoG/z6vGf+0TL7eS73l/fbIXuTRc0vs9rpX2dp4vQ0H2gqN53V45rTqKf3CgDUGxsNXk+RKwDoQHCgvK9qGwfe+zo6DyymJbBtW+ETtS16ACpO2BtP6hPTSLjzKmH9M4ue45AaEH1nRf1DGU1hTclTJHQC36ugKrObq4Csay/Q2nmAN0tBj72FbWmb7RS/pjEouBg293FiDQ/Npejg0cgtdx4LBBkGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OT6E4PwdM1LZkbARUw2ujeBc4NoaZY/UNj3YgOexBIw=;
 b=neYpSt2FDUw6ADtRO5qMzkj/M/q9BIeDkEr0N8zGzfMva8Y/+3vif3Imn8D9XPEGSqWI8O34gyAcO6fsZWKw64wp+lxgaeFFovAgIKEhzhN87qnt2hMmrxCi9ZJ9uu4lPh38xbEaw+Wwli+uB05arsgwlipA/KY1yRFOCDtSfdN1qWP007Wu4kzFvjceaxkuKcIAgj1zBwj7oPPDrgglK3LjpGViaHtvyrbPKIXOcA3BHsw8mN+BVVG8f/OKuzhKMucs8iWqZyBgGTx5rgcxidYCwvUPnqM2vanm8Eo8tA5IARV/SvF0UPhiwsShP5ai7nwCU4jcqzAfibK47NKh/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OT6E4PwdM1LZkbARUw2ujeBc4NoaZY/UNj3YgOexBIw=;
 b=hTx+WLef7sJsxu3+IXUlEo2bCTHg758nObajJCIpoW0eIUNqOh8tiBME/lhnp1yyrVRcS3liN0TWmoMe9OeQauJ+V/AbvnI4qn5sUuowar7mLsLP7A2GnuZt2wzkph0uRo3f/D9ml+M4NXpTDV+SL8YvXISRJBHufL1Wbx1LzrEp3JGF9an8H5tN2EMYlkCdIi158x2tcMey+fbJu4rLardub9g8Cxxpsq0GODHtE0YdM5VEkwlJtarKXMnwLVzyR6wrs0JWHuvup/LgNSkudMtzmmq/yPi82bsIcOekdVfOBB8Fm84dZ9GyDsR6VRzeR7zT6ratauZZyDwPB5Jw2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS5PR04MB10042.eurprd04.prod.outlook.com (2603:10a6:20b:67e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Wed, 25 Jun
 2025 02:25:18 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 02:25:17 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH v3 0/5] remoteproc: imx_rproc: Support i.MX95
Date: Wed, 25 Jun 2025 10:23:26 +0800
Message-Id: <20250625-imx95-rproc-1-v3-0-699031f5926d@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ9dW2gC/2XNSw6CMBSF4a2Qjq1pb1/gyH0YB/SBdAAlrSEYw
 t4tOBBxeG7y/XdGyUXvEroUM4pu9MmHPg92KpBp6/7hsLd5IyAgiACBfTdVAschBoMpBqK14ta
 asm5QNkN0jZ+23u2ed+vTM8TXlh/pev2UJOGH0kgxwbV0ohEUFKPm2k/D2YQOrZ0R9lYeLawWt
 JWcs1K76teynYW/vyxbrqVpKFGCKvu1y7K8Ae5aRnUgAQAA
X-Change-ID: 20250525-imx95-rproc-1-20bb74ddc8af
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Iuliana Prodan <iuliana.prodan@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750818218; l=3104;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=hufObx1Hy38Z5vQpCf4nP0YlPqFw0Hm2s4UZCT3Cv9o=;
 b=ZdQoCfCPR6DtFNJlLkhniFojHShxdF+HQ6/Zqmtjlewpjgo/UAKnxxE+pazf1M4u2pDqXQYcI
 /k+0y0JnjguDanumqCFvqrvU9xpa5U+l9gRCy/6ol8qiNMIawbJd+vc
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: MA1P287CA0023.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::28) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS5PR04MB10042:EE_
X-MS-Office365-Filtering-Correlation-Id: 891267a3-f565-42d5-840e-08ddb38f8644
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YlJiMzgrNEEvb3lpVTU1OCs0WFlwVFl1Nm1hWHJOZ1JvaWxWZm9xTnhPTDRv?=
 =?utf-8?B?cnEyNENtV2IwZDhFYk9CQVhMTEs0aVA3cGR6Y1duNzYyWWl3aitqY0ZiUlV2?=
 =?utf-8?B?TW9iKzJQVVhiR25XTkVVTDJ2YXJnUnhMWWJQWkh6T0VhT291OGtXa01KNnVw?=
 =?utf-8?B?RnZ6U2lPemd5Ni9jdW41ZEdYbFhJZFlJcEYrM2NNQi9zb1VDNVQ4Sm9iUVRs?=
 =?utf-8?B?WmIvUVRCRFVrOGY4cUFvUzZ1WEpkblQzUitjMDJ2WDRVNlRyNDVhSm5EdEJM?=
 =?utf-8?B?czdSQjdhbi9GeGM4c3M0Wjg4Zkl2NWQ4SFBUUlc3S25ndXpLV29pU0NsMm1p?=
 =?utf-8?B?KzMyRG9wd2lyTy92Q1czelA2NGI1bS9VWDRVY0NSOEFvcGNoZ0xKMGNka3ZV?=
 =?utf-8?B?TXRYOUdETDk5Y3IyQVZBQVBscnpSNWRNUW85VkJiNU5qbWxUSXRIUFFUVjVo?=
 =?utf-8?B?TlpqcjNEdi9CMDg0QnRMMjZKNVJsZlRraVJsb0FPekFUWWorRnlYOVE5blda?=
 =?utf-8?B?QW5JWFlVOTB0OU53UE1Pc0k2TVZhODUzZkpHVUIwNHg3NFU4YlVVS1BTaFRI?=
 =?utf-8?B?elNaNnNmS0xwVDVreGkxMHhyK2RqU05yY0pkU0RHQkNJcHpkUVdqT0FpaE10?=
 =?utf-8?B?NVNsWVR5eldHR1pYWEF6Tmk5aElZMzA0cmZpRm83WW9xaFg5QWYzUm9zQi9M?=
 =?utf-8?B?cktFSU9PVG1qcUthVTl5OXJZSDI3Ykx0RlhVUUROYkdwLzBWM3dvbEw1SUZo?=
 =?utf-8?B?WEMyOGxLVXdkTFAvdFFDYU1rMFRFcEUrRzJkMEJoZEJIeVNTbi9WSFdZK1hn?=
 =?utf-8?B?Q2xFRG9Nc2t6ck53VmtieEIyVGE5d2QvREljZzBkbWlCSEUvWTZ0RHA4ZUNT?=
 =?utf-8?B?aVRsWDcrbUtOU0lrS3p3aHNBTVlSRVNlNGtIYXNFYTdvcmNieGtrcDMwZDA4?=
 =?utf-8?B?TE14OGJzZmo5VXcvQUQwSGFjV3orUkRIVnhjWHhGeHNtdUI5RzhYL29CNmpt?=
 =?utf-8?B?Y21yS3ZpalJrYW9keTlDN1lYSEZweDU1UVptdUd6OXZGK25DS1ZGZWRYc1JN?=
 =?utf-8?B?RkFzVFNoZzh3MUtUK1JrRDltS0thY2drVnovSmhpQ3ZLaC9CdWhVT0VQdUdw?=
 =?utf-8?B?OGxVSUx4NjFJVmFDazNuTWVDc0oydk9zYkxMdHdXQlhJeTJZUG5zTDVsZENp?=
 =?utf-8?B?MEtFNEdCV2FhM3NGTHVuMHJ4RHZ4TENTYkV6RTZOQ3IyOUUzanpOYnBxRDZ5?=
 =?utf-8?B?TUJOWHZVY0VkV0pIeWhmQnYyalRWOWF4eDRyRG50Z0RvNDRqTTUrc2I3aklF?=
 =?utf-8?B?VnZQaVRNQi9LZE1RVEUwaWJoVHhaclZoYzJOcHpPWk41RzZIYTBBSzNtZENp?=
 =?utf-8?B?NkJpMWd1N3I0bnRuSWk2TFFyNjUzRVdsL1lmRmI1WW85eEJ6aHlDK1Y3Mmdk?=
 =?utf-8?B?YUxsa3o0ak9BNlAzazU2clRFTm0vd0FkZC9TR0ZqYmtUOGN1RS9EaWdQK3Bw?=
 =?utf-8?B?djQ1UzdSOWZYRE5Pd1FHa21QQnIvTjJPdzNCbEVMQUV4cjlVS3RzWEdrNVNC?=
 =?utf-8?B?YlQ4VmZRVk0wM256eEJzV09La21Xb0tMYmVNNEVPTVlLN0xTWVJQZnhIc1JJ?=
 =?utf-8?B?SFdqNWRhU1lsdjhQVkJYRTNWcUJOdEVTNUQ2OUl2RVhPUTdWRldzNmQwVzBK?=
 =?utf-8?B?c1pyVE5JU1pVeGhJN0dnaHlBc1BjTTBLOXJvVFJLMmhWM2ppSWpoWjh6cnBN?=
 =?utf-8?B?NFlqMS9wQVVUK205RVdLR295VHRtalQwdVA0M2NXRlM4cjNadWNxOE5HTXlI?=
 =?utf-8?B?dnhqU2htNFhXZ2o5M2QwV0tvOHFNSEJDRVhEa3hTRjFVZVF2eXdvQW9zcVBG?=
 =?utf-8?B?RDc3QnNsNGtIR1doMUxkL2paaTZsUXNwRXNubXBmTDVpN3lpTHJMR2xYZjdZ?=
 =?utf-8?B?Q1NCWXB5cEhzbmUyQzlSZHJ3bFZRQ1paeHdKaWlTMVRzaFJJM01raVd5NjRO?=
 =?utf-8?B?eVJJc1BBZE9pVkVqMmJ4UHlSOGN3SGVpQXFKWmF6R1JIblFENFNKZXlWb3dB?=
 =?utf-8?Q?C57hHh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cysybGZVcU9mYyt0YllUelIrcjN3MWN1TTBVOUYvOXZPN1VQOUV2WmxyWWNE?=
 =?utf-8?B?M0N4WnJXU2d6WUMzVzkyTTlTRzJkYnJpdkJtNGJQNnRSakJlRzFPYWw5YjM0?=
 =?utf-8?B?b3Y5aVNXdE14TVhOY2RyZ25QdGx3TkxEemcyMXVEb3h0V25QSEhoeEdPQTJX?=
 =?utf-8?B?OGNlVkM1Z09XR3hsL0pRdlpPUGE3SEdrS0t5WXZ2d1hzNUcvV3JKREdVV01k?=
 =?utf-8?B?NXRFVEdJcURSRkhHdG1jeWVuYWRYNzBhS2VTUGxwamFVc1JVL0pGNGdyUFlD?=
 =?utf-8?B?MzlsQTgrN2o2MzJ6WHFWYlhURDlzU2FBSDJJa2t6NE5YKzZ0Z1YrMHBLR2xx?=
 =?utf-8?B?VWF4UmNXU1VlYVNQZGdFaDFsSWpsQUY4d29FYjhuUEErS2pIQXIrRHhDazZj?=
 =?utf-8?B?cWxwU0tpeUxUWTNCdk9iWW0xOExQVU8vM2ZZYmRoaGFtMU5FbGREdHJ2dkln?=
 =?utf-8?B?Z1hlVnFtamtYM3ZTL3hoM1JZbUlhM1FaTWRuUytya3lUV2dUdEYyRm53ZkMy?=
 =?utf-8?B?cXE4OG5YbWZZb0NockNqOGlBalRyRXRRRE9xV1I4R0lSZ0xIa1VmQjFyNVRm?=
 =?utf-8?B?WWk4Q1NYaW9aQzczSGNQR2l4eUUwMGFPNmlNdXM3V2dmWlhhTHZCTTl4VHVx?=
 =?utf-8?B?NEVHZ3RNZEltUWwyaHlHQmdZUzJ4MVRrcU0yZXY0VGg5TG5YY2tkd25ZMnho?=
 =?utf-8?B?YmdTRWJGWnR4YmZEcHNPcDlvdkc2a2tlTi9IQzBKcEhNanhNZmVuL21pNGRU?=
 =?utf-8?B?UE01M3NBQkVFQlg1UFB1d1h1eWcrOUh3enNsMktUazBUU3BEYm0rcER5Y2tQ?=
 =?utf-8?B?R3EveVYxYVZIeGMvc1U5Z1J0dWt6NkoxeVpzMWdzUVoxblM5aXY5eW13a0l5?=
 =?utf-8?B?REcxSGVnTHFVQmdGNkxTNGJBdmszdlVENXErUTFpT1lvTWE3Q1JMdFpYM0VC?=
 =?utf-8?B?eTNrdFRVcWI5T1Q0aXFwNDB4eFF5SmFlOTIvRFVQdU1PNlZPVG9hVW4rdit5?=
 =?utf-8?B?ZlhBUVlSVFFrUW9uYm9pT2lnV0RaYk9WQ2hMcmZlL3U4V0FqeHVaa0RscGp5?=
 =?utf-8?B?SjNuUW1KY2ZVd0RCVUxxdHk0aWI3TkZlUEFBeVk1dW1pTUJxNDZNRVJkdEpR?=
 =?utf-8?B?WVJxb3lDeTJucVMxUWtEQ0pTcTZ6SjU2NTZsZklkOEMyaUFreVJxN0Q3N3Fj?=
 =?utf-8?B?bUd1blJBcVpYQjlIU3cxcXNZQUx1aGoyTlIvUVJnZUtSNXJhemtuNks5ZTJz?=
 =?utf-8?B?U2NQdU84MlRhQ1BGdFQvVUxmWlk5YzJTWkg5NnhKc0ZpalhHVGVxazUwL2ZF?=
 =?utf-8?B?WVhnckhwakpDVjhHbkhCc3duV3BjTmF1Rk5JZFBZN3VMa3JFQ3BsV1JXL2RT?=
 =?utf-8?B?KzBuZTB0dTNBQm1CS2VFZHZUekttY0FjcU1lUTA4a2dEYnFLWkVLU2ExMTZD?=
 =?utf-8?B?dFVyNFcwNEIwdTh4Q3hST0VlaHF3Mno0K3JRdXZENjZndzV4ZGRGWlZwS3Zi?=
 =?utf-8?B?YWcwWXZ6R1dmMHN4WDlxczFiSjRmSjdYZXVxWnBsNmRLVy9RMXZ6dGc1VkFw?=
 =?utf-8?B?QnN6S1FpbmMxNDF2bzFYQTBJd21VY0NTa1ZjV1BjQzFTazZqWWxuSDdVZWYv?=
 =?utf-8?B?aTg1b1BwMC8wSVI3YWpraXZpR3hnaTVTQUc1dWlSSkJUK3VadkwxL1R2MlJG?=
 =?utf-8?B?Um9qWFJiVTBYa3VHbHpWQVdGT3FRNHUwREpoc0x6UUlZcVUzTURRajAzbXVj?=
 =?utf-8?B?bTRMTVlwU3FPd09JZG8vcVA2TXRwRHdJQmNCeWljZStVa2ljSVJhbzM5S0ZK?=
 =?utf-8?B?aTdTZHR5UDd1eHBRQTl1OEQ0QlpEbTRGcEZ4YThOeFRMYjZ2NUxnTVpXL3hz?=
 =?utf-8?B?YlJ0TWlBSm1wVUptN0RRSzEvbllUMEYyemNwelpNdDdoVFBuR0hIbVlrS2No?=
 =?utf-8?B?Ymd1V2VOQks4WUJQV0l6VVhIM2NzZHZadGlMUE1FVmM4Y3VRSk1oRm4xdDBL?=
 =?utf-8?B?enNWdUpwTW9xYXFMUUtMckpsa3d4cWx6aEFZc295c21GTDVpa09Cdndzdnp3?=
 =?utf-8?B?bVFsUW01bUxTOTRaRE5obkIySzcwL2NURVFxNjNqU1NNdVBjT2xXOTdOaGIr?=
 =?utf-8?Q?edkBjZMCESKaeZFUaAVDWAgEA?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 891267a3-f565-42d5-840e-08ddb38f8644
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 02:25:17.2279
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TjFwA232sGGB0r9I1M7A3XZLlZpIebUWC3XZzxeMzJlRzbAPlnPWlDhMUALAIVXTr0teV9Ou0DeMg7yJ9MvrLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB10042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_192530_239978_AA5E32FB 
X-CRM114-Status: GOOD (  15.20  )
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

i.MX95 features a Cortex-M33 core, six Cortex-A55 cores, and
one Cortex-M7 core. The System Control Management Interface(SCMI)
firmware runs on the M33 core. The i.MX95 SCMI firmware named System
Manager(SM) includes vendor extension protocols, Logical Machine
Management(LMM) protocol and CPU protocol and etc.

There are three cases for M7:
(1) M7 in a separate Logical Machine(LM) that Linux couldn't control it.
(2) M7 in a separate Logical Machine that Linux could control it using
    LMM protocol
(3) M7 runs in same Logical Machine as A55, so Linux could control it
    using CPU protocol

In patch 2, Use LMM and CPU protocol to manage M7. More info could be
found in the patch commit log

Current setup relies on pre-Linux software(U-Boot) to do
M7 TCM ECC initialization. In future, we could add the support in Linux
to decouple U-Boot and Linux.

Patchset was tested with below boot images when the patchset based on next-20250526:
imx-boot-variant-rpmsg-imx95-19x19-lpddr5-evk-sd.bin-flash_lpboot_sm_a55 (Use LMM protocol)
imx-boot-variant-alt-imx95-19x19-lpddr5-evk-sd.bin-flash_alt (Use CPU protocol)
imx-boot-imx95-19x19-lpddr5-evk-sd.bin-flash_a55 (M7 not under A55 control)
imx-boot-imx95-19x19-lpddr5-evk-sd.bin-flash_all (M7 not under A55 control)

Patchset was tested again with rebase on next-20250623

Patchset is re-based on next-20250603.

Thanks for Daniel/Frank helping review the patchset before posting out to list.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Changes in v3:
- Drop fsl,lmm-id and fsl,cpu-id for binding in patch 1
- Add lmid and cpuid in driver patch 2.
- Add i.MX95 lmid and cpuid in patch 3
- Rebased to linux-next-6-23 and tested with this new rebased version
- Add dtsi/dts patch 4,5 to give people a view on how it is used per Krzysztof
- Daniel's R-b are still kept after talk with Daniel
- Link to v2: https://lore.kernel.org/r/20250606-imx95-rproc-1-v2-0-a2bd64438be9@nxp.com

Changes in v2:
- Typo fix in patch 2 commit message
- Move the m7 address mapping array from patch 2 to patch 3
- Add R-b from Daniel to patch 3
- Link to v1: https://lore.kernel.org/r/20250604-imx95-rproc-1-v1-0-a6e5f512731c@nxp.com

---
Peng Fan (5):
      dt-bindings: remoteproc: fsl,imx-rproc: Add support for i.MX95
      remoteproc: imx_rproc: Add support for System Manager API
      remoteproc: imx_rproc: Add support for i.MX95
      arm64: dts: imx95: Add SCMI LMM/CPU nodes
      arm64: dts: imx95-19x19-evk: Add CM7 nodes and vdev related memory regions

 .../bindings/remoteproc/fsl,imx-rproc.yaml         |   1 +
 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts  |  45 +++++++
 arch/arm64/boot/dts/freescale/imx95.dtsi           |   8 ++
 drivers/remoteproc/imx_rproc.c                     | 138 ++++++++++++++++++++-
 drivers/remoteproc/imx_rproc.h                     |   5 +
 5 files changed, 195 insertions(+), 2 deletions(-)
---
base-commit: fda740558acb4303fcf377e5cf9139f795b1d85b
change-id: 20250525-imx95-rproc-1-20bb74ddc8af

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>


