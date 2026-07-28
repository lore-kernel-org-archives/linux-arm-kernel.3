Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2CD9C53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 20:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vdI0I1pHIGwg9eA8BqKNZ+cEuN2CvvHvWtPCU8t+kE8=; b=M24kJqFXxDRpxVcrGUUVXZjj5O
	RGpCklhpq+CwNKrdDF+aFh/UIHzOMaFS10TawRLjyWp7Xy862jQh241p0xGslS2zcPmpcUx2Zqf+g
	3oVWMUMm6NTh3Z3lL7xpBb2/LUcwKv7zj/SqwByD2qMpHvujUNZRtRYSK+Wn1YAJ3mKFT2szGJ0tk
	Hn2NVogvAO2Xns0e//hNQwpq3NuzzDnGkDd+WX6Pth91C4LpoJ+PUUNGpKXmpayB1uTE0ZqJtcxHt
	3851Yc3PljX0Z+GlzfAB7yyPgq+YFaedJQgkpB4Vg9/VJDcnO7ss7o+gtRuVxcc6HSdXrg2NPsKr8
	m5tARdiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wootV-00000006FIj-2K9D;
	Tue, 28 Jul 2026 20:59:21 +0000
Received: from mail-northeuropeazon11012021.outbound.protection.outlook.com ([52.101.66.21] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wootT-00000006FI7-2mKD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 20:59:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eog8L5+iCIaFpiEHn6O7cfng/bdC1KX2eLS7idRg2zic6vhXsdZUCWtSKUsH9aUaojRsJswMYz0YyWg/+ogeOf2oJlwRrX1qoDu8xmdmwTWe4DaIb9G+nNFrTxLirsjma/HeCOXpQbVX1I+brdSC6aG1oGRchb1JgykDB0GZmICRSfjfRfRqUDXTH4+JBMuAyns22Mr/WnV0rR6hsdM0/GgDU0hFD8fBvQ4qKdxjch3W/V//pJXP/iEVnOdJgiVryI9s+aGVV7FVNxKsOJcC0iPWZ1oJqJ66q+L5jCo5L8UylCVkU+EnwqE+Vo9MzcGi/uKc3DihtK4OEc8uF9onww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vdI0I1pHIGwg9eA8BqKNZ+cEuN2CvvHvWtPCU8t+kE8=;
 b=jaX9TPIyQfMqowMRdDqj2OzStW71p5omxS+PfDn7w6b6inyaODhMr9X8eFey8tsU9KuZj+RwFzKdqZBu2V1MOBrm+cuNJMrVfzdz2SY/9bXa/5fJIRru3GUK+nx1g/ltnHfWx8u7+wsPVdhSXE0PGInfX3cDBU6/f5pMrEfChlqAmf/dQl/Kiq9NkzaJ4hInNUE4aR0u49Zzgw4A/cUAhwQ8oiKpOR9CTjFHOZaPzSpPzpN3Z/00E/ZbyM1pt6+buy0sTg0HopdUzfYk+U7YZUlk9SkePMaleCN9unoetEui9SyK8st8aYOr9KCy6YNklxxCO4WvFvD9lCjp98hHeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vdI0I1pHIGwg9eA8BqKNZ+cEuN2CvvHvWtPCU8t+kE8=;
 b=oNywlqBDnb96M5FE/UUj12G3NKqyfwhVQxE0obJH8AQfA8uuuMmjAYzGQT+jG73F8W1sAAzgsCSRAAIDYIHsEEnD1jozCwKLmbRrK+s1BjHmQ0Rx37V1OU1cG6i2Ppdja9InpxFyG7EePiq2hCKJ77MifSenNbNR+CXS6c8ZOc+IozyZy7JdmmU/ihuzgd8pAmZ7tEFxjQBpQaCBLTwVaKLrDqSUVdKWCXm8HBEI+o0EEnQElPJCfDFQe7U2xJVYlge21a4QPn6H1J47OA5GH/Z6WsH7cOSeEtCBCorWfIYWcB6v6jcyx/HVvTV9ZqWMWSDe7cR1y3hTfAJs3qpGPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM7PR04MB7125.eurprd04.prod.outlook.com (2603:10a6:20b:121::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 20:59:14 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0270.009; Tue, 28 Jul 2026
 20:59:14 +0000
From: Frank.Li@oss.nxp.com
To: linux-arm-kernel@lists.infradead.org,
	Marek Vasut <marex@nabladev.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/6] arm64: dts: imx8mm: imx8mp: Add LVDS DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
Date: Tue, 28 Jul 2026 16:56:41 -0400
Message-ID: <178526691523.3668106.15530570789092029810.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260716055751.279033-1-marex@nabladev.com>
References: <20260716055751.279033-1-marex@nabladev.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA0PR11CA0194.namprd11.prod.outlook.com
 (2603:10b6:806:1bc::19) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM7PR04MB7125:EE_
X-MS-Office365-Filtering-Correlation-Id: 155c2e95-aa07-466e-8faf-08deeceb14e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|7416014|23010399003|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: b5Mc4wjs546coJ3V8OWD6iLwF0Vhky5ZyZUc+9lvGmgT2by+y27m2s3y1zF+/PGueC1JTmq0mlgYJf9Qhf0XHkhWnE43eMF/3xuBQgOuzkXIqN9kqihTUwrxj24P3q61X0xld5oIPe08c/PwYTRHQF3J27RIhdHIJgeuoynxSkaEs4StHtWkCrgzbelVUFAJmq86Cqa5snKJ45YK6+mFL7hq2og9zGBPORnlfp72UMRD6wvy8GihYou+sGpeurzZE5uUTZbWXviJ7ZkdjkFxLCf/GHDamPBpX2nj8qqIYSHLpeUKtNsTMOMOjhqT77uTWwNd0a9qnw2JtI4O6hzcnbLMCEGOP9FFN60tYZlz89OW2xszm1c9oIIvW91IqaQdh7FM8ooahoVvmVx7PY2G2GDDaWc20PTZC2DXlwmdr/QQfa5qqX7jGOOr4nR3R5UQsKExzTgPCKBQ9opC6rhuxeTI26DqzXrx0xD3V/TKro+VCOQdOLyYL50rPlK13qjpPBA+7gXnHrNYdmoozV10E1sZLMRmPKWxfzF5FwlS9EY/Q8/V9Onu1nlI/zS083jAJADhOmxhuAas+L5fcbEpue0ryKYcnx3BRsyC1TqrMzeJySuiLI77eHK2lZV3YisACTGa0IMDb8trnxfXVBXgp2CdiNvj5h9gEzZG9TxRx2M=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(7416014)(23010399003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MzJXRUMzQkVWMjBpdURObG5CUzJyYzU5SnNMZlhFZGdmY29IdU9Wd05oUWkv?=
 =?utf-8?B?eGtNd2dKODBRc3dEREc3Y0hQVWs2NGpGckFBWkU1bGJEcHFIcEdpcFBId3hB?=
 =?utf-8?B?RjY4SjlVZm1NUDJ0ZlZPL1lQbFhvdlB0UnkweHZUc0RjVFUwQXJDUVVYYmNH?=
 =?utf-8?B?U1VNNU00NUFETkJSM2t2dVIvalBNRDU1anlhbVNsZFM2RnlzSy9KK2pMM3Za?=
 =?utf-8?B?Nkk2VEhoL3ZMcVVDcG9XL3ZVQ2xRVHFLWlFWeVhOT1pibm9PdHJqcDlibmNZ?=
 =?utf-8?B?bGJ5S1YzcTdhTjgxNmZXUTBveXBybmViMkRtQWFpV1FxdWZUNEhWdFc0V0ZB?=
 =?utf-8?B?cWw3WHF5ek5ldVQ1Y2RtYmMwRTdhN0pwSmdWeS9LWWZpdSt3VmJLWlJVcGxV?=
 =?utf-8?B?QXRTcXAzZjNVdlBUNVRiR0Vyd1dVTUtrTHBRWWUvTzN4WStFR2x5aHBOenI2?=
 =?utf-8?B?RU9LVTdoeUcyeVlNSUdCNEpaSU5TTFo5T1lRUytwK1VrWjgvNkZOM3BXc2Fy?=
 =?utf-8?B?aGNLSjZmb1dQSWtleDhkZElKOU9Td09YNVJTQ1NEZHJKRjBoRk4xQ1pINTdx?=
 =?utf-8?B?WkoxTnZ4dll5QWRVTnJ0SzRaeW5JQi9yL21KV2VwNFdNQTY0MGtOMWRrVzBG?=
 =?utf-8?B?OGQ0V1pCTHpvQ2pVbDBHY2VuRHdHcDk4dGxBak95WUdHSktxWWJWczlBd0Ro?=
 =?utf-8?B?MlRPdit4RG5oUzR4eCtqU0lRZXpPeTdBc2Jva3ZDSGJJT0cvY2pHQ3VmZW92?=
 =?utf-8?B?QkZBKzlNY1ZFa0FKeENobGdhejhuQTY4SzZ0YzJqeTZRbjhmWUg0aks1YjlN?=
 =?utf-8?B?NWxBSDZEazN1RkJCb05FQktraUtOdHJtMStGdG8rYndZZE9EUGE3RGVBai9s?=
 =?utf-8?B?WERoRk1hR3RnTXBNZWJJOGlJMWdHMnRWRzlBZC9EcG1vMWN5L1JqM3hBaDdo?=
 =?utf-8?B?cVkya0doWWJOMk5Od05YYzhTVklsejUrNFNEa0tTY3NESis2b1lKQjZ6Z1N4?=
 =?utf-8?B?NzZQMVJENE1IMDhRbW5hRzJnb1Q5cS9MNjArLy9iMkFZR3VQTjZtTjVEMXpm?=
 =?utf-8?B?bDdBYUFQY0hCVjJHRzVHQ3R0WGxkTURCRjI4MFdvNVhqVkdYYWh4ZEI1dFFm?=
 =?utf-8?B?QlRWSGtSY0FSaS9xdm0ySWtsUnJZQURxeVlrYUQwOGRUSE1lYXIvZlMyOXNs?=
 =?utf-8?B?N1N5b1g0RXA4R29hSWd1ekpyVS8vWFpqQ0FqVG54Wk4vSWhXZ0hZQ0M5Z3Nw?=
 =?utf-8?B?VEs0K3FNcW9qWmZKZVZtREE0SUVEMzRkQVlpZGVJc05QWEZBbXpoQjA0cDRo?=
 =?utf-8?B?dzVZRzQ5N1pSSWVmU0VBVjl1OGNEUXNQZWIza3BkNktnNzZWWmNUczRuMFFY?=
 =?utf-8?B?aWRlSWZBWjJUSzQ0ck43OGJWenFrMlNNOXJDUjNjU1prWm5tTDhHaEdyTzNn?=
 =?utf-8?B?NkoyaXk5KzZBTko5eSszclB0UUJhUTk2T1ZaaXlQTm9NZUpXeXRyUmhHcm9i?=
 =?utf-8?B?S0RaWjdaenpSZ1REWnQwcUVNeE81endpOWpqRjE2NE1jVWRIUFpmU0pqZTli?=
 =?utf-8?B?UXIxd001MFNhTUlFcFRYMm5JR1BwYnFlMGs1Si9paUFxUWdYMlJrNnd1cUVP?=
 =?utf-8?B?TzVLcUlEdDMzSzRGYmRqRG45dWNyTVRRaSsvY0QrZ2Jjd0NYQ3JnS0tLZWR2?=
 =?utf-8?B?c3BqNFJjQzdBTnRPZDZVZFRTQkJmYTZyaXcyck9idklZTXdZTEFZZFErZjhy?=
 =?utf-8?B?bTM1eXozaVd0VHlSVUlQT2VyaGVZUTlDMFNmMW1UMnZnRERqajJBV21rZUNX?=
 =?utf-8?B?T3hnemZLSnBSempVSXFMdXRvdnVhR2VOVzE1bWJ3cW9nV0xVdFQvajRic0pl?=
 =?utf-8?B?N0pMT3BnUjVweTQ3TFdybm01NWwrdjVyU2gyYkdXcGJYcUFTN1JZTEhZWldj?=
 =?utf-8?B?aGVDb2s5bGxXK0hXMklOWkgrUmo4Ty9UYVNSWkVsYzB6Q21IaldMQnhMb1pC?=
 =?utf-8?B?b3N6S2tKeVpPYjFaN1J2SzBVcXU2c1c4cTZ3c1dNMWtKYTc5RklnYldHWnNC?=
 =?utf-8?B?SDlZWk9PQ1BJWkt6TVliQUtRQ3F0MU5qb3UrNmIwTjRmeVFvSXJRb2pjZ0VN?=
 =?utf-8?B?ZUJoamU4Q1p3U3RGRVZNZlJPc2tqOWtXc2ZHNWFBOHRrb3hpVzFDTFdNTWM4?=
 =?utf-8?B?S0wvdkpGS0lmbC8xYW5mRGlKc0lIcmV6MXFid0VGYXZRaEt1eFZvMnE5UDZC?=
 =?utf-8?B?TDFOWHZvY2VobU4yVXZUS0lqcVJaeHBSaWpBcnNXeUt3dFBhZUFVRHg5ckxz?=
 =?utf-8?B?a2xOZHRYZTJHOEtwU0Zya3owOU9jbDdKM1RQajFCT3RsRWJVVktzcmg5ZW5F?=
 =?utf-8?Q?mtMgwgcdQ8BQAHflq7ohISxrkrJLIN0Fuvy+U?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 155c2e95-aa07-466e-8faf-08deeceb14e6
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 20:59:14.7072
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /eKpEzlpxpNE8Dkp9BROgxHsMaUhFNm/OB48u02roV5dkqIhjkiNqzD1fTGYpitSfO5OHUKyZQK6IyoF3xNMtBsnW09KuhvgJjDPBzQ9WE6AoS8bKCdp3EvQBWddV87/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_135919_707751_19AB424B 
X-CRM114-Status: UNSURE (   8.83  )
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


On Thu, 16 Jul 2026 07:56:53 +0200, Marek Vasut wrote:
> Add DT overlay for the DSI-to-LVDS adapter eDM-MOD-iMX8Mm-LVDS populated
> with Lontium LT9211 bridge. This adapter can be optionally populated onto
> the eDM SBC. This adapter can be extended with multiple panels, currently
> supported are the following:
> 
> - AUO G215HVN011
> - Innolux G070Y2-L01
> - Innolux G101ICE-L01
> - Innolux G121XCE-L01
> - Innolux G156HCE-L01
> - Multi-Inno Technology MI0700A2T-30
> - Multi-Inno Technology MI1010Z1T-1CP11
> 
> [...]

Applied, thanks!

[1/6] arm64: dts: imx8mm: imx8mp: Add LVDS DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
      commit: 3eacea24d258ff5169d84a419b07cb5828e91718
[2/6] arm64: dts: imx8mm: imx8mp: Add legacy board DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
      commit: 81a2094bb922290e4b52a1467037f8d2ac07ad87
[3/6] arm64: dts: imx8mm: imx8mp: Add HDMI DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
      commit: cfdee13eba802665ecd8751fefa754a759f414c4
[4/6] arm64: dts: imx8mm: imx8mp: Add CM DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
      commit: b26192de5d0f4635d73ad2aea43e3e83a9ef5f77
[5/6] arm64: dts: imx8mm: imx8mp: Add FIO1 DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
      commit: dca8d10e97bd121494106f54f4577291a9bb0f13
[6/6] arm64: dts: imx8mm: imx8mp: Add FIO1-Audio DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
      commit: 8ea2fa3fdc65f2750718aebdcf912cccde5913b8

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

