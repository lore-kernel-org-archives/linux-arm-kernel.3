Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61ABEEC01A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 09:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3iof9wozdCNF9iBqOefC+tDROYRV+4AnTEkj1JUAX+M=; b=AYoOEbmMY2mH0tyKM4R0IwahR9
	tq8hWPRF6gtUme45U6lkVtEmoHl3RYHOroBmn8NZhCNrrz2mRbkYWSJ0mGNXIgB0K5NSTyWNJuC4w
	h/cU/PlcPTCiJkk0MP9e4bn3JEHBF0ItwbuoBKlH2/CX6rlBmgRTggFMxA5KJhzZNSb5jGCrO8CcM
	C25xbwOANVmlwHmVqCZbI/SuA0oYQae1fZY8qm+1JFo1acFyE21VWFBtOn3pKPFhaNmLKjXfyxmQP
	3l4509Afq8/wDDhbYkXk+Bt62mCcgYg2qlA3e8vL5YgHo9Ok+qAwuA/Gt5S/t4ZN453KsP4f5Wl71
	jo+fIt6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4bD5-0000000GKal-1ro2;
	Mon, 23 Mar 2026 09:04:31 +0000
Received: from mail-centralusazlp170110009.outbound.protection.outlook.com ([2a01:111:f403:c111::9] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4bD3-0000000GKZB-0X7q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 09:04:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q8o6or44bmo9PugY8D01IEhwpwAiXSmj7m8M/8yxU+37/2+Yw5jZ4T33PPqXfukL4N+79JnjdtBc7/f7CoxEVlatQUco1Xol0nNC/gE0v5MsfyKJ2bgbx1GifdvhGoCIXipo+faPqlCFqHvr88ZmtMIVQD+Ti7ao93zGD6iBlXrKBFVawngRjLGZH3oFACMB6RLbDTpLXDjLfR8N7s5DsuBspWOXX+4dJ4IYQ1gA/OvgxhA8fOO+E+MnDO+dCWcYC7o9jOyuEhh8xvsWyMKHYVh4HMT/FJBIVXbj5yxSZaCUmZjNY3eSTBH0wYZZvFB7YOyZzYEhc3gd8Rh9CKIRMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3iof9wozdCNF9iBqOefC+tDROYRV+4AnTEkj1JUAX+M=;
 b=oahMorzfbEQtmxABQRopOFXRlt1dtptc5ZKC48mNE7W+TKy//e/IMUHucJLC3f7++ajmIyRKcz89WUPhPW0ei1tpcZCJVjmzFkq0tzEbIXZTRP0HeGqti45O5fgMPQx4UDrXTStQ0pEyFbCfmpxdaNj/Wf3+K8BG9VqAJzUiQsMSYAD0wnLeVmGT6ZlNXj1Txx84Xgbays7eXryFETpTlILAk9iQWmegvLkqqCwAOPegH1bB3sO68SYGqaZqb8BqP3/dyrH4jlB7vnjSkWaqegoJUCphbtXQIz+NbgihfpE8MaynPtnTMMx4RRN0RYP8wBQ5+aOcI9LaNQyt2e4wtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3iof9wozdCNF9iBqOefC+tDROYRV+4AnTEkj1JUAX+M=;
 b=Sm3myPgGZN1IH8ME0qUl4B8MdIjl1jJaWPhYr6u+cvj5soKb/54d9sPkQNS3lsHn5XfxsRjh1xVBcONr1QjhfU1BaDc8FAyo17N4veDxXzGQsKh6ZQoj8tZ/aXKH/1WhQHhHX9Bhfnx2rWLM02qyh2KKMjlQqFHnnRaBmY1enos=
Received: from CH2PR04CA0026.namprd04.prod.outlook.com (2603:10b6:610:52::36)
 by LV8PR10MB7846.namprd10.prod.outlook.com (2603:10b6:408:1f7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Mon, 23 Mar
 2026 09:04:23 +0000
Received: from CH3PEPF00000018.namprd21.prod.outlook.com
 (2603:10b6:610:52:cafe::2f) by CH2PR04CA0026.outlook.office365.com
 (2603:10b6:610:52::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Mon,
 23 Mar 2026 09:04:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH3PEPF00000018.mail.protection.outlook.com (10.167.244.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.0 via Frontend Transport; Mon, 23 Mar 2026 09:04:22 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Mar
 2026 04:04:08 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Mar
 2026 04:04:07 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 23 Mar 2026 04:04:07 -0500
Received: from fllv0122.itg.ti.com (fllv0122.itg.ti.com [10.247.120.72])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62N947Ma334975;
	Mon, 23 Mar 2026 04:04:07 -0500
Received: from localhost (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
	by fllv0122.itg.ti.com (8.14.7/8.14.7) with ESMTP id 62N946sA003527;
	Mon, 23 Mar 2026 04:04:07 -0500
From: Meghana Malladi <m-malladi@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, Nishanth Menon <nm@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>, <srk@ti.com>,
	<danishanwar@ti.com>, <m-malladi@ti.com>
Subject: [PATCH net-next v4 2/2] arm64: defconfig: Enable DP83TG720 PHY driver
Date: Mon, 23 Mar 2026 14:33:58 +0530
Message-ID: <20260323090358.632329-3-m-malladi@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260323090358.632329-1-m-malladi@ti.com>
References: <20260323090358.632329-1-m-malladi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000018:EE_|LV8PR10MB7846:EE_
X-MS-Office365-Filtering-Correlation-Id: ad378663-5d37-4546-2fdb-08de88bb2ca2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: UevXR2MvgcYnuKl6Q/VRnaGeflb9CGUw+9NnLYTmp9cDU92KoDhdVh1NwDh/u9czXv095r6B9b8788gXK8LqL3AHzxMMeAzqPvvOjkRb7ng7WjL04glNiPeKO0WC5Q/jZ7GWzpFh0fj8e3meoGQ7BP4ZIfwt2Jrk17fAyMpYKzDqsKXIziFT5mpLeuMElUJPl8JtCk9abd1ZwvGqs19W4nWNcJBrGwBhd8QjO7Zz0gsd9E5QGar9p2RJnc54GT8EpgJCX6KLgEOSZZZTn9NiRTHCHIq8nysoAUt6aEXfyUdtTMoOXlMVOJy3XFEe1tguuJ6EvObYJAlJf06u+y7UrP+APX4pPQDLQzX1ARBsYNeNmPFLgRomXmRNmmgUIQfgUbbETaUiZWVAEtrh0rS7zfQebY4BccqwF9rYJdudMYq7zQKipVN6sOpTdDgiY49HSDPR1H1OpOXZPKaxP8NlDQsNYr7zV1cDX9a+9Cgr/6M3WrfvxiAYqHJZ29QerMQ93EUmP38XK3nRXbh9gKjAnSaYo+vfnZs0wPmJ6yvuKSgPiUpDJh4r+oOn8yqdvqfr4Thk0IrQU2ziS9NK5irU6EQZ22FL8LiVo5iORVMyVOW75SBAoLpU47wVeD+1qmGIHAfWfs69o7/Up5QzQ2b3jnFaGMjDbXSRhwDyGEOYN7T7JgI32C1LU8fwriReciYfRHQywP86LhDQnfbwO39fvaM/SXwjLwGq8GHd5ADuNPg9MNz3pNfDMd9/PStrml7Kv65YSdNfNsWCkt1iQkrFXA==
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: m4oHhCVPDvEs0bT1ZPwjNhuB0OvOSjVilauJQ7aoQjNUBNB+BYJKP4tTjVihSU78Mt/ZsFI5RpEglNl2Vh0/Sa3Oi+R8gP5Uyq+uB4naHDf7ouHXmLpzTRpqluiHaGama78B7R8iuBKOP/F9l2rPhNT5m8EHM2aLRmA+2l90JmxXU1dFX4tRANMs5JSc0/ppPxWjvJrPIkD/UyVvpqBG1vWYvFwVzaLldAeZPYL1Oni1Y2VrTAZwkj4BfiM9C8kPmoHeLZ7u4MwnNuRS+7OtKVq/+SJNOzMDN4WcxLdhsuCFJvEftxfSSyQfchxoAxCrlwZ4bGAM1sBU/LGave3rlU7tR9yqUG8zKoREmJjF7iaMsB02I3kAWsq53i7F/rjtTrYyrZgiQBXz0hfS0f3vHxwfaMcTdKbMkbHinQ3jma5RWyH9nLLFhDqRGWqU8+g+
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 09:04:22.1340
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad378663-5d37-4546-2fdb-08de88bb2ca2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000018.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7846
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_020429_167791_E8C10060 
X-CRM114-Status: UNSURE (   8.76  )
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

Enable DP83TG720 PHY driver as a module to support TI's DP83TG720
1000BASE-T1 Automotive Ethernet PHY. This is required for the
DP83TG720-IND-SPE-EVM daughter card used with AM642 EVM ICSSG0
interface.

Signed-off-by: Meghana Malladi <m-malladi@ti.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index b67d5b1fc45b..3b88df2ca5e1 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -420,6 +420,7 @@ CONFIG_REALTEK_PHY=y
 CONFIG_ROCKCHIP_PHY=y
 CONFIG_DP83867_PHY=y
 CONFIG_DP83869_PHY=m
+CONFIG_DP83TG720_PHY=m
 CONFIG_DP83TD510_PHY=y
 CONFIG_VITESSE_PHY=y
 CONFIG_XILINX_GMII2RGMII=m
-- 
2.43.0


