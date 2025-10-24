Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27CC9CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 07:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Vzt+PIZwQT0qycQTPlOcSfpVCSgoRwTKLqBHC6ivP8=; b=PdMeXli+EGGb3wRndG8FKvw5nE
	P1/Pqc7mW1xKbqSb7poDeKZp8lXiP0KeAeEHAENzuXy1erDJxTfMfD4IGC7HaI8iyjEVZovBoHWPE
	9EvRU3t5OiUtfMjx1ITfsOfEfyF3SUmyg8HexgqHdibnHVQm7U7siHJjBeTW7XHwdinpMEeN2Vgu3
	RiYnXBdi/NGpl0clEYbpgLVcPzWMzDt4LCJOwfYjzNkY2Jry+uMq7IwI559YA4NqerWd3XBhMyeAb
	7SN2S50xBE5Tzunszz8zxmPOpjBPac43l/Lhay0vfUq51W7VYjZhSw1zGO8PnJ8DcL8CZYwMHJX+L
	2Uj1TllA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCCI7-00000008VaX-3tAP;
	Fri, 24 Oct 2025 07:32:51 +0000
Received: from mail-francecentralazon11013044.outbound.protection.outlook.com ([40.107.162.44] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCCHz-00000008VRt-1N7c
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 07:32:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DjMYugQk0UzeRWhMyqiPKptdEsT9fUrQy7XHRG3hIIvrJ1GKui/a8jJ6MFiVwNFqbZBksOxZBQdN0upUyz9mEdgWTam1q0+vOxF/m9oIFkfAP5MRGR3gSJzvZLR08k9VAqP2+0ZvIBRhSg8uiS9lLju+kh5fkKbf5jQbz0jzko3Fv0qDivvcFiyjwH8XkWQAorJFF+KJ29Wzml16k9pxdpU6fXSi0gvwZnI03J10r8x/msDMZpOLE8s/R3FRIHxOjlu5e3JsYoCtkGQmBh8wP2QRejTLf7HCacyx/qjRR1PL+UXWfwKzVm3lBltYTsHCz+NP5A6iJVA9Sa+uoOqlLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Vzt+PIZwQT0qycQTPlOcSfpVCSgoRwTKLqBHC6ivP8=;
 b=n8gxRuxKw4srDYFdlfVwaST6fz+fJjqD2UxAMFU7OecBg8Kmj2qEOV2uXD5IPOnUcYXTHBQcFT1ML3i2RSdAhNGmjs8WqAen3kAAiUogwkRpFkMLcb0fbt1cQQsEpodEceda87ATHri/FEfPC1PYElD6h4M0FA3djRydISbJKOEt+ttOJBvfouXytzCyFfIxAF4F3IrLqOphO1evzTCpnQDx+pkADLztAezP6zNfps052akKP140AZRnWsHth+oYRbCz1c1M6FawNHMMbbcK9nS9rwekFaPARCxa3tEHF8kN9KzW50mfB6r/v0cRTxy9e2xaHmaxXxn50WBuWDw8ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Vzt+PIZwQT0qycQTPlOcSfpVCSgoRwTKLqBHC6ivP8=;
 b=NrcKUZD2FYQ4MQrIw5oZqNRU8Oz5/mrt7TjhR0RPVwfj8/fpiOYrzx9lHO0vtuelJdGc1Lwrv1+AMi7e4EoBnc27fTD8/K2lwbXxP1a/HsoAO8MvyvktdmqMPAaRkaZ/qz3/9zGxrZf9FEp6HNPAX8mj9gqOfxqzYFzkmen4mzq/5kl9j83bqH31uXIFMvwYKGgFt5vXShP2rY6iA4TSiOGiIvHWxSBTH6r1WHKst58ptDNogmo4xTXLudKiC7VJspkkhSKScHcmxatcq7QPapN7mDPmVTT95tSh2T9RFALr1sHGSi9XP5tlAwFQXlqgn70fJ9gQMQtoUZUSIgOqig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8833.eurprd04.prod.outlook.com (2603:10a6:20b:42c::19)
 by DBAPR04MB7432.eurprd04.prod.outlook.com (2603:10a6:10:1a9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Fri, 24 Oct
 2025 07:32:40 +0000
Received: from AS8PR04MB8833.eurprd04.prod.outlook.com
 ([fe80::209c:44e4:a205:8e86]) by AS8PR04MB8833.eurprd04.prod.outlook.com
 ([fe80::209c:44e4:a205:8e86%7]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 07:32:40 +0000
From: Richard Zhu <hongxing.zhu@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	frank.li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Richard Zhu <hongxing.zhu@nxp.com>
Subject: [PATCH v1 4/7] arm64: dts: imx8qm-mek: Add vpcie3v3aux regulator for PCIe M.2 connector
Date: Fri, 24 Oct 2025 15:31:49 +0800
Message-Id: <20251024073152.902735-5-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20251024073152.902735-1-hongxing.zhu@nxp.com>
References: <20251024073152.902735-1-hongxing.zhu@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0033.apcprd02.prod.outlook.com
 (2603:1096:4:195::20) To AS8PR04MB8833.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8833:EE_|DBAPR04MB7432:EE_
X-MS-Office365-Filtering-Correlation-Id: b879b063-6c68-483d-1742-08de12cf8304
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|19092799006|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V3ZpajBnV2E1OEJqc3RadjdkYWI2RUF5aEhlamI2aExaVUUzaW1VUktJVDRr?=
 =?utf-8?B?alYzakFNVGF5dVJmNEtVZkZzNHIzajZMN3dqRjRYR2ZqeUFzR0xsbVVsem1k?=
 =?utf-8?B?MGFacnlNNjg4b2xHZFREQUNJS0NuUjdzc3VpeFVydzZZMjhwcFNjSGNGVDVC?=
 =?utf-8?B?dzdwdytKRDVlVm94U2pDUDFlQ3paK1JueXlBTVBITVlDTS9xZVE0RTF3NVRl?=
 =?utf-8?B?U3pTdEozS3IwTlpsL2pidHhBQlJKaWhua0dvdXAza1U4Kzd5YzVzMklBbUdw?=
 =?utf-8?B?UFVVbGc5TjBnWlJMTUlFU0p4ZkNyWHlTY2U1eGJtQXNDYU1ialBvSDExYnNi?=
 =?utf-8?B?SGRKZHZWTFlUL1FxeXJUZEJGVmlNT2oyV2JmVTViY3pvM2RsaHhudmRMdlNB?=
 =?utf-8?B?THlWOEl5MlFFNTJzdjhjQnpIWFlkMWRVeW5zSVgrd08wV2cxdXk4NVRKL25s?=
 =?utf-8?B?Uy9od0QxQ2hTNStmMlNOUVB3cWNPQ0x0Z1hod0UxZFVxYXU3YlB0dmpxZFFT?=
 =?utf-8?B?d2M1TTVLbnZtUkFmNWFHcEZXa1J1aXR1MVlVTDE2R2tBUE9TQ3k1KzRvVVNV?=
 =?utf-8?B?ZkJpTHd5WjdTeVRJdDdPWFQrdTV4RzlEVTZxL1hlU1FraXNkYVI0WmtUUmp3?=
 =?utf-8?B?TnJrNkY1ZElnK1VlNXN3T3RvK3gzU0dmNVJKeDdPL3gvZkpuZXJQWVpoYm5h?=
 =?utf-8?B?T2RFOUE3bjkxMXVMVThZSEZPZXNXUkZjT2owQmh5V2xjZFJOQ1E3VmdiUEhu?=
 =?utf-8?B?MmthaVVTTW80VDcrY3dJYVN3TXhwTy9xK3ByKy9VdFBCSWF2UzdyTUJEZkZj?=
 =?utf-8?B?U01UWjdwU0k0SGRKZFZGVjB0NklzUFVvcjJ6bmwvMTRQa0ZjNVpCb3dXZUQx?=
 =?utf-8?B?MEx2N1hqUEs2ZXBGaG05eUY0Rmp4bCtBQWZBTFN2MEtzMDd1L3BPeENRcWJk?=
 =?utf-8?B?KzQwT1NyYm93SjVpUlJrU0lLRVcraGtvMW1uRlJKYXN1eTZPOUtERkZuWEN4?=
 =?utf-8?B?Q05KcUxzMjJuZW9ENG9TOWNLRk9CWVpDMG9vM3ZMU2FwZ2V5RGpGYVd3aVQx?=
 =?utf-8?B?QS9uUGxFTHdtbFBRQ05CeEVIcDZxTHlEV0VOdW5uRTNhKzFUN3c5U3F1Skhk?=
 =?utf-8?B?c2VubTZjYnlocUpyWVpLemQzSVVwK2tmUkc2TXVGa25lRUVBMDBXTG5Ocjky?=
 =?utf-8?B?UTFDTVRqeDZXemxYTVNzVk9xMzc4V2xPNEdxOFd4bHBpSFlwK0pEQjZ2clRq?=
 =?utf-8?B?L2VwNmw1SlBIa1pBMHEwMWtOVXdNMmVVWkhvekFFUTc5RnNJN3Bkc012ZFVo?=
 =?utf-8?B?Q1hxOGp6b2Q0bmsrRFRBaTlGKzZuZnpadFZBbUw2Y08yN0FwWWJidDFxYVlk?=
 =?utf-8?B?MW12SkNySnYwWXhqODJ2cHdOc0RIeWN5a2VYVjRCQmlDNWZSV0pnUEpoVHZM?=
 =?utf-8?B?ZVoxbCtEdzNsMGttSkJLWjB5RjdHL2V1dmMySjlhR0xGS0ZFbHcxTzZvMjZm?=
 =?utf-8?B?YnB3THRYV0F6VU5WWTdpTGFLcWI4YXBFc0N2amdTQ2dDaVU2L0J3akQxZDBh?=
 =?utf-8?B?VVpEdGpEdGd3N3crWlowTm51cmpLOFdmc2ZXdGFzRGt4bk1OcjhWSHh1M3RN?=
 =?utf-8?B?NVZvcHgrS2xVZGtxU011OW1ZRWtncnhwNmZuOEZJS1pjRW5wQTh1SkVXNWN3?=
 =?utf-8?B?V3BsMzI5V2lyY2dpdCtRVHMra1pIc1FXNlMxaGFqWFBhQUlsc3QxOUxSMEI0?=
 =?utf-8?B?bGU1WlV1bnBMSVphLy9zMFdhN29kYmZ5TmtHSndmdFlBN2g3aGkzMUIyOFdr?=
 =?utf-8?B?UlVHL09TUEI3MFJTVVVCaHFob0RjMmxNWncxUGdVd2hibE14QnNSamtzRytY?=
 =?utf-8?B?dE9QT0hhWmZERnRRS3JqMWQyaVpTa1h1bUY4Zmxpa0lvdWl1M0Z5c3ltdDZn?=
 =?utf-8?B?RXJtMXVwcmdUTlJuLzFiUjFrWjdBc2pCUSs1MFQ5Q2lzbFJFY1FJNjBkamxy?=
 =?utf-8?B?ZlVnRTdscUNwWUkybWtoc05wZ3lrdnZjZURuc0dxbnJFanZTQmNyQ1JpMzNm?=
 =?utf-8?Q?fYANem?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8833.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(19092799006)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEx2UG5PbXpFcE9JSVg5MkNwd0owQUZSUEkvTWxlcWp5Z3V3QUZMNU40SGt1?=
 =?utf-8?B?TjR2bUdROEtITmFEMDE4bS9zMVBhRGRqMFpVOXNWdWpOaUUyZXcxeHZzNE03?=
 =?utf-8?B?Z2Z1R1VNY1UvdW8vMnFySnBleGE3SlF6ZjZpa1AvM2gwQ0pWTGFzME1aTnBR?=
 =?utf-8?B?amNpVCtjRldCeGlnZTZRa0szQ0RYbVp1MWlmbm02TS9ueXNralhUV0lUalJl?=
 =?utf-8?B?dkcybEpuYjIvWmRYdWNuLzFVdkxGYVlLTW5lZzZlc3J1VTVCV2xiNlV1SGFX?=
 =?utf-8?B?V1BORVBtVkp6a1kxcmwzUlM4TjdWcC9aV1lOY3piMFZJYWlRMUoyQzJCZERC?=
 =?utf-8?B?MzFmK3RlQ2dBQ0FsVldSZTFGdmoxbVVMQTYvdTRPSEg5SjdDSlFBNG1RSUtP?=
 =?utf-8?B?TzRxT285K0RWcjZRVmVudGZHS3VrWW9sVUhGekNDc0VjbFBCbzEzN0Q1NUJT?=
 =?utf-8?B?aGhFYnlZbElGR3psNnRSNTc5S094eCtFYUNUN0FDSXhSQ0JRWHlkOWdWOEUx?=
 =?utf-8?B?YWkxVlV4dFlwbC9BZzNKMzduOFNYUnYrNnd5MXRxQmZNTEh0TW9adkFJNUQr?=
 =?utf-8?B?OE54LzBkZXFqSzJZTlNQOU1PZkc1blhpVHJ0dXFNZUp5bzlYdGx3bHVSYU02?=
 =?utf-8?B?SDEvRVZRdk55RFYyYUZUYU94T1dta2VxYXBnSThpUUw3ZmZoR0tNWFltbjBn?=
 =?utf-8?B?T3VZQjhXVVhjZ01jNC9DRzhkTis0eGhZZjczNjdXaTZyNGxWN25qRTFTdGZ0?=
 =?utf-8?B?UkU0VlRkcUpDVERTVi9PYTZFSk01RDFrenIrNG8rM1IxZnIyS2hlUkF3K3BB?=
 =?utf-8?B?ZEgrcUgzQ2JlazVBclZsZklIcjcySy9yZkx3d2RlMGNHam9PcTVKcFhzck5V?=
 =?utf-8?B?K0sydlpVV2loc3VwaHBIQ3JkbmM2d0ZJa1FtaWFpNHRuRkZVZDM4TExrMjhm?=
 =?utf-8?B?RWkybDhBKzBCYnFpaVNJWDN0UjJLaEswRUZ4ZlJVZ1Z0Mk1NTHpQWVVBS2VN?=
 =?utf-8?B?MHVNUHdqQU9JSWZMK25CVGVqcTdrMEdYOWtVTDhKNUxLQ0UxbGxjNkZwclRD?=
 =?utf-8?B?TzhUOGt3Znl6UEdGQ3M2NS9nZ1o2TFFvbW9namdaQVlnbi9vamJKeW9hUkQ4?=
 =?utf-8?B?NGZGT3hFZUVoTGxhamVzZ0hCUWdTblRDWFBGOFRqS3lETnExYzRnRSs2NzJM?=
 =?utf-8?B?V09IdTJMVzdRbHQrZ3dURjFEVXMvV005eTdLWER1ZFJNR0VadkxtamhGeUNa?=
 =?utf-8?B?SS9KOG02NlFucGFYaXF1a2xnYlpGR2dMSWNzRURYcFlJdVVRL1hrS2F5WjQ2?=
 =?utf-8?B?UWtKQUZHd2cyOXV5Y3R1UFFzanRNR1h2TVFDTys4SlluNTVCbmxvdGdpRUZN?=
 =?utf-8?B?VGg0NmFsdXEydHBvMXhNR0J6SUJJNThYZnNkbHJETFNxS3EzTWZHMVZnai9M?=
 =?utf-8?B?bkV0R2hicDNETi83bXRpZVdUVzBxL0pma3ZsKzRSbStSeHR5WnNvKzVBL2pE?=
 =?utf-8?B?NUxQOTIzbGpISGtsbVJXbk1wQzhndmQyS1JqL1k2RzZFYU9MakpxcUlnWGpC?=
 =?utf-8?B?aTVtUnVSWW5KZWl2M1ZBUWlWMEVQQlNVdkp6Y0FyYk81cDJLNHNGazhiQlRY?=
 =?utf-8?B?Uk9RMkZlWExxSTdLcVE4UXhtTy9Wd1hXUVJ4c3c5eHpTR0RKOXN1SE1DMEhL?=
 =?utf-8?B?VnQwS05KcVlzSERLby96aEVLV1VYb1JHWSsxbkFIQUNSdDMwdEJVSGh6OEFB?=
 =?utf-8?B?WlNTdmxoNkZJaTFySHQ4N014cTc3T0puTDBiTlVWazJSYUFMWUJTV1NyUzdL?=
 =?utf-8?B?NXNIM1R4czFlQVNET0tNTVJ5MTRaQkhqTVFpdnZYSmoySTRaN1dmK2JvcExG?=
 =?utf-8?B?THlBak05NnBmN3VUTHFYYWRyV05yL3o1MDhHc3RsS2FEQjlrdHhLcTVyanlF?=
 =?utf-8?B?ZWduN2psSmExa2JITGx3QkN1ZUt6YTErVFhFclkyYkJyZUhzaUQ5N3d6aktT?=
 =?utf-8?B?UXp4Q2h6cHQ3N0pVMDViT0Q1LzIvMkwzOThvMWp1dmRpMlRBTmpmRGJQV3E1?=
 =?utf-8?B?QTl6WXYwVzZQSThhRlgwQkgxMjJWalVxOFBUTCt3b1NEVjdCdmdoQ012S21X?=
 =?utf-8?Q?khnBMjs9lYgNzvVS/YqS704k1?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b879b063-6c68-483d-1742-08de12cf8304
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8833.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 07:32:40.2088
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vQLGUf8E8NMSxMOJ6Uex84zSVVDGGf+JMdbEJUTDfwjmoAPi7NTrXOBHh5NNBRHnAfMsAcN0u3+ipszEIXH2gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7432
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_003244_713568_619E11CF 
X-CRM114-Status: GOOD (  10.82  )
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

Refer to PCI Express M.2 Specification r5.1 sec3.1.1 Power Sources and
Grounds.

PCI Express M.2 Socket 1 utilizes a 3.3 V power source. The voltage
source, 3.3 V, is expected to be available during the system’s
stand-by/suspend state to support wake event processing on the
communications card.

Add vpcie3v3aux regulator to let this 3.3 V power source always on for
PCIe M.2 Key E connector on i.MX8QM MEK board.

Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
index 202d5c67ac40b..6728e1236f4db 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
@@ -775,6 +775,7 @@ &pciea {
 	pinctrl-names = "default";
 	reset-gpio = <&lsio_gpio4 29 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_pciea>;
+	vpcie3v3aux-supply = <&reg_pciea>;
 	status = "okay";
 };
 
-- 
2.37.1


