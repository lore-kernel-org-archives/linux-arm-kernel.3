Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57917C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 19:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:In-Reply-To:References:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MOvhm4StzVK58ViQQUtdUFfAArEaZ7dLAEzoxnalIVQ=; b=ogLAJf/JxL7tPxuRWo+HxUl6dV
	3XXuEBFma4imlt4J33jmnxdvRvHUHrC6k5/y6Yc1kbRYEngGlWwAnuHROncjBX0qQDOkqoWAqVNKk
	LOBN3ATmJFMqdNn/QB4kv8nL6qQReZBVc0IF6gJbOg6uydkbD7X7Gk11zMNUzmgQAgPLBx3kkr6cp
	hIXR45ermDGK73yHA0CHl57tAnrYDfFpyEkPbJx1NQ6y9SE9GMLG3l1UbGbs7PCuvetCDViWahPO6
	MWQGD98iXN/jX37oyYjYjfIibFsEjFokkBLYTCw5yedXnP89xwJQd8ptIKhXZc4HaM+3XJDxlZU+t
	VsD3cGfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj12P-0000000Fyz7-17cG;
	Fri, 14 Feb 2025 19:07:45 +0000
Received: from mx0a-0016f401.pphosted.com ([67.231.148.174] helo=mx0b-0016f401.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj0c4-0000000FuOG-1p2o
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 18:40:33 +0000
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51E9LA3Z001966;
	Fri, 14 Feb 2025 10:40:21 -0800
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 44t01f17yn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Feb 2025 10:40:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SXHQUK3EbuUoOt4iWGRK814IUm8toYWNuim84GkaNqShTBLOMVGgWd2P9+sy1Jv+eLDcFy49rAyxHOjMAVxdb7tXg3NXu5DG+X1y/QWmknaK3Kf1jsvrwasPeSTqGVfvUAydmDHR5VxU0ugrUfXRYysmX7qmSJ7iNeTqizPK2bmqgCmctlaJUOFcSyvLDDGFan60uilPvklcwA6tPb2uYCEfrCppKhTwwTZWcQt+6uv+0j4I4QxGjdjpumJV0S7WaLj8uIzkgRqXHuJTfuzzMpdPbVLfp/O5YhMluCp8biGNvJjWI0MOvHH9bvHKQ8h9c/GJPAiFKwUJEHH5mIpI9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ik4CIX7oVs6obAPu/4XIHrKPIItHMrjBGC8fkM9RsME=;
 b=SpxUJJepBmRuuQHG64JWQuEJ4V/efgiqFAwjODO1vqW4GLISXDznMaasSZ4Ir0iaVe+rhiy9ac+nMOPEAH0EUnL5V528GVnRbOJm8up8IQYjJ4mH0p3BuRLzckyYJO2be0IXCcV5lXPEZ8nQ5mj5AkzMeMimWykndKYqQF3bmx8JKLfnrPRRqaqn5GGx/xG6HgF1rpAkvgO3NIBO41k8XdW1e7aLDS3+xID/kFWQlrnBwpnpMwnTPgR1mWMd8y7+MOQGRBtm26pPUFb+gcXxJBzX4WQ8V5OM3RCXz322H3M0WEripXcNHFjxfL3aNgHdXkT/+6tX4Lxre/nSQmP9kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ik4CIX7oVs6obAPu/4XIHrKPIItHMrjBGC8fkM9RsME=;
 b=Iz7wwUlU5cUUB/TTYbMbdWfbs7WzfSJVkSa5uGelkdWrM846a1ROOcJWwRiYlmBWJue9wuz64tcjXpcR/D86g6tgssKE/QAYkaPbG7lMZ2CWs10+FYivmpTMtod7Q0HrY7+/vAtg3rlOFA+tSAyLGkYwhBHSS5yvKrbqtL7suKY=
Received: from BY3PR18MB4673.namprd18.prod.outlook.com (2603:10b6:a03:3c4::20)
 by CH3PR18MB5908.namprd18.prod.outlook.com (2603:10b6:610:1e1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.18; Fri, 14 Feb
 2025 18:40:16 +0000
Received: from BY3PR18MB4673.namprd18.prod.outlook.com
 ([fe80::fbd6:a3a:9635:98b5]) by BY3PR18MB4673.namprd18.prod.outlook.com
 ([fe80::fbd6:a3a:9635:98b5%4]) with mapi id 15.20.8445.015; Fri, 14 Feb 2025
 18:40:16 +0000
From: Wilson Ding <dingwei@marvell.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
CC: "andrew@lunn.ch" <andrew@lunn.ch>,
        "gregory.clement@bootlin.com"
	<gregory.clement@bootlin.com>,
        "sebastian.hesselbarth@gmail.com"
	<sebastian.hesselbarth@gmail.com>,
        "robh@kernel.org" <robh@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "conor+dt@kernel.org"
	<conor+dt@kernel.org>,
        Sanghoon Lee <salee@marvell.com>,
        Geethasowjanya Akula
	<gakula@marvell.com>
Subject: RE: [EXTERNAL] Re: [PATCH 1/4] [PATCH 1/4] reset: simple: Add syscon
 device compatible
Thread-Topic: [EXTERNAL] Re: [PATCH 1/4] [PATCH 1/4] reset: simple: Add syscon
 device compatible
Thread-Index: AQHbfwPEpItv2FmWXku+E0ei6VxOR7NHF2qAgAAJhhA=
Date: Fri, 14 Feb 2025 18:40:16 +0000
Message-ID: <BY3PR18MB46737EC23144183C5C272406A7FE2@BY3PR18MB4673.namprd18.prod.outlook.com>
References: <20250214065833.530276-1-dingwei@marvell.com>
	 <20250214065833.530276-3-dingwei@marvell.com>
	 <6dd9ed2750abe1f5174805673411ccb919ee5461.camel@pengutronix.de>
	 <BY3PR18MB4673C5C5CA684C64B2C218AAA7FE2@BY3PR18MB4673.namprd18.prod.outlook.com>
 <8a9518fdfda805f52b96e93649c9ee39274f5844.camel@pengutronix.de>
In-Reply-To: <8a9518fdfda805f52b96e93649c9ee39274f5844.camel@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY3PR18MB4673:EE_|CH3PR18MB5908:EE_
x-ms-office365-filtering-correlation-id: c27c5543-9c59-4c8e-ebde-08dd4d27066c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|10070799003|7416014|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?VE5SZDFUVGpMY0VQSEJ0U2xkMW9LcjJoUllkT3pHc2JYVUU1V215dGROUytw?=
 =?utf-8?B?QkNTWmJxcjdFMXRGNm56bDNMV0lrb3Q5Y3I1VzM1dkh3NFQ1bjFTbG1keDI0?=
 =?utf-8?B?S2kvbjJXcEZuZ1lEVGp4YjlwTFhtODNLYkppbEdWenQ3OHQ2OEhlNWptZnJP?=
 =?utf-8?B?NWdpY0syTmRqdGYwb3FBbWVqTzBodmROQ3hxb1UyWi9zRllPcGI1OWdBRWZn?=
 =?utf-8?B?ajg3bGk4T0VRdU9YN1Z4UU9RN2JJZWlaOFdlaXRSL2FOKzBqOWNHWVpMRnlt?=
 =?utf-8?B?SE5SWVRZYitrbUR2YTdjZ0d1Smw3SkdrQThTTXRGa1NJRnZkdWdiZW5IMzJj?=
 =?utf-8?B?eXE2SlgyeFZrUUN3TEIwSjZWNjhDVHZWbVdjTWNOVDN5Y1ZHQmExd3U1MkZh?=
 =?utf-8?B?SU9hVyszNEpaUmJEUjB0Y1hvWGZ5T1B2R3JjbUx6ZVgwcldkUGc4Q1VnOTZC?=
 =?utf-8?B?U2MyTVRjWm5MRmtzaTR5a0lpY0Z6TVRqdTNPVnZKRXRoL0dHTm96cndhUjl2?=
 =?utf-8?B?QUlZUmttZUxJOWV4RlRoa0NCNXl1MXhuSWxSZ1JYWm5WSlpkNGE5dDF2UXhZ?=
 =?utf-8?B?bGhiTVdNS2t5SStvOVdBK2R1UE44U0lvbE11bk1BMmZNNW51UVl5TzZ4OFlt?=
 =?utf-8?B?a05TMGo3c05VZnc3U0EvYjRqYmlTdnBRTjBMSy9mYlJ1dGpsTzd5azEwWlZR?=
 =?utf-8?B?ZTlTRlBBT3VYL25RY1I1NWlCRWtSalRrWHF5ajNuT2VBRExlTnVOV1JlSE41?=
 =?utf-8?B?UFdzdEpnTjA2Zk1iUDFveHNndUZOY1VXNm4vbnZiRm1xS2JWQWYzV250amJR?=
 =?utf-8?B?ME5KQmxXTTY5WG5jR1MxTkdsYVI2ZEV2dEFzeTI5aENVUU1hSHBidWx5elgz?=
 =?utf-8?B?SWE2WTVjMnZ2a3VPUHVxcXBROFZoYmJIaFpuUjEzNE1IQU9yRVR4NVZzbWxE?=
 =?utf-8?B?eTZDL2h0MDRybTlpY3BOUzJTRDhtYkFRZGZSYmpSbW55aVNBeWRNeUhRRGtB?=
 =?utf-8?B?eU1YVE1vait3OEl0QWMxUWpPZGF3REJsemgxWEtQSUdmdm8ycXRiOFIvRndh?=
 =?utf-8?B?NWQ1WnZlbXFvQVdwVmdKaUhGeThoZmpySnFkRmk3SmNkUWpSSFJlUmJGbWtB?=
 =?utf-8?B?VGtKMk9IVVBWb1AxZ1VXME9SejNSSGhVU041QXlCUUJWRHhQTUk4UVRkTmRl?=
 =?utf-8?B?R3NmdU4vOWxGdFRFdmdNeHFib2hVVnc0eGR5TnNlQ0hpMWJCQzRldzFhbTRs?=
 =?utf-8?B?RG4zbkN4RGtOYm9zMS9xdjh5Q2dNbHI4U01ZZmpzai9iTG45TUViU0pSRTl2?=
 =?utf-8?B?U0RRUGNtTmRHVEY0UzR6VFBFYW5tc2dsUGVTQ2xQYm9vYS91TlcrSXdCNWFy?=
 =?utf-8?B?Vm45VTVhdWl4cmtuWnJ4MTVTQm1jd3hWQkJyeFZ2OEpIV0NsOVovUTZRekIw?=
 =?utf-8?B?MzNTMzgzSFlTNUFMakJ5VVJ1M3p4Q0VlVDRhQ3h4bTVKVmZiK291ZWZKVHI3?=
 =?utf-8?B?RlZuQlcvVXRONWNvN28zS2xvcHphcmVYQk1za08waFJOQXVkdjBlUGRhbGhx?=
 =?utf-8?B?Q1F2dVNuTWZaSDBSK2dya05UeWdhQUUvcGRaWG9LOVJJbHF5RGQzdkFqMVgw?=
 =?utf-8?B?b2dFdGhvdkRxQlZ3c3NaWjZzL0MvUWF5a210b21kVWpMaXcrWHBSRVE1dWRt?=
 =?utf-8?B?QkFCd2FrYkdUMWUwelk4czdidzRJMXZsRUd4K0g1TUg5ekorMCtJUEtpTmRL?=
 =?utf-8?B?RUQxMlBITXhHZGUrQ1JtNXQ2bXBibWY0ZHB4dEhjS1Ezdkc3WE9JTFJibTR2?=
 =?utf-8?B?YmNqQ2VJbElpVDQ3RURGWndidVg4SWN0Vmg0c2dldlMyWGk0QlAvUytSTWlK?=
 =?utf-8?B?alIvY2NTOGZGSTFrdys1ZXpoNzhrYi9BV1RxY0hHSzFWd1E9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY3PR18MB4673.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(7416014)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bHN2WmtJcDlsdXIvMXpDbjhiTUxtY0FLVkNES2dyYWl5TkNVRUh1RUJtaE5i?=
 =?utf-8?B?STVFQy9TeEMxUEx5eDBDZXhSU0hJeHJ4WkFMaHRpUEpHZjRuOVZRdjRTbG40?=
 =?utf-8?B?MEhtamkzcDNaYnB6ZmFhc2E0N21kZEtmL3B1RjZBYUMrTUxqek9tak4zNEIw?=
 =?utf-8?B?SE9yQTVzTU5yeTZacUplR2hzNGE3dEZUQlM1d3lyendjcWpPY1VmUXdCSFJU?=
 =?utf-8?B?MHFGclhMSkdvYVM4Z2o2Ym1BRFhQYVJ0bmhnWFpvMk1hU2hhNEVScFVSZ2tX?=
 =?utf-8?B?QzRKczlaUW9GMlBXV3R2QnFUTDlpdWtWQjNRKzBHTE15c2xZSVZlRGJrVGJI?=
 =?utf-8?B?SWpDVEhadWxGbWNoNVMyVkNsWWdNUkRIaGJPUlpMUTkwVXIxQ0xwWUVOd2JP?=
 =?utf-8?B?TDhoRmp6YjVXcE4vSksvMndNMEFKejJRek15a0RjVCs4NGd1cUZrU1YvZUVB?=
 =?utf-8?B?UnhhRDh0SDZ2MjZ5RGZoSmdFcTB4K29Ldll4TFB5M21lUWNmYTlSMjJMeUR0?=
 =?utf-8?B?bCt5NTQwUUJkTTc3dlFJdFhnYzh1UFR6cEljYUxTdnZZcEVqdDIwT3F2K0hj?=
 =?utf-8?B?d1BjUENybUpWcDhyZVp4SjIyakhsdEQ1LzJTNWlnV3FCL0hQdXpvU05NRGZk?=
 =?utf-8?B?eE5zZUJjSmhSUHVtNWpHYnFYUm02L2xVWlNHdWJvMzFZYzRuTU1xd0tONXlw?=
 =?utf-8?B?a2pmMnFUZDIyek43TWk5a0VzQ3JCVFdDWjBod0JjcEVzaEV4NkMrT2JLU25D?=
 =?utf-8?B?WW9ScjlzMk53QkJkSzdvOStjVmtTSnRlL2tXRk9QNmlFazFoZkJEZVZYZGRZ?=
 =?utf-8?B?WkdkQ21oYmsvUlZTRWxpVzRMaTdpcVFpS0hwVkZZWFQxS1RLRUF4WWR0d0tY?=
 =?utf-8?B?ZjVSREZsN2dQRmZxVkdyQ3BSamYyeXYrM1BRa1pwNTZuMjB5N08rZGx5anVy?=
 =?utf-8?B?OGhhL2lBOHhvaWJYSURhMlNjczBVU1B5Vmg1djF1Ly9qOXZiUWpyWTRDWFhQ?=
 =?utf-8?B?WjU3akZCNFF0bDBBc28zbGxGVE1QdlQ3WUZ1ZUlJaGxZNnhEb001cERZbVMy?=
 =?utf-8?B?MnBRTW9BcDBmcUZhVWVJbFUrTUlBVDNRemVUM21KbFc4ODNOaTZyUlhBaFZs?=
 =?utf-8?B?S1JuMy82QXYzUE1VYW9SdVBPU1hPK05WYzZQaHE2N21ZNmJ6dWJNUCtad0dr?=
 =?utf-8?B?RDBncysveFp4UmprZCtyRVF6aEVGb2xSQ082RGxPalZZck11SVR2UmFweFJx?=
 =?utf-8?B?K0YyYnpzbzU0dDlRL2tBT2NUbVZIeHRnQ3pIR3NoTzBlS3RMYTlrQk1YNUtq?=
 =?utf-8?B?SWRiVlJCYmNCWUdHemt5TGI0VXV6YTAxV1NFQjFyb0NlUk1EOVlLRkJOQVBN?=
 =?utf-8?B?dVltc0N5SHdMQXBwdEYxa0d4dVQwOXBQS1l4MkdFM0VlZU9WRmZyVmw3Q05S?=
 =?utf-8?B?RGhPbXpUa0JqQ0J2d2tOK3hVUDNMdm94L3YvczFTd3VUQU5iSzk5eDJkbGR2?=
 =?utf-8?B?aVU2RlpQL21TaXhSc0Z5YmJvQjJaelhuR0ZQOTc2d3BSTzV3ZDh5QXFhYTVz?=
 =?utf-8?B?cWZuNWhPTUlCd2FTL1kvWXVqOExCT0l4N0w2YVR2TllvWUN3eVlrQytEbW1E?=
 =?utf-8?B?NFVNTHl4RUNIWnd0TVprQzJReWxLWG5oTkxyMm5VVVF1UUxHeUlJbGZyVkVa?=
 =?utf-8?B?RzhueFJjV01pbkJKR0xyWUgydU5rUmpqendENUJYQms2VUJSVEJ1UHFIcTJO?=
 =?utf-8?B?STl5R09LUkVFcnQ3RERmeU9zS1QwUHVKMk1TcWovNWRGbGdGaWJnekNTT0pM?=
 =?utf-8?B?dk4zdDNUYUprTXJVeWJVRkJyeXYzODkwY0ZiZytNeG11MWpDWHZpbGRQRDI4?=
 =?utf-8?B?Y1lYMy9iMU5QWExZRFdPeWtRcTl4S25VNW9LWElOb3YzeVpmK3VyZmxqRDMv?=
 =?utf-8?B?T1YwSzVkQytVUWVPY0xPL0NVWGNzcDNoVW94Z1NibXZlYWZobnI2OE82bDdP?=
 =?utf-8?B?RUthZ3Y1TW9rcHA2ZTVFVlpFOGdXNWtHbTVPR25KcGl0NjZhdzF0N2pucjk5?=
 =?utf-8?B?cXNBWjgvWGxjek1rYlc0ajlvUHU3WXplcjZndldxMTRhOFRVWkFQemhjNUt6?=
 =?utf-8?B?T1JjR1pRamtlOEQ1YkdQc2lDRGhsdUlBQjVxRHlDazBrTFFJbnhUaHhaRy9W?=
 =?utf-8?Q?l+5YbD7cPTrog8yLAuZgn4Dfb5vdblOfCdNzD7QQL9YJ?=
MIME-Version: 1.0
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY3PR18MB4673.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c27c5543-9c59-4c8e-ebde-08dd4d27066c
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2025 18:40:16.2878
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l4jHj5hvVyZxHxSobGj4pMfR8ORfMe4ujX3VOUUfu52xAmbgPwXnowyEnz3s7IUfCCEzszq05VkAahD2Yu1UEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR18MB5908
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 5DOHQFiSmjbq4JwXJQeofhCpBBC9di3K
X-Proofpoint-GUID: 5DOHQFiSmjbq4JwXJQeofhCpBBC9di3K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-14_08,2025-02-13_01,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_104032_481392_66443036 
X-CRM114-Status: GOOD (  24.87  )
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



> -----Original Message-----
> From: Philipp Zabel <p.zabel@pengutronix.de>
> Sent: Friday, February 14, 2025 10:03 AM
> To: Wilson Ding <dingwei@marvell.com>; linux-kernel@vger.kernel.org;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org
> Cc: andrew@lunn.ch; gregory.clement@bootlin.com;
> sebastian.hesselbarth@gmail.com; robh@kernel.org; krzk+dt@kernel.org;
> conor+dt@kernel.org; Sanghoon Lee <salee@marvell.com>; Geethasowjanya
> Akula <gakula@marvell.com>
> Subject: [EXTERNAL] Re: [PATCH 1/4] [PATCH 1/4] reset: simple: Add syscon
> device compatible
>=20
> On Fr, 2025-02-14 at 17:=E2=80=8A13 +0000, Wilson Ding wrote: > > > -----=
Original
> Message----- > > From: Philipp Zabel <p.=E2=80=8Azabel@=E2=80=8Apengutron=
ix.=E2=80=8Ade> > > Sent:
> Friday, February 14, 2025 3:=E2=80=8A54 AM > > To: Wilson Ding
> <dingwei@=E2=80=8Amarvell.=E2=80=8Acom>;=20
> On Fr, 2025-02-14 at 17:13 +0000, Wilson Ding wrote:
> >
> > > -----Original Message-----
> > > From: Philipp Zabel <p.zabel@pengutronix.de>
> > > Sent: Friday, February 14, 2025 3:54 AM
> > > To: Wilson Ding <dingwei@marvell.com>; linux-kernel@vger.kernel.org;
> > > devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org
> > > Cc: andrew@lunn.ch; gregory.clement@bootlin.com;
> > > sebastian.hesselbarth@gmail.com; robh@kernel.org;
> > > krzk+dt@kernel.org;
> > > conor+dt@kernel.org; Sanghoon Lee <salee@marvell.com>;
> > > conor+Geethasowjanya
> > > Akula <gakula@marvell.com>
> > > Subject: [EXTERNAL] Re: [PATCH 1/4] [PATCH 1/4] reset: simple: Add
> > > syscon device compatible
> > >
> > > On Do, 2025-02-13 at 22:58 -0800, Wilson Ding wrote:
> > > > Introduce the new ops for updating reset line and getting status.
> > > > Thus, the reset controller can be accessed through either direct
> > > > I/O or regmap interfaces.
> > >
> > > Please don't add a new layer of function pointer indirection, just
> > > add a new struct reset_control_ops for the regmap variant.
> > >
> >
> > If just adding a new struct reset_control_ops for the regmap variant,
> > almost all the functions will be duplicated for regmap variant.
> > Besides reset_simple_regmap_assert/deassert(), we also need to have
> > the regmap version of reset_simple_update().
>=20
> Yes. You could also duplicate/fold update() into assert/deassert().
> It is trivial enough and the compiler will do that anyway.
>=20
> > Since reset_simple_reset() invokes
> > reset_simple_regmap_assert/deassert(), it also needs to be duplicated.
>=20
> That one could go through the data->rcdev.ops->assert/deassert function
> pointers and be reused. But I wonder if that one function is worth the ad=
ded
> complexity.
>=20
> > In this case, there will be too many redundant codes in this file. I
> > doubt if it is worth to use the reset simple code. Maybe it's better
> > to fork a new file for the syscon device, such as 'reset-simple-syscon.=
c'. What
> do you say?
>=20
> That sounds sensible to me.
>=20

Well. I will go with the approach of a new driver, which avoids all the
unnecessary complexity and redundance. Thank!

> regards
> Philipp

