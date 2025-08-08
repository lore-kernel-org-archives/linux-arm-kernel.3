Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A5D7C87FDA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 23:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YYio+/KsxgFpeUyIhCpRlAxnLNwNKKyXtizAlDVl8zQ=; b=ZXt+1yr4bKgtrdin3L5AJfUZuw
	ODXpguWP3VS18Ff1NXqFr/u3h9bu4R7c9NABtCqT83rPfddmWLDRB3sLNy5Z7FtisZJFQk1i78tKW
	b6xriR7WoaOHa07TuJZLbTqOEoU0z/u8DQ1WYi78N0dvW9f5q9Ms3wcKTh+3w5h8qu9K41xGPlqSP
	3tCPhTbQKJPUzs2RlGgcklUF7d8SVQeUOsKlmDIA+gzzcmtH9PkxigaAncmJor88bK6Jv+EaHf4Db
	90J/psxaFxauEfNckmb+JprLOmfn2g5gq/M/3ou0hkc+N278cwxhFxt7CGPJVGPzuhEXRMUZuer6N
	0aA3hBvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukWid-00000003svY-15TG;
	Fri, 08 Aug 2025 23:41:51 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukVmx-00000003nkQ-3kXN;
	Fri, 08 Aug 2025 22:42:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=txhsZP/9NEnUFpAnUst6MtPigfmgRsOETlSWCPFFsC7F45MYbXU82AeD0bLgeH59YCok3hN2B5d+NMqqUOftXS/Bohs04PJPBMYRt8y5R4g6Y+D5tsW5aVqzqo82Z+CKrXKnhVhsvDyBoPoOCEBhIEee9tkAxx0V48fJb3Yb6m5Oab5y0S8XSGrBv3xh+8/iSioA3m/sXnFh4ARta/qrwUVwUgSLZNs5r9Hx23VlRE3PBGBnurTGSPVOM4kJRm+pNd6rDsFHaGcDHMlrKWWlhgiyCSNCOVoQsabIYITO1hm2vFmoxYsWje36E1lvYspVsNDVyTyAAYQpJ8kho/TiKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YYio+/KsxgFpeUyIhCpRlAxnLNwNKKyXtizAlDVl8zQ=;
 b=bI6JNIb6S4o0b+fr4wALQs+aJxffM029DzGMlIb6UTBRIxVLE4/ePENioPQEUUjBKz0aJSRUDauP3EqWcb9GWmFhdxAIvORr+QmnJBgwESEAw99wMAdtEpQ6m+XmXET4cFtC4L8kso3EjeKqcSarNfovXiV3E3UrKkXWb4Zs4P57gjzzM315I0kk4ZvvGcbhSFlCWUMtT51Y1aHoLksilAkv+hkRgx3NAhJeCbtxZAcyYJdpv9QhRTPE3UmFfm0vta4o9vx96TGt6dBod7i4jh9Cd9WLYWZbPbLmeAyoN1P+XvwY6CVYM29i3Mr3aHnNsRUGZ8To910NGC9aF+OfVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YYio+/KsxgFpeUyIhCpRlAxnLNwNKKyXtizAlDVl8zQ=;
 b=J0kkNVxhoGXgXWhvPVyxTFMNLHbNKCyOIMFR9cPzf3I5VepxMXfZMe2F1zi04AjtTaCwdlBFwvxPxTewZzu2nybMowTemRscK0c7+3dr1lgi48f8e861nexVhfj8Eiqqg5YcSML2SO9ACkrYpIsMok4QpRTyF8ZFhu69inJqfmjo6ftgPaNSeqnbo2ciBvU1Eqzui6rqFGDz2Ecw5OYxuy6yh9KShNPKfjStoIdicszSSTSDx/iJX3VD63lHLOKDP8IIUap2J6rw9R+0SYK/bFA1/Oa7EYSoAuKoP40Q7YDF08yzwbXVb8YDFXqpKO2ohSqC0ylDeJXRC9rgYqQ1DA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS5PR04MB11346.eurprd04.prod.outlook.com (2603:10a6:20b:6c1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Fri, 8 Aug
 2025 22:42:13 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.9031.008; Fri, 8 Aug 2025
 22:42:13 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Fri, 08 Aug 2025 18:39:26 -0400
Subject: [PATCH v2 23/32] media: synopsys: csi2: Handle alignment
 requirement for width
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-95_cam-v2-23-4b29fa6919a7@nxp.com>
References: <20250808-95_cam-v2-0-4b29fa6919a7@nxp.com>
In-Reply-To: <20250808-95_cam-v2-0-4b29fa6919a7@nxp.com>
To: Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Eugen Hristev <eugen.hristev@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
 Alice Yuan <alice.yuan@nxp.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Steve Longerbeam <slongerbeam@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
 linux-staging@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754692792; l=1837;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=czy/5iGA9YezvC/p84fZrXSGwyH7l+n/K9Hby0cnaKk=;
 b=jDq4n/LLYF23aXQ7mPpThYhN1DUozzQluo1pcOC3QUrg+yoh/DNBQBhfMjCmjomDWbDWmLekF
 B9bnFCqAtM3DVKuHIBAIJ70Z/5c7Yrpi+reDET3wsiLeO7Dw0xv943T
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7PR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:510:339::7) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS5PR04MB11346:EE_
X-MS-Office365-Filtering-Correlation-Id: 7614530a-c219-4184-c0af-08ddd6ccd157
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|19092799006|1800799024|366016|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eWo5VFZEVjZYdjJoV1VpSlF5aGJnaUxVUTJjMzE3L3UyakI4eU91NmtpNHJC?=
 =?utf-8?B?MG9ZYkVhdVhEYkJGV1lrc281WTFSV1ZLcUNSVTIrbWVlcURwa1pSQ05DeVh0?=
 =?utf-8?B?bWYxN3VPSitqUWZhVXN3RWgzcGZRTzQzdnJ2VUhJR2NGOTFNVnh1SUZLUWF1?=
 =?utf-8?B?SEN5RlBqSjlJYnZiSjBkNlpTZm5OMFRoaVllOUZPVk9mQ0gyNkZJeW1PL25Y?=
 =?utf-8?B?MS85ZjFpQ2lLNkxLb1ZJMnV3M0hudzB1MW85a2VxVmlGM3FKbE1GdXNhRmM0?=
 =?utf-8?B?UUdFakluWHVjcXY3ZjA1ZFJMdTZMKzVyWWNET0lxMzBCakFadnBoeE5IWDJB?=
 =?utf-8?B?Sk1jUE8xNzVkOW10RzgzelpkRXJ0dGRpMDZNVjJVeHhXVTJlSTJ4d2h0SkRY?=
 =?utf-8?B?UHJkUmJ6THo5U0lzcnlaRGQyL3NkeGgwWE5HYTZFZHlIMzJBTTZIbDJsNThz?=
 =?utf-8?B?VmZRUTZydXpYdWhlN2ovak5KcnBVaE9MS1Q1WlBVN0dsNnZid2VkTHhFUGdo?=
 =?utf-8?B?QUUzcFlsbGdOZm11eUxKTzcvbWp5bnJOVmJ2NVJvTWxva0ZLTFg1YmcxZkhD?=
 =?utf-8?B?VE04V2lQRkpqb3lZbm5qVG8zVnBLQndSTDlNZm5nMm1KSllVRExETnh4TW5G?=
 =?utf-8?B?TG5LK21PSWdTNHpBNm1vMmF5Q3d5N0Y0NFYzVzM0VUlkK252VWlBaFYwSnR4?=
 =?utf-8?B?eENNRDdDamVPdTdlcTA3d0wwTjc1d3dEeFJobllxeGRkOE9mL1RsOEtBZkJX?=
 =?utf-8?B?cUpNOG5jcUxFeVRBZ1JVRzV3Zm51R2ZUZmxWSlMvZWdQWFJvOWliQTQxMlNE?=
 =?utf-8?B?ejRQa2diM0psR3VkaXR6ZU5mOGlRVVpOakU1WUZFVTR3SnY3SU1jNlUxS3hu?=
 =?utf-8?B?c0cvenFSMEx3aHozNkRUYUo1S2N0eUZyWFExZzFqSTA0dWEwR25udTZuV1M3?=
 =?utf-8?B?eiszeFlva2EwTE5LM0ZHb1JvSys0QkE1N3JzUlkyK3RFZTNwL05SOGJOYUNS?=
 =?utf-8?B?VVBoYkp6dC9uc0RsZTZLalFwMXlmbkk2TDRCckxERVovMGxUWHV6Q0hBYThE?=
 =?utf-8?B?bUs5c01FSnl1UGdTODV5czcvQVFPcFVRd3Q5TERHUmtOR1d1RjljUnJBN1Nu?=
 =?utf-8?B?N2Q3blZiVWhobE82RmhiR2FHeWQrUjdwY1FNY1VKN1JyTHJtQkFLUy9LeS9C?=
 =?utf-8?B?Y25IeUU1WnZ0RHQrWHVwbGdidFVlWFhGdWFPWGNITjNnZWVaaXdLMUpWOHN2?=
 =?utf-8?B?WVFlNkZVZTRNa3NzK0xKLzdabHN4djEvR0hDVEdYNm1RRjgrcVU3SSs0QTdM?=
 =?utf-8?B?dXBlNms2OVNHRTZmeDEzc2IvSFEySEpZQ2NXbWwrUXliWTNSSHhJK2JjNGJy?=
 =?utf-8?B?b1BsdW1hRjZuejFBV05Bam9reFdiK2VUb3FSbDJsYzlZVUpSNi9XZnNnY1Ft?=
 =?utf-8?B?ZVpWTERGZzRENGhydkRrTHJjcC9GUTFJSUUyZDZaaU9MS2poNG52UmltdHkx?=
 =?utf-8?B?Y2grMlFFTHJ0Zm9VZkpnYUJJZnh5YUtKRms3RlNSM09nTE12VmlKSXI3V2dj?=
 =?utf-8?B?Ym8wZ0lRMEt0cEhpMktjU1pWQ1R4VlBPTHJqTGhSZFZWOXdyUE1LbkNHYUwr?=
 =?utf-8?B?dEE1YlNRM3VsbVUxNFQzd0ZPaHNFUG5VWGlGR0xHa2ZGQ3daSVAxdk1iaDJB?=
 =?utf-8?B?NXhYNmFtOUlsNGw4TEl2amMyRGZNZ2JudmN5REhQTjB6SnMzOUpwNUp3Rmp2?=
 =?utf-8?B?LzRNb1VJU2tYZVo5ZWsvZ3cxTEZWUk1YVFc5MXM2THlUaFBBaHF6SXhPQmQ1?=
 =?utf-8?B?WFpmTnBLZ1M2S1h2S2VUanJXU2loR1VsTlJtZVZYRGJRNzlvd1VFWk5JRnJW?=
 =?utf-8?B?VVZMU3c3V2JDQVNLZ1BkWHdsZkJ3T0dZTDZtSVBvcUZscU5yMWc2bWZ1cTBn?=
 =?utf-8?B?QnpGZVRGUUlLNVdEa0pxS3pxREpxajdYdk9Od1NUTGtObDRtOTlTUDl1Rmxx?=
 =?utf-8?Q?58sup63XU1LhZ6t45WlV3Z9I3orp5I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(1800799024)(366016)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1N1NURkczErZUN0b0NJc1Z4eU5qZ0x6ZkQ3VUdodlNWWEtlbkVFbHZSbGFD?=
 =?utf-8?B?NncybWZSRmZiZ0VTZHB3YStxTUpVMmJYYVowVlJTaFZiQ2FUdEF5enlFUFpC?=
 =?utf-8?B?R1pGK1ZXUDlKeVhjUE9rWjJwdlUvVlNEMUdmMTVCbElWY0V5WENnSnE2UUhM?=
 =?utf-8?B?RTVveTFmSVlZT2J1WTE4Tzd3ZHByRXN5YnVsdWQxMU5oVFgwWVNHNGpScjRw?=
 =?utf-8?B?WkxYVitMb3BPRnRJUjdlQ0JsVGxrbTdTM2dtT01lWE9VV00vbUJtVzlRZDk1?=
 =?utf-8?B?ZmFpUVR5dDRmWUo0RldSUmt1ODBQZElXR1RSTThaT1gwdk1VR0FxM3I2ZnNH?=
 =?utf-8?B?UWtPejB2aE0zOWNMZHpNdkc1aHJYME9xbmNwLzdnQlR3ZHdFSDRHZUthRC82?=
 =?utf-8?B?QUlybytpNTByNmd0U0k5dDZWZ3dySWFETU9tRVhXZlM4OGg0M0JDNjRtcWE3?=
 =?utf-8?B?dEUwbmh4cnp6WlJTT1NiOG9FSVRXMDFCQ0ZHS1I3aGxEK2RyajdoNVlKWHpL?=
 =?utf-8?B?NVRyME1xTHg2dEdHK0VnRTBzUnlqTjlHcHV0MVpRYzQ0OVBxZ2xOZmNqNGgw?=
 =?utf-8?B?ZUorYWtNZ1hhcUR4N1ZBZENhRkRzSVR0V0h1NlFXMlA1UVlVelZNaHdNSlhv?=
 =?utf-8?B?ck8zcy9sL24xd2N6aG9OWS9YZkVNdzZndkVDQ091YjJjakFPcndnZjdCNzJv?=
 =?utf-8?B?VGgxamlRL3VHS1Y1T2ZNL1FJK1ppUTEzVUxUV084dGRhbE1SeXJkRFZQRk1i?=
 =?utf-8?B?TThvQitNY0xxMEJhM2xCbnZXdVVVZXNheXVpRHlkaUZyTWcvRHZlZnRDYm9L?=
 =?utf-8?B?QnNJcWFha084ZW01WXl6SXVTL1crUXA1WDA2SnVmQ3U1b1FoK25tQ2NMbXQ0?=
 =?utf-8?B?NUxUdzV5ejlOT2x1anZWaS9zTjY0MGtFaGxnRnIrYjArb3VBTTdJaEFGdkdB?=
 =?utf-8?B?U0YvN04rdnBuTEZ6VWlxNWJseUtodVg2N2YvR05ndm85dTBhNUdpS2tRSjhq?=
 =?utf-8?B?azFMa1Y4ZGZtUmx0bXFpZVJKcnpGYWJtaE5ueExkUkdNVXFQeXM1RmY4bENB?=
 =?utf-8?B?WWcvUVV6Yzc1NjZTcHJ2OWEzaURHbUFaV1pBdTNBRjZRVk5XRUxkOWQxRyti?=
 =?utf-8?B?RGo5c1p4aXpjVVRuVVh2SExlYUg1ajlxMHVhSlVIRUs3YldDUXpYcHFZaERO?=
 =?utf-8?B?VEIvMWNweERvK1pDWVl6eUR3N3pOWURBMG1kWldtbWtGTHN4aDFCYklMTUFv?=
 =?utf-8?B?dE14RFpHVGZDZjcwcGZBc3JKdE5Rb0I2QnFpOWNTS2hvVS8wZ2EwMEQ5TnJR?=
 =?utf-8?B?WkFOK2FIRUVLdWtqVEEyOVJFODBNL0p1OCtXd1dDWWhUTDMrbWRPd3E4Vkd6?=
 =?utf-8?B?TWRCYzY1Y05KUFc0N1lxQ1IvTG9lS1dLd0dGb2Z0WmNyY3ZmRG1valhNdkN3?=
 =?utf-8?B?Wms4QmtiTWhYRmZIckNVVTdBQk5nTE5jeFFFbWVnM0dHNGtBSFhyTkNkaVRX?=
 =?utf-8?B?c3BMVUpMYWxEblR0Tmp5NUxTK3pqd0VHZ2c1c0Y2NkFxVzZxSHlmbk1CSHlT?=
 =?utf-8?B?cjU5dkJhNnZ3Zi9Jb3MxMnAramhiUFd4bFVDeWlXOVA4ZHVBa01LTUs4bXBT?=
 =?utf-8?B?SStWM3VDUk0wRVZrQ2tqZGRMdk14dExwMWpiR2p5TWhveEViSnRmY0VCQXAw?=
 =?utf-8?B?UWJvNk1EeSs2Nk14QndRMlFWckllVEluQjlhSkpvclF5R3h4TmwyQWdIUm5y?=
 =?utf-8?B?TkJ0cEtLV25BY3d0cTVXZ0hyc3pieGlYcVk3dTQ4N2Q0cHVJTzBBQlhzVHVD?=
 =?utf-8?B?QjFuSHRNY1IzYlVDSGRONVhvbnViamNmZ0FOQkswT00wMnRQQ1hZNWxqdGpp?=
 =?utf-8?B?aUtOM3BrM2wyUzA3OEo2RGw0b0ljdFhoVGhjaEYxQ1orNGNDcnNPMU9kUmxl?=
 =?utf-8?B?TFVTVDJWcVV2ZjJUNDBhaVJVVFE0L3I4V3VuRWFyU0hWdG55VVZFSlptOWZZ?=
 =?utf-8?B?ckE4TlpBaUovNlFyMWh0d2pwRnRxQlBzUTJvN3pLbFgyUGZQZThqdUJKL2hP?=
 =?utf-8?B?S2xJVVRqYjZQVGt6cGJtODdLbzBLdFBJTjNaOVk4WUNFMWV2VjZUeWZ5dXk0?=
 =?utf-8?Q?3HRBwGSx5pEBvBO9AzCZFEzWC?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7614530a-c219-4184-c0af-08ddd6ccd157
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 22:42:13.2370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4ksvQTyvEK/9RHd1OohcSK+7b51lrpLgFbWTvX1nyraU9WyK0KIktnKRrwoWUQTfRxoab+MbocflhOo+38X+LQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB11346
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_154215_937153_B4E705EB 
X-CRM114-Status: GOOD (  12.67  )
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

bpp * width must align to 8. Use media_bus_fmt_to_csi2_bpp() and
v4l_get_required_align_by_bpp() to get width's alignment requirement.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/platform/synopsys/mipi-csi2.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/media/platform/synopsys/mipi-csi2.c b/drivers/media/platform/synopsys/mipi-csi2.c
index dcad69cea99f3172786156699513f8cc8771ad2a..5c41b9570dcb97f58018bbaba1dc67a3c120a60b 100644
--- a/drivers/media/platform/synopsys/mipi-csi2.c
+++ b/drivers/media/platform/synopsys/mipi-csi2.c
@@ -11,6 +11,7 @@
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/irq.h>
+#include <linux/limits.h>
 #include <linux/module.h>
 #include <linux/of_graph.h>
 #include <linux/platform_device.h>
@@ -664,15 +665,31 @@ static int csi2_set_fmt(struct v4l2_subdev *sd,
 {
 	struct dw_mipi_csi2_dev *csi2 = sd_to_dev(sd);
 	struct v4l2_mbus_framefmt *fmt;
+	u32 align;
+	u32 bpp;
 
 	if (sdformat->pad >= (csi2->num_src_pads + csi2->num_sink_pads))
 		return -EINVAL;
 
+	/*
+	 * The CSIS can't transcode in any way, the source format can't be
+	 * modified.
+	 */
+	if (sdformat->pad < csi2->num_src_pads)
+		return v4l2_subdev_get_fmt(sd, sd_state, sdformat);
+
 	guard(mutex)(&csi2->lock);
 
 	if (csi2->stream_count > 0)
 		return -EBUSY;
 
+	bpp = media_bus_fmt_to_csi2_bpp(sdformat->format.code);
+
+	align = v4l_get_required_align_by_bpp(bpp, 3); /* need align to 2^3 */
+
+	v4l_bound_align_image(&sdformat->format.width, 1, U16_MAX, align,
+			      &sdformat->format.height, 1, U16_MAX, 0, 0);
+
 	/* Output pads mirror active input pad, no limits on input pads */
 	if (!(csi2->config->sink_pad_mask & BIT(sdformat->pad)))
 		sdformat->format = csi2->format_mbus;

-- 
2.34.1


