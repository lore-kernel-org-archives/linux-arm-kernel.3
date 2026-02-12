Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74610EB4912
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 11:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OlRwRACaPPkkoMPD6wPA9vT8+2+bVAuJc5ucTKvXZDE=; b=G3QevFAQazVRxnSK8dg5rGlWzD
	UK0P/gpG+/Hc05cCwBp/RxHMC6rJ6/WJQLNlXIqCL5mew9i3b76vu2obTd30/kjUiMadW3FrK0moR
	F+VMBPPgnNkNf4ZtZqdDw9+KunRHR8Th46JRe3DNsR6X9zPUsMq4j6M4ECCqj48dWX/ATARxMDd3x
	OQU38QjqrAxk7Y2mw9L7q/jxMAKEEDOuyeVILIniCZP8O26PHyZnZtbu5fSijvEfdYv5yHqK+RfcZ
	Z5yhDKZBkAEtHBQ2I9KeyBi/0sQRaTkbUfEeyhIZEKplEXlNS4x7ByQEnXwCb2riKPYMsFpzledXL
	VHPMDAHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqVAG-000000021ll-0q7w;
	Thu, 12 Feb 2026 11:47:20 +0000
Received: from mail-francecentralazon11023129.outbound.protection.outlook.com ([40.107.162.129] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqVAD-000000021iU-17Zi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 11:47:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O74g4KhiZ35tV9sU1+E8b0aueC+Bv28+BspY5mUKsTVapmLogkLED50gEWsl/5CObCbi+vlZZSaMkLv5/KEJ6+cE5SGyDHmZT7ISsFAE7qbGQJYgSH8Heb4QjesozB9TCIesOSewk95LbqAe1aUL5Aa0hcuFC1m2kOIyEZJVBSk1kzUINvPAeNV71wB7SilOuymlFmwC12tYvgjnWheg0QU8BWH4X+QU99hn1xyCfjDX4FJhS0ZWKCpamaA1lN7GjQvm3S+Agm0tzRaY0o8DppwlOIl9i9FBY07TlWdlAA/hC3jCe8WdQZ6blmFI7jCUU8QjPnoWYIHZuYyjCNPzCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OlRwRACaPPkkoMPD6wPA9vT8+2+bVAuJc5ucTKvXZDE=;
 b=ibikVCcaWh3i/l6FkE/G4czZT8Tzh1aEzR1Du6hRJulJvVHfwXyANU5qKFlqsTWlps80wgrT/7bY9RxnupmpyNGadGHyeSrRtV9pCuPP9Yj1l7kko4dd/6IJ1UN/ppiSAo+rU/KKGoVyw8ll9k3d73O9cj8AseSt3A8Rei8OGob8Gc+LKuwj2/zK8ilZzkMBLyVJ+D9rJWrMTwb+33Ra8gSFYNmZxZ6LmBZSxEgdi6VD729lkF3IuNdP31DnOqxTBdaH9jWuNDQaMBvt9Gm6RHRGOWcZEMV6feUQacSvSyCiZixFct1ZheZT+fI9JcX5fU3bHgrGaqinbCmLSMcbAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gocontroll.com; dmarc=pass action=none
 header.from=gocontroll.com; dkim=pass header.d=gocontroll.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gocontrollcom.onmicrosoft.com; s=selector1-gocontrollcom-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OlRwRACaPPkkoMPD6wPA9vT8+2+bVAuJc5ucTKvXZDE=;
 b=MSInMa4yx9zE2xLv2TeQ8bCejVzx4CAY13qtlpa/W4b8O0Qw1NPjI2pPyVKMI40+shvDEjFdDO+t6sgAuwsIcmtRR1fpcbQr4c5Yg/D/WXtfHGlRAt4N5k5INvM6nUxzxOpFrFH3OaGH690sx2E4FoZyTw1ASPRyksrAJkXhWVZLgQkkc6RA8Dmt9J9d3GtQYOpDwGjEOvuS2SS0M3XPFn7RC5HPHDB53/OxJkrB0308fHKt1r6bNXu6/G2XaSaAX/ZDeCw9WkGHPi4T9+KY2loKwQ90Q13c0NMbaKzvUpIeZgSlnEE6vrlPcUd5iIW9zQVqA76Yk2UoO7nsAK9wbg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gocontroll.com;
Received: from AMBPR04MB11741.eurprd04.prod.outlook.com (2603:10a6:20b:6f3::7)
 by AM9PR04MB8811.eurprd04.prod.outlook.com (2603:10a6:20b:40a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 11:47:10 +0000
Received: from AMBPR04MB11741.eurprd04.prod.outlook.com
 ([fe80::ee70:7a62:e9f:12b7]) by AMBPR04MB11741.eurprd04.prod.outlook.com
 ([fe80::ee70:7a62:e9f:12b7%7]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 11:47:10 +0000
Message-ID: <b6afd8f7-f42f-4f21-b0d7-f270fc6fe5ef@gocontroll.com>
Date: Thu, 12 Feb 2026 12:47:04 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/5] dt-bindings: arm: fsl: Add GOcontroll Moduline
 IV/Mini
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Conor Dooley <conor.dooley@microchip.com>
References: <20260210-mini_iv-v7-0-a3ad8e7ddf0d@gocontroll.com>
 <20260210-mini_iv-v7-1-a3ad8e7ddf0d@gocontroll.com>
Content-Language: en-US
From: Maud Spierings <maudspierings@gocontroll.com>
In-Reply-To: <20260210-mini_iv-v7-1-a3ad8e7ddf0d@gocontroll.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR02CA0151.eurprd02.prod.outlook.com
 (2603:10a6:20b:28d::18) To AMBPR04MB11741.eurprd04.prod.outlook.com
 (2603:10a6:20b:6f3::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBPR04MB11741:EE_|AM9PR04MB8811:EE_
X-MS-Office365-Filtering-Correlation-Id: 30248093-4cd3-44b6-a3cd-08de6a2c74c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|10070799003|366016|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VUtSZ2ZFbEFMK3ExalZwbDdHY2hzeitoOHJWcTUvMUdxYWpIZ3FpK2Rob0Zr?=
 =?utf-8?B?MkFDekVrUjA3SS9nYkdhR3lWUkE2aWt5ZDFsREt2aHQrakVVRmdMOWh1SDgy?=
 =?utf-8?B?RHo5UXU4VWgrUzNtekhIUWFua1Yxa24raUxiQll3OWpDSFFFY294QVV4YVk4?=
 =?utf-8?B?enJwNVNpQ1BpYWhFdDY5VElBRVJwdS84R1hlV2Q5YzhXNnRYbC9NeDdhVkw0?=
 =?utf-8?B?SmM0RWgyWWVTZE5jQ0dyZkphL3pEN1dheUp4R0NxNU1rNGVzaVU1TGU0WGdm?=
 =?utf-8?B?VmhFR3M3UWVWaFkrZFh2S09PaE1BVFl6aURkY1BRZDFBejRRUjlpT0NtRWxo?=
 =?utf-8?B?ckdjV2VST1BqMEQwdmp6dXVyU2tLNFRRYmNyWG9xcVZMNmdyT1FBL2dwMTRu?=
 =?utf-8?B?bDZIWmlVSnIrdnRZRmdiaENuMkhaVGVMN0FxOWIvS3FURElScW1EYkh4UGM1?=
 =?utf-8?B?MjJuRHkzS2FiQkxaK0srVy9LV3d4VEl0TUJ2ZGRjSmNtMHYvQW9NWjZOMmhE?=
 =?utf-8?B?Nm1sd213NFFsb2tuNHl4SFRUZVA2Z0xBbmlidEhmaWw2c3RZc3Ywb2VxQ0Rm?=
 =?utf-8?B?ZC9nam5DcktEbHh5VXk5OVNGK0RWbTRPMzRxblJ4QVcyVGFpVUg2MGdGTlU3?=
 =?utf-8?B?Q0oyUlNqUmpvbEY5dCtWL2tibHFCWk1QQ0FCLzRFN0xGVGlrVG1XU1ROQThO?=
 =?utf-8?B?MTArSE01QzNWQ3RGbUtzN1FQdDR0Z2VpNm5ORldxZk9Zak1kUi90Vlc2QXpE?=
 =?utf-8?B?bWhwMkFPUURNWHBZRExjT04yZU9wM2kyakUrMk01c3pCVDFUeUdLOFdXVTJG?=
 =?utf-8?B?dTJibDhpb0NYS2NUZXh3Y2NjMmhtNmtHeUw5TW50b0g5RlV5U3BnaEVIMXZF?=
 =?utf-8?B?aGo4VW9JQzJmRkhWNjdaTUhaVmdFSXpVK09MWFRJRXhsOUo1TUY4SXRRUlQ5?=
 =?utf-8?B?bDBqbndqRitQM0I5L1RGanBPVDNFb01qU3AveXI2UWFEY0NJVUJHQ0xHTHB0?=
 =?utf-8?B?Q1d5SHUybkJRd1RMdkN3TXdPQVN2SDVmbk81Zk95NC9aejVxdzN4dW1LNWpV?=
 =?utf-8?B?LzYva2hDVE9KdTNVWEw5SlJFS0RQTVZGaWF5R1Q3WEQ4aXd0V3FOWkhGdUtp?=
 =?utf-8?B?L0NHOFNoVDN6a3RrNDZyWUE4TGhWRnpZbG1DdDROR1Iyb1hBUG5Udk5GUnZI?=
 =?utf-8?B?YUhJV3JqSnJPVFRqcXJDWWNYVGJXVWdKTkFpTUw2RW4zaTV3Q0tXMmI2Snlm?=
 =?utf-8?B?emQzL0RzczVGakwwTktZRWZMQnJJUSswL2JCbUpxVFZpTy9SNGNxRVpmUjRG?=
 =?utf-8?B?bWJ3cW10WkpZUGZkRk95MGxxMXNBQUJsS3pRNXVwT0dWSENoWGhtMmIyRGVt?=
 =?utf-8?B?amtPTTFBZVZxUE1CaWVFeG0xdEwvcVpVWmozMDlTdENiN3Y1WDBaMjBmeWZo?=
 =?utf-8?B?TTdYZVlkSmM5TThWQUsybC9ZckpDMVh3NjFZOGMxVVQvRnk2MFJEMmNDdW5V?=
 =?utf-8?B?R2x3YzBBTVZCbnlvMnJKSjVKWlNOWWo0bWlOYWM3aWRBRGEvY3F0dVZMeG1G?=
 =?utf-8?B?bHJ6bm5wR3FvdU5UeHFGV2Y3bkNZR3dTMGpTZG5lSmxGemVodTZHL0NXZnA5?=
 =?utf-8?B?cmtreXE3eVpXcVBLcEhuMjB2eHR1TzRtSGNVYnNUZGxMNGo2VDg1MVVaRUxa?=
 =?utf-8?B?d3BzcWNlU1RjZDNUV2R0ODUyQnNVUW1aQ3lFTFZMUG5BOWtIeno3VGhqY3RG?=
 =?utf-8?B?b0pESkJNUjJtdUIwajZoSVlqcjJlUWl0SGFSYlpyaXVDOEkyN2J6ZlpaZ20y?=
 =?utf-8?B?SHk2bWwrdm9USFJGNWFRRTNVRWorUHhIbUJTVTVBdER4Z1B1SnhBL1F6clNK?=
 =?utf-8?B?bmtTRnh1NjVMU29oQ0VPelRXWnpJYS9IL2VFc2dHUnQ0VEI4UWJFb25lZmdU?=
 =?utf-8?B?RzlrMmlOeSszYjJSYlVHdVBlWk9zK2xEYzR4dDRBNW0wSFBvZVBMUVdCQ1VH?=
 =?utf-8?B?bndGNWI5QmtTa0lmRkJDSjZNQkl0UkppTVpSTGp5ZHZFZWFlYjdPRFhVaVRW?=
 =?utf-8?B?RlFMTVd6ekZTcld3VmlDa0lvRmoxaHZQOWJQODdiQ3cwQUM2dGd6eWJvZkZm?=
 =?utf-8?B?dUpwa3l4UENhd1dmOE5JYi9rbEsrTHhSSXZRSi95Sk5LNHFlS1JOYmY3YU9I?=
 =?utf-8?B?cnc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR04MB11741.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(10070799003)(366016)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M292WjdPNHZTTXdVbjNnbnJ6R0NtRjBJb2NrbmRaUEM3SVZEM1RmMCtsQUpB?=
 =?utf-8?B?YnVNam9jMjlxeldNdG4vcTFsUUFtYkRqK1Nmai9PSTVMenJrRW5CVDRtSllH?=
 =?utf-8?B?UXNKTWhDUWQ0YVprSmhlWG9yc2duWThQbU5jYStHMUtSRTcwd1d5Z2dNVHZC?=
 =?utf-8?B?V0pXZDJYZUR3b01LQkhJMmdFd0l5ZjQ2QjI5R3hVVlBCMlhVSTdhYno3UDJC?=
 =?utf-8?B?QU9DVm1lMW1MZ0NuZnFwN2x1ZHRiaG9vaFRrZTZFVGgyUGdUaGM1MkNpMHhq?=
 =?utf-8?B?TlRiRytTemJvYUZaQlJYQ1JkRFpJTksxVFlyUXZrRUxNQ0k0Mml6MklnbURS?=
 =?utf-8?B?NVpXUmNTc2VhVzN0NUV0NkxCcVlhbXRPYXlmM2dJN0F0SXhpTE9xOE8wQjVj?=
 =?utf-8?B?UGQwbklZdUE2SEtOVkhXeHJ4MVh1akVrTGlobVJUNk0xV1dBUlRTUVJ0aGpU?=
 =?utf-8?B?bHc5OWFMQzVjTXBtZXVucFFrTnFKdGZLUUx2emNhWEVVaTJNMk84cGR4clJ1?=
 =?utf-8?B?OGdLdWEwMU0zUUhOZUMrZ3pSOTRXd2NMeFowdy8zekpBYTViYzhTM1hLeUlo?=
 =?utf-8?B?NnYvb1dEQVBmam1nSHZXaVExTVljM0xRZG13RTBrY2NqUVkyY0w3c0wzdUs3?=
 =?utf-8?B?VkRoVjBaQitWMVUxcjl4M3dKQlJadFJ2UEZiZHlteFNzeEJhZlNPdXZ1ZHlS?=
 =?utf-8?B?M2gxZ3RJazlTMStJTDRwZUdyN2RCWGxwZEJabWJ5TGIyRnJCL0hsb3dxZ3Jm?=
 =?utf-8?B?ZmROZGJ2aWdYUHFqOWVpUDlqOG1CK0UvOUxZcXZQZWx3a1lieGtWVWtDSlow?=
 =?utf-8?B?QmFWN1J3ZXZQSzJUd2NxR2g1cU5PNWhIT3ZvL3FDb1J4MEhGbjlSdGFMbkRQ?=
 =?utf-8?B?dmVDMW9IZTZPSS96amk1QUg1cXV0aDJpYWdHTW9OMjYvNGsxbjJnZVBUVUMw?=
 =?utf-8?B?SXkxMUlUZENRVXZ2dVdTVG0xaHlHQUNNd2phR1k1Z2kzNk91b0tLUlE2Nyt5?=
 =?utf-8?B?OVV4M0szN0NHdm9XSWdORFNnWjJKYnBzU2VoVHVXNVVJYkxtbkNRL3FjcE1Z?=
 =?utf-8?B?ZFJ4dVppTnZ6NkZXcVREYVliL00yaHFsZHI3K3N2YTRrQjBQenF6STFpSjRJ?=
 =?utf-8?B?YW9YZmtmeWpOMzJCZW90V2NMNHE2bVJiSVF4cU5KUjZacGdRcEYzV3Q0ZlZZ?=
 =?utf-8?B?WEprcCs2U0tySEJxQkI3L2hEb3dpL0FnODduMTBlMldoVXR4WktRQXdjNUdC?=
 =?utf-8?B?a3FtVjVtY0tzZTFRaVdPMnhzMFdRYkpzOHBjcVRZZ3o3ZWJqRXdteGtsN0RU?=
 =?utf-8?B?YkRBUmw1R3Y2VXMvQXFiWURHSHhaczkwUGZQbzI0RjcxOHN4NzI1REs2TzEr?=
 =?utf-8?B?Ym9RbWZRN3k1NnlRcm5xR1NFa0Y0VTduZENhM3k3UjMyaU9vWm1jMzlnM21T?=
 =?utf-8?B?am9HSnRodGpQT3RReFdMMmZ5cERoZk1EMUxJMUVpdjROdW5IbGZMcDhUTi8w?=
 =?utf-8?B?ODdReDFVOEZZSXlHd0Iyd250VDlvTHhOaXBpTWhEMTJQZllzY3IrSlVETTZn?=
 =?utf-8?B?em5nNjVWWWRnYjY2bUdwR1J2N1o2Z3g2bjRHMi9WbHpVRmR0ZU44eS9BRm1m?=
 =?utf-8?B?RHBOVkh5UmkyUVJOT0lldVdxRm9lL3V4WmhoelpuSmk2cklqY25SUVFJQVFS?=
 =?utf-8?B?TEVaSHRvM3N1UlF4NUl5OVhlekI4TFRaQXZTcWptR0s1WWl6SjlYSUF3Zklj?=
 =?utf-8?B?clJzblp6cGoxdTFHTVNnVGpnUzB1dlZENFpHTkI3MFkrbUF1MnNTME1FQm84?=
 =?utf-8?B?T2EzTDNoaUJUZTV2dDcxbXBQaFI0eTdNcUlOVFVXK2YzVSsrSVVva3hzelQr?=
 =?utf-8?B?R3BsSjhvVWdrWUdaL2RqK3RhWFZvbjBXVm9Dd3pPeEYrWENIanViSkQybVB2?=
 =?utf-8?B?eXkrZXplaUw3YTRLdGpIa2dlMG9nd0ltZ25PR2cyZjR1YjBzMmlBQ3dSSVRO?=
 =?utf-8?B?NFYzN3pWYXV5ZVphaXI4SDR2TWYzUWg1eWVsZk4rdTloOVQ5QTVrdG40TlVQ?=
 =?utf-8?B?cTc0V01BM1lRbDZ6cEZRd2FRR29wSndldDBrS2NHZ1JUWjBjVktrUStHT0kw?=
 =?utf-8?B?MlNMN2d2aVYwVStQRyszQWJadUUwRTJLT1dsWVYyalorSUw0eTZyK0krOWlG?=
 =?utf-8?B?M21NUTVBZmlyTkM4Uk96MEppUXhZS1hxZEhRWVhrY21pNzJ1YlZ6TEtXaXA5?=
 =?utf-8?B?MjJ2Sy9FRFZWWFZFZ3FZY1dLQ2Z6RlZMSVVtWWhBNnNpNTI3RnJwOEtETWZF?=
 =?utf-8?B?dVBDTWN3d0dWeUNvQ3BJOGV4WXVjbnJxVTArZjhIN2lvWDM0Tk1lVTRjcTUw?=
 =?utf-8?Q?ZedIG9ZBWzNUL5hEZmxbtZQ7xH6GhkNvn5nQlUdE4NzpB?=
X-MS-Exchange-AntiSpam-MessageData-1: dIedvNN5QwBzfoLGGzIKzXqXXKeoPPI+dLk=
X-OriginatorOrg: gocontroll.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30248093-4cd3-44b6-a3cd-08de6a2c74c9
X-MS-Exchange-CrossTenant-AuthSource: AMBPR04MB11741.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 11:47:10.5506
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4c8512ff-bac0-4d26-919a-ee6a4cecfc9d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zTl+qdoaoqgU2Muv3RQl/BOrNU/8PbhFEeQGehj0LGe+g4fnhqgV3/9hFnaLdv71bngDmu6fnG9qhZlVvi93+xDLGvRKBlZdFVFYb9k8+Mw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8811
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_034717_325922_563251C4 
X-CRM114-Status: GOOD (  13.44  )
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

On 2/10/26 09:45, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maudspierings@gocontroll.com>
> 
> Document the compatible strings for the Moduline IV and Mini.
> Also add a compatible for the Ka-Ro Electronics TX8M-1610 SoM that they
> are based on.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> ---
>   Documentation/devicetree/bindings/arm/fsl.yaml | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
> index 5716d701292c..c76c1731b4f7 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> @@ -996,6 +996,14 @@ properties:
>             - const: engicam,icore-mx8mm             # i.MX8MM Engicam i.Core MX8M Mini SoM
>             - const: fsl,imx8mm
>   
> +      - description: Ka-Ro Electronics TX8M-1610 based boards
> +        items:
> +          - enum:
> +              - gocontroll,moduline-iv-306-d
> +              - gocontroll,moduline-mini-111
> +          - const: karo,imx8mm-tx8m-1610

I just realised that I did karo,tx8p-ml81 for the imx8mp module, 
doubting if I should change this to karo,tx8m-1610.

This inconsistency is now bothering me.

Kind regards,
Maud

> +          - const: fsl,imx8mm
> +
>         - description: Kontron BL i.MX8MM (N801X S) Board
>           items:
>             - const: kontron,imx8mm-bl
> 


