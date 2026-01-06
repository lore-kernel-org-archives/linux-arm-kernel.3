Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E54BCEFD19
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 22:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8StvKMEdFLEf/M7rEPTtPv7xi2wLWzAPfIJhnwTHPDM=; b=iIDcDi2o6H6Kql
	md04YYergVUzO62+fIhSjlz+1Jn2btB2KUR+/SBBM3CLXFeGw0tkWkv5P0S2uLgP0Jx0PgX7e30FH
	u8v60OStsINPN+IqcG1KfLkcTU9HFGhYg8+SNINE3Je76B6753vUgT6tfoz5bdv7ippA1dQQcr1yr
	+oi25jTw08nBDkOrYeb67EzBgafcfK9xzeXQjkj3+usNMZUUqTyPjsciB6xCph71UfXdRwug02K8s
	ll9Jzc/ylZ6h90WCohKUORQeQyqP7KtU2gPz+t7BhB3O9KQu/qDXRC7ubz3rfDQecBjwuO8PfKBwE
	WwnL3EBgUiufRmzytaHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdFj2-0000000DusQ-1tOf;
	Tue, 06 Jan 2026 22:40:28 +0000
Received: from mail-eastusazlp17011000f.outbound.protection.outlook.com ([2a01:111:f403:c100::f] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdFiz-0000000DurD-16jb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 22:40:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nH6os1WREjAM5ymC0EDjO/B7sn6yttmS6Y/rHGbKrwvEv9vN/hIvJmJxE7KbR22hyS/7o/CXU23cCX9xlht/fWR7hLH5QIRnNLqXqIEX/At1djzcp3CRJzGVg2gKVNB+K/j1CLfAMNt0uOv9l5sQ4q5ohJSSi+ezYs71mWeHjZwz1snBL1iDxn3wG0FgknmXghc5mEEd/8pj1fV503P8ncLlp33gpO9KxSd5hotzdKpkpGxYrXacabmASjD3O1Se2ooWbBIzGiAR7xYsraBZiLJBmMfDh3sTgrd3v5jvzL+RNdPoTwlBljeyGV7lnF63UjlRhnkk05JczpdnxcJINw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8StvKMEdFLEf/M7rEPTtPv7xi2wLWzAPfIJhnwTHPDM=;
 b=VVpzV33VPop4xmetgFyTbCMgago98Lfr0ajWwI98AIb5GDt+Y5zponNUOo9xuTpg2qHWnY1aJpj0Arjif6ns1yp+BVjs9qMmWODrxeRlSmRV9aR9zd6Yotaow2qLKE9m2MURfeZz2SbY/kv39fp0z+I+CDryuv926IROfXolIRPk3G5b4497QX+EPIB+1ryYu3gaUwxWybLi9KeKXO++Xry/kkM9LUgNq4d8m6IvDVQ7RtAyyoKBKY7jqpBbFR95j7A8o/HDovhntXaJ8vpvTK7CqZndRen9ljuUJGcjt08H587mb9kmg3IBzk224kZPXiINWUHYYaipJkoX/Vi4Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=baylibre.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8StvKMEdFLEf/M7rEPTtPv7xi2wLWzAPfIJhnwTHPDM=;
 b=YFHQ/v5lmPHN0yoeSUw+3+lAFxhTkHAiIRhIyjiMVonntoKdFJhT8SixgdqcXMs+i9T8gfszHSYOp0qTyZCah28pTfdKqddL4nPXy91G3eDXaElvRBrXK+AE5sJvUgZHJ8RtpefFzLCNyVdDjswS+LT6apO56rHtkCQCXV5l5/4=
Received: from BN9PR03CA0753.namprd03.prod.outlook.com (2603:10b6:408:13a::8)
 by CO6PR10MB5554.namprd10.prod.outlook.com (2603:10b6:303:141::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 22:40:03 +0000
Received: from BN3PEPF0000B373.namprd21.prod.outlook.com
 (2603:10b6:408:13a:cafe::3a) by BN9PR03CA0753.outlook.office365.com
 (2603:10b6:408:13a::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Tue, 6
 Jan 2026 22:39:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN3PEPF0000B373.mail.protection.outlook.com (10.167.243.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.0 via Frontend Transport; Tue, 6 Jan 2026 22:40:01 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 6 Jan
 2026 16:39:44 -0600
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 6 Jan
 2026 16:39:43 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 6 Jan 2026 16:39:43 -0600
Received: from [127.0.1.1] (uda0506412.dhcp.ti.com [128.247.81.19])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 606MdhS43586904;
	Tue, 6 Jan 2026 16:39:43 -0600
From: Kendall Willis <k-willis@ti.com>
Subject: [PATCH v2 0/3] arm64: boot: dts: ti: k3-am62l: allow WKUP UART
 wakeup from LPM
Date: Tue, 6 Jan 2026 16:39:20 -0600
Message-ID: <20260106-wkup-uart-wakeup-v2-0-fb4cbd56c827@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABiPXWkC/32NQQ6CMBBFr0Jm7RhaU1JceQ/CopRBJkQgbSka0
 rtbOYC7/37y3z/Ak2PycC8OcBTZ8zJnkJcC7GjmJyH3mUGWUgl5K3GfthU34wLuZqKcddfZWhm
 jB02QZ6ujgd+nsmkzj+zD4j7nQxS/9o8sCizR9hUJNei+VtUj8NUuL2hTSl9LEZeKrQAAAA==
X-Change-ID: 20251230-wkup-uart-wakeup-8bbc95aa8f8e
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Dhruva
 Gole" <d-gole@ti.com>, Bryan Brattlof <bb@ti.com>
CC: <vishalm@ti.com>, <sebin.francis@ti.com>, <msp@baylibre.com>,
	<khilman@baylibre.com>, <a-kaur@ti.com>, <s-kochidanadu@ti.com>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Kendall Willis <k-willis@ti.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767739183; l=1870;
 i=k-willis@ti.com; s=20251230; h=from:subject:message-id;
 bh=huShoD9o95l5j39jMKjn/haVANryUVi6lJtk4VjnD58=;
 b=NIsZmoMUZNiN/EvXCrHGGYtpem9m1hN/geOU88jiqkTdyKaNOBABxHJMqBJm0EN6AMO8YTAHE
 j/m/ijWeZFgAkcGtN9VFhoY70jBeUL39kLyh0129iln/BLmRqC/jDt8
X-Developer-Key: i=k-willis@ti.com; a=ed25519;
 pk=fQiPVFwmogfDAKdaAKq163RWSfgHZVE/MrsDzp0Xo1k=
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B373:EE_|CO6PR10MB5554:EE_
X-MS-Office365-Filtering-Correlation-Id: ee134ecb-c37e-4fd6-dd70-08de4d748718
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QUxBVmpOYkJZZzhKU1dwc2dFeVEveEMyMU1lc1o1dkRBaGNUVzRpKzN5VTJB?=
 =?utf-8?B?bTlwSWVTL2lBQ2xZOGdnajFBN3BadzhndDdIUHl6ZGZEL2FoUXhTYThWS1Yr?=
 =?utf-8?B?ejdCSXVpelV6Q1hta2pyK0ZNeS9CcG90ZDhxem5RVm5yd0ZyN0FvQXpUazd0?=
 =?utf-8?B?dTdBUVNpR1RZSkJNUmczQkNGd2VQN2p6NWJlMzlhVzMxMjdBblpwRFB5WTNi?=
 =?utf-8?B?dk1DSm1ZWExFNTR3MG55S1F6YjVuSytxMjBESGxFbzhCbEV4TUl4clk1QUcv?=
 =?utf-8?B?U1Y4ZWJJTXcrMStRWC9uYTU0VkYvL3BoVjNORUlnaUtLYTJTcmk2RUJRWXlv?=
 =?utf-8?B?cmFWeXBtWUhjRmxNYlhRVlRxWVltTVVuU2JUM3JYNG9xN0JMUWhiT3ZwS2Jk?=
 =?utf-8?B?d3RNdU1LTHZtcWdLZWx3VkVvWTVCaG5UWEFrR2FJc29ESnhIaUl6TWcxazVV?=
 =?utf-8?B?T1dIZVYrTkQyVTRHbys3RDdGaWIxQkdGMlp6K3hXSDRXR3NKTi9kS3VHWkVt?=
 =?utf-8?B?WTlTKzhHYVJCc2JteDYzaE54QmFydFBodllXNVd5SVVzZGdmcml2WUt4eVRV?=
 =?utf-8?B?OXBITkxIOXhmY2VNRlBFK3RIZFpEcWJ3elVNUnBvVHQ5dVpaNmhZNVNMdjFN?=
 =?utf-8?B?WlhEYitxeEVKeWxWejk1Z29BYTZWVVNGWVhCZmV0MjRWbXFjaWNjalNIMXZk?=
 =?utf-8?B?VWl6VDVhRW4zTmt2c0NsL01yWTZlZnJyYmI0YndoM050TC9SWlFqQ3lhdXBU?=
 =?utf-8?B?RWd1a0VwOS9VTEFmVTNMTStHbXFEd2cxZWRtYlhCdFhmR01mZFlVcEZzYXVh?=
 =?utf-8?B?RHBpQ0F5T05abE5DOENSb040VlhOSFhsUnpJMGxpSG1Na3N1aVhMYUx0cG4r?=
 =?utf-8?B?WnBaUkhxK21qaDFDY2xYRkdkQTFMaTYrZHpqUDd6N2x4SERXM2FQTkJUZzN4?=
 =?utf-8?B?QllQak1ISW0rQUYvb1p0QlZVdnIwS1lFUE9ISDZsSzNyam1xWVhWU0M1Qkpn?=
 =?utf-8?B?aytURHNJTVpkdk51Z1NTdUVGZzdZeCtXM3pMNGRTbUF5RUwweGNtYlZhb3dw?=
 =?utf-8?B?S3ByVExhTG9nNVZYY2Zsckc4UUFLcERIdVFqKzgxSC9qeStXTHNXaWE2WUNL?=
 =?utf-8?B?MGROL25lekswQ2ZwN2MyRzhpVjBBOU9ycGttRzV3RzczRy9LejFLbHVINGVa?=
 =?utf-8?B?bCtLVWdHWkgxYTJhZTlpMlV6dVQ3aHF3SGhnWU9CRkZBZ1BaSm9pNEl0RGRu?=
 =?utf-8?B?OFQ4cVdFTllhMmNmTUl0SkFwdThCcFBDUzhPWnNzd2gvbWU5czFOUHFaWDZW?=
 =?utf-8?B?S3NyaVhlajUwb2JuMWozK2JURUYwbWJSTDF0VkJ6V2FYNXNROHVxQXRSSS9B?=
 =?utf-8?B?bm5ybDhnOTNZRkk1NGx3VUtSNlBZT051V2VqTlYybzF2d3l2aGl3V3ZUNm9M?=
 =?utf-8?B?eTN5YlRta1NmTlNlZUt4VE92M0ppeUJTR2s4RGEwKzNsbUtVM3pyQUVyMmdk?=
 =?utf-8?B?bW11MXlqTS9keVN4N0wrQ1dLNmZUbmF2TWxESWdKWDNhSkc3U2Jmd0pQWlhm?=
 =?utf-8?B?VWhLcDFzcmpwTEFHN3NOd3JBKzFCeW5oWFVjS1IrL0dtMXNEMTN0cVExT1NO?=
 =?utf-8?B?N01rak1aZy9Hc3IyT3gwblJpbFJRSG9FR1NXNXBQWml6ZGF3Z1RONEFOelBF?=
 =?utf-8?B?c1hUaWIxM3BNUWNBa2R0UGRIbmxHR3MxS0U2NnV0Z2ZMWXNWV0tUbE81RHdy?=
 =?utf-8?B?U0h6RmFuWXdzakdpcCtJRFd6dk8zVUFFZFZ1OFlmQWxJcUh1ajBwMVFOT1lU?=
 =?utf-8?B?dXlFSG5oNWY1M2FMVC9TejRadWYrcGs4ZUh1SmY3THkxL0J1Q20wcExpQTM1?=
 =?utf-8?B?Wm4zbGkxTVY0UVlseHFuSlNkWXBSUmY2cUtaNUNQVG1TdVJBL3BiNUROMFJz?=
 =?utf-8?B?TXJGSVdmZmVFTDQyU1A0SmpHU1pUa0lwSWZmTmk4WmtWbHJ6dUtWUDBLV1lU?=
 =?utf-8?B?TWNRWU5BUXBCTFI2YSsrNk1yQ0hoMDc2WDBNNDNCZUF6Y1ExYVhZNzY3OUls?=
 =?utf-8?B?WXp3N09lNXFCdFRYWnhSWWNiYUUxaVM3clZSRVkrQ2x3QWJiOGc2WUQ4bElQ?=
 =?utf-8?Q?aN++JWIYbhn1XlL12rVXAyzFT?=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 22:40:01.0660
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee134ecb-c37e-4fd6-dd70-08de4d748718
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B373.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5554
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_144025_504987_EB6425E1 
X-CRM114-Status: GOOD (  12.22  )
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

K3 TI AM62L SoC supports wakeup from WKUP UART when the SoC is in the
DeepSleep low power mode. To allow wakeup from WKUP UART the target-module
device tree node is enabled. The ti-sysc interconnect target module driver
is used to configure the the SYSCONFIG related registers. In this case,
the interconnect target module node configures the WKUP UART to be able to
wakeup from system suspend. The SYSC register is used to enable wakeup
from system suspend for the WKUP UART. Refer to 14.7.2.5 UART in the
AM62L Techincal Reference Manual for registers referenced [1].

Previous TI SoCs configure the WKUP UART to wakeup from system suspend
using the ti-sysc interconnect target module driver. Refer to commit
ce27f7f9e328 ("arm64: dts: ti: k3-am62-wakeup: Configure ti-sysc for
wkup_uart0") for an example of this.

Testing
-------
Tested on AM62L EVM.

[1] https://www.ti.com/lit/ug/sprujb4a/sprujb4a.pdf

Signed-off-by: Kendall Willis <k-willis@ti.com>
---
Changes in v2:
- Change subject of commit "arm64: boot: dts: ti: k3-am62l3-evm: enable
  target-module node" to better match the code logic of the patch.
- Link to v1: https://lore.kernel.org/r/20251230-wkup-uart-wakeup-v1-0-cd6e15f8d956@ti.com

---
Kendall Willis (3):
      arm64: dts: ti: k3-am62l: include WKUP_UART0 in wakeup peripheral window
      arm64: boot: dts: ti: k3-am62l-wakeup: create label for target-module
      arm64: boot: dts: ti: k3-am62l3-evm: enable target-module node

 arch/arm64/boot/dts/ti/k3-am62l-wakeup.dtsi | 2 +-
 arch/arm64/boot/dts/ti/k3-am62l.dtsi        | 4 ++--
 arch/arm64/boot/dts/ti/k3-am62l3-evm.dts    | 4 ++++
 3 files changed, 7 insertions(+), 3 deletions(-)
---
base-commit: 6cd6c12031130a349a098dbeb19d8c3070d2dfbe
change-id: 20251230-wkup-uart-wakeup-8bbc95aa8f8e

Best regards,
-- 
Kendall Willis <k-willis@ti.com>


