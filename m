Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F175EB28EE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 08:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IYcdBHIqFgEvILxmZRBX4ED3Al8Q+GCzZear3xHG+wc=; b=lAPTr+9oSepKAhQmplWWXWc17Q
	csRuKsxyyXNoRTLFDLr6y2sZnBosPwRovMDrXNZsPzXsXrTOKZ/L6kHPSS57pmNOOgMUn8pYpWToQ
	oI6IyqCuki+iQUvi5Qa0W0SLWpIOWyii9w2yT3pK/yCFzUmxCAh6Y4poYYO5rAeA/znv5P3tvnDVx
	nsUsdLb3xt8AiIlkrtM+00SK9qAax9ijPkLZ5m71kZgmOkrUPOEmYFF6aYRqFSGfbl/fsmb1GoAP4
	r3GhmqO+vy/DsMJcnDU/HeHKmabMYB2WLnjo+V04LKAdpa+cfKTntFb/OkxvDiv7/ioFhPobrCiMN
	yXIoY5BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voH6m-0000000B1tr-08yR;
	Fri, 06 Feb 2026 08:22:32 +0000
Received: from mail-westusazon11020080.outbound.protection.outlook.com ([52.101.85.80] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voH6h-0000000B1oF-4444;
	Fri, 06 Feb 2026 08:22:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=etUnTSAn86m3lb3MSGsUQt3ndfF4ODLrK+9w9HG+6Hvku9M8F0Ok5Zymepzv1XYW3iZZe2zAH9nz0G/5pAYjUgVKk8G4ZmeuOAIUAk0G5fN6K5ND0gTMA7mSz/3VJjY15KGrV9Lwn63AyfTaGk3n9TZhkw7jC9uhJmYheJEYsNWizvttnP3YLUsyAExFnqWeloqKijpUXSJlTpzJGvIj/HmpV9ZXWwboxR50Kw/P2jfjVKP1K7WDqjLOZS6MrPwy3tQDXXlt6isH0hJ+IthvOrH/ZzZbCLZEAsTHMhqmNSmOQt8YUg7n07sKYb0fDyFduMw1a2BjmItHxl3Q6Kd7UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IYcdBHIqFgEvILxmZRBX4ED3Al8Q+GCzZear3xHG+wc=;
 b=EBEa+WzTYQxLZayweuXmmQF69wJMFAUBCg/NFalsn2YckuAURrnaXbG/jYY2glaIdzkejn9Q2LDzhuZyPcR5cR+356UUPZ8xpcTy7k6otrG363uS8pRNnkKFADW3D/97pQ4e6Y0nHvzDz2KNA/IcZZw8c+7LQ1RFlsr7P16/ggHLl0cmwLbVwDS11jdKiV5nQVskqp8IHfFF2VrcmY807grdiBTDmddJaKzUgceGzjpqAGmoHt8GOiADA/Z6uJvf3LXaCEShsaKjXQDrLfD5GMYPtYguIPv8+y2NbmBtMQbvlWDgtnzt6ICARlPkAIU12rcFHiPasDPB2L6OSdKTQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IYcdBHIqFgEvILxmZRBX4ED3Al8Q+GCzZear3xHG+wc=;
 b=nTefT8kXSjP5zmhpaKgi4CfqDqm+vfftdhIkdWleKZ81ypZIwVZo+XxcJ0OvJ5A+xxgNEpAtDH14SJG/SKAvNzCCL9GSxrtUQlwNMS/g+aFfX4GsjgNQDVHZ+dVyRHsOpxjag2YKdUC+txxRzgn2rhFLpwBpkiEOcczsgoOzdjHAObXbRegl8SZoKwnU0O84RwNejxYZrHBif+pfVssdsGxJkVwnSNASpKKv9jBvTqFCjDbBI4xbbCw+DNakQX09gbIRY6zUF2EkviModB0lx7XOEbRAxpCciv5v7VFoyLYYnAXZ6SEdJR8ZDOmmufVZEux1yB2dsjq0TRhiWw3Cng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received: from PH0PR18MB4558.namprd18.prod.outlook.com (2603:10b6:510:ac::13)
 by DM6PR18MB3667.namprd18.prod.outlook.com (2603:10b6:5:2ae::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 08:22:20 +0000
Received: from PH0PR18MB4558.namprd18.prod.outlook.com
 ([fe80::7a75:75a5:694b:2311]) by PH0PR18MB4558.namprd18.prod.outlook.com
 ([fe80::7a75:75a5:694b:2311%7]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 08:22:20 +0000
From: Tzu-Hao Wei <twei@axiado.com>
Date: Fri, 06 Feb 2026 16:22:10 +0800
Subject: [PATCH v2 3/4] MAINTAINERS: Add Axiado AX3000 eMMC PHY driver
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260206-axiado-ax3000-add-emmc-phy-driver-support-v2-3-a2f59e97a92d@axiado.com>
References: <20260206-axiado-ax3000-add-emmc-phy-driver-support-v2-0-a2f59e97a92d@axiado.com>
In-Reply-To: <20260206-axiado-ax3000-add-emmc-phy-driver-support-v2-0-a2f59e97a92d@axiado.com>
To: SriNavmani A <srinavmani@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, Tzu-Hao Wei <twei@axiado.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1110; i=twei@axiado.com;
 h=from:subject:message-id; bh=ObP8N1UtvWKp2CtmzxJN3VKa1vOSFezLpJd8KJulKic=;
 b=owEB7QES/pANAwAKAXgQMF3EWvHXAcsmYgBphaS6lcEN0PY4WcHkGKLjEGbgJIWXxakeRZE0I
 ucmVLwAGjaJAbMEAAEKAB0WIQSZyWINOowtFmDvdYF4EDBdxFrx1wUCaYWkugAKCRB4EDBdxFrx
 11MCC/0fTZgWNxvPd2X+UuJ/acqZY/MAwqgdCFuKKg8ML6fmLv05ejPQEO70oDUerhz7rshl/mS
 arDmX5Ab4Fn19WwkKOAdJt9FWiuUyvJKwP4X6gxSt8Dwxxyr7N/PnuzH3yExKh764bmu0CSrlFt
 Ch1B4IEA9BPrOLyIf2JcBpC5IrmyuKADcNsa7g5sRmx6Njs5YoUaxR67lKWnz67td4YP5KFLtAO
 UstBI3XIj1MF+bxx5x50JKjg/MMcZJR2ohJiz3X7y/CaM3uKcoqmrqA0j57kGOPi/ndUv46kpTu
 65e+t3vQdX/+m1CsbliYhW1+BUivyOX4auHO6vfeRoKFyG8m+cPLEaXqh/Z6BEUFB93RhHSw8oc
 FiHFtJekAmJ2tcmWVeQXqrP/crx5BlGHZ7EUlUrXvl5WCxsluo99Y3Ct70DiVBQRDduIEutVswz
 esvi23pkXn28/2REvCRcIbmYjunlOthfOVYHpe2ST7YK7cgdJcCx7qD8NUu43GMM5o0K8=
X-Developer-Key: i=twei@axiado.com; a=openpgp;
 fpr=99C9620D3A8C2D1660EF75817810305DC45AF1D7
X-ClientProxiedBy: PH7PR17CA0044.namprd17.prod.outlook.com
 (2603:10b6:510:323::15) To PH0PR18MB4558.namprd18.prod.outlook.com
 (2603:10b6:510:ac::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR18MB4558:EE_|DM6PR18MB3667:EE_
X-MS-Office365-Filtering-Correlation-Id: 52e963de-066b-481c-2c61-08de6558d8b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|366016|42112799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N29ERDFKQVdKMzJla2dUSlRCVVdoZENPL0ZycHZva0FDMytCMzg2a2JwR2FF?=
 =?utf-8?B?eFAxTUM4RGlOSDZ5MVM5aTRWdjFtekdnZUtUMitUWk1wdUU3YU9FQUd3cEJO?=
 =?utf-8?B?Tit5NVpEem1mK01WU0lqOGNWbzliRG13M25VMC9NZS9hSk53eFRwNlB5YW1Q?=
 =?utf-8?B?Zld0ZjVIY1c3R2s3NnV4U09UOEs2aDJsQnEranN0SFZLeXdJK0t4ZlF1VmRp?=
 =?utf-8?B?QXU4WFg3MlVudXM0RjJHV3FIQWpxNzNXcUNWS252SHFlZXovUHNDL1ZWc1F6?=
 =?utf-8?B?SmN5WTRva2NvMlA1dk9SWmJBNkJ1RzFwVTQ1djdzUzVINm56NHNTcjZrL2Zr?=
 =?utf-8?B?OGJBbUhDU2tjQ2syZXlrRHhTZG95elJESmtxcEFNc0xKVXBnUmR6a0tESitp?=
 =?utf-8?B?T3B6dDJrR0FGbVFEdU5IRU5wUHE2b3Q2WW1DcUxrT1lxOWZwWTJnK3hOR0tn?=
 =?utf-8?B?YkMybXRDVVJ6dE8wK1JXN0ZvcVVyczJiSlZlUnV1REF5cy9hZTRLSDUzUXNz?=
 =?utf-8?B?eTZuYjFoT041NUVSTWhYTmNULzRxZmplR29wckYrWmhLYy9BMVh3SHR3S3lC?=
 =?utf-8?B?UkloRENid291MC9NREhYaldzb1FIRG9RdTh0L2hmV202aVVHbDRUdFYvNzFJ?=
 =?utf-8?B?YTRrOHBvdE1MeURFRjlUdXdFN2F5YkUzc0JDUU9ETjdjSTAvMTdkMVZ0ZVN4?=
 =?utf-8?B?bWpPUjB5N3g5U0lOaFlDZkxpelhDNiszVXN4dEVyM3ZjMy9sR0RZcXJGWURE?=
 =?utf-8?B?aEg4MENnekw4SnhFcU92eWtOU1FVWXJmQXluaTZTSVZsV2dRRVk5dGppUDhv?=
 =?utf-8?B?SW1WT0hZblRhVkY2SlBZZzh6V1VUOTdNTFNZYXFQcU9pbDdISW9RcWNSNkJW?=
 =?utf-8?B?ZjYyVnBEdWVSN2tDQjIxVFI1Z3FFUTBpUVFMN0tzUmZTeW5vWlR5NEdUdDlC?=
 =?utf-8?B?eVcvVFZhVHpMYWkvT1NibjM2Uk1SYnY2VEN2Z2NDYmY1QmJqc3FiQjFWZ2Y5?=
 =?utf-8?B?bk52Z21rWGdzK1hkNTVNeXQvZU9KUjBMenB5U2x3Z0hRVmdidXZTQkJlenR4?=
 =?utf-8?B?b1drc3h3YzVaNUpTU1NmZkVrenBkSWhzQkszVkNiRFIwandWMTJoekRhQnc3?=
 =?utf-8?B?VDM4Qy8rTjhRQWFBdjZXQ0VGYXBZM0RRMW9acGpjaUdtdllFZ2RpYWVCUmdO?=
 =?utf-8?B?TXJ3aXQyWTZVdGdtR3RMUmszZ01jZ3NFVWZneU0xUDk0Z0lrQUVSRFk1YVc4?=
 =?utf-8?B?bVJTN0JOaDNlZDA0M1ZpYk5sLytXRVEzTWhpV2lnbitSRHB1RjZzWkpFVlpC?=
 =?utf-8?B?MFlHV0l5VG5sbGJnazk2SEZ3V3JwamdoS1QwK3ZvdEdOaTZVTGhtYkhHNlc4?=
 =?utf-8?B?RFA4UmY0OWNkRVR1TGUvS1JzaUIvTGFnd3FNa1RJNitsMXJtQ1l5Y0V1dk1X?=
 =?utf-8?B?NGt2cThwNVF3M0c0cmo5bURNK3F0MnlJejlRWnk1bnJwZDZta3hGSUNxZGdh?=
 =?utf-8?B?bTF2WHk1Q0VhWENwbXhiclNyQkJDckp3c3RIeVVVNzhVRTYyU29YbWxzZVho?=
 =?utf-8?B?VzhMSkxpWEt1MmFYaVBwSm9LdFdKcFN0U2d2eGtZckhjYlN6REhMUkFSTWFT?=
 =?utf-8?B?YlBwa3Q5TlIwYmVkR1E1dmV0QkZhVHRYTEZmSWg3cmd2dDFRVVlWS0xOSWxO?=
 =?utf-8?B?eXY2RjJZVldnaEkwZmxUWi83K0tKOGQ5VjJ0Syswd0RKcUlRL0xLZUk0akR4?=
 =?utf-8?B?eU8wT25naHd0OFdhNW45QU40MTltUXI3QnB5NVFZSmdqK2kvWDBhOFlpeTVi?=
 =?utf-8?B?U21NOVhTTGMzcmx2N1hnQ1FwOUx3VkRRcTBpMTg2c2p6eTlya01MNGplS3hO?=
 =?utf-8?B?RW9ScldrZHp0ODZpZWEzUk9lbGZRWGZJdXFMdmtoWGRQUS9NZW1BcmJBY0pW?=
 =?utf-8?B?amNqeVkxK3RqM0RaYklzNFlLQ2FtYTJEdkxMc2lLbUVQeEowdVBjRHVKMktI?=
 =?utf-8?B?Y1lSbHoyb1RsWEdnRGY1OFY4QTBVNzUrNFBTUUVaSVVhcGZJcmloMWlBWTht?=
 =?utf-8?B?M2dQWHYwdmZ0emFRZ1ZYZnpyZHdaSVdxRVh1ZXIwMjdTTERQY25OdmZLNjJ2?=
 =?utf-8?B?SEFkSjd3YmlvNmtMY2l4TXNjWEV5SGVSTVNCRy92ZnFkWVFsV0JEdWpQTFFj?=
 =?utf-8?Q?PkkIepCTpwNV2nwpGPoYA3w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR18MB4558.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(366016)(42112799006)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFNRTFlKRVFoYkVwTVRhMVFNMkZzL3RzTzcwVEU1bFMzTVd6ZXVYcDBDb2Ro?=
 =?utf-8?B?TmY0akZSUjFBTGhyYldmZlRIY3pMOFZCWlBqVUZPTnpmTFZVb2lPbFpJaUVD?=
 =?utf-8?B?dTR0VXBLTjFhekRKWVgzTlRJMmZkZFdJK0FtK0U0d2tJWG1KQThOdWk1dWkx?=
 =?utf-8?B?STB6amZOUjRodjZaYmlmSlVTNjZnYWdsN09aSmJBem9DcTc4eTlSSmN6TC81?=
 =?utf-8?B?Ty9vY1FrZTd6SWtqcEJkUmlGRk12c1J5dS9UTXg3cTkyQ3VFNTFkcDF5ZjVL?=
 =?utf-8?B?ZUIwdlhGYllGdnE0bUhMR3hLS09MRHFPdmVKRXlncGMrS1RaaisrQWh3ZVdN?=
 =?utf-8?B?Q3V0MXlKR2tmWDFMT1BKZ3ovTlVOL2psVzA4NHVTQjJrOXpETmdTRnhjR3hj?=
 =?utf-8?B?Sis0SDhpN291WG5qT3dQY3oxSHYwcGpyU01rcVozU3c3U04vcTFkbS9YQ2lL?=
 =?utf-8?B?b1k0TTg5di8wWk9xUloyTGJVcll6VTV1alVDT1haRWo1S2M0OTRUWVpVMEE0?=
 =?utf-8?B?dTk5cndxN1A4WTlnOXVJejJraTdQaHllb1pxY25CU2l6VFQ1KzFhTWRXUDBz?=
 =?utf-8?B?S0FXNWxuUDMwSVhYU2ZDaVpEUndpSVJENWtKVHNIaUtQR0JHbW95RFFvS2JF?=
 =?utf-8?B?UDY3bmNzNWI2OHhhUjZ0UjREMTdIcU9rZ1p1bUZPTkJMT0pHbGxFenlSZVEx?=
 =?utf-8?B?OEVMaWxZUmpFMFBSUHFTWEhjMkVOOXlhSnVxanVLRmxrV3FFb29JMm8xZVNw?=
 =?utf-8?B?cW5McktlbDNQS0RRVFk1cU1ycHZ5ZlBJMGRpdmNBTFBFbnNrNnB6VE45WlhX?=
 =?utf-8?B?aUVkWU5Ldi92RzBXTmw3bmZpZHgrZmU4ZGtHWVB1T21adUF6enRhcnl4Uzl6?=
 =?utf-8?B?bnJNYjFNNHR0L0JLTTZLbXl4YTN2NDlIRTdhdVZzcjhCb3BReHlLMjBZcGw1?=
 =?utf-8?B?ZDdzSTVVNEd1NTE0NjhReVdHWXFvK2JqbldiaTc0TXlxUWRwMHg1SHJzRE9i?=
 =?utf-8?B?enFRcmhMdmJPWFZhd2xvNjJNNklsZVlTQ0xPbGtxZjhBWmo1Z2hzVG5iNFEr?=
 =?utf-8?B?MDhucm9OR0NCMDFHazNsdkQrbUh2NXBCaUdNcXl2RG1vbmY0VG96ZE1OSnVJ?=
 =?utf-8?B?T0JWc2l0NWttSDNDdmx4UmxEblp4N1NlYnltUHBVbTZBRXhoQ25zajN4dGRO?=
 =?utf-8?B?VTQ3aUpER1lHY0MyNGlTS2hlSXdIeElZblBUTHIwdmxVOFFlejl1TThwU0g5?=
 =?utf-8?B?MFQwdmdmTzA0V1dLUUQ3b25hK1hHV3h2bnRmTzY1VVljVklLTXREVmE0S1Fv?=
 =?utf-8?B?R2Y1R2F6TG1BaTNsY2dlK3IvVzNWdGozQ0FNcHJKTzNJSlhwVE8vNGdsVzM1?=
 =?utf-8?B?YmxHQTBRemY5L3Y2QzA5TThJQ1NsbncrRGhrdm5mNmpOUmRSRG9lZTBURmJP?=
 =?utf-8?B?N1lHdVFHZnBMYmhKMStBeUVMaTFUR2dGaGRFMjRkRDBUSkluMmF0VWxLR2Fv?=
 =?utf-8?B?d2tKZ0xjb0plcnFZcSsvbmxnZW5iNnZWU3BRa04rQ2QxRDJuYVozSldOUjdn?=
 =?utf-8?B?UkE2Um9JUlphYmRIQjFHaDBTZVNXQnJGTGtJbEVXeGlMc3pnbHpQUFl4TXAy?=
 =?utf-8?B?dWpmanJvbDdTVGttb0VOY2Q3Lzc2OFJWOEw0WUJEemY5VWhVeDFGSzlZSWR4?=
 =?utf-8?B?OFROSngzdDMxZ1B6SFRmaUo4bU1PNUNiRHMzOWpRVGIrcDNwUDlwWVpLbFJM?=
 =?utf-8?B?Y01DU2ptcTFjRXAvZG1iSVlVcTQ0b3Ezb05zSFJOQ3k5Q3NsWkFYeC8xZTRC?=
 =?utf-8?B?Zi84UHM1VnFWWDJwM2FVdXF5ZXhGVDhVRjJ2K1o5TkRENVBFMFpBdTQvR242?=
 =?utf-8?B?eFJVRjIzRG9Hczdhcnp2SUVmT0NCNHNwQVByMUNxYUh5RkpDTGFVN3hYY0Jm?=
 =?utf-8?B?Ni9Rc0JYVFNkN05XSmxFR0tYeDJidDd4d0M2M0lhNjJRR05YbE52SlV4WHBF?=
 =?utf-8?B?RkVkTnhFcHVhVFVUQUduVWc5M1JYL1pieVg0VExEbjdHYWliN2ZTTnc2VnZJ?=
 =?utf-8?B?ZjFOaDI1c2tqaUp0Q1RIQUY5VEk2TW4vR3ZXOHRLUSt6TlcrbXRlQlRBdldx?=
 =?utf-8?B?S2thTm1OMlNBUmdnNjhpZTdFRzdGVy9JSElzeVJTNEwwNlBVbTB2S2JNRFBS?=
 =?utf-8?B?NjJMM1JzYi9OY0tRQTlrYk5jZ0RXeWdycE9UMDRoN2NZaXJBelh0Rm42bE93?=
 =?utf-8?B?bG95QXdaWWQ3eExLY0ZrVUFnYkNKZEk5YVVGWE8wZnZ2WUQrUHhOTFdSbkRa?=
 =?utf-8?Q?1ZexSE1Z5TB504wn53?=
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52e963de-066b-481c-2c61-08de6558d8b7
X-MS-Exchange-CrossTenant-AuthSource: PH0PR18MB4558.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 08:22:20.1499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DzpvP7DdtGE37Fao2L+m/TieVoUwAZW65rNIN03gL43Kx/mygq2/m7dUAVMiFOOe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3667
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_002228_011343_2E5609C5 
X-CRM114-Status: UNSURE (   6.69  )
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

Add SriNavmani, Prasad and me as maintainers for Axiado AX3000 eMMC PHY
driver

Acked-by: Prasad Bolisetty <pbolisetty@axiado.com>
Signed-off-by: Tzu-Hao Wei <twei@axiado.com>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 67db88b04537b431c927b73624993233eef43e3f..c33b0aa94de81c89b674e44d4813c4e3b95b7b2d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4254,6 +4254,16 @@ W:	https://ez.analog.com/linux-software-drivers
 F:	Documentation/devicetree/bindings/hwmon/adi,axi-fan-control.yaml
 F:	drivers/hwmon/axi-fan-control.c
 
+AXIADO EMMC PHY DRIVER
+M:	SriNavmani A <srinavmani@axiado.com>
+M:	Tzu-Hao Wei <twei@axiado.com>
+M:	Prasad Bolisetty <pbolisetty@axiado.com>
+L:	linux-phy@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/phy/axiado,ax3000-emmc-phy.yaml
+F:	drivers/phy/axiado/Kconfig
+F:	drivers/phy/axiado/phy-axiado-emmc.c
+
 AXI SPI ENGINE
 M:	Michael Hennerich <michael.hennerich@analog.com>
 M:	Nuno Sá <nuno.sa@analog.com>

-- 
2.34.1


