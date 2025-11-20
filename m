Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C101ACF64BB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 06:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3JAh/0ridBKizU/cE26EFLdW+lzD4EdZwpHrpvRoXBw=; b=NuT+oBo+NrHVFQJ0Xz8zpl1E7W
	dVZfikNJFNe9G0hQ1WS4aanzIqY5O8ADVXWJhE959FGPH3Ky4ENeGJjhsZTV1kWNb45aXVGCuAyqT
	teNzsbXkhQcUodMYbn9DzQBgGzf6AIT4ciMUHHUR2ZxdzPfqc9eE0V7BWJROCvlpyUe1DqILpycV1
	YBzNmNByJamDj4HG84zZ6IJtUrXDUE1PcWzqXfhHyE6HowtEok+/yBOLnTdWhbQjYuLd17fuoPf87
	hBXgoaOePOaJP7VNCMGXVBhDss/HdIxNdYim0lygIBoTCA3l33Wtbr74yOZ1UBlQgTttAUZrgQw/d
	m6oUjgkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLxnj-00000006Ckv-2eR0;
	Thu, 20 Nov 2025 06:05:51 +0000
Received: from mail-westeuropeazon11023094.outbound.protection.outlook.com ([52.101.72.94] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLxnf-00000006CkI-2H30
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 06:05:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M6Qw4agBYr/OcpbkXDOm0yK6nbvOwk+iIIZxvDU+ZLf+y4V0Td1t10FpkmGCA60WhgAHRGUl+yiEjPYV7WAaZ0uP0addja+W855DPoof1ZW6iLXpXtlJDsxyg2lDEDhHaBqQb8hmjv0/ej3UwYmTQ2NnK/Q5AWWIiaKNZI/kfpbwYJKNgKseVdvCkTjFJGE+8G1mHX8X6RuThWutKVrgzYoDUN1CCLjViEWd1GBLaaIxMS9O4HJKL22ggHone1AqBHufwZDzenktj/9YE8FdBskV0LduipnUvWymlmS6meNwqaUT1iSeXAUVpAGYNnZRnNBehpT+M+SZfQM1G7odrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3JAh/0ridBKizU/cE26EFLdW+lzD4EdZwpHrpvRoXBw=;
 b=nEHIUD7XNBuZxCii4jzjHb2A2if1c64BJLkHl7ltQw1pMdDLb7Jy4UQS9H1zHQAWTeh8Fscdj/T4wrmB9HDxrtw23jB+QcgUKfGMyN0y+aq0SEjXimCbXizmTeHFKP+96PxZsu8gbiQdD1JVGxH0tSo7fZsXNhRHz6errkfrR2GwER9hFWTB1jZd9X/TaQYSUmiv8DyPhyL0l2T6VcX4AtyXFjoANH44riXA3RaSks/MtsoSZq+goISgWmhw5TSjoqj7E1FO8mVt7+agXWU/wGG49vREvPxwKl+LFLrt20QcoxqLU3cncRMvFWOxYg8JNYyOGBL3zOHiuFbrN/o6Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3JAh/0ridBKizU/cE26EFLdW+lzD4EdZwpHrpvRoXBw=;
 b=tGVNUbHz+UeiiC8xACLdQqr5NZezwtNZmSojakw2AgMtBQ40PNCuPQlUnwxZYQP1c/ayp/kbvqXB+eadlvSTz/GcZ+QtlaC16kiVG61Xo9h6T8bp1nyPuUQ6VD/igjkX0VWRpYSknrjOl2vkKHKojq76g3l5jlF9gcMUOBM2kodv7vejfgImCbCBM/pyLoiA7hMu6OrbHDPND90xc20MWoaC+2hReZ6cUganx2z2yCfdc7et32ylBIfzZMBn/WYMDsLhyBd1wAnlAXE+NCDUNG7Ur0rKlkOW9vlbdODtn6qeaSJzr+hbFQkFEc0n5f5ssW4BvVoqVpqkAoM0gFckNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
Received: from AS4P195MB1456.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:4b3::21)
 by DB5P195MB2402.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:4a4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 06:05:39 +0000
Received: from AS4P195MB1456.EURP195.PROD.OUTLOOK.COM
 ([fe80::369c:a760:5bf9:8d4a]) by AS4P195MB1456.EURP195.PROD.OUTLOOK.COM
 ([fe80::369c:a760:5bf9:8d4a%2]) with mapi id 15.20.9343.011; Thu, 20 Nov 2025
 06:05:38 +0000
Message-ID: <3b64fd3e-5a78-4955-b3ab-8ae104449414@phytec.de>
Date: Thu, 20 Nov 2025 08:05:28 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: Add missing applied DT overlay targets
To: Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>
Cc: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251117211316.725960-1-robh@kernel.org>
 <002fad46-adb5-402e-8eb0-e4c71b862674@ti.com>
 <CAL_JsqJNOeKViuUwpLf-7RzBDB-EMm35MumJsGZ0deX1cLx3CQ@mail.gmail.com>
 <a8d1aaa8-9204-42f1-9e2d-3d20d5025efa@ti.com>
Content-Language: en-US
From: Wadim Egorov <w.egorov@phytec.de>
In-Reply-To: <a8d1aaa8-9204-42f1-9e2d-3d20d5025efa@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR09CA0174.eurprd09.prod.outlook.com
 (2603:10a6:800:120::28) To AS4P195MB1456.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:4b3::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4P195MB1456:EE_|DB5P195MB2402:EE_
X-MS-Office365-Filtering-Correlation-Id: 98720db0-8c5c-420e-25f0-08de27fad41f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WlNZV295YmlBa1BscFJKVGg4VkVSQ0V5aEN5NHZXY3RISGJqZTZBd2cwTVp5?=
 =?utf-8?B?UVZyWXF2Ni96VXZIZUVUVmozZkloUXB1aTA1M04rQTY0M3Q2L1ZvU1JtalEz?=
 =?utf-8?B?b0xBd3A3Mm5TaGpMMzZmcXJxc0w1SmhSQiszb1d5dG04ZURPSjJZaFlEYXNk?=
 =?utf-8?B?YTFpWlFMTVlZZURxVy9oc05IMlpubDZlY1JUNDJUV0psS2NiSjdkY2hLWXBH?=
 =?utf-8?B?dHh0ODFnQXRQb1l4Y1p0V2hGMFhvcnkvOXhqQ1BPcXNHL2xBc3JlYW1ycFRZ?=
 =?utf-8?B?cGdDQ2lQSzhzMkoreTRmUkM0V2VSd29kREt4TXhTUUZlQSt4OW14SitSVjQ5?=
 =?utf-8?B?eFd5V0FQUDBQUWxpQnhnODVWUHpCSklTR2RWeEM0YlU0VmNNWnVTYWx4WHFI?=
 =?utf-8?B?MnAxZENNWjVDTXZlNjZVTGdWMlkydGJMNlR5MHN4L09ER3hDOHQrS2ZiTkFy?=
 =?utf-8?B?ays3UndWQ3A4bkpmT2RVN2pJT2MvRVpCZ0tibG84UFI4U3JvRlBlMDhGcVcy?=
 =?utf-8?B?SndvMGcxaFpFQWo1MjAxQkVvSjdPSS9OV0RaQ1p4Zk4yRDFoODkxNVJ2K1or?=
 =?utf-8?B?RVJIczE2S2VYcWFkS01SMDQvaHQwV0sxN2pEYjNubS9Jbzh1MHRaMmZmRTBx?=
 =?utf-8?B?RXN5cUNsOGRTRURCVDNhTDZRTWMwWWY1cmJFSE82TGhTUjE0S2ppK3BrTDIw?=
 =?utf-8?B?VnM1OEJBVnlBZ1hqVExBeGcxK21QNXRZYm1ObStyOUlrNW5hMzNtL1ZBYkZ4?=
 =?utf-8?B?VFhsRGdQUjlBemZFMjZrTzJUd2diOWxqa0cyWWNkdGszM0NqVWdOZisydHcx?=
 =?utf-8?B?V0kvV1NES3NOanpIYTZNcXVKeVgrSUNSQjdjT1RyYmpDNzh2Rmo2bEl2R2N2?=
 =?utf-8?B?UkRmanlTZ0p2RTNVMmxTMWE1TlMxSGRvaEtWMTdTa3JiMXJWeVFBRUVBaGV6?=
 =?utf-8?B?MkVCSlA2em5sdmtXNytDdzQvcHdGWVR6M2txU251b1doc3IvUmZjVGh5MHdB?=
 =?utf-8?B?d05raCs3TWs3VXYzcUJNdmNVaGgwVTJCQ3doNTlDWlhXM2RuVkQ5Vk15Y1RX?=
 =?utf-8?B?TWVsWFZ4UG1xekNpT1NLbTdEamxzZ3dVMExieTNxbnhzM0Z0RFVpQ0R6cHpq?=
 =?utf-8?B?S3BZYzZRcFcxa3NGSjFwQnFnQzBIM0plUWF2STd1bm9hYU93dXoxTnMrZnRN?=
 =?utf-8?B?K2NvcGM2dkdSY0I2K3IySjN6MWhhSUFoVTl5SDRvcnFGcHFEMWV0M09QS28v?=
 =?utf-8?B?aE1OZ0hVWkcyUE1WY0U5Z0t3T0NJWTBheUptUk9SMEhlZXdGdUlLMFByd2ho?=
 =?utf-8?B?dC9kYklKV0ZFY0tzcjB2aHJzSmlEMFo0cmhOS0ROVU45R1B0a1ZNai9OdjdU?=
 =?utf-8?B?RmJFSWZzdmNNTVBHMHFObERSZkY0OU05bFJ4aVRvMzdidzhzcHFhZER2MGs5?=
 =?utf-8?B?S2E1THoveS9PamdJeWtkbzRLd2lWV2hQUFR3bW5xRFVNaE9XK1BMSTZDeTUx?=
 =?utf-8?B?MVpVREs4UC9xYnR4TDZrN0xkakVlUDhCQUplMWk4ZllLZmRTYXBZUVE1dy9W?=
 =?utf-8?B?TGZuaURWSTJWSkphZnVkSUpRWTAyRVBzcyszTGFsWkhTdzExN2xKY1dENmJG?=
 =?utf-8?B?UWtHRFc3aWw5RXF3YzNyejFvRDk0SzRxS0orRkRJMVNDM21DVS9hdzN3dGR3?=
 =?utf-8?B?L0ErNERFWUlNd09BSWZib2lIdi9kcHQ0ckpnK0VuQzFqcEVrTVZGenY5WGth?=
 =?utf-8?B?ZVZubER3WmtBMGY0YTZoOXllVnR1WEdQQXBlNlBzcHhiWlZzVlZPTDc3ZnJh?=
 =?utf-8?B?NGlDZmdBa3M2ZVdudmdqenUvT2gyMjBObmxyVS9iU0pGRTlaNngyblFKM3pn?=
 =?utf-8?B?YTZOeDJyZHNsKzBzUTNHK3ZqVHUzaGpNK1VsdFRqR3lMSGJMZDM2V1M2OE1N?=
 =?utf-8?B?N0RZcmRzR3pMbTRZQ3lIdmRlY2c4aWs1MTh0WWtjTnZqWmQrVlRNN0dXUEpV?=
 =?utf-8?B?RWdDcDNNekVBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4P195MB1456.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SmFyT3FOVFEyNFlXVi9xSTVDN3hNY2g4Q3hGenArd1Q4VzNxVCtuQll4SFVC?=
 =?utf-8?B?UklwZkJ3SERSSVQvYnV0dEVaaEpjd0FUUnFCeU41aXhpTTBNREFuKzgrbzl0?=
 =?utf-8?B?TmQxK2gvWHZSMDNzdW45NUloblpMTDFXTFVZWGZIUkRNZW1rNVF3UWR5dkI1?=
 =?utf-8?B?QWZRN2U3MmhkME14V0gxQUFNTDN4MWQ3RzF6OUhkSFpsNW44a3FiV0dNaEhr?=
 =?utf-8?B?MmZvMUV4TzFjd0IvaXZYanNxR0pYbWlyRkNxYzFzalJ0NCtGYjh3SmhaNU55?=
 =?utf-8?B?eHNWNTRud2xwcHpwMUJqbjBaZFZWQlEzNnhiQjJPUjJBaDZNNnVTWEMrdkFk?=
 =?utf-8?B?L24yYUpEeU01VERycDFMam1BVDcrbmZLZ0Z2M3NwZS9jQ3A2TzlaVXZHbTNY?=
 =?utf-8?B?bWFDc2Y3M0x5TnJDMmRXMEF5czVGZXNNSThjeDdHa0lEWHdGbGZpNHhEYVA4?=
 =?utf-8?B?K25UakRkVXdrS0QxYkI5ZDFQanhXUC9HOEVwTlNzYWN5RkVpQmhCZGZ2am1C?=
 =?utf-8?B?RmVjOGpDM01wR21ZQlRtZjFFc1lYaFJ6anN1bWJ2WWlaL2R0dEJURWpwMHVI?=
 =?utf-8?B?R01VR2owUlh1ZUFPNTZjMjBKeGs3clQyaSthODM2anJvU0grYnZ1YnFVK01z?=
 =?utf-8?B?LzBUSlBsUW9hNjNLT0puK09YbVNyR0tJVFJPdGdERHZ3ZGhPRmZVWEdCdVoz?=
 =?utf-8?B?L2tLWGZnQmdQVDJpblkzY3lFTC8xL2V4c01VV1RBZytWUktnVGwxbnJsTDJU?=
 =?utf-8?B?cjVaY29yeHpGL29tQmZCSFVpMlN6YktkRFZtR1QxUkMxR2VZdkNWNi9FSzJS?=
 =?utf-8?B?TVh6RWlHd0ZNdGZVOUFPZWpaNzZpMy9xVjFnMHhrWVVKbzZPRjJGTm5xM3pz?=
 =?utf-8?B?QmNzMlYwQzkxMW5iY3BaM0lHTGc3RFFBaHJCR3Q2UkxwY1pMQ3Ivc2JCTThn?=
 =?utf-8?B?d1UrWUl1cG9xd2RpOUhCRFlQMnhIVlVPempTMStBQWJDYUM4a1VYYm1yYUdL?=
 =?utf-8?B?VWFjS3dPL1I2QjBYWCtWVFJIM3lmVkNxbUwraXFlSlAzSWtVdUFnS0hmNS9U?=
 =?utf-8?B?dkpRcjZ4QjMwRTJRZGZQZzhYeklOTDR4eDI1dW84MEpyblJYQzRJSGRHTGI0?=
 =?utf-8?B?M1YzTGM1YksveXdJUXhuaVNYRTcxNUkzblV3Q3pvUTA1RTlNYkdwUlRqMlhO?=
 =?utf-8?B?dW0rYzkzQ1J1V2d5TkVqKzNZeVZteEdsUGwyMkhlYzdLMjhVak1aVWpmQ0tE?=
 =?utf-8?B?M2NoN1ZoZFBXZnlXdWRlRzB4REEzUmNybUttTC9mNlplMk9vbE5mUXl5VW1K?=
 =?utf-8?B?TzFudU82US9najJXaWp2aXROVnhVS0NCWUZidnB5Y1lkSVY3Qnp1blVFdDNk?=
 =?utf-8?B?MTl2STRYczVwem5pZ1RaVnd3MFpDL2ZpV21MN05zMElrV2RINHhwbHpRN2lw?=
 =?utf-8?B?L29mT2dibk8rUlRVbDMzcFZEaFpESXJIN0R3Q2o5elBYTDltUXF1ekp3QURP?=
 =?utf-8?B?OCtPYVlUcG45azZZL0h4UXBJVnBWSG95a2JiL3kxcWVEOU02N3RTY1hLRmFK?=
 =?utf-8?B?cVBTalFXckxjNE1SYWNYMGoyWnBQQWZPalllQjQ3QlhCT1E2aEVDTW5RUTls?=
 =?utf-8?B?amwxeWo3ZGdWcWw0UGpUanF6YzkxQ1poTTlQWElPZUNnOFBmNzNzTzIxZThI?=
 =?utf-8?B?Q1VhaWZ5RjdyUURpMzljR1JVWXNHWWxHVVBsYmczWnBBS0NaRGZaMjZ5cXhw?=
 =?utf-8?B?QmgyekwzVEpyaTNvcEVDRkE5TG1iQ2NyQmFwcUxGVGFLZ1VCUXNxQkVkWEox?=
 =?utf-8?B?d0Q3SXQyUko1QVluUWRvMVlSMm5oM3dRVGRBMUFReFVQMDBsNXdPT2pqdTNT?=
 =?utf-8?B?ZXcwRVBSQzVKVjhzVjZ3VzR0L1UzS1hhRXo5MHFpNWdGQUJJNmdic242TjVW?=
 =?utf-8?B?eXIxMzc4dVppVTMvbnNFaGJORisyNmR6RzF0bWpuQmlLNy9sam1pS0JycU42?=
 =?utf-8?B?d1R5b3g4cUlWbXZRMXVUeTIxeDNsZkxzRmxMNWFzSzArTlI5VXFBbmc2dTBZ?=
 =?utf-8?B?WEFnNm1nL3JmWFhpeHhuSXMyMGZRelNzLzhpWEk2U05JVU05WDk0NnZkdU9I?=
 =?utf-8?Q?6xYRnRPf3FCQ8/znLEzleVZGW?=
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 98720db0-8c5c-420e-25f0-08de27fad41f
X-MS-Exchange-CrossTenant-AuthSource: AS4P195MB1456.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 06:05:38.9158
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nuWdP/7oROytxU0HWywdgnPUCZOEAxPf9d/HCVmdz7NaM4mIzDKZ4NP8K7liF5zDQxp5HXS8DGE+J+qXVzgPiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5P195MB2402
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_220547_907207_BC473E66 
X-CRM114-Status: GOOD (  14.65  )
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



On 11/20/25 7:14 AM, Vignesh Raghavendra wrote:
> 
> 
> On 20/11/25 03:26, Rob Herring wrote:
>> On Wed, Nov 19, 2025 at 8:47 AM Vignesh Raghavendra <vigneshr@ti.com> wrote:
>>>
>>> + wadim who posted something similar:
>>>
>>> Hi Rob,
>>>
>>> On 18/11/25 02:43, Rob Herring (Arm) wrote:
>>>> It's a requirement that DT overlays be applied at build time in order to
>>>> validate them as overlays are not validated on their own.
>>>>
>>>> Add the missing TI overlays. Some of the TI overlays have the first part
>>>> needed (a "*-dtbs" variable), but not the second part adding the target to
>>>> dtb-y/dtb- variable.
>>>>
>>>> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
>>>
>>> Look like there is more needed change needed.
>>>
>>> https://lore.kernel.org/all/20251119123216.1481420-1-w.egorov@phytec.de/
>>>
>>> Could one of you post the superset patch?
>>
>> I'll leave it to Wadim.
> 
> Probably best to merge Wadim's patch first and then then delta. I will
> take care of posting the next as TI board targets need a bit more tweaking.

OK, let me know if there is anything needed from my side.

> 
>>
>>>
>>> I have already sent out the PR for v6.19rc1 for TI tree? Is [1] plan to
>>> be merged for v6.19 cycle, if so I will plan for a follow up PR with
>>> newer version of this patch.
>>>
>>>> ---
>>>> This will soon be a warning[1].
>>>>
>>>> [1] https://lore.kernel.org/all/20251114222759.4181152-1-robh@kernel.org/
>>>
>>> BTW, with above patch, make dtbs seems to fail w/o CONFIG_OF_ALL_DTBS=y.
>>> Is that expected?
>>
>> Yes. What's in linux-next now is fixed.
>>
>> Rob
> 


