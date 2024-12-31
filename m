Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7BEEE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Dec 2024 14:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tklB+ZN94CQTDXrmZsjEwIe5VOIiPX0yHRcV22UuKRE=; b=gla5tPQ8XNeEqyW9esU+cOmwbA
	xaWyRjJmLv+Sg3a/gKeeoa2ya6gkuGMeU6lJWn0dytKoNnymvRHnfgbeE76YsMQIuSKHDo4ZezzJt
	i3BrlDdgmhwio2xY3RGMCFkywdo3Q7ZRZVaBStD4FymoDKhwCmcXZntZQr44m1PuDSYcTIEpXe6y7
	vx7fgRqoe3MNk92xDxQ2aEDltMfeuYvOfTieq58lxSew7EuiX0peKRWTmbeL/q1dFP3pDwwAJIkUq
	whtS4FX1g+ibhHzG28qKAK+2M6T2zsHNW5DT+3GJiOrtYmloZsHk14gmK58xMNHSmRXyP+/RyItsu
	UqXnZ1fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSd6a-00000007JRY-2975;
	Tue, 31 Dec 2024 14:20:20 +0000
Received: from mail-mw2nam10on2061c.outbound.protection.outlook.com ([2a01:111:f403:2412::61c] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSd3Q-00000007J6w-2l49
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Dec 2024 14:17:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CofL98hkREqPXglakgTVhvyWXpaTcvRSKzbA3yq5BWykC0+zhKOZKqvRjUi/D99UZQGYrLucRB3yb6Cdg1ilRBP4VvpsRfhvKlfR8LF+GChuTkIvBUn7M8LfqltSe/BDH5gxrDYMCwNC2mM6/gX4Vo5RiNJsqA5MccpVX4Ef9FUPZHYYHzjIXO++9yvhseeaeYoDxQM0+4J2NeViaSGQ7Fic/8yah3VQvvB623kqfEkvXY2zPkz9YHcSocRLjbDRkA3jAPHW7jTCad2JYjyuUPtgeyAVeNAFKUVfQzSfoD+qcaHlxKIj+MmRcBQpE4MqACHkXQF1xEp1+PnQBs/oww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tklB+ZN94CQTDXrmZsjEwIe5VOIiPX0yHRcV22UuKRE=;
 b=HUt/cJzPyTGnDkGTr5abzwotFuoAfP7g/HdHBT8wu0i5m2eP37KinOHhmpKewCET5SVnyVR1t5z5yIPu6M7EBHE2ohjf/uyD1gj9HE+Wp6+SwGOvSCgwQj/KTLLw2aOMHw+rw+Qh5uXTpHmW118oSyjQTYfNGV7N4CUzviH0as8kWlLpzKt64XG+6igD7DtjhLbID5wpyTl4NctIioUUu8WlOO492ASKa9XuHWlSIb/Txh5PL4QkwES/HG0PcCQ67tT2UwauFPiByQGrdR9d9hNY4zcLUJmy4PhR2mgfftvXunr2UTmh+FTFMatfRkH1IrRQQD/l1idQFi3NJVF5xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tklB+ZN94CQTDXrmZsjEwIe5VOIiPX0yHRcV22UuKRE=;
 b=24Dlfo7GANXcnQK3Dje6WViW0J8IHy1Jm5nPSpuvzW5YRCc175P+m8KAb5ux+PYeLalOzHCBQWltxVf5nB9y2g3as9rUz7UhXitS3Wm28yTEPFDGt/TS5nyfo1KWFzuywpzy9QvCBlszCyIC6JLatugYdsPk3xhXFh+Sw0Jn4UA=
Received: from CH2PR12MB4875.namprd12.prod.outlook.com (2603:10b6:610:35::24)
 by SN7PR12MB8101.namprd12.prod.outlook.com (2603:10b6:806:321::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.19; Tue, 31 Dec
 2024 14:16:48 +0000
Received: from CH2PR12MB4875.namprd12.prod.outlook.com
 ([fe80::ff88:6c6f:c187:6511]) by CH2PR12MB4875.namprd12.prod.outlook.com
 ([fe80::ff88:6c6f:c187:6511%5]) with mapi id 15.20.8293.020; Tue, 31 Dec 2024
 14:16:48 +0000
From: "Visavalia, Rohit" <rohit.visavalia@amd.com>
To: Stephen Boyd <sboyd@kernel.org>, "Simek, Michal" <michal.simek@amd.com>,
	"mturquette@baylibre.com" <mturquette@baylibre.com>, "Sagar, Vishal"
	<vishal.sagar@amd.com>
CC: "javier.carrasco.cruz@gmail.com" <javier.carrasco.cruz@gmail.com>,
	"geert+renesas@glider.be" <geert+renesas@glider.be>,
	"u.kleine-koenig@baylibre.com" <u.kleine-koenig@baylibre.com>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 1/3] clk: xilinx: vcu: Update vcu init/reset sequence
Thread-Topic: [PATCH 1/3] clk: xilinx: vcu: Update vcu init/reset sequence
Thread-Index: AQHbV5CXxTy713kYnUeLr9qhPC6Cz7L/ib6AgADGbWA=
Date: Tue, 31 Dec 2024 14:16:47 +0000
Message-ID: <CH2PR12MB48751A8B003E9E30A9A4CDE8E50A2@CH2PR12MB4875.namprd12.prod.outlook.com>
References: <20241226122023.3439559-1-rohit.visavalia@amd.com>
 <20241226122023.3439559-2-rohit.visavalia@amd.com>
 <5227cdd506bcb0239657216bd36de12f.sboyd@kernel.org>
In-Reply-To: <5227cdd506bcb0239657216bd36de12f.sboyd@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB4875:EE_|SN7PR12MB8101:EE_
x-ms-office365-filtering-correlation-id: b01c8c63-43a2-4a71-ff73-08dd29a5c350
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?nuXYbKA7mnDg04iKlz/LhbmZl79cFAydM+W9Zoe0pmEsUTk1GNLGVDsaRYKx?=
 =?us-ascii?Q?mKKLrfO5ObJHTsE7rbGhldWqQ2cFG3aGUbbdexqXmE+/WrYORtc6yfw99mWj?=
 =?us-ascii?Q?5cWuIIiYwDdQsc66eTOWnQxCj7q10W7nksP/nX0sEqBFthr7gzWGyWyoBAU4?=
 =?us-ascii?Q?JPQqwZtct2C4qHgv2iVtGc70gotBPb9XfmnitWEVDd5KcjJRboOVK/dPmI73?=
 =?us-ascii?Q?7B6o1I2ikkYvjV61RSprKyXKGFLTfJ8ehotnoPFDKfjAp2dc71UCu/knKdqt?=
 =?us-ascii?Q?YQxCnL4pX0YzRxu47HAGJT7hhDf7+/IVNiAt2YH5Db+pdLXBUwsCDHy5ITvs?=
 =?us-ascii?Q?UzWAcyUkcYKua8NfaG1btflOH3HqqQH42nkceIGKZD30KSFDhfohK98Ga5Zb?=
 =?us-ascii?Q?HvD5MAtvOCFRBTYHbDftRWruM7hMg3wz3rgb1Tr5sGrXL30qGMC244ccasKX?=
 =?us-ascii?Q?RCNm0OL5snUTLromqYEU8CzkmS7CtO44g9cxo1WKfXFXffV+2+2H0ZaEx6v2?=
 =?us-ascii?Q?UDETtmGRReVEaK5sfBeITZ8oQLkL1Rii+nZZClmtEFjte5JzEJxCv5hKnvlA?=
 =?us-ascii?Q?+AJkg8NAhLgKW4i1RdjyveYT0efc6kuz8cbAk89gKC6HViFSo38EKLQcKPx4?=
 =?us-ascii?Q?SySrK3XAchSHMvNldlLuTUQgn+qu7sZR+38gV/G4Js7vB7XcFDHvv7WRcauX?=
 =?us-ascii?Q?d5qH+803n6gvXmYMQDPyLbZ+AY+3cGL5ptAuxbzKMkJgRipLqzopnWQ/Obwi?=
 =?us-ascii?Q?p70wAq3Nfh1+DKSGRKK5Bmf2NRYL0VoGw96YpO59NdMxpbKuCMGJWp4u+fi2?=
 =?us-ascii?Q?iOshuXLPdchElg4WO9+INaMuKxLRpveYO0VPs9R8jfOdV05XsdDpxIwOFIp2?=
 =?us-ascii?Q?ko53u582tqpYM59mD3nBeXfIPCkBRp88edZV5RcnAfFRh/mcECcW7qj6sSKy?=
 =?us-ascii?Q?hc+lc7W9E+mZpI/VoYyzVGfx6WGAN/mNtyq8Vz55WJeQy1BiyXo1JQCXHRi0?=
 =?us-ascii?Q?9xWf6R95WHpjMgHhGz9nL96YtdTt8M5sf3KjFogJ7kmXopDq24F1PFAAKu1r?=
 =?us-ascii?Q?ZXAMo15ENJYd6h5xdCHq+2wUfMG8P+7DYH2qhfdrxR0cBjsMqbffl9McsFrU?=
 =?us-ascii?Q?vskQtOBWQmRgrDR2GJC3DDE9MrzjG+WttBF30wwVVMsmwIoBcmGsqT88zjVF?=
 =?us-ascii?Q?tl/yb+2tBtr5Mb/o4+APuoB85rvpKUKSOmtPi9vkGmT2eBuI46iyoR/odxw6?=
 =?us-ascii?Q?pFwv+/IDG6lhDfVTvOitZh1kpZAyp1UBj6jBbooTQfyc4XzK/MgAh+/8XXA5?=
 =?us-ascii?Q?CL/3yqFXg7gE2jeDD9+YHgdLVnuGiXBxves4XPDBjO2RPjhZTPhHUmJKUj2T?=
 =?us-ascii?Q?wvG8bMuZVuyjp0ynvrQhMomnh7ROiXDFv5CoXLK6Agz/x4/zxG/6s2cforzp?=
 =?us-ascii?Q?Df+9YdQIP1AuQDbc6Z/rC5n0fl4DwaUv?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB4875.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gR3RW/5u+CCt+BeS8t/qvMZw793Btuhtg06qmpd0QKPMsxz08x/UC6K/U2Mw?=
 =?us-ascii?Q?ybS7p7WNslLrKDIBBrNWCzzXykyTx3GrZ6wrAe+CpR04jmWY05ai5lwkBydc?=
 =?us-ascii?Q?xGKi/IStNGUCeqWszHYJ2ICWDcAYqg3JoYOoTPgYahsGTbdGf4SRP3nnaPcy?=
 =?us-ascii?Q?oKA8SJnljtPWGcg772UH8JMdo9B3UWzJd0u8Hil6AV0fSNsjfLmz49/5QUk9?=
 =?us-ascii?Q?5AP729zADtBSrRRCpKAe5UuiBHdhMIkSszYpWG0ZWQWOphz3T0ChS1fgf3CU?=
 =?us-ascii?Q?jl9X/gwzxU1zlP+6931Uz+J8ty1RH23A2v3vXdessVijiVp7wKmdijlvml+a?=
 =?us-ascii?Q?KJtJE9YMu0ev6kGidpsEX06nizcan5S3SqzA4J56Dg4gqTu1TNQdb5gsFIpy?=
 =?us-ascii?Q?UtMqGqKYwrd5piW0XKKm+kXoPe2xbF+inzXUU09PZF7J6Xzn+Pk4A2HQKphD?=
 =?us-ascii?Q?eM6QMTCPOPNJA6NuEyHdKS8ux7bUU30p3a2FF6Tu8QjrtpT+v2PN2fuX7YJd?=
 =?us-ascii?Q?oNEoAFD24RnGVi5SYalELZmxkgp+kCfXR1YDtPgUVhiH6pOSYWNIlgH/4/YD?=
 =?us-ascii?Q?GJkESqccMj8f5rRNCsXW0hyMsXU90gLEMrh41HhYpM4+5+MeeXzZ+6Ai1KeO?=
 =?us-ascii?Q?Iv6O+jbPCkCL4wWrsFSgUINYnjvD7z80MD9AU8/rWoO2gy8rmCllevlquzGq?=
 =?us-ascii?Q?hZ99/QJ0OjaPBK8c3c9bDJbc2ZT79A9z/uSXL+NNg4YlT6bHefZHAoYOslY8?=
 =?us-ascii?Q?z2Tz3McDORvxn/N7himwe+zsYGB6RswWek9dhJ5TShi0mTrf6VedB49j2gPR?=
 =?us-ascii?Q?502uo6scQ6sAwD210aMudOoONos/AKELkpTaYXBff7xQyRUCCBUnZbEfMN9A?=
 =?us-ascii?Q?xrF8NR8jpCHgx6VatVmMpm127KnBeVyKyr0eBC+4ztw5ET97fseHdN5U21Ky?=
 =?us-ascii?Q?db8qzt8uDKUS5qHZHC8wH8m4PoEwu7PEZS4HbKz962UpypZDTssPB+zaJ44X?=
 =?us-ascii?Q?QCnsEeKhIxtSb+jTYh5q0t1bzvsUxL71RK4eyKUKAuksYuqTUX5uDcwdQTYz?=
 =?us-ascii?Q?bfWjCPAooZq6+GAIfxAiZsbaeBBo7yMKb+xPuN72o8Qg9SZiFA2jdASjmeMe?=
 =?us-ascii?Q?JimzE7ADnFLdwBMTJ5yGlk1snRj9DFtWSRz8xLtkcepbC0GCQx1yS1vZ2Yr2?=
 =?us-ascii?Q?xBWNBcOwCHUVDP83fA5YTk+L5Q7bmM62X07k2YsRsgdIiEUBxuIRQ8DUImlv?=
 =?us-ascii?Q?/g1xyrau9xoOc5l+qXM8eQrf2+hG2TS4P+TaeS2Xs7WDLQEdIdNfgFJmWV8B?=
 =?us-ascii?Q?6VtCxxu2StW4L05gDRLssUjMWYQksBEK+XU8JDY7D3uZe73FWjYiH4tuDDXp?=
 =?us-ascii?Q?+WbLko3bf2l3hnsg4w6TthW2BL4Z0lTyncIyJoaa37AHjldtJYDQrSmO+Xp/?=
 =?us-ascii?Q?WjqF2dHAKR0HsJ8tPOlir+JCb/ZWyw0IvjL+VQiOQ5BDNTS74nS2b5vHXlh/?=
 =?us-ascii?Q?P25BysYO07Y7g7MJVvxbDNV5EoWOslD8IJMEBanrEPz0+3W7NOGOsGy74IS7?=
 =?us-ascii?Q?jpWpa96Is2wuqbMGfDw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4875.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b01c8c63-43a2-4a71-ff73-08dd29a5c350
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Dec 2024 14:16:47.9541
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PmRrucn5bIak9gi5+lUghvqZLKndYXzBHvRCJXo8b55qjKTztbTNGrr0RwxTSWzwbuvh7GH//p55lLfUGbqURg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241231_061704_742197_B5DE3669 
X-CRM114-Status: GOOD (  13.84  )
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

Hi Stephen,

Thanks for the review.=20

>Subject: Re: [PATCH 1/3] clk: xilinx: vcu: Update vcu init/reset sequence
>
>Quoting Rohit Visavalia (2024-12-26 04:20:21)
>> diff --git a/drivers/clk/xilinx/xlnx_vcu.c
>> b/drivers/clk/xilinx/xlnx_vcu.c index 81501b48412e..f294a2398cb4
>> 100644
>> --- a/drivers/clk/xilinx/xlnx_vcu.c
>> +++ b/drivers/clk/xilinx/xlnx_vcu.c
>> @@ -676,6 +679,24 @@ static int xvcu_probe(struct platform_device *pdev)
>>          * Bit 0 : Gasket isolation
>>          * Bit 1 : put VCU out of reset
>>          */
>> +       xvcu->reset_gpio =3D devm_gpiod_get_optional(&pdev->dev, "reset"=
,
>> +                                                  GPIOD_OUT_LOW);
>> +       if (IS_ERR(xvcu->reset_gpio)) {
>> +               ret =3D PTR_ERR(xvcu->reset_gpio);
>> +               dev_err(&pdev->dev, "failed to get reset gpio for
>> + vcu.\n");
>
>Use dev_err_probe() and friends.
I will take care in v2 patch series.

>
>> +               goto error_get_gpio;
>> +       }
>> +
>> +       if (xvcu->reset_gpio) {
>> +               gpiod_set_value(xvcu->reset_gpio, 0);
>> +               /* min 2 clock cycle of vcu pll_ref, slowest freq is 33.=
33KHz */
>> +               usleep_range(60, 120);
>> +               gpiod_set_value(xvcu->reset_gpio, 1);
>> +               usleep_range(60, 120);
>> +       } else {
>> +               dev_warn(&pdev->dev, "No reset gpio info from dts for
>> + vcu. This may lead to incorrect functionality if VCU isolation is
>> + removed post initialization.\n");
>
>Is it 'vcu' or 'VCU'? Pick one please. Also, this is going to be an unfixa=
ble warning
>message if the reset isn't there. Why have this warning at all?
I will use 'VCU' in next(v2) patch series.
Added warning just to inform user that if design has the reset gpio and it =
is missing in dt node then it could lead to issue.

Thanks
Rohit

