Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5719AC88E45
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 07:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AQU5UBgUv7SFA1886XmhUkA0KnQF8qKv8O7WMz2jq6M=; b=0NwiNF6ol0FJpZhq6Fk38V1kHJ
	13nHeju1OgWTm8uUHFj82vAwEhe+e0DImjCbPedNsYUssYIqjvrWZh39wsIuKweXSdh5zZ1XqSGyr
	oi5jxed75WP2J5cP3/y6qfNuyDHRsSSj9g4aYRNxpLvN5CtSO79Yo3HvsNbihBVC3eZJnHfntaRvi
	iAHa0deXw+fTSOko/RVjjmTrHo092nblPVFYcmP/+5rdC5HB67S21nXfQUe7eQ1Tw8+N+x58Ot+Ns
	AJa5em3ASXXHxSMfO0Ce42koNj8n1cnub16ZcU81OsynxdMEibwu2eql1TJ+6D0eSlRNpbWlGGwd8
	joKs+ugA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4vMV-0000000FzzJ-091j;
	Fri, 11 Sep 2026 07:07:51 +0000
Received: from mail-koreasouthazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c410::1] helo=PUWP216CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4vMS-0000000Fzyg-1FNk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 07:07:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iapv9DvXeyxTKjOFL3lydoryrm9RHIkikbuMOONnWB2LuQZuKGVAb0TDWwGlSfTjdsccrXfOpFTY2eBdVsDBXWvgn2xbGLpyqkkFTyHLpce8J7prIyRQBbeTgfceBBqlZEg6MnlGCQDbASZoAkpdWj4Rce8g+dcnBeJUb6XsT3Qk0Y3ONWAU8/+kQPOpCS2YV9FEWOxgLloccLs2ndkX4+36NK+UqoWZNwBJlE48O9/+xGcb6+jkFJ3s61q8zHH3c2ULixduLviBWXcUmMsgYJAzVd1OvkHYh5eH172uAP1Ji76hCQgf3FM0o8sVix2siSYAhIxAkIyVCAZErfHcTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AQU5UBgUv7SFA1886XmhUkA0KnQF8qKv8O7WMz2jq6M=;
 b=qSvNERxU1Stiwy8JpDNGtvvRrv1Z+4UMG5xKEmwdlsIDoO8XYC2MKHp+GrLyR3GwKuD0n6SfXg/AJ8zax8+Nt2Fbc7+Q6+v4rc7klrwMQ5obIVTD8UOd566VF2wTa+5Cy5wFAWZ43A0Dwx5enW3TdsQ73u9QhZhxH8OvR5BTwz6R5NQhSrrmSPPLBOYGTry3fywhDFZTCKU1wCZmI+JAYe80bTeViqluQsoZntEBecq5pgmGhPdStolLzeavSx6ngNNSD72gRpICWFyYsAS3H8MOX6QZCbkAvzcWfMe41X60G9hhHzxwyMwtvXJuaIPdzW21l/+UefkQcubuNwXNag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AQU5UBgUv7SFA1886XmhUkA0KnQF8qKv8O7WMz2jq6M=;
 b=O4W8muC/yOHm4r01cznIFdZNVl/tAYNhV/VTqRDJfKje4Rxlpx/uRc0lUrAAkDKSb9tj5UHYrH3NiXVt9LGNvkSYJwN8Arc+3JIrkBWurUGAc/KiVZKjL8gQ0plPdK/+KuvdS35C1CxB3XJWdT/yDqLoe/t7IFcq0VvRaavZ6E2ISK6ebAYrZ1gyAZsjt5HL3DltzGmNBaXJNkJdFJmFN8lo5alzYc67HnRFAmGDHwc6+xSBLCFIJRBEBbNoBvUmo9mHBIcanfXpcKaERfaKAO5Rai1lffVv/r9WJEkqdGzGDoBj9yRg4XDZjxpMy698wAUdLcLFroxWmAhk05nyJA==
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1b9::8)
 by PUVP216MB904769.KORP216.PROD.OUTLOOK.COM (2603:1096:301:170::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 07:07:18 +0000
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232]) by SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232%6]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 07:07:18 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: Frank Li <Frank.li@oss.nxp.com>
CC: "mchehab@kernel.org" <mchehab@kernel.org>, "hverkuil@xs4all.nl"
	<hverkuil@xs4all.nl>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-imx@nxp.com" <linux-imx@nxp.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "jackson.lee"
	<jackson.lee@chipsnmedia.com>, "lafley.kim" <lafley.kim@chipsnmedia.com>,
	"marek.vasut@mailbox.org" <marek.vasut@mailbox.org>, Ming Qian
	<ming.qian@oss.nxp.com>
Subject: RE: [PATCH v7 8/9] media: chips-media: wave6: Add Wave6 control
 driver
Thread-Topic: [PATCH v7 8/9] media: chips-media: wave6: Add Wave6 control
 driver
Thread-Index: AQHdPDkt0d+PFtcenEONvAYysovXwbbIV2sAgACnBFA=
Date: Fri, 11 Sep 2026 07:07:17 +0000
Message-ID: <SL2P216MB2441712602D0D16F2E1F202FFBBE2@SL2P216MB2441.KORP216.PROD.OUTLOOK.COM>
References: <cover.1788496816.git.nas.chung@chipsnmedia.com>
 <9a39dbcd48c8326394992cc048a635fb2472537e.1788496816.git.nas.chung@chipsnmedia.com>
 <aqMbTg0oDTrjs7Hl@lizhi-Precision-Tower-5810>
In-Reply-To: <aqMbTg0oDTrjs7Hl@lizhi-Precision-Tower-5810>
Accept-Language: en-US, ko-KR
Content-Language: ko-KR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2P216MB2441:EE_|PUVP216MB904769:EE_
x-ms-office365-filtering-correlation-id: c1fc292d-bd42-4d6a-47b9-08df0fd350e6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|7416014|22082099003|18002099003|38070700021|56012099006|10067099003|4143699003;
x-microsoft-antispam-message-info: 5Ocrzp5rwrDApbM8G7e5ouznzl53I9puB7oreSCXHu15QzQleAIm6dOWrmIAacPudRgJnMZow3i2YGSj8q87tTBsvUSaT7tuCfSgP8EPk80Iihz5LpS+TqkAmFcWEOBawVuivig+esj9l3pZDQ6yj1HtFeAzhB0xC4imWR8RXLpYjxlqm0U6zGehm0DCt1jmoZxqv9PpFd1dM9WQdU5fwy1EzSiinypWFqbzqORX5KOtWtKTt445Srf2Cuxa2tW96OKOn+q+3xcrvrI+G7FaZSuX4Qp+Bnlu0dfu7g4NOi4hSxw62af23JQ/YQc4rLOyHySY05/3tDtP83iBKJ1G0hvO89zP+cA/Pm0526B4uPKyV6Yyon8rzOX/Z8+FXUZTb1NfReA0b0M6GFwnoiKqzja8FtLh6gcfHvqXr+WQruf+aXtH2Nsn42Rs7bUlaxmT5dKLYDlXPGPZJhAJUA3FkU+CwHufnBtyQnb8kfmw2DFho84bmc1ImzGoZq9GpjFiNuBebmLr/VXeuA2BZRWFPPGuSPSo47JR3VN71kgc7bzDycg7DEpYXlEAbkvq/43V4JhDFhrKd8Bz6hfvyOMD2t7D3zUtAD/rMPy5bkE3WPnEwX9TCgiTs3G38geuC0s790tJp915aCzG2KolBcHPZ3KZ/eUR+AY/eMm3yjJEIA3gdPUa+t0qRDDg9B3DDjvu6q0XOXDQYQZs5jd/I0ds0QcdEuXoPZSO06pEp0of3pU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB2441.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(7416014)(22082099003)(18002099003)(38070700021)(56012099006)(10067099003)(4143699003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?TWiYBHjDDSbuNHn/J/5LmOXnex9Z1OA4fQhyEphcKZ/ZUpv6zmNlJz4Okvk8?=
 =?us-ascii?Q?LiWkQr2wcEnDi6ytd31an/fC5hA4LUEHSCdhRx5ChmU4TxTm9z1nBdZxnWCO?=
 =?us-ascii?Q?wRLA8fOkXXvIp+OkOMUsBP+wV9EFbtn0hyxbPCBeVwMCmh8I+jdMnybRBDZs?=
 =?us-ascii?Q?2YUK5qlvdDOn0KXmXXnCgmNRnKHx+VdSWz+9uUkg/PkIDT+amQb48+Xsq1f4?=
 =?us-ascii?Q?R8rBKlPnWxiIxlBkZZgAVV7dJkIFExBhk0hXD7A4sYZLeQgdUPCEks0Ww4Za?=
 =?us-ascii?Q?D/t9DxUNlJVH4u+VeFonBkKSFHa88e8siprXK7V+2wCvOKcLcNNmtUj4SGCq?=
 =?us-ascii?Q?9eIZTQbkiwWYpSjEDg9/yLxcEoX8Nl32c6BQAabewqjduq48ZkzVBu0UH92O?=
 =?us-ascii?Q?0gQ6CBXhBiVR0sHsKCqXDVADzVDdogw1LMpUosiJ6sn36M9eCQayns+cRiWb?=
 =?us-ascii?Q?5Z70ensG60R+ovw+Mh1yrrFLvdt7MDlQBPXk0uiXcgxuW9yw7Mo40jSBNoDB?=
 =?us-ascii?Q?JXIvGXu0GTVr0KUZ8qBsaWbmG998axswsAqXE9sLVA8xLJkzejUYnUJadxj1?=
 =?us-ascii?Q?WhZwPFbx0kZJ/U1eX2iAXqY9j2yQNhLMzNkZuzL/ObJTX35NVd2QM9IC6ZQi?=
 =?us-ascii?Q?aQURTcq6pXQsdRdsx4Lg5eLe+mOIj9YT5ACo/GhMnIlY8YLCu5PL6IRMWp3/?=
 =?us-ascii?Q?M7bsbAhNSciU1qXYiwGqh7nOG2yCcIxfIWstatyyOmQnWA58jBqvVwOeqmLx?=
 =?us-ascii?Q?uRi3bFLv+s8VsF67AEuP1C5kgz4Z3UuFAuE74w71QauTV3EYFUpNZ6+c2neO?=
 =?us-ascii?Q?mXr8I7uG/Cvt/xM/vQ2+JFdPXeBAWMGLMsVFJV9NWsItXrXzbgG836tgtJDN?=
 =?us-ascii?Q?FudLQD6AFMPbYplIBML1Av7mlkZPSsyprbD5aqxVvdyct2WXHfnNCHE233aj?=
 =?us-ascii?Q?I6mwlwcLMpBfDCbXuKBXzIce1Sm+E1HYWZKahuSqdpMmybSEq9WKHAyyBeXG?=
 =?us-ascii?Q?gHzDbzP/hhSDGUXXX4S30B8sQUWzZhzj9vaMQrM1hMBSHPfFk/jT1FJe0nQ1?=
 =?us-ascii?Q?LBGCcWuYl2MnpsP0M/GsLwvipmj2esPaiD//Ffhge8iaPHnLyC0plEq+e8xp?=
 =?us-ascii?Q?yDm9LRhkPmc7p8bFSPv4TtWNvEz2PoCymlQm7MlZ0xl5yY0bnNArgmvcZoEH?=
 =?us-ascii?Q?Cz0a8frcfaShnO6qg//CtQTTaP7yZYM6BTL16wPk16buDCpwh/z+Wv28j24W?=
 =?us-ascii?Q?gmrj1se0YA5vJ8YW15SWsgoEJA7e1aDh2Pf8WzGJ8QzMcNDu6NnoZSTXNWUK?=
 =?us-ascii?Q?HAfAyEmgfIWqmJSHvh2cjfZMHTHkNmzN/jRcujMB8mXDBvCyBAIOKvp3lG74?=
 =?us-ascii?Q?vOVSsIVb2KRJGJ37KT6rQdP7Htmi4WMV/rPHewUWZCzIyb0DPUSfifR3vJyc?=
 =?us-ascii?Q?wg9D9vqSCBDFDI69MivBSbkt/1O4JBhmh4ELyQqVHPDSa2+cU/TCDM8zEnfS?=
 =?us-ascii?Q?wkIm0MnZNiN1KHAeEdzH/Iwu7FWQiRJtYVeTTIW6cG/vq31ixClMhR2HwuW0?=
 =?us-ascii?Q?G4451ysnYraKzGmoLplH9TusI66rskNxaZghfWVVou2k5Hv6IeB00axI60UA?=
 =?us-ascii?Q?uWZehRkrPSHVpfx58vDcy+4rn5hs20ws8gk4XuPq1qIOGS8PBWCnR60ECMlY?=
 =?us-ascii?Q?CgsnjM7xXyazbkuGS6jhe4DV0IRoed2WWsbKDSXavRsFkb9Qo6YeCltz0CFl?=
 =?us-ascii?Q?f4C+gPdAaw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c1fc292d-bd42-4d6a-47b9-08df0fd350e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2026 07:07:17.9528
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3NtBZAllAd71XwdLcQWOYDVy6s2pG6OkNQfB5t/+CHBFGChrWT2zJ/zEWY6d9DYX6xDhJEge4K/Eq3MnDQ5vo0drJDwFF4J6SZrhFRwNmMU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUVP216MB904769
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_000748_342438_CF890CC8 
X-CRM114-Status: GOOD (  10.54  )
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

Hi, Frank.

>-----Original Message-----
>From: Frank Li <Frank.li@oss.nxp.com>
>Sent: Friday, September 11, 2026 6:04 AM
>To: Nas Chung <nas.chung@chipsnmedia.com>
>Cc: mchehab@kernel.org; hverkuil@xs4all.nl; robh@kernel.org;
>krzk+dt@kernel.org; conor+dt@kernel.org; shawnguo@kernel.org;
>s.hauer@pengutronix.de; linux-media@vger.kernel.org;
>devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-imx@nxp.co=
m;
>linux-arm-kernel@lists.infradead.org; jackson.lee
><jackson.lee@chipsnmedia.com>; lafley.kim <lafley.kim@chipsnmedia.com>;
>marek.vasut@mailbox.org; Ming Qian <ming.qian@oss.nxp.com>
>Subject: Re: [PATCH v7 8/9] media: chips-media: wave6: Add Wave6 control
>driver
>
>On Fri, Sep 04, 2026 at 03:46:34PM +0900, Nas Chung wrote:
>> Add the control driver for the Chips&Media Wave6 video codec IP.
>>
>> The hardware contains one control register region and four interface
>> register regions for a shared video processing engine.
>>
>> This driver handles the control region and manages shared resources such
>> as firmware loading, firmware memory allocation, and coordination
>required
>> by the interface register regions.
>>
>> It also instantiates and coordinates with the `wave6-core` child devices
>> for firmware and power state management.
>>
>> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
>> Tested-by: Ming Qian <ming.qian@oss.nxp.com>
>> Tested-by: Marek Vasut <marek.vasut@mailbox.org>
>> ---
>
>Look likes this driver is independent on other one, as parent devices,
>which
>register children devices only.
>
>You can move this patch just after binding.

I got it. I'll move this patch after binding in v8.

Thanks.
Nas.

>
>Frank
>

