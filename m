Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D426FC61CE7
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 03:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zCs9a5p5Td23Mt561yilMwolyjDmNJQXYXB86a3+F0g=; b=mkX1yq0L3mAWsiiuCfc+8xuYM6
	hVArlEaAuUWSbkTit9fZnMPkeUWltBvyS2uK+ESSafQxhMwnl5kviI4bwssqHKo7AvGNGwLVGy0tM
	j7FdcXw5j0A8llNCyzl0dJAeZ73C55vXQkXWhmL2j9149Ok8073CmYhnte1EAUdzEe2Zp2gCOc3Ze
	nUWorFynx9YhKprzOOdScnUA7fK1Q5NreASC4nuKtR6alFj/ekBVpaI+AsT0kvbaZGjcmrFUH2vvE
	GeJXpoQxpv88jwqhxdoU70YsLsPBRDvkk3JUNagIMkcFLgjtzsf8uIOlDf14mhHG65s0X+YQdosQK
	5W3x0sFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOT6k-00000003L2L-2Ugr;
	Mon, 09 Jun 2025 03:23:34 +0000
Received: from mail-japanwestazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c406::3] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOT05-00000003KCu-11Ez
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 03:16:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lKpihub5trKoZxoyghF5iYA/4szc3PEU2kC17OqwJeA0Z7OVGIMzNtHiLQ/O8QWRwgQ+pHKIUMxROjn3YHfzk93zgLQfyI9tTgV2GYicaWMWxgnRLHHTre04N0CKfP8oKbt+RwohI9kPricxOlWCkF8yetjWpSkoPFk2seituPoFjGYUSSKhygE4/tS2SInICiajFichgS6JL+limOVYJwExGpZ1IkmtNLpaMm99FTIscmNWDiPW6Xem1PeZvKPxldwT/rh4CAwK2QMCTU9hDy8l1chZtakqV1eWTUc26my0NaIsCmNMU0RGf1D3peB9293uxeZh1yXcaQv/FRwOGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zCs9a5p5Td23Mt561yilMwolyjDmNJQXYXB86a3+F0g=;
 b=E+V445mL4e7ekgKRf+xDdc2fbsL+gimtwKLje8XfzIH/DKvnr7HE4xoSRN0wyMCCEeA0ePuebvgCY0iA8Wjgd2DhJC07CoXHe02gNxzrdXdQKFlr4EGgmojHioc9Texl0+no4iMDWb3Bm4lF+aA66mDbVFAz8vWA7hT5xRQ4nSwJEcIeBmGF734Dj56sDsj7TbY3s3xDaE5n+btDVMy/EmfAOkUKp3QxgA2WU3RzYsJwD/YBdEDFgLulmLLbEZZ7vdQ1ZQZ4dmZ52FHG/6x9roJxBk6KVXJyH8pNifFsuJfq2se3z2hdkRfbHnuNHDmc0sGX/dvxI1wz/8bFAYFIDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TYBP286CA0025.JPNP286.PROD.OUTLOOK.COM (2603:1096:404:10a::13)
 by SI6PR06MB7165.apcprd06.prod.outlook.com (2603:1096:4:252::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.27; Mon, 9 Jun
 2025 03:16:30 +0000
Received: from OSA0EPF000000CA.apcprd02.prod.outlook.com
 (2603:1096:404:10a:cafe::71) by TYBP286CA0025.outlook.office365.com
 (2603:1096:404:10a::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Mon,
 9 Jun 2025 03:16:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CA.mail.protection.outlook.com (10.167.240.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.15 via Frontend Transport; Mon, 9 Jun 2025 03:16:28 +0000
Received: from localhost.localdomain (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 068824160CAC;
	Mon,  9 Jun 2025 11:16:28 +0800 (CST)
From: Peter Chen <peter.chen@cixtech.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	jassisinghbrar@gmail.com
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	maz@kernel.org,
	sudeep.holla@arm.com,
	kajetan.puchalski@arm.com,
	eballetb@redhat.com,
	Peter Chen <peter.chen@cixtech.com>,
	Fugang Duan <fugang.duan@cixtech.com>
Subject: [PATCH v9 9/9] MAINTAINERS: Add CIX SoC maintainer entry
Date: Mon,  9 Jun 2025 11:16:27 +0800
Message-Id: <20250609031627.1605851-10-peter.chen@cixtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250609031627.1605851-1-peter.chen@cixtech.com>
References: <20250609031627.1605851-1-peter.chen@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CA:EE_|SI6PR06MB7165:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f9f0f801-f79e-4895-48e2-08dda70406bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lhBDJ+9LGSQrZtKFkam6Ovrl62Y43LIAdJWNjBWqxY/IOyON4ylqm63J3a1E?=
 =?us-ascii?Q?gtXpu/9l6z8PynAR3HLUuXyr9uKawXXsfFZxE1l7CLe3p2aPSkUzsUvjDvde?=
 =?us-ascii?Q?CqKxhYuRACzH+OraHpRAW1HrEE9XxKPYzTXkUT+yMy7Q5gQ95qz4pJLgEBmN?=
 =?us-ascii?Q?TdrFhSvJTjAKtXckY193FTlsxiaw4fvD6sWuc432bWPJaCcD0iazybtex/YF?=
 =?us-ascii?Q?67v0xlYwNiD9Kv4CY6JfR4TvRRInrqkz0XpDLiOBwBWcojOWBfR00Uj5Az5r?=
 =?us-ascii?Q?UI+Ohxlt4jRjANf7XyZJCmou5BWO+PPvc2Btynj3HK5UIDAaD/4o8zAdUzFU?=
 =?us-ascii?Q?j61JfjadDSFGCCj1QUPDueSW1AjpWapy4ySPtNIXxHEiIrVqXqny0Sk5ex1y?=
 =?us-ascii?Q?kEngtLOCxiaw3TZpP/Jv7b9ZQ64V0A4pLxVy1/lYInFfu8bHAZD7F/4CDk/q?=
 =?us-ascii?Q?4lwr8X20QMVhb+SvCD/HZDogJ+jI5z9Ev5evTJUUQWFT8Wk/Dcw1YcsT13Pq?=
 =?us-ascii?Q?IWqatfHGewJyQJufzs1rzyzJ+EuOr+0d6v3R0I+dwPPbX7LNNaQyBFaAe3Lo?=
 =?us-ascii?Q?qpCdoAeXSejkei4atUWf0rsy+JUqiwc3VOuVDkolcLy6ESl03mV7xvykIQkk?=
 =?us-ascii?Q?sRGQc44PHOJZJxxD1vRhveKivPj2XWEBHFHtZac5fhaOXJn1YgnpvCNey7fG?=
 =?us-ascii?Q?9aB8LBNWYg9KNRsV8nf1ZqkDy+3BAq+gBEDPZaQ1DJ51+8sBRHlWhTf8vCC8?=
 =?us-ascii?Q?+daqrmlRWY3Nwn6G/1RoC3u+xf2Skj9mgo7fR6J81ntU7ZALGBtg9hpfQySa?=
 =?us-ascii?Q?OavNAV0UJ52+vp9BSvakEUMeLfjMOrReiWsaW+QCjzPW4lcZPMjqTKV4PQRR?=
 =?us-ascii?Q?+HexZVWoDDyTjxPQKQt9/RAK3hMSTK3QFidvGBjFUFCySTPs9ToPcwijOq5J?=
 =?us-ascii?Q?pitkdfqf2fjxHDGJRKtxdUpFL/GEdJdWHM92wjvHj5B03NpejlpkjaOlXCGy?=
 =?us-ascii?Q?/L9+Ih/sl9sSANb3PfyoZiED0GesrxJ0stmW4gXrjFHwDtTyPUbIHjnvdvE/?=
 =?us-ascii?Q?dkSVWgaDl0viObeDh3aOXi8Gdd0CfQSYO/JDS9KPMs1rnaU/YFJB/tun5gHV?=
 =?us-ascii?Q?sEpTL60Ano9plIsox05tB8TN/G5NL/BgaKDYZ2lKeBgZxoxgGcjUzfgg0nE7?=
 =?us-ascii?Q?F5/eR1K9Za6NyQDUOdbZJKsedjWYJre6P/PnokrhfBV98zP5PUu4QMriH/J9?=
 =?us-ascii?Q?NcuyCeiRAKa679kLIuFGttKsAlObtC/EbxVimCJSW6QWpo6h3L6RnEFz1ryG?=
 =?us-ascii?Q?PkqvxZurNc6H4MvoaNRB4a4P9JG5j3wZS07RAbkvW0v5RM9fQQgYeK2POBM9?=
 =?us-ascii?Q?cG97snvOtkEqwp/kdFiJhmicd2PtSjWFfMini6X+2mcnJUSoVPiK3L8DIQe7?=
 =?us-ascii?Q?CQujHbANtERlHv14Pk+8+h5ReG35OQrLo6Jcv/z2SG4+xh/5FQxkMm3fpBx3?=
 =?us-ascii?Q?liE4E9ELx5uSMu16xyiMhmA8GFL6tU28YW0F?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 03:16:28.9294
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9f0f801-f79e-4895-48e2-08dda70406bf
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000CA.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI6PR06MB7165
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250608_201641_278182_56E4C234 
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

Using this entry as the maintainers information for CIX SoCs.

Acked-by: Fugang Duan <fugang.duan@cixtech.com>
Signed-off-by: Peter Chen <peter.chen@cixtech.com>
---
Changes for v9:
- Add mailbox driver information

 MAINTAINERS | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a92290fffa16..7f8bee29bb8f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2473,6 +2473,19 @@ F:	arch/arm/boot/compressed/misc-ep93xx.h
 F:	arch/arm/mach-ep93xx/
 F:	drivers/iio/adc/ep93xx_adc.c
 
+ARM/CIX SOC SUPPORT
+M:	Peter Chen <peter.chen@cixtech.com>
+M:	Fugang Duan <fugang.duan@cixtech.com>
+R:	CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/cix.git
+F:	Documentation/devicetree/bindings/arm/cix.yaml
+F:	Documentation/devicetree/bindings/mailbox/cix,sky1-mbox.yaml
+F:	arch/arm64/boot/dts/cix/
+F:	drivers/mailbox/cix-mailbox.c
+K:	\bcix\b
+
 ARM/CLKDEV SUPPORT
 M:	Russell King <linux@armlinux.org.uk>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-- 
2.25.1


