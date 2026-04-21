Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02609F8924C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 10:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GRQouUAtAoFM2r1Ht6OLIZn6BKh+s2A174EICOx9dcE=; b=IfvBBchhqjn30crPZY0TxGveBm
	iEwS/uwd+v1ZvBDdDbB4FBzaLdHcLdUt0wFtERArRAgwVn6GsUHBmK3BziPECmeuQB/RC/bsPw6Of
	5biZ2C3GsS3VrVv+VTe6qgpG+EvQ0CnMltu3kgK26PIbYLg77xMTJfCNoscs0GzFzgo/ujojoB6kZ
	mfF0zAGTKGOYs2HOjpOQurYANsQLuEYoojM7Cmd3YtP6+hJ/px4XPgsEmtFSEbUNONDb6zYXFjW8h
	h4u3/RlQ44guIOHspM099cRVV482Y2DzpnpcliG9TYfOq6DoVAudnikCM/1fns3RitPVbfqkvf3gR
	k3l3Xh2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF8JR-00000008QSl-3Wmm;
	Tue, 21 Apr 2026 10:26:38 +0000
Received: from mail-francesouthazon11011061.outbound.protection.outlook.com ([40.107.130.61] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF8JH-00000008QBl-1gwc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 10:26:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=adU6gHQbRHvVRFJ9tr+0e9JOqS//JZuIy0bhoR6veGC9Iew2PG01efGRQvuY6zdh0irzfWoQT81wOTN4IbDJdLR8xFi1y9sveeteSqVGaRxhBq1OJrMOMGjoN+nBEnPZFFgmz4QF2rEiXyEzt/5mI0m34+eI+Yd2Qz4JZnTSBXOCa9yhOmE6Dxhg842IJGRq96SMp9nUYZNPggj5ZdavQDoneBSJ9xhx0Se8vc1GEjFPVIbceyaTxqnwpi7hmu+EvqBoWTjoXPfQPzhiIhQWPxzIderYWiBllBcIDisJgMWojOujQ31AnDNHuQbEocu6yjMCn8ZPz2e0h3tP08kKOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GRQouUAtAoFM2r1Ht6OLIZn6BKh+s2A174EICOx9dcE=;
 b=D/S7r58CQ+jYMrTF4pwm2U01NFUij5xWHPg8MkEYvjgg7oVJPI2K+3+XNsSUj267YHJaTVDbWrVIJuY1eMnCRUh/k5Z1thbRp4T+VT53FRIleLZucwESHRNRPsNStgmv6lhI0Du5MhASMLD1E5udVTfymzWNYx+ZQTSDaX8e0YE13nssmblaonInEXlJYgp62dgZTEqa8ovNWhYqXuyzjwln3BIt1WqMfjXXlrTivSC9kbNK00c6tGapdeFYv7goiZ0wGxk5ec1VHZSKHXYTWVZJQTN15L7v8ApjuqJVB59rXIqt/eEv/faMF/FlzHKsc9tQ0vB+2DFOjy0JDBjt8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GRQouUAtAoFM2r1Ht6OLIZn6BKh+s2A174EICOx9dcE=;
 b=kKupIbylESIx7UtQd6vMOPSBj19sq6NUZpqSID7Gy5UE1Y8VOPvN89QDH1I4djF80dAWKs6+qPtdZtHy1iZeSpVJk5fO8agXJbxCs1mGq0cXMYsQJMW83sGGR+0Iz20JhH2xcpkHI5ASl2w6qsntlYzYfoFsSOCa6vcz4bp25nxNbLsWWLmU4sP85lx2m/6BUArHx7IxrzXyOkh7oCmAqVs1YwnEAunxIyGT32s8D2wswjYgNra04N0XlRuwFMVmi56Ya1Fzsr4Md4jEHvJd0yy0ULLOifvBGBf2XdrpXdPL9f1oU9SW2PPG8I+/nNDKUWBAb6w6spKarT8hO7CE9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by GVXPR04MB10111.eurprd04.prod.outlook.com (2603:10a6:150:1b1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Tue, 21 Apr
 2026 10:26:17 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::5c3a:1a67:2e02:20d0]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::5c3a:1a67:2e02:20d0%5]) with mapi id 15.20.9846.016; Tue, 21 Apr 2026
 10:26:17 +0000
From: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-can@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Subject: [PATCH RESEND v4 8/8] arm64: dts: s32n79: enable FlexCAN devices
Date: Tue, 21 Apr 2026 12:26:03 +0200
Message-ID: <20260421102603.4122332-9-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260421102603.4122332-1-ciprianmarian.costea@oss.nxp.com>
References: <20260421102603.4122332-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P190CA0040.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d1::20) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|GVXPR04MB10111:EE_
X-MS-Office365-Filtering-Correlation-Id: bc650be7-630d-42e4-2dfc-08de9f906c06
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|19092799006|366016|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: X/VwV1Ima29bsrHi7s+Ied5/hvnumjzC7i8rmwe18Uo5cZ9ScZu+/i9uDiJZukhVvnrCE5Ddo7V/alEn4eUvzt2ZA2QPq9ljL9F7FEMTXTKFNJ9K0EK0cxDZNLzqJz+YYo+wWN3dw/yk/k1oSOEhTLNqgaFfI8D6vKDqJmxuSd8nG7mkApvmJ7/7EgZOfACBD3T5y2ExEFVc+LGJisUcvLyGFQ5Pn3uGKv1OjzPo3O1jyG6NXR4TB3HRqdHfqL0fk9B/rPH8udEuOyP70Q7Kl3IygrQPkv82GMdoz0v3obiJojNJou7Z2ujsqyqITd9eQJjg67Kq4BSa3dyYfTBAB6JX7keNN3aPRzG5wOQ2Lv68uFrseuXNlb566E5iK2LusoG3U3PiB75nsKOd/4lNlcbwOdp7yN5XGNUlHzJZNquUejpV1IClDl5UzQzCh6BKt81/xJoDfqYu/73yFYNMXYDb+4OLSIdpfnSTElFGbnPGYdif+9qGtcen+EBk+YSi2fO8LKpxwq2YTZYRF4KheYzwrHjyYsFD0xAHvYOdNHQL51sxmIlKshEXe9z4S8nVmDoodebWeKLed0xVzQCU/HASi+1Rjur4U8aBBi0KUx+8PqalgIVBkzlwU6Se7I7UONkWmMMWTgTWCKBjCG1zpPm3E3Coe9HmEA+5/7kiiWV62SkH1+D8Bj/vQ910UMz+0ugfgVxq7GJ3p1MgRyfPuTa/t/4QihfT+S9Hw2fZv3U=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(366016)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGp6Q2lFa2VzaWcwdjFWK1VBOGlZNzJrdGRINGJiU2UzREVleDdZeDQyRlly?=
 =?utf-8?B?MXRrK2RuWXhQbFUrMm45TTRXM0hBYWFYemIza05JeVN6YUpYbXBTb3VRN29V?=
 =?utf-8?B?T0xxM2ZkWHVuenRoZjcrZFBmd0M3SUlwSWg5N3JWZDJUR1JNaTRsNFNjTnNv?=
 =?utf-8?B?WHBFdVpSeEdKaHUzclR0cTJ0aXJjREtyU3BoQXNueHFPK3U0LzNkTHIrd2V5?=
 =?utf-8?B?RHJyNGFwTU5BQTI2cC9Ya3ZZRVhIdVVPNGpRYktJMXJYV0FRSHEvcDRXTGxE?=
 =?utf-8?B?a1kvUGZqdWYxejM5cXpqKzkvK1Q3bWJmWDJKRHZNWEhHQlg2Znozd3hYR2pW?=
 =?utf-8?B?MVNKb3poUFVBZk40Y01XN1Q3b2VhYWgvTExmaFZjejVBeitPT2p4S0ZTbS9k?=
 =?utf-8?B?ZzhtTkhuWmg3dE9hVHpYMCtqTk5pRW5WaHA4VU10RWF5akFrZ0RQcmZza0tp?=
 =?utf-8?B?azJVcTVwZ1RKUjdPYVgveXpYbjBLcG1OblpEeWRTd0dRVk42aXFoSXU0T3d4?=
 =?utf-8?B?ZGJod1Jud2MzZDRRMDVCdnZrWTNlM0FHWU1lSVR5dGpDMncrNEExV3l0RVhT?=
 =?utf-8?B?T2hMcUNta0dEVlM3djdKS1pMVWNzUGtFSWJNaU1ZLzNmMktNeDNJVnBlQyto?=
 =?utf-8?B?YlVIcVA2SGhRVVpNZTNiWmRDa3ZQbWJydzBVSlRRT0pmSVQ1V3d3SXM3RFY5?=
 =?utf-8?B?Y0lCTG95VlkzRE9nRmpiMDcxQkRSLzhKaEdpbjcyNG95M0FGbDA1M3BGb2kz?=
 =?utf-8?B?Y1FsZk9SSzlrTWVOT3dxa2tlZDdkdjFFa0t1NXZmMEQ1U1hTdTQyS2NvUHg2?=
 =?utf-8?B?NUhrU2NGUGs1TGM2Ry9zemNKV1ZEeGxhVXEwQnVBWkZ2NGl6WUNEY2VxUVdo?=
 =?utf-8?B?czZzVmh2ZmxNalY0eUNzQXlLbmJ3a1NqdE4vayt5T3htb0E0bUVaRkZ4bnRj?=
 =?utf-8?B?aEY2bjRyZW9na3NwVkorYTNuOE1yNUxaanhUYjRlQmlNMWNGSnkxRTJpQTVZ?=
 =?utf-8?B?a1VTeW5kamN6bFcydFdqK3BUSkNhejhTaG4xbk80WUpNSlVIVkJ6Z0dMbW93?=
 =?utf-8?B?T1Y0bWZkQU9lbUZCWFdVYnlqVFVubkJwY1NhYmh2d2RpMnpDclpzaW1rQ3pV?=
 =?utf-8?B?R09kbno1bGptUFhlWFlLdVNXaU5OKzNIdlUvNEZyQ0gzaGQ1N2xON05jTVF4?=
 =?utf-8?B?bWhLUG9uYTlHTnJoVmxpd2hIWFNRdFVMUXJ1bksxMmdWNGwzaGRqZEdtaktS?=
 =?utf-8?B?dEx6eG5SMnN6OFo4WThRYlhkM0JjYlZDTzZLUVVKbFRxcHNvZGUvSnlPalFa?=
 =?utf-8?B?d0RWZTRHSXdURkkvbk5PWTZRY1BnQzh0eU8zdjBuYmR1Y3NUS28rUHNEL0dF?=
 =?utf-8?B?dXhxbXNMR1ZJUmtNb3VweGJGc2l1N0dSaDMyN0hxNlg2NUlzTjlUeXlmUXhP?=
 =?utf-8?B?U3JBYVcwaUppbjhqVXBOOTFNOFFYU1g5NjFEc0RGbWd0WGY2MGZ6OVdYU1BZ?=
 =?utf-8?B?eWM1amlNTEd3Z3RmTTV3eGZ4YmNBYnBmVTJPamJwSldLZUtNZU95a2hRTUxK?=
 =?utf-8?B?My92MU5uVWkzRWFGbjFCK2JUL1lFRXFITmcxSFlMWXR4REJHNkU1aWNMSk82?=
 =?utf-8?B?d1U5Q1B3blJFa3loS1I1U09RQys1UzBwSFhLb2d0cHVaVWtpYmZVS3lVV1NF?=
 =?utf-8?B?cEJZM0pFS0FRMHJueXAxTmdHRXlyN3pURlZ5c3B3Zmd4Tmh0Umx3aU9wd1JR?=
 =?utf-8?B?TTlRcnlONFB0VUdndW1Idm1BSCttM0YvV3d5dW16VzlmUmFaR1R5R3E0Wmhq?=
 =?utf-8?B?N0NRMzhlYmNqM25Hd2pMVmkzbktjYjVOQ1NMdWRndlQvODJxZU40T1pTYmpG?=
 =?utf-8?B?YWMyeXVSRTJDZWMyVXBML3NyOFMzNThmM0RFNjFsK3hDQ1JuQ25Lc3Q0cjE4?=
 =?utf-8?B?UncvZWlHQmFic254c0UzeFdjTTlRa2FrdDJYUm5xd280MXFSUXJsbHd4R0Nr?=
 =?utf-8?B?SC9FMWdUeHowVzk5T0ZJOVo5dlM3TW9la3RYZnlZSGF6bXJ6VEVZWEhYWTNN?=
 =?utf-8?B?aUJPMnhPeUk1U1pQL0djV3ZiU0Ridkl3REN3RkI0S3BsNm9BOWJDSFVhbzNu?=
 =?utf-8?B?SXpUMlNEUUQ5ZTNQczEyUkZnQzlWWUl1bjFCWFo3VXdxM24yYk9NbWZOYVFI?=
 =?utf-8?B?Y1dwTmtFZUFzQnl4SU93cldTeWsxWUZYeGR2amxxY2UwcDFBNnJqc1FzSlQ4?=
 =?utf-8?B?U1R4N1RGWGc5RnFOU3lVMEpqNUh5NGlWMy84eDdPaElGUVNFRVo1NFJ0SW5Z?=
 =?utf-8?B?YWRWdUVOYjgrRnYzL3Y3TVE3WnY4ME5ITzZmZUFUMjBXZENKNkUwZXEzOFBM?=
 =?utf-8?Q?Ad231uKWWMmHMpRQ=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc650be7-630d-42e4-2dfc-08de9f906c06
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 10:26:17.1307
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SVIdIqq87A8la46vTrR5uSZLZOO9Y/eFdhbF2Fb6vu3z8oGyLmaVixYASTrC3ip9GbYoXmZyIdzNe2J/bsT/F3RN8NLN9SjwrbtNprmHE4c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_032627_481089_2F56A71C 
X-CRM114-Status: UNSURE (   8.34  )
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

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

Enable FlexCAN controller instances (can0 and can1) and the required RCU
irqsteer interrupt controller on S32N79-RDB board.

Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
---
 arch/arm64/boot/dts/freescale/s32n79-rdb.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32n79-rdb.dts b/arch/arm64/boot/dts/freescale/s32n79-rdb.dts
index 1feccd61258e..65a595d7535f 100644
--- a/arch/arm64/boot/dts/freescale/s32n79-rdb.dts
+++ b/arch/arm64/boot/dts/freescale/s32n79-rdb.dts
@@ -43,10 +43,22 @@ memory@80000000 {
 	};
 };
 
+&can0 {
+	status = "okay";
+};
+
+&can1 {
+	status = "okay";
+};
+
 &irqsteer_coss {
 	status = "okay";
 };
 
+&irqsteer_rcu {
+	status = "okay";
+};
+
 &uart0 {
 	status = "okay";
 };
-- 
2.43.0


