Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E5EE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 21:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	Content-Transfer-Encoding:Content-Type:Message-Id:Date:Subject:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=M2FNRg10a1brC0ZLMD6Q3Fg5AEOltEDfVOWX7F/08YY=; b=LSUwNUoRg3fcCrVrDfBTnLMcQ2
	tAIytXhyx3/08ciFdji8mET7tiCGzKj/NQEPB73x/dJM4KeraaNBUNEoxD0YsqdWL4hcNKAoT/NOK
	YsBdXtvN/Oqa4s26mrVNd6UjzCh4tlc9R/aE8as5J9/abK91wsD8g0DOi0VihRcels8fIbIZxK9NK
	bzl1XnVs88qGLvtWNqW/f31zJzt/YZZ2b1DnFvIlJHVEUCkqRg0+CXN759itX+pLNcHKvNdeQtaW3
	gZrSG9pPCMg8iZbsjeT8Kldd8zt8S1rbVixZjPppPWaD4K7FU4iCve+BBfCch+3fQUacnn+C6nCcd
	yQq1WwxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL7mX-0000000CoJx-3GQ4;
	Tue, 10 Dec 2024 21:28:37 +0000
Received: from mail-dbaeur03on20624.outbound.protection.outlook.com ([2a01:111:f403:260d::624] helo=EUR03-DBA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL7lT-0000000Co4R-31K2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 21:27:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jUvqtYcadrxVym8P9PIUOAdVBDAuFQQ8nXkUvdOgb9VfUsnVuqr4eyItMQT9DbxqIpBMBpgQ23PQdW6aQTqqvqb5HG2G/fVJa5cH3sgMkZP9vrtITQZT3ZzaIVsZOkmHmIGyUMIUexNsGtC0IG2V41GLyMG6z+KOTbFzY0E7xGLOsLvcYtHpyqcGoX4W9m0V1YLn+t/DXv/gLQ52yu0liByc3+O0O/ofQZhx+zjxSfOvl1yHkHGP616X626eLrSe/YNQ59R65sXqpIRxFD/XqJP1uHH9y1E/IGYAvMRCEUFVRypIWkog1feV2LQ09CH7B6zTqM5tLpsMK0H90nRemA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M2FNRg10a1brC0ZLMD6Q3Fg5AEOltEDfVOWX7F/08YY=;
 b=oIc5rzjYdo1Nmut1kGn+eJ3Yba72lQK6KrXFDnhhLTKBevn0xAgIPTccukTa7ny1bhcwYC9TtO9yx92+kXycIJS5fC1b6ptywTPmsng4/i+G9TP6su2vKdxjWACURZpTkm0eCs1Pjb6VsO36+TsLbAnV4KHjCw75fPhsUz3stOU6jT35gKn5kG+wO49J0iFCHz1gtay9KiZOOR7gCnT8GUwH9vY1DMqyJpLRJiaBIH7ormOaJD1F9nwAuyrX65RWZJUP7SwB1oaaYzjUY6lcrFlzDdBRhpgkOFZojwiRzeiU/QHNMaBenbtwZ5V1A5m5zmZEfWFvD90ASyQLLbPhNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M2FNRg10a1brC0ZLMD6Q3Fg5AEOltEDfVOWX7F/08YY=;
 b=A7NOKnDRBU1sEpf7RnhaTr8Ch4BjJo+LVsyJepjGi0AI29bszq7xG+xYOQpD2Db3fBmlLSQYhylPQB2ArzQnZX6lyqw1QnHx+TXreUcIMvWvaFeM9goEN/Xt8FPzrEOPFrR0tFjiEplhrj6I+seP109gb7iDp1B7Jgh+UcJU5MsvI57HbKPHIXp4hOSL4X0qHM1m+hEcvDxJ/geYXzF1s6CIp20aL/PDPcUekiQiJckSxiO5HjLl2X7tAuqkd6MHVEAdGZ0mhifYLZxHBm40tbW0BGgPSzH7WRNdm9YNB7RoLrvKdg50uYhv2/xu8Fax/n99LaAYMss9phNUm7xJKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA4PR04MB7550.eurprd04.prod.outlook.com (2603:10a6:102:f0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Tue, 10 Dec
 2024 21:27:22 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8230.010; Tue, 10 Dec 2024
 21:27:21 +0000
From: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v2 0/2] thermal: imx91: Add support for i.MX91 thermal
 monitoring unit
Date: Tue, 10 Dec 2024 16:27:01 -0500
Message-Id: <20241210-imx91tmu-v2-0-5032aad4d88e@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACWyWGcC/23MSw6DIBSF4a2YOy4NoAboyH00DgiPegeAAWtsD
 Hsvddzhf3LynVBcRlfg0Z2Q3Y4FU2zBbx2YRceXI2hbA6d8YJwqguFQbAtvoj3XwtCBW2mh3df
 sPB4X9ZxbL1i2lD+XvLPf+gfZGaFEyFGZsZfC92yKx3o3KcBca/0CyrccrJ4AAAA=
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pengfei Li <pengfei.li_1@nxp.com>, 
 Marco Felsch <m.felsch@pengutronix.de>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733866037; l=1284;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=6QvioNdLBxHT/ITBdNt/yr8/AuwRCdJA2DWHZtE2U2Y=;
 b=99XTYUPZ6hf/aVlRDKL6jwpwE8Z2Yl/8OlykUCI0tXSjYTjWCwwQtVWnrCfyuV7a9L3uNXlFa
 lbx+6T0B4ArC+6o8lEoKWP5sSmqQcd4DW/UBicaAxlxV1LDHuNeG6ot
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0P220CA0018.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::28) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA4PR04MB7550:EE_
X-MS-Office365-Filtering-Correlation-Id: f22955d0-d4ce-4096-e21e-08dd19616eb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WmdCYzJYQ1hVemRnSy9qTVV2YVJVUURVT1Q4aTE5cjc5WERGeGM5elkzYXRt?=
 =?utf-8?B?Z3hlL2V0eHRkMkFjWWVteDlTRGZmdjNYVmJyemsraGcxZmcyc25MUDlYeUZK?=
 =?utf-8?B?Tk1OWThpeUlXak10ZVlYWkNXV09OYU1CaWpTZWU4QmdVWCtiWXRSWUd0WXdV?=
 =?utf-8?B?b1E2dzllT3VSMjZRMHhtanVYSG42UnIxcHNqcFlCc3lLcjAvbjZXRi9BcjJM?=
 =?utf-8?B?Vll2ZHkrMFJ5V1VJcHU0cGJ5dUxJWHIxTFAydWxUbE9ubHV5dnNTaVlOOTBI?=
 =?utf-8?B?aXV1bU5JRk5KT295ajhzbmkrUDlwUWtPYUpMNnpSdzBlYlJWRTRrbU9URFBU?=
 =?utf-8?B?U0cyaEErRVhsNEN5ZFhER2crMlF1RE5yaktlVEhkS3hlU2Q1NUFYbzZCQ0x3?=
 =?utf-8?B?ODZSd3ZucDJTL0JBNHkzSmNYR2lBWldWVGRCT3BoVXJ2MTFZZ1RxSnlucU5t?=
 =?utf-8?B?ZHdUd2pHVmtFUnpyNVU0QXNacE1qalFKTVhoSG01ejVYVUZoZ3UwWkpic1BF?=
 =?utf-8?B?TjRsOTVaQWRVaUg3OFJvbWd3VEUzZnRwOGlzN29KYnlkelI2S2U3VWJoL1or?=
 =?utf-8?B?KzdWdjZUdG1QMjhpclFTVGRoR2sxNUFkYzU5QzlkVVNuUXN2S0pSc1BoWExJ?=
 =?utf-8?B?MlNBNEdwV2dhZGN2VEJaZUk3UmdGaEVmNFlKdkZtS1NxU2lNYXlBNHZGY0RY?=
 =?utf-8?B?aW5ubHllUCtYQWNTMmx2UURSdUJjY1NMa2llUldoclZCOFFvZFZYSldCU3Fy?=
 =?utf-8?B?djJwcmd3NHA4cjVXWi9meHB2eDR2V1BwOWhPQnllSVB1eWZDU1E0RksyVTJW?=
 =?utf-8?B?UDBQWEJublN6aGZIZlBkSDhVSERyUzhRSTlLVjd3RXJ5ekk4VlBGTGM4UzVE?=
 =?utf-8?B?aWFQWk9kQjBuakpnbVEwWE9DWGM3blBmNWJCNFVtVi9TZTNkWnEvU2Rrb2FN?=
 =?utf-8?B?RUdaQndEQXJHb0ZHMUVmZzRQOFdkdlJCeFpBNDMva0duV2VFdGg3SlUvV204?=
 =?utf-8?B?ZmRYQTYzVWdPa24yRi9rL09NYUdJVEpqY0duSEVQRnJJMFRvV0loS0Y5T0Jq?=
 =?utf-8?B?NjR4QnpaWTY1a3dFRFoyTmkyTHVDdktYU1llUGJxR2dDVThjQjVQdGsxZ2xH?=
 =?utf-8?B?NlZjVUpRVTNBS3dUVDdSTnRERkF2blZqbTYyQU9ua3p3Um1oVXBzR0twSjM3?=
 =?utf-8?B?NWQrMm5hdFNQdDV6R09KekZmWEIwM0pIN2F1SmJQcDZUZVRUeWwya2wrYVRp?=
 =?utf-8?B?RjZSa3l6Q1RvdjcrRGEzcWFwdHpiR2xTQ1pMV0NMc0VJNjZnVUlRMVRFdEV5?=
 =?utf-8?B?a2kwaG1JdFFoZDJ4UGV5MFY4amsrNk9ONFIrMDVJMGZ5bVZib3R1OHppUFFR?=
 =?utf-8?B?NVRNajZBNzJnT21WYXk0Nmdva0JvTDg1VVFCZC9jWmFxaU93RW5TbnJ4ajlk?=
 =?utf-8?B?RW1hcEtUTWYwNzhqMi8vMHZkRklzUFQ1NUNKN1R4WXgxbDhnNkRzd1pGNlJX?=
 =?utf-8?B?QW5pOUthMk1KTmRqdTRRSm9OU1psb2d1TGVqVVYyVy9Gb0xxQ2FVTVozZjNr?=
 =?utf-8?B?T3VuZXdLaVpqUm5PUkZET29WZElDd0lzZCtOeUFYT1c2MUp3ZzRrWU50Tzh4?=
 =?utf-8?B?YVd1a09KQ3Q1QnFTRVNwaTlEK3hNNGpSb3ZHODVlV0U0bkEvNllIdFVHSVhN?=
 =?utf-8?B?M1RkWGdjMG9xWW9LbHg0SWtNZTlZSDk5NmRIaHM4ODR4bU1qbHo4SFZzekY5?=
 =?utf-8?B?N1NadFZyQ3RPbjdLMDBoQzZHdmFXLzdGYzg3R0lodHoydEZsY1BOUEFMOWhU?=
 =?utf-8?B?STcyWTJHdEx5SWtPMjJ2UlUxTldaRDBJdzZvNnZzWjlaRWsraThDVDJEdFpU?=
 =?utf-8?B?R2RMVUVKTWhuZ29COW85VEk2M3IvdTBTcVNHYTA3eXZxVlVnSDJkc1NIOURL?=
 =?utf-8?Q?E8dlsHVgwfo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TTdmcFloS05uSnoxNEFUYkVOeFNhUUJMNzdpT05HZm95WDc3aHhuQUovQVpV?=
 =?utf-8?B?bWJmVFpCRitYQ25nMVRRdEFmV3I4Q0h0YWFGTkliM29qU1o3M2FpdEd3R2JO?=
 =?utf-8?B?NE5sbldtTXVBYkdFeTVnMXFwd29GV2FnVStaU1JLOFpROGVuWmJZY29YMXBS?=
 =?utf-8?B?NGErYzBld0xYa3QrbmdhVE00VWlXTHYyS2dKL01sd1hjeWVPNWk0T2MxYjND?=
 =?utf-8?B?dUtWNXJ2MkhTYWo0WnpmTHRTL2FFOFhFdm05Qzh1YkRnQ01yU2k0cTYyd3Zq?=
 =?utf-8?B?VWkrOGdGUXU3NE9VOTBRUFhQLzdZb29ZMDhmeWdnNVhIbklQVkdweDRDR244?=
 =?utf-8?B?azZiN0Q3RzNUZWZSNzhjTDRDWGN5UkFQYVJjMUY4Q0krUEtsdE1UaUI3Rk5k?=
 =?utf-8?B?bmplNTY4UUtwVm81empWYitpQ1VZaFh6aFMvWU9mamVhUnA2SEpBS0VHbXQ4?=
 =?utf-8?B?N2ZqUXB4RXRPS1kveEJVRGhEbUpubE1vV1lkSEhIRC9XR1M0K1BQK01ZZE9I?=
 =?utf-8?B?UStFTm9DcFV3T0YvQm9Dai9GUUZ3a3Y2TlZURDd2MmUzODZiMUhCNFpoc05N?=
 =?utf-8?B?WEIrSVYrSzJubjY5RTZWN1lNR0tPd1M0WUZ6QXlLSGwxZ2c4Mzl3eHBvQ0xT?=
 =?utf-8?B?WFlRTW1XbEdhYXREa3BSNzU3OVdvdU4yZWdCYnZIL2lkL2hrcEdPWmkyNzNk?=
 =?utf-8?B?NTFiaDVPRm9MeUQxYlIwM2VKSlhwVUtteExPV0k0eHd4UTAwSmloLzRnYWR5?=
 =?utf-8?B?cEVVNWx4STlmT21BOWEza3VYN29yK1hoQ2ZVNzlFdit6RVBvc2xOWTRnMHk5?=
 =?utf-8?B?TG1nd2dldDhCNDZ0aUpRM0JZaU4yWkVJdTd5VlBMK1JlZzVOTCsrOUUzS0F0?=
 =?utf-8?B?N3o0dExvQS9ySkFSN3ZROWFWOHNqZ3o4RFVxMGtXY01nZi9mamNMbXhuTmIr?=
 =?utf-8?B?ZklyenhYRVZhbnp2RUZRT1UyNjJZOXNUMHpVRDh2L0VHTzRXc0xRbzMxaitI?=
 =?utf-8?B?TVkrVnRPME5ObzQySWZMRG5DUmE0aW9xc3h5WEVwQVRlOUkyYTVhY3B0aTgv?=
 =?utf-8?B?QlFzV1c3L1JTQWZnSUxyNGdYVU1PTGxOb3UwMjhYdTAyY2IrL2pPTmM4SUhZ?=
 =?utf-8?B?MlNpVUI5WklLbGZmcjNhYU1kUjk2QkRFS1hia3FvaW1TeWtBblhHN1o1TnBU?=
 =?utf-8?B?dHZqU1F0OTN3VXdsaDl0RTEyb2N2eERWbHdzb0JYNWlva3dVVUFFajcrUkE5?=
 =?utf-8?B?a0pYOWtDSEVkZFdLdU03QW5aQ21qUWZ2V2dpTm9YL0N1c3A3eHNvMkZPZll4?=
 =?utf-8?B?RExHNGtodGd2R2F6L2R3Y3gxK2VSa2pGMlJKL0JaTWNWY3lvOVoyTDNYQlMr?=
 =?utf-8?B?YWRULy94aVVtQVNNTk9VbGVSdEVlUXd4Z1hrUWx5cVRuZHF5SUlIVSt1QXNO?=
 =?utf-8?B?Q1FyZEhsVnlvNXVPeTBmTFQvMVZldnVvc2Q0TnY1NWRaL3JDV2pBYzFjbGpi?=
 =?utf-8?B?ZnlIRkY4bUEzNGVJQVZRaTF1QVRFblBRK1kyNGJ6eW1qVlBnQzVwTERCYldT?=
 =?utf-8?B?T090ZzBXWTIvbVVpTmlpdlArZHA3MENydDhwK2IzTVlOZVNJMTdEazU3blFT?=
 =?utf-8?B?Sm4yWEFLSVhneURXWnRJSWhYMlVYUEpBdy9LWlByM2tPTmQ1K2JsVWN3NFdT?=
 =?utf-8?B?WVh6L21YS0tvZnFkL0loNXF0TWp6cTZwcEdQeEdNUXczR283QlVhT1Mrcm1B?=
 =?utf-8?B?djdWWWwyVk9UWE5pMzJlK2xMOUNUUjBDemdybm92cThwVGd6VkRnMnVNR0hi?=
 =?utf-8?B?YmRhTGhUQXM2L0pzWDZCdW41cmlRVUU2ZXNZeU9nU21NeURSVFFMR3luaC9Y?=
 =?utf-8?B?Z0RhWXFncm4wdG42c2tqK01hVEtLQW9UOXBPWFFpbytuQ2IrOHRLdnBIUTlk?=
 =?utf-8?B?dk5IeThUTERxY3ZVbmhXZ2laUTVKNlZmcmhjN0pNSmxjb0I0QW1kUHFvWE5C?=
 =?utf-8?B?K0RmYkxVOEtYZ3FNV28xZ3BJN2VQVDlSdEdCZUtMbkl6WFIwQUs5SnhtSGtK?=
 =?utf-8?B?MHZmSVFoc1BsajRwL1pZSjY0SC8yclBoQXdTWGxIenhFU0UvT1FIMWlQY21X?=
 =?utf-8?Q?BERb81IYixB9uflpMPPGbBXiC?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f22955d0-d4ce-4096-e21e-08dd19616eb1
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2024 21:27:21.7405
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SX32kTghjTtwdpXF3prStdIVbwGoJBdW5vgVKIv+HExK4HeD7nL5r7NItC3pLe2j5XKlnX6y/jHgqQUcTXx0Ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7550
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_132732_598818_8A460F64 
X-CRM114-Status: UNSURE (   8.56  )
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

- Add binding doc
- Add imx91 thermal driver
- dts part wait for https://lore.kernel.org/imx/Z04W5chGq5TitB9f@lizhi-Precision-Tower-5810/
merged, so not in this serial.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v2:
- use low case for hexvalue
- combine struct imx91_tmu and tmu_sensor
- simplify imx91_tmu_start() and imx91_tmu_enable()
- use s16 for imx91_tmu_get_temp(), which may negative value
- use reverse christmas tree style
- use run time pm
- use oneshot to sample temp
- register thermal zone after hardware init
- Link to v1: https://lore.kernel.org/r/20241209-imx91tmu-v1-0-7859c5387f31@nxp.com

---
Pengfei Li (2):
      dt-bindings: thermal: fsl,imx91-tmu: add bindings for NXP i.MX91 thermal module
      thermal: imx91: Add support for i.MX91 thermal monitoring unit

 .../devicetree/bindings/thermal/fsl,imx91-tmu.yaml |  65 +++++
 drivers/thermal/Kconfig                            |  10 +
 drivers/thermal/Makefile                           |   1 +
 drivers/thermal/imx91_thermal.c                    | 265 +++++++++++++++++++++
 4 files changed, 341 insertions(+)
---
base-commit: d07c576946b2bc440d6d2073998023e8a0bd7568
change-id: 20241209-imx91tmu-af2a7c042d8d

Best regards,
---
Frank Li <Frank.Li@nxp.com>


