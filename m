Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D240CE9A03E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 09:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M0C5xRyFmz+YuyDnaPaNMUoe+8HjyjZ8MeXmwElbHFk=; b=pynn8dneUCZQDfPMXjU0TJJbvk
	0T8Gk6QxlOXXLP0QUJbRMcuTwOx3xIuOjUgZrJ/AQA2m1MnV+kBweypMrUPjA948sQd4AhQYT7Mcm
	p3ETZTCZtEEMyihAoSXwnzF5tDGDo2ruHtjS9SAforIc2Pg3pbRl13f9m2Dcfp9GMEgso0IMyOhss
	xrJCo9MfaGJa+T/2q5qmGiBsRReCT3+Mbo2DIiccIEKK7ioJwfcOfh4Xd9OLI+Nw2L/uurCDDa7zx
	osscGpqK3PfECeQGP2kRG8a+fubqSLlnaqlMP7jnYQybwiRBZNPI4Jj+Q3G5BpK3vwo3P/1hEB4+P
	O7z9GNnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vseGd-00000009b3s-1jjK;
	Wed, 18 Feb 2026 09:54:47 +0000
Received: from mail-southcentralusazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c10d::3] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vseGO-00000009aol-1aOi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 09:54:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h1IpYZohIgnByLyMiMwlAMz0Oz/SjfprxPUz5WeqyWAxzknW2kkKUk3+H6+YUW3+0Ue0PjceOdpOzjBEcLsV16epV+a34sXEvNby8biQgOpEe0J+cvPohaEFGn3LO58kPXdayHhUnH6RFVc/nLnu66BJMQG64x5CfAt+93+CPnCwESrwzQusL8HpxJigDzjZkLLd8L8BKb37r+Cl4Lg80515v7O4XaZAf8PzOVFbN4KR9PgLqmJRMBwyLXA+lw5oBwn+37dwmEhXCvAq+mwf0CB72VfJX49XEqvQUKNULoL8XnWwW2UMxaPEHb4hj3uCSWLK3bvFmCC78wBKVouEAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M0C5xRyFmz+YuyDnaPaNMUoe+8HjyjZ8MeXmwElbHFk=;
 b=BdI80qdwC10HR86SdLpCMynyA5t2cMeGHClYsS8tFV0atEef7b0AcYiUtO4ujUPycvVpzm/N3dZGAZOHEjdRb1Onsr3p7AL4Kv2S2ZF0ARkeA/VjhTa8ZbQH5Gp4Tsh/Z2g36PhM4wd+nv/DC+vHxANQPEkbvl3iXzCugoxgbiXkBMhw7OcItNa9ltfMSD5Ta7OEnaEszuiZH8zJ2aXjXCL7IPEW92s3LBqVbmyHJ0bEyMyiyC79IhYb0wC5X2+m1qy6ktkdzySLjItDenvzk3HgaJ/XF6yRGZvrPNh16L6vV3OBrGyWdt/qUFsBJUpy3Xqo8pNcnjVVXhhz+fH1qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M0C5xRyFmz+YuyDnaPaNMUoe+8HjyjZ8MeXmwElbHFk=;
 b=tYIH84qP92P7Xj8q+NDDSk7UGc9rOA15eBr7fqrJolhcHEUCc7ZsHYLqvyiXIlCBqkynTPVJRMsO18onWQ53Iecn7DGb8FvoEc2LeMT6lKABuvtX5O/mHyAZXg97xfAX9yA8bCRK3zI9V6bGpUJuitkrs4YbxF9EqUoDnJt49Hk=
Received: from PH1PEPF00013317.namprd07.prod.outlook.com (2603:10b6:518:1::7)
 by SJ1PR10MB5930.namprd10.prod.outlook.com (2603:10b6:a03:48b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Wed, 18 Feb
 2026 09:54:26 +0000
Received: from CY4PEPF0000FCC0.namprd03.prod.outlook.com
 (2a01:111:f403:f910::1) by PH1PEPF00013317.outlook.office365.com
 (2603:1036:903:47::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.13 via Frontend Transport; Wed,
 18 Feb 2026 09:54:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY4PEPF0000FCC0.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 18 Feb 2026 09:54:26 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Feb
 2026 03:54:22 -0600
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Feb
 2026 03:54:22 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 18 Feb 2026 03:54:22 -0600
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [172.24.233.239])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61I9qpIP200561;
	Wed, 18 Feb 2026 03:54:18 -0600
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
	<ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
	<Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v5 18/18] dmaengine: ti: k3-udma: Validate resource ID and fix logging in reservation
Date: Wed, 18 Feb 2026 15:22:43 +0530
Message-ID: <20260218095243.2832115-19-s-adivi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260218095243.2832115-1-s-adivi@ti.com>
References: <20260218095243.2832115-1-s-adivi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC0:EE_|SJ1PR10MB5930:EE_
X-MS-Office365-Filtering-Correlation-Id: ad66abcc-b576-4923-7b56-08de6ed3b389
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2zrrmjwvGGCtey5xH2/vIIyz9d6feBQckFuhyD9UINhfXBIHxl1aab2cvQvj?=
 =?us-ascii?Q?xdRqP8xU8vBnSEL1LkevkFHduQeafaosDKJDAO8qp4nheLMFW2V3hv3F7guG?=
 =?us-ascii?Q?9G0MebCQWsThWVnTVNUlf3GtKMGy0FbvcThh+4qucsP88kCbtwEvQJYQf32E?=
 =?us-ascii?Q?LCpjUQAQDSLmUtBnVas6VwfLsxx4FkXvhr4zFUMvax6NvBGGoGYL3ETjsaAR?=
 =?us-ascii?Q?e97GaPtAJyok2t09oqmfXgXq9CJ5Y9tKOpKvP9Fu1mT5K8WzLZ/ER8xo9s4t?=
 =?us-ascii?Q?rlyn5hJ3bNfEtkEia0nbUYEsZIJ12MVd+/EBIqeymZsHR9SZB+mi8v1mSPGX?=
 =?us-ascii?Q?ecJOMPb9pGalzoyKDtXucu3OsQpybYJJ1KQN0DT4K8+8FwZcqod3kIjuyqSo?=
 =?us-ascii?Q?WIGZ+/rkV9GFfLJ0etxOl8TAXGDLib5xPKTwgoO6RwAQMcvWaLaFTpUIxNkv?=
 =?us-ascii?Q?zz6jQjL8XsM1hINJefVlpuR5ciR/wknJB0/lzxfqxV7Nv5aD+BzYXIZ/2+UO?=
 =?us-ascii?Q?0QuWGi7H/f+1jL3oeU66bOQbPwgnR9II5D7aZzR+B/Tjf3QBdtWW2I4XB+uj?=
 =?us-ascii?Q?RRSRO5FrxYcLSU/pl0EDI+BbORPUvDLVLR1Du2inp31KeAq4jzH6qNGSG9u4?=
 =?us-ascii?Q?LOat0wMDih8F25YKjQxu+c9CgiwwxLgE6fjfDMs5gMe7lTlkfiiNItcSJ2bY?=
 =?us-ascii?Q?E5gQlKPmJcaFHcUnDom5/VEOyGiu8xCITSAfk//Kv7tU0aQ2VfGoM0Yd2Muh?=
 =?us-ascii?Q?VE3QjwXpq9o/BGt+bMqqsqzs6THue+65iblXzEzLnMasoTnOWiHIDnKXUG2+?=
 =?us-ascii?Q?/FkkkBM9eHaPN3B1QC3cO+gZJyk7otT7/U9niDD3N03i8Ty63sAPTJYKiXxb?=
 =?us-ascii?Q?8yg4eBrtfInnCmSE9wghV/xxZ3/b7DWeoiKlRsfY9fqVHCyaoSZQv9cxtujE?=
 =?us-ascii?Q?PiqZ63ns0fGsJM3Wmrtyp6FJoPTAQXojxU+hU7arYSgs1a8z8y/k4EwUW6nz?=
 =?us-ascii?Q?q0SjTEq0uWfswe3v/F5mennAlCrrmiEzTxEty7bRloBRa4GTuC5iMRv4uHsC?=
 =?us-ascii?Q?kveXnaf+XQ6oRefLiRYd703GOK3XJ0bRf0w3N0h5XvRY/GXjawpz0eNjcoR1?=
 =?us-ascii?Q?GLOj029Un7gG2+noz5XI+nxMhysuRD0z89yVCZgKe/uzcJ2ruhMKXM2aqDUS?=
 =?us-ascii?Q?OFin1MCBqZHHjb2V80ZSsQoM9ki1iwyJDOWYvMnatHAO0CBxy4SRDvcNKutj?=
 =?us-ascii?Q?Te49UqLgoHNon7jYkO/3tRQYzK1qWMq+rsgyXloVqaoMFXNSWH331eHVPt/B?=
 =?us-ascii?Q?gqD9jmVkBdS5xKSoWYHdXm9AAqEHfxYqPeX6GLsRPjRg9squoaf8FmZ1Dn+i?=
 =?us-ascii?Q?NEEE5q+CJTseVXO0zxNSZXG9bTMPdm80Ox/Goc92+QodDEpo8WKuwuAaQvAI?=
 =?us-ascii?Q?kyAWfOEAC5RIAUwtOlplRVQScsmjxX0YRpYHERrdr5aG04iml6rxMCwkYT9G?=
 =?us-ascii?Q?jpZeEaZqbcRUIVhYG7NPoj3EGN+uXhyImhQ0P/RGfHGeLEL8TamzhrCHXq+i?=
 =?us-ascii?Q?DM28UqKnn1DWpkEoL1HtTOFAsIaVP11qmQ7TtGRhqQIGMVcY9K2VwptprRhh?=
 =?us-ascii?Q?T5dKbcI95SACkJfoD+KWFJ7yod0UZSf/IiCK44SUuKnygEUfshUxxGXkeEyR?=
 =?us-ascii?Q?VcVZs4lnnWGU3+rSGRlskfirdLk=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Y5av+uhCHJ3m99+HJa9jDxRFJT3n/iTBHxvz3ljAOGdp9ct9q7mvTKKm9fXlMB1nxkc26YaDDamJGw+yMeCoYAcLPyfPa8UVNXcAY2FL2Ub4Qyqp8x5IfZm9aRy0t5l55ka/UrIFdYNVUf6mxifOptbYA72OTOdXPRKeOGlyWTz+SQMZ6Ohy4iqblrSKl0A6oTGRh66N7b+6wKq+7nCnzHKjJX6B1XfsWqVG10SrDB5gza0Bw4MTLqIk1ELxLKRpjZRJDvyJso5w18Taji/jInphU5baddsp4S/D0AnjHhErs4vURx3npTrVAOxCOu26Q8jcN72v/6VIT+hOk/1x0MK5oIjO+06wFDwDfwAA9KR973PX6QaLK+vnyNVMFfij85NPJcYn5ErHBJE/6c/+ZFOdUd2jN6dx2f/8+DhjUO2pS8WfdIm37VJgfdQDKUxq
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 09:54:26.1570
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad66abcc-b576-4923-7b56-08de6ed3b389
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR10MB5930
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_015432_442249_CC9B0CDA 
X-CRM114-Status: GOOD (  13.55  )
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

The `__udma_reserve_##res` macro currently lacks a bounds check for
the provided `id`. If a caller passes an ID exceeding the resource
count (`ud->res##_cnt`), `test_bit()` performs an out-of-bounds
memory access on the bitmap.

Additionally, the macro returns `-ENOENT` when a resource is already
in use, which is semantically incorrect. The logging logic is also
broken, printing the literal "res##<id>" instead of the resource
name.

Update the macro to:
1. Validate `id` against `ud->res##_cnt` and return `-EINVAL` if out
   of bounds.
2. Return `-EBUSY` instead of `-ENOENT` when a resource is already
   reserved, correctly reflecting the resource state.
3. Use the stringification operator `#res` to correctly print the
   resource name (e.g., "tchan") in error messages.

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 drivers/dma/ti/k3-udma-common.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/ti/k3-udma-common.c b/drivers/dma/ti/k3-udma-common.c
index 711a35b278762..dac8773d73bf9 100644
--- a/drivers/dma/ti/k3-udma-common.c
+++ b/drivers/dma/ti/k3-udma-common.c
@@ -2010,9 +2010,14 @@ struct udma_##res *__udma_reserve_##res(struct udma_dev *ud,	\
 					       int id)			\
 {									\
 	if (id >= 0) {							\
+		if (id >= ud->res##_cnt) {				\
+			dev_err(ud->dev,				\
+				#res " id %d is out of bounds.\n", id);	\
+			return ERR_PTR(-EINVAL);			\
+		}							\
 		if (test_bit(id, ud->res##_map)) {			\
-			dev_err(ud->dev, "res##%d is in use\n", id);	\
-			return ERR_PTR(-ENOENT);			\
+			dev_err(ud->dev, #res "%d is in use\n", id);	\
+			return ERR_PTR(-EBUSY);			\
 		}							\
 	} else {							\
 		int start;						\
-- 
2.34.1


