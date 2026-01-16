Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D29ACD4A616
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 09:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YvOLKgBt0iIkqmp00gos0etEo79aDgCs4FvkScVEjIQ=; b=GwIYJCHwdRRytTArPxwTzWZ88T
	Zj3O/0yGDV4gZC2M2ViYoVYUVqF+iu4km6GU+cBjYh+JX1cmvKfOFBHX2GtvAtIcOPUmB14tjlI8a
	ybzDRrSNv5WMyyyukvBxRAqZtbKNTQcTujoin+5vPGYl8PccWSi20GQWWGq0I3/p7L96lTXhWgYbZ
	+QMj9WynxZc8ylotZtT0FvS92/javB2tFUDUfPqTf+QwqRMSdWYTpkiqUt05VNgMtze7h70qpcQgN
	XMt+yGAcTqYNCBL+5uJxkNO0K/5yYLbRfiSsKqvqGZXuqgQdG4hJ2o2ldB6m/0ed66XKUzLaUO2kC
	X9hEkxAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgfxH-0000000Dq94-3ntW;
	Fri, 16 Jan 2026 09:17:19 +0000
Received: from mail-francesouthazon11011031.outbound.protection.outlook.com ([40.107.130.31] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgfxF-0000000Dq79-2xvu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 09:17:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZgxF8mCbhxYbpU70uz4deUQLVqygjwuAuwemO8oi03J/6IQfeUJDtIkZ//7fr2qnuqslrsk7Wr/BHtFJXiuMjDD/FfOZjMCDJ84hSGyMCTyqojjfXy446hyTXDbljNFGT6jLv24UfHYK/gvfRfm+TLzBolUwgIBo/0VFJWfhomVNMQ/ve0db/8wFQrXQLj0a3VgDflUTh+kXBHswzdAYTbjrSzcooT57s4zbqrTN8PDzxhTyucER72yAJoItLc0nVMoHOItVp9Ke3Gul554vsiyYMP7jB+Nj1YOeGfVGa9Ztvn7Xn85sau1TKk+pqIdmhUUVtEVyFepp91eLtuzIuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YvOLKgBt0iIkqmp00gos0etEo79aDgCs4FvkScVEjIQ=;
 b=wR+WTvUTEj+jMU5zItpo09s91PXqAXvTgTtp3NgSRyUAAuHdGTF2Pr4Kj29tzDJXriYOYLGbWW11i+8Qr5A8tTQuN2km65y2RUwW/ijH9rI3gGMdK9tBkIVMU5X2moiWtwj8KYSPtHU0vWwpn1wzSpfOvwykCHySqkfIbwjzBvre8o3z0uXuJusUueSO0OEFMrgS+BXxpqCaMVnSupnqTrgRxF5mIrd1XfGiHK6UEeIybiMUBxTm0yHvfVd6oHf9+K5PhL212KWJSXOuLp1H/mM4Yl/5KkgZ6O6UJJmjemXqSmx7zWg+30jhizoMfPyDt3ANZS/bnv2Gd6VxJexOWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=leica-geosystems.com.cn; dmarc=pass (p=reject sp=reject
 pct=100) action=none header.from=leica-geosystems.com.cn; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=leica-geosystems.com.cn; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YvOLKgBt0iIkqmp00gos0etEo79aDgCs4FvkScVEjIQ=;
 b=1Dz9CtEiPvUXqH/Je0XMKHcVPKLPO5pO6rQXa6TjsLtr5XznKwbHn85+OUBO/LyvMou/5mpPBkK++JJ0EZTn7Rc5aPvXPZyGK9ybXBmbdDOQn2tkr0YcABBLfjIme8cH/MKhU5fH/v6qK3ZUPji5p4OFj7UPV+dDxLC4foHW5uY=
Received: from CWLP265CA0536.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:18d::18)
 by AMBPR06MB10820.eurprd06.prod.outlook.com (2603:10a6:20b:727::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Fri, 16 Jan
 2026 09:17:08 +0000
Received: from AMS0EPF0000019B.eurprd05.prod.outlook.com
 (2603:10a6:400:18d:cafe::64) by CWLP265CA0536.outlook.office365.com
 (2603:10a6:400:18d::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.8 via Frontend Transport; Fri,
 16 Jan 2026 09:17:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.99)
 smtp.mailfrom=leica-geosystems.com.cn; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com.cn;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com.cn
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 AMS0EPF0000019B.mail.protection.outlook.com (10.167.16.247) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 09:17:06 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.61.228.61]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Fri, 16 Jan 2026 10:17:06 +0100
From: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
To: o.rempel@pengutronix.de,
	kernel@pengutronix.de,
	andi.shyti@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: bsp-development.geo@leica-geosystems.com,
	LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
Subject: [PATCH V2 0/2] i2c: imx: Fix block read handling for invalid length
Date: Fri, 16 Jan 2026 09:17:02 +0000
Message-ID: <20260116091704.3399142-1-Qing-wu.Li@leica-geosystems.com.cn>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 16 Jan 2026 09:17:06.0386 (UTC) FILETIME=[E260FB20:01DC86C8]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF0000019B:EE_|AMBPR06MB10820:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b7b193ec-1e76-4d5b-19d1-08de54e0050b
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8gzP3yh/k2HWpKgrJrxHzb5yycm1bwcKjXGTK1xZcu1Oq7nQRZ28o5c2n0Hz?=
 =?us-ascii?Q?KZXbbrFI8/Md/rU4bcM9vnkYHHUMGEywv4ul4ZmOi33T6BnIlAZYmHmt2R9+?=
 =?us-ascii?Q?uAjMta3w2rlKT/fOi3NqeYdf0911D78+Byotrlndis/NgJJ0pb0CjyBAzkE0?=
 =?us-ascii?Q?fLrJVzugWN8LrKvBk+nSiaj4PtlAYOB/iSlKzyOhb3Xj3uB5tBPGMYYTbo/L?=
 =?us-ascii?Q?X1NZf/CtUwyg1hlBLykaLZNKLNaskpcxsBGk5mGPbga//8Uzb1KF1AHa0J41?=
 =?us-ascii?Q?729eWp2P3sGxfD9/0nei/sK3sz7VnQqLaV0kFe6EU+u3xJt08PW+qU2jg4VR?=
 =?us-ascii?Q?a5EiBPQA1RdSYqF8986L4xurQICsL9kvXwzTT3j1cYaFAzuBTjyC1lRZwqRO?=
 =?us-ascii?Q?J73XjQNb0lwYAcyJXhQhWprBqeVetiXQdrKdtE7vjCRMSmoLmTSgVKd0XJ7d?=
 =?us-ascii?Q?gCAfAp8f9rsu/uxUEtSQtQ7p15vU3yP7QsR69RscXVBb99lbsZFbKV069KIA?=
 =?us-ascii?Q?Hd9dfcOU9k5GTHbQ94fgVJMkOtE8G5pQZhlFlnFCDUlTktpWbcgipdGRz/jN?=
 =?us-ascii?Q?FQzRPJ7W5Lkk/jGxboyRTc3RmOqeWIhvD2ZZgcOSXnTEv/dml4/cbSamQ5Pq?=
 =?us-ascii?Q?z22NzwZTvEbk6MMiKqtI/ujb0C9rw4XXd1wRM5a7qG21ENW09AOCVlhaQG8Y?=
 =?us-ascii?Q?btkpgjZNp5tpOXBFgtdfHB+32M6IdnxtvieVzSTQ6hkhyxiGhMR8D/ro+hXW?=
 =?us-ascii?Q?4FwodebkLLODPqKoBOKJMofpttVPYb+yymu+/EPs4l+9gvE2fK6swJa8lHON?=
 =?us-ascii?Q?0jnEMNjxETQwzh4WQCeHTC9GYXA8FcdNz+Een/1vDa/udkHC62PATQselMEN?=
 =?us-ascii?Q?oXetWDC4+kabbn+qVRvJ/S9a3jt7LC2gB5UsPNFI5qWH1yCqe7I6Qah3GrhD?=
 =?us-ascii?Q?zsit6xA7XILiH/KTT7SyGu/h7JYat+pSTr42Vtn1rXR2lgZabio4u4FjCrMD?=
 =?us-ascii?Q?33i/K8Q49v2CdPxUo7OOST+w+fRWqsrBxcdt7T2RPKmt8460mUdYifjV8E3c?=
 =?us-ascii?Q?DB8IN15vQNoLREvUKFqqjXkkwyAxx+oozJHujh8fBVSEb+fJBIU/nPaXB93f?=
 =?us-ascii?Q?fFiRMMm+h8nnXNswnx2dKHvpo2DVKnSMUdwxdDWsPd6KgygyfLTlpUm70KuS?=
 =?us-ascii?Q?HwslxNrownNXHehug8Bl2ia38HGTjE/eLpgZpcVnlvZVI3BngQ5/acecLJTm?=
 =?us-ascii?Q?tyXyTzYUWZa95C1AuNc0jg+NPv/Qb8+3uveMPYvgRAD9gje2I7cryXdv3/UH?=
 =?us-ascii?Q?EUL2H6Z+OxAJs/q98jz+kYXKcx+QfFlWSNa5yhrx3M4VfrHXMO7G3R24qL4S?=
 =?us-ascii?Q?qtPJwQIJLg4eSHMMXaIyHj9AFyvYC7la15x/JVkkUvAtpBU1w/Lo5m2hw49W?=
 =?us-ascii?Q?YOIoS63r1TdFlOfSOBFAuaM19gCnrZQzb6fQTc2K47dYxs1VrjIoaOXVPPDs?=
 =?us-ascii?Q?O99mRft7fytBhtXFX89T306Nz9dDrw9KOC2KVbc8gvePdc1IrWDZv8jNLsks?=
 =?us-ascii?Q?UIc9F17sUZxBayiCGj3tdNm2bNRnlN+FPm2VwlLxSLb6dVJNMJ0M6vV/gMNA?=
 =?us-ascii?Q?A8NbpIwdk+cgDBE+Bs9oFJoQsnPs8GKksiglojW3wEPDgx4kF85hkcyUugZs?=
 =?us-ascii?Q?vQp7O7t7KQfeloDuoFFZQSKGVXI=3D?=
X-Forefront-Antispam-Report: CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com.cn
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 09:17:06.6837
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7b193ec-1e76-4d5b-19d1-08de54e0050b
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF0000019B.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR06MB10820
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_011717_746870_0B7BEC06 
X-CRM114-Status: UNSURE (   8.21  )
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

This series fixes a crash and bus lockup when SMBus block read operations
encounter invalid length values (zero or greater than I2C_SMBUS_BLOCK_MAX).

Both patches have been tested on i.MX 8M Plus with continuous block read
operations from battery and keyboard devices sharing the same I2C bus.

Changes in v2:
  - Split into two patches for clearer separation of concerns
  - Add detailed comments with reference manual citations
  - Implement abort handling in a dedicated ISR state and handler function
  - Remove modifications to i2c_imx_stop() to avoid affecting normal stop

LI Qingwu (2):
  i2c: imx: preserve error state in block data length handler
  i2c: imx: add abort path for invalid block length

 drivers/i2c/busses/i2c-imx.c | 58 ++++++++++++++++++++++++++++++++++--
 1 file changed, 55 insertions(+), 3 deletions(-)

-- 
2.43.0


