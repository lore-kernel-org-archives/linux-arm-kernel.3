Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C979F33833
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 10:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DYUWqEpPdEgmyRxkbw3Bzibp4/7XzhBx8D/axYJ4gc4=; b=YLwynWh2FrkckU9Okaf7aQKjnj
	4TdfAbNX/FUdG2yau1vE20cfcCRp6NdNW2yBKh0cX5abe22+2kk/2y2bfaLkFoA7207ls4jwejtEI
	6i75wO9Qx+yuWyj3+/Hh9mRgHDLZIit4ocMhyucMDnpYyfMbVuukI0bT0qVnh/f/kUFPBbJj4TJ8e
	6ef+3ADEEdOY4pcWTKITW/9H9B9aAFs4NUyLz8JPhHa+H1FNfRA6o+1qeLarXmLlV8/ORBCmMZnFL
	e0ih4XXci/WjmdajNeJdC/odV+Sjl4lg1Bt2sEqUHB8dOiW8SJz1byapZFSMWBZmHwY15QIMjvAZr
	DfsIqkIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2RE1-00000005wPd-2Kk4;
	Tue, 17 Mar 2026 10:00:33 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2RDy-00000005wOu-3VOO;
	Tue, 17 Mar 2026 10:00:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e50BUZXp2zUT7j/hCXNDTuBb0ITP9iPtq5NZPa63pgHSouTc1H8BBQYeEfy9xaHZNSsl68OIBExozaaiLN8dRur6zVHA4CspFuyAxW2tn2CDLTGt6CwydBF7qnKTanrEN4z5Qw9QnTmV4K7lu3idQ+o20Gp5zbI+Xnojl0pu/daibVI1UNn5to5DOeM6eIiVfCiTRbzjsRspiYmQAW5T8bF6x7KDAEEDeod5esIiYwVJ4KzCbHTD/N/A5yS/t7y77pf9jeBvSjpEnctXa+7KtjMdks6LK5XxjhX8pflkb3G/jtMWUcWRQYtdsUqUCHfVaNsq0gw3fTJ4KZH8lmBFFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DYUWqEpPdEgmyRxkbw3Bzibp4/7XzhBx8D/axYJ4gc4=;
 b=VF64eN2j4WTPUAbqzQyCwe0u+a/lsZHoQRAuLoV8l5kqxiWv0LFRKfGd2O/t8/1F7Gfas7Jq9SPNOMhr1vbpzbamN8Wj1OCBcxfzkUM7thO0fzi6/j/43jWe9QNf3CeE5rF0Jyme/VfnRgmUXsO/Y6k1dXgZZQTENDO9OT1mVgu7+V3N5TYSFLtnX+0DPMFIWG2qDoape6z7i8ILJL5KmonjG/1Tix0vuTqc7X21xm6BmOuFjy5+7CQ/bLgIwR3Vl2RX2WSCToMypJfVdkgE5AjYIEDZ1UU5PFGMoiWUgQCeHcsnolkQRJQL5qOvTsp8sioc7n6EOhK8G/Q5unjdIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wesion.com; dmarc=pass action=none header.from=wesion.com;
 dkim=pass header.d=wesion.com; arc=none
Received: from JH0PR03MB8617.apcprd03.prod.outlook.com (2603:1096:990:91::14)
 by TYZPR03MB6894.apcprd03.prod.outlook.com (2603:1096:400:287::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Tue, 17 Mar
 2026 10:00:25 +0000
Received: from JH0PR03MB8617.apcprd03.prod.outlook.com
 ([fe80::28d:6503:f51c:11b7]) by JH0PR03MB8617.apcprd03.prod.outlook.com
 ([fe80::28d:6503:f51c:11b7%4]) with mapi id 15.20.9700.022; Tue, 17 Mar 2026
 10:00:25 +0000
From: Gray Huang <gray.huang@wesion.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "heiko@sntech.de" <heiko@sntech.de>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "linux-rockchip@lists.infradead.org"
	<linux-rockchip@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "naoki@radxa.com" <naoki@radxa.com>,
	"jonas@kwiboo.se" <jonas@kwiboo.se>, "chaoyi.chen@rock-chips.com"
	<chaoyi.chen@rock-chips.com>, "i@chainsx.cn" <i@chainsx.cn>,
	"michael.opdenacker@rootcommit.com" <michael.opdenacker@rootcommit.com>,
	"inindev@gmail.com" <inindev@gmail.com>, "quentin.schulz@cherry.de"
	<quentin.schulz@cherry.de>, "andrew@lunn.ch" <andrew@lunn.ch>,
	"alchark@gmail.com" <alchark@gmail.com>, "pbrobinson@gmail.com"
	<pbrobinson@gmail.com>, Nick Xie <nick@khadas.com>
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: Add Khadas Edge 2L board
Thread-Topic: [PATCH 2/2] arm64: dts: rockchip: Add Khadas Edge 2L board
Thread-Index: AQHctcL3bHI9aQDC1UW6iuORj+0GaLWyXBYAgAAguTk=
Date: Tue, 17 Mar 2026 10:00:25 +0000
Message-ID: <JH0PR03MB86177CE00005EB79A2B620E2EA41A@JH0PR03MB8617.apcprd03.prod.outlook.com>
References: <20260317040248.267154-1-gray.huang@wesion.com>
 <20260317040248.267154-3-gray.huang@wesion.com>
 <20260317-discreet-swan-of-bloom-cecb3a@quoll>
In-Reply-To: <20260317-discreet-swan-of-bloom-cecb3a@quoll>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wesion.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: JH0PR03MB8617:EE_|TYZPR03MB6894:EE_
x-ms-office365-filtering-correlation-id: c07c9537-e9b6-4f47-1974-08de840c02ee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info: dciJnW6Lr/PJVpQth4Zixmt1nnQRGCCwQtpXMkBOmHjfleOvZPC3z0HCD54mCqVSagV0EyBzWTT021H9LKDR4i4gFS3A6P3bgSciaJdcGjXZpdKcgbe2aD7gxiRLpjweHpFywQNmhuCnxTSjF6W1ZztdPXFjjk6SM6AwUrRHGMSOhEXZzMRzDhTAh+EfRfDtSFQsOG1sWYEId1WFQvxxdJe5EJ5xU1Lv9xzAw/E083r8m0R4cN134ZG4kEe3V4kKCrgyVA0iBci6+CBsLNa0BvoM5YZK8apfWPfUKj9RigBVZGZx9j9h5evXojHmAgEKM9MIroPdb9G65JVUJlyJ6MB86F3OBli/BJ7ffBUK/U6mOnsef+1HnWcYOFungeKuYPm1FtN9wEMgXpyHHSl8tJl/WDCm4MhJTI+nPbiZZiYLWcRuO9iXuL/CwKyfTsZ4CuCbr+g8iJyIGf2KieV1eYwZ9URvCy8LQaRX85PtBwulmMqroko4Mpnsb9pkVyCFDU3Ub0LgswF9gB1iVda7ImoNhQn/IDZIATn0Omc9kOXSuW4kkdpi3cS/4ttZmm6P8lz0R2XoMaFcWEYWlvfpE+ZolxpE24+ETu7Cb30KfVRUHR7vXfzIeutxSNjy0097WuFFfAfAeU0ZtZEhSZ2qauwX5q74X7Wghj2pitPBiANzXriJ9z6W9LKgZq6A/BbctFb0gt7h4jIV3NH3mjYsCysMCsUT3SQEZP5ZzY26hFdcov8gcNUcX3IfQQRiB78p
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:JH0PR03MB8617.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?2e8FF69iMyRr2JTc/zlp0CZ05nNw2GchC99GsBNnVtQfzjB99ot6IwZ3bs?=
 =?iso-8859-1?Q?gPQLSDmu+yj271qgHDQhI0aX0PHgyJ52NPQqnjWlMybNu2L7Rszu6dV0vp?=
 =?iso-8859-1?Q?FY6IHN1xWt3ikCIg//6BAcDUissSWeAyhVIG6CUuTjpjverxKJ7x0Q7SvN?=
 =?iso-8859-1?Q?/uxJRad/19WEpFY7/+Yn1g1KJ0zxypSZOT3YTrKe8hscEhv34RMJ677NkK?=
 =?iso-8859-1?Q?PVvbaJNCHn/ipGcQ3rf8DCsnd7M/e8qWyTi3WDugDVsCZUYKPJJaxT5gxL?=
 =?iso-8859-1?Q?pshZNHDkmlau8QLIwlk3ovqLOAVQ+INxaEGdGCpIUXoCQSn0427UC6URv7?=
 =?iso-8859-1?Q?79oYJStUetgdjOZK3FUUgmPnnvi8SlSLr9iPtZGHM+4hRwlsABJQ2TJt6X?=
 =?iso-8859-1?Q?tfLTCO6ylpe7U/HNRzgyrARgOGo8wn3lFERzprx8dGJJivgVg3g5jhdCo8?=
 =?iso-8859-1?Q?Kj3Ppmilyx7KyoYhpQZix/uoVj2BuB+JaLSrirXLcDI9E582+0sgoPSk3S?=
 =?iso-8859-1?Q?ZoN/cIMOuLOEREVFZGDgpvI0gYczORLqUlCyO1RLfR3FtjfFJ7KuNdIhj+?=
 =?iso-8859-1?Q?M67um78EJI7ZWfHdyHuLZ74efqECNhXe2jaGdSUt1EtUvKkwkOauQNHX8Z?=
 =?iso-8859-1?Q?Bdx2sq5jiGTKQhoiBFyWGWRV3niH4aUv0WnEAr/DHqaHJ97nmqtU/rN9CG?=
 =?iso-8859-1?Q?CuUsiEEgNGACZV7czNhtykgoRH0GG4SxMojhv1Bda8ajXc/KDqbPo50STb?=
 =?iso-8859-1?Q?pGCkXgisCFtqlKC5BNgiQDwu7ahICYuR5lWW5O26QQ//D9HF01KsdYHFwJ?=
 =?iso-8859-1?Q?a2MJSE/OmBvnLYYeRvv37GTYOnDSgimnO5x7/K/zWk47mYkeR6ROnDP/tt?=
 =?iso-8859-1?Q?D1W/SQOsXjHU1aUFvX9zoU3tA1en5CiYMkVTeDaq90kQynE4KIlI38Xs8G?=
 =?iso-8859-1?Q?drhYY3SAprNX+/UZOmUfhZlnUzGyz4ZY2HAq4UOddUGgWicbrmFi6L2MvG?=
 =?iso-8859-1?Q?1KNio+nHyW3URxq/pqHbQULqR6BDeXLl/SWlqmGm6NedSP0El8SzC2CCXp?=
 =?iso-8859-1?Q?FmgxoLWM8pGLJ43Rz7fMh8bkoCIGckeV5kA82nvhlN1SKAv5q+60fTqEWF?=
 =?iso-8859-1?Q?7TMFbj59C0zpAqhzvbXYoBWhGxUKuPGGPfxEjnrTGkzZph4OfDwVBk7DKe?=
 =?iso-8859-1?Q?y+f2zF6ydf5FI/UdT1/yCfQmdjq/K5UVMHETCh5KHqTFhnUYcOO0icU6tC?=
 =?iso-8859-1?Q?R4neiHQMXvgTqyTVhu0qDsl48tMRionxMiO0lGnXtPO5jZ1m3c33Gh6wXl?=
 =?iso-8859-1?Q?SffmVyuoCfgs4HPtzqct1t1MVDAFNGxM/XkkAC7zZjnVJR4UaPUQn/o4Fo?=
 =?iso-8859-1?Q?Z6fZnGr7+Q/ezgcQSbmeJVO2Sri5hVRHdlPIp/IIcv2QTxHleY2vGHRG4T?=
 =?iso-8859-1?Q?fpnGTQJhnjG0ICdz/mywXL+DCGwsMVp6im4nEfN0HlPPt20DqPLhdAgVNx?=
 =?iso-8859-1?Q?n8DVHqotynakuOUueRE6SBOdwKpSe6s1U0xFodsQdtSM/CclVy+6XbmJDb?=
 =?iso-8859-1?Q?gt7VJeCJ6Rjd+VJSFMVxvrAsvZ9Q1OXen3skwcLhajNdlK/XcZetKju9Dg?=
 =?iso-8859-1?Q?pIaCVOPw8KTP+rYXMXWvN4lQCZqtYhIndhT3wUk2EL7Pc+WjSF7Px+XBm8?=
 =?iso-8859-1?Q?h801tf4gbyipySae+V7nk9HsFNoK5WarXP7tW57jn1hFGXpylmQxByJ6LU?=
 =?iso-8859-1?Q?YcafAw9tEZ1E+p0Vc+MO6AqRUHd5BZnT94h4bc00k1Bv2Y?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wesion.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: JH0PR03MB8617.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c07c9537-e9b6-4f47-1974-08de840c02ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2026 10:00:25.6790
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2dc3bd76-7ac2-4780-a5b7-6c6cc6b5af9b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WzlgF3l5RbcRpz5Ol+RVCpbtq3w13HWKziFUoDdLHPXfYA3zxyRAK7eKy0bd/v7R9F4rbuw6jzOoPL0wlTKYIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB6894
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_030030_874306_5CC3E402 
X-CRM114-Status: UNSURE (   6.85  )
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

>On Tue, Mar 17, 2026 at 12:02:48PM +0800, Gray Huang wrote:=0A=
>> Edge 2L is an ultraslim, credit-card sized ARM PC designed by Khadas.=0A=
>>=0A=
>> In this patch, we will add basic device tree support for this board,=0A=
>=0A=
>Please do not use "This commit/patch/change", but imperative mood. See=0A=
>longer explanation here:=0A=
>https://elixir.bootlin.com/linux/v6.16/source/Documentation/process/submit=
ting-patches.rst#L94=0A=
=0A=
Thanks for the review and the pointer. =0A=
I have rewritten the commit message using the imperative mood in the v2 pat=
ch series.=0A=
=0A=
Best regards,=0A=
Gray=0A=
=0A=
>=0A=
>> Only eMMC, UART are enabled, so it's capable of booting into=0A=
>> a basic Linux system from eMMC via serial console.=0A=
>=0A=
>Best regards,=0A=
>Krzysztof=0A=
=0A=

