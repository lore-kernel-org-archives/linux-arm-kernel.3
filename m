Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80816C79F81
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 07:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ViTmWloD5J2eKVReHF1z7HtFirOwWOw1jQ1azvN/uQ=; b=hhhp9TzsolEV82bDxKD1ZxtA45
	DYp81PJ5Rh97D4Aw0JTIfzI8kg8XZuQFJVdXI6b8SKlYTPy5y07cRw48wUP+LxLib2EupqbuWsevZ
	EgtCE9I7aSvI+awHuFVQG/SkL7E2FjaQUQaal//Bffr69JnXlwne89Y92WeL4laBf/tFuImK5Ip8c
	FYq2cqKgNmGfPDVIolwatfvzuOfWogMrVGnc8eKCWZkXfoMxZIh6DEihBa/f+hC9q+NUz4FP9PPzw
	Z2XHlt8AlPjyA0U3MprFjkCRey8T1uFtBSRTEKYmAoyo12IYqjGk+1vLtjpy1rlBbNpMzTwzQT2lE
	o0tZTpnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x224r-0000000Gctg-1TIN;
	Thu, 03 Sep 2026 07:41:41 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x224i-0000000GciD-3jT5;
	Thu, 03 Sep 2026 07:41:36 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788421289;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8ViTmWloD5J2eKVReHF1z7HtFirOwWOw1jQ1azvN/uQ=;
	b=qygBbDf/i/ChTAwdDHX/OMkpJmg3bx6WNehWxnz/a/QG/CS7FCGINzvET8JahA42fqomF9
	0tA/fgeQbgmMTbTiQjN7PdJlMV7Y11X8gID4ivpxX9BwP+ezfa5IJUGKanG/XPsFRFZvzW
	+w91JMBD2jwTIuY19qA66NaWObSbeT+v9qSA/aXqJ/r7GLtPWY+L4rF0kBBhrcq0sS9IS1
	YH38iFpVF78cVoohANLZiDMxyNqiEUlth5rF658DWk6HyldpYOdOSloQqohF0RloLbf5f+
	O1QY45sabtAAMz5DyzbmCTCGTzJvoZxmpqGlyZ73gD3OpdV5mqJKFQtQUXHgsw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788421289;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8ViTmWloD5J2eKVReHF1z7HtFirOwWOw1jQ1azvN/uQ=;
	b=99/QUoc8tSeZF+1c6hGSR5xjtwKPDTxKJiyjGqHWes2RoXstjBOuax6m03o+e/SbOdYvh9
	hLslsBJWfKFMgqDg==
Date: Thu, 03 Sep 2026 09:41:19 +0200
Subject: [PATCH v2 04/15] ARM: drop custom asm/auxvec.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260903-at-vector-size-arch-v2-4-5bc32a71e3d8@linutronix.de>
References: <20260903-at-vector-size-arch-v2-0-5bc32a71e3d8@linutronix.de>
In-Reply-To: <20260903-at-vector-size-arch-v2-0-5bc32a71e3d8@linutronix.de>
To: Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
 linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-sh@vger.kernel.org, linux-alpha@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788421286; l=523;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=4mJFyYPX7/9EiMcEouBDn+ZTTOxkaHBJ3RQn0m6AUq0=;
 b=sVImdxunzIXRXXF2KzwDmKwk5x92lBY65ndCWzK3uf7dXH1bpo1cEYC44cBh8xKpT1XJtE/ZI
 nX8kEx7kkkRCESasFd8Wvn+OVgSU5t7OhvXleYrjtpeuaW16BitTJtC
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_004133_062946_EEFD258E 
X-CRM114-Status: UNSURE (   6.62  )
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

With the introduction of asm-generic/auxvec.h, this header unnecessary.

Drop it.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Reviewed-by: Kees Cook <kees@kernel.org>
---
 arch/arm/include/asm/auxvec.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/include/asm/auxvec.h b/arch/arm/include/asm/auxvec.h
deleted file mode 100644
index fbd388c46299..000000000000
--- a/arch/arm/include/asm/auxvec.h
+++ /dev/null
@@ -1 +0,0 @@
-#include <uapi/asm/auxvec.h>

-- 
2.55.0


