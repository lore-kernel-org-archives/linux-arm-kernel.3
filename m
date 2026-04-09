Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 884D1EA3C4E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 12:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JvtVGu3nQsM7HHjn3sCD4exp3RWfafRYBik80pZ8pdk=; b=UX3xsRWyAhhY8vMUH1T9y1tkxp
	rhnlkKbisqAhA1qLqri3c5cRgRQ7KM8ErEEvxt7jfv+Xb6ckWVTZTor31RN7jdzXOFojYgESXkVZV
	zuWo+/fOWAUM4MxH8wWRGBT/kvFrMMJW9VFJpFxjL0mnMBNPB9E4WDqsf/aYpXJPofA5gBHrpPyTI
	M2mfGi4DHEhX7MIrgt6MAEg1aCSbujZHkIXk1XqRwboGvwKUyuuhoTLQQWvHUchCiqtQEm2315zSO
	qqHg8qpJkonTAaV68h16uq/WCVIB8sUL54OTAG6RdWEvomGUrUBuxSpgxo7cSAPhJgDSD+P07re01
	YKcgFbXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAouc-0000000AQ0g-3KOM;
	Thu, 09 Apr 2026 12:55:10 +0000
Received: from mail-southcentralusazlp170130001.outbound.protection.outlook.com ([2a01:111:f403:c10c::1] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAoua-0000000AQ03-2YFO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 12:55:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h4JouXOXgwBgEDfvhz+SUosQxPAG4Tegs5lszXeHs64/AwcKtSzNdJfpAY96G8EPTTVhVmUrhMu3yz5WgK+nxmhMUsbhGZFt5z74RYSgwCYnSw+qvvqcTrEReXWJl5mwbKI453A8KwO3/m4p7a0PVPhzDAMpGkmoMAN0MhTQEgGXXWqsSwOymMMfxRCeJBPCYj5dI3gAC7CHJaYJCyFt5Pnp4EdhoWLEotq2BHZ3GXRbGSfjNzC9kezTHkCFEDnniByS4kUDpnYVvMup+aPf5jrggJiWD+bBz4xxJEoEosMlnpjei7C652XHBzc+UcmoJun5EItzBIb9CkSQdf+Vtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JvtVGu3nQsM7HHjn3sCD4exp3RWfafRYBik80pZ8pdk=;
 b=wDXekjQptDivVHSBXxSoGOWiRcI1WB4VBoEvOrEkcj/jiqVo0W4XhfHgPmocYsW5zQqyOh1KdwG7QMjN8RJnZDxsVTCfI4TZzW38aaTvJFJDJqvzN5QyrKwfnwtfbvPmfpv4Ba0mnvh8NpOpkKTcKg8Fe8Twft0qDiTD5qa42BEbp1/DF+wpCx9Jwnp1xEIjYo+qdj9N9Uhy7aZNLsz6oqtZUO0qkRTO1jWcha0yFxU98AL6rdZYaDYFfGL6A663vcMl8Lcq/amGHFI3cZaYjW+3ZGzHguPdkHwliFSCOH+aVfR1QN5IOsJzTkedRbQn8BrUmSODH9POCnFcsVjPlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JvtVGu3nQsM7HHjn3sCD4exp3RWfafRYBik80pZ8pdk=;
 b=KrBBe+Eec+iPODMH+oqIU4tr2l2pNJamrIHieR3YKRZVjcnu2STo6DAsl/Va5bRsiov3XMdFG9P8KfW+hSi+iT2HCyZsKXPvN1eOT3FUabZluyW6+iJDuSS8Hgd0UskQNIgsy7ejkieHnsMMJYJe7kvVZ+pxKZDHqer+Lzwa3HtBjPObDkVhK//+8VN/KnVG/kSBycJRN744UmqQbdORBpcrkTu3yw0l2UFgU6HytcjJjzKKtGdC4M+ACvpZ3E0XR8Jvrr38qaUOKudpm6OgBHMALAAGr5otpLAl/N2UWmu4/PSlJvEKIIrRCUxd6XAXTnTiJM7Avx7JOxtOYbNBlQ==
Received: from SJ0PR05CA0095.namprd05.prod.outlook.com (2603:10b6:a03:334::10)
 by PH0PR22MB3721.namprd22.prod.outlook.com (2603:10b6:510:161::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Thu, 9 Apr
 2026 12:55:02 +0000
Received: from SJ5PEPF00000208.namprd05.prod.outlook.com
 (2603:10b6:a03:334:cafe::70) by SJ0PR05CA0095.outlook.office365.com
 (2603:10b6:a03:334::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.32 via Frontend Transport; Thu,
 9 Apr 2026 12:55:02 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=mkerelay1.compute.ge-healthcare.net;
Received: from mkerelay1.compute.ge-healthcare.net (165.85.157.49) by
 SJ5PEPF00000208.mail.protection.outlook.com (10.167.244.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 9 Apr 2026 12:55:01 +0000
Received: from zoo11.fihel.lab.ge-healthcare.net (zoo11.fihel.lab.ge-healthcare.net [10.168.174.93])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id 46542E57CC;
	Thu,  9 Apr 2026 15:54:54 +0300 (EEST)
From: Brian Ruley <brian.ruley@gehealthcare.com>
To: Russell King <linux@armlinux.org.uk>,
	Steve Capper <steve.capper@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Brian Ruley <brian.ruley@gehealthcare.com>,
	Russell King <rmk+kernel@arm.linux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mm/arm: pgtable: remove young bit check for pte_valid_user
Date: Thu,  9 Apr 2026 15:54:45 +0300
Message-ID: <20260409125446.981747-1-brian.ruley@gehealthcare.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000208:EE_|PH0PR22MB3721:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 2c08d1b4-b746-47c4-6e1c-08de963736e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: vJY+bj6GfH8oHIYCDJH/romW/Dlga0bFIR/jIYU28HJ9umzJa13Z1HOrMfhaR7bhK4byLlmNeCw9XLeTN4F9ZzySKYVhheIdDzOP+OTqkEFok66pA+yugnuilUqFr/GJcyk2zvuaC+Ix8OOeLhvGztnd94/COJOBVLsT55eEkvWzGl0SDyUxc1RZYNh3BGLN0Im0rvizXAUUMuBuTxtLMStyB2DdvTtk7EVtcBFtRTABN5pBZbgm4ilvwi85nF4zS1zlpUPWwsbBC1qV28hxXFS7s4JgsaDteUe/G1hNlrZ4+yfrthu89rLX0/shJwhjDLTPXo6l4Kku6Za/MeIPB+aa/7MY7OUTVHuIXy84gnmNzQxB+k0MSGE07U5CoVh+t+2gteKn87URxRr4S4KsE1Fe5NH5i8Wf+0BYqeaI1mujdgIaQqHG0+s6mNtkmRH1HrHR3Q7buZdctsxsHjNbgkmrbA9srvU/aE/tS/dxunIwhdWIdB/naqEaNJNuAnmeQGUyFAoSXrJ0BJVRSq8Z/AqfYeJbUtQqyIJMJbDMY5eG+bYpAoHpBFKl43Br8EiKDVZxjZVGxqe5ms5RBCl4PZeD8So2DJiVlOV3+wKEyISB0xl+4nEZR6V/8F0YMXPVCLINnArr8CWT0iughOqWfCyja4katDHlZ8WD8nzHvmMjXt9NUBCwB2MaLPpd5EtLOVKDyzQM7AVoW7kiyLKBXdyFgMrqGpEvUBsqKI7b85pT9ki89b/DrwCnF5pZ2t0o3YCdt3dGNsdEvDd+5X8SDA==
X-Forefront-Antispam-Report: CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mkerelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: aQpvOgjdHkhwyrAd3whe38xix9ZNsO7zjAOpVKZUQ0OiYysdEM4KRkujGfgaST83iJGH3Cbi6VmQauA9jE/ndA1sMgXGaIi5/vzi2z3dZkPR8F1L6g3uHnX5X/wkgID71ppR9MwJIbIMzW9sQ0MjdAtuEGdYmzqwNUF1SHJg84XTt0uZzoLIJWkRh4jLNv9QjvOK8eFJ/yUQz6RrEhzei9anf/NyH/HDnLVuXhzlEV5n+NyOzGJ2OUIS/yaegoUAjsEi6v+y3mY+itV5a1ZZVSaC4ZzqEehfXti/3ha5lpyre6yNE2cMphsO3U2FhGP5Z6wpD6kUxNwZoKTe+t1g4GvuQEcU+xMWXvuDubuME1653uiAfBWaS+pMtDYZT+p87x4B2H33RT3/DCiUfb+XRtMeoUvezY0IogYhLa9alBtM7dTmBJXP5IdVwGaaCIrM
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 12:55:01.9420
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c08d1b4-b746-47c4-6e1c-08de963736e9
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[mkerelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF00000208.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR22MB3721
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_055508_646350_F8156D2B 
X-CRM114-Status: GOOD (  14.44  )
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

Fixes cache desync, which can cause undefined instruction,
translation and permission faults under heavy memory use.

This is an old bug introduced in commit 1971188aa196 ("ARM: 7985/1: mm:
implement pte_accessible for faulting mappings"), which included a check
for the young bit of a PTE. The underlying assumption was that old pages
are not cached, therefore, `__sync_icache_dcache' could be skipped
entirely.

However, under extreme memory pressure, page migrations happen
frequently and the assumption of uncached "old" pages does not hold.
Especially for systems that do not have swap, the migrated pages are
unequivocally marked old. This presents a problem, as it is possible
for the original page to be immediately mapped to another VA that
happens to share the same cache index in VIPT I-cache (we found this
bug on Cortex-A9). Without cache invalidation, the CPU will see the
old mapping whose physical page can now be used for a different
purpose, as illustrated below:

                Core                      Physical Memory
  +-------------------------------+     +------------------+
  | TLB                           |     |                  |
  |  VA_A 0xb6e6f -> pfn_q        |     | pfn_q: code      |
  +-------------------------------+     +------------------+
  | I-cache                       |
  |  set[VA_A bits] | tag=pfn_q   |
  +-------------------------------+

migrate (kcompactd):
  1. copy pfn_q --> pfn_r
  2. free pfn_q
  3. pte: VA_a -> pfn_r
  4. pte_mkold(pte) --> !young
  5. ICIALLUIS skipped (because !young)

pfn_src reused (OOM pressure):
  pte: VA_B -> pfn_q (different code)

bug:
                Core                      Physical Memory
  +-------------------------------+     +------------------+
  | TLB (empty)                   |     | pfn_r: old code  |
  +-------------------------------+     | pfn_q: new code  |
  | I-cache                       |     +------------------+
  |  set[VA_A bits] | tag=pfn_q   |<--- wrong instructions
  +-------------------------------+

This was verified on ba16-based board (i.MX6Quad/Dual, Cortex-A9) by
instrumenting the migration code to track recently migrated pages in a
ring buffer and then dumping them in the undefined instruction fault
handler. The bug can be triggered with `stress-ng':

  stress-ng --vm 4 --vm-bytes 2G --vm-method zero-one --verify

Note that the system we tested on has only 2G of memory, so the test
triggered the OOM-killer in our case.

Fixes: 1971188aa196 ("ARM: 7985/1: mm: implement pte_accessible for faulting mappings")
Signed-off-by: Brian Ruley <brian.ruley@gehealthcare.com>
---
 arch/arm/include/asm/pgtable.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/include/asm/pgtable.h b/arch/arm/include/asm/pgtable.h
index 6fa9acd6a7f5..e3a5b4a9a65f 100644
--- a/arch/arm/include/asm/pgtable.h
+++ b/arch/arm/include/asm/pgtable.h
@@ -185,7 +185,7 @@ static inline pte_t *pmd_page_vaddr(pmd_t pmd)
 #define pte_exec(pte)		(pte_isclear((pte), L_PTE_XN))
 
 #define pte_valid_user(pte)	\
-	(pte_valid(pte) && pte_isset((pte), L_PTE_USER) && pte_young(pte))
+	(pte_valid(pte) && pte_isset((pte), L_PTE_USER))
 
 static inline bool pte_access_permitted(pte_t pte, bool write)
 {
-- 
2.47.3


