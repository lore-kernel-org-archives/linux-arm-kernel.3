Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AAD3C44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 06:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xITOPNOCKYq3fbypGvULirapDnuGZXgi+PVdlwVVKio=; b=GgwCk/CCBVl9IDmdzzb82z3Q5E
	Voe5d4h6+H5IDUZeEhYHI3qA/K/x2hxPc2ugibjQ91Wu56FfIvWtoe8EPQLq2SRzM6QeboY8B8Ote
	A8XYn6+U08C+Xg1ybxwjSnPDGzmYtMH7Uxl6wdzuXgaRfwJzFRXke7F4AG6b+N1b1JjvwObz1axjT
	EN62LuE9yHYlXi23D3XZ/1WjKeK95+85t0y7PEUdPkRH8rZf9qzpCJVpcgB+ebI9AjUcHtdYtpCvW
	MNBhhjXb3HtDLXC/wZVqwmQFVgHV6XefcqZ2ca+jbtMfjF8PQR/gQarpV8whkamuuJ7w8xo5GWwG2
	oQMPUa5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjtCm-0000000DujD-2hQn;
	Wed, 15 Jul 2026 06:34:52 +0000
Received: from mail-japanwestazon11011014.outbound.protection.outlook.com ([40.107.74.14] helo=OS0P286CU010.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjtCk-0000000DuiZ-1yTU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 06:34:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IHjIPLy7/FKQsqqqVPsL0+i8QmQyVh4So6SO9NA1MuQGYjGInQckhUnWbfxmGwrraHqd6z45Kt/bjDiwidTzA4nbdIDqwgBZ83O0MtB8Hf76u1m9hMdCcHT1vJbZFn7AasxwxtcwFM2ciwtBAo/qr5rWTjNngCAHolGMr93xwKOFx0riuwROv2+m9ZOse6SUdpkSUtsthLFqWfJgVNltkXh9KOgCMS7vsxZGhjl8t/kYd5LYdM/44uYZySBCs3N6U7Lo04qKFwf7rYCRrH3dxDV3lzp96NmZKN2Dz+oHkAwUQrobe/9FeYkjVHqpnHCiOspZhN/xT82BnKHTdzHrRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xITOPNOCKYq3fbypGvULirapDnuGZXgi+PVdlwVVKio=;
 b=xt2orzxDTZSp1Hythu9Yba6Nhyv1sjZUqiGWqw0JqW4qsTdBsnifg3k86RVZQYwO4Tx7h/AoIoMXBnJkGtaeX04sZhSaukWT2STVkisokvfiswOWKbtnL/L0Kjg0wBYaek3yIiY25b+Ilb0T+1Tj0sLoa2YzIBxQlktfiE4KN+PkZeofGUEufwNEmPcOyWAh6tlqnLIlFPTMieMO85DSherdYPQ5x6sCZII/MIe09LxqrZ/xUY7PNLXXauThDN5MEiXjKRz6IIbRD22ftLqmzaU5uDeyDPeoL64bLwgph/OoBc+UgkWAXQKyYLNy+GtFkjRp7wlLQTd4EzyaZ93fUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xITOPNOCKYq3fbypGvULirapDnuGZXgi+PVdlwVVKio=;
 b=YxP+851IBKE3X9Fi4q6QI2f7gFkX6XVP1yQ7UNdFd+1ORzB59Z1ZVGwIdy6kILVyDd49hOJU2uzD0M7QlDdJp1xtfVhI41gQmHdsdG45Hbsb4xiDVKCheQ06Hi0mSkxVv4zZXl3JstFok48lshfDg54gVjQngnGrhe9Qgu+/PYK+GjLErERfRJvKN+SArKsDXzy26M590o19jiJ697ToDpgmR7h6IafMqHhk54UQwjEs6XgNzK13u3s3f5zQfSm5HP9QGmzztKdoqZ+bbCclg9l63IqCpZFkgvaS+w/U2V5i56qv88ColdiOt9s3PhZ8qtNJpBlq8F/ihUNNWQpKoQ==
Received: from OS9PR01MB16920.jpnprd01.prod.outlook.com
 (2603:1096:604:40a::10) by TYCPR01MB6756.jpnprd01.prod.outlook.com
 (2603:1096:400:b3::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Wed, 15 Jul
 2026 06:34:42 +0000
Received: from OS9PR01MB16920.jpnprd01.prod.outlook.com
 ([fe80::82de:de33:b50e:56b1]) by OS9PR01MB16920.jpnprd01.prod.outlook.com
 ([fe80::82de:de33:b50e:56b1%4]) with mapi id 15.21.0202.014; Wed, 15 Jul 2026
 06:34:42 +0000
From: "Shaopeng Tan (Fujitsu)" <tan.shaopeng@fujitsu.com>
To: "ben.horgan@arm.com" <ben.horgan@arm.com>
CC: "james.morse@arm.com" <james.morse@arm.com>, "reinette.chatre@intel.com"
	<reinette.chatre@intel.com>, "fenghuay@nvidia.com" <fenghuay@nvidia.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "dave.martin@arm.com"
	<dave.martin@arm.com>, "andre.przywara@arm.com" <andre.przywara@arm.com>
Subject: Re: [PATCH v1 03/11] arm_mpam: Set mpam_feat_msmon_mbwu_31counter
 when there are bandwidth counters
Thread-Topic: [PATCH v1 03/11] arm_mpam: Set mpam_feat_msmon_mbwu_31counter
 when there are bandwidth counters
Thread-Index: AQHdFCDNEj8HsxbocEa77FgRkKOSxbZuGzLa
Date: Wed, 15 Jul 2026 06:34:42 +0000
Message-ID: <OS9PR01MB1692066CAAC8AAB6AD3362EBF8BF82@OS9PR01MB16920.jpnprd01.prod.outlook.com>
References: <20260710115546.29644-4-ben.horgan@arm.com>
In-Reply-To: <20260710115546.29644-4-ben.horgan@arm.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=True;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2026-07-15T06:34:41.973Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=1;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS9PR01MB16920:EE_|TYCPR01MB6756:EE_
x-ms-office365-filtering-correlation-id: 802e67a6-d3f4-48cb-0927-08dee23b274f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|1580799027|11063799006|56012099006|22082099003|38070700021|18002099003;
x-microsoft-antispam-message-info: tKwK06KvkScYUUoNvm+CrwPBZlfpvDbdcLSPMipCYJljeuiYuDPOIZwFst+X5LbvBQRSmN30Er7E2pbCD0mt4yYmrDMWql8GplzhHTJv+40EL2AA2VjYmWe6d4XrndA89tTeptaS8GJkUqEYyCm90/h9h7Pmntm7Rh9zHsghAc2VXuAl1ULvMl6Xiq8juh60Cjyt4FqzsMfQwSGTiSITvxh50rtdKmqjNJsvRxdfuAywxO0yhjdpLpW1VKej1PBJGgF4cZwDBFOD4ENun6T1pQT/vwr5l8MmC2TEL34gcgq82q/PHA6obTycGjxhF7xAzIil1ip9S/NDEKiFKH/5BqQiZMOI79MAr56ElNu/ys6jB84Ba2V+L18V3RaiVmx270KmHQWTkjf9qx5blUK7rD6fmRQYq2vZ6W12fOyJnLD8tx0syB6jPtE0YAtdA1iAzlf8FX37Uue4StarVbCOMOdypeljnGflsCIUtZE8CMRc5nFOlMshaRCkL8ejqirzQ4RClWdZDDbUaU7zqCrl9nYDygZ3A437iUdXd0lAi1Yk/pEppzTHLx7B2rq1/lJvumbpO5o9FiQKGEXThaBWMEpk8n1NLy6BifgakiOlvRXLsReq5KLWcMklgQxyPJ6XzGpWNS8v1t1cqsiO1tyOCepTZnEI6dEbF+YOWd6ta4vaekZSz8YZAPNuVEwFp6Ou82ZRL+3453b4lG02089n+h4Jz3QTPs0v5/LdRdVReNZdQro/sPwj2w7w1CCkAvu2
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB16920.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(1580799027)(11063799006)(56012099006)(22082099003)(38070700021)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TFFmZU9YQXlnKytzbUppVWVHcDVBTmgzSTVpbUtjSTE3SWRRMjQ2TW10LytT?=
 =?utf-8?B?RGhWVG9xUWhkeENqWlZ3WjNOQlFhak1oNW9aZFR4MDlYelVyaGo0NEZoZGly?=
 =?utf-8?B?Q05TYk5Mb3hzYmhwQXdCekM5a29PbENhTzJwd3BSYk0veEZrMENlcEsycnoy?=
 =?utf-8?B?L1ozKzV1UTNoVHEwYlJzLytkTldLR3FGcnJHN29IOEhiSzJqSzd6eGc3elpC?=
 =?utf-8?B?akF4VEhpRXpjQmJUU1Z3WlIzaEVPVFZSeit1S2RsQnhzbDNWbHUvNnZjSE4r?=
 =?utf-8?B?emJGM2hZZ05UZ3ZVVjluRFVBdGJ2dEJMMENGU2NTdy96QTFlQkdXdEFEdXVp?=
 =?utf-8?B?YnRUd2YzUjAyTWIwZFVkUjR5VkwxeUtFKzdOR1J4OG1xNGFpUlgyRlZFQVdj?=
 =?utf-8?B?aDJwUDF3UitPNFhoMmFlSEMrdkFIY0haRW5JQXRpMWNmS0JoblJoNWh5WnpM?=
 =?utf-8?B?TGR5K0RQRTNaMy9wVDgwL1l3RUswMHBlWWVmbTlqbVZOVEVpS3BwbXRGNWhy?=
 =?utf-8?B?azhtckNSZnRaa1hXYkFLZWpKcDJYd0FNSFhJTVcwNzE2blVzSHN0VWdSalYr?=
 =?utf-8?B?bkJFTEdHNStDMnh2UUVRK2w5T21id1RDcVU3WVFQMGxsZGNzRDI0bzJvUVp3?=
 =?utf-8?B?L2tiRG9PWmRad1psQjRCWmZ0enRDblp1Und2ZGlsTW5PY3RzSHB0U2FGRFVo?=
 =?utf-8?B?azl3Y1NybXRDanppek5QMWI1ODlXbno1bEt3ZjZwdnFuZCtQd2FROE1FL3dD?=
 =?utf-8?B?SjVYamNwelkyb3kyREU1WXhjYlEvMnNEK0YxVEFweGNSVldjZEdUQ2NHZEhB?=
 =?utf-8?B?SjNDZDlIWTBJVDBlOGJuSndqa0dMOE1aN255a21Fa1NRNGdnWUZtUkQ1L1JS?=
 =?utf-8?B?bGx2QTZsTE1wTTRmTWZGK0tBeFlSZ1NlTUxTZkJURXNLdlVmSmdDTDVzZCtt?=
 =?utf-8?B?M25ZRFpEMzVtMEFnR1VGRlJwemVWVmFRa3Y1ZkNjNTI3NWFwZG0ydUNxSmZh?=
 =?utf-8?B?OHdZRGxXVGlaVVRRRzhkcDIyUElwTlBidWR1VHNIUk93U1RHQlUwSkpPeHJ4?=
 =?utf-8?B?M1lHNHlFUEw3SFhOeTNvNCtQTnEvT1FzUlY3QmdIMjcvUVlPd1Q2ZUhjZDlt?=
 =?utf-8?B?R1BnakpSWjVobThvT0FUaU5TcjJzdU9ZSHVVOFV2eW9MRVQ3SFVFbkpwbHdG?=
 =?utf-8?B?dWZzU3EydXExV0VnTE0ydHR0T1R0QUJLdnhkSWdJSHFrWHgrSkw4MHNuVVhm?=
 =?utf-8?B?TnBFTysrTzRMaDZGWThxZlRVY3gwcFZCVDBJcE5zU2F3UzBkZWhRcmMrWERI?=
 =?utf-8?B?cWtZbE1VdjUzd2IwSGZZTXovb0ptSm51WTFvL1dqSU5wZmdvZUlNTmNWSXFM?=
 =?utf-8?B?QVNldys0R1ZoV3FYclVFWUNtVllvb0VUc1pyeWNrL3dNRDJQMFdjMk9UbzBy?=
 =?utf-8?B?NS82Tmg4T2c3QWhxU1RyNzJhUDhTTXQ5ME5DNGc5VzRSbGVYYUhsNU5DWEdK?=
 =?utf-8?B?c1BlaHh4aXgwa0tBTi9GL3JkelpMYS9hTVlxNFdja0l3YTgxNWw5dUluN3Z5?=
 =?utf-8?B?cHRoQ2I3OURKZ2FYdUtpcGRqdXBqNEtodEFLTGg2VlZWd09EbWxiNm1sNXRK?=
 =?utf-8?B?YmFCSm1PUTV3S0J2QXVKeXZNNnlCeWtER2JocXRzeW5FZGw5WllXTHhHZEha?=
 =?utf-8?B?QjhBVnhRQ2pYWm5IbGxZcVI2MVlER1RUdVZnYmlObXl6RzdjbDZpZnMrZGRO?=
 =?utf-8?B?V3BGTVM2MDhJc3FHR2l5aHJwckNtN3I0OHBZRVRzUUU4cUlIMTkvUWFTRlVW?=
 =?utf-8?B?UzkxVEpPK0N6RjN3WGFtVGZDdVd1MEhCUzV2OGZ5QXJ4c2o4YmJPQWZFZndI?=
 =?utf-8?B?bk5CeWdUV1NpTFJFM3pVSDhxM2ovVXZHZ1hMUitBNHlKMWR3UnhITVVIbW1P?=
 =?utf-8?B?TTlqalNmMzJENHJ1cVh2UkMzQVN2Wmx3RHpCRk1Hb0FBdE1JV0huWXhNQlgz?=
 =?utf-8?B?dDFaYVNBTG5WTjNQT2VWS1cvMWlnTXAyZnY4YjdBY3paOUtMZjNSS1pvMjcw?=
 =?utf-8?B?bWVTYytYVXRSaVc3NVYrV3p6WFZ1NnN1bWxudmV5L296SGQrSkxDQzMzREVM?=
 =?utf-8?B?LzRvK2kwV0tlbVNRYm55UTg5Zjd2ZS84bkNXbnNkaERCdVRVa0RpUW1BaGhJ?=
 =?utf-8?B?NWdTQ3VPb1VHOTVlWlNKT2IyRnVibFFONzZ1NlUveEJJZ0RQUUVGNW16eXpj?=
 =?utf-8?B?TWFkOExYTytIblBBaE5OMmlXY0pycXEwTVRMbjNxeDFHbU9XV2lPKytacURN?=
 =?utf-8?B?TnpyV3ZIdnlLQzdJWXplOUM1RDhKM0l5Z0JkeUtJODlISUhHYzRGQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: dD0oZ7qWEA4jAkvT15TzoVbYQ9gV9cy7yxR7LwzOvstBmPIFb1peAdDk1gX/r2Sq1LYJZ3uq+CdH30dPwCOHtR4uXSDlaT9n2yV/mbeH/sFbVsed18s2rAePFt5EAiAXUMrF1cnjoK/FPCeQjjWvSSErSWJGvJsgm7yDL38CmSTiU/Q3eGnfDgmSO0mVsvs+5SnRNGy+LnOQzjmM/jkVBV6nGG3sGiHemEsAr1zhicCB7Mj2+iPU4MUUaFeRoQRu8UeSdrQiX7vJR67GX8jy4LOhtoy8G9dyPM9ov4rLE4CQDGoBHPnUgjghhzcBNl5Mb3lnqf5Uo7eqDbfC03uqdw==
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB16920.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 802e67a6-d3f4-48cb-0927-08dee23b274f
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2026 06:34:42.3030
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WX7hmMwffMzyxtkdi9GYNTlxJZw0FDdQ2l3zXREaZLYplAiL3Zju9/hMDrec4v3Gnbh+8dJSDgdtmVjAffgg2gPQQ6cvpkt3XlRRbi9U7ZM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6756
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_233450_530198_3BE6FF33 
X-CRM114-Status: GOOD (  10.36  )
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

SGVsbG8gQmVuLAoKPklmIHRoZXJlIGFyZSBtZW1vcnkgYmFuZHdpZHRoIGNvdW50ZXJzIHRoZW4g
dGhlcmUgYXJlIDMxIGJpdCBjb3VudGVycyBldmVuCj5pZiB0aGVyZSBhcmUgYWxzbyA0NCBiaXQg
Y291bnRlcnMgb3IgNjMgYml0IGNvdW50ZXJzLgoKQWx0aG91Z2ggMzEtYml0IGNvdW50ZXJzIGFy
ZSBhbHdheXMgZXhpc3QsIGFyZW4ndCB0aGV5IG5ldmVyIHVzZWQgc2ltdWx0YW5lb3VzbHkgd2l0
aCA0NC1iaXQgb3IgNjMtYml0IGNvdW50ZXJzPwpJZiB0aGUgYG1wYW1fZmVhdF9tc21vbl9tYnd1
XzMxY291bnRlcmAgZmVhdHVyZSBpcyBzZXQgdG8gYWx3YXlzIGJlIGVuYWJsZWQsIGNvdWxkIHRo
YXQgcG90ZW50aWFsbHkgY2F1c2UgYSBidWc/CgpCZXN0IHJlZ2FyZHMsClNoYW9wZW5nIFRBTgoK
Cj5TZXQgdGhlIDMxIGJpdCBiYW5kd2lkdGggY291bnRlciBmZWF0dXJlIGJpdCB3aGVuZXZlciB0
aGVyZSBhcmUgYmFuZHdpZHRoCj5jb3VudGVycy4KPgo+Rml4ZXM6IGZkYzI5YTE0MWQ2MyAoImFy
bV9tcGFtOiBQcm9iZSBmb3IgbG9uZy9sd2QgbWJ3dSBjb3VudGVycyIpCj5TaWduZWQtb2ZmLWJ5
OiBCZW4gSG9yZ2FuIDxiZW4uaG9yZ2FuQGFybS5jb20+Cj4tLS0KPsKgZHJpdmVycy9yZXNjdHJs
L21wYW1fZGV2aWNlcy5jIHwgNCArKy0tCj7CoDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCj4KPmRpZmYgLS1naXQgYS9kcml2ZXJzL3Jlc2N0cmwvbXBhbV9k
ZXZpY2VzLmMgYi9kcml2ZXJzL3Jlc2N0cmwvbXBhbV9kZXZpY2VzLmMKPmluZGV4IGFjZmE5YTRk
YzJmYy4uMTFiMTBjM2JjMzM0IDEwMDY0NAo+LS0tIGEvZHJpdmVycy9yZXNjdHJsL21wYW1fZGV2
aWNlcy5jCj4rKysgYi9kcml2ZXJzL3Jlc2N0cmwvbXBhbV9kZXZpY2VzLmMKPkBAIC05MzAsOSAr
OTMwLDkgQEAgc3RhdGljIHZvaWQgbXBhbV9yaXNfaHdfcHJvYmUoc3RydWN0IG1wYW1fbXNjX3Jp
cyAqcmlzKQo+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1wYW1fc2V0
X2ZlYXR1cmUobXBhbV9mZWF0X21zbW9uX21id3VfNjNjb3VudGVyLCBwcm9wcyk7Cj7CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBlbHNlCj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgbXBhbV9zZXRfZmVhdHVyZShtcGFtX2ZlYXRfbXNtb25fbWJ3dV80NGNvdW50ZXIsIHBy
b3BzKTsKPi3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgfSBlbHNlIHsKPi3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1wYW1fc2V0X2ZlYXR1
cmUobXBhbV9mZWF0X21zbW9uX21id3VfMzFjb3VudGVyLCBwcm9wcyk7Cj7CoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0KPisK
PivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgbXBhbV9zZXRfZmVhdHVyZShtcGFtX2ZlYXRfbXNtb25fbWJ3dV8zMWNvdW50ZXIsIHBy
b3BzKTsKPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9
Cj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj7CoMKgwqDCoMKgwqDCoMKgIH0K
Pi0tIAo+Mi40My4wCj4K

