Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3193AEB3624
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 18:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0N/4GHdYRFjKxgsToAobmHxHGVo93PArlFpNwgcT5DQ=; b=qxG/CwqNk+y4mhQ4sm/MO06i/w
	DTQkX53/jKnrdUZ5GOZd1hycCIsrK39/Jwb75tMGey+x+SRnopWQcSSbmoU5LBJQOP4ngXimw0yKg
	8q/3HVY4/SUgeSWMlbYsNxkhZq7JiCgcAGJJDi6Mgor2jQ+tmf2t9y3ESBEr2L2RVWhes1LocVw0N
	3GaukunB/sEwmPNkO0fjab/Tpf/k8Ht4p9cyRnGym5qg6nVoo8U+MA+olTeWDZuNHae7GRHl94jET
	zI3WSxwrDfAATium30osWMOp65nXWi5OnBNwsunWTIyOjWH+UGAvSLSkXZZgnlh1jlywa4zTicG/A
	KFWUX1mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx7qk-0000000Dfjc-2ndL;
	Mon, 02 Mar 2026 18:18:34 +0000
Received: from mail-northcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c105::7] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx7qi-0000000Dfhz-0EOZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 18:18:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TAxnfguh+EBt+MgZarpN0lsDMudUXIp+4K9nwQijeWLicCu7Wl1lzWQJfW8hF8xWS8x4fGmFhq7rsFY01rfAUzaD1XqftXOz3eBoU7pJy8cgjVtj4QPtR/wRwh2lF+GkRZjYZaCF536FAn3mCzSSYW9nOcYkuPP4kvndwyT3o2pSBoc11XUg937Q/KT10eBg14OCe2SSUQtEVDAK87491JzxYWCpAHO4doFDntcv9Mk2ekQBOWZNNtr0X3IGQ0+NKB3/VJnZwtg9W2Qx53Yj4NV+2Hiynbwv95811pxuX+nhaLmqJ1Bc2zbFjp4m4fiIcmFUNNbNWZkSTsmPjL61iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0N/4GHdYRFjKxgsToAobmHxHGVo93PArlFpNwgcT5DQ=;
 b=mKAb9As3BGjLn+f81mS8lfBAjv96/hf5pvzj8jNWJp8Ch3RTx0FE08nZYo3pa6FrXyfxPxa+aISnFXiXNW5IY5u9+Z7AejGTL2M7IkZbYaNfIwDItZGiawFUc1PszxEothpVpZbBSWeP94belln5b6LG7cNSkZTgY8TV7hl3VYDAMMzFK+5JKcx5OXrmPB/3v/cl8V4N3nA7M3x0tSBpUrfwXbbQmNdju7xMEd7T4zRWOp3lJ0V4A6fIsdt5qK0/BmHx/OK4Lzxoy1DZwyf7+QZdczR4an+YFPYRo+vobt84E3nbiatLDskvIDwpuDaJFhIwAEUU4odD/GwuEttlsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0N/4GHdYRFjKxgsToAobmHxHGVo93PArlFpNwgcT5DQ=;
 b=UH+/4oKi0tr0BxvpDSfVaeHrOGkbZ9BY90sJj7b28Y+0F483qgemYUX+oBS+B8dws6bC8Nd+NuZ1EL+aDvfZ5UUu2DW9UeTzbUrcQvvA5FaysF2Cd/3B7P9xv7HJokESVJCiTFC/ZiY/k//tmcJN6VxPA8eWgvlk0Uua+Hit4tM=
Received: from LV3P220CA0007.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:234::29)
 by MN6PR10MB8165.namprd10.prod.outlook.com (2603:10b6:208:4fc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Mon, 2 Mar
 2026 18:18:28 +0000
Received: from BN2PEPF000044AA.namprd04.prod.outlook.com
 (2603:10b6:408:234:cafe::53) by LV3P220CA0007.outlook.office365.com
 (2603:10b6:408:234::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.21 via Frontend Transport; Mon,
 2 Mar 2026 18:18:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN2PEPF000044AA.mail.protection.outlook.com (10.167.243.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Mon, 2 Mar 2026 18:18:26 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 12:18:25 -0600
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 12:18:13 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 2 Mar 2026 12:18:13 -0600
Received: from b-brnich.dhcp.ti.com (b-brnich.dhcp.ti.com [128.247.81.69])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 622IIA6x1232767;
	Mon, 2 Mar 2026 12:18:12 -0600
From: Brandon Brnich <b-brnich@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <b-brnich@ti.com>
Subject: [PATCH 2/4] arm64: dts: ti: k3-j721s2-main: Assign SRAM to VPU node
Date: Mon, 2 Mar 2026 12:17:58 -0600
Message-ID: <20260302181800.445653-2-b-brnich@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260302181800.445653-1-b-brnich@ti.com>
References: <20260302181800.445653-1-b-brnich@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AA:EE_|MN6PR10MB8165:EE_
X-MS-Office365-Filtering-Correlation-Id: 503027e0-dc3b-4995-f5ba-08de78881969
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700013|34020700016|376014;
X-Microsoft-Antispam-Message-Info: wFsbyA1JRWtn7zlwu4FK77TNxFEaGLIYpQtIW89AIx3ZdF8Rg9ngOBIMzfrKcmNv0aDJSqwdfMvWkLlmQDfS99hID23KqrByvPwpv8r7rBHiloaAWyFA6BedahlH9LyFgWCIQF/ObJQb0QxssNMh6eaqzuM/27dPRm6n5eq1/cQU0AtCqenuYLMJ5nIooJUDhFuPdIr5KRdmXX5m2Fpc/8Ezh7FAXPAT/1UaSXYThdy28HA9LE4kGy/P/to3HUgRZLNfiCZ/30c3KBtmWqbJLtz7S6gS0pV+Ay0m4h5nq5T3fMu4QGptNUUhjkNYHDcpJc/rAUt0MguV36WLz2Phx2K89meFq+JfyhCjSo9KNcoAuJ7iU093OVRGoslbgyV1l8KgsskcTvsJsbgK4TPuW63DOnWxegvl92AUnk52kGWKNXjO1SX8xxoQocLf0/X4qGFOfzsb1iFfP41y3oVLjF2fmOCm+F1bxM141GnAQ+LHduzTbrsq1mCkkAhOut+DCm8G0FEsoWhtR+hJcq+6jp1TGVmYVKc5IyU5iU6ahgursU2zEA+kWE7s+HQoP8kFhvlIK6y9Rv4Eq9VT4YTiHaJ3veeHSU0uLipmo2Agv5+brWvO4Q/kHq1aHNLYZlcK1QtsKyQwC++1LAexBQL8KXt1HF7w3uJijeJUDw361B8Ro+HixplSaIFANTnwOZXbTuPlEIOl08daGVfEqUtnNUWSOyGHUMAHMq36ris9EkU8o9MMiiq8k2H6zJpUc9bsMIY86UOYALDpjEuYj1DRdB3xN1oVwoP2k+IoEIu4ozulf7A+Qq0+Jgd/sJRZBAyY8wYU/a0RSlt8ezoir7JiKQ==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(34020700016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: hlKgnCKCVDNfAOpE4WN79xdeeF31Iw9N6NuGuByIFwsKoTWw7A05BxdovtNMc0CdVvpLJBulL0xNfttHsbn/0MlYopWH8VeMZzk0uVYD8j/QGHxvuifLHFTZ/QjcvG1HEVqsuL8ZigHSbXVKwJY1UPAQm4ICOomBOsnXVWBweDY7YG0jxDmevXvaCXLdOLGa4yoVSygMempI2QFkQ1hhSLpWZ56PLHXbUOdvgW2fzfnt3kg3hFiiMfxwIAiodUhLp+WuJol0ydIeB8Ot3jTvayty+/tveoFVYemkvqa4qYV7NFG56IX+VGJpEurljKdCNKDyWn34Kfu+GDM/hJuOMlv0w7JtQk+Txj1w2SZScYTBf3mfzv6rAReM3wrFWdE/f46oFJWz/peVcrF4SP/55Ge5oSw84WnWyxoQTmf72RRFdhk644Y5qIR/hMrofKEP
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 18:18:26.9338
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 503027e0-dc3b-4995-f5ba-08de78881969
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044AA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB8165
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_101832_094101_48542703 
X-CRM114-Status: UNSURE (   7.79  )
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

The Wave5 VPU supports connecting to on-chip SRAM through its secondary
AXI interface. This allows temporal buffers to be stored on a per-stream
basis, reducing DDR memory traffic.

Signed-off-by: Brandon Brnich <b-brnich@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
index 7b1ba34ab719..27061918e463 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
@@ -717,6 +717,7 @@ vpu: video-codec@4210000 {
 		interrupts = <GIC_SPI 182 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&k3_clks 179 2>;
 		power-domains = <&k3_pds 179 TI_SCI_PD_EXCLUSIVE>;
+		sram = <&main_navss_sram>;
 	};
 
 	main_sdhci0: mmc@4f80000 {
-- 
2.43.0


