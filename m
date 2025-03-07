Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08110C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 10:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ya6HZAYQcqRbYFvGThCbCZe2yKbmSsTePP8UQLATyI=; b=ZjoGviAXG8wQ4FWw/B594ykdn9
	nw+wdUGm66NXBpWaDvtLI28TRFDSDUgr0HJAgSDrNWl+PL22O51sc9a2M0UTEWES0fsmZfo2xFx3k
	RSJt9/vbppnhQefAZT+F9sBmXo42YDI7MBMhFsdMsHBie2bCpazCJjRaelhPL6e25P21WsoaMXe5p
	wvRQ3JkmlsfCAZ0Q2jWGv6VIIGfL6wErLinvEPAVrZVkyRBgyrIgvx9KOOcbT8CUpZ5+u+uiiOpHz
	hm2CDeWuiVrrODkw865hQKDxQ+pG5Oiv6uC3ZcWq7b4/ej9htk0JOwmq9Ox+7nEPZTbOgvNG6cSvZ
	0jsIr5QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqUh3-0000000Doeq-0Vq5;
	Fri, 07 Mar 2025 10:12:37 +0000
Received: from mail-db8eur05on20614.outbound.protection.outlook.com ([2a01:111:f403:2614::614] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqUfQ-0000000DoVN-2Jr5;
	Fri, 07 Mar 2025 10:10:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y3E+ahmO7+LfIb2LUPFGXxzBqJUayrxV9ocFP+wgCt1ByjXvxGxXwKZFbAZWAVVrGrtn8CvhH6jDhZxhLJIExqRl42fC813kosWDhYow9bu2gSzJKgvxkqQmQWT4OtegnFmuCTSVCarPaxP8PICW13Qgcls1WCyL+xp5m/kWBfE7e60N9vq5mlJMTivZ/+lElP3OF2w66DiUJQUSjEPieTtFv+y9oadIpgdNL48jBAoYXjpLhF8NB82pf/fSR/RWbnVPvd8bjC99ikWnTukwBrXW+292nXaJieNAzQPsCJ904VKmZIztYsofhos6ulvmcccNdfueCInl8FPXL1opRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ya6HZAYQcqRbYFvGThCbCZe2yKbmSsTePP8UQLATyI=;
 b=SEoC1EnE7LagMRHY+kEaDHEWR9dqjNUlvPGDHikkBGBbzwyp0lwEz3VuOgqI8M9Cm/Im2kks09LxSTFRc9ik5jPCOJuavJcZZxPmA/Kol3+LBzPI5y7BeYCN0hqyxfeP/0OYBD2iV8jK7oQTIY01P7Q6xypARTVBgcujZTbW7kVwD87DkxNkQNvQxW6FK6cxOVLyABgFFkaw9cUZayjt6ZCJ2s7zrMhMr8DyPPb6knByIm8h4tQmHx84Ks3RAOQHHhuVCvLU/4tqm3dx9PIN7NLW+MfAwwYzYSADJVJzhgANScyJj7QAfSUQsgqIGE9j7JIFMB7bLf3uw9Jy/dfAKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ya6HZAYQcqRbYFvGThCbCZe2yKbmSsTePP8UQLATyI=;
 b=KCzNt062+cJ38H66sC5uRIW4dfDkjmjjuicvFBf0+sBjQtuBZ0svCMYBzije2vKMKIH+viUeqSs+VV+9hk/bLWL8KQV/H2I3V7JLjGm5LUWAhECwZb4RTqnkJLLl7kee0WWWVzCYjtev9H45XQfQ2RYUDG3n94HO15miZb6fNu4R/GHirlkqLwVbl/i4sDGnzI+Cr8rmGn33pZbaELHIxDaugZy6g4PfAnYTp6F24RfZqITvzUDh9uKcPHEtq0AxRo00EWd5woAL0hJu3U1e6KpNByxwwxkKMbUyVlNYKzbgWvcHjc/nh4zogp9YOai8eQNlsLlkCJGyH6KQ8A4fJA==
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by DB9PR04MB9723.eurprd04.prod.outlook.com (2603:10a6:10:4ce::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.20; Fri, 7 Mar
 2025 10:10:50 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb%7]) with mapi id 15.20.8511.019; Fri, 7 Mar 2025
 10:10:50 +0000
From: Jacky Bai <ping.bai@nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>
CC: "rafael@kernel.org" <rafael@kernel.org>, "daniel.lezcano@linaro.org"
	<daniel.lezcano@linaro.org>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, "james.morse@arm.com"
	<james.morse@arm.com>, "d-gole@ti.com" <d-gole@ti.com>, "anup@brainfault.org"
	<anup@brainfault.org>, "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "aou@eecs.berkeley.edu"
	<aou@eecs.berkeley.edu>, "linux-pm@vger.kernel.org"
	<linux-pm@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "khilman@baylibre.com" <khilman@baylibre.com>,
	"quic_tingweiz@quicinc.com" <quic_tingweiz@quicinc.com>,
	"quic_yuanjiey@quicinc.com" <quic_yuanjiey@quicinc.com>
Subject: RE: [PATCH v4] cpuidle: Init cpuidle only for present CPUs
Thread-Topic: [PATCH v4] cpuidle: Init cpuidle only for present CPUs
Thread-Index: AQHbjzc48QAeOzv5L02tuSUugwb8UbNnbkUAgAAAI3CAAAOqAIAAACvA
Date: Fri, 7 Mar 2025 10:10:50 +0000
Message-ID: <AS8PR04MB86425524495B3FEF19F32E6B87D52@AS8PR04MB8642.eurprd04.prod.outlook.com>
References: <20250307080303.2660506-1-ping.bai@nxp.com>
 <Z8rBYuDiIyo8y6HT@bogus>
 <AS8PR04MB86425B7CEE7443F822A2DBCA87D52@AS8PR04MB8642.eurprd04.prod.outlook.com>
 <Z8rEkgYoThJAJdPV@bogus>
In-Reply-To: <Z8rEkgYoThJAJdPV@bogus>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB8642:EE_|DB9PR04MB9723:EE_
x-ms-office365-filtering-correlation-id: 03c2feb5-1f88-43ca-979c-08dd5d60566e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?0hMl5HA8+u0O3DavDQGgX7+qEpk4b8KGuFsKC1TF3PANAO/X2hlh9yeyeY64?=
 =?us-ascii?Q?46ZYsxPQy7EzSqFBPcEFyKonrWF5gxYLLBnwjqsT8v5KrYwk+TYoTp4BQSTf?=
 =?us-ascii?Q?3BMzZhnJNVTcobSfGrBw1ilg/5dKv5bQNsVWuLx7CCl+466pzih558P6Sg7t?=
 =?us-ascii?Q?sxS/qKMfc+gexczDudiZ/S/Uc4KtOSmCSyFnGKdEn+4eZzCOPuQMhf2nQjjb?=
 =?us-ascii?Q?86ESgwveztMFWEGvpm/sZ8++OIURF4hG5Th1WOVp12NRvkRjNjax4UxMDypn?=
 =?us-ascii?Q?AAsPd0txuMHi2NLHXvqsmhI9syb/d0LufUn0AtlCyID0yzBFipIc9dtL1HQf?=
 =?us-ascii?Q?WTUkCpqdFRXsxc51dXh7H0/9tJ30ej7WCm+VOsBBNQfK55uf5Zlp1Wx+IZWH?=
 =?us-ascii?Q?WJLfnzRKs8YwJP7Mn13x19YSwIaoIXzbcGN1WBZQfVB6SOLE0AGejeRbj3KZ?=
 =?us-ascii?Q?5o5BmMg/SEnQHyAdqMI7spdPIpiykXef4Dfrv/VU77BswbfaPEDLoZNYFKl+?=
 =?us-ascii?Q?g10stsqpg19NS6NUOqgjU4+LflZXFoZUMdGUmExTo/g8amT5ZotXAkU3Zw4C?=
 =?us-ascii?Q?a/ToJaszDCv1RoT+TuFW85/UIASEmAzlutINVGn+xMYmsnbUfSQAv/9TQjxh?=
 =?us-ascii?Q?s2TJjmn5cJAD51/uYvQ40QqhTnbdpZ2G+avVokQ4qJjJqVUwkQMxBCHAebJH?=
 =?us-ascii?Q?JVSoXH3MokF+0y51gQ5wMbNLOUf7plaMi6aTvUcu28rLgZa+AE0YSqxj2E0q?=
 =?us-ascii?Q?9JEIkPq5o3NI21Cw+l4i7ikQmJDXbfo6h9ChkEhXkWCM4VGa6hhRD35xFW80?=
 =?us-ascii?Q?dfjb6YKo07tDhL14MnD5t/aVA5tsF0MREehfAPu5aH+n8h4NyFDfPNWiec+F?=
 =?us-ascii?Q?I8DGiidUYVXflnAtRgNjSNI0tUJxGVGlCSRsu3yy5FH+ecouRof2mMiNC8KZ?=
 =?us-ascii?Q?LfaGbASrEN4LGKM8PTUXK5oE9InmK41VdER6HYqy72+0MwjpPSW+Irvax1lG?=
 =?us-ascii?Q?9Ag+jtVXva8Lvb1X5YXMZU1V/8xKOmbJE6TcZI5RWH/2Vtg8Hgns3kOs313/?=
 =?us-ascii?Q?EfjoCxx0a8yvtnYkgnLE7MBzf3Ay7UHAeoexAE46DbRx4amH2X80qVyaN11H?=
 =?us-ascii?Q?ExTV/w3bhWGxurkmQQacWplUbVmtEt7bkCk9fUNWw21PcsBYS0dKLqFjoe02?=
 =?us-ascii?Q?w/mrsWgWJITOTcyUXNOqehJrXl1j09JL6k+UHwvmRSHRnW8+Vw5VKgDiOVhg?=
 =?us-ascii?Q?7Inn+hg9xvgxKy20PIrhsmy870IHx4K47/72czaM5cgss5hQWf0QTtm9VjY/?=
 =?us-ascii?Q?dTCiUxE4tmRXP3IeGLpnPta1gNKGTo/qT5lI/A0nhGgXkufFjytiF2QZLgKg?=
 =?us-ascii?Q?/gk+l3G2a9nHHRbXIsUgCO/WMGW+4Vpx1fG5Owy2SZj3kLCU/2Dd2hlGUc9D?=
 =?us-ascii?Q?4oCEn7dxcJyA3qkEuOW446To+oUhyDdw?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?E6vYFsphWUoU0Z9bRZMEqyat67EtguYx1grI7IxDzD9GQrst0H2zRsinrqmd?=
 =?us-ascii?Q?6eB+fiJQGH7MxkWiwd8Gpc7oMmlvYmeG8bRBX9DoaJOW7zoq8wyqTISRxR5O?=
 =?us-ascii?Q?H0NAhzuzS2CO8ZUXSgMBE/d9QP+g2cw1SAU3erDWDEaVitR68wnc0qpbkBOj?=
 =?us-ascii?Q?gao9pWKFy3KMAIkVMMTXY5H4GuuULeXaIfbqG9XZUWtfDFZ8Q8ULIbm6bo99?=
 =?us-ascii?Q?blXoqtMSdAPtm35iLatmRtDXn6eQG93xO3FUtKPu9MCYcvl3GzuqzrZDd4Pg?=
 =?us-ascii?Q?nPuMX/Mo+/N1ivkSZBJO4wTF8Kg3BoNuOuJNpvWP4afXrwtZeC75+weVw5fc?=
 =?us-ascii?Q?S4yvgKb8sk1zbsyM4+zj+EC59ILmORNm+ziaT7x6/hPVlq0perZdw4A48WmI?=
 =?us-ascii?Q?tgpHIElwN0PdEs2eR37XIV0c4l4CiC/ECuqjB+FQSzKRjSAVLySYVfokLT4s?=
 =?us-ascii?Q?aNg5wzbdmDmubnKaPgsi8XuXqtpgthkLFmSC1Yrtqy01Snvwwgjk/nHkYn4C?=
 =?us-ascii?Q?oW7CMl2LyoWZrNWMK4bDedqQ45jcX3BHe7o+4VFsSiVuVNlCGoykvivM86wq?=
 =?us-ascii?Q?JfWgjv/+o6lRMnNcX2aNMVhn382AsXv4kFBLxBLiRKyKEi20ce9NUQyqdVsu?=
 =?us-ascii?Q?Iss5mUutyzxthpEXATrBX3xhcrvrx9u31UlIyhky5vz2l3pqxV2F4I1D7lxm?=
 =?us-ascii?Q?dyFVazloa2g/OwQCU0XPuDlFCyaO4B1ysEXnufSIXHC0xNAq0w/NF5gR9b4m?=
 =?us-ascii?Q?/maVPEfP4p8nEraURIVlyobCjSCSQ8FmwDCm5DuyEjyShl1pbd6mwBrUqLPi?=
 =?us-ascii?Q?R0kT4KgixJUYD/hengLNU6/PxBD3F21XV4fEpeQ4eu2iBGgINYs2gh2tkyUa?=
 =?us-ascii?Q?fPhgvcTiLha+zyVoBmtI17mMf83ZkuX4Rg2eoj1Vt+1Y1rrgLBQHluf6ro6u?=
 =?us-ascii?Q?DKck7Qab3MLA0MC2GVqMzpiIFDjtknRGI195+ira0Ej6ha8GbqVdnfSNint/?=
 =?us-ascii?Q?EaoPqroiNEU8h17YHGIll6SReMV/MPPJOOB1l0Vq3ejOIz59gH5tMRRMJnVh?=
 =?us-ascii?Q?w2uT/4d4YOyXPilrxhKYIs1F4Wx5zSOrKNjEy1oULH69shTf8Xw4GMXgnGCn?=
 =?us-ascii?Q?W2EZktF968cO6WJDfryhHLtU5wLG5G81iMiZBRrAyYQ86Tfv/YrZTNC5cQ9b?=
 =?us-ascii?Q?sjIjC6u0XwBH+qBanl5kmO3dSRN+e03ofyzqY07NzqeB0LDBkL7NqmTjlL1B?=
 =?us-ascii?Q?7lO4lBNeATVXPVqfLHNqUXo7V3DpoIAOtEF5kQ540AWyTzOivYzgcqiUzsVv?=
 =?us-ascii?Q?vZJSExdpQl7QG5+HzhlmM4bQXcOgbLA2USPtY21elabTiviDcKpckxdcKNcb?=
 =?us-ascii?Q?CTRco3e1fAq+qRxOlk66xR+ZMZceSpAVXcfpPt3oRs/hzbiZRQs+HLwfIBVD?=
 =?us-ascii?Q?19CdtJ5DPy9MRhkPlm+GMEuFk+FMd4Z7iYYnlnPQe2P7avszscYSE4LKafHO?=
 =?us-ascii?Q?1Rs4dBmxl6eQeIIR55/HAR8fwUUdENn8xfiQCDxeObRONgmIjLat9UHW3Ps0?=
 =?us-ascii?Q?bSn9yxzr1piZOo3FGpY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03c2feb5-1f88-43ca-979c-08dd5d60566e
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2025 10:10:50.4763
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wWjGssMQFo7zCYlZdA2AHQ9xzIyFCxYq/VVdbzaYDFOhTMowqnNk/U+sgk3Q3BtMMjK3UvlfXnITQwCUt2i2GQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9723
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_021056_594585_E582EEA1 
X-CRM114-Status: GOOD (  29.01  )
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

> Subject: Re: [PATCH v4] cpuidle: Init cpuidle only for present CPUs
>=20
> On Fri, Mar 07, 2025 at 10:02:14AM +0000, Jacky Bai wrote:
> > Hi Sudeep,
> >
> > > Subject: Re: [PATCH v4] cpuidle: Init cpuidle only for present CPUs
> > >
> > > On Fri, Mar 07, 2025 at 04:03:03PM +0800, Jacky Bai wrote:
> > > > for_each_possible_cpu() is currently used to initialize cpuidle in
> > > > below cpuidle drivers:
> > > >   drivers/cpuidle/cpuidle-arm.c
> > > >   drivers/cpuidle/cpuidle-big_little.c
> > > >   drivers/cpuidle/cpuidle-psci.c
> > > >   drivers/cpuidle/cpuidle-riscv-sbi.c
> > > >
> > > > However, in cpu_dev_register_generic(), for_each_present_cpu() is
> > > > used to register CPU devices which means the CPU devices are only
> > > > registered for present CPUs and not all possible CPUs.
> > > >
> > > > With nosmp or maxcpus=3D0, only the boot CPU is present, lead to th=
e
> > > > failure:
> > > >
> > > >   |  Failed to register cpuidle device for cpu1
> > > >
> > > > Then rollback to cancel all CPUs' cpuidle registration.
> > > >
> > > > Change for_each_possible_cpu() to for_each_present_cpu() in the
> > > > above cpuidle drivers to ensure it only registers cpuidle devices
> > > > for CPUs that are actually present.
> > > >
> > > > Fixes: b0c69e1214bc ("drivers: base: Use present CPUs in
> > > > GENERIC_CPU_DEVICES")
> > > > Reviewed-by: Dhruva Gole <d-gole@ti.com>
> > > > Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
> > > > Tested-by: Yuanjie Yang <quic_yuanjiey@quicinc.com>
> > > > Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> > > > ---
> > > >  - v4 changes:
> > > >   - add changes for other cpuidle driver that has the similar issue
> > > >     as cpuidle-pcsi driver.
> > > >
> > > >  - v3 changes:
> > > >   - improve the changelog as suggested by Sudeep
> > > > ---
> > > >  drivers/cpuidle/cpuidle-arm.c        | 8 ++++----
> > > >  drivers/cpuidle/cpuidle-big_little.c | 2 +-
> > > >  drivers/cpuidle/cpuidle-psci.c       | 4 ++--
> > > >  drivers/cpuidle/cpuidle-riscv-sbi.c  | 4 ++--
> > >
> > >
> > > Why have you spared drivers/cpuidle/cpuidle-qcom-spm.c ? IIUC the
> > > issue exists there as well.
> > >
> >
> > For qcom-spm driver, it has below code logic to handle no cpu device
> > case, and no rollback to cancel the whole cpuidle registration. So I ju=
st leave
> it as it is.
> > Do we need to update it?
> >
> > for_each_possible_cpu(cpu) {
> >         ret =3D spm_cpuidle_register(&pdev->dev, cpu);
>=20
> Did you look into this function ?

Yes, at the very beginning of this function it will check if the cpu device
is available, if not, directly return -ENODEV, something I misunderstood?

BR
>=20
> --
> Regards,
> Sudeep

