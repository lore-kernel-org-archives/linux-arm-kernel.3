Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CBCEC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 14:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zlUrAIE/gSYEJZY3h51uB7asRBP7fR/tcpNsL+SJA/k=; b=VwAA83C+e2zN/x5QShb0bUn236
	4rSDPFLoER/8CP616+nLOAFTT6SEOcwfYkk3tSO1NEERybdhCBRNAi0UJXR2SM5JVrzmg9ONN2Zzz
	bXG4yNrrVRkjpXLfyReGOMJNzYweSy0vYn0+ypBvyf3hPskFYsIb1dXQbBj6Prgt7JxBYv1P/pidi
	Be6J9cCj2M9ZVCnXMsr/Inx3ui9Fpv5+H/VLFxnKvms7nEhCGCYM0+iINqNMOBqecw5o6kr9A5YVt
	qaqW+9AmAb66cQ/l6K6F1msjTBzNEIkI8Drq7iwKrKPyjnAq8BFMEzM3QmfXSVlM5ZaqOa78OrA92
	lTakQaQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weCfn-0000000EqMa-12BG;
	Mon, 29 Jun 2026 14:09:19 +0000
Received: from mail-southcentralusazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c10d::3] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weCfk-0000000EqLu-0Bsb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 14:09:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lkvCVdGPpkJpsMgqo/tfg7rokEm0LS7h7fxJP2q88GuIydgQoSQshdfJbTX8QRLFAsFxPtLK9uvSl48hJHgzmfbwJYbCQsSNmWqvxdymB223Mh//fffBuF55vKUZweXO+jEdEZnZyB632gjPzhQFZyy3rbsrxjNOZDgU3vuu9ttQXST+P6akev68dIXWcm22yek6CG4fesONEb761fF0krL/hJ0+18YRepNTWMSCdif9fC5t1Fcvmg9s9UOQ6WpLlUoFz7Xs+mmNyc2XuPVObcg0wMX3zMvn30qZbvbHQfFvfp2Y35iKwuzIXxQp6RZjJxhBq2as1ZpGQvPmasHTlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zlUrAIE/gSYEJZY3h51uB7asRBP7fR/tcpNsL+SJA/k=;
 b=MLxD2QWwFvza5Zy0RCYaGsIeRFj9nUgCw7U+vDmmrCaJlDp4hz5v4JIDvH7oflG2QLZPE4NsUeGNOmyFZWi2JnhQnUEdJtGBjqy3Wt1j1cTUOUt0Wrn4o4lk7Os2DOg3QLkxbA3iPg6UawvE7ifc4Spwz61k+6TP/2P2LZ1mhyN5NXY75ShwTHaxG26zNSzieCJ4z33auXLLJ7XT4SBlFvLOmZL1AybsObHwWiCroTBJS0hHk6s3a81y6GTpJhHUEKa+K8w6Mh2ACYI8b39GwkwHYTSyT0bCiaW5NSztD4k1oKqUrfSQqe6xVI+3Ikrje+Q6A+5KBAuPhgxXJcD2vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zlUrAIE/gSYEJZY3h51uB7asRBP7fR/tcpNsL+SJA/k=;
 b=M6ACQlS2avNFBlO38rbBRIq/Lpnq9A9cPlJuxA13tUbJ+20NQ8Mre1R9M+2cvVbOH54zb9EMva87ImYyFjL9w7/0srGUAdP3+AGxsqhT+E9NAZ+ZRsFc3020LvRX3Mt8S4CObDHbG+wRMuU4qyi2bI5VXNz3jOqvxBgAyPvOHVo=
Received: from MW4PR03CA0105.namprd03.prod.outlook.com (2603:10b6:303:b7::20)
 by DS4PR12MB9657.namprd12.prod.outlook.com (2603:10b6:8:27f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 14:09:09 +0000
Received: from CO1PEPF00012E84.namprd03.prod.outlook.com
 (2603:10b6:303:b7:cafe::3) by MW4PR03CA0105.outlook.office365.com
 (2603:10b6:303:b7::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Mon,
 29 Jun 2026 14:09:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF00012E84.mail.protection.outlook.com (10.167.249.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 29 Jun 2026 14:09:08 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 29 Jun
 2026 09:09:03 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 29 Jun
 2026 09:06:22 -0500
Received: from xhdlakshmis40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 29 Jun 2026 09:06:20 -0500
From: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
To: Conall O'Griofa <conall.ogriofa@amd.com>, Jonathan Cameron
	<jic23@kernel.org>, <michal.simek@amd.com>
CC: <linux-iio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Sai Krishna Potthuri
	<sai.krishna.potthuri@amd.com>
Subject: [PATCH v2] MAINTAINERS: Update Xilinx AMS driver maintainers
Date: Mon, 29 Jun 2026 19:36:15 +0530
Message-ID: <20260629140615.213750-1-sai.krishna.potthuri@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E84:EE_|DS4PR12MB9657:EE_
X-MS-Office365-Filtering-Correlation-Id: 85e445e5-ccbb-4268-0dfa-08ded5e7fcdc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|23010399003|376014|36860700016|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: dY2LEBTrJBFjsJ6qzFXQQgUpA420/gk+xV0OYcJ8O/DsTIQpRDWK5Ek83pO839wXOgboRZWI/Iv5StQuKeCZ7l3UMDzp/JF8THNYm7k4wQS3viA0jG1Gleb0WCVWNzZGtmFRydmCYWKSso/xXsbtOVaYsr+JpTU3Q2VGdnptrSHXN0pWcSGErbethkhLjWPA+QIYVhjUaZoduhQ2+mf5ydkKRLtnSK6qve+nysaOBIoJR5Vuz27JwY91CDe16d9oWIxDH+rAG/FPASM/XGbUqoYM1XwEAkiksfpMW6cq8Ype2mGcGEPqyxXORmDwhAHGQLBO9VRvPvvMvjKtYM5cwtbAyr5+IEL5NMAwubDFSuyTHf0BMonhmrSCDOtd0kj8ZV9UwWKv8wxWGvH7Tq0H+51RXsf7w0VKflJhPFz53muDSCtGgY2bp51Ab4gMlOqvNvtDgS+qIfisA+xrUC5yJFkZwNeXubrqglLj8qE9hIuVX+t7HhG4Engn71H8JYxuMOJijn1caT3a785uoYuDo05J+jdrJDTw4VOz+tipNnscGCXSoMSA9bU4zleQprqNb6NazFNZAUHhu4SAGvj1INyEddhk9St0i/VKRb7AJBGklr7PjhPW2cSRzSGWWOfUcXJnDqkAicJqH1UT4HQwyjsiHZL/F2Q92+Ps3O6SlOcny4g9kaT4omqpYHRMz0+lu8gCRs+vKgYH3YVvzSUSrQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(23010399003)(376014)(36860700016)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: RpRGi54n935/AaJT24OHreCusDykdMZEe3R9ek7qMPKvDasBzRF9P9vQ0zQ89jDepCB9kEY+3MZSlBoRpR7wLEDWHBeMxMTJSuiyBezlJDRvrOynop9hDLE16qI4DyIgevfdmjw8j1rrEnXCXnc7wnt4nqa8lPTxhgjtsIxdUAfHv3lsNrT8cNM05GieAGn4WDLp3919CRV7oB7d6mka7BIXKjFGjlqGhA00z9bFW1eqUkMoL6U+Z7aC201PczCDavwU27RfZwmtWQxq56uVBnbxJFDCwmUCWsth0MgFSiuwZYudOvoxbMTph6krxwcj+FxoeAxftIxkWaeSWZh57MiFAWRqNX6l1cNHaYEUh1kH2VOLMjKhKwomfmtzpLl+RQWeEsfPhMfkru6jUJtmlYldv7P5FuHbKm3CYHY/yEXT88M6QJE86NUwsTZhJ/Ay
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 14:09:08.8532
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85e445e5-ccbb-4268-0dfa-08ded5e7fcdc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF00012E84.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9657
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_070916_218837_F16FF896 
X-CRM114-Status: GOOD (  11.22  )
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

Salih Erim is no longer with AMD to maintain the Xilinx AMS driver.
Replace Salih Erim with Sai Krishna Potthuri in the Xilinx AMS driver
MAINTAINERS entry for continued development and maintenance of the driver.

Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
---
v2:
- Replaced Salih Erim with Sai Krishna Potthuri.

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6b4560681b51..d8591066f182 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -29458,7 +29458,7 @@ F:	include/uapi/linux/dqblk_xfs.h
 F:	include/uapi/linux/fsmap.h
 
 XILINX AMS DRIVER
-M:	Salih Erim <salih.erim@amd.com>
+M:	Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
 M:	Conall O'Griofa <conall.ogriofa@amd.com>
 L:	linux-iio@vger.kernel.org
 S:	Maintained
-- 
2.25.1


