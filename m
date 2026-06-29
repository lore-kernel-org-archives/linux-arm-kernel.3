Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E77B6C43327
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 07:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6rHFjSqf+6DCLeGgGMXnp2u+e8Dc03oxwYB+p+SScKQ=; b=eYvGU+ZAoABj/a8JyW/BsoK5be
	qvv2VRo6ecLqA5pAkjGRhhx6iZifrg1el0NTBoT0GZ/6L+G2ublLL9/rI9ecFeTQJ0OL5k5VLZy3R
	z99i85qZon2OUT3AoBeQ4pE/ddX9+5X3JofEiY/Z6Dj8tIQntz/NK9BhWm0mg/HgX2fCZIX32PlTP
	2Rb+dYIpJFTal0zXfW4KXhwugTgQjT3e5WTY3zW/5JBMnOoWfaVW0psjLNt+VZj/FifHaa7tR7GX7
	Z3H0ZSPA9IsfsWke9j5DiP3q1gwYm+eKrsKLBj2CPlQ/sk0uyNXaJAjNiww7gbUUZ5MbFDysHZkXB
	VtF0grpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we62g-0000000Dq94-3XLm;
	Mon, 29 Jun 2026 07:04:30 +0000
Received: from mail-northeuropeazon11011053.outbound.protection.outlook.com ([52.101.65.53] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we62a-0000000Dq5j-1uD0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 07:04:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O+vlqOPoncazuf06609axZBhZVinhQpKBHs+fbhOJFM08jyWLcQFllM1kqDrEAzEZjXHbXdWZeVMmXeLgRpobmofDTiT03sogKIMxJTIpeOlx1By/A0CrHFTIeke5r7heWCbK3EW8GfBUSCXXQVVmxpZsrsLcdXOU+RuJdAdFoH+4W30MDCA8r7qURkW8w4/A1xrv81WVQV9oPnvTaaWhNYJQD2d3tQFnL+nZyKVHsZb7AAMmSa9BbFg3zG6E0K/4h7JbvvDRJn8shoLJUd4axLNuk8dN/MuqdUYBFzchyICI55pmk0uJX8J2MH/AYokPWJca/b0b2hT39Jiiva5jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6rHFjSqf+6DCLeGgGMXnp2u+e8Dc03oxwYB+p+SScKQ=;
 b=O1MK/ahdTCgdzga1hqhKrcK56lk1/sYHYpFM5A1EhlUmNMR7MwCtV/nlFh6cWWhlX8goX+uV8dqRCEMIebQHWwqfPrsv0BnhuQqb5lkONfCoKFiIj2ysecC5jtqXvPbNQOvTzqoGpKKm2jrzCdPwYJMbDRMPNRSLvbthmZAsl/dc9tWpssP235madU2ShSBNzRJ+VbnrgmOxYAkuW36bQM2q2cjmFusGW9U181FtQuLWnbw1TSYW3B/VSi4pWLMrgbe+buTsVjQJmIrrDk2bKxQHNQMXMb6XaPcGnXz85B0MTb1+JEgG7LNrXrfndpu7bAvcduwQyhdOScr/JoC5Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6rHFjSqf+6DCLeGgGMXnp2u+e8Dc03oxwYB+p+SScKQ=;
 b=qQVtM7m/giEAOsNZtyt8hotT1nZ0DCpuQnQjgn5TxDf6kVrfLSZBU19KYWjaOQgFTuuGqejz3b5OIj+KvNBecIpgbvao/ttCH3gS7JxhIjYhww49+q+wnRnQLupHjF01eY9ZgSze1y0Mo8E+UW2AIsdOleUYzy8PU0fRlkVrneCRNrQh+nOUbgppyHjoUyDNvEDdeqJwN4Qv7W4UmZdF42mDDL24aHBGnCcJ+f96Kl21f7Nwu7pBb6CTNyMXA6PGg+hob1+ml4+hiHcg17WCdqNrGuXi75Tun2eh15EmqqDKpJbpRtX+tvmN+2/lOgnrM0zg0575zbii5YiilJji5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by AS5PR04MB9853.eurprd04.prod.outlook.com (2603:10a6:20b:672::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 07:04:20 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%4]) with mapi id 15.21.0159.013; Mon, 29 Jun 2026
 07:04:19 +0000
From: pankaj.gupta@oss.nxp.com
Date: Mon, 29 Jun 2026 17:51:58 +0530
Subject: [PATCH v26 2/7] dt-bindings: arm: fsl: add imx-se-fw binding doc
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-imx-se-if-v26-2-146446285744@nxp.com>
References: <20260629-imx-se-if-v26-0-146446285744@nxp.com>
In-Reply-To: <20260629-imx-se-if-v26-0-146446285744@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782735844; l=3245;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=T+yyPOpdxzPdIuNJ+imfCdmSEVDwuOuBb/dhiIQRNpY=;
 b=AiNF8HJQGcIM/q5X+61dnSC2Q96eJhRNJnHH+gWvNB6HpVI3Ylq4sl8F1+ZkAWRRPG0hv1HJt
 tcHjPP7M9mtDKPXcU/vJj5UnCk5KLpIRptOgKnEIJdf9vxSMnGltbmB
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: MA5P287CA0003.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:176::12) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|AS5PR04MB9853:EE_
X-MS-Office365-Filtering-Correlation-Id: 84e6da9f-47d1-4d5a-7c63-08ded5aca3b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|19092799006|23010399003|7416014|1800799024|366016|6133799003|11063799006|22082099003|18002099003|3023799007|56012099006|921020;
X-Microsoft-Antispam-Message-Info: fTQQwlc79t/0oro7TKsjtjIDTrFk12URuu7wPs5qIzDP0qKvJb4kCmcE2RIbu1uJn8j8AaAteCcld9FWy3cDFjdFgmn8oGIlBsg0h5LkALBt5SB1sY28gnJtOuIkvk4MWG29QdLiTUPcT0cBm4PWmwRcTrWxfBfXHi8J073z7MEDCHbJAbhcEtEYicZ4iPG7JQO2mOobdEVJoKOPlqW3OFgRbDwww7MgieGlhW9OAt2Cva9VzvTURNRNppxyIC7AtjoUIEhrKOmVPaTX0uJhV/DY2P+Gwqk6w+NvrZEcUV1PDPvMhktc0fsyS4ifuqE36j/hop+k7saxIJ2LPTihKMma+EaYyBRITF2L5zvqPlh7XARBoFvzcQqzLDgpZkG/PkEv62S5ZErPhVnrxMmwYxju1/VqC0LLrqX5jHaDn+AW7hZQcQ6/emL4rGRHrgWxBXIGkPgs5YqNrKmGZatLPE+nVs6PRKl7mwIij8DxpDrnriC8Zi2hpQjGxP55LixVJRe5QkeBHyw3gw0JB8bWfsBblqiMH+kfiLPS8zY55iHgTPTVuMZxZvh73+atrGyIp5LjYsSQkToU+CGQnmNvELWuYBMta74kteueo+HngCJ2b3Jf+vxroEZsOJ45wGCrhp0DNydvA4y+PkZdwtuiS6OyepAiKv8vBNsBV2T+rn8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(23010399003)(7416014)(1800799024)(366016)(6133799003)(11063799006)(22082099003)(18002099003)(3023799007)(56012099006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjR4blg0cGNaSzZWYzYwR215emR0cmtZWDdLMGVWaE1HNDdldm5wY1pOUWNi?=
 =?utf-8?B?cm1JZ2hzVlY5UTBOb1pqVXBrWkQ2NXRpOVpVT3M1MmgycVJmbkdZdzUwZjNN?=
 =?utf-8?B?OGxQeTFmeUJCWFFrbkh6NXJlOStMdmF1UHdoVkVvWTVoMlVzc1J3NXNvZk9F?=
 =?utf-8?B?bG5HUjQ1SnU1MVh1NVhoaEJOeDEwa3hLdWVuZkRGMVovSm9hUHBVSEpXRVBP?=
 =?utf-8?B?cXY4T2xVUFdTNkRnUDZFWkpUOHJ3MlhJUklldXpEUStXSVJxZmhocHl4ZmMr?=
 =?utf-8?B?L0xRZUlzOUU1SVlTS1pERThNcVFPV1prNHNNa0hVNTUya0FOc2g4Ri9mL3lz?=
 =?utf-8?B?b3pmL3JXNFFsOUZrR1J4TTJyeUpGUmRLS0ZVRVZXUk5DeTVGSFZpYnovakRK?=
 =?utf-8?B?MUF2cnJOd01BNm55QTQ2dFpMZGIzRWlCZ29UK2wzelBrWUFQczgrcVQxZnJV?=
 =?utf-8?B?VGkrUG5kMlBOdVh3Yi9iNVNYb0l5c1dMclgxUVVNcFY0Y2JvNjBNU1oxZXlz?=
 =?utf-8?B?T0ZuSzNwWkdCYUFnOVUzMStvOU1QT2dsUnpZbWNDb3dJL0RZNytuTW41ME1o?=
 =?utf-8?B?LzNXS1hnMEhYQzVmYmQvOWdsaENBUDlCSmlNWGdWL2k5TGN1N2hldWJhSTU2?=
 =?utf-8?B?NWVUM2hsdU5kMFE5ZlFYZWNGUTFKNFQ5TmtBMWJoSmUzVXdzdDhRRGpuTlZN?=
 =?utf-8?B?SmE1QWVYV2VOYWNpTHNoNG9CZmg2cWg1TW9BNzFvai9XejgyNnZuV3lSSHJ3?=
 =?utf-8?B?OCtzWFoyTlF4cjRpbHdIWTR2RVp0NFZ5QUJPVk5yQy9ldVVTM0RBK1RXck5T?=
 =?utf-8?B?TXpDa2NDaXFsTWc2R3pWZmNsSHM5c1RrWFo0cTJRRUNuNXVONUtjU3ZxUi82?=
 =?utf-8?B?ZGNYY3J0M1RYZWlZdStFcWZjcURPU0JyUG84dTNibW1EWW4wQzRkY3B0bEJN?=
 =?utf-8?B?d0FQR0RlU01pU2paOTk4V2lXb0toWmpXMEdwVDlOZjFvRTJNY2FnOUZ1SGgr?=
 =?utf-8?B?WnVqL2hVMFhBbkp6ZDJQT2E1bktpb2xDOEVYSytOeXFMeE9wSVRBZEVxb1h3?=
 =?utf-8?B?dTlLbFE0NzJqNEJWWG83dVVuVFUvSXg5MEJuSW9HRllqSHNoMUJGNTJlY2U4?=
 =?utf-8?B?cWpyVFVpOVc2QitoR0kwblBaZzBIY3RnVUh0VDBhN0lKU1JLR3pwWlExNTdz?=
 =?utf-8?B?WjBhSXdzRy9PN2VaUkllSzNqdnh4R0NSSmpHRzk5UmorSjdDVEt3ZEVZcUJi?=
 =?utf-8?B?cjRyOGR4SHFRMEpheVNPZ1RmUUZqRUJ1N09PRVhNMDBHNFB6TnVwMUxqZS9K?=
 =?utf-8?B?QTNtanVlK2o3c1hMSmhZU0w5S3Fmb0FOaXhKbTZlSzMwYmpOdHMvUU9SUzVw?=
 =?utf-8?B?SnZvWVlnTkhIc2RRU25jY0Q3bjd1UnRTOHZIOFp0Rk5rUUlGRVI2bHdaeEs4?=
 =?utf-8?B?bm5nVTEwYUw0T1owRDFmQXBpenhoa3c0WEMvQU1saXJNTWsrcCtvTzkvWVFZ?=
 =?utf-8?B?Z1I1cm1JSE0wMEN0TytNbEx5V2VUMC9pSllFV1M4OXBia2tIRWkycStvRkVU?=
 =?utf-8?B?QXc1NXhpcWdsNVBGSVFiYmt1MGhaekNNOW1RSyszaU1mVmVoM2twaWRMbmtn?=
 =?utf-8?B?ZEt5WjRJRXhOeTMwcUZyK1pleTRjZDZCdDYya2ZVK3dFakxLY2VHbmdHTi8x?=
 =?utf-8?B?bzM2dG9ldTBQcUx5dC8rdXBWTDhRVUZJZjZpMCtGWGo1cU0yUVdqNWkzaWRl?=
 =?utf-8?B?ekRQLzAwV1R1bldpSnZuYk9KZ3VSWHk4VjFIY1NkOFpxeEp6bUpQZGxibUF4?=
 =?utf-8?B?TGw3ZE52em9zYVowN1lKUkNaYUZBcVh6UXlBNnJmNGtRSlRqbld6WmdCdjV2?=
 =?utf-8?B?OG9nUHRGZTVEL2Q0aVVrbG80UFVBQlJSWFppMkRrZTllZDBwYmhLdG9Hekl6?=
 =?utf-8?B?UnZOS2g1YWIzN1V5c1dUckZsMlFnd2NNYnpSWE12VnFqWGk1WEJXNGVuZGhB?=
 =?utf-8?B?TjhmM1dRUTFpbXFmQTBQRFZOR3RLZXNkOVF5SkhHdmlEdnBoVEtJZzV4UlVF?=
 =?utf-8?B?dlNML3QyZjlQUEQxOVM2eFVQdkR4SSt2czdwbUJnUXQ2bnZod256dElLaTcz?=
 =?utf-8?B?cmVBWnAyVWJEZTJjRmJYc01ZTTVMVjIwL294c0dxYyt3Z2FCc05hc0JsMjJ5?=
 =?utf-8?B?UEkvM09PRzJ5b2JDbUJQSWt5c0ZySTJKWlR2VXRaSUpJRFpDZlVGYXVUZVUz?=
 =?utf-8?B?ZmZSd05CK3BsSk56cE1IdVpQcHl6QVpyRXhsODl6YWpnR3JOYXNCaGhMd3Bj?=
 =?utf-8?B?Y0xETUE5UlhHVnRJUXJZc3RnRklKYloxOEJ6Q3p4WDhQSlk2bVVBSEpNQm1j?=
 =?utf-8?Q?Kj8lVCRcnMmOAYy2mE3SBi6fI9ZFrJwCKAjTk?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84e6da9f-47d1-4d5a-7c63-08ded5aca3b5
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 07:04:19.3725
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +lftte+7bMeBSJiac9N7TTrQYBKfWpaznEccET4dmWQ4ibnDnX/RResNkL0YVNEImzV8vR5E1l1V6nOazXu+BIvmEhwuqi+2i67IxoRpivmvWnF1v8NHTm8E40IHAHoR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9853
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_000424_510857_9624A055 
X-CRM114-Status: GOOD (  11.94  )
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

From: Pankaj Gupta <pankaj.gupta@nxp.com>

The NXP security hardware IP(s) like: i.MX EdgeLock Enclave, V2X etc.,
creates an embedded secure enclave within the SoC boundary to enable
features like:
- HSM
- SHE
- V2X

Secure-Enclave(s) communication interface are typically via message
unit, i.e., based on mailbox linux kernel driver. This driver enables
communication ensuring well defined message sequence protocol between
Application Core and enclave's firmware.

Driver configures multiple misc-device on the MU, for multiple
user-space applications, to be able to communicate over single MU.

It exists on some i.MX processors. e.g. i.MX8ULP, i.MX93 etc.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../devicetree/bindings/firmware/fsl,imx-se.yaml   | 91 ++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/fsl,imx-se.yaml b/Documentation/devicetree/bindings/firmware/fsl,imx-se.yaml
new file mode 100644
index 000000000000..fa81adbf9b80
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/fsl,imx-se.yaml
@@ -0,0 +1,91 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/firmware/fsl,imx-se.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP i.MX HW Secure Enclave(s) EdgeLock Enclave
+
+maintainers:
+  - Pankaj Gupta <pankaj.gupta@nxp.com>
+
+description: |
+  NXP's SoC may contain one or multiple embedded secure-enclave HW
+  IP(s) like i.MX EdgeLock Enclave, V2X etc. These NXP's HW IP(s)
+  enables features like
+    - Hardware Security Module (HSM),
+    - Security Hardware Extension (SHE), and
+    - Vehicular to Anything (V2X)
+
+  Communication interface to the secure-enclaves(se) is based on the
+  messaging unit(s).
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8ulp-se-ele-hsm
+      - fsl,imx93-se-ele-hsm
+      - fsl,imx95-se-ele-hsm
+
+  mboxes:
+    items:
+      - description: mailbox phandle to send message to se firmware
+      - description: mailbox phandle to receive message from se firmware
+
+  mbox-names:
+    items:
+      - const: tx
+      - const: rx
+
+  memory-region:
+    maxItems: 1
+
+  sram:
+    maxItems: 1
+
+required:
+  - compatible
+  - mboxes
+  - mbox-names
+
+allOf:
+  # memory-region
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx8ulp-se-ele-hsm
+              - fsl,imx93-se-ele-hsm
+    then:
+      required:
+        - memory-region
+    else:
+      properties:
+        memory-region: false
+
+  # sram
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx8ulp-se-ele-hsm
+    then:
+      required:
+        - sram
+
+    else:
+      properties:
+        sram: false
+
+additionalProperties: false
+
+examples:
+  - |
+    secure-enclave {
+      compatible = "fsl,imx95-se-ele-hsm";
+      mboxes = <&ele_mu0 0 0>, <&ele_mu0 1 0>;
+      mbox-names = "tx", "rx";
+    };
+...

-- 
2.43.0


