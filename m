Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5D8CC9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 19:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r+kW8uvEB56QYqZDpEqniZQCwIctyDR/QScqMeSKjak=; b=vpHqkZU7NjQGFdUelVR7NYI0TX
	SjJXbD83PE1GTzX36f+OgRUtCVxP2l8eRfeCcvx1907eelewFasaGMehj8JVb/iz8Lhcae8oRj223
	KsmuhioZ4N13TKyF0zrxkOC6VIGrQLH1Wp9PTHnwOge1l4x/ukKix3yqujqX/Q28bu+m9ViCKqioc
	kMgbA5nM0y3U6mMfmZDEArHWLOmFhIzFRpcEKBTMthdQfK/bcc8DTLSPMux+NUf4igRAaGgbcREDB
	fvXIncAo1m4JJxhZd4ROdbpwrI/GHnmdRTf7rjegFvYmXoZ/ESVS5zg/UvCVz3KVnAT7t1p1I1upD
	MN8OWJNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9T4V-00000009NCk-2x8s;
	Wed, 23 Sep 2026 19:56:03 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9T4T-00000009NBQ-1y1K
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 19:56:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DZLSBO/snsHeppOZTIunm1im6Oa7Aw+/6g7UVj1C+u8K5PPDs18M+DtZegrHhLGuTXiNcUI1lkvh3wrEFgOTVRo1Czii/DmSoqiM/Nnfk9mYVx2o6cRc1JRamdPTZbVXZy+i+e+GFwzSCK4cQeYQhaJ39Zg+U2TVTVpwNOS6D0MNOs/m1Lg02+lQaUBkjPty4JSNC6JPEAG+uGUMGrHuM/vREb0z4UXS7Daw6w7KtGom77yJ8eXVis3LZRw5EOMy8oxLU+J3/Poh0kt/2T7JYD14nrQhbTj6kSWWE8t2vwOq6j7iqw07t5bFVYbsq4kY9Zc2nQ9ve159Q0B1mnK7kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r+kW8uvEB56QYqZDpEqniZQCwIctyDR/QScqMeSKjak=;
 b=rElsVPL1OWjvPNdgrs8YZ0kUaijDCfYX87YTaL2bKSeEj/H2Os6I6/JeQ3t/+y2uWeDkKjMDw+dn9PPn8N+nXdA/cBpj8MsxZ+ZDR28vLYoW4JqhNG//ivQ7xmg7XR2ZzFeuuugQa6A85J48ls4HnVGa8EawAXKWreRa6iJvapmbeRgXfOCbsB9TvAWytPj5MQXyw0FJH56q/FJBRhI7feq8gOZ4f0oA0BA56DgZ1hYAuAMoXauGX/yryay9oXtBc4zCZixdrv5KYTegy7SRAfHKjKOkNCJviV7oSZ3v/Gf+CuZV8R9y65GNRvk3wm//icjWGVz/qvpX5TDiP1d0+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r+kW8uvEB56QYqZDpEqniZQCwIctyDR/QScqMeSKjak=;
 b=NDCsCTCOXG+AYeQ8Rgce7GvlzU/5qJ1V0LzWdmZS58F7gtZ3t0dp1ou5XAG4OYD42uxTZNoKXDKYJXylhyxgdbieJ2FoYLcvNdHmWDa8puJTyH2s/5YEFBOMTibad+ie54RHAb2+U3RRtjoR/qVHpwEgaNuCr6QnusrE3fgShIkJ0bYbYVqSueQY8phYHtJjgRRDzi8NgtO9Ucc/3mRRzPqfGRgqpB3VXY8FBJu/Vf3obIllrAl9PrRVkDWd0jV8dfS/xBuAnxDRiJ/CO+CIO/y6r0TgnkfWFz8M64best9fBY9SAw7hOKO+XwVTC0ozeN3NLUnv2mqmALokUQ/V1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA4PR04MB7552.eurprd04.prod.outlook.com (2603:10a6:102:ec::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 19:55:55 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0428.015; Wed, 23 Sep 2026
 19:55:55 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco@dolcini.it>
Cc: Frank Li <Frank.Li@nxp.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/2] arm64: dts: freescale: imx8m[mp]-verdin-ivy: fix DIGI_1/DIGI_2 gpio-line-names
Date: Wed, 23 Sep 2026 15:55:48 -0400
Message-ID: <179019331017.3730585.14842273022154012615.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916084025.274229-1-francesco@dolcini.it>
References: <20260916084025.274229-1-francesco@dolcini.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CY5PR19CA0121.namprd19.prod.outlook.com
 (2603:10b6:930:64::26) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA4PR04MB7552:EE_
X-MS-Office365-Filtering-Correlation-Id: 363c75db-a90c-4ba7-3c6b-08df19acadf8
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|19092799006|7416014|23010399003|376014|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: UQoLpgPTQxaIjLllcQ5sM/ukJ+a1wv65cRP3lq4J05IGQsuV2p8Sd9NVQX2QaN10p3DERILfMrM50TwpzN6Eul/lg8uDpLfrSUEJ8whmvXF0VPFr8GUjXc3/PcVVzrF05cySL8WTX8tkefwNaTY8EICnml6n7KKzOj3HfsOpwtjvwSPV6kMJ39I9ZgT7qcejx/h8h2XP6dY69k2M395r6uKu7T6ZDXhBn1v8aopGxzKT35qu3Ym8Utpz5gXx4EGm+9XyeKVpCHRV1IxEmtuefcRIk8xXaGN8hNirTF2kWBgT75efYDUgrrMcIc6fat8LupywMtPQcwx0JSD8XDoWeZxev4+9Tow+8Jl0h3OjRB1UD3uvFwctdadumPwZmemqS0sursO19v1rBGtAm3LKDeOAR5ondI+hNc6jCtE76gDRytI9H5X47BRuXM02nI5mv/J+OY8Kds1sKKEaq797mDbx2X05i0Rgwrj1mKUHqCCiYWd545wbX4PckDGhfaUqOIPqwxbIbTes++8F4qSqV2Z9G3cgz9w6ZxyXYGOut2N4SkEm/Ozqsfs52QMiKVsA69Wi8rPpxWrUxORvYai3oOzIFh5RUnAbMkTuYIDUFIcQQr8kGQ/BbS7Z3DMDGOlzm35LUiZYjVU//Cr66YovYumq1jOBk6KzKU4WifHn2eE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(7416014)(23010399003)(376014)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NkJuejRVb29GWGgybWVOUUJVbXZnOTFUK1hXWDBzam92MVNlNGJJMFAwdEEz?=
 =?utf-8?B?aGZqQlkxbGpadlNQYm51KzFqb3Nyd3g5dUNxTmRReE5xVGtGbUczL1orR1Rm?=
 =?utf-8?B?SUFySVZNSHZNT0lDVUlrM3lPUFZReWtPdTBBWWduRFl5U3BoNElsWm9ZTitJ?=
 =?utf-8?B?REVKKzRqTU1KNExCZHN5QS9iYnZLYTBxbnlCaEZtREJzb3p4S2lOVGkyK0lu?=
 =?utf-8?B?dzJLaW9aSXRPcG95NC8weld1VmNIdlVwSmlXOE53YUtYQU1xQWhpVFV2cnhE?=
 =?utf-8?B?NVhob3Y5UDNsMmpKdWhaY1ZHVGg4ZnVnSVhKeEVKbUhXd1k3SjloNXNac3I2?=
 =?utf-8?B?T1RWbFBWY3EvQkJ2WkxJTW1odDYzdlhVQnYzTGEvTTdiclhkS3FNVVR5Q0Fl?=
 =?utf-8?B?cFhmekdLV1AzdUFUSDhWNVF1UUYxY09TR1hLcmE0L2tLVVE4Sy92di9kMzQ3?=
 =?utf-8?B?dHZtdElYTG51U0V6em5KbExBZHp0YVFndmdaOWZrelZaKy95UUh1dGkvbTFH?=
 =?utf-8?B?RHp3SGpRV3gySkNwaEl5QnBuNnEwSGJOSDZwdkxmZWd0YkQ4ME1lMmNYYnVP?=
 =?utf-8?B?TmQxMlpWN3AvVks5SFJlaVpoK1RhVXk0V3k1OThZK2xuancxZ0pWRkx5a1dE?=
 =?utf-8?B?ZzZPS2cwY3BhQTZtQmdWSW1MaHdLd2tpZjdSTXhwcEhNMU9iVE5uVVVPNUJY?=
 =?utf-8?B?M3AyLzJWamVzcCtzblFGZGhpTzVPS2JOb1lHeksrVHdNSGp2Q0ZCTHRLSXpN?=
 =?utf-8?B?SDdzVGxPNm8vSmY1UzFyQTFXYkc3UmFKeGZOeVkrQU14aDV6aElQVWovVnJH?=
 =?utf-8?B?K2dBUHdxQm0rSlRWL1VQeXFURjdaKzN4U3NuTHdNQ0dZUERCRjg3dHY1VUtB?=
 =?utf-8?B?eWVvbE5MN1lZeEdqb3Z6bXFKYTBWM0ZIYkhTTGx4L1F4RndTdTJpa0paRzJp?=
 =?utf-8?B?RTFmRlRPSFpUbVk5UjNqaGhQUDEwaDg1Q3BOd3JlQzN2TUUxYTJlemk0aVFl?=
 =?utf-8?B?NFR4cHI3cXNZZWxEalR1b3IwUjhUa2RMQjNZamRlRER1OTVXb1AzMXl4ZGVI?=
 =?utf-8?B?aWk2Zld2eFBRWDRFSTliVEpidFJmemRaVW9mZTRkd1hJUk44VVkxbS9KRUVC?=
 =?utf-8?B?YWVILzZWanBZS3lQeFd3TDBrRmJ6U0dBV0pOVlhSdFVLUks0VXUwQU9mbHdV?=
 =?utf-8?B?WkphdkVkMmpFQjV6cnI0enZuSkh1WVR4akNNVVY3TEt0alZZeU1KOHZhUTlU?=
 =?utf-8?B?VW9pYk9zdmtlUGhwSngrcU1Rbkt2RC91WURMVTlrQkhUSC9RTmUxazFULys5?=
 =?utf-8?B?aGJCVjdNSVlDMzdtbzR0L3hnVGtOMnEvZ1dvbjRDSkVsKzVhb01tdXlMajZ5?=
 =?utf-8?B?eG9MRTAwOW1WWG0reDBWa2Z5THR2WEFPcUc2ZTdRNGhzamhrOWtPZFF5Z3JJ?=
 =?utf-8?B?Ti9LWWlMNkFPbDJOSGJrakRXQ240YnVkOS9VR1JhbEVFK2RIbjE4bFMxMm56?=
 =?utf-8?B?QXJuOTZUbHV2c2swenc5aTc3QnBRbXJHUHdremZJYjJRRVB3Rm9YRnBDK2xy?=
 =?utf-8?B?cWV1amdHOSs5c2JDcWpBWTdEMjlOQStFamlHTTdUcE5TcWVIQlcxY09YaWFa?=
 =?utf-8?B?b0Z4MWV2bGlJM09mUWhYZ3BDMTNjdi9iSGNpVnBFUTRqZWlYRkFlUUNKOGs4?=
 =?utf-8?B?Rm9GWGxyc1dJNmlveEg3a1d3ZlJmdUpmTCtpMHVacGtRc25Ca3BXQmNRUXRU?=
 =?utf-8?B?ZXkwRW13ZDNtTWIrTkNNVVdZR2d6WGhqZng5TlFjQVZ4Z0JQekd3U3FGMzNr?=
 =?utf-8?B?c3gyTS9PWmtFQTNjZWVCa3hlS3dyOTNGOVAzclJTQ1J5TCs1UTUwQnBMSDlI?=
 =?utf-8?B?NUVEeDkzWFFnTGZpdzEzT2w5MW1oeU9FK1dPWFd3M0pNQkNJNGM1Q3pzTTJM?=
 =?utf-8?B?MVA0S2lRL3VZSURmV0FmdGxNbEhLNXpRMHJRdWhJbDlTRUtKak85OHZIM1d1?=
 =?utf-8?B?aEdZdjl6OGZnTUM5eTJjMVZjdncwaDlzOVFvLzFDT0sxcldqazU5MUlyckFF?=
 =?utf-8?B?MmtxU3dYNjFaRzFFRnBxTXZldHpqTTIyZCtrQUdlclFZV0g1K2Z2OURoT0pT?=
 =?utf-8?B?MThtdXBqVnYyaW5mNTJTaFBlWmtTSy9xb2lMc0VadHF3YlJPM1BSTXBuNXVn?=
 =?utf-8?B?ZXdGRUJCK1JJR0Y0Y0YvL2JWeEhLZjZLSTNGc2tYY2ZNbVltaHFhQU9kWUh3?=
 =?utf-8?B?TjlCSm40Y09OWHdHVjdObkF5UjFVWEZtbmlnUmZobmJnRHhKVGhsU3lHeHZ1?=
 =?utf-8?B?Sk8vakJPS0U5WFF4WFpZZWRtUWQ4bmpIak9tcWtKeXFiM3ZhTVJ2ZXFxOTVt?=
 =?utf-8?Q?L0Myn8cLcNGWggdT2RM7BV7IXk0KhDFGqUWBI?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 363c75db-a90c-4ba7-3c6b-08df19acadf8
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 19:55:55.5889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 859Ud3LGybYYkYxxd/r9ww/tEfLCxophilNGyn5IpL/RaDXkHKFSC2p5AKNrr9KBxV65W225vcrn1CkFB9l2MYLpCUFcY19Ma/5ZhJUV6jo+CV6p1P5ZMgy58gtCXP08
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7552
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_125601_517298_27AFC4F3 
X-CRM114-Status: UNSURE (   7.92  )
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

From: Frank Li <Frank.Li@nxp.com>


On Wed, 16 Sep 2026 10:40:21 +0200, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> gpio-line-names names the two Ivy digital inputs "DIG_1" and
> "DIG_2", while the official Ivy Carrier Board datasheet (Section 2.10,
> Table 12) names them DIGI_1 and DIGI_2, matching the
> k3-am62-verdin-ivy.dtsi variant for the same carrier board pins.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: freescale: imx8mm-verdin-ivy: fix DIGI_1/DIGI_2 gpio-line-names
      commit: 28cec01a2be2cf1e20aabd435f250f665ce24c8e
[2/2] arm64: dts: freescale: imx8mp-verdin-ivy: fix DIGI_1/DIGI_2 gpio-line-names
      commit: cb45264c27fad31f7c58fbb1a5c2f7ec16018dae

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

