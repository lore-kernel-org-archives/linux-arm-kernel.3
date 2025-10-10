Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DC65CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 12:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TgHFjF1xC6Q9YcnRzS0wpewWr5fKCKhQbm4hrd9LSNA=; b=L65R/qV46jZbke8V+jBbbHZUS6
	mXdv0y1JgP68yajjDurebwpI4D5zBJfZNprs9N8rbvcnHYMuUBqLbflD0GgkDYhc7YccorP8k2udj
	Pv52wDZ/SSRt6wLBflFXKlgqMlw8VEroZSqzy3SKMKcu6wx/q0viOrAR6LOcJRvxogvPfnN04dEt6
	fDj5wSgIBncdUcR1+gmKCZlGFWGIDE0NW9Jp9P2B3ZOo4hyJGP2XEpS/9INxVXibAIllcx7X+V9ji
	TzSFgVTD+uKT0Ul8I7lmjygRBj8tgnY5KljeUoyD30BDSzaYI8Lk82TAK7E32fg25iNGRdzKdohoi
	5FKQofjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7CBI-00000008QUU-1fHA;
	Fri, 10 Oct 2025 12:25:08 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7CBE-00000008QLf-1Dge
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 12:25:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a9Ao8X/RnniePvBN+XtPS3CYDS/SkX2H6Y+uosxig7yPjY+updxwQQgRgQeoSrb2isnF/p16hiNxHhUJhqZsNk6G31YjOiaV5rKfHfabpj+A1/FSBqCiKHEbrgrJQi8BTpFgX0DXo46IjQVG0rDi2hDOsFfsccIpWiNmGF8ghWdm5D1LDCr+UJOIhH67Z+qN7rHUSbuJqXgSQV7Nwkx3LLErU25MCelKP34CONxfVak1+XKAgEw7aeJwLm8Pbvo9/f28DqrFhHWulksrvSK3F3ywgaIAXc78koeIZJwpIG2LcxELw0AZqxne3eHgcGRnheTlpP/x+HrDjXrvTJKAZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TgHFjF1xC6Q9YcnRzS0wpewWr5fKCKhQbm4hrd9LSNA=;
 b=wtVG9UrDsaGGXq81m/AFoM1emogaV3qWdNeJeYi7gaheTKE1mH8flHrokV4V13hgNCdY+AXM6oVzMhDpJozexVATsSp7z9KQVnNjcRbQpsTW02yjgPt7ISH9btqJ+AVPOs0S+/TcDxc33pVVFXJBNIdws36Wn9P4wLbFsnWS523EuQEd2ogPuRVqGKvSMPy8C0btqMVymz6g/4k/EkXAdD5r19gDgPakDveUSsJGsbmlGjQADKAi2MZHKHnxmVhV94+lZrG5SCPxxDJ+UgjGXSt4nlpvEZ8MpMxNRDO7mGzlk5/Jbfkly7iPH+yQ/UKJ347OcJNqjMp0bpiPC0+grg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TgHFjF1xC6Q9YcnRzS0wpewWr5fKCKhQbm4hrd9LSNA=;
 b=d7Y1+TiKTd7FwW9/lsSd91Wojn9NZYSjBQHquKq5w9wYhgm8T59PGPR4GivJm2cLgp7yxaEblzPIxrVVCnTzA83i3uumPYDauub+CGqmsdM9bu0X3RZ0PWXjHXY0/lmOAYuDPOw0LMclcDpMqOMic+a5r8PeAEsSULsWcuoOMTAyc/YgYudyxitCn3NBXeXs6Y6txkZuOkk90ncjc5sjh/kO7nmG2JN6K1y61fLsV+JZtZdM5hTpV8N0XpQLH4cINFbFU9mg5aRvq8+xaLVLa9ZQV02OwYdPH7Ct8V5DQBy5eglPcZuwODt0tSHM/9J1BmSyaXVMiED8uIJf2Rn69w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU2PR04MB8535.eurprd04.prod.outlook.com (2603:10a6:10:2d6::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 12:24:58 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9203.007; Fri, 10 Oct 2025
 12:24:58 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Fri, 10 Oct 2025 20:24:17 +0800
Subject: [PATCH v2 6/7] remoteproc: stm32: Avoid directly taking address of
 auto_boot
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251010-remoteproc-cleanup-v2-6-7cecf1bfd81c@nxp.com>
References: <20251010-remoteproc-cleanup-v2-0-7cecf1bfd81c@nxp.com>
In-Reply-To: <20251010-remoteproc-cleanup-v2-0-7cecf1bfd81c@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Andrew Davis <afd@ti.com>, 
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760099067; l=1417;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=AkM2XTlDKk3vLzkgXw7SmyQW80VCi9FFlQjQVP6omsU=;
 b=Wg734/52QVYb5OlivFw5iVAbZYvnY5OQdFMclYvuMiWf6XhxdAhCYk1l3F6iXSI/Cp7oRTwh8
 cO49bVATADtBTqNkVsfBJQiZ4IMzALfhwrQSsE2MWlBhDp7nQnEtMa4
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR01CA0134.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::14) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DU2PR04MB8535:EE_
X-MS-Office365-Filtering-Correlation-Id: fd20eae3-1c53-4dc2-052e-08de07f806de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|376014|52116014|7416014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dFlRMCsrVklpMXNLQXVxYTlDQlVDRGFGNTl5ZGVEd1ljOVM0Rm9CQkd2U0tn?=
 =?utf-8?B?Sm1wSE1CS2NYQnIzV043b2swaWRwNktrYk8yNWovMTRSWVdyWUlCYkJ4QUln?=
 =?utf-8?B?T3dKa2M4VFNzbjVZVEVzWFBlKzM5anpWSWZ0Ui9ybmdiYmpwN1pNU1dtOCt1?=
 =?utf-8?B?NTJGUlFYcXBFTlJEVE4yNlBWeDk5NkJ2bk4xVXNZYXB5ZXVPV1RndjdDNzRE?=
 =?utf-8?B?eWdlS1dIZkt0MVdMdXJWOHh0VkR1ajllMkZHRDNBOW1NZkdZM3VMMmJtdHU3?=
 =?utf-8?B?ZTdLaXFwMmdZUUF0dHZuTkxnT1RYNS9SYXd4YXJndTI1YmRVS3RnRmdmRncz?=
 =?utf-8?B?ckJlWjU3REhOVkE3QzkweTdrVktSaUZUUnNJMmhmU2F0RncrUHVvNGdvdmMv?=
 =?utf-8?B?ZlYvZUFUMTZRQm55VUppMEFmajZOaWZ5WEhYYlpsbjJUMUpmeUt3RFVMWFVN?=
 =?utf-8?B?QVFTQW41QVRVZGNMSnhBMDJpNmJzU0FmU2oxUDZyS1d0ZktxYzF0NlIzR1BF?=
 =?utf-8?B?T1N3S2R2dDIrbG55TjE2dzI4d052ZHlGY2kxNHpyVWthbE01Tk9kUUxpYVNF?=
 =?utf-8?B?RytxZlNVdFUvZS9sUVpHNjNYUTVJNk5xK0VpdmEwcnlnQVZlalNJZTFQOFpO?=
 =?utf-8?B?Qmcvd2ErWklsZlNKOXN2M3BhTE5oN0JIMWxGL0hJMXFmUkxjZHoxM1dkWGE4?=
 =?utf-8?B?aTY4djRjUnY4Q3NpYk1KUXVKd3ZnL3U5MFhPWUg5amRMSytKK0EyWEszUEIz?=
 =?utf-8?B?dEc3UG0vNThVMzI3VmkyYm1NbEFHdjIzVVRka0JxR0c0VW9RalM1dlNtTnhw?=
 =?utf-8?B?eFBZelZaNk8yS0hXaXh5dTJzTmU3amZNeTJwWW9JanpreitYOHk4eEd5WFJu?=
 =?utf-8?B?bTliTW10YWJmaUdLdmYyWnBPaTBWZVJBNUQ5QWtna0dwcEg1MVd3N2twVW5r?=
 =?utf-8?B?S3pTaDdpbVF3VmtqTW9IZkNwZ2ppV1dSQkFKREFTS29vdEJCMlFpY1dyUC9k?=
 =?utf-8?B?WXZQNUxucENQSHh5NlFNUGl6ajR5NVFEVFlUVHhDQ0lPSmtRRXlKUHNSVFlP?=
 =?utf-8?B?ekRIQk9aSkNjWE9Va3FJUlR2K3RFMUFVWTJycTlMaTM3T0JnLzJxMXpsblNt?=
 =?utf-8?B?ZjJKdytPQjk4MHlNSEQ4K3pwUkdSWDk1UGF6YlNUVnltbXZWdkpoUHJ3MWUv?=
 =?utf-8?B?VnVPbFJYZHdWTGdyUmhMR0V2L1A4WFUyQXdIeExXaTNVS3RwTlJwS2hGVTFG?=
 =?utf-8?B?a1BzK3VVNEhvT0NGM2haaXp5RldxL1FtbTZxRURNN3RKV2RObmtjZ3BEWDVr?=
 =?utf-8?B?bktKUFh0QXVuU1ZmeHV4Q2lrOHNzM1lMNjk2Z0NnSC8zajIySGlpSmxMVWV0?=
 =?utf-8?B?STlKanJyTG02VXp2THVwK3AzeWRkODQrQkFmNGhycE1BTlcxc25qUkdmdC9F?=
 =?utf-8?B?emFKQmhFNjlYZGdHNmJqN1JBeWc2UzhDLzI0ZXViR3RycHhSbm5DVmNnQ0dO?=
 =?utf-8?B?bTN3aHQvNkd2Kzd0aFcrdFg3VXdpb3R4eHVZb2FYZ2p1NjNZTFZTTXB5VGYx?=
 =?utf-8?B?MnJCQ1k5eTZLS2xxK2J0Nm42dHVtdG5Jdk8zeGxaUXE3bDlKQ1JlR1VJeWdU?=
 =?utf-8?B?OHV6aFhmSU5FWERjK1FPVTRoZVN0WDdSMW0zSWo4bDMzUkhqb1g4MWxOVjZ4?=
 =?utf-8?B?b2pRRlBjbFg3Q0JaMWplNkR1TGpLZG8yOVFnZldOM0h2Z0FteWtGMUVNb1Ix?=
 =?utf-8?B?Qks2bTNzZG9UR2lZUFVEVHJhWUVCL2s1VmRTTUtRWFMva2lKeXVWeVNVcFdW?=
 =?utf-8?B?aXVFWTlTWVJtSHd1MDkrSjdaR1J4U1VvK0ZLQVlpZEJEMEFHckhYaDQzTWp0?=
 =?utf-8?B?Z0xnSmlvVlVlNGxqaVdoTzIwUFUrQ1BqeDluY0ljbVNseUZ4YlU3YTNyOUVN?=
 =?utf-8?B?UkkwaFhXRFk5NzJBVEFQeFdlalFXS0VkWkQySjRyaXJSSGNFakxyUFVkVVo5?=
 =?utf-8?B?MEVhWDdkWEx0K2lhQ1RMR2pXQUpBWGlIZFhXYWFrQmVHRUtJaG04ZDRjdW5r?=
 =?utf-8?Q?V6DGL0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(52116014)(7416014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WENab0MwMkJ1a05Wd2FxQnp5SHNmRFhBd2lxRDRwNUpaVzhNeDk2UUxxSXVL?=
 =?utf-8?B?MDIxNUpKTWtkWGpvYUFybXFFTGpydnlLMmhVaDVJalR2THoyaGJwaEhsMVNT?=
 =?utf-8?B?K2FyUUF6OSswNWg0YVZkNTk4d3JrNTlsOEVkTFFoUzF5cDJCN3RtS1hvYVpC?=
 =?utf-8?B?clZkU2JKUFJqMzZVSU1uaWU0Rmh1SnhQSEd5UXJsNnVUVWwxa2U0UjBxNVEx?=
 =?utf-8?B?N0NqYlFKZXhIc0dzY25uM2VEekhXSDJDSzFNS2VyRGdDMVhLNWhFR1B3Ty9x?=
 =?utf-8?B?Nkk2QTN4Q1BSTDUyTlJ4OU52R3MwN29HWUF5MzF3QkJjUk9SUmRZRnhMMjV1?=
 =?utf-8?B?MkZ0UUdXc2svektIU1JtUlZPcUJTZkxhdW5TU3IwaEh0d1kvMlUxY3BCbnIr?=
 =?utf-8?B?Q05EOGpENERTc2VhVExUbFFLNmJJeC9PbG90djViUHB4SEp5c2tDcy9veXY0?=
 =?utf-8?B?bDY4VGkxa1JDSDd5RkVnM1hBc0FraFJ2VUlqbHBkN2FBdDdlaVZBZlg5cUpF?=
 =?utf-8?B?RHJoUUFHUndpMkRBV25JY2JEcnFQdmUybGFUZEJXemRoclBGVGRHQ0lycXdi?=
 =?utf-8?B?QkhCL1VSTnY2b0dFNjl0eDlkdDZJMTUxOVdYVVg0Yktxem16bE40UWlEL0Nq?=
 =?utf-8?B?aVF4VncrS2k3VXM3dHNMU3JzMmdmdkdtRnRRbi9SMmhLcSt5UGpBTnE2ZEdS?=
 =?utf-8?B?SEZIZFEwYXVIVlVaWHZrem1sbjZjTkd1TmNtL2lmTSs1bW5iV2hrYUJ0ek1a?=
 =?utf-8?B?WW9TMUNIY1NlNWZtWkZIekdEbk5OU1V0bjVKWEdzeER2eVZaVkN5bXY5c3JY?=
 =?utf-8?B?NUxUZ2pjSk10OEUxdWdjVWtTbGFoUE1scG5xN2JVZWxEeGdGTTU2ODRNSWRk?=
 =?utf-8?B?RFRTQzZ6TnRMZzVObnZveHErbi9kRnBqWVNDUmlxenZkY1ErRXNxbFZrTFN3?=
 =?utf-8?B?cmNiQ0xENkVHc2lZN21ub1h6amhLUXN1R2hSU21uTG94SmhkL0Vib050NlZl?=
 =?utf-8?B?OXpOT2xhRHRaMmZFQktldFdqRForZW1yM3R6eGlGWjFYT3o5Um1lNG1pQlZr?=
 =?utf-8?B?bmg2cHV6WE9BL1c1eDY0VmExcGJ0UmM5L0IySExObk9jbmJnQlhIc2RYSE4w?=
 =?utf-8?B?aWNPTjhzWXB2c284MUh2SnRRSGt1VjdHTkp1WlNneEFQMy96K3JXRHAwcTlL?=
 =?utf-8?B?cEFIQ2pVUnByV1ZPNGFIa3FvdlZnSG1nalNFUFMyK0VNNnZCejhpVjl4b1pD?=
 =?utf-8?B?MjB2RURGVmtVR3c2WnU0MlZjMUVzRjY5SmRyN0JCWTMwL0lzWm9hcXlBTkpx?=
 =?utf-8?B?cmtaL2thRDQ2ZnNGV2gyM2h5bTV6VGJKSkNBZGlER0tka1JvT0Y3TzZlU0JK?=
 =?utf-8?B?QWZRQnNiSTlLVitZN2lrcFJmUUZJMUFDaXduQk14TGRUQW9KSEFZUktzZjJP?=
 =?utf-8?B?VWtRTVVsVlNxZSttNm12WTg3Z1N0TitVRjNZbTdrZm5jbDZ4Q1BuUktsaE9R?=
 =?utf-8?B?WlZwRmZXWVNZUjZoUnJzRnllNzNzemdteHhqdG1iQlhySUJCVWNBdXZQejRt?=
 =?utf-8?B?UmZwWlJqbTZoaEJyVHpMd2ExUWVSWnJFWFJjMmxoYXNISFh0bVFmV1FiK0FF?=
 =?utf-8?B?bThFUDJPbERBMmw0S2JmM0FTQ3J2OTZYaDkyNW5tbk1EcEYycmQ1UnhIcHpv?=
 =?utf-8?B?MFNKRDJONGQ5eXZTZDdyRDYvTmxKVjQwL0tybUpSSm5CVkxWQkt2QmdzeDlj?=
 =?utf-8?B?VGJCMVM2K0pIOFlrNEpHdmhsR1hqQ0oyRHZ0YURhd1ZRMUdiTGlFcTJIRGNU?=
 =?utf-8?B?ekxTYlkzcFhuSGJmM2NXenY2amxrSTQrVzRPZjMydm1nZ1lNSENGVnI5cG0z?=
 =?utf-8?B?ODA1MDRsdFhYNzY5c1AzTmdGd1IvdjJPUldYZkRXV0lqeFJULzYrS25sK0xR?=
 =?utf-8?B?NDNuaDJ2K05oVklpdERVbE5DdGF6RkRFTERSSURTaVJ0NnhMZHQ2azRrQjZV?=
 =?utf-8?B?RFBOWS8vOW9YQlFTbkVvamd3NHBVYXNBOHFucno4TkJQRmJXZjgrU3FlNnVD?=
 =?utf-8?B?UUFQcUMrWWxaMmU2aStYMzQ2S3BhMHgyMENHTlF2d3d4MmZmdmdhNUk2V0ZP?=
 =?utf-8?Q?B4/iAFPT/yNMg4+55Ay0yuB1w?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd20eae3-1c53-4dc2-052e-08de07f806de
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 12:24:58.2921
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vxWiRTOBpyK+chv28ilmZshLEKLF0gMMj/ZpNfcgKb7gUQ+3qOEvht26blHufA7wVgbkBJ8gVlIAfAZnom0Y4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_052504_369454_94C230D4 
X-CRM114-Status: GOOD (  14.83  )
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

The rproc->auto_boot field is going to be defined as a bit-field, which
makes it illegal to take its address in C.

To avoid build issue, a temporary boolean variable is introduced in
stm32_rproc_probe() to hold the parsed value from the device tree.
The value is then assigned to rproc->auto_boot after parsing.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/stm32_rproc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index 431648607d53ae58a9a556d53f17b1bf924bcd80..b28907c240125cdcf73867e2704eaa974d5e1401 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -838,6 +838,7 @@ static int stm32_rproc_probe(struct platform_device *pdev)
 	const char *fw_name;
 	struct rproc *rproc;
 	unsigned int state;
+	bool auto_boot;
 	int ret;
 
 	ret = dma_coerce_mask_and_coherent(dev, DMA_BIT_MASK(32));
@@ -857,10 +858,12 @@ static int stm32_rproc_probe(struct platform_device *pdev)
 
 	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_NONE);
 
-	ret = stm32_rproc_parse_dt(pdev, ddata, &rproc->auto_boot);
+	ret = stm32_rproc_parse_dt(pdev, ddata, &auto_boot);
 	if (ret)
 		goto free_rproc;
 
+	rproc->auto_boot = auto_boot;
+
 	ret = stm32_rproc_of_memory_translations(pdev, ddata);
 	if (ret)
 		goto free_rproc;

-- 
2.37.1


