Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B736CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zvWcrjrN0GO+QVzCZ3zpQvzyxUZLm8Fw5XIAnUWxtWs=; b=Rnu7U8J4p6PBkkdqYrPQDAqoW8
	ktetsccpskMXd+LgRuU1RFF/4GGI6SDGTmkDZ0fcyCCsIYoiNFruhqeJ6FGZ3oyVaARYLXKLDDTF4
	6GcjoByVnFia3p0wj4DCNhUaX4jIkdjoNJkd2M1vB7RncWt15JpfC3U8+gqr7c/J8J9/iudSqaZSD
	940ZW5uzO5BkyFZRDoiE1HeQ5iHWZdOuN1JF8xX/ySpzStLlK6Zu8EK/7mzuY63yRgtzG6+E8Bqj4
	ryjND9aCswMsfKcBdTocGgPZjkcBkqGh/2qv1koqYa2qknJqUFmIus8yd5HvV/Avecli3FE05qqV0
	K47TeUkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphrW-000000046iC-0iic;
	Sat, 23 Aug 2025 06:36:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upTKx-00000002wY1-0ewg
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 22 Aug 2025 15:05:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=zvWcrjrN0GO+QVzCZ3zpQvzyxUZLm8Fw5XIAnUWxtWs=; b=WcMTqoH45XYXxOAnHp0M+FCjK1
	ipC64+F36P4UAK0sKmGsLKY5RHn3E6elXpg9YDi4sHqBBsO7NcYf1AoVCAjWcOUySYCv02V9GHy5C
	nMf0JW4nSFX+gZz+PhYVymSr1SJK3ztaurJ9XgOJy+RlZLAhlhuixcJO8VQcLBPGbmQB4jLG9qY4y
	ejPdQqFLrQ2+PjpbFyT8X5maV+AJVcEscfc+IfJ6x3mduwM0Ib6bN2LLdQ8Ou039+an2SVcz/sa48
	VB88GUoCwnbK1RrSHNP+odKSWRso5yq7mOTPbSy621OPzoA6xwb4s9vB/brQ+YzFCKaKg5qc+kGfC
	VuKdd0uw==;
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upTKt-00000000y1k-2Xav
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 15:05:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZNaEBzkooVdFYFBcyZL1nFCNvte3WnKlQ6IVLJmHdr+J8Eu0coSaev0YG/DgvXnTJyLbXQI3Wb5C6nRpUMMhL8vqtQ/Dwhz3Jc7hkNO9fulDQaBK7nhAbJsvA7Ving6hIeD1fFu7URX6B7SHNeV3AGXUeNAV1rkWPiBxNY2mSgC4hYBN/CG3oWdUQ0GJ31pbEC9lnd1Fb4darL8B7Xsx83GgXZ8I0iMSZhNMfA3P5epCB5gFc2MorsVbJdLUFnUgqeSIFqJ3/7CJYaD95Cp58x730aL4Uum5d+E/pBoJ9lOGsezHNCmTWWttBWiCfIL+fpoY1k0WG0oyzCdiRGgqXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zvWcrjrN0GO+QVzCZ3zpQvzyxUZLm8Fw5XIAnUWxtWs=;
 b=smakmNrzdndMOIXmTvHSS9nUt6Oay8qaWR1sa3oHshs/m3WPDpOWsG8vP8ZaIsYfqO6LiJS1Ja+Fi/1iloAhEaulmXG1/L9pn9WF1SUWPcEOLGjcjTThIS/LajH+KXnd7ywOkjPvWm3RZHSmt//HKq/hTFSWDPFXgj2HMLNo68Kr7WGMtHsVUp2sP9GEPiHXkmeKhAONEt4QpKQAXKemIsEBSVWZhVPsaad1fjU5o3RsdkyFI5ubvfpCLgDZCyml4nJjTK1GwcG/x9Bb/2ckfhQlXvIgZc13NgSi32NkGxdHAb8pZnZD//tNZApXGcBXHFZmdnpiA9m4jZRU6T72QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zvWcrjrN0GO+QVzCZ3zpQvzyxUZLm8Fw5XIAnUWxtWs=;
 b=BXIA2Bu1TS3poA6XjOf823KGrswE894KrPMgmrIM7KQ80sPSEgyl/4JB3GZDnw8/suRljplSQxOlVQUbFlPYnhn4UpyoQdd4I8SDi2BPgUZC++saDl0T+UqTnKC/qBJ6wtL6Mpq93pFFNimZXbS3fzlbJ4qVLar/Ocan5hlZGyluQQgkg1axrdFl3Jx6ODur5Pa+Zp/zIpPJ7pKh5VSR+t1OP2PRU4ty1Kea3KEHt0zt8svPAtzdjPFAU6CBUyF8dic1jxehWhzDJQgvZ+MKNHV5EY7jfvRBNxBw8h9YAlyFGtaKMLbCmVaJToMawJ9VqnnsU2v5m2IL1OYKW3/gXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by GV1PR04MB9086.eurprd04.prod.outlook.com (2603:10a6:150:21::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Fri, 22 Aug
 2025 14:50:20 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9052.012; Fri, 22 Aug 2025
 14:50:20 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Fri, 22 Aug 2025 10:50:00 -0400
Subject: [PATCH v3 3/4] ARM: dts: ls1021a: Rename esdhc@1560000 to
 mmc@1560000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-ls1021a_dts_warning-v3-3-6b611a2f23a4@nxp.com>
References: <20250822-ls1021a_dts_warning-v3-0-6b611a2f23a4@nxp.com>
In-Reply-To: <20250822-ls1021a_dts_warning-v3-0-6b611a2f23a4@nxp.com>
To: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755874209; l=1037;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=vq4Ae0/Sqag9tkDt+c6Vcx3gnkwcz2130LnGu26D+cQ=;
 b=+EbuMmBjVZdXQkVUX/QwPIjaXo1bKsNHah55u1eZMjPNLSchkwCSrR99JROeRyjypDqo7Hwcp
 jLAXWDW2uTGCPlFbjT6Y9mj/aS5TbJIXpcnD9tbAoRpG5nC+ySGohGE
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BYAPR08CA0038.namprd08.prod.outlook.com
 (2603:10b6:a03:117::15) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|GV1PR04MB9086:EE_
X-MS-Office365-Filtering-Correlation-Id: ca346a26-f4b7-427c-f3c0-08dde18b372e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dnhyMHY5b0k3WnVCSXVxQXkyallyL2tlSUkvNW9SclN2UnBxWkdCUEtuWWlQ?=
 =?utf-8?B?bmgxemF6Q2xlblN0WnZhRUllUkpramlvcW5kUndYVkNJWUhYREdQZzg0WE1B?=
 =?utf-8?B?cEZ4UWtDQzlpOWk5YmlxVC9GbitaSnkyNFpjS05NSXVIT2JuWGxaL09UTGVB?=
 =?utf-8?B?REZEeDQ2VERCNUVqWnFCWlA2WnlSZ0hURlZScm90OCthdTg1OUU1QXRNTGs2?=
 =?utf-8?B?M3RnY3NtVE1UNGk5Nld1aS81VlZFZFp6dW9rcHIrQjdKODNZMVZLdGw3SjhG?=
 =?utf-8?B?TjJ5MS8xQUVyeDdiOGJKYkp5SSs3QmRPZzNVQlBIUEJLUHZYOGxaWXdMbDRL?=
 =?utf-8?B?ek5pOXJOVWMyMkFlRDNRekxTTkJuM1FIS3V0NzkxSFl4TzNabER1L3pTT2dy?=
 =?utf-8?B?aVRGekRkOXgyMDVWWlFIYklJUExVU0R2VS9uNTFxU3dHV253czB5eWJyNGdi?=
 =?utf-8?B?VDFNeEYzNUhBZDlNK1l4aFBlaDl6UFd2VUZYaCtuOHViRzFaR3B1UEllRFEx?=
 =?utf-8?B?ek5YbXYxNUdSR2lVMUdMZzQxcVZoekhMdW0va3ZLOHBqUWpTYmJMYUdWVyt4?=
 =?utf-8?B?V3g4WlpjVzgyTnREaE0wK2xWalRENW1EMUNuMVVlc3NnSm5pKzVZKzQ3UVkw?=
 =?utf-8?B?RjJCZksyMU5IanplVlNNNnhMMUxRc0NtY0kvdFl6Z21wT2l0WjMwaFZkM1lq?=
 =?utf-8?B?bVJrRkpmYkE2L1VBaW8yaFNvVkpUdTJQenpkaWFjYVNocjd2Smx4anNQbXlN?=
 =?utf-8?B?VkQvZ3pkRzdpRVB0alovY3lTM3IzV0NlYXpFeWFRTUVwbkYxQzV0cVBScm01?=
 =?utf-8?B?QXNqMVdqV1l0WXF2QXFuWWsvQ1IxSGQxcTl5RmN3TGYxSGNzelR3bHFvWTRw?=
 =?utf-8?B?RkRPUnIvb203VStmNEIxU211b0JOWVZaZUtRUE5ORTV2ekZ5RGZSL3cxN2dj?=
 =?utf-8?B?eXRObFlTbUNja253ZVM3R2wrTmFGS1hPT2N4c251V1A0SXVQQkJJYVp3YzVY?=
 =?utf-8?B?bGFmZlpVeDRxY2U5Vlp1cXZzVnViVUF4TmdoTnBCMmtJSGsyVUNBdkJJNXhu?=
 =?utf-8?B?R3Y3bW5TWHhkMlhwN1ZiWGwwL3NpSXdTUGNweDlJSHpzdVBWWmRNVkdNMk9D?=
 =?utf-8?B?SFYrR3RKZWx2ejVwOFpYTmhzalE2dk9sVnhLcDlwR1VUUFp2TWxWREN5OVp2?=
 =?utf-8?B?V09xWTNMcTVxVGt5MncybThNeFNKbUxMREdHbk9EUC9vS2RvVFV1V2U1NDVh?=
 =?utf-8?B?RE1jMXNpTWZsYU05RjZUcHRuQWNGYzdwRWthU2p6QXNDV3F4REF2amRkelpm?=
 =?utf-8?B?VEdxNmwzVnVVampnY1FWM0FxdkdEeERORWJqMDE5NytmYkZYM3IxUWZ5Mmtn?=
 =?utf-8?B?VFg5ZXdFZkgwOS9BWDRkRXVIWGEyUnhtOGV4NEkybVU4eG1ubDRhL0QySHFy?=
 =?utf-8?B?a2tyK3JJd2VNcnFYRkhsVUl4eHhQWkpXemNENktEZElud2duUmV2SEl1emsw?=
 =?utf-8?B?a3U3c3licTZBeVBCZ0VLNElERkZKV2FVZ3BVTmNCSjYwZzNoKzBYTzFyRVRp?=
 =?utf-8?B?UTNUVUlnRWxwRW43MkprQjJCdklWY21kMEQ1WjA3M3l2WkFPYXAyeGxRUDk1?=
 =?utf-8?B?YmlibFZKMzRRNmlLMXB6d1E5dkRJM2pzRHdrZmc0TktObjB4b0tuamFWSGN6?=
 =?utf-8?B?NEluMnFhdWJTd0tMSFJXbC81Z0hENUQ2a2U3M1p1cGtmQWpDRVJqUGFCV2Nu?=
 =?utf-8?B?cGxTalhBQmtvY29NeWlUTno5am1aLzRaamw1TjVGeEIwNlVwcXh0b1o3MGtq?=
 =?utf-8?B?TzZWb3FnS1hzT0dCTUc4R0Z4Z3ZHdEVkZk12dkJFUTBoL2tpRmNKajBsSnU1?=
 =?utf-8?B?OW9SL2U4QWVkSkxIcE9ZY1dCM2JIR2FTV01MMjRaUnl0bC8rb1dTNGNqZTVE?=
 =?utf-8?Q?l8N/YXy2gXM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVh3OHRJT203Sk9oeC9jcFN5TGJSS2IzR09MV2lWMjQzZFhLR2lrYkJUQW56?=
 =?utf-8?B?b3JNc25adEZpM3BacmFlUG5DMWl3cndNUjRKblZVSmFZOEY0UCt4eFF4WjJh?=
 =?utf-8?B?YWhuek1Lb0loSlJQR3VkYUtDamk0ZGNOeFRVV1BLVzZybHozYytTVDNLODFq?=
 =?utf-8?B?ODlBcFdwUlZsaFNjZjh6SENVZGlST3FCempReVREMi9PM29uU1FhNHVaSkFV?=
 =?utf-8?B?Yy9yVVJyRG9lOEl0QjJxL2lQWWVSczU5VVRpd2FsM0hYNGhYU3FGUDdtNTdj?=
 =?utf-8?B?L0g4UTVETm1rWFdvUjN0TkpwejFEbm1jS1NxRVJwTzViaHlqK2RXQzNGbzI2?=
 =?utf-8?B?eEVvRURTcm5xRHZqK0F0TFdpc3RSVHY2SHltTVd6ckR3TzdoQklRci8vT1RU?=
 =?utf-8?B?OHMvVGlBNmlRNGVDeTY5V3dPTTNlVTZMVzRIbWJoUVR1dVJ0Sm5wU3l3WjBq?=
 =?utf-8?B?NStodlNrRFoyb3hrTXhwL295UFFXOEUxMnFUckZINEFaZjZINXU0NEplcmxw?=
 =?utf-8?B?Y1NmUXVVbFExTUNPV2s0SmFCNUlyNmhTZmhZZXVHUlV6dHcwQW02N3lSV3NJ?=
 =?utf-8?B?NC9aYVdIRjU5SnFtMFNpREEvK3gwb2VSS284cWNVc3JyenNBajJaMDhhcEdO?=
 =?utf-8?B?YzQxTGdSelNQOXVmUWVObjEwSURPQUhJTGlzMFEzc3ZQeElPMXc4cWhhYUZI?=
 =?utf-8?B?RllpakxsMnVoSW0rUWhETGxjVUJDSmxxaEk1cUIxOGdOdWFSUWFySXNWKys3?=
 =?utf-8?B?MXZrbnRocDYyTDhFcEIrVXhKMDVsZkZnMm5PbjVVR1BiWW5VS2x6LzFNYTNu?=
 =?utf-8?B?b2xyT2FFZzc4UjRFKzFVZDJjV3NjTGlNS2pldzN0cmhHK2t3ZTJudG9IR0VU?=
 =?utf-8?B?bmhCUEVRVjVLRm9SQVJhZUhXMWxDRWZTSzFLL2dPNlViMytPbVl2cXFlWkpY?=
 =?utf-8?B?em40c2g4UDFPZngyeU1LQXY0Q1hSQlpOZGFvd05qS1FyUEVGaklSVmNMSXQ1?=
 =?utf-8?B?c1NtTjFzL1pVOVdPQXNkb1VyNnhZcWUzdGVDYW9SUWdVVDRlOUt4b1RQUHdh?=
 =?utf-8?B?cjZja2YyQVJUaHdSVkExZWNuV2xsMjREY2ZxNUpVR0Q2blJTM3NtMmdHR0Jz?=
 =?utf-8?B?RDM1cm4wZWhnSzFhR254b0RmczlaaWNUVkdKQ0xrRm4xUUpqc1JDNTQxbHEx?=
 =?utf-8?B?MnNrMTdzUy9GMzhFb2RmRE9EMGtwYlFLaWdvc1FzTnRKUEpESmNla2lRbVhI?=
 =?utf-8?B?d1dTL2g4eFQ4M0FpYTJOZkVmaDBYdlRyU0xCNzlWdTZzWGY1VjI5UHR5MndD?=
 =?utf-8?B?ZnY4dFZvYnZMYytOOFMwT3oraFZNUlVpRWJzYkxOL2FBVWVqMTh5T3VnRXpQ?=
 =?utf-8?B?czYydjBFQnZEV3o2SHZUbDJYVkFUZjVNQnN0SlN5ZWsrSUhpeTN4QThxM00x?=
 =?utf-8?B?Rk9vaERKL1VUY0h5NjJRcTh5ZGhYaVRpNVNyWmM2Y04rRWVtWXJ0clBmdmJM?=
 =?utf-8?B?dTFYVFgyQk9JZmhkTDgxVW9GUFNkTE04RTlBVmMrQmJocS9uZlBHbGtIb1BV?=
 =?utf-8?B?TEYrQTZMODNNL3Y4NzBxNUlGTUhWSEpoYXRKYVpkQUh1eDZ5amxweXpZc215?=
 =?utf-8?B?TEJHaTdMcDVTdlJkL2RWcHRJeUlybkNtbDdrNFROQTlFdngwZWpxY3pSQTRz?=
 =?utf-8?B?Vy9rZnR0QVNkOGg1dlphWThBU0xaK1hSQ0IrOUN3VkMrV3ZJRUE0K0IzUUw0?=
 =?utf-8?B?ZkVncFdTc2tDbW84bnIwS01KUUk3c3E3YmtwZkN5TDVNWmI4SmhqWENQc0Vk?=
 =?utf-8?B?ZStoVXUzVFJ1TG5HYWhWeFZEYUxsN0pFdGhMYyttUHhmNWU5Vmg3eVQ1a2hV?=
 =?utf-8?B?VklkRGgxZjVsczY0VmlCWTJGZVFaMEFsZzZpSEhMOGI2Y1VNTGRuS2xuaVcy?=
 =?utf-8?B?bC9jZEdLR2RSd25HYnM4UGNpUUZmV1N5dTZxNFlTb0thYW9JMEdKOW96U2d1?=
 =?utf-8?B?ODE4YTYyanEvbzNhMTE4Y3FnaGgzVkMyOTdXYzc2bk9qVmpwMHFFVCtkT0ps?=
 =?utf-8?B?VjFTeGdTcktJZWp6MnMxOTI5L3ZTckhiVGFINytReXFFQjk1dWVHT0Z1Y0Vu?=
 =?utf-8?Q?ctuo=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca346a26-f4b7-427c-f3c0-08dde18b372e
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 14:50:19.9830
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C8LI5X/egmUhcdU1Y2ceTZ0FztggasTqiafw8i0qTa5Zy0UgX+/oeQTKu+4mkT7rdHNZJMsorja3UhbANJueLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_160547_854418_F2EA34F5 
X-CRM114-Status: GOOD (  12.13  )
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

Rename node name esdhc@1560000 to mmc@1560000 to fix below CHECK_DTBS
warnings:
  arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtb: esdhc@1560000 (fsl,ls1021a-esdhc): $nodename:0: 'esdhc@1560000' does not match '^mmc(@.*)?$'
	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/ls/ls1021a.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/ls/ls1021a.dtsi b/arch/arm/boot/dts/nxp/ls/ls1021a.dtsi
index 29105773add7f4da0ab1c3acee753514eaae4a62..e0b9ea6dd510057875c12037f636672a4e77d035 100644
--- a/arch/arm/boot/dts/nxp/ls/ls1021a.dtsi
+++ b/arch/arm/boot/dts/nxp/ls/ls1021a.dtsi
@@ -154,7 +154,7 @@ qspi: spi@1550000 {
 			status = "disabled";
 		};
 
-		esdhc: esdhc@1560000 {
+		esdhc: mmc@1560000 {
 			compatible = "fsl,ls1021a-esdhc", "fsl,esdhc";
 			reg = <0x0 0x1560000 0x0 0x10000>;
 			interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;

-- 
2.34.1


