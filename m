Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 720BAC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 08:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9eeK1Zd/sB2aFcZonO/thBi7IdUrFbUSsK8qSNo5hl8=; b=suex7u0X1KAlBVGoO13h4Ltv3v
	kKSPb6tnx6hyD7tfKelSr3PgW8jJZbkyz1Ekpi8m8cIbPYHeNgZV+zdjzoIFCvsv5JA2WtfVrJ2Rx
	2HiFY0OfKOPS+yaTC1CzXp31Q5Anhh8BxWoUSQza1ulFjkl+g0ejVVTgRcah1WyrYTcZPCdzKl6io
	3eFsML3MhQjQYRihouswzLFmSwBwIumjJs+LjNxZtdo+fBBOAsZj/8++54FxkSDwlhOIt1jYPLXGP
	6yJr2LfCBZOormjZZzkEub/+17+dsATp67MoZ65e12fZ8Ad8KLX20zpBCEVSc9MnG6JePB3jPQBS9
	dw9EsnuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAPXL-0000000F3fR-1fb1;
	Thu, 01 May 2025 08:44:55 +0000
Received: from mail-centralindiaazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c408::3] helo=PNZPR01CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAPVS-0000000F3XR-2cpH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 08:42:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aBadZl63IkqN7mP7t0rG1Keg7+AduS7Jql+n9PxL4ABf7XlVvnwpV7OiWapeUXFh01T9A5jtz+LrqF4rGCCB11CSN685tQWUbbmH4WoeZadeMAEj9UrHglZUFPelMahkggh+SR2avYM/1CzQdW6jT2OK/HdIkcNe+vq6lHCP+33/GH2azbmf/HgUwu8EBaS2cw7JPqBMolowNZAXP7wO6HHy1SWlnub35wAntCP2TDavoJgRUx4iq+ORxBgjNvrJNxHPhdn7eeeczAr8VgM8/wP3f21pqNpKON2rXN3ZWZauCHi0i+MVXb8ZS8592vTJY53vAtOR8/lkNkWjDVM42Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9eeK1Zd/sB2aFcZonO/thBi7IdUrFbUSsK8qSNo5hl8=;
 b=b7NCMQXV9r63ikSvhKChz7vlICKSvfsGH2yzCgRxAKJriyQcKjQnZhDWkn3QX6lPHVopIr3xQ52o0E1COQ8N4dc1VMeD7uHqHGMJ+OUYjku4LimCXB3eexxcXJHyyHeBkT12Z9bp9ZeUw6jiz+tQcS3SCZ0gsDEuSVKZWz80DD4ljhiUg+2ip6yiU25qrKbr0HrTW4gavqxZ3P85oOHB/ESWrH7s1sXsVWGqjcnKpoizRA+xxHXuvZWVSR3fRl4snF935JSF6LHPlEUz6hgfyHlRBDJKJg06E3sKTmxDSOeSGebBPMvCVZ+LysYi3NRMMZ1LSRxagE8inE2unzyzTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by MAZP287MB0560.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:10e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.34; Thu, 1 May
 2025 08:42:38 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%2]) with mapi id 15.20.8699.019; Thu, 1 May 2025
 08:42:38 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
CC: "krzk+dt@kernel.org" <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: imx8mp-var-som: Fix LDO5 shutdown causing SD
 card timeout
Thread-Topic: [PATCH] arm64: dts: imx8mp-var-som: Fix LDO5 shutdown causing SD
 card timeout
Thread-Index: AQHbulxgctRpmpzP2U2RCwqTv4VDIrO9bSqa
Date: Thu, 1 May 2025 08:42:38 +0000
Message-ID: <PN3P287MB1829A86F2A43F4A892151DC58B822@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20250501054604.23368-1-himanshu.bhavani@siliconsignals.io>
In-Reply-To: <20250501054604.23368-1-himanshu.bhavani@siliconsignals.io>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|MAZP287MB0560:EE_
x-ms-office365-filtering-correlation-id: 550fbe0e-db7d-46df-77dc-08dd888c210b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?dPMpYAjTsvnsX28h1OUyV6H+lJRu5xW6Ipz6FE28OurKuFM6+RfBwamTiZ?=
 =?iso-8859-1?Q?Fv4WiYZiRFz+y7T7SsDvGhXhyMoIikL8WCmJDZSLcWK+fz948Kp4OVoTA3?=
 =?iso-8859-1?Q?1qzvHuBn0lWpvJ9k3GP9EO2U/kRRIdZxiAHzoAWrRKKE7pux/dU8H1eVNN?=
 =?iso-8859-1?Q?o9aq25xirrLONmrhQ53BxjKRngI8x8ITzrE8kRI864qY/b3MtWmnUo9smL?=
 =?iso-8859-1?Q?YtSmNYakr8WNUw3JwIaNvt9Fy1vB1TBQEv/JIS0hEl2yrGch1FD+u0bCAX?=
 =?iso-8859-1?Q?AGjVN6lGKPBJZ6YdI2ivxqX5gkwtIgy160A9Uy7m8d5IF7taOi84geryn1?=
 =?iso-8859-1?Q?w5wH/ZFl5lhpzK5GUX/Bke8+DNoBgNFjQ9wMD0WG8QOhsEqZln9RhhlqSf?=
 =?iso-8859-1?Q?kiHtDgcTqzYhX9ryOEsrQ+IMdePw6DTr4RvzvWRm294Co8CncJMQLkkLCI?=
 =?iso-8859-1?Q?6KHexci17IqWyGVpMP2Ps91w5V8C0O0VfrM1k779XjK8K9IMw7Kk3Am3ma?=
 =?iso-8859-1?Q?RfaIgg24vAvFPi4m4SMlOxRF4s8PmgDpi3b6vPFsTDKjzvUNm33CracJLJ?=
 =?iso-8859-1?Q?dDzooUfAYnjRtpVCGyFtEYLMOFKf1oUXXrstBdIwkKKG6IwnKj6OqGjUot?=
 =?iso-8859-1?Q?DwGiKjGDxTtUGftuf26svES9UCgPlOlIzk3Xh5MUrFC8dg4iCYqe8vsXou?=
 =?iso-8859-1?Q?s4E20l2BWlfiuB5UJe37CpyelAPjw2WtIl5ammrJWiRb53yYMMbbe6SEZn?=
 =?iso-8859-1?Q?gAmctTpXmg61c/ic5Rpe5Tvt6cjP/E8rTzc0BJ6EU7aWvwzGIhBEbr8HW5?=
 =?iso-8859-1?Q?m4SDer2HmwbY4aSCslNM/ZJtq8/oeoi1yDMxSbU3lzGxQh9VpXQJlBE/ID?=
 =?iso-8859-1?Q?aiSorE8pFvreGFjOfFDMH8G0LSC1rau6f39XBPeqZQJdBMQ7tk1DxojJd2?=
 =?iso-8859-1?Q?W1pPvjQggpDFx1o8ZjZ6TyJ63T8T7zo1ZUhaV37YFJ+HVWzR3OKywTKYKv?=
 =?iso-8859-1?Q?RzuR6JA66foP92GjCqe9NkOsqLpH+pOCEt7aqPuHEpQ9VU+wgU+uoPBfzx?=
 =?iso-8859-1?Q?tePWqSKfwno6gHr3QFprl3cSbCV3KBHRnG7TyQC7747H4LURns99Z0QsUP?=
 =?iso-8859-1?Q?4onV1td9c5RxOBiOrzKopt48HWi6tVc6jpieZzF9MPsOWM5ZdtiPq925Zo?=
 =?iso-8859-1?Q?CVdBn21VUY85YDFbbBWE860FUyR+gE95+kwEGPABMX4yRh7xG8Q2WVNitr?=
 =?iso-8859-1?Q?16HgecSm/h1u7JiytH6jge5c9iEA35aEyipRRyj46GYBrDJF/PKw5AWgTW?=
 =?iso-8859-1?Q?Ql6c1XM5ENjp5VIHb0VGpalvx+0WEDlfwiDn+aCEwF5FPbKd8RHRJsPZQI?=
 =?iso-8859-1?Q?Q+58jOBWpkn6GsN8n4j1vRtyWni1Qoi1tlW+1fhni89RFu+t4xlgxS8Xs7?=
 =?iso-8859-1?Q?Zo3hWvYiyGDgjsby6Not/tm41yyoPm8B4xkypl59lAv6JSlze5VE53cZfG?=
 =?iso-8859-1?Q?dhQKnq+RBoXCaqoO36V8KJLH7UwEPzu2RBzpZAsm7dCQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?AcL5+l5jk/hREo1TI4rWzLRY3AhWHwEev8Iw4bzSz+Ckvc2TzmjV2m6zxF?=
 =?iso-8859-1?Q?XTbP5/2A89KCMLUUYYIW4xYGz7qfsxuES+fHnrNlqnXvjTS3gH9r+6bJz/?=
 =?iso-8859-1?Q?7nRlDq7TQWhEbJPKPv7nHHsBBljJMHC4zxwaDF+1GSCxPvSaGcmly/vXv4?=
 =?iso-8859-1?Q?zWKUvIx8TGYINpV3D68OVAb1p9IN/SFLsoypJtn+JBCaUnPathFfvxwhE5?=
 =?iso-8859-1?Q?G3HtFOsdtix+YK3OKfztGv0qDZ5lnee6QjFsI+v91jfVk+CcU42AvWrYeH?=
 =?iso-8859-1?Q?XcI7dbaBMdgYDT0w3l6zCnJHkp8zUDbFaTSJNOcSmnQFHdiOlyZVJ7p9RB?=
 =?iso-8859-1?Q?nEUZlZwrczPcU1lOoctcyimu9+iyjpk3SzXcXhp9vXP+TceAjm3H1zbUw5?=
 =?iso-8859-1?Q?+RkPOuaxew2h3xl2yB+mFZzrl14h/8E9rpMVd1WAXs/qEI4iq+T+CRnCSo?=
 =?iso-8859-1?Q?C2LSuwnKUpR8S8bcqIUeCnKem2aO1QUlVgGeh3FXFbbXT10mOlyNFMgffA?=
 =?iso-8859-1?Q?lNut22HcWqnhd/FA1LY4KHvLgrU1HAHpDmhZMqiCTbD65Z7uQUbBlGUOd2?=
 =?iso-8859-1?Q?DI0EbzxNPL0iia4FI2YAcc7Oym66JAqoz6j61M24khqV3w4FBfnD7OPq99?=
 =?iso-8859-1?Q?laM8MzMVCcJXGz2EfVQAxxDsCIPWrsQJ+xJyY3rdQeniZZskWwo5nt/mvx?=
 =?iso-8859-1?Q?5qrovmaD52RXf7XbBXsq9XdX+R3V4hBSbid2/WNkXybs8cjq5dN5NfnJH5?=
 =?iso-8859-1?Q?2dR3AAparkLmzzaH6QzXcCZ3tZbDd70di7yO4ZSvxpD6p5TswkBe/cqjT6?=
 =?iso-8859-1?Q?mGOiFV9GvHlnvaBjex0iyu0KC8AQ1ipmIdC+uNbrssEkmkSPhAKvniGVX0?=
 =?iso-8859-1?Q?m2zI1c0hLsw06FMWiXQ4bnFnu8GkM6103JOPEjqVPGBkQXa+23er0VXd0+?=
 =?iso-8859-1?Q?e9AfGmd8nyNMY0UsJZ/YsQVCpkvpI8DQrZdwG02BxW3xJPIjaqmToSSEeC?=
 =?iso-8859-1?Q?9DU/49LejdjozjiQ49EtISKRuHjAqB/sOzfIGYwK5kqkVq3nqzaq5x/uNR?=
 =?iso-8859-1?Q?RqKXo9aKi+5j9IxcGjRTpoXhlnVjgx9N6mXLkEc3gy6mrR0sSffZ0Yvm6n?=
 =?iso-8859-1?Q?DIo//mTAqsHqZHn3ztJGa7INKmTNNyqiBLY/GMNVMEi2NIR/7Cui5pHDC7?=
 =?iso-8859-1?Q?AB70Jr2CkgmtSyjOhpmQXUNCZVK8IrJMdVgvan+72UMF1dzMuqIeYAZE8Z?=
 =?iso-8859-1?Q?fWo8tU6evGaZqlsTLzshH/1r7vVwuXc//ApTB97fIKdQRFCfDo3RnilJva?=
 =?iso-8859-1?Q?cP94Xn7GYmY7F7/aCspX9ZvJgIwiqyZq2pbnIZWI5314/0nmXY/EsU445p?=
 =?iso-8859-1?Q?1VQYDDt5OTNRbnrWD34qMwT9w9iWK3/mxcHNuQ0p9wtkfGXvpuv2rzmRUC?=
 =?iso-8859-1?Q?Hx9UD/Km4IQsPyFoA3WWHjDiYRcJeGsabD+Zn7Nr4+04u/md3pCz3epa+r?=
 =?iso-8859-1?Q?WgUQYEqAoMRYoxwBKUpswrPxhV0gS4botvY7AGaz6zOxVRSom+oUwfP2SB?=
 =?iso-8859-1?Q?sOOdMHZ+UiBmgRefxw80DxTnS+boqlzPpntDKCbbkXPZyDICdAS/72i95K?=
 =?iso-8859-1?Q?5k6jJRrxTgFnHNndxUGT0M0eCuzgSyoqWRdx5gEFLabHN2cfanfVfyOA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 550fbe0e-db7d-46df-77dc-08dd888c210b
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 May 2025 08:42:38.7525
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fzqe6cJnukfGR+FeFjICRBpOtpTznHNdSUIhjtMTDj0v66JdWm3zoBkV4G+ZA2km6cuF8f9k9ZeH0ioNVU+YeQkMG178XGiB/yRRGY99iCs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZP287MB0560
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_014258_878264_E9F5B3AE 
X-CRM114-Status: GOOD (  14.13  )
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

Hi Himanshu,=0A=
=0A=
Thanks for the update=0A=
=0A=
> Fix SD card timeout issue caused by LDO5 regulator getting disabled=0A=
> after boot.=0A=
> =0A=
> The kernel log shows LDO5 being disabled, which leads to a timeout=0A=
> on USDHC2:=0A=
> [   33.760561] LDO5: disabling=0A=
> [   81.119861] mmc1: Timeout waiting for hardware interrupt.=0A=
> =0A=
> To prevent this, set regulator-boot-on and regulator-always-on for=0A=
> LDO5. Also add the vqmmc regulator to properly support 1.8V/3.3V=0A=
> signaling for USDHC2 using a GPIO-controlled regulator.=0A=
>=0A=
> Fixes: 6c2a1f4f71258 ("arm64: dts: imx8mp-var-som-symphony: Add Variscite=
 Symphony board and VAR-SOM-MX8MP SoM")=0A=
> Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>=0A=
> ---=0A=
> =0A=
> kernel hangs during boot with the following logs:=0A=
> =0A=
> [   33.760561] LDO5: disabling=0A=
> [   81.119861] mmc1: Timeout waiting for hardware interrupt.=0A=
> [   81.119872] mmc1: sdhci: =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D SDHCI RE=
GISTER DUMP =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
> [   81.119876] mmc1: sdhci: Sys addr:  0x00000010 | Version:  0x00000002=
=0A=
> [   81.119882] mmc1: sdhci: Blk size:  0x00000200 | Blk cnt:  0x00000010=
=0A=
> [   81.119886] mmc1: sdhci: Argument:  0x00844358 | Trn mode: 0x0000002b=
=0A=
> [   81.119891] mmc1: sdhci: Present:   0x01f88009 | Host ctl: 0x00000012=
=0A=
> [   81.119896] mmc1: sdhci: Power:     0x00000002 | Blk gap:  0x00000080=
=0A=
> [   81.119900] mmc1: sdhci: Wake-up:   0x00000008 | Clock:    0x0000003f=
=0A=
> [   81.119904] mmc1: sdhci: Timeout:   0x0000008f | Int stat: 0x00000000=
=0A=
> [   81.119908] mmc1: sdhci: Int enab:  0x117f100b | Sig enab: 0x117f100b=
=0A=
> [   81.119912] mmc1: sdhci: ACmd stat: 0x00000000 | Slot int: 0x00000502=
=0A=
> [   81.119917] mmc1: sdhci: Caps:      0x07eb0000 | Caps_1:   0x0000b407=
=0A=
> [   81.119921] mmc1: sdhci: Cmd:       0x0000193a | Max curr: 0x00ffffff=
=0A=
> [   81.119925] mmc1: sdhci: Resp[0]:   0x00000900 | Resp[1]:  0x0076b27f=
=0A=
> [   81.119929] mmc1: sdhci: Resp[2]:   0x325b5900 | Resp[3]:  0x00000900=
=0A=
> [   81.119933] mmc1: sdhci: Host ctl2: 0x00000008=0A=
> [   81.119937] mmc1: sdhci: ADMA Err:  0x00000003 | ADMA Ptr: 0x4003f204=
=0A=
> [   81.119941] mmc1: sdhci-esdhc-imx: =3D=3D=3D=3D=3D=3D=3D=3D=3D ESDHC I=
MX DEBUG STATUS DUMP =3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
> [   81.119944] mmc1: sdhci-esdhc-imx: cmd debug status:  0x21b0=0A=
> [   81.119949] mmc1: sdhci-esdhc-imx: data debug status:  0x2200=0A=
> [   81.119954] mmc1: sdhci-esdhc-imx: trans debug status:  0x2300=0A=
> [   81.119959] mmc1: sdhci-esdhc-imx: dma debug status:  0x2400=0A=
> [   81.119964] mmc1: sdhci-esdhc-imx: adma debug status:  0x2594=0A=
> [   81.119970] mmc1: sdhci-esdhc-imx: fifo debug status:  0x2608=0A=
> [   81.119976] mmc1: sdhci-esdhc-imx: async fifo debug status:  0x2798=0A=
> [   81.119981] mmc1: sdhci: =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=0A=
> =0A=
> ---=0A=
>  arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi | 14 +++++++++++++-=0A=
>  1 file changed, 13 insertions(+), 1 deletion(-)=0A=
> =0A=
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi b/arch/arm=
64/boot/dts/freescale/imx8mp-var-som.dtsi=0A=
> index b2ac2583a592..8d50e8382a1a 100644=0A=
> --- a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi=0A=
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi=0A=
> @@ -35,7 +35,6 @@ memory@40000000 {=0A=
>                        <0x1 0x00000000 0 0xc0000000>;=0A=
>          };=0A=
>  =0A=
> -=0A=
>          reg_usdhc2_vmmc: regulator-usdhc2-vmmc {=0A=
>                  compatible =3D "regulator-fixed";=0A=
>                  regulator-name =3D "VSD_3V3";=0A=
> @@ -46,6 +45,16 @@ reg_usdhc2_vmmc: regulator-usdhc2-vmmc {=0A=
>                  startup-delay-us =3D <100>;=0A=
>                  off-on-delay-us =3D <12000>;=0A=
>          };=0A=
> +=0A=
> +       reg_usdhc2_vqmmc: regulator-usdhc2-vqmmc {=0A=
> +               compatible =3D "regulator-gpio";=0A=
> +               regulator-name =3D "VSD_VSEL";=0A=
> +               regulator-min-microvolt =3D <1800000>;=0A=
> +               regulator-max-microvolt =3D <3300000>;=0A=
> +               gpio =3D <&gpio2 12 GPIO_ACTIVE_HIGH>;=0A=
> +               gpios-states =3D <1>;=0A=
=0A=
You can remove gpios-states because we've already configured =0A=
a pull-up in the pinmux, so this is not required.=0A=
=0A=
> +               states =3D <3300000 0x0 1800000 0x1>;=0A=
> +       };=0A=
>  };=0A=
>=0A=
>  &A53_0 {=0A=
> @@ -158,6 +167,8 @@ ldo5: LDO5 {=0A=
>                                  regulator-name =3D "LDO5";=0A=
>                                  regulator-min-microvolt =3D <1800000>;=
=0A=
>                                  regulator-max-microvolt =3D <3300000>;=
=0A=
> +                               regulator-boot-on;=0A=
> +                               regulator-always-on;=0A=
=0A=
Instead of using regulator-always-on for LDO5, we should set =0A=
vin-supply =3D <&ldo5>; in the reg_usdhc2_vqmmc node. This =0A=
cleanly defines the power dependency and avoids keeping =0A=
LDO5 always on unnecessarily.=0A=
=0A=
>                          };=0A=
>                  };=0A=
>          };=0A=
> @@ -205,6 +216,7 @@ &usdhc2 {=0A=
>          pinctrl-2 =3D <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;=
=0A=
>          cd-gpios =3D <&gpio1 14 GPIO_ACTIVE_LOW>;=0A=
>          vmmc-supply =3D <&reg_usdhc2_vmmc>;=0A=
> +       vqmmc-supply =3D <&reg_usdhc2_vqmmc>;=0A=
>          bus-width =3D <4>;=0A=
>          status =3D "okay";=0A=
>  };=0A=
> --=0A=
> 2.34.1=0A=
=0A=
Otherwise LGTM.=0A=
=0A=
Best Regards,=0A=
Tarang=

