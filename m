Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B55C624D4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 20:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9iPTGAoXuivgianabstfNaG7iW1nxZVTVCUWPkgqSjM=; b=EewX3hxBkAedETMN2UxGhwN2HG
	ywE4TQ6qXUskOqEusYZsqYHS8jx39MeTlymTxOvn1jFAXTVrczxyvVYjNzcvb/C2sIgqt86cnfYYy
	CC5oc+GZqviFtzCYrTVsOknk/6SMvkBzhekzayYcg9b6ZhNvBibtYYITC9GcOyae3M5ECnRZ8dE0Q
	RJ0z2JGINnp7+Z/jp7V1XoLKtLXuI/rr2Vb/x/oakgCkcSBqKSesmi9uzzmgLzFMUeVg25selHBwb
	WjkT72HSRVWyYgO4iLiiX1FvbU5pA9co+cn3N4OHCw5o70VIHopPgEooVJ0PCRRGAjJOX6rUX/N5z
	m/9qzqjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1rHd-0000000FppW-1TOm;
	Wed, 02 Sep 2026 20:10:09 +0000
Received: from mail-northeuropeazon11011035.outbound.protection.outlook.com ([52.101.65.35] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1rHa-0000000FppD-25Gp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 20:10:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JsGq5fE4Ics82IzmQLYNZfU4MTQMuqhNut+NVEU3NwF0qU7ctiV85DV6w8hYR1wIxEFVEROAi2HvNA7300NGRKfRQf0ItizBNbDtOSd466rWokHY+/UHgZ7x9mpkdXxFbwF6MCHOLzdF4h+S7j/FX+7t8tdhhbIJcic0e2M8VeXZcRSKO/BnNTp6MrSoeMrqfXMRTBZ64BOWJ94YyVOjZGz9Eut7iUF8qyXIo6twjnq22JWDjDoQXfkhaeY3lLyHIpk6J23VlhPem52eeBwv2fn1Uuc6RQEd+QK2Cj4oPPe79KgLbZHhJ04Xexol+dv7uXd3UUut3naPsRUMLhrDtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9iPTGAoXuivgianabstfNaG7iW1nxZVTVCUWPkgqSjM=;
 b=TchG56rVGD77F3j9Gloxr6Su6J5sQ5/wOHZnkWYt9ywxxMrS0G8+pe8X40xLxqeZAmEgJxge/UmvBjjUEUOcaqNlUzuPwMNPKMMZJ0WBGMe+JN3UWPyPQZrP8fz4J6L3ORu5kWHzDL5shSvu/2j5WzVQOr6GqsjC5iIvHbUCdzwlFtvS00FrrnbTBv1t2wA6vPWoYqckXoxAZYtX/Ddv5wwx1kB/kjPbUUQyobn1EFoSkcdRINowqP0K66VMaoN8m4xHpeEQXr27MJEJUh5u9hMTTU+BK10FtbGom+oRXDIix1Ns83zcTNSkSxStP3eCNL5OYcppSuPpFJQzheqRKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9iPTGAoXuivgianabstfNaG7iW1nxZVTVCUWPkgqSjM=;
 b=PLeKABuw/zeT8RVoTUyC0KVqcehI9u+OfNhLGhIcyOGyqQD1HqT5lvqDNZ/ei3yXCMNXOBkSWHihOZKaTlPcRv5aSrTR4tY+IWcbHya+PeNCMQct2rjORoRSVqhHG99TrIhPfEhzczgbYo1LYsq00x/hEJ8r/bUmMxfzmXBeFudj1oujOYZ0gAfs72JvEafm8+xmvsVpiUw1Vuon7/N7BQO5SXcCDOy3yv3FTprJoJUhskX+Vat/MBu6n2dGsklafQ+liEfvq4kvqFXzZbaxODxomUSq6ebs43HobX33R8RycIqK/yUAROBJTAen0OYME7v1GoSocZRnch4CkPuzSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS1PR04MB9384.eurprd04.prod.outlook.com (2603:10a6:20b:4d8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Wed, 2 Sep
 2026 20:10:01 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 20:10:01 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Frank Li <Frank.Li@nxp.com>
Subject: Re: (subset) [PATCH 1/2] ARM: dts: nxp: Correct white-space style
Date: Wed,  2 Sep 2026 16:09:49 -0400
Message-ID: <178837970335.2138489.4263701281047836124.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260801210420.383984-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260801210420.383984-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8P221CA0061.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:349::17) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS1PR04MB9384:EE_
X-MS-Office365-Filtering-Correlation-Id: ad70c76b-c546-49f3-a934-08df092e2b40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|366016|19092799006|376014|7416014|921020|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: pX390BRxxjHiCsemAkfHLtcrAP2ixWFG0jmWoVTkpJq+iyn/cisUSLK2pqjITr/pCjL/5ae5v+S/Q8gY3U8tIRXNxbKmxjklfD9RpHudEWES9JWpa+IDsoSRzYvPN/JaHwm8Xy2V2y7wDCYkoqxuFqCBznJEWiaWONmWqDxKdYNEEhdROr8OxrEMt7j8ISDkJWL/fdv/5jvMdhgZAhD11rO7b3bX6ypgtUfyfEZcsflOZ0coNQOXIlkEM/B9wyjEGLDQ04GmVuyekf/Un78VbNk/z9Awj74MZaD59eKyYJ+hi/cEG7orMim+FVAoECPMrGkXwJ8jQ7stK5VZS86MdeAxbRTWtSmymeSPJAOzjovvBrPBG+/S01w8iVKzfrCzNPvTWzdFsYguoEYspzUoQlkdr7MlrYCyWxw2WsfoEBZF5qkZs+RO7u2X13qXFHJ9hdHgw3PDacqjdBYQh1ITbUJwBRVo7m7CLCbHKzsoiDrDLt3kB/lr988UjT0jf8vvFeO95vDIlLm4PF3Aw9Di9HvwCm3Yuu9WgGvEkp5dmll7eMpYOA5zVIQd+T9EQic8jQZYp+5yQN/CaypjqC0mAPlfRk0V25/YBwyqfNM1YNvZaMz6Dy7mjcuD3WdXRqMMtvpTEQNMwXAHtuSnkMa+LmyMIvYY/PfTwduW1OCXL0VHwrOa8vp5FWjdwcj0Z8/vTQ45TMt+wEGPMF/9CmGKSQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(19092799006)(376014)(7416014)(921020)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3NsK1AwQXY2MlNXemF3amEwNHdXZkR6WElKSTkzZXZnRFVFR2ROTVAwVlpx?=
 =?utf-8?B?MVdjQlk2ZVQ0eTZKT1ZEcHVlTUprSDl6TGp6WENEOEhDQUNWTkYxcHNzdXBD?=
 =?utf-8?B?enNsQ1pOYUtOdytocHVuTG4zeXk0Z3Jtb0ljby9wWUdGVXk4dHRaS3ZoNG1j?=
 =?utf-8?B?c01pL0cwdUhpODkxcXpuazI1M01zTm1FOHl4dXAwZHZiMXIvd1NYUk8xeSs4?=
 =?utf-8?B?bVVKZ1Y0N3ZOSlBTN2VZeWlkUkFUcG12Q0lVVUpyU1A0UXM2bWhBeDdqQTYv?=
 =?utf-8?B?MWI3TEhvdDUrdGhaMFZxeC9SNHBCVEhmbHZHQWxUM20vSlhhai9yVmVyTDVL?=
 =?utf-8?B?TnFEb04xSk1yb0E2RUZRMW9lZUJGTFJCSzJMVFFFenZVa09ac1VsSEFtTm9T?=
 =?utf-8?B?dFg4Q1NJRUdHSll2RWlkSzRrUm92d29Rbk13eVU5d2R2SnhXK3Rxdzc5cjBI?=
 =?utf-8?B?ZWFDd0RrZ1YrcTFWWmx6N1BwQi9xbEJCQ2xqY0hKVExablhDaGVVL3ZFR0xB?=
 =?utf-8?B?bFhndTlqRk9IUkhGVVc0blBPTzZxaEY0RmY2SzhrU3FjSDM2R3g0VzJNb1lO?=
 =?utf-8?B?S2x6T2ZyckRGdGU2Tk9FemlOTU42eld5MkZ0Y2EwL2xqSGRGY0R5OHZmUFRj?=
 =?utf-8?B?RHhBQjJCVWN2VGRta09MWnhNbUV3TEY2RkVUVjVrazdzbWxETmwrWFNIQnJp?=
 =?utf-8?B?SjBaQXJGNEExTjdxU3QvYzdyeCtNUzQ2clF2clB1cVAzK0Z0RFdPaCswVHJM?=
 =?utf-8?B?enUrMVREY3FEVkRFYkFiMDdnOGp2RHpFK3hLaE1JRlVZODUzb05wdUFxL2Y1?=
 =?utf-8?B?NjZvRkdibkE1ZUpmMXJaNGpibzZndjk5NVcxRW9mNmwvcUU0dE0xMjVtckhS?=
 =?utf-8?B?YlFGS3d6Zndxd0ROUmpTQy81WDNuWWN3YWtxZnYvUDY1MURiVzFYbXlKc3NJ?=
 =?utf-8?B?eHhlT1pBRjltOGQxRXhUc0VUOGZyVjNFRjBtWXVuU01NTjE0SitUSitBZWJj?=
 =?utf-8?B?R2dUN2JWNGtrd2puSzhRSmFXL2V6dTFMWlhFQ3dqZFlsdFJwRDhCRmlPL05F?=
 =?utf-8?B?aFdSSnQvS0V3ZHcyb3RyL3ZZV1BheDliSXJOd2tnSE1OTTg4N3ZzbVlaWk90?=
 =?utf-8?B?dVB3RE1INDF4VXltTi9hb20xNFFHdmFrZjhQY2hMemZ6R2IzS0NKdXRTaU5D?=
 =?utf-8?B?bGZxUmdTSU5HRlhYNXZSSEFwV0J2RFp1TDVHS2tzeHpaWlRMMTBub2g2QXdp?=
 =?utf-8?B?R1JpdGp5c05oK1RSbDAyQkhQQkRGOGxTV0dZei9NRG4vK3FuM1R3bHd5MFAw?=
 =?utf-8?B?UDhibUYrdmJKV2RQQjB2QzVLU2JVV3A2QktrY09MY2dUbnJwbUVuRGRVY2pl?=
 =?utf-8?B?ZkQyMzdYejF0dEt5d21VL0J2b1ppTEp1VXRzZ000anpQNEE5VXA4WUlmeTRa?=
 =?utf-8?B?MkxncXJmbXF1Qkl5Z3hvQWZUZ0h6b1IyUmZKdkxCWUk0R0V5RWlqQnBzSVlx?=
 =?utf-8?B?UmFoRWJaelZvZTcvb0FGckp6NElCVTZ3QnpsWnUzUmJmU2lqTVo0M3pmNmg4?=
 =?utf-8?B?MnFPL3NTTjVQT1Z1d0ZCMjNEMzloZWsyMi9IenFXa1JzNm9NNXZTaHMvMnpm?=
 =?utf-8?B?RDRpaTk1L1BaTXNDNXlycWV2RUErUm13RjdKQS8rYVk2RzV3Nm5VRjRhdHBL?=
 =?utf-8?B?eU1ZblBUMUFJN0tySU4wQVI1QVpUV25XdVBEeGRnaHpaa1Qvb1k5YjJrSFBJ?=
 =?utf-8?B?KzR2WGxBSUYvOEI0eEJlaXhtU1RvU1ZLVTN3eklyVHFmTWQ2cjUxb0JlMllW?=
 =?utf-8?B?TzIvcG5HZUdML05xVTBhbXEvcXhMNHFkdU1lR0o4NEJIamFUTFBSVVl0Zzdi?=
 =?utf-8?B?TkxXWkttUUl0REorQzBwSERZMWJGYjdUcVhQRmVndVpkTkJuTnJDL3BBcnEx?=
 =?utf-8?B?bWRTSTMyZFpvZnJWYndpZGYrSGVHYVdZWWs0ZHZ4ZUlHc0d6T2prZHovRmI2?=
 =?utf-8?B?cGJoUEEyLzk2SUhDbFl3T2M5QUMrRTNVZUdPY1J2dHhINnlPSW1xZzU4M1Uy?=
 =?utf-8?B?WXpQT0NubWREcWw1THh4VmVZamlaSFo5dUlTQmZVZFJ0alQyMDErWlpYU05P?=
 =?utf-8?B?SmRkcXk2cThFa0o2K1Z4TDNnSGZTeGdaZEJJeGJzL3JRNkU5dm1SaUNtQ0pt?=
 =?utf-8?B?bk1wOU8wVHN4bkJQa3pQTEdwS2ZHb2czOUs5ejYycThhU3RZc2FLY3daRURu?=
 =?utf-8?B?bENNWXA3RXJjRVNqc3o1NkY5UGNucTgzelFIb0o0aTcvNDhCeURHS3ZML0FM?=
 =?utf-8?B?TmJ6VllQS1ZEQWo4SDIyTVVLVXBsQzRHU2FVengrQ1pPdnZxZ0x0b3luUkM1?=
 =?utf-8?Q?G6+S5Cu6Y1FmPsd8R02orYG6H910by1JozCP+?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad70c76b-c546-49f3-a934-08df092e2b40
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 20:10:01.0882
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hxxet3wH2Qwx/cUIraKUWQgduFQpnMVpkrzLsbpjB6vTj8i2C/YwrO/Mv3kXkr2U2M+Rc8OjmE1eLdnWLQ6WzGIHl4mcZmq12ptKpzO8j5Osm7s6+RFcupXb600pF8XT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9384
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_131006_538050_266CDE33 
X-CRM114-Status: UNSURE (   8.10  )
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


On Sat, 01 Aug 2026 23:04:21 +0200, Krzysztof Kozlowski wrote:
> Correct a few white-space issues, like missing space before bracket '{'
> character or spurious space, which will be flagged by dt-check-style
> ("redundant-whitespace" warning).  No functional changes.

Applied, thanks!

[1/2] ARM: dts: nxp: Correct white-space style
      commit: 94f3c5be8d67d19cf9913c1f5ffbf79a41fdaa3f

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

