Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFA5CE6B243
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 11:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+9ANHnSWP27iHbc+a8ou4FqQNkq16ExJMF8UFj1ohL4=; b=duV2Qzxj7lo48Crsj3bnnz2HLq
	lkZZljen0qdR2jM6LsK+97ZzD1LmInPz33XA5TzgHWT7Brs+nxqCj3xJ82cEe1sTYpw1u4ovGTbxF
	dSkcDeUEXKI/GLMArvSAaAn3PhamYhrAe3q2v1DGTC/vYVEU8g+lN8iL2OVzIlEL/2Ln30RoKBc3N
	iTzroKrW0vSUf1ybptPGTiX/CV4WNL9jPlb3zNaQIiCV5MZO2qRMJaIB/Xo3OJnmRWytDzn8VeCBi
	iWdjgdZ96kvIPe/jaP4LLAYmwQMLAdR4d2AEHtNOgRwbjZ/rI2UeBTAT+tbyMLcqotwvlTTlqXNKo
	DmZS/MgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6qBk-00000006oHG-3Jmi;
	Fri, 01 Nov 2024 11:51:36 +0000
Received: from mail-db8eur05on20725.outbound.protection.outlook.com ([2a01:111:f403:2614::725] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6q3F-00000006mdv-1eHO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 11:42:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RvHJMw07XP9iTT3tC9oAyLX/pnAqdskA6vaCewpo8TER1Z0+LL0LEk40VBEEiR77TuVZ5+7jvW4ujMGRbNBCbuzvjHVl9fgnsd05YZXL5dWDyrxemULf+jLXRpBLGkEpdS6oby5FgMabroUN0By3ximIqL0BJVp0U4FozjZI9Cr2pTYZuphqAmWiXinhPuIfY2Pq450UGmz+pf3sBkI7WymyjHLRJP9x3X32wz/kjdeDUSspYavphLX+ww2IenZYFMVaYZwV4dMJq1aqKvmclEUItocG1maEdD6gArnN/zBxqFhLYpFknMAKIyBHnySoOkcbOmutPf0Qp/xABPQYnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+9ANHnSWP27iHbc+a8ou4FqQNkq16ExJMF8UFj1ohL4=;
 b=F7FUPjWVafc+2YvvUfU06x6yLqZnGNiefUbuZd8W9Sh8BlCjZ9ZCzfxBJ7Rpjjj3fALLSRiIXUuJacS5SupD5PA/fc8cYJF0L8JYWv/X16z78KUNRf/5Wt9J3MVOr3jtIHd4L7zQlawXf05JtnkqaCaMFtbUmqVVZR4HFHDYVn0cL5vYkCtqZZWSiucWldtUC5Z1rIwQqnoLErlfdoRNebIYhNKdef/VDH5JLmS9UsPy4jUl5xCO82Exl3pmSlbxkNuO+t8QBjeHR6nCztoEKGjdQTgl5KNcuqcL789mr0O9Hpvk7ieJrtLA1SF04p1YFjZBh7o08K/kPfmAe51q9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+9ANHnSWP27iHbc+a8ou4FqQNkq16ExJMF8UFj1ohL4=;
 b=fJxT86KyseNYwA5ki6LoqEbxYNG88HzmFQNe+owi3lF4oe0cN5W6cJ4k+IXf0uHp68qgyVD3mAhw+i2CbL7fTrrOo58ecRTpbCZ08kzh3gWLJ+4aJ+2Baduc3QkC/ei0P/bTNclcQ9M9fc4/cu0NgXCKarB7xOgh/LOBA95yFEQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from AM9PR04MB7586.eurprd04.prod.outlook.com (2603:10a6:20b:2d5::17)
 by GVXPR04MB10519.eurprd04.prod.outlook.com (2603:10a6:150:1dc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Fri, 1 Nov
 2024 11:42:29 +0000
Received: from AM9PR04MB7586.eurprd04.prod.outlook.com
 ([fe80::c04e:8a97:516c:5529]) by AM9PR04MB7586.eurprd04.prod.outlook.com
 ([fe80::c04e:8a97:516c:5529%4]) with mapi id 15.20.8093.027; Fri, 1 Nov 2024
 11:42:29 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Fri, 01 Nov 2024 12:42:26 +0100
Subject: [PATCH v3 2/2] mmc: host: sdhci-esdhc-imx: update esdhc sysctl
 dtocv bitmask
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241101-imx-emmc-reset-v3-2-184965eed476@solid-run.com>
References: <20241101-imx-emmc-reset-v3-0-184965eed476@solid-run.com>
In-Reply-To: <20241101-imx-emmc-reset-v3-0-184965eed476@solid-run.com>
To: Adrian Hunter <adrian.hunter@intel.com>, 
 Haibo Chen <haibo.chen@nxp.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Mikhail Anikin <mikhail.anikin@solid-run.com>, 
 Jon Nettleton <jon@solid-run.com>, 
 Yazan Shhady <yazan.shhady@solid-run.com>, 
 Rabeeh Khoury <rabeeh@solid-run.com>, imx@lists.linux.dev, 
 linux-mmc@vger.kernel.org, s32@nxp.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: FR0P281CA0198.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::8) To AM9PR04MB7586.eurprd04.prod.outlook.com
 (2603:10a6:20b:2d5::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB7586:EE_|GVXPR04MB10519:EE_
X-MS-Office365-Filtering-Correlation-Id: c715eac6-49d5-42cb-6696-08dcfa6a4419
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NUN6aGdweWFkRFd6M3lyZFVOLzFrK1BZbW5kN3R6TVB1U1E5K2licXZ5Y3hS?=
 =?utf-8?B?QmYxZ2xxeWtycEYvSjh6WERESENxWEFueC9wMjJnMkVxaGQ4YjZCZHhSQlRG?=
 =?utf-8?B?c2JvNEVVT3dlR2ZvSnM2MWtMV1JtSWtJSEFHN0EzZnJ0RDJ3Q3dUa2ZCSGI2?=
 =?utf-8?B?bUcvcjN4cWVUVGpFbDRUbmNzdmVkSVRVY1J0RmVoS210QlZwWG9BZU1Zc0xU?=
 =?utf-8?B?alBXVjI5cFJNazJac005dnlsazJzVStWRlJWRkZqdG8zUmVPM2NHYStvSklz?=
 =?utf-8?B?dVM0SkFUcGlJK0dpWEd4YWZpTlpidCtkM01MUFdGNVFQK2NIYXZpWHA2MVJN?=
 =?utf-8?B?MUFyL0YrNUlQaVByNURhVmpqQVZOcDUxOFNyWW1kV1BJbXViUG52RzVQRnFT?=
 =?utf-8?B?M21HV3NWeVNDL1RqVDBrTFhJOWQ3cVlvcllvWDV0WVZwS1hXZEUwTUlFUUN5?=
 =?utf-8?B?V0w2SUtKRk12aVd6TlVWQUhySU8xTXpTUGJhdkVEL3JoTjZHMGNwdzVMZ0t0?=
 =?utf-8?B?WVYxMkFRR1J1eHlCWmEzc21OTGF6WTVZV3BRSHZYcjNFWTNlM3ZWZnV1RnNW?=
 =?utf-8?B?cVZTcVkxcEJIRG9sL2RVNmVwLy9kaG45czhPWnRHMVJxNC9kTFozM2ZyQm1E?=
 =?utf-8?B?a0lId0VPMG9nSFBDdEVoR3pkM3lvUmpxc1JIZXJsZUkvV1d6SVd0WjBIYVZF?=
 =?utf-8?B?d3o4RmoxNEZoVFhxL3hIUXZVb2R5dE5KZi94aWtkQU1FTFFja0UrMS9YRys0?=
 =?utf-8?B?dzltbnNDaUMybmkrVE5iVTJ0bTdjTDFDY3h4SU9GWHNYVmY0Z1RRUXpCQ2Zr?=
 =?utf-8?B?bFJHVXd5UXBvVU9yR1ZNcTdHWXdJTHVqd2Q2bTk4OHNTcTRuckxGUTNqZlVy?=
 =?utf-8?B?SXIzWDg1enpJSXVuYXZUMXBxclhwUUNjaVhxUDlLMXJRK3VaSjNhb1J6Y1Bk?=
 =?utf-8?B?UHdTNjNNc3NJUWMzMksrZXlvUmhnUXFtUmkxMW9IWEtkRmx0NUhlUDQ0NzJK?=
 =?utf-8?B?WlhWOWkyS0Q2Q2pjKzAxRnN3L0x1TzZTSWkrN3pXY3lXZmdTWVYwdlp1NHpG?=
 =?utf-8?B?ekhzQS8wbUczNWNqVUIvcFZQT0NsMDR5VHo5ZDJZSkc5R0U5eGVVb3lnSUlx?=
 =?utf-8?B?Q1VpVTNYQ294NDF5bm80YzZNUFZscldjbEUwUU9RVHYzZmFYT3daZDkwWlFS?=
 =?utf-8?B?TFVtQ1UzRklYZVFjZnpJVHF0eWFKMk5SanQvbHFwZFp1dzlqRXV0M1NYSUlU?=
 =?utf-8?B?VVlmSVUwcDZmMGpTRlUwaHVGT3VVZ3g0WXJGQytyMnllbG95MkFEUWh5cXRy?=
 =?utf-8?B?d1RaV3pZUldnUnppbCswQnF3WXZ1RU9pdW1mdmtnVkRFZXpvK3dhSUJoQUpn?=
 =?utf-8?B?T3N5WUM0TEJRQ2JzTWttdmtUUjVaYzkyalJRckJTN3ZTV0drTlZ2dDd1M2V1?=
 =?utf-8?B?Z2NMdXVOZmU5RmJGcG9RVm4wRnZ5NDVkRmlMSTU2MjVibnRHMStqTXRaaG9t?=
 =?utf-8?B?aWg0blZRNkpUSDFKWWJldEpiSmNlallQd0pZcjJac2c3UklZQzJ4U092ck52?=
 =?utf-8?B?aFlBVk90MGRqNFdXTzg5LzJPejRkbG8yWXp4K0JyeW1qNHJQMUt2TDloRG5S?=
 =?utf-8?B?UGVnVHRja2FLZjRpZklSQmlZV1k2VEN3azUyS25TNDJGWlo5VDZlc1ZhUlJn?=
 =?utf-8?B?bU5vc3h6N1FIb2Q0aVhqbG8yVFdWdWJlSEN4SGlCRkxhVDNqa29KYk4zMnZj?=
 =?utf-8?B?djFJS3h2Z1A1anFOaXVYeFhob3NNVzM2RVRZdG9FdHRnTDNPcFhNdGUwZi9X?=
 =?utf-8?Q?xAKB9yzpjItKBDm9JkS7J1qTBErYeibYtnscw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB7586.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ym94RDUzT3BRdnZvdVJDdlR3TmFBZk9mZFhVNEM4cXg0eXErdzJTbHZlYjVR?=
 =?utf-8?B?MGJBOUZ5cXBRdlY5Z0ZRQURoTVUrcmpCbGs2ckNkNFdsYkJBU2E3Q1JESkVI?=
 =?utf-8?B?cXVha3B5clYvdXRURjJTYk1VZFE2ODJLY0VCd2cvRHgwT1IvaTNCUHRBM0hR?=
 =?utf-8?B?bW9wbENvV1ZMTmpiNEdGMmpxZHlIMlhUWkJQOE05RFJFQ3pNNGFzZFZiTktF?=
 =?utf-8?B?UmxhT0J4L0gvZDJMRmM1Q2dQdXpnbW13WS9hTzZPWVQ3UjhhN0RTUTBiQ0pE?=
 =?utf-8?B?S0JFQWpVamo0VGZTWDZQeGVJQkxaVEhXZFJVS0FheXd6QWZjbHlNeXhlbTZ0?=
 =?utf-8?B?T3hZZHorUEJOa0FMajN2SGQ3YWNhRmptdm5ZdnVTVmdUdmJjeVhlbm5iZGFZ?=
 =?utf-8?B?TnZKWlN4MTBNQkYvQXJEV3Qzam9JYkt6bFZsQUlEU1MwM3FFakxwT3J5T2ln?=
 =?utf-8?B?NS9wckJkQ2VtL1BFb1R4MzBOTEpqTlVYaXkxaTlkZjRtLzIyZTlrTG1ESXhy?=
 =?utf-8?B?MEh4NklZUUY0TnpQSWV0ck9XZ2NRUitWZU9jaUo1bkpsdTg3VkNxaDkvVlU2?=
 =?utf-8?B?aGM3eE1LUmpLMTlRcmlJQi9hZ0t5cHBXcVpxdmx3dEU4TEVNLzh2cWxVTzNn?=
 =?utf-8?B?cmc1eHRUaDdQTURwSGltMHozQkt2dEhTYmR3cUNBMExPb2xUb09UMnBEYjdT?=
 =?utf-8?B?VFlOTHJLaHZUMXIwUkJIZ28wbFhXakZhdENoUHAzYnBJT1NWOVVEdGZLOGl3?=
 =?utf-8?B?c2lpazBsenpUTkEvY1NsamZQRGxyakhjdHJrSHFKcGY1SGxpeWoxZ2YzN0Yz?=
 =?utf-8?B?cWFBU1Axdjd3NFlpSmJqMStJckVsYkcxSlNWaEIyNjFzY2c3bFRKY3BLVHIv?=
 =?utf-8?B?QWdqSWhLVTZnTzNNekpkK3M4amE3SW0xYXFnU0dlNlBNUVA2Sjl4b1I1d04y?=
 =?utf-8?B?cTJYakk5bER4YWwvQnY5M0JyaVNRSnNUbU5sWkpDY01ERWU4SHZJUTNEaFo1?=
 =?utf-8?B?R1dDOXVHUmJCVVJLZWVEQ1RvRWNSVXlkSUc5Z00xOTg2YkNMRjRPaEdHdW1D?=
 =?utf-8?B?NXVJQk82NW9hVzZmcDdDbUtFKzZ1bHR2L29UdWNaclRRL0ttcW5abkU1cTZF?=
 =?utf-8?B?UjNRdUlzeE1PYjRsTUZJNVpaUjJ1dG1FeU5CUUhzbkhJTWUxdDJtOTQrcnZj?=
 =?utf-8?B?V2s0RVBHVXcwQVZST2RoRW43VStvdXNDOE8reVhBWkZFOElzbFc0eTRVVkNo?=
 =?utf-8?B?NzdRRE1ld1hDOXlFOGxIa3JYVU5DVndYdkhFaWVZMGY1NzlocXArZWE3L3o0?=
 =?utf-8?B?Zk5LVlN4U3lOd1VqMW9mWDVld0FZanF4bXd2cVA3dGJhRUhrczVYT1B6ZkpL?=
 =?utf-8?B?Mk0raURCQ1Z0eEcwcmNJYmhPZEQ4eUZYRW10NitsNSs1eWp5OTlDTGdTekxO?=
 =?utf-8?B?cDF2VzIxNzZYRGthNXk4VUpJTldKSXg5c2hLYjJvZjFlK0cxMExlYnJvYnJ0?=
 =?utf-8?B?OUtNOC9LUFo0eW8zOVUzN2xkQklheFRlaEZXYlFNd2MxTDBna1lVU052c3pU?=
 =?utf-8?B?Qm50TnRZRnNTbkRNYTdRSExVRjFiazBJRCt6QVd0OU81d0pBbkh5bEJTWkNu?=
 =?utf-8?B?REdnTlhXbTNpZDlpVVQrTW51a3IrZFhFY3ZWNXVEU2F3V1g4T2VJZjMxKzVj?=
 =?utf-8?B?VEpTRGRaNXVGNE5SVmQ3KzZ3d2VMenBuajZvd2RlMnJYYWFtaExvSHZ1MGZk?=
 =?utf-8?B?N1lUbDhicDA3TURndkJYNFVJL2VtSy9kTlU1eVV3cnR0MlQvTUtkc0N4U0hM?=
 =?utf-8?B?Nno5K29JMk5yYjh5ZE13TXhENlRZQUx0b1o0eUoyRWYxUENTYzl5MExNdHBs?=
 =?utf-8?B?STZTQ1RObU9FTmlGR0N6bnJzNW51NzhhWSthb21GSGJGdDB5R29HZ1VXR2gy?=
 =?utf-8?B?UWZpQzZJQTRTQUdEWEl2REZjRWRybERscDI1Njh2ZFlMd1NDOHdqNDFleW53?=
 =?utf-8?B?MjlQMWorZ3VWNjMzeWV2WGRaakVDaEREQVA0UmJVUm9QT1NlaFA2dkpkU3or?=
 =?utf-8?B?dG5HVTBKcTNiTjdlNFovTHpHdmRnYVhMaG9laDVabkpQaHh3MUJLWDFBOU1Q?=
 =?utf-8?Q?iftgEBHDnTR63sdUGqP9WYMsU?=
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c715eac6-49d5-42cb-6696-08dcfa6a4419
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB7586.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 11:42:29.6750
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: POYOjLJUggeu5eT94CLjylHqTV54mUOO2GbJMtywXP887PX6rot5v0KKxQmV4lmanj8GrUPcgFwLOdzbnL3UJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10519
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_044249_578204_3EA7E360 
X-CRM114-Status: GOOD (  12.20  )
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

NXP ESDHC supports setting data timeout using uSDHCx_SYS_CTRL register
DTOCV bits (bits 16-19).
Currently the driver accesses those bits by 32-bit write using
SDHCI_TIMEOUT_CONTROL (0x2E) defined in drivers/mmc/host/sdhci.h.
This is offset by two bytes relative to uSDHCx_SYS_CTRL (0x2C).
The driver also defines ESDHC_SYS_CTRL_DTOCV_MASK as first 4 bits, which
is correct relative to SDHCI_TIMEOUT_CONTROL but not relative to
uSDHCx_SYS_CTRL. The definition carrying control register in its name is
therefore inconsistent.

Update the bitmask definition for bits 16-19 to be correct relative to
control register base.
Update the esdhc_set_timeout function to set timeout value at control
register base, not timeout offset.

This solves a purely cosmetic problem.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 drivers/mmc/host/sdhci-esdhc-imx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
index f106e291c276d0c8063e9ac59a126acf5e9e239e..cda3cc4cc22cfa214369f40f097ca50937898604 100644
--- a/drivers/mmc/host/sdhci-esdhc-imx.c
+++ b/drivers/mmc/host/sdhci-esdhc-imx.c
@@ -30,7 +30,7 @@
 #include "sdhci-esdhc.h"
 #include "cqhci.h"
 
-#define ESDHC_SYS_CTRL_DTOCV_MASK	0x0f
+#define ESDHC_SYS_CTRL_DTOCV_MASK	GENMASK(19, 16)
 #define ESDHC_SYS_CTRL_IPP_RST_N	BIT(23)
 #define	ESDHC_CTRL_D3CD			0x08
 #define ESDHC_BURST_LEN_EN_INCR		(1 << 27)
@@ -1386,8 +1386,8 @@ static void esdhc_set_timeout(struct sdhci_host *host, struct mmc_command *cmd)
 
 	/* use maximum timeout counter */
 	esdhc_clrset_le(host, ESDHC_SYS_CTRL_DTOCV_MASK,
-			esdhc_is_usdhc(imx_data) ? 0xF : 0xE,
-			SDHCI_TIMEOUT_CONTROL);
+			esdhc_is_usdhc(imx_data) ? 0xF0000 : 0xE0000,
+			ESDHC_SYSTEM_CONTROL);
 }
 
 static u32 esdhc_cqhci_irq(struct sdhci_host *host, u32 intmask)

-- 
2.43.0


