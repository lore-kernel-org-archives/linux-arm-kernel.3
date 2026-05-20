Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5473BCD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 15:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PqsI03Dj40twsdPb8Hx+IiyQ52zLuGLPg8yl5w7W89Y=; b=gVrrSlT3zNoMN44EGc+8GWImck
	/bhE/PxRFNxUbuZ0oHxtHktesTQhMOJBmdW1XIoL1PLBSGR15ygo8qaRnl6HyImLmy4Bb668iNgM2
	zuGICK4v0iNO3N215ArkN/So0WXDutlQ6SmeZq4DotbIxWJtaYIKo6FWGVAvOqkj4q3RwxhP0m+yt
	suUcnHVk0Vy9JXzcxcUwi4cuIDn4TOO+6EfFdQffpxooKePObBTUby4MIMm0Or/PQh3CZ5oB5aYFU
	PXw0jDyc0AuxvttorSDyTdSGPHlGdhdF/shlEJFNVYNjDYQfGW7ZNQ9o+BhhUriPZTCmFSLkc3Pom
	i8RMQbkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPiZ2-00000004vze-0ggG;
	Wed, 20 May 2026 15:10:28 +0000
Received: from mail-norwayeastazon11013031.outbound.protection.outlook.com ([40.107.159.31] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPiYx-00000004vvM-1p2G
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 15:10:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OxRXuZ5rROn+ad/H/79eGnWFSslvQfHQIdy1Vg4OO2ObcKx9qYvHY6Ev+a0agEN8pr27sOLdF6Hgq9x0LyE/4jhQc0rR3nGlEpIeSHtQzZ4Pu7bzhcStjDd+se/Et9tFHv1zAAa0WWXCcCDBdoQfjy7iSutsdB4Onb163NQVMqkGdkIELuDtVCY54GIv6cXJREvPsni1cGi38t2gYCWFe5EYPjsjeIw4UMphdf7CskQmDRTL+CE8dgs+i6QhUyZ714wqbCqpcueiRmRafHEJTGxsylBJf54U1UTrS10+0ri9WqPNh58RpNjaZ6pdfpF3UrvCQeKIzLmm4TEkQhhniw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PqsI03Dj40twsdPb8Hx+IiyQ52zLuGLPg8yl5w7W89Y=;
 b=QlTsEGaYUVIorxKHS562Hy6/B8VWtXrrNLse41EE1SILmYeDO+Qz1XxLLD9AdBQvurs4ZYKOLi3MGMsRWJV6tnfTZ/Oc5PjNUk1AHwAYF8GmJimmYXR4RYKyuTqb60k7IdMQTl3VOOVD1cOGmb+ROtsdysK5rMGG216HZAmZ0trZBCPOgQ4z1ABO4lNaoenqGILVn/Lp1GNxgmzfpAy67hwLrUoq5zuBWXZ7r1wGMoHPSvX++WuDWK8nIx2VYgUMckSxSw0w4D7bLGOkMq2vUYw8Rs6ik2V3HC0/9SX5ZADaDGwJKkBvCFYPBAnH5XB41KrPR5Y+4tyx9kB6VSX4gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PqsI03Dj40twsdPb8Hx+IiyQ52zLuGLPg8yl5w7W89Y=;
 b=BGHjH2+2m+bi7qWX1zvxO2zNv3L+O0WTQGmH9JZQy5voEYCOfiG2IgoRs3cbr1HPcbBT3cG6bN5U3BG5wqIYO7kgfXKyigDWpTA4ZTIuBzVVtCldBAJwklHb1Nc30j89q0GOp+q/+4TlOzNfXnbbu8Y1Vwca8No/xTGeU8QYdnirEC4Xz/CebtxGrPb//UpQ3Dv1YamgEy/ZqVrLtu57731N1V/Q/2JtCKGbsZcpxKue+Fvg7tiDVo9D+EzE7op6uTf30tP3QRgXhnXT9ueUTTCHAEoQ39V1Gzw3V6EBwWYqlWWxzkWW7ioDtnOTqgAfi/FuGwvwvzSHF+Js7zkdKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::20)
 by AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 15:10:10 +0000
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85]) by AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85%6]) with mapi id 15.21.0048.013; Wed, 20 May 2026
 15:10:10 +0000
From: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
To: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	NXP S32 Linux <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>
Subject: [PATCH v2 0/1] add USB PHY node and USB OTG pinctrl support to S32G2/S32G3 SoCs
Date: Wed, 20 May 2026 17:10:06 +0200
Message-Id: <20260520151007.4193688-1-khristineandreea.barbulescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4PR10CA0012.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dc::15) To AM9PR04MB8179.eurprd04.prod.outlook.com
 (2603:10a6:20b:3b5::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8179:EE_|AM0PR04MB7044:EE_
X-MS-Office365-Filtering-Correlation-Id: 46acd623-28d1-4c5f-c1b1-08deb681e2b5
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|19092799006|366016|1800799024|11063799006|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: WfI6WpuCzjy7+UwK8IcU6xxBu/JlklhYeNgQU5JjoNQA2CPdmXSynxojMCm1is+7jOTRrPw2NuvPucsEZhjlEiqROpXh9GkW7sMQfjgYnnwmtaC7wstYtpjZJZoKCijTIJmw+AtxblenlMQUh8PmWsi5EMyi7XslHMHitjmW4yAlOjAkgiuZfysRUHncI6JasHS/VvTNl03MiAaKGGYofU3TZcISFnX8o8IxBtv2fneNvRBSk+wui4kPQR3gGazgZbFe5q1YyCXXkWdg/V9Spo8XFDECoiKQJ7UQr8/9DQSBozKxHEUJ20P8pMyhewQz/P2645vLmNnthVaI8SSQ4js1ki75vU5uGlthq6zycyIxcYuDCE3iUl4XmcLlnhEybvBOTzBRJSdckLEeHy5Rf7hh0rFDlr8mOZOR/L4bbmwz2yzfzRO9E4xtIcRsDnMr9GwpFgyTMPxIi/DYlh8+iD5x/TLidyp/XVZfhsjKCmpoaPeAgePGIDgotOB2uxnMjbluuq4DGXTsfP5fBFG2ok/CkVyhKs85ZdsVZARCdG1ehcFzp7JXtHF0W2ueeeZnbARu6jQumw872I4RtTmaenilTgRyu4CEPkUULNbBIJUFm/Q1tM4oNUY66QGe2ytxYbuIyRo5NAd14vmlxQMS1NYkXHKYfMomyeAnBPZjphGlr4lZmMYHjJDJjpjh5Jqx
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8179.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(366016)(1800799024)(11063799006)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?emJDUXRlMDFLcFR0bWE0blRJRDdVMitBV09hNTJ3RGZVbXRHMytOU3hxRnoz?=
 =?utf-8?B?bVhlUVBUV1BwNnVXVS83ZHp2R2FFTFlqdVFJWE5UekZIc05OdTZrS05weUhS?=
 =?utf-8?B?bGhpbVF1RDA4NVNJWStxTXBEOU5Ma09BamNRTTE2S2hiTWpvcWMzZzRzOU15?=
 =?utf-8?B?Q05YYXNUWERyL0orWk96SXhPeWpQVll5NE4zNWpRZ2NxRTlmQUpoLzdSY0pX?=
 =?utf-8?B?NUtUZ2l5cUJLMjZMdk5CR1ZBWWpWM2E0S2Z4U3ZmTnd6UGVvUmFiRTNDZVZS?=
 =?utf-8?B?eGNqL3l6WDBTM2ZXVTlwSVV5TTlNaU1kSGozdER6U1lMNnVRbHZIRng5NlRO?=
 =?utf-8?B?bmZZSG5rZmVnSUVaQWpzMGlHZUtFK2w1NUhod3VucjZZc3BkT01rcEtQSnZh?=
 =?utf-8?B?Q2FOS2U0RWkrd3Y0KzBjSUFnYVdZVEwwQjNLdm1nMUlPRHhDR1Y5Ty8ybXQy?=
 =?utf-8?B?eWVqT2xHV2JYd0szNDIxd3h4L09MVGU2a3VjM0hDTDZmdzVjM0gvdEFETUQ4?=
 =?utf-8?B?djZZTWo5RW1VVXUvMmdlYUNpZkIwL1M2ZVZQcUpsdEtMU1hzdEY4aU0wc0hZ?=
 =?utf-8?B?WnoraW1DbXR2THZhR04vN3MzMkIwald1dy9NSFdUVEJ6Y2ZCRE9oOVRWbDBh?=
 =?utf-8?B?UktEdzdROW9vWUVTTlNudExzbWlaSm9wQ25qVit1bFZ1UHJwVkRpYzVrelUy?=
 =?utf-8?B?RWN6S3lWWDVvN1VwMER2ejRiQmRBd0puLzh3eWRvOFA1MldBTWZKQ09Fa2tr?=
 =?utf-8?B?UzcyRXJNSkR2TjZrMkRFeEtCbWprbjMrOGdZRk1FZFRCbWpzMXJrSnVJOGFx?=
 =?utf-8?B?RFJsZEc5Z2pWb3JSRk1ONSsrb2xUU0JQeUE0ejNRZk5hdzBoRUJzYVUrZjNM?=
 =?utf-8?B?ZTB4aEU4TnFPSDREVS9mc2J5TDBMa2xqOWxBcU9jOE5jWWFYeVU0Mzk0ZEJn?=
 =?utf-8?B?R2ZDTjZ0WmVLUmthQ1ZWZHltRVlKMkh5bHRpQlE4bkdQOTFpN0ZSN3VEZmVP?=
 =?utf-8?B?M0hpS1NVYm1rMi9FeGV3NE9HV2FZNEdLN0l6NmhQL1Zka0pvWWpHckFicGM4?=
 =?utf-8?B?MTVtSUVMV21Rck5NT0doYUg0WE1HYjFjYnNLSHlyNXFQMzJkazBTQllnMFVH?=
 =?utf-8?B?RTc3eWVhVlRqOU1xUUczZVk2akVUSFhLOHI2MEZ2SEpuYmtqeXh0Z2paVTZk?=
 =?utf-8?B?VlpZSk9ldXdBRFhWNXgyK2tqSzlNQkNmN1N2c0c3QkUrLzgyQzk4cWJTTGVD?=
 =?utf-8?B?alNEa2JxVVNvT1hvd2V6YkoxQTJaeldDdEhEM1g0Nno4U2MxZmk0WDhkR1VV?=
 =?utf-8?B?dUErTklGKzNlWWh3eFlqdEVhd2pTS3dabHBoUTl0SVozQXdkcUdjMHZDTFJU?=
 =?utf-8?B?MlRsSVZGN1FoN2l0SThadUJPRFNaZStFU0RMN3NWNUo5M0dHUFpCZ0VNN0FN?=
 =?utf-8?B?L2pSMTFOeXZ6WWJJTWlCUTA2YWVSVmZWOWoxS3ZrU0ZlWDJsY1NJVDVxTm1l?=
 =?utf-8?B?bmxnOXlqcGRkVG5BOXB5NzBRSUZDT0lhZ3FtNFAvMWFXZEZiSDRIUDluV0Zp?=
 =?utf-8?B?QmtRSFFoeDI3M3pZaEJaMTdvd0NFdS8vVTEwRHl4NzN5OTRhc2trd3VuWkdQ?=
 =?utf-8?B?VUtnVUlUdVpaNFJiUGlCbkQwQ3BOc0Z5cFN3K3U2Sk14cEptTjhMUWErQ1Nr?=
 =?utf-8?B?bGFQQkkwU0dnU3JHN3B4bXcyRWl4UzlTdTlwUWh0Qi95UlI3eVFObUhBTlY2?=
 =?utf-8?B?NWk3RXRVZ1AzOWlqYkFFZzVqdk5HUjNoYUJjSHo1a3JTbGdKU3hrWGZ0aGsz?=
 =?utf-8?B?NjlpY0NKL3k4enpuT1FRQ3BkSEZOZWZHWENGMHlaZ0k5aGJydHFPbzZWUWpD?=
 =?utf-8?B?SVNFcnJid2IwbTdxWE14MFg5SEVqMHhXYjRod0g2aUpvbENZcDExS0cwS3FO?=
 =?utf-8?B?UlBCbjd1YzlpRFBXMlBITWlzM0VCWEZ0azRIbVVaMDhpV3IvemxMNVF4MEsx?=
 =?utf-8?B?a0syK0JwYUFvTUIvODJNSGwvR0M1MlRNZkNoRDRMeFRwcFFkN0hCMVRRcG9R?=
 =?utf-8?B?TmRvbzlMaklXOWwrVzYyUE83dWZaVHZEZDVhS2g5U2NZZWI4Q0VMVlBLTjQ0?=
 =?utf-8?B?Q296VkwwQXIxZGswcE5GU3FZK2tKOG9hVitnQkF0VG9YVk9lVXRRaGIxMGE4?=
 =?utf-8?B?WTIzblFjZHN3NTQ2VnZOOEh2OUhBTnR6ZkNxQTc5VVlEVWFRbDBvMEJjcklS?=
 =?utf-8?B?VGwrNWFwd3ZQS05RUCtPcEQycHYzVEZLZUFXcEMxTUVVZVZhOW90bU01VHhC?=
 =?utf-8?B?SnRDY2lSN0VZLzU3TTZKdk05WGZKUUo2WVJjYzMyV1J5ako1c25rS2tmTDBL?=
 =?utf-8?Q?+00X79kut6wwY/6XTLmpxGaLS/2X9sJTKRX4Z?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46acd623-28d1-4c5f-c1b1-08deb681e2b5
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8179.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 15:10:10.6840
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KQd9+2on8VVxoi3CFV06QPrhJ1wjfghcE4x8n0UAoXqOrp3Oyj1gYU/xIRe3zgwecvccSmWlyJpSf0FyfzFxCBGo3ZBQCyQQRNMmFZJf+R0y7FXKtGsbktwNCqEIjvBA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_081023_482862_143B31E3 
X-CRM114-Status: UNSURE (   9.55  )
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

This patchset aims to add two changes to the S32G2/S32G3 dtsi support:
- Add the usbphynop node for S32G SoC based boards
- Add the usbotg pinctrl support for S32G SoC based boards

v2 -> v1:
- use hyphenated naming for USB OTG pin groups
- replace deprecated 'fsl,usbphy' with 'phys'
- move 'usbphynop' node to the SoC-level dtsi

Khristine Andreea Barbulescu (1):
  arm64: dts: Add usbphynop and usbotg pinctrl for S32G platforms

 arch/arm64/boot/dts/freescale/s32g2.dtsi      |  7 ++-
 arch/arm64/boot/dts/freescale/s32g3.dtsi      |  7 ++-
 .../boot/dts/freescale/s32gxxxa-evb.dtsi      | 46 ++++++++++++++++++-
 .../boot/dts/freescale/s32gxxxa-rdb.dtsi      | 46 ++++++++++++++++++-
 4 files changed, 102 insertions(+), 4 deletions(-)

-- 
2.34.1


