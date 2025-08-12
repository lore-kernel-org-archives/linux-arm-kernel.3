Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35C90CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 12:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ddL5j8Za1rVmhdTLLIn+9Ahw8vrVdIwLsyqC9HjjzII=; b=fV5G/jUPXkDYL/xkJD8aFD6fZO
	Ra3wcZ3eSW0uCjLiCxDGwf+1bKrF6DdJ6cV2V/HgbssY6qAkmSzzYCp2NWBlcWMgLCMb9IPlXRP7d
	ye3h1WmrhZr87/IWlu6Htq6QHg+V4DVnXSW4aChIiuOTpjaqbn9bsLLi3Q1iBEPXrNyO2w/Sj9nno
	5a3j+UCh+gpy7RVm5/NdBfeDF5YN6X7aytS4djZW0W8ZbH5BEIwUNBouq/242sP+fZpE6E3CLrFAb
	Xpmqz2qrhyp5m7DVLl2BL5oGn/GVcKDyZovU3smDVAOMGi8tnQ2+D6W7Uo0tfxWBzFbjpum5mFsLV
	ZJ7oR3TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloEt-0000000Ai0y-1I0E;
	Tue, 12 Aug 2025 12:36:27 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulkGE-0000000ADli-0S9O
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 08:21:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QcoSu3QPE3OU4GSpHO4b9Tr9egAAdLBm711aD1NEweAkFfrc8h1myzJduC1ywdCZoxOWmggcxOnjBmUr5AgZhe8OKBxHxs79Pjr8E/kAia5AIuapHtHHf5cu4ROe199hXER+NZRWPGn/w3zCSrtpbttGbOyJd0Y2QbNhQgCGVO6v9094epGA8imFSGtiCiywsHsFu4ywHEXZXcZT36nDdrOk4UkwYPRDZd1hH82xcfdeIiHbnljxmFZSy5CbPqqd8ljp95VTZ08QA5m2l/IPJXOBtb3vl3Sp0b7yiEqsgabmKSYRf4VbC2vMsu3mwh1FgIxHEa+siOW36G3lxA9zmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ddL5j8Za1rVmhdTLLIn+9Ahw8vrVdIwLsyqC9HjjzII=;
 b=f6droJ8doAnEqPde27riNyfoPEp6HKn+RRtkZrdX5OMy6rFG2zVBoi32ZvKWopP+yCxI1nem3G2NoaYrs+V/7VFR3+HXuTQbjSxDcZVmmExpw/DTJjjUQZfRrR+wzl7gsh6CPbAhcuqfyz8sd1TCp/KGq7LMIl3djv/QEoM8mJ+n4P+3MSufz8WyLxmg6a+PkOMzFOnsMPqaUcFASyYdEswy2scdFSoX7b6JNZJ2cu7I/fwceYk50IL/gl2BBDVilGXjfgck1P9bMG2gInU2z1xAW/mvBANkjwpNFmR/9nvDZVly9iXT0xz/bsVWgiOSmebyhSCx0avyH/PYHZpjSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ddL5j8Za1rVmhdTLLIn+9Ahw8vrVdIwLsyqC9HjjzII=;
 b=rjZRIoatvB6PTn6Wdxa2IG/hPlnOU1mXFMaAo2v2prUZA2GyJN8neMC3YrtOqZBUiBcE+4FiImtoEahiCRs/QDOWzGWYQAfAFH9yOre5Us8Hu/TUe+2Wu9z/DhGPF8dRcvkjRPdNhQnpGH9JV4HNsw6ba/f7Xk9ZVLTRHKugZyHKB1S/2P3rCHrKXd1jPIWw9B8XX2xsrMTMEL4bxs+U8XsfEx5T2gIe3my2kD6YRy7iKLMAFFp/jzC86Gl4sqMrSp1U+59QDdxpvx7FfHOAYjUVMMegojvCfHWLMEudYYcsVZVvSlZMsygT6g/WhegS421zBY0ofKPHXTpRihzByQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by VI1PR04MB10001.eurprd04.prod.outlook.com (2603:10a6:800:1d9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.12; Tue, 12 Aug
 2025 08:21:27 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59%6]) with mapi id 15.20.9031.012; Tue, 12 Aug 2025
 08:21:27 +0000
From: guoniu.zhou@oss.nxp.com
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: rmfrfs@gmail.com,
	laurent.pinchart@ideasonboard.com,
	martink@posteo.de,
	kernel@puri.sm,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	frank.li@nxp.com
Subject: [PATCH 2/5] arm64: dts: imx8ulp: Add CSI and ISI Nodes
Date: Tue, 12 Aug 2025 16:19:23 +0800
Message-Id: <20250812081923.1019345-3-guoniu.zhou@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250812081923.1019345-1-guoniu.zhou@oss.nxp.com>
References: <20250812081923.1019345-1-guoniu.zhou@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2P153CA0014.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::6)
 To AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|VI1PR04MB10001:EE_
X-MS-Office365-Filtering-Correlation-Id: 1272b80c-6783-42eb-60ae-08ddd9793bba
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|19092799006|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MFJtNHRaWjZ1K2JHL1FGeU4wL1VzVkV0L0c3T25Vc1RLcXdUZXNjMTBUbkpy?=
 =?utf-8?B?NkFMNkIrdHFYMlk2aGhTUzc0N0U3emtRNUFsQWliQVJicmdnZ3hJalZMUjFE?=
 =?utf-8?B?SUNZQWh1R3d3Qm1OY1U4Uk9uN0lWaW1wRHF1VVk1eTJjOXlLRmc5QmlNb1A1?=
 =?utf-8?B?RnMrNEhKcDA2Uk93OGFvTHRKem9Ba29kc29QMUVCck1yQVRpR09iRmRHVDBG?=
 =?utf-8?B?d2FVMGpaNDZkYUZlNVNKMEtjdUwzNk0zeUw2NWp6eVpRcWJxOXYvcCtPSmEx?=
 =?utf-8?B?eHZwZzMxODBXYWo5TDJObVNxWTVpRWxieUsvOVE5a1BqQ3JZdENDSkluL1Uw?=
 =?utf-8?B?R0NvODd6Ukx5WFRNK0RnT1NaaC9CaHBraTJDQTc3dUdNUitUWHVtQ1RGREx5?=
 =?utf-8?B?RzRsbUFqV1QrKzh0RkJRbkJrNm1vN0o0SllPZmtyOExuVXpzSmFmMVpiRUZF?=
 =?utf-8?B?aEhCcXdROWdGVFd0QzAvOWpoU3hDNDVQSDE1Znc4cndLRmExdDV4MzJ1RGNU?=
 =?utf-8?B?V0JvcVVWTHRrQUdlV2xGOGpDYWRYa1gxNzVVSkh1Q3dNMU1RWEZ0Z0NOY3px?=
 =?utf-8?B?MzlQY2lkMUVwRzQ4VmZIenJDZk80QnA0djhtUU5QUnI0RTVNdEZpemM4c2FV?=
 =?utf-8?B?MDNpMkt3aGUvU3ZPWVE3eU1ldGgwaXkyZHp0RFdzWXdkQ1N6UFQ2Qkk5Rk1x?=
 =?utf-8?B?Skl6NTlhQk1UaFJ4VU9GMXpVemo0dlcyOW01R2hjK0g2ZllBWDBHczladnc4?=
 =?utf-8?B?Y3VLcHE0emtQby8vSkZSd2VKMnE2SENsN0ZoR3duQWhEZXM0bWkvYmp1cFBO?=
 =?utf-8?B?ei8rdjRwNXVseEc2ckp4a1QzaS8vM2xHS1cvcy9uTy9TSDc4Q2dBRWNyNUp1?=
 =?utf-8?B?cWRTMGZzdEN6bnVoSnIwTnVzd0MwWnpsWFJsdWoxQjUzLzMyWTYzK2Y5dGNx?=
 =?utf-8?B?KzhpdWc1dmNYSExGRXF0bU5oY0w1aWtYdFUvdEE0K1llNkZUVm1USGI1WitP?=
 =?utf-8?B?bCt0cnEzOVB6SHIzQUxvRy9kNE9kSWEyZHlCcjNPTGRVSHVjaVllYTRVeERo?=
 =?utf-8?B?dFFZL3B0aS9iTWlmcys1d2VjZ1pBckRoOGxCTVJxajJicGxaMHM2Yjhzekwx?=
 =?utf-8?B?bTB5YUZ1WHl5dEVFZjZ4U1NMOUVoNHd4cFg4ZTBlNXVuUXh5YlZYRTlRL1Rl?=
 =?utf-8?B?OFpCM1ZzSGxNNmxoY3B2YlBzUHVEemdKWTBHRFFtRHJWeU0zaktQOEhHZThn?=
 =?utf-8?B?d2YrTmFWRHM1UFQyUmtxZW1WK3V0TDM0Y1lLeDhiNGZ6U1JYS2RWdW9HakVB?=
 =?utf-8?B?N0xGdDFvQU8vZkN1Q0p4eGdnbU80QTk1RGZIZU85YjZtMmppNnMzQ2VvcXVH?=
 =?utf-8?B?V2R0SGlFTExoQjg1bHY0eGEydVVBNEVRdUFhcGp5bG5Ldzg5SUl4WlNmMTFa?=
 =?utf-8?B?N3ljTnJsQUZVcmY4dGF2RkpiZWVGclhXRzZ4QnZ3c3hOR0lhd1VNZG5OSzEv?=
 =?utf-8?B?RU5XcENIYmVOVUIvNituUGlqL1Ntc0lCdEN5Qy9RcTlYZXhPZE94bFRMbkto?=
 =?utf-8?B?WDRQeEQ4cGZ5NGxVVWRVWWZKMHlSRHh4SE8vM3ZTSTBKRllra253c3RZS1oy?=
 =?utf-8?B?bFA3Mk8vTVp6TjJmSGN4dkNwcUhCb0ZvaFptUkhTSkJna3p6YkxWOVQvMjVC?=
 =?utf-8?B?K1ZpTFlsdm5BdXY5WlZGUWVEV2doTW84RkNudlhRTlkraTB2RmtPV3B0c1J2?=
 =?utf-8?B?dkdWMkZONyt6WUNSaGJWY0RDRVZjdnFjbzI1Q1EvdzM1bTZUSXRiY3ppSVE3?=
 =?utf-8?B?TXhGNE4raUxUeFlCa2pSc1lUN3NzeGhOaDF1bFFZcDNuNytXZzN4MDF4YkdM?=
 =?utf-8?B?dEZCQmtyeDltcmsyajQwRnduM3pVR055c1lKRmZ3L3cydmJJaStSK0ovbVJZ?=
 =?utf-8?B?eEhuOS9UYW1sU1lrNDJTZ0ZMQTNyOEFGZDBnZkg0SllxWEF3V25LVUd4cFRL?=
 =?utf-8?B?ZXJmSlp3SHJRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?czFURktkNmZpcEVZTU5ocDRLa0d4OVBGVWorK3RjcHF6ODN5OERKdUVQSXl5?=
 =?utf-8?B?aUNzUUVKN3ZGd3V1dmZJM1JsR0lFSVprWXFNS1VJMDJuUUJ1dGt1SERXMmFo?=
 =?utf-8?B?Sk40dU9aZ3EwUmRLRk5ZS3YwY0hscmE1K09RT3lSczRJN3JIWWVqWXloMzZm?=
 =?utf-8?B?dVdlY0xjT1cwWXhGakIyRVlKNk5JQWpVL2NHN0YzenlVRVB5ZUFqVEdxVU5k?=
 =?utf-8?B?cUJtTUk5OUVkYnN5KzJOd0VSU2ZNTGZpME9sdEJySnIwd1RTK2h3eXNhcUNK?=
 =?utf-8?B?czNlOFhDaE8rK0dWYkpoYnhPU1ZDRExwNGQ1ZGtiRzRDTTkveU94dTM2U28v?=
 =?utf-8?B?dllGSW1yUlpuZjNRM3dua21OejJqeTdzdVZ0SXpoRUliS0xkTEw1bWxnYjI2?=
 =?utf-8?B?QUhDa2lEVzFWczFoZEZmYUg0MWdXNG9rMFNpNm8vLzkyOEU2MlYybTN2Y1M2?=
 =?utf-8?B?dGE3NU9DU3JJZEQvenQvMHRJNCtKUHV2MzNJYlFESUQ3bzFER3U2SEhvTTV2?=
 =?utf-8?B?SXE4OFd6TWtqRUhDM0VieCtoM2dwdDliK0pqM2lDb281WWc5R08rMFcvNDBC?=
 =?utf-8?B?dVAzYUpXdDhLdW80WlRmeUJFSkdodTFyL3NtU0o0QnhTUUg2OGN4OEhvQm5F?=
 =?utf-8?B?QVhzZURQNCtzYlEvYXlTcWhqY0FYczBkOUlHSlJlWVAramVJSUlRcWV4Y0Jx?=
 =?utf-8?B?R1lXeUY5SG1QZDF5U0piS1lWZFRUSjM0dWE3WTBHRFA1WFUwVXFNa2o3Y0Za?=
 =?utf-8?B?SXJIV3VmRUJjNXExR04vNWdyekVyMThTNFhPc2E1eEtaT0lSMHFRNVJEa2w5?=
 =?utf-8?B?akQ5ZXVsdno4aDhIaFlMWDdjUDVOdHpyY3dZUjZseXV3NFpBYlhPZ2xjMXdv?=
 =?utf-8?B?OHBDS0puMmJYUTdaczVyYjJVYkZ2dEFjcnlSSEdGQnF6L3lvVDIvM05RckRo?=
 =?utf-8?B?VzJSRTAwMUt0MXROdFBKS0VzMnIzTzcxT3dYaUV6a3ZxYjl2dGh3eU1ERTdK?=
 =?utf-8?B?aXhZakh2STNDcEtrOTUrM1FEN3hkTjd0S29RdWJlMjdGcmdUV2lua3dMdTFy?=
 =?utf-8?B?TG1nYTFjOHVkT3V3WU9PUzhwUGp3UXB1RDhnYnQvcjQrMnN1QTRsZTUvK0Zn?=
 =?utf-8?B?N3EweG8rVktEMUpUR216RVh6M0dUVXVWNklKSlJJa0Y1eElsTm1TMXpnUWll?=
 =?utf-8?B?S3lGWkVVQzNFZkxOMGQvaEViUWRBRzRTUVRYcXBuVC9weDZHd3BJR0pyZS9H?=
 =?utf-8?B?ME1oMXhZaTVzcWZZa3pDdXRaTnFSMndINXRERDN3Y3B5ZUZLbDVZVkRObFJG?=
 =?utf-8?B?NFkxWkQ2QURVVXcwQTNqRmlkQWF4RklGWms5aFJPRHZTdHEwTDljbEdyQ2dV?=
 =?utf-8?B?RkVtclNjdTlZaU4xMkhCMkd2SWVHSVBlOS9DTnpBL3VSUmdnbUwyRndHVWVj?=
 =?utf-8?B?dnhRZUJmQUx1Z1JaVTRXc0pkRE5jbUZ1RytOQ2RUaTJEdmR1aHhxejVJSlh6?=
 =?utf-8?B?cll2NjJ3NnJaemtxL3I5NHN3dThzRGlZcUdRM2QrQzhHNm4wS1lGRlRMSUVk?=
 =?utf-8?B?c0tVNE1UT0tVRFBsazRkM0JxRGRWTDVOUE40REp5N2dtV0Y2d2I1RHhVMnUw?=
 =?utf-8?B?YVpRM0N1ZHk2L1FEYjNDa2owbmVyWmdxY09rL1JFWnpYNzVtZmVScCtHM2tL?=
 =?utf-8?B?SExoaEk2ZnBJbk4wVnhXajF2V0tEdlE3c3N5Q01zRmNEZzE5TjAwSHRHTHow?=
 =?utf-8?B?bEVjK1ZKczRHK2F0azAwMEVKQ3JnSW9GdHhheWJ3TEdVclE3WE90M2w0b01W?=
 =?utf-8?B?QzhWL01NV3pQeElvNjdDZkQ1MXFXRjh2NG5SY0hueXNjYW9VUSs5d00rUWZE?=
 =?utf-8?B?azd0Ynp1UEc0REVpemlsUTJiT2NmV0dXVmc2bHJWVXZEajIyZjVLb3hrUzh0?=
 =?utf-8?B?R3VjNmpQSFJvV0wwM004TUF4ZGJqalBSN2hENzg1R0x3MjBQcG9lQmhYRkNa?=
 =?utf-8?B?R3V6ZnVUNW9iYXVvUnhmQXdDU1RlYlEzV29lZUJ4MEVDdVlXcmQ1b2hINExo?=
 =?utf-8?B?eWt2OFFQSnBGWUxhaFFqOTFOd3ByaTZGR2pQMUJSdExISGNIRU9paHNkN0Np?=
 =?utf-8?Q?L3j6LflkxK8xNFnbpVesYtO5A?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1272b80c-6783-42eb-60ae-08ddd9793bba
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 08:21:27.6272
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rlsqy/aR3NDMwbFwzt1Lz5DJI9cBb5Vbq3u9tj3arU679yT+NfZY3Tat5fKQCxDRPw7ot7BppaYBg/t+lAiFJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB10001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_012134_142575_E2A66896 
X-CRM114-Status: GOOD (  11.72  )
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

From: Guoniu Zhou <guoniu.zhou@nxp.com>

The CSI-2 in the i.MX8ULP is almost identical to the version present
in the i.MX8QXP/QM and is routed to the ISI. Add both the ISI and CSI
nodes and mark them as disabled by default since capture is dependent
on an attached camera.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 67 ++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index 2562a35286c2..71abc2a3d505 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/power/imx8ulp-power.h>
+#include <dt-bindings/reset/imx8ulp-pcc-reset.h>
 #include <dt-bindings/thermal/thermal.h>
 
 #include "imx8ulp-pinfunc.h"
@@ -840,6 +841,72 @@ spdif: spdif@2dab0000 {
 				dma-names = "rx", "tx";
 				status = "disabled";
 			};
+
+			isi: isi@2dac0000 {
+				compatible = "fsl,imx8ulp-isi";
+				reg = <0x2dac0000 0x10000>;
+				interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&pcc5 IMX8ULP_CLK_ISI>,
+					 <&cgc2 IMX8ULP_CLK_LPAV_AXI_DIV>;
+				clock-names = "axi", "apb";
+				power-domains = <&scmi_devpd IMX8ULP_PD_ISI>;
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						isi_in: endpoint {
+							remote-endpoint = <&mipi_csi_out>;
+						};
+					};
+				};
+			};
+
+			mipi_csi: csi@2daf0000 {
+				compatible = "fsl,imx8ulp-mipi-csi2";
+				reg = <0x2daf0000 0x10000>,
+				      <0x2dad0000 0x10000>;
+				clocks = <&pcc5 IMX8ULP_CLK_CSI>,
+					 <&pcc5 IMX8ULP_CLK_CSI_CLK_ESC>,
+					 <&pcc5 IMX8ULP_CLK_CSI_CLK_UI>,
+					 <&pcc5 IMX8ULP_CLK_CSI_REGS>;
+				clock-names = "core", "esc", "ui", "pclk";
+				assigned-clocks = <&pcc5 IMX8ULP_CLK_CSI>,
+						  <&pcc5 IMX8ULP_CLK_CSI_CLK_ESC>,
+						  <&pcc5 IMX8ULP_CLK_CSI_CLK_UI>,
+						  <&pcc5 IMX8ULP_CLK_CSI_REGS>;
+				assigned-clock-parents = <&cgc2 IMX8ULP_CLK_PLL4_PFD1_DIV1>,
+							 <&cgc2 IMX8ULP_CLK_PLL4_PFD1_DIV2>,
+							 <&cgc2 IMX8ULP_CLK_PLL4_PFD0_DIV1>;
+				assigned-clock-rates = <200000000>,
+						       <80000000>,
+						       <100000000>,
+						       <79200000>;
+				power-domains = <&scmi_devpd IMX8ULP_PD_MIPI_CSI>;
+				resets = <&pcc5 PCC5_CSI_SWRST>,
+					 <&pcc5 PCC5_CSI_REGS_SWRST>;
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mipi_csi_out: endpoint {
+							remote-endpoint = <&isi_in>;
+						};
+					};
+				};
+			};
 		};
 
 		gpiod: gpio@2e200000 {
-- 
2.34.1


