Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CE1EF3382D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 09:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PwOyVCwNVUEXrP7UVEi5mCfs6VCZ5Ti03v7Nkt8KJeo=; b=PRNojzAZ4xjE2Eco4XdIy6FHSd
	/howL2TdVqSRUoHwaR4GRyFs0mBC4M3bKhploU+nIHkhcLrzB0+COFwE4j0HM7oCDwTt5ZNGUVAhx
	YAjw2e4gxindw1b5y+ydzSGq6w2+jEydzKnujsKKJ/j+0i7r9FjLMtrAExqlzsJHLAhMWpVi9Gm3z
	nS99NcI9zg+007by9sUyhvZ7JXD2GMVZOIuc9nowZ94tEKP9rITK8rlwXRYQLY4sp7+05YV5J0aR4
	O3IWR067LUuuktDaJRFrSykKb7ljb2dEIaoegMAeTD8LkSmuqkr/ysxjRFcXz42ZSsZdQChl/OWaE
	6AbAjHfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2R2A-00000005vFk-2d2Y;
	Tue, 17 Mar 2026 09:48:18 +0000
Received: from mail-japaneastazon11022104.outbound.protection.outlook.com ([52.101.126.104] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2R28-00000005vFI-2Vrg;
	Tue, 17 Mar 2026 09:48:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ywxc3IevrNBnTmcbHk3JDmoTRU7ntgNINlQb7TmZl7AHM2+EfFdtrsGgXRErm/LNSt/OrJZbW3aixyfQgvMHzBcOsHDgiijvDzRaxb/DQmb5D5dajstTOirP+vILqrc4rpIAbGwOA8jwvTUyxGBDgrix221+KvMKqS3bWdJtLWeEE71EasxEAd63iI3Dy1bZ+xeBRXlHHZpiJhGNb3hv7Jb5nzhWS05xNIIvRGRw+ySTA5KDqwq70ooyMIVnJ1ozoV67ho6h2H60CX869MgevX2iVgNDD+A9+jpUvdSmk9VWoqh873ENcVdymHYYisCoOunK3kDsfaVLcRCR/+34iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PwOyVCwNVUEXrP7UVEi5mCfs6VCZ5Ti03v7Nkt8KJeo=;
 b=iDOcK2fAoYqKpB/hg4J2aTgOeSilQmGv3hb/UqpfIDEUONMCn6J/4tL4lucMEbICFahUhT6zgMr6f4SIS6iFQmt3JGEuzPqHO8sWkKcEmyyzsPVLZDdPt3SbwY5nDnGQMpZOaVALRgTb2rxMkezdBes9G8SkvFBZTBNg0N5+6iXalh7nat3QZeUujeCbocdQI6VgJI3JTAXWD2O7VnmCMFFAFSemoTHyXmxNI9Yr5wvB2b3gsW0gqXnqizCfVlv7JLvY+c9kYf/Hk56jHdOYLBa+E2oGuI1ySQhhr3HVBXX9T3XG9vB/Ise1PCX/IRoED+vFeEpd5OknH7X/ObSgzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wesion.com; dmarc=pass action=none header.from=wesion.com;
 dkim=pass header.d=wesion.com; arc=none
Received: from JH0PR03MB8617.apcprd03.prod.outlook.com (2603:1096:990:91::14)
 by TYSPR03MB8447.apcprd03.prod.outlook.com (2603:1096:405:59::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.25; Tue, 17 Mar
 2026 09:48:08 +0000
Received: from JH0PR03MB8617.apcprd03.prod.outlook.com
 ([fe80::28d:6503:f51c:11b7]) by JH0PR03MB8617.apcprd03.prod.outlook.com
 ([fe80::28d:6503:f51c:11b7%4]) with mapi id 15.20.9700.022; Tue, 17 Mar 2026
 09:48:08 +0000
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
Subject: Re: [PATCH 1/2] dt-bindings: arm: rockchip: Add Khadas Edge 2L board
Thread-Topic: [PATCH 1/2] dt-bindings: arm: rockchip: Add Khadas Edge 2L board
Thread-Index: AQHctcL1CcCwbwnXakej/xIvOu1sk7WyW9yAgAAZQeg=
Date: Tue, 17 Mar 2026 09:48:07 +0000
Message-ID: <JH0PR03MB861712E2763EA86A50C33FCFEA41A@JH0PR03MB8617.apcprd03.prod.outlook.com>
References: <20260317040248.267154-1-gray.huang@wesion.com>
 <20260317040248.267154-2-gray.huang@wesion.com>
 <20260317-hypersonic-axiomatic-fossa-d5dd2b@quoll>
In-Reply-To: <20260317-hypersonic-axiomatic-fossa-d5dd2b@quoll>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wesion.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: JH0PR03MB8617:EE_|TYSPR03MB8447:EE_
x-ms-office365-filtering-correlation-id: 99b76224-846e-4c4e-8b4b-08de840a4b2c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|18002099003|56012099003|22082099003|38070700021;
x-microsoft-antispam-message-info: OluEIy9pgq5W7/u+8dCILjnXqX7eUwrAcL2RgZTcVyrHn5ObpSV1/nwVD9rGm4pjyKW4/hmYwlf8iQlVshIGduifqIdKW6rZK1Pc2gp7ABuCdxfcAK6REEA7FV2UjENMS/BtHMgFnXMEQMyJne+k3LNluRvKV0Y20L7os17YlBeetTFNdt7ge3ZrcpvGTWTQ4PYfhtdZrp9y81Bajhhugtm+s8nWAGhBE7wCPVrG0Sqr1LNlcTgsHI8Pc9LYsIgt0INdH71rromhBTvbeNoDFKhgS2BM1KydHrH+Eg+8+bFfYwruJS1I9kWJu7il6E2tNJwDkHBpC7z1nyUa2Z78+yF2ZKJYCHcZE2NAq3ypcBNuvDK+SRPU0fcQD3roovKWrc819jAnY91YcWGgqmAHW7yuSPsFb9wrQxrYCMOk4VmxyppN4EbGyeKMCIdqPtKqZLEq+mUO5B/kSyunHKc84SDUklxsgKx7wI0JcJsaTwHsgOpjnE3nHq9J27xojWSZV8RzZj/0hk6Mc4fjk8nfgVmsy2yFQE72EUGA0yFrUDzMy7dt8Zwo4Vo6Btdl+NmYTi7nAaQfYE8ziGwISPP/WhfHhxvMN7dB0aGWPNsF+z0/trs4IXaT1j7FhL4+B7ErpgCWgtjMn55FDucDqo4KPzEhke29LWlyMWE5+FtYI7Sju2XWfFbrZsCRcScVUOm6CJlIDgxl6m3uAPoRXNZ367jQrnqAbc43J/AUUWnqKOiSls+um/fmGMyr8idQVB5G/J2BR2lVzd0ki1TVZ/NJBElgNf17VKnuM7AAih5QDCE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:JH0PR03MB8617.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(18002099003)(56012099003)(22082099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Xhk/F0zi/B+CgqF1p2ZgdZYhpnj+HuPOYrPxxNjWlp4jTAISieSTfa9Lx4?=
 =?iso-8859-1?Q?/S1PnhTKBADevpyHCFjWcYfwruVfwgPdZlL0QUSmtH07yOQD9eRpuNLOK8?=
 =?iso-8859-1?Q?gcxOhGiVTJF3PvO9EUEwZvtBa4Cj/kCgzobkiYKFqN6iODf5e9mOR4D6Fd?=
 =?iso-8859-1?Q?AeKr10sLfWwINNJHyzIsN+vcSUs7pwcQloKFvij8g1wh7+irV62KkDFLGT?=
 =?iso-8859-1?Q?wxeZWKNygR2Y6kiVq/uC0I2H6mwqeNISiPj/66QKIENgtlFwoOq4Pl732t?=
 =?iso-8859-1?Q?LN+YscRJ42o6ZABnkGGpOpv2+C2cVI/MtAQJugEoA1vqZWPSOr1M3pr0Vw?=
 =?iso-8859-1?Q?wMWybYoIp6xaQA8UnOKidjqmSyCmgxbtr3hptilCPPUU0LVQ1e0DxMnVWA?=
 =?iso-8859-1?Q?IDD1iylAAMDe/RaGIEl2y/FxyA7XqlZchhXZhwwxtdvQa/rDkk71NLsIRK?=
 =?iso-8859-1?Q?Jqb8M5vj5XzTcDYTrP4izmfsv5AcPeW6d6CjtjaO17hTXbz7eYaFkPl2H4?=
 =?iso-8859-1?Q?vRoUWwIFbdDoBwU2crXxPXiC009Sze5EJYwawcOl+zbyyRRKLP4mqzviYD?=
 =?iso-8859-1?Q?onKIwpmqkSSKhEsX8V+J37R43Xzo4h0/vXjhmwVO2og6EG6yfTySNbd/jY?=
 =?iso-8859-1?Q?fTpbQ6fFqRtAaGuJ89dUqzO2YcljC59Va0GyTnsg67+txgxAQSRmGPR232?=
 =?iso-8859-1?Q?PJbJy18EjU1vbv2oPoHd+y7TNLQahMUuwVFXeT13cLOqhk5ZVjLP4yC1w0?=
 =?iso-8859-1?Q?uYmbvrvRAQedOVLwNsnY6sX7THxf9PoKfV7ZvMG1fs5EBwcEyYGRDTmk0g?=
 =?iso-8859-1?Q?rBVCzTNsycvcZJKNW4Co1uaWuOE3db8+IMNajy3KJh+7UrO6fwmlAEIsAi?=
 =?iso-8859-1?Q?sXOJUCkS+UYjOKklC+46N207C2aDmZIcOKso7cy0Gdz7FwXeDQt/GCpzIV?=
 =?iso-8859-1?Q?eyzbvpIcZWOWwNPn2OSqPhvsS+I9CcQpjU/eNc/Yq2FL5AWTpIhnsoqEyl?=
 =?iso-8859-1?Q?UsbuEibkufeRpgA2ERjYiyEtK0iKKpa2EQNdDqYLXAxAr/wMtr5yIfyMMj?=
 =?iso-8859-1?Q?yI3bBJf7pCHLYtZXo8i/Z4QKaMyZqJU8DL2DcdmfdjPfEkP2Si9YuAgWLe?=
 =?iso-8859-1?Q?ppcit0ZXoj2PCh8GcYiX8B8tRPtZIBc2caFRxubU9UTfQOZQ2LpVl+5JYv?=
 =?iso-8859-1?Q?gm9hucupx/LKKJ9qyb3J09gLTF5JwYQUh1VPff3EHrpVYtzIE5nsSQPFEv?=
 =?iso-8859-1?Q?a+S0X0bFj8I6e8FblKtv9fvOh/sarjYlHmCqEvJ8eZBzJSXBBeM3bDhNd3?=
 =?iso-8859-1?Q?ICfjqH2HCNgtf+lA0i8uM52DksX4UzKvk9bChEgg4tIhGg/jr+2wJGnQsS?=
 =?iso-8859-1?Q?4zDvLIr7rrzme6AzwpGTWopdcJMXvzjJ6VUScrJ4qBznHzMDF8vfRCwVcP?=
 =?iso-8859-1?Q?MDBmIEYtKdlQI1GDWt+ZxoyaxjMFz/MFBhAZHc6fBX0fmyyF8eQGGEVMqf?=
 =?iso-8859-1?Q?/QviB2M5McuyWRuqcL+WHbEugx4Y2DSdpp0bwyg+Eigwx6kUSh+bBFhRaM?=
 =?iso-8859-1?Q?jclKzWMLRrUvrikNJtesRHJrSuceJ4bxfSxQsLiD1L1HsqNNqRAUQrjXH9?=
 =?iso-8859-1?Q?5efR4yCc7rMw7fH2Z+Fv6xUUiYyq2dXu3Oog2FGw1z850NDk/e7WByrKn0?=
 =?iso-8859-1?Q?vh4y+ALLp2lyHfX1bp/wgGXWz8y9iRaQl4LYiaoaqgaPVbPsHPpHoXQGLW?=
 =?iso-8859-1?Q?wXNtqVipRhzsHgZbFBrOGJVY6tVlJPc6fUlip7vrEoca9N?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wesion.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: JH0PR03MB8617.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99b76224-846e-4c4e-8b4b-08de840a4b2c
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2026 09:48:07.8372
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2dc3bd76-7ac2-4780-a5b7-6c6cc6b5af9b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YYWefsIwm/yALrRwmHNT3/5S7UVWwh4WyUWQuuApKExKpKjh/sou5WvZhp1R5u7JmbEKpQXzfTAaPr4MOw02fA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB8447
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_024816_641294_2D606F7E 
X-CRM114-Status: UNSURE (   7.53  )
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

> On Tue, Mar 17, 2026 at 12:02:47PM +0800, Gray Huang wrote:=0A=
>> Edge 2L is an ultraslim, credit-card sized ARM PC designed by Khadas.=0A=
>> It has quite a few rich peripherals.=0A=
>=0A=
>Drop marketing, please. Every board manufacturer claims they have rich=0A=
>peripherals.=0A=
>=0A=
Hi Krzysztof,=0A=
=0A=
Thanks for the review. I will remove the marketing descriptions in the v2 p=
atch.=0A=
>>=0A=
=0A=
Best regards,=0A=
Gray=0A=
=0A=
On Tue, Mar 17, 2026 at 12:02:47PM +0800, Gray Huang wrote:=0A=
> Edge 2L is an ultraslim, credit-card sized ARM PC designed by Khadas.=0A=
> It has quite a few rich peripherals.=0A=
=0A=
Drop marketing, please. Every board manufacturer claims they have rich=0A=
peripherals.=0A=
=0A=
>=0A=
> Specification:=0A=
> - Rockchip RK3576=0A=
> - 8/16GB LPDDR5=0A=
> - 64/128GB eMMC 5.1=0A=
> - AP6275P WiFi6 LAN=0A=
> - HDMI2.1 Type-A=0A=
> - MIPI-CSI x2=0A=
> - MIPI-DSI x2=0A=
> - USB3.1; USB2.0=0A=
> - RTC clock=0A=
> - PWM fan=0A=
> - SPI Flash=0A=
> - Pads expansion board (UART, USB)=0A=
>=0A=
> Signed-off-by: Gray Huang <gray.huang@wesion.com>=0A=
=0A=
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>=0A=
=0A=
Best regards,=0A=
Krzysztof=0A=

