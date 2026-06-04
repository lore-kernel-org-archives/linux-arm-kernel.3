Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA35CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 08:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xWeXD5b3Mu0UToFxdMygz4f9aecflESnL2RYK3Wz5FE=; b=nV9V8m4ZAGOmswla7RXFaWo127
	LSch0O2if34SEtpMolUlGVq+x/MkKa258JGnzbVwLZGoTopbYoAHwSoNvh7173mPSJdmsOwC2+PLu
	6Oj4FA9u4hOFHbjV9Swwer5MXhy7Vrp0Oj2IYgB3t3YebvttwfsuhxL/gH7ILECz1lmV+3wn186aK
	Su0f9Sxx2m49sT9JP1TLsONhP04C8seBSWi2Sz3s4nbm3F3hHy2k47LGuU8ks1McaXwabWjVajHMt
	5eFdAPWxHGLdLUdd/VJN1HdJzKbFVS//qd8gt+APNIGbamxxyuniFz9n9uFRbIf1e9YP3dIE/LN8q
	1zEPQHvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV3TT-0000000GNXW-0KDF;
	Thu, 04 Jun 2026 08:30:47 +0000
Received: from mail-centralusazon11011017.outbound.protection.outlook.com ([52.101.62.17] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV3TQ-0000000GNXB-2nm0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 08:30:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MGKR7G0FFqsMFR2N8jXH34sK9JFQj7CbfsJ6KtVczcOS3ivDsL9C3cPnrn6MEKqliZ27KqY9Hzsny7L4THtve7pg3xccBPDCSxSnGuVQMZXtqu6XCyeXuC7kxl7k2LilwFskwcgGAUrpcWudjrQaLPLTKN1LpYPGPGr0FAfX13ZNuMOwuzRKMc76XZbKYlJx2cryL5hM67cQsDjTU5VmSb/x4AhyvhYYy4KnJUm1IVUMbJ6zE/UmHY2oShP9zFlL3xX1s+lwNS7Vs3cWU/VmHVM5f7plPMNHDBOwjoYltfVb9poqEwxj27rBAY7coz2jOlWRt6eFRo0oPzKC8m03EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xWeXD5b3Mu0UToFxdMygz4f9aecflESnL2RYK3Wz5FE=;
 b=ldUUPRUFHnJ+/KsrboovXcn42AFeHsV1KjgqLTvNXwOq2eeJXDRTA0GHeueJaUrEi1VBYdjBO4LZzin7c02NX/FJ1br1VohCwUdq+Brlxsfs5nGHihxmgAmTINUTTUSRp9PHUbCQulxJ8H5fqvoYXZ7DJrcnJXPqtfT/W0SOMbdiHDMW1hJjF7hFBIpVCObvRitVNtsDYwRgBXQXiskcnfZbscIiNmv5+FAr+jsmYRE+6xFl72j3K7W6gCh/KYVkHUTHJW9vAbi40bhvP0U+B6aMT3S+/0rD0bAbQYKq9urPtXoWSerJbvD2R4exl16AobFFkZkDT8X8eSlBE4XlIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xWeXD5b3Mu0UToFxdMygz4f9aecflESnL2RYK3Wz5FE=;
 b=J6i5bsIAf5+Kwc9TWQNBxc1gPso3FtH27OTH8fAH5yLTjgQvvvFY6WPCTnE1kjva8AThFS/glKrrhRSAeidufDgBDUZua6aggbrG+ia7zjdx2kOhzY2z0PJS/42a4oeo4PO8VYJP3OVQBbXlnmpYb9jd/e2T8PEfYMsMcvxoQ1Q4NcACPvbsKGvVq2M/p9xHNEz1jjvjZ92s4CmbBu3vQX+fsZeXcLQ4MnO6YumcN8LLT8dwnJ5s3Pv+KAwgL0mEX05zn4+ojK/tqzW6+y7Se3RqK0ivdx4/g4BljYuDs0iz45mlpJm3tcX/lPrm4STo8xbljZiN+Pcs7LmRDqoXNg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com (2603:10b6:a03:432::18)
 by PH0PR03MB5941.namprd03.prod.outlook.com (2603:10b6:510:34::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 08:30:39 +0000
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775]) by SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775%6]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 08:30:39 +0000
From: muhammad.nazim.amirul.nazle.asmade@altera.com
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	rmk+kernel@armlinux.org.uk,
	maxime.chevallier@bootlin.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] net: stmmac: xgmac: report L3/L4 filter match count in ethtool stats
Date: Thu,  4 Jun 2026 01:30:37 -0700
Message-ID: <20260604083037.24407-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
X-Mailer: git-send-email 2.43.7
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0368.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::13) To SJ0PR03MB6964.namprd03.prod.outlook.com
 (2603:10b6:a03:432::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6964:EE_|PH0PR03MB5941:EE_
X-MS-Office365-Filtering-Correlation-Id: 1514ebb8-162c-4163-20b1-08dec2138efa
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|18002099003|11063799006|56012099006|55112099003;
X-Microsoft-Antispam-Message-Info: GxObSr+v9xf23qOZWRRJ9yYcpjHgF0oB+VTSFpPV8thIkLHX8ZlOzZPw25kBqMEd75MTSzTZw5AxU7+wpCBxtBX0UlSVTwR/S57rL5X5qZlt1I6p6TwrVLBCWiDUNpy7JoXQaAdX5+RC6M1t1CUpkdGOddoLe+WpNsgVPw7p/b1kH92yynhvGdRvQUR32ehSJAS7V6WX8xRUy430obdB4AflAFhFKeXCVuwWuygkERpKY3aDgDu2XmiCCXEenPEKTdLwasGkzUSA4gVHWS5shvEA8vS50Q05YrVIltwF7h+hGhwK/8Lzhb4z8svtkKoffJsIaO/bg01h7iMVQfV6mVE2zQELw6tYDrTFt7WzQlaCcndqPIiHzL7bcV4JnKJZe8Fd3is0bcF2f3MqeiDdm/xp2V70S+kPFBX8ZSwvyBlQI6OMJyWuGtBYeCdrWJ7VLeV6nos2/HXnVbE2satwldBnrsnvdrUyT0L1ayLkRB4i8qIV8aX5ETks+pJWRUPDQGS/ohyX/WFw3YcGVmc0txK+DNuvHG7sLwEgtEApLfe5iKhMuNqiMTjYVMYr9yhTEkoEO5JR34FoRajfULBDQmrYSs1dFtPGyozX+LHG4BQLM9bF1/IBzUmuPd7sjoY4ih7p/UZKriZrz+hoZOHSYXdNYI9NoXm2W8bklGt/087b/a3YSV3Lv1SEsHlgeJ90
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6964.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(18002099003)(11063799006)(56012099006)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uhrCcq2ZVsvLqyTJr4poH/8tl57SIlz7Boy3pz4uN1CPtd+fXf1ZpQhhzS/x?=
 =?us-ascii?Q?g6fSMzk/HMwk9d9x679nhHAOW0wVyhVS+chcRU7nK6TyysBgpcG2bEUjMBiC?=
 =?us-ascii?Q?yLQbWgMjT/jQi65z3XoDuTaFFJTWggRCOTxoXgd4hbqnGUZatIwGPazypkOj?=
 =?us-ascii?Q?1U5yGV/GVm/nj7UW7MVtvDp6oKEQduuUTnID8t2D1cEeuv2S/MAJ8liGfDrr?=
 =?us-ascii?Q?itOupZtVUuivqIwnqeoEbXHNfvgztSX97K11EJ3OcvONrEistZ0AFjiS1Xfl?=
 =?us-ascii?Q?WX23Y5sZ75HclJBJ3hLF0pF2jcRiIM4cW24HNEurmMujUD0GtnqC8KzJFVXy?=
 =?us-ascii?Q?oRHdBaoqeU4heYUN9zKMzy1qoLGlA7BSNG5iHrGS3kKlQ914y6TEwObbhGFc?=
 =?us-ascii?Q?1VhCsOuOyKf7ls2z12x9/ib7VGMz3FsiBdawISJmv+PpEaaxjDhJRI4qkqg5?=
 =?us-ascii?Q?RQzuBqbuuHBhx+YdjToAK/XHKdzaTjoS6cc01te9aSTAcD5/keT4+J+r6tyY?=
 =?us-ascii?Q?mkvQIMiSu8sGhhQ6FY++SqyyLHWgJsJHJURDJHK+A1ehPS3Idwm+aVyJrIC2?=
 =?us-ascii?Q?9bPITWe2/OQa1W7d3UEaW3DL2HNVnUPXWxsUekDbYB4YirUme/m1dMJgZSU+?=
 =?us-ascii?Q?J31oJ6HYUxgdz/zzzcmFr+5xXzht+A4NEPZD+ZGQJUx79A5KmT3SmLcO/RvT?=
 =?us-ascii?Q?UR+lEac3lD/rit7RFpM1ixNroU8X0MeXYsCR4irCXPAp0dQXeZ+liJno/feJ?=
 =?us-ascii?Q?5xjq82DPKIa/qIhHvySw/vrZ2mUgaSv29r9WfL9dExaoUeS84r2VQSTGHkSy?=
 =?us-ascii?Q?8zbtgnkDYcuRaRmNVuza9zRn0tTJ+ykAPC2t+7kS+U0AmwK6/RErIceAsrEX?=
 =?us-ascii?Q?qW1zkjkHBti4W0sJdMGjCoLc37zTnoW3885VynmXtqUCUrYkdPqtEzI8170g?=
 =?us-ascii?Q?0YaC+kECYuqHFpucfasqhUXJJFE0frXeKwC4bT9Ab7ZnEbPOfrFo4x5u85f9?=
 =?us-ascii?Q?5+EZIg6Y3WPKVhX3clQVFOFiMfzxYtJ2LtNjxQcmMeVij5fNrb3sAN6IlOaZ?=
 =?us-ascii?Q?1TDfI6sUDSzNXsJVkXtY2pUTVuwAgZC8hBKAkaru4uRew7vIUIZpqyLZ5M2M?=
 =?us-ascii?Q?sp573eOT+z/TwXoBc4MtsdHT5g8ATMmdgqJqZbmvy7quKd2+WnvGFpjDQH4o?=
 =?us-ascii?Q?Rbo1eD/CIqHacJreNVMk8WXDiEd2KH0BKzXHUxukAVi6pP2rbnSDxrnMxJxi?=
 =?us-ascii?Q?sy0csUIl26zN/1+z4DMTPXD/2F64DfpyN/UNJrnSsbuuHvU0NGchr0TtjLxp?=
 =?us-ascii?Q?/YaTGb5kL95hRJnFcApiHzmiqF/CHXRVEraSPaZjHHt8yq3hkSff0BIIpqci?=
 =?us-ascii?Q?ULJ9F/mf3xMdaXaXv4fNT0/z9KIb8ZVbWGqZ1m1mtPnvWVFd0WMK1ashyIS0?=
 =?us-ascii?Q?o3CQSll6l0sW93ZzdgSdQMVpg3ZGw7PNX8COD4SBCPUnWGU2Go84CnklgI/A?=
 =?us-ascii?Q?Pcs59fbVbx319LreqSRkpGvpc8ReIanyuF025saVYonMCI5+eJoGEKBzFHuN?=
 =?us-ascii?Q?P68qL2vPVua4j+2QTg0/wAJ81K8e4aQA6n4guoNytNQ5Po0o32TDo8P55SHb?=
 =?us-ascii?Q?GK6O/jjMiViXw79kTEPvEET5HWs/VLOOxqnOrk/K+Ppa8POtU4/RGLsGcP+X?=
 =?us-ascii?Q?rvTxX2rEwB7w7FWoHmQ8OeIyGCUAqtTZyYXlwKVaC0oshC5635s3pohISAhz?=
 =?us-ascii?Q?Jj9XQYcJxm7xiVLpeMyiHHy3fhOdnBxgmLaHHVrYDbtWHx7UaYeKTX3ti+Sz?=
X-MS-Exchange-AntiSpam-MessageData-1: 7zBphShBrn4F6Q==
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1514ebb8-162c-4163-20b1-08dec2138efa
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6964.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 08:30:39.4030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6dcP/MYEnK2H22Cr1JfQLHRPbX4zn66/0TX1BXxADJ6wuVrIY0+0GSEIZckKm4KknoFs6fJ3YvQPTHOxfcTqx6RkZevKBA/2xeU26I4BsfYwbidKZ+n4rqUOJ2mO5y/dLlnQPDm8jILwngvFKqM1vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5941
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_013044_738209_5082702D 
X-CRM114-Status: UNSURE (   9.71  )
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

From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>

Read the L3FM and L4FM bits from the RX descriptor status word (RDES2)
and increment the corresponding ethtool statistics counters. This allows
users to observe L3/L4 filter hit rates via ethtool -S.

Signed-off-by: Rohan G Thomas <rohan.g.thomas@altera.com>
Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h       | 2 ++
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c | 6 ++++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
index 51943705a2b0..95fdf3133208 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
@@ -429,6 +429,8 @@
 #define XGMAC_TDES3_VLTV		BIT(16)
 #define XGMAC_TDES3_VT			GENMASK(15, 0)
 #define XGMAC_TDES3_FL			GENMASK(14, 0)
+#define XGMAC_RDES2_L4FM		BIT(28)
+#define XGMAC_RDES2_L3FM		BIT(27)
 #define XGMAC_RDES2_HL			GENMASK(9, 0)
 #define XGMAC_RDES3_OWN			BIT(31)
 #define XGMAC_RDES3_CTXT		BIT(30)
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
index b5f200a87484..6719ac6e395b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
@@ -27,6 +27,7 @@ static int dwxgmac2_get_rx_status(struct stmmac_extra_stats *x,
 				  struct dma_desc *p)
 {
 	u32 rdes3 = le32_to_cpu(p->des3);
+	u32 rdes2 = le32_to_cpu(p->des2);
 
 	if (unlikely(rdes3 & XGMAC_RDES3_OWN))
 		return dma_own;
@@ -37,6 +38,11 @@ static int dwxgmac2_get_rx_status(struct stmmac_extra_stats *x,
 	if (unlikely((rdes3 & XGMAC_RDES3_ES) && (rdes3 & XGMAC_RDES3_LD)))
 		return discard_frame;
 
+	if (rdes2 & XGMAC_RDES2_L3FM)
+		x->l3_filter_match++;
+	if (rdes2 & XGMAC_RDES2_L4FM)
+		x->l4_filter_match++;
+
 	return good_frame;
 }
 
-- 
2.43.7


