Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6853BE9B263
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 13:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wH2hOh7xofRBH6dlM/3LSCW277p7AMEVPjJEzivrfa4=; b=vGPn6YT/v0nQR8NB/zAA9w0LBM
	5mYv6ZIpyawqkFpxluMBnTJEzY5sRhSnITJr9FtpkNDFt/dy1VI8LzLvdXaq73rzEQ45E8YsSd4tM
	vR4e84SQ6hjO3N0lOhTFizc8zYI1v7cVo/bUlzN0XjJ7EGLkqCRoFbDVPmCDkZKIkXBfj+5MK5muV
	IRXORulnSBCBeDahNKsWqYR20zygEL7uP/oslq+4GMqywYuQebHD0PXc6g8BfVYmx7xZeM/GGp4CF
	E16/BC5nvcOd+UTF1bFTYaGpFwi9GAeJoTIjkJg74AudN8n3Lr6P19w6w48e7GbfG0uGCdpSYlUL1
	9IECuzqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vustF-00000002AYr-1Bbh;
	Tue, 24 Feb 2026 13:55:53 +0000
Received: from mail-eastus2azon11010003.outbound.protection.outlook.com ([52.101.56.3] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vustD-00000002AYU-1zNB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 13:55:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ot/xcpnGSUdtbt1s1tnjNF6zZVB5RJZfdJ1EXsL846SF07dE48b5S6J6q8wGXw5EOFQVQ4sl+qFM4isvWM5dLvyNUAKcPc6O+1Vx0YVsx1+Kg+zQwTx2xfrrIv2F//EvjxdUMTT8pDryTqMUPx/h5LbFpbtmiEbf8Ik/k0mLwg0rXuCq8lVgOA8D44LiI7Gk22dI8LsaaYL+XCdfhmTSMLCNSnhaMzl1pPRm5YqpUBmcE+AodwE55H2hc5wA/SHkLYPAOLplBfBAEEaRmU8VFenBrjXny2giMeVho519+jGeX3FjictIEpaQWNheieJkZfrx4bKhjYSWAUjCMFhD3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wH2hOh7xofRBH6dlM/3LSCW277p7AMEVPjJEzivrfa4=;
 b=vonzfbzmY8avSY5nPOriwzHUe1WmEWxjundn2XvSFI2gYXrdHezFlaf2u7o6R3MF/CghkbEr11y+GYLElnClS405qXfMdNlTJUyVe1ofk0pw3gFPM1C9NftUQ1LGtE6d8tODZlOz9t7IInp90cbFSNrSsU/tDtanESj05tBw0fKSXqVJY0gcsmk/RvfOOp6rFrGZEAkOgcH7UhyvSatvRlvl65ldP2qhwql8pt4jWITirS+r6lh3RcdzCm1kin9O4WrkbUNi3lEDgCMKnVtjjDWxfplVhVPF777lQhqPXxpsDR3S/BMszDP3iETydxdbutVWNAZR5Je2i/yFNRPozg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=arm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wH2hOh7xofRBH6dlM/3LSCW277p7AMEVPjJEzivrfa4=;
 b=j4J+/y6Q/rQjV2q9pRl5Pt/8UM1o4A0hQywg6cbGySeg3G2/tcLOdYUV57XyNMoEr4Wzw165uXeTCUxKRTJnpvKoW62qmz9rCDqlRwueKSbNP+XsBswkwUIqox1DPc0KvzilpRBUZZP05+9ELxhKn2DVu0qBaYYAbWEUoBSKbGzVpFFhaILNtp1iFHMvJ05QuqLkWu2NXfLl8HTpWi+WIBZzOiLkpziWKa5xk8x1SPAEqQ7woOQXs2R/o6DUMBG0TfobK/pvhU0bFNtboQp0HCvYviaSQOsiWT1odPijBw96gILVE1XOwHCrGGAo2hjTFO6csGQGyM19yJU3pOxbMQ==
Received: from BL0PR02CA0128.namprd02.prod.outlook.com (2603:10b6:208:35::33)
 by CH3PR12MB9172.namprd12.prod.outlook.com (2603:10b6:610:198::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 13:55:43 +0000
Received: from MN1PEPF0000F0E2.namprd04.prod.outlook.com
 (2603:10b6:208:35:cafe::bb) by BL0PR02CA0128.outlook.office365.com
 (2603:10b6:208:35::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 13:55:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MN1PEPF0000F0E2.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 13:55:43 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 05:55:19 -0800
Received: from 82875d6-lcedt.nvidia.com (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Tue, 24 Feb 2026 05:55:18 -0800
From: Nirmoy Das <nirmoyd@nvidia.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Nirmoy Das <nirmoyd@nvidia.com>
Subject: [RFC PATCH] arm64: signal: preserve si_addr for addresses in the VA hole
Date: Tue, 24 Feb 2026 05:55:03 -0800
Message-ID: <20260224135503.3329100-1-nirmoyd@nvidia.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E2:EE_|CH3PR12MB9172:EE_
X-MS-Office365-Filtering-Correlation-Id: 876d5e3d-0c0a-4015-571d-08de73ac6706
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tYfeBiuZhsVYJ/pR0QTD7uQnLDrK9oRnPJZQdj9vWj8muVIFFWZyAGb12b4K?=
 =?us-ascii?Q?rteBRFHIlE5GB576Vojvydh7PtAFfWla2abJVGd1RFkEvB6CwyZ0CcmX/X5W?=
 =?us-ascii?Q?ZMrC0NM573S38eH+kb6N4YkysMz2m8/o02NVutBaJDTUbS+a8l3Y0GjMNeSh?=
 =?us-ascii?Q?jh9vly89EDEd0jKEF3df8HaIrdH8DetGYMzFQDNGf4IAydNCA4Il2pcyJrrc?=
 =?us-ascii?Q?0h0xhnNiYQJZdOzdyybwcwYjtawiQr/+jgc7G6cYfeOGxbh5dc3qqZStZxW3?=
 =?us-ascii?Q?ne5EuVVkd4rP4VYybAPfwXEgjGNu0Q5FaGlrjPP3pgwvhH9PGmKAylZVYyP+?=
 =?us-ascii?Q?lvYJZ+TiOPlr/OFic+5AH0u6Ig5p1h3uK0v+3t7z19AtOOg3z9UAEuUS+AQV?=
 =?us-ascii?Q?Nk0ZYDPWZLwyjH+K/621Gi1ItPPQLhk56DWR9mnTzKKVABy0PW+8uquT8eGa?=
 =?us-ascii?Q?9zOkiZG5FupB51HBl2SGZxURZNSqidsAss87S/C2ZVcTrhpIsgFTR+c04ZTY?=
 =?us-ascii?Q?R1MaUjQIUArMwDeaPNDVJ4C4pE4frYdK7VU/p3xABwiGhZas8y9nhm79kphb?=
 =?us-ascii?Q?EAJbZuq2RMDkWHd29WxXwx+oWwXi1ouYbN+5+cg6gzXYytDWmh7L+7A47mOC?=
 =?us-ascii?Q?UJfVPAFc/nlja+uSrltqjJ0SFsK/MNGmaNK1JfW/CnuEWBapDFhkPUPUqXcJ?=
 =?us-ascii?Q?7ZY1AbGej2cTWX6hR3pB4XeJpKBTdKiFeys55eTPUNiykhzHNa4h0RcTkU+M?=
 =?us-ascii?Q?EkhKByna/UoixVEJycLmjQz/WwPfIj/9m18kOnDaET+2Ccp/hmuXMsogqBPl?=
 =?us-ascii?Q?aScFxImfJsoCvs2OFqPrmvZnDlrC0v1f//X3x8ecrI01j5i5ES4i/V0f1JOM?=
 =?us-ascii?Q?yPUqoWSITR9i5Cx1RU5GxZ9ytUQj2LYvm8V0FmF/FKgtk9L63N+KGTvKB8DS?=
 =?us-ascii?Q?E5QvdH59Yr8WzewPMKLlpaDQ7RHpljEoozYi2pnTmJ6Ot3kioAK+YAKB256B?=
 =?us-ascii?Q?gkCYZvsHphO0URdUuXIcab2fL8heOjM8EujA377BVsvBgJFpe3bcDRj2cwxi?=
 =?us-ascii?Q?lcJTSMJg8cXpB2yEWofOWlADFVTXwHe7bHx3nS6EmQjV3cb/317k2jI9hywq?=
 =?us-ascii?Q?Xw4FkKZQ2GFpycFoDsKPRFiir8BRzY91x6f6+352oLtEaDPzMw/Y/tnAQs4Y?=
 =?us-ascii?Q?c1pI68w10D5QpDjd6K7bOZII+xH3hi5eOIAzwX7mkTPSeWU2xvDyu2Ka3t2p?=
 =?us-ascii?Q?wUI+o/+yHQ6ZlSHo/8tl1gqfoMksN30g7d2YRmYAFdytNYwR0R1qJW9YHSl2?=
 =?us-ascii?Q?9av/eX0TsU40vrQRK/X22IHBAgBSJTHXDq4Fn0DSxn4qZUBDYXaZrdzF8ODb?=
 =?us-ascii?Q?lNAs+3mZrxUsMkT+tcP+vySJLIDJ3SBp97R+DHrQfJIkHui09C8oLVJ34YYH?=
 =?us-ascii?Q?vn5kgTVKY9D78PiUJ2unf/KstR+fhHmctirwT/VT5tQfmWNl8+U0/I7aHdnU?=
 =?us-ascii?Q?pukofrCKO38yCbIw5h379kzpJdtqloCqy9KZQ6kQW3WRFbqcC862xBp8IvfC?=
 =?us-ascii?Q?gvUWta+IIw3UMqqfdrrsSGqhrJTqXBsgyLYFa/sFGnASecVLMZ4pw+tVk0mK?=
 =?us-ascii?Q?Idlv1mBExDasuRGyxJWfgXXUbp7+sxQ8zl/5Y13hx9Q1Eehq9ydGthq4t6x4?=
 =?us-ascii?Q?UToCoA=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: l7CE2qRwOknJbZ8OB7k/EeLFa1BBIpImLm44aztXt0RNSoRhLZnKsP747QRhKuStZ/ncn6g9fZpTW74ARuFpQQv2iNFotLhVH/IfWN7UOpX8PgTY/3PhzdkCIrQ73FwPqfrlOwmke2Xjt/CxSx/m3Vg4cP2HuTc+E1BqdE8g+OLFyNblOaPJfyuS3gaAPsWuhCuvSTl8EG15x/ZhVI7wmIHVuqTG7w0qMQylxiqrfCyvR0Lb0S1FAIifyNpEc5RD1Z2QQUHMFej5auZY/6Xx0arXAIO7WqmgY2nEnMhk4/ezH8Rq0mU++LcFVlpIKAsqq0rDQX8w17w6bPOCP0gqNPptz5vhfXeU+cPWtvCC7Ly5Ilh5gUoEto2KE3UZ4N6c0UybLP+9BPrC0E/rljkadVjVGW/ImoIDxthwq96MwzbYCmZQ82arq1i0WCdaKGfD
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 13:55:43.1354
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 876d5e3d-0c0a-4015-571d-08de73ac6706
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9172
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_055551_514738_D12CCE6C 
X-CRM114-Status: GOOD (  14.12  )
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

When userspace accesses an address in the "hole" between user and kernel
virtual address space, the kernel delivers SIGSEGV with si_addr set to
the faulting address. However, untagged_addr() uses sign_extend64() to
canonicalize the address which corrupts hole addresses making debugging
difficult as userspace cannot see the actual faulting value.

Fix this by only stripping the TBI top-byte for addresses that fall
within the valid user range (below TASK_SIZE) after masking. For hole
addresses, preserve the full original address including any tag bits.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220750
Signed-off-by: Nirmoy Das <nirmoyd@nvidia.com>
---
 arch/arm64/include/asm/signal.h | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/signal.h b/arch/arm64/include/asm/signal.h
index ef449f5f4ba8..ca7ff6e5cd2f 100644
--- a/arch/arm64/include/asm/signal.h
+++ b/arch/arm64/include/asm/signal.h
@@ -3,6 +3,7 @@
 #define __ARM64_ASM_SIGNAL_H
 
 #include <asm/memory.h>
+#include <asm/processor.h>
 #include <uapi/asm/signal.h>
 #include <uapi/asm/siginfo.h>
 
@@ -10,6 +11,8 @@ static inline void __user *arch_untagged_si_addr(void __user *addr,
 						 unsigned long sig,
 						 unsigned long si_code)
 {
+	unsigned long masked;
+
 	/*
 	 * For historical reasons, all bits of the fault address are exposed as
 	 * address bits for watchpoint exceptions. New architectures should
@@ -18,7 +21,16 @@ static inline void __user *arch_untagged_si_addr(void __user *addr,
 	if (sig == SIGTRAP && si_code == TRAP_BRKPT)
 		return addr;
 
-	return untagged_addr(addr);
+	/*
+	 * Strip tag bits only for valid user addresses. For addresses
+	 * in the VA hole, preserve the original value so userspace can
+	 * see the actual faulting address for debugging.
+	 */
+	masked = (unsigned long)addr & ((1UL << 56) - 1);
+	if (masked >= TASK_SIZE)
+		return addr;
+
+	return (void __user *)masked;
 }
 #define arch_untagged_si_addr arch_untagged_si_addr
 
-- 
2.43.0


