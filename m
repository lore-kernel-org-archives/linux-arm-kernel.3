Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25B94C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 18:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2XZEkZ8Nh7IJar+QLhbRsqhoZs1SudCLK65C/XokS+Y=; b=oqhx3WE6F8QYCkO33CCidk/OaD
	9n1BhB3l2iXOmgUSv3Y/ZdvueV9Sl9ZaJ5pijVsBUzS8cr3OAN8ct0uUGcasih3k5R71B8wEVX4TK
	uYyJ+3fNWC913V3ER50Dxy5zlD8SGZamyN6uBQTjOpO8/TvOEuN0yYqJBxaoh4w1ViqNwkx2AVNN+
	tvWZDpSOprzw+4GxvzoXQDKcCqZ5YZ4HPobeyOb/KqSPX7wFNH/qutsTwJy/lPbZFYCZ/SGXefLAn
	FvvB9qgOADjEJqIuUqn2GoeHwLVbodf36RgudqsGay5tM3f6h4HjAZcLaqc5piToymf37awKAE+eW
	lQHaHy6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc6qs-00000008Oi9-33Qt;
	Wed, 16 Jul 2025 18:27:34 +0000
Received: from mail-mw2nam04on2061b.outbound.protection.outlook.com ([2a01:111:f403:240a::61b] helo=NAM04-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc6mK-00000008Nuw-2Qd4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 18:22:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U5Um1CM4JrelU2i7hqjDI4qh+RdSySTlfZibF4w0ZsiRPF87ls+o9VODW2Z4x+Ut95Vt+TaVO9JKkOSgZ4ASgZ8DxtJuCGYx4rzFDHazrXjG38MmXIYGexl8XfmVD6z721FJu1jSBRdJJB54F3d6cWSSYAAujWTOHY3spJleFKzWfHQBCoCXP8+jZqUfpLrlCfS5hHoirHym0OgKAJQGb7inPK5Si1U6ezQFLNXde0s85syXQ8cqvw8rW0HuQwHJO5n+kViNlQrzTQ3XIoxkufyIViV/mwYjubwo4vU02Z4loMdxs/qtJEgMz0qXaLqEJXs+YMNJetjA0wYw7Qf2eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2XZEkZ8Nh7IJar+QLhbRsqhoZs1SudCLK65C/XokS+Y=;
 b=QAbDu5G+/fmutp4/PbNb56qSWPGz+e8GtdwUudMdF3DtlDOAetXjOdx8HPuKHhfIhfblPONuJ0+Tf4QuhT9RQBHIkzPD5ysikGay6VPbqlD8V/lUQb/EWfgRZ1m5NU/usFcvAvbeb3o61nK+/ZF570Gv5MOEvOPyR2gz5+dvn2EuukRzWNaqbCLMVLUfVmaOv92eNC7l2No0wkAgAunoAMCQHoomWFRrrpnkTs2NmZrSu+P8/4Tk1g5YICWqQCW2gtxM2rYqfPE18Ex+PhK6ANsWNJVifsqzE9EAoDzqw6pawc/Xe2x7WFj9DUb85EKiXSp08NqvrYbX/CaCWzPVdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.ozlabs.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2XZEkZ8Nh7IJar+QLhbRsqhoZs1SudCLK65C/XokS+Y=;
 b=gCnXc01IQebtPlbVSD6R9BB9vch+sNKEimzQIFlz8dZAArhlwARDeLdNfmuF9iEHfWsF1ginuvk6kBtLCO0scu/ZPe7qpHYT18EJIFDTlr2vciU31yx0XEHw2mddobQfK7TZUVJ4DYEiYSedEgWKKuoqkkTzPJBIQjBQWUsWKTMoKMdv2U5WkZCc41grcqdAe6G5J9arJiMAWK1kQs7vJdWjEOleV39mfGbIYH7g1TKhofmo60PKcLpTlbUZ4sLEy7/UBEhWwO1qccwWvuIaZ4eyhkNNXbfbDJyQm1oXNj9J/YLHG0UsVpHs37qkz0nlXB8CHHBfmWtjmQeBP3yCTw==
Received: from BY3PR05CA0045.namprd05.prod.outlook.com (2603:10b6:a03:39b::20)
 by IA1PR12MB7613.namprd12.prod.outlook.com (2603:10b6:208:42a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.36; Wed, 16 Jul
 2025 18:22:47 +0000
Received: from SJ5PEPF000001C9.namprd05.prod.outlook.com
 (2603:10b6:a03:39b:cafe::6f) by BY3PR05CA0045.outlook.office365.com
 (2603:10b6:a03:39b::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.14 via Frontend Transport; Wed,
 16 Jul 2025 18:22:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF000001C9.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8943.21 via Frontend Transport; Wed, 16 Jul 2025 18:22:46 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 16 Jul
 2025 11:22:31 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 16 Jul
 2025 11:22:30 -0700
Received: from willie-obmc-builder.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Wed, 16 Jul 2025 11:22:29 -0700
From: Willie Thai <wthai@nvidia.com>
Date: Wed, 16 Jul 2025 18:21:56 +0000
Subject: [PATCH v2 2/4] ARM: dts: aspeed: nvidia: gb200nvl: Enable i2c3 bus
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250716-update-gb200nvl-dts-for-new-hardware-v2-2-9a1a916f461d@nvidia.com>
References: <20250716-update-gb200nvl-dts-for-new-hardware-v2-0-9a1a916f461d@nvidia.com>
In-Reply-To: <20250716-update-gb200nvl-dts-for-new-hardware-v2-0-9a1a916f461d@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>, <openbmc@lists.ozlabs.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>, "Deepak
 Kodihalli" <dkodihalli@nvidia.com>, Ed Tanous <etanous@nvidia.com>, Leo Huang
	<leohu@nvidia.com>, Willie Thai <wthai@nvidia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752690148; l=909;
 i=wthai@nvidia.com; s=20250525; h=from:subject:message-id;
 bh=E5CvWtfedBNindT75YTTq7hmXgdKy6ZDH+6awigFKQg=;
 b=RjrCFH0zc7Y063/5GThjGSbNQi0mXcnVtMNKNhsZ8/EYliLo0kGxuNO7WSsbwNthPZhJEJ+oW
 Jch+QaruvgeALHuJWBGS4r5s1vI06ZKC0ZuaqTjqfhJvMFrNyrYnnrX
X-Developer-Key: i=wthai@nvidia.com; a=ed25519;
 pk=i/6dxnUqKdr7Z6GA0KECRkwz5HX4RCiodw0v6kB9fbs=
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C9:EE_|IA1PR12MB7613:EE_
X-MS-Office365-Filtering-Correlation-Id: fdebf74a-d767-4491-ca31-08ddc495c379
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|82310400026|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YXlaeUx2WEpsVFRFQnN3M2JicUZsQ0NKUWx2Nm9FRDVaejg1YXNjTGZ1Y2F4?=
 =?utf-8?B?WGJjYnlRNWVlaTlKQkE0RXlPeGs0N3R6U1pya3NsbTZLOWtkaUpnamRjUEpL?=
 =?utf-8?B?Zm5zMlk3R1Zna2tGYmU1U01YV2NSTVFBYjFjdHFSaDZRRjQrSEwrTXVlYlRv?=
 =?utf-8?B?YnNQWXlCSGFHU3EwNGV6TEhTa2xEeEpmWm8yZHl2alF2SytVVlFqdjdZa0Iz?=
 =?utf-8?B?VGxUOEdKU2UzaHJEaThDN1YyQytWSndxOXh3elN6a1h3ZTE1bGVQUXhlSnpF?=
 =?utf-8?B?aDdaMG5uUGs1OGVpemZWeUVCM2tjMktheEI1QjlnNmtrcUtRTHNGMDBhVG1M?=
 =?utf-8?B?bGpaalVPcGl2VFdneWFWc2FpeFZqNnIwZUhwQjR1Z2tkTHhmT0h3TVZDSjRP?=
 =?utf-8?B?RUhCU0dIWDFwaThXOWRBa25Qb2w0VTZhMy85SWFWYnE4VW8ySTF0WTY4RUly?=
 =?utf-8?B?TUwwMXRjQ1lpSDRVdDZrbTl6YTFYWWtFQVFTYTZVWnpkVGZINjlwbG90Q0ZX?=
 =?utf-8?B?S0ozNWFpV3dRbU94NFVzbUlQZ2JaU0N0aHZkSEtEb2p0WGt0YnJ1YzVSbkZ5?=
 =?utf-8?B?UXovK3c0S2thNmdtRVhhd1V4eU0yK2xPd25nWEVUbW85dnJDVDRVcmJzdkJR?=
 =?utf-8?B?MUppZzJiZ0IrZ294RlU5Z0VFNVNycXp2bERSb1VXd2ZwNlluWFRCVVVVNHVZ?=
 =?utf-8?B?akdGbVNYTTlMWGMwVnlINWovMUtnd3AzZGxXeFo0eWFBRDIxYW1GamRRcFl0?=
 =?utf-8?B?dUlnMEdwOU9PU1oyZ2V3RURwc3BXT3g2NlY2YUhzOEYya0NLOC9CWGg0R3U4?=
 =?utf-8?B?VHpzdTAzaXBrMWJGOHdTYld3VjJBdGIyRHFLUU40RGd5cy80ODdwZkNTU04z?=
 =?utf-8?B?aUJNcUJtbXpYSkVaa3ZYaXB2bE14eVdVbjUzeXJSQUhWQzFORnNXTWxsdEo4?=
 =?utf-8?B?YW80NmNJdGpMT1BSMkVsMW9qUWN4L3dGODdRNWtZK2M2Q0xBSzd3RUc4SGtT?=
 =?utf-8?B?OFJZZ3lTc2NuWnlnbHdkVUJZME1UelpyV1Zzc2M4UU50SXhFZE84MkRWa1Vw?=
 =?utf-8?B?SGgwSDlkTW0wZWZRT0l4NFlIS2s0UkdJR2pMWm82S3dwWmhRRzA2c0hBL2pP?=
 =?utf-8?B?anpqQ2haLytSM2o3aHI4YllBQzVqRVVYbzhtY3VFcmlMSytrWHRIVmJRQncx?=
 =?utf-8?B?OWE4SGxBdTZxaFhtd2hxVExFckFCdklnNkJhd0VFODlremtMWnlNTVRRQUhs?=
 =?utf-8?B?cmRRNWoyYjlvQ1pDKzZQai9lQUZmR2o2cUlTOG5YUGo5ZWtnOE1MYloxSDl5?=
 =?utf-8?B?RmozMjdHemF2Ry9rZ1ZPbytvSlREeTB2UFQycEhhOTBPWm02S0JUUEViWnFO?=
 =?utf-8?B?Zk84L0V5Y3c3NHh1Rm5vRTNVRXdkQno3em9ZQk41Q2lPZko5TThHKzIrZlBU?=
 =?utf-8?B?bW1kbnZMeEpFTnFVWHowY25mNVVROEhOM3IzTVdEMlVsM1FOdXlQTDlkaEht?=
 =?utf-8?B?N3RQYWFPK2xydVlmQzd4dGFNOTNVQWpQek1mMmN4RWxoSUJLUWRDRTd6MmNl?=
 =?utf-8?B?dk0vaUxhQUlxWThjZFNvTWFubGxISW9md25SWmhkUVl0ZFZPSm9zcFJXdGxu?=
 =?utf-8?B?alBSNUNQSWk2NWg1cW1rRjB5Nks3aEpLcXZ4bmswZG5lRzV5Yk5ENnR3UjJo?=
 =?utf-8?B?eDQ3MEZHaTNqSUNtVEpicFgwOXlWam5PQk9VMG8wUkNEbGszMFpQQXVnb3ZX?=
 =?utf-8?B?anhGRk50OURWTEFnZkRqbHRvYnRwNlErQm8vdE9RV0JrcDBTNkFTSTJTbmF2?=
 =?utf-8?B?YUxBdndFcWl1UGVtNjZBVFFyajlGNVYyOFRzWUE4T0kzdngxQmdqb051SUhh?=
 =?utf-8?B?VVllTlJzUXhKSzl4S0ZGK2FxQTZnZXJ0dTlCdEd0N255WVpySEFxV2lKbEU1?=
 =?utf-8?B?QW95QlM3Z0hQN3JXVW9KL2NBU01iWVBabUJLd1piU2d2anRONStYNS9yNWlD?=
 =?utf-8?B?RW9WL0pHRzdvSnFpN245aytoYy9YTVE1OEZ2YmtDMU10cC81aVR4RmhMR1hI?=
 =?utf-8?Q?OHI8ej?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 18:22:46.3900
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fdebf74a-d767-4491-ca31-08ddc495c379
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001C9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7613
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_112252_624692_17FC27E5 
X-CRM114-Status: GOOD (  10.65  )
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

Enable i2c3 bus for telemetry fetching purpose.

Signed-off-by: Deepak Kodihalli <dkodihalli@nvidia.com>
Signed-off-by: Ed Tanous <etanous@nvidia.com>
Signed-off-by: Willie Thai <wthai@nvidia.com>
---
Changes v1 -> v2:
   - Fix unevaluated vcc-supply properties [Rob Herring]
---
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dts
index bd9395a194137ea70d184665ad6cb659541ef175..f0a18adc328759e290bc354ad8ef703f28c1ffe8 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dts
@@ -422,7 +422,7 @@ &i2c2 {
 
 // I2C4
 &i2c3 {
-	status = "disabled";
+	status = "okay";
 };
 
 // I2C5

-- 
2.25.1


