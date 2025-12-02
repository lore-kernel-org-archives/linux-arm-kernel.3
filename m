Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04FEBCFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 10:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mjueNb/9i3zuRHwx03rb3hURMf5aqVnfkr7ISHcUAoY=; b=3R/J7O+ma0LS7V6pdn1uWLbWsS
	aAUe4Vxy2Xk2POMvCJWsKZdWg5Uodep12lplxyDgzgCFbO5IK3NsNfHiop6f+iimD1P7PDBaaT4+D
	UaeB+hiW6J+sdsp8nFagb+lMt2I74BkQHeESiL5g6ZcoJ20r8OkyEKO9CNwpPnNtWvf9ynWRJiXy/
	EeSvNrPavXbnZWqfOSd86koPe5BUvBWHUwANSRVwpYMifr5fLv0dnSplaTWrK6/MXkZGjJS5DtsXq
	aaxUYtYz+w39Idv0mOSgb5g2+HKtRVWcNRTvnIA/NZJ3CnwDCmlkF/swKPzPozUvb4fOJNxAEYBOK
	FK1ltilw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQNqK-00000005H6Q-013B;
	Tue, 02 Dec 2025 10:42:48 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQNqI-00000005H5v-0n5v;
	Tue, 02 Dec 2025 10:42:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WgAGaj34Quyio5W0LeB3fCdHvvcpsinj5rD3db5tuYBbFr1ZPUuNL7JYdSTx/bVqynCtAbig56XrZvR8H4mTT712ZQiibENCNF2Zx4kGZtDhxPnEum8vugauqWh36XqzMfHuSAFSIk6gy2VU2n0bTkbHOEGMJ+GHAV4y0eqIUFNVA8OK2uU4fe99LSmLDahzZX4ZiPAmZxfymx0LPJmu0mN0skd3TOVAILeUYx5t3JAO7fuG7MvsyqtBZOzfpVpEbiNCWESb57YA9zEgnpVCLIYFBo3DYRiVZyUG5EJwgKqznQXIza79qPlUfyTO63ykNy02HCUe31BSjuP/usUK0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mjueNb/9i3zuRHwx03rb3hURMf5aqVnfkr7ISHcUAoY=;
 b=F8yi9K5JkpAKLhNMMo+RHUBnuwr/FMT1TMINL6BjA0zagUaleSHAEsInpaWezkFI+IwxbhC6SAiCBQUGdVkgUr+qecjwz8mCGOZzYgf45XtIwqujnPa0/X8KjtF8J0VyAu6u1l0I6usrbtbqBTAhMy3Xy6WwfLQEwYnO/4LTNCV6CRNrSk1dReqSuOgefpnWBpRCOSCMUjk3J6IHqLlEnSOrV9UlGXC+csyJTYv61ETej3PyAj5tLt+Ysbk7u7Is0fgxqhzGmy35KOR1BKsoh15EkuZSxuGIL0NL22aTs2lwGTjnPk9YhTYSkoEHM4PQ3fzurvIQWNqFaMyXMbop9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mjueNb/9i3zuRHwx03rb3hURMf5aqVnfkr7ISHcUAoY=;
 b=KHTPI44LIEHhnNAvbYcvtW8/Dh0ZTMGpnoXL446ldxXZ4j/UGScTjZGXZo6VCGK3p0r/nBYtbBtsPOAHAnOgy9/LJAAjQLjUNrNh0EDRQuKpB7Tc6KqLAQRLxvSJgC4h2IDfOwNoLPyOvlO9avU6BYhxtUX3TOFKLO2WXDqrvHs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by DU0PR04MB9298.eurprd04.prod.outlook.com (2603:10a6:10:355::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 10:42:39 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 10:42:39 +0000
Message-ID: <50d9a41c-d35b-4489-af1e-a5f7eef303f1@cherry.de>
Date: Tue, 2 Dec 2025 11:41:43 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/9] arm64: dts: rockchip: Enable HDMI output on
 RK3368-Lion-Haikou
To: Heiko Stuebner <heiko@sntech.de>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andy.yan@rock-chips.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, cn.liweihao@gmail.com,
 Heiko Stuebner <heiko.stuebner@cherry.de>
References: <20251021074254.87065-1-heiko@sntech.de>
 <20251021074254.87065-9-heiko@sntech.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251021074254.87065-9-heiko@sntech.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0026.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::11) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|DU0PR04MB9298:EE_
X-MS-Office365-Filtering-Correlation-Id: 25670aad-d317-4616-f5d7-08de318f8393
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cDdISmhzQW1xeXVCRUFJZThEQUZZRFF6U2NQaVRYZlEvMjY4bHQ0QUMvdmVC?=
 =?utf-8?B?b3pPYkZSaTZ2c0ZDbzUvM0RQR21NVnYzV1ZKcm5FdGNhcWNaQnJwVzg4L0Uz?=
 =?utf-8?B?ZlhjTEtGRll3UzJneWFFQUQ4YUtXSzNadzRqZUlrWm5ZTDc4ZzZsSnMyRG9t?=
 =?utf-8?B?ODBnTXJKMlUvaTlkeVdzUTRRSTBndnZ2d1lzT1gyZVkvbzF0WTZQWXk4UHZL?=
 =?utf-8?B?Yk5HOG9tWVdDb0ZTeUF5ZFlkcjBnWGRRQ1NOU2t4M1VKTXNxN3pMeVIxMHZh?=
 =?utf-8?B?NkhPRmFKY2p3eXI2b0FETThoUDdSS204cFdCRjN5TlZhVUhjSkdMZFVrbUVN?=
 =?utf-8?B?dmxXc216RXpCdUlkYjVDc09lY01jdUFPOExpZ3BUTkgrR3Y0NElNcTNZT21v?=
 =?utf-8?B?YTJjaVZPMVh3K1NjTkcyUFVJalNOcWlBQVIyNERBZTV4czVIVUhmbkhrdVI2?=
 =?utf-8?B?WUxYOTJOQStTMlRxaENRVWJxWXZ1dFJRa0R0UzliRTgxMXIrQmlmOHdVU0JO?=
 =?utf-8?B?bVR3ZTBTdUZ6M3YzVGZQdXcrdm9ZMjlEMFJKNXA3SFhDRWJWUEYxYURCWkRm?=
 =?utf-8?B?eVdUZXdZZUltVzQxeGdhMVFHTTI2dkpYdVpURTIvZEtWQTBDa1p4RDZVZmZQ?=
 =?utf-8?B?WE1XaWNucHdXRFpQRXk4K3lCbXhVbUh5a2xVTmNmenlLUDJDMHJYK3ZrUTdT?=
 =?utf-8?B?YWRjQ0VsZ2hIeVNOeElNb3c5My9rSWRLOXg5T1h3TVVqVnFXSVduZU9xNW1a?=
 =?utf-8?B?VmtLVG1CWGZ2ekZKWnhucncxVVhxTGxmVVZCaVJDV3krWlJPa25wQXBtNTlQ?=
 =?utf-8?B?WjZ0RGJYTHJMY2hIY2dyK08xVms2Vm9XbUZ5MFdxT2d4bkcyQkxDRWdWWmJl?=
 =?utf-8?B?cHdza1dsUHc0MjhJdmxYMnBPOGREWTIxZmdUTktqTEdUV1piZEpQeTR3MWhQ?=
 =?utf-8?B?MkpybGxvRVZGYUplekZiL0czdkRUaFpTRVBVVHJDVjZObG5sZmIzb0lyRDI1?=
 =?utf-8?B?UzZMSHJyM3BGN0NrY0lmaVhyNUoxeVYrdWgzMzhWaWdoOG5ZRG82SlpJZTVD?=
 =?utf-8?B?UXVKZnB3SXBUMlBsV0RVT2tFRHNtbkpIQ0R4TUZTUEpoaGZzcmtwZVlmbUlz?=
 =?utf-8?B?dkRWOVhLcUJFSUlMZmtnZnFrYXNHSlNBWGdueGtPV2pQakxDR0loaE1OTEVB?=
 =?utf-8?B?aVNQTCtwaVRDQitsbTFML3hJMFpvUkRwbmN1QS9JRjlHd3Z1U3g3MmdPQVJj?=
 =?utf-8?B?WlNGWmpJWlRXcFZGRlcyNlVwcmhXdFFhd2JOUC9na3BIOWdmVS9BWUZhOXEx?=
 =?utf-8?B?bFNJYmlKQjNsdHlzRW0zUlEzYTR0aHJnZTYxV3BuaGxkbEpNQzBSQ2xoTkI5?=
 =?utf-8?B?ZTFTNmVOcktoWDU4cVowQzNJZnIxVkRXckFTWXArRmRDRG1KbDRqTE8xRnJO?=
 =?utf-8?B?NWQyc3Q1RHlTeFRCSktWTEFHTFBaWW8yMjVteEo1WmR5dWlIUUZRaTlSdVdM?=
 =?utf-8?B?Yk9Od0xKbEdYRUFmcXQyNGNKVGk4cTNYVWlHaCtWUzI2Z2x3WDZsMVB1dFhR?=
 =?utf-8?B?eU9DbzVEbGZheTQ5a09HTko3aWJWSjhWQ1B0N0MyRjViVGZaVFhiL1JLcDFo?=
 =?utf-8?B?YWJVM1NwWExqRG54V1M5LzZ2QThvUmR3ZmFRd2E2TjJsT0RibHpyeXpURm9T?=
 =?utf-8?B?RHhydlRYaGZpU0tpRFFweXZqZHdsRlJxeng3NFZTVjVjc0J0N2tKVnR2ZDI4?=
 =?utf-8?B?Uk5mTVdmdUxDNkRjOXVHV1NuaFgrUzZMd1ZLbERWT2toYVgzbWZBSDlRMkhl?=
 =?utf-8?B?Z21YN21kdjZoaU9QVUtiRHdzSG1rS1JlSEdLakNLV3ZjR2VmK3Z3VUhQRElN?=
 =?utf-8?B?MkVaUkRMbUY4eXdUN0pDbWhzc0M2NnZ4NEh3ZXByaW9HVFVXazIrU2taQlhQ?=
 =?utf-8?Q?0UjCUncFFpxE+k/qUPdCLmHdLXRbdohG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aU9odERIbDNqN25OQ0FCeGt3NHJwWFBsV25TSkNWUHlGNFlBSEgvMnoxV294?=
 =?utf-8?B?cnJZY2pwWEVyMlBmTDlkTTk3NS8vU25qckN6WkJjWW0vRjl4UnJlZ2RMMmUw?=
 =?utf-8?B?WUhTcmNVVUdsVytUVlVZWGlTYklQZlR4Y3Y2M0dhRC9ScnRtYjJUTGw0eE5B?=
 =?utf-8?B?YlRlUWZESlFmK0l3UnpmclpCbHBvU2U2Skt4LzExUk1nekorNFQwMWhqaDhs?=
 =?utf-8?B?SGxtblZiVGpQRjUyc2hDRCs3dTNzTDRiYTA3dmh4SlVuakVuUXpkOVk2eVJS?=
 =?utf-8?B?NVY3a1M0cjZIMjBpeVVqSlpnSmVOeWlza2YwdHV0cTdiRndTNW1ETkkzTmxK?=
 =?utf-8?B?aVhGTVRvQU90c2M5TmJSakNaYUhLOGtHa2FabSt1NjhDV0tKM04xSXd3R2VZ?=
 =?utf-8?B?R1VLdi9ET2tZTXFXSEJVeG1iWkhORTI5Y2Z4QVNrZ01oaFFmK3hOM3hDMnVH?=
 =?utf-8?B?V1drcTZaOU8zNjU1eUYrckV6aFl0d0RmTjRLNC9oMG5tcGNlTG0rYkFKN2ZJ?=
 =?utf-8?B?VTVMYVB1UFJSamxZekVacEw5NDVINjBlR0xBZmxMdXkwZDZVMUJsY3NLbmFN?=
 =?utf-8?B?blZ4WE1rOTBjbWYvbElSZThRczV0UnE0Vk9NazQ2anZYRU11K2Q1Vzl3SzAv?=
 =?utf-8?B?US9oVjAwK3MvQU81MnV0cmlxUnJuY1QweE96WW9LWndLcUh3WTQ1MktsN1VW?=
 =?utf-8?B?dXl3anM3TUJzWmp1SGVZMXM4b2drOFEyWVRrZDV2NElNWnFmSC9OSkR3Ullx?=
 =?utf-8?B?ZkdTRXp6RTNvMnBROHFhMVo5WkwrQjVyZzZTSDFiWFVBc0VoSGp6UzdJKzRl?=
 =?utf-8?B?L1BvKzRwWGRlWk9uM2R0Q0hLUEZGRHhPZUJia0dEMVZWNE85TzFjVzhEVjBv?=
 =?utf-8?B?QmhYWjdGaGhLSlBhbmd3bVFZOWlsanNndUJONWc4eDRPZkJJNlo2OFJJK2VY?=
 =?utf-8?B?aWdqMklZV3hNZ1p0S0lzcS8vUWpuTExqRkZRb2d3U0FvN2hoWm5NazBwdW5I?=
 =?utf-8?B?U0U4WG5FL0djWk5kb0prejZseEkxMU0xSXlhclVqSnpPMjdlYkx1aUR6OWtX?=
 =?utf-8?B?MS9Yd28rU0ZNMHptWnZDRUo5ellPWG1rbHZwU2tSVW0rS2VSOFJUWURJcHV6?=
 =?utf-8?B?SlVUMGxoNkUyWUlzNExvVFlrOFhWVmlSMlRqcTVwV1BOYWRWd3pLT2lBeThX?=
 =?utf-8?B?bXhDRndpM2ZKSHZQZW9oNjI1VFBJL2Y5R3ZwYVZzVUdHQkprWitrS2dPQXBD?=
 =?utf-8?B?bVM2MlR2RnhNRiszOWVBbm43NUtWa3FmaVdzSjZ0NkVpdFFjT0oyV01XY2s5?=
 =?utf-8?B?UUVXVGFad3RwTGU3dlRZRjk5OXhDODI2YnRyUEI3YlJ2bWVQTVFYTHc2N29m?=
 =?utf-8?B?OTM3WWcwcDhBcldsRkJKVEdnZVh0d1JpOXZjSm9EdWEzWHMya2tuRFVmb2ZU?=
 =?utf-8?B?VVBXRzhxT0xDenV0ZlV5QTJSYkZVYVBrdVNnRk5BUU1GT3hmMGVtMWYyR0tU?=
 =?utf-8?B?My9jMUNFdDZuanNhT1VzMjIxZkdsdG1zbjdVTnlPaFljRVh0YXVPTkdveE8z?=
 =?utf-8?B?enk5aytpWmpZd0JSSE1ZNHFENFRDU0dUM291S21oeHlwcVdOUER4RmNkVVA1?=
 =?utf-8?B?cmdLdHFENGZZNmVpUDJnV0hzMnVKNFFXMXErSUlxRHMxREV5UGFCQWJUQUQ3?=
 =?utf-8?B?ZWZ2Um16UTAzdGFoZUFoZlJ6SlE5V25wUDNRb25DbXEwK0tyZTB6VkIzcDMx?=
 =?utf-8?B?dmhYU0pKeVQ5SVkzWlZRMHhSc3F5SUw5bGFEYmJJNUgzb21scmVHSUxxL3RM?=
 =?utf-8?B?Ukxydk9HQ0tTWlJZL0xMTHpVcFhrR3NHakF6aVVBYXBvMFB4UUpFazNPZThq?=
 =?utf-8?B?d1g4bTJtTVQxNlk3ZVBRZ0svci9XdGZTOTBXN2prMDVxTWEzQzZBUlBWenkx?=
 =?utf-8?B?Y3FQazR3TFMrRVZzMjhaR201OTJ0alFXRzBuSWpvWUxjcFN4NUc4THVCTGNl?=
 =?utf-8?B?TllBRUl0Sy9vYmdFUmF0cEQwVFdocm5yNGFTR1kwRnBPYm9ZRGdxMm1kZEp5?=
 =?utf-8?B?RGxuNDNUcUZvU0RGRCtlTGs1TU9Cc0x3aUdqQXpLUlozSWhKWHpFSjF5SFU1?=
 =?utf-8?B?alZCcW5HYURJVGhMNExqa256c2ZtTVpBRGRSWEJKVU5DcDVrT2xvdWxFSk8r?=
 =?utf-8?Q?ijNZoJAPHI3YASR9NHUqOaU=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 25670aad-d317-4616-f5d7-08de318f8393
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 10:42:39.1787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xVak/0z+p94gF9CofcJdkaDpMTQkfyzXhTHDaJGpkj2HntuY0AieU4jdI3ra4tbcHwDa4gwxMtok0PQzvv7wY4ZCIjkdJXqc/XCXI/zg2Zg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9298
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_024246_241595_3441273D 
X-CRM114-Status: GOOD (  13.47  )
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

Hi Heiko,

On 10/21/25 9:42 AM, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
> 
> Enable the VOP and HDMI controller on the Lion-Haikou board.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
> ---
>   .../boot/dts/rockchip/rk3368-lion-haikou.dts   | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3368-lion-haikou.dts b/arch/arm64/boot/dts/rockchip/rk3368-lion-haikou.dts
> index abd1af97456a..a8eb4e9c2778 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3368-lion-haikou.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3368-lion-haikou.dts
> @@ -58,6 +58,16 @@ vcc5v0_otg: regulator-vcc5v0-otg {
>   	};
>   };
>   
> +&display_subsystem {
> +	status = "okay";
> +};
> +
> +&hdmi {
> +	avdd-0v9-supply = <&vdd10_video>;
> +	avdd-1v8-supply = <&vcc18_video>;

After a long night of sleep, I believe this should be specified in 
rk3368-lion.dtsi SoM DTSI and not in rk3368-lion-haikou.dts as it's 
SoM-specific.

Cheers,
Quentin

