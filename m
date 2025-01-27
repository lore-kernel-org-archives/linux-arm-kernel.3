Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48339C0218C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 09:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DLwK8zhvEA/Y2+GfIMrnty39ZlGieMqix0bZ3JcURCk=; b=CnHA0gR96njoMr8u3I8P7x08bx
	EbQhk/MmlQKz2Kw0ECY/JNTStYhJgd7Y2SMzsm0RMnOxpFQMxmqVOjKJ5ipTTLVrdj6DtnQPSEtX6
	B2j3M8/muP8HwZj1D9HruAIFMcinCBG4O9tXTbpmEZUkWEgjdmLV1ectol2RAoqwmoB8Yf+q/wQaO
	yHC3bD6yAtKd+lReFcG/Cg297xq2OVcfqKQqun9FZ1mIM1Ttdf/063Lec9WKjdBIqD7YH1ml+iTL2
	XK1LPGWuFH00FIQfvcuQUwUVs+HTM625GLrgh8Stx+2s8JuOgBoUPtwVme99uktZGbgJjaUlTqTsi
	xT2ZNDVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcLBO-00000001yBa-2fgj;
	Mon, 27 Jan 2025 09:13:26 +0000
Received: from mail-japaneastazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c405::1] helo=TY3P286CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcLA4-00000001y5R-42Ke
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jan 2025 09:12:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jnbtc93/xUxM/5AHSOrhc5rItZfuI0y8btwHD+0oH4R5+NOi+anDsLE5S6UxENaeIevANKWWboHyc1xxXmKS6n+F3x4bY49QWCdl571IcxZmmuf7lQWZ9QvdmUQbx2sfSnXO7fg0gGkpbzhy6uZ/5sqQVsbW5Cwt7jQSTkNnAisg3oKUM87FYi1UNyCTvr7Wn/c5ZcnmMx0uDwxr+4tB4uUKY6G54iEQuX9cBiPgkRhsYgMEZ/9b/2dg0N7H/zI8CXaHRgQYugbE2woaysHg/j0hQMzf/uWi1zZVpQtqj7eN12Kw5CNFxFkn7hawlShkNse/Auo2Mb7xb+l+nIKqFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DLwK8zhvEA/Y2+GfIMrnty39ZlGieMqix0bZ3JcURCk=;
 b=DBUqcR5G85/wyaaOn54oMpiKi8fzmCY4xVlb0sXhyhbWR+gJWvehn9HLZE9Wac9Kjmm3VWM7Gb2kCcf2Yizu08+aXVqoBgSHgeC9SSKJFsOpJuHEtTmepbRvlNo04Q3eyKEzCgL/7XmwV5weFEso3zOT0b8iZ+aufco8mtidSB6tMdEvOar3Ioft1IbYefKNimXylmcd1ja4jfKwQIFscnJvyENkJSEYrk/Xqx1heqs7e3dhDxfV7qLGi6JGgpTANnnOpeCJ/izO5KJGlKObYf4JDOuCfAfH2Eqvif8lUXHqJaVZVHkjuT0WZNkPWtKES+3ZiOsqFB96w/1KditxVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DLwK8zhvEA/Y2+GfIMrnty39ZlGieMqix0bZ3JcURCk=;
 b=IxxN4bNQLqN5Oftt6RpdxGU9SecfEQqkiYJwRkOppVG0F2noNGFjHuPM+N9b/Al4Kakc1X2lD+eXKo9bTB7W1nRlV1cUh1qyU1ns+TM3qwc8KyozxnXEKhRCST1RaJnIWmFFNgfUhvZfEpuMl7Chy1Gj7M3eBadcMzaafyQa1OI=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB11709.jpnprd01.prod.outlook.com (2603:1096:400:38d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.21; Mon, 27 Jan
 2025 09:11:54 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%2]) with mapi id 15.20.8377.021; Mon, 27 Jan 2025
 09:11:54 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Claudiu.Beznea
	<claudiu.beznea@tuxon.dev>
CC: Jonathan Cameron <jic23@kernel.org>, "rafael@kernel.org"
	<rafael@kernel.org>, "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
	"rui.zhang@intel.com" <rui.zhang@intel.com>, "lukasz.luba@arm.com"
	<lukasz.luba@arm.com>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
	"mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org"
	<sboyd@kernel.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, "linux-pm@vger.kernel.org"
	<linux-pm@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>, "open list:IIO SUBSYSTEM AND DRIVERS"
	<linux-iio@vger.kernel.org>
Subject: RE: [PATCH 4/6] thermal: renesas: rzg3s: Add thermal driver for the
 Renesas RZ/G3S SoC
Thread-Topic: [PATCH 4/6] thermal: renesas: rzg3s: Add thermal driver for the
 Renesas RZ/G3S SoC
Thread-Index: AQHbbLiRZuuEzRuiPECSqOFFElutJLMnbQcAgALlrICAAAYRAIAABENA
Date: Mon, 27 Jan 2025 09:11:54 +0000
Message-ID: <TY3PR01MB113465C742C78714F7BC09D5786EC2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250103163805.1775705-1-claudiu.beznea.uj@bp.renesas.com>
 <20250103163805.1775705-5-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdUDKFRsZWsZG9DY4PHdxQEDoPqzfeRx8MNTreOpxdLvpw@mail.gmail.com>
 <20250125121826.6abbe7de@jic23-huawei>
 <3c7f5a92-254c-4ce1-9813-80c98c1f549e@tuxon.dev>
 <CAMuHMdUPPTyuJuWDEuHFT8EQCTVpy5=UtDh9GajdWUvZBNqy0g@mail.gmail.com>
In-Reply-To: <CAMuHMdUPPTyuJuWDEuHFT8EQCTVpy5=UtDh9GajdWUvZBNqy0g@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB11709:EE_
x-ms-office365-filtering-correlation-id: dde072dc-11e4-4064-9c59-08dd3eb2a476
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?WUpuMjgwSS9KZkFTc0dWWE5TSUNMNlhaMng0cnNMRktxa2xsK3JMMlRuV1k4?=
 =?utf-8?B?L3pOMzB1QWZyak01a2o4N241M2t6Kzg2ZFlreWVHSnhDSFNLV0s0b2VpY3Uz?=
 =?utf-8?B?dDN4U241N3RHZGtySWlrRlZBRWpObDlYd3VzZTBvbEtYUFBSMjI4Z2pZQTVR?=
 =?utf-8?B?NGE1dVVJaG43cG14bStUQ3ozUHBvTGRwWk00dXBjNjdzTDJKYTA2S2hrcVgr?=
 =?utf-8?B?OFBYK1F2OHZldlFYbTgxWEdSV096MTJFTVpnTDFrS05id1ZWWmU5S21kcitX?=
 =?utf-8?B?M205NE0rR0p2Um5melhOTDNYR2NOSHVFRThRczlPeDBaWWpxYlRUMnF3cTZO?=
 =?utf-8?B?K1B4N1ROZDdacWpRc3A5TmcyVmovTW1aMENFbEdpRVZtaWpkVFRlTERSUjdy?=
 =?utf-8?B?V2RDSnpkT0g3WjQvd2s1RXQ4cWp6VFpYaUp4TUNCcTQ0WEVsdTlKeFhOUU1F?=
 =?utf-8?B?WVJORWcrUlNydzRVQjlHUkd5Wnp0TDJTYVhDdjZlQ25OYVVtMTRxUytGdjZw?=
 =?utf-8?B?WThlQk5vZW9kcmRTa25vL1F0aVYyRUg4dFBGNGZ6bTVMbVpGZXFKbzJDUVZm?=
 =?utf-8?B?UWpkYVJJcjBIdjZ5TUk0MUhxcFc2YmxFU1FNTS9Lc3FCTVIwd0NpeC84T3JV?=
 =?utf-8?B?Y1lGTGlEU0dYUHI0cGpRNzFEQkwvTEdmRXBXU1czUW13WWsxNk40Mk81NEN1?=
 =?utf-8?B?ZmQ5azVuU1hySm9IUHBlamFHdml1elhVWDZ4aEx4c1l1bUIzNWRRakd4RXcx?=
 =?utf-8?B?ZDFsbFJDNEQ2bVBWZUxaZXYybFVydTdkYnZ0dEhLK3oveVR4Ky9tU05VZmFI?=
 =?utf-8?B?NjZzSWdWU0M5QXhCS1RoQWMzYzB3QzljS3BCcG5PR0hpcXJkNkhxcjBpdzdB?=
 =?utf-8?B?QzNpbStjanZBQzhnTFpIMU5jMXQwcGUwTmJ2L0JLUFpMblV6R2VDcG44YnF1?=
 =?utf-8?B?cXZRTGVrUXBYa1Y1Wk1zQzZJZDFZWFNRVUdkTHJ0M0M3aDRWS3ZRbW8xcitG?=
 =?utf-8?B?b2hGTEw5RTFweWJGWWxkZUZDK3o3ZFNWUTgzdDBOdXN4amdUQ2pRekhsMGx6?=
 =?utf-8?B?eFM1R3QvUTlvMFN3eGNlV1MyMzBNZitPNFFkQ1k5NG9obTNxWDZabUNxcHMz?=
 =?utf-8?B?N20vbVhZVG5mZUFlU3hELzV1MUtwUHdiaEFZNGE1VmRwY3M4dGpnRU1VL2tz?=
 =?utf-8?B?dzROWkcvR2RjYVBHR2YydVNsM2RPTVQ5N0QxV3F6Tks0NHc1aDNqcXlIQW8y?=
 =?utf-8?B?MmpHMUF0Tk5uNzd1OGlQSW9xV1prWWM2TEEyMnlDNUpYWmJxN3BVUnZmY0Fi?=
 =?utf-8?B?REZ4UVptQ0VyREJMVVZFUk84Y08rYjl5dHlZN3BWRXc5N21qUlo1a2FPWnVX?=
 =?utf-8?B?dUgvb0lVTXlQUzlpb2VEVExtQndaNmlwNUJhWU5tTDFIcVBEek9IcnBTaVZ5?=
 =?utf-8?B?K2lpa0JMQjRlVmJ1SGY2bXgwcEpEL2xzdnlQVDJWbTFwOTZlYldBeGlkL0Nk?=
 =?utf-8?B?bUNqNno2UkRONGNRaTdEWGpjSC9wSDlFMU5MZWtqV0dBbmx2MlFEZzM5QVcx?=
 =?utf-8?B?eUxPK2R2MUMrZ3VTTjkrMDRMZmw5b0pvRHorVDliRzROY2JCMmVVaU1KS1or?=
 =?utf-8?B?Q1R5QWRnMlJmYVNoU3BYc3dFN0tyb3JzNUM4MkFxK0UrbHBqdjZaY0pIa2NU?=
 =?utf-8?B?MEpBR3VwSG53OUQ3bEk3N1ZpTnFGQVc4bGlRZHNrdDl2NDFXcEh4Rko5WXBj?=
 =?utf-8?B?VW1RalY3ekpKT2hXK1llMFhJdThQOWNxRW5UVG5XMkxmQmp2cG53UlUrNFRV?=
 =?utf-8?B?RW9oYjNrWUNPYS9iL051cG9mYkpCZHk4QXRRd1lQODZBaVJQbURNK1ppb3pS?=
 =?utf-8?B?clhhcjhNVjdoaURWa3dKMGZEN3FESlFvTFpxbktJMDlmdGc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aEgraTlIbGN6cmNCMmZGdDBsVVF2Qml4QkJWWkFBUFp0WW1Ib0tkVkw2MXQ0?=
 =?utf-8?B?ZjVCUTUzZmtMQ2YwUXpSdDYvaVhvWVNEUXNZM1lqTktWSWpKa1VjKzJKSlA1?=
 =?utf-8?B?ZGxXNDdiM2J1MlpKQm5iSytEYXNUR0VtR1FYTXpLYkNKWmRYY2F3UTNTc1FJ?=
 =?utf-8?B?VDZ6UXNxbklYa20wZkVNNlE1eEhET0JMUHRXRVdoK3lUTGhTdzRNT0xDemZi?=
 =?utf-8?B?MmR1cDR4UmJLai9tVkJoeEVPZXh5RGxDZ1YyMlpBWW9rL3ZrOTNCYlVEVUZI?=
 =?utf-8?B?TUZFc3JxRTFQMHNNUDVQUk1IK2FPZU00aGJLRVhqSENwdGF0Ry84cW9KbjlI?=
 =?utf-8?B?UE96eG1QSjJFMDc5cm5MQXluSjlPd3BFT2tXYTFLeTJhekRNditlL3ZBaXBs?=
 =?utf-8?B?ejZJZnR2MFA4U3pXMDU2SnFzZ3VBc1BtWjNmYm5zeTdSS3NEaUpROHVMa09Y?=
 =?utf-8?B?aktuYWpEWUExYiswZDk2Q01NWi9yTmIrRkE3NkdDbDBFREw3cHBtMEs0U2ND?=
 =?utf-8?B?MU95aE5IRTc0WXpUNTI4QWhPVThTaHprdGtoQkxJYVJkZVIxbFE4anFuOU5i?=
 =?utf-8?B?MVQ5ODg1NGNJQURZMVpSMjVodmVDOTJWcGMyYW9BYWRVN3J3SDd5ZE5tb3Nj?=
 =?utf-8?B?Q1FFbWhLVGtTWjg4Y0xnVlN3OERSUTlMMXVoSlduQ2l2TUJLMGQ1ZHlqTEZo?=
 =?utf-8?B?RCtVTEF1VlFvMW02ZlBKWXNYd3Vma2dVaUtyelBRYUFFb1RUYVdyaS9NbjJr?=
 =?utf-8?B?S21KQXl2R2F6MWcrbnBTa1VLb3A4Tm93ajRyRUFEK2RMZWM1VWc0RXR3VFZq?=
 =?utf-8?B?L3RYbjRyaEZUTUx0L2RsUm00WUJhaUd1anE0N1JKTEtqRDNZS0ViTWVRdkpn?=
 =?utf-8?B?MktNNHFmYlRlb0czd3plS2hnb1VlVGhDYytYMTZqQnFLVGsyMkp6NWF3Q3pM?=
 =?utf-8?B?aDhBSWR6azdRZStVZXlmUHhuVmJPVEJ2MXpXZGFpOFl1aGpJZGVhUTZydzYv?=
 =?utf-8?B?RDN1R0lYVFcyK0xZayt4TTZ5c1A1QkUzUTI0cVlZYm9USUpqaGlmakxsc29P?=
 =?utf-8?B?WWVrdkt2L0oxTFpHRWZBZGRRdzJhYTdtangwWWNDV2ZKZ0F4VXlmRDRYTEZ4?=
 =?utf-8?B?WjdmM0xTbjEzamJpYVJtYUpQWTdlVDNEQ0haVlcvbEdwWUpOeWFOMDNBZnVr?=
 =?utf-8?B?R3p5R053N2ZyWjVMd2N5SzBDaGxqOFNPakYzbXY0bDUzYWNKMFl3YW5QRzdi?=
 =?utf-8?B?ZXZzZ0ZMUmdVUFQ0MXpGZEN1QVRtTFpyRitBeWVIZC9QWlZlUHdiTEtHTytl?=
 =?utf-8?B?K0lHQ1MraGNRK0kvbS9XVmV3dlBWOU53K1ZsVlZGYnp1WEtxRmM1VHBZVmFj?=
 =?utf-8?B?TnpRZENnTExhTkowUEVQUDNRVGhFRi8wcUVzS0VJRFFUdGtOY1dTSDBtSUkw?=
 =?utf-8?B?Snl5RFpJTG4zREFuZzU5YnRVL3Y2bVpyc0F3cTA5cmpqTVRaZTRmY204VzNj?=
 =?utf-8?B?dXBqdmtkaFljUTMxUHJnT3lqQlBJalFoM2NaeXdHM3dFL1BFajR3SHdKQUdn?=
 =?utf-8?B?WVRlV29aTkxmeHRsVDRrRHViU2I2dHJSdnROZzNYYmFlZWk0MEtQODdRWWZZ?=
 =?utf-8?B?MWZNTGFRV2kvcU9sY0FoVUkvdVlmM1pET3p3RE9sMk85WWlCTFNsN3NISWxU?=
 =?utf-8?B?My9XZ3NxQ0FjRkhPaWh3b0ZPcThDU3p2cHo0Y1I4Uk5naEZKa1NocmJibDUy?=
 =?utf-8?B?NmhOTk83Vkk3R2hkMjVCT0F5VWYzWktBaXhJakpvMW9rR2pWclhoSVBnN05O?=
 =?utf-8?B?RWFFZ0RKYlBrK3R6YngzbE0xTHg3L0ZlTjdQdHhySUlNUnBCeVMwQ0xKdlZO?=
 =?utf-8?B?bC9FOFp0K1B0YUM3bTJ6NUZNS2hwdlRhNjlZVmpORGNKQmh4MEl1Zkk0dVIy?=
 =?utf-8?B?Wml1U0JvMlV6Z3FhOC9yK2JRcUFQSE1UL1lLVjYySXJoU3lPNCtkbmVycFhS?=
 =?utf-8?B?dDA4cnk4eVQwU3JvWk1ZRTdoY0pTVU9neWxYWm9XMDc0S0c2SFJMYlRwaERG?=
 =?utf-8?B?MVc2K2tmT1lWOXhGWjAvV1pCRDZNckYyZ0JzaWF5WGNDTFhYeWROWFNzNmV2?=
 =?utf-8?B?aCs0cmFMYTdDZm5jN3ZrR2VtN0NYN2ZjV3FXSkpOM29tNDJVQ0E5dWdzZWFv?=
 =?utf-8?B?a3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dde072dc-11e4-4064-9c59-08dd3eb2a476
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2025 09:11:54.0698
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PjsgsRc9wsNkatWLBJcHTDRjRAB3mxPiiIT52MRCyQgrFMXi7BdWugoVUH7ZZ91gcOyaqztSdmRMGDV94Njv+XXkx+fo9xQXU+W23Hzbazc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11709
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_011205_341138_B4826883 
X-CRM114-Status: GOOD (  24.73  )
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

SGkgQ2xhdWRpdSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBHZWVy
dCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPg0KPiBTZW50OiAyNyBKYW51YXJ5
IDIwMjUgMDg6NTUNCj4gU3ViamVjdDogUmU6IFtQQVRDSCA0LzZdIHRoZXJtYWw6IHJlbmVzYXM6
IHJ6ZzNzOiBBZGQgdGhlcm1hbCBkcml2ZXIgZm9yIHRoZSBSZW5lc2FzIFJaL0czUyBTb0MNCj4g
DQo+IEhpIENsYXVkaXUsDQo+IA0KPiBPbiBNb24sIDI3IEphbiAyMDI1IGF0IDA5OjMzLCBDbGF1
ZGl1IEJlem5lYSA8Y2xhdWRpdS5iZXpuZWFAdHV4b24uZGV2PiB3cm90ZToNCj4gPiBPbiAyNS4w
MS4yMDI1IDE0OjE4LCBKb25hdGhhbiBDYW1lcm9uIHdyb3RlOg0KPiA+ID4gT24gV2VkLCAyMiBK
YW4gMjAyNSAxMToyOToxOSArMDEwMA0KPiA+ID4gR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBs
aW51eC1tNjhrLm9yZz4gd3JvdGU6DQo+ID4gPj4gT24gRnJpLCBKYW4gMywgMjAyNSBhdCA1OjM4
4oCvUE0gQ2xhdWRpdSA8Y2xhdWRpdS5iZXpuZWFAdHV4b24uZGV2PiB3cm90ZToNCj4gPiA+Pj4g
RnJvbTogQ2xhdWRpdSBCZXpuZWEgPGNsYXVkaXUuYmV6bmVhLnVqQGJwLnJlbmVzYXMuY29tPg0K
PiA+ID4+Pg0KPiA+ID4+PiBUaGUgUmVuZXNhcyBSWi9HM1MgU29DIGZlYXR1cmVzIGEgVGhlcm1h
bCBTZW5zb3IgVW5pdCAoVFNVKSB0aGF0DQo+ID4gPj4+IHJlcG9ydHMgdGhlIGp1bmN0aW9uIHRl
bXBlcmF0dXJlLiBUaGUgdGVtcGVyYXR1cmUgaXMgcmVwb3J0ZWQNCj4gPiA+Pj4gdGhyb3VnaCBh
IGRlZGljYXRlZCBBREMgY2hhbm5lbC4gQWRkIGEgZHJpdmVyIGZvciB0aGUgUmVuZXNhcyBSWi9H
M1MgVFNVLg0KPiA+ID4+Pg0KPiA+ID4+PiBTaWduZWQtb2ZmLWJ5OiBDbGF1ZGl1IEJlem5lYSA8
Y2xhdWRpdS5iZXpuZWEudWpAYnAucmVuZXNhcy5jb20+DQo+ID4gPj4NCj4gPiA+PiBUaGFua3Mg
Zm9yIHlvdXIgcGF0Y2ghDQo+ID4gPj4NCj4gPiA+Pj4gLS0tIC9kZXYvbnVsbA0KPiA+ID4+PiAr
KysgYi9kcml2ZXJzL3RoZXJtYWwvcmVuZXNhcy9yemczc190aGVybWFsLmMNCj4gPiA+Pg0KPiA+
ID4+PiArc3RhdGljIGludCByemczc190aGVybWFsX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UgKnBkZXYpIHsNCj4gPiA+Pj4gKyAgICAgICBzdHJ1Y3QgcnpnM3NfdGhlcm1hbF9wcml2ICpw
cml2Ow0KPiA+ID4+PiArICAgICAgIHN0cnVjdCBkZXZpY2UgKmRldiA9ICZwZGV2LT5kZXY7DQo+
ID4gPj4+ICsgICAgICAgaW50IHJldDsNCj4gPiA+Pj4gKw0KPiA+ID4+PiArICAgICAgIHByaXYg
PSBkZXZtX2t6YWxsb2MoZGV2LCBzaXplb2YoKnByaXYpLCBHRlBfS0VSTkVMKTsNCj4gPiA+Pj4g
KyAgICAgICBpZiAoIXByaXYpDQo+ID4gPj4+ICsgICAgICAgICAgICAgICByZXR1cm4gLUVOT01F
TTsNCj4gPiA+Pj4gKw0KPiA+ID4+PiArICAgICAgIHByaXYtPmJhc2UgPSBkZXZtX3BsYXRmb3Jt
X2lvcmVtYXBfcmVzb3VyY2UocGRldiwgMCk7DQo+ID4gPj4+ICsgICAgICAgaWYgKElTX0VSUihw
cml2LT5iYXNlKSkNCj4gPiA+Pj4gKyAgICAgICAgICAgICAgIHJldHVybiBQVFJfRVJSKHByaXYt
PmJhc2UpOw0KPiA+ID4+PiArDQo+ID4gPj4+ICsgICAgICAgcHJpdi0+Y2hhbm5lbCA9IGRldm1f
aWlvX2NoYW5uZWxfZ2V0KGRldiwgInRzdSIpOw0KPiA+ID4+DQo+ID4gPj4gR2l2ZW4gdGhlcmUn
cyBvbmx5IGEgc2luZ2xlIElJTyBjaGFubmVsLCB5b3UgY291bGQgcGFzcyBOVUxMDQo+ID4gPj4g
aW5zdGVhZCBvZiB0aGUgbmFtZSwgYW5kIGRyb3AgImlvLWNoYW5uZWwtbmFtZXMiIGZyb20gdGhl
IERUIGJpbmRpbmdzLg0KPiA+ID4+IEkgZG9uJ3Qga25vdyB3aGF0J3MgdGhlIElJTyBwb2xpY3kg
dy5yLnQuIHVubmFtZWQgY2hhbm5lbHMsIHRob3VnaC4NCj4gPiA+DQo+ID4gPiBJdCdzIHN1cHBv
cnRlZCwgc28gZmluZSBhcyBsb25nIGFzIG5vIGZ1dHVyZSBhZGRpdGlvbmFsIG5hbWVzIHNob3cg
dXAuDQo+ID4gPiBXaWxsIGp1c3QgZmFsbGJhY2sgdG8gaW5kZXggMCBJIHRoaW5rLg0KPiA+DQo+
ID4gSWYgZXZlcnlvbmUgYWdyZWVzLCBJIHdvdWxkIGtlZXAgdGhlIG5hbWUsIHRvbywgdG8gYXZv
aWQgY29tcGxpY2F0aW9ucw0KPiA+IGluIGNhc2UgdGhpcyBJUCB2YXJpYW50IHdpbGwgYmUgZXh0
ZW5kZWQgb24gZnV0dXJlIFNvQ3MuDQoNCklmIHlvdSBhcmUgcGxhbm5pbmcgdG8gZXh0ZW5kIHRo
aXMgZHJpdmVyIHRvIG90aGVyIFNvQ3MgdGhlbiBtYXkgYmUgdXBkYXRlDQpLQ29uZmlnIHdpdGgg
ZGVwZW5kZW5jeSBvbiBBUkNIX1JFTkVTQVM/IHNlZSBbMV0NCg0KWzFdIGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2xpbnV4LXJlbmVzYXMtc29jLzIwMjUwMTE4LXRyb3V0LW9mLWx1eHVyaW91cy1p
bnF1aXJlLWFhZTlhYUBrcnprLWJpbi8NCg0KQ2hlZXJzLA0KQmlqdQ0K

