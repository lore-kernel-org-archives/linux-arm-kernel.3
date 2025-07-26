Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DCE5C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Jul 2025 21:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WE5MdVlpsuM8Xoi4UCE5Cw+iR6DrWrv6Xdo1I7z5/90=; b=kPYBo5AhbxfaBmOEFpqjiWA5qw
	++4N4KCXx5FC/iOo1GmnRghVHiVH/MVITDMpxaMfzjjqBzVH6dhcQA7yY4jyeVE8P9olWmsepIGp9
	wDwHzo6jzORLuRpIdcL/gKTzbcLJM7ec11irmHgAMIeylo+rwJWMnAiQOruD6Ix4y0RMumO6fqc1r
	UTRYVWQygnygWurYQDUTtu1i0xTA5ueMi9ZWOFLfL1G7VjCJONSvbgbjlnPtC3oBiMweJEf2D9Yl4
	QCyGwHsPwXkUWy+c9VbAooWjs3SuW9N/cxYsYUJIJ90PMVP/SJ3TAFLbeQHcqX5syMYk9ivVTYEg7
	BMM6eaiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufmVI-0000000BwTo-0fla;
	Sat, 26 Jul 2025 21:32:28 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufmSk-0000000BwLQ-0knH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Jul 2025 21:29:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0190FA53CEB;
	Sat, 26 Jul 2025 21:29:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C6C7C4CEED;
	Sat, 26 Jul 2025 21:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753565388;
	bh=HSq9GVJebOQfQB9sT81R3PDtAZ/ze381+caKN1MH1OM=;
	h=From:To:Cc:Subject:Date:From;
	b=Uj2Xxygg6ssYQsxZ5CxC4TyGoFDgIJEJFPw5gPQIiKSgwcvSqDG9L2HF78J7DeG73
	 2tDtC6VaTvX9N+K9ZFhrcUdUSSnbivKWxJYLlpPDhw1t11czrS3oDB/XBfAtG2R+VV
	 TuspiNNBbE0AIN9OCJNKo6DbR2a0a3ZSV+30Hk7/x2LIdmKOzz3WKTZlDop6XuMVO4
	 q8QWSW8wl/lTW/jrTqGPzsn3V+OMKmYzBbePZVQxov4CpZa3aSsVVxKZ0d65A9TH/5
	 sFmm1ADshAGOYue6kWXL8ssA5wlvOARnrV7vydTx2az71RSEXtsXp3trJhAW+c8BmB
	 vtXYdO1gpjT4Q==
From: Kees Cook <kees@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Kees Cook <kees@kernel.org>,
	Linux Kernel Functional Testing <lkft@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	Arnd Bergmann <arnd@arndb.de>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH] kstack_erase: Disable kstack_erase for all of arm compressed boot code
Date: Sat, 26 Jul 2025 14:29:45 -0700
Message-Id: <20250726212945.work.975-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2143; i=kees@kernel.org; h=from:subject:message-id; bh=HSq9GVJebOQfQB9sT81R3PDtAZ/ze381+caKN1MH1OM=; b=owGbwMvMwCVmps19z/KJym7G02pJDBmtHiffaX4tSiqs9K65/7rYQtbQ4mFj+8e4R+pVZmtf3 is/ayjdUcrCIMbFICumyBJk5x7n4vG2Pdx9riLMHFYmkCEMXJwCMJE1nxgZ5t1q1Dl54euh+Ojd xYevtGn/PjVj3pYgc6aPyxJmbZZW0WD4X5zKMVlatP39hnx3p9nLkzautbP3mf7DiWHBQu1ze8o ncQMA
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250726_142950_353860_1124F568 
X-CRM114-Status: GOOD (  12.20  )
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

When building with CONFIG_KSTACK_ERASE=y and CONFIG_ARM_ATAG_DTB_COMPAT=y,
the compressed boot environment encounters an undefined symbol error:

    ld.lld: error: undefined symbol: __sanitizer_cov_stack_depth
    >>> referenced by atags_to_fdt.c:135

This occurs because the compiler instruments the atags_to_fdt() function
with sanitizer coverage calls, but the minimal compressed boot environment
lacks access to sanitizer runtime support.

The compressed boot environment already disables stack protector with
-fno-stack-protector. Similarly disable sanitizer coverage by adding
$(DISABLE_KSTACK_ERASE) to the general compiler flags (and remove it
from the one place it was noticed before), which contains the appropriate
flags to prevent sanitizer instrumentation.

This follows the same pattern used in other early boot contexts where
sanitizer runtime support is unavailable.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
Closes: https://lore.kernel.org/all/CA+G9fYtBk8qnpWvoaFwymCx5s5i-5KXtPGpmf=_+UKJddCOnLA@mail.gmail.com
Reported-by: Nathan Chancellor <nathan@kernel.org>
Closes: https://lore.kernel.org/all/20250726004313.GA3650901@ax162
Suggested-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Kees Cook <kees@kernel.org>
---
 arch/arm/boot/compressed/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/compressed/Makefile b/arch/arm/boot/compressed/Makefile
index f9075edfd773..a159120d1e42 100644
--- a/arch/arm/boot/compressed/Makefile
+++ b/arch/arm/boot/compressed/Makefile
@@ -9,7 +9,6 @@ OBJS		=
 
 HEAD	= head.o
 OBJS	+= misc.o decompress.o
-CFLAGS_decompress.o += $(DISABLE_KSTACK_ERASE)
 ifeq ($(CONFIG_DEBUG_UNCOMPRESS),y)
 OBJS	+= debug.o
 AFLAGS_head.o += -DDEBUG
@@ -96,6 +95,7 @@ KBUILD_CFLAGS += -DDISABLE_BRANCH_PROFILING
 
 ccflags-y := -fpic $(call cc-option,-mno-single-pic-base,) -fno-builtin \
 	     -I$(srctree)/scripts/dtc/libfdt -fno-stack-protector \
+	     $(DISABLE_KSTACK_ERASE) \
 	     -I$(obj)
 ccflags-remove-$(CONFIG_FUNCTION_TRACER) += -pg
 asflags-y := -DZIMAGE
-- 
2.34.1


