Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2576106B523
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 12:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2bRiNRtgnqkJ67Mg8EIBLs82K4MpTNnw8rA5LlF5OMQ=; b=f7uR5vzq7jcBEyXEazidZ5EdE5
	50TdoqWkethGrHfZvLPUBXujbuOpn/a6+bhQsEnpfoG0bP2TgN8i0JO39/zM/V9TxthapP+5gRG1T
	a4yk6aQbEUqNGvMX1rTu2pHuptC5uCj22cNizljPISDLcF7RSb9A000payLUIyDfhwcg9lXnCbj5R
	kCaU5159fqZowxjicJJ4cuwhYZxr18L190Ap52/1SmrTe3hUuFCTMj+pTsclwej6Xzy3RxL+W4Ajx
	+P9dKgI/n7bomNVCLabfj8rsGGtzBoW87bZXWguZFMN3igWRPhrRLUVgFyzQnTx5bhZ7GDAka+AXo
	Q/zyohSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5NUJ-00000003Nhp-2Umb;
	Wed, 25 Mar 2026 12:37:31 +0000
Received: from mail-northcentralusazon11012021.outbound.protection.outlook.com ([40.107.200.21] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5NUH-00000003Ng5-1AZU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 12:37:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zq9kO5hqWBV2U5GmrWhclVEtV6HU7BSiezn1GcRJ0A0JEdBORQvr66U0YN4gjLbgW2u/cUgFxz7EbqA9McnWBcTDgEOpx3foCU/u1ryeRpIOgdJxtVMyTScUe7HWkIt1QiW6gTZ0+KQihSLMayTykBT3B9nDV8joq5Hwa9rwQdL/QXsBjDlQwQbTb0dw0qXFYdz5V+neG5idGAqezZH7sJNge1bSjoHSl1dadHJcqvlXiNy9ISYSEq6tyMyuZzdoA1BPw1dLWJckEE9Jo/gUOKPaSctzSq1lKTr2rKLuOSqRkbzS0dOCX8mom1k8ZJlTsycNFpgN8oAvpUkpKQw/Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2bRiNRtgnqkJ67Mg8EIBLs82K4MpTNnw8rA5LlF5OMQ=;
 b=drQDILtpHc7HondGBkr3TZMyH7srV6KjQMNQDZ2U0h0H2EdMZjoK50++3Bgc02hhkvEFmbppr3jm7ICqU2Wa2VJOIE+p+qQPLGNVQJV7YvyWHBh2BHnNNxfHFwb3m/0ZV9wdaKN3S4Qh9aUeEUgobxxft/Ptyp9NH+VER+Grwqb4sdGtWp1AaC3qkfur7+xAB+tlpX/8SePRz3lxb3xkSzMjQZBIegPbvVeu3QUFOqfAD7p9JPppc+i4nqfv5uuGlCCGAc4ej1uNNJzZYA+NNTSn+E/oQZJdIqhcFso7nWAh94NjyvveMq8PKi0p9YMaZXNHUykgOjuq8eqFF28y8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2bRiNRtgnqkJ67Mg8EIBLs82K4MpTNnw8rA5LlF5OMQ=;
 b=Fp7WMDUJW+9MVtFI54fpBpP8Q6A0N1eA3gDUeeEHFH42qCOl1o3lia0YeE6wf1GS8Kr5kp+2Dd4r5/2EHIZUG+2K3KbC5YV/3qPJUm3j8ic5/PoGriLRG0Lq88ymKFV/nb3Cob8wpPsQWa8+vJ121CfRH5ZF3vNJWbr9xtwJtMc=
Received: from PH8P223CA0030.NAMP223.PROD.OUTLOOK.COM (2603:10b6:510:2db::26)
 by SA2PR10MB4475.namprd10.prod.outlook.com (2603:10b6:806:118::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.20; Wed, 25 Mar
 2026 12:37:23 +0000
Received: from SA2PEPF000015CA.namprd03.prod.outlook.com
 (2603:10b6:510:2db:cafe::89) by PH8P223CA0030.outlook.office365.com
 (2603:10b6:510:2db::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.32 via Frontend Transport; Wed,
 25 Mar 2026 12:37:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SA2PEPF000015CA.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Wed, 25 Mar 2026 12:37:21 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Mar
 2026 07:37:14 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Mar
 2026 07:37:13 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 25 Mar 2026 07:37:13 -0500
Received: from toolbox.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.73.74])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62PCakEZ270453;
	Wed, 25 Mar 2026 07:37:08 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <Frank.Li@kernel.org>,
	<andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <nm@ti.com>, <ssantosh@kernel.org>,
	<horms@kernel.org>, <c-vankar@ti.com>, <mwalle@kernel.org>
CC: <dmaengine@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<danishanwar@ti.com>, <srk@ti.com>, <s-vadapalli@ti.com>
Subject: [RFC PATCH 4/6] net: ethernet: ti: am65-cpsw-nuss: Do not set buf_type for SKB fragments
Date: Wed, 25 Mar 2026 18:08:40 +0530
Message-ID: <20260325123850.638748-5-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260325123850.638748-1-s-vadapalli@ti.com>
References: <20260325123850.638748-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CA:EE_|SA2PR10MB4475:EE_
X-MS-Office365-Filtering-Correlation-Id: cb9c62b2-9204-4ead-6ec4-08de8a6b429e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|376014|7416014|1800799024|921020|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: zjyukiHjf72O5BY0I1mFKqDRG7ucqt3HxvYS0JHvCOveMD36rlyjM+H/02JgtsHQjVPA17Sauw/abzTJDD01xQHzsVZth4Z2b2Cnmzxx+UmftR6z9Mvu/UEjKByOUfhRDWqf5qB1XehBWpaX7Rdwo4+u2+1efihy/KcKNkj68tR3ZluCz/NRfkC4abWheyuRARmtrMDZFEm0Mqfd3COH5P+N0THiLlDpmrQYgwGNav9fnLWPHWcREV1lMKwQUL+flbgvJfKY+6K933lGPo8iG1aHVXfl/V7JmvZhD1Al3t5wr8z1nWt2QNyknPxA7FHWROrtQ0Y5djJBsubebWsn4DdMyYF8dXerQcyR/5+8gGbU418UOoAiw/wUJrSHKvcPSaO4epFCSty/sYCIOJWgcRba9umY6B+Z+gh+UFv0VHyBh31tRdkthor8ZVkejs0nUceq6pQyMXf551wL8HcVywapdcKHm/W5UJwV3tPZ9N7pMIRKKaDwe/N8iJCzk0Umo+/Ci3FulRS2jKWpZoV0xUeQMjW4ehcJB6syDNfgQOip0+uMRkVp691SWOIaOyHsrjfPdJ2B++mlC+LDR5zst+xscwGQ5RiyQBqblanHGWU98y2ebVIusfAZRdPmlr5SsPPXBRNxCUHHHJoEhtXvTbc/rSyu2oyHZfLv7N3EJJTFmtGCYsYSwePpexdNfs7C8StLrbQNj/CuRpCO1ACNQXaWIFx4F8zMtO4NI/FK0tWwUpYzvf8CcJQtdE7bavf/PgZVllWW/GzGjgM3dzdM4DVmwZ2wD6i7UycKuF7CPnT6pjAEg6y9nuQXlx/3gqu6
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(7416014)(1800799024)(921020)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: hgq0etyJ6qn9Sp++C+F9TIsel5Ks+73BBvijN3OtHA1duWNuna8oKZr7Xc1TMQDNMnvXkpwuz0PhHvbMgKohb0kb37xs0imvqhGAce/DlcuUG4UfiVySaMDKRbPoSXJeCtTYyLtgQ+YsrXv+oP9hASMEUrPWu5gq7Ix02RfjCmh7T4qT7NtR8VevNy2BjgzLzVMRsckpf0mZ+b7kZ4GuDGqqGWrCH8rYV+xmhPWL0vVsMOXVvOpTiWthXKSKulapxnlT4AwuuM+3h0HX9iuyaG51vOG9mTYPrQYrV9idWXnSymcS8XP4HKmuD08a+C3UJhigs/MVCgCjY58VqJijNGyYzJq3JL9dU09dn1fEdf7Svl9h7u84pO3NNqUVX4yHqrqJbKomA7755HNE6fdMEaWwxrqXGvVjwAiSMYzwZ7yjCrNgazwlOvELvMDpKn0z
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 12:37:21.6273
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb9c62b2-9204-4ead-6ec4-08de8a6b429e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015CA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4475
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_053729_319297_E143047D 
X-CRM114-Status: UNSURE (   9.61  )
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

There are two kinds of descriptors:
1. Host Packet Descriptor
2. Host Buffer Descriptor

Unfragmented SKBs are always associated with a single Host Packet
Descriptor. Fragmented SKBs on the other hand have the Start-of-Packet
SKB associated with a single Host Packet Descriptor and the remaining
fragments are associated with a Host Buffer Descriptor. A single Host
Packet Descriptor is linked to a chain of Host Buffer Descriptors for
fragmented SKBs with as many Host Buffer Descriptors as the number of
SKB fragments.

Since packet completion handling only uses the buffer type of the Host
Packet Descriptor, setting the buffer type of the linked Host Buffer
Descriptors is an unnecessary operation which wastes CPU cycles per SKB
fragment.

Hence, do not set buffer type for SKB fragments.

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---
 drivers/net/ethernet/ti/am65-cpsw-nuss.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/net/ethernet/ti/am65-cpsw-nuss.c b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
index d9400599e80a..6df6cb52d952 100644
--- a/drivers/net/ethernet/ti/am65-cpsw-nuss.c
+++ b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
@@ -1678,9 +1678,6 @@ static netdev_tx_t am65_cpsw_nuss_ndo_slave_xmit(struct sk_buff *skb,
 			goto busy_free_descs;
 		}
 
-		am65_cpsw_nuss_set_buf_type(tx_chn, next_desc,
-					    AM65_CPSW_TX_BUF_TYPE_SKB);
-
 		buf_dma = skb_frag_dma_map(tx_chn->dma_dev, frag, 0, frag_size,
 					   DMA_TO_DEVICE);
 		if (unlikely(dma_mapping_error(tx_chn->dma_dev, buf_dma))) {
-- 
2.51.1


