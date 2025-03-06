Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52EBFC28B23
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 05:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ktz1ryJHMSOtC8+FytdKWYJqxYRB6mIYw4WsKHZyP1A=; b=XiFbtR1sM/v8/dZc/6aH2pdfug
	r26bVmQ8iQPbUQLon6msqjdUL4wWv+r95zBzkx1gnE/8FPVUPYdHxLAH4CfxtpUR9OWXu8GfyB6p2
	w+QwiT1IKUi8f839XjjAxE58J8t9slvwYAPoTsd+PmcqBiwr2Xngx4+jtmvND8Pk7msM/f79Oaouj
	xVMU50qcqDbSpu6NXPLQ9NVwUwlqBALwdA5xgzLRYO/WPYIUoR+AojaUKzDfHO4qlE5MYfPT0ywLC
	P+VisgiV39Kqk+IzRVlhjHb6LfUm9IuBUcokKOUTSv3nNnWHv/jcmsObG5CkKOEzS4rhRbHDYXJ2Z
	jp+auARQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq45G-0000000A4DN-0xXe;
	Thu, 06 Mar 2025 05:47:50 +0000
Received: from mail-am7eur03on2061f.outbound.protection.outlook.com ([2a01:111:f403:260e::61f] helo=EUR03-AM7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq43e-0000000A46o-35Fm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 05:46:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P6vz8KKg4enM5Q/3jU4v/mXPBcNDXWqrhwByb0cLdMyR9YtE46KFFIwit9vZapKrSUHR7dRdLGTR+WQEQSbiu2ZTQxHLMc0gu2GKK2n0Z91YuKmRsGCSXHIBo0plEat+K+UNa35MkTaRdDWnwQxYS9NYt6rrum8zkSN09ItF4IcITGpbIM85uu6RSE0BHCel+INuZ970MSUkT0AQoTCR2r4GULcuOk3HrMKi0rOHfGCOeBHMGwZN/M6t10NKBHzDzNQ+6SIvAFez2NILIiEhDk8KLSG+v0xH+LhoNsOaXeI4Y/Pv4eCGf7QE6ocv5q6eDrZCG7K3FC5LdjsmPQW6Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ktz1ryJHMSOtC8+FytdKWYJqxYRB6mIYw4WsKHZyP1A=;
 b=cz6NJnSdqlnAAZH6zgDX3O4ENsRTk4/E0eT5unW/e4bBrO7EbACGAE5dI/0KVyXEoWmDCDdkmNBYYiN8IKKxx2X+cq63JA5bn4Z0Mo/GftvKybz4E2Hq1k2BpsYMqJJQpkSJ0g3Xzq670hDQFwXNdXCWFv0C7SvOnZEVnKl+LSDtAg7MFlAo7bAkhmBHqQs7bLDc46AqDQNEGNWFX8A35/xWiTLFMoT0r5eFcHSNGOwsp9wfBUVXECKSLwXOWznT8JAoyTxW+6QdF6y/TfZajPjPNDF54ye4thA7Q2enpsnQuGxte0c+u7BRAmUJDmcHua5ifEWQg4DOjQC2OcHQfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ktz1ryJHMSOtC8+FytdKWYJqxYRB6mIYw4WsKHZyP1A=;
 b=cRw1DihStWlylurx8bFIHKU8nToLvi+Kj9ccN5rcKXghK1a52+4ulgaGHiKuw1/mAjATsjrUxWDC7paD5ikMLjoLx3cRHzPtumjhWmb9cnF8FEEgENbdPP7v4hjDP9kaSXZHn8uMRJ/GszX8dYkrK5XOSloKx/nSCB+WsYZX99NFYbSNOQTLpKaL93/OCyLDQnh1yWfaPktFCEYqakWl4yzsxS1hXH3e1wCHdCFoUKHe75XO8pcQI8zQeAcxB6V20ABySFwje234W5qNEf+5ouVBvOX1bJjTTns1xTpSdirZdJPd2czwJQhSWw4E2PDDhDa4d2gQ9ifaOeORZ46E0A==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM8PR04MB7987.eurprd04.prod.outlook.com (2603:10a6:20b:24d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.18; Thu, 6 Mar
 2025 05:31:31 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 05:31:30 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Daniel Baluta <daniel.baluta@nxp.com>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "shawnguo@kernel.org"
	<shawnguo@kernel.org>, "mathieu.poirier@linaro.org"
	<mathieu.poirier@linaro.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>
CC: "conor+dt@kernel.org" <conor+dt@kernel.org>, "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "andersson@kernel.org"
	<andersson@kernel.org>, Frank Li <frank.li@nxp.com>, Laurentiu Mihalcea
	<laurentiu.mihalcea@nxp.com>, Iuliana Prodan <iuliana.prodan@nxp.com>, "S.J.
 Wang" <shengjiu.wang@nxp.com>
Subject: RE: [PATCH v4 5/8] reset: imx8mp-audiomix: Prepare the code for more
 reset bits
Thread-Topic: [PATCH v4 5/8] reset: imx8mp-audiomix: Prepare the code for more
 reset bits
Thread-Index: AQHbjbWGcjkrgedYhUiz/rRjsMTFL7NlloJQ
Date: Thu, 6 Mar 2025 05:31:30 +0000
Message-ID: <PAXPR04MB8459C23CCFB582614905FEED88CA2@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250305100037.373782-1-daniel.baluta@nxp.com>
 <20250305100037.373782-6-daniel.baluta@nxp.com>
In-Reply-To: <20250305100037.373782-6-daniel.baluta@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|AM8PR04MB7987:EE_
x-ms-office365-filtering-correlation-id: fa34658d-8ac8-4d5a-d9d3-08dd5c702686
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?lMMcDSTxELxsNqMlzBt/kNTsauyLWzg3iVSHGDGv1/ivIGYlfWchdvm7Q/Mi?=
 =?us-ascii?Q?kuZlQuGkUIZjKOzJlHWioxmWou9lnkkCInxvyZjVnNjCOD+i42YF/StTjCY6?=
 =?us-ascii?Q?iAGUDnbSMzKhlYQaEq+1lxI7AAVgZXFczPWO2qLspiFUUfx6Fi8rmYme/0Wk?=
 =?us-ascii?Q?rvXVcPFkmceJQoUeOc5C/Dsjq5M9HqS8oum3ve9erhPW1RPwSdQrxLmTg1OU?=
 =?us-ascii?Q?xK02Rm1nUWk5Xf8B0hriVquAK56hIzd3dxLZr4ahbN0R/WuIbMgdwHvHoQkX?=
 =?us-ascii?Q?EJugrLOtCcb15Ne6L/JSr3cdY8F3lj+lV+x0u55aA3B+9twLVu3wcNk5CIFR?=
 =?us-ascii?Q?YQs+mFCSVYPSk04/239zYfovrqGRkd8aFtg1+KLkem9F99LLEricxH5FpCCc?=
 =?us-ascii?Q?yViqW0yokkzUaUF0CUTqUkdWFTRUgIsnes5PCJpYBe/Yycpr3bsaeXOgrWpV?=
 =?us-ascii?Q?cQB39cz94FQvDKJeXXF/gWT6wzHMPijKvv2lpdCkqydOUXQ0TWkkZ24w5bVQ?=
 =?us-ascii?Q?xe4Qrbqd2HHDWqs1sGBuzcoEiHnbC+sRzMEmeSQzuoCesON2TxaHV8shJP4h?=
 =?us-ascii?Q?6+UyzQ4T82H0P+vQXn11ZUq9xs/S88k6fNKtfNfFpojKYrvRc/zgpRUwDVrm?=
 =?us-ascii?Q?sMFqscYTXuTsmsB84i/SYKuuVtOXMRFF3RRe1kDZxcgfa8AXUIvHMEJjkaur?=
 =?us-ascii?Q?Vx9ozK4K+bKWX1UTM38zGqDJXo/bZLyMPPmoWkIeSg/nRMzls+LQZsJ9UEcj?=
 =?us-ascii?Q?uyBXfxmmRBypiZ63SyTyc5E1+3afXECXTvfNwVDsBCt3vSL9zvYKRDLD6ZQL?=
 =?us-ascii?Q?6btyOxGEDPPQ61glelykoTnNueyKpWbTKIpBnSGOD15OcHe9/ODgrvJv4s7J?=
 =?us-ascii?Q?BY2hok+ZhvxrjgED5g5fmTeNq4Z9gf6CBC+j1DFcyZbiTA8wozl9ozITgvRX?=
 =?us-ascii?Q?2WRdSrTrbdxkKz7lyJbHfzoFmwoPjdKEhp8bgzRTLpHzjVAep+1E87x9hzwa?=
 =?us-ascii?Q?6w2tyAVbx8G74Cu05UthA3YE40ycVpiGPrrZUS9aLPfWgS017qkMrelkRter?=
 =?us-ascii?Q?a6G7PvpfFOh514edLS7fn0Po2qIDrw6hZSBE8/g2RNdOiAGvrcbdZaOX67Bi?=
 =?us-ascii?Q?kpnIUDKyAYft0wNM4VTLdaobhSJE3lTPJ4CVd2Ttb4IuoqXaBylqZhoWUu5f?=
 =?us-ascii?Q?HIsAateNv9F/nv1+liajI0VwCA17E3I4DcwKbN7XFsmbHRifIfIzhntNUQhi?=
 =?us-ascii?Q?1q4htjret78nT0kK5qCuHJmuH4hI4V8ctkawXqPVDtiZZUrEDqoYqveAqDeY?=
 =?us-ascii?Q?nVQZtA7ISE01JRY52EBKSf0pvXTTtK6uY1lWNF18k998RCbC0GPTfKQzSPxj?=
 =?us-ascii?Q?6ooL3H7ShLN6LkpXT5oVNc25ixSDCmzd8SILPIckfVBqpOrVTJHbdOOhIzrN?=
 =?us-ascii?Q?s7l1G7sOlFXZndCZOrMWtYzxYG7XCdsI?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wYq7If4zi/KvC+cUbijYZRsw4yEWGOpWJAzyTz4xyNMHyQjXD5XyAeDnaX2i?=
 =?us-ascii?Q?3t3iWa8tbtEUZ7o/ox2sfu9x9tEqi5aIpBqK0ONljMfhpZkoTF5gqAmwYfJ3?=
 =?us-ascii?Q?AWIjckMAZNsz125jyU9p6b7ZfwFDBiFl76vCeHttUvWIDUlVvA8hjIWfoytd?=
 =?us-ascii?Q?HcgsaVof0/OmfATbyeJ74jz/Y0wf2HM0NWY7h7/hUZtO9mivT/27aM4uleed?=
 =?us-ascii?Q?h9jnEpZndnPwXH9rfW3EtsTmoHr0fmzAqLfwfUU+gf/szm4PP1xRHPb4lPr+?=
 =?us-ascii?Q?rb68kwtqLC7BNfVqEIDDy1mpqPcbGnc1Y48+dhtnIDsxznl04EDVFfABx7Yp?=
 =?us-ascii?Q?qKoq3S2eG+jUjgscv5Rm1AOZGSRYkwqNDUhwVOrQyHT8LiTvilwIhglOSKR+?=
 =?us-ascii?Q?nqSoNHTsLN8973YWqSdvglrtTXQSR/9dBeJd4zw9B5kKWQ8hRe6d4U9z7MLL?=
 =?us-ascii?Q?R3DQbJIEHRLsV+QOR4irAdSFr8S0COx7cl6TRUxY7V/+M/bcnK9UQO3t4B2+?=
 =?us-ascii?Q?rLaidYCrHqfS5EPUvnLazw7cULENQokCLM5Wmyu7l9bJpnFSTXCx/AaX2gCf?=
 =?us-ascii?Q?XxytkfVWKuMXg87unlO3Pc8KYILF87ixeTjjMS9RAQ1DvK6yd7taVpAa5F7U?=
 =?us-ascii?Q?W1LiyXOPNNOK5jCk1+IoN2JWiSSM17EIqt+4vW+AeA8c8OWjA4JuiMHJvirS?=
 =?us-ascii?Q?5KWF8+iPKz4mbDhc46q0oIXSB1CfBBG/U+uSqHtdXpd+vB4CN+eZsmJBVSJr?=
 =?us-ascii?Q?RJNw2/Geh7AK/ZVQw8WLo9j6c0wh+1XU5CygPSWe0OfEAxmXUh7GG0CzJDg6?=
 =?us-ascii?Q?DJMbBRy+sOJdMqtMiNAgIxZW2BCjC/LUFIbuRUhuw7bpzkorzW8bmDfB4RXd?=
 =?us-ascii?Q?upWjbMXlKhTwD3GDK9xst3XMEJGSv28kO5+52clFFELNh+2+zJeyEPkqaQ/l?=
 =?us-ascii?Q?Z6+/eZ3B1Q+H06GI3MaPW1CoZTchwo4FgNBnegXLzFqNw0/g14QfE1zRodsR?=
 =?us-ascii?Q?qNl63zw3f/rqE+FENaCN+793xjNPmlC37czNXrwyHNiKHLWjgAWkJ8lpzPdt?=
 =?us-ascii?Q?n4q56P6v226R+APh53z//vIw8sA1wjqZTJI0ywrWZ04KkeoJIJ/eCvYR2YwV?=
 =?us-ascii?Q?Fza17PyzKe+94n7pGlTmfoQuX/nojRa4cMbOrPQo/2CeJ0kymyUyF4ykvnJn?=
 =?us-ascii?Q?bFp+kMhkE9iWqJ8s3zlWB8dliBefuUzNZmOsf3740D4mKOcORaR6WDMfy5fZ?=
 =?us-ascii?Q?43gPforxDW0L67Ow6aQKcvd+i/+39Z4Ny/b3imhYkzp6PuizbgO9pvE6gL4L?=
 =?us-ascii?Q?dZeydUdSXR2XTMjek4jPn07EbB2luVF4ev3BWEhlw9yBkkPbEAWsmAxB2G5j?=
 =?us-ascii?Q?BHn6UKygyY3pwcTPkj/LbJXGtC9imxr6b8PpqeTeOOPHDXPK7TxCe/uheVKV?=
 =?us-ascii?Q?MrkVMQ4dFtu7F2cq836iarHZx20reLHsysF6RSRx7ydarp/0Cm7mySLP0/SX?=
 =?us-ascii?Q?hGLwN7cN5uAav2jzMlubQoer70L69Ch3Va0RINBF7gQtwWliCVRyUnIEzsHb?=
 =?us-ascii?Q?VjyKMqTbcy9PpgiWAWo=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa34658d-8ac8-4d5a-d9d3-08dd5c702686
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2025 05:31:30.8883
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Cm/3yqWNEAHHWEx3u1d1moWu3O0Zo5ed25iUpCDXjakp1V/WuHwnorf5gdqAKEiIc3KRz3FudexC//L91LiYkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7987
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_214610_803912_A56D5724 
X-CRM114-Status: UNSURE (   9.34  )
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

> Subject: [PATCH v4 5/8] reset: imx8mp-audiomix: Prepare the code for
> more reset bits
>=20
> Current code supports EARC PHY Software Reset and EARC Software
> Reset but it is not easily extensible to more reset bits.
>=20
> So, refactor the code in order to easily allow more reset bits in the
> future.
>=20
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>

> ---

