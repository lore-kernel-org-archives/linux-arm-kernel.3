Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 056CEE674B5
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 08:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lLib9GtyC9gGrvBWHSgYaXVKTzBImFV2N1cKQg3r+mU=; b=yZ6BdKcNQsef+UVUnqF+bIzq2l
	e05aF+PAD6+TKUsAOfSJru8XBTAAKFcCNNF8LvtJhIc78LaZYx4hl7+KSSgp+6ixR72LolfwsvbyT
	H00FfEtftO/DA8ZegKB7OHWiwIVIdXkp/jbKVlKLDPkvM8AYAcCzPKB0rBwHUm3S1JwRoeHfKNGm0
	E6G4vi2/wB0uiMpBeSYoANqJPT6WoPR9SwnzdgbUK38gxIloTW7qEEb63gM/TwB7KhTT3uUg9hgn+
	lylCmIU+doNbjIifnauVs9tNNo/kDOzGtBQ15obm5JcDm2Idsej5H7mrPdDmgim40VQ7xbrj7P3Ml
	LCtwpJ2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6moQ-00000006EJy-2Wia;
	Fri, 01 Nov 2024 08:15:18 +0000
Received: from mail-am6eur05on20608.outbound.protection.outlook.com ([2a01:111:f403:2612::608] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6mgL-00000006Cn6-11um
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 08:06:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=In6RTl1vArjiv9C/64KfK6ch4pibctXupAjaNoWp+fayAqm5uahuN/rSFA8HnVAdU63g2rTh2N+8jRgPTfoOG+EMlkPv3Z8KoCLFzOcAQl9Sv0Mv/pFAvUPuNQFbumZoE3O4hN1tAcdYI9BpeUGHy0DFnK0pZ7M9IFrv1gxlH0Ut45Z1kl56IHVOH3du3uPGt3oWolgAvxW085edbJZh8JN8jbvheRdHJ9CQMZ1YaDU/MUNlOwmvCKx2JhO9SBO/ZcEM/22v3QrxSfM+BtIDj4cIznUDrXSueM/N9zszAIDIdjd71ibYLeRYg5F+fYpkxYBzYDJKopk8fxJ9hXTYMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lLib9GtyC9gGrvBWHSgYaXVKTzBImFV2N1cKQg3r+mU=;
 b=HWEGA01g5ocztC2JGscD47Fq0Bh9M1pvGdzBNqOB62ayj0G0o9f9eOU3z9HwERBMJBQMagwn2zCW7bqXBwhqto827XFYyIMDD9hTr/CfiGjbqqfZ/iyx0TFftdTSUHH8rOHNohQtQI3Q+duYB1k/Qg5WpvVtC3oXtJVhgHkqZbhXDyu8WJUuPTLkA1BkGENqrILUTGFXj07lsKZ6dqT5f8dkTTbVM03QTiSOP1LKSEkztIwAsTOxOmNuAbtzdrQUwgzrtb3lVqWJh5QP5teHDKxSxmFwknaazX2xi7b8m2QTHa0Q4NpY9BePxCdPLGzI8lhbIBi0oAgHUrNvrU+61A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lLib9GtyC9gGrvBWHSgYaXVKTzBImFV2N1cKQg3r+mU=;
 b=w5JhotbSEBqCWbarNzBO7DwpVhl9abVUBF8fgFmgPYXQsiQ6Yi4k2W/9luIa1cnjaOXHf3cpndEC3fXhru+D6zTcyIfd2HO/VNWdIpO/DuzRpdCw60HwNnT2qD6l6uytxLw/V8ap0qy+TpWHc7/KlegpHM8mCUZy/LMlNiG0mzPBaZi9a4dNcBAlv36ZmBuLF60aGZQxQjxSCq8+/5PYFcKKvozJD1A9yN2fNogoOwDNN1OjGOFmDh1OTBmNqwMXw0iH4d4BB/lSNdRkbktstzTaaKJO1RfmE5+/9SzM+xHls02b66S8mwl33156ZwkTYkn/4p/gvrg8YAEKIQuEjA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by AM8PR04MB8034.eurprd04.prod.outlook.com (2603:10a6:20b:249::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Fri, 1 Nov
 2024 08:06:50 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.8114.015; Fri, 1 Nov 2024
 08:06:50 +0000
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>,
	Larisa Grigore <larisa.grigore@nxp.com>,
	Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev
Subject: [PATCH v5 4/7] pinctrl: s32: convert the driver into an mfd cell
Date: Fri,  1 Nov 2024 10:06:10 +0200
Message-ID: <20241101080614.1070819-5-andrei.stefanescu@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241101080614.1070819-1-andrei.stefanescu@oss.nxp.com>
References: <20241101080614.1070819-1-andrei.stefanescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR10CA0115.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::32) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|AM8PR04MB8034:EE_
X-MS-Office365-Filtering-Correlation-Id: f3275821-d580-481c-15df-08dcfa4c23a9
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|366016|7416014|376014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TXBPc0VpYk02OFlRQWtLdnRVTHFweFFuWldDb0ZQZGw0RHRpVFJXVkR1eHNL?=
 =?utf-8?B?S2Jqa2ZrOW9SYy9qcWhVZERUTm40dTlydENqb2p4SjBpOUVaZGJRUW1lVnRD?=
 =?utf-8?B?NGV0cGJ0K3JRaVh1ZzB3T0VUQU1yOUpzOXFNVEFUUWNKcVJwQnFTYmU1a1dL?=
 =?utf-8?B?Q3VXc1dMdW14akc5eTAwVWt4QXpUSUJYTkxsZU9PY3EyNnh1SjEwNXpsNDEr?=
 =?utf-8?B?eDNqTFRaWEl5dFRGdjVyam1zYTJlR1oxT2ZwS2ZBU3IvYmNEaHBheWdObEhQ?=
 =?utf-8?B?eE5BU1lVSllRRXFQUlBwWG1KRnVnSG11UUUyWVArelltRXE2ZmtYbm43bzFi?=
 =?utf-8?B?bFdEcWs3RHVzQnRiZVQwdms1R3VQcFlYeVB2Yjluckkrb3dPVlcwZjB0RWNh?=
 =?utf-8?B?QmM1STNqVHFmbFNlYUdIWjFwMzBDL0VxL0hFNGRvR0lXcUJoTThLb2RxYzI5?=
 =?utf-8?B?NzltZzRleXVQZXJpT01XaXY4alhxb3hQOWtWZm92OHpXSGRNdnNXUEtYcHhZ?=
 =?utf-8?B?NEE4ZHNkMmwzU0ZtcVlNdnR6TENiZUZRdWIwYjZIVmJRKzFEWGlsS2owQjdJ?=
 =?utf-8?B?by9rdkI3L2Q4Rkl0eTlJMjFyczcwR2ZyUUN0aWh6ZUI3dUx6OWhzcjVJd3hG?=
 =?utf-8?B?WUxHV0Z6TTNtR1AvUEFwbEk4djkrSTVFNTd2dlpDMUtYV0VMNU9rOWV6WEdT?=
 =?utf-8?B?VTYrVHlHQUYwWU5IL2pHNnJNTkFlUmU5MGtDNU91endmclpqVTlDdWwwcFZH?=
 =?utf-8?B?bGViREwyUmVHSGduOUtNK2hTTVpnWmlpYngwYUZPaXpJdmcwRXZQdzVvMjBj?=
 =?utf-8?B?MmRNT2hOWHFORm0xMytZNWxpSXZHbE1JNmhHM21UMktNMW8zVmRBc2I4eUNj?=
 =?utf-8?B?dThTVkFmM1UyaXo3bE5takNzc3UvL0dSdGV1ZkxOV2x2dU9lR2JqNXA3VkRI?=
 =?utf-8?B?TlFlY0tnTng2RCtia0ZHWStOeENWR3F3RWIzRFFENkg0SGh6amhWZE1pQXpZ?=
 =?utf-8?B?MVJWbkJJeVErbG50V3JDNHJOSmEvKzhsbFU3NkQrSWJvU09FWkFtbEYxUnNV?=
 =?utf-8?B?MlBnTGhkL1NWNlR6U1cwdnpJTjBPNzMvMVFFTm5ReVAwZlRPUUJLZWtDb0tj?=
 =?utf-8?B?N2YrWG1GTFM5Y2grdWxHK1FPdWdqZjd6bzVNNlBFZnFBOFpEdVZSaFdDUHRs?=
 =?utf-8?B?VUFaeEhPTUY2QWRBbjBtWDFYT0FBTnZ3RnplZHNXMEZjVUpFdVZZbUt2RDUy?=
 =?utf-8?B?NzI2WkFpWXd0YmNheHZaa0VrTmFLMkdhRUNnVnU2UmV2bmh0YXI1OUUrLzJW?=
 =?utf-8?B?U2htc05kUHhZV3R6RTNJY0IrcUttN3lvaHZWMGtKYlhsU2pBUTlSYXlHRXl0?=
 =?utf-8?B?VWtacStqMkE4dTlUV2NIWjduWEs3Qk04ZUlXaFFaTVU5YnRVZ0VGL01rQUZW?=
 =?utf-8?B?Z2F4TUM4ZTRTTHdGT2ZIM0JKdFd2alZnWTYyRkFDZnlBZDlWS0NaMWtyWUZX?=
 =?utf-8?B?SVQvSGtqanQwc1lwbGNsVzR3VUphNklMWkh6ZE43M3U3S3p1RHl2RUs3YW1P?=
 =?utf-8?B?UjJTQ0l3Y0RQSDAzeitIWUdESDNpNnBtVGlSUFhHdzJMaGQzZnhJNC9WSWph?=
 =?utf-8?B?UGxIWmszMDlhYnVkeVJpdjB0SVZwOHY1d0ZQR3VBaTBUeFhIci91TDJ1TFZP?=
 =?utf-8?B?QVZBbHNScDZRek1yWmw3QkYrbXpRQlhSN01ZSXdZWTZxdWY5VnNaa3dSQ0JI?=
 =?utf-8?B?ajN1MGE1WENVaDlWRTAyK01sRHVCeHdKT1phZ1gxVlRIbzg3Zld3RUdtcFpt?=
 =?utf-8?B?M2xLb2xuVDJuejN6RGpvQ1J2WG5hZTE2UDFteVFGbWJVSnN3aTRyWUR5TG56?=
 =?utf-8?Q?DTAdu3JXEVhSe?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(7416014)(376014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmhXM2h6MFoxbSsvMU5FbWM5QkRRd0l1Sm53YUN4aXdoRW9IcW9mRjErMDNi?=
 =?utf-8?B?RkdCY2RVemhpN1BXT1R4cW1IU1RLcjZnYlBFWmxxL2RiVG5vb0RqNU9QUlVP?=
 =?utf-8?B?d0Z3NHZqckpDdjNMSUM0K2xITjdmY2NyT2ZNcWxrYllVZ1REcTNhVjhkd0JT?=
 =?utf-8?B?YWptWDZlZitSaVNiK0pHQ3EwYnR5NW82TVFTWC9mR0Z0VDlKVXJSUlQyN0sv?=
 =?utf-8?B?VE9hYXVPbUN5bDJkZHV3WGxpOGlXVEFXbnB4eW82UXI1UTJQT0ZWZEFlNm9V?=
 =?utf-8?B?eGF2MHdUR0d5Z2paM3JoR3ZWNGJKbEwyanRiZnJ3MjVncUliRDlWQ1JPMWdl?=
 =?utf-8?B?VVlxWHMveHUrWXNuL2dpVHFvc2haSW50QlRYbHhtL2M1b3loYkhtd05LZldY?=
 =?utf-8?B?Q0hwSW12M3BLYTc3eHN0dVJvY1dlbnNzV09oSEZDb09IZ1BjWGovSkxpdWtR?=
 =?utf-8?B?SDdTVkl0aFB6cGpFUjhsRVY4d0NnbjN6TWxFbjR1SnN4SzVjRlpJTW5UOW01?=
 =?utf-8?B?VXFSUmhFV1FjZ0xmZG9PWXpEMUNlYWMxNUxBZGUrOVV3VU9MK3l3V2pUaTh1?=
 =?utf-8?B?QW0vamlvbTlHL0hyeC9hVkM4K1N3czlETHhRMStsZU1yYjlFV2ZBTHN0N0hT?=
 =?utf-8?B?SWdsYi9DSnpMdmlnOUppKzVUOVpveDVFTVJkUzMxUWM1MUtGOFdPYzVCa1A2?=
 =?utf-8?B?RnNMWDdoam5ralYvR0IvK2U4V1hZellRTTljVm4xWE5zeDVIMTJXUXREOXJs?=
 =?utf-8?B?S1BaM29NVEdlZ1hzeEFXZElDT1cvN0xFdUdyVUJLaGxYdUxGR3JDV3dmVDU1?=
 =?utf-8?B?NFM2eUFKZTRqMWwxWUNCcW9aUHVrMmZRalhSMXZURG1IWnR2bUllb3hQVVdO?=
 =?utf-8?B?VCt5S05DS0tYa2tMM2RIdzFmc1FibStyQXFqdXJ6MU54QUxjVUo5OTRDVFpx?=
 =?utf-8?B?eHBGa3QvcUFFRVRMa3BqL1R1RFJmaGowRUZYV2t1R1gzU0s1Tm5jdFVhZnRh?=
 =?utf-8?B?QTlBcnNVNFB3Z0NJTTNrSjc5UkZvUUtlRU80dGVQYlltbTdVM2gxUXhzMHdN?=
 =?utf-8?B?SWo0KzlFVDg3MU1NRzFrVVJndDRFemFpNFY4Z2R6eFZRUkZieEpXVFhkLytN?=
 =?utf-8?B?ekZzRGxQYldyQ2tiS3RhUmhjTTg5S3ViWFVKa01MdUg4UWIzd0JSK2cxOFly?=
 =?utf-8?B?a2pUWTVhTVIvb2ZYaDl3TzlWRW9IZ2hHaDVKT0hrQmlFbVRiUGpSSG5reG5N?=
 =?utf-8?B?QVdpeFdvMlZVTnZudUIyY1o2MVdEbUVlZEFJV29TTng5VXBBSjd0T09Vc0Rw?=
 =?utf-8?B?VUNtblFXNjdaMUxLT1hkVFVUNjNPeHRsbjQvcEpMeWcvcXR0eEl4ckJaV0N0?=
 =?utf-8?B?TzBXTlFrSTFpbjFyU2dlOXZTdU1OWWhTNEIwdnVubU05MnU4N3FNMU9FZG54?=
 =?utf-8?B?T3cxY0h3Um5kSmllbkVKbE9zSWZ4UXlDYnVQenUvMXRUNjE4OU9STE5NRFo1?=
 =?utf-8?B?cGFuVjJGVnB0dm5wcGV4MCtCSkRDdEozL1JPakFkd1JmMERzRTc5MHowZkVE?=
 =?utf-8?B?UmJqblZZcFM4aVRkWGZLK202U1pZRllFOHh4djBCQUhSN1VRVUhUOXg5eXBu?=
 =?utf-8?B?RVVKSVcvajJVTklrZDVUZUZKeFFiYjhnYmJZSVZiaEk4aUszL1NwYkVGNU5n?=
 =?utf-8?B?RlBwM2hDclFzaTdkOTFxT2ltTmxJKzdqaTgzeEtjVGlaQ214cDlLM1JkdVlG?=
 =?utf-8?B?SlRsYlhZQ1ZVZHdqR01xYXE5QjhzOWdZTDg2SFFLZVZ4VUU5M2xZVS9RK3h2?=
 =?utf-8?B?TjVVSWVhUCtNZW9NYXNYaWFZNGxXais0QVljNitUaklhMjA5bjhQdHRjRFQx?=
 =?utf-8?B?Tm8vR1dCRmRJTHRDOUI3amU3M1BxNUt0ek9ZL0p0dGJiRXg5djJGK1Vic2lj?=
 =?utf-8?B?UFZ0SXY1VnF0OWRVT3hyRWpWdTBSWC8rdHdkWDlWZUZuSUx0UDZ5NkU5Nlcz?=
 =?utf-8?B?TWJ0cEdWTWNkbTNRUER4UUtFZ2NnOURCNEM2b3RCd1RaWDFhN1plQVFmVVBL?=
 =?utf-8?B?VlJrRXFsM2V2bzlJS0tkRFhyN3dPLzNod29PbGp4Z2dsU0hpRmNGQUM4WjRQ?=
 =?utf-8?B?UGtQeXBjUk5Ra1IzUXg4cTZScXdWQWlyUGhPbHk1d2V1MlNHWDd5NmRUaUt3?=
 =?utf-8?B?R2c9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3275821-d580-481c-15df-08dcfa4c23a9
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 08:06:50.4006
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w3QqhiZapPZNU6imVXEKN0cx2KhOZ8fXfznUaDRKU40DIcenRsXLze3XT4QunbAtW5Nmr2gvUkHVDIFEGr8uhzg+OUJwOiVBsIvNnpl5g9s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_010657_472751_956C2DC8 
X-CRM114-Status: GOOD (  17.91  )
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

The SIUL2 module is now represented as an mfd device. The pinctrl driver
is now an mfd_cell. Therefore, remove its compatible and adjust its
probing in order to get the necessary information from its mfd parent.

Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
---
 drivers/pinctrl/nxp/pinctrl-s32.h   |  1 +
 drivers/pinctrl/nxp/pinctrl-s32cc.c | 75 +++++++++++------------------
 drivers/pinctrl/nxp/pinctrl-s32g2.c | 23 ++-------
 3 files changed, 33 insertions(+), 66 deletions(-)

diff --git a/drivers/pinctrl/nxp/pinctrl-s32.h b/drivers/pinctrl/nxp/pinctrl-s32.h
index add3c77ddfed..829211741050 100644
--- a/drivers/pinctrl/nxp/pinctrl-s32.h
+++ b/drivers/pinctrl/nxp/pinctrl-s32.h
@@ -38,6 +38,7 @@ struct s32_pinctrl_soc_data {
 	const struct pinctrl_pin_desc *pins;
 	unsigned int npins;
 	const struct s32_pin_range *mem_pin_ranges;
+	const struct regmap **regmaps;
 	unsigned int mem_regions;
 };
 
diff --git a/drivers/pinctrl/nxp/pinctrl-s32cc.c b/drivers/pinctrl/nxp/pinctrl-s32cc.c
index 501eb296c760..709e823b9c7c 100644
--- a/drivers/pinctrl/nxp/pinctrl-s32cc.c
+++ b/drivers/pinctrl/nxp/pinctrl-s32cc.c
@@ -12,6 +12,7 @@
 #include <linux/gpio/driver.h>
 #include <linux/init.h>
 #include <linux/io.h>
+#include <linux/mfd/nxp-siul2.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
@@ -44,12 +45,6 @@ enum s32_write_type {
 	S32_PINCONF_OVERWRITE,
 };
 
-static struct regmap_config s32_regmap_config = {
-	.reg_bits = 32,
-	.val_bits = 32,
-	.reg_stride = 4,
-};
-
 static u32 get_pin_no(u32 pinmux)
 {
 	return (pinmux & S32_PIN_ID_MASK) >> S32_PIN_ID_SHIFT;
@@ -85,14 +80,15 @@ struct s32_pinctrl_context {
 	unsigned int *pads;
 };
 
-/*
+/**
+ * struct s32_pinctrl - private driver data
  * @dev: a pointer back to containing device
  * @pctl: a pointer to the pinctrl device structure
  * @regions: reserved memory regions with start/end pin
  * @info: structure containing information about the pin
  * @gpio_configs: Saved configurations for GPIO pins
  * @gpiop_configs_lock: lock for the `gpio_configs` list
- * @s32_pinctrl_context: Configuration saved over system sleep
+ * @saved_context: Configuration saved over system sleep
  */
 struct s32_pinctrl {
 	struct device *dev;
@@ -123,14 +119,13 @@ s32_get_region(struct pinctrl_dev *pctldev, unsigned int pin)
 	return NULL;
 }
 
-static inline int s32_check_pin(struct pinctrl_dev *pctldev,
-				unsigned int pin)
+static int s32_check_pin(struct pinctrl_dev *pctldev, unsigned int pin)
 {
 	return s32_get_region(pctldev, pin) ? 0 : -EINVAL;
 }
 
-static inline int s32_regmap_read(struct pinctrl_dev *pctldev,
-			   unsigned int pin, unsigned int *val)
+static int s32_regmap_read(struct pinctrl_dev *pctldev, unsigned int pin,
+			   unsigned int *val)
 {
 	struct s32_pinctrl_mem_region *region;
 	unsigned int offset;
@@ -145,7 +140,7 @@ static inline int s32_regmap_read(struct pinctrl_dev *pctldev,
 	return regmap_read(region->map, offset, val);
 }
 
-static inline int s32_regmap_write(struct pinctrl_dev *pctldev,
+static int s32_regmap_write(struct pinctrl_dev *pctldev,
 			    unsigned int pin,
 			    unsigned int val)
 {
@@ -163,7 +158,7 @@ static inline int s32_regmap_write(struct pinctrl_dev *pctldev,
 
 }
 
-static inline int s32_regmap_update(struct pinctrl_dev *pctldev, unsigned int pin,
+static int s32_regmap_update(struct pinctrl_dev *pctldev, unsigned int pin,
 			     unsigned int mask, unsigned int val)
 {
 	struct s32_pinctrl_mem_region *region;
@@ -475,8 +470,8 @@ static int s32_get_slew_regval(int arg)
 	return -EINVAL;
 }
 
-static inline void s32_pin_set_pull(enum pin_config_param param,
-				   unsigned int *mask, unsigned int *config)
+static void s32_pin_set_pull(enum pin_config_param param,
+			     unsigned int *mask, unsigned int *config)
 {
 	switch (param) {
 	case PIN_CONFIG_BIAS_DISABLE:
@@ -838,20 +833,21 @@ static int s32_pinctrl_parse_functions(struct device_node *np,
 static int s32_pinctrl_probe_dt(struct platform_device *pdev,
 				struct s32_pinctrl *ipctl)
 {
+	struct nxp_siul2_mfd *mfd = dev_get_drvdata(pdev->dev.parent);
 	struct s32_pinctrl_soc_info *info = ipctl->info;
-	struct device_node *np = pdev->dev.of_node;
-	struct resource *res;
-	struct regmap *map;
-	void __iomem *base;
-	unsigned int mem_regions = info->soc_data->mem_regions;
+	unsigned int mem_regions;
+	struct device_node *np;
+	u32 nfuncs = 0, i = 0, j;
+	u8 regmap_type;
 	int ret;
-	u32 nfuncs = 0;
-	u32 i = 0;
 
+	np = pdev->dev.parent->of_node;
 	if (!np)
 		return -ENODEV;
 
-	if (mem_regions == 0 || mem_regions >= 10000) {
+	/* one MSCR and one IMCR region per SIUL2 module */
+	mem_regions =  info->soc_data->mem_regions;
+	if (mem_regions != mfd->num_siul2 * 2) {
 		dev_err(&pdev->dev, "mem_regions is invalid: %u\n", mem_regions);
 		return -EINVAL;
 	}
@@ -861,26 +857,11 @@ static int s32_pinctrl_probe_dt(struct platform_device *pdev,
 	if (!ipctl->regions)
 		return -ENOMEM;
 
+	/* Order is MSCR regions first, then IMCR ones */
 	for (i = 0; i < mem_regions; i++) {
-		base = devm_platform_get_and_ioremap_resource(pdev, i, &res);
-		if (IS_ERR(base))
-			return PTR_ERR(base);
-
-		snprintf(ipctl->regions[i].name,
-			 sizeof(ipctl->regions[i].name), "map%u", i);
-
-		s32_regmap_config.name = ipctl->regions[i].name;
-		s32_regmap_config.max_register = resource_size(res) -
-						 s32_regmap_config.reg_stride;
-
-		map = devm_regmap_init_mmio(&pdev->dev, base,
-						&s32_regmap_config);
-		if (IS_ERR(map)) {
-			dev_err(&pdev->dev, "Failed to init regmap[%u]\n", i);
-			return PTR_ERR(map);
-		}
-
-		ipctl->regions[i].map = map;
+		regmap_type = i < mem_regions / 2 ? SIUL2_MSCR : SIUL2_IMCR;
+		j = i % mfd->num_siul2;
+		ipctl->regions[i].map = mfd->siul2[j].regmaps[regmap_type];
 		ipctl->regions[i].pin_range = &info->soc_data->mem_pin_ranges[i];
 	}
 
@@ -918,13 +899,13 @@ static int s32_pinctrl_probe_dt(struct platform_device *pdev,
 int s32_pinctrl_probe(struct platform_device *pdev,
 		      const struct s32_pinctrl_soc_data *soc_data)
 {
-	struct s32_pinctrl *ipctl;
-	int ret;
-	struct pinctrl_desc *s32_pinctrl_desc;
-	struct s32_pinctrl_soc_info *info;
 #ifdef CONFIG_PM_SLEEP
 	struct s32_pinctrl_context *saved_context;
 #endif
+	struct pinctrl_desc *s32_pinctrl_desc;
+	struct s32_pinctrl_soc_info *info;
+	struct s32_pinctrl *ipctl;
+	int ret;
 
 	if (!soc_data || !soc_data->pins || !soc_data->npins) {
 		dev_err(&pdev->dev, "wrong pinctrl info\n");
diff --git a/drivers/pinctrl/nxp/pinctrl-s32g2.c b/drivers/pinctrl/nxp/pinctrl-s32g2.c
index 440ff1879424..9c7fe545cc85 100644
--- a/drivers/pinctrl/nxp/pinctrl-s32g2.c
+++ b/drivers/pinctrl/nxp/pinctrl-s32g2.c
@@ -10,6 +10,7 @@
 #include <linux/err.h>
 #include <linux/init.h>
 #include <linux/io.h>
+#include <linux/mfd/nxp-siul2.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
@@ -713,12 +714,10 @@ static const struct pinctrl_pin_desc s32_pinctrl_pads_siul2[] = {
 static const struct s32_pin_range s32_pin_ranges_siul2[] = {
 	/* MSCR pin ID ranges */
 	S32_PIN_RANGE(0, 101),
-	S32_PIN_RANGE(112, 122),
-	S32_PIN_RANGE(144, 190),
+	S32_PIN_RANGE(112, 190),
 	/* IMCR pin ID ranges */
 	S32_PIN_RANGE(512, 595),
-	S32_PIN_RANGE(631, 909),
-	S32_PIN_RANGE(942, 1007),
+	S32_PIN_RANGE(631, 1007),
 };
 
 static const struct s32_pinctrl_soc_data s32_pinctrl_data = {
@@ -728,22 +727,9 @@ static const struct s32_pinctrl_soc_data s32_pinctrl_data = {
 	.mem_regions = ARRAY_SIZE(s32_pin_ranges_siul2),
 };
 
-static const struct of_device_id s32_pinctrl_of_match[] = {
-	{
-		.compatible = "nxp,s32g2-siul2-pinctrl",
-		.data = &s32_pinctrl_data,
-	},
-	{ /* sentinel */ }
-};
-MODULE_DEVICE_TABLE(of, s32_pinctrl_of_match);
-
 static int s32g_pinctrl_probe(struct platform_device *pdev)
 {
-	const struct s32_pinctrl_soc_data *soc_data;
-
-	soc_data = of_device_get_match_data(&pdev->dev);
-
-	return s32_pinctrl_probe(pdev, soc_data);
+	return s32_pinctrl_probe(pdev, &s32_pinctrl_data);
 }
 
 static const struct dev_pm_ops s32g_pinctrl_pm_ops = {
@@ -753,7 +739,6 @@ static const struct dev_pm_ops s32g_pinctrl_pm_ops = {
 static struct platform_driver s32g_pinctrl_driver = {
 	.driver = {
 		.name = "s32g-siul2-pinctrl",
-		.of_match_table = s32_pinctrl_of_match,
 		.pm = pm_sleep_ptr(&s32g_pinctrl_pm_ops),
 		.suppress_bind_attrs = true,
 	},
-- 
2.45.2


