Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B6B5CD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 18:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KrCztFuqHlpwy3S6PuBbcoljZZ4T/ymLknAJRlA/cNs=; b=eBD6XZx6TrTl5rXu7jh/+VEtng
	llighk8BNCT7IWGaQKGAlLKJ3esrSx5895JZfQYX5CXo3lPYSutHrI3hEgsb88wmTGK689RPLQ3Zp
	Fd4y+Y+I+0ZWRzzXxo8SZXrmlo97zZcJdUvFzKXBuddOUDsIsVGw0VKFza2aqJ6xUTp5RyHFzdGSC
	lxixy2SV3uy97XT/LDlyNe/CzNtwEDRuXYKMeA3to6pz0SbpF9g2ezVmYvaQcYddJx9Afn5WREylG
	LSNEKisCXJJrBdlkJ+NRjn5uQUbzHs9Me3+/ANil6XLL9ohprcmGpgbwhwNPnniZROuOE7ldKkVyH
	N0dgRZRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXkbR-00000009vFB-1a97;
	Thu, 11 Jun 2026 18:58:09 +0000
Received: from mail-westus3azlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c107::1] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXkbM-00000009vCR-2CVa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 18:58:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AMM71+LPBfbv5h76hGCnge5rW82VmFrsZwKZI6DjRUbSWohJWAXP33ZEjjqFfVzlsLXA0v6O+YpfKUIdMGFzs6NxFUESpdrKdH4xRayZWWJ3lq7qTrSZ0m2YStf+IJJlAw4XWYJC3SK2ZKHoXIllDSI1cwLc8/SZnYzewf1OhZE4r5zn+GT0NfEPWcdJroentdF0KbX2xotz2zG1hbrmBBNrWCJGPn3CrPLPOa3zT6kmOFBOIqmqrf7Gx1Fek2dqjNYFRc+n/wTo3VuypdMX00NYfhNg5fAs6a7MxshtUfGxDSxpPuLxNDprD3ycSC4vEWsc+genby1tWVx5MQ3hzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KrCztFuqHlpwy3S6PuBbcoljZZ4T/ymLknAJRlA/cNs=;
 b=T683PNC+vmg8b22gNsFIa47TBkW3sfS7oa7Kzh5mie0cVIwgOH8iKHJqOWXEJYgvBsLc5X/hrcUkfW0/id0KGiP5Vmk4Pp0a8QJTgaDp/AiO+iFdNc3t0NBZfUm5jXYSFlT8E1ZbInct2cQq23ZPXPfBAt+oqOV8XmMHrPBvrF2zIGn0zKHZiAKXSD7f+bbB1595PyiLiDEBdZ+U6A81jVRfHKSNKsXm2P2sr2Y2nO+VAcks/aBuqaItpzZjB8P12jLKxYVYV3/yq4l7fF88FxOwXN1HuxcApy67cQCfl54veLC1xyax3ey1nD78FnYC7Y6zUgs6lXkvXPkp190uZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=siemens.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KrCztFuqHlpwy3S6PuBbcoljZZ4T/ymLknAJRlA/cNs=;
 b=Aze2u8OnnCELTFijUzdFGRDNZOubgrUIOXWbXoi+KV/HXNChHpKOMqKwpAsY9OmFnpm9du4unqCFD9YCDp4Z11NhIcFykun7uo1yGHxdqbfj+Wz2jp3tIreWHym+rxbtU577/TvEwWNYFwZ4+caiEOqN0nwg+HeTeb6/di5x4cM=
Received: from PH8PR21CA0003.namprd21.prod.outlook.com (2603:10b6:510:2ce::14)
 by CH3PR10MB7529.namprd10.prod.outlook.com (2603:10b6:610:154::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.18; Thu, 11 Jun
 2026 18:57:59 +0000
Received: from CY4PEPF0000E9D1.namprd03.prod.outlook.com
 (2603:10b6:510:2ce:cafe::6f) by PH8PR21CA0003.outlook.office365.com
 (2603:10b6:510:2ce::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.6 via Frontend Transport; Thu, 11
 Jun 2026 18:57:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CY4PEPF0000E9D1.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Thu, 11 Jun 2026 18:57:57 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 11 Jun
 2026 13:57:55 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 11 Jun
 2026 13:57:55 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 11 Jun 2026 13:57:55 -0500
Received: from fllv0122.itg.ti.com (fllv0122.itg.ti.com [10.247.120.72])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65BIvtnu1902373;
	Thu, 11 Jun 2026 13:57:55 -0500
Received: from localhost (ti.dhcp.ti.com [172.24.231.93])
	by fllv0122.itg.ti.com (8.14.7/8.14.7) with ESMTP id 65BIvsXI013184;
	Thu, 11 Jun 2026 13:57:54 -0500
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
Subject: [PATCH net 2/4] net: ti: icssg: Use undirected TX tag for native XDP in HSR offload mode
Date: Fri, 12 Jun 2026 00:27:42 +0530
Message-ID: <20260611185744.2498070-3-m-malladi@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260611185744.2498070-1-m-malladi@ti.com>
References: <20260611185744.2498070-1-m-malladi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D1:EE_|CH3PR10MB7529:EE_
X-MS-Office365-Filtering-Correlation-Id: fbcc1adb-42b7-4d87-4060-08dec7eb5a01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|23010399003|82310400026|36860700016|1800799024|921020|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 2j+P+vJw0NPI/2yRwX2mKUoKbDVExeZlmLz1ekAKbW2aFmkaXm0tZVQTS5OJKxsp3O0Rm9ah0ney4woPlZFt3N7rafO3Bt4iKPy3dFWQn/ZUYQTem++P0hTRobP8HiH/QoxxlnuPNlDq8KTqCtCi2xMxFYWHu2v3GnFluSqtjEf5OMbMUQfNG/zBchKMmyyW/XrIRp6r6ZPwWQrbktlAvTG8ggHKWNoSgqPVVxw3VV0nI0KhDxYLB/TsfNn189prBiBVucW7BOrTXxS5cLO9Q+TLvVlT5946e9NkKVip9N+HCPd5BGZUtjSOBUG7wiIZwGjAH7ly02t7l47zC5x6X/+1iy0hUrCHg3j+w0byl4myr303Ii0hsmpVzA64a9r3Hse0CnaJp1FLZzx4O31ygnZL0mgUZOLbIUG20wo97zMSX08PGz7G66XroPrtYl6zFUpKY42CvIo23Gm3boiufkAuLed29/xfmHjPTtnCWx2DdLgekLoHRMzKxswdwFtuxRiYPMKzNk/mCHtzArutKtimpGyS/xeftuEvv/jLU2hpzbX0uvdDhZvynpv3FRenxcoAFukmrUZCfTE8ALrvs+hdp8aKLobm+/wOp9Ddm74CPr1LnYghBiQjun/Oki8BEnWkcOQZ3+buOLf6iJrc4NbV3d4J60vto7JVdyPWNLA6FIudL87zhjD/um2YMorH61+oEURK8Fk1MuFQR0DHjoFSkR4mbQYBWn9RmnErRHIscHmlfhlCY+YslINyU++o2/hy3CgLleVXj7J/BBZrWg==
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(82310400026)(36860700016)(1800799024)(921020)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: hrqbI2WCFPd3jdjIdhDaBaEfy3TQuHn4vhf//gWF5kL+2HE/PxbX2Ogzr0FNrIez0PGLLIuJxUhWsye7qfUDVPtk6dpg+F3vQlTxEXSvyOBHeb3+TArXmRe0NVnau+yjMWC7uTf7o8zSIVpf16o2EAwQFUGIQ+G0YtbBmZEHXAtYOMh5NJbKixP5N7D+v8IZVmr659uory2VR2CY8Cj5LipLrIjlLMNjGEq9K04zW9csfNYcL3J0wi+puJDFp97sF5JMyJD3BbmpcZQyhOwfVMB9c8cuvWuliHi6IsoD4mkDvq7BIoMONU/og8RihtmSCxt78jEGSz2gUtyHIZGXQCwNUe2PqnXITDhrmjIKcwJUferVXCXeUmASqhEf/4c+toiCLUhkmyuxRx19YiJB1U1VRqQgUONBUXqigynqWVrJBi7OlolubbXNk6GkPjLB
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 18:57:57.4101
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fbcc1adb-42b7-4d87-4060-08dec7eb5a01
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7529
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_115804_581531_D14D3935 
X-CRM114-Status: GOOD (  13.93  )
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

emac_xmit_xdp_frame() always sets the CPPI5 descriptor destination
tag to emac->port_id, which directs the PRU firmware to transmit
the frame on that specific slave port only.  In HSR offload mode
this bypasses the firmware's HSR duplication logic: the frame goes
out on one ring leg and never appears on the other, breaking HSR
redundancy for XDP_TX paths.

icssg_ndo_start_xmit() already handles this correctly: when HSR
offload mode is active and NETIF_F_HW_HSR_DUP is set it substitutes
PRUETH_UNDIRECTED_PKT_DST_TAG (port 0) so the PRU duplicates the
frame to both slave ports.  It also sets PRUETH_UNDIRECTED_PKT_TAG_INS
in epib[1] when NETIF_F_HW_HSR_TAG_INS is set so the PRU inserts the
HSR sequence tag, which XDP_TX frames lack (the tag is stripped by
the PRU on RX before the frame reaches the XDP program).

Apply the same logic in emac_xmit_xdp_frame() so XDP_TX frames in
HSR mode are treated identically to skb TX via hsr0.

Fixes: 62aa3246f462 ("net: ti: icssg-prueth: Add XDP support")
Signed-off-by: Meghana Malladi <m-malladi@ti.com>
---
 drivers/net/ethernet/ti/icssg/icssg_common.c | 21 ++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/ti/icssg/icssg_common.c b/drivers/net/ethernet/ti/icssg/icssg_common.c
index 55a696912811..ede32f266729 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_common.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_common.c
@@ -696,6 +696,7 @@ u32 emac_xmit_xdp_frame(struct prueth_emac *emac,
 	dma_addr_t desc_dma, buf_dma;
 	struct prueth_swdata *swdata;
 	struct page *page;
+	u32 dst_tag_id;
 	u32 *epib;
 	int ret;
 
@@ -737,9 +738,25 @@ u32 emac_xmit_xdp_frame(struct prueth_emac *emac,
 
 	/* set dst tag to indicate internal qid at the firmware which is at
 	 * bit8..bit15. bit0..bit7 indicates port num for directed
-	 * packets in case of switch mode operation
+	 * packets in case of switch mode operation and port num 0
+	 * for undirected packets in case of HSR offload mode.
+	 *
+	 * XDP_TX frames arrive on a slave port with the HSR tag already
+	 * stripped by the PRU firmware.  Like skb TX via hsr0, they must
+	 * be sent as undirected so the PRU duplicates them to both ports
+	 * and re-inserts the HSR sequence tag.
 	 */
-	cppi5_desc_set_tags_ids(&first_desc->hdr, 0, (emac->port_id | (q_idx << 8)));
+	dst_tag_id = emac->port_id | (q_idx << 8);
+
+	if (emac->prueth->is_hsr_offload_mode &&
+	    (ndev->features & NETIF_F_HW_HSR_DUP))
+		dst_tag_id = PRUETH_UNDIRECTED_PKT_DST_TAG;
+
+	if (emac->prueth->is_hsr_offload_mode &&
+	    (ndev->features & NETIF_F_HW_HSR_TAG_INS))
+		epib[1] |= PRUETH_UNDIRECTED_PKT_TAG_INS;
+
+	cppi5_desc_set_tags_ids(&first_desc->hdr, 0, dst_tag_id);
 	k3_udma_glue_tx_dma_to_cppi5_addr(tx_chn->tx_chn, &buf_dma);
 	cppi5_hdesc_attach_buf(first_desc, buf_dma, xdpf->len, buf_dma, xdpf->len);
 	swdata = cppi5_hdesc_get_swdata(first_desc);
-- 
2.43.0


