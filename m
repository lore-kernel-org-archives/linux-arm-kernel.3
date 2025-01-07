Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65EDBE77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 10:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=06MPwFnb5XBLTv/ytIls9yj7Vww99l3RVex/5sshiQU=; b=vS9vilmUeNhVqSJbKmKMNc00Px
	F3z/dmVSL9icF5gKwsqE4JE32w8fH4Xtz0+6N5nDWUzVu3b1sjIoRXhvY9WbYE1HkMkNfCQwPI9qv
	MREXP2Wz8vN5Xw/0RZSFkAn3vhCxeXWTPyHRGK6uKn13HmW3Rlrw0ikm50D/MEWM/qAVBeahLDCvO
	MCH6xp+KYo06aKq6GJxE3U+tmI5peZA7S9+4xBKWWXKhYxhzzqx+BuOOMCHBzz3ABrAdF2K2cg5FA
	t7g+5tKEdxBJRubqYbKkh8qHBerS14BW+vbenbCQN83Q08h1oNFMkPO/fSvXyZc3sPINKrZAhKwfo
	td2Q8y8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV78g-00000004R9c-2bYm;
	Tue, 07 Jan 2025 10:48:46 +0000
Received: from out-176.mta1.migadu.com ([95.215.58.176])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV77Q-00000004QnV-2fjP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 10:47:32 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1736246844;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=06MPwFnb5XBLTv/ytIls9yj7Vww99l3RVex/5sshiQU=;
	b=O18xOkxZV21GKEEapCPlYCB9h2LLq2aeqQpyKO75RbXihLLPPHfE/bo4vTmsJzbdvxSJXV
	QyuR0O+6QDliuVyGtj8pfF2IUOhLwqXWaeb48073Q58+kYtUajAUaFaUc+/kH8X+VB8Y7e
	KJbV/9XPEBYwi1uwlS1ncBJM1m7fOxE=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Russell King <linux@armlinux.org.uk>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	David Hildenbrand <david@redhat.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH] arm/pgtable: Remove duplicate included header file
Date: Tue,  7 Jan 2025 11:47:03 +0100
Message-ID: <20250107104704.3062-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_024728_815349_FA5CDB3D 
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

The header file asm-generic/pgtable-nopud.h is included whether
CONFIG_MMU is defined or not.

Include it only once before the #ifndef/#else/#endif preprocessor
directives and remove the following make includecheck warning:

  asm-generic/pgtable-nopud.h is included more than once

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/arm/include/asm/pgtable.h | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm/include/asm/pgtable.h b/arch/arm/include/asm/pgtable.h
index be91e376df79..6b986ef6042f 100644
--- a/arch/arm/include/asm/pgtable.h
+++ b/arch/arm/include/asm/pgtable.h
@@ -19,14 +19,13 @@ extern struct page *empty_zero_page;
 #define ZERO_PAGE(vaddr)	(empty_zero_page)
 #endif
 
-#ifndef CONFIG_MMU
-
 #include <asm-generic/pgtable-nopud.h>
+
+#ifndef CONFIG_MMU
 #include <asm/pgtable-nommu.h>
 
 #else
 
-#include <asm-generic/pgtable-nopud.h>
 #include <asm/page.h>
 #include <asm/pgtable-hwdef.h>
 
-- 
2.47.1


