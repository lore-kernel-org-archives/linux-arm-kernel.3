Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D5EEC61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 04:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2QNfNckCcuklRkVDPkhZawz8hFnylE76Ut4iIbDtMWE=; b=i7VZmWFHLaJLtIYFlZlpW4Zf0F
	j/fs55TocGSGK2fHGuZfYBnkEaRHjS7OuzdTXl4EpWwSZWuzfFAco2mqOXr8cbQYqGcURFoNk8fnH
	i40W8vUTRXIx71X6sLNFZBxQLhO7pW6dDfaEb01ItT/05kuNYXHmyvPZQkwO/luNzAd2JipsuvSWC
	HkdKl1BK9GQTV3B7CGohv+11kuGs7lUIW2bIlZE/KeRbg2QOKOmsBUTfJOMJXHrq23MDLrZ59KiCC
	V7dBJKrg5m6vELjHJp/ApEIYfqLDTo0RrG15FCCe86KMrTcimF4EmwbcVgsOcM8YREoM2WyzRb2Gu
	sd+QyowQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOTuE-00000003Nwa-2YoJ;
	Mon, 09 Jun 2025 04:14:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOTs6-00000003Nok-2NhE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 04:12:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 86AB71515;
	Sun,  8 Jun 2025 21:12:08 -0700 (PDT)
Received: from ergosum.cambridge.arm.com (ergosum.cambridge.arm.com [10.1.196.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0CEC33F673;
	Sun,  8 Jun 2025 21:12:25 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	stable@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	linux-kernel@vger.kernel.org,
	Dev Jain <dev.jain@arm.com>
Subject: [PATCH] arm64/ptdump: Ensure memory hotplug is prevented during ptdump_check_wx()
Date: Mon,  9 Jun 2025 05:12:14 +0100
Message-Id: <20250609041214.285664-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250608_211230_650770_B59C8088 
X-CRM114-Status: GOOD (  13.79  )
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

The arm64 page table dump code can race with concurrent modification of the
kernel page tables. When a leaf entries are modified concurrently, the dump
code may log stale or inconsistent information for a VA range, but this is
otherwise not harmful.

When intermediate levels of table are freed, the dump code will continue to
use memory which has been freed and potentially reallocated for another
purpose. In such cases, the dump code may dereference bogus addresses,
leading to a number of potential problems.

This problem was fixed for ptdump_show() earlier via commit 'bf2b59f60ee1
("arm64/mm: Hold memory hotplug lock while walking for kernel page table
dump")' but a same was missed for ptdump_check_wx() which faced the race
condition as well. Let's just take the memory hotplug lock while executing
ptdump_check_wx().

Cc: stable@vger.kernel.org
Fixes: bbd6ec605c0f ("arm64/mm: Enable memory hot remove")
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Reported-by: Dev Jain <dev.jain@arm.com>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
This patch applies on v6.16-rc1

Dev Jain found this via code inspection.

 arch/arm64/mm/ptdump.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/mm/ptdump.c b/arch/arm64/mm/ptdump.c
index 421a5de806c62..551f80d41e8d2 100644
--- a/arch/arm64/mm/ptdump.c
+++ b/arch/arm64/mm/ptdump.c
@@ -328,7 +328,7 @@ static struct ptdump_info kernel_ptdump_info __ro_after_init = {
 	.mm		= &init_mm,
 };
 
-bool ptdump_check_wx(void)
+static bool __ptdump_check_wx(void)
 {
 	struct ptdump_pg_state st = {
 		.seq = NULL,
@@ -367,6 +367,16 @@ bool ptdump_check_wx(void)
 	}
 }
 
+bool ptdump_check_wx(void)
+{
+	bool ret;
+
+	get_online_mems();
+	ret = __ptdump_check_wx();
+	put_online_mems();
+	return ret;
+}
+
 static int __init ptdump_init(void)
 {
 	u64 page_offset = _PAGE_OFFSET(vabits_actual);
-- 
2.30.2


