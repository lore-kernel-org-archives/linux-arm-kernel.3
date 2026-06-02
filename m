Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EEE1CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 16:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gh85EoJo6pELRM+1xeT1YdAErpxBLmWdwPjc/LvX10E=; b=EvyYwTezjj4mSLyUnRsfn6iKso
	BcSCkIfcS6S6R2kMeIDl+Jz9g03zXIN4e2VLVCPv6Cnwd5iVhaE4X6rxYyh7gYFIjOEmKlD04v5Ve
	qQv+hvT8od1u2GjeuPX5fLcHB3qJQCpH+PEIgB1SbtT4hR9MZbXqETxkyRGjIC3EMi1FWTmc/GHxd
	8qhY4Gxjsg0u1OWQhZUReIcbYTVWQ4U41ZSknx9gBDvScEGSNf0hnc3MJDfHZwsKV9ADfvsd1zeeq
	A/grsgk5O5rVlGH+lnrOGtqLYpLkQbxo8uwEEUiraGQP6+HusC2y8CQ44CKD+95xwV0ZEZ8eILGYH
	Qb06/xlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUS7V-0000000DTE0-00m4;
	Tue, 02 Jun 2026 16:37:37 +0000
Received: from mail-westeuropeazon11011011.outbound.protection.outlook.com ([52.101.70.11] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUS7T-0000000DTD2-0nxX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 16:37:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eEgelJA98TlaNu+wU13wJsy6AOt0BaaNWamkhosLXXN3Gi24ihvKs8r+yxPBQWTui1LIAY/yBCv6FbHWjrABKbMeyLHh1DIE6ARy/HBBenlIqpsDe5pev+qmyDDcA+Eb0E7LccI7+2bqHF21ABLI28aKL5XdwCci2i+yq9BwLuSqN4qfdxgIEk4c976e5Ud353G8Gf7cEt1vixr4XKnR9OMZAjns/gEg/mMastesdUEdWd389r6cWeaD0SHInmB5nu1UwJ8lWQxjhdunllehlPN7/bCXw7OoTzWTiKo6VpgXU6TAjD4kJQBmv6k+FIYUlzVrVED2gjt1y9i0BWwovg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gh85EoJo6pELRM+1xeT1YdAErpxBLmWdwPjc/LvX10E=;
 b=RYj7TYvulipWvuUSgb6j4ph49RsVu+AHeeDGFnlobel1XGCSdmqQbxHDokN+bmDwqhSLGzLZk8Iiy6u2p5+AD9b4ruwmXdM67FvAzBcl3qFYBM1ej6h3rWN9HqrNCyV48a24a/3hi3MA29YWmVrhnx3DJ9e74vcSWpzmZZwLx6xkboSozh8bwoiM/1KlYe+tuYkeKIUFfPCHLgYmQ4ZRVEYFSx+6O+eBZpHql03p0c81/Ao9euSqzpVRRDXydR9MNabp4RwdSckP20qUZqrnqXy/atjXzM/Phz0jB0Qizq5J1h3hN9h0aKGQ+P4WGs2E/U9XUviZOycyxrLUxgHc8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gh85EoJo6pELRM+1xeT1YdAErpxBLmWdwPjc/LvX10E=;
 b=q97EAhAlSKnq399px4BAOTYXsPAJQTFyWFC1aNs+HKj1hCsMM2GCqcpKvZlaasYiItuhpDqWwrkZi05oO/0ADguDE4EBsIuvmXMe8FIS/6NSXX189O/+Q5NYtlSLyIngUDMEu3ukr7U9QljNnIUR6PPN+9Bz4a+I3sO71KIfmNQ5lFZqarm8VbwmwpYjA4VoycjEHY9PXlv9SPH0N3RHc3U6a+K1USjZA9TUEssvwGPoZ03+btj0YpP68E2HElITFrGn/Dzk3zC/G6S54K1Hc0ST7u9rS+OybxrbmB8lO6uYwSOs0DcIouJd/F+p9Rw7Bcofnw7pcbtkOLhdQlxegw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU2PR04MB9049.eurprd04.prod.outlook.com (2603:10a6:10:2e4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Tue, 2 Jun 2026
 16:37:31 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0092.006; Tue, 2 Jun 2026
 16:37:30 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Joseph Guo <qijian.guo@nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	xinyu.chen@nxp.com,
	qijian.guo@oss.nxp.com,
	justin.jiang@nxp.com,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v5 0/2] Add NXP FRDM-IMX95-PRO board support
Date: Tue,  2 Jun 2026 12:37:23 -0400
Message-ID: <178041823858.3298677.15592777075186697331.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260602-imx95_frdm_pro-v5-0-44ca5dc30a14@nxp.com>
References: <20260602-imx95_frdm_pro-v5-0-44ca5dc30a14@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7PR04CA0104.namprd04.prod.outlook.com
 (2603:10b6:806:122::19) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU2PR04MB9049:EE_
X-MS-Office365-Filtering-Correlation-Id: 189bd341-1595-481a-e21a-08dec0c53d58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|19092799006|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: ir1MBJhRJEd/sNNubpriC1WeOlbvX4x2Y1kCqO8AyoyVgeo8oUxGuZ8GTIeqJwsecLqdRi5jRKa9T8G/rUjykKOFPAWtCHsGV/nzOYdiwWGPu8t42nGiWZFYmUbJWqtALUmLTYb7cCLSvdpkqIPBcS2KPPLzR6SoSXOtv37N/kYudXrcUToAa7NVINkfSiHNcj2kDTR/8bc1HtB+ZGUOmatvZNP3wltATHy9MLgkTK6yoqklPYWpETBy/yZRR8EV722fDAi/BsH7WwPcLCZE40FbBFt8Ae6Swi/ErvafS0tmv3e2Edgh/JsbgvGx2F7MsOv7FhkxojG+ic0ZIx7RTdbiQdUiX5W2xPLqs+haVzxU1l9eNBbVn7/evjk7MlG5GiqzV5U0xHaZDeivdlMRm3s7N+s3U49WkYtMeTqfdUKkwwvtCwm5JQhYh8Vcik8AiGdXnlhTxlr7Rpeel82ekGU4qbI2k0pDjVIz7FW0baH86qTktfVqmTsed8GQUUyl19bHlNVUIB2cdxHdG4/qkvS4lBdigehhpk9Ogd+noMAnk1NKunImrb/bENZr1WmuhCgzi2oI0/hC+vMv24ude4f5izwgrkmcoJKmksqgkfSNL/MuACQvRzmJJHG5urHAzHlZeTQG/vPMbF0evdA8eraIbfHGhjTroZjyL+1tuOYVlunJUe3jgQfmtQF2SR33
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(19092799006)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eTA5M3VKTzd6TFE0RmI2S0FZcmdnSlp3cGdUeDRyODJjT3JURW1OSmpVbm5l?=
 =?utf-8?B?Znk4WEJHamtxZVQ1QTNMOFlZWGEvc001cENhaHZmSnl1U3U0UUxtenZiOTZZ?=
 =?utf-8?B?cXAwenlvNTVqOGdGVGxjWTVHL2xEMWhzYS9TOWlndkZkTVdvRmNPdGFMd2o5?=
 =?utf-8?B?WEVKZk9aandjR1hUVGVQTTRzL2djZUp2NXRFM2lvTTNqOHpFbjhZY1F2NS9O?=
 =?utf-8?B?cUZZd08vck1yRVJEMmx4WERXZ2VjMHRsVXU1VGhhM3NBYnZZbUJTOXNQS3NL?=
 =?utf-8?B?enFxNFJCWVhlR2hycEJBa0w5NlFWS2RJKy8wRWkxSTV2amFxWndsVVlBa0Nz?=
 =?utf-8?B?WEFYSDZpOGp5Sk00ZlR6bGVSWjg1Y0sva1hDQVRvY0V1V2N3QVVBWHd3U3BM?=
 =?utf-8?B?ajdEWEdBVUlQZG5BQzFBakMxZ08vWldVY0JEOXVGT04rWGxQMzMxc0J3a0tN?=
 =?utf-8?B?WFZURFJ2eEE2L2doR2ZNMmNyakhRWmtJT0lma3U4NXN1T2wzZGpWVUozZFoz?=
 =?utf-8?B?NUtNYmRuMGNPcUx5ZUEzOHNsdHNrSUJaSW1FZS9sbjBuZ0hTV2VzMlk2QzF2?=
 =?utf-8?B?cldMRE10YmdnNTRkdlE0cVEzeS9FRlQzVmdoZ1RzNHp4YS9VNmRkQ1AvWnln?=
 =?utf-8?B?TnlCMFF2L29kUW9jTXJzaDVZMXNiZTB6R3FOUGJVY3U3aEtYMk9oVXFTcjE5?=
 =?utf-8?B?TWp3UDZjSitvUFJleUxHNHRpUXZlcExGaEgwU3NCVmNNSERKVnFuQVhQdjRJ?=
 =?utf-8?B?TFZsdkFxcnRLMDcvMUNxR3krVXpWM0JZa2NzcFZVb0U4R3A5TEFDQjJwNm1N?=
 =?utf-8?B?TVoxUWFZZzZOckNqZ0YyQzkyNzFlZFp0aFBQUmsvazBRNzhnWVN0L2dkSHM1?=
 =?utf-8?B?K0t1bzBaZzhGMjRKOFpNYTZTRG9KV2g2Q2ZuSys4dXZlVm9iRTAreEgyY0ov?=
 =?utf-8?B?Wk0vck1VcThZNG9YTkFMT0JEeWpzY3RrMThBVVZlM0hBZGdFQTMwNHpJWUdE?=
 =?utf-8?B?Qzk3eEVneUJFS3RQSEszSU1OQ0g1T3Z5QXZUUEdWMjhydWdyWUNESmVSeEMw?=
 =?utf-8?B?bFlSTGpFNXpYLzFqVVFUOEpYZzJ0bSthTGtWaWFPRW9Ec0hJUXRHMjZwLzlE?=
 =?utf-8?B?Z0VFcUVVSWsvZklaMTNnZWlxcWxrclpaQk82WUVIaUhMVW5telYzNTd3anJL?=
 =?utf-8?B?NVpKdGJvR2J0ampzbXNIc3c3MnV0b2NDYjZqYTRQSHJCbjJyNUl0UDB2ejdo?=
 =?utf-8?B?MnR1MGM3VU1DaXBMaXpCZ0EyQ3Nsb1JaYk9BSEJiR0NYTmFLMmRjVG5QN0xG?=
 =?utf-8?B?UWJFSjFQNHEyb1VpSnJmeEJwNHFsNkg3eWRUbEEzbG5oYWtFb2JubmptaGIz?=
 =?utf-8?B?bjJWNElwc01LbnFGTlZNaWRtMmNGMzhGUmJOdGxIYmFqZGxCTHVYWEtjTWQw?=
 =?utf-8?B?L29Ka0ptQTRHcEJ2ek1NUFB3RW5pdXE0anNaWi9RWkZXMno1MFlweTJ6Q0xY?=
 =?utf-8?B?SEFoaEhEMHgrRmZJZnJRem5KOFVla1JFM0tQdk9qM2FMUnZ6b0swTTBDN0h4?=
 =?utf-8?B?ZU5KZ21uMGdxV2ZQUWxBZkszVnFaZjRKcDZhUG1vWGNGOXlFY1pwMlJvUkU3?=
 =?utf-8?B?QTB6c25EOTlNUnNnbFpKUmZEdU5mVlNMTi9rZEZvOGlMcVpUMERyV0JUMnVs?=
 =?utf-8?B?bEJxUnpUK2Q2OU9PM2ozSVVEcEp2QkIzQkZYdGRYY2VxZnROWllTSVhPczlp?=
 =?utf-8?B?V0pRT0lVcnBwYWd5cTJUSXZST0g5L3hBQXZwM3FqdGkvTGpEek1WVG1CUXlG?=
 =?utf-8?B?ZmFzd0I3VWptVVNFNkdMc0pJdHNnTHlxNlh5anRWTmVEUUpKYXI3RFNYaUJ6?=
 =?utf-8?B?cTc2WkxiQ0xvR1IvMVd4TjdLZ05lZEN3dzhpV1dYbjlBUFF1NVU3NEdPUWU0?=
 =?utf-8?B?U1RqclZ3VmF6WGhsQ3dHYkdoQ0lMYnAzUUQ2K0x3M0JBZnJQblNlOVdwVjdP?=
 =?utf-8?B?Q0c3SXRrdjBOR0gra2hNeUJiT0F0SDNaVW5uOE9adW93T1podGJYL3ZkQUVY?=
 =?utf-8?B?WStEWTR5QStyV2g1NzZPcHFCQ3FLT1FmLzgvWDBYQmxIVG1STjVwRU1oY0RD?=
 =?utf-8?B?eWRjQStkeldubFlGUW1FZmdieXpPZmNwQWtXWitQdXAxU0UvUHZSSkk2WnNO?=
 =?utf-8?B?QUhpZTYzN0RGc1l5VDZhclFJZnBsbjVNczFpb01jL2RFMU12alZnT29Xa2t3?=
 =?utf-8?B?b1F0b1g1aDlIckZVRk40dGp6VGloclBMYUNKUHFzM2hYbGpVMkV4MDFqdHZL?=
 =?utf-8?B?djlhaFdiTk9SVi9pb2NSNndlOU5BcXJxNHU2TENrODc1eG1yekR1Qnd4NGIz?=
 =?utf-8?Q?H+SN6UTU2j6qutNE=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 189bd341-1595-481a-e21a-08dec0c53d58
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 16:37:30.5978
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ibT+1hN31EZwgNikOZpzkggBr3g00ITIFltx53wuiF6/GrtFbLT9Beo85dQYZrIYt+yJXTt0AoKehIYi+uYx6LGyPG7E9+NLbG0NZsSZb+bZiKtGAzSvmQpQKdsOPdoK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_093735_232539_D78F0B4B 
X-CRM114-Status: UNSURE (   7.49  )
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

From: Frank Li <Frank.Li@nxp.com>


On Tue, 02 Jun 2026 12:45:14 +0900, Joseph Guo wrote:
> This patchset add Devicetree support for NXP FRDM-IMX95-PRO
> development board based on i.MX95 19x19 SoC.

Applied, thanks!

[1/2] dt-bindings: arm: fsl: Add i.MX95 19x19 FRDM PRO board
      commit: 9cec2ca7c81520fbdf552e918381417789db9049
[2/2] arm64: dts: freescale: add i.MX95 19x19 FRDM PRO board dts
      commit: 60b19c01105fd303980dd50e0aa1dce8b1560c08

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

