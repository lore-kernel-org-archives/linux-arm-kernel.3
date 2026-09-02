Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D822DC624D4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 19:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GVAyzHoM+AO12rWIn7UT2ab9gSmhn0JgqtW9SkvHtBY=; b=iQVgV6PTxWCR9qejYkHUu5vc4+
	f4R4JKfxMBJ/uQHsLd/pR+L+NrYqNhk21ZLF3eEl/4RNgwdKPse3+e7PqbOkz3hMlp+HcP2DMvwmG
	m6xpcd7Wfx64mUaXrnuOE7XqsDKbVMzpjo/n5FgHbFtT7IEzDHWMmRcFDrHeKYhjWv4FiqWV+B+MO
	e9SvdLLpeD5z6IiACnXbsi5ReSIZTmpwPoPwfQs9km9gZHq9wB3u2XYB7dz4vO4SsUvYhx9iIeajB
	Fnr5k+bbG4aiNmKZm3SFyZ2WiSmEJHYtfHCQt+LEpi0AODejMo8LQ+6tpVpAes3pg9ttoedbhubg2
	RMdaK9RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qW7-0000000Fghe-1Ye5;
	Wed, 02 Sep 2026 19:21:03 +0000
Received: from mail-westeuropeazon11010021.outbound.protection.outlook.com ([52.101.69.21] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qW4-0000000FghA-3iIE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 19:21:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pC1hB7ss4A813+tkNEHjPKwnWKZWOP4ElFMTKzURBnAL57WjKpt3mFQEsbOOdk+5YwpKtp7EcblYPvH/rZsNGIbz+Bc4aWSCjn1xH5k6QWY5PVAdjDrQRgTdYqFKJOxpnhKfTQ2vQbz+HxZ+etcXkD4GlFy432fuitqYKAwMvBPtoYD9XQ2bBIUVv+HIDbAVmhoBFCrlpr9VDjy2qHZ+XWAENJTji924978E/zUooiGBdGwukasDmJdkZ4eEP7E/DkS5Th+KwjjjiUaxebKRTItn8qRDwnWmhA3hIKUJ+VeAF0aS+XEQC2LRCxfeHnjJ9tBcR5hWJNVCoCLe0BjmQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GVAyzHoM+AO12rWIn7UT2ab9gSmhn0JgqtW9SkvHtBY=;
 b=fgjS/Df0i/uJzd2+F+jWa4imKrCo7vIFmC/xy/CWXU40iw7un9aYHqFjUvrteaTL1Kj4pEvSWEdhkhFT+mftITprTHKkJaRJdF6npxTXbu+JfmNKnH9KxK1camTCQLPNDXe+8uhoc/VsgPQF793plt7Qa8Njmc2M0NWEqGXQbnvs6kBrALMeWdvWvDgakodRLWCyk0Zrd8EF8EPr5nToJdWBVWHiO0fau1MTzZPCoKGRZBkX5EVziWe1/ltywG6WluwzpiB57+sYHs3dYhK8LrNQJ4wfDbRUIbGJYWjqAi5NTjZrfrgU2o1kl90+0oJ4om4DrQlDj1lOgTBhO9RwAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GVAyzHoM+AO12rWIn7UT2ab9gSmhn0JgqtW9SkvHtBY=;
 b=DLHqcUjCpjUyxL112nHydJBVgvPSt+ePh1vqwa5of4uW06TGM3AiIsUD84ebFqDqU5JrxS5n6Yp746V/uabp4HzoymKADi9p6izSUedIfBlTpGhIsR+WHkrtI1XYAQOjCxWBX7F3oVJ+sEBkPWQUS62LX5RrF9+5RAbP49yliacGtD/YtM6wOf6HHnccUihw/vU3WJG0uFVS8MtnMFsC2sBZzVVag882bzwogNWdsTc89ooO2xwvHfPOZOGq9ZNpuXx5jhIOcoewux2b8qfZLMB8Z/9VPOhbkqJPwt6hLSB9W1j4XpirQGC2ogbFxLMU00nYO+pDQDzxtRu1sbe0Jg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB8947.eurprd04.prod.outlook.com (2603:10a6:20b:42e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 19:20:56 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 19:20:56 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Frank Li <Frank.Li@nxp.com>
Subject: Re: (subset) [PATCH 1/2] ARM: dts: nxp: imx: Replace spaces indentation with tabs
Date: Wed,  2 Sep 2026 15:20:49 -0400
Message-ID: <178837680371.2089233.12159417710428109455.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260829194022.107807-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260829194022.107807-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CY8PR12CA0004.namprd12.prod.outlook.com
 (2603:10b6:930:4e::7) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB8947:EE_
X-MS-Office365-Filtering-Correlation-Id: 601f67bc-a10f-4653-7bdf-08df09274fed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|19092799006|23010399003|366016|22082099003|56012099006|10067099003|11063799006|18002099003|921020;
X-Microsoft-Antispam-Message-Info: ZDcFu/ewAuKv3ISJ3HTmu2dEFtkEbqRCame0/1geJtZ3WG/HII34wn5XsK1LLvJ0jlWp4NzsHuz/BjEqdRVdL1Bv0nDWXxSlfW3iZ4U9ApY7vPBXb2kXg9YuUM+NITTQQ0r+x0YYvKU/PEulKiFppR+/dm9w7/CNv4n+1OUmTSggGRydjrnavSYWTFX6xqDqQlX0bFffkVaAYZdSAyVMngP5g9lqS2p0zKdNq2sgFdye/ZC0u3J9tOcTItgMoSFDis7tn9eRDzP34RGFdURr7KtPHT1r9DO7qpSBN0TPranvaZwFqfkRbsbjTNdtG3oMYdPzBtbORVFbiu9QU8dUYdfdGTMRtS1zvuVZsc/YASczEhernz6lg/+fxDCz+d07U+FnQJLbA1rXs1fbJlkXlxjYVs50sJtVK0qUo8G3G8vbBGEiJl1Dp7IGIEsn65QaNYZq7PmsFm9lplgPTzvYWQLUnoHHgckV7efYeLtj4oEQx1xxvp8tXR7asPcSgE0lcfa8ntde7hGp/gYvtX78sAWAGxxynHbnrUkBZIgKS+WUT3702cI0T2yuLA6yD4kcq+osJs2L/AekFbY5lG3p3j6rXn8FA+BPHtFdMkVrCHiAmvKwBNh0xQ2nR1NRGdIf5i5rCBStq5mXe0Fn0Oij7lz3HUMnxWUmeAq0JjzPI9KaDbO8Z3JyeTTiwvDLBwQ7hNKJ7mkVF9c0raDINiKKzw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(19092799006)(23010399003)(366016)(22082099003)(56012099006)(10067099003)(11063799006)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?LzRoWGV6Wmdpb0VFeURhNVhoUVhhSXJqZ1lPM0FHK3o2MDVVR1prUU5Bcmwy?=
 =?utf-8?B?SXRoRGI2dlY0aklyWEphQWtWSis3b2IrZ2wwK0dsQjdwM00vcWNZSXNVSzFs?=
 =?utf-8?B?elFrcXZNSk13ZlJldk9jL3dBVWM5YnZBRklLZEZJdXpGUmVRcWJPeE5ZVG1N?=
 =?utf-8?B?N1BsUUlTQk1UbThBcnpKcmR1cndTSTJkK2tqbVVVOW5NVjl1VGFVWlIwdUlh?=
 =?utf-8?B?ZVAxRTc3OC9EL0VwLzBwd0loMXc4aWY3R3kvcm1HNFlWd21VTk5uVmpDNXRW?=
 =?utf-8?B?YnpFMlAxbFc2WXdZREFoY1VETnZJaHJ5Sk5OU2k3dkdtRGR1Rkd4NUVMWkFK?=
 =?utf-8?B?NUZteHY4MFZaK0xCYTJBZlRNY0ZZWmY5bk9OOWFVNFR2azlwdHZyTTlJSVlT?=
 =?utf-8?B?THFyM2pxdHd5YnRIT3granhlSEJEOHNpWWg3WDFWSjQ3Vk5XUG1DaHpZSGlW?=
 =?utf-8?B?NGFqZDFDempRR0xtRExJdElxQkl5dElsVytTTlJKd2YzalgramVWZ0RzTmQr?=
 =?utf-8?B?Zit1eWU2WE9LNE5nZ3V0OFRaNjZEQ3poRVNQellmMzhBRlJQcy9XOWNpYVlQ?=
 =?utf-8?B?eWpHdDhOSzVVd2NVcFF2MktuM3l1enVVanpJRFcza3JpSEt0ckZIZmxUaUda?=
 =?utf-8?B?bzhEVEFKcUVlY3BWSkxDaUtGT3UxQjBTSmxVbllZdnVrTXpLVjEwTDZwUzl0?=
 =?utf-8?B?SnREK0ZyNWJncmpDSGNHRzNKQ3JhaWNvVEJGbWM4V3dDdVJGTHF0ZUNReVdm?=
 =?utf-8?B?YUFpVStPSkhUOVYyNndYUUhlaytKNU52WHcySDJLdnJkbitveGVLdFUxMGRK?=
 =?utf-8?B?bGdCZUNLM0ZCT0pndnFlQ05nRk5hanVHdkdob3h6Y2svVi9NWEx2YjJ1dnBR?=
 =?utf-8?B?NUZNamw3NENGYTlTNzlkOE10ZW5mbVpsaVM2S1h0WmpZRTVrVFozcVpJTWNy?=
 =?utf-8?B?WnlwZTkwQ3pUbVZZaFgyYTlabG51WjNqL09QRnpQaVBtYi9pMm9CamZ3bGF4?=
 =?utf-8?B?UlBrR3hCUnFWcWdueHBja0lKQ2FOMjdnTnRlN3pITCtQMkluWXJRWm4xMGxC?=
 =?utf-8?B?MlB4MGc4eCtzTTNIY0s3RXp3OHlaSWllVjRqRHF2dHFlU3o5QXVmd3Q5T0NR?=
 =?utf-8?B?bjZnVmJFTFdyOC90V3Izb3h5TFlTb0gxUVYzR2M1andCOVkzK3BWN0NXKzR6?=
 =?utf-8?B?RHc2aCtuSk40MkJ6blk3WjJRV3ltb0t1UkUrL2pXOGFxK1VpZm9ockdEd0lV?=
 =?utf-8?B?ME4wTjlNZEJTcVhVTEUrMkJjOTZsd2FoRkJ0TW9kMWh1NVlubGxwWGJTOEhw?=
 =?utf-8?B?azVvemlHOS9lMXdRNC9zMVFidFBhUVJrYjNxVmtGa1daNlpYanBIYXlPQlpm?=
 =?utf-8?B?S3ZlSFhaaXpKRjdTUFFDRjgrS2NuRDNTK2laYjVwcVpaQWdJcHJZVktuMWhL?=
 =?utf-8?B?eGhsWHVqV2RuQUVmbytZRExnY0NYYUxjYVl2Wk5PU0dlcklaMjNLWFVESWZk?=
 =?utf-8?B?WnBicUtlMDBSaFRkd1JzYjd2SzBodVUvVTZqK0hJWmgzVUtuUzB5UG8rczIr?=
 =?utf-8?B?WWxoS0VMWFhOVUJ1SjdpV2JLM25Ha3NSbmlvWVM2SXdqZ2k4K0wva3FjTHBm?=
 =?utf-8?B?NWQ4Y3FkLzl1ZXdIT0VSbGRudjF3ZFg3SnhBeDVENjV5cnV6elZzenNUZ3lo?=
 =?utf-8?B?bnIySEh1RWg5YkFYS2xhbFFwUFBmMXh0dzNKMDI5MTAvYUY1cDIyMFBhbXVt?=
 =?utf-8?B?cVdVM3JmaXphRm10UW5YdXZnR3Rodjc3N0lFdlVPQTB1MVR4VEhac2lCZDFE?=
 =?utf-8?B?S3ZOcTVtSjl2Z2FqYzEvTTM5Q1pSZXlDOHdIdm9DalR4MENJbVAwc0xyTjVx?=
 =?utf-8?B?RG91ZlR1M2RzREZtL1hhbnJhWFRheDN5cHdjaklxcU1FMjhYM3U4MkVON2Za?=
 =?utf-8?B?b2N4YnFUbXQ1UHpIV1Q0dDUrcmU1VEhSYXpPOFA0c0lmUjJGejlCK0pwck5h?=
 =?utf-8?B?bXRxdTdCdWVFcUhOd1IvUlFjOXFyY1BYMEh1bVRJSStNQTBGSDJjK2ZKNUw2?=
 =?utf-8?B?aHhHL2tHczFhVVlFaXFXRk9MUy8xMXNPUVdocW0vVnZIQzFqL0VhVUg5YUd0?=
 =?utf-8?B?MkFoTGhZTHRHUVZzK0ZNalN0MTRXV2szc1M4K2gxelE0YmNnSXdoMlIybXFj?=
 =?utf-8?B?WmIwblZycHY1MVB5d3QydHd0RVFxUXBISjBUa2E2dFJvcldMTlJ1SkRqMTBQ?=
 =?utf-8?B?WkdoaUpoNGkyRFJqNHRjWlJqTzUrRkZwYlAwT2RYL0pwTDh2d0tjQnJpTlFW?=
 =?utf-8?B?TFFxYWdEbHVvTHVyRmtRZUxiQ2VqMmNyQjUwbFFXbkhXYytHUTV4bitIUzZr?=
 =?utf-8?Q?kvP0y/I16IDBmkj+diJynhiMA5w6VjjxJLJcO?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 601f67bc-a10f-4653-7bdf-08df09274fed
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 19:20:56.1216
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uXM55/ADaNTTYvikXyS71AQrLYyvh9+6mCjxgnYZGzB4D3ES6415M+EUfcJSRV6tqXut/C4PI0AbHbFWh7Z9O1093LfVRo3BxEXzCA25KwUB1Mi92zdfBw/RxteTgaCU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8947
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_122100_929285_A919929B 
X-CRM114-Status: UNSURE (   8.77  )
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

From: Frank Li <Frank.Li@nxp.com>


On Sat, 29 Aug 2026 21:40:23 +0200, Krzysztof Kozlowski wrote:
> Replace excessive spaces for aligning indentation into tabs.  This will
> be reported by dt-style-check ("[mixed-indent-chars] too many space
> characters in indent (more than 7)").
> 
> Also two GPIO values should be really separate <> entries.
> 
> 
> [...]

Applied, thanks!

[2/2] arm64: dts: imx8mq: Replace spaces indentation with tabs
      commit: cc7fefa70818c7a9fa2cdc5487d9a80d69b1d773

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

