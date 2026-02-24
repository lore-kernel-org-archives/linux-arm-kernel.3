Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E40FF3C985
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 14:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=k32KDyySgUbuIjVNpXCTKNsbzVwcn3SEN2eNfGW1Vc8=; b=40yjb5EYeU/F3wlceUYids3Kro
	7CDqQULs2AoCHONcbrF3mSSulyF/SCUixDembTHm3wMXqRNqcYzXlVl7q6IPf2SU0lFqcz168BVD7
	sWMeZMzjgQm+uyqkGvQJiNcgkR5a0O6gcNN3Jes5eLQe7MjFBMRw+GdnFsiy12h/mW7wrAmls55YD
	Z/kZ0vJg+ORre1BqpDZEeotSnvKWDd6a+RLumRFVrgImThnuki5d+MKP0h8cZHotfqKvKpSveWu2S
	CmxKzUp7BOFr2QUm/bcjS6Vtm3aHvqpJzLfV5/vslK6Kkwj4+b8Y8TU/6vo/Mxji9Tfz4rlrBh+wx
	aK/Q5a0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vutgA-00000002G8z-25mG;
	Tue, 24 Feb 2026 14:46:26 +0000
Received: from out-184.mta0.migadu.com ([2001:41d0:1004:224b::b8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vutg6-00000002G8e-3Q6p
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 14:46:25 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1771944379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=k32KDyySgUbuIjVNpXCTKNsbzVwcn3SEN2eNfGW1Vc8=;
	b=TZ+Lvq3Bjl1uyl+Khx8qDEg3z5NRhBeax5hYW2kYjgGWVVbpxEPWc2YNQFKgPZ0fapxYT0
	/cvmPCLZLbkyej5uElyVyB1ybUrJhsK9C/eQ0Q9q167utnS1JPdoN5wePNHu1BpWH70Pts
	zfMS6dWjC5DQy1b7CDE0iSlio/xsL60=
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
Subject: [PATCH RESEND] ARM: omap2: Replace scnprintf with strscpy in omap3_cpuinfo
Date: Tue, 24 Feb 2026 15:45:51 +0100
Message-ID: <20260224144552.585272-1-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_064623_555889_AA5C925E 
X-CRM114-Status: UNSURE (   8.70  )
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
index 43f5944850e6..cf2bfb447ee2 100644
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


