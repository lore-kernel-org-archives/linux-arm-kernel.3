Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25CC3E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Dec 2024 12:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JnDxRMYeOjb3+jKB4rsWUCstOhOv6VUUSR79jXmWeQ8=; b=KqlW5KQHMb9JjbuCpLou/qNWoJ
	Nwz7MAtkbUhqvw76jDbWRdk+iltVSOXM8zjWJaYFOuRiD4wy03qke56bRiYp0t4RHQaHrNvGuJqUC
	ymsMZlVWK4n6PM3Dswp/E26sl468ILWU+R/kP1e1WaEkuIx/tfbu2t8zY5B+MsUsdnomiK5jNM/TU
	cbgnUAfcsWzuIvvsiwZCLylRWh3COIvB+mLb0ChWt20x+ImnHRhjmh3bgTCw9d5vqUUWGNWBcGLcY
	5vJSKJmrMqVV2PgW9POPCdIeMK3lit+wsnIjhEGzESyVcKa2HJ5V3nhurOxO6hQsGbyYe+7xTSo0G
	GHsHc1Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQQYn-0000000DnHt-0zWx;
	Wed, 25 Dec 2024 12:32:21 +0000
Received: from out-185.mta1.migadu.com ([95.215.58.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQQXV-0000000Dn9X-3Pny
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Dec 2024 12:31:07 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1735129857;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JnDxRMYeOjb3+jKB4rsWUCstOhOv6VUUSR79jXmWeQ8=;
	b=YuahlkVAUOdfSWEyxQ8wN0+wW2gcCD6iNkOz+W6DIoweKh/sdkWVHBIs0YbID+giJ/072Q
	dQdORGJR/gAD2LDpOuH9Q1gzDfv1roZ85A4NoMeNdSBz2eGmT9ldZbhORUxMXPqoe8aWSn
	mCTRsOSkuZcWZUffYxrFvXCJqbxx3rU=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Russell King <linux@armlinux.org.uk>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH] arm/pgtable: Remove duplicate included header file
Date: Wed, 25 Dec 2024 13:30:35 +0100
Message-ID: <20241225123037.444716-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_043102_519542_542DF616 
X-CRM114-Status: UNSURE (   8.41  )
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


