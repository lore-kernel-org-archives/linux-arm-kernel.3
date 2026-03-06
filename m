Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A53E6FCB60B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 15:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KTpL4oxtGqAc7MbYn4ap6a/tXkYV8vduPpyHFcU4nmQ=; b=2R4F22ZI21QhwyC6U5kIax302E
	t4rQe9fi7BHFX2JKd/5Qoo5KJbbqmybvinWP9cmy6eT2fRd5vtwxbKpaZGLCpXz8ZtJ8wXYzo8ylE
	iV5fhtqDDeF4yYGwqhfLSr6q2GkP94gyHNMduoPgfjULzf6TjP26b63G3nsE3V4VTiWYRiQu7RXXh
	7WfOn2hd1RrANOiXq51+xv9UfK1pyy1gSNu5abQnGaUwITnGBpyuapg1jh2SaZWyQaGT7i9pgP4+5
	lqGuV6uAE/bKvQnP7GqsD/XMDw7C4fW/LyjALiJWRUNhiuRG/MRepkBhvRNVoJ3sdpb4Za2/8c/tB
	PJCdDMRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyWqR-00000003zjN-1vkv;
	Fri, 06 Mar 2026 15:12:03 +0000
Received: from mail-westeuropeazon11013032.outbound.protection.outlook.com ([52.101.72.32] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyWqM-00000003zhO-3g0r
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 15:11:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=COqULh0Bbo/gDIEY8mp9iUii6M9ZxrNesJoD/n8AI3NynFuhMzui7L7M5nhHG01NbURKRa/HLnJYVT8vLSq1AfuZe0iHBZwym2lDECdXo4KD7pu56caNcBOMa5XWd77+ppLur78AqiSbOg4XSDAyr5vNaB9DuJZJ8XOa7YOfIasBmCi7S/4TprByNMSnh6IwjZ9wbsW2tj8nIy9GvYGaoCgbpiJN9OAQTxNlgwIAOL2vb0s23Z/9uTpRPeh/HUijmh6nJAr87Py/oGaXlBQvB9OZ2TwTO059ihX6Cz5QQRArZUzygfYXzhj18ciz09/LvvRyRizP+12ZENkqO71iYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KTpL4oxtGqAc7MbYn4ap6a/tXkYV8vduPpyHFcU4nmQ=;
 b=lAaad9bmRMl+E5cwLFMMNzjLZ6bHcZv+VDhQECKOZJqZR/eGmrt20kYc6DIcWWpxs/6tq6IaVA/w+EkjVTUXL4RMhUzm1WOGDOcupkMFhNEE+sewtNgARnd8V5g2nPro9taMZPKIhmMsCiL453UIcs7Ec267pR/L0QUWk3yTRwEiusLFQiImaHtQDji5Y6Jib9LbpgyNWLGKu0RTIpv33IvyxBEbBcDc8WZQkf/WsHjsYbSTy50W1MHuHyGRl/XCxpXYlejMXQ1kxxHmZ8Csn90pI2xrKD/G1e9dVyZH44Srkuk93vckUEPwxOHBGGAopmlUdBQKKaxFxHst52Xvbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KTpL4oxtGqAc7MbYn4ap6a/tXkYV8vduPpyHFcU4nmQ=;
 b=Jeov9c+vvlh06HYBWrEzbclEXJe8L6dLlVOf5Os8xjnByUasJFCrVMrsCxH5to8848yMZyUJzT8QJm7rMty5zJyStLrms0gWRkmA/loc/3cBrRPJJbYujCrurMNZpWnr4Geakrky20qq9lyfjkgrVRXYRzVxH5QkaJcIVuSjZW7SgskoX9KTEislNBbokTlz4I2obhI14ZPYUfIFsrtG1vY6QjBafoeGG/xbyYLWGfmrb69SuSIA7inYtrkwQwubQzqRBJdPrW23H2JNl8843v7YUiEgZqUw2zsuxipNB9+9NfvEP9xMZORsGDV0uKW6zyOR5JmHDlKd3NGllzbUIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by AM0PR04MB7092.eurprd04.prod.outlook.com (2603:10a6:208:19c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Fri, 6 Mar
 2026 15:11:52 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::5c3a:1a67:2e02:20d0]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::5c3a:1a67:2e02:20d0%5]) with mapi id 15.20.9654.022; Fri, 6 Mar 2026
 15:11:51 +0000
From: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Lucas Stach <l.stach@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	s32@nxp.com,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>,
	Larisa Grigore <larisa.grigore@nxp.com>
Subject: [PATCH v3 1/8] dt-bindings: interrupt-controller: fsl,irqsteer: add S32N79 support
Date: Fri,  6 Mar 2026 16:11:40 +0100
Message-ID: <20260306151147.24446-2-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306151147.24446-1-ciprianmarian.costea@oss.nxp.com>
References: <20260306151147.24446-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0159.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ba::10) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|AM0PR04MB7092:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dce5e1e-d349-4103-ef7d-08de7b92b21e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|19092799006|366016|921020;
X-Microsoft-Antispam-Message-Info: GK+iO/lZv/hyAowUvuBvIBGKXaKw+fQBmu5mUVMca2C1lUTTA+7x9PyW9dGgXvy+Wx6JAwt1lJZf8DseyjJC9DIj4K+c8JxuF1HtBMMkIrtkipljvF0LzrgdewY3dCijMxomN0MLV1UWdVcEd2Eb9pRGnpc0kjqrUtxymmI2qG95M1vTGcMmzHzTFWTMFPel/6X5KFS+np/HPFKwKtq81ctQL2GtvZh0/oBuAa/ynngHYPL1xMYU04MDSL+QRhYvrro50IVOHPVrWGJXpzyIFnmSXUIcLr+ByyiZbcJ7RW1MbMkId2Q3HaV0Wi2M0SSTorJtlPm2hMnUZBOETjspGkHbj+fgvoRiTJgtrOvC2+4cDFxcwRzK/VUEDm/R2yvIsYqsiAjWkU9CJGm3Kf9t7SZGIAXVPpIsp89X0rFMf26sj9pJA94P5DfA+sTJTvsypLal9XwF0beCvjjkkNbd/vb6gJMqaSItPU4XkvkeR2e/w4UPPZzh7qEylW2TD/BpiqVLJsq3i9hTLCG6+VOYW7TAHSvWpPDmqhpSj2MHiaACnSQ7k/9oI7Os3jnF8pLqsd7ffhzWU45bYViMBe1Y5Vie9uUjPHLoRmCUNYvoNIEU/UTW3ZwcyIsbvpbU1BN2ariweiD4AoONVd4PxXXdXSRkwFfgESSpWw3i6fo4qI1N/XTh13lEWbqlzhZbOlyNZ8LaZtforlBXfyoJbl1826KM2FpPahE4I0RQfyVRrQvzBewl8AulHaYn6duoCiDTi3iwrha0NdWBze75UWtt1g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(19092799006)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmViRnluNXp1c0VrKzJiTE1rUzIxU01ybDM5QWxvUWtQNDR3WWtaRXZqdGto?=
 =?utf-8?B?cGJBT0RYeE9ac0l0c3JKdFJoaWc0VE04Z3RBbnpoOXdoMmNYdVZ1a3lTRW1Z?=
 =?utf-8?B?VEN1cEMzR1dJQWFjL242cmFKeHFoY09mMHpyS1AzMVdwNXlabndIT0luWXA5?=
 =?utf-8?B?RDU3N3E4VloyQUNtQWFleXdCcGFYK2N3S3h1bUNmN0JrVkxvcVQ5ZVRtVXZE?=
 =?utf-8?B?RlNXekRaRGlPa1Y5cVZyNkRsWjVxV3UxdlNvaHA5NVJYUW1MMnZndXh0emVw?=
 =?utf-8?B?UVZub29STnZsNGVWb0RNQklxd3hCSzFXb2lidW95QVpsT2duWEtJZGtWUHFr?=
 =?utf-8?B?UFRKckpldE9OS29TRDh6NUo3R2VKTDQxTEUxZHk1YUtrZ0cyd2FJRDhyT3dW?=
 =?utf-8?B?c3hxM1BpVXNRZ3dDQnVLWklBbU8rakFUQVdlVWtkMXdRZ1VhMFVRazVVSkFU?=
 =?utf-8?B?WGVzUDFJNXI1WXdHUFNrN0tLREhBSXdiUk5DK09KcnptbStQSFFlMForTHNE?=
 =?utf-8?B?dHBDMGwzRXpVYkY3cHZ4djJVTllUcTliWFRkMHdMUUJLOEhtQ21qQlhzM3pU?=
 =?utf-8?B?Zm0rOTQ2Z25KR3I4eVNuNmQyNmgrRmxBS3h3d05HZ2NwNENJU2tmMnpENC9t?=
 =?utf-8?B?L1pYaUZMa0NaR2ZoZjBXemNTZ0Zpd3NrcThqMUZqdk05MWFKc0ZteS9SQitZ?=
 =?utf-8?B?T3ZaN2FCNko3azFRckFOUC80SC8rWGtPa1poZktWNE8wd3RCRHg1bVVJYTVw?=
 =?utf-8?B?NTJBUjV0d1RIYW0rbWg1WU9kcEk3aFBxVkRmejl2KzRGU01VY1N0cmZZVFdP?=
 =?utf-8?B?VG5DTjVycGNQeTlxUitheFBPYnIzVXI3NE40b2pzQ1lZZmVKM3A3UVVDcVdK?=
 =?utf-8?B?a21pclRncHY2K1pzQXBUbnMwUlE4RzJVU29LZzN2MGdtUWhRNWpQY291b3R4?=
 =?utf-8?B?bTF4M1lQK0VrQXhBejNnSXRuYitZNTBlQlFseTVhcmdxQ21USWRRc2kvVmQ2?=
 =?utf-8?B?RDBiRkVKSWtyQUI0TzN1VFAxWlZaZXAvTUR1NmhpaFBpZWVpRUxQcnp2N09D?=
 =?utf-8?B?dCtvUmg0V2FCcjAwOGNsSTFIRWgyM2d2d1dvTTZoVXZEUGp2a0hlbTJDb0xt?=
 =?utf-8?B?aGNtUEIxckR2cHFhUlhZaXpxSUJKMTEvazVydFQxN0ROemk5cE4ydEhEcHla?=
 =?utf-8?B?T2VZQUViR1QxamY3Q0FzMndUVFd0NUpLZlYwSFowdDl1ckh2d21wMUlFZmlw?=
 =?utf-8?B?MzRZNitPMXVubk1RZ293bCtPdlRUSGg4Z09kSGR6RklqLzVUSnBhRVBPOExn?=
 =?utf-8?B?NENqcEt3ektiMWk3RnBBVE9hQWQ4YjJNVE5POGdWZUpkeER1YVZQanlpbmwv?=
 =?utf-8?B?N3dRTURoTW10MEV2STkyNFJlVEdvckhhK1IyREl3THB1a0VLL3htVHpKd0JL?=
 =?utf-8?B?VjYzT3hibVRtaHZhbmZlK04vNTA4VzNZdGQ1ZFBGWXNvSlU4WGVoSUt4MHVI?=
 =?utf-8?B?cEVWZVlzV0RhZ3BrUnR2eUpObnVQa0FDQzl3YzZSUGx0Q1YwRTBxUWtSdGJn?=
 =?utf-8?B?N0UvS2p3TGZ0WHQ2SWh6Tlc2TzExRnFDUUM5eDRLbXNuR0Mxa2F3cS9yQUJ1?=
 =?utf-8?B?Lzl4K2pOYVNibllUck9IYnRsTU1ucVFmcmxobzFvWlBYN0xSU1QxbmFMUmFy?=
 =?utf-8?B?RWxnamIvZm1xaGNPci9UL2w1dERKWmpqWG1lR0dzUXpaWSt1bEtsUTlZbFFB?=
 =?utf-8?B?VUlIVDBubHJCN0JkYTRHZnZDdlIzVi9kMSt0VlJTa1dDekNqOEd0UEc5TExW?=
 =?utf-8?B?LzRHWkNuRWdJSlBVMnoxN1drM0c2MnZ2bTA4WkNOZGtjdWVoRFRhdFpRVXcr?=
 =?utf-8?B?WUE1RzVIZHl2YitkMy81M29sZ2U0bW43dW5adkVLOVJYVGI2d1dBcGJRMnlP?=
 =?utf-8?B?aE5XY0NsdkYxSDc3cFFRQWMxOUVKVzMraVc4R1IrdEZmMG54M0xYcVk5dmtW?=
 =?utf-8?B?SDN5SGh4U240TVdNbWdrdThud2tFSnIxYmx3eGxEUDRXWkNHRWpCMUVjMm5J?=
 =?utf-8?B?aE9JUUpTMmFpd1lyZmlZWmt3UHhrZXpXN0V5MXJoQmRFU296WmliWlpMZlY3?=
 =?utf-8?B?R1M3QnhGd2lVZ1pLZzd5QnZkRVlJQmJCV0RiRTBXS2tzOHNLZ1k4R0hEelJW?=
 =?utf-8?B?RVEzWHovQjcydjBEbWNrVXpNSzlZNUh1N2lvd2Z0M2tVSzc4ZTFCb3BERVJh?=
 =?utf-8?B?SEV6VGg3RzI2cmQ2bGN6RXh4eklEeFgxZ1hKQU56enFQZ08zMVRvbGdJbnFl?=
 =?utf-8?B?YVdqQ1IrSzM0U2YzN0xjdTZ4cVlYaVh2Wmg4bzdBVVIwRE1NZ2FiQzMvWDR0?=
 =?utf-8?Q?au4AXo8TZDsL+dwQ=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dce5e1e-d349-4103-ef7d-08de7b92b21e
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 15:11:51.8678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RfH2zBpgLprO+qMYEMpChB/ZcQX6qtqwVifOz3FF/WEb1AFIz1oA+ioagyI8qPZf8rPpLdZQCCBgBVmu+67285l+ngPPKxu/fuIDKTIi8lk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_071158_918192_90816469 
X-CRM114-Status: GOOD (  10.52  )
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

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

Add compatible string for the interrupt steering controller used in NXP
S32N79 SoC.

The S32N79 SoC differs from the i.MX version by not implementing the
CHANCTRL register, but otherwise maintains the same programming model and
register layout.

Co-developed-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
---
 .../bindings/interrupt-controller/fsl,irqsteer.yaml           | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/fsl,irqsteer.yaml b/Documentation/devicetree/bindings/interrupt-controller/fsl,irqsteer.yaml
index 5c768c1e159c..13cd37bf48e4 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/fsl,irqsteer.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/fsl,irqsteer.yaml
@@ -12,7 +12,9 @@ maintainers:
 properties:
   compatible:
     oneOf:
-      - const: fsl,imx-irqsteer
+      - enum:
+          - fsl,imx-irqsteer
+          - nxp,s32n79-irqsteer
       - items:
           - enum:
               - fsl,imx8m-irqsteer
-- 
2.43.0


