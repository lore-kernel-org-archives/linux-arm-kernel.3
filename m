Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23FABC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 13:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L68xQpoNQOImrr0pX29hkznmD8JqsmSvxY0s6EqNqKM=; b=W93vir+2gSHWq6sCXCa7LLHVEE
	cQQqMTBpYdPVe59Upi8scIWiQ46LBMq/1K1NBT8X1HjtrXUrPGg0yMNXBxL+WnQ9ivlhUSmKQJGpR
	eUB/tO1MDqItHGhDXD+RttWv57c1cleOLcGgTPfcJ0RLVQQ56JlOFBPOLIPuR/v3YfXzDxrfh/o1M
	FPq5fitqsTPwk6sfKB/zUuXD83uQJao8FPAkFWeT8cbwHeAF+viC9z7POrzec70P3Y82LF+ZF33Lu
	iazQk7rM9cohWsPLHF4OBW0cEU4v9no40Ovl1hHs6scPEIR92YP6WUtiAQ3jTzyd1YbAH8cv4d9Cg
	giwVTh4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjdfG-0000000CGGn-3Obt;
	Tue, 14 Jul 2026 13:59:14 +0000
Received: from mail-francesouthazon11011047.outbound.protection.outlook.com ([40.107.130.47] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjdfE-0000000CGEl-1dCC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 13:59:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wXbJZR78qzK+IEH0cg+K+rTgT4vGrRt+wj6FCDPJw0gh4Wbi4fFKfF9z7bkeADrU+yX6At4FA05lEe8xY0+sxNPqA267OLf5nom6ZkHd+DX4JmFioi8Qf6CujhUBKPI99alWk127pCXPGDJFu3mdKQjtxH/piiPNJwEEZ5gfEu/tThe+360XZM+Khc9Wr2nokCuePM40GSmVmfRThlcFHLTJPBhgw3aC2yPHeGBfB/kKvdMIe3nz0ZWgmcAc7gZ8xiHVzyKn8ZJyOE0hYznnjiHXaGdVnR/nCilCP9wOPpkLuxHwl7rJ8RO3E1gZ7IGAYy64utbIdXH/kc1Guf95AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L68xQpoNQOImrr0pX29hkznmD8JqsmSvxY0s6EqNqKM=;
 b=u/QkYOCYh/cBAJCy2JYCPnIRshtrivaaYO/N5NybTWmw7O8CH+IF6Crsv74+timpDHNtZglk1Oh3NKNScNg8j8SkTXLM9GjhUtMaUjiOBrQxtu5ExmqqzPvApgVSOLxb0hLesEqzpRaWqLxUN64jSaW4RUtI/2FQp5GDJx2FpSK9XLqS1jAtff7DJdmVYSenScqv6kerUXs4HRgYaj/mk9Lps6wALYIGcS4K86yNcC7FiZrzY/Fk9uc5b9icUbNSyRnxmpMtYVgCilTNdcbDepclLg6r/Y+DPie4TUMGaambr0evzZ/q5aH+iA96pQb10mjCfQuNBAG+k99GFRPf+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L68xQpoNQOImrr0pX29hkznmD8JqsmSvxY0s6EqNqKM=;
 b=uE6BM3pNWPwn4il0t9OUQtWIOYacNDdADmWTvLtb9EuOxZaKWIPzsjMN81W9a9DsQQkbmgZRLD/sKWTb8G8kJv/mN47tWB/vBxO3ei1vj4bD7IztTV69Bs3dgw/18ESrti1eiZYRqyMTEJfKJBZZhNujmtYBDCt/PjRdAlbL8YLOBr8mHU4xwXYM8k/InadV7bfyXKcso3v2HwN+Jrk/CUDKBgNivZqUMb1yl0dCtwhaeSKwMeA+TTBkTU+fyMlvAwTHK/7WYRt3vxfk4ZO8kThGespodrZJ9M+8WqHUR0/6B1maz/t1/Zkr6/kmEmwyabNZ3OoNo3u/7yAryOV2KA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVUPR04MB12193.eurprd04.prod.outlook.com (2603:10a6:150:33e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Tue, 14 Jul
 2026 13:59:06 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0202.018; Tue, 14 Jul 2026
 13:59:06 +0000
From: Frank.Li@oss.nxp.com
Date: Tue, 14 Jul 2026 09:58:45 -0400
Subject: [PATCH 3/6] drm/panel: simple: Add waiken WKS101WX001-WCT support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-dxl_lcdif-v1-3-6761a8a6592b@nxp.com>
References: <20260714-dxl_lcdif-v1-0-6761a8a6592b@nxp.com>
In-Reply-To: <20260714-dxl_lcdif-v1-0-6761a8a6592b@nxp.com>
To: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Robert Chiras <robert.chiras@nxp.com>, 
 Liu Ying <victor.liu@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784037527; l=1896;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=vsMMs7niCHpAYW4fTb2ICWN7awFpbxvyIE49vlR7Kl4=;
 b=9HO83l3wD99VfKrwoXrskHCH9HO6f/IdI+7r6Qs2K4RQl6XDh22zToYPFP8n2rGhlvvUaV3VA
 i4ePBE7KqOuA3ngIZJWKCd+rhSJcU2Ff0CgY/J6HqZTSsT07m9J4cj3
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SA9PR13CA0073.namprd13.prod.outlook.com
 (2603:10b6:806:23::18) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVUPR04MB12193:EE_
X-MS-Office365-Filtering-Correlation-Id: d916bd85-0a7a-4b59-2b2a-08dee1b01191
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|19092799006|7416014|1800799024|376014|366016|921020|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 93wn7ffhxfQ8JKwbteez1KcSaIYRWBlCx0noJVRCQVdKuJSwewWraTQ1/595D0MmStfmvdi/WcsRVmEulU87FxYpU5fx7lJlX3Ljr5nirLQSLE/E77k9qo8H/ZOY5z973OMQjYJXay5i/1+3AvXwZ7nvubs+AzK7y9GA7cHpbMQPDbHA7AKU9nHa3rrsgOrdXKbWq1JmDIkfrGnKSM+ys3tEvxyO8JYP3VaWCP3Jxbdc6/w4ifK6gOSzWyzspMt7seK1KGHUfnU1Lv2juZzINJGoqY1nwADzOcLSBS1iNBix0w99DeD1g7S0ltqtYJhGvm762cc9+piqvUG72VSIb/JY5JzsYC04WkhfTaBLbn0wgXHHrix7M3qnvyr8ledpFwmGenkJOl0qU+x0xwrXU06b3kc2cUguCebakEQ2CNCUJNQS4/7iwkOwWqc/zTn/j3VF9XnqkyNOKkQvj2jkI96/Hx1ViOAH3gaJNgWusGHwNi+C4WSH3hKH3MD9SJgq9qPLVieZId0I9QwGTuxXRdQTkSP+A9jYoAhZ0bo68lDgw1I/lD2Yx9AQH9vo523ckynjQ94/z0wdhUAV9GBmtZPzKm0bwh+ZzQHiHGkYgL6aJO/d0yf5ok/MHi00YbrLm6FSKcgF9D0Cf19KOJiryTkkr7FQdwvNYKFw3HxzC0zTCwyKDHH9Hl5hrWfsEmoLcxqVbvD+S1UmWObxz+UHmw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(7416014)(1800799024)(376014)(366016)(921020)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MUd5SEhsTFNWTWI0dCszcW9lLzd0dk1JZUlpNmw4TFZKNFhmOEFHcGpkYnRP?=
 =?utf-8?B?N3hvb3B6N1phbFI4UWVZT3VZTTZieW84blVBMG1jRnlkb2dON21iSlIreS9q?=
 =?utf-8?B?K3VsY3dkaHUwbzBWREVjdXNkVkJPcTJEeWhPRWZtNVF1UW56L1UzWmxpOE05?=
 =?utf-8?B?NzNubkxNUkNLMDhyQmlDNXBIYXJSTUZlZ2Y0VGx6bXpSbW1MVTJFSzJPSlI3?=
 =?utf-8?B?MThDQi8vR1NpQzVCRmluU3gvVEdQaWRwY2ZwRkc4MlUxd1I1UXRESFJQdDAv?=
 =?utf-8?B?bUljRitFRDlFUWRYcGgveG9FZ0xPK0VCd0NXVkJSczJOYjFZMXF3K1BHdStP?=
 =?utf-8?B?RUNTUVZTTHpEMlQyUCtUZnl3YWZaMlZ1cGZ0K0xFM09XamtaWTNJR0ZJMG0v?=
 =?utf-8?B?NlJWNzgzMXhKWWptejFQV3hnNTRRblJUaEFCK1VSNzJpNzhnMUUreUlobDYz?=
 =?utf-8?B?bFJiL0xRK05ndkVTOEk5Tkx0NFBWMXdUUUlMajdmUFdZdG1Zdk45SGtwNk1h?=
 =?utf-8?B?S3BHd2dDUTBJV09hcHRaUFI3RW51a21QS0RlczMyNldtMlVqcnVHOCtaQjdl?=
 =?utf-8?B?OHlsb1g0TmxtVkdFSnlsVGVaNDRRNzNxTlU4UTF6QjhtUno0V1BkbHpTa3JP?=
 =?utf-8?B?K0JxTXhVMUw4THYwdXpyVmIyZ3NaVXpINXB5ZTRzNE9nYi9oUW03eCtka3dI?=
 =?utf-8?B?b1E4cVQwdnd1Slpzc2E0d0dLdkF5alRIK05YU1hSY2QrbE5VU0krUjRhVmxU?=
 =?utf-8?B?REJVNWtlMXhYdk1OUjNxc2M5RVVVeTBpUjVxQk9zYmlBL2hjK1c0djhrY0Zv?=
 =?utf-8?B?SXRvTDk5NXRKTlArRGNTSnRsTU5SYVpIYUJNWmorbFJ1SlFhdE5kd3NZS2h3?=
 =?utf-8?B?bVdTc0JrVkZXUkJyUk9IRlY2UWdtYkdiRXlFckJJOVFwWDhWYXJrYTdNVkgy?=
 =?utf-8?B?YmVPVUQyU0Fza2R2NElHanlqMjUzckxocCswWlBSbUgwNm9yQkxvN1pnREpv?=
 =?utf-8?B?UkJKZlA5MFRkYTcwdVVmN0lpYjNtdThLeTNRUU1vTGlDcnRxejh4bytua1g1?=
 =?utf-8?B?Vk1mOE4vQloreUtUS2I0b1Y2VFJDREhCKzEvN3RVa1g5NUNoYzMyQmRBeVZz?=
 =?utf-8?B?YXZPdFYzTkJEZ0g3SlFhVXpSZTVwRXZlMVhDSHNHNWp1c0lSY0hmU0ZEMUx5?=
 =?utf-8?B?bk43aUhWUHBnaER6dFN3VWViVjZGdnhyYm80ZEZkN3JWaTFzKzRBNHFxMTg2?=
 =?utf-8?B?eWR1ZWtIYzF2M09wOVFkU2NjSGd6TVdNemlPMkxISVhFLzVzVW92QXFiRnBa?=
 =?utf-8?B?ckYvRThmbStBKzNYSU01UFZEYXhZTWRjY2J0djVEb09HS3FoTHJMWEljOWRo?=
 =?utf-8?B?MW1HbTIxSkxjU0ZiZlVBdGQwT2xpS1ZzQXFLN1JyeFlrQU55QjBEb0Z2TWJK?=
 =?utf-8?B?QUJEUDFZNVFucXRLNEx3U2FDd0l2ck43UWhKcm1nekl2aVBleENTc2xpQzJP?=
 =?utf-8?B?RFUxRGtHUmFFRDNVT0V2UkE2SWMxM2M0RUh1N3RQL0hCOUFlSTNBRXl3Nklj?=
 =?utf-8?B?ZEF1bmdGYm1jREY4UE9QaXlnc3k5d3FhTnhFTjBhNk95SDl2Qmd4NnRGYk5X?=
 =?utf-8?B?QlpVK08zSHJUZEVUMlRraUo0QXdEempLOThycC9FRFB0K1g4UW5QSkc2aGtr?=
 =?utf-8?B?WjBRVWNLVlZQcy83NFJUTzV4TFNQRWFrMjRnN3kwNEdjSGppZVVIdlVEaFdt?=
 =?utf-8?B?T0JoOWFlWGxzTTIzdnNUL2NiTU44ZUc0Zlp2cDAzZ2dDeUxsd1l6MllBWmR1?=
 =?utf-8?B?YUkwQmw4bEFQNEQyOXNXNExaYXJRaXZjTVdwMkNlcDFrc3pCV0NrVFBCZmF6?=
 =?utf-8?B?cTBoSkp3YmhxV05jN3dyTTV3MDVHZlVtVGh1b29NY05yRHM3UDhtdkJGQjFp?=
 =?utf-8?B?anlEYkFMS0M5Y09xNzlVTUVFaWpydjI5N29qRzVpRFpjS1Vkd1BsZk5reFF0?=
 =?utf-8?B?TTNEajNLc1B5TFpqSldOWTladXYrcVpZSkNhcDV0VmdmVGVYSll1LzArZGxo?=
 =?utf-8?B?RkFJTFNpWjlMejEvSEtzYnlSM2swMWhGKzIyMDRBeUcrb1IwSVlTSUxnb2hR?=
 =?utf-8?B?OFFlalRBTDVWZlEwMGVpUS81WHZEZHFrNVVJN2dFZW5leldvWGlvUWpzUE11?=
 =?utf-8?B?cEdGWjdKSGlIVGRZcWVMbjZCa2h5cG8yalcrL1JjQ0Q1Q3NXSmJGRkVXaHJp?=
 =?utf-8?B?dVFDclBkTUpxdG04TjJlQnNLeStZbVVJNjAyU1JvSFcyZmNhNCtKZ1o3ZGpF?=
 =?utf-8?B?bit1RVVhTi9yNGJNbXhwdkw0NEUyS05DVEplL3dRcnk5SnV3M2k0ZkhnV0VG?=
 =?utf-8?Q?nDU6TG0BN3MggUKo8PAkvTwpmjHitO8TtJn4B?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d916bd85-0a7a-4b59-2b2a-08dee1b01191
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 13:59:06.0253
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rjI8sEmoDESO0Lz6iLNyaAu7PYhqBLXw7D8ZTh4JgTh0ElCI5BLFbj41Q5ilNTjurMslg3YHnQaeioAHvrTL90bVeYfRgvmU5EezAO6ngFOMqphp2zjg+apO1Z495KwR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVUPR04MB12193
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_065912_449999_44941942 
X-CRM114-Status: UNSURE (   9.98  )
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

Add support for WKS101WX001-WCT panel, which is an industrial-grade
10.1-inch IPS TFT LCD capacitive touch screen display module.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index c09bf3db5e78a..26fd150aa4454 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -5171,6 +5171,34 @@ static const struct panel_desc vl050_8048nt_c01 = {
 	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE,
 };
 
+static const struct drm_display_mode waiken_101wx001_mode = {
+	.clock = 71100,
+	.hdisplay = 1280,
+	.hsync_start = 1280 + 70,
+	.hsync_end = 1280 + 70 + 10,
+	.htotal = 1280 + 70 + 10 + 80,
+	.vdisplay = 800,
+	.vsync_start = 800 + 10,
+	.vsync_end = 800 + 10 + 3,
+	.vtotal = 800 + 10 + 3 + 10,
+	.width_mm = 217,
+	.height_mm = 135,
+	.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
+};
+
+static const struct panel_desc waiken_101wx001_panel = {
+	.modes = &waiken_101wx001_mode,
+	.num_modes = 1,
+	.bpc = 6,
+	.size = {
+		.width = 217,
+		.height = 136,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
+	.connector_type = DRM_MODE_CONNECTOR_DPI,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE,
+};
+
 static const struct drm_display_mode waveshare_28_lcd_mode = {
 	.clock = 50000,
 	.hdisplay = 480,
@@ -6155,6 +6183,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "vxt,vl050-8048nt-c01",
 		.data = &vl050_8048nt_c01,
+	}, {
+		.compatible = "waiken,101wx001",
+		.data = &waiken_101wx001_panel,
 	}, {
 		.compatible = "waveshare,2.8inch-panel",
 		.data = &waveshare_28_lcd_panel

-- 
2.43.0


