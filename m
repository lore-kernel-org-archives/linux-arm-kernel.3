Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A0EC02194
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 15:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tjDbFbRwm3HhAGF25M09T2irsMdw4QN9fdCTcQJrGfg=; b=JlY9xdMQPirP3VR1TY6+urR00v
	HnISIxNmWUBpygt+ziBU2cFYh2x1g9x8jrAXByy39clB76BpB6UFrKTllYw5YAGwP9LcWShdeom2d
	uX2V2+uKO3J+UDRtu+2Pz2DkZcMMQvbQnOBCRfv9b+/1N/xTY24y7zuL4lEj7BxRefaYzvwszb9DT
	84vYPWXPrGBq4UliD+RJHMNwmO66vvT8Wwwplegs/9cvdQNd8z2vvpOa2MHk7nKkT14N16ET5qIyt
	QFR3LFj0Xf/1jbsM0F5sWngRisZuRm1vLTQqajzIbeETx/ndbCN+WZ1TeCGFKlkjywDSdXRvLjtAV
	LLKuRBbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfLIM-00000000tfC-28ej;
	Tue, 04 Feb 2025 15:57:02 +0000
Received: from out-181.mta0.migadu.com ([91.218.175.181])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfLGv-00000000tP6-1zMG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 15:55:34 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738684530;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tjDbFbRwm3HhAGF25M09T2irsMdw4QN9fdCTcQJrGfg=;
	b=jFytUpzvpraiJUWcauYL0330V0OrfayU9MHwu2SjTm6Mk+mnewiAlRiZoqAfnX332Fj1wz
	uZLUzQcAD8Jyi5ebHpkCQNgeazqurdJLFrabyQEJTeO/W2xIwm7GOijrAqIMqdw+GWFTmi
	6XeX71NrqGxsGeragjZ2M7LiP+COxbY=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Russell King <linux@armlinux.org.uk>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH] arm/pgtable: Remove duplicate included header file
Date: Tue,  4 Feb 2025 16:55:12 +0100
Message-ID: <20250204155514.4486-1-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_075533_660913_8C48E7B4 
X-CRM114-Status: UNSURE (   8.97  )
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
2.48.1


