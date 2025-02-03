Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC00DC02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 15:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0nK0w0HAzFrlWPzD91ZPBPln+P9sUVqwiuf37T5NAtg=; b=pQ2+Ssju1m3XPgSlHp9FkAbKx6
	1wdgcZGaD19RBUh6K1bcVajoSLUHdig5qQ9BDR8mb70nJ7GYoMfQo79wIZbxkffLxPqH4UJL4pvlu
	3StW1JAnXV58BjHAnw3RkpjdNziq00ju71Q+b4UOGPprRct6DUVJJQyL2cfXdqGWzXClKowkD0qlo
	dw0Opz5/TJYwi7SY1AWHCbzXDU54zQm5FQMhuVzWmItRLMGlwe6oyPd4f63tX/pZYrs1AOWZDKVHD
	FvUHF+ICDr77DfRgEyd+GEHWCaqI5DzwKLLnTJGLNz1CBX9+4rHrwLRwJ/2A2mhVEdF9k8RoDjcKE
	oG25aJsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teyRZ-0000000Fsku-0GXe;
	Mon, 03 Feb 2025 15:33:01 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teyQD-0000000FsTR-0vB9;
	Mon, 03 Feb 2025 15:31:39 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=yg/v+sdU9M/QLtAXfKIznaYZEoFiDaSXGE1fGxCvP/xmlLYPzh3iEpSIPsFlSK93WmkFkGKCeNNbIku9JMvGxWd1jqcbJBp+J8725/M8d7CCV+5BH3ZFfhQQTPMT87tyc5dgo55MsBqBPEBRi9cGN4zMshWWZZ8iZ7YDRRY/78fxmBRpihBDIi9TR903Gl8D2opz8Y8m9pCzeLjKyHjwwvQ5yE5VNyFdb/IVQMMiT/kfA9/axOn2xfbINg6OqVgiUnx3GNEu0C5OBr9b7rIeCZH6rPR9pwbfqZYeOcmmZGUtH8SvGe585itmEUrvf6bX0P035kP3xaoWV0PVKW+gFg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0nK0w0HAzFrlWPzD91ZPBPln+P9sUVqwiuf37T5NAtg=;
 b=Acjy0RHDddm9/erh/0Qk0pRYzzFQNj/R63Ck9mEIXCIZgighB8RBXJxu9MMkSq77ZhZqqJABY7EarwwupvCn5yG0EM6sOWYMEMZCaKlru5u06gFfyDZFQj42KHb4MsPyrdsjhWhaExCFoWUaO41PYJz6v9bbjJhCwpwFkk6gQGmDsPZCoDj51AxCpWkhKTWv4HNz3esebTAZLwWQRXr7jxu8WjivZAyCXSyhyYsUO4VjE0Pkyj9myYtfZHoM9SgGy8G5EHT+sTCIocC3631uS51KfOUp3S5xxCBk3uzBntqVVS0jxpCXlh7cCTZYSKnXTqTNcMSGvQ3OH4jQ62yJ3A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0nK0w0HAzFrlWPzD91ZPBPln+P9sUVqwiuf37T5NAtg=;
 b=l7FluD41bmj1cjJhRW80a/4HSYe1PDzvho+eJbHZXaJMyZwrQYz6UxD2PBcX37WRUMJZhy3DLig7u4+AN8j33B9oeg3xlZRE6jEJi0JUu6gY5GyRzjIZD7Sb4TpgTnlNUwehvFji6tP1JFB4r3YRiv6PI7G1llCMyVRUsLH1Kjw=
Received: from DB7PR02CA0032.eurprd02.prod.outlook.com (2603:10a6:10:52::45)
 by GV1PR08MB11207.eurprd08.prod.outlook.com (2603:10a6:150:1f1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Mon, 3 Feb
 2025 15:31:27 +0000
Received: from DB3PEPF0000885D.eurprd02.prod.outlook.com
 (2603:10a6:10:52:cafe::a2) by DB7PR02CA0032.outlook.office365.com
 (2603:10a6:10:52::45) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.21 via Frontend Transport; Mon,
 3 Feb 2025 15:31:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB3PEPF0000885D.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.14
 via Frontend Transport; Mon, 3 Feb 2025 15:31:26 +0000
Received: ("Tessian outbound 9503ad2ac7d1:v560"); Mon, 03 Feb 2025 15:31:25 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 95966970328cfeb1
X-TessianGatewayMetadata: Hzkrg6SFimyeSdVr+b5JYDJbrAh7J+hEzCuQKIAZa2ydquuZU/evovmx+uisTtB0Gc9Y9rs9W5DFogwcwdh6WVUBMywFuZki2z2/Qkcigo21lxUVr9by8K23GH8sK5BBY7ewgb1pe6ZrzqzQkmLkqgLcIP1ctFbfiUyBvJLD/fU=
X-CR-MTA-TID: 64aa7808
Received: from Lbb97d1179163.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id FAE934DE-AC96-49A1-92E7-7C4E5EC637B7.1;
	Mon, 03 Feb 2025 15:31:15 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Lbb97d1179163.2
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Mon, 03 Feb 2025 15:31:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qqD2yT871rHkyo9gLeXbpD22XsT5irNtJqHcRoVA9LfDGV1eTlcexU0D3Z3JDNfm5EvjcKlkbqH4qewYqvm2xs0eBvXiJjrXSgNG0A1YRmdt/WbREik29QpXPcj3tgVVWZ2+iykuCMdPKJLI06/WVRAEjlecFhG7OIsAjzPpMgvKz1HTM988GcKibypn2N/RNi9W8g9a8+Zi6ITsW/tJ7FDRD4MlB3Xd5DzJg0jY9bRloO85Ab1boqPs/Lxw2Y9/WyYdIQa02YMpH8E5HkI1RCzxCq8c5rlAVxUqRr83e5qQWVlS0LBMJcwyrwkDmJe6qfS4L4aOvZQWRscPTgQbLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0nK0w0HAzFrlWPzD91ZPBPln+P9sUVqwiuf37T5NAtg=;
 b=h97xNdZeT29H7gJEiqsnIRTKDif++pP6GviFgj8taM2vOxnoNerOM73Y31Bo6Ats3nPjO7sGDxOUf6+571sX8A49tqDZqLoi+pgioagUUsNTpFwqu/1014rDH7fPxsDfJ5gC17LC29x15eJBpq14UOTvF+U0ayupRDN2MOz42wdEs3NbsmB3CJRBsogK4+JRqxNtSEDGufblT7sob0RelrHKeY+ipxesJsV9b6bH1/ExaQPS3+QG8KVzci+bkiDqVDdKZjh0zdlhl7WYLeNigjPfzDANhv201gqr6UF0xwBciPlEZ1nsGKUnB8he/fg96Onzk8FhD8kYkIkACJoHmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0nK0w0HAzFrlWPzD91ZPBPln+P9sUVqwiuf37T5NAtg=;
 b=l7FluD41bmj1cjJhRW80a/4HSYe1PDzvho+eJbHZXaJMyZwrQYz6UxD2PBcX37WRUMJZhy3DLig7u4+AN8j33B9oeg3xlZRE6jEJi0JUu6gY5GyRzjIZD7Sb4TpgTnlNUwehvFji6tP1JFB4r3YRiv6PI7G1llCMyVRUsLH1Kjw=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AS4PR08MB7925.eurprd08.prod.outlook.com (2603:10a6:20b:574::8)
 by AS2PR08MB8285.eurprd08.prod.outlook.com (2603:10a6:20b:554::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Mon, 3 Feb
 2025 15:31:10 +0000
Received: from AS4PR08MB7925.eurprd08.prod.outlook.com
 ([fe80::8ef3:b027:e22f:1ea7]) by AS4PR08MB7925.eurprd08.prod.outlook.com
 ([fe80::8ef3:b027:e22f:1ea7%7]) with mapi id 15.20.8398.021; Mon, 3 Feb 2025
 15:31:10 +0000
Message-ID: <4b9deab1-e330-4c93-8260-75276c2bc9ff@arm.com>
Date: Mon, 3 Feb 2025 15:31:09 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/5] dt-bindings: gpu: Add protected heap name to Mali
 Valhall CSF binding
Content-Language: en-GB
To: Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Yong Wu <yong.wu@mediatek.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 nd@arm.com, Akash Goel <akash.goel@arm.com>
References: <cover.1738228114.git.florent.tomasin@arm.com>
 <36b57dcf20860398ba83985e1c5b6f6958d08ba7.1738228114.git.florent.tomasin@arm.com>
 <7234f25c-a2aa-4834-931b-aeeb7a49dfa7@kernel.org>
From: Florent Tomasin <florent.tomasin@arm.com>
In-Reply-To: <7234f25c-a2aa-4834-931b-aeeb7a49dfa7@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P123CA0081.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::14) To AS4PR08MB7925.eurprd08.prod.outlook.com
 (2603:10a6:20b:574::8)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AS4PR08MB7925:EE_|AS2PR08MB8285:EE_|DB3PEPF0000885D:EE_|GV1PR08MB11207:EE_
X-MS-Office365-Filtering-Correlation-Id: 7710038e-c405-436d-16e5-08dd4467d306
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|921020;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?aisxZ2MwUEl3ZGhxTVlmTmRMQ3Vnb1owVjJCNFFTRzNYb1J2UWdCRmt0V3Vz?=
 =?utf-8?B?Y1cyMHlSRmlJLzN5VXV4di9HQlNkc00xeUQyeWx1d1hwWEFwRkxhRkRHME5x?=
 =?utf-8?B?NUJWdXVlVTRUaml6MXE0elF4UUorVXRYeTZCNlFCakRPMXlOYkFRWmlMbXZY?=
 =?utf-8?B?djBXUnE3Q3NqaVpjR2RuTllWSXpvMXN5QTduWlhxQVZFM045VzZDWkRkejNk?=
 =?utf-8?B?VFBYZElUcldWMVY3WVBMb0d5YklhTEZodkRCT0x5Mzk0cnRDTThIN1lZREhI?=
 =?utf-8?B?V1pjR3V6OGJCWDdLRXIvNjNJaUp0UlNQdkcvc3JpWUQ1MWs2MnUybFFZRzUv?=
 =?utf-8?B?cm9KODFSVGJOaHM2WlZPQm1VU2ZyY2dnV3BkcWowOTNDei9PYjh4QlFHTTI5?=
 =?utf-8?B?empJTUUybmxTR2k5b1JPOGV3T3kybnV0TFNRMkZaYkJCQjc2T21MV3dhWHpW?=
 =?utf-8?B?OXhocE5ZSVZtcTJSVlRlZjZiZlkwSm00bXpkK2JYMzVWZHZkYWV6eTdRaGdq?=
 =?utf-8?B?QXFqd0lGZ2xXTjlXSGcwUWszVlRlcFA4TityMVRKRGtpK21JRWVEZkRXbkVL?=
 =?utf-8?B?MU8vc01mNGdJTDlFNUJHQjQweVkzQWg1Q0UvTUlldEZBUVV4MlY1MG9GZUc4?=
 =?utf-8?B?QnRwVGpscFJhTGhMUmd4ZE1iVjhvLzBvditQVEV5dWdGbXVIbDAxYXAvdDFZ?=
 =?utf-8?B?UXkwZmtNVEJnVktaN041aEVsOHZLY3FnQ3F2ckFRck0wcjZqb0hINDUrYTBZ?=
 =?utf-8?B?aFdUMmNPK1FqVm1QQ3JtaDBRNVBvVUxvUGFzbEh5TTFmL3ZETytTZktJdnMr?=
 =?utf-8?B?VHpTakZ5WEtqTkp2RnBDTEJQSitrUlRRbzJBQmZtbDIzdnMzMjhXeEJsNEVw?=
 =?utf-8?B?UFdvM2c3N0RVbDZUbU5rc2NETGNFU0doZ0I0TDFLa3RXUllWVlJ1UDdhWlJq?=
 =?utf-8?B?UFMrV1IzUnVES2tvejZCMnp2aWZZY3N2cEwyR3ZCTFp2ZVNwY25kbE5Kd2xt?=
 =?utf-8?B?anZUem8xREtvKzEzZlJ0ajVWUnN6S1dlZ055S3JzUk1ibFFRNzJMMk5vRG9s?=
 =?utf-8?B?R2ZYZElmY3JVRHI3NEtUVDhZTk5GdEtsKzB4VkRaWHp1T2xhU3Z2RndTMkhS?=
 =?utf-8?B?L0ZzUEEzRFNNWVVNWEVtVWJJOHZrVXF2eDJud2Z4Wm1YaVVtOWJ3WUhrNDhY?=
 =?utf-8?B?a0Jjb1ZuTkc3OUpKdWF2TnRTMWtGcTFEWVVnUnVSQm1memRIYTRNMG1hSlNB?=
 =?utf-8?B?RkgyYzNnb3kxNEl4WklzRXZpTnIxcUlza3AzMVc2LzRMOW1vV25PMko3Q0hX?=
 =?utf-8?B?R25BL0RzU1MzYnM2ejZpWVM1Skd6U0gxWVdxckpacTU0ZnhsTUlHdWM2WDJp?=
 =?utf-8?B?SnZ0WGM5UVpBNkxoMzVuYnI4Z1QzdEkvWXY2YUtvRllKK1FsMWkrWnpPQ1lq?=
 =?utf-8?B?N1o3SHoxVDdiQlI0aklEeHJ6dmU1T0JTVU4zZE5ZdWo4K0tLSHBqck01SWlN?=
 =?utf-8?B?VG5zMkcvYUt6NlhEZzU2NlFQMWVCZlBYMDh5YjZsYnVNOVRMdTcxM0dHK0Jw?=
 =?utf-8?B?eG8rN0xndjg3TlBoUk52eVlyUXFnWHlYbGFTWk8rbDdIb0ZnRkJGME9FUVdl?=
 =?utf-8?B?UURBOGg5RWNqUmNXaFB6aXMyaFk4SEJsckU1OVFvd2x5UEllZHJ4RnYyVVNj?=
 =?utf-8?B?aVlTK3JMb1hkeXNoSXFpTUtFZ0JnOUxOUlgxSHNkK3QrK2d6akdPMi9Mazl3?=
 =?utf-8?B?MzIwK0pidGNkQzN5TjAvYWNmK2VHd3dHNmxtKzJob3FTK0RqRkNmS044dVly?=
 =?utf-8?B?bElUZGhSWFJSREpqTHZVTzIvYmRoYjM4TENaaFNtWXhpNUdxK0RPUHNtZ05N?=
 =?utf-8?Q?e0KAlM40Lz9ba?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7925.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8285
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:20b:574::8];domain=AS4PR08MB7925.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB3PEPF0000885D.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 45da9d79-a0d2-4621-5c35-08dd4467c94f
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700013|376014|14060799003|82310400026|35042699022|921020|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a3FtayttbFhkQ0tKaW9BTVBaUEpEbEozMGtDZEZVY2xDbW5jSVVjMnB2T2l4?=
 =?utf-8?B?Q1dnSUhYaXk1bFc0VGFYcHVxRk93MDVYaDRLTExxeHcrTGdXMUprSUZXZXdZ?=
 =?utf-8?B?ZzgwNnh6RVhJWE9kRXM5d21ydHJXYS9TVE0xblBVNlY4c1p2cytweW9XeTJz?=
 =?utf-8?B?TUl0TDQ0d05Jc3g2b1VJcW1qUjJvRkNPSDhLSUFVMjd6SGQrL25uVG1ldlVU?=
 =?utf-8?B?eTA3bGhSaDJ4UGNmcmp1bEFZd2dQVWZsWnIrdXBPSU1qU1BpK0ZBV2R6VDhx?=
 =?utf-8?B?di8wZkJ0d1d1eTRDeUpVRkRZeWlRbXNVZC9LYTFycWlqaFNTVVVrQ2JsbDZt?=
 =?utf-8?B?Rm9pVlVHekRwajkxOFdJYzR0cHltdzN5WFZLMFJFR1lhczdOQ0NDclgxQzNU?=
 =?utf-8?B?QW4ydTNLL2NLb0NhOFZjM3p4czdHMFlVWHFZbFNwQzlBRmF2M0E4WnNxUTQx?=
 =?utf-8?B?eDJIbnFRV1BoOWdnblhXZllOcit4WVRiSmNNVSt2R1VFMWU3RUhpYThpMzRO?=
 =?utf-8?B?eWM1MVFrRzBSRk83OU8rMTVhaDFqSjRKZW1nUk14TXRpUUdmLzBSUGtOM0Jj?=
 =?utf-8?B?S2tXTW9zNTNRVDhxcmpQcThlRzJnNmZpMTJKQ0N6bWN3TThORXp2MlZ3ekQx?=
 =?utf-8?B?amtMT0s3WUhYMlJFcGVCdFRtclJ5R1FtWFdCMWcyRXZ6dzVpNUtDbnprZ3Rz?=
 =?utf-8?B?V2xWSTl4UUk0SnlHSTRLY3dwMWdVUmNhY2ZRKzBBd3FZcGF1cmo3QVBiNGFU?=
 =?utf-8?B?VVBkY3JMeVVvMk11eUh1c0ZrYTVyQ005djNYVkZGT1JjN3B4RGoxWWcrMHlu?=
 =?utf-8?B?dWxydnNxczEwYjBtb081M2NKekMwWWVNR0NYeFp5VzByakNPR1NXOHVRYzJ4?=
 =?utf-8?B?QXJVOVpjSDhpOU5XdHNEVHN2V3FMYXRlaWhnVlJ1SklFMjdpeFVyRjJXaTUx?=
 =?utf-8?B?cmlpRDhCU1h4K0IwRjBqaldLWEVManEwV01LTGV3Q0FHbzV2TmhLTWxpdTVm?=
 =?utf-8?B?SnhNNldmUVNEWTBqYjhienRIUjR6cm92SHRIdFIycGFOS0Rsa2M4bElPZlpo?=
 =?utf-8?B?dnNaRGtNcDZGSTdKV3RMRk9zT1N3dTVJb1RqRnd3ZU9TbjFCQTFVaTFxK01v?=
 =?utf-8?B?a3BTVGFBdFJQdDdub2hJYzRvS084M0xaeWJKY0hXNW5IaG12azIyaDVSblcw?=
 =?utf-8?B?ejFUdkRIUndNTHIzZzFDK0xkMkVVRndjMU1BZVJMTnVidHdEY3RRVnhOdEIz?=
 =?utf-8?B?VXR6NG84NmtpdXhDVFpoTVFvQks0T1NsTWVuMUlSa0lJT3dzOW03SG9rbWlw?=
 =?utf-8?B?WHQ0ZGRCRnhKbnVBd1RUS2lUMU1mckZUV1UxTjNTa2xycjk0YllyRFQwcjdD?=
 =?utf-8?B?bW9FN21NYXc4L29ySWQ4RWxidkNRN3IrTllHZ1lYUE95dTlCN2tra3hWY2FB?=
 =?utf-8?B?N2dkaTFOV3pTNHBlSm4wcmdpT3VHWWYyUk04TVJXMGNlODVBeklydEkyOHRD?=
 =?utf-8?B?c1A2TGx5Q3RJa1V3VTQxYXRhNktMUGxrcmNQNEx1QlFmd1NtZnhrbkRCNysw?=
 =?utf-8?B?b2xsVXpOY0duOG03WW44WGlWdENZR2RpSjFDNVFxUTd4WjZ2M251QnpKaTRE?=
 =?utf-8?B?S25oMWdvRWJSUm5GVVlCWGtTM0xEZFlmWlVseFcwUUlzZTFWdGFvaks1b1pX?=
 =?utf-8?B?cTdFTG9uMUpicml1M1Zvb21UOXkxUGVHMmhXS0p6NjVnNlordGQzSE1qYnRx?=
 =?utf-8?B?Rm5CZG1jbVZkVUVaYW13MlpaVzJpcElZZXcrdTZVdGM5R21KOUZmZU9teDVN?=
 =?utf-8?B?RlNTS0I5SmFCSXNBVm1oNndzV056SFNVMnFqNldNMS9CWDR5YzN4bkFlUDFZ?=
 =?utf-8?B?N2FzM0swMW10aC9GMzlzMDFBVVczSnBodlFVRDVsSnh1RnNTcWptVFdOeUJQ?=
 =?utf-8?B?RVBIa3dUeHJ6azJEcHpTRWtTTTc3ZVhmZVhhQTdjRCtiSnB2bjZtVUdOQXNn?=
 =?utf-8?B?bVg0NFlnNlJRPT0=?=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(14060799003)(82310400026)(35042699022)(921020)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 15:31:26.9190
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7710038e-c405-436d-16e5-08dd4467d306
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB3PEPF0000885D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB11207
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_073137_424209_026CF348 
X-CRM114-Status: UNSURE (   4.24  )
X-CRM114-Notice: Please train this message.
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

Hi Krzysztof

On 30/01/2025 13:25, Krzysztof Kozlowski wrote:
> On 30/01/2025 14:08, Florent Tomasin wrote:
>> Allow mali-valhall-csf driver to retrieve a protected
>> heap at probe time by passing the name of the heap
>> as attribute to the device tree GPU node.
> 
> Please wrap commit message according to Linux coding style / submission
> process (neither too early nor over the limit):
> https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597
Apologies, I think I made quite few other mistakes in the style of the
patches I sent. I will work on improving this aspect, appreciated

> Why this cannot be passed by phandle, just like all reserved regions?
> 
> From where do you take these protected heaps? Firmware? This would
> explain why no relation is here (no probe ordering, no device links,
> nothing connecting separate devices).

The protected heap is generaly obtained from a firmware (TEE) and could
sometimes be a carved-out memory with restricted access.

The Panthor CSF kernel driver does not own or manage the protected heap
and is instead a consumer of it (assuming the heap is made available by
the system integrator).

I initially used a phandle, but then I realised it would introduce a new
API to share the heap across kernel driver. In addition I found this
patch series:
-
https://lore.kernel.org/lkml/20230911023038.30649-1-yong.wu@mediatek.com/#t

which introduces a DMA Heap API to the rest of the kernel to find a
heap by name:
- dma_heap_find()

I then decided to follow that approach to help isolate the heap
management from the GPU driver code. In the Panthor driver, if the
heap is not found at probe time, the driver will defer the probe until
the exporter made it available.

Best regards,
Florent

