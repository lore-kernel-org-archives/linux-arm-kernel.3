Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A454CCA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 05:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R/wD7fGhEMx9rE6vx8duYf0Azu16jSKcs/hZKzss28s=; b=kbmdSgUDKlcXLZG1W+CFBRMMEF
	BGiQ5zVyjF4FI9PKoJSgFoKRbknQGChzP6EmLMNC2s0x3BKGMCvgfBfiAtW24JctQ6tNCoevb4Sn1
	7EgsBuqpHeekLwCxz9Ycd+wXi2bo2S+oe9RkCuM2w8yINnz704oAIeZoBjRMYXWOebmcb8Cwcc/ll
	Xvchsij9EMbBldh+y+Jnr3AlKv1lYBdxbmg1P5zmJzirkrL1rWkUwII6HQkALIouXFnyK5Emp/177
	2y2C6GhOuQed0ORpVONgTn0Cbyce/TwwcIehMszCVyatW0ikJpKtwzfRfHG9uKTkckq3QCHWDSsu2
	3DjiBqSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF317-00000005WWc-43q6;
	Fri, 09 Oct 2026 05:19:37 +0000
Received: from mail-koreacentralazon11023097.outbound.protection.outlook.com ([40.107.44.97] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF313-00000005WUj-3bMy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 05:19:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CgcP3iNZ2DLzADQU15O8knSDH0yjymdhebP1Iqf0mPiUHEBpUNKkKAAjCmvRRpwUnMpRCpp1lvdKh7WdUGKnsBljBhUvuvNj0O26eX8zr9iNvmdB7hirYXVoSwjuDbEPyaze/D2i9niwOesUI6tomqWZ14CeBgNJmU9sYY/rtlab+r0KjB0mMaLHZ0kjq2wmwsHCq3AXp3OAOsXcJdAN/1oaPKkBBtDaSQm0OrZMEgSAxknxscYYpqSgesn583XKfYvAdW13DJiFxpYaIElT6aoHJz+Hv4sN81xQ5IKmhuLtbIk0SyiY3lP6jWMw6eZkYEyIveUWoTrlWEgO9YRTuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R/wD7fGhEMx9rE6vx8duYf0Azu16jSKcs/hZKzss28s=;
 b=Z/ZhBJRcZuY+t5qH1J06ul7ZEJyZ9T77ranFg5n2VnZKlsfl7MbS/rnznyvslNVGFL8cpIK7mWMiOx3rNmfqp3Qqn/YyfyYRSyyFTbvWC8htpfx7jq6RdRGRUwAQSnW09U3B3ObdFsm8pi9dTLfdYOncIPZdEG2zZE0gVtGps7aVkoZMqwq14sHnjEd+20hu1si/h6kB8WlCJASIiDo6LVtr4P6pDmv5Wj6uAvDLkLJB4FsZSEi8xsuLqWnzkbPgvfXi584+vqQkwzGgJHCQSCAivonqK9qYWErIrQQB8ZE53HIsVbAHdBLvmY3/hgXVoicWIvSqNBMhvyw1lSYehA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TYWPR01CA0011.jpnprd01.prod.outlook.com (2603:1096:400:a9::16)
 by TYUPR06MB6001.apcprd06.prod.outlook.com (2603:1096:400:351::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 05:19:22 +0000
Received: from TY2PEPF0000AB85.apcprd03.prod.outlook.com
 (2603:1096:400:a9:cafe::65) by TYWPR01CA0011.outlook.office365.com
 (2603:1096:400:a9::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Fri, 9
 Oct 2026 05:19:22 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB85.mail.protection.outlook.com (10.167.253.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Fri, 9 Oct 2026 05:19:21 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 3C7EE40920F3;
	Fri,  9 Oct 2026 13:18:47 +0800 (CST)
From: Jelly Jia <Jelly.Jia@cixtech.com>
To: vkoul@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robin.murphy@arm.com
Cc: devicetree@vger.kernel.org,
	Frank.Li@kernel.org,
	cix-kernel-upstream@cixtech.com,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jelly.Jia@cixtech.com
Subject: [PATCH v2 1/6] dmaengine: arm-dma350: Fix source trigger bit
Date: Fri,  9 Oct 2026 13:18:41 +0800
Message-ID: <20261009051846.1115962-2-Jelly.Jia@cixtech.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009051846.1115962-1-Jelly.Jia@cixtech.com>
References: <20260907033404.596839-1-Jelly.Jia@cixtech.com>
 <20261009051846.1115962-1-Jelly.Jia@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB85:EE_|TYUPR06MB6001:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 79d09d9d-6027-4a48-dec9-08df25c4e096
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|36860700016|7416014|1800799024|23010399003|6133799003|18002099003|22082099003|10067099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: srXVK/OoEu2zApi0rMCDJ0Fn7BGoWi+IsLfjIP4n398djohEyzIxVU9wceK/MUMwITYD7z8pkFgyeQwO5IufjE1WQPc+XMMHitUbsi6q5q2JTUEUzu7lCv+M1HfX+DUpHtlBXDA7OKzPMs5jL3D2v2siD6vbmGtxVusZMoEAaGBGkzuBJZMPVK3/lntVasnfkoeiuwBEWQ+nMZwi4gUAAQhBK9yAUQfXA4Wjqk6aVetg5JRQGPUaPmz0nWrDJlrESG6xRByteFr85G92kMlm/rqgWAHzuRr5QOReIfZnNWq/rIsXdjQS4XGK3Pys/+fK7f/umOyfeDhSEF93rdW1ixxmw5+CaolmSbULDgkcTLZGZLu9hjLjI+2sEG12UDLgBoUVXpvqYde0HQjQDILXnxyat9Ji9UJOfTYoLzh5SxjyZzILko4PXWLUDZcQo8bNrIWuFChqZvWbrjgA8fhtEaO8eTwU4Ii+ugYdiNSKZTcjbsglzLRlEE9lt9h2yiRXksmAl/CBgKXFPb2POxSSwkA5tFB+l/XVOZiWbVuAGZtUNCsyNDCadY04fRdz2DisU8edSeqWBiDa8dlKg1Y3SPtOIVL1FZjanguayHmzq7BNxq4uGA2iIE4xfg9zfNBL054KhPNuL5YsZzRMkkW33dpoqZUh4zWYUbXcaRZX0ksAImo17Pcr7wdrKW6WwHfYEwz6cGjfHSoUuoKpkoLnQA==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(7416014)(1800799024)(23010399003)(6133799003)(18002099003)(22082099003)(10067099003)(4143699003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: dA6zHFf4DW8LMapwjf8XtnAxuTyVMxf8ei2o0g92Jmp38tK+nIhpbCRtSrYMepsg29i5CIdjk++z9SXDy+yNWoFFhCv30KgbZ4MXI/MsMYYECpt1Y8SPDBI5xK6RM9yJT2DAr2/MdJ45Zo+jm4TpNoGZv4jAIykKzaKmg2ccZ0I7BQ/Htqtv2LD4lxHMGBa633FFwwMk9ez1uNgTy2mFRJ4OsA6aJ29EM0CShIvnuJ9Uwu8G9jD36emIDEImzP7yQsd73nWGXjRl1HvOIQY/3bz3Olz8+8YplI/+nv5E3jDbmDoD4Ugk8gWgyaD2hETPpCSmtc6VYWBLTZ5kUGAQT07SHp14I9TFjw3hDKggkDchOvDWgSsLByDh3Op2bJ1E/f4NTGkAQ9FRjYqv056p10W8TcGRRihRumfXv6JThZN3VSV7gBnHKs6fSQ//buTz
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 05:19:21.9081
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79d09d9d-6027-4a48-dec9-08df25c4e096
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF0000AB85.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR06MB6001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_221933_902028_8D480A34 
X-CRM114-Status: GOOD (  10.54  )
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

CH_CTRL_USESRCTRIGIN is the source trigger enable bit in CH_CTRL and
must use bit 25, not bit 26 which is the destination trigger enable bit
(CH_CTRL_USEDESTRIGIN).

The constant has no users yet, but enabling the source trigger input
would silently enable the destination trigger input instead, breaking
any transfer that waits for a peripheral request. Fix it before the
first user arrives.

Fixes: 5d099706449d ("dmaengine: Add Arm DMA-350 driver")
Assisted-by: LLM checkpatch sparse dt_binding_check dtbs_check
Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
---
 drivers/dma/arm-dma350.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/arm-dma350.c b/drivers/dma/arm-dma350.c
index 09403aca8bb0..4e17130de6c8 100644
--- a/drivers/dma/arm-dma350.c
+++ b/drivers/dma/arm-dma350.c
@@ -63,7 +63,7 @@
 
 #define CH_CTRL			0x0c
 #define CH_CTRL_USEDESTRIGIN	BIT(26)
-#define CH_CTRL_USESRCTRIGIN	BIT(26)
+#define CH_CTRL_USESRCTRIGIN	BIT(25)
 #define CH_CTRL_DONETYPE	GENMASK(23, 21)
 #define CH_CTRL_REGRELOADTYPE	GENMASK(20, 18)
 #define CH_CTRL_XTYPE		GENMASK(11, 9)
-- 
2.54.0


