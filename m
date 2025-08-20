Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEDA0CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 11:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l/He38BwOve64SoyFk8qCen6DToL2e8S7aAbMgGQo+I=; b=H3AzbimwAG7FhQpEkgyoFZhj+t
	S76Yxvf+arliHNNko0VrUv/dOY6JUzSp/HSKVGSP5eXZwDS6sI6kkA3/Jql7QhrulGCXjc3HflkWs
	MLLtMh7DcezK/nVhQ0trY3kbycqzr27YCP4jLwaDBiRCTj0mJebgJh1jz6DiSo83VndQeTROHuBTI
	SJd5xMUlLxJHjXN8ScrinCpq18vic1QQthwszPTVrjYCam6799HYFQWjx1vNfwjKrTBrZRCzsJskH
	PV7y10iUuzeghKpk/HqRJRH8aOkOq8wSVHQ/BwI7rlWCWuLFdAXhcmwPfQrtAp/5dthgW3KRmARlF
	0hlop5pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uohJu-0000000DTC9-3OSM;
	Wed, 20 Aug 2025 11:49:34 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uogrj-0000000DMmd-1d37
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 11:20:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FvfylvYEoFGeLi2i+qC9lFeh0HxJelWWe4GgXM3jYu9IOYCo0uoCcqsLaF9PJ+cWExP6s9Z9od1eBMr2ZhXKoVObdXCjrDQN1CdT3GJpumX9e/UxHdIaE/VSrlbgX/5uusxAZhh4MZ/XUh5AsZaVSOQY2Cu+UIEY1uqFRuLamD+L0y2NhqGNH3/4K8pEC+rRRFP2ly+F9626TTqb1iQ/n8yhp/sV36nfkXMAtHqZ5lidv9tgo+9bPgc5PlgJPVNMsm+iphDcNw0qNDofinzq+Mk9RHtZs5nwPd9zmVfztc24AKQ9gqKkpgPIh0kSXccegoTCfwJFv6u5SOmsaY1y4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l/He38BwOve64SoyFk8qCen6DToL2e8S7aAbMgGQo+I=;
 b=A+ERY2Gm71WtYJwpbPdpEguEK1UFtM185BBeqyg+OMlwNnNcJLBk3CqtI2e1FfmNhgCkOzJEO3uaavXIxxqA0OOiee87CGVW8gmeR+qvDDBBMtZI2M/FUoZEd2J5V/SLIhz7EuSWIsfV4VC3AGD8y3RVKFSiKlCsE6lPVMt0N3w/bDUZVTtjbZniHIzpusla9P7D8AZsJV9QQwXJrwFADVd/UIpsfzGG3hbhpbx6ecpE7Oujg87vN0/N1D/Mcr44vNO6rxKuWxwGGzvUzmgbIXDfA2oQx1e3Fab5RylCmvbNKVyEY+Ds306ASM4c1zA1kkpXCcDG4GljkJHXjMAg+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l/He38BwOve64SoyFk8qCen6DToL2e8S7aAbMgGQo+I=;
 b=hKr4aXLSiHulNYv+M1TSiSOJc/c6bK6d7BaD/qj++kmrhIuoBgC3nziEgQuij3q7D2AL1+Zfq7kKc9l5iEMckOEiUPUofk1HZfLCZbkUwPR6gLQUXPjpn3ULGFeEA3BiBpcCDGzRq2hyyOHDB9EkSvq4zdBr8IAttoQce3HQFom/Dd2NsWj+eN78vC2+Rtmi4hE6HcYX0Gj2LwHy4exXZOCC3yWjK+W50DP5ijPrmvtRgfM1tJn1WVuCIbNnFXnQ0/Y2EUZYtExk9Em/fHJvsCO3Yd1Y6LB1IQAcq3dzvC9r8MAFNp0GBcRxC7XWxjIjFFzucxJYQmn62Z/51SHv6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by PA1PR04MB10913.eurprd04.prod.outlook.com (2603:10a6:102:484::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.13; Wed, 20 Aug
 2025 11:05:37 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59%6]) with mapi id 15.20.9052.011; Wed, 20 Aug 2025
 11:05:37 +0000
From: Guoniu Zhou <guoniu.zhou@nxp.com>
Date: Wed, 20 Aug 2025 19:04:58 +0800
Subject: [PATCH v5 3/4] media: imx8mq-mipi-csi2: Add RGB format support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-csi2_imx8mq-v5-3-e04a6fc593bd@nxp.com>
References: <20250820-csi2_imx8mq-v5-0-e04a6fc593bd@nxp.com>
In-Reply-To: <20250820-csi2_imx8mq-v5-0-e04a6fc593bd@nxp.com>
To: Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755687914; l=890;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=+MU93QfXHZ+PZzOSCVEvrYi9oSSdBn47b9qqLHfG2Lw=;
 b=HypHF8qeJLBkvWXOzNY+/NTlr21otlJd2ipRSGEyJHkhtldUCmM4qSkESmzwOcOg1YVFezDKw
 5GwBj8FLVHwBe0LayMwboi5zEasWbHcjsAiQkhNIFtkL/e0O+IjU3Ut
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2PR02CA0031.apcprd02.prod.outlook.com
 (2603:1096:4:195::16) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|PA1PR04MB10913:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d154446-eb6e-4985-dbd8-08dddfd97e3b
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|52116014|19092799006|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?em40SVQ0TWp1ODlrNWYrb1psRDJSZ2hTcFZqeUdIVWgrekdUR0U0WVFqVjd0?=
 =?utf-8?B?R3JWWTJKYUtqelkySWp1aStjZm1zN1RNSTFqMUlOcy9hV0V5cXF6ZXcyUE5S?=
 =?utf-8?B?cXQ0S0Rmc3ovT05GL2lBZmkrWEQyRG8vZUVPRWVDaXROdXJVMUFuSnJhSVhh?=
 =?utf-8?B?N1hWbk5Xc2pQS3lESlRrcFNxdlQrc2pnN2htcGwrQWltSmRScytZUld0L0oz?=
 =?utf-8?B?ZUpDWk1ZNEdKNGxhTGp4bHlFZFN5bUl6YitQbVVoNmp0SUNMci9DZ2duV0x4?=
 =?utf-8?B?c1ltMTU4RVdMT3hEQ0ZxU3A1SW1oK1lwNEpkKzJxVWRESXg1TFBQUnRCdDk1?=
 =?utf-8?B?UDJybGc1d0VyMnZJK3MvSEtUZUNWOEtoejhJa1U1ai9DeUdQZnpUN2ZXMHFI?=
 =?utf-8?B?VE5FYUNxR0ZiK3R2MnFqWkw5OS9CbWVNV0g0WVVRaDA1aURjcmREV0V4N3lC?=
 =?utf-8?B?R0lSWDVKTVlCZG5weFBERWJhenF1SzhMR2tEV2ZGUmJic080R0RmMDN1SXlV?=
 =?utf-8?B?U2ZjNjRjYkRoemFVVS9HVEZVb2V3WEpGN0V1WDNCaVEzTG5KbDBwOTlPMDAr?=
 =?utf-8?B?ODlxeXY5dXg2eFVIVUhrWDlzdkQzZUhZd0tEdUJPSXMySENLbDJScFBRQmZT?=
 =?utf-8?B?T3FDVnhmWnZjRXMxbTlmZW9uU1hiMkxDS1kxbTlzOXd2Y1MxNVU0VXVGdlRJ?=
 =?utf-8?B?Rk1idjlvSDd3S2dNM3lENFFMcHpCdkhySVcxRUwwQWFYTXNUR3drRlBiNHdi?=
 =?utf-8?B?VTlzSFA2MVRDV3ltVkliVDZQNXJxZjlpdDE5R0Yyd1hPWlNkQ2l0T1p6NHR2?=
 =?utf-8?B?bjlwVFBOUTJkRysyR2VFTFo5VDJJb29qWEtNL1cyMWhTeHBXczhKUU9SSTh2?=
 =?utf-8?B?OHd6R0Q0aXROczNCaDJuUzdCc0MwU3JGTGFUakUzTXZLcXVKejBFSk14ajZK?=
 =?utf-8?B?TldJampnWHUyaWZMSVZqWmdIZG54Mlp5Z2xBNVUvZ0wwUVNxdVNYWWUxSldP?=
 =?utf-8?B?UDRnZ2t1SytFOHFUbU54UndzazFyWU41aStrTlhYazV0Ukx0eXMxbCtCV3Q5?=
 =?utf-8?B?K2QxTGttV05RVnhJMXQrYzl6YVNGUEJwRzhYQlE0U3E2RldQbUIyN08yZEEx?=
 =?utf-8?B?R0RUT2lHckVXSDc5Y1FhVUNydHVycXY1dTNHcXhKUnliRHlpWjFrakx4ZjRL?=
 =?utf-8?B?QkcwQStWei9iMlI5OThNTFQ2MmNBNXV4TGt5OTFFUkk4b3RMRzRXbGl0UWZv?=
 =?utf-8?B?RjFSVXduOXpxaDQ3bjQrejRHTFBXemtkNUE5L0tLeE5RMklNcUFMSnRGZERF?=
 =?utf-8?B?MWNRTlE0NHRKTnBQc2x2bFRCRFlOcllySTZicUFxVzBGSnBBRlpERFNuRXpm?=
 =?utf-8?B?WDlYSm5hK0pzRXRuOUd3TFYzbkczY3JuWnZHeVdSL2xydmZhQnZ6cW5tNW9I?=
 =?utf-8?B?UHd5RlVvY2QydXNyWUMzMTQ3YTVYTzBRMDRtdnlVRkpWVGZFL1FCQWgyUHY1?=
 =?utf-8?B?MExuT3J0TlFtQ3pkWjg5a2pvT2NabThmMzQ2N2syT0NpZ2U1S2lQS0dWRTgr?=
 =?utf-8?B?R2dhZWF5eVVjRUludk42UGFwWlBDbi9IRlBvcjB0YnJpTld1SkIzZjB5cWxD?=
 =?utf-8?B?ZjR3YXRoUStmUlNpODNUKzhZQlI4YVM4bmUwVVlLV2h4cExpek9taUpwQnIv?=
 =?utf-8?B?bGNHMFEzRCszSGVnSHQ1Z3k5Vy8rZVN0Qk5kcGN1VytRUnRnUDdCZmVXcWxx?=
 =?utf-8?B?djZXM1NMdVcrRlVDTjFSV0IwejBDRXRNNldTWDFPQ3RhaGF2UWIzQWVTUDlj?=
 =?utf-8?B?amN1TlQwVUJ1ZkNHU0EvTU9wRm1talFsOHltS2JJM1BBOUk1dENNdXgwV0VC?=
 =?utf-8?B?T3FscG81WWg5QndVNmdyUitETDFVTnVYbHhYc2piUHMwVzR2c0I2cXRnb0NT?=
 =?utf-8?B?c2VORDJyQmdldzFORVlkTU1hQmlESUlEZ3h6dDFvdms4V0lIUjRjRlJnWDE4?=
 =?utf-8?Q?4Jz+IlSJOpLu6yJWLTFzydGKj0+shA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(52116014)(19092799006)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M1U1TEg2cGh5US9nb2FNMmJJMVZMaU9yOURrZnUrWmpwak5DMmFZRlBEZlR2?=
 =?utf-8?B?WGZiM1FsYUdqaDgyMkJFT01VVHcxZ29Qa3NQL3VuRFNKd283S1RKd093ZG1P?=
 =?utf-8?B?R0lCdmZYV1plSTg5aWtLQ1FreXR6K2xDZjF2TVk0Sm1zcm8xb1lwL1I2eW12?=
 =?utf-8?B?Y3loK2pxdWQyTGJuSXhGcS9zUFQzV0UvTUdDVFBXbkw2cVBVRjlaRCtpcC9F?=
 =?utf-8?B?TnRkS0hJUFFTb1BJcnVvOXNzYXBPbnA0VkhDWFN6cllHRDVXcStlZWVxOVlt?=
 =?utf-8?B?OVlCcXp3aUhOSDF0TmRLNjREb0JON05EOWVUbDUybGkyTk9uMFp0VnpMN0Fa?=
 =?utf-8?B?Qm44enA5ZjAwNlIySkxOMUZyT2Y1WGlKRC9PdUp2YzBGU25XMXNXSlV2ZnR2?=
 =?utf-8?B?SWd6V0NDRFZXRlV2eUhEaE53U0c2OEVCRWVGSWNCSGpSZXNtb0tOQzRGY1Vr?=
 =?utf-8?B?RFQzTXcrYkNrNW5hN0F5eUlsRG5UN2dFdzI4Z2RnMFo2d21zdTF2NGVRKzRP?=
 =?utf-8?B?RjVWZWcraXVYbVZuMmV2Tis4OEMyaWhnVVVmbndnNkpvb3c3VnFUM3pJNnBI?=
 =?utf-8?B?K3ZwUy9CelJHNWtmWEdYaTJ5c3hnN0dSOHJ5azEyV1k0SGZkeFcyQTlLWWhY?=
 =?utf-8?B?blpRN2lLQ0R1QnJ6UmF1ZFY5cnlkK08zTUhMcEtFVHdQWm1CYW5yUG4vek9a?=
 =?utf-8?B?dkk1bUFvWU9JRXRjeHZxMHFwNy9BT1hpc0M4MXJGMVYyQ3dQMEUrcTNMeXZy?=
 =?utf-8?B?MnNzdmNTbHRBaEZMcXoxK1cvWkpwWTdudkJxMk5kZ0RsQzNpc2Ntc3FDKzJ0?=
 =?utf-8?B?WHFvTGk4RjVwNnprR3F2TktyMWdNb2lBdk5pamVTTkt3Um1FdVJQY2JpTVpj?=
 =?utf-8?B?NHc0bEJVZ29EeUxCQVNrUVJ6Mlh6UEd1eVVDRG9vMXM5SUZYU1ZhQU0rUjNy?=
 =?utf-8?B?Ti9iKy9qejY4NGxheXBoQXZLSWYyL3dnZ1ZqOUt1azh4c2QrbDNCK3RwOXdm?=
 =?utf-8?B?Y3hEU0pyVnpyL0c2QUhFQlUzd1hJTFdtQWFJZjJSVmZhb1V2UjZKRTJSV0do?=
 =?utf-8?B?REIvYjVYMHRMME0yUjRFUTlKc3BrTmNtT2tmRFdYTGtEc00vSWFxYXdodVYr?=
 =?utf-8?B?dGdaL2hLVEFjRFhwZDNRcjVlVENJcW5zRGRsbTlPcEJtRmFkYkZTeDQ2eGFq?=
 =?utf-8?B?T0tOTFl0cWNKZmxjcFB2eW44S1oraTFTYWdibkVHNVRDNzFuWk5xTDcyZmNw?=
 =?utf-8?B?dDNObTkxelEvSURxeHJGSzJ6NTJaT0d2SzRvMUJZaUpsbTViSXdMZG5md0hH?=
 =?utf-8?B?R2J4ZU50cFQzc0FJakZmMXo0UXd2SlJlUTAxQm5jdFF2KzBHeE1oU29RbXhM?=
 =?utf-8?B?VmNnSEwySGROdEFXRHUzUCtwV0dCS1FUZ1IzWmdFR243TmVzNUFiNnROVjlT?=
 =?utf-8?B?K1R2RGx3cnNpV3NsZ1pQeHJPZm5IYkJOZENDM2l2cUZIcTBQZVZsUmdaMmJJ?=
 =?utf-8?B?dDJUYUVlWGRnMVF0L3djdXl1Q2hQSWN6Q1dvaFZ1Wkd0SXJZOEhRWHFHb09O?=
 =?utf-8?B?eHdzYXB5UG5OT2Q5V2lRaUxjSzNReHk4VTQwNVRGNG5sUG1WTGMvMFFhOHdw?=
 =?utf-8?B?bThsbWFkOVBTb0NoZUVndnFGcjlKYUVzYVd6cVlNVzc2cFhROEs4RkZVWnhM?=
 =?utf-8?B?ZzRpSWdFWm5ORGhqeVFJMCsyV05PVVJ2bjhTVktQZDBHOUJTY2kyNlUyM3BU?=
 =?utf-8?B?RU01NWNSWVc2dGxqS2JkVW5FRWczQTZuaUF5eElmek9VcCswR2toQ25GZDQw?=
 =?utf-8?B?WGRjckRiSXBjaFBYL0hSdWhwb005RkpiV05QVS9pOE1yVHM1aWM5YUU4Q3ds?=
 =?utf-8?B?Vkt4dzdCMmxVWWJXSVhxcEw4Y2VnRUorZnU0SlR5eVFCWE82bUh0NFVuYUds?=
 =?utf-8?B?RnBySk4xZU1Ed2tHeVlhZ0FWcnBDamZzR0xGMDFBSVphMGZTSmlWdVB6TlI0?=
 =?utf-8?B?cnRUYXE2ZWRTMElDU3JxZytqZGdHZ1JjZDFTeitQbHYxaElGVGUrV2JoV1po?=
 =?utf-8?B?MW9HekxPZHY1QVV0ZTU5UVFVa2JJQlFWTCtMRkx6R0pwRS9XWkVMV0tKb3ll?=
 =?utf-8?Q?2QZlQ3I+oQhaJigGND5xOYMcy?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d154446-eb6e-4985-dbd8-08dddfd97e3b
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 11:05:37.7294
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tGOt4GN/c/pYxc0cL6vc73YuQrQy6uTpl1FAFVlJt6zq2oGAp+dMwcPd5CHP3pZ72e3am+d/cSe41oqua8UxRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10913
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_042027_427454_B2906516 
X-CRM114-Status: GOOD (  10.78  )
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

Add format RGB565 and RGB24 support.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index ad7adc677e389e0f35b0cf63195279e197907f8c..529928b94a193e02177f8773a0e68375b59b0a08 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -306,6 +306,13 @@ static const struct csi2_pix_format imx8mq_mipi_csi_formats[] = {
 	}, {
 		.code = MEDIA_BUS_FMT_UYVY8_1X16,
 	},
+	/* RGB formats */
+	{
+		.code = MEDIA_BUS_FMT_RGB565_1X16,
+	}, {
+		.code = MEDIA_BUS_FMT_BGR888_1X24,
+		.output = MEDIA_BUS_FMT_RGB888_1X24,
+	},
 };
 
 static const struct csi2_pix_format *find_csi2_format(u32 code)

-- 
2.34.1


