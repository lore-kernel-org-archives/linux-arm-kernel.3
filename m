Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6A6CC5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 14:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	Content-Transfer-Encoding:Content-Type:Message-Id:Date:Subject:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LSxodI+8DtnOVmhZ5uidriLju4zAnI6c4jQd9du3QaU=; b=3q7NhLsr1DP7B8UAZfmBbCqe2r
	wUdKTdBkhIboMx1eFwCes9tNb5CdVeMntTr8PjIApg6Qmo312+fIOeP0TerN3snLKOSehFt65b4Jn
	G7ZYpBT3ZvF3fKnXhTBhj4d7fjHCIHrDOKUyoWtddRXF0HqWf/78Xyorq4F6DD/ikTlAJHppdL65J
	CiF1VBbAgf9SLzNAlV3qMDP/zeBXbc4Avk2hl71Zl+WZEit8LD0L1dm2+vPgs8cpjNQ6+J2M2OsXy
	ANLuajOzDtFtdTEqfDIIAbrDBMkfFjejDHvyPwnVqLigYHzxiDkk6epdFDLhp2MD56/tB6vwJKXBg
	wl779pzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwhfi-0000000A1K8-43AI;
	Wed, 19 Aug 2026 14:53:42 +0000
Received: from mail-northeuropeazon11010030.outbound.protection.outlook.com ([52.101.84.30] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwhfh-0000000A1Iy-1MT8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 14:53:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RXzGVbFWOKzU0Bh16yGbG9DTWE1W78cxWfLVllfcwbTfMPtkmTJAFbaue1boSgocPCpObzvaQEUHR7BzcEo9Ss5AGqsnjgFdTYKOKVDAAqIt7KcmhaFnhWQaIi1A+b/7/9SCKIZdAN6gvZjjBUsDZyQh68fI/QUij1f21q0IZgxB6MYMWMwIHRstgnYWG3KJtuqg882lTVNcGBiGB0wuCa2wm8bIgRQssFDBEMokuRz5HNA590AjyCJ4+LS7L4R1uI5fpbHPzArLDlTBA3HAP4oxciJTuOo4cQGoR9HEi+y6yh4bd9tLXSd1rLnQnZkNZEmN7IjYQY0ktHlqNcoIAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LSxodI+8DtnOVmhZ5uidriLju4zAnI6c4jQd9du3QaU=;
 b=JD7QD4t7RW/ClosPMhrA8N6YyZ9PcsKyx83x6f/YZ6Z0zmsmp1YiYoVYORtmA7sGXtIHF3gFT0OzHzf21WQG9spH9w1hfwhry6EhqpUwlR1wrX7fcG3r5aN0je2KOIp9EylTOYm+LTVlUVVfL4ELfcgxyMoWI6rFWKidZ95g6g9/wxOt2DA8H5lTfYjubaRHpZvHAY5C7ev++6Gotqn18zBSwuRc+jGP1f8vfJj8nQkPwJsuwgi4lBZXvPkup317mghJuW4ZuWGTIwp+bhHVv1aO2l9znCjNL8XjIQV5SciqJ5WWbCcMT/YwfGW571PKjzOBgnw9rveb6+R2GWadXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LSxodI+8DtnOVmhZ5uidriLju4zAnI6c4jQd9du3QaU=;
 b=BpLWOYI77Pu/ZzLdkF3nYISXwzvKkWJIDtCmAYWr0R18b2MVUOv/uqjUCEpEt/eRNQEDCGPQ6pKF1kH0YHnhR9ERFTZXmF0Tnr8JL5pOa+WuVTioiEwVt07AGKRhZcR7R+4vtoKx+gS08kXmTjJidsyMOxzq4fzi9OKeCjeGZ4vbPDKuD8Pw1qTjoMMUw0db+CSSB+kEqAEFXAnJxbQRO0DceYw36avlRMBBzJnt8xV3ZfTMSeh9K2cPNArsbVeYgcmWv1GbEc0E8uC0NiavDyGtN/J3AR6Pw+Huz4xdRbogvT5i0+chSAa4fNHaRYtfJXaSFOt1fYv1QL0TYQ64hA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AS1PR04MB9632.eurprd04.prod.outlook.com (2603:10a6:20b:477::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 14:53:35 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 14:53:35 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH 0/2] arm64: dts: imx8mp: fix USB Type-C CBTU02043
 orientation switch handling
Date: Wed, 19 Aug 2026 22:51:19 +0800
Message-Id: <20260819-imx8m-typec-v1-0-befc92ecb70a@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOfChWoC/22NwQ6DIBAFf8XsuTRgUUlP/kfjwcJatwlKwBKM4
 d+r9trjJPPmbRDQEwa4Fxt4jBRonnYQlwL02E8vZGR2hpKXNVeiYWSTsmxZHWpmZC8ryRUqYWB
 fOI8DpbP26H4cPs836uVIHMZIYZn9et5FcXj/y1EwzriuKnOrFW/k0E7JXfVsocs5fwHVnmO7t
 gAAAA==
X-Change-ID: 20260817-imx8m-typec-d4a45408e81d
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Xu Yang <xu.yang_2@nxp.com>, 
 =?utf-8?q?Goran_Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>, 
 =?utf-8?q?B=C3=B6rge_Str=C3=BCmpfel?= <boerge.struempfel@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: SI1PR02CA0056.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::7) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AS1PR04MB9632:EE_
X-MS-Office365-Filtering-Correlation-Id: c1dae174-d5d7-440f-ee62-08defe01a501
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|23010399003|376014|7416014|366016|18002099003|921020|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: hKEeWzOJSywwrkQvWeBNiNMci6IDjGnJNJq9029gKgbEBOoyu/5sjAHR3KTraKS1xDbxU9TqPynVNZ0NMn/bsJ89WYNoKly1GcLaikycmcthwgcUeeLBLwrWa+q8lG0M9Mipo3o04VT32q+qPawDMwi0bpwBQqoTQ3AnMJN+ElzFW73Omvn7ulLBXnkoM2jbY2Ff5aAw1tx/2KlAtuC0szklaCBOl9fUuLAfJqXq+b+BeUa/qQ+nNYlTRT33VBRr5jsH7mIHf3SoZk8Ym3aWjg6WsB8WzJaQmETZ0C+Y9MmQnfo3lVcGtzhZRxufcpYD13t4UaBw+2eAUlOuPQZlOlqbjuwfgVrnp1Kl4zwAwDvcpSFshulzm5oKgaUWlBV3WV13lsz6E1MsKfKvi8KdtfxQOM1RFLpSJnMfTH7oepr9NkLc9CAwMK8mGFw1xCG6qi1WXQwaRg2m7cq9uq/j1GQRhUy6mrKkHCycN37RyQZqUfuW5h4A2TrmYX6P0tu3RQJ2V/S38184OeFHJBrFuvBWL/jt6B4hiGuc40nKTBXZC87UIQZqPkZ8a+D8gVml7rwLKcF+4bfwVvZsFd7Q3YZLEoG0B+bnpCK1cufm0ojI0HX0Qq9rC/TwjcRrpeSIbDWYK1zPANqem8U3FBwxoTNVq4wSuwGWDk0CmQYW7LnaawzSJNZGeNu4LqwYO2hYPAoit3rYYEMcUYp5Brf2zA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(23010399003)(376014)(7416014)(366016)(18002099003)(921020)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?STZkM3M5Ym1SYmZjbFFWbVFZUXMvSUs3WC9xZFBaSTBPd1NJNkdTSytBdkVj?=
 =?utf-8?B?QTIxQWZkUVh5T2ZhbWU2REdYODIrb1c0NzlsbVJLYkhzNXlGMW9sQ1N4T1Q2?=
 =?utf-8?B?Q0RFYm8vM0xRMUd6SGtqdTRoTHVqV2xYV09uVXZUWEFkSVU1aTJCRTBqaHRC?=
 =?utf-8?B?VVBiN1FtM3BjbjltaWtsSzVMc2M0R1FyOFE3aU15cVVtZk5nTFQ1dkEvdDhI?=
 =?utf-8?B?MmVna3ZObnVrakM4Z2NNWmRBNjAyanF4YnZjQVQ2ZjBQaCs1M1hyNnlGeFVt?=
 =?utf-8?B?QkV2Mzd5TXN5VklIaEExZVVBbGtHczkrWlErVnVrTVNjeU9qQzFYZ2NSYXVl?=
 =?utf-8?B?a294RXY0ZkhKY2tDRmdtcFVEdnV2aFM0L29DYWQ3S1RhT3gyRXBKZU5OdzF2?=
 =?utf-8?B?Sm1rSzc2ZmI0bVM0c2pNTmgrVkNlYUpVNTEraFBMcllwbXc0N0FId1VSYWFV?=
 =?utf-8?B?cElFUjV2UmdaQlYybGNwcWRXZDJMUFF6ME9wSmZVNWdVNENJWkJTZ2F6ODZS?=
 =?utf-8?B?UGMxWFBSUUE1VSs0eUxvdUNENkF6bHpMMU5pNTA5Q3BDK2s1Tjd2MEtPVHV1?=
 =?utf-8?B?RFJyTkhUTUVMem83eVEwY3Y4cWlUekMxdFVvZXorR2czV0Z6dnJmcWZPcit1?=
 =?utf-8?B?UGlNdWFWUDdnVnJuR3lSZlNMM3pBd1BDWTdJWnVuTUVzQWw4TzZEV205bU1P?=
 =?utf-8?B?TVlkZFR1aDVxQkVsa2NUTFo1V2RYU2FIUmdSdFRwVzdaZmN4eUkyYmNuWXhM?=
 =?utf-8?B?cktINTg2U0Q2Y0RjVFJyMzMyVWJHNG5DZHB5blFrVlhNYUcvT0ZGeW9Xdzl3?=
 =?utf-8?B?aEVkZVlQbXdjNVpXWndpVXNIbHMxNUYrRUtXeVBTSWl6R01HTTVsY3lGTmNG?=
 =?utf-8?B?T1RoUFh6VFNKOGY2U1hkdnkrNWxrQ3V4WmdtNmRuQWpRc2pMSWdObncySjBr?=
 =?utf-8?B?Z0lnNEJWcE9IdzNrUWpsWnVXZFVSN1UwNzlhODVnRFRvR2VqZndMdmlwdmN0?=
 =?utf-8?B?UVJ4b2NCNHU4WHhGYjR1RjBvZThlNkMxejdYRnhQdHAwaGFRWk1zVWcvQ3pP?=
 =?utf-8?B?ckF4TUpMbjVhMnBTRHZjSnYvdHE5L29rMk1FZjA5aFFGYTA3WHBGMHEyN1l2?=
 =?utf-8?B?aHFVWGthd3hXY0FBYkZxMFZPbFpYRnhWZzg0QXdIU3dGbTF6NXFXNUZ2TjR0?=
 =?utf-8?B?WDZKaHZTRmxCL0NXQ25HWGVVQUU0MVpwc3RaVm4vLzB6SFFmT0Q5MW1CeUZh?=
 =?utf-8?B?TGxNc2xWZmdmMmJNbFRUUnU0ZEZuMCtyeWNtcnRMMUUwZUt4Q1NhZVZVTnd5?=
 =?utf-8?B?TjA3Yzg4Vk9PYXV4SDlkTUdZMERnTFA3ZmdZZ1FEdVVHU1NDaWU5WUNRLzFT?=
 =?utf-8?B?czl3SVQ4U3dHYmRZUUR1WWp3S09pdzlsRmZtZ1UwK2V1eTliZCtYSkxlSEVq?=
 =?utf-8?B?K2VwQW5uM29rWmNSTDdIM0daN2h3NkdXSFdoSmtCN2lPdHNuRGthSEJtbGtT?=
 =?utf-8?B?dDlSWDVGMGlrSVM4OXVTeDRDUGZHRCtlL256ZUtDUXI4Z29WWVVWVlROYnZN?=
 =?utf-8?B?UkJGVnRFNEJPYndNUzREcGFKVXJwMVdzQ2tsTXRyZ2VZdE9jb3BmbmN4RkZm?=
 =?utf-8?B?dDNkaUV5ckVlRjhPUzROVzJlQzNGVnpxeXJJRGZUaFpLMmYya1Jka3oyVmRJ?=
 =?utf-8?B?Z1QzOHpKVVNDNmlHaUNsY1BISWIvMUlSOXIwck5Ca25JQTIzaG4vSlJudmJu?=
 =?utf-8?B?cUtBSVhzeS8zVURTaEpsdWFRQXpvOGRacmw2cG9jQXlwcXNIdDFNN1ZMVkxP?=
 =?utf-8?B?RDM3dlFwL3AvdWVaUktHRW5nU2ZEL2xIYVFFTDNmaU0rcEtNSEp1cUFPRkYw?=
 =?utf-8?B?L1FQakNXVVZVbXhWWkdrYkxJMC9vWGZVSHFpaDlLQmRUMGRXQi82NE8yYTBZ?=
 =?utf-8?B?NnZjVkFhU3pmcFR5aW4xRE9SenVTd0NvMzhXaUFrMEZ6RzNFOEVidGNwU2F3?=
 =?utf-8?B?dlFRdnpZTktYbTc1dFVwdXdBa2ljNjFnTFhiaGYwUHU5T3hRU0ZCekNFVXpN?=
 =?utf-8?B?VGJzQ1czQlUxRGVCZHFPQnJzcFd6TXNyRDhMU29SZnU5TXM5N1VGWWwweDUv?=
 =?utf-8?B?WnpPaWF1Y3o1a2phZmV3cGZ3UW01SmdGQkV3MGdHeTJrTVd1VlRkajNET3Yx?=
 =?utf-8?B?K3VoK1U5T3pjRmpDZjZ6NzBXVHF4WGEvSldUV09mY2hGbGQ3dXJIZ0RnbVlY?=
 =?utf-8?B?cmh3MDVJaE1PM1hBeEdtNk5MczBmVFgrcWRTSjIxSFJ5RDFUNUpXSzRWQjFt?=
 =?utf-8?B?K3RjRVNjRC9oR1BPemJYQVBvUDZJSDRrMUczZkJiamYyNU0yaGJ3dEtueldJ?=
 =?utf-8?Q?ZvbLVBcjvsXUjUM3FPEQ57THDiVN44vcOXhRz?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1dae174-d5d7-440f-ee62-08defe01a501
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 14:53:35.1370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MWGLywqtogJ+6vJsGnY7viGZMDL1TcT/fEtQFyPNzMJ3VzO5QPuZL9DPfFYYkvF8PIN1P13RMgz0nvIYHuABoq+sYtQ2M0WSV62op4DzYQCeWc6wjV/cRkMt0fdAytkn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9632
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_075341_374641_70AA0072 
X-CRM114-Status: GOOD (  10.13  )
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

The NXP CBTU02043 crossbar switch on i.MX8MP boards is used solely for
USB Type-C orientation switching, not for SBU signal muxing. This series
fixes its handling on both the imx8mp-evk and imx8mp-ultra-mach-sbc
boards.

The CBTU02043 has two control pins:
- SEL (select): controls the crossbar orientation, directly driven by
  the ptn5110 TCPC via orientation-gpios.
- XSD (shutdown): active-low enable pin. Must be held LOW for normal
  operation. Directly connected to a GPIO without external pull
  resistors, so it must be explicitly driven low.

Patch 1 (imx8mp-evk): The existing DTS only had orientation-gpios on
the ptn5110 but did not drive the XSD pin, leaving the CBTU02043 in
high-Z shutdown state. Add a gpio-hog to hold XSD low, enabling the
crossbar switch.

Patch 2 (imx8mp-ultra-mach-sbc): The existing DTS incorrectly used
the gpio-sbu-mux driver for what is purely an orientation switch.
Additionally, the enable-gpios polarity was wrong (GPIO_ACTIVE_HIGH
instead of GPIO_ACTIVE_LOW for the active-low XSD pin). Replace the
gpio-sbu-mux node with orientation-gpios on ptn5110 plus a gpio-hog
for XSD.

I also give a look on i.MX8QXP/QM-MEK, but not easy to use
gpio-hog for the i2c gpio expander because there are potential
probe order issue.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Peng Fan (2):
      arm64: dts: imx8mp-evk: enable CBTU02043 for USB Type-C orientation switch
      arm64: dts: imx8mp-ultra-mach-sbc: fix CBTU02043 USB Type-C orientation switch

 arch/arm64/boot/dts/freescale/imx8mp-evk.dts       | 17 ++++++++
 .../boot/dts/freescale/imx8mp-ultra-mach-sbc.dts   | 47 ++++++++--------------
 2 files changed, 34 insertions(+), 30 deletions(-)
---
base-commit: 4477a78374a57c3809b172ad30cceabda48c47c6
change-id: 20260817-imx8m-typec-d4a45408e81d

Best regards,
--  
Peng Fan <peng.fan@nxp.com>


