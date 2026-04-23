Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B1F1FDEE2C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 17:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CejOpA//3B3kzcTx9lKKsdGKFOGdh+bbMIAHkF90ZqU=; b=4EsO2OVL7ScMbbgZctEgxJj1Kh
	0kppv07mnGlmmsSFoOGU28Uzkq+a90e5QVApcrxU5wDSKwpyf3YYZvMPZmAnpO55mJxU5/WGI1JMd
	7rRQT0PZGp6yOpiOY/l+PHDwwrb2kQQQR/Xbym5ThqkbHjse7a6hXJUrB/x1STR/th4Zg4hGk5W+b
	gqAsM5u7qFx8usCMdCRxZUfCjOALINoLVqFYpJfiIkd2vGH+QT17J6tR7R1Jh8XTj7jYkd3vuXbib
	I2vRFlhUb4Fxp5EzVlELbl4RbpTOygtp5or9NR8yMbcv4o5+8P9nLM0tmehJA3qII4Gs5vcgjEcJ9
	tADA/AKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFxZo-0000000C0rb-0qkP;
	Thu, 23 Apr 2026 17:10:56 +0000
Received: from out-172.mta1.migadu.com ([95.215.58.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFxZi-0000000C0ot-2iv7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 17:10:51 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776964239;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CejOpA//3B3kzcTx9lKKsdGKFOGdh+bbMIAHkF90ZqU=;
	b=AcR4FlIG1BitGu/ksaqQjCF19k1k9vA05DlDdCWnvxq2kLzn+fTJBSIjeOVnpUSRp//gdk
	LKutjOAePt0LOXeFVmB65molXyefy59DfIa61zL3svgymZ2PE1PVzzuyp1avo9f9JbWBUK
	WQhUEef+nKO1YAs0A7Wl6o/rYv/rk7k=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] ARM: OMAP2: clean up string copying and formatting in omap3_cpuinfo
Date: Thu, 23 Apr 2026 19:10:19 +0200
Message-ID: <20260423171016.275157-7-thorsten.blum@linux.dev>
In-Reply-To: <20260423171016.275157-5-thorsten.blum@linux.dev>
References: <20260423171016.275157-5-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1112; i=thorsten.blum@linux.dev; h=from:subject; bh=S399qPfc3fYtVnsML3wnwFnGAv4N5R2jCgRwqlNXILs=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDJmvgipFmPW2nVmc1n5j4fk3119wtHDHGtxrCiotOBb3w oAv7WllRykLgxgXg6yYIsuDWT9m+JbWVG4yidgJM4eVCWQIAxenAEyEpYPhv8uG/pXXD3v3LZu/ qPqggq+NaGfZf2lNu4nR8dYGPvElSowMq59OE1/9cPKBtWyuU49dk7qp35318sHjvfx6l/MFucq C+QA=
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_101050_843229_475801AB 
X-CRM114-Status: GOOD (  10.22  )
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

Replace scnprintf("%s") with the faster and more direct strscpy().

Remove unnecessary and inconsistent 'n' arithmetic when 'n = 0', and
when 'n' is no longer used at the end of the function.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/arm/mach-omap2/id.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-omap2/id.c b/arch/arm/mach-omap2/id.c
index 25ded74e4b01..126ffd87f572 100644
--- a/arch/arm/mach-omap2/id.c
+++ b/arch/arm/mach-omap2/id.c
@@ -255,7 +255,7 @@ static void __init omap3_cpuinfo(void)
 	strscpy(soc_name, cpu_name);
 
 	/* Print verbose information */
-	n += scnprintf(buf, sizeof(buf) - n, "%s %s (", soc_name, soc_rev);
+	n += scnprintf(buf, sizeof(buf), "%s %s (", soc_name, soc_rev);
 
 	OMAP3_SHOW_FEATURE(l2cache);
 	OMAP3_SHOW_FEATURE(iva);
@@ -265,7 +265,7 @@ static void __init omap3_cpuinfo(void)
 	OMAP3_SHOW_FEATURE(192mhz_clk);
 	if (*(buf + n - 1) == ' ')
 		n--;
-	n += scnprintf(buf + n, sizeof(buf) - n, ")\n");
+	scnprintf(buf + n, sizeof(buf) - n, ")\n");
 	pr_info("%s", buf);
 }
 

