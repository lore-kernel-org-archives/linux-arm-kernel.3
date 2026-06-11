Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66443CD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 18:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KhzZZTC/Azdw0LeayNLKOL1YNGF32TNCMMwSuy0ukUw=; b=fLB+6d82BPSfJRMucW7Z4DH7PI
	yhvYGTNfytx2QMvt2S3i2V2CGZhjGBphXWGIFgM2bhGulAs0upvEc97g1QrEOmll5KbSH9errfIMV
	BuzXvI3l/ze0blk1+wcVhFEooLwGtYIcIBM3UCU9/JDFMcncOrVu7QnSSqnh7aTUagL1bwKpkkzfe
	A2opzoUp19KrBS0r2KshgrtDPhbT7mKsy/sa5r91fKqJQ5C+4USaCb0noEfTFr3QhDIc+5q5JCyRd
	TXDupDUaO91rg2Rtmpc42hh0QH3wxeAvT4QDeYaTyqnOQCboxlDbuxjp/+f9jfGrkWSniFbY8vhWz
	q81KjkHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXkbW-00000009vIM-31Tt;
	Thu, 11 Jun 2026 18:58:14 +0000
Received: from mail-eastusazon11012004.outbound.protection.outlook.com ([52.101.53.4] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXkbT-00000009vG0-2kef
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 18:58:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B6K4MQwc4AfrHbaSyn1Kqp73rSEKjMjYxaU6z2IOW0EjpNcwqkYQCEnQxEZZeW3KZB47vGu5z4lhLTqMHUY0tiJSHMj8BQnsN97fvhbFDTYNN3QqfYVoyYJ8puRJaaDbsE41YkUAnIMMyDQTDrV9hJmsUDpzhxBrqLXYQI7DCP5+zG5PR00rlna/KSXszNSKc+P9JP6aAm3VL+3yGyqLAqe3ZScZu0BePhqqWqm0SYkkL2bDKCXYjM+kPuGb5v+MgWXeQuQVjlvW5zp/Lh+Th3ujwwkVelh0CBQy6hL+NeSSvmmoZKg9uMbuim1J9U/dKQ7hhDRnWUetJFjYSeFC+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KhzZZTC/Azdw0LeayNLKOL1YNGF32TNCMMwSuy0ukUw=;
 b=wnPZCT/GbD+oE2vDdiL+Izxgh33y4KcZYdUNFwRidapqaAgEttc0muSiIrRb4bx53ZL6p71igN6ofgdMopRLhl5vaX+2p8BP6aR6CNJ4e5vQqylQYdDTB7bAqgY2VJ8yszmppUU/0S5i8h1aOPMtK9mgREEXjevpGn8lND/jU1m6zizJmqgx+zgfIPtqRExHbLBPuyi4/FZc8va1Cbxw2RxEZvJnsBz1VknFuKNIS2Za2BwnLBejMXipbutk3+W5OkWnYOYsPEPSwKTrwID8AQbm0nG5kZ6xhLdaso+e6pMr7EYlv90/tZWwUc/DUYkhHM8RJyDNCMDf7aTuNw9FJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=siemens.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KhzZZTC/Azdw0LeayNLKOL1YNGF32TNCMMwSuy0ukUw=;
 b=C/k3T9DrzUPBKDS6+JZOndvead0en+wmGoqccmz4EMSvZ9hd8NHzfvEK8U8EDBqR7AxxeZHHFC9I3NaD0CXSmArXlz1ZTUstW3cXfo2oBkdMaDJ/j62nYxJIxwIMl4Ou2DxbmJQu6f2LZl1b3w05iy1WuCRl91/Ii3RI/Z8IDfs=
Received: from PH8PR21CA0016.namprd21.prod.outlook.com (2603:10b6:510:2ce::24)
 by SA1PR10MB6293.namprd10.prod.outlook.com (2603:10b6:806:250::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.17; Thu, 11 Jun
 2026 18:58:04 +0000
Received: from CY4PEPF0000E9D1.namprd03.prod.outlook.com
 (2603:10b6:510:2ce:cafe::5f) by PH8PR21CA0016.outlook.office365.com
 (2603:10b6:510:2ce::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.5 via Frontend Transport; Thu, 11
 Jun 2026 18:58:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CY4PEPF0000E9D1.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Thu, 11 Jun 2026 18:58:00 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 11 Jun
 2026 13:57:58 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 11 Jun
 2026 13:57:58 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 11 Jun 2026 13:57:58 -0500
Received: from fllv0122.itg.ti.com (fllv0122.itg.ti.com [10.247.120.72])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65BIvvoA3923985;
	Thu, 11 Jun 2026 13:57:57 -0500
Received: from localhost (ti.dhcp.ti.com [172.24.231.93])
	by fllv0122.itg.ti.com (8.14.7/8.14.7) with ESMTP id 65BIvvMn013190;
	Thu, 11 Jun 2026 13:57:57 -0500
From: Meghana Malladi <m-malladi@ti.com>
To: <diogo.ivo@siemens.com>, <haokexin@gmail.com>,
	<vadim.fedorenko@linux.dev>, <devnexen@gmail.com>, <horms@kernel.org>,
	<jacob.e.keller@intel.com>, <m-malladi@ti.com>, <sdf@fomichev.me>,
	<john.fastabend@gmail.com>, <hawk@kernel.org>, <daniel@iogearbox.net>,
	<ast@kernel.org>, <pabeni@redhat.com>, <kuba@kernel.org>,
	<edumazet@google.com>, <davem@davemloft.net>, <andrew+netdev@lunn.ch>
CC: <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<srk@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Roger Quadros
	<rogerq@kernel.org>, <danishanwar@ti.com>
Subject: [PATCH net 3/4] net: ti: icssg: Use undirected TX tag for XDP zero copy in HSR offload mode
Date: Fri, 12 Jun 2026 00:27:43 +0530
Message-ID: <20260611185744.2498070-4-m-malladi@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260611185744.2498070-1-m-malladi@ti.com>
References: <20260611185744.2498070-1-m-malladi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D1:EE_|SA1PR10MB6293:EE_
X-MS-Office365-Filtering-Correlation-Id: b96d5fc9-add7-4c29-9112-08dec7eb5c2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|7416014|1800799024|36860700016|376014|23010399003|22082099003|18002099003|921020|56012099006;
X-Microsoft-Antispam-Message-Info: VWP1FdGHd6iRWpvs8emAdmaeAd6mjKIByfxb2FfJoNzxafHWaQFJbYIkddeqgdsTy+S8p8hojtvKT7WNs1luO6m5TIhEvIaH9i3s6d9SZ320o5aa0vcjirIFT07aUx6jtuy9tO0oSBMjotDrP+Zw6qWkeZ0kO+WhtTOpzhpbkLjZedCtOIsafcDuhmTJY4uJ9ldBMu0K8EICCj6B3K/NRJkNNKePXX9uPvWwHg8sBHCGOJuestTZGLvSaLMzLbTim3Ci1uUlC3+ZFtRtp6VpvOONiFfUquWHtMl5qRVFOF2SpvETnYH8bUBFdwPesLrDy2xVfSBLXWG0GPbFAasvdlWsedfhmN1GfMFs57Bigm9mZhVbaaRNfwl4DsudZuSJWpd6j2xzwY7jqTY9ZuleEIPzpNpSYLnisluqYh7K28jjvPvCH5LkNP7LzuO8aZ9dGnReDKHUNv6iVM00TN4hagDYhvjoGlOqXJkheaoU+S5dhV0fB56LoblXuN0r42TWXJPamhqFYuxkPfbcyIDS4Oq+qr0mxTmAgvfXffD+4qOe3VssXxiOS5iZPxKOTXjyS0Q+XjalKQWDLZAocFGOGovK+S1O2r/AxRNK8LRc86VXSj21zxxejWlNjgQ1NQbYPvpWIDbkcdW25OnPuz2xl6sHuB2JYBUkn1c3xzh8ETL3184PM4bkxnnyn45axUfQPJoKqkdb5VdivVlvM+xc1mIKZ5thz/Ct0PiHvRuKNC8jcNilnkzhnLbYrdXw3A18SPq7mIWW02t+YtOIYX2XZQ==
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(1800799024)(36860700016)(376014)(23010399003)(22082099003)(18002099003)(921020)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 2ZMkYmlb0SyWW2k4Nn3dSquX/sMPckwQ9yYvHJWEgHU+bHyKD0yozyRcjBc8xMnsz09GPLv7Et/hVtv7An8CtXsFlFwLXGoWLe/a229fMmzwvYi248O4+GoxAEatwWaIPec9+3R37xm14Gwin0hD6gqGNkU4FO7NXWeCvKl/tJj5dp4S4LidxXWPZ35gkhNhVWSxFGECicxlgENGT6DVv2fBqg7aw/dBnLRWCV12UI0yq0HeCyNSS1bj6yo4wMNV0K4t+rD94HTHtIRJ9DVJQ2DwzDU+JHtdeHDW4jsgQJw3ihGmYp69/NzSoU2zdAjIhMRtDd8IYupV2EM/quUmwaUvGYfQMiDJgZZnUCZUyYlF+/dbwnVjD3FDwJGncWTsjASF2zMcS703geX3JLPZjylX9VyQjoD884k68ZXbPdU3SW6BI8eWw3rfooiecq++
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 18:58:00.9928
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b96d5fc9-add7-4c29-9112-08dec7eb5c2a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6293
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_115811_704716_83707EE9 
X-CRM114-Status: GOOD (  13.05  )
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

emac_xsk_xmit_zc() has the same issue as the fixed emac_xmit_xdp_frame():
it always sets the CPPI5 descriptor destination tag to emac->port_id,
which directs the PRU firmware to transmit on only one slave port in HSR
mode, breaking redundancy.

Apply the same fix: in HSR offload mode when NETIF_F_HW_HSR_DUP is set,
use PRUETH_UNDIRECTED_PKT_DST_TAG (port 0) so the PRU duplicates frames
to both ports. Also set PRUETH_UNDIRECTED_PKT_TAG_INS when
NETIF_F_HW_HSR_TAG_INS is set so the PRU re-inserts the HSR sequence tag
that was stripped by the PRU on RX before the XDP program saw the frame.

This ensures XSK XDP_TX frames in HSR mode are treated identically to
skb TX via hsr0.

Fixes: 8756ef2eb078 ("net: ti: icssg-prueth: Add AF_XDP zero copy for TX")
Signed-off-by: Meghana Malladi <m-malladi@ti.com>
---
 drivers/net/ethernet/ti/icssg/icssg_common.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/ti/icssg/icssg_common.c b/drivers/net/ethernet/ti/icssg/icssg_common.c
index ede32f266729..82ddef9c17d5 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_common.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_common.c
@@ -105,6 +105,7 @@ static int emac_xsk_xmit_zc(struct prueth_emac *emac,
 	struct xdp_desc xdp_desc;
 	int num_tx = 0, pkt_len;
 	int descs_avail, ret;
+	u32 dst_tag_id;
 	u32 *epib;
 	int i;
 
@@ -137,9 +138,17 @@ static int emac_xsk_xmit_zc(struct prueth_emac *emac,
 		epib[0] = 0;
 		epib[1] = 0;
 		cppi5_hdesc_set_pktlen(host_desc, pkt_len);
-		cppi5_desc_set_tags_ids(&host_desc->hdr, 0,
-					(emac->port_id | (q_idx << 8)));
+		dst_tag_id = emac->port_id | (q_idx << 8);
+
+		if (emac->prueth->is_hsr_offload_mode &&
+		    (ndev->features & NETIF_F_HW_HSR_DUP))
+			dst_tag_id = PRUETH_UNDIRECTED_PKT_DST_TAG;
+
+		if (emac->prueth->is_hsr_offload_mode &&
+		    (ndev->features & NETIF_F_HW_HSR_TAG_INS))
+			epib[1] |= PRUETH_UNDIRECTED_PKT_TAG_INS;
 
+		cppi5_desc_set_tags_ids(&host_desc->hdr, 0, dst_tag_id);
 		k3_udma_glue_tx_dma_to_cppi5_addr(tx_chn->tx_chn, &dma_buf);
 		cppi5_hdesc_attach_buf(host_desc, dma_buf, pkt_len, dma_buf,
 				       pkt_len);
-- 
2.43.0


