Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E932E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 10:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OhAPg5R3uD6BT8eGKZy+5OUj8mjxuZ5hadGWvLGCAXU=; b=FuaQri7vLEXGrpplo2JiI2p4Al
	Y4zgYJeV/1FTlZHHSPOd9SIKNZaOC/J7Lk8mRzolv4Dma6Xlf8TGT0vXmPOkDKnctmGVjKBq23Ykn
	b/bVmll08NSh+8nICAlZComVBHm2H2UOOIjgv5THCWMJAIo0YaqSMX65Am9fFGbU4b5Uh/q61qXOT
	N1KrtkQoMCPvpaPSdbeXuh/cvA0uzrDMksWesFhplbsllGvvZA92lEfQvhAUpN8ujvxfkRPGuhfYJ
	PmUT8g9nand0Z1ux8GZ6vybPExILt13O1FZusGB/w12PYl91ZGc+04ktEWH4BCxhCSLAe+LC6KSEQ
	zaVTWFPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNrfR-0000000GKvB-4BjD;
	Wed, 18 Dec 2024 10:52:38 +0000
Received: from mail-japanwestazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c406::1] helo=OS0P286CU011.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNrdb-0000000GKNo-0f0B
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 10:50:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=koABxuaG6zeoaRbPdCizmOiacGjvMfsxhQLgluy2DP1llBYLtxXepndlKVK9zkbwWuoWfI86/ts/zRWKq+PS6nzSmW2CLGh54762atLZ5DrrwQh4SEqUvforKCQQAK6QP8JMRkSzlRfX8fdAYk/+A5apm7VrHKs1QtKPtSfyd9v1+D8Ijp3dJH8KMTeQKb0+SM2nmy+Ew6bDbcFvwh1e4DGFgmroBB7PMdZtkTLX7LeUsABcEcz2VSFoeOP6QIojpCTzkqgTVEX+wxSEUEJHCKuNqRcNyQt5ctwjyV9qsH2dYiRkKVi5/UW9Vs9MRvfS/R2hnMPI7o096jv4H/rlNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OhAPg5R3uD6BT8eGKZy+5OUj8mjxuZ5hadGWvLGCAXU=;
 b=WyI9YpCU2MDhUXuylYIgoWtzYDNBwseTo/qVqcsYDhmZV2pBAbs5zl+vRYGQEiPM2VQVzsRu2T178vlW1gyXlQWFKctUSysW3mIYqHjp+9v4hTuiKs2vF037zQgzwJGtHua3nPUJOtY+tnQ05kc1AUp8Pk+7RFc5QhggXMwfpm0GkRVqIsu6AmaNi7KwQwMiALE9pLDxGcO6x1FBzrrY2fClDlA4knB/SoPkBYIrj/0RauYY0A+OtbGowIy0BjRQYaGjOUaWLv7VmkAU7YcBQJPoPRmgG9dXRwlb/ByNlCGUsnb7RdmfBi526MdrxOul3Gt6dmp33qg9m2DMv7qErg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OhAPg5R3uD6BT8eGKZy+5OUj8mjxuZ5hadGWvLGCAXU=;
 b=iWYXE12utq44ZIT2QAhPeyQkaLaMZKAzZI9FKx4uOAdROXIandOAiKFW4edN7Q7utyxZKGQAazJcfzi4ZEy/cyKqEefLHVxnEb5p1c2i6e9LytZPhMrhWBhlfLk0xnRjxCvpa3Adql4uYhszbfaMMX+dtUhth0oMfRABEuk1okk=
Received: from OSBPR01MB2775.jpnprd01.prod.outlook.com (2603:1096:604:13::17)
 by TYYPR01MB15086.jpnprd01.prod.outlook.com (2603:1096:405:1a4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Wed, 18 Dec
 2024 10:50:20 +0000
Received: from OSBPR01MB2775.jpnprd01.prod.outlook.com
 ([fe80::54f7:9a51:ae47:185b]) by OSBPR01MB2775.jpnprd01.prod.outlook.com
 ([fe80::54f7:9a51:ae47:185b%4]) with mapi id 15.20.8251.015; Wed, 18 Dec 2024
 10:50:15 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Rob Herring <robh@kernel.org>
CC: "arnd@arndb.de" <arnd@arndb.de>, "heiko@sntech.de" <heiko@sntech.de>,
	"krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
	"lee@kernel.org" <lee@kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "liviu.dudau@arm.com" <liviu.dudau@arm.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, "pankaj.dubey@samsung.com"
	<pankaj.dubey@samsung.com>, "peter.griffin@linaro.org"
	<peter.griffin@linaro.org>, "sudeep.holla@arm.com" <sudeep.holla@arm.com>,
	"willmcvicker@google.com" <willmcvicker@google.com>, Biju Das
	<biju.das.jz@bp.renesas.com>, Fabrizio Castro
	<fabrizio.castro.jz@renesas.com>
Subject: RE: [PATCH 3/3] mfd: syscon: Allow syscon nodes without a "syscon"
 compatible
Thread-Topic: [PATCH 3/3] mfd: syscon: Allow syscon nodes without a "syscon"
 compatible
Thread-Index: AQHbT+GPvIC8wHxBJk+Cohzmo2EA5LLr1KOw
Date: Wed, 18 Dec 2024 10:50:14 +0000
Message-ID: <OSBPR01MB27755C4089DF9546954E2422FF052@OSBPR01MB2775.jpnprd01.prod.outlook.com>
References: <20241211-syscon-fixes-v1-3-b5ac8c219e96@kernel.org>
 <20241215203344.46158-1-john.madieu.xa@bp.renesas.com>
 <CAL_Jsq+DEWibue5DVB=gSNB7cvaE85rV5XPf8HPqQDz0DgjCXw@mail.gmail.com>
In-Reply-To: <CAL_Jsq+DEWibue5DVB=gSNB7cvaE85rV5XPf8HPqQDz0DgjCXw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSBPR01MB2775:EE_|TYYPR01MB15086:EE_
x-ms-office365-filtering-correlation-id: 272fb419-14fb-47ee-77c6-08dd1f51c128
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?RVJKYlNnVTFGR3l2WVN3TFZqQitaUS9KWlJmZ3lva3p5NWd0eU1vak01bHZD?=
 =?utf-8?B?UnA5M2tSNjJ0SVlVMW8zVWUzb0V1Ulo4dFNBRTdSeXorVDVEUkQ1bnptd2hI?=
 =?utf-8?B?RzlhUlpsQXdvNVpKUWVCbmdJa2JQNWJaMGE5RmVleFV6a1RZV3VLSDJpRzJU?=
 =?utf-8?B?Vm8zOVBudjB6ckwyREhDWUFWa2FvOEdOZFhBUDloaHRTYUttOVMwenRKWnE1?=
 =?utf-8?B?ZXpvbHVtZ1pqRUpDUlhmdCsrV3NHRjlnNG5qTkQwZlNwNlViTHdDcGZmNmdW?=
 =?utf-8?B?UWxGVHZCcm9KN3FmZWVhclpYQS9lQ2UxU2RWT01tZXJkN0tvRC95N2wzYk5P?=
 =?utf-8?B?UVJ4SFRHU3VNZmdHQS9hZ0I0emF6am1Ja2tOYzgxU3NHUHc1WUs5cGYrOURH?=
 =?utf-8?B?VWpuS0tZNUN3NmxQMUZFaENUMHE2MFIrcG1HMW15clFlUkRpS1BXRTFraWhN?=
 =?utf-8?B?NC9sRDl6TythVS9mVFZ5Wkl1VGNIWk5KaVJVd0hvWmZacUkyRDNaVFZBQk95?=
 =?utf-8?B?dEIzazZQNU54RjJZN1ordHdYWWUrZktKRUFiTVZaUjVxb2lGbGw5UUlCdklD?=
 =?utf-8?B?Y2llQnhBRmQ2a3V4VURIRzFtck13dmdZUU5CdWZzQXN1clNHT0RvVWkzVE1R?=
 =?utf-8?B?VGZjWVhtZzRzNDFRZHRtN2hFYVE0Z3FPaHA1MjQyanhYL2NXTXg0dlljc1h2?=
 =?utf-8?B?L09HYWhNUFdGY1FVNjUvQjlaekNsVGd0aXpLVkpEK3V2cWszWW9LRWlLQmdM?=
 =?utf-8?B?a0l0ZEtGd3lBVmJkNTRtNGM3UEF0ZDJRdUpXV0ptR0d0NE1DT3ZqVlUwcm5h?=
 =?utf-8?B?SG4zeTRtY21IMWZVakpiS1YrRG5wSFE1Wi9kVGwzeTIwRGEzL21SRWJmYWYv?=
 =?utf-8?B?VVJlTE4xSE5POXFibXhpY3RlVG5oRjdBSSt0ZGo5TnR4U0dERWNwZ2Q1Y2g4?=
 =?utf-8?B?SmVidUFydVEwTXdVTU5nNjF4YTQ0bkkvakwwWFd6am9TanBXOWpGWDJoclJO?=
 =?utf-8?B?bndUYjQ5YlJXdDdUa2swTlFKL0xuUEEyQzhqR2Ird043UTlMNFdUcDlCdHUx?=
 =?utf-8?B?RjBicnMxRE5kTHpiaGZtdU1kMy9xY21WWDhjUlpXNmNxT2VuWllTUmcvcFR4?=
 =?utf-8?B?TTdZTkxPRmFObjU1YkNJMm9FWHc4amY2c2ZlcXhVb2ljT0tjVENleUFpRHdY?=
 =?utf-8?B?Z2E2T1VrM2NyRFU3RnVTRk9salBEeEV3b2RNS1d3SkYzeE8yN2hnSUNNK3BH?=
 =?utf-8?B?cmJvSWEzQlNHVWNYUjFacUNWandQVk5xdnU2QWFtMTJiNXk1blR5dEI5Y2lp?=
 =?utf-8?B?cU1XTUpnN0VRNVVnUzloOHdyL3FrQlIzMWJDOWt4VUcwZmtGaEJoc2ZwWnB1?=
 =?utf-8?B?eEFPckJ5SjFpZ0dYMnBjWkJ3UzlLWm5nbW9XaUNtOHBUSzV4amxDRlpxV1NQ?=
 =?utf-8?B?dEN3R1JIZmE0bGd1ZlArVFFERDF2UEE4SUFWNGhQZCt5U0hWci9DRlNxVTJ6?=
 =?utf-8?B?T0tTWlRUMHRBekNzekJpZVVCRmhHS0xDQy8xVTNKWXdTWUtCVThQZXJ4cGJR?=
 =?utf-8?B?WlA5cnNHTWtlK1FmZTVwZ0lHRjBsZDkyTDlyM2lHQXdqOTFMTWowU2ZNNktT?=
 =?utf-8?B?N0NkdzluL09RcnlUbk8ybUxTd3FQU2FFd1ZWS3A5S2R2bkpDVHp6bDlWOGd5?=
 =?utf-8?B?Zm9lWU9sSXA4QXR4cFM1ZWJPNWorNVdyanAwZjdZOFRqYzROZmRWYndWQklw?=
 =?utf-8?B?STM1d1VVWkc1ZTZta2cxMmRXWkZWUzZNbGFYUUl3ZjZjL1dYSEtnYjlWOUR2?=
 =?utf-8?B?M2RaY3BmSkVFLzE4TG5BWmRPMG5PQmx5UkR6Z095UC9yS1d5QTBvbDBYTjIv?=
 =?utf-8?B?dmtJWEF6OGRhcmU0a0J2NU5iSlJoQmtvV0RWcXpMdklhdUNHS0tMTXBkYW9h?=
 =?utf-8?Q?7/Uo1FvzLV/PE/gAOqmzfjEfXc2Jhnon?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSBPR01MB2775.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZExvTFBzcWgxS2d6RFJPOVJ6ZDE3K2RneFEvUnVaUGc3aXBFMzN1TzZsQ0hz?=
 =?utf-8?B?WTNQekpIaGdpMVo5UEtnYkZTUC9lYzlkV0dqNnAvTXBpNUtOYlFGNG1DMzh1?=
 =?utf-8?B?Qi9jVnhmeFhBaDhiRld6SytkMlcyQW9ydjd6bmtyS1lWeDV4ZDdDMXpaNkNJ?=
 =?utf-8?B?MXhzSlJSWTUxYkhYVkJ6OEdZdU85M0pxbFR2dHhiRVI2LzFGNjU4OXVHeEc3?=
 =?utf-8?B?OFB2OFB4UjJrM0tGd0l0NEtMV01TSHE0V1R2bmI5NGE0S2xUbk1hRGhFV1Zs?=
 =?utf-8?B?aDZySCtMYkZWZ3lvK3FuZFlQS0J2Q1R0dmV1d2FoQjIxcUpiMHVhNGVOdDNS?=
 =?utf-8?B?eHA4Qys5YTFqQWpBWHYxMnlWakFDaHlqdUNVSmluYXZzb0ZqOXVic0FzUHNM?=
 =?utf-8?B?RVg5aGgzeFZIajdQSDRBV0N0Nzd2NG1IYWVleFZOeUlseEFVVktSTWdJN091?=
 =?utf-8?B?VS84TENqd3J0WjZHUWZDUXZKR2NwcENGOUhKNWwrbVZmNGxLbjNHczQxUWxp?=
 =?utf-8?B?ZEVRamF2V1hhUUlhTzFIVHBMV1YvMENXZVdJb0ltSEpkNHBzVUg2MW1NU0RC?=
 =?utf-8?B?cm1wcG9rZ0xKbFlEQkN6SCtjVHJrZ211a0dOd1NzNzJpY01TT09kcWhNMEpo?=
 =?utf-8?B?QWN6N0JwZVd1dnlRSHk1RjVkcVRwU0pUeWdPM0krYmlDTmViY0VUZnFmVkhk?=
 =?utf-8?B?QmNxUlFIV1hHNGpXcHlLTkkxR21aZEZIYzhxYVRycGdINlVKOCs0Um9razVw?=
 =?utf-8?B?Mk9jc1kycDkvMzFmNHpnRzJ3M213ZWZCdTB2czFSd3dUTXk4ak9sM1pJcWht?=
 =?utf-8?B?Z0ZXbHI2OXF0eDlqUmI3cjN2ak9sUVFxN2V3NUY2TzduQStaNkdlNGppNE9B?=
 =?utf-8?B?empxamRLQzhmb0RUNHZIRGVmaUVjQ01TaVZEd3lQQTJVUWZHaE95ZEVzWHRH?=
 =?utf-8?B?SDZKZEJLVElhbHBTZys2MnZ1U3RjcmlRNmY3RHRnT09rMHRybEhhQk82WGln?=
 =?utf-8?B?V2txSWxpYVh0eTgwTUdFdnNrNjd2NzNsUGdkVStiSm1HaG1uNFhvN2Uwbndr?=
 =?utf-8?B?VGNRclp0cXhwUmxqZm1mdzI4cFp5ODN1eWhKSkVBeG5IRnR3YVdTV2ZHSy96?=
 =?utf-8?B?THJ6R2pMb1hhSVkwQ1FnbDZaZzVhZzc1NXlNcnR0WUJ1dVVJSTVQQXJOZXk1?=
 =?utf-8?B?Sm5KRXhBbDg5a1FnQWdIeDBmWTZybXRsVjNid1RhRlZtYjc0dkovdHhHMHV5?=
 =?utf-8?B?SEI0alRkTDRKRjlCVnFibnpycTlvemgyZWF4bStVcGtQNlRaWERmQnJqdi9t?=
 =?utf-8?B?UnkvcGc2MmNWN2RtMi96ZFJSSEdzQmpmL2dDK05DNWZmV3VGL1piZXlBN0pw?=
 =?utf-8?B?WHJhY2FYMTBYQ2M3SDM5cncyTGVicG1zZzlYVjBsemhvS0FGYWdObm9YNFFu?=
 =?utf-8?B?ejJRK2NwOUlkNHV2K2R2bGxtOGZlNDVoZXZEdlhVREJMV2Y1U2kyUXE1Szlk?=
 =?utf-8?B?TjhFQkIzTnB2d2FVbDdZZWYzN2dHbk5aNlIzejNvS0p4RnR5ZVd0K2VqQmxz?=
 =?utf-8?B?YU42cTk1NUJ6VERqSFZQWFpGdXRLY0FKaVBSSTFqNng1MkUvREtqRTl0Y1hB?=
 =?utf-8?B?MFZVY0pVcWhlM3BFcnNZTXNaZlBkenZ4bEE3REVrbUo5TXpIWWlHbC84VTdG?=
 =?utf-8?B?bzJRN20ydmZMbEZuWWRkSTFtdHk5YVVjQWNLYkJaRGRLVGFheWlwZnc0eWww?=
 =?utf-8?B?ckUrWWVVZGZLaW1kejdJZHN5cHU1RDBKVklLclBQS0htNDNGTjQ3dSs2RUZY?=
 =?utf-8?B?V2luMG5TaE5nQWNxZ2xsYU5DUExxS2FZRnJlY0l3NXg4TnFQZC9oSHkzandY?=
 =?utf-8?B?NHJRU2ZCVTU5cnlRalFsc3ZoY2xQbWZsQWgxZ1RveWt2djBuMmVxYkQ3QWxn?=
 =?utf-8?B?SEx1N2xJSk13KzMwdktlaklkUWQzN2ZERXFHSnczNTNwQyswNUtQMDk3bjZr?=
 =?utf-8?B?ME5FaWNFc1J4Sllmd2ZrbE56K0Q4VlhLMHVlaDZSdDFYNThLNFVnUjdSMFd6?=
 =?utf-8?B?NTFqL1phUlcrZW9yd0lEajdES3pmQml1YXdNY0JQUlRRMjZDZVMvMGd0Z21k?=
 =?utf-8?B?VzdUNFBCMG1FS3JqL3hqR0ExWDJkQTFFblRHMzJwV3VPL3JPRWdHRXIyRm95?=
 =?utf-8?B?REE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB2775.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 272fb419-14fb-47ee-77c6-08dd1f51c128
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2024 10:50:14.9328
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4mj/ZqaIlWRkiD1MjuXtGCTrlHifmM+A7TgHXCFT8chkchhFN9rf0o8/Q0EiKeOnZ3ddO44tlo4yGYazjT8qo+RE8pvKM0yEF3phz7ZeT6w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB15086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_025043_656078_43211FB3 
X-CRM114-Status: GOOD (  24.16  )
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

SGkgUm9iLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFJvYiBIZXJy
aW5nIDxyb2JoQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IE1vbmRheSwgRGVjZW1iZXIgMTYsIDIwMjQg
Njo0MCBQTQ0KPiBUbzogSm9obiBNYWRpZXUgPGpvaG4ubWFkaWV1LnhhQGJwLnJlbmVzYXMuY29t
Pg0KPiBDYzogYXJuZEBhcm5kYi5kZTsgaGVpa29Ac250ZWNoLmRlOyBrcnp5c3p0b2Yua296bG93
c2tpQGxpbmFyby5vcmc7DQo+IGxlZUBrZXJuZWwub3JnOyBsaW51eC1hcm0ta2VybmVsQGxpc3Rz
LmluZnJhZGVhZC5vcmc7IGxpbnV4LQ0KPiBrZXJuZWxAdmdlci5rZXJuZWwub3JnOyBsaXZpdS5k
dWRhdUBhcm0uY29tOyBscGllcmFsaXNpQGtlcm5lbC5vcmc7DQo+IHBhbmthai5kdWJleUBzYW1z
dW5nLmNvbTsgcGV0ZXIuZ3JpZmZpbkBsaW5hcm8ub3JnOyBzdWRlZXAuaG9sbGFAYXJtLmNvbTsN
Cj4gd2lsbG1jdmlja2VyQGdvb2dsZS5jb207IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5l
c2FzLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCAzLzNdIG1mZDogc3lzY29uOiBBbGxvdyBz
eXNjb24gbm9kZXMgd2l0aG91dCBhDQo+ICJzeXNjb24iIGNvbXBhdGlibGUNCj4gDQo+IE9uIFN1
biwgRGVjIDE1LCAyMDI0IGF0IDI6MzTigK9QTSBKb2huIE1hZGlldQ0KPiA8am9obi5tYWRpZXUu
eGFAYnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+DQo+ID4gSGkgUm9iLA0KPiA+DQo+ID4gT24g
V2VkLCAxMSBEZWMgMjAyNCAxNDo1NzoxNCAtMDYwMCBSb2IgSGVycmluZyB3cm90ZToNCj4gPiA+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL21mZC9zeXNjb24uYyBiL2RyaXZlcnMvbWZkL3N5c2Nvbi5j
IGluZGV4DQo+ID4gPiBiZmIxZjY5ZmNmZjEuLmU2ZGYyODI1YzE0ZCAxMDA2NDQNCj4gPiA+IC0t
LSBhL2RyaXZlcnMvbWZkL3N5c2Nvbi5jDQo+ID4gPiArKysgYi9kcml2ZXJzL21mZC9zeXNjb24u
Yw0KPiA+ID4gQEAgLTE3MSw4ICsxNzEsMTAgQEAgc3RhdGljIHN0cnVjdCByZWdtYXANCj4gKmRl
dmljZV9ub2RlX2dldF9yZWdtYXAoc3RydWN0IGRldmljZV9ub2RlICpucCwNCj4gPiA+ICAgICAg
ICAgICAgICAgICAgICAgICBicmVhazsNCj4gPiA+ICAgICAgICAgICAgICAgfQ0KPiA+ID4NCj4g
PiA+IC0gICAgIGlmICghc3lzY29uKQ0KPiA+ID4gKyAgICAgaWYgKCFzeXNjb24gJiYgb2ZfZGV2
aWNlX2lzX2NvbXBhdGlibGUobnAsICJzeXNjb24iKSkNCj4gPiA+ICAgICAgICAgICAgICAgc3lz
Y29uID0gb2Zfc3lzY29uX3JlZ2lzdGVyKG5wLCBjaGVja19yZXMpOw0KPiA+ID4gKyAgICAgZWxz
ZQ0KPiA+ID4gKyAgICAgICAgICAgICBzeXNjb24gPSBFUlJfUFRSKC1FSU5WQUwpOw0KPiA+DQo+
ID4gVGhlIGN1cnJlbnQgbW9kaWZpY2F0aW9uIHdpbGwgbWFrZSBkZXZpY2Vfbm9kZV9nZXRfcmVn
bWFwKCkgcmV0dXJuDQo+ID4gLUVJTlZBTCBldmVuIGZvciBzeXNjb25zIHRoYXQgd2VyZSBhbHJl
YWR5IGZvdW5kIGluIHRoZSBzeXNjb25fbGlzdCwNCj4gPiB3aGljaCBJIGJlbGlldmUgaXMgbm90
IHRoZSBpbnRlbmRlZCBiZWhhdmlvci4NCj4gDQo+IFllcywgaXQgaXMuIERvZXNuJ3QgV2lsbCdz
IGZpeCB3b3JrIGZvciB5b3U/DQoNCkRpZCBub3Qgc2VlIFdpbGwncyBhbnN3ZXIgd2hpbGUgZG9p
bmcgbXkgdGVzdHMuIEkgaG93ZXZlciB0ZXN0ZWQgaXQgYW5kIGl0DQp3b3Jrcy4gSSBkaWQgYWxz
byB0ZXN0IHlvdXIgdjIgc2VyaWVzLCB3aGljaCB3b3JrZWQgd2l0aCBtZSBhcyB3ZWxsLg0KDQpJ
J2xsIHRoZW4gZHJvcCBzeXNjb24gY29tcGF0aWJsZSBzdHJpbmcgaW4gbXkgc2VyaWVzIGFuZCBz
ZW5kIHRoZSB2Mi4NCg0KVGhhbmtzLA0KSm9obg0KDQo+IA0KPiA+DQo+ID4gSSBzdWdnZXN0IG1v
ZGlmeWluZyBpdCB0aGlzIHdheSB0byBtYWludGFpbiBsb29rdXAgZnVuY3Rpb25hbGl0eSBmb3IN
Cj4gPiByZWdpc3RlcmVkIHN5c2NvbnMgd2hpbGUgaW1wbGVtZW50aW5nIHlvdXIgaW50ZW5kZWQg
Y2hhbmdlczoNCj4gPg0KPiA+IHN0YXRpYyBzdHJ1Y3QgcmVnbWFwICpkZXZpY2Vfbm9kZV9nZXRf
cmVnbWFwKHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAsDQo+ID4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgYm9vbCBjaGVja19yZXMpIHsNCj4gPiAgICAgICAgIHN0
cnVjdCBzeXNjb24gKmVudHJ5LCAqc3lzY29uID0gTlVMTDsNCj4gPiAgICAgICAgIHN0cnVjdCBy
ZWdtYXAgKnJlZ21hcDsNCj4gPg0KPiA+ICAgICAgICAgbXV0ZXhfbG9jaygmc3lzY29uX2xpc3Rf
bG9jayk7DQo+ID4NCj4gPiAgICAgICAgIGxpc3RfZm9yX2VhY2hfZW50cnkoZW50cnksICZzeXNj
b25fbGlzdCwgbGlzdCkNCj4gPiAgICAgICAgICAgICAgICAgaWYgKGVudHJ5LT5ucCA9PSBucCkg
ew0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIHN5c2NvbiA9IGVudHJ5Ow0KPiA+ICAgICAg
ICAgICAgICAgICAgICAgICAgIGJyZWFrOw0KPiA+ICAgICAgICAgICAgICAgICB9DQo+ID4NCj4g
PiAgICAgICAgIGlmIChzeXNjb24pIHsNCj4gPiAgICAgICAgICAgICAgICAgcmVnbWFwID0gc3lz
Y29uLT5yZWdtYXA7DQo+ID4gICAgICAgICAgICAgICAgIG11dCBpeF91bmxvY2soJnN5c2Nvbl9s
aXN0X2xvY2spOw0KPiA+ICAgICAgICAgICAgICAgICByZXR1cm4gcmVnbWFwOw0KPiA+ICAgICAg
ICAgfQ0KPiA+DQo+ID4gICAgICAgICBpZiAob2ZfZGV2aWNlX2lzX2NvbXBhdGlibGUobnAsICJz
eXNjb24iKSkgew0KPiA+ICAgICAgICAgICAgICAgICBzeXNjb24gPSBvZl9zeXNjb25fcmVnaXN0
ZXIobnAsIGNoZWNrX3Jlcyk7DQo+ID4gICAgICAgICAgICAgICAgIG11dGV4X3VubG9jaygmc3lz
Y29uX2xpc3RfbG9jayk7DQo+ID4gICAgICAgICAgICAgICAgIGlmIChJU19FUlIoc3lzY29uKSkN
Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gRVJSX0NBU1Qoc3lzY29uKTsNCj4g
PiAgICAgICAgICAgICAgICAgcmV0dXJuIHN5c2Nvbi0+cmVnbWFwOw0KPiA+ICAgICAgICAgfQ0K
PiA+DQo+ID4gICAgICAgICBtdXRleF91bmxvY2soJnN5c2Nvbl9saXN0X2xvY2spOw0KPiANCj4g
MyB1bmxvY2sgY2FsbHMgaXMgYSBzaWduIHRoZSBjb2RlIHN0cnVjdHVyZSBjb3VsZCBiZSBpbXBy
b3ZlZC4gQSBnb3RvIG9yIGENCj4gZ3VhcmQoKSBmb3IgZXhhbXBsZS4gSG93ZXZlciwgSSB0aGlu
ayB0aGlzIGlzIHRoZSBzYW1lIGxvZ2ljIGFzIHdoYXQgV2lsbA0KPiBzdWdnZXN0ZWQuDQo+IA0K
PiBSb2INCg==

