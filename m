Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 496F1CA9ED0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 06:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=87jY3uVMD4gj6VINqRhBnbPvpET/We8xCle+Knd/wyI=; b=LYnMT+X78KmpZM4YMyqa01EIN1
	c56M8yZ4hEBZsts8y+KAAZ2dTi7Pb5Ck/fBKu6W/4W3mYfKyggxT6KPT8c2BGvSPvqfFmxcpftimb
	5uDWYoBPoRvRRaZ/fOCf1KvxGiqo7l5AYMobPBLOdlbfidVK5cxRdVXqMl8lOdLVcjXJp43frXd25
	DzbkPUVZEzWx3wMOWK57Fv8NQjiwJHsp75f60tCSRPRjjO+4TSFN2tQ6vIwxMxMD8uz7A/ZDYpTl8
	92tlOPSfuTtM36JqGMiX5gXRluHbtWP8TS9WcFYoMZylqIhHjpRHNL0y6Spi1aD/WM4g9U1s0Qnm4
	rrh4grBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGVcc-0000000C4lN-3Ksi;
	Tue, 13 Oct 2026 06:04:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGVcb-0000000C4l7-2pWa
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 13 Oct 2026 06:04:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=87jY3uVMD4gj6VINqRhBnbPvpET/We8xCle+Knd/wyI=; b=fcB0mXGrhUXlX5+yaDuJ0GuTiU
	nvRavqPh18tylUxcyiIUXzOK2sSBoP6ZbiqEY1KV/jsrv1SjqF6cXseZ1TvYdYilw6lzjQWn0pkCe
	LycC6OKYLMpVpRyCqeYBaHDzik87RiCskGyI8I3xwj+ln5AVYbGoAGObohiDGvkqPmPUVgjMLncYJ
	D8W88sXC9BKR6k9pfvetcVb0Lvs0aSeMlyg8BzMzSR24LNm9Ek9vbmqOJpV5kA5+jD2zu3jfA235A
	Tf5Hd0IPTFn6XCFpT0SQI+kcIhnkkRDfewAkJCwoafVDjEk9OAsuSe6U9t09KrPGSsGpKDVQhM9KN
	DraeXtzA==;
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGVcM-0000000F8eP-2I4r
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 06:04:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=toeb621EvwfpFrCSA9vPtnNVDbHcI64ZGt3Gi+OPIKiQcbBiio2k8lZkwH0NweJdKI3JCYb7RgnF6y2pkhGpBPeSUAtTLgExQ98cnhVhSC36WSXnvdzL3rrRDr6rCeMtilugS4D0uuqKu0SreNrv5aiRDMwTIuigFQ6GFtdCFWPOI1ODCJACOCTH+3EzuHECXy4jsL3MyrrMFCuYj/o4CDLPDYaJft42Uxj4oR9KjJrCzTPzlP2umtoHo6IVe+LfG7IuaqGnOxm5KZCbtfjPTFa3RVVXg1vWAUAgF0pmfTramSyGeVXwTAxyhRTRVhE5NApaTqE3F657qDO0M/km1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=87jY3uVMD4gj6VINqRhBnbPvpET/We8xCle+Knd/wyI=;
 b=hiayCICDImcNS1ScUI777pmecNhSh+6612+7xpPwEwf0lGcfmqZTo8duolTMCjkE3/hKs/wuvF74Y9bkVSCQQzo17V6ixoqY4Mlr6HyGj7pM1LDGw9hNDoEcSqRxpzGs+n+K4WtTi7DnA3MrDcdlyIt/tPVFL5WI+w5OvC5XSIVsA9qH6lqVZrljeo4gnbQuSbXdMcr/VhIaRXhXFqi2cLvdoMYcgDWn8hzUbdeV6x35gY1WjDnMzesFEfg0yole2zYlROxSGUDIkJuQUEZ9UqHDqb5/johTcFF5RhGm24awFhsqwn+Q/0RtpNfnnxT+DZADac6edhXdvCqwptBAeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=87jY3uVMD4gj6VINqRhBnbPvpET/We8xCle+Knd/wyI=;
 b=xmp/ypzhjYEMukAcxZtzQGia2eh99b28tFZUkdWHwQ84hCpNRiR+tDciWY5CO42QepYdd68/ZTSE7SuX6tItCDufRsDhhuddMnSLStCKI51qKcQa8ebr28RdoPms007Fzsmq/9eLWCavx/s4C55xyMX1b1snOHwkXhoFyWHQdKKgGyfmCf2LSg+P8XnIemrvYTV8HK5a6YFmFIIS58z/tTpJ/ltuCo3teyCIqTn7hfjNKWf3yGLYcTkt/K5qISeVu+E0IJqq2DuRcuQ47YlfBiC4vJe1m6RRaWW97thYEquw40Nhqn+EA5eL/XkqRF/JislufceAbC5pgmYhJNFsHA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AM9PR04MB8470.eurprd04.prod.outlook.com (2603:10a6:20b:415::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Tue, 13 Oct
 2026 06:04:00 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0522.011; Tue, 13 Oct 2026
 06:04:00 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 13 Oct 2026 14:01:10 +0800
Subject: [PATCH v7 2/4] gpio: mxc: fix both_edges bit operations
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-gpio-mxc-cleanup-v7-2-c4d769587d3e@nxp.com>
References: <20261013-gpio-mxc-cleanup-v7-0-c4d769587d3e@nxp.com>
In-Reply-To: <20261013-gpio-mxc-cleanup-v7-0-c4d769587d3e@nxp.com>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, 
 Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: SG2PR04CA0206.apcprd04.prod.outlook.com
 (2603:1096:4:187::21) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AM9PR04MB8470:EE_
X-MS-Office365-Filtering-Correlation-Id: 8746ebaa-1b0a-4705-658a-08df28efc661
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|19092799006|376014|7416014|366016|23010399003|10067099003|22082099003|56012099006|11063799006|18002099003|261009223027099003|6133799003;
X-Microsoft-Antispam-Message-Info: nzXCfDBSmvWx0v9T3PoyV/mhhqNsoxaHMs5ZGjOs0929NEkBvjP5UvEgpLAVwBM1TK/795QJmtLgVkua7b8O7wIS23FOCJv4kosBy6tWtSoo905hESbs68TsGLyvFg1igGLhOS2DbfgbfgIawObSmbh/6Erk+mTyGsNdNIER/agqacJ5t9CMabSQu8FCqo+2/3P6kSQz7xcBuY44Ttiklm93eG8AgBV/hsP7gk3HGLvFgPxD5VI1M0sdVaDZ1mub2f/TcrJ2YyDlu9SvsIJmTa6jQD6k7P60ZnLvKq9qZYg1dgV6i/VLdTlIzIojNjtsnVL4DHd1b7fc6Y5vX2JMpl7RU2hZHh9IRVpZ0rKG33p1Cwa+OkgBHmAk7sH5kVzonrRRJwkWFWmMp959By2ExQtZm0bi6hX3ZzGM65s04JXTwGYRe6d5yUpthYu/5QnY115M/oKYueCz8jmzF1jAhuGNMvIKxF+gi7VlrbzyAgzORkBhVA0Ezoxk49fbE7KuxXqd891+oWthoAK/Lvi4aNFcTZi+eYutzqy1V7ndw5SGP5+jEMuyNb8cPhRUiQ7YzLRFl2mYzh/fUBJIZkjmQ8hl220md5wZzXFMpysTI5+SxgDK6STQTLPEHnh195kitN3hjvTQfvkulac/ioja6UaVt8+nVOrqrrIQMPn7fdk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(7416014)(366016)(23010399003)(10067099003)(22082099003)(56012099006)(11063799006)(18002099003)(261009223027099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akU4ak9aTzIvUlRiVEFKUFg4V3ltbG45R3Z4dDk1UWtmejI1YnJwUDdkM282?=
 =?utf-8?B?YkpNb3Y0MGFYdUsyMGxrc0tGcnlpcHZhRkJpMitnQ2ZQbXhZVjIwTEs1Nldh?=
 =?utf-8?B?TzA0ZmNJTzNjTVFhWFZOOGM5N3EvMXprb21Ecmp5WjRJU3BRK1QybGRCWjl0?=
 =?utf-8?B?U3JIMCs4MU5tSG0wSzRuN3NxR0czVnA3ald1OHJMd3lVbmZBLzg3ZGVERGc3?=
 =?utf-8?B?ODllYzUrSTg0YWs0ZmswVE0zWk5ZTFVTOForYm1HbGFBWEZSZDBTQktJWDlD?=
 =?utf-8?B?VWZVQ0JtU2Q5ZlVtQlBXdlY5NU83NkY3citWTXF4Y0VCbUdOeHBSb1ZlNTdT?=
 =?utf-8?B?bWZHdXJVQ1B0WTZsd0lwck4wRWs0N0wrZEdHc2hRbkJocFhzY0hhYWM0SGtS?=
 =?utf-8?B?MVVOQ2o1VjI1a2JUaE8xNnVrOXRCU1dEeVlqVTk2K01KVkVLWlVtVERBbUVH?=
 =?utf-8?B?S0g3bmhxNnY4WWpzT1h3R1NPaVVybkFOb3htbnlEb0NVMnZ1SkhSTE82bXk3?=
 =?utf-8?B?akdxSndyQnVLclhOeDNSbzQ0dEFvVFluVkUrVEZVQ2V2eUdpRy9Wb0RZQStu?=
 =?utf-8?B?cERjZnFGVUhpbS9SN2FGVWtkU2ExdjVmRWhncWVuamkra1QzMEhlY3R5OUZS?=
 =?utf-8?B?clU1K3JidWtOMk16eEhiRDRHaHNYUHl5U3pjQTVkRUFTT1BBWDBNWjRuTzBC?=
 =?utf-8?B?QXpTeEpBYVphWmFRN1oyK0F3cklMQWRPME5jQkRBTkwwbE5QeC9leWhvOVM5?=
 =?utf-8?B?TFU0OFdBZjFRV2tFWFFDMmFpZmIvVzU4UEpBVWZXTndQdHlpWUFvNjByNW5i?=
 =?utf-8?B?eHJaTUhTUWl3M1lEQnczWWY1MnlhZ21qTjFtK1ZxSlpRczUvR0xrNDErb3Z1?=
 =?utf-8?B?TkdlUzFaSld1QUxXSGhPQmppUE5jNUlMUTlqczJwcEU5V1l2ZHVhUGRXM3Vr?=
 =?utf-8?B?aTBWWDk1d2V4ak91VmNGUEZ6SVUvdU5QMTI2OGJXOWtaMUpxOWorajc4NkdL?=
 =?utf-8?B?TExLd1hDT3hsN3pENjREeGFPVXc1VkpwOUFpcm9QSC85dm0wMGJwT3A1Um1L?=
 =?utf-8?B?STNzOEZHTm8xOU50ci83WjRPVnBjamZTd1BHZExRWG11eVJWVTExMlcrcTJ5?=
 =?utf-8?B?ck9jcVBYRzNkakRueWJXMm43dkluSGltbmticjk0bmQ2WUV5QzcwaDc3Yy9i?=
 =?utf-8?B?VGRYOTdXM1FiWFRXRlJ0a082ZWRWWmxXTkUrY3RnRW1wdnh5d3hrRzBKclFX?=
 =?utf-8?B?M1dpUTUzalRWNzJlWkJxeEJvdFJoMUp6TmVHOEk0QUw2RE1Oa0EweDJmZFY1?=
 =?utf-8?B?dm9hS3dTRWRYMmpPeXY4dEgvL1Y3aE1SbEhmTlZUbmhzeFluK0lEVVFMcHNj?=
 =?utf-8?B?TlIvd2xIMkwvaDFXRno5TjR4UTNoV01PZFJLcFRabUNBaWM4UEFKMUk3N2oz?=
 =?utf-8?B?UlcwZ25FU0xtZlRxbGhEMVZyVXZKUDF3NDVUVmovWmlkZklRcjZKbW5pN1BJ?=
 =?utf-8?B?Qm9NeUNJM2RZdU42MFR4RXAzaEFibm9mWCtRdGo4eSs2dzlEOVVFZzNucFlP?=
 =?utf-8?B?SlhuMExrbVpubVhrL2lKZGtCWXF1Vnp3YWhiQ1E5VDloWXJVS1VMK0gwWWh4?=
 =?utf-8?B?Q0cyKzhYcHU2ZlJUZWxWUkd5YVhMQkRBSWtVNjRiN2FhYjJneENKNThqL3pT?=
 =?utf-8?B?VHNtUk1TK0Q4V1JwaGtzbGRpQmpwNyszdFRpYlo2UUc4NEhtcmRVWFBBN2Zk?=
 =?utf-8?B?WHg2anpqUEIxZVUrYjgyTnpNTUVVdDN1dThsa1BUeWUyR09RblEyK01QTzNJ?=
 =?utf-8?B?VlBLdFNSTkFWYXluaGtiRmk2YlNCbUg3SjRtdTF5NDFFUWdHQndEU242NGFC?=
 =?utf-8?B?QUQ5cTgvZXFJTWRHMTViZTRlSi92bFFqWmtPYU8weG1GMXNyY0ZWNnFOaXRG?=
 =?utf-8?B?YjJEMzJIRmhvclBKaWMwSzZYVDdvMDZqTS9TQXBXU0hXZ2ZSbnhFWTVYUnA3?=
 =?utf-8?B?dzJLMkk1VW9tT0xzRHc3eDRqeHF1RmhTUU11QWd4WGZyVVlXckUyR1RnTTRL?=
 =?utf-8?B?Ky9OdGNVakRjZUV5NTR1VHY0T2xDcnNweXVVdzFtQURDaXBCMG5QVkhpTXRX?=
 =?utf-8?B?TmlJU1d6cjgyelBueXFvWmZvRExmTk1QcXJ4SmxXcENKUlprV0FFRGRUMFZZ?=
 =?utf-8?B?emFBd2kyLzY5VjVhTWk1YjVzcUcrUlhLUHNUQ0JOV2dPR3VpTHdhMkRHWFI5?=
 =?utf-8?B?U0NQZmVjYUx2T1ZRNGdXbEszWUpxaTFVL3VlUGpDV09PV05UUlVzSS9jWDc3?=
 =?utf-8?B?elhXaDNva2NMMW81WExTMFZ5QU9SSWRTZC9XSmQzVnJhd2dmM2V4aFJBUW1t?=
 =?utf-8?Q?791/6koKP7IYLKN76Hh3l/ZCI/b8Z072vscqH?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8746ebaa-1b0a-4705-658a-08df28efc661
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 06:04:00.3380
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XAvydISQTRl7zzaSV9dNiCr8x0yinR3fgyHDF3HZoCOJlcFFD5oOyoJO8be9+LWLNESjMLbGg0+KstD8y+LiVy1+KLxbrhhDslFnNnvEH7gENHg55LTC259MyqDO/sh6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8470
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_070415_106460_57820368 
X-CRM114-Status: GOOD (  15.05  )
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

From: Peng Fan <peng.fan@nxp.com>

gpio_set_irq_type() can be called concurrently for different pins on
the same port.  The IRQ core serializes per irq descriptor, but
different pins have different descriptors, so on SMP systems two
concurrent gpio_set_irq_type() calls for pins on the same port run
without mutual exclusion.

The read-modify-write of port->both_edges is performed outside the
port-wide scoped_guard(gpio_generic_lock_irqsave) section, so
concurrent updates for different pins can overwrite each other,
causing missed interrupts or stuck IRQ lines on dual-edge triggered
pins.

The original uniprocessor MXC SoCs were not affected; the race
became reachable on multi-core i.MX7 and i.MX8 SoCs that reuse this
driver.

Convert both_edges from u32 to unsigned long and use set_bit(),
clear_bit(), and test_bit() to make the modifications atomic.

Fixes: 910862ec092c ("mxc: emulate GPIO interrupt on both-edges")
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/gpio-mxc.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index e05f276a50e8..7e17d7668980 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -7,6 +7,7 @@
 // Authors: Daniel Mack, Juergen Beisert.
 // Copyright (C) 2004-2010 Freescale Semiconductor, Inc. All Rights Reserved.
 
+#include <linux/bitops.h>
 #include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/err.h>
@@ -68,7 +69,7 @@ struct mxc_gpio_port {
 	struct irq_domain *domain;
 	struct gpio_generic_chip gen_gc;
 	struct device *dev;
-	u32 both_edges;
+	unsigned long both_edges;
 	struct mxc_gpio_reg_saved gpio_saved_reg;
 	bool power_off;
 	u32 wakeup_pads;
@@ -168,7 +169,7 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
 	int edge;
 	void __iomem *reg = port->base;
 
-	port->both_edges &= ~(1 << gpio_idx);
+	clear_bit(gpio_idx, &port->both_edges);
 	switch (type) {
 	case IRQ_TYPE_EDGE_RISING:
 		edge = GPIO_INT_RISE_EDGE;
@@ -188,7 +189,7 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
 				edge = GPIO_INT_HIGH_LEV;
 				pr_debug("mxc: set GPIO %d to high trigger\n", gpio_idx);
 			}
-			port->both_edges |= 1 << gpio_idx;
+			set_bit(gpio_idx, &port->both_edges);
 		}
 		break;
 	case IRQ_TYPE_LEVEL_LOW:
@@ -259,7 +260,7 @@ static void mxc_gpio_irq_handler(struct mxc_gpio_port *port, u32 irq_stat)
 	while (irq_stat != 0) {
 		int irqoffset = fls(irq_stat) - 1;
 
-		if (port->both_edges & (1 << irqoffset))
+		if (test_bit(irqoffset, &port->both_edges))
 			mxc_flip_edge(port, irqoffset);
 
 		generic_handle_domain_irq(port->domain, irqoffset);

-- 
2.51.0


