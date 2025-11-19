Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EDA4CEBF9A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 03:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	Content-Transfer-Encoding:Content-Type:Message-Id:Date:Subject:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=F5zgeEwwbpRyWH0yvJb5lA+Nyfqap5oseynA5IMgvIM=; b=B067ciCl4o8V2zxTQhwPxsH+gN
	m19f2TJzk9Y5sp9eV1ODyp+DL+NfseUGMh/RHLAiw4NugYzkAFXZdgfAcBNKqZ3tDaAq03vf9nsci
	x8mvaNwnJo9uA4XYuSV6wMQRdLGyjO1VJev+d9pT9GEOMdTFJMhZyt7K5qY6OQ66Gt/Gs7gzliQy+
	m0780IBV0GFx8KaA7VVh43wjrEnxRFj9F/K+nT8oOTMrnjtPL0CFx6VT9QrwOXLSRaTaKzcPIM1tc
	WJnNP2iSKeytETHm5S7EfmgycIfIACVxVc3BVZtrfSmxqwgb1ewtApAZUIK+VfiwGZTFGtBYXkmTG
	Vw7ERSaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLYly-00000001SRL-3GQs;
	Wed, 19 Nov 2025 03:22:22 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLYlw-00000001SQD-1IWK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 03:22:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r/pGhBYwKub1u0psA4fw1cx2YUyB/VXTJ3ELbQdMAN9HOfly0vl53JTmgmT9Cgeu279jVx4Roa6qEpX4SRL/XlUYQYiht5Xzyu2Hr15wQEv4AFIKwZMB+JuUxwDNKCjXRFujtTE8QkhMGrU0C+yr+1YDCbj7nwzT9ey+ecfEc/Ds8zB4iJ7tVwPer8OKgXRmFu4VNC1i5yrIKV4A7MqHfyVJVx9FJXcQ8c4r4vlkDM/jSJJVSwu5wj7ms/P4JkNOhOgGs/rTGd0gvWyDicfOR5Bkj9CB2ZCL7WucD3yH8Rgtew48KR22Y4OLwS3wWrCI5xOk5NYPHZUvgi4j/bvdfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F5zgeEwwbpRyWH0yvJb5lA+Nyfqap5oseynA5IMgvIM=;
 b=juV6Km/TavRmZe4iA9526Ww/PbBMyWVWw5yGgt0HrotZHGtZVPoLCzpxHr6yTgJLeimGOw8AChJj0twUXUiXXUipkWVHB4xbzLfFllY32AI6tm+x4uJZZv2hnkMedFlkgWdDtboWWxwxrolhWMyYB9OvlnVVupR7ONvUkk03yVnYHDX9zKu/2kIE79oCnZJa/x+HpGVx+DYFLRdiArLrJpgcW/JFzaExFnMvvENE/wfGGtgOC3JyFR2Z5RaYSJUVAnGfBeVjxu+gvAOLulGY4mEkPZ+IvgqbGrE9DIOhutwEIzqeiq+kfDItTILY+MJAxvK+q/teksDTkRQte4MP6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F5zgeEwwbpRyWH0yvJb5lA+Nyfqap5oseynA5IMgvIM=;
 b=UDplg/iIi9dYcTxHbm4x+JoSjYJP8PLuuCbzSCgG6GkKJJCOZgs/mOdus+FHvGpbc9RsXY/mibNxAprJqB08qNzGITn2EI9z7wbe+7cac7k+i1txEqBKQ93T+aYqZX/yLXe2VHMdklbyKWoXFZC3k6lFTg4GCPJVbw7L85HjawxQEw26SXwSjHWDt7m83O+ro4H6b7YzFxVY0xdiZgkleQSnMOIxxxQfk4NrNg1j8b5EinwRsGtwbc1SL9QqPTyO5ejmvdz+uA7M3R1mTn21RA2/KW11x1eQniFB5oSLWnGGLwvsobq4qgWBEJaaqCbostKEfqdRfu5Ald6uUTFpDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com (2603:10a6:10:32d::19)
 by DU4PR04MB10792.eurprd04.prod.outlook.com (2603:10a6:10:58e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 03:22:12 +0000
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::868b:3935:5e0f:6a33]) by DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::868b:3935:5e0f:6a33%6]) with mapi id 15.20.9320.021; Wed, 19 Nov 2025
 03:22:11 +0000
From: Haibo Chen <haibo.chen@nxp.com>
Subject: [PATCH v2 0/2] two small fixes for imx8qm-mek board
Date: Wed, 19 Nov 2025 11:22:38 +0800
Message-Id: <20251119-dts-imx8qm-v2-0-2579434f95cb@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP43HWkC/23MQQ6DIBCF4auYWZfGwaikq96jcUF1qLMALBhCY
 7h7qesu/5e874BIgSnCrTkgUOLI3tWQlwbmVbsXCV5qg2xlj4hKLHsUbLN6WzE+tdGdGlGRhnr
 YAhnOJ/aYaq8cdx8+p53wt/5lEopWDB1JORhDPcq7y9t19hamUsoXtMn+Y6IAAAA=
X-Change-ID: 20251118-dts-imx8qm-7bafa38718ea
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Dong Aisheng <aisheng.dong@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Haibo Chen <haibo.chen@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763522589; l=643;
 i=haibo.chen@nxp.com; s=20250421; h=from:subject:message-id;
 bh=ivsnJyK0csutyqfq28P1txqL14Ii8aTX3s4bNCrYIGQ=;
 b=uq/6LEdSNphSlnEhUJ2UwVkkPYtpX6dzduvPKFiQfktvL3cnkqkCynIXAoXhP2Q1G/xDayKfc
 pYQV6MnfmoYBahEMXtkGJaW3qHO3d2hABk0t3upZ8W/xL9hgxnKFpua
X-Developer-Key: i=haibo.chen@nxp.com; a=ed25519;
 pk=HR9LLTuVOg3BUNeAf4/FNOIkMaZvuwVJdNrGpvKDKaI=
X-ClientProxiedBy: SG2PR06CA0231.apcprd06.prod.outlook.com
 (2603:1096:4:ac::15) To DU0PR04MB9496.eurprd04.prod.outlook.com
 (2603:10a6:10:32d::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9496:EE_|DU4PR04MB10792:EE_
X-MS-Office365-Filtering-Correlation-Id: e2d8a9e0-571f-4502-c75a-08de271ad3a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|376014|366016|7416014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NmQvd0p1TGI5d0lFUDFLdGJGTWxidEpkT2RKZDM5ZjZicU5UMmlEV09GejNC?=
 =?utf-8?B?WTNsd3JPeW04akFGaGlFL2xkSUNWWFJ2WGNFanhaOFE4VWNhQzV2SS9QVlNh?=
 =?utf-8?B?TEVvaUxUanVtTmJUc3ZOL05YVGhON29BTlU3NjA2OTExT3JGeDV1NmNCS1FJ?=
 =?utf-8?B?eVBpL1FONGJLd1R6RzIyVkloTUhmRE9CajNUbC9Ia0YxaW9Jaktoa2tOU3pl?=
 =?utf-8?B?OEJWUVNPb3V5RUZuT0ozdmErRW5DcUkxTVBHbkVxY1hLM09jUTdpQkNJRXRk?=
 =?utf-8?B?V1NqVzYwWURhOXFrNTROcVVSZE5lbXlseDNFMFpVNEhOV240bzJtN0dHUE84?=
 =?utf-8?B?WGsvRTFRUjFPcklhT0RIT0VwTk9jL0wxK1JoUFNXblRaT2lkY3VEeS9MeUNl?=
 =?utf-8?B?ZkMwbXUzRnZveXFWYkp1RkNnV2crbmxjbzNoUktGQ1U5ajlsZ01CNk5TaFhK?=
 =?utf-8?B?S2t4RUhLeW9ZYXc1aW9pQStsanlSQlJZcDdGRW9uaDRBRE81K2FtVHo5c1h1?=
 =?utf-8?B?bG4yY1g4VFp3UG96RkJDcDd2dlhkbHJycEpkdGF0MzMrV3FBdFcyclJySGRj?=
 =?utf-8?B?enhTTEJ6eXlHRktvYmJFbmtHMFhQVk5aNFJ3eFovU3ZOdjF1QmtzZG9NNHVS?=
 =?utf-8?B?MGJlcDVDOFR5SkVPU3dFZ3FtMTFyMGgvUGdveXUvMDduSDZMeWd4a1NmWUV1?=
 =?utf-8?B?b3VTZjRpV0ExUytPWUtQa1NGemNkMWNpNndlbmRwOW0zSGl0UXhrYlUyL2Qw?=
 =?utf-8?B?dDlMK0VoZGloZ01RMlJJVmx2RnF6UTNqSTZyS1lsN2hXU0JiVjdlSnlhM1ha?=
 =?utf-8?B?dDYxY0daQlRTY1p4QWwvL2NmMVBwcldCRW02TmdvWWFhWnlMSnl1bFZ6WjB5?=
 =?utf-8?B?RExNMlZyZm1ISUxWY05PTkxFaEU5R0V3cFBtWEVkTzJpMWZVMEV1dmZBajAy?=
 =?utf-8?B?eHUzb0pFRkVSQnhscjBnWnRzUlp3bGNscVRQaFh1Mm5sV3NLSWQwWVdUa2pJ?=
 =?utf-8?B?dEh0UCtmSktibktrVkVVUDJXRFhJYll1MEh0aEVzUDQ3WEwrNm90MTVTYlh4?=
 =?utf-8?B?azdHaXpPY3N0OTVoNFdOWXArcytIdk1RNEovem5Uc1RZUXBqVHE2N3FKMmdM?=
 =?utf-8?B?N0htYWJQTkpqbXpxdDV6cTVzOWJ3eFhQWE1jM1ZrNGVDSzAyaWx4RTdrVDhs?=
 =?utf-8?B?dTV2SnE2UVB1UFVyWFdVWStTQ0h0NVdqOHBaWjltNXVqKzBtbVN4QUVKUDRp?=
 =?utf-8?B?VjZIRXJjaUtzVTJ3b1RVb3E2djlzajEwb1F4eG9ZSWgwSlJyN1NrWFcwZ0RS?=
 =?utf-8?B?Yjh2bGYzU2RiN1cxTGxuSTVrVzBodDF0dlIvV1NGVlZjWjZLejVxenlWMWRQ?=
 =?utf-8?B?RExNMUcvcWtFNjRDL3lGQXJlOUJWSWdGdHc1Q1pFZ2llR25Uc0Yya3BLZTF0?=
 =?utf-8?B?OGR5R1F1L0o3Q2RidDJIbVFKN2xscTl5cjQ1QjRTQTg3aklFTjFqeTBNbHpB?=
 =?utf-8?B?WHE3Tmp0S0h6TlpCb3ZyNHNReEpPRnRkcDl2TENFY3ozeTZ2MHRIN0I0NWFv?=
 =?utf-8?B?SDcwZGpIR1duOFIydnFvVWtpZVJWTCs5ZWU1MmRtWUgyZ2dzSGJ6ZWRJNEtx?=
 =?utf-8?B?U3BPdDQ4RkpCTTFuSGxVUDExWXVmR0pJcHRreFltd2NiVWdCUDdRYVZrcmpq?=
 =?utf-8?B?c0RBQ216Q0FnbDh3aE9uRitQMU9oRFlTL2xZLzRCR204V0h1TVA2RzZJc3Ft?=
 =?utf-8?B?NFE3TXBvZlI3QzVwbitmYXAza3V4RDMrZHdRa3pSMWt5QVV6THQ4anRTVE0v?=
 =?utf-8?B?dFIzcE52cWdmcXYvem0zMlFiMHh5ZGFZQmxnVXlaQWJrbzg0S01XNkkrTG5W?=
 =?utf-8?B?SE5NZFBBdnRFVEt0QzVleXIrUkdXRUxPQWh6dzFxaitqUFJNQmJqL2hFc1dB?=
 =?utf-8?B?d0pLNWdIbU1qM2Vhb2ticW0yZkM1Wmx0Y3Faci8vMG9lSDlWcm1NR3hXVEta?=
 =?utf-8?B?OFhocFVuZUpxWjdQMTZhaWs3Rzdaa3VKdGdrR0xoT3I5aS9KYUpCZXZKNVlN?=
 =?utf-8?Q?Kcu0DW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9496.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(7416014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SThmK3R0angwenh5aENYNDVOSXdiY245ak5xdmhmSjVYQ2JMT29oMkc1MjFo?=
 =?utf-8?B?b0FoN1hjZnZYb2RhSjM5amcrbENGNDMrVHIyU3ZUdWN6b2JBMm94TjA3eDln?=
 =?utf-8?B?QlYyY3l3UTNPK3FTUHArM1QzdkpxdkYwT0xEWlhNbGpmUUFZWm1iQnkvRWJO?=
 =?utf-8?B?UnF3QmJFTEpIWnhBVzYrSUtrNThKcTJ2ZEtuNENZZ3dadUpKNWdsckdRd012?=
 =?utf-8?B?a0lKSXY3Wkc1U3J1K25BQml5L3Y4cXVNQm04dEdsYkFWTis5WGFSYWV6dHl4?=
 =?utf-8?B?Vjk1UTlsQmtuSVFDUStTVzQ1dGY1d0xKbC9YKzlTdmVCUEFnY1JyelVUWkwx?=
 =?utf-8?B?VHpHM3F2MEhCV0tnK1JGUktNSjdsRFdpZzE3U0dyN2xXSmVWK3VBamRKVERq?=
 =?utf-8?B?ZlZnSmpWSjYwcVpCV3lqME5rc3Bzb0REcjZuUXlEL2wwS29ZblVXWXFpdVRa?=
 =?utf-8?B?a2xoVUdXbURuWGttNzAwQmZBMFlvaVBpSDF2SmNKN25EbXZpL3p5NXFsc0tj?=
 =?utf-8?B?OVRkeGM1NFpDQXZMczBKbXRvcW8ybDVxUDFYdXc3R0RCQ2Fsd1VNeUFiR0Ro?=
 =?utf-8?B?bHRsM3g0V29SYkUwTWR3QVRiT3NRaFpaUHVnNU1yZXM2Wk95RGE4K3E1T0Zq?=
 =?utf-8?B?U3ZuNkNCMmNXWXNqeGtvSnRQRytvQkVxTTlvUVBKaWhCV2FncDlHcE9RUlpO?=
 =?utf-8?B?akdWUmk3djVORUxtWWwvdmtWRWVJOTFscXNQZm04dk5TOVlWTzhiZktDSk1N?=
 =?utf-8?B?czl0Z2lKZmlORHQ4dyswdjFIem83bTNPeUYxRW9CUG9pYkgwak8xZ3ljZnVZ?=
 =?utf-8?B?Z2lvd0oxczhzdUhBTWE3ZWt4eXRaa3RiT0x0Mzk3VWlSNmppL1Vzbk85TWU4?=
 =?utf-8?B?SW4xTm44N0JZblVCbEFReEpyNHNGOXNxQnVjVDdDa2ZOOTg0cXkzWFZ2MC9l?=
 =?utf-8?B?MGM2MVZqakhmbHRETldwUzdSMU9vY092dzllcm9SQ1NYV2p3cWRkeGlkbnpG?=
 =?utf-8?B?OUxjTnphOEsxeTR4eWJ4ZXZvd1p5SFFjZTBMQ3Q1R3hHbGl6cU9ia2Q0ekl2?=
 =?utf-8?B?VlN3Uk5LTW50NjNUeUt5RTkwazcyQm9tYlNTMzZsYXlhSUJNMGVZZVpNNmQr?=
 =?utf-8?B?MEpFTGRaZWJzRXBPd2Y3aVhvUHVuQXJlTHM2aXgrcUVmdW0vZFdoSlQySFRL?=
 =?utf-8?B?Z3h1OTdoOFpXbnViUFdtY3lDeHJYbU94Nk12c0ZkNk1pbjUzVVJmZEJxS2Jm?=
 =?utf-8?B?S1dnZGRrbk4wM0wxUmF4cnlOMnpPdUprRWV4cmZzUE9tdW9BdzJvRjN6TnBC?=
 =?utf-8?B?M3RnWlZDdDJjVGVGTjRzUUVEcEJ6T1lPNm8vQVh4d2JtWStNVTdOM1N5UGND?=
 =?utf-8?B?b3I0QnBOZ3JiRWZkUVo0MU1SSU5EWnl5ZXZucDZpSy9xdXVHKy9Ydk5TS3pQ?=
 =?utf-8?B?REw4eURQZ2lhcDJNUFMyMXNkVmtNK09OQlZXTlBDQ3kxZUswaUFIK1lBQ0pq?=
 =?utf-8?B?Smd1dExYdnJzcis0V0ZYTlk5NVpUNjEyeVM1amd4KzExWTN2SkR1SFZEL3Vt?=
 =?utf-8?B?dFZodUEwV3JMQnplODcxVXQ5MWF2M3pjdlh2VjJFbWVvaUdnQm44b3UzNjBW?=
 =?utf-8?B?Q1ZzY0tVS25iRVhZYzE3c0pjdXJoTktzVlQ2WnZ2V0ZLSCtvU1lhalRTS01j?=
 =?utf-8?B?L0hLL0lPMS9ZZXA2T3VINGtleENkd2NKVHVubWdQam0rTG1QakJEeWROM2J3?=
 =?utf-8?B?ZVdYQnplamhyRXg3Z2NwQW5BNkFjS2RPc1JoUkRnVEUwMlh6VlBmM21TWStE?=
 =?utf-8?B?aGRXSzkrZ3B1L2VnZ3ZOSkNsVGl0ZG4zMmJmVTZoVW1CVVdBZS9GdXdJQUZy?=
 =?utf-8?B?UmZSeTRkYjVtdSs1T2MyRzVHVkhvZm9KMzBvY1ZWZGF3Y3hwSTB5bTJ4dkJ0?=
 =?utf-8?B?ZUt2SjlaOW0za2M1L2FuLzc4c3Z4bURELzZaNmhlTUpTQzZwR1didytMRm9s?=
 =?utf-8?B?TlVpb0Z4bW0vb2ZKdXppQzR3YzliZ0RoVFJHdkwvTG9abG16MFpLOUJOcVVC?=
 =?utf-8?B?K2NrWEZ1cGtoT0FjSGxYMURjVjNyNE1jdmx6d0pMYmllWkorUVBMb2tkbXh5?=
 =?utf-8?Q?KfVjheR1kg0+ItsR+3c0AoWTN?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2d8a9e0-571f-4502-c75a-08de271ad3a8
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9496.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 03:22:11.3240
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K59gy2WEoyUgKyWC44b6SgSjX8+ZWeIkjuDi045Hy4lQxNR+BannA3fbIXiQ9wrWP+16yS8HaTjoxCaFI125Rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10792
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_192220_358491_58E4915A 
X-CRM114-Status: UNSURE (   8.70  )
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

Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
---
Changes in v2:
- PATCH 1: add fix tag
- PATCH 2: add Frank's ack.
- Link to v1: https://lore.kernel.org/r/20251118-dts-imx8qm-v1-0-63e226ffe512@nxp.com

---
Haibo Chen (2):
      arm64: dts: imx8qm-mek: correct the light sensor interrupt type to low level
      arm64: dts: add off-on-delay-us for usdhc2 regulator

 arch/arm64/boot/dts/freescale/imx8qm-mek.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
---
base-commit: 187dac290bfd0741b9d7d5490af825c33fd9baa4
change-id: 20251118-dts-imx8qm-7bafa38718ea

Best regards,
-- 
Haibo Chen <haibo.chen@nxp.com>


