Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CD98C44524
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 04:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:
	Content-Type:References:In-Reply-To:Subject:Cc:To:From:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=21eHkPb9elWCcZRRBILG3R0wmtnyvhsexqW+CWKUm1c=; b=iRp+3eum30/fiphtFvVV5w4vgC
	/Iwd3PWiEUvDPHK8EzCsUKm+9DOluAZC/pEETpNdeeatWEd83v1LAF9tSaBxxF/mCvGWdQdch38rt
	cCN9NMf8zAD3TBfkWNOmGR6VeXDTEN+h6wGBgv2kIA+vdZKGwBNeUEFvfju96KpHqN5/hVB/BrSr5
	T6tYkn+6gC297oNAAqFEASNFbgpQQvFF/TP5Z8ZfLImU1e3Yl+QcCwxCRsWn2Yx5TFYAcZFSSChYf
	qiGs/LD4/O+j4X7chyM+9XlT9XXJZLtCmxebuxGNVS4LDGCk0WBCo51uK/rg+chqyUrPA6/H/KyEw
	X6NhjNbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmkgG-0000000DNAQ-3FpF;
	Thu, 23 Jul 2026 04:05:08 +0000
Received: from mail-japaneastazon11010011.outbound.protection.outlook.com ([52.101.229.11] helo=TY3P286CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmkgD-0000000DNA0-3TnO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 04:05:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rmu5RwaMii87oQU0ysed+a4DB4YmR3u6K5HQXOVaO9RWyxIs3mMeaCrBTP0nSHHl+C3ksTEsTYZfn1kAS/GhrKuR0bS2WQlcHXYh7tcxYc7PIIuu5mF+4ueUQx/e8jRjyi7T4FDTJ14JYE8QVOTUtGzkYWhJNcdnalg9QKGm3cPCew+cXHwasfGn0d9pKn1Zuhk2BvcpuHCY7XjwXPKFrgyRauvXtkAT+nfMyvFlgteIRBwo/GtWMwnMBnUxwY+MAQE/szwa0tBUL6i+j5g2FHkY7XUa1ZlottoOTuYX3SVsGD5dRgdnp1wckoIsyNylb67md7X6jEWYzuSJ48jDRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=21eHkPb9elWCcZRRBILG3R0wmtnyvhsexqW+CWKUm1c=;
 b=M9WbJg9/IC4/0MKJaVW5Bjzz86iADV8f/W5dIpdKGjP+y8TM+bsd/fD0fZoptivSyz0iaElTsLAZLW9849eATOeN1XfLvN0Ip+eJ70nQkkBDsMDE0cVraBtHD6F2HKSQwdVJV6IpTRnfCAM78Z3ZM4lOETJWnaA2h4jlTe0W06N6+umHKhizWdR5qlb3ZRVYFFr9EbFIqDEzO7g/hUo3Nbx2DPvsGgSKR9lqFhGrs8WY2fCheDZYkRB+7O8DAj1BCmmF+FxYUi1uVGunIl5UtMyn/krfqeMrsxD4gNKExhn38RBl7feKyO71nuo5OQf47l+67mzyrHZDQBHxLeyPuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=21eHkPb9elWCcZRRBILG3R0wmtnyvhsexqW+CWKUm1c=;
 b=o/SnDBied3jF2GBkPOwuDTX6HQkc73nc0ohIelKqZntGCo0xLc8dQRU1YjIY9rWJCznME6FddESBl1nQlhvUELrDoRJnk9oKPLkA5vxYxGARu3JOem3mQ5MRmtW/p3w3TAL0SyNxZoMH8ijcyy0daqH6fvj/fU2IQ3F2mdrh7aw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS3PR01MB6901.jpnprd01.prod.outlook.com (2603:1096:604:114::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 04:04:52 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 04:04:52 +0000
Message-ID: <87cxwetkpo.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Kevin Hilman <khilman@baylibre.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Takashi Iwai <tiwai@suse.com>,
 linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 2/2] ASoC: meson: meson-card: use priv instead of card on each functions
In-Reply-To: <1ja4rjeak8.fsf@starbuckisacylon.baylibre.com>
References: <87v7a9i0o8.wl-kuninori.morimoto.gx@renesas.com>	<87se5di0n8.wl-kuninori.morimoto.gx@renesas.com>	<1jfr1ceqx5.fsf@starbuckisacylon.baylibre.com>	<874ihs0vz3.wl-kuninori.morimoto.gx@renesas.com>	<87y0f3zwrt.wl-kuninori.morimoto.gx@renesas.com>	<1ja4rjeak8.fsf@starbuckisacylon.baylibre.com>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 23 Jul 2026 04:04:51 +0000
X-ClientProxiedBy: TY6P286CA0014.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:3b8::12) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS3PR01MB6901:EE_
X-MS-Office365-Filtering-Correlation-Id: f4af997d-7c4e-496d-4eeb-08dee86f8bf6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|7416014|23010399003|1800799024|366016|38350700014|56012099006|4143699003|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Pop8wt0JXmtAB2qwkaQtLOq3ZoC4+rvsKWSL8MktPXhoay3/eLRZt6GbzrA9vYxvFtosb5535/py7RRU8hW4xH//tWkqmh3OL5bsjxYGI7f9FSbkGQ9DKQLxpQIpNa+hJFtq1a/KsMrFweKpOQoWf7+BTtk41DXMi3ThpDTdLHSHDtjXk6Ndk2Cm8zOYKk0mq8nm1Mo/ywqO1HgbTkD/gFTHUMJus8v65rUsU63ol1MZWaIM5uYSHB/vE8FUnyeVTT4zB+RjSj9m28hepr0slw5zN5Qo5ZXABC4KTHGj2DoTwI/szD8X8crKjghWChiD7mVOzZ60PKoRYdYpHrJ2P0+o6U23qmVa0n7ADEd6nwqx6MbA3hs1Fy6bqfGpeUd0pyiDT1pcAAmJGi+svt+F7Q7gapqRFgflHPvB5H2JJ9xyUECS1TiCnORjQdT88W6x9m0THFGFYwtS7tDW66sLoQCq/uT0zoBg17HrIB5UeoZICpxjksTMayR7e12pbezEF9FZl2zMDrhe4FHf3GK7y3kqS3nVKqr4TGym0kvS/dkMSsXgG35dLsdJh+T1kN+yvhiX64a91stUSwkWnku1YxR4L9hqATA9BPAVFP+l4nmJ8fEuqIRbIKNsswdKfsOrCB2GO2kkFfot4RYIR0857SnFyZv5gfHw7PMnVfzLffF7q8S5A6SD6mIwA54Iv9aGrH5dGWjFzRhHDz63GI/I2e+c0Mu+wBETkJQE6DoOCbs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(23010399003)(1800799024)(366016)(38350700014)(56012099006)(4143699003)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?72+M8DmRGD0nY/8+1ETuB9iL04y6HxakwMZfUDbC7KasoZBcEBv1TYCXiEZA?=
 =?us-ascii?Q?upUkvknItOLHv/u2UMZ8lSsnvaNnFs1cqfN2B1l/cjUsxP1a0fo73H3DjPZJ?=
 =?us-ascii?Q?ERq1tEWl78b0sQOswZI+8j4LmFI0btp84n07NJxJ1endwZQ8TbjKEoRKF5jy?=
 =?us-ascii?Q?s50M9lpLYkeSnuYL66Am9PeaNAVnJ2W/2SI+gxqXCVpRHFeqRdWDzcMr5ZGY?=
 =?us-ascii?Q?O+9kQOaosaYuKVJh1oLSTJPf3kp6PNwL1g25ex6NEDh1c0UDYNHEOEAFt451?=
 =?us-ascii?Q?4sM/VFhOjjPvy75fkD35gGQjPX7ewkauEEOuE3Z8CDVyagx8eam2mILRqUFy?=
 =?us-ascii?Q?gXiaa6Lao6pyZYkiIokce5fzNWQcHodRMFA13Qb6TTtIpqGiBl2OVz5VOsGH?=
 =?us-ascii?Q?wC1IgPXw620RsYXkoUejd/ry3mOLVPHO0FAzS+134YJe4ILL1bCOKWJyPJCY?=
 =?us-ascii?Q?Hjj1mEwEjofHzzC4twP8g7xHrQDXQt63VyqKyLK4fwOfN0uWxo8nWL8ni57F?=
 =?us-ascii?Q?shE0gwNOel/uA7mbzcEf8EXwiZ4xBohoWRDj3mZG6+cHnoFMY+wzWdqbSdyx?=
 =?us-ascii?Q?kkAPfYQS5DWvr0dKpFtYWsYBxGQmJaVcQ2kF+CWDLWrPiyJMXjvt8+U21w/b?=
 =?us-ascii?Q?8ULMtCMRO2xUNIOuFcWBdM0Ufu9LtN2VcVIROgc1EUZq5pLMYlzBgMybBzqM?=
 =?us-ascii?Q?hrzti2qjGjlwT/fNsX6BOhj9jwAsOYHtIIipPqenfKKwGYtg92j648AOJ5ZV?=
 =?us-ascii?Q?Sd5uJ7GtHjEyeQXeTyie7xM5pDneutN6jBMV3YQpTjbw9nqrkwThBYuuNNuJ?=
 =?us-ascii?Q?vjx4FUTZP1n/wCnxv/VED/MrtKOrFUI0pYA0eRPZjWbJBbqxkHdUZ3nRF/MJ?=
 =?us-ascii?Q?C0Yd84HzlA9Dx0V8ToBSQnpwHxJvn0OyJQmcw17LLr//krTLbZzm/TyfL06l?=
 =?us-ascii?Q?Hq+VGw3ajull2D3Y2GECX4wu++eIRxAt/IwOAVP9w0hTLNocYG/xcjMlp2K0?=
 =?us-ascii?Q?SntNzBPt6JiOFs1gL0mI0+tkpkf4pAfzSVBKxPOh/1Md4QQUcfFHT6v4gtqd?=
 =?us-ascii?Q?BPychn1rd44cVHOBIGmh+lsaQd9QSpC8AYzMLNeTHLYy90+7Ac7ydhSKGiql?=
 =?us-ascii?Q?wWwhrR528yXwh7FO5+A5UPmbmsxp+t89Y5qFX6U/lkn56Sdp9dpOCzIkXvUt?=
 =?us-ascii?Q?ufJlTsMwwr8iep6smK8VG+wE3EN6eGpiP4r5aT1A5VBw5SZbrBjEapG3H6vg?=
 =?us-ascii?Q?+8qnuF9Dsu2rtHnoQH8MKhdHukxeNKMA3lxDSLyZXQQuhVLD7AF9JPQH9qnZ?=
 =?us-ascii?Q?6w2bIyUqi1ZTEFudIFo67qHZv14jfZKODssz3Hf5NsyP2gWEqoEIfVKvwTAb?=
 =?us-ascii?Q?DFkr1OngO++nZlWt4dW+LLD3oMY83iGAHQ7ZA7hwO/oJ1sIpL5LDaV827WYM?=
 =?us-ascii?Q?5BPuTNO2PaiFtJLL4jGF4C9/sZraGoBZZYYx2GMd1/aD/3blwHEFANSRsfRU?=
 =?us-ascii?Q?OomEfOWqkE/Vf0wJgHm6+AEXJKXC5pio//ITAkXia/xYxaKhusk+zn9KEFRZ?=
 =?us-ascii?Q?JPbRva9YCollTi17KGah0WHvHmwYcdS7hRfijGkz++raATCiSMLxAJDio1EU?=
 =?us-ascii?Q?F1tC9+33h3PuNI6CRhsBPVG1cvuAHtPmMTN/ZI+bkAL09puNjRgbR0YvZRQd?=
 =?us-ascii?Q?RBKeZuXxV3ktgGS00bi+xNTL/Y+axNLtVnmfdkke+g7c4sXd/iuikgnxYecc?=
 =?us-ascii?Q?gJj3AnQrLmmYi9oAKNXOsIWOjaT8MFw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4af997d-7c4e-496d-4eeb-08dee86f8bf6
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 04:04:52.2098
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WRFc1zfDIbJHGDze8yvDyfc0qw9alfThY7H2Lvevgboi2ryP9IuA3Y5j2P6MXcLAgkW+RvSk8s3vTXXBVwQCWykqTV3sJ68kZVqxPIVkPfV7i3YeAUfOQDm/fL4M2WPh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6901
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_210505_908932_E1599C11 
X-CRM114-Status: GOOD (  14.29  )
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


Hi Jerome

Thank you for your feedback

> I think getting the device from the card (or other ASoC element) is a
> regular pattern. I get what you are trying to do with what you call
> capsuling but maybe you should add an API to query those things from
> the framework ? like Something snd_soc_card_get_dev(card) ?
>
> The driver then does not have poke the internals of the card but can
> still get stuff like that from it

Yes, it will have snd_soc_card_to_dev();
And I agree that getting dev from card itself is not a problem.

OK, I now updated the patch not to update whole and big changes.
It will has some waste code in total, but is possible to minimize the diff.

I hope the v2 can be less diff (= easy to backport), and acceptable for you.

Thank you for your help !!

Best regards
---
Kuninori Morimoto

