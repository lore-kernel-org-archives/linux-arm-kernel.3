Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE0E8C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 19:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+t8bSkwPsFBosgCengdXujnbwvxKEGPRJ7DY11XgDfc=; b=nd3sL0iAFAXrwS1VRnyrpu8yI2
	eqLreQC+acsDixy9zZ9Bcd6EhRNWWi5Q+9qSPKH0X1LQKkwx5GQ3QDoP1qAMnlu1YCBACo0i0vE4p
	hti9FDDb/qrKWLE+j06mFIfgu3lccOCXMtkpOsXCuNVmievQ2L5igRG9mpXPu01d2a4roQL9BpPdA
	Ha04HrL8APcW+J/Cd6DFlgIoDvcS6k37SDoIGLhfubmrKfbJoYNeTRVQbiLtMCpd7qEieH20cWOow
	mvDL70rJ+A0ihLHqLseK5ZFeIFq17pRpFWIHpxNZdcQdeNgyc06bb8ZAe7BywAzy/PXec0dThVLsW
	1xG7DRBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzKfu-00000001Dh5-36SF;
	Mon, 31 Mar 2025 19:19:58 +0000
Received: from mail-vi1eur03on20618.outbound.protection.outlook.com ([2a01:111:f403:260c::618] helo=EUR03-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzKPz-00000001B4R-14Ns
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 19:03:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=If4cbY9a8SFICKUuo7szL+jDTpopTHxwdRwe36pM2JRj5ccud0hSfBWglXhr1cCjWEyiNF7imkxlXZ6iGyJs6OCQUmXDsLE26tAKVbHWPQ1nBlJswIPVgFZ53Ps53CWtjP8Uur0XlN2r3ScKr7SzTdPkLgktgmGrDkHOEHmo6NgMifwyCW2U0u/JqEayZW07mtWKyovNxjfkfyT7nwJLoggJgdHuEtX0OWPxda7Hj3hopjPaa+/32qAIRqdhrQ/xCD7LREiUPHbVx1OMmzIIdr7QPQV3M917PGRYHB2Xr4YQO/ijVSqdo4b9MEHhgkGgN+fDkNse5Wl5oSxPlYC8EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+t8bSkwPsFBosgCengdXujnbwvxKEGPRJ7DY11XgDfc=;
 b=J5KeUK9dt7adMZHwOiwLOXLii/bO4eHIkJf0SxbahHYROJ52FyAoFwX/q6wx8F/1k2PvWc+DfD8D1Bt+HrlZW12HfBdO8+FOjjGUgprLwkBC+g5s6B5t8fj5jpuYywmJvdWxloZPUSV0IoOwC6KZx7LANP2YI1MGKIny9MkmLlo0SosSHuc3ryr+6fTDyG7aCnC1VgOEh6tHMd00RQmSCNy1ZkOdTrkuO8yQDPyKjXm7kX8T9X6SO6Vh5qG9E0/04VOerLaDJJBsp2Rc4O6HSiomJEYE5Rf3AFeO3KggSCCb+VbjWUQnCcuRQfqgqFWPwMdVAJgprvaMwFN3N5nn+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+t8bSkwPsFBosgCengdXujnbwvxKEGPRJ7DY11XgDfc=;
 b=YcW1Ea7aTsqtIQaUNCVF10ZxmIsphJUieODTCldywTY38+Dm44Fxqxe5uyN9OvZYWAyWiOeZFQ+OH789mbCKOfsCjRc4yJYxM9L+oRcfDxXFhxVfzfV9Q9HYPqpfJBEN9qaS23iigpnsKXRz6bDAhArEtrQ+ogKGW4Ti5rT0md/W3yLdcwB8giBXezE9VdwZO/9HSb++PLVsUp8bO2rSR2J9Sa+P1lbto6t6JJMS4DTXyrus6muQhR/oZxMe/frCxn0A35xZ6FllgMjJ2TZj9/X5Ld3r+ZaS7FRY15SEdH6nBMsXaL6KLX13i9a9qRCr6wgNq0v2AJWcaeCcKhlnVQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB8557.eurprd04.prod.outlook.com (2603:10a6:102:214::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 19:03:28 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8534.048; Mon, 31 Mar 2025
 19:03:28 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 31 Mar 2025 15:02:46 -0400
Subject: [PATCH 8/8] arm64: dts: imx8mq-evk: add pcie[0,1]-ep nodes
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250331-imx8_pcie_ep_dts-v1-8-270ef0868ac9@nxp.com>
References: <20250331-imx8_pcie_ep_dts-v1-0-270ef0868ac9@nxp.com>
In-Reply-To: <20250331-imx8_pcie_ep_dts-v1-0-270ef0868ac9@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 hongxing.zhu@nxp.com, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743447781; l=1988;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=SxsCZ7HxktglIBU8nuSFNa/tquCqnlO9B4lfmMOW0Fk=;
 b=4nj8oL6gnyn3Dp9CpJJS/oeVCIkLQThSMHLbui7QcVMEJYddGXDq2HayhVBcSnTKi3E3WvkzM
 A0EmblX+tmNADKYvV50oD68KKQfUDAUuUuD7s7yE5jXrRnzyweZpQfO
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH1PEPF000132E4.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:518:1::24) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB8557:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ab50666-04fe-43c9-3fe8-08dd7086b89b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|7416014|1800799024|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZnZXcElJeUxRc2FUcVZzcWlwcTViSHlXVjM4N3ROdGtpTGUvRGdmbWN5bkNt?=
 =?utf-8?B?ZEZta2RUZWpZWTltMXMrdmNFaGRCUlNraEkyb0E2aytqTklCRXBWdHRSNmJt?=
 =?utf-8?B?TTNkVlpDWEYyL3kxQUJoRDlwOUJGQlJqODVlaWFNWld3RG5LSGk2TGpHTnpW?=
 =?utf-8?B?KzZsMENOVEVKRGwrd29CV01LWGoyOTMrVHJhdE44MWtPY2pCUEZNeDhPamt6?=
 =?utf-8?B?NFp6YWRjUnBHL3lyN2xtS3ZXS3p4eVVGY0hSS3NnTzFGTFZTSzV2Zjl3R1lZ?=
 =?utf-8?B?NFMwYjNNL2JyOVZRelNhaUFadUw3aFE4SnFzVndSWU4wektKK0gwOVE1K2w3?=
 =?utf-8?B?enJYUXM3TDFGOGZlNEV1dHRQVEtnbERmRU1abjA0Vi9CeVI5cGpQQ1ZhcmRr?=
 =?utf-8?B?NlUxek41Mms1V0VneWFLVUxsN3BpRityQ1pKOUd5MXkrd2JOSExuUWRTUFN2?=
 =?utf-8?B?QTV0WlAxOUUzWUZkWW5kRFNiYnV4b1ZoTDhGTnoyMGxvQ2JudjBaTFcvMDBq?=
 =?utf-8?B?SEFyTFd5SGU1MnJzbml4bzdwZkhEQzN0c3Y1cVBhOUVQZG56a2UrUVRySUdi?=
 =?utf-8?B?Q1VFWk0zeHN3QXNiZXpXcEVMcjBLT3MzVmVtcWoyRjltTWxyRjQyeUxtWkUw?=
 =?utf-8?B?Sml4NXRDRjRaenZqNkp3eWlJL2pobXRHcWlJZ1dkN2NRL0lzT2RoOXVIREZ4?=
 =?utf-8?B?bTNINmRLM2Z0K2orcmVlWTd6eTkrKy8xY1FBb280N1c4N25WaURVV0oyV0Z3?=
 =?utf-8?B?NmRBWG9OVDlSajNqdHNNdTVHUFdoamgyclV4VzZjZW85WExLcmJIQ0M0cm5m?=
 =?utf-8?B?WVhIMG52ZmlYVjdjbFlsODRrUU1JV2FlNVlMVFFTM21lblB1K2NZWks1Qks3?=
 =?utf-8?B?RnFYOVlwdERiamVodnZjK2dyVEZVSmhKUzhmTUtYL1BLdktLK0M4K2lmcE5i?=
 =?utf-8?B?Q0RvRW80OUp0eFhoTS9ZZ3hrUnVEYnVUaVhFVk93ckt3anJuazZOUmxJMk94?=
 =?utf-8?B?eU11a29pVllMSTd0d1QwdVErTzlUSFlBNGh0TDQ0R1N1NVp6YkoxVVc1REQ3?=
 =?utf-8?B?cVlvcFFJNGswbkNwOVFyQTgrRnlUVTJhSi9YWTY2UGRXNEpxUzVoV3FlQXBU?=
 =?utf-8?B?R1FPdG9vSVJ0QXFhMWRYR2x6KzFQdVgrVGNJRldXdzVJR01GUXEzeUVibFBz?=
 =?utf-8?B?czVTVFM3NGRtQkFYQ1VqaGlyTUd6Kzh5SjNZYm0rSWpMYkhIbFB3djl6SXov?=
 =?utf-8?B?TENnNG5mQkZWWUU2UWs3UUwwTE13eDJRc01SOUhPcmdJN04xSDc3YUMxYzR0?=
 =?utf-8?B?RzJRUSt4OHJvcTNaUVVMVHRpQVp1NzBsaXJkeTFuaUlBOHI0Q0p5L3REMlZa?=
 =?utf-8?B?bGxsTy9qbzhHNDUreTlJN1pMc0NMOHQ4MzIxdmZzdGhIcnlRaXc3bHhITCt5?=
 =?utf-8?B?NFV6VmNKbW1sVW9KMjNkWUkzeENpRmlNQjhrR3J2V1RUTUFVWEphSDZDclJ2?=
 =?utf-8?B?MStRUit0b3gwQjh4N1Q5ZExGWHh2SEkxY3hiSXE2ZGdVQjlhZWtqRjZhSXRM?=
 =?utf-8?B?MVRiMUU3Y1BvT3BORXAxWXpBOUlTWXp3OUR4S1ltdVNwS2pMN3c3aW9xbDNy?=
 =?utf-8?B?b0gwMlpSczVuclNiOUpwQk92QllDc2RDRlJTZFdCYkZma1FaWUpneFZQL3Fx?=
 =?utf-8?B?dGkvZFJaUzZZQVkybXBRRER5eis3L1lHZG10S3BCK0xoUUYzN3E4QVphMWdS?=
 =?utf-8?B?a2NPMEo3WnZKcitVVTRRWFJtS1hBNFR5VGt6NVRvblo2OUZXckd2MVNCaWRo?=
 =?utf-8?B?VCt1SDRKK0Znb3pvZTlZMDY4Ny9CcWMyWnlUTDREYUFEejB4NUFNOHpXWHZG?=
 =?utf-8?B?RlBZY0pCUnlhT1hhMXQzaGVFM1NqOVJWL3hPbHhJMUJ6K0ZheU1tMkpDcnUr?=
 =?utf-8?Q?W08DndiFmsc3RyZd7ZBkGNsRrXcuZur1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(1800799024)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEF3WkdHdXNqa0JkUVJ0TTJmb0tDWkxtbWtneXk2Z0xVd2FGazhUQ1lYZHhR?=
 =?utf-8?B?dmgxSnh2QUg2K05PV2NqSkVhSTQzcEdVYURHaEoxSTdORDMzM2YvQjQ3ektO?=
 =?utf-8?B?VmlpNVppdkdwcjg1WkJJYTFGWnpzUGRyb1FnOUpsckVnTE5SbE9uL0p6bXpt?=
 =?utf-8?B?UXhvNEtoQTg0Vzl5dDlpSU9sNTFtNzFmTzZQamtyZndzWlFqZUpGVnJmZG1D?=
 =?utf-8?B?UHVKZEhhQ3VHVFRwQmwzMm0wNWEvdVVZMUYrS2cwS0tDdUFxclo4b09waWxn?=
 =?utf-8?B?N0pFdUJEU1IwYzQ1aThKT2pEdG5RdThlOEpWTjl5TFhZV0V1RzhhVWdFRzIr?=
 =?utf-8?B?cTlienRjZG9uaVJjc0JuNGtvb1dwRWY2aHBacmZxOFFPM2FDOXZSZEF2a3Q1?=
 =?utf-8?B?dmxVckt1cE5KUDllVklqOXhvNnlrNTR2SUVVR1JFMHpzaWk0cllpZnZ2eExk?=
 =?utf-8?B?YjhTK2VXNG5YdGRqVzZGaEFQNnJlOExCRC9DeTZvOTVGcWRrYWgreG10RXJ6?=
 =?utf-8?B?SjFqampJMGRKMWRuK0ZkZTQ3SmxGbEZ4QjFjV0haSklPQ2Vza0RpUGUzNHlm?=
 =?utf-8?B?eE0xWklqOE1halB5eXlqdjBhdCs1eDhQdU5OWlVPbG1oRGlaQ0dPYlRjR1k1?=
 =?utf-8?B?RnZWTUFiR3ErbVU1dUlRbElpWlVWTmwzK3Z1SndlQWR0Z1F1cFVLd3VnVTA0?=
 =?utf-8?B?ZmVkNWxCaW1vNTYyOCtET21HdnlwNnpMaG9mN1VwMWl1NFg2eHY2VTBDZzR5?=
 =?utf-8?B?UThNZlREVXNPTm5lVVJpRVdISmVuWjlvcytQT2xDenJZMHpkcWxBUitTUXJF?=
 =?utf-8?B?aWtFb2xGSHROOGRjM1NsQ3lPdStvek5ZUmYwZk5rRmxOdzFZTXdzMjRoVkh2?=
 =?utf-8?B?WFZ5YnI1OUFNaUhDejFyVEpkZDFtVW1ZUlRDY1lwdThZcjdqZEs4RGNBbWF0?=
 =?utf-8?B?dmJRQUloYVNLZWtpQ0pXYU9tUTFIanhiTjEwRU1mU1dHQ0dRaXVsMkN1b3hm?=
 =?utf-8?B?Q3V1aTFIV090T2w2ZlBrNDl4V2t5d0hnZXdIZzRQSDJaR0MwSnFHR1ZNNytj?=
 =?utf-8?B?eEpJTGtoWVZNaDI2TDlMMi81TjJNMTZuNHhhL3MzS1lMa0pka1lOQnNBRTZ5?=
 =?utf-8?B?dDFLejJEOFkyeFZHaFpoZmVUWnA4U0k2SzRVQkdqNFN4T3lSMGRiU2g0c1pH?=
 =?utf-8?B?b0ZINDlvaWxaWEpHd3c1cFg5LzJ4YlVRWnV4NWVZWDR5NldhSnQzcVFDeUZT?=
 =?utf-8?B?NW5HRSthTDBldWp2cXNsbXl6bHhKS3NzM1VrUmRhRldvMVFNcHFlU0VaVHhW?=
 =?utf-8?B?NXI5cDQ4OHVQYWlvV2VYaTc0ckVpZERBbGhDUE9ZekcxYSs2Rk1STzZmb1h5?=
 =?utf-8?B?eWRnOS83ckFTYkdOT2FOWlA1TjVqT1RRQWZDRHZxRlB6eVBYUk04cTUyTGxU?=
 =?utf-8?B?ZWh4a3MxbWFrbUdOd1JmcGRMNmFiQ1paQXV3cEY5amtaTzVHamRQaXU4aXo2?=
 =?utf-8?B?alRHU3gvcDZCZzJSRktodDFIN1ZwVlRjendmc0ZZZXBSZmRkQWE4bGhMWXMr?=
 =?utf-8?B?Tmk4V3JLUENoYjdSM1EvMXZobDF0ZkxxMnRYaEZaTnRmTVpUOU1lQllwRWlN?=
 =?utf-8?B?c01PVVF2UkF6a1RWeUpjeVd3NU1lbmowZlNpY3FxVU9GZU9qZWRiRVUwT2RJ?=
 =?utf-8?B?K3NlNnMvbVgzSXNZR1hYZXZEYzMyb1dQVXNoQVgrKzljM3BUaENhc3hlaWs3?=
 =?utf-8?B?cTl3dXhOdENadkdIM3R3OFJ6VWxWcDVVWFlLbDFtc3pKZW1XZVRkcWRNQi9i?=
 =?utf-8?B?Q3VWUFdseCtpZm54Q0xEc25FS3graUhvUVI5b3RlYlRaNmpxTXVqb1F2U2Yx?=
 =?utf-8?B?aTQwdW9uUGxvMFM5RVZ6SWRGRjUza2NIaUJraEhlcVlRZkptZm5TWGtrTVhD?=
 =?utf-8?B?b2FWc0tWYXJQRldYYlRld0hOMUw1L0VnTFNQekRtT0xKQ24vZ3JLZmRNL0Zr?=
 =?utf-8?B?TWZ1RWdyaFdiWndPdDlFYnZ4dyt1OEJaSDRJY3FQcDFnMCswVENidUJRazB6?=
 =?utf-8?B?VjFPaDZRWTdSZGsrZ2xDRkJuRGFIK0pPc0Nkck1GVmJheE5tWVJXa2gxMnlW?=
 =?utf-8?Q?8nsW31V8dlns3ION7Of5xZzyz?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ab50666-04fe-43c9-3fe8-08dd7086b89b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 19:03:28.3386
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YVVTkc2WkXo//4fk8CU5OE2KdgrvJVYGxAYtuE3Bnusj9SOA/PGg7XDTyoT0b1Ng+WB/z7c8n1MwFADFkc34NA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8557
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_120331_300422_497E7B92 
X-CRM114-Status: GOOD (  10.60  )
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

Add pcie[0,1]-ep nodes and apply imx-pcie1-ep overlay file.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile       |  3 +++
 arch/arm64/boot/dts/freescale/imx8mq-evk.dts | 20 ++++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 4f2f50203dd86..205552b4e4985 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -260,6 +260,9 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl-lvds.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx8mq-evk.dtb
+imx8mq-evk-pcie1-ep-dtbs += imx8mq-evk.dtb imx-pcie1-ep.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mq-evk-pcie1-ep.dtb
+
 dtb-$(CONFIG_ARCH_MXC) += imx8mq-hummingboard-pulse.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mq-kontron-pitx-imx8m.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mq-librem5-devkit.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
index a87d0692c3bb3..43e45b0bd0d17 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
@@ -377,6 +377,16 @@ &pcie0 {
 	status = "okay";
 };
 
+&pcie0_ep {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pcie0>;
+	clocks = <&clk IMX8MQ_CLK_PCIE1_ROOT>,
+		 <&pcie0_refclk>,
+		 <&clk IMX8MQ_CLK_PCIE1_PHY>,
+		 <&clk IMX8MQ_CLK_PCIE1_AUX>;
+	status = "disabled";
+};
+
 &pcie1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie1>;
@@ -390,6 +400,16 @@ &pcie1 {
 	status = "okay";
 };
 
+&pcie1_ep {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pcie1>;
+	clocks = <&clk IMX8MQ_CLK_PCIE2_ROOT>,
+		 <&pcie0_refclk>,
+		 <&clk IMX8MQ_CLK_PCIE2_PHY>,
+		 <&clk IMX8MQ_CLK_PCIE2_AUX>;
+	status = "disabled";
+};
+
 &pgc_gpu {
 	power-supply = <&sw1a_reg>;
 };

-- 
2.34.1


