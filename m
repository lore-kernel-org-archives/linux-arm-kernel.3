Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92C0CD49211
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 11:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nk2J661McKC0HzUyaKwlsxcDLV/30jIyEavDcoq6uao=; b=5BxVV0cbUh3iJ8ka803BNozDuN
	ZkA8WTVKRN7/h3T9x2+7pRzwhRYwICGdcxOJG4pHCF40SPtdqP7U3f6Hf3p3UeW9Kpf4do4kl0aUG
	zmPpPPRz+PSPMn228JnRFSbcjdb3IXBI+88Vr1gPM/jRMIqDi1ou/9F3wKUgTFfTP4zJs2tuxe9re
	+miEVvac5rEKaMu+mxqnk7zBbJTEQJ4wNlKbYUceI2oKK4B5l3yQ31JleAVtW60qSSfLYojXDPjUq
	tbHGQLJVE4fxj9ZJkua4ci+UQdrxvmIOQ5yiFsAD49r4jMdXhJmPq0dxirH/nlK04fUM1U9cKMMbM
	O+qE3sDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD0Jp-00000009K8L-2R3X;
	Mon, 18 Nov 2024 11:53:25 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tD0Iu-00000009K1q-2Wcu;
	Mon, 18 Nov 2024 11:52:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1731930748; x=1763466748;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Nk2J661McKC0HzUyaKwlsxcDLV/30jIyEavDcoq6uao=;
  b=GnVjuqsJ00Rg46R4eQtQxlPd1XN2QN9YT5Py4T6rPCDU1cJQAynQpmvU
   N4oYJNOjiiXIdCNTALg00uzvzgRw/VZDVS7pRvfKVSGVSRXIXT94hQsXE
   RXF2CcHDXnR2l6JT9QXbltVtgpK9wxNaXR5to+jeQ20aQ2+00G65caLP6
   4/ZDlIb6UmGA+7LwC+XATbqvzG2tXp31zFx8FT2vlxJUx2WmLmDnjsw4c
   vniVX4/2i0EwnBlajwniuM1q7DGr2c2d7w/U/TKFRNnBAQnR1P1XLY/te
   yotf6HBwjYoFoxHBHRCCSrQ4UkFVjkv/HaPhYHWPb3yn7m1O3RPVOK6rY
   w==;
X-CSE-ConnectionGUID: gEb5kNABS6aju3eErGUHig==
X-CSE-MsgGUID: oO7hMwmyQdyAWheM7Hfn0Q==
X-IronPort-AV: E=Sophos;i="6.12,164,1728921600"; 
   d="scan'208";a="32806221"
Received: from mail-dm6nam11lp2172.outbound.protection.outlook.com (HELO NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.172])
  by ob1.hgst.iphmx.com with ESMTP; 18 Nov 2024 19:52:24 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eFcqvU5mtV9Gj0ur1fnKTMvV8213M+oIf5ZVQ1pM4wX0HSztXpm88hi7V8fhrNwYbwxUq29/o66ZJYFLHYJoV1d17hyVaQCyOFXezTm/TCFDPKdWVpfBkkYn1yJptKyFvP1JZZqq2cdXBL8LPDxYm0T3N4JLcXCIWNti8C8MzONhb0UeF+eIAXf8iVGeZEsYdw5Hj2BAE3bjvUptKzuUOsYApNyQVdq4tl9kBAgSWN5teVDuQv5WNSpNNe2MkfpV2L/9211G7DNV551yF5bczbteyjZJ4XofvsAdQdNqV/Q9TT1vMpC82jnX9RgHrUubGYjHmHSIAWyVg23zGNdvQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nk2J661McKC0HzUyaKwlsxcDLV/30jIyEavDcoq6uao=;
 b=bY3VXaFkUwubAppQt6ttZA1e5G6GPnrkVv0Ep5UB5SqcDncg7XCGHMUElJjKh+Fh7nsUjDwbQHtBR4pKnqz4z5WDlAuZCY42jcLtesPB6gY/7DLU+KqWHDIvq+jskklsWaenNx/2R8/ClEC9Yly2/j5JQ4k6gbE9Okxspm6z1VmUnY9jJi/BtwxuzEYFfgEg1VqtMZDUbK5ZIW4xERiEAGYimhICzI8Fd0+aLeszBDz3xkQxlMTuR/Ml8t69RmkvwL1FiwwqbpcVMkSNVDnIOTicRbXnz7O9eAJwhf5i4hhMipZlhlg/DAwX/YkaI4jUhzDtkzDPqKdCBupjWAU3pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nk2J661McKC0HzUyaKwlsxcDLV/30jIyEavDcoq6uao=;
 b=T67W2ar+e1pgv4p4kgm4hfqATKwKimtVq/uH+xI8+Hm5ptxyhykDb5BB0VG6hCXwXdRwTqts00CXnV+5J+k/ARiodHZh0J1bgUlLk29Qod/589oY7fNnEY4i8CMrZR4h6oMFYx6sJx0uuqcfL9EPQdzWeF5UqIkKlC2YZQf02EM=
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com (2603:10b6:a03:3db::16)
 by CH2PR04MB6999.namprd04.prod.outlook.com (2603:10b6:610:91::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Mon, 18 Nov
 2024 11:52:23 +0000
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8]) by SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8%5]) with mapi id 15.20.8158.023; Mon, 18 Nov 2024
 11:52:23 +0000
From: Niklas Cassel <Niklas.Cassel@wdc.com>
To: Niklas Cassel <cassel@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Damien
 Le Moal <dlemoal@kernel.org>, Sebastian Reichel
	<sebastian.reichel@collabora.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-rockchip@lists.infradead.org"
	<linux-rockchip@lists.infradead.org>
Subject: Re: [PATCH] arm64: dts: rockchip: enable the mmu600_pcie IOMMU on the
 rk3588 SoC
Thread-Topic: [PATCH] arm64: dts: rockchip: enable the mmu600_pcie IOMMU on
 the rk3588 SoC
Thread-Index: AQHbObBUx/rZxKjMEEWfkxz6RiDrFg==
Date: Mon, 18 Nov 2024 11:52:23 +0000
Message-ID: <ZzsqdYUBNP7L9iRB@ryzen>
References: <20241107123732.1160063-2-cassel@kernel.org>
In-Reply-To: <20241107123732.1160063-2-cassel@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR04MB8326:EE_|CH2PR04MB6999:EE_
x-ms-office365-filtering-correlation-id: 326e871c-5c3a-4872-7c97-08dd07c776e4
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?/N9vu4IzKoxXnDMN435UvPaZ1vPLjfXwPGtkxuHSTs5PrhusGS07HMnpOoTJ?=
 =?us-ascii?Q?nIX70dEo/2STMisn1/cEFI7rp4GILPCFx8BU0sBL5YwozyZn70QVFNAEXmuU?=
 =?us-ascii?Q?ECoM63y/YBSDGS32Bh/Y6zlgBTo22LabfLfhsmz3+JTVdgqc9OiFubamY+zo?=
 =?us-ascii?Q?2VA8i45qsbXqyPecTqD6AqkU3vvD8SlniPKBn/EUs9pj+gncHP14Iy40YeAr?=
 =?us-ascii?Q?KEklxUhJdi1Tu1C3h+PCRFiu/cy8FLdxK9qfeTTEMIBBh7q/IiFIfhxt8sSX?=
 =?us-ascii?Q?J3mwiT6dsZGE+GEutqKlx1PW614qpQoUrWhRxGTYzg3nw5aHseiLMC+m4Vp3?=
 =?us-ascii?Q?yX2ze06NOeLY4vOpC5e5Dp/shHPr9G60Id3hWetqx3wHUqsITX2lYIrfVKGr?=
 =?us-ascii?Q?PCE+qIPrBQT/uZo8HAtm8c3uFCDaG/TXikFVr0Yk0bVhq7UdUV+0sL7yohhK?=
 =?us-ascii?Q?rabOP3BKiSfU47/3/t2Zi09jq9C+q/95gObTFmXj3bmh5HkWa/v0FQBi6okn?=
 =?us-ascii?Q?6z2v+T/tEiYsKKTipLJkS76Sjoe9jkS6xyv5KoHQ3b7W0a/sL5DDA4WGDWRO?=
 =?us-ascii?Q?+3Q0WyqBWc6EGLWzUj5ZdXIEgN46LZ3E/gYD2Y6oFlGk2WJDvOtLkqgwVpga?=
 =?us-ascii?Q?nrGmYWMRC1Ir1oyir2CW3yPfc8TMX8DN904yDZRtMjNGeZpvEYSZL9xXZKCU?=
 =?us-ascii?Q?iK83p+bKNllfd5btMCfK/ZX82U26zIgS3Vl1j6NBcCfJ9/KpTfJunc+lGn/S?=
 =?us-ascii?Q?xJPbR+RFoFkZ4a66s1L1+7KGojOXqGyMDqL6RMZLSTAkLxzk0XbaA6hd6aMQ?=
 =?us-ascii?Q?NpjQlRGQzmcAB7KQL8qbavm2nTqDixmselzeJIOCa596mgxhzd1Lji13Uh+o?=
 =?us-ascii?Q?g9hULLNECmUX2WeRmBUJAkDTBF312vufaEw50XOhVuKWynDJ2XBrVJKCzldA?=
 =?us-ascii?Q?4CAAksHBWNxqp/4bFvvL8hdrsBFwfgAseAJUXB1EMIav87MjGDsLE6KS2CeE?=
 =?us-ascii?Q?SNVVEvBjig58jQEPvwL5Aq/I0MHOG3ZDE4FwIYqMyzw5GROXVXo1s7m8V/1J?=
 =?us-ascii?Q?pMbGPR/Pwt5R+Q13Jult+RlYn7S1qd4LzSt0oz/r+dVBYSPK4hGdesSwIfuU?=
 =?us-ascii?Q?OOaxKD9n5If2TVour9XPGq26s62VQlzanxguJNzx65JATOWPpeJLnFDkHyjF?=
 =?us-ascii?Q?w1uF9csdC87YFxz9h6ZAUySrYs0swAOw3Nr8ZmB934JTWLHL87+0WkHMRjnD?=
 =?us-ascii?Q?6IghLPk536mlKnYp6E4Ih3vg2KzJDSZ7hA2PntHWXHr8hWZ1yUlHuHne6xTI?=
 =?us-ascii?Q?GMOjR7TfFO4IsN/ostLG1gXyZaxePx6LDidqD1hAxy8/BrxyBj0ks6HbjjYH?=
 =?us-ascii?Q?tvY2f3E=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR04MB8326.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?HLFTtuOZqYywmHdCEBGRTsFquP+1ZSvrjRijiS5CJwO1M+vFouAEIxuoh0QB?=
 =?us-ascii?Q?CQdyXGKQUP5IMAzK80bk1H9Lje6p3Uc4zLIBAhYujORLtQf2AbKg66C5e5KR?=
 =?us-ascii?Q?p4tKuhuIGwccCURDDirTYKhgw1b5i8ZIlX22HppZ1QlPy4m77u+oNwmBQ6gw?=
 =?us-ascii?Q?6NCnUltShC+nR6E6bMQJ0YDxaRD8ciNPP+u5Y9vTZcjf0GZmsTCziCj1kSxd?=
 =?us-ascii?Q?5oWKlJvFvZMYpR7UKmhM2NwimuAnR3ke+F3tqiMbQ06NOV1IpLkTRgb2PDg2?=
 =?us-ascii?Q?woQYUkJvGsxXo9/7w5U83SVPnn0JvLURAAKhZibmiKMxw40xAn0u4AMmHdYS?=
 =?us-ascii?Q?xVETtxSd4KzVLZBjzc/yrbvzb7lk2Hj86ddSTDJlhzp6jKkPFeRfUdjtluOS?=
 =?us-ascii?Q?LPdTcAgzZPQu1QzSRi+9CVcmguXFCTd3+lhxBGt7Xf7yWadzj7xiDtiegC+b?=
 =?us-ascii?Q?Jhl1mOalNoF//xD09rhTYZEugT4UKxRN/2g2LPSrbq1g/aTQ5etvNsRZfXs6?=
 =?us-ascii?Q?C+YiXISDAk1cty6Y0i1Mt1/1m0xi+LaCeNJ+uCDS2PbIPLyhNAqKSbtu5gZT?=
 =?us-ascii?Q?COXP5lVfjkEdsG128TixKuc31JEAfnWVZD4PyHjbYLPgjialGFQKILgcjyx6?=
 =?us-ascii?Q?Svrbzr90736hIAFbzkl6PwxYpIbAOX363yrWY1wdxx5PXJkNofv2jQ4AL8hu?=
 =?us-ascii?Q?64DzJuZc61dgGsDeAXADjz3RMBj7615wQ3DNEWPF8wWywmkKy+PtqlRrN2kG?=
 =?us-ascii?Q?ZO0GUZR29ywxe/4o6ut8gN46nccM9LaXlWfeSL3373VKxcA4Nmq7QZC1RoqY?=
 =?us-ascii?Q?QKCJIAvjD5GKtT7+tT+M2QiuP/3V8jGTbyzsfV8lL9uTDWaya1nQhsPKsaHr?=
 =?us-ascii?Q?FrJXNbd4+wqD95aTpaIFLsrQUW4djpCThT0NFf+69Ihync2s2hDVYdLW9PqM?=
 =?us-ascii?Q?S3EJLeNdiKMhh7YG2bpUh+KozNfACi77Iw+6jHRcAkf1hYwk0GhGjvzU3tZK?=
 =?us-ascii?Q?VRnzP8gevTh3btXVDcwei6H0hpAVceBgHIeFugYvJlwKA8B1A3pP9ZI0nddU?=
 =?us-ascii?Q?oVrftUHoX07IoMIiQoRascO6joNbAgTCOxf2aRMfxNyvvPzQqCjIzW+d7NFU?=
 =?us-ascii?Q?7y3kISTNrk/HazwKFan3cfyhhB2dQbOPMP6mLOc0Y5LQbstsc7QB6vISm01H?=
 =?us-ascii?Q?GW49JJjdCiyDTWKybtRE8+OlGdf1ZSVmkUed+2O/QiK3UM6WIY8hJ6EiH31N?=
 =?us-ascii?Q?hv4Z+XOoXQe2LrfJIjIs2h8o+cp1BFCWf17VCmaBt3DkeGMLSMNn9B22X8HB?=
 =?us-ascii?Q?rKHO/easqxGWQSCJTtbl+9AP6E98zSlHvKTj3fjefZy3if5kHxNzJ7gEULvd?=
 =?us-ascii?Q?aJwteOmq/cibHCvciPcHvUBERNatsSFGFmWSb1/UNseH0/55tXG2yRmc9CDU?=
 =?us-ascii?Q?c2vkFGIQrYYF57hkPNsrQ4HQGT9k5k8cF2daBlzpi2rGds/wqgLwQ6yuPnX6?=
 =?us-ascii?Q?ysRkhue3OYBjkVwtt2lIOmDrK8eghNnoogCM6eHrvByFLbXhT+2zdt7C+ofe?=
 =?us-ascii?Q?DHmHR+nHI8XVtM8IGR7rbiP1780gPEo1zoOTMbSozv48joYvZNdfCi/cepUt?=
 =?us-ascii?Q?rQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <418177BA2B9C604EAC203306C4A75DD5@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: JwER3qXPrjGFgcsdz5Eu7BYp5BZ7VHAuJ0lHlp1XTgGFxQtFQ+Hn2ONghnhLK//Hi2s98DfIlyqfSLDy6Nq0wLrRHh+hw5POdx6LuF682Sxm10zahKxHXtGKVOsbPvnNu/Zv9zz2yxU87ZoAieyXhQtp7Qgi1ul1vDK18pGsGhlp3YfHk2JVfzoZLsSYUW+PcKa1QYYuSiuxrcWaWqQSu/bd4lkgArYYQXg/9nozba+h6OumqLjD7dFbYIw125IXE4t6S+RjM6NYRHheafloIxgLAQZNkdo4TSrS7kxEegVm8fGVDi/gclAZZa9l1R5vbEQESbRJI+LpNAH0AcY9fFVCGICGCKW7gYodumKRBXk+ugyXiLKisV9DSRDw44m28tTeAN//GF6qfZWuRT84rnSt7D2LHueESdF79xjTCRob7GE2g/V3AmfJqeQiTRNfpbD7CGKZwxvLVh98xUhOpRe2+LocXYZSRb8iDZCxYiuIj6OmlZ/Ym1GJRpX/AfdM0R3NLfJPsVWhWGXOG7UwHBirtt/h45WGvJU+AInDecZfHhQsf/N33m3MtLRZLHz1qZ/5+11GXQLyHzf7UN0YIMPgCSX8szzV5AoNSar4m+bkUFEkdqc22bQmHgKQRLws
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR04MB8326.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 326e871c-5c3a-4872-7c97-08dd07c776e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2024 11:52:23.0553
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VqkjoPjVyhEAH2/fYqDvhVQ8OnD1ueVPSrsi6b3IEVMhlLj6rl6rzug0U5CGvg4VmOyA/EexAxeoa11Aiz/vFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB6999
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_035228_649772_A8B14DF9 
X-CRM114-Status: GOOD (  21.00  )
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

On Thu, Nov 07, 2024 at 01:37:33PM +0100, Niklas Cassel wrote:
> Commit cd81d3a0695c ("arm64: dts: rockchip: add rk3588 pcie and php
> IOMMUs") added the rk3588 SoC's pcie IOMMU and php IOMMU as disabled.
>=20
> The mmu600_pcie is connected with the five PCIe controllers.
> See 8.2 Block Diagram, in rk3588 TRM (Technical Reference Manual).
>=20
> The five PCIe controllers are:
> pcie3x4, pcie3x2, pcie2x1l0, pcie2x1l1, pcie2x1l2.
>=20
> pcie3x4 can run in either Root Complex mode or Endpoint mode, the other
> four PCIe controllers can only run in Root Complex mode. To describe this
> we thus have six different device nodes in the device tree.
>=20
> A PCIe controller in Root Complex mode needs to specify an iommu-map, suc=
h
> that the device knows how to convert a Requester ID (PCI BDF) to an IOMMU
> master ID (stream ID). (A PCIe controller in Endpoint mode should use the
> iommus property, just like a regular device.)
>=20
> If you look at the device tree bindings for msi-map and iommu-map, you ca=
n
> see that the conversion from Requester ID to MSI-specifier data is the sa=
me
> as the conversion from Requester ID to IOMMU specifier data. Thus it is
> sensible to define the iommu-map property value similar to the msi-map,
> such that the conversion will be identical.
>=20
> Add the proper iommu device tree properties for these six device nodes
> connected to the mmu600_pcie, so that we can enable the mmu600_pcie IOMMU=
.
> (The mmu600_php IOMMU is not touched, so it is still disabled.)
>=20
> Signed-off-by: Niklas Cassel <cassel@kernel.org>
> ---

Hello Heiko,

Any chance of getting this picked up?

(If not now, then at least for 6.14.)


Kind regards,
Niklas=

