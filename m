Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31F4DC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 16:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WzMNlEiyk0F7HIb8StuSJlg9QAJ/eZ0Vd17J6gUc4To=; b=oSFWxQzDZwbZS7DM1nc8JFcotd
	iIs1aH/zFn2IaFF83SG7nCKfX5cnhHFtgWowkRg41os1auz08lqZLYa1mH+ea+24qH8AlRao2FVNJ
	JKxOdBXpZDYVXxrLGk8PMe2Z9YYNVTrkgaaUUTC/eGkXcMk1GfayvTh60BrN4Kx8ApLuLdQYnZVBI
	Zx7E0LRPNfZ0ptTDL/9HZmZNFSExT9erwYkLqQiXEwlpPKZ1q35ahRp7MXvUtMeOh0o4Z0oe6kztP
	3BWbmrx6aMnLULfaV0kdXZziu0An9z/U96lUWwo/OKUtJzTZOBQZNwtNoARjLc2ebHDf+M5XPHaYq
	S1naev1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udtbP-00000000CNz-3x3W;
	Mon, 21 Jul 2025 16:42:59 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udrlW-0000000HZwH-39R0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 14:45:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wV36+I4LqKfgRn3gK+8SlJqqV3181v5t9fY4odZB10pRg6UW733IiCf+TqZWunKJjHQ6ufegMciuyTGysOy8GPxi62OYKQlWbRmhgF8uawR2s+Ntcv2ZWIrelGZ9EMnL+vjtIQjWE9jfKLh59UINf/DUlu6GEERn8k4JNJULh97K7rShXvKECngcUqfIfT1Lvf+KuEZ0IssWbbCApSng+2rk1zXKhEjwqUJJAO9gcjwKsIyBbH9ZeDSgOnDefefp9/iiFcRDjLKx/wRvafNvpqa1UCO5vYKUKvWKMTvGbcvQJSSKoI61dUZtn9B6vQl+Imz9HqihPd3Onr/xJrpAkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WzMNlEiyk0F7HIb8StuSJlg9QAJ/eZ0Vd17J6gUc4To=;
 b=QzbIdRdhMqVu4b0BtaZQ+CTO/NyYZFg6GfWQqn6vhsGoa7M5NgmLAM6OcZp3WZfyUZFahwIXyjqbl7ZDSRzy+5zV+VTQrr8ElZOtHjsCvHv2YXVcu6pn7XSzLs26dFsTnfm5zp4kTRpzT7vmVpb0gT7N0QvbOJUwpD0spdVBPxLKUMcV320Asr/dSUQ8xXyg8aNZTpWb9nrkw/wV5bJk63tFYOJJAqiKc0GkwH/o9XHCzEcfvjpcR4bTGyC1E7IHyTSzX6+WkYoQvj9riyw9DMkUlnOi7OTIsspvXIUb85I7VMZIc04xiKEI8zQrAbUmMm06g7c+Upc3fMtNCtyTkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2PR03CA0085.apcprd03.prod.outlook.com (2603:1096:4:7c::13) by
 PUZPR06MB5953.apcprd06.prod.outlook.com (2603:1096:301:110::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8943.30; Mon, 21 Jul 2025 14:45:08 +0000
Received: from SG1PEPF000082E4.apcprd02.prod.outlook.com
 (2603:1096:4:7c:cafe::85) by SG2PR03CA0085.outlook.office365.com
 (2603:1096:4:7c::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.21 via Frontend Transport; Mon,
 21 Jul 2025 14:45:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E4.mail.protection.outlook.com (10.167.240.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8964.20 via Frontend Transport; Mon, 21 Jul 2025 14:45:07 +0000
Received: from localhost.localdomain (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id E602E4160514;
	Mon, 21 Jul 2025 22:45:00 +0800 (CST)
From: Peter Chen <peter.chen@cixtech.com>
To: soc@lists.linux.dev,
	robh@kernel.org,
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
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Fugang Duan <fugang.duan@cixtech.com>
Subject: [PATCH v11 9/9] MAINTAINERS: Add CIX SoC maintainer entry
Date: Mon, 21 Jul 2025 22:45:00 +0800
Message-Id: <20250721144500.302202-10-peter.chen@cixtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250721144500.302202-1-peter.chen@cixtech.com>
References: <20250721144500.302202-1-peter.chen@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E4:EE_|PUZPR06MB5953:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 43b0fa3f-38ce-4c6a-9ff4-08ddc8653008
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UL+JlH0fdj7AJtZdXjHHO2bmj9KrL5VIW7BByIpkpKLoXRka0Wa3yZcEM2sx?=
 =?us-ascii?Q?EfhXFiY0yMH7/T2Uv+Xdnw9cRQ/zywkGSHiL0HvhsiwXRwOTuOvjZTUcJ/E+?=
 =?us-ascii?Q?J9oOC+iitq1PU09/hV+cbXFb+3aa/XZLBsW89g5qB8eWjw8CFyNDBdANDP7Y?=
 =?us-ascii?Q?1XL6wU49lujrQ22y4og6LCWCUcn3sAfPvqrvNtZdZqAVX4OnD8X8RXwGFK+y?=
 =?us-ascii?Q?hRNfGmjUCxRPsQ4HgWYYjsiDraVCM3/Nso7MEDt0C/eKIdynfHlYoLIgFLce?=
 =?us-ascii?Q?df4BmnTlfhlvc8Sqdv0yrdL2EgXVWN0FgL+ZfRZtWHoaT5g1+h/phvhi6/1Q?=
 =?us-ascii?Q?jUgkJr6pMsp/xHCH7OJuVjQMx7A25rD3qBP1ZWNL8gqN5n0PqWyxFgf2iCb8?=
 =?us-ascii?Q?5nZpgpyOj3L91BDOXtkFsqqm0fD2CWT1Ykv5oBOePZwbq5BLWV6l6ReER1Vu?=
 =?us-ascii?Q?WhY02N4t6KRiQra5ZGCChCc0tYifAY1pxh2G6cQi3Q8FzReKxEynxjczc94b?=
 =?us-ascii?Q?xbgbqxTsUQdBLo1r+wyQdNTTgRGy6oEAHd6lLYMUnASwHfJ43SDtnKZODOSP?=
 =?us-ascii?Q?B5KOJ6hYq7KoWbNQitKPzGOfnCYEvbgMtLsVmNAT3i3ijjubGBO5ZmoJepRi?=
 =?us-ascii?Q?AoeSo9EsZ78KIJdR04DINRtAXCPWpHWjLXyKHUBE1h9dTkLFp0KEvAnF1f+Q?=
 =?us-ascii?Q?zIbiPZ9u74p2tmEaCKTWmnFxlYedTWElPplDp6yZBFIMlxMUZGRBX1g+cO7K?=
 =?us-ascii?Q?OlPdgbz0mzdHFxEA4yDR6dZXdM7iSSXNppRhSt0ZsVF/42zh+Nkv+O4hBO3C?=
 =?us-ascii?Q?wh9EwdBs8RERQRxs/AwAif+drEEicyV3kLqIH/+nx72bDvbQw7f/fytRllPV?=
 =?us-ascii?Q?iBWsiPtzmNT7/HRz4x37s3iSwPL5VkxC8QfqWNUIVyf7HJRPIhKRCARyHSJ0?=
 =?us-ascii?Q?jjPYbMT7mWGOF08skwo5ucTrwjaDubFjW00t2e5wSrkcVHnP4ljHl5ilgr0d?=
 =?us-ascii?Q?Q7ySqXZbEbVI4kmsAKcoA/WuVe1RThYFBCi4C5D5U9aeoX/b3dCgIDqf+VCV?=
 =?us-ascii?Q?tlbp3O3DGCnq7A0Rr1haZT4+iWxCsFOEqG4q70092/HWPtOlFFL4ESXI3KmL?=
 =?us-ascii?Q?rjbxpX9hV4kLUv4hfHqEIr57lWCVCQ9WSesmAEnjwYVQwhow8y40fVwNPggZ?=
 =?us-ascii?Q?3u4+SHvKRY1aWD7capKwq3a+4l+FxdYy4P00GuRTinsABGgvuBQSA8KsiV0c?=
 =?us-ascii?Q?NLSHhAaw+K36MXHJHP30bgVVrPhcILNtaAPHbescjCUEa5Z0KqHFiK7ie4jd?=
 =?us-ascii?Q?DDrO9k6jTiHyLpK3n39tU4fBa1DGJXj6Wmeysmn57U5JfenmWnAfTj4Pm+PX?=
 =?us-ascii?Q?xv7xIfA3dFTsxy86q7yW9uqODCg+g5AI8u6rlB6oTogf8Un8NItl39Jx3Cfk?=
 =?us-ascii?Q?TYobizStrpRs7nY3XjCqIRPkE8jkcWznpkdlqvk0GgTuhEmRYyeIY6xJ4EP8?=
 =?us-ascii?Q?j3EDhCPvIdggPICjoeReClkdSGkUUORLxmBp?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(7416014);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 14:45:07.7806
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43b0fa3f-38ce-4c6a-9ff4-08ddc8653008
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG1PEPF000082E4.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB5953
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_074518_790954_D7A4AF3E 
X-CRM114-Status: UNSURE (   9.57  )
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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Fugang Duan <fugang.duan@cixtech.com>
Signed-off-by: Peter Chen <peter.chen@cixtech.com>
---
Changes for v11:
- Add Krzysztof Kozlowski's Reviewed-by tag.

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


