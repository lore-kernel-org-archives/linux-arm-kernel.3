Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08B33E9462E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 03:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gs01kHrp5WvSs9FWODcvnV7LAbmi1bhgNe3J6e/39GY=; b=VNrcM/zbDD1wdN8F5uxWPHe5JY
	PGLZDqO8xL1E09P8U7nGiAGhgJ/X8Nb8pceockOT7DOD3XP9GwG4Bat/CUPoc7RDZYYn3Dw8opNbF
	imh4qSD0IgbWxJpThrySGSDhLrXRZm9b1X3LQF8rawj6CgNIU5bahjzrT3AjU96ckNMdxzdlxDWqx
	t3jOMy/LtEYw3bDbAIuFGQQmDWTYYRhh6/49jjRjwodnOGHKEEI/awPskcKcxt0RcjNmTQ98UwNd5
	q7wrFxUalLOlf/668tEEM/Dw9awLRb6rGU4SymFNf/Hf0EPtCaVasIYML0BRQmWzW8VCqnz4bS6vM
	rQBgObcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpeZ1-0000000GNuj-3UUL;
	Tue, 10 Feb 2026 03:37:23 +0000
Received: from mail-japaneastazon11022092.outbound.protection.outlook.com ([52.101.126.92] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpeYx-0000000GNu3-3bND
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 03:37:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZAwk8TyezV9WwgJMrlJAllzoHSY+mwDXlRPHr79laHbzcipkFy165fC+R8BfU93uznx+e7w0tq6XkhFfi2rQVIILcpxRp1bnAuSzA8+8uI+dzx+sCrsu1mEqznkP1zW4XjC8DlY6nfE9XrlMCnqCzuXhzZJEewp6RXVMk4qY+S1tim9krOpurFWTWDKOjemyUbGB1UNSPSQonjGGxHt/7nvh6ai3x74qNev5IkUuT8n2n0wQlhdcCKSZitmGhszpxtp6f7GNxF+nQBXAdfHga+m/kErAVMcLub1SOlXGhPwxajiLLxIxz8I6uv4cvpGJv01EBaUAkcIb+lCVuVGgqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gs01kHrp5WvSs9FWODcvnV7LAbmi1bhgNe3J6e/39GY=;
 b=pceGoFodAJZeHF/Qq0kE1C7bnx/e8BHleshEQVUiaVc4/v1f8iL3ogvb3bsqRcgbYJQwpxe2648G2WQK0Z8UJ/0+Bd8VI7l1fVWa0emgUyIrA0HhkSh5i6g805gmPJuWK3a81ble4iW4hlpvtFKmG4+XNMv+E/DRe3ICBjX3xk2V0rE+sjt6+sV9VdfiVDgobC82FLcATVyJGY5mGuEde9tXIy0HmbymlBc5XhQDwGlzwcQh/MVUQU5l7YZ3cLHWJGo+n+HS07+lQDdG53xvecu4cjorpcbNnqPSGD2fr2Cu3/dYChNYY/lw/L8dc8V0mUbCoUcmM3KuvaCVTd7Liw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from PUZPR06MB5887.apcprd06.prod.outlook.com (2603:1096:301:117::13)
 by KU2PPF557D403C2.apcprd06.prod.outlook.com (2603:1096:d18::495) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Tue, 10 Feb
 2026 03:37:09 +0000
Received: from PUZPR06MB5887.apcprd06.prod.outlook.com
 ([fe80::f320:58f6:4dc6:b908]) by PUZPR06MB5887.apcprd06.prod.outlook.com
 ([fe80::f320:58f6:4dc6:b908%4]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 03:37:09 +0000
From: Gary Yang <gary.yang@cixtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, Peter Chen <peter.chen@cixtech.com>,
	"unicorn_wang@outlook.com" <unicorn_wang@outlook.com>, "inochiama@gmail.com"
	<inochiama@gmail.com>, "alchark@gmail.com" <alchark@gmail.com>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, cix-kernel-upstream
	<cix-kernel-upstream@cixtech.com>
Subject: =?utf-8?B?5Zue5aSNOiBbUEFUQ0ggdjggMS8zXSBkdC1iaW5kaW5nczogc29jOiBjaXg6?=
 =?utf-8?Q?_document_the_simple-mfd_syscon_on_Sky1_SoC?=
Thread-Topic: [PATCH v8 1/3] dt-bindings: soc: cix: document the simple-mfd
 syscon on Sky1 SoC
Thread-Index: AQHcmacxJy5eA4tDnkefPVMOiCJO7rV6PK4AgADu0yA=
Date: Tue, 10 Feb 2026 03:37:09 +0000
Message-ID: <PUZPR06MB5887D218A0A69676ED2FEBDFEF62A@PUZPR06MB5887.apcprd06.prod.outlook.com>
References: <20260209093344.2013693-1-gary.yang@cixtech.com>
 <20260209093344.2013693-2-gary.yang@cixtech.com>
 <4a26d89a-95ca-4888-aaea-876b9612d006@kernel.org>
In-Reply-To: <4a26d89a-95ca-4888-aaea-876b9612d006@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR06MB5887:EE_|KU2PPF557D403C2:EE_
x-ms-office365-filtering-correlation-id: a15f65a9-d635-4d99-dc58-08de6855ab87
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?d202N0htSVNlcDRYWnY3ZC9hOFFORUc4MEhFdkJOQXUwbFVWOWVvRDlLb3Mv?=
 =?utf-8?B?MmRWdzZzZEFkeVF0dm1aYkpWRGtJQlNuNXY4SEVnbkVMa1ZtT01Ta0xtTnkr?=
 =?utf-8?B?L3B0QmFRQzNmRlZkYVMzYzRZL25mRVo4T0pWdnNxV3hCNzZrZmd6NEJqQTE0?=
 =?utf-8?B?TjA0L2kzbTlHQ0NuVXp0TTYwSm5BZkQyZWkzK0d6ZTZSUEIxYzB1N1o0WTBm?=
 =?utf-8?B?aTNYSXp6TDd5UnV4a1hsaVJncFBEd21USTNRZElCT3NRTGFWd1U5cnA1UUlz?=
 =?utf-8?B?dGhnUzRhOHV1c0NpOHhMMHRxcElGT1BOQm1abUpkaHZrdzF0Y3hzOXhPSjBB?=
 =?utf-8?B?MjdXWGVWcTQ5YVpFb01VL0VYZ0RmVkhhMmVTZkJhUXlSdnI4RXg4Y2gxcFUr?=
 =?utf-8?B?bGlSUFUzdHg2b0hiOTdEVVpac1M2WnU2eGc2ajhtM0hRMDBsT3ZkSjRmdWtX?=
 =?utf-8?B?QUdrL0Z1eTZTZDFlelVOUXVrYVhhb3NnaThKaFc4VkZlcXVUa01uUVhybWdx?=
 =?utf-8?B?QlFPQmNZNTdTQlorSTZPYTN5SGJFUGpHaUhOR1R5NDBYZldWN1QvZTZFMHBk?=
 =?utf-8?B?QkN4OGkzRWxhRnNyZjZ3NEN3WlExaW5GQUpoajI4RjlHTng5NEtBMjIxMnll?=
 =?utf-8?B?OW5sWUhKeUd0S0kzYi83RGhvaFFNTUlJMEROSGtLeVR3TisyRjFYQ3hFdHRl?=
 =?utf-8?B?TlFIeXZheUxVWk5FU2NITjVjSDdELytMUm1lNUUzRzF2dkRLRzdPOEpmekxV?=
 =?utf-8?B?Q2NOWHBMYVU2V0VVTEVDVmFNa2xkL1hFV1VzR1hGUTMvdlJEd0d3RytxYUwx?=
 =?utf-8?B?T0VMR1Jzbm0yNnZ3aWc5dk4xUktTN1JnN2tYZXAySU1KUFNuS0pGalJCbjZK?=
 =?utf-8?B?K1lTbXE0OUhhS3B4aEhiZXppL1NuNlp1MkRnWkUzSkRTNTBWenVWQ00zS1c4?=
 =?utf-8?B?ZCs5QS9qUmh4N3hhTHllT3lEWE5wWDFUbEE1bVBIUWZ5aW1ZL1J1SFI2MXpr?=
 =?utf-8?B?dGplOXBHeFBJVVJaQlVHWUIzQ2FTa0R6ek13bFJBQWJVeS9jSGQ2K3g1SDhn?=
 =?utf-8?B?WnlGMTF4NGtDd3k0UGV5US9HVXZpWGlKbWNsWk01amRZbVpJcmJiUkY4SUpG?=
 =?utf-8?B?VUVCVVhYSVhvU2tqY08rL2htYXl3U0lYSlBCZ1psUldmbEk2SkZaQnJrRUR5?=
 =?utf-8?B?T0xPYmlZQitIY2pBcEc1UkpuNnJDa2dQdVBPeE9DWkRYY2l2QXhYVEhyNXRB?=
 =?utf-8?B?ZzFOQzdpOE8yVFVTSTltaHVHc2pyTE0yeXp1WEpIb3lyU3lLMnk4ZVk1engz?=
 =?utf-8?B?V0Y5QzE0cXdNR0ZYcUQzaHdzSCt4RkdRUHQvbmd5b3FjZk5WdVB0cEhvak1r?=
 =?utf-8?B?V3BZbjBmalB5ZytyQ3JsVWxBeUlwZEZNU05QTEhBMmVKUHV3d1YzK3FYQzFD?=
 =?utf-8?B?amt1d21GdFJxd3BTTllmOXMxQjNYTXZBd1p3My9lNFpLbFB6YTY2SnZDZmtH?=
 =?utf-8?B?VFlwNkZjR3BmMG0ySTVaUnBzTzBNK2p1TWJ3bHJxd3ZTMms0T0dDZGRhZG9a?=
 =?utf-8?B?cXB3aWZsTEdDUGpSTXByNzlJaGttM1J0RnM5MnUvZHlHUVdxdjBsai9NRVdI?=
 =?utf-8?B?d1Z1ZVNpUVk0Q0NvUm5FdmdHbEVNakx6UzRIT0V1WHBtTEJVeWZ2RndOd0ht?=
 =?utf-8?B?ZHp2R0JYb3BjRUYweC91S3RsLzAzbVRtVzVLN2RKbkttYkZTRXBEMHVJbWZS?=
 =?utf-8?B?UFZQVDJoL3VQKyttd0xpNmZvUmFkR1dBQXpaSWFGbVh1OENMNGFVQXl0SldS?=
 =?utf-8?B?TVdMTjdPQzBwSzZRWVRHekRwTnUwckJ2UDkvQ3pUTmF6b2FVczZpM3RHZ1ZQ?=
 =?utf-8?B?RXhMdFdEbUxvZjV5NExWTjVlVjBpODFYQndraVZCZi9RMUVteFNtZU4xN05S?=
 =?utf-8?B?T0pheTRUUEc4OUFKQi8zM1Y1VjNFSTVaY1k4REo0MjN5WkVyaFRsS0Z1RzEv?=
 =?utf-8?B?S2Y2QzVQVGtFUkVJNXJuK2loRkNaV2EwZ09Ud1RXdUJ1ZHNJbEQvUzZLQWZl?=
 =?utf-8?B?dERKM0tKc0NlMTNkT0tpK24yRTJOTVNOeUgrRjVSVmMvWGJaNFkzY2lzVXgv?=
 =?utf-8?B?cEF0Z05VRWc5elBNNWJWcmt1eTZwTklLN3g5czBZWStKUGEzTy9EQjJiemVw?=
 =?utf-8?Q?xtTSQUdr9lQzKsR53aYUFqtCqLc9S5Psqq3im8u3xJw6?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR06MB5887.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S2ltb2htZkJoNjU1dUkwL0hCOFEwbG96L0c2VHdiQ3FvcVkyd2RLeFdCVnA3?=
 =?utf-8?B?bE11ZkthTzJSblI1d1U3bnBRTmQxaVI0MlZ2V1Ryek10eHl4cXptMW9FY253?=
 =?utf-8?B?TWxtNlR2SnAvK0hXUm9NYXB6dEZkZk1zRjQ5VDMrVkpNZWdoZkNWT0hzZG5Q?=
 =?utf-8?B?WmdyVldZWHpQNlVzUEQ5SHAyaHM0U0QzRmhxbWJmZEMwNjhHRFYwRGNGeXBn?=
 =?utf-8?B?dzZPZ3VNLzJZdlNOMHpaK2hocWtVRmswYXNKc3B5OUljMnlIVWcrMkxoS2VO?=
 =?utf-8?B?U1dQeGNlZWhXT0JKaklpbFFtZ05aMGdHZVZWTWkwVG1nS3lYMU80NUJnVzVw?=
 =?utf-8?B?VnRnTWNZdDFSZzhQbUR4Qi9kcHh5SFRDeGh5a1d5M3UrOFJyVGExMGtuYjJT?=
 =?utf-8?B?TXd2bENxaTZBYk41dEZWS1ZRcmtweFVTWVRFYS9NNE8zVGxjS216S0s2ZG9u?=
 =?utf-8?B?TkhJQUI2RmRuRU95cGU2cVZCRG96QzVGOWV6UCtFeVlzTVFieVhDQjd4S1BC?=
 =?utf-8?B?QzFDcGt0a0FpSU5yM21GeVFJcGJ1VFZ6c1NkeHRiaDhHcVo2TUErdjlKbXh2?=
 =?utf-8?B?OGtZWmVvSWdxdnR1QjBOVTI0dkZWcWtqVUYrMDVmTmxoVTFvbnE1dkVQRXRP?=
 =?utf-8?B?MVIxNExQTzFwMmdqQWVDU2JmUnZhQmI3M2ZucXNudnVyelBDVmwyNithelBx?=
 =?utf-8?B?WTVvcC9aeXVTaVgxN1BSaU1GRWZzeTRRSGNYK202N3ZBdm1saFllM2lmaGZI?=
 =?utf-8?B?b0xqZnlnRmlTL21Ccm9hY1A1K0t1NWsraDdjdFkxc3Z6RXZSeUNyZFArY0gx?=
 =?utf-8?B?QWpxTUNUZ1JGek9kUjVXaldpakEwTCtocVIxb2txRWUvM2I4NXBLczVhTFNa?=
 =?utf-8?B?MWk0MGMzTFZPSW14ZjVERHo2OHQ4c2Y4cEswMGZvZGlRd3kvYkZ0MnB4N0lW?=
 =?utf-8?B?NXBTLzhMWjRhK1lSc2Q3ZHQ0RGl3TDhVR1MvRFVOVVo3QS9IVnNYUUs5a3lD?=
 =?utf-8?B?UWIySEZ1eTVMTXpQQ2RXVm13c1hGa1gzbm41d09mblU3cHEwTnEyMTlUNERI?=
 =?utf-8?B?cVhnOXZDaEo5c1pWeUJyWEdZWTl1VnZsWHlMTmN1eVhqT3NJampFekE4TWIw?=
 =?utf-8?B?cWRrQ2tmQjV6b0kva1BFdnEvVnlsWUlPUUZYTzJGTDZiVjZwdFFBZ20xakVz?=
 =?utf-8?B?ZkhNMDdWRlBQSE14VUthZXRjalpMYW8wRkp2SzBFcjJxajQxNE0wc3pLOEQ1?=
 =?utf-8?B?SlJ5T3RTTUNjRVBMV2VZLzVrRTk3aC9IL0N3WFkxdmQ0N29PajBXZVE0V054?=
 =?utf-8?B?QkFUTkV6SnJJV3ludEVHK2NSOUhRSFkveVVMWjIwZ1A4VXl1L0NCU3JZQWV0?=
 =?utf-8?B?VHhTQnpybXVqTlJaZTRsbnF4WXZHMGZsekU2NngyVksvL2Fnc3p6S3NlU2dl?=
 =?utf-8?B?ZDAvSVY5cmZabGkvVmhaRzVDc3MyeFI0Z2dkYUl0bGFHcWZULzE5bDA5SnVj?=
 =?utf-8?B?NERvVDRhU0U3MVgvMFlhdHZCY3ppbXRiMmFNVllZcmxYQ2EyaDNiR2pJZUNn?=
 =?utf-8?B?VllLbEFNaWpsV1VBcVdSNmZNS1BZRUoySmdLamQ3WmdaRVRhYkh3NXdWdUdh?=
 =?utf-8?B?Z0JtVjQwMkt3YmhMUW03cGpEK1FyYXN5L1RkVTFQaHlucTdCZXRMVnhudTk5?=
 =?utf-8?B?SllHcE8rQkJwSU5kZTJaMUhPNVp4eGlaUHBGQk55YTRaNzJWTXpYRzFZQkdh?=
 =?utf-8?B?QllmZjEvd1NMV2I5UGtwemRLeUVYTHZvMkNYTDRPY3JSY2dVam5zMkV3bmxG?=
 =?utf-8?B?NGxWZ1prN1ZSbFRvWTlZMExjUUJEOVJweml5R1lBTlkxSzlnY0hFNnJpczg2?=
 =?utf-8?B?dlBBY2dSS2ZVWXdOOVgyMUw4S2MrQUwwbkhtL0ZsSGpwRFR1cHBFTFdSR1JJ?=
 =?utf-8?B?TTdmUU1ONVBVMWJRVHpHeTJQaE9Db3drWk9tL1FHNlY2SndOdytXb095dDhW?=
 =?utf-8?B?Qi9IYUhuK1N6bllxejVsZ2dYZCsxb1BMUlJsY0pHN3MvVHBnV2pTemRSNHdl?=
 =?utf-8?B?em5uOHBKV1F3dVIwckhIR0dsMlY3bVJ4NWdJbkd4M04ycGUzUDliUzB1cXhB?=
 =?utf-8?B?Vjh2Yk1Eb2Q2SFBUZkVZUDYya2psRnlvSnYzS0R3WWMwZ2FmVUo1enR1dXZP?=
 =?utf-8?B?NEtrakZkZlNpdEt2Q0pMeEZGUmg3eThDRmt3SHFIdEFhcXZtWEdsTmdUdkxH?=
 =?utf-8?B?YnBWU01JRTlwcy9xT29GNGxoVDNjZFZ4Q2RRaHhlN1BTRVJSVDhuWmxGazVi?=
 =?utf-8?B?bnc5OGZGcm9rVlpPMGpSZmMyV3g1ZklBRUFyTmdlL3ZLWkJzT0FGQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5887.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a15f65a9-d635-4d99-dc58-08de6855ab87
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2026 03:37:09.2449
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TyOHNmhTvh+WCrHcIhC3EwvqlPJX1O6K/SNgeMZBuMos/9L7e4FHTasWeyAcDEyJEM5CmVokj1xHpE7MXQRjPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KU2PPF557D403C2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_193720_027842_D68EED93 
X-CRM114-Status: GOOD (  27.11  )
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

SGkgS3J6eXN6dG9mOg0KDQpUaGFua3MgZm9yIHlvdXIgY29tbWVudHMNCg0KPiBFWFRFUk5BTCBF
TUFJTA0KPiANCj4gT24gMDkvMDIvMjAyNiAxMDozMywgR2FyeSBZYW5nIHdyb3RlOg0KPiA+IFRo
ZXJlIGFyZSB0d28gc3lzdGVtIGNvbnRyb2wgb24gQ2l4IHNreTEgU29jLiBPbmUgaXMgbG9jYXRl
ZCBpbiBTMA0KPiA+IGRvbWFpbiwgYW5kIHRoZSBvdGhlciBpcyBsb2NhdGVkIGluIFMwIGFuZCBT
NSBkb21haW4uIFRoZSBzeXN0ZW0NCj4gPiBjb250cm9sIGNvbnRhaW5zIHJlc2V0cywgdXNiIHR5
cGVDIGFuZCBtb3JlLiBBdCB0aGlzIHBvaW50LCBvbmx5IHRoZQ0KPiA+IHJlc2V0IGNvbnRyb2xs
ZXIgY2hpbGQgaXMgZGVzY3JpYmVkIGFzIHVzYiB0eXBlQyB1c2VzIGl0IGJ5IHBoYW5kbGUuDQo+
ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBHYXJ5IFlhbmcgPGdhcnkueWFuZ0BjaXh0ZWNoLmNvbT4N
Cj4gDQo+IFN1YmplY3QgaXMgbm90IGNvcnJlY3Qgbm93LiBUaGVyZSBpcyBubyBzaW1wbGUtbWZk
LiBUaGVyZSBzaG91bGQgbm90IGJlIGV2ZW4NCj4gc3lzY29uLCBiZWNhdXNlIGl0IGlzIExpbnV4
IHRlcm0uIEp1c3QgdXNlIHRoZSBuYW1lIG9mIHRoaXMgZGV2aWNlLg0KPiANCg0KWWVzLCBJIGFn
cmVlLiBXZSB3aWxsIGZpeCBpdCBuZXh0IHZlcnNpb24uDQoNCj4gPiAtLS0NCj4gPiAgLi4uL3Nv
Yy9jaXgvY2l4LHNreTEtc3lzdGVtLWNvbnRyb2wueWFtbCAgICAgIHwgIDQyICsrKysrDQo+ID4g
IGluY2x1ZGUvZHQtYmluZGluZ3MvcmVzZXQvY2l4LHNreTEtcnN0LWZjaC5oICB8ICA0MiArKysr
Kw0KPiA+ICBpbmNsdWRlL2R0LWJpbmRpbmdzL3Jlc2V0L2NpeCxza3kxLXJzdC5oICAgICAgfCAx
NjQNCj4gKysrKysrKysrKysrKysrKysrDQo+ID4gIDMgZmlsZXMgY2hhbmdlZCwgMjQ4IGluc2Vy
dGlvbnMoKykNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0DQo+ID4gRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3NvYy9jaXgvY2l4LHNreTEtc3lzdGVtLWNvbnRyb2wueWFtbA0KPiA+
ICBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9kdC1iaW5kaW5ncy9yZXNldC9jaXgsc2t5MS1y
c3QtZmNoLmgNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvZHQtYmluZGluZ3MvcmVz
ZXQvY2l4LHNreTEtcnN0LmgNCj4gPg0KPiA+IGRpZmYgLS1naXQNCj4gPiBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb2MvY2l4L2NpeCxza3kxLXN5c3RlbS1jb250cm9sLnlh
DQo+ID4gbWwNCj4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb2MvY2l4
L2NpeCxza3kxLXN5c3RlbS1jb250cm9sLnlhDQo+ID4gbWwNCj4gPiBuZXcgZmlsZSBtb2RlIDEw
MDY0NA0KPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uNTUwN2RlYjU0ZWJkDQo+ID4gLS0tIC9kZXYv
bnVsbA0KPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb2MvY2l4
L2NpeCxza3kxLXN5c3RlbS1jb250cm8NCj4gPiArKysgbC55YW1sDQo+ID4gQEAgLTAsMCArMSw0
MiBAQA0KPiA+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkgT1IgQlNE
LTItQ2xhdXNlICVZQU1MIDEuMg0KPiA+ICstLS0NCj4gPiArJGlkOg0KPiA+ICtodHRwOi8vZGV2
aWNldHJlZS5vcmcvc2NoZW1hcy9zb2MvY2l4L2NpeCxza3kxLXN5c3RlbS1jb250cm9sLnlhbWwj
DQo+ID4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55
YW1sIw0KPiA+ICsNCj4gPiArdGl0bGU6IENpeCBTa3kxIFNvQyBzeXN0ZW0gY29udHJvbCByZWdp
c3RlciByZWdpb24NCj4gPiArDQo+ID4gK21haW50YWluZXJzOg0KPiA+ICsgIC0gR2FyeSBZYW5n
IDxnYXJ5LnlhbmdAY2l4dGVjaC5jb20+DQo+ID4gKw0KPiA+ICtkZXNjcmlwdGlvbjoNCj4gPiAr
ICBBbiB3aWRlIGFzc29ydG1lbnQgb2YgcmVnaXN0ZXJzIG9mIHRoZSBzeXN0ZW0gY29udHJvbGxl
ciBvbiBTa3kxDQo+ID4gK1NvQywNCj4gPiArICBpbmNsdWRpbmcgcmVzZXRzLCB1c2IsIHdha2V1
cCBzb3VyY2VzIGFuZCBzbyBvbi4NCj4gPiArDQo+ID4gK3Byb3BlcnRpZXM6DQo+ID4gKyAgY29t
cGF0aWJsZToNCj4gPiArICAgIGl0ZW1zOg0KPiA+ICsgICAgICAtIGVudW06DQo+ID4gKyAgICAg
ICAgICAtIGNpeCxza3kxLXN5c3RlbS1jb250cm9sDQo+ID4gKyAgICAgICAgICAtIGNpeCxza3kx
LXM1LXN5c3RlbS1jb250cm9sDQo+ID4gKyAgICAgIC0gY29uc3Q6IHN5c2Nvbg0KPiA+ICsNCj4g
PiArICByZWc6DQo+ID4gKyAgICBtYXhJdGVtczogMQ0KPiA+ICsNCj4gPiArICAnI3Jlc2V0LWNl
bGxzJzoNCj4gPiArICAgIGNvbnN0OiAxDQo+ID4gKw0KPiA+ICtyZXF1aXJlZDoNCj4gPiArICAt
IGNvbXBhdGlibGUNCj4gPiArICAtIHJlZw0KPiA+ICsNCj4gPiArYWRkaXRpb25hbFByb3BlcnRp
ZXM6IGZhbHNlDQo+ID4gKw0KPiA+ICtleGFtcGxlczoNCj4gPiArICAtIHwNCj4gPiArICAgIHN5
c2NvbkAxNjAwMDAwMCB7DQo+ID4gKyAgICAgIGNvbXBhdGlibGUgPSAiY2l4LHNreTEtczUtc3lz
dGVtLWNvbnRyb2wiLCAic3lzY29uIjsNCj4gPiArICAgICAgcmVnID0gPDB4MTYwMDAwMDAgMHgx
MDAwPjsNCj4gPiArICAgICAgI3Jlc2V0LWNlbGxzID0gPDE+Ow0KPiA+ICsgICAgfTsNCj4gPiBk
aWZmIC0tZ2l0IGEvaW5jbHVkZS9kdC1iaW5kaW5ncy9yZXNldC9jaXgsc2t5MS1yc3QtZmNoLmgN
Cj4gPiBiL2luY2x1ZGUvZHQtYmluZGluZ3MvcmVzZXQvY2l4LHNreTEtcnN0LWZjaC5oDQo+IA0K
PiBGaWxlbmFtZSBtdXN0IG1hdGNoIGNvbXBhdGlibGUuDQo+IA0KPiBJIGFtIHByZXR0eSBzdXJl
IEkgZ2F2ZSBzdWNoIGZlZWRiYWNrIHRvIENpeCBiZWZvcmUuLi4uDQo+IA0KDQpZZXMsIFlvdSdy
ZSByaWdodC4gSSByZW1lbWJlciBpdC4gQnV0IHBsZWFzZSBhbGxvdyB1cyB0byBleHBsYWluIGl0
Lg0KVGhpcyBoZWFkZXIgZmlsZSBjb250YWlucyBtYW55IG1hY3JvcyBmb3IgcmVzZXQgc2lnbmFs
cy4gV2UgaW50ZW5kIHRvIHVzZSBzeXNjb24gYXMgYSBjb21tb24gbW9kdWxlLg0KU28gaXQgaXMg
bm90IG9ubHkgcmVzZXQgY29udHJvbGxlciwgaXQgY2FuIGFsc28gYmUgdXNlZCBieSBvdGhlciBt
b2R1bGVzIGluIGZ1dGhlci4gSWYgdGhlIGZpbGUgbmFtZWQgYnkgc3lzY29uLCANCk1heWJlIG1h
a2UgY29uZnVzZS4gQWxsIHJpZ2h0Pw0KDQpJZiBtaXNzIGFueSBpbmZvcm1hdGlvbiwgcGxlYXNl
IGxldCB1cyBrbm93LiBUaGFua3MNCg0KQmVzdCBSZWdhcmRzDQpHYXJ5DQoNCj4gQmVzdCByZWdh
cmRzLA0KPiBLcnp5c3p0b2YNCg==

