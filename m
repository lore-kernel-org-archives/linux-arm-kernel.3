Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4AA8EE3698
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 17:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LtIQ0lZd+2lujlxju2d+tTsuDeO66s79cffwaccQdag=; b=j3yuHEEDFHHrL0Xlq2Dq8kxRTX
	80DTmbVvWRPyTTSCfmd3CUQzFI3HAKW4KMws4DoPMACnS0xt/tcy2nWlEpGcnYWhTL/3fA5QLau3V
	u/TF/2eBgVrPI5Hzf/FQ8PvmBGAU11VTKEJQi92y2NGFEdxrsUyTu8RxJTdbSYZtl2NCTR3rTjGrZ
	a3rN326zZRcZsCEISydcODNxu/Hiy0/7voIsyWzauPnL9bGc6jB+yILm7jpbYl5Fz+L3W7dqx7wT4
	54guH5TI/GNJd7NZ/u8SUlYA8ZQd8rZfG4Oa5fmus7i1wNgo82zGU83ADpXT6MyPj6LKCtsnuzQLr
	GkRKJ3ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqaTn-00000002Rfe-3Kmq;
	Thu, 12 Feb 2026 17:27:51 +0000
Received: from mail-westus3azon11011025.outbound.protection.outlook.com ([40.107.208.25] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqaTb-00000002RWJ-2v8z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 17:27:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ibE2TGhnTuJXh5BHlGGg1BwLNIr3BCrMlLdkCOkxP9Yq6eN1MEQIqghS/YzV876pObyc9YSjx4Z+3k2CTzU05G6ILgzqm+1nHE67h07y0prrPJA3ewOZWe2EPPaUa+4b5r8FsnvVa4zIBsYGrLNWFqJWCJCgNwNwAlNZKDimLdFhUkMtsFyRMkXK7LneHVXuRparKuCM9WiFmk4c+oa81ZGMi0p125A+4jUQv2P5TNUBzoraRd+kdo7RvqJfNyOsBwVmCRew0aVE1x0km62TuOgO4E5kOqrSnvSoQ5f17UxBaHUcWhl/YlsOTQ45Hq5PpLUDGr8E55I1o4u/7cBpMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LtIQ0lZd+2lujlxju2d+tTsuDeO66s79cffwaccQdag=;
 b=cfvZKiDrNqdBbgZqX0s9rIPCtPFGXxfA9pFBD17jttqEDvJvrnrY0dXZWmOozQUUFBgdk7luYG3pOVUUBmcjaDc6n7ydImrCth8sSAiM6w/zDjQD7x8V2i1M+UEpGiinhbSK12Bpl49GN/eIPFZ/Mt6UBoDJWRgHqxZb36WsgAfhJ7OKwzo5FzpBKnQlu+gqRkYa95jr5Ub6QXPXbF/otuG5eteL1u3qxvTjy3k/WC6PsGXmoBTOa6KUMN1xwP7o6P2PvCiUMRpJ3YOTNnpgmKjf9enE3meRGiHrYatY2RfqvB1hCCmJiZ9bJZzup8+XmZGsKg8k71zEmdEnrd4FrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=baylibre.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LtIQ0lZd+2lujlxju2d+tTsuDeO66s79cffwaccQdag=;
 b=YW96FBtRJf0mh9hPRYokslUz4wSg6CdfTYHB9n+GrSwiuOH/Fd+8CjC555TBQYT8sCuKX8eYiSc6yyPIF0I1bOgEeWNlRXDcMBf5AQ9lee6Tg/UnBIEjMPmLj4uLGa0a8c9e94N6hXS8gSAYPfns50p//DLh6puFn0Sf3LPrN9U=
Received: from SA0PR11CA0110.namprd11.prod.outlook.com (2603:10b6:806:d1::25)
 by PH0PR10MB5660.namprd10.prod.outlook.com (2603:10b6:510:ff::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 17:27:31 +0000
Received: from SN1PEPF0002636C.namprd02.prod.outlook.com
 (2603:10b6:806:d1:cafe::3e) by SA0PR11CA0110.outlook.office365.com
 (2603:10b6:806:d1::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.10 via Frontend Transport; Thu,
 12 Feb 2026 17:27:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SN1PEPF0002636C.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Thu, 12 Feb 2026 17:27:30 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Feb
 2026 11:27:29 -0600
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Feb
 2026 11:27:28 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 12 Feb 2026 11:27:28 -0600
Received: from [127.0.1.1] (uda0506412.dhcp.ti.com [128.247.81.19])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61CHRSI23458792;
	Thu, 12 Feb 2026 11:27:28 -0600
From: Kendall Willis <k-willis@ti.com>
Date: Thu, 12 Feb 2026 11:27:20 -0600
Subject: [PATCH v5 1/5] arm64: dts: ti: k3-am62x-sk-common: Enable Main
 UART wakeup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260212-b4-uart-daisy-chain-dts-v5-1-26c7f534e567@ti.com>
References: <20260212-b4-uart-daisy-chain-dts-v5-0-26c7f534e567@ti.com>
In-Reply-To: <20260212-b4-uart-daisy-chain-dts-v5-0-26c7f534e567@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: <k-willis@ti.com>, <vishalm@ti.com>, <sebin.francis@ti.com>,
	<khilman@baylibre.com>, <d-gole@ti.com>, <msp@baylibre.com>, <a-kaur@ti.com>,
	<s-kochidanadu@ti.com>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770917248; l=1938;
 i=k-willis@ti.com; s=20251230; h=from:subject:message-id;
 bh=Bw3d2QGzMeHrLjfHDxb4CtLd01SYeoXA/RR2XPSUZE0=;
 b=41Mzdd8dsEtnfnHX3y9/Ix3aZLzcHgjOGEjC6P1iBW42CSGkupcwAF6lxLOePjAFADGJbw9+o
 ieca1Th+WlyAW2+vSoa+bka/sOLxg7p5wNEm7T6B1YnXz6zQ01Mx1/b
X-Developer-Key: i=k-willis@ti.com; a=ed25519;
 pk=fQiPVFwmogfDAKdaAKq163RWSfgHZVE/MrsDzp0Xo1k=
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636C:EE_|PH0PR10MB5660:EE_
X-MS-Office365-Filtering-Correlation-Id: ac5728a5-2131-4d38-4928-08de6a5c002d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dDd0Q0FQU0hKNzgwNGhKdE5IQlkxQ0xLbTBlLzZRM3dFeC94Y2R4aUwreFB4?=
 =?utf-8?B?a3o5ZUtNelR2ZjNOaHVKODhjQWpKZG5rLzBKZU92RmN6OUJBMDNFQUdsQU1h?=
 =?utf-8?B?U0d2Z2hwN1lqbU8rVkVhQmNCeUJxMXVvaDl1aElyQkdQWkRlMWZoUHpnQ1Nw?=
 =?utf-8?B?T1YwOXEwVXJ3Tm1YdzQxbC84MnZxR2RYMkdJVUU1dENZaW01eHdmeWhTdm1S?=
 =?utf-8?B?M3U2NGlGVG00N2trVThhYkVIcVByQ0RnZXY4aWNjc2xpMWRWOGFmRmFUR213?=
 =?utf-8?B?cUtpNldzOCswelNwajRqS1R6NDRTY3F6Ukx5ZEZNblFXaWx0TWRudUJ3Qy9X?=
 =?utf-8?B?QXRBVldhaTVndkIvUzZhd2pIZjFmcjVLdHRMTFVCZHprSFYrcytMOGlRaTRZ?=
 =?utf-8?B?SGhJaW0vZGxOTlEwbldaZGdCS3pIN2JWZkUwb0Izc3YvY1JueDVYTUZySjlm?=
 =?utf-8?B?enNRY0FVWnFQYzZLTnB6NHl4TElsdTQwTndkUnFPUXlGUi93d1B6TkhiTlAz?=
 =?utf-8?B?V0Qremw5bTZWWjNsdEpIWUZEbVkyOUZWVVEwRTNTWWMvQnA0UWJFZ01LRncy?=
 =?utf-8?B?OFdvYnJyb3ZiZ1htcFFjUURGYzN1Y1FYaFFwM1cwYUxsa0lqQTB2YUxYU0FV?=
 =?utf-8?B?Y2hLYjcrS0ErOEJoV1o2N3RSbEJIRlI0NTZGUmdHMklLRGVpVzBjWit4bDJy?=
 =?utf-8?B?bTdBRTFKSlpWNmdpTE9hVE1hSS9GckJzYmdSYTM2WjBxa1BneEJFOVdCMTA1?=
 =?utf-8?B?QldDRW5RaUJNaVE0M3lUcFVxQVhkR1lCU1B2RGVXR2VYL29DMGw2WDE0OFF5?=
 =?utf-8?B?MEN6dlRnL3RaR0kxRTlIMGg0aWRBcHZwU3didU5qY2lMYXA3aHZkMXNxQ2Nl?=
 =?utf-8?B?dW11TGRXSnRMLzZGM1IzVk9oQm1tenYyS1g2VXZyc3h6cE9iYzRCT1p5eW5J?=
 =?utf-8?B?Mmk2Y1dTdUtFOTkzcXNEYVlIZ2hDTnpXUHRwOGpRS0tCV0RZZ2pVM0g4YkFt?=
 =?utf-8?B?bmZZL2luTWh3MGVZQWQwMjUzbzhXR2Nzc0Nhdkc5UjlvNm1qTmtOMHZpZlpt?=
 =?utf-8?B?cndaakZCOTFqb2NwM0NRRGp6Q0hza0I4RmNKLzZLMFB0cGNsb2ltMnViL2xk?=
 =?utf-8?B?VVRWclB4RmVjdkxBckJ1aHZVeVlYZGlMYTVrRFNNVG5yUzB0RHcxSmdhT3dx?=
 =?utf-8?B?amdYREVvWlpaMENKSWcwWGlwVTJSSUZSd3p1ZE5HTUZDOFRiZ1IxTXl5S2dL?=
 =?utf-8?B?MTIrOWlsZ3pyQkQ1MkRVNmRBbUxxUUVjWEFKWHRwQnVDNlVGaEdDSlBCd3ox?=
 =?utf-8?B?Ulk4N3NhSlludmdkellsNVhxdnIxd3ZFaDBLRWdoMGlVdUwrd2w2dDQwVlNy?=
 =?utf-8?B?Z2M5ckV1aXdETTZ0cEZnWVNadmV4YldiMEFHaCtqcnVZZlZ2ZW9admgvVVd5?=
 =?utf-8?B?ZjBGS3Rva2VqbW5FU0xLNEdwMlNMQTFVd29SNWdJbysvaC9KeW1QbnFCL09z?=
 =?utf-8?B?UmJYMXNTUiszaUE1TG1RRVoveXlrbVhhcmNKN0M5NFhqQXVVSkoyaHV3NFJQ?=
 =?utf-8?B?STVxaHBVR2l6R08za2lSa0FRQU5ZSVFNdlJmcGtpdFJqRFR3aUZBU2lsUHdH?=
 =?utf-8?B?RVgxcmc1TlBLaWI3WHFjVjlqenpKVzhDL1RZbHZrQXljdnZnMFhQMDZ2bU42?=
 =?utf-8?B?Y0VRcmtCcnlXYzIzWVhKUFp3SFRWcGdyZG4za2x3SnlCc2xxSVJPcG5KVDVl?=
 =?utf-8?B?Q2h3RVNjMHc2QUJYSnhzeS9TQlFXNVBINTRuYUhMQm9LOGVyQ3paMmZKY0VG?=
 =?utf-8?B?OWtoQ0NOamhuR21pa2pNeUlNamo3WkVFMmF2M0dXMzNROGQwWUxpRnB0YWVn?=
 =?utf-8?B?Vk82aGNscXd1dGl6bWRJZzdkMGVUUnpZbDdvb2krM05YcFFHRG1tbHRYcDE1?=
 =?utf-8?B?VDUyc1J2ZlkvWlY3N0lZQk1BMjc2bGFzNTVLOVJzcG1raDB2OXp1NGcxWXJR?=
 =?utf-8?B?KytCOG9kUW9zZHBuQTRLZGpZeHZFb3d3clg5SlM1VkJnTEdRWTdYT0g0T0lQ?=
 =?utf-8?B?NG5wbXNwTEZZZmJWVXIxVlZIMTlaMFpYV2g1d3VuT08vbzl4SlBLc1Q3N0tF?=
 =?utf-8?B?UGlmVkhYYzhhUDZxVm1aemlaVGxpc1JwTm4xTXNQa2JSNWM2SGNSVFZhVjc0?=
 =?utf-8?B?WmFnNjZCQ3RxQUlOdzJJZWxWOW1ybGlhdHNHUHp2VzJuTTRCOU90QkwzQ0Jn?=
 =?utf-8?B?a2dlVUZDcCswdlJ5WE9QSjBmMTV3PT0=?=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: bL6S05kFJQnkoaUc9ZSjPA1qAlu9nzBkRIckKX6imLoB3yqfGtKHrLW6NqBFhhCzov3/OfIJS+F0tB+BPQqGwh8uCE+p1U7g9WpPc6Bvq4Agvrsbjl7PKHX4Mo1nebJUIaTvU+SVBOl5W7goeizrZdjAYLPuOA2Ko8dmDDoJzfPGZlulqlgtcwd4QHyur66D19g9AVDTjbNMrMlD8DmTeoyApYnktc+J5odCkJRrmLXGqurk9KaJvlxLoAJjDrZnHTYx7sd0sQfhpdHjpCZyvFBPASCio8ZDJxXC9deubLwmdsvi4XSJSZMB+/0zhfacwG3CAOg8WG+Xoz6whTWJn1xGeX6JTeM9kL9x2zvUPv9OntdGkU9QXJHfiVMvvB78hH3eyg4+K1jlaneyvrqJNM34MPym41/dRlfsi3rzgYK6x1hG7N7V+rdlAJpQdf0k
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 17:27:30.4952
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac5728a5-2131-4d38-4928-08de6a5c002d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5660
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_092740_050201_0057395D 
X-CRM114-Status: GOOD (  11.60  )
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

The Main UART can resume from suspend to RAM states when PIN_WKUP_EN
is enabled. Add the necessary pins needed to wakeup the system. Add the
system idle states that the Main UART can wakeup the system from.

The UART driver uses the "default" pinctrl state when the system is
active. In the suspend hook, if the UART is wakeup enabled, the "wakeup"
pinctrl state is selected by the UART driver in order to allow wakeup.
Upon resume, the default pinctrl state is selected again.

Reviewed-by: Markus Schneider-Pargmann <msp@baylibre.com>
Reviewed-by: Dhruva Gole <d-gole@ti.com>
Reviewed-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Kendall Willis <k-willis@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi b/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
index 50ed859ae06c47af38b11753d909a91485d438e5..ab9e58c2d225eb44c054d984aad8f0bed92bf7e9 100644
--- a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
@@ -151,6 +151,13 @@ AM62X_IOPAD(0x1cc, PIN_OUTPUT, 0) /* (E14/E11) UART0_TXD */
 		>;
 	};
 
+	main_uart0_pins_wakeup: main-uart0-wakeup-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x1c8, PIN_INPUT | PIN_WKUP_EN, 0) /* (D14/A13) UART0_RXD */
+			AM62X_IOPAD(0x1cc, PIN_OUTPUT, 0) /* (E14/E11) UART0_TXD */
+		>;
+	};
+
 	main_uart1_pins_default: main-uart1-default-pins {
 		bootph-pre-ram;
 		pinctrl-single,pins = <
@@ -322,8 +329,12 @@ &wkup_uart0 {
 &main_uart0 {
 	bootph-all;
 	status = "okay";
-	pinctrl-names = "default";
+	pinctrl-names = "default", "wakeup";
 	pinctrl-0 = <&main_uart0_pins_default>;
+	pinctrl-1 = <&main_uart0_pins_wakeup>;
+	wakeup-source = <&system_deep_sleep>,
+			<&system_mcu_only>,
+			<&system_standby>;
 };
 
 &main_uart1 {

-- 
2.34.1


