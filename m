Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E47CFD32D8B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 10:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oxJ4RwOEr82XCbEspiLXyjx5a9jdl3H2kZ8mGdsCYv8=; b=K9L6f7I2kaF9ObUtPqhCT/rcBq
	PtlaesGbvkOEZ+VggX0xjW46IB39z/eeGvuK//WR8cq6Hw2Rtx6gBHNvlIH2teqWGcQSwPa/D1nSH
	MRMzXekq2tnNKCUYz8YCjsTl4ZE0bsjSX6D53U/imIenhq2gARP2gxskOf5EUMT6kI4cTi6ZeHVpy
	VmPPQCJf9NEICjBfedQmSyTZie08jGE3ex8fKYeG5i4pIvzPW1bIdOWsrSPpS0zURrAgLFSljMF9c
	MUQNU/e8ciWCJQ0gdVDOIoHxF0YMwf7/y2yUWrAJR+vT/zQRkhwA5c3m+jItN9OPWZIECQI/ab+Y0
	2kK0q4tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAoEr-000000033vL-2KdJ;
	Tue, 12 Nov 2024 10:35:13 +0000
Received: from mail-japaneastazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c405::1] helo=TY3P286CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAo2Q-000000031h3-0oO8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 10:22:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kkNRwlEvpRinMUUP2xIvRlv8lG1e6GuwPqw0qgh2VETF11UWdZ3FIyaJOoWynsLZYkI5LKdrDdaFvoJ6fQaJBduYXNDkMkKmHv4WuPy1AqLJaaSz5orbwR67D90Q8dJf+QcSwMW9o/ErUumsGlObbMB0dTiF3KjuNWsnS5LZ28/HiNmE8u78dPp430jQN4SgNfSDsObB5B5zDUO9u0q5AaHiyoShDbgsQHNBoSz6otg+UfOYKae1BauCqziheRdQXk99VFuhBdMdTnjNDGz3UrEbfFOJNpJ6pO2dY4lz89Ns+izMv6+Oi05jZQteF8ggTZYUpgQx1tAXoi1sk2pKTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oxJ4RwOEr82XCbEspiLXyjx5a9jdl3H2kZ8mGdsCYv8=;
 b=iOxjewv9KwwA9dnHhCwCvBRsyQO6YllyzGfuaVg0gIRbxY2nw8Gmji66v2snUV18vGLc1Or/ae3vOIpenh/A3jfJv8gW1D/nbj2QoZh4yMX9wDoTYZia14TbNs7encg0XZuwbVTw9c0M/0pGh56JsHZWRrh2jON5kd+LN/KLGdAejPpFhnH/2tHOxnSNAZwtSL0fxv+2CHRdCsg+DY4DgYuHYYhNHnQG6aMhOaeKIi646ZAASuMKDZLCzK31GDoTkY0ys9CQH2h0mqkAAWAiNMDU3n9ZWBn4xjj7Qmw10gQ4jFZKQIOJZ8vFtmmEiHaKJ0/cP6AZnmDlq4aevZj/6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oxJ4RwOEr82XCbEspiLXyjx5a9jdl3H2kZ8mGdsCYv8=;
 b=JITA7opHf0+qEjBO7ehBLdgE1GLUw0bWkZu/S8nDXSMkK0CiJTIpLMyk3fzRiP09FE7K9GIYV1Hay4rc+qk4uHD7v/k2SeqqroE72xY3g+9eEWY4nUr86EqjPbViQrG3FuVOJuiBzZoLNr9Um4sTNXn0uBW3xCbtquQbS2OwD8U=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB8552.jpnprd01.prod.outlook.com (2603:1096:400:138::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29; Tue, 12 Nov
 2024 10:22:13 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%3]) with mapi id 15.20.8137.027; Tue, 12 Nov 2024
 10:22:13 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Liu Ying <victor.liu@nxp.com>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>
CC: "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "catalin.marinas@arm.com"
	<catalin.marinas@arm.com>, "will@kernel.org" <will@kernel.org>,
	"abelvesa@kernel.org" <abelvesa@kernel.org>, "peng.fan@nxp.com"
	<peng.fan@nxp.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>,
	"sboyd@kernel.org" <sboyd@kernel.org>, "andrzej.hajda@intel.com"
	<andrzej.hajda@intel.com>, "neil.armstrong@linaro.org"
	<neil.armstrong@linaro.org>, "rfoss@kernel.org" <rfoss@kernel.org>,
	laurent.pinchart <laurent.pinchart@ideasonboard.com>, "jonas@kwiboo.se"
	<jonas@kwiboo.se>, "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
	"mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
	<tzimmermann@suse.de>, "airlied@gmail.com" <airlied@gmail.com>,
	"simona@ffwll.ch" <simona@ffwll.ch>, "quic_bjorande@quicinc.com"
	<quic_bjorande@quicinc.com>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, "dmitry.baryshkov@linaro.org"
	<dmitry.baryshkov@linaro.org>, "arnd@arndb.de" <arnd@arndb.de>,
	"nfraprado@collabora.com" <nfraprado@collabora.com>, "marex@denx.de"
	<marex@denx.de>
Subject: RE: [PATCH v6 7/7] arm64: defconfig: Enable ITE IT6263 driver
Thread-Topic: [PATCH v6 7/7] arm64: defconfig: Enable ITE IT6263 driver
Thread-Index: AQHbNOqfdCG8B3DZuESvH2RV/HKqu7KzbykQ
Date: Tue, 12 Nov 2024 10:22:13 +0000
Message-ID: <TY3PR01MB11346F931EAF9BB82DDDC9A3F86592@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20241112100547.2908497-1-victor.liu@nxp.com>
 <20241112100547.2908497-8-victor.liu@nxp.com>
In-Reply-To: <20241112100547.2908497-8-victor.liu@nxp.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB8552:EE_
x-ms-office365-filtering-correlation-id: 50d24a4a-c52e-4e94-f022-08dd0303e009
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?nbDxbJxiT8XptAQtXmHfPAJmkoMzmE7AQXa4/fs3BROIBZcuSHaMY0kKXCvv?=
 =?us-ascii?Q?gqbIQZG5anr/++V5u3ERpmbNyQLnsPlzwTw0o59a1X3pvvuHUl4dgUJGuX6A?=
 =?us-ascii?Q?ni45r6AWzKd8TvHZQQAl+JWbYjRAUvouJCSFSm+sIaWlgQ4aQLZ4MdRbdDcC?=
 =?us-ascii?Q?TFp/2yrhZU+6zvvzZbkRhfc2+YUDAfmEpUH4mApeAv6Yhg+NYGEHg3yWIr3g?=
 =?us-ascii?Q?Vh0Ze0ULoKlqMajEtI4efOoAYxaqAFhVC8lWkGC+yplKeCVPiWuXTiSi7p0E?=
 =?us-ascii?Q?3kGrBM58S0rSORpuVLmgyIj0PiF8C/oDLSTmRyzZSaYnv6hu9NPf8jfiLqeR?=
 =?us-ascii?Q?zRBbPSAwBpYD0+eBXsR6lzOKYkgxRicW2jlZ6zMUlhK/IuG33yHuBwF0omnC?=
 =?us-ascii?Q?+Y+117vVcL7nsCFUNSrGkV12X9BmuHf+NF/s9KbD3tOakAsQpzbgBKwH4JsW?=
 =?us-ascii?Q?HuLZSBUg7TH1hDC3xKKAq0znokcDIGp47tfMbVyaCrEgCbjhSdnfRcfvaPUg?=
 =?us-ascii?Q?04B6qlyyFvin8fc3GIHgEKkhBiS55NMWrhUvAwS7OiEmBGCyYM2ePyPRs8ea?=
 =?us-ascii?Q?1mPw5vfCrS1YcYvbTEvdJqmRsJYObH7Y/N7WS1EyeSv7RPVoWbhxc29deeI6?=
 =?us-ascii?Q?Fxrj/K91VEuFKNt+jwgGGyYWpt9Koqgc6QhTH3Su2aabje4anGUwHyIjI2tZ?=
 =?us-ascii?Q?Gqio40tP3FFptDdXkOZTvwULEo/XYnAzDM4ktUOWmmBOt1zVPLXZYazixSu3?=
 =?us-ascii?Q?Jh8f3Mge4ipod5s3G4rXmsq0sc8BbJIXcGUJf6fIYqRuNs2lxK3YkQfYC2c/?=
 =?us-ascii?Q?NeStvsxI/ZyYxspgxdFEY+zscTt1C+hPjn0HWpvm6OAqjNeJy14anKg2UY6h?=
 =?us-ascii?Q?/V8VQwN0JETHA7cf3GsRZug6dY98Vp1ONeFmzUfnK2KRCFonWWu3DNk+mcyY?=
 =?us-ascii?Q?HipSrtWhkMQlWcQvlUF8yiKiTSMG67jNV5CMkS2Vbf3vhyYBvQbOCWONMnz3?=
 =?us-ascii?Q?+VXFIY99co6YhwfCEvlz55nyGS8NsPVbw/3QXRbGzuB6Lbrz3QZz5zuSbqUg?=
 =?us-ascii?Q?Kq87m0ReS9HiCli0dYas2HmT3AzTgwZPVz4T/tNNR1xl+Z8cmtQ5bsWl0Y+u?=
 =?us-ascii?Q?SmhFK/Uf0QuFO1QoKdVXC3si4CQAMG2O9U8xtcKEZR16Xw8O4c/fQATwLTca?=
 =?us-ascii?Q?djKhC4BsIArcsqg34NpFiWHjSj1YqePdq5Wa7dYtlSXPsc62QLB9MTmNjoiG?=
 =?us-ascii?Q?kn+IoN1LMNeO8loiVQT8UBQAEnzfAUbeK8rj0/Cg4KW8IqrdBGc1TaQ0C+z5?=
 =?us-ascii?Q?eFaZdtS+3bta1LLkACJLQKYA7Vkbw0+xWUx+VptVVJoBAlo7Flpy07uWrB4S?=
 =?us-ascii?Q?uH2r6Yk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?dkdhoLYUceSSIPm4+pWmfQ6LirkCXieDCvA+Cpi5kdBa5COTnd1TNn9duGNQ?=
 =?us-ascii?Q?A+PK5mYzxTJYGLA0pn5Kl6CqGff0O6GSsjyjuqtJRtP9vQiKZEu99ueBQpDz?=
 =?us-ascii?Q?X4u58IlSkNcAcgXKaUoyJ8xlFX/fHL3gz030Z2ha8dyjFah+OPLW7XYZAQwe?=
 =?us-ascii?Q?tvULfWnSjoQBxtajxMfkrBMkutrDslaVaHw2cLZtjciJHGOO8ywg/kME0KSo?=
 =?us-ascii?Q?iwMJUZx48R8udwNMXd6vnONnO/RfCRP1Oy2TI/vyd8RrS8ga2pIeanDl7tyA?=
 =?us-ascii?Q?peqHj3V512xwuehxoAsRUkGnoQZk49cOg8f3iZbUJog4pYEPILZYfUWnhawb?=
 =?us-ascii?Q?mg68zQAgIRzNFAqQTUt/veTROqfgXRpti5IlsegdyBOcuRb9DkAHXs9FKBqR?=
 =?us-ascii?Q?oWfVeYEAAd7GFZIE1N7pGrLWB3/Gy0bo4CTGKzLCUIAnUZVPeoe9Nd2T6HE9?=
 =?us-ascii?Q?Vn7cX577T0mDjJlquK44xTk+gJ/fheAxaOvtz1DANwE4u13Ju7DVg5GxCBfO?=
 =?us-ascii?Q?Di6UdwrSJc7ODeehyC5bPu7x1oTOySiQLztm2LP4CnR65aMx5f9cXWBjjmR9?=
 =?us-ascii?Q?5IOZTV07YwPPyLbOoqrdfCshVE0DDS7UgsRXRpIqaQ3Ox8lJ9PTKUoUh5OGA?=
 =?us-ascii?Q?NQGb9MxhG5Ei6uMbwDbCHIl1XVwzN5+pbOp+DgSfMyu90ryg+5OlU2sNHv2L?=
 =?us-ascii?Q?MTwQebsoyFyjgfjlOfcgBLuV/yMhaUVh5huqeOPYvXFA35ID2zRqwcpHDnos?=
 =?us-ascii?Q?l+krxY/4kJC/DeT1YEm+6FLcSu5guVgdBifi0vk+/Z5CJnzmp/CFaMwLmt3s?=
 =?us-ascii?Q?m63B0MNAXg6yoambqNU+/vqkmslKd/AuqjwjJXjH1YR32hxo1xDYpW9gV/vN?=
 =?us-ascii?Q?B+syh7ko+aUaulD0whorUW905jda71LExfeE8g9/olCDceU7oBxl6dkxxc6I?=
 =?us-ascii?Q?tM6ChHWI6Ur9i9SzQbpDitUr6C6S7388m0Psd2hiPM9b6+wuBc2XisTE/U24?=
 =?us-ascii?Q?HbBFEVXdP52gJD+kHu6VyyhPQs48ezBK8kzJjoe/9sjfGPd1gxzqt6D51mBR?=
 =?us-ascii?Q?4Qij3voZVKmdr2Qhewh8H4SCgDQpKLPGH0itrQwGem3xMvx8pfDNZvikfisB?=
 =?us-ascii?Q?4SnL+3QZSWmWcWVG7+NUwj7TaLVJ75mSu9x9tc5e+NOl0Arvc30IolRZZRa7?=
 =?us-ascii?Q?VyJWJcEjM7cV2VYaxQNhg0STmYg0qylJyTWjJu8inB4/DKyh0ZUmvgPgg3hx?=
 =?us-ascii?Q?PDiKJahCg+n+C6ovV9y37vx8oMckvlBR4LRxZkLWeSGb5JZ+EbouUYJP727C?=
 =?us-ascii?Q?4qbN3KJFa4XhGBaLxa7RvsNlPsta5nPGfp3BhiXtTt5LqqrabJTaGbsrUTVS?=
 =?us-ascii?Q?z2xFyvGWNMQFdWmoey5lugBnrHM8shm6Z3xxHfVOPiFtOuM0wXpsPeIeQNBL?=
 =?us-ascii?Q?BvVXZMOIx6mMoBsRP10Nz1n7WjB4DY6IfpVuBfBpZP7jqJWrFwtDJ4ipqULD?=
 =?us-ascii?Q?g8LeDgs2gp1XgHDTocVU4aWkyQN7edxFP5D40iaS7O8cP9ZkOHjccKWTm7/R?=
 =?us-ascii?Q?Jvjc1T9GuMAFcPswmLJo/Pb90U3D6fyXDg3DwfS94sJpItR4YfCSpd9+9miv?=
 =?us-ascii?Q?yA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50d24a4a-c52e-4e94-f022-08dd0303e009
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2024 10:22:13.4987
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5LatjY0gmUXvT88i+2h0J41sLIMaWWdraBM3T74Af2quLO/5b0OhYubRAMF07VZQ6WGaoTsEzzzHg8YBOPB6sCkWCNByPL08LJQzXYrxBpI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8552
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_022222_627182_33A11FCB 
X-CRM114-Status: GOOD (  14.20  )
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

Hi Liu Ying,

Thanks for the patch.

> -----Original Message-----
> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Li=
u Ying
> Sent: 12 November 2024 10:06
> Subject: [PATCH v6 7/7] arm64: defconfig: Enable ITE IT6263 driver
>=20
> ITE IT6263 LVDS to HDMI converter is populated on NXP IMX-LVDS-HDMI and I=
MX-DLVDS-HDMI adapter cards.
> The adapter cards can connect to i.MX8MP EVK base board to support video =
output through HDMI
> connectors.
> Build the ITE IT6263 driver as a module.
>=20
> Signed-off-by: Liu Ying <victor.liu@nxp.com>

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Cheers,
Biju


> ---
> v6:
> * No change.
>=20
> v5:
> * No change.
>=20
> v4:
> * No change.
>=20
> v3:
> * No change.
>=20
> v2:
> * No change.
>=20
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig =
index
> d13218d0c30f..9b20b75f82e2 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -901,6 +901,7 @@ CONFIG_DRM_PANEL_SITRONIX_ST7703=3Dm
>  CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA=3Dm
>  CONFIG_DRM_PANEL_VISIONOX_VTDR6130=3Dm
>  CONFIG_DRM_FSL_LDB=3Dm
> +CONFIG_DRM_ITE_IT6263=3Dm
>  CONFIG_DRM_LONTIUM_LT8912B=3Dm
>  CONFIG_DRM_LONTIUM_LT9611=3Dm
>  CONFIG_DRM_LONTIUM_LT9611UXC=3Dm
> --
> 2.34.1


