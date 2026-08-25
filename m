Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B69A3C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 21:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hG9QYktOf8DNI0VXy1U1nlRP80Vi9HO8MyLBrmF7x30=; b=c1s6pi8/Zumi1C0MyMH/CjJAOA
	hJ+oy75pxQzpBDZjblH8ZPZfn9QNkadQjZztYozQnRaXFw39x1xjvyQFum5kJ2aW2qeRcIjoxynQJ
	TmJ5QFNeAcqEltP4XF9TKlzO3VigZiznwUiH4HgFoh9HCBTJfsMYhVO3vdPG+DGVNofBj/1/00ThI
	DYcJGRPq3fRZ/o1Khtu2WQ/4wRSo159j33TSPsouPR7+7TyUj/pEU+eQF75DndqdSD+9bhm84FOTw
	E8YDZjj9cSSwpIFinfGQDenlJBXNK1Kwn0apexEyJYnX7Xa6KQKe2Dm1uMybNvmMU4gahtf2IQcGk
	cJDS1xKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyyoZ-00000001Xjj-45v3;
	Tue, 25 Aug 2026 21:36:16 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyyoX-00000001XjD-2YiH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 21:36:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Co2nsUrEsUOHx0uuJpg2RjLFFSxWoa8dAyRzXqaDHxSXrqZ0nUXTXTlwVO016zFnBZo/Cox12OFVnpnOy/psNjfc3KnIcOmnxXuALoSLnrjjYRytslgygACwu3neSbhBknVe0z3kkmH0aWEUDembrM0+kgbIXNCRsL6xvWlOX4Pcwn6c+GGX4FinbWvxQXsi68rns3fmXPSKwQVE1QqG88qMALIDws8sLlxU1wAH7YR5nep7NXwu3+Bh0V3nKurEIVJkJBLK/8LU2X2YnQoXzyX7RXOD0u3TgEFEbCPhUszP4dD04uFgc24CVHzcKLLyMPm8rKfhc0acv4zJC7GeJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hG9QYktOf8DNI0VXy1U1nlRP80Vi9HO8MyLBrmF7x30=;
 b=TQGvhEFBosL93kOaHfAM2IakvLuG6mDYzcRUucmp0cpyQYvfi6tE0/DwhwkY41Tw6a1ts/Oj4I8iwAUuM3RD426MSJpfUHUzynmyh5RKlVcVSmmegXnRaOxcJxnnQ5tvUFeGi79gSdcHNrMUarqgu4brMXdDG7ogaIEfxukNqGBjHzmkvF2YxyHJQ9ymtxhy2ADWDGSS/4/epQq4qDZpSaJpBclAl2fVP6HTVjcv+6eCjbcCd70Q3C1pHU43FMZzZpykpYaaqXtkrlBrIaDyH9CMC+LjhdPuDXUVW/6DmAhHvDYpLti9wU28+qIEcVmX7s/PhBQo96fXqgEF/pReQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hG9QYktOf8DNI0VXy1U1nlRP80Vi9HO8MyLBrmF7x30=;
 b=KhESHbcv1199lyooRpz+7PbEdykCuwM+uuTxsybPV6EEs00uo/L+irLHXEvGF1fKGkQWuOU6dRiLdMYv9Ef87DVCrXwCUTVQOjSQYhQCWBQ+n83FFsG9DvDCT0hpeIrKanDMiW+RjwcIrxCNppwHVqLPjmWbVHSf8fMU0T1+WK0IbkwepMyC0hnABmcEjOEiGTVL/Kq6CDzaZLTAtvX0+miGJ5w0shII2yUTDLPM3RZGKk1ci/z2ELQq6HlPz68tK7j1swx1tKNL6q371iOV0c5wHvW+dEiNCYXan84miA8eDnRvtBiaoe8S6ERQEMmnxu/f7tODaG+drGiknU3d5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by MRWPR04MB12047.eurprd04.prod.outlook.com (2603:10a6:501:94::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 21:36:07 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 21:36:07 +0000
From: Frank.Li@oss.nxp.com
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Mehmet Fide <mehmet.fide@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: Re: [PATCH v5 0/4] ARM: dts: vf: Iris carrier board for the Colibri VF50 and VF61
Date: Tue, 25 Aug 2026 17:36:00 -0400
Message-ID: <178769369827.2268812.12074593017392848803.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260814074700.2491256-1-mehmet.fide@gmail.com>
References: <20260814074700.2491256-1-mehmet.fide@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1PR05CA0015.namprd05.prod.outlook.com
 (2603:10b6:806:2d2::24) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|MRWPR04MB12047:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ab05b5f-cc45-43cc-44ee-08df02f0df8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|19092799006|366016|7416014|376014|23010399003|56012099006|10067099003|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: 3n/y+EPa7cpw7qToPC9jyCgoctA1AEYR2y5byWoeFz/+VAKdTaCgIo3de7LHF29kx/QSYmCuAjmHkP7PM3OiqBL4YHkK095TCVdplI5c8UdrWCrDwJjZx/6NAXHHdZawEfOqRChdE1it2lGK88p5Y6jC+iy7nUv8TBhlBt9TExBJ+RX7Fb8OwAiq4rprScsK8ZzlqdIN5NrBxr3spFkshJiibefaVCechhGq6o+qvhEg/06ITG7Wte+lCHH2rM6HoAafrZuMAV1bB0rK+tiDHVG9H1ma0R4H89zA3S2HDFum6zX6UqvtA6f2dGvCz1sFuUwYfzFTlLJc39BCRp1qvUM5ZP3JBx7a5xVBMFSo6S8GUL8sU6d2/j45W/eKwf+67LhmseMxawblowRPLVaH5Br3qYEHzs4HcQjP44+A4XqTOEkntI2CHccie1uLN3j/G9boFmBrF+ueSC27axhFfjYU/fv7Fg5ATSNa/y79clKBGipkhENFXUImZzP022J4wzksNgwqJGQW7bYE+g2duuuYPXwiCe7EIS64oBN1s0LF6m7Vk+Lk1hyvIkBbNF3nBj57pw5D2MzR4kCoE1DSilgAvk8X/gdyWVMu1uTyQ0pPJj4TosYrtILJJ90ELvqyV1eJcuuhZp8I+YvGnPrNtI83FFxUx/T8kNqePvqBjGA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(7416014)(376014)(23010399003)(56012099006)(10067099003)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N254OC9ZdGt0dVo2cG1lSzVJNWxwZXRFTjA5am42R3FVZ09nUm1Pa3JFL0ZS?=
 =?utf-8?B?V01JVVBJTU03ckV5Sk1ldDkwN1BDZGVpOUdIcnhzc3Awc29QSkdxWlIvbHVQ?=
 =?utf-8?B?d2dQcTlOZEFhT0JyYkhLdjFoSjJWZ1poN1NkZm5RZXB3MGczQW5wbG5XcGVZ?=
 =?utf-8?B?aVpZOTh5OS9VRDZFQXFXV2VHMTM2MWw4VmVDeFdqL2FheHFwN2ZLU2hObkZC?=
 =?utf-8?B?M3FVcjB3N0ZkcHFieFMyUnBlZWszNVhvZ3YyN3ptMVRac1hhM0l2TklTSUxI?=
 =?utf-8?B?TlJLNHNHZ0NuMTN1OVBNOTVwbkc3NC9LejJ4VklPallsMUxOcGdsaU9zUEhY?=
 =?utf-8?B?dXphSGVEUjFSNU1LYW5IK2s4NlZZTjhNWnR0ZUluU2ZjSzVvUE5NVy9OYzRk?=
 =?utf-8?B?ZUo1THdmNUlreXZCdWlCVG9HQVc2OHdvMDhNS3FkbzVIZU1SUVpGM2xzSzdB?=
 =?utf-8?B?b091YnlYYkM4UHBwN0pkNlc1YTdTeW1KQk9YWFczb1ZWRS9MYktHZStodHU2?=
 =?utf-8?B?SXRvdDZNQ2Z5alhFYkxzSmtsTVExVGZKYUJkVC9iSmJrU2hQeks0WXJScVVB?=
 =?utf-8?B?RVhWWkJaSGZCQ3F6YTJXUkJndjFKdEdNMVY0SHVNOCsxQ2prWVdyVWtOeGRG?=
 =?utf-8?B?ZmdobmVXRDc4aDhXSG9OTHFERXorNmRuWEhDUWdYTVFIT3p2bHgramdjbWV1?=
 =?utf-8?B?dWszbGc2R2VNSHFvdGxubVdkVTlCQTVQeng5K0s2SklMbzhKWVA4QlI3K0E4?=
 =?utf-8?B?K05lMU1WQjRkNDl5NjJrRkcxTy9VQnZjbWNRWnE1bTByZ1BmZUlYMzRpdU9J?=
 =?utf-8?B?WHp6Wkl3amVMZ0NhWnRGY3BYQXpCaVhtdWxlZ1hHeWU2UFNkVnVTTDliVGxW?=
 =?utf-8?B?RWFRWlM2U1dVUzFvUFNhNkRsSGVoa0JCZ1Ntd05hMWc5L241ODZZNFFIMnlk?=
 =?utf-8?B?K2d0TVBQNi9abUpxalpHZU56TlJXMVZ6UkdEZGFURFRGYm4vUmNHNnZJak51?=
 =?utf-8?B?elZCcWpYbndzNFYxaytTOWV5NmJ1blhMZERHQnFOQUZhTnBPamZZMUhRZGJa?=
 =?utf-8?B?ZlZ4OWwxTHJLQmk2LzhTbm9VWkFwbTFHKzJVL0ExTEdiakpISE5RbFRObHlL?=
 =?utf-8?B?cTVVeldiMDYyRlpDYVVzTWVJcVF4YW9KeEJrZXYrQTMrNTdFSk5Ea29WVHFx?=
 =?utf-8?B?SUJsdjdabEhZUUlENkExMm0vOHRTa3JObEs4d0RjTjdGSHR1NThoSHp0TTNP?=
 =?utf-8?B?MFAxWDVHekFiRzBaY1BTOVpTV1NrT09jWjRuQklTLzdJNTZhSWFSWFBadDFU?=
 =?utf-8?B?dE5sbDBLSXQreHArZXNpRWZ2ZjZkcS8wNGtRWlgrOVJxWUhSTVNtTVAxTCs1?=
 =?utf-8?B?MHJXMzdMK09sdmJpV0h6bmw4M05vUk5oajRrOVNaTmFVY2lUOHRwcDBiRGlp?=
 =?utf-8?B?NFZRRDBBOWUwRWQ1WmoxTllXd05ZdmNyTVZrSTVBQzZNK2U4WDkxcnQrQk9n?=
 =?utf-8?B?emtSVDVOZCtsSnVseUIzMHgrdnV5Ni9zWkkwNCsrMjdHYjZhZW9jS0Vpc0or?=
 =?utf-8?B?Um50ay9PTXJhNFRENy8vdmI4OXd1cjVyd0NrZkU5aFZCTFN5WWZuL2g3OWpW?=
 =?utf-8?B?Wjd0MXE0bTFnUkkzMFFhSVRQdWNIZUpGMThadWZBQ01oWUhpREp2NmFQdSt6?=
 =?utf-8?B?dE81anRXQWd5RGJrN1pBK1Q3RTdzdjBYT3hwMW1UN1ZBeDRPYk9idWJxbG05?=
 =?utf-8?B?Ty9oeDRZaUhZWWFrU0ZKelhPTSthUW9IaEtqODV6SGtxZ3lsVkNNb082cHlq?=
 =?utf-8?B?azVielk5dEhDZEo4Z1k2dEF6dGkyRHB0VlhsUkJHUWRUaWxCdFZDa3BPUUlG?=
 =?utf-8?B?M21rSWxFRHZ2d3ZrSU1zQ09NdGtZdVVwU2M2Z2Fmd0ExZkZkbnViNHlOUXF5?=
 =?utf-8?B?S0RoMHdJbG4xQnpuOWNSako2d0RMdWt3S2dzcklvNjkvcnplU3lGV2RjeW9L?=
 =?utf-8?B?ZTNNaENCSjZKZzBSYXdiY1FoaFIxc2h6U2NFK25zTE5WdjVPRXo0NnJFRHZ2?=
 =?utf-8?B?OUJSSWVaVFRDMlBYUTR4d3FROU1HU1FFdnlUSk1UWXRVUGlZdDhuSlVkV0JQ?=
 =?utf-8?B?b1RCWE5NM0xpeStCcTlDeU1DZ0d3akQwekVPMFUrY0dGb3lKL2JsSEwwZ2pK?=
 =?utf-8?B?VzZkSGo3Nmt1M1RWUG81MUs2azhpK3drekR1bUdiVXZKOHJ0Z1p5cXJSbnp4?=
 =?utf-8?B?ZUUxTW0rS2FNQ3d5d2RwYTlmbkg0YzBUYUQrOWdXdDZ2NEhUT0owbnJxelh6?=
 =?utf-8?B?UzFuNlJUaGNTdXpxbjlYQmJGVFZUZXhFU0pwTkdWRTVhdlk4RjEzTkdzSENH?=
 =?utf-8?Q?QOy9VdVm/1aJ86CtV47Rml0S7IRCEHzZUGxs8?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ab05b5f-cc45-43cc-44ee-08df02f0df8f
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 21:36:07.8371
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wotjH23t0ugAHvaPXDo8F04DlZMH0AzmDfqe/1bQQrCEglV6X0sHGi9mZQZXH6cbZNfgyJppuOmfytezVtNguqhQu3v9PjSIkLSbl9HCv1tTHxUv4Ni/MjJiD4+KU4Y3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB12047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_143613_665891_91A8A356 
X-CRM114-Status: UNSURE (   9.97  )
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


On Fri, 14 Aug 2026 09:46:56 +0200, Mehmet Fide wrote:
> From: Mehmet Fide <mehmet.fide@screeningeagle.com>
>
> This adds a device tree for the Toradex Iris carrier board carrying the
> Vybrid Colibri modules, plus two small preparatory patches for the
> module-level dtsi that the i.MX Colibri variants already had.
>
> Tested on a Colibri VF50 on an Iris V1.1, most recently on 7.2-rc7
> plus this series.
>
> [...]

Applied to imx/dt-intend, thanks!

[1/4] ARM: dts: vf-colibri: apply the EXT_IO pin group
      commit: aff53f8f5831c55cba94e0588dcf7d1dcde8b75d
[2/4] ARM: dts: vf-colibri: name the SODIMM gpio lines
      commit: 04f9032ad6b65fe527cf4e3e825be3556ba92ad0
[3/4] dt-bindings: arm: fsl: add the Colibri VF50 and VF61 on Iris
      commit: 3d8a67a1fbc8a18b99acfdb7af06d79e4f4ebcb8
[4/4] ARM: dts: vf: add Iris carrier board support for Colibri VF50 and VF61
      commit: 43d4b5153ae513d03b45a5767aa084b676302c72

wrap at 75 and fine turn commit message, cut shorter

Best regards,
--
Frank Li <Frank.Li@nxp.com>

