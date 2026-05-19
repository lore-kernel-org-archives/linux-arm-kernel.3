Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4401CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 11:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	Content-Transfer-Encoding:Content-Type:Message-Id:Date:Subject:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tdh3CjzuGSJEHNx0OU17jXPF/ORsSBQDgIZTXXSRpls=; b=skfeusYQ2u08kcHKKFyojBB+K+
	G12tgWKJaGYNiBhIvEg5b4jig9RKoMj0vQbn5xhVaEFsvid5SjX0RYwYFDnvWWgoDrmWKlWv15Ki8
	LG1GU68TLCWGsF7E0Zq69xdZFN9yT+mLy16yDM9bggA6yUbX13gisbiIMm3ivNhk4Dh2PVl4RBZdI
	UoyEWGbfW5ZBJgwwxrOinIUxIufIeHFIaA518mPyILv5NOJ1DP2hssFcHe2ML8oR2yX3CrlHJYwMH
	237paQiDf6TCf8GYJ/5FKUSuuE0+v7OQAKsh+dEIXYREB+WZujcLZwRvODiox6W+vykKqi/yPNGQA
	LPXBU3wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPIOU-00000001HRB-3JJD;
	Tue, 19 May 2026 11:13:50 +0000
Received: from mail-northeuropeazon11011030.outbound.protection.outlook.com ([52.101.65.30] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPIOS-00000001HPT-47Yw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 11:13:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=neKkCdWb9gsuqNmudKv34gdFMRwtb4FAy+JdtHH9aa1Jv92gIpBNGGhWT6MxsSeyTtD7ZFrKUHYJtNDKGhIwZwe299o/pu6HIALktn6l5rx5n2ONP0XlheKk3MKg3Cy3P0hU1UVDBSiQuNHkWgDNyapozl0ecJYogES7cbrkR+kufIYeFfSN7piK4e1WkH0oNrMhJK4tGFDdlRXoVllEKCBI68uBPzioDawQJbYEDBCpd0uHGUjnAfVqYwjGevMBdVA83g82h1LHoY9I56KA//WCIdbMaZBznhU/1WJubFT/gwmN5F91a/T5L49bX3ca4i9DevJiBX8yOPDOyJtlMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tdh3CjzuGSJEHNx0OU17jXPF/ORsSBQDgIZTXXSRpls=;
 b=ouhYN9BfVgKM8NkrFMs5XocVAfWnbo8MVTXH0JMSTB0er6lrO5IJJiiGq8qFNBMCCNyMM8KEDZF5n/hcsRL03xaxkc0ljipgj8u89FAw1+1KVWcPBOu3DoJ1837FXZg+yjiquD8C6+kWfDAi37hVzw+5VymtmdJDpFw9cx8DyIwgkSsyY4oy7NJsMxwjnWkVN9I55Pqbvcesycn0op/5m0kAaKxoyxxFljlyWQb1XFsy3jb2/rcSLQjlc2MkKC19VmK2TbdWxIs90B/Xn6cVDGQtfKG2jJFXEXFX3yGPa7UhRxzIN/3TgeBvmFXjEcR1+W5BnyaVcwR2q2N8w+0mEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tdh3CjzuGSJEHNx0OU17jXPF/ORsSBQDgIZTXXSRpls=;
 b=jETVxXrUxdEQiA+79dky5fdynpkkLy45di4mnSUGzsJWBxEfWPgx3QLAlpQ++kwk5BVwYBGUXzmUyqUcu59x3BgNkRdk5AkKlwMuN+8e9KBOfDFoeI3WWlDlCr3n4R7jGY+YJ2KdjMxviRK8DXFhPnwVlsrPIYNL61hrn4jsDbEUq3x6d+dpR/+ODPSNZPI7bjXMn+/M36/ZMVelyCM9/6glw1jxsOleCtiFV9SfMxi5rPlP6adGDpxRj7ZVnXrMs7TIcgo+c7o5KBpkuNGXK7n26FrymXBw3RsB2J72ccsosc6euL13AMej+GvXf6P5StNu+QGz6PbEPpWEqtTdiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB5765.eurprd04.prod.outlook.com (2603:10a6:20b:ae::26)
 by DB9PR04MB10009.eurprd04.prod.outlook.com (2603:10a6:10:4ec::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Tue, 19 May
 2026 11:13:43 +0000
Received: from AM6PR04MB5765.eurprd04.prod.outlook.com
 ([fe80::bc76:f507:9b83:9d69]) by AM6PR04MB5765.eurprd04.prod.outlook.com
 ([fe80::bc76:f507:9b83:9d69%5]) with mapi id 15.21.0025.023; Tue, 19 May 2026
 11:13:43 +0000
From: Joy Zou <joy.zou@nxp.com>
Subject: [PATCH 0/5] arm64: dts: imx91-11x11-evk/imx91-9x9-qsb: misc
 cleanups and improvements
Date: Tue, 19 May 2026 19:15:14 +0800
Message-Id: <20260519-b4-imx91-qsb-opt-v1-0-9b416d2dc224@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAENGDGoC/32NQQ6CMBBFr0Jm7Zi2UAuuvIdhQcsos4CWlhAM4
 e5WDuDyveS/v0OiyJTgXuwQaeXEfsogLwW4oZvehNxnBiXUTWjZoK2Qx62ROCeLPiyo69KaWhI
 pLSDPQqQXb2fy2WYeOC0+fs6HVf7sn9gqUaBzTWl7Yyqnuse0havzI7THcXwBU86mWq4AAAA=
X-Change-ID: 20260519-b4-imx91-qsb-opt-583b781ee250
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ye Li <ye.li@nxp.com>, 
 Jacky Bai <ping.bai@nxp.com>, Peng Fan <peng.fan@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Joy Zou <joy.zou@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: MA5P287CA0352.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:219::16) To AM6PR04MB5765.eurprd04.prod.outlook.com
 (2603:10a6:20b:ae::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB5765:EE_|DB9PR04MB10009:EE_
X-MS-Office365-Filtering-Correlation-Id: b6fdaedb-d625-41a4-928b-08deb597b00f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|376014|7416014|52116014|1800799024|18002099003|56012099003|11063799006|38350700014|921020|3023799003;
X-Microsoft-Antispam-Message-Info: 98ah0utQScVn7lkE3D6ud8lDLOi4AxFifA2QPqyV1Lv+uWqvkvp4Uz5r2m/g9sMLbFPP8jv/w4/3osxZhWAG7bplty+pu8QR/8Dbij5W+O2svSSYi/h4QpUAwFrmr85Lrd+FXwU8GVSdKg4RtV4YZ+SxbX2eaZhNVU4+u688Y45/vYX7jWrDwjAo81nnQ28HA1mpplueyReIy1v2LlAf517YYvz3TkQU2thK3PQU6/vk2VxH/OLtDECE+M2uIglTP0iOssfvoc1t6rxb6qy73NQFhAfzcxwBpA534tggrPrzfahNujsjR05wwfq/+eSGKW+EsXZcGv+3mjuUal4ouF8r7uqqIS3EXmGrKSM+EyJOMrJfRjpUXUiBHu2crfFarR39mIH1q8+5QwPc/tnvyYsJv2pRAPf3WR9J7qGnO96DZuxvk9bqzQE27L+2XpYV7KAK13+E3R23uXahV+umKMa78dQTe4eepAtV+DX/l8/+qa5l9J60hUK85MEmogcLhxywN4+bhh/SCtBR9kpWh/+UBWpUtD3zwe6z+zkxCE+QvEUP23cwI+OQnK+PvF54dfuimtbAOyqxHU3NcvAqLDUQ3rpsenI8o91ZTgHS9Hr0y37TNAbBzoQcKAN0Np60SSJ2xu12jc30k0rCaV+XaaN2HYYF5OFOqZxGcd+AFQ1rXux7oqDNmBvD2gm7HbwYgDk1VxwAHpbZ/lxQ4t0w5d265I0JFDU8KH+V2N1zYur8D7TndpJZaP81it7ZxPJK3polc4GvSK6llP6fkiaMRg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5765.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(7416014)(52116014)(1800799024)(18002099003)(56012099003)(11063799006)(38350700014)(921020)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3QrejNBWFljWmZLR0dwWEJ5NjJrL0QrOWZBK2JDWEU3b2oyL0xSUHhjSHZm?=
 =?utf-8?B?T2FVVVlZdnozSVN5czcrek5CZk1xdTJ2MjlVcHNRaDVSRjkyeG1MZzFMUElO?=
 =?utf-8?B?R1VUZVB0aXhDeUl0d0UrTFN5WWhDQVRibmZMUUprUFlpMC8weWhRZzFzTUlX?=
 =?utf-8?B?dnBZMkdHWVl2VUwwbytPeGZVRFgyQlZ2RWJrbU10TVNHazgvc1d5bGhMS2Nt?=
 =?utf-8?B?MmZLR2JsaG01dGxJQytqM0FzYmJjUVdHRytYa3RFcVZhVW8xajdsNVN5SFc4?=
 =?utf-8?B?ZDlXQTZXNWlJNWVjL2FObjYyVHpGMFdEc0pXWENQdDRVUWZOVHErRTlVYS9Q?=
 =?utf-8?B?TDJ3c3A5S280TGZjOHIzSEFDWXBMRW9pd1ArRlVESEh1OFdNRklYc3gwbk1E?=
 =?utf-8?B?KzJhT3hkREp2WktQOUFMSlBnQWZmbXBqU3FpdHhYOVJhbVVxeHVrOVFnVGF6?=
 =?utf-8?B?UFNDbGVDZkpVWkpZTHJMYVdaSWhoK213NEVIL29QRHZsbG83SEltYnZNYS9H?=
 =?utf-8?B?cVc5cDlSUEQvTU43TDNpdEhWMTI3U2ppVy9QNEhVcFZLRmdTb0k2TXR4VWJL?=
 =?utf-8?B?YktlaWpxYWlPcTA2bkVKT3FFVU52cklOZXZSV1hYVkVvNFNTbVlZd1R6WDA0?=
 =?utf-8?B?Y01UZ3ZmdVdaM09WeXhTbmdsTmZkNk5YSkJFcXptSmJ6ek1aeW5iUlU4WEtz?=
 =?utf-8?B?K2loVWd5MU1ubkxUa2VNY2tITjdUME5GYW9vU3dkY2xiaHlvZmJNTjJSM2pZ?=
 =?utf-8?B?bXNBbmg0elREU0NnRDNNWFFJaVk5eE01aVJvUm81ZjlsaWh2ZEx2OS9zU2xh?=
 =?utf-8?B?RTNJTHlQSlZjNTlFVnlLckwxVmRkS1NTL1d6N0hjbjBtZStvbEhadi8vLytI?=
 =?utf-8?B?bEpFYndkNkppdVFVbEZFanpqVklRaElPa1RYMjY0ZUk5WFNtUGsybjA2MzBi?=
 =?utf-8?B?bmJZcndLNEwxdUdDU1krZVZpZ25FVHVYdEJDbW95dm9TR3hlc3JWZCtaRmdt?=
 =?utf-8?B?bk1vNUJWRkYwUjlIQ0xYbDdQZGh1ekY3QTY3eWhmcFFXOFhXSmdmYTRhWUhJ?=
 =?utf-8?B?cEU4dDRMcWc3RWE0S3FHUXU0OGI0SCtZcGdUS0tZRHcxem9TMHZ5L0NsZEJZ?=
 =?utf-8?B?RzRqekVTUWcrbTNoSjhpQXRhbHd5YzliWTVwQVJyK2tPeDE2eGhoSzVUUisx?=
 =?utf-8?B?S1h2ZXc0N3lsam5MQWp2WlBNeU1kdFg1MDE3TElhc3lEM0drNXhoYUVuRFRt?=
 =?utf-8?B?NEl0VGlsUDJRMGhBaDhrcXZ2UUx3UzVPaUNNMTV2bmVXOHhnay9oT1AzcXhl?=
 =?utf-8?B?UlZDUGEyS3BtUnBpUHVwS2lzRE5ubHlYbi9naTlaWWpabUdjVTFqeWlPcjBH?=
 =?utf-8?B?MDlsQnJWNEU1RSttc2xXT3hkWDRHRnpZMmRlS0JEZ2YvMTJIMXFBaEYzWlJ0?=
 =?utf-8?B?aGlFc2RESGY3SzFKUzhUS3l2R0JBdmhtdUI3WE8vMnF5cDR3alNsckNqaVJ2?=
 =?utf-8?B?ZkhxNVQ4Mnp0ZG9mYmNBejMyS3U5ZEJ1bXBGTlhzWi9ncEd5amg5Ui90NlYr?=
 =?utf-8?B?RDhyRlUvcTBLNDhpeWUvd0JxY0VLb3pYZ1ZuekNJUDFlWmFiOGdVT1AycWY4?=
 =?utf-8?B?YUxvamtZMjJ0MnVxTWtBYnF2dlozTEx5OXV4dzUrTTFEcnZlNEtDYlNxODZo?=
 =?utf-8?B?ZERtM3kybkFCK0xWd1E4T3pIUkpuQ3ZiaWJKV1VFKzNNMXRCU1hGT2tzK3pZ?=
 =?utf-8?B?bURadjRNcDdkVXZ0TGFrS1Z2RnNHZFFXTmROREcyQjR0ZlFDc1U5S3BKYVQy?=
 =?utf-8?B?SmhKUEhLdzFBNEpBY2JOOWJrSG5jVXBMMVRTZ1BwMTVHU2RPMmRVdGtVc3Ex?=
 =?utf-8?B?R2FQc2liY21OaFdidXlFVm9PMkVGNndDNWJCcGlaRlkzK2h4T21QeU0wRXpm?=
 =?utf-8?B?cDlLTWhIVkF1dU5nY1NQRXkydGpqQlZHQjJHNFFCSzhoRnZxb2NHYmVMS3FV?=
 =?utf-8?B?TWtiZkhjNjF6RWJXR3I0R0kvNWhCemUrRHZQV1g1dGdnS1kyblZrNjBBMUxi?=
 =?utf-8?B?bVM1T0ZBanRQb0hyYWZxeWdHbU1jWktUQXdYdEs5SEVnRkV5UWFTR2wxMkRZ?=
 =?utf-8?B?ZThveDBLMjFSTWVSemJGY0lrMHptaEFET0RWWFRYM0FzNFI5R0hlVElIVXVh?=
 =?utf-8?B?ODFTaFZtcG51aDFOb21QcjNpbDBzOFV1NVZua3pFTDJHTXAyMnZaWkhtUjNv?=
 =?utf-8?B?ZWJvZ0hQamE0azVEZmZ2Wk9VN1JqdkJpWGVXcUE2NyttZi9lTGhVWS9VZDRr?=
 =?utf-8?Q?rIEhoEvLgVL+nVNXjK?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6fdaedb-d625-41a4-928b-08deb597b00f
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5765.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 11:13:43.2607
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8HlM3zvpVEtOIOhTVVze0tmRMs74uQJsw8pmnc1uU6zeJfxQuM3EnGh32eEaSXi0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB10009
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_041349_027277_8F39C299 
X-CRM114-Status: UNSURE (   8.79  )
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

Remove unused clock-frequency property from mdio node for i.MX91 QSB.

Add watchdog pinctrl configuration for i.MX91 EVK and QSB to support
external reset output.

Add Ethernet PHY reset GPIO configuration for i.MX91 EVK and QSB to
ensure proper PHY initialization.

Signed-off-by: Joy Zou <joy.zou@nxp.com>
---
Joy Zou (5):
      arm64: dts: imx91-9x9-qsb: remove unused property clock-frequency from mdio node
      arm64: dts: imx91-9x9-qsb: add pinctrl for wdog3 reset
      arm64: dts: imx91-11x11-evk: add pinctrl for wdog3 reset
      arm64: dts: imx91-11x11-evk: add reset gpios for ethernet PHYs
      arm64: dts: imx91-9x9-qsb: add reset gpios for ethernet PHYs

 arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts | 14 ++++++++++++++
 arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts   | 12 +++++++++++-
 2 files changed, 25 insertions(+), 1 deletion(-)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260519-b4-imx91-qsb-opt-583b781ee250

Best regards,
-- 
Joy Zou <joy.zou@nxp.com>


