Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44185C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 12:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yo7TjZrAMrzTnru0AzxVBOilesqyFdWeA/AHlGs62aY=; b=nzFIkDJQWFRijfKMGQ+CMAhaIa
	gv+eroVOvmEdYd+X4MYMGWjLsmkftTiFaSJG5FAmZP2BrJoNrayu+C/j2MgORSQ6rE6XY5VO8XrrB
	k2jBOn57KgA14+s8B+SlIdk3CfC4m0IHPfatkuNLose7ACMU3OA/1Ngz9hOqvYZWMZ5UjybC3la9m
	s1425XjMSXUcjiTO0lAiTRKb4BOx4DsAgySHv3kwbbVm2sGOyl/5FDrOm38QBi/Qvic16rTSJdTeJ
	GGalNEtUnkGzXufbkcAKyug3osBm+5MhW/V8DB0Kjld78k4tHHfqLj0cymSRRm7akafoLPoVT4WR3
	AIaPjq3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloGa-0000000AkJ1-0WKD;
	Tue, 12 Aug 2025 12:38:12 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulkUC-0000000AG5n-4128
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 08:36:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AuHfXj0dMw0uGnL/gcIkikFsFBWaMYqrjSDtaqpay2/cMLoj24s/6V7gsQmaUFHx5X0RSgkZyS04JKbXM9/Lda1lYJh753ccHx2aPxL4gLqI9xAZBP1LAmRVwhRVfVhC3XOd8xUTdSm20R5x+UAY6raUGt2MfbEQojCpe49Wjd0ftu1+MGvGtSiNqD+wN6v7yKSMOxDSFsyyRDnx+LFrBS7SUHnarKYy0BJHM5L76d4h2j4Fp1pDLgySjpcdxeYm+NIooefkr8LNrKgetW8PGtGhT+9Q55kv8zbaxUaIN4AZ62u2ALvM1iGkCPqsNJou/LNYorDGrj9U7vwQik76eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yo7TjZrAMrzTnru0AzxVBOilesqyFdWeA/AHlGs62aY=;
 b=I1udSYWBcTomKigHxVSCCk6dhiganuraagVLUP2u/yn0oZrcWYtlAWuxiYTCGzHcZ0LLjV3m1IjLVDFLujf8+r+Zjwly7Fz2hbew/kohvAM+DZODiGORFc+jyH7iq+JqD/bHH+tp/n04slpIhxGxy70AfxKwq47nC8ihqVLQ7GaMEyT2c+rL3WqiU2uf613mCBGZ2zbfhhsU+tQ69ANhOg+EDd25hkpHF7WeDAQkwYmsUvl2IpS9iEdY6mq2PbbQh47b3Ijufs/pysXsvZrUHG0UVYAoc4j31VajRkNffl31wbvaBhzQ1RzIkuYV+cH7A74iFnHSs2e3iJ9Gptygvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yo7TjZrAMrzTnru0AzxVBOilesqyFdWeA/AHlGs62aY=;
 b=jlUA/aBp+kRkzXVabG9mC/VYq7NPSWAV4pvgr5rZO7TnpZa8k2OZsxaksOdmCmZkUUWWkem9DINy2JhJKHHlkO4tTlrjk7STAJFzOnhogt/APhx/wNZ5LDQP6XA8cylxREvSe1WIG12qaC4Bq49LTNDKZ87C4K7PEdbtlFICCHFznK/1MtAbHFgOdoAFfJ0ZisK5pPMH0ewzbUAGhAy5Pk7t2Q4bdih2WIEQE4mq+Bqyx1Q/iedDtW1+KqJ4mo3tK4mlz6O9e4P6nHEurgc7UWBwnhHVgi2uJWG8v7Up9dygw2wPISl9JcNwtY6zQr4xfylrYm9z3I81i5XNlJWIKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by VI0PR04MB10390.eurprd04.prod.outlook.com (2603:10a6:800:219::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.12; Tue, 12 Aug
 2025 08:21:47 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59%6]) with mapi id 15.20.9031.012; Tue, 12 Aug 2025
 08:21:47 +0000
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
Subject: [PATCH 5/5] media: imx8mq-mipi-csi2: Add support for i.MX8ULP
Date: Tue, 12 Aug 2025 16:19:26 +0800
Message-Id: <20250812081923.1019345-6-guoniu.zhou@oss.nxp.com>
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
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|VI0PR04MB10390:EE_
X-MS-Office365-Filtering-Correlation-Id: a52fa38b-4720-4f59-f02b-08ddd9794759
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|376014|7416014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U1VyaDg2UVhTUTRWOGIvTG9HeXhLK1MrRmxJdVJJL0padWd2cHVaODB0SlNv?=
 =?utf-8?B?dzZnOFdhclNrcVlCdkFPZUNKV3hzajVRbms3cFdIRXlXNGlsZStlTHJ6b0Mw?=
 =?utf-8?B?TGpjWXU1NVBINVhTNUdWZUx2L2duY29xNzlkTXA0aUFxdHBtUmxiSk1HUlNM?=
 =?utf-8?B?ZzhsajNHV0pjMVhvWmlSc2JpUUhsNDZJV3pHZGE2NHl1Syt1MDJ3M29IVTRa?=
 =?utf-8?B?RjkvU2dhU1RhTmFJV3MwdDlXVFNIcUtabVJaN1VmWnNBbEpFcGIrUmlsOC9J?=
 =?utf-8?B?c0VLb1RGM2NHVWRWMzZEbCtkNXhNUVltZTFWcDlGNzBJMVB1c25iMmNGU2t3?=
 =?utf-8?B?R2x4V1U1ay9TcGd3c3lmV1oxYXFmc09lTEJyNExSUG5tN0tKMnVpRkg0c3k2?=
 =?utf-8?B?MWdQOFBSWndQNFM3TG42UGdIUmhuQThBRDUrRzBMQkhGSXJRUCt6WUNhcmhE?=
 =?utf-8?B?amxrcld6a2YzK0w0R1NmWDVDbENDbkJ6ZDFibjBmSDNaU3RzSy9tc01Bd2cr?=
 =?utf-8?B?ZHNkc1F0RGxZQ2FoaEhiVVJ4MlIyTlJEWHNDMFBMQWQ3cisrUHBrT0FDNTk1?=
 =?utf-8?B?aEdMMHd6NGJITy8rcWdpelU4YlpnSm9BL0x2Tk9raU1YNzBmOEdBMGtjdWxW?=
 =?utf-8?B?a0hKLys0VTNhWjhFWTJLK1RhMzFyek9LRy9kZkZyM0h0Yi8vSGl0dGFsdUF3?=
 =?utf-8?B?RXF0anA4M095SzhKWUNnT21YRncvMlNKMVF0WFV3dVZmS1dpaUJsRzdsU2RX?=
 =?utf-8?B?dEszVEk4eVkwOWlOcGp3OXdvenI0SzhQYk11TzY3Rm5vOW85OWJkQmhiTXNv?=
 =?utf-8?B?aVNabEZybktUdFJWS0ErdTQxVUZsSWZNYU5LUS92Z1kyVERCa2R1cTdIRXlu?=
 =?utf-8?B?SVhUaWZTTmU1b0tZTGRpRkdWQndaUU1xNHRPRmFYWCsvYXFXVVBUZlZsMlpO?=
 =?utf-8?B?QmdDMGRnakpPTFJDeW1lRWlBeEs3azJ4ZnMvbzdYdklHaEFHRVlYZTdlRzZ3?=
 =?utf-8?B?YzgvVnRLeHhRL1A5OG5aQkkyOHhCbHdUNzNRSGozVmpKaG9hMFB0WkttanBH?=
 =?utf-8?B?MURZT3pmSy9NYldGNmx5RllaaENDWFlDbXJmRnJGN1YrN2tNcWVUVlVlOWt6?=
 =?utf-8?B?dVF2VDNSUkdpM1BNSzVMaUVKcWtCa0N6YjExTm1sRlNIY2RwNkFvV1JiOWF4?=
 =?utf-8?B?ZTBUU09HcnJhd2dWYWd5dzZ1My9YcFhZQzYrYWx3Z0FjcE5SdkVHY2lZQmxB?=
 =?utf-8?B?U1FJbGJoQzAwSThPeWwzL1JzQlp4Qy9NSnR0Q25UQWs3bmNHbS9XYkJoMHdP?=
 =?utf-8?B?QkV2YnUzUWh1a0dqcDhEYlN3UVNjNUlKZENBRlZzVWd2Y1h6OCt6YTZ1VVM1?=
 =?utf-8?B?dEd1UUNjVDlmeTVSZFJLLzlka0Qzak52NlBvNTF2SWlzTnNZTmpSTDMvWS9s?=
 =?utf-8?B?Mi91THptcktwaGtVZ3hqSU5CaVBrU2xjelRSK3VVSFY1aW8vcE1pbEl5RFlB?=
 =?utf-8?B?MkFFZkdHTjd4R0V6bUs2dGo5N1U1RUhSZzhRSW4vVzdDbXkrd251VW9keGpJ?=
 =?utf-8?B?bkI1YmhrT1VqQmRGcURRRlBYVDE0VVByWGtFcnQwVFNNTFFqL3BuWHpHVmJi?=
 =?utf-8?B?dXFPMlluOGQ5UkYxNGZ0UnE1Y3JMMWtzWXhOVGhlSjdtem1IRlB3ckRNRlFP?=
 =?utf-8?B?TG16eEFoNmF2cGNaa0xBMktnVGNFRE9WM1RiejBZenhFSWcydmZoKzljOHZK?=
 =?utf-8?B?ZCtkVmNrU3BhK0ZtV0lXd3RESkxoUE1QK1dsaVNPanR0NElWVmFnZnA0WHVZ?=
 =?utf-8?B?ZGJMK2hWVnRwNlhUb3RpeS9hY2NpUDZFblJUY0FrekV4VWJVRERkK3VtNEFN?=
 =?utf-8?B?cFVSTDBhWExQVE9kWGV0cXpCV0pSRG9XMm82WThXV2tYakFDOCszangyREF1?=
 =?utf-8?B?eGRIWGdMcDhVQjhKemd2ZDVHLzVGT3VrL0p4ZnNTQUpyd0RQOXNvT0RKVDd0?=
 =?utf-8?B?alVITzZwOHFnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(7416014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1lKUEJSbGxWaTJwVml1ekNwb3RzU3ZnN284SHY5WW1DR2ZSeWhiOXZhV0M4?=
 =?utf-8?B?UGFWUzBzbWxyTGd3SnFJRG1kUUhIRjgyREI3Z0FCWHdqK1N3SDRXTmVPb0sw?=
 =?utf-8?B?aHJhK3lWOFZyek9mK2ZnZ0ppSUdFVkVIM3g0L21jTVVuY1ZBWjFvMUhEamxN?=
 =?utf-8?B?Q0xxZysrSmluM3g2NnNnVHhYTWMvNkIrTTVvOEZPN3lkd3dqbjAyZmNPY25s?=
 =?utf-8?B?Vk5zbmlFRTFNaFhLM0oyTWNPRGJ6eEY3eGdlRlp6SzBpYTliS1ZRUlhoTkVP?=
 =?utf-8?B?Z0JnTTJQd05BTk5GRFIxZXlvNTE3UXVzZW1jOVJxdDdzM0wyOU8rYjVVNHZw?=
 =?utf-8?B?YmFVQmRBK0FOWVZYMW9DdnhmS3FrYnF1a3V4VzJ0b1ZLNjh3alBXYWw0aG9E?=
 =?utf-8?B?Z09kWlU5cEpaQUV3VVNMRkxFakNlWTdYSy9vdTdlSXNKSnJaY1BHOERDbzlL?=
 =?utf-8?B?Z2p6Z2dFRml0VFBrU014NklPSFNLQjJYUzFZRXdtRHl6K1VmdVIzK05sZUVV?=
 =?utf-8?B?MHYrTjhrUmgzbDZUVHA1bUVxcGVoOXJ2V2Y1aXNzWVlUb2ZKeDJ4Smk4V09x?=
 =?utf-8?B?UjhPSk81Nmx3ZVZYOVNhMjdDOFRiVmxyWm5CeGpQQTZBRWNXTnpvNTZDdkY5?=
 =?utf-8?B?Qi81a2pSOU5IS0F5TnhwRHFQWnhYWkJrL2pqUExuWHdpY2phMEE4cUhRNVk1?=
 =?utf-8?B?YmNZWm93WGljRmV0akNqdUV6UUZoeUlkNW5MM0RLdGM1eUV3YWZrM3JnMGFp?=
 =?utf-8?B?eC9Cd3ZOalJ6MkZBWi9TeFdqeFMrL1hjSGNWVUpac2dWTmQyZzdwWWFNMVhm?=
 =?utf-8?B?ZC8rektOTUQzS0JPeWlndzIvQjVPN1FnSUgxYVVsWTRnaW9jV3NyeXlONGFH?=
 =?utf-8?B?OUprWEtmSTJkQjR4VzZJY0NrQ09IRXdpTXMrbkFUbWR4VUd1WDdjU0pXd0t6?=
 =?utf-8?B?d25PM3JOVUtLZWpzUDNHRVdCdk5ZZHVzV3BEOWxMQjZBN28vUUVLcmdJWEp4?=
 =?utf-8?B?UmxvaDFJNXhLQVVWMzlMYk9OMFpQa0JpMlFzTzNvOExCc3p0YklaSmRHWE1i?=
 =?utf-8?B?YlJmTnRySFgrU041QWU5OUQxU3prODNvOGxJTnhTS3B0Z0RVZFI2d2JvYmZK?=
 =?utf-8?B?UFVUZVdPOUpBdHdZQ1FPVmJXVzVTUWIxMnVoaTg5T3N2aTJsdEplejVMVytB?=
 =?utf-8?B?aXppUWhvUzVKWVFqRWZZMnlwdWlUMmxsdW5jdFpodms2aFJsK1pNUUNza3cy?=
 =?utf-8?B?THpZL3Q3Z3BvYjZYOTVoZElHcTVMV2dGUURhMHBYOVpPNWhEdmJIbGdoZGI2?=
 =?utf-8?B?c29aUjBtSWJPT0lEeW1meXlIYkQwaE5mMWtvak5hYmwzWHJ6VjlJTHRGaEk3?=
 =?utf-8?B?d0U2bSs1N0w2d2JrRnlpOEI0V2hnK05na1YrS1RDWUJlTlFwZ1lZWWkvQWxy?=
 =?utf-8?B?TnJNWGRFMUJnU2R1YVZTRkh6V1V3Y2laYlNFcFVMVDJZTFUrYzFCWmZ0ZkVD?=
 =?utf-8?B?UGt1c2E3L2Y0YVErcDFTT29mUlBwQytzQTRXWnNEb1IrRVZCdVNxR0ZIRmRS?=
 =?utf-8?B?TWRTbjlKYVRCZlZVV08yR0NTTGFPdHBCLzlaSmdLbjN4OUswVkx0dEEwV2NE?=
 =?utf-8?B?SW02RGp3cUluT2FsMXBOWWMxWDJhVXRXZVVpUkJ1YWc0ZkNzZlFrRUNqUjhC?=
 =?utf-8?B?UjBUbjhoTTIvSlFNNm5vQUNqUGd4NGZtQ25lL3l0NVp0aDBra1dnaDIxbzFS?=
 =?utf-8?B?M3BsN1JMZzExSVhDbStqdXpUbXpockN6UWg4WXg2c1h2NE9wOE5QNjVUeDI2?=
 =?utf-8?B?U2J0WFkwRSthK0lUQnNqSmRpRkg1Szgyc2cxdDMxa1BxNVVmWk9xcWt1UjUz?=
 =?utf-8?B?OUVvWElFMDgza2YvV1o5UGdTbWhMTU1FMVg5cElTMTRWT1BhbTNoQ0FqSHdn?=
 =?utf-8?B?QzZLOG8yajQ3aWIzcW5yV2plT0ZUTU9jV1pLeDBDWHNNYjJmK3M0Qm5VT09X?=
 =?utf-8?B?S1g4ejd1MUtBZ3dtQnlRdzhkaVVSd1dTM29iK3lTWjM3TDhGQmE4WEZVNDV1?=
 =?utf-8?B?V3NUblB6aEFRQjcwZ3RVYTNZc2VLRjhhZ1IzOGYrWjZQeDF1S2pQZkZldWpk?=
 =?utf-8?Q?3tmPpSSoOz2o9mdQG7SPV36b4?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a52fa38b-4720-4f59-f02b-08ddd9794759
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 08:21:47.2274
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XC2YOvZ+exQ6qSj9uiluEM6EwjXt6kWHWgBwg1BblPSKdcsOZZ9lta1kq6DkQdOYwXxY9+UreBaKfkVqnMHA+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10390
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_013600_990077_969C65BF 
X-CRM114-Status: GOOD (  12.29  )
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

The CSI-2 receiver in i.MX8ULP is almost same as i.MX8QXP/QM except
clocks and resets, so add compatible string for i.MX8ULP to handle
the difference and reuse platform data of i.MX8QXP/QM.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index 071d939d9048..14cd08f9a4f6 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -1136,6 +1136,7 @@ static void imx8mq_mipi_csi_remove(struct platform_device *pdev)
 static const struct of_device_id imx8mq_mipi_csi_of_match[] = {
 	{ .compatible = "fsl,imx8mq-mipi-csi2", .data = &imx8mq_data },
 	{ .compatible = "fsl,imx8qxp-mipi-csi2", .data = &imx8qxp_data },
+	{ .compatible = "fsl,imx8ulp-mipi-csi2", .data = &imx8qxp_data },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, imx8mq_mipi_csi_of_match);
-- 
2.34.1


