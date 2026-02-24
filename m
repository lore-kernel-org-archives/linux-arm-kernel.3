Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DFAAF4BB96
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 22:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WF9XgLedFhHji9jkHR819zIFFYjj4NcJDg0qyqWmRRU=; b=sewRLAmMhFEqLhdF+3jdFjJDj9
	yCvVGfXvGRdWps4puRFkSh0QdubBdkJT1xAnIze9VJSFaNWrvv1fYCxPgBvKxzlJRGdbuimHiZdZj
	kgYPpU/cXIzw75/ktw1WULWUsmv0UPqWE0dY7biridwLJRmRv1aSkyBd+m+EHur15irTf2LuOHbw7
	AmId3VW+/MGONM4EfYhxr8Hhet3aTGwc1RvDEHiBRHQNDW8jmZv4uBxlAyp0FuSRBnCsZzN3Fpq0k
	HURbon10AhGuu5vKjFLDEfFfPQpaPAVBbQvArfj8KWf6qKiMCGx82tr8Cx6RMZcEtpJSS+ZLv58yG
	o+A//36Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv0wo-00000002sPd-3KYq;
	Tue, 24 Feb 2026 22:32:06 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv0wl-00000002sP7-3XKr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 22:32:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L05n6FmO8iWOSLDUW38RL0lCc2BqW41f+CGDr2FGuyt8T7KWGab0eygk1QvKJ+OHB4wOTEC+VHlCqgRdIaqDMnav/ODf0aebU8O8rG1HF/mb7a6stPxJK09Ovoy0O0GaAlXMSdXx98knbNhJ2IenwS2D07r1dBk1hXRgQFLvv40j7F/ve0mv8WGa7dNqdMdTH/rdmyWmKgrUu9TMZhvVTt8WdMdlTRpjQBBgGF+P+10wmwFH+veK0Yss/2AxbkT73C+clTMu0l1nOBPTtERYqDHQxoP32etL7habpvk5traBR6myMYV2uCPky1MBUUVVs3+cFK+Sb7adqBD9gu/Jew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WF9XgLedFhHji9jkHR819zIFFYjj4NcJDg0qyqWmRRU=;
 b=sUBvclgXgiupMr5irysI/zHOI0Gbrugaqp8nshZvUjF0qdereFLOdTi4lqbmGvFHg+sAdJybT7XA3iwZNBsIGlMPnnUWicG+yUJyQKLfreMM4ssRNtiSkfrLeNCk6v3psaFZDm2NLyo8LOM8sj7hMOIOL4egZhamZDwQghDkVeb2Ya9qH9V8Us7ZTaPvkzHCmRSPY04Ovisi4k+3L6sKeQdhdgynQ2R5HORO3y6P67KzvZVFuuXR57IC3W9D4dJeftcG59exLclSDOmvIHjDks/D+4HcGAtQp24t92qa6EaNGFPI/fdl+8x57I1yu5h2ta0CfKtla9dHLiNdB5k+HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WF9XgLedFhHji9jkHR819zIFFYjj4NcJDg0qyqWmRRU=;
 b=CYTeq/bTG1Vr9pWm1LWTfvihS1xh6cMeqHqJCsjCXb3WFnjXecdYE1vK60rvYX8CX+uFLat3lTWGMqzhXcv1Rs4AnPjW6757C9YDaZdYsgM5aYKhcTKSq4fYILCsiit9eRL5OXY7LW+atzWtpkyqQLVORgc5Y2c03dB7kPu/kRG7KXARpjMYRC2jqQ5gXOSuu+1Ol27RR1RN52oUIHsK6uBSfWRJXa31MApx7/rMbcOY2zNq+6Y18XjbZ+COsOb/7e/HHYT0P0i0A1iSe8CaPVwL29ZcenvF6RMoMXUVWsSpJMMtd440j0LGV/tCjAlq6r2PhoD8t/hno6kWuj3LnQ==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by AS8PR04MB9126.eurprd04.prod.outlook.com (2603:10a6:20b:449::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Tue, 24 Feb
 2026 22:31:57 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 22:31:57 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Andrew Lunn <andrew@lunn.ch>
CC: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, Linus Walleij
	<linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet
	<corbet@lwn.net>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson
	<andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Frank
 Li <frank.li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan
	<skhan@linuxfoundation.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan
	<peng.fan@nxp.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Thread-Topic: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Thread-Index: AQHcpd1iEm1vbZv0Z0atWDKjX5zNqQ==
Date: Tue, 24 Feb 2026 22:31:57 +0000
Message-ID: <PAXPR04MB9185C388591EC3C9053C262D8974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <b4c422ce-3538-40aa-8bfa-b70f02774b5d@foss.st.com>
 <PAXPR04MB91859B642802813F908B03DA8977A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <64ef5dbf-6264-4758-a5d8-d8c52c359fcc@foss.st.com>
 <PAXPR04MB9185934EB640E8B21905FF878974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <79eb8bb8-83cb-4b24-8e56-42a53c710055@lunn.ch>
 <PAXPR04MB9185F1A67384E4886282227A8974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <91701822-df30-4feb-9e9a-4ee82e2a5d23@lunn.ch>
 <PAXPR04MB9185FD3EEC313CC2408E157F8974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <0b42e303-a2ed-4983-bee5-a4eafd6c7f36@lunn.ch>
 <PAXPR04MB918509F265757E6028B45DDC8974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <8fbb4ded-8914-4e11-aad6-038c78f2d31d@lunn.ch>
In-Reply-To: <8fbb4ded-8914-4e11-aad6-038c78f2d31d@lunn.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|AS8PR04MB9126:EE_
x-ms-office365-filtering-correlation-id: 813b504f-12f0-4811-adf0-08de73f4850e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|19092799006|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?2wOlDyJ43Qtoyma1kMSVWP8QrgJ3GE595UPpmWK09F06V6MdUEZs4I4nYW1/?=
 =?us-ascii?Q?Jw72Hnzsu0mw6YoPkup3X77HW03AoRnW3IQcvsbpwjWe4YseIeZ8vnYnBryE?=
 =?us-ascii?Q?qYSusOPj+cUODPCNDTAbwFRR71+FHTVObiCjd/scfjc3iM58qa4JHCBP7/Tc?=
 =?us-ascii?Q?o1VhEgN4p4nfm1Z6fBGp1v2+7ogxOiX6P32XGZJAz+NgdETyQkU26VxYtlal?=
 =?us-ascii?Q?DOI5YVX+P9z9IvLvSTrY/xv8fVNo5eHBjHYfxNwJ/XEfqUEOsPvv31GK6V+/?=
 =?us-ascii?Q?vAmpR9te1C44qtsEzulGidL+AN875RCWswQ08UtNia8Aw4hGr4WGvJR6Wxfo?=
 =?us-ascii?Q?MjNceOZYqokHWmL6Dk6B0I/VwpHs0cktof7HMU2bVGfn7M7lG8hv3U3+y6s6?=
 =?us-ascii?Q?emKAzGgWfZ2n4eDlJg3IW7cm4OS084pyUSRewrE4ide2s4oneEfr7ww0yKtn?=
 =?us-ascii?Q?1nsQOiURQlzrn1RU2T0z45M0T2qBTpGfZhp0ZyWLRMJbeosxK4f0n5oTiZFF?=
 =?us-ascii?Q?ChMaXPzQS0B9bdwX0tNybsrg5wSBUxaEoUapd+u9ckS8PAb1hDEI+YHj2fO5?=
 =?us-ascii?Q?u/dG3uXzAjB+8PGtqrbGbFDWO1Uw8y08m/oYU+1U0/INB60GOh9gd5OG8S+V?=
 =?us-ascii?Q?83bPBha8eM0Es9kzyA78T/n7ujiMfFFpAFKuTdOSok7Pohx8m9egWgzr1qIL?=
 =?us-ascii?Q?UQAtLtZp28lfAJKEFgY6Jh3n1XQSGKzGx0VomU+xKF25NuGO8J9RHYqEIQDd?=
 =?us-ascii?Q?Avq61rEX0ikYKAWbSmIRG3PypXtNioPeCruXsgVl9uRDRapk41slA1ZVQEEm?=
 =?us-ascii?Q?MdaZ7MKLXpT55R/uwu9tb0PAyzV71zFsvS9N5t59yhIDBVpGIiBw+ig7VtiC?=
 =?us-ascii?Q?EI9Jbcx1WVFxqssv009IjEpMyrT646U8GrbT3rjdgxTkRYa0WfbiOZYEVbJp?=
 =?us-ascii?Q?/jfKXijwDjckXRfKxz3Luo6hpsm5K5lpuBdwbiv3vF/A6mlQuVAgovBjLaC5?=
 =?us-ascii?Q?iR0hgrKDa/UBonOnUIFiFHPQNqbXLFlaCFeYEPBFiO0RHQVMfgros1ljBmPf?=
 =?us-ascii?Q?hqWXKA4//aOsqjqeCWawF5TKHaLVqEIISjpb6MQ2TzrO3uLSQju/kJl9UFy8?=
 =?us-ascii?Q?9HNKaeQlYbED5VzT0ShDqlDAOJZh8EGvCBl0SBJdMuQE8DGdYc7TIOeP+kWP?=
 =?us-ascii?Q?isKxoIR2lM7kEEuCPaf6pDDbEaLCHlTmyCrdXpVUBerplYb081ek4koiYV9I?=
 =?us-ascii?Q?TJ70If/3rQT377PdoTavsMQdrzAwUyy5j72QQH3ZRoaVEe7DimC3oVXkGVuY?=
 =?us-ascii?Q?wvMXlDBLa2pXHdM5BUTbHneWSvEab77qCadw5S/XEWH8Aixm6IeGRenXxqU3?=
 =?us-ascii?Q?h88Rrd6T5oZrnm1uRDgKmqFljcX2URsSNPw3zL2jWFUOqeN8aI0s1nM2bncf?=
 =?us-ascii?Q?SQ9U7HXSBv43756MjTBT9QzBACiu3Vr3QhkpUWJz6du3jSRGkFr7maNt6tLH?=
 =?us-ascii?Q?gfKhJao34bVts8IOTf0EtPwvU9WbvIuvt1Ul6urPMFp3QAGy2UkzAKAcoXH7?=
 =?us-ascii?Q?N2Ltiq76kBCItVVijWukJgFBLpNXrhaQD2/pvxS+vnWueCyz92lJgeYEBZOQ?=
 =?us-ascii?Q?tXzaNT+bT81iS4L2t9YBhVs=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(19092799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?7UHgU1Gj2shq/WsE1bdfp/M9TgeoaFlQlJrXe9dc0cD0xYtUGfQMxgwQ8L3K?=
 =?us-ascii?Q?OSMvV8YTkI5DggOP6pxkFgn+Bqy/ykw9kV6wor78CS4+8+BISSoqtL/obaK/?=
 =?us-ascii?Q?Xg82kAN0xvmIvTz5knWKKfkKS7pWoJB45pNY8P9tRHw8XcCcJpyy63NGc27c?=
 =?us-ascii?Q?ItIMfqWdec/j9oLxRr7tXGIeOQ01BoMJnAeh91WrU+oG+Abfy04FSpD75is3?=
 =?us-ascii?Q?g8mX/+D6WdFnlwNKLUhO0mT5ANp7jJnullZ8PjFa65UyIp2mtyk3X25LDmqG?=
 =?us-ascii?Q?RnZJlK72+pMXd9ZtqFML+mZih6SWAOR1jeM+J4Bl3uaVY60agOYSZtDsxWRC?=
 =?us-ascii?Q?sLriX62wetOeO0m2xmS35oAmOrrrG7I5e18ffxGULhhYka9vtYZ+beIPQ9uk?=
 =?us-ascii?Q?v8x5s/h0yN4GPSBXD9lKoOWTWanDDdXvCjU8eGaY8qkQqp7/z3I2AVtOjASG?=
 =?us-ascii?Q?WEcoXrvVWdq4YS+Lip9PqL0phlPU9xnyF6UfMmnOUqjEXqFJPjnh83cCNQ5U?=
 =?us-ascii?Q?KtJ11KLUAxP3aESRBNwgMDNMnH9GOqZpkfIGFXt/Flckl1X+xIj/W1j8OUPX?=
 =?us-ascii?Q?yyds4mpjPYZDEqg4b9mBawTyNH6OtyvTvWPu+7MYnSFf7pIBDiBHT0dzPE+q?=
 =?us-ascii?Q?QUXWRbda5Z/4Tc9GC2t9xLvaZv9JJrzk84YOPSZT3pyR/nA7gyAdzc5i2Npb?=
 =?us-ascii?Q?mOUhUu47q0x6TdLTprjj9X6mJFvLILsOXOFbmoPIw38okiiv9JiDARa2KdkP?=
 =?us-ascii?Q?HNpsVuh9XGT9n4Z1cLNj2UmEEbIWM9idvPbBITvRHsGEQaVHFkDEG/2f5etc?=
 =?us-ascii?Q?m20bXs3IJ8e4AqJlmWiG+BgHmIwoysz1LWvHHmwYfuFJF4bhhikzqK4iNcwA?=
 =?us-ascii?Q?gA3fNZixFE1Wh39bcWb0wXSkgV5WcTyEFx7UcOFBI/tlKgQi7mOg+WpJt9mh?=
 =?us-ascii?Q?ySDN91APzi/fEKifZU40MCcBGOKk0hG2sdjzbVHLNxsoynlo9kLswB3x9YU0?=
 =?us-ascii?Q?EKRW/jGt2i8rYQhoACxWdFXwKyculMfI2dDCsqImGjZxGwr73Biro5HGjH1k?=
 =?us-ascii?Q?Eg0s4/54S4rLwLc+vH8FJQj8vNlB1hpcklBQjP3HRNVtwsjvOjNpouWaruE9?=
 =?us-ascii?Q?mjNj8yZCeAwCiK0Rnkdx979X+6snwnmRZAsqPiGOfbdLs+IYhc0vhRezNcL9?=
 =?us-ascii?Q?dBJPY/pag3rM/+aJAf0U0uWYOPP7ICmJVS9dw8cl/kYqV0EhPIjxgz9zSvWU?=
 =?us-ascii?Q?w9XGPOFFPr70r+kqTAvf3OnRGOjPzzTkgdY8OzfdFLqKdN63hqdqwYSqivXo?=
 =?us-ascii?Q?GHk/w4Fhr95q+7xljKHPxRNjstYWbF/A99Cjg8SGYgfjA0OMdml0DDUSlqjz?=
 =?us-ascii?Q?Z/TfdZqFVcbqK3EZepEbS/KEia+qaTQWy6Ia3q8LTy1Etnubveo9V+Gg9+e1?=
 =?us-ascii?Q?PR9F8tYrgmtfAQ7WS9lu41rEaPD7ifXozCM9TzfIlWfaKgVVj2Inxa+gtwG7?=
 =?us-ascii?Q?VErhV/AONDzLIyZvVKdV4pnnrO/i6QAQ0sBA1aJ0CIB2z0WYZ/vkIWvj5/pc?=
 =?us-ascii?Q?BHnnYyyQnrng5Dx5ZFVQJilTb1FwIe4MPW0mW/Mq1z1ak2+9E/p4Zug7tflt?=
 =?us-ascii?Q?qCW/ehsanOePj1FFG2qm9/16CUDwi/37wbdOpHlSY5OIFfe9uLnBU2vETq6h?=
 =?us-ascii?Q?lllMlfASA/VYzMJQdKkkIiqNQS7BqCS/P9awWLUeecruPScjecBvRlBKMF3x?=
 =?us-ascii?Q?6f61oUnbmQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 813b504f-12f0-4811-adf0-08de73f4850e
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2026 22:31:57.4595
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LoFV/5am5MvL2Mwv3n/eoxMEeYvG3rZ6UgI9oVMCFofEnQPkCB//w8GMrMM1AjIcCB6UM1G6Px9YKbOl4J5Wrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_143203_889530_D29201E2 
X-CRM114-Status: GOOD (  17.29  )
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



> -----Original Message-----
> From: Andrew Lunn <andrew@lunn.ch>
> Sent: Tuesday, February 24, 2026 4:23 PM
> To: Shenwei Wang <shenwei.wang@nxp.com>
> Cc: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>; Linus Walleij
> <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>; Jonathan Corb=
et
> <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
> <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Bjorn Andersson
> <andersson@kernel.org>; Mathieu Poirier <mathieu.poirier@linaro.org>; Fra=
nk Li
> <frank.li@nxp.com>; Sascha Hauer <s.hauer@pengutronix.de>; Shuah Khan
> <skhan@linuxfoundation.org>; linux-gpio@vger.kernel.org; linux-
> doc@vger.kernel.org; linux-kernel@vger.kernel.org; Pengutronix Kernel Tea=
m
> <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; Peng Fan
> <peng.fan@nxp.com>; devicetree@vger.kernel.org; linux-
> remoteproc@vger.kernel.org; imx@lists.linux.dev; linux-arm-
> kernel@lists.infradead.org; dl-linux-imx <linux-imx@nxp.com>; Bartosz
> Golaszewski <brgl@bgdev.pl>
> Subject: Re: [EXT] Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO=
 driver
>=20
> Caution: This is an external email. Please take care when clicking links =
or opening
> attachments. When in doubt, report the message using the 'Report this ema=
il'
> button
>=20
>=20
> > > > + remote_cm33{
> > > > +     rpmsg {
> > > > +        rpmsg-io-channel {
> > > > +          #address-cells =3D <1>;
> > > > +          #size-cells =3D <0>;
> > > > +
> > > > +          gpio@0 {
> > > > +            compatible =3D "rpmsg-gpio";
> > > > +            reg =3D <0>;
> > > > +            gpio-controller;
> > > > +            #gpio-cells =3D <2>;
> > > > +            #interrupt-cells =3D <2>;
> > > > +            interrupt-controller;
> > > > +          };
> > > > +          gpio@1 {
> > > > +            compatible =3D "rpmsg-gpio";
> > > > +            reg =3D <1>;
> > > > +            gpio-controller;
> > > > +            #gpio-cells =3D <2>;
> > > > +            #interrupt-cells =3D <2>;
> > > > +            interrupt-controller;
> > > > +          };
>=20
> > Then how would you distinguish gpio@0 from gpio@1 on the CM33 RPMSG bus
> in the example above?
> > They are running on the same transport.
>=20
> Doesn't reg indicate the channel number? gpio@0 is on rpmsg channel 0. gp=
io@1
> is on channel 1? The reg value gets filled into struct rpmsg_channel_info=
 when
> the endpoints are created?

There is only a single RPMSG channel for the CM33 remoteproc in this exampl=
e-its name=20
is "rpmsg-io-channel". As I mentioned above, both gpio@0 and gpio@1 run ove=
r this same transport.=20
The transport here is the RPMSG channel, so multiple GPIO controllers share=
 that channel.

Thanks,
Shenwei

>=20
>    Andrew


