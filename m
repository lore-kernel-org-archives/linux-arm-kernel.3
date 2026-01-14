Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FE47D31A0C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 03:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hq9MD8KSBDo1SCNCL3H8ZIOeXNs1FRqzG6AvLhYRZOA=; b=wJQvO/m0tueTe4GlkmEi4TKTIr
	pqfYcD7yuGIVgH4VNM8jRNKamjVH7k5BKSQzr32s+wMwgjhEvdO87ZD+jst82wzI7/RORSPzgxY8J
	hGlF6u/mqN12rD9AFAHyLMibJNcnsEc6H78YmCukH+nEFHg+LhSemaJCip6K9uYXhVYCLcGAz7k14
	rwk2I6Nyxuly6OKH65A1yNPb1MIAwDKtgFicD3Gyk03rshuD4CuJNQt9+OhLvidD/3evMRIFqpGLG
	KECrGTIWfkvYg66Tviq2CVmGt6qWRQzNx4HRYHAo2z0JaUPeBMYLp9F4js7WH2M2lzF3Vk1LBfiwc
	eGsW0pOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfs1W-000000082WJ-0BPP;
	Wed, 14 Jan 2026 03:58:22 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfs1S-000000082Vq-0oqX;
	Wed, 14 Jan 2026 03:58:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CRqnPvSKgdaEifT3T8eh4YDJEcXbrH9LTnSTGWkH67dLZI6ToWEWOtdoHDovBHhVpGX/wgoOjJreeY/229IHni/N2HE/fhjLYLar97kVzW3SBoXEmRThyGkaouZ/zAt/jyOA7w1uiq+VMY6LLyanwBoSgEnNTJ3yv499odajyXIX9IDCOFGV9zmOe+36eqTORhtRIft+4nC0pt2IYmttZ9nJ8qJwYrcEIJZQy345RFvIn96kK97TAjP+PNqkt/FrQTuSF7GRJcf8OD5pbGuoQ6V3+ttkKMhz1tHmTm67CT8VK5iiTfrPi0w5Tym8rmSg/6QgicbYoPKeX5RfeD9B8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hq9MD8KSBDo1SCNCL3H8ZIOeXNs1FRqzG6AvLhYRZOA=;
 b=MWm36BTpTEHwOxrlYdv8ajpkv8YYktUi2vQjfZ2SbRwkWpLCVEgreUMtr+B98ZJHhtgKqkdQ+30RYV0Sh+eqELKQKAFLA7M1PTgBi72tOWrjZQZm6gv3j4riHmJfvIu42dYmZJb7Pwhgf9mj/z4WPtM4VFMjnhiXggei6iltS4/Ssg7C2/g5w67O/nfpC1plnOrnhyNyHXson3F3IUwzKgw7xvbnrFafrTeSmc5q5iua8Lcznnn13DZlCvuEajwjRT0xW3SSb6OJEaGd6m8HUuU7Oze6shzbBeTnB+lhCUFfB5g4X1HXpCBMf7JutaX/32Y9qJ8l3NrE+GerZuEm8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=khadas.com; dmarc=pass action=none header.from=khadas.com;
 dkim=pass header.d=khadas.com; arc=none
Received: from PS1PPF62EEA9B1D.apcprd03.prod.outlook.com (2603:1096:308::2da)
 by SEYPR03MB7094.apcprd03.prod.outlook.com (2603:1096:101:db::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Wed, 14 Jan
 2026 03:58:10 +0000
Received: from PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 ([fe80::af44:7e78:1133:adec]) by PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 ([fe80::af44:7e78:1133:adec%8]) with mapi id 15.20.9520.005; Wed, 14 Jan 2026
 03:58:10 +0000
From: Nick Xie <nick@khadas.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
	<khilman@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Xianwei Zhao <xianwei.zhao@amlogic.com>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-amlogic@lists.infradead.org"
	<linux-amlogic@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: =?utf-8?B?5Zue5aSNOiBbUEFUQ0ggMi8yXSBhcm02NDogZHRzOiBhbWxvZ2ljOiBzNDog?=
 =?utf-8?Q?fix_mmc_clock_assignment?=
Thread-Topic: [PATCH 2/2] arm64: dts: amlogic: s4: fix mmc clock assignment
Thread-Index: AQHchHkGKHTpVYIYQU2gHNe+nDCHobVRCmen
Date: Wed, 14 Jan 2026 03:58:10 +0000
Message-ID: <PS1PPF62EEA9B1D69C7BC1FA44FB41EFF68AE8FA@PS1PPF62EEA9B1D.apcprd03.prod.outlook.com>
References: <20260113-amlogic-s4-mmc-fixup-v1-0-1ab1fca0fb2f@baylibre.com>
 <20260113-amlogic-s4-mmc-fixup-v1-2-1ab1fca0fb2f@baylibre.com>
In-Reply-To: <20260113-amlogic-s4-mmc-fixup-v1-2-1ab1fca0fb2f@baylibre.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=khadas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PS1PPF62EEA9B1D:EE_|SEYPR03MB7094:EE_
x-ms-office365-filtering-correlation-id: 18ce92a3-c35c-44b1-2880-08de53212255
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?OWY5L204V0x1MTVHTFI0bWNrUi9wWjRaVWVMQTVROUpwWXVpM0FTZk8wZlha?=
 =?utf-8?B?ckhTTmZXWkJhOEtJWHNRUCtNMW9NYXk5ZjVaNHNyV2VVTFp6ekdORjBNdFFX?=
 =?utf-8?B?K3pwZXluUkhHanNpSG1WSWdQREk4Ykl1bHBiTVFhT3YrSGxXdHdtQ3ZKRms5?=
 =?utf-8?B?d1ZOaHNTb2daeWE4cHh3VEI3S3o3VnBZcUdBWmxWNlhmMFJ6S0o0MmlnUzVq?=
 =?utf-8?B?ek9RWS95UHM5Rm9lbmQ0THFKUUVUanFHNGVOK2FsdXVCb2xsSFplNUU2VjE0?=
 =?utf-8?B?WUZJbWRzQmRjY2tCblZZU1NqR2R2K1NzMVAvQkhMMGpoTHRhV0UvbjA5Wnpr?=
 =?utf-8?B?RlpGakRpL3FmdUNqcHVyUzJySXA5N29FVjNjT3lpUm1mWEhKSWNockVxeWY3?=
 =?utf-8?B?Q21nT3E4SUdJdlVweEdlWGJPMG9CWXlQU0dEZGZ5UTZvTnhETE1WRnpGeXBO?=
 =?utf-8?B?TlN2dE42U0tNbUdKT1ZRMnVYbTBxMVNQTVRRUFdGWDA5cVd1Q01TeGxUdVk4?=
 =?utf-8?B?emR3TnRHS1hFTU9IaDA4bm1OczZrMytBSlRuWHZBRTM4SnVjMHhBazUxUFk1?=
 =?utf-8?B?bUEyaE9GTlM2WG12bXlCN2dUMUNHeUQzYndXUm1xT0FlY3NZYWprYWtWeExI?=
 =?utf-8?B?RXIzN0swd3VGUURpMS9vZU1wYVRTaytBVVJySmhDbEgxMjJlRUxRM3EwZlFP?=
 =?utf-8?B?Zi9EbVBKdmwvcFBLNjFyaE9WYTltdDN2MUJUUmxTNWRMVDczYVJacHFDNlg2?=
 =?utf-8?B?dGtRY2dlVVZDbitFZlU2UUpIZVV4NFI5RjNidFBFR2U4Vnl4ZzRCc3RzdnlD?=
 =?utf-8?B?aTczd3lUd1JnQlArVFRqdkVSYXM2aUl0UTg5dEYzdnVFNVFpYlNhMGNodTNV?=
 =?utf-8?B?clg2QWljb0ZrdHc3ZHNGeWJ6WGVEUmhHOUs2SE1hbmNZS2tDREJRd1RqWHpW?=
 =?utf-8?B?MVdZbXJ3R1c0S0E0WE04M0Q5NXczbUVqOUcyV3FIbWxUVWdZa3hhNlg5dVps?=
 =?utf-8?B?VXE3dzRtVlR1N25va0dvY0dqVyt0U0lDaVV5aWxXUkhRNy9iem9LRThncHVB?=
 =?utf-8?B?Z1BsS1k2djlsSVMwdVN3VitUQUtsMnBGZU14SEVIMXZlMnJEYXdDcmkvRnBE?=
 =?utf-8?B?K1NXM1cwdVcxM1owb2lmNmw4d3ArOHA1K2NTdW1NeXdyMXI3VEN4Nll2Q0tF?=
 =?utf-8?B?TGVTMVh4VXE1cFVlU1ZYQ2taNVdwWkM5d3ZMc1l0aDY5WFowNTRjNjczNHlW?=
 =?utf-8?B?K2hGWTcrSG9hYm5WMTI5ekUrMFA0K0l1NUFueHpDNmhuanh4V0YxdmlWRXYw?=
 =?utf-8?B?Y3kyalI4bTlieVQ2Sk5rR3dHZ1Jhd0E1N0RlSlFJMmRST3VURDBtY0l4WGV3?=
 =?utf-8?B?NHFkVk5NRjNVdjAxM0ltaS9LVjlrazIvSEpqVmIzdVQrU3kvNHZhelFkNVNq?=
 =?utf-8?B?MUNiSEwxY1dvVTA3QThISHlvbWEzUXFHczBPY0lUYzFNeUk2WFVJcUtkY1pv?=
 =?utf-8?B?bnAxUEQ2QkJqK2tyWnJXSGdqVDlHeVp0NnVMQW9maHZuV3ZBdzJQbWNaTFMw?=
 =?utf-8?B?TittV0poSGdxbmpGU2k1OWFRT0lJQmNpYlh5L3R4VmhJWnBwL2dVR3pTUXQ0?=
 =?utf-8?B?YzgzWVk1bW9vOU5qbGZKR2NxcytBQ2t0YzJFYjVlZGxNY2NRRmpZbmhXYURL?=
 =?utf-8?B?S3lBWk5RVnJCbkNtZlB6N0s5L08vMGZ1NS9qM1FuWkd3TkpoVmtjNnJkT2d4?=
 =?utf-8?B?RllBRHd5djFNTGEwZlJXVXdxUWloRnp2NURjRDJOakNkNjJGNlJscExtT0VH?=
 =?utf-8?B?YmJqbVEydWFxZFhsVm1WK1NDQjdEK0lxa2EyUjE3Q280UldxbUQrc1VZd1B3?=
 =?utf-8?B?WVBRS0U2QWtsL1N0SWdqNG02OTFZeXIvNThEZHk4UGkwT2N6MzNyUjQ3YlJM?=
 =?utf-8?B?NDA1b2kxZmRGQ3ozNzV3SjVJbzRyZTlhR2lXaFpNTTFCYjdCcEVIQm91Mnh0?=
 =?utf-8?B?bUN3d3Y3RDJtSmJDYnhXZGVpckxCdjNhMFVDZitXcm0xY0o2UGVDSGtOTzlY?=
 =?utf-8?Q?7jGQFY?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PS1PPF62EEA9B1D.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YVg0cVlFdUdIcVlzZndVOW1meG50M3o0N3lSdmRlK0d5SU5RSURYSjhkaVFN?=
 =?utf-8?B?bUROMHpGSU9rUHdUSTA3V1h0eTdZbTY3V3NEbzZGZnJNR3BGS1QxY1Q2Q1A5?=
 =?utf-8?B?b0owWUp6UUtIaGtIWmpKNTkvVCtQcTNmZkhydEY2RmtNQ1RaU1BDUWVRc2wx?=
 =?utf-8?B?QzF1RnhBeWRiVmtQdmQ2TXBydGZZa0xnVjVMWks3bHUwclhHWmZrY3J4YlYx?=
 =?utf-8?B?MVFJeVlac0RJcU51VXhtcm4rY1lQejc0eWsrellFRlFMZ21nMFFuQmtqaTRJ?=
 =?utf-8?B?UDRPN2NLWEtnbDdZUW93Q2IxL0xja0IrS2dLVnB3VW1vMGFiZk0wM3VWQTRD?=
 =?utf-8?B?WmEwQ0dRUnBlanBxMkVSOHR5em51dkR6dEo2ZnNXWG94L3BHTHVPUWMxdVVw?=
 =?utf-8?B?MzV6MHJzUTRrSkpyYThWSDJHdjR0MUU3dFFhSE5aU3R2eFFoMzY0OXhUbUJr?=
 =?utf-8?B?dkpnK08vMTVRVTJhMGNVUUU3bWVMejNVNmpzcC80cHNvdXVuT2VKU1Z2L05n?=
 =?utf-8?B?ak9KVU9KS3lTY09SZVZFWk1ZRUUvdDVTNzJCMlU0SEd0cXpGSDh0NDcrOU1B?=
 =?utf-8?B?bng4YTJDL3QzVVJCNy9TZW92cHdvaFROdy82eVQzYmRNUjVkeWxsbWs3Zktj?=
 =?utf-8?B?NTNLUUVUTC9PWUw4OTh2QTZ0R3VJN2Eyd25RZ0NJeVFsd0RsMTFSMTFxUXRj?=
 =?utf-8?B?ekdiSE1JOG9tMUNpZ3pUUnFBdENBeHlkRjNONEFoUTA4Ym0zNXFMV0VwTGM4?=
 =?utf-8?B?K08xczVGbU5TcGFNVkEvRlJUanhveGFqTzNRT3FwSUNXQldOeitUZ3ErQWY5?=
 =?utf-8?B?SGFBRHJiY0E5SnhwclFUNStTbHp1Y1hWaTVtNTduZ2VVU2tnQnpLUjZCQk9Z?=
 =?utf-8?B?VXNrV3hVWkRaelZ1S3h5QW1yTm9aNGw3ak05QnRwZFhTYjB6UmpZbXlsS1By?=
 =?utf-8?B?N0ZqQ0J0L2NENUJlQkpkWTdqaDRqdUhaZDJlajFGKzZXSXR1aFRwZ2xxYU02?=
 =?utf-8?B?RWl5WUdYREs1emVoelJIYm4vZEJnMGpiVjNtK1BOSkpFdnZHWXpnc3lYR1ZX?=
 =?utf-8?B?Z1A0bmt1MEdsTkxneDlvYllweU90Qldad1RPRFR4VFdmZGVMOUE4S3FnYzhC?=
 =?utf-8?B?bWdzVzcyYzd5bC9GNzZMZDZQRFpGUCs0Q1Q4RWRsK2V1ZmFVY1kwSXhXcWVv?=
 =?utf-8?B?eERsUWJkZnNZUm9FY1NFK2tMQUxpMWYrM3BOcmxlcGV6RHFnU0EvRnR6V3Jo?=
 =?utf-8?B?QUtNVkRlbE9OYVgySE04b3BDMVNSaE01dFNKVU9wT3RLZHU4ZEV1SXRNckxO?=
 =?utf-8?B?dGU3NUdMRHRYYklFWWdneitBZ1loeWRHVldMSFo4YTVuWHMyZ0J3b2trL1Ri?=
 =?utf-8?B?T2twU1lHUy8wdFFPN3NyUTJTYm1LVXo4OGhmcGxVT3ZuVkk4Z2dJMnBUMnFQ?=
 =?utf-8?B?ZzJaWHlwWG5uZ1Y4WWVTeTVKWHR3bURoUHd5Tk42Z0hRcC94UFg0cCtRR2cy?=
 =?utf-8?B?MXkwdlNkTGxsSHhjQm1oZHY2Q1hDeWx4dVBxb2F5S0dCaXlkSTIrM0FjY3Yz?=
 =?utf-8?B?WVZLNFpJQ2oyUkJlT08zK2FYYy9RT1BlQTlqOGJDNWZ6RURocWZydS9XbWpq?=
 =?utf-8?B?VXhkZ1oveXNSRzJFMkdPQTNtV01ESm84QlRVVWtBMEo1N3VrSDdjWUNqUi9K?=
 =?utf-8?B?QUd6TUJRbEFLQkxqQWZWS09ZZGlSV0svU3dGdVNVQjQ1YmdHUFFmSVdRdUJX?=
 =?utf-8?B?S0lnVVhpV21yOGxwU3BvTWU4b0paTjFaamxlbjQ0TW1pSVZuSWY0VGhXdnpt?=
 =?utf-8?B?VC9Gc2c0R1VIYk9PZFlMNDUxTEl4M2t3OVNSeXJ1RUdVRnpmR3BrajdmcjY0?=
 =?utf-8?B?WG4razdGSmFZdEd3VFh3WG81ODFPcnExNkJvYzhHTWJjajArVkZ5RWJydG9Q?=
 =?utf-8?B?QXYzdWZhQ0NzR1RKeTgxczdCMDlOYXlTR3htU1BBRTVQNkEwUEZnSkx4N1R6?=
 =?utf-8?B?ckNUMUNYcExCN0diaG5tTEhzazkrUE5GSGNFSTRrb1JTbHdjYnFvMDFLSktj?=
 =?utf-8?B?SVBxcmI4QjFOQmE2aS9JTjhHTEJXVUhFeWxPV0xZYjFiZVJTL1EwY0xFNEIz?=
 =?utf-8?B?T3BoUGdSUklWMkwvQ2FuRDBUMnNBVWZnVURkUWltNHFtYmszZ1FIayt1TkR2?=
 =?utf-8?B?enVlUFJUbm1MWmgxcW5WQWZSbUZFcWI3QjVDNnJGNFkyUUp3UWJEM3RaME1V?=
 =?utf-8?B?RlZLRkFYL2pKaWFpKzBBd2RuTjgzcHdtdGRYdThmTHI3Ykl0VUEwVi9nMHBM?=
 =?utf-8?Q?JOvOLtJ7pP4/x7gwB1?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: khadas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18ce92a3-c35c-44b1-2880-08de53212255
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2026 03:58:10.7620
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2dc3bd76-7ac2-4780-a5b7-6c6cc6b5af9b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vPbRuR/r+fUvAeKEVv9SCRaFfQb4i8qwaiBZihkGbqHvNeCg4pSRf4WIw1XUBR8/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_195818_353759_4FD38A43 
X-CRM114-Status: GOOD (  10.35  )
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

SGVsbG8gSmVyb21lLAoKSSBjaGVja2VkIHRoaXMgcGF0Y2ggb24gQW1sb2dpYyBTNCBTOTA1WTQs
IHRoZSBlTU1DICYgU0RJTyBjYXJkIGFsc28gd29ya3MuCgpyb290QEtoYWRhczp+IyB1bmFtZSAt
YQpMaW51eCBLaGFkYXMgNi4xOS4wLXJjNSsgIzI2IFNNUCBQUkVFTVBUIFR1ZSBKYW4gMTMgMTY6
MDE6MTggQ1NUIDIwMjYgYWFyY2g2NCBhYXJjaDY0IGFhcmNoNjQgR05VL0xpbnV4CnJvb3RAS2hh
ZGFzOn4jIGRtZXNnIHwgZ3JlcCBtbWMKWyAgICAwLjMwMTE4Nl0gbWVzb24tZ3gtbW1jIGZlMDhh
MDAwLm1tYzogR290IENEIEdQSU8KWyAgICAwLjMwMjAyOF0gbWVzb24tZ3gtbW1jIGZlMDhjMDAw
Lm1tYzogYWxsb2NhdGVkIG1tYy1wd3JzZXEKWyAgICAwLjM5MjI1Ml0gbW1jMTogbmV3IFVIUy1J
IHNwZWVkIFNEUjEwNCBTREhDIGNhcmQgYXQgYWRkcmVzcyBhYWFhClsgICAgMC4zOTM0MTRdIG1t
Y2JsazE6IG1tYzE6YWFhYSBTUDMyRyAyOS43IEdpQgpbICAgIDAuMzk1NzI0XSAgbW1jYmxrMTog
cDEgcDIKWyAgICAwLjQ3MzY5MV0gbW1jMDogbmV3IEhTMjAwIE1NQyBjYXJkIGF0IGFkZHJlc3Mg
MDAwMQpbICAgIDAuNDc0NDE3XSBtbWNibGswOiBtbWMwOjAwMDEgQUpURDRSIDE0LjYgR2lCClsg
ICAgMC40NzU4NTJdICBtbWNibGswOiBwMSBwMgpbICAgIDAuNDc2NDEzXSBtbWNibGswYm9vdDA6
IG1tYzA6MDAwMSBBSlRENFIgNC4wMCBNaUIKWyAgICAwLjQ3ODE0M10gbW1jYmxrMGJvb3QxOiBt
bWMwOjAwMDEgQUpURDRSIDQuMDAgTWlCClsgICAgMC40Nzk3MTZdIG1tY2JsazBycG1iOiBtbWMw
OjAwMDEgQUpURDRSIDQuMDAgTWlCLCBjaGFyZGV2ICgyMzk6MCkKWyAgICAzLjI0MzY2NF0gRVhU
NC1mcyAobW1jYmxrMXAyKTogbW91bnRlZCBmaWxlc3lzdGVtIDQzYjY4ODFhLTQ4M2MtNGNhNy05
ZGNkLWY0NTc1ZTY2NWE4YiByL3cgd2l0aCB3cml0ZWJhY2sgZGF0YSBtb2RlLiBRdW90YSBtb2Rl
OiBub25lLgpbICAgIDQuNzA2MTU0XSBFWFQ0LWZzIChtbWNibGsxcDIpOiByZS1tb3VudGVkIDQz
YjY4ODFhLTQ4M2MtNGNhNy05ZGNkLWY0NTc1ZTY2NWE4Yi4KWyAgICA1LjkwMDk4Nl0gRVhUNC1m
cyAobW1jYmxrMXAxKTogbW91bnRlZCBmaWxlc3lzdGVtIGYyMGNhYmFlLWJiYzYtNDU3ZS05YmIz
LWJhYzZlZWYwMWFmNSByL3cgd2l0aCBvcmRlcmVkIGRhdGEgbW9kZS4gUXVvdGEgbW9kZTogbm9u
ZS4KWyAgICA2LjI4MzYwOF0gbWVzb24tZ3gtbW1jIGZlMDg4MDAwLm1tYzogYWxsb2NhdGVkIG1t
Yy1wd3JzZXEKWyAgICA2LjQ4NDMxMF0gbW1jMjogbmV3IFVIUy1JIHNwZWVkIFNEUjEwNCBTRElP
IGNhcmQgYXQgYWRkcmVzcyAwMDAxCgpUZXN0ZWQtYnk6IE5pY2sgWGllIDxuaWNrQGtoYWRhcy5j
b20+CgpCZXN0IFJlZ2FyZHMKTmljawoKCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18K5Y+R5Lu25Lq6OsKgSmVyb21lIEJydW5ldCA8amJydW5ldEBiYXlsaWJyZS5j
b20+CuW3suWPkemAgTrCoDIwMjYg5bm0IDEg5pyIIDEzIOaXpSDmmJ/mnJ/kuowgMTg6MzkK5pS2
5Lu25Lq6OsKgUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz47IEtyenlzenRvZiBLb3psb3dz
a2kgPGtyemsrZHRAa2VybmVsLm9yZz47IENvbm9yIERvb2xleSA8Y29ub3IrZHRAa2VybmVsLm9y
Zz47IE5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPjsgS2V2aW4gSGls
bWFuIDxraGlsbWFuQGJheWxpYnJlLmNvbT47IE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRpbi5i
bHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+OyBYaWFud2VpIFpoYW8gPHhpYW53ZWkuemhhb0Bh
bWxvZ2ljLmNvbT47IE5pY2sgWGllIDxuaWNrQGtoYWRhcy5jb20+CuaKhOmAgTrCoGRldmljZXRy
ZWVAdmdlci5rZXJuZWwub3JnIDxkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZz47IGxpbnV4LWFy
bS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZyA8bGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZy
YWRlYWQub3JnPjsgbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnIDxsaW51eC1hbWxv
Z2ljQGxpc3RzLmluZnJhZGVhZC5vcmc+OyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnIDxs
aW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnPjsgSmVyb21lIEJydW5ldCA8amJydW5ldEBiYXls
aWJyZS5jb20+CuS4u+mimDrCoFtQQVRDSCAyLzJdIGFybTY0OiBkdHM6IGFtbG9naWM6IHM0OiBm
aXggbW1jIGNsb2NrIGFzc2lnbm1lbnQKCgpNTUMgQSBhbmQgQyBhcmUgbWlzLXJlcHJlc2VudGVk
IGFzIGhhdmluZyB0aGVpciAiY2xraW4wIiBpbnB1dCBjb25uZWN0ZWQgdG8KCnh0YWwgd2hpbGUg
aXQgaXMgYWN0dWFsbHkgY29ubmVjdGVkIHRvIHRoZSBNTUMgY2xvY2ssIG1vc3RseSBpbiBhbiBh
dHRlbXB0Cgp0byBwcm92aWRlIDI0TUh6IHRvIHRoZSBkZXZpY2Ugb24gdGhpcyBpbnB1dC4KCgoK
Rml4IHRoaXMgYW5kIGFzc2lnbiB0aGUgY2xvY2sgdG8gMjRNSHogdG8gYWN0dWFsbHkgcHJvdmlk
ZSB0aGUgcmVxdWlyZWQKCnJhdGUuCgoKCkZpeGVzOiAzYWI5ZDU0YjVkODQgKCJhcm02NDogZHRz
OiBhbWxvZ2ljOiBlbmFibGUgc29tZSBkZXZpY2Ugbm9kZXMgZm9yIFM0IikKClNpZ25lZC1vZmYt
Ynk6IEplcm9tZSBCcnVuZXQgPGpicnVuZXRAYmF5bGlicmUuY29tPgoKLS0tCgrCoGFyY2gvYXJt
NjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1zNC5kdHNpIHwgMTIgKysrKysrKysrKy0tCgrCoDEg
ZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKCgpkaWZmIC0t
Z2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLXM0LmR0c2kgYi9hcmNoL2Fy
bTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tczQuZHRzaQoKaW5kZXggNjI1MzhmZDlkYjZiMWZm
YjMzYTg4ZTEyNjI4YWFkZWZiYWE0NTNlYy4uNjMyNGQxZWI1OTk0MDA5ZGY1YjA5OTIzY2NlMzcz
YTg3MjI5ZjRiOCAxMDA2NDQKCi0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNv
bi1zNC5kdHNpCgorKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tczQuZHRz
aQoKQEAgLTgxOSwxMyArODE5LDE3IEBAIHNkaW86IG1tY0BmZTA4ODAwMCB7CgrCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVnID0gPDB4MCAweGZlMDg4
MDAwIDB4MCAweDgwMD47CgrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgaW50ZXJydXB0cyA9IDxHSUNfU1BJIDE3NiBJUlFfVFlQRV9MRVZFTF9ISUdIPjsK
CsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjbG9ja3Mg
PSA8JmNsa2NfcGVyaXBocyBDTEtJRF9TREVNTUNfQT4sCgotwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPCZ4dGFsPiwKCivCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCA8JmNsa2NfcGVyaXBocyBDTEtJRF9TRF9FTU1DX0E+LAoKwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDwmY2xrY19wbGwg
Q0xLSURfRkNMS19ESVYyPjsKCsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBjbG9jay1uYW1lcyA9ICJjb3JlIiwgImNsa2luMCIsICJjbGtpbjEiOwoKwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlc2V0cyA9IDwm
cmVzZXQgUkVTRVRfU0RfRU1NQ19BPjsKCsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBjYXAtc2Rpby1pcnE7CgrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAga2VlcC1wb3dlci1pbi1zdXNwZW5kOwoKwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0YXR1cyA9ICJkaXNhYmxl
ZCI7CgorCgorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYXNz
aWduZWQtY2xvY2tzID0gPCZjbGtjX3BlcmlwaHMgQ0xLSURfU0RfRU1NQ19BPjsKCivCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBhc3NpZ25lZC1jbG9jay1wYXJl
bnRzID0gPDA+OwoKK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGFzc2lnbmVkLWNsb2NrLXJhdGVzID0gPDI0MDAwMDAwPjsKCsKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIH07CgrCoAoKwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2Q6
IG1tY0BmZTA4YTAwMCB7CgpAQCAtODQ5LDEzICs4NTMsMTcgQEAgZW1tYzogbW1jQGZlMDhjMDAw
IHsKCsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZWcg
PSA8MHgwIDB4ZmUwOGMwMDAgMHgwIDB4ODAwPjsKCsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMTc4IElSUV9UWVBF
X0VER0VfUklTSU5HPjsKCsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBjbG9ja3MgPSA8JmNsa2NfcGVyaXBocyBDTEtJRF9OQU5EPiwKCi3CoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8Jnh0
YWw+LAoKK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIDwmY2xrY19wZXJpcGhzIENMS0lEX1NEX0VNTUNfQz4sCgrCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
PCZjbGtjX3BsbCBDTEtJRF9GQ0xLX0RJVjI+OwoKwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNsb2NrLW5hbWVzID0gImNvcmUiLCAiY2xraW4wIiwgImNs
a2luMSI7CgrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
cmVzZXRzID0gPCZyZXNldCBSRVNFVF9OQU5EX0VNTUM+OwoKwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG5vLXNkaW87CgrCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbm8tc2Q7CgrCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RhdHVzID0gImRpc2FibGVkIjsKCisKCivC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBhc3NpZ25lZC1jbG9j
a3MgPSA8JmNsa2NfcGVyaXBocyBDTEtJRF9TRF9FTU1DX0M+OwoKK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGFzc2lnbmVkLWNsb2NrLXBhcmVudHMgPSA8MD47
CgorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYXNzaWduZWQt
Y2xvY2stcmF0ZXMgPSA8MjQwMDAwMDA+OwoKwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgfTsKCsKgwqDCoMKgwqDCoMKgwqAgfTsKCsKgfTsKCgoKLS0KCjIuNDcuMwoKCgo=

