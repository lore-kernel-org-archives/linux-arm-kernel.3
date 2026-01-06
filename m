Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E21CC47BC2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 07:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ICY0yWojb1FJhvOYvNOqGsdE7O0euJuaw4S8duunJeE=; b=vPtMaeb56c/TzYJ2neAjgueTvw
	0C0vB5RMRUev1gnHs4ACEggcc2+bORdn7do+4sA1Tj2EyOPRrRZDig7Vujm7m2YBdKdKWTV0z6YNc
	W2BlRle2Vm9bhh7WLUH3fihqJ83sJCgBBDPM7U5WuUEz6dOwQ3I1g/SC7LXTt+Y54Bm/sK+/hdV2L
	hwISOcBwK2Z9nYTizqta5Nc6Cq7e+ViS5zT+a2qwe54O0FZ2OwCST/U5NW3bcvvMPyFXxoRx+wzhq
	dozBFb6iigPa9miyzpq1jla7MlbC96bAhK/mPoBGPYL25EZJqvRHOP1G0c8xnL83lt8NJU7AtKmZN
	eooEgjDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd1gn-0000000CXLY-3vnO;
	Tue, 06 Jan 2026 07:41:14 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd1gg-0000000CXJl-2NzU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 07:41:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aahTQHsXnKM9ULkO4hfPpjO3sZPCfkVjdLwuESTQG+5TnqpgR25CiOrlmTEhxjSlMuOFFzq8tkPdl24i8QM+HXoBOOWKMi6dlYj76CU7IQIn4Fk0gr2eDMLZDZT5ukyPaSKup/humv1wu0UnxxmiwNouMDYrCp1yJB9kBFndrCyj+li2pfQ9vqAiJFXwJnRFNO0Bi6ElqOWXSp0/CjM1ucq+Lin2DIfTlXVr+VJ6+3qdSSSV5pUKKU2fbawGPT8ewQq05kxJckkTlvZxYNQpyVkr6O22DMEv+BWdpmq093MzBVBYjJGLyY3vHvMOkhJ5HVVlX2AG53C7yL3qBv2NqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ICY0yWojb1FJhvOYvNOqGsdE7O0euJuaw4S8duunJeE=;
 b=KbYpg0Pl7KJjs8BNyUJr4Dd2KFz8jZSnIaqoEOZMjyG+D45vyrZbcwv5PngV16CQG81rBEhr4Y+JV/eJkG1zTXX88LH2KU7d1cgCATux3SPpwsOgM2TwvDCMrRkDcSe82VO9IxYRhPgCA9pa/HQe30jEvSA6S8gtAxLKvwx1y4Mvs16xKIycO38Su32tOouTwdlh3PdiJ6ej8OKMA7dqrURnh5Ay3In3EI/mzCiTXuXq5mZmxcD3Ui8YnljGwnZS/cjqERfcHDvJ1qNTDH7lu7RacP43Fka0+o82Db4ehW52hMV0hT9e2Hf8/+8GlxKy7cXVmfStxy5zgwMghT7V9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from PUZPR06MB5887.apcprd06.prod.outlook.com (2603:1096:301:117::13)
 by SE2PPF3C2682CAB.apcprd06.prod.outlook.com (2603:1096:108:1::7cd) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 07:41:02 +0000
Received: from PUZPR06MB5887.apcprd06.prod.outlook.com
 ([fe80::611c:7f38:af2e:22d]) by PUZPR06MB5887.apcprd06.prod.outlook.com
 ([fe80::611c:7f38:af2e:22d%3]) with mapi id 15.20.9478.005; Tue, 6 Jan 2026
 07:41:02 +0000
From: Gary Yang <gary.yang@cixtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Peter Chen <peter.chen@cixtech.com>, Fugang Duan
	<fugang.duan@cixtech.com>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "linux-cix-kernel-upstream@cixtech.com"
	<linux-cix-kernel-upstream@cixtech.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: =?utf-8?B?5Zue5aSNOiDlm57lpI06IOWbnuWkjTogW1BBVENIIHYzIDEvMl0gZHQtYmlu?=
 =?utf-8?Q?dings:_arm:_cix:_add_OrangePi_6_Plus_board?=
Thread-Topic: =?utf-8?B?5Zue5aSNOiDlm57lpI06IFtQQVRDSCB2MyAxLzJdIGR0LWJpbmRpbmdzOiBh?=
 =?utf-8?Q?rm:_cix:_add_OrangePi_6_Plus_board?=
Thread-Index: AQHcfU9MA9pbVtmtv0ykgDJk1l8qrbVDPd0AgAAFxICAAAbEgIABSZcwgAAm34CAAAkZwA==
Date: Tue, 6 Jan 2026 07:41:02 +0000
Message-ID: <PUZPR06MB588702988BAC0F34DFDCD6ECEF87A@PUZPR06MB5887.apcprd06.prod.outlook.com>
References: <20260104075400.1673101-1-gary.yang@cixtech.com>
 <20260104075400.1673101-2-gary.yang@cixtech.com>
 <20260105-excellent-uakari-of-joy-f0dfa4@quoll>
 <PUZPR06MB588755A9FB6B42AAA870E30BEF86A@PUZPR06MB5887.apcprd06.prod.outlook.com>
 <63454553-01df-4c40-aad3-7ea64bef685e@kernel.org>
 <PUZPR06MB5887263D5B0A6DB373816925EF87A@PUZPR06MB5887.apcprd06.prod.outlook.com>
 <33a70735-8058-4c2c-91f4-2a3ed0e0274d@kernel.org>
In-Reply-To: <33a70735-8058-4c2c-91f4-2a3ed0e0274d@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR06MB5887:EE_|SE2PPF3C2682CAB:EE_
x-ms-office365-filtering-correlation-id: 6859adc3-c41c-46c2-e177-08de4cf6f104
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?TnpJdk90bnhpYXFxQzJ4WjRKSnhkOHBYaFRWWHJkNXlRS05iWC9Jejd0NXQ5?=
 =?utf-8?B?STdIcG45TFhWYW9ORW41N3B4dlpCaHM5UHIyTU5VUSt5RkFXWEVlcWowbVVs?=
 =?utf-8?B?S0RucGJLU3A3Zm4xOXZmOVE4TnorYWlTNUlRSi9XRjdYNzR6OUpxMGRNKzcz?=
 =?utf-8?B?U0diRjc3Sm4vbmRNM2FGTGNONUtKRVB2am81WFZaZVo1MWxHcENFZWZwdVZu?=
 =?utf-8?B?VzZtSTNBMzR6YTdsWmg0R1E1SkpwVk1pSEt2TU1FdEM2NnZkTGRLc3JDRkN5?=
 =?utf-8?B?cU5KWVBIcUZPWkxjVENOcGREbjdyb2k3a0dRcGh1NXNmQ0dXbmtxRkNZQzJm?=
 =?utf-8?B?WjYvd3FqRkZkakRzWXA1OGR4RnBvQWNBVzk0d1lyT1ZOaXpVUGF0UjU1Y29C?=
 =?utf-8?B?YlZNVTdTRUhHblFjdkZhYlluRjlyeXQxZUdHOWhGRDR0Q255ZmQ1MGdlR1pE?=
 =?utf-8?B?aUlHK0lnYzhPZ3hETUxFc0FPcTgralE0WG9wM3dLWEU3NURnL2FOdSs4RzR4?=
 =?utf-8?B?b0hiYVJMQVRCL3M5ZStqNmtPN201VVBkM2NTcFI0L0JiUEE4YXg4WHdIR0RK?=
 =?utf-8?B?ZWV1RUNleWhBWk9UcUZteHRXNG1raWNSL0JESmhuNWZpYmNCeEFXWHpoMXZC?=
 =?utf-8?B?VGdaMDJLcnhaQWgxVUxGK0lucGdjZUsxSm56RXREL0dBZVUzUDU1ZnIvMW54?=
 =?utf-8?B?SVNhZnljMjJxQXc5czA3eXJvYlRaMzBOamhkOE9zdTNrdDlMWWo2Z0ROVWZt?=
 =?utf-8?B?ZDV2NlhIaFJmWExJSDdXb1hSVFBiNkEwUzVLMWtwTWdTZkdPeUpvZ2lHTkdH?=
 =?utf-8?B?WXM4R3I2M2w5NUZuRWlKM2s0STlIcTJDckJFM0x3cHdkNThuaXYyR1RRTExq?=
 =?utf-8?B?ejJQUHh5dStRNFlmUU1iQUdUS1VRRHdpWFhsMzE2Y28rNG1XRkMzQ0lvaTRQ?=
 =?utf-8?B?THNlZkdhWGJneFo1VkoyVDNwRENYalpNQWx0bVNkV3dua0FMMzkwcWJqUUhF?=
 =?utf-8?B?MXMwUkZ2MkRic2FnOVdidmNRMElaeC92ZW12YWhtWVJLMVgvL3l6T1dtcmRU?=
 =?utf-8?B?bzZvRllCajhSemE0bXV3ckUxUGEwbDBYV1ZBK3NrYVVmdHRsYmdUbWVmemdY?=
 =?utf-8?B?QVo3SnRzd056b1NUTEQyNkd2MlVCUzF3SmpZMGI1KytFbFlqZHRhV1F6eStO?=
 =?utf-8?B?aHlRMUtrVWtia2c2VzRUd0FobE54aHNXYUJnajZmM051Tjc5Y3EzSzNtbUJt?=
 =?utf-8?B?NG9ES256NjZnUHYvTnhvSERDU3ZldXJYUmtwNDdxYzdSZ2pMSUhRNlk0MVJQ?=
 =?utf-8?B?czNXNk5tVFlkV1NFdmhqcmtQNkpwclhzZ0FOU0xZdmdRc2kxKzJ5SlBHdCsw?=
 =?utf-8?B?S1RkYVNNV3U1UytmUzBOY29ma2ovck1yRnpjajQ4UDdqSTFzcWVCTTNYMWlL?=
 =?utf-8?B?c29FYXBBQkU2SGhsdXZWQS9adVAwcUlNT1NHQk15cExsQU5kem4zYWNBeENB?=
 =?utf-8?B?VTNMZFUyaUlwcWdNcXErV05MTVM3Y1N4MFpVc0M5TG01SkNRUWxEaWMzQzFW?=
 =?utf-8?B?NTBZS1lkd3prNDczVEtZa0NZcDNTeXVpbjJ4c05XdmtwaWlEaWZNcHNhV09s?=
 =?utf-8?B?Tml0REczcytaWHpudlpHVDZsM3BHTTFjb2RFYk52bDRkWk5yVTlBWmpRVzhL?=
 =?utf-8?B?N2l6bWkzRm1aS05Wd3JicExsbERFTEhWR3JzRlk1anNOUVVHZzZHdWZta1Bo?=
 =?utf-8?B?dnR2a0l2L2Z6UnluQnRnMllESS9IdVRFQWNKSjYzUGpTdjRGWUI5VStKNzls?=
 =?utf-8?B?a3ZLNi9mbmg2YkdTQ1lpODJ2TXJORi94d3hVTkRTdXQ5MXdXQk4wTElmdGhN?=
 =?utf-8?B?V3FFMGg3NnBMbXV3bTlYWVpXWlAzanc5c0EreXUweVhpTVJqOE16SEdxNjZ0?=
 =?utf-8?B?bGVxbDFJc243aXVIclhyNlZuYnRORjU5WUgvOUdiRGlISlFBTUE5OXhsb0k1?=
 =?utf-8?B?RWZLa2czRE1wRWlmSDFBMWhyeU81UGFvL2xTaWpRWFZzYjVUN3pLZ3puR005?=
 =?utf-8?Q?6vFUmm?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR06MB5887.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YWZwOWRqaTlBYm4xNHRLU0Fvc3hvdUdwQm5UUFRFM2Qvb2tpSDlvOHIySFlV?=
 =?utf-8?B?c3F2S20zd2VaRlhDL3NFQ2FnYi9xYkd2a25nT1UyTGh0ZHphOCsvampsTjkw?=
 =?utf-8?B?SVZ4NGw3emJCWUNKa085RXVudVp0bWNkckZubVZ4RjZxRkZ0SzR3SjdWU1hO?=
 =?utf-8?B?a05CaVc2NFNNeFQ2eFVyNVJMb3pBZExaNTBCOXJocGQ0WEd0MStTcVQ2citL?=
 =?utf-8?B?WWVvMTJ3aVNhT243UE5rOTJ6OVprbjJVcUwzZlRkRi96U1c2MjA2ZEM3Tk94?=
 =?utf-8?B?Z0wxOGtOUE5YQzFiY3JNMitoOUJxZStHZkJXOC9OMkprSWNDUkhyS0NLU0ZL?=
 =?utf-8?B?cnpFaTVGc21KYTlXQTl0UFBHZWlrMXgxcEtkcWQrRWY0dWdnN2lmSldiMSts?=
 =?utf-8?B?NVQ4NWsvU1E1bXh0TUhpT1NZNC9lVEpLMmFyY2U1L0JQK2RhQlhDV09GVWFM?=
 =?utf-8?B?WENBb0lPa3l4M0w5MXM3M2cwSHo0NEFpYm9FbTB5MXY2YUNIdkVyaHNGaXNy?=
 =?utf-8?B?Y010Nm02dkhhejh3NkJ5OWdld3YwZWZnZDlsNE9MKzZCYW02cFRHMWxXazA0?=
 =?utf-8?B?L0FhQWVsQlRod3gyUmlScU5LK2krTUZtMDZBTTFsN2kwSDlSUUNGZExqQTAz?=
 =?utf-8?B?bnI1V256bm9VUHUrMmw3eEVvSTNyRS9DdVhXeCt2TGR5YnNobWNVcW9sK08w?=
 =?utf-8?B?emZLTnJPem9FcEV4ZkNnRy9pVjNHaXhHTUhCa1d6WE82Mld3QXlUQ1h0MVBt?=
 =?utf-8?B?NWZXWnJOU3ZqVWVQS08xRXRTTndPN0JKcUhLUTVlM0VXTHgvNEtyOUNFbFlK?=
 =?utf-8?B?c09UcVRucXBrM0FVYlFpdHdOWit2MGdpS0ZpcmlJOEh6bWd2Y0VUamxLeTZK?=
 =?utf-8?B?bjVKcURtK2sxNUxmK2ZhQ0srdEFxdmNFVTgyTkRHZnk1MW1CVDBxWjJ6Rkg3?=
 =?utf-8?B?d0RhbXZsajFMQzJnTTd0UENFY25QcVM5bzJUTnRyZVdqbHFZV29iUllwY2NE?=
 =?utf-8?B?bjlldGZlRzZmWVVIY1gwU2hxampueStVMzdVbDkvMkhlRGtNaHJvNUFUVWQw?=
 =?utf-8?B?VEI4THRCcm1zMkFXTXVVTkFWTWJiZ0puczc2N3drbkMyMzVFSWg1Rm5Ub3Z3?=
 =?utf-8?B?b2dVc2dkSFBNZ1lsbnloZ1YyanRUbHR2V1ZoUWJrUzU1K2MwRk9YaHNZMUFy?=
 =?utf-8?B?bGhCbkluZzJNYXZQaElJWFhDL1FmakhXU0VHRzRsdE1zVTNRYWNvZVJUZklM?=
 =?utf-8?B?ZGpDWk5zQ01kclhBWjdQV1BzWlRUVGlRUXlxV2pxdWx0WE1iTlBrVGFwaTJv?=
 =?utf-8?B?SjkzdG9yN2l6d0xKYkwza3hvQVMxMUJGRTV0MWtRYlFXdVNRYkJGQjdaa2s0?=
 =?utf-8?B?dWVseU5tUUIrdE54ZjFYRmlIaC96OXNIZTI0VU41ai9GTDN4U2JkbjZkMU1o?=
 =?utf-8?B?NGpNeUtSd3FTcnd2UG9LcjV3NDhSczE0UVpnaEdrSzNpK2hMMmx6T0xEcXd1?=
 =?utf-8?B?Tlk0YStSOHVmWWk5QXNWVDJWTTdVL3hpQlR1R2NlOEpOMFVEQ3BNVy9BNDli?=
 =?utf-8?B?TUVqK0tTNlozSVNXTGhsc0pqdS9WYzlZZWpaSWhzZ0NUdjJodXUzaStIUnhB?=
 =?utf-8?B?cTFTa1VvOTQ2ZlBCSjNjazBiQk5HS3djZDU1MXgyTUdodDVwNEZWL2RzQy82?=
 =?utf-8?B?OFdtdXVBYVFoSWVRdXR2dGlhUjNiQTAzUktwQ2piRTIrT1N1eXlVZlN2YkJq?=
 =?utf-8?B?Q0UvMWpxMDRpVXB4Zm9kaUQwUTNLK1ZoTXdvZFRMSEswVXZseFd4VkFOSEFL?=
 =?utf-8?B?ZDZZY0h6RTh0ci9pNlRnMU9CQm9DUERpUVJKYkVEYi9ZUjArNlVvTkxTamxH?=
 =?utf-8?B?Q253TWJtY0JtZjJjRU1oTDIvUC9MREF4MU1OYVlJZ25sbUo0b2pmQnJHVjEr?=
 =?utf-8?B?OVcvTnFjM2N0c1ZyUXRkQlAvaFhPTklabW9uY3gzZzdNZVRSYWJhdGU4ZlhX?=
 =?utf-8?B?alhINmxxaVNRL2ZrdnZSY29yQVBiM0p4N3EvWktqZFg4WUVBenR5aWtqMVRw?=
 =?utf-8?B?d1RGeUpRMEpyazZETVc2VlB6Yk1Kd3JoOUpGOWw1MGlQMXo1MTEyZVZUb1lv?=
 =?utf-8?B?dCtFS1JlRG1nZjVMQndnMWhlS010ZVMwY040VDdpZnpDUmorVDYrS3lXOVpP?=
 =?utf-8?B?enI2cWt1dzFLZXE5ZkVpV1BodjFJUDFkbEh0VzhKT01GeWtXZllySGovM3FD?=
 =?utf-8?B?WmhxbjJuOFFRVGtNcVZWZEFmUVJSQjlmQ1Ayc2RKTEFpQXFsNmF3b05Xak1K?=
 =?utf-8?B?MmFvNmRBUi9oQlhFb0txTVhtOTZZMENtQTYvOUpVbWIvSlFENkZ3UT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5887.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6859adc3-c41c-46c2-e177-08de4cf6f104
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2026 07:41:02.1930
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A7eUpKfLb+U/JshcNTiNbnMPV/YVd9If3QcSVfg9FARZI0B5HXdSv+rxzc4pnw1/fewQB4zhtZf5Iu+4IdN/lA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2PPF3C2682CAB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_234107_663387_0FF31D91 
X-CRM114-Status: GOOD (  26.78  )
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

SGkgS3J6eXN6dG9mOg0KDQpUaGFua3MgZm9yIHlvdSBjb21tZXRzDQoNCj4gRVhURVJOQUwgRU1B
SUwNCj4gDQo+IE9uIDA2LzAxLzIwMjYgMDU6NTIsIEdhcnkgWWFuZyB3cm90ZToNCj4gPiBIaSBL
cnp5c3p0b2Y6DQo+ID4NCj4gPiBUaGFua3MgZm9yIHlvdXIgY29tbWVudHMNCj4gPg0KPiA+PiBF
WFRFUk5BTCBFTUFJTA0KPiA+Pg0KPiA+PiBPbiAwNS8wMS8yMDI2IDA5OjQ5LCBHYXJ5IFlhbmcg
d3JvdGU6DQo+ID4+PiBIaSBLcnp5c3p0b2Y6DQo+ID4+Pg0KPiA+Pj4gVGhhbmtzIGZvciB5b3Vy
IGNvbW1lbnRzDQo+ID4+Pg0KPiA+Pj4+IEVYVEVSTkFMIEVNQUlMDQo+ID4+Pj4NCj4gPj4+PiBP
biBTdW4sIEphbiAwNCwgMjAyNiBhdCAwMzo1Mzo1OVBNICswODAwLCBHYXJ5IFlhbmcgd3JvdGU6
DQo+ID4+Pj4+IE9yYW5nZVBpIDYgUGx1cyBhZG9wdHMgQ0lYIENEODE4MC9DRDgxNjAgU29DLCBi
dWlsdC1pbiAxMi1jb3JlDQo+ID4+Pj4+IDY0LWJpdCBwcm9jZXNzb3IgKyBOUFUgcHJvY2Vzc29y
LGludGVncmF0ZWQgZ3JhcGhpY3MgcHJvY2Vzc29yLA0KPiA+Pj4+PiBlcXVpcHBlZCB3aXRoIDE2
R0IvMzJHQi82NEdCIExQRERSNSwgYW5kIHByb3ZpZGVzIHR3byBNLjIgS0VZLU0NCj4gPj4+Pj4g
aW50ZXJmYWNlcyAyMjgwIGZvciBOVk1lIFNTRCxhcyB3ZWxsIGFzIFNQSSBGTEFTSCBhbmQgVEYg
c2xvdHMgdG8NCj4gPj4+Pj4gbWVldCB0aGUgbmVlZHMgb2YgZmFzdCByZWFkL3dyaXRlIGFuZCBo
aWdoLWNhcGFjaXR5IHN0b3JhZ2UNCj4gPj4+Pj4NCj4gPj4+Pj4gU2lnbmVkLW9mZi1ieTogR2Fy
eSBZYW5nIDxnYXJ5LnlhbmdAY2l4dGVjaC5jb20+DQo+ID4+Pj4+IC0tLQ0KPiA+Pj4+PiAgRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9jaXgueWFtbCB8IDExICsrKysrKysr
Ky0tDQo+ID4+Pj4+ICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQ0KPiA+Pj4+Pg0KPiA+Pj4+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2FybS9jaXgueWFtbA0KPiA+Pj4+PiBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9hcm0vY2l4LnlhbWwNCj4gPj4+Pj4gaW5kZXggMTE0ZGFiNGJjNGQyLi45
ZTEzMmU2MDliN2IgMTAwNjQ0DQo+ID4+Pj4+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9hcm0vY2l4LnlhbWwNCj4gPj4+Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2FybS9jaXgueWFtbA0KPiA+Pj4+PiBAQCAtMTYsOSArMTYsMTYgQEAg
cHJvcGVydGllczoNCj4gPj4+Pj4gICAgY29tcGF0aWJsZToNCj4gPj4+Pj4gICAgICBvbmVPZjoN
Cj4gPj4+Pj4NCj4gPj4+Pj4gLSAgICAgIC0gZGVzY3JpcHRpb246IFJhZHhhIE9yaW9uIE82DQo+
ID4+Pj4+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBSYWR4YSBPcmlvbiBPNiBib2FyZA0KPiA+Pj4+
PiAgICAgICAgICBpdGVtczoNCj4gPj4+Pj4gLSAgICAgICAgICAtIGNvbnN0OiByYWR4YSxvcmlv
bi1vNg0KPiA+Pj4+PiArICAgICAgICAgIC0gZW51bToNCj4gPj4+Pj4gKyAgICAgICAgICAgICAg
LSByYWR4YSxvcmlvbi1vNg0KPiA+Pj4+PiArICAgICAgICAgIC0gY29uc3Q6IGNpeCxza3kxDQo+
ID4+Pj4+ICsNCj4gPj4+Pj4gKyAgICAgIC0gZGVzY3JpcHRpb246IFh1bmxvbmcgb3JhbmdlcGkg
NiBwbHVzIGJvYXJkDQo+ID4+Pj4+ICsgICAgICAgIGl0ZW1zOg0KPiA+Pj4+PiArICAgICAgICAg
IC0gZW51bToNCj4gPj4+Pj4gKyAgICAgICAgICAgICAgLSB4dW5sb25nLG9yYW5nZXBpLTYtcGx1
cw0KPiA+Pj4+DQo+ID4+Pj4gUHJldmlvdXMgcGF0Y2ggd2FzIGNvcnJlY3QsIG5vdCB0aGlzIG9u
ZS4NCj4gPj4+Pg0KPiA+Pj4+IDxmb3JtIGxldHRlcj4NCj4gPj4+PiBUaGlzIGlzIGEgZnJpZW5k
bHkgcmVtaW5kZXIgZHVyaW5nIHRoZSByZXZpZXcgcHJvY2Vzcy4NCj4gPj4+Pg0KPiA+Pj4+IEl0
IGxvb2tzIGxpa2UgeW91IHJlY2VpdmVkIGEgdGFnIGFuZCBmb3Jnb3QgdG8gYWRkIGl0Lg0KPiA+
Pj4+DQo+ID4+Pj4gSWYgeW91IGRvIG5vdCBrbm93IHRoZSBwcm9jZXNzLCBoZXJlIGlzIGEgc2hv
cnQgZXhwbGFuYXRpb246DQo+ID4+Pj4gUGxlYXNlIGFkZCBBY2tlZC1ieS9SZXZpZXdlZC1ieS9U
ZXN0ZWQtYnkgdGFncyB3aGVuIHBvc3RpbmcgbmV3DQo+ID4+Pj4gdmVyc2lvbnMgb2YgcGF0Y2hz
ZXQsIHVuZGVyIG9yIGFib3ZlIHlvdXIgU2lnbmVkLW9mZi1ieSB0YWcsIHVubGVzcw0KPiA+Pj4+
IHBhdGNoIGNoYW5nZWQgc2lnbmlmaWNhbnRseSAoZS5nLiBuZXcgcHJvcGVydGllcyBhZGRlZCB0
byB0aGUgRFQNCj4gPj4+PiBiaW5kaW5ncykuIFRhZyBpcyAicmVjZWl2ZWQiLCB3aGVuIHByb3Zp
ZGVkIGluIGEgbWVzc2FnZSByZXBsaWVkIHRvDQo+ID4+Pj4geW91IG9uIHRoZSBtYWlsaW5nIGxp
c3QuIFRvb2xzIGxpa2UgYjQgY2FuIGhlbHAgaGVyZS4gSG93ZXZlciwNCj4gPj4+PiB0aGVyZSdz
IG5vDQo+ID4+IG5lZWQgdG8gcmVwb3N0IHBhdGNoZXMgKm9ubHkqIHRvIGFkZCB0aGUgdGFncy4N
Cj4gPj4+PiBUaGUgdXBzdHJlYW0gbWFpbnRhaW5lciB3aWxsIGRvIHRoYXQgZm9yIHRhZ3MgcmVj
ZWl2ZWQgb24gdGhlDQo+ID4+Pj4gdmVyc2lvbiB0aGV5IGFwcGx5Lg0KPiA+Pj4+DQo+ID4+Pj4g
UGxlYXNlIHJlYWQ6DQo+ID4+Pj4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYu
MTItcmMzL3NvdXJjZS9Eb2N1bWVudGF0aW9uL3Bybw0KPiA+Pj4+IGNlDQo+ID4+Pj4gc3Mvc3Vi
DQo+ID4+Pj4gbWl0dGluZy1wYXRjaGVzLnJzdCNMNTc3DQo+ID4+Pj4NCj4gPj4+PiBJZiBhIHRh
ZyB3YXMgbm90IGFkZGVkIG9uIHB1cnBvc2UsIHBsZWFzZSBzdGF0ZSB3aHkgYW5kIHdoYXQgY2hh
bmdlZC4NCj4gPj4+PiA8L2Zvcm0gbGV0dGVyPg0KPiA+Pj4+DQo+ID4+Pj4gUmVhZCBsYXN0IHNl
bnRlbmNlIGFuZCBsaW5rZWQgZG9jdW1lbnRhdGlvbi4gV2hlcmUgZGlkIHlvdSBleHBsYWluDQo+
ID4+Pj4gaWdub3JpbmcvZHJvcHBpbmcgbXkgdGFnPw0KPiA+Pj4+DQo+ID4+Pg0KPiA+Pj4gWWVz
LCB0aGUgcHJldmlvdXMgdmVyc2lvbiB3YXMgYWNrZWQgYnkgeW91IGJlZm9yZS4NCj4gPj4NCj4g
Pj4gSSBzdHJlc3NlZCB3aGF0IEkgZXhwZWN0IHR3aWNlLiBJbiBmb3JtIGxldHRlciBhbmQgbGF0
ZXIgZXhwbGljaXRseS4NCj4gPj4gWW91IHN0aWxsIGlnbm9yZWQgaXQuDQo+ID4+DQo+ID4+Pg0K
PiA+Pj4gV2hlbiBhcHBseSBpdCwgd2UgZm91bmQgdGhhdCBvcmFuZ2VwaSA2IHBsdXMgYW5kIFJh
ZHhhIE9yaW9uIE82DQo+ID4+PiBiZWxvbmdzDQo+ID4+IHRoZSBkaWZmZXJlbnQgYm9hcmRzLg0K
PiA+Pj4NCj4gPj4+IFNvIHdlIG5lZWQgdG8gYWRkIGEgbmV3IGl0ZW0gZm9yIGl0LiBMaWtlIHRo
ZXNlIGZyb20gcWNvbS55YW1sDQo+ID4+Pg0KPiA+Pj4gICAgICAgLSBkZXNjcmlwdGlvbjogUXVh
bGNvbW0gVGVjaG5vbG9naWVzLCBJbmMuIERpc3RyaWJ1dGVkIFVuaXQNCj4gPj4+IDEwMDANCj4g
Pj4gcGxhdGZvcm0NCj4gPj4+ICAgICAgICAgaXRlbXM6DQo+ID4+PiAgICAgICAgICAgLSBlbnVt
Og0KPiA+Pj4gICAgICAgICAgICAgICAtIHFjb20scWR1MTAwMC1pZHANCj4gPj4+ICAgICAgICAg
ICAgICAgLSBxY29tLHFkdTEwMDAteDEwMA0KPiA+Pj4gICAgICAgICAgIC0gY29uc3Q6IHFjb20s
cWR1MTAwMA0KPiA+Pj4NCj4gPj4+ICAgICAgIC0gZGVzY3JpcHRpb246IFF1YWxjb21tIFRlY2hu
b2xvZ2llcywgSW5jLiBSYWRpbyBVbml0IDEwMDANCj4gcGxhdGZvcm0NCj4gPj4+ICAgICAgICAg
aXRlbXM6DQo+ID4+PiAgICAgICAgICAgLSBlbnVtOg0KPiA+Pj4gICAgICAgICAgICAgICAtIHFj
b20scXJ1MTAwMC1pZHANCj4gPj4+ICAgICAgICAgICAtIGNvbnN0OiBxY29tLHFydTEwMDANCj4g
Pj4NCj4gPj4gTm8sIGxvb2sgYXQgU29Dcy4gRGlmZmVyZW50IFNvY1MuDQo+ID4+DQo+ID4NCj4g
PiBQbGVhc2UgTG9vayBhdCByb2NrY2hpcC55YW1sLCB0aGUgc2FtZSBTb2NzLCBhbmQgdGhlIGRp
ZmZlcmVudCBib2FyZHMNCj4gPg0KPiA+ICAgICAgIC0gZGVzY3JpcHRpb246IDk2Ym9hcmRzIFJL
MzM5OSBGaWN1cyAoUk9DSzk2MCBFbnRlcnByaXNlIEVkaXRpb24pDQo+ID4gICAgICAgICBpdGVt
czoNCj4gPiAgICAgICAgICAgLSBjb25zdDogdmFtcnMsZmljdXMNCj4gPiAgICAgICAgICAgLSBj
b25zdDogcm9ja2NoaXAscmszMzk5DQo+ID4NCj4gPiAgICAgICAtIGRlc2NyaXB0aW9uOiA5NmJv
YXJkcyBSSzMzOTkgUm9jazk2MCAoUk9DSzk2MCBDb25zdW1lcg0KPiBFZGl0aW9uKQ0KPiA+ICAg
ICAgICAgaXRlbXM6DQo+ID4gICAgICAgICAgIC0gY29uc3Q6IHZhbXJzLHJvY2s5NjANCj4gPiAg
ICAgICAgICAgLSBjb25zdDogcm9ja2NoaXAscmszMzk5DQo+ID4NCj4gPiBGb3IgdGhlIGRpZmZl
cmVudCBib2FyZHPvvIxwbGVhc2UgZ2l2ZSB5b3VyIHByb2Zlc3Npb25hbA0KPiA+IHN1Z2dlc3Rp
b25z77yMVGhhbmtzIGEgbG90DQo+IA0KPiBJIGdhdmUgeW91IGFscmVhZHkuDQo+IA0KDQpXZSBm
aW5kIHRoZXNlIGNvZGVzIGJlbG93IGZyb20gcWNvbS55YW1sLCBDYW4gd2UgZG8gdGhlIHNhbWUg
dGhpbmdzPw0KDQogICAgICAtIGRlc2NyaXB0aW9uOiBBY2VyIENocm9tZWJvb2sgU3BpbiA1MTMg
d2l0aCBMVEUgKHJldjEgLSAyKQ0KICAgICAgICBpdGVtczoNCiAgICAgICAgICAtIGNvbnN0OiBn
b29nbGUsbGF6b3ItcmV2MS1za3UwDQogICAgICAgICAgLSBjb25zdDogZ29vZ2xlLGxhem9yLXJl
djItc2t1MA0KICAgICAgICAgIC0gY29uc3Q6IHFjb20sc2M3MTgwDQoNCiAgICAgIC0gZGVzY3Jp
cHRpb246IEFjZXIgQ2hyb21lYm9vayBTcGluIDUxMyB3aXRoIExURSAocmV2MyAtIDgpDQogICAg
ICAgIGl0ZW1zOg0KICAgICAgICAgIC0gY29uc3Q6IGdvb2dsZSxsYXpvci1yZXYzLXNrdTANCiAg
ICAgICAgICAtIGNvbnN0OiBnb29nbGUsbGF6b3ItcmV2NC1za3UwDQogICAgICAgICAgLSBjb25z
dDogZ29vZ2xlLGxhem9yLXJldjUtc2t1MA0KICAgICAgICAgIC0gY29uc3Q6IGdvb2dsZSxsYXpv
ci1yZXY2LXNrdTANCiAgICAgICAgICAtIGNvbnN0OiBnb29nbGUsbGF6b3ItcmV2Ny1za3UwDQog
ICAgICAgICAgLSBjb25zdDogZ29vZ2xlLGxhem9yLXJldjgtc2t1MA0KICAgICAgICAgIC0gY29u
c3Q6IHFjb20sc2M3MTgwDQoNCiAgICAgIC0gZGVzY3JpcHRpb246IEFjZXIgQ2hyb21lYm9vayBT
cGluIDUxMyB3aXRoIExURSAocmV2OSkNCiAgICAgICAgaXRlbXM6DQogICAgICAgICAgLSBjb25z
dDogZ29vZ2xlLGxhem9yLXJldjktc2t1MA0KICAgICAgICAgIC0gY29uc3Q6IGdvb2dsZSxsYXpv
ci1yZXY5LXNrdTEwDQogICAgICAgICAgLSBjb25zdDogcWNvbSxzYzcxODANCg0KICAgICAgLSBk
ZXNjcmlwdGlvbjogQWNlciBDaHJvbWVib29rIFNwaW4gNTEzIHdpdGggTFRFIChuZXdlc3QgcmV2
KQ0KICAgICAgICBpdGVtczoNCiAgICAgICAgICAtIGNvbnN0OiBnb29nbGUsbGF6b3Itc2t1MA0K
ICAgICAgICAgIC0gY29uc3Q6IGdvb2dsZSxsYXpvci1za3UxMA0KICAgICAgICAgIC0gY29uc3Q6
IHFjb20sc2M3MTgwDQoNCkJlc3QgUmVnYXJkcw0KR2FyeQ0KDQoNCj4gQmVzdCByZWdhcmRzLA0K
PiBLcnp5c3p0b2YNCg==

