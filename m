Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D3ABD31A0C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 03:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a+BibqB0mqtcyvnAK5FTR0WijB/IPC9AEC0bM5qb9Jk=; b=Iq9CjDCoa4IRlCL1EwrbK2qJlN
	cZpPSDF1ahQSiVIXrSYaC+8lgrPAvd4errLWFGR0+QUf5PUCqn9av2i7abhez8IS5IDdSjRM+WI/b
	JOD+zXvfn6mRf1Js48XpwNKQvZWKlWapaJF3S4ta3K88SNJEVDikg1d1aUcUetDoMACfCJAnkTZvi
	4p0r36cM5nb6lPmu7M16RSc/1k824fH56RfhVaPJsgrcBpACAmVbwrJ4FNX2hP9g730M55WxqhkMH
	hFe6iiseot+VuTygX9rYsyIWJvcYU+VIf2G5RywSLwUUbFgUmRmXqKrdlNmtvIifApz/3j2iYaQWA
	wjjLljOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfrvw-000000082FB-1olH;
	Wed, 14 Jan 2026 03:52:37 +0000
Received: from mail-koreacentralazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c40f::6] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfrvs-000000082Ef-34Pw;
	Wed, 14 Jan 2026 03:52:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IYWkWynav1tFNsrqImMBy0FPpXl2Eq9CTBugyDpEm81QboOYpoLurCz5BjqMlOeD0AU2EM3tzZVF2m/Rnm6i2vRjI9HxdZmvTMJI6Gn9g3Vr0Q64QLX/oNfD4pIwuc9dPwMm71XyEifQW9Z795j4+uafMIeaHeptTfVkRWiWDgCpO10akAgWI/3OfYHWY+JV8TaFc739aCDACaZY8fcir/MzkQPSjy/N4LwCsEwvdotO7H/2N9kBuLKjfiOBz3ld9z7exP12guLrfgkKs64OaFtfCta97iPKFefMEqE1TkMaBpUdHBG18jiglHqfqq0Oqh5NGnNVgEtulSqNcPJnAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a+BibqB0mqtcyvnAK5FTR0WijB/IPC9AEC0bM5qb9Jk=;
 b=rh9d2YjWTUsDstS1brs7MjBPINiG8OcW8qJMbK2aBgARdueKrhRHNz1BgWwQqENcRh1yiczPbk73OJxZH0+gKBJu34vZZUEzOsWFz7cFK4yrNQwVItUvVf/QnMmmh0uCzYXbJu6uC6Gre0F9L4Ivom8HHzgL/QAnnVd+p1NJjhsALV5eoBQk6q6nE+V1/vxCMqoYgmSvpgBMD9LrROpkPpkdP9/QMDG+YsS1WxCwc+7RPfKT/JTghXssYsfDnc9Y1IRNsUXYZMEYFhDbomn15KSWDmUA87OC0uY/e4Z3pFHHy2mgY+Ih7LdlcRg2WRoSxfF2G7EfRqqkJ6NzjiVNVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=khadas.com; dmarc=pass action=none header.from=khadas.com;
 dkim=pass header.d=khadas.com; arc=none
Received: from PS1PPF62EEA9B1D.apcprd03.prod.outlook.com (2603:1096:308::2da)
 by TYZPR03MB6693.apcprd03.prod.outlook.com (2603:1096:400:1f3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Wed, 14 Jan
 2026 03:52:21 +0000
Received: from PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 ([fe80::af44:7e78:1133:adec]) by PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 ([fe80::af44:7e78:1133:adec%8]) with mapi id 15.20.9520.005; Wed, 14 Jan 2026
 03:52:20 +0000
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
Subject: =?utf-8?B?5Zue5aSNOiBbUEFUQ0ggMS8yXSBhcm02NDogZHRzOiBhbWxvZ2ljOiBzNDog?=
 =?utf-8?Q?assign_mmc_b_clock_to_24MHz?=
Thread-Topic: [PATCH 1/2] arm64: dts: amlogic: s4: assign mmc b clock to 24MHz
Thread-Index: AQHchHkD/tJt6Y4mYkiG4gXTRsFCaLVRB/Gw
Date: Wed, 14 Jan 2026 03:52:20 +0000
Message-ID: <PS1PPF62EEA9B1D3D672D4C60A6F4EC48DDAE8FA@PS1PPF62EEA9B1D.apcprd03.prod.outlook.com>
References: <20260113-amlogic-s4-mmc-fixup-v1-0-1ab1fca0fb2f@baylibre.com>
 <20260113-amlogic-s4-mmc-fixup-v1-1-1ab1fca0fb2f@baylibre.com>
In-Reply-To: <20260113-amlogic-s4-mmc-fixup-v1-1-1ab1fca0fb2f@baylibre.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=khadas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PS1PPF62EEA9B1D:EE_|TYZPR03MB6693:EE_
x-ms-office365-filtering-correlation-id: 1d5e88e5-6395-4831-7c18-08de532051c2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?M3dGL3JrQTNlNE9xcnh2UkRUQnFJTHZ0MUhLY1F4bGVWN0xRam5nTkViYTlJ?=
 =?utf-8?B?TkI3RWV1TUM3ZmdiZ1Q4NUdQQlBSRFZrVENoeWFZMk9qYTFYMmgwQTIrZVdz?=
 =?utf-8?B?OUxTL2ZrRG5BNm1idDIxTVBmd25sRTZXc0ZQdmtvMWhIRVR6S3dWU0FkM1Bq?=
 =?utf-8?B?SXNDTkEweHhzV3hwTWdObTk1RGd0eWwrQWIvRVEzSkhlVDAzN3VHcVgwby9F?=
 =?utf-8?B?K2FCOEVhd2crV0lpVFp2ek1GUStsVTBDTUhPY2xiZ01uVVBzeVZHN2VFdEtQ?=
 =?utf-8?B?eG1hWWN1Y2RjZWNmNkVxd1V2dlYwUWVUVkVyWmUycW9jTjR1cTZ5VE5naUZW?=
 =?utf-8?B?RGREUTRZNHY2OW0zMGJNSjNicGQyKzhLNWY5TzcvK3BndCtaenZlYzc5ZzZ0?=
 =?utf-8?B?NmJZakhYei8wNlJkOUJxL0hSS3NobTdINXRoR054STdwMzFxRFJpZG5hbWJx?=
 =?utf-8?B?aDkzTE8rSmQ1U2lOa1ZEVVpHVU10ckxFTHRVbVZtVkdWVmhld1REdHVpZ0ty?=
 =?utf-8?B?YUhZZFVkSDB4V2FpMm03VzlzelYrdWhXdVZzR1o4MnBHZkJaR1l5aE00VS9U?=
 =?utf-8?B?WU9zN3pFMDYwbkVYZktuOXFNTVlkWFV5dVhBQ0tpU0JuTldpSnVsL2lqSVpG?=
 =?utf-8?B?UTcxN1FIMmFpNmZKcDZPemM5dWxVd0NER2U0L1dJcHg5aUswdHIzMk9KUHhO?=
 =?utf-8?B?RjNoTlh3MlJsVGtobGpZb1laT3UrcFd0OExCcElOV25Ld3JVcnBBSjVHdmVv?=
 =?utf-8?B?VGpJSTZ0VTluRll3TFRaLzBuQ25idkZzaW5MSzJrR0VDOXI1QWtpdmh2Rldt?=
 =?utf-8?B?R1lRSGx6d0o4NE5jR1g0UDhibng1SUVuRkYrRWs2blM0bXJ4UklISW9oZE5x?=
 =?utf-8?B?cjNrZE5qQVFXQ2x6QlFmL09XSkhvLzhCSTdGdkZ1NWxxSGt6THpKckNmQ1RY?=
 =?utf-8?B?Vm1TVzFlVk9PM0xOMk55Rkl1N0lwMUFGT1Y4QkRzN2NvV3B6c3RLUDFGSVp4?=
 =?utf-8?B?WWZXN0h1NU95b3QyMmxGazZ6Y2pUYmtvK09nanRsSmFXZ0JOTXN5ZmVOcXdK?=
 =?utf-8?B?WDZJSk80endwdk5JU0NOZkZWdDN4MUUyMkd2OWZYMVNLWE0rM0VYbGJKL3N2?=
 =?utf-8?B?cHhuZCtNSFFFbmh1aDN2QmJndnBTOW5Tb0h6cnNuY0l2SkcrVDF1K3doRWdF?=
 =?utf-8?B?RTRoY2dKY2ptQ1JPMDk4bGJLOVlxVHFpbU0xUG1lQ2JlK1A3TVB4aWdHL21h?=
 =?utf-8?B?SkFpYlV6VThUNE8rYXE2TEFxVmpnQ3gvTnFsMERBcEpJYU5sWVN4Kzd6eG84?=
 =?utf-8?B?Y21kUkd2UUJMNHZpRHFEVDhYVlFlL2tPVDEzNTdWb3gzZjBvRGhhbGd6VEQ3?=
 =?utf-8?B?RkN1SGhnVjNMbzBIZGxrdHcyOHN0c000M0dXY1FSN2c5cml1NlpkbHFqTDFB?=
 =?utf-8?B?TTF4N1ROL2l4aFF0cHQva1VZZklwK1A1aW1TMURBNmNKT2IxMWlrMmQzSkxv?=
 =?utf-8?B?OVR4cWg1bU9lZjhySGp4cnFHdnJqd3N4MkJza2ZqTHJIcnJTT255MGFrMlQ2?=
 =?utf-8?B?U2s3L3RVcjZCUVBzR2RVUGxORUxNRWhWQnNoSTdSL2xrRUhEMTNwbmZ4ZzdC?=
 =?utf-8?B?ZS81d0dZeUhraHAyelFWdlljUngyNnlidFduSFgrM3B1QlVaV1cvTFBxYWV3?=
 =?utf-8?B?WHJ2Ny8xa05vTzdJejNiRVV0ZHFBUVNCQWl6VlFxWkQ0ZGczWXdTUUNLLytB?=
 =?utf-8?B?OHB2eUFiQTFXcERYekFDcGJ4cGJaMlF6OGw3WGNKV2Fxck9GUTUySkRYUHVY?=
 =?utf-8?B?cWRRMzFLRzFWRzZMakhpU25xSkgwUkRFNFBRS1Y0OHFjcXVKL1VvcnNaYUE2?=
 =?utf-8?B?OUJkR3RLQWtPdWx2T0dQUkU2aWh2R05sbGl1Y2tnV2I4ZEJDeTE0K1NNU0J2?=
 =?utf-8?B?dGZPZ3hDNVptRmlBMEpad20vc3h1ZXdlSTZoaDNXT01mTEU4dGxLTFBLVmZO?=
 =?utf-8?B?SlhGdnF1WXVuSXdkOHE1Vyt4R0VCY0pXaFR5bmg4b1h6Tnc2S1d1blhPc29k?=
 =?utf-8?Q?a0E6xl?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PS1PPF62EEA9B1D.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QitOZDNjaU0vYTlJbStaTEYrUHNrVlJTSnpiR1ViZkF5MWd4OTk0dEJvSEc0?=
 =?utf-8?B?L3ViQmxmM0trVGNnSnNiazBZOUU2ZzIyaXcrY2YvaVlBc05Lc2szWDNUR29O?=
 =?utf-8?B?VERPUHdIc3Vxb2pOUXMzc2tnMnNHWkc5Ui92N0U2VXh2YnNwSXB4QXgrRFRw?=
 =?utf-8?B?NGRpbW9TSnh0SmJHOW5EUjZkVUZTVGtSTjdjWU5HSnVWUU1FSmpPSWcyS0Yv?=
 =?utf-8?B?dm5DVG0vR3M5OGVQcWtXVDl4TVdydTRmd2kyNUhkLzZ5OU5LemZ6bnZReWtQ?=
 =?utf-8?B?S0ZqVDk4eVNja1dlMEZReWdIL0hYcWxDaWFMcm1mL2poSWdzMnRXcVozdytP?=
 =?utf-8?B?Z25PN1BteFFWZWl1SWsxOStFYUMyZVNIUVVwS2N3S2c1V202TENEUjF5SGhN?=
 =?utf-8?B?SE96cHpQVTFtWkYvcUx4U0hJNkVReHpvalc5MjlxY2pBQzNzbmdtcjlib1dY?=
 =?utf-8?B?dWp4RS9QTWF5Y3QrS0ZLSXFya0c2RDBTT1F3aVZta3lrZmNVNlhvalZYMDVi?=
 =?utf-8?B?RDZ2VVpMdDZCMXYyVlVOQ053Smg2UzhsV1R2NGxVSFYyWTVGbjliL04vaHdV?=
 =?utf-8?B?V0hscEptY1J3WHVZNElhWlA5ZUY4V04vY1RMVUhrejR6SHpwcGlFYWdLYlhq?=
 =?utf-8?B?K0cyKzNaOE5mYlJ1Rjd5TEJlZHBpUEVwcCszckovQStydW82UDhINnQreE9a?=
 =?utf-8?B?N0pNOFVaRTRSYy95M3dzMFV0ZVQ4bUlNV2pZZG9iTXZFTlRObHVRUXBBZXpX?=
 =?utf-8?B?NEF2MTJCakJwRWExWFp2S0phVS9RRkt4WjA2c2o5OFBBdjJsTW9CREJpS3Rq?=
 =?utf-8?B?STNUaTluaTJVUVVNSHBBeHgwQXZSM2ZDc1ZRZWYwNTQ4b3UwWU54eHZ5M1NL?=
 =?utf-8?B?TUlDQlNhYXZGSWk5bURmSFZDMmt1aTJzUDhUNDZreXZhbEJodENZRUljcTM3?=
 =?utf-8?B?djFHRmdDRzdpTEU4c1JVS3h3VGd2UkxGcS9ua1hzU2tWTW9sRzJuRURUVEhr?=
 =?utf-8?B?QWc2RDIwaGtJZnlid05oSm9GTDgyZGRzL2JnRXUwcWpLeHZIeVljaHUzcHdx?=
 =?utf-8?B?cjdxYzZzam1NRWpRV3lGSjZ2Y01EYW0yb3JtMURSWXA2aE9KR0F6aFlUUXFn?=
 =?utf-8?B?V2NmWXhUQ0lCNTVHb3Vyb09CQ2VWam1uUTNxWWVpaFZoSlJsS0Z5TmdZdHox?=
 =?utf-8?B?YlN2VWgwUUFRM2lsckNaTVdiNE5TMkF0SzVxd1p6TzZiS0YyeFRaeEhjMlRU?=
 =?utf-8?B?UXZ6c1EyTEpHVEF0cjFKTlBmeW9lQWI1NVg0emY3LzUwU0I0Y1NicHpxTC92?=
 =?utf-8?B?UloyUXIrVnlOeGdwUENQMmdFdUxaSFF2TXViVjl6ZFljOFBoRmVFL1Uya1dX?=
 =?utf-8?B?bUh3cDRSazB6ODd6RGVXS0FZQlFubCtZeXY5Si92WllWcXBGY0M2aVlCYi82?=
 =?utf-8?B?UTh4MVI1WTNralpaZnJISlpGK0dwVkwrVExHemZ2WkpMb1FESUVPVnk2V1cy?=
 =?utf-8?B?WGNyVjNUK1FXTVJOUWYrcUFiZzVMa0tEZnlHMkNGOHAwQ2JRTVg0cU8zWFJY?=
 =?utf-8?B?bk5QMTBaMkJaeXdhWS9pb05XZHpESDJKK1NxYSs3UGtlakdRR2o5Q3NJVC9O?=
 =?utf-8?B?Q3lYcTc2VThON3VyMFBGTmFoVTRFQmZadXhqWk9sdWJqOTUrSjQzb09SaG9t?=
 =?utf-8?B?bkpBMmx0Tkd5TEZZaHVCMnVZZ1Ric3BWNFpGZDVsbUt3RGdhUEQrbDhRRk9F?=
 =?utf-8?B?U1BQQ2dnWW83V09aaGNjYXIvcHk3MDFZVnVRN0NvcDlyTVVYNVY4aW1tZkxZ?=
 =?utf-8?B?YktPeGtMbms2UzdNRU5ZZGtWS1RBcE9ybkd4TVc4cFJkVzRVUGY5WHl3M0x6?=
 =?utf-8?B?eEt4V1NyZlRFQXJjK3FMcHkybVRyc0ZtZHl2dmRhdllXblRmM0NyTm5CYVpH?=
 =?utf-8?B?TklJZGxhWmsvRVpVU3oyc1ZoUTYvd1RjRzNQWmxuM2srRmxtU3hIeldpSHY3?=
 =?utf-8?B?SlZCMkorUkFMd3NxZDhwdjVhSmJ2TG91RVBNU0lSN3JMalpQemlleTMzWUVi?=
 =?utf-8?B?OWJSM3hVYUZlK3MwZzBDclI3NDlXZXNRT1lFTWZKSFZtY04vbFJ4MTB6bFhS?=
 =?utf-8?B?VUdYbGNPYVpjYUJ1bmwrcnBhZXpuRHBZcnZ5R01WbXM0T2ZpNmtLUVYzM3dL?=
 =?utf-8?B?T0RBMnNlNUZxNVVKVDMwbG51eUY3WXR2NlhjT1pWMWo2OEhMVyt4MkpGR2F1?=
 =?utf-8?B?VkoxNkRVOUZ6WnhJU1JrMGQvL2hmVmU1VEt0TlhNbE8xNE0rK1dPTjVNSUNI?=
 =?utf-8?Q?SK+9hNOta5DpiZgFh+?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: khadas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d5e88e5-6395-4831-7c18-08de532051c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2026 03:52:20.8635
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2dc3bd76-7ac2-4780-a5b7-6c6cc6b5af9b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b76JA7DVZ4dfZbYA8F6apNt8voMtGtrcLCG6OS8br4vjMM88U8cEPd1w7tL3VdHr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB6693
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_195232_907871_6DBE2DFE 
X-CRM114-Status: GOOD (  12.50  )
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
IHRoZSBTRCBjYXJkIHdvcmtzLgoKcm9vdEBLaGFkYXM6fiMgdW5hbWUgLWEKTGludXggS2hhZGFz
IDYuMTkuMC1yYzUrICMyNiBTTVAgUFJFRU1QVCBUdWUgSmFuIDEzIDE2OjAxOjE4IENTVCAyMDI2
IGFhcmNoNjQgYWFyY2g2NCBhYXJjaDY0IEdOVS9MaW51eApyb290QEtoYWRhczp+IyBkbWVzZyB8
IGdyZXAgbW1jClsgICAgMC4yOTc0ODBdIG1lc29uLWd4LW1tYyBmZTA4YTAwMC5tbWM6IEdvdCBD
RCBHUElPClsgICAgMC4zOTI0NjNdIG1tYzE6IG5ldyBVSFMtSSBzcGVlZCBTRFIxMDQgU0RIQyBj
YXJkIGF0IGFkZHJlc3MgYWFhYQpbICAgIDAuMzkzMjE5XSBtbWNibGsxOiBtbWMxOmFhYWEgU1Az
MkcgMjkuNyBHaUIKWyAgICAwLjM5NTc4OF0gIG1tY2JsazE6IHAxIHAyClsgICAgMy4xNTUzNjBd
IEVYVDQtZnMgKG1tY2JsazFwMik6IG1vdW50ZWQgZmlsZXN5c3RlbSA0M2I2ODgxYS00ODNjLTRj
YTctOWRjZC1mNDU3NWU2NjVhOGIgci93IHdpdGggd3JpdGViYWNrIGRhdGEgbW9kZS4gUXVvdGEg
bW9kZTogbm9uZS4KWyAgICA0LjY0MDUwM10gRVhUNC1mcyAobW1jYmxrMXAyKTogcmUtbW91bnRl
ZCA0M2I2ODgxYS00ODNjLTRjYTctOWRjZC1mNDU3NWU2NjVhOGIuClsgICAgNS43Nzc2ODJdIEVY
VDQtZnMgKG1tY2JsazFwMSk6IG1vdW50ZWQgZmlsZXN5c3RlbSBmMjBjYWJhZS1iYmM2LTQ1N2Ut
OWJiMy1iYWM2ZWVmMDFhZjUgci93IHdpdGggb3JkZXJlZCBkYXRhIG1vZGUuIFF1b3RhIG1vZGU6
IG5vbmUuCgpUZXN0ZWQtYnk6IE5pY2sgWGllIDxuaWNrQGtoYWRhcy5jb20+CgotLQpCZXN0IFJl
Z2FyZHMKTmljayDosKLlpYcKQW1hemluZyBLaGFkYXMsIEFsd2F5cyBBbWF6ZXMgWW91CgoKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCuWPkeS7tuS6ujrCoEplcm9t
ZSBCcnVuZXQgPGpicnVuZXRAYmF5bGlicmUuY29tPgrlt7Llj5HpgIE6wqAyMDI2IOW5tCAxIOac
iCAxMyDml6Ug5pif5pyf5LqMIDE4OjM5CuaUtuS7tuS6ujrCoFJvYiBIZXJyaW5nIDxyb2JoQGtl
cm5lbC5vcmc+OyBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprK2R0QGtlcm5lbC5vcmc+OyBDb25v
ciBEb29sZXkgPGNvbm9yK2R0QGtlcm5lbC5vcmc+OyBOZWlsIEFybXN0cm9uZyA8bmVpbC5hcm1z
dHJvbmdAbGluYXJvLm9yZz47IEtldmluIEhpbG1hbiA8a2hpbG1hbkBiYXlsaWJyZS5jb20+OyBN
YXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPjsg
WGlhbndlaSBaaGFvIDx4aWFud2VpLnpoYW9AYW1sb2dpYy5jb20+OyBOaWNrIFhpZSA8bmlja0Br
aGFkYXMuY29tPgrmioTpgIE6wqBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZyA8ZGV2aWNldHJl
ZUB2Z2VyLmtlcm5lbC5vcmc+OyBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcg
PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz47IGxpbnV4LWFtbG9naWNAbGlz
dHMuaW5mcmFkZWFkLm9yZyA8bGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnPjsgbGlu
dXgta2VybmVsQHZnZXIua2VybmVsLm9yZyA8bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZz47
IEplcm9tZSBCcnVuZXQgPGpicnVuZXRAYmF5bGlicmUuY29tPgrkuLvpopg6wqBbUEFUQ0ggMS8y
XSBhcm02NDogZHRzOiBhbWxvZ2ljOiBzNDogYXNzaWduIG1tYyBiIGNsb2NrIHRvIDI0TUh6CgoK
VGhlIGFtbG9naWMgTU1DIG9wZXJhdGUgd2l0aCB0aGUgYXNzdW1wdGlvbiB0aGF0IE1NQyBjbG9j
awoKaXMgY29uZmlndXJlZCB0byBwcm92aWRlIDI0TUh6LiBJdCB1c2VzIHRoYXQgcGF0aCBmb3Ig
bG93CgpyYXRlcyBzdWNoIGFzIDQwMGtIei4KCgoKVGhpcyBhc3N1bXB0aW9uIGRpZCBob2xkIHRy
dWUgdW50aWwgYnV0IGl0IG5vdywgYnV0IGl0IGFwcGFyZW50bHkKCm5vdCB0aGUgY2FzZSB3aXRo
IHM0LiBUaGUgY2xvY2sgaGFzIGJlZW4gcmVwb3J0ZWQgdG8gcHJvdmlkZSAxR0h6CgppbnN0ZWFk
LiBUaGlzIGlzIG1vc3QgbGlrZWx5IGR1ZSB0byBob3cgdGhlIGJvb3Rsb2FkZXIgaXMgdXNpbmcg
dGhlIE1NQwoKY2xvY2sgb24gdGhpcyBwbGF0Zm9ybS4KCgoKUmVnYXJkbGVzcyBvZiB3aHkgdGhl
IE1NQyBjbG9jayBpcyBzZXQgdG8gMUdIeiwgaWYgdGhlIE1NQyBkcml2ZXIgZXhwZWN0cwoKMjRN
SHosIHdlIHNob3VsZCBtYWtlIHN1cmUgaXQgZG9lcyBnZXQgdGhhdCwgc28gYXNzaWduIHRoZSBj
bG9jay4KCgoKUmVwb3J0ZWQtYnk6IE5pY2sgWGllIDxuaWNrQGtoYWRhcy5jb20+CgpDbG9zZXM6
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWFtbG9naWMvMjAyNjAxMTMwMTE5MzEuNDA0
MjQtMS1uaWNrQGtoYWRhcy5jb20vCgpGaXhlczogM2FiOWQ1NGI1ZDg0ICgiYXJtNjQ6IGR0czog
YW1sb2dpYzogZW5hYmxlIHNvbWUgZGV2aWNlIG5vZGVzIGZvciBTNCIpCgpTaWduZWQtb2ZmLWJ5
OiBKZXJvbWUgQnJ1bmV0IDxqYnJ1bmV0QGJheWxpYnJlLmNvbT4KCi0tLQoKwqBhcmNoL2FybTY0
L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tczQuZHRzaSB8IDQgKysrKwoKwqAxIGZpbGUgY2hhbmdl
ZCwgNCBpbnNlcnRpb25zKCspCgoKCmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2Ft
bG9naWMvbWVzb24tczQuZHRzaSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1z
NC5kdHNpCgppbmRleCA5ZDk5ZWQyOTk0ZGZhMjdjYTU4MDhkYTdhZTA4MjVlOWFmMjU1NDE3Li42
MjUzOGZkOWRiNmIxZmZiMzNhODhlMTI2MjhhYWRlZmJhYTQ1M2VjIDEwMDY0NAoKLS0tIGEvYXJj
aC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLXM0LmR0c2kKCisrKyBiL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvYW1sb2dpYy9tZXNvbi1zNC5kdHNpCgpAQCAtODM4LDYgKzgzOCwxMCBAQCBzZDog
bW1jQGZlMDhhMDAwIHsKCsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBjbG9jay1uYW1lcyA9ICJjb3JlIiwgImNsa2luMCIsICJjbGtpbjEiOwoKwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlc2V0cyA9IDwmcmVz
ZXQgUkVTRVRfU0RfRU1NQ19CPjsKCsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBzdGF0dXMgPSAiZGlzYWJsZWQiOwoKKwoKK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGFzc2lnbmVkLWNsb2NrcyA9IDwmY2xrY19wZXJp
cGhzIENMS0lEX1NEX0VNTUNfQj47CgorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgYXNzaWduZWQtY2xvY2stcGFyZW50cyA9IDwwPjsKCivCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBhc3NpZ25lZC1jbG9jay1yYXRlcyA9IDwy
NDAwMDAwMD47CgrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9OwoKwqAKCsKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVtbWM6IG1tY0BmZTA4YzAwMCB7CgoKCi0tCgoy
LjQ3LjMKCgoK

