Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33446E77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 10:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xirNoytw/1Nc8xyuYFAIfqL2j/ym7APCAmGVFyBjkHQ=; b=dYP33056Aezubuo3ShZaoh15PW
	bgBpcU8uLtL67krPa0fYj1haULW77w2KHZf6y1G3bnHiFSv1Hzd5KeBeKeizI+HDFFs5rAMg2hUIc
	WJyQLHVgGod6ykAB/c7cIgK56TgurHHl8w0NLegexnOZQionTPBkIDk/G+cWP/f5maj1r+gyy1BtQ
	GkAvJTVhIkQ2DB/J1qVkdZqrrDbm9d3LK3qfI4dk6jYUC5zM6nbL8QTDJIvrcbj0X2MjYzIlF88Ho
	5SelYRALjvt9+h6GoYbdt1eUUd5j/04/xOuMx0O24F1NfPmTmtjoHKVzWRSFiSYSxyUUkt+0hxcud
	62e/JQqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVq5V-0000000BaoV-2YTN;
	Thu, 09 Jan 2025 10:48:29 +0000
Received: from out-183.mta0.migadu.com ([2001:41d0:1004:224b::b7])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVq4H-0000000BacY-3zOb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 10:47:15 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1736419622;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xirNoytw/1Nc8xyuYFAIfqL2j/ym7APCAmGVFyBjkHQ=;
	b=ldRjaSt3nWQveY2yPKDlL4n5eSDMOlU2EbD3RP14YFZ3Q1JtFNUjWg95cWQ+UIy6suoZgc
	1023S3hMhMoYIUnAU4BFjRyMI+yf7/S/s+VBm3V68d4RVHXcYloZk+KdolTN/8BQwMhWsr
	8QLoxfwizU/JzK5gKW55DpOAGNzwV1E=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: Remove duplicate included header
Date: Thu,  9 Jan 2025 11:46:34 +0100
Message-ID: <20250109104636.124507-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_024714_275497_0E08C22D 
X-CRM114-Status: UNSURE (   8.30  )
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

The header asm/unistd_compat_32.h is included whether CONFIG_COMPAT is
defined or not.

Include it only once and remove the following make includecheck warning:

  asm/unistd_compat_32.h is included more than once

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/arm64/include/asm/seccomp.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/include/asm/seccomp.h b/arch/arm64/include/asm/seccomp.h
index b83975555314..bf6bf40bc5ab 100644
--- a/arch/arm64/include/asm/seccomp.h
+++ b/arch/arm64/include/asm/seccomp.h
@@ -23,7 +23,6 @@
 #define SECCOMP_ARCH_NATIVE_NR		NR_syscalls
 #define SECCOMP_ARCH_NATIVE_NAME	"aarch64"
 #ifdef CONFIG_COMPAT
-#include <asm/unistd_compat_32.h>
 # define SECCOMP_ARCH_COMPAT		AUDIT_ARCH_ARM
 # define SECCOMP_ARCH_COMPAT_NR		__NR_compat32_syscalls
 # define SECCOMP_ARCH_COMPAT_NAME	"arm"
-- 
2.47.1


