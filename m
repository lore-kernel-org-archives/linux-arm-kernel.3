Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D4AC36018
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 09:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:From:Cc:To:Subject:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=d1pWGqHR6cFV/on6hr9zUAK2+vRz2SnFBPCDWKehJX8=; b=hq+lO1PrJyFQ8fWyVKfWfJp5Tk
	tJ+Cq95G/9AvLgJC0Db8s8v7mkNjIrTdq63Zbaje/sJLHHW7nRe6tpaf7sfEOHkyKbS5PXVb4SvP4
	5NRkWywRMgkQxfAU/w1jonUnYvODKCa31FTIY4ZELgPuCvuEikRe3HfvStKeWJpTNFjBdj4j9kd+r
	cJA53RyOWHpZS16ZhsQI5S6PHBZcEw1djMvSHp8udezc68n2DmdgZLTjTUaBLcStTmPwlSped/0LS
	pIgKhlNSO/ZI88DtqN3DrZ3XCT8L97IFZ61LVU1g5HZ9K6LiJg9iCJgRuc57xagrdeAHZo1GSbyE0
	sTNZGzhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzXpN-00000002Sr6-2Nvx;
	Tue, 01 Apr 2025 09:22:37 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzXfn-00000002Qy9-3ZvD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 09:12:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 30C60A444B2;
	Tue,  1 Apr 2025 09:07:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57C56C4CEE4;
	Tue,  1 Apr 2025 09:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1743498762;
	bh=0r41yPIFVcQ1Li20z/GWw5daVS0zXqY7Zawex0eTObY=;
	h=Subject:To:Cc:From:Date:From;
	b=uZXcZ78idbwCaw/3u5Z8AiDRjUBlR58boNNhMy3rhl9l8JAN6sxvTEE9Q3gVXq/id
	 58pDH59FRTTh6Dw8FWK/UL6TsdhixlwbsayQzxc1eb21cCmBvlsSDOSNiiSPtBjfGz
	 juQ92O2Qehf0Ny9/R6moCBXihjSNScQZxu8PtKTI=
Subject: Patch "ARM: 9350/1: fault: Implement copy_from_kernel_nofault_allowed()" has been added to the 5.10-stable tree
To: akpm@linux-foundation.org,ardb@kernel.org,ben@decadent.org.uk,broonie@kernel.org,gregkh@linuxfoundation.org,keescook@chromium.org,linux-arm-kernel@lists.infradead.org,rmk+kernel@armlinux.org.uk,wangkefeng.wang@huawei.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Tue, 01 Apr 2025 10:11:05 +0100
Message-ID: <2025040105-rehab-quintuple-4e3d@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_021244_031058_30A90A33 
X-CRM114-Status: GOOD (  13.43  )
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


This is a note to let you know that I've just added the patch titled

    ARM: 9350/1: fault: Implement copy_from_kernel_nofault_allowed()

to the 5.10-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     arm-9350-1-fault-implement-copy_from_kernel_nofault_allowed.patch
and it can be found in the queue-5.10 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 169f9102f9198b04afffa6164372a4ba4070f412 Mon Sep 17 00:00:00 2001
From: Kees Cook <keescook@chromium.org>
Date: Thu, 1 Feb 2024 18:32:58 +0100
Subject: ARM: 9350/1: fault: Implement copy_from_kernel_nofault_allowed()

From: Kees Cook <keescook@chromium.org>

commit 169f9102f9198b04afffa6164372a4ba4070f412 upstream.

Under PAN emulation when dumping backtraces from things like the
LKDTM EXEC_USERSPACE test[1], a double fault (which would hang a CPU)
would happen because of dump_instr() attempting to read a userspace
address. Make sure copy_from_kernel_nofault() does not attempt this
any more.

Closes: https://lava.sirena.org.uk/scheduler/job/497571
Link: https://lore.kernel.org/all/202401181125.D48DCB4C@keescook/ [1]

Reported-by: Mark Brown <broonie@kernel.org>
Suggested-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
Tested-by: Mark Brown <broonie@kernel.org>
Cc: Wang Kefeng <wangkefeng.wang@huawei.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Ben Hutchings <ben@decadent.org.uk>
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/arm/mm/fault.c |    7 +++++++
 1 file changed, 7 insertions(+)

--- a/arch/arm/mm/fault.c
+++ b/arch/arm/mm/fault.c
@@ -24,6 +24,13 @@
 
 #include "fault.h"
 
+bool copy_from_kernel_nofault_allowed(const void *unsafe_src, size_t size)
+{
+	unsigned long addr = (unsigned long)unsafe_src;
+
+	return addr >= TASK_SIZE && ULONG_MAX - addr >= size;
+}
+
 #ifdef CONFIG_MMU
 
 /*


Patches currently in stable-queue which might be from keescook@chromium.org are

queue-5.10/arm-9350-1-fault-implement-copy_from_kernel_nofault_allowed.patch
queue-5.10/arm-9351-1-fault-add-cut-here-line-for-prefetch-aborts.patch

