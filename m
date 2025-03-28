Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DAECC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 06:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ju3idXjJ2EWyGZpMjlJEAEG64jm0gCsfjmqYlr5+Oz4=; b=Ao4PRXEfJ6utJqBjSBV6C+8GyA
	domNaUr1ZM7sNxvKEu2poyddvyir7sMHAeoRJBcWvBBTBP1aoKT3P6EZo93gmsKTLXOyoXAz7Aqdd
	ADU5h5Tx+f+3xPwzchu5v4XfvtraZewRsS4WWLZNaHztz9Jy/1KN0PDfzhlP7K5559SD5NO4VGYGs
	0qZNv8VxDEvRySXLTnCdWvtFNzC4/vWzhzGdwF25i5+l0FebUhGNI7vU41BZH0rxFPqQHhyI6XfW/
	rStXnAVQg8HkbJkrG9CgcQGVlEonAYv2+4Zb8eL9TftOHbEWbThQWmWkQe5gISnc+lBqsV0Zx9uPx
	niUzqV4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty37V-0000000Ciok-3WiE;
	Fri, 28 Mar 2025 06:23:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty35l-0000000Cicc-09nb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 06:21:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E63B71762;
	Thu, 27 Mar 2025 23:21:21 -0700 (PDT)
Received: from K4MQJ0H1H2.arm.com (unknown [10.163.46.134])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 80E8F3F58B;
	Thu, 27 Mar 2025 23:21:11 -0700 (PDT)
From: Dev Jain <dev.jain@arm.com>
To: catalin.marinas@arm.com,
	will@kernel.org
Cc: gshan@redhat.com,
	rppt@kernel.org,
	steven.price@arm.com,
	suzuki.poulose@arm.com,
	tianyaxiong@kylinos.cn,
	ardb@kernel.org,
	david@redhat.com,
	ryan.roberts@arm.com,
	urezki@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dev Jain <dev.jain@arm.com>
Subject: [PATCH] arm64: pageattr: Explicitly bail out when changing permissions for vmalloc_huge mappings
Date: Fri, 28 Mar 2025 11:51:03 +0530
Message-Id: <20250328062103.79462-1-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_232121_118760_1FC282CC 
X-CRM114-Status: GOOD (  10.21  )
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

arm64 uses apply_to_page_range to change permissions for kernel VA mappings,
which does not support changing permissions for leaf mappings. This function
will change permissions until it encounters a leaf mapping, and will bail
out. To avoid this partial change, explicitly disallow changing permissions
for VM_ALLOW_HUGE_VMAP mappings.

Signed-off-by: Dev Jain <dev.jain@arm.com>
---
 arch/arm64/mm/pageattr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
index 39fd1f7ff02a..8337c88eec69 100644
--- a/arch/arm64/mm/pageattr.c
+++ b/arch/arm64/mm/pageattr.c
@@ -96,7 +96,7 @@ static int change_memory_common(unsigned long addr, int numpages,
 	 * we are operating on does not result in such splitting.
 	 *
 	 * Let's restrict ourselves to mappings created by vmalloc (or vmap).
-	 * Those are guaranteed to consist entirely of page mappings, and
+	 * Disallow VM_ALLOW_HUGE_VMAP vmalloc mappings so that
 	 * splitting is never needed.
 	 *
 	 * So check whether the [addr, addr + size) interval is entirely
@@ -105,7 +105,7 @@ static int change_memory_common(unsigned long addr, int numpages,
 	area = find_vm_area((void *)addr);
 	if (!area ||
 	    end > (unsigned long)kasan_reset_tag(area->addr) + area->size ||
-	    !(area->flags & VM_ALLOC))
+	    ((area->flags & (VM_ALLOC | VM_ALLOW_HUGE_VMAP)) != VM_ALLOC))
 		return -EINVAL;
 
 	if (!numpages)
-- 
2.30.2


