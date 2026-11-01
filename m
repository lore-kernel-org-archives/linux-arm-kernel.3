Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E4C606A324
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 17:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MAy20vH3;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=Xr90D0ga
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:Message-Id:Cc:Date:Subject:From:Mime-Version:To:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=FUZWKOpCXLxhPIogozxPVP16HUn4U2rHNFDlZpDx9sc=; b=MAy20vH3HNjrtvuN5Q49VSCq1d
	+1V/5Be5GJVS03TwZBBguIjSCCF/ZoSr7go16gg3g8cJw3DRFt1qynyGCaJIu+NWzlL4uboPeoU/j
	PDvbIBQhblark6EpnOAreltDL0RYIJ3BCwEbK0i2X8TrVqrwgRD9DNOhVF2zRM7051lyjsv9f0N3P
	TpFENE4CvS88ByyhxC5ef5ftnOkdV6lDBgF8Cb5rLC7kYbZwhnyepnFGVKTPdRPD96wvm7XTnzyto
	0FqoHg0BDv+a3CfsqAlSfX93iu39cuZsXOYNk80XLzGcatk+/zXhMTgms92pAbqKmfcMBuZ/y2lAU
	zLJQsd4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNZ5C-0000000EhTU-2D4c;
	Sun, 01 Nov 2026 17:11:02 +0000
Received: from va-1-115.ptr.blmpb.com ([209.127.230.115])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNZ57-0000000EhSu-1CB5
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 17:11:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1793553047; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=FUZWKOpCXLxhPIogozxPVP16HUn4U2rHNFDlZpDx9sc=;
 b=Xr90D0ga0tTQ845OVKAqMzm6yMDYm1XSSRICkbvrXv2199yugNxFWDIa/sPxKm4IcnuYfN
 hrlpIOeYJ8+GubTlXoeD48D06dLMLeluzLo5er2LC07D0ENJA0RLVZuXo+tiNZWvln4Oc7
 2vQ9jufbmfk2A49sBb6jP/5yr/P6LJmQG3AF9E6IUKDWLQ2xGzua8idXpI78IZj39qHFLr
 yBXmozWjxBTtkkETXvd/gY5qKl1FWN+898WzGKBnS5x49AmYLAZKyrSWSnmkRfhvTzL6QR
 rEsOHbrxSbWd+8dhpOPtPcSHjA5iGdg0hOgpE8dCjN7TtBK2celFwdE0v9Gk9g==
To: "Catalin Marinas" <catalin.marinas@arm.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
From: "Zhao Gongyi" <zhaogongyi@bytedance.com>
Subject: [PATCH] arm64: mm: validate /dev/mem mmap ranges without overflow
X-Lms-Return-Path: <lba+26ae77295+bae199+lists.infradead.org+zhaogongyi@bytedance.com>
Date: Mon,  2 Nov 2026 01:10:30 +0800
X-Original-From: Zhao Gongyi <zhaogongyi@bytedance.com>
Cc: "Will Deacon" <will@kernel.org>, "Mark Rutland" <mark.rutland@arm.com>, 
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>, 
	"Zhao Gongyi" <zhaogongyi@bytedance.com>
Message-Id: <20261101171030.87343-1-zhaogongyi@bytedance.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=UTF-8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_091057_706590_810CDB5A 
X-CRM114-Status: GOOD (  12.33  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

An arm64 syzkaller reproducer creates a FUSE character device with
major:minor 1:1, so opening it uses the /dev/mem file operations. It
maps one page from offset 0xfffffffffffff000 at user address zero.
The next openat() with a NULL pathname triggers a synchronous external
abort (SEA, ESR 0x96000010) in strncpy_from_user() via do_getname(),
panicking the kernel.

valid_mmap_phys_addr_range() checks the exclusive end by adding the
mapping size to the starting address. For this offset, the sum wraps
to zero and passes the PHYS_MASK test, allowing an out-of-range PFN to
reach remap_pfn_range(). The inclusive-end overflow check in
mmap_mem_prepare() does not catch it because the end is ULONG_MAX.

Reject starting PFNs outside PHYS_MASK and compare the inclusive length
against the remaining physical range without overflowing. This also
allows mappings that end exactly at PHYS_MASK, which the old check
incorrectly rejects.

Fixes: 1d18c47c735e ("arm64: MMU fault handling and page table management")
Cc: stable@vger.kernel.org
Signed-off-by: Zhao Gongyi <zhaogongyi@bytedance.com>
---
Tested on the base commit with QEMU TCG and 52-bit LPA2:
the overflowing one-page mapping changes from success to -EINVAL,
while the last valid one- and two-page mappings change from -EINVAL to
success. A direct /dev/mem mmap followed by openat(NULL) panics before
this change; with the change, mmap fails with -EINVAL and openat()
returns -EFAULT.

 arch/arm64/mm/mmap.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/mm/mmap.c b/arch/arm64/mm/mmap.c
index 32e0771..d6286bc 100644
--- a/arch/arm64/mm/mmap.c
+++ b/arch/arm64/mm/mmap.c
@@ -61,7 +61,12 @@ int valid_phys_addr_range(phys_addr_t addr, size_t size)
  */
 int valid_mmap_phys_addr_range(unsigned long pfn, size_t size)
 {
-	return !(((pfn << PAGE_SHIFT) + size) & ~PHYS_MASK);
+	const phys_addr_t max_addr = PHYS_MASK;
+
+	if (!size || pfn > (max_addr >> PAGE_SHIFT))
+		return 0;
+
+	return size - 1 <= max_addr - (pfn << PAGE_SHIFT);
 }
 
 static int __init adjust_protection_map(void)

base-commit: cbbddb6b08cc9900a87cccaa9b22bbe06aa4f50a
-- 
2.39.5 (Apple Git-154)

