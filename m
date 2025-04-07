Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9E8DC36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 11:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qqNHb2AHN6cXW43KG817+SZrezHaH6gYBMKUfqDcVjI=; b=EGny6dN3q3ku/RcLc994wKn78O
	pmdBtS17QrbQ+geX/oAni/dIZCs1Cc4/dqvyhpT1a+wCXoElAWgZLrwc+VTWk/M51aIZNJcivfzbv
	bGhJFjskk/8v8oYeKfDoGVMu1BzvxeJjXYf7VC/esdhYRInAGQFeMMdtM2/Hr8WSE1Mt9oT9zvl0g
	tokKyrAUoar98vo7MIZfLukQPL0ag8hvWV6hPgcg6YLQmS3WYzzk2qNjC0s2fBi2fIomQwQrzxCv/
	tkUNsiN3yUdhJKDyiHChcprtgF9cLgE2KIImjidDZPRqQ4belT8qOV7+DzsXRUH06x/eOTZMpiFqg
	YWL0FMZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1kJ5-0000000HVAu-1fdV;
	Mon, 07 Apr 2025 11:06:23 +0000
Received: from mail-vi1eur05on20612.outbound.protection.outlook.com ([2a01:111:f403:2613::612] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1kAb-0000000HSEZ-3xrD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 10:57:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aMDgXlnsmZt8p3BzbTzfb53RJi4zkgPUVkTDYvRDWSJsrxCHxRjRpMa4Km64Qn4u7Gxfvo5A7E7l/7jA21qSRrKTMZ+j0/qkJBso3ttxlDal7jSH7p+MA4Td9kWsqlZFSv+WDFQKdMzGUpFtOqnahLK4C+aoUlcrLeopps7oaAkLEoNyilqfF3aDGtMbG3Utjqyet87Dlu640ZtD14HIMy0Iyh8672GA/DSYZZSAsE6+R/IQBdBnAhObotBu8FHg2tu2VOlqSlry+pvd9PUUCsPtRyFgcBClw/C++ekkvFNl/G5DsfTRevINRAzy7gI5itdb1xgTH6TQQVrBhBo9kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qqNHb2AHN6cXW43KG817+SZrezHaH6gYBMKUfqDcVjI=;
 b=mm6quQ5ZAhv0D/8NN3jSToPnxj34YnrN31gdiT3VgRLHrf4o6Bru/TA1+4TQpF4l0l9LVYriTOxUcNykurMmAsbWPPkLzBNnZKKEo5gPJygQGqXCtzkbULjmxzElxtyEBXdLjdchzE3da5wlsTkCWFSezmM3lDXhicmfEGSsJ8MVXJHROku1tDw9Ulhyj3MOB7go1wRwAIyNLOVp6lwO4WJb+fozLYtq4Q3JZaCyJ5DbZ3t40hx1q9gXO6mVIuBsM5jVIXNvhCMzZI5dDJnN7PVgm/6kiHerol55+7u4gEVo8xBDfC5l0e7TCZF77shMs215gfw+syxovzlA9yCkjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qqNHb2AHN6cXW43KG817+SZrezHaH6gYBMKUfqDcVjI=;
 b=MUk/SXGBkF5cqcgpBbNcplBGep0wsX1kOvIZGFdTLglnmagzNboR9nUlwRVICM6Ees7wD2hbYafsHNxRtprrePZ0rsKjZswyzZMFz3+y29VXVcnbx5v7HzpmMJ9PJSqql5qnYx0fq6x3ybkJvxhn61ppj9Litf5Pd3Nq8qtglgnlh3H/SAI5gnyAtOYAR4X7OWOl6Rft4ASrm6cLOEMaIP+KmtuXUzIJYpqY4Q/RMF74gxVVu0zTHOTJKXl0Huz22hn8MKX/MYnZrwx8BmbX36rv7YG9rI6bp9VN8essnflv5mC97FsOb6gT2TYv9VQBiVrIfIPuzyajxo3oJHhY7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by DB9PR04MB8493.eurprd04.prod.outlook.com (2603:10a6:10:2c5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.43; Mon, 7 Apr
 2025 10:57:35 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827%6]) with mapi id 15.20.8583.045; Mon, 7 Apr 2025
 10:57:35 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
Date: Mon, 07 Apr 2025 21:50:20 +0530
Subject: [PATCH v15 4/7] arm64: dts: imx8ulp-evk: add reserved memory
 property
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-imx-se-if-v15-4-e3382cecda01@nxp.com>
References: <20250407-imx-se-if-v15-0-e3382cecda01@nxp.com>
In-Reply-To: <20250407-imx-se-if-v15-0-e3382cecda01@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744042844; l=1237;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=+tEBCQwIgttWNIOGjTwL0lAdit156ic91qKLo+hmnV8=;
 b=DZ2hlY3yz/hl52+u8+ryEXieVJzyDnK39XqRcXUU6AYVZnhlsFxXwgVxTOyqoV6ux+W5oV9Z9
 G73O5NNfTw2Cl5p2RCX45k8rQ0MCzgOVCrw3sPRkCtR9l5QArZhYNkX
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: SI2PR01CA0036.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::22) To AM9PR04MB8604.eurprd04.prod.outlook.com
 (2603:10a6:20b:43b::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8604:EE_|DB9PR04MB8493:EE_
X-MS-Office365-Filtering-Correlation-Id: 54edde8f-47b5-47bf-fb6c-08dd75c30103
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|366016|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WG84Z0VDTENnRXg5MUNGcjIyTWJUeDNlODQ5UTB1K01JVVBheThYMUJJS0RE?=
 =?utf-8?B?amN6MEhDcUQ4emgxU0g2SVRUMTd6b2tJYklyK1J3UGsyckc5Nks4VzlIK1Vv?=
 =?utf-8?B?MWNCbmJJK0V1ZEFYSHF5ajAwVXk2bnJHVlA2RkhFWEgwU1FnZ0VYZG5pRzcz?=
 =?utf-8?B?eUU2d1RMWjRMdkU3T3BiNlhSOGRlbG5UUXlYY09RdllLYkR2Wm1TanZCNHIv?=
 =?utf-8?B?VjY0SVdmVzJzTDNsTjlmdGVrYnZWTVNtYW1vVzlEOFR2ZmNadGNkUlBOem5x?=
 =?utf-8?B?NVdyVk1FOWpyL0dFTkJqOEpqbkJGT1pEbFdYdlRnOHBGV28yUXpHOFdUamNY?=
 =?utf-8?B?WnhEVHFFZENjQlEwZlQ4YmRRQ0hvaFg0NnpKakJWUkVSZjNYZndaMmlQbE5M?=
 =?utf-8?B?M0NKRUNmTlhoR1J5eHhDUVcyYWp3NHV1ektUQXFaUTZJQ3FvQWFGRUNsSVNI?=
 =?utf-8?B?TkFuMENqeWNjRy9WRDRkRUk4MXIxMldGNzIyWE1XcnFIUHp6ZUY4aGNHQ3M4?=
 =?utf-8?B?aUVuRXdVWDRpTTR2MEZpVG14N3dlNm1USFFIeENBdVlGOXY2dmNKR1VjNEQr?=
 =?utf-8?B?bkp0cXBlbElYcEs1ZHowV0psK284Qlp6UGNUSStzdGRiV2MyL2ZiWlhHc0hi?=
 =?utf-8?B?V0pEU3EzdjFxbFJ5UEJyKy83UmxiSXRKNEh6ZHYxY1VFNG1nbm5ucVZZNGsz?=
 =?utf-8?B?RTZjd21LN0k5OE1IOTg0Y0thcFhIWFFzRnNPN2N0TzE4Q1lsOVBmdXBNSXF3?=
 =?utf-8?B?K0NTclp1Qk9yR0NIMWZTTVVpSHBaUHd1cllrNFh4eU1scFBNZGEvWEMzMUFE?=
 =?utf-8?B?Y203VWRaRGxUYW1mZGMwWWNMT3JDZDN1ZER1RU4vemx1QlEvUzRWQ1doai9D?=
 =?utf-8?B?N1dzcDRHVlBTVVMzMll5M0tNdzRMZmw0VkpwcVgzQ0hhU3g5MTYzZkRUWVpT?=
 =?utf-8?B?aW0yK0RiZ0FLM2lIWkRQK3lNZEZJT3crZ3Nxd2lzVzZjM1RoV1pZRERDY2Nu?=
 =?utf-8?B?NXVCVnIwOHRlemg4N0s5YVFhM3ZUWm1lSUlCdHdxNlBTYlZac3RsS2xVTm5B?=
 =?utf-8?B?dFFVekcvSzBCbjZoUkhabDJmYXUwRnJla1piVDc1QmVMWkJXS0FZeTEreXRH?=
 =?utf-8?B?Umc1Qkg1QmlEUDIxL3R1U3BLUGkxKzBqaWxSNkE5NkltQmpnZXZ2c3o0cnR6?=
 =?utf-8?B?Tks0dlJMc1pSbWRHZjhUMzk5N3BCb2hkdllwdUUvRFB4VkU0WCtjb25XdEFO?=
 =?utf-8?B?V1ZSanJmK2hrV1pCVW5UOVRPeEFYSTg1a0hxTjJUNXFScitRTUZUUllKVGJZ?=
 =?utf-8?B?Q3JVeHVoQ043ZjNweUoxUk96UXNvY1VQNWpOWW9qcXpMSTdqalhYNWdhRkRs?=
 =?utf-8?B?eFI0b3JGWGRvcXNYU3N1c3V3bUxjcTVVejJxQW9jZnlkNzl1U3kxeHd0SGdl?=
 =?utf-8?B?eHpVeVJURmhlc1ByMHlKQjZrZkM0dE1OWXgvQmpTSUVvVC9XUS80YldBMnVR?=
 =?utf-8?B?N2tvMGs2TXFHODBXTS9iUlhXOURTUkpIc3pBS3AzVElqYitkdFV1Vm9Odm52?=
 =?utf-8?B?Nm5QdUdCRDRnUXowRXQ1MXJiaXVvcG13ZTYzb09RRzlQMFFMa0N5SW9hMjVV?=
 =?utf-8?B?Vm5XTkdScWFPTTVGam5wbUJNeE51OEFXQXdjbG5IdmZWUi9OUVgxOHJTRHZp?=
 =?utf-8?B?Umg0VTJ4bHc0TEt2cS83K1ZlY3JUcy9zakF6ZlZPV0FWSmdiS24zaVBqT3ll?=
 =?utf-8?B?eE1CRzFZTFZpQ2dkUTVQK3k3YlVMSWtHRmlGRHd6TGx4RXhaN0NmMFQxcmt3?=
 =?utf-8?B?MjAvK0w5S3pGWlpuWjNTYlAzNnhsOTZLRFM1YlNDd1JNK0Y3emloVm4rU28v?=
 =?utf-8?B?SE4wVGJMOU4wNmttQUpuc1dNOTBJYVZJTHJ3dExXYTFuWWFuS2dYTjNnVitS?=
 =?utf-8?B?WDBmMTluZ2FkanpmbHU5ODZPRjdCOVpHamk2YnVseXBoOElHZzB4RlZCZDEv?=
 =?utf-8?B?V2ozcjIwTkZ3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHVlOTFqdFZjanJONktHcktqMVB6dmxjU3AwRzlJbW5wQ2FYYUdZSDdhTWds?=
 =?utf-8?B?aHRYalUyaEwyWlMxRzg0d0YwajhGSitjb2psb0RDeTlLRXdxVVhHK2hEeVlp?=
 =?utf-8?B?UVNHTXVJVk0wRnh3bHJ3dTlRRWdVTDdvc3VoczlTNG1LdnFyTURhNmh2Mkhu?=
 =?utf-8?B?ZU5JbUh1U1lPd3dUWjNLKzVLVkJVcno4VUJVM3lhRStjZkphQjkvOHd2anY1?=
 =?utf-8?B?THR1VEF2TkRnNEtleVMrckIvMlJodWpycnUwSkxyWXR0Wm1YV1VIUzJKcUlo?=
 =?utf-8?B?aWtnUWY5bDgvakorcDN6UUp0cTMyYjRtVnYwQTRUOVdLdnp2M3ZPYzJVWG1W?=
 =?utf-8?B?VVdlSHZOZ2lWTk5JUEQ4dkxOblVTNW9LUFVPdnRWczRNTWJpaWZvVUY5WjJt?=
 =?utf-8?B?bEhld2NoY2xZeTFYZW92MDMrMmlsREtneDZIR1dKNWFhNlN2NEw4Zngybmc2?=
 =?utf-8?B?YTF0RGxXVkRmKzRIcVFrNXpMS01FRzZjbDA0WnFyRkVVU3ZqeVRnUE9lNm11?=
 =?utf-8?B?NkRjbjBnekdjZm1Ma1lubHVQTHFKMG8zQVNrMHBDT2pyU2tnQlN2WXRvNDR0?=
 =?utf-8?B?ZVBrOXM2UGI4N3BtWDEwam0zakhrL3I4Q0o4b0Vib0N3NmNrL3hNT0R5NUMv?=
 =?utf-8?B?Y014clc5UFBWYnZienpIS3M1TXhUMDRyWUhjdXFsVE1tSmF5eWlmamtLVG1y?=
 =?utf-8?B?bHA5OUhDeGViTU1DcFRKKysydFVsdUZiNlZOWnJhOGNYSHVKYWxNd1hyVG1l?=
 =?utf-8?B?R0dCVmk0N2lvZExTWUdoYjZTb1psNWN4SzJobU4xRWdNd29YbzhGK29LWEJO?=
 =?utf-8?B?YVQ5dXRWOXYzTDVKdDdKYzZsS05PYk0zKzQ5YzR2Y2tZSmxSZlBtTmUycHdh?=
 =?utf-8?B?UWxkYUpqOUNhZkJ5bi9Gb2w3eElPaUZleHJTRWwvcTZYR05KZHFjd3o2VGxQ?=
 =?utf-8?B?dEJoMmlCZ1E4R0trMndQaVJJNGt6cFp1QUdaSi9Ub01Td0JxRVpjWXFSWFdR?=
 =?utf-8?B?S2EvY1p4N0ZXT3J5eEpobzMzWFcvUjhxTDh5ekEyUGw3WUoxdXFxbjNHS0tD?=
 =?utf-8?B?M05Fa3VSdEg0L1psUnBvVm44TUVEUmlwdUFvY1E5cVNHangzZ1htUTRTOVEw?=
 =?utf-8?B?eEVKRm16R0t2U2VUcEswcnJwK3IyYnF0dHphY0NEbkpUbzgzQ3l6ZmNQUTFq?=
 =?utf-8?B?LzRRanpvSWU1elEzdGI3KzBWaGZsVWxUSXRxU1pnRENETzNvWXFTTU9TRVRS?=
 =?utf-8?B?Z2orRXlJZGpUdFcxSm9pQ0lyeUwweHNqbHdKZVlnak1jUERaUG1tMTRjOENt?=
 =?utf-8?B?TTZOTHJyWHNXcGRPYW0wQnRiMnZ6TkE2clQxZHZqaWhaT1AxRXducmhMakhQ?=
 =?utf-8?B?MThXeWI1MU42Q2E2TlhhUkRmSWVyMlNhWHI1eTBOUndYZktRZTNxYmRMbWVD?=
 =?utf-8?B?SUlvcU1BeTNCZFZTU0FMdUYwT0NxTTE0TUIzRm1qUEpkbHJGNmpxaHdMd3hu?=
 =?utf-8?B?VlNRdG9GaXovandIM3l5bHBPNmlRMXpPcmJQemxITkVwT3pnQUlITmdoc0Zm?=
 =?utf-8?B?MDQrcE5oR24xVWhKb3V2dWNYY3pxSW5DQklEaUVlOTBzMHdZMHJXWExBMzJ2?=
 =?utf-8?B?R3BzeG5jd1krdWJBc1VZdEdwRE5teGtjT1MyV04rMTl2WENDZnVJcmN5L0Fh?=
 =?utf-8?B?bmRMYmtNQ1hxVEpUeG1zaHluU3MvUG5FcXhsRHVVSmJUeERrNTRlUWpKZ3BU?=
 =?utf-8?B?SGY1SmxPSFk0bXZza2lLNWpEaVVXMXY5aXZPeWMrSFQ2dTZPclZZTm9iNFh6?=
 =?utf-8?B?dmIwRlVYS0dHeVByTkVqSGlIYUR5MVdNYzg5aGh2bmo4YjBmZlhmNEZTd1pJ?=
 =?utf-8?B?eFJsamhVVklYM3hpcnphQzAvNDRNWXlVeTJzS0RTMXBlSXlzNXFydExPU2Jm?=
 =?utf-8?B?a0V3eCtzZDd0bkZJU1Y0VEJVN2phdW9JTitDcFpGUGtkL1hSeDluak5ycUxK?=
 =?utf-8?B?WVRXR2s5LzF6VVRibTYwZmJrUnMrMmdiRlVPaHFJMlJkZjVMaWdMOVVzTnBz?=
 =?utf-8?B?TTZ1dFhuOWF0RW1hbFFTRkRpdU5qNGpCZFA3M2d2OEQ2OU0rRksvTzVHTXVM?=
 =?utf-8?Q?qu2o1F0RjZDliytwT9N+pdxZn?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54edde8f-47b5-47bf-fb6c-08dd75c30103
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 10:57:35.3888
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VjX8mPo8fXkGObCvmyx7OD61AltwSwPLD/RWF22VIP+3OyOGLsjD+LjHum3mz2sI0Uda9+JVLzNmroH3Eg3sbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8493
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_035737_989706_44E7A082 
X-CRM114-Status: GOOD (  11.35  )
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

Reserve 1MB of DDR memory region due to EdgeLock Enclave's hardware
limitation restricting access to DDR addresses from 0x80000000
to 0xafffffff.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
index 290a49bea2f7..10aaf02f8ea7 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 /*
- * Copyright 2021 NXP
+ * Copyright 2021, 2025 NXP
  */
 
 /dts-v1/;
@@ -37,6 +37,12 @@ linux,cma {
 			linux,cma-default;
 		};
 
+		ele_reserved: memory@90000000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x90000000 0 0x100000>;
+			no-map;
+		};
+
 		m33_reserved: noncacheable-section@a8600000 {
 			reg = <0 0xa8600000 0 0x1000000>;
 			no-map;
@@ -259,6 +265,10 @@ &usdhc0 {
 	status = "okay";
 };
 
+&hsm0 {
+	memory-region = <&ele_reserved>;
+};
+
 &fec {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&pinctrl_enet>;

-- 
2.43.0


