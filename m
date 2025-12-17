Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC016D6406C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 02:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wa0xxFfQ3t8zO1ggW0WedCe90akKSAxQWKQ32p443kA=; b=ckNHO7WEtuuPZj8mogMg2eOQbB
	lQxQyx+Si38dCmVTQNMunFC+11yl/hIxSlrpNx5AFKyCLcYDG0jbULSn/ZfrbV6VcAoxuh5WAL9Vh
	FsnohIGkEWWacDkNkn8UKLeuoSHJH0JPYqO9S/GR3N8ysC9S9yHgPl5mZ99CDSHWgdGUypkLatV/I
	iyRWTKiw4/9W+K/8hG3LuN7VSoTo/+K7AHGpaoCDRvM0taORIndKxJoKjh/M1pvq7gd53grQCgHuf
	mY+qwRx4Pz1fPhoddp66E3lQeZnE7XLilPKEFYiCuYa4UNrc0MdIgPlorek0831dS/Si9P1I1f4Uk
	J7CwBmeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVh2j-00000006357-1TvS;
	Wed, 17 Dec 2025 02:13:33 +0000
Received: from mo-csw1121.securemx.jp ([210.130.202.132] helo=mo-csw.securemx.jp)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVh2c-0000000634B-2vs5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 02:13:32 +0000
DKIM-Signature: v=1;a=rsa-sha256;c=relaxed/simple;d=mail.toshiba;h=From:To:CC:
	Subject:Date:Message-ID:References:In-Reply-To:Content-Type:
	Content-Transfer-Encoding:MIME-Version;i=nobuhiro.iwamatsu.x90@mail.toshiba;
	s=key1.smx;t=1765937586;x=1767147186;bh=VFmXqTSeUNSdIscNWy/JxVan+IE0NT4SNT3O2
	enTIx8=;b=L1oqNXeG/66601K67WhUHB8IAixYpxI13DsrfmeXILaIeX7o2hNy5J6xDSuB1K9oK8G
	ru+WGr6VuBycHuIA3ZLUDpju4QUj1Pz4JJfEHqYBdYlVCdNHyicJNKTe0jk26RZc7BQyyTPt9rXxM
	TiAsUwPAcSBVbXasDZNyeO2y9dKsMpuGgUo+Fqmt1vorKEaMojcoXk50VCq6S6pOtgFc7/ShuED1Q
	9uT9zs85Y70lLPmE+k++g7QXoAwHXwOkO1ETsnNANPuPf/MzRzqjpx+NS4kB9rvcc0U36KSpvPa4T
	m/ih2QhfPFN8SfScWIxUaFrXk3eQ9hoR58EP5x9Pe9Jg==;
Received: by mo-csw.securemx.jp (mx-mo-csw1121) id 5BH2D57h1067468; Wed, 17 Dec 2025 11:13:05 +0900
X-Iguazu-Qid: 2rWgRWki9ldvmgDsgE
X-Iguazu-QSIG: v=2; s=0; t=1765937584; q=2rWgRWki9ldvmgDsgE; m=1luXCkQYDzlh0JL4E+xOMG4BrGiklTOT6BP7VSeUYvw=
Received: from imx12-a.toshiba.co.jp (unknown [38.106.60.135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	 id 4dWHQ74nj0z1xnc; Wed, 17 Dec 2025 11:13:03 +0900 (JST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v/qQretvXpL5lqlL1StVbf3jkvjMNE8+wVMXtezGglfMy0LdYRRJDHDoLeytDWDh+e915cabfECMBRJZ74AZAKZ+rJLh9/1zVQuo2AllbIz5/mRriZcayIAwtvQrPKaYT1qRKBN3AuG8Mos6cBD5iTrgUDFB9YrUXso++vEKJZeuAxYEP1friMMuvCrmb+10hnuQiyf/HEHAp9BEv4NT51rN/NZI2P2JJE9BCqhtHuu5QQ3sqhgMu5WwYmtALh0FHhpieRis8O6HXscu3VsdW0VI3Uz49qE2G6y04yU16oYQm9OU8LPFDCIHU5QgoavC1mY7IoMqOOTHslkyckSR7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wa0xxFfQ3t8zO1ggW0WedCe90akKSAxQWKQ32p443kA=;
 b=aexeu6iMHhtw486fhOK1Ovt3HmIA/FiVW/PO189E8oLwhy2TSl2AkylDv9JtcymS+2YJ5a2+uEvoxTlvO4tjaBXBvsAOWS9vILRQU6K1OQWtgRu1pD8TT1Eqa56Qdwh7KePm61Lh9Dutxh+rhXLd/RuFGu5e3b0pIIX8HiLf2GXLjAyAU8YTe3KW+oNNm+7yFOumuYJxPBZiPJMqxhUI/bL8zXZWLv2Qh99xomDPgqAtcHLYuKP1O13uaDZAYAh65u2MVPuZx6/RYyUAIfFd6UzDMoRIDcBeXKsByNSa8x1vgM3/5hVD749P6UeNJAzJ0h9oz7qbkBDm/rJcyLtJOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mail.toshiba; dmarc=pass action=none header.from=mail.toshiba;
 dkim=pass header.d=mail.toshiba; arc=none
From: <nobuhiro.iwamatsu.x90@mail.toshiba>
To: <robh@kernel.org>, <soc@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] arm64: dts: toshiba: Use recommended node names
Thread-Topic: [PATCH] arm64: dts: toshiba: Use recommended node names
Thread-Index: AQHcbrYCCg0+xgdFxEqx6sSVCjAVubUlF4mA
Date: Wed, 17 Dec 2025 02:13:00 +0000
X-TSB-HOP2: ON
Message-ID: <TY7PR01MB148187A7304501EA9EB3B2DFCCDABA@TY7PR01MB14818.jpnprd01.prod.outlook.com>
References: <20251216180055.2793215-2-robh@kernel.org>
In-Reply-To: <20251216180055.2793215-2-robh@kernel.org>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mail.toshiba;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY7PR01MB14818:EE_|TY4PR01MB17375:EE_
x-ms-office365-filtering-correlation-id: a728cc93-7368-48a7-2470-08de3d11cddb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?iso-2022-jp?B?ZlcrSUxXd25hcWFXdFB5YlRBRG56ZDNsS0lHTzVzaWFNLzh5YkFTeXZq?=
 =?iso-2022-jp?B?TjhQa1QzWWI0S1FUMjNlN3NDNUpuWE1wemYyVi9WY1doaEc4TWlIOGNx?=
 =?iso-2022-jp?B?ODJQZnJTdjdsdFpMc3ZhQjVFOEpIbTNWa1FQVk9nNDZGaytkbXdlWUR4?=
 =?iso-2022-jp?B?U0RIaGUrbXhEcExzTTBpU0ZCMXRXdTVIZkh3VWJRMC9RTEF4SDZNZS9a?=
 =?iso-2022-jp?B?OVFTU01vdzBUc3JSSE5CaWp1RGdZbzBPamJuYUhGaVdITk45bytXRnhW?=
 =?iso-2022-jp?B?di9ZWk8yUk9venI1U3RyUGlQdDdlZGRtMGE0dzByU2VVajQ3VWVmU0gw?=
 =?iso-2022-jp?B?MWV0S3A2c3o1RklQNFVjOWRrN0JsWkJYaW96SkRnYUhrK21qclhNVzNV?=
 =?iso-2022-jp?B?MTk2aWRPa2gzb0NScEJ4QldKVWthOU4zVGIvNGpwNmVMbUlxR1p4S2Yz?=
 =?iso-2022-jp?B?a0x1d3JqV3BhWDlVWU9UdFRPODlwbVQ4ZDh3ZnhwT2FYems0STlTcndq?=
 =?iso-2022-jp?B?K25UcFUzZHhqbkcySWhhYlRhcGgyQVFXenlUWmE5b3J5ei8zVlRzaDlq?=
 =?iso-2022-jp?B?K01OYUlBdEZHRUVBeUZaY09KcXFscGRrM1k4b3AwZGMyeUV2RCtOc05o?=
 =?iso-2022-jp?B?UkJTQ1VXUlRHK0d5NUdZUUhGUWtQWGFKc2V3VE9aRnV1b1N1alQ5YW1z?=
 =?iso-2022-jp?B?ZjQrV3dpS0tubWx2VXUwcG9CM0RvVHdBK3hwOXNxaUhHT0M3WTh4alVC?=
 =?iso-2022-jp?B?ZGpLOHhmLzVpZFIydUJqSjFnL2g4d2NEU1dKU25xdlNiUHk4ZzI1OVl4?=
 =?iso-2022-jp?B?YWUrbFN4RUJDK2d0ZFRNdXN3dXh6UmRPZEk0Vm15YW5YaDlUQlFKcStk?=
 =?iso-2022-jp?B?YTBCU1N4c2lBSDRrenUxZFZjWFA2czlKWDB6MHZuNEhKd1NoWS9CVFM0?=
 =?iso-2022-jp?B?OXBKelJWbG4xSm5QM0xjUWVkd1Rtc1g1N2tIUGFUSmVKaktPVExjT3lj?=
 =?iso-2022-jp?B?MHZDcVpDSER4MEFaSDBRUzhGVGhsRytwYTZRQjNSekU5ZCtnNUhLK1A5?=
 =?iso-2022-jp?B?bWhBcUYvL3FIZkNJUC9LSytHamU2anQxQlZsUUFiUDlPSExySDU2eUt3?=
 =?iso-2022-jp?B?VThrbHM3dlBDVjZDSUtYZ2lFT3ZvQ01XbVd0Mis4OHBNQ1FGM1hxMFpy?=
 =?iso-2022-jp?B?ZnZqVUh1Rk0rbWhtVUp3aU41NmQwY2FKZUFXMklCczFOM0FGZzJCeDdV?=
 =?iso-2022-jp?B?UU4yMGoyalFjYWxXdkVpZGxlTnQ2TEcydFVhMGlkdkIzSVZUTE0ybXhG?=
 =?iso-2022-jp?B?STBGam5nZkF6MjlvVkRmVmhCeU9BS1ZZbjRSTzVweFdMS0tHRURsNFBK?=
 =?iso-2022-jp?B?SGkrLzJ5cjV4RndsZjdiZ2hGc2NDdUFtNk9NQmtyRmdJYWZFVWdQWFJ1?=
 =?iso-2022-jp?B?TjdZNThLVUZFdGV1d2RCdGNRQmhXaWgxRHA1SWs2ZG1kZXpVK2JrREZN?=
 =?iso-2022-jp?B?WlNITXRldENSajVjOVpra09zREtOcGNvSVpSYlc4anoyZ1Y4emtKUHV6?=
 =?iso-2022-jp?B?VjdyVkNpbGVXc09WRGlJaXZqTXpBdUwxdVQwbmhYNDdtR2dNS0RWaFA1?=
 =?iso-2022-jp?B?dDNyUTZ0RE9ZUTU3SzNieEpIaXNUZ1drQWZMczRoVlZVbklGYit3NDlO?=
 =?iso-2022-jp?B?V3dnSURQc2dtMlJTZ09WbVV3RENSc3lqaWllTStKek53R2ZDanB1WVdI?=
 =?iso-2022-jp?B?alUxOEc2UXdEZGZyY2swTW1KSHZDcFpINzRGZ3VHV0xxbE1KNmxJNEdL?=
 =?iso-2022-jp?B?YXRHUkc2K2U5ZE5nQzlEVnpwTzlwWXIzejhCbkF3SlZUSC8xK29pVmdI?=
 =?iso-2022-jp?B?R0c1WDZadFVkVWkydXBpZ0lhdkovRjd1R25uSTNQcm1WVGljZXRUb0g1?=
 =?iso-2022-jp?B?UTBQMUFJTTNOUEtsT2QrdFREeXl5MXVlMm52ZldlUWMrT0V3b3E2Ulk4?=
 =?iso-2022-jp?B?UDJ0OEdra0xFcExxa082Q29aekl1T1RadFU2dXRadkxZSWJvTUUwZkdX?=
 =?iso-2022-jp?B?a2Y1aHpOeXNaZHd2RUFzdTFsbUVSV1BRYXRwRHBDdlJuVnUxU0NCUDk3?=
 =?iso-2022-jp?B?KzVMR2RWd0owb1pRYnlyendCTlhMM2pGeE04MmpxZnpnekhKUWYwdFYx?=
 =?iso-2022-jp?B?N0Vid0dwdkgwdGN2R21kWk93YnEvNmtI?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7PR01MB14818.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-2022-jp?B?MW90bnZVZkRTUmJBNi9VK29PSzRVdTdRbzM2bEs5R2wwVXJGckJzaVVv?=
 =?iso-2022-jp?B?UEYyVXgzYUdNSjl0RktDa3JWbzFOcllKeDFJSXhTTjN3VXdORExiS0sv?=
 =?iso-2022-jp?B?K3ZGOVIrRjR0WFR2ZVQyeWp3L05rSXVIN2N1N3lySm1CMGl5L2tjeUFk?=
 =?iso-2022-jp?B?OFRVZTBXTjA2MGRBc3JXL2lLaVdGOFhDcFFjNTd2LzJBbnVCTUJBNTE5?=
 =?iso-2022-jp?B?VnY5MlgvRmg4M1VUOGFBc3lFTi9nMUNvZExKSnVEQVo0RE9mdWFiNGxv?=
 =?iso-2022-jp?B?K2VKd3daRzB5RG9QdTVOU3kvOHhMd3ZvVm9ZZFhiUTR3Wk5jakNZUm4x?=
 =?iso-2022-jp?B?cDJSQWpVYTZBZUJkVWJrbnpVQTQvbVVia0RUR0svN0Z4RWsyUWtnUkpz?=
 =?iso-2022-jp?B?cXNLZTV1YU5OckdZTm0yUTNtUmVmVFhKUlAySnVtckc0Tkc5Y3paNDNI?=
 =?iso-2022-jp?B?L1JWVWloRHRZWEdRZldWRW1ZS3JWNkVsMkxMMFdxaEpIYnYxMGMzcDFX?=
 =?iso-2022-jp?B?QzhPSFpEUzlzTWZkZmlYRlBDaVgwR3c2NzN5d1ArK3hpK2YzUmkyTDZy?=
 =?iso-2022-jp?B?NlljUzY1M09CTDJuNlJXMWhJQ1RDMVk2ODFRY0h0Mmx6MW0xcUVIZFQ5?=
 =?iso-2022-jp?B?S2RkUWNKWTk5VmxBbzN2RDJ0VkR0R3FDRm5rWnNvSmRjeDVhRTg5WEtu?=
 =?iso-2022-jp?B?Qmo5QTJKc1oyemNWQWZjUUVCdmRqMzEzZ01FdGkxNzd0ajZIZ1h3YXVH?=
 =?iso-2022-jp?B?TUNkeDVnOVVxd24zMUQvcnRiRnNlMG1DdGNuenRNL3M2bG1rZnlhblRS?=
 =?iso-2022-jp?B?N2ExNGFVMHYraVdMaERETG5lVk93SzdlK05aQXJnYU4yZ1gyVENYdFZZ?=
 =?iso-2022-jp?B?K0tTcEpDOGd1KzJVajhuY0VPeEYwaVlpVjVtbUxtQUVjanhuSlVteWNa?=
 =?iso-2022-jp?B?UUdWMEpJWWlxTjlFb3RFZ0RmTlhRL2JHenFLd29SWFcyVmtLWUZlKy9D?=
 =?iso-2022-jp?B?dEN5NXlraENkN2ZiYjF4Z3p5ajg1NzVPYlRCQlBZQm1TMTR1NFBvWVBL?=
 =?iso-2022-jp?B?Z2dXU0RoZXhxZkNQUWdsUjR2NU1DL1lsUlpDV09RZmRucW5WSTdFLytJ?=
 =?iso-2022-jp?B?OWRPWThob1ZDUXAwcGxnWFlBOWE2OWZEUWRhcTk1NnpXcEVQNWQxUFhJ?=
 =?iso-2022-jp?B?SmVCNHc3Lzd4NitscXhvSGczR1J1NHFBSDBQK1pxdjZrbVFUTzFxM3k5?=
 =?iso-2022-jp?B?MlJMdzdKS3NUazhGL1pWZ2tDZXRlY0ZSWm5FQnQ1YkRaWWUxT2tMcVAy?=
 =?iso-2022-jp?B?dk1zVUtYbU5tUjZpdUp1KzJIUU5nV0xXU09HcjloMkJ6WEVLYVJRUE1x?=
 =?iso-2022-jp?B?aEZaaVFhZGxtR0pIeFMweTUyUGk2L0xGd1BkL0tHUFMwZlFUREFmOHNa?=
 =?iso-2022-jp?B?ZGdudXo2aTJDSzlIK2YreldwdDR6YmtINHlua0MxVTZ4OG1oODJTK1U4?=
 =?iso-2022-jp?B?OW1lOGlXd1dlQjYvNnhHVFEyR2wwSXRFRFVKZEpRYjZnWEZwRTdhd2VI?=
 =?iso-2022-jp?B?NGNPaFpYaG1wWjcralBXR0d0dUlVaVhPdDR0TXVZMDNaS05tK0ZRcUpx?=
 =?iso-2022-jp?B?R1NkY1BDSDhTQWNuTTRPdjZqNFVPdDBOZnBzWThyQzJ5QmxacmExUUdT?=
 =?iso-2022-jp?B?c1M0Q1h2SHdZekNiRUtrbHYwMFVRWXNnaUx3UzA0M1dBYXUzRnlGcm50?=
 =?iso-2022-jp?B?VWp0UDBIbjFqd2hoWnFqb2Y5M2ZrNEVFQ29aL2UrakI1UENvQVlOS3p4?=
 =?iso-2022-jp?B?MFZGQkF2aWR3WVo2NmZVYm5LVllVWHlsWDJIVVkyTUFSRFdNMFpzOVVL?=
 =?iso-2022-jp?B?L3pHUVdMNGpldXI2NjRLN0tudWY2M1Y0OWJNb0pvbGM4bW1rYUY3OFFm?=
 =?iso-2022-jp?B?ZENmNG1VL2tEOGhUSnNCSlQwOTRjWmlsMVduVDBBL0hDenVLeHZUZEp4?=
 =?iso-2022-jp?B?RnY1MlJGQlFvNHZRbmRTWmZhY2ladGxQTkNmVUh4a0JUSHl2Tk5DZ1c2?=
 =?iso-2022-jp?B?V05lQXNmUlUyMDI5ekk0NExKRVQrdk1iSlRpVGVCQWVIMmZqZzNnVURS?=
 =?iso-2022-jp?B?VHV3YWR5QWxhVnZHQUp6NHpNczNjS0hCVkNTK0pnUTUxRmU0Y3RieE1D?=
 =?iso-2022-jp?B?aStvcXQzSW5mNjBKMmFsQjd2QS9HOHorZmNRSmlCZUw4WTZZY2lRVlZv?=
 =?iso-2022-jp?B?eFE1Rmd4bS9GNktiM2xWd21uTHhhY2I1U3dyMmdzMWMxSVJ0bmdkYkl0?=
 =?iso-2022-jp?B?SGwxWnZuMng3YkZZaytqTUpFVlZqSDhyQ2c9PQ==?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mail.toshiba
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY7PR01MB14818.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a728cc93-7368-48a7-2470-08de3d11cddb
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2025 02:13:01.0213
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f109924e-fb71-4ba0-b2cc-65dcdf6fbe4f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LV0LrsC2WwPN69PA6loQ+LwD4y3zFRtYugHtlveN7kFx80C8OGhGSKARCRrM6ultTc834AUMYr0PM6K4lLEjzv5zOJdxTE7cpJ6lsL8YejUbDRg7QAFxv8S4Wu09BH4/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB17375
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_181327_357083_18A67AC1 
X-CRM114-Status: GOOD (  14.36  )
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

Hi Rob,

> -----Original Message-----
> From: Rob Herring (Arm) <robh@kernel.org>
> Sent: Wednesday, December 17, 2025 3:01 AM
> To: soc@kernel.org; iwamatsu nobuhiro(=1B$B4d>>=1B(B =1B$B?.MN=1B(B =1B$B=
""#D#I#T#C!{#C#P#T=1B(B)
> <nobuhiro.iwamatsu.x90@mail.toshiba>; Krzysztof Kozlowski
> <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org; devicetree@vger.kernel.org;
> linux-kernel@vger.kernel.org
> Subject: [PATCH] arm64: dts: toshiba: Use recommended node names
>=20
> Update Toshiba TMPV7708 node name to the recommended standard node
> names. Generally, node names and paths aren't considered ABI, so it is sa=
fe to
> change them.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>

Best regards,
  Nobuhiro
> ---
> SoC maintainers, Please take this directly.
>=20
>  arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dts      | 2 +-
>  arch/arm64/boot/dts/toshiba/tmpv7708-visrobo-vrb.dts  | 2 +-
> arch/arm64/boot/dts/toshiba/tmpv7708-visrobo-vrc.dtsi | 2 +-
>  arch/arm64/boot/dts/toshiba/tmpv7708.dtsi             | 4 ++--
>  arch/arm64/boot/dts/toshiba/tmpv7708_pins.dtsi        | 2 +-
>  5 files changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dts
> b/arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dts
> index d209fdc98597..8d099b237025 100644
> --- a/arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dts
> +++ b/arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dts
> @@ -43,7 +43,7 @@ &piether {
>  	phy-handle =3D <&phy0>;
>  	phy-mode =3D "rgmii-id";
>=20
> -	mdio0 {
> +	mdio {
>  		#address-cells =3D <1>;
>  		#size-cells =3D <0>;
>  		compatible =3D "snps,dwmac-mdio";
> diff --git a/arch/arm64/boot/dts/toshiba/tmpv7708-visrobo-vrb.dts
> b/arch/arm64/boot/dts/toshiba/tmpv7708-visrobo-vrb.dts
> index ed7aa7e457b1..4439b3e8acbb 100644
> --- a/arch/arm64/boot/dts/toshiba/tmpv7708-visrobo-vrb.dts
> +++ b/arch/arm64/boot/dts/toshiba/tmpv7708-visrobo-vrb.dts
> @@ -43,7 +43,7 @@ &piether {
>  	phy-handle =3D <&phy0>;
>  	phy-mode =3D "rgmii-id";
>=20
> -	mdio0 {
> +	mdio {
>  		#address-cells =3D <1>;
>  		#size-cells =3D <0>;
>  		compatible =3D "snps,dwmac-mdio";
> diff --git a/arch/arm64/boot/dts/toshiba/tmpv7708-visrobo-vrc.dtsi
> b/arch/arm64/boot/dts/toshiba/tmpv7708-visrobo-vrc.dtsi
> index 0c8321022a73..af406f7285c4 100644
> --- a/arch/arm64/boot/dts/toshiba/tmpv7708-visrobo-vrc.dtsi
> +++ b/arch/arm64/boot/dts/toshiba/tmpv7708-visrobo-vrc.dtsi
> @@ -26,7 +26,7 @@ &spi0_pins {
>  &spi0 {
>  	status =3D "okay";
>=20
> -	mmc-slot@0 {
> +	mmc@0 {
>  		compatible =3D "mmc-spi-slot";
>  		reg =3D <0>;
>  		gpios =3D <&gpio 15 GPIO_ACTIVE_LOW>;
> diff --git a/arch/arm64/boot/dts/toshiba/tmpv7708.dtsi
> b/arch/arm64/boot/dts/toshiba/tmpv7708.dtsi
> index 9aa7b1872bd6..88e38d6efcaa 100644
> --- a/arch/arm64/boot/dts/toshiba/tmpv7708.dtsi
> +++ b/arch/arm64/boot/dts/toshiba/tmpv7708.dtsi
> @@ -161,7 +161,7 @@ gic: interrupt-controller@24001000 {
>  			      <0 0x24006000 0 0x2000>;
>  		};
>=20
> -		pmux: pmux@24190000 {
> +		pmux: pinctrl@24190000 {
>  			compatible =3D "toshiba,tmpv7708-pinctrl";
>  			reg =3D <0 0x24190000 0 0x10000>;
>  		};
> @@ -463,7 +463,7 @@ piether: ethernet@28000000 {
>  			status =3D "disabled";
>  		};
>=20
> -		wdt: wdt@28330000 {
> +		wdt: watchdog@28330000 {
>  			compatible =3D "toshiba,visconti-wdt";
>  			reg =3D <0 0x28330000 0 0x1000>;
>  			clocks =3D <&pismu TMPV770X_CLK_WDTCLK>; diff
> --git a/arch/arm64/boot/dts/toshiba/tmpv7708_pins.dtsi
> b/arch/arm64/boot/dts/toshiba/tmpv7708_pins.dtsi
> index a480c6ba5f5d..5ea835fe08a8 100644
> --- a/arch/arm64/boot/dts/toshiba/tmpv7708_pins.dtsi
> +++ b/arch/arm64/boot/dts/toshiba/tmpv7708_pins.dtsi
> @@ -91,7 +91,7 @@ i2c8_pins: i2c8-pins {
>  		bias-pull-up;
>  	};
>=20
> -	pwm_mux: pwm_mux {
> +	pwm_mux: pwm-pins {
>  		function =3D "pwm";
>  	};
>=20
> --
> 2.51.0



