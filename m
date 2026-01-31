Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06756D79768
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 12:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=y4AG9zjQxz1mJY9gQSxvPqo/5V4VjR3fM231VFwrTGg=; b=rXGA5n1XtrcFSyR56Dx/Kz1XoA
	TlConWpZ/LfsgtCDaosxy6l5GCQnbxku4CFT8FFKTomwLyK1A+q+28kGIie/qHufOuwPKyKUW+4Iv
	HSA7iCHk38kLrZ8Etae+3dwWQqyAmTnmn4UB6pGZc65I2rJVRn/fHnoYP3FC1/aQxYHrxrt4cmNar
	Y7L2/tOaJrT5/cNkOIPZ77c5l9jWz01QmA3hO9dV/3dj8tS+3/md/iAyT6uWgEDd61Mr+P3hP4RBj
	5Ns750fu4MAsabYhIt2PThRVPftPGVMQAU9YTegrZQD4a20yUwlAfxQGJQWqtQ/CIFkT5TEainG1B
	+1eV1y+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmA0K-00000002Yz2-0qd0;
	Sat, 31 Jan 2026 12:23:08 +0000
Received: from out-181.mta0.migadu.com ([91.218.175.181])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmA0H-00000002Yyf-1Unz
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 12:23:06 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1769862179;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=y4AG9zjQxz1mJY9gQSxvPqo/5V4VjR3fM231VFwrTGg=;
	b=bg7z/PTwc4qua1wW0MAZwmr5FSsIqt1hmGJTCIWppfvAlM9aPaKVR1ITYERObFMngp/u6a
	H1jVASNfm8PqTwfY4LSTni472BUBIzaNuZmTu3vywfsU+MFq82V6UTrB3GgFoglS2aUei5
	e+KtB8FM3o5ef/YelmtMrOcQHYR6epw=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: omap2: Replace scnprintf with strscpy in omap3_cpuinfo
Date: Sat, 31 Jan 2026 13:22:38 +0100
Message-ID: <20260131122238.493577-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_042305_573202_C6ED8725 
X-CRM114-Status: UNSURE (   8.50  )
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

Replace scnprintf("%s", ...) with the faster and more direct strscpy().

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/arm/mach-omap2/id.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-omap2/id.c b/arch/arm/mach-omap2/id.c
index 7f387706368a..068c6dfa3a48 100644
--- a/arch/arm/mach-omap2/id.c
+++ b/arch/arm/mach-omap2/id.c
@@ -17,6 +17,7 @@
 #include <linux/io.h>
 #include <linux/random.h>
 #include <linux/slab.h>
+#include <linux/string.h>
 
 #ifdef CONFIG_SOC_BUS
 #include <linux/sys_soc.h>
@@ -250,7 +251,7 @@ static void __init omap3_cpuinfo(void)
 		cpu_name = "OMAP3503";
 	}
 
-	scnprintf(soc_name, sizeof(soc_name), "%s", cpu_name);
+	strscpy(soc_name, cpu_name);
 
 	/* Print verbose information */
 	n += scnprintf(buf, sizeof(buf) - n, "%s %s (", soc_name, soc_rev);
-- 
Thorsten Blum <thorsten.blum@linux.dev>
GPG: 1D60 735E 8AEF 3BE4 73B6  9D84 7336 78FD 8DFE EAD4


