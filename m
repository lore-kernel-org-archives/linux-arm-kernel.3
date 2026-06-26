Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E817CDE008
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 09:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xgWWULNPtHvEx5i2APr1omOveuBTn//Dy3qZn9uU80U=; b=eaWJr4bV3Zw78+jz1Nw1wyzA6D
	ugTMIlfe4ussOfJIReoaJNxEPpj+wwb8b14NbEb3PHK8xp+nISwEBRL0V+LBLxEMRnOfR0cvNaVos
	DLyhIls8SoVOPsiaCSgYXUxOda/vTErGYVcytdCAK9lMw1hwpBIoHuhH2t+o9v2dnYUV50TpidXOv
	2u8LaEk6FKxMzbmEjRfuh36v1VzfofGgfZZS+9w7WR5O5UNyzXvf3LFJDj/BDBUl6+CqOIJjAi+Nv
	WdcsY7fQkeyT00F3eh/XUXHTDcizzb8ak3L0lxq/2645JFKpqn6wmc4GH86DNXpJFrk5l2PJCZS+o
	4pcUiK2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd2jk-0000000AxdQ-2Qo3;
	Fri, 26 Jun 2026 09:20:36 +0000
Received: from mail-japanwestazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c406::3] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd2jh-0000000Axd3-2WiX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 09:20:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XfQKQJAX9CdAdcFS+y+3qjZ9R3pSvca0oChnaFr54FJzZ154/fUFZYQ8RswYlKZ/vwpKPR3rhuFE2NDvMLt966zczbtK03AS7+Zxewi3wTXg4H6rpNVYb9sX5j3GPLskUrZnyk+puFlosCX4ljyAdpL1ElTw54i78cv8UJTwIRi3DbPFWmG5/RGBvVdwMJAynLmwJwovbcG7dRdQ+Oqt6zptPvRvM/UQ2ZiQX4mkLPLEuEoo0aSmigpl1iZXLRIcMBjFt3msQOXuzhom8NM4aG7IZ6H5x3+la2ix9MCdr4JrCgXJEhdzeUFfy4yAKrXJJxwvVMPIyY/cpAQ48/epKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xgWWULNPtHvEx5i2APr1omOveuBTn//Dy3qZn9uU80U=;
 b=j4+hJSS8KOHe1vEJcSzJaJ5h66fmZaVlmm7KKAV2fOZI+kvlR7pTLR8rwNuz3mRDI8BBFvIvqMMvUq7agn19N5YXOVPu/GJ6VoIut13TfJrCRgrMxSzRmCClr0WlflvwvFgGrcPRgfi1T1CenXjt2LLZeAmuV2kXWmlozf1dbjmBYkI/Ldzns7J5GXaw1HszLj3OQXJdJhrkCJjdKAK0TflRT7R298N6cvqicT9jjQJEuU/codD8QfluvbR21bpKcxeb8+lcinC6EX6a8aAR5ZGLKGqN/H7hhBZPNCeer7nBdV99q44kMqQKEr4Lt1ksYl66oonRPjrUt2gO+7qysA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arndb.de smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TYCP286CA0346.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:7c::14)
 by TYZPR06MB7037.apcprd06.prod.outlook.com (2603:1096:405:45::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.14; Fri, 26 Jun
 2026 09:20:17 +0000
Received: from TY2PEPF0000AB87.apcprd03.prod.outlook.com
 (2603:1096:405:7c:cafe::37) by TYCP286CA0346.outlook.office365.com
 (2603:1096:405:7c::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.17 via Frontend Transport; Fri,
 26 Jun 2026 09:20:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB87.mail.protection.outlook.com (10.167.253.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 26 Jun 2026 09:20:16 +0000
Received: from gary-System-Product-Name (unknown [172.16.64.196])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id CFAC040920E3;
	Fri, 26 Jun 2026 17:20:15 +0800 (CST)
From: Gary Yang <gary.yang@cixtech.com>
To: arnd@arndb.de
Cc: fugang.duan@cixtech.com,
	linux-arm-kernel@lists.infradead.org,
	cix-kernel-upstream@cixtech.com,
	Gary Yang <gary.yang@cixtech.com>
Subject: [PATCH] MAINTAINERS: Update maintainer and git tree for CIX SoC
Date: Fri, 26 Jun 2026 17:20:15 +0800
Message-ID: <20260626092015.1709904-1-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB87:EE_|TYZPR06MB7037:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 05dfca66-26dc-4b98-ce6a-08ded36422f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|36860700016|376014|1800799024|82310400026|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: H5V7K5p6FaIbyGNTekUVVGaHD5h6Uxa0aMlDb3nppvrFw0gPIMjMalrVP+B0xUM1Oz03yDulHJZSG3ZlywTMoNgCihyg/lYF5SV2/MwKs4nsV8WmlUJXAM5HP7ZrG32+Eh5Vi7iobZLxsFeqau+aYxqi5vntQUFvJIOTsiU1ZTh1286ksKufbDTCc3sohpQjlNol3U99t+37dUeTKR8txsSrBUcUIQAcATRh5yhARt0FY0riBJjiUqV4MJpE5FSzAmjd/7vyIIXrzegFB2FyySgGKSnJFB8nlgZ6S1NPN6KgTjm4BrlqIK4z1olqj3jNX9XfD614E8miDvZ/uR/7rS8Er6kHvazhlBg9p9D0eFN/+RaP3JXagJw/QjivETkZaNZjPhFjU3UVyqw+edP0qq8bXheSwweFMY0i8NJrbqT+fEXFTENX5zTbfI7mTy2aHZBA6ie920691p+YBcMmO8KeWIXmEu7NfajAQ4nkBq7cLruzPgQ7oFEBjlXsORN5SQ9VllLodkyWBIr0A4uaiZhftXw/8oNdpbpZZg3EREW7F5NEx6hp9yL9yKfIwWEUcC/Lz89VD3qdwWjEjwVjz+9Kyc5ZXGop1M6TugXKMSLFH8AFfAGfMxBBiH+2YxDj/zPn9n7lnPfSPeIRRcB5Vm/hVLhEGMy6DtOzVxTTjtY2RZW+Ku18e8BzrvZRolMtVR1HFMfHcOU1XwGdABQbMA==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(1800799024)(82310400026)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 3oIYa48er9zyUtSOV2bKvaGLXccpR/zoN0rJHcVHgFKYs3lUlh8MTXNSZxybuH7g/qWH7azbGtbwDt9wxez5DKYQrp5L7oSc129CG9GzCG3QlveY9ArDn7LTQ3C7rAhfhIvwH7t3IPseEaV1hy4vJFZj6UFJf4AXmBQsfepVOChCpucnqCBihD/k7sCfYAqYjMFdUnJ0Euq46yBx7YESlRYofKkaNp6aWlCmPme0iH175XruXoh/lXVPINqu8FdwIaP60mudOyArI1I436aut3hP8lhOvvQ+V+S+LvAcUrDmdZuM1OfZvMTIOV+vESclJNvDNsi9PU+TciYMJtnUoW9ubAgMFlmKzXcTRU2/75K+1vyWQ5EEx1jlE9iG3k0iuamtWMtS6M0mhzxH8PsxWpUUHn5uL4V8LF1MsCJvL3t1+0P/GI1hUdhi2Etn8sha
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 09:20:16.7323
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 05dfca66-26dc-4b98-ce6a-08ded36422f3
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF0000AB87.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB7037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_022033_648669_CAB11C3E 
X-CRM114-Status: UNSURE (   8.86  )
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

Peter Chen has left CIX Technology. Take over maintenance of the CIX SoC
and Update the git tree URL accordingly.

Signed-off-by: Gary Yang <gary.yang@cixtech.com>
Reviewed-by: Fugang Duan <fugang.duan@cixtech.com>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2fb1c75afd16..17b3704bbcde 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2692,12 +2692,12 @@ F:	arch/arm/mach-ep93xx/
 F:	drivers/iio/adc/ep93xx_adc.c
 
 ARM/CIX SOC SUPPORT
-M:	Peter Chen <peter.chen@cixtech.com>
+M:	Gary Yang <gary.yang@cixtech.com>
 M:	Fugang Duan <fugang.duan@cixtech.com>
 R:	CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/cix.git
+T:	git https://github.com/cixtech/linux-mainline.git
 F:	Documentation/devicetree/bindings/arm/cix.yaml
 F:	Documentation/devicetree/bindings/mailbox/cix,sky1-mbox.yaml
 F:	arch/arm64/boot/dts/cix/
-- 
2.50.1


