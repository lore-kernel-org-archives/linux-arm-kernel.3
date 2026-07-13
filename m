Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CA16C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 19:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=z+xB3TUCO9UrjdGLJb+39sEEHPhvQQhEnyMJTNd+wdw=; b=uC5pVvl73qZhKQnS3cEeJ0HtQ2
	x6uUuPIOLGbI9VOJQc12lG+k/loemjPhqRkyJ5w4GGQ5oJ3pt7XTNMtYwPtBJXXsG1OVic1NNShV6
	at9c/byai88x1p81+mGJ0dF6g5f7x+xHdoomNPZaCz9rjsOk1f0Hq6F4Hu/CQ+Df8jz4dMu7uvxLl
	lcZHCMYb+1txgqXd5XLPiwA/bFb+mfzlARiVSIVfw+VU4wB8BhgBEWXJikePJ2kyuEC+c/MPqCUzo
	2u/VZf9o5AuJ+OlM9a1hG3b3O6NMJUvR7gGOqQp7TXDi4ysEZSRl/+8UDmyYTq+IKTTJQIBonJERR
	yzOPyWZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjMHE-0000000AHZE-0hWv;
	Mon, 13 Jul 2026 19:25:16 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjMHB-0000000AHYL-3ZOx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 19:25:15 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-493ece78b0cso26176595e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 12:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783970711; x=1784575511; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=z+xB3TUCO9UrjdGLJb+39sEEHPhvQQhEnyMJTNd+wdw=;
        b=c5fjGIuhE36n/n5fIqsxBF5lokpGAolPVSzUqgeqhYbV3Eaz8DtnLYf1H7vw/PpmYN
         CBhcgzooZeWlDTnAg7qI+a6s+zINWUfmPGVoqZoqtXMfUi1F0YASzUR6Pc5wX0+VlUHf
         TWZe5TVdRrwI9IM0yrbB++LhReTKoG52bVJM4XHM63s2fiVR5aA2W/b1I08jPpQZS/DK
         NnhxC6YjwPBGxiV6qejfBPzOz+wy53quopCTkGSA7hKb6dozqfbuRdt28hiOqnxPylIY
         2rCednUX63qbGlOsy1x4yLAX+jDf87wTHi+j3clMySHWoQfiigJGznMuJbu0ip1xeUl1
         IDhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783970711; x=1784575511;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z+xB3TUCO9UrjdGLJb+39sEEHPhvQQhEnyMJTNd+wdw=;
        b=fHPCAMLksxdOPLoylqrT+UVaPso0JF3DfV6Jt390y8dUIoJ7wT1UhFstR80hFgdcrA
         Y7+RHuW0/QOzXNqIEE49EaFVKtkfeTVkLKB0/OYNoJTEZ64aOsCWFCmsdXUVt2X9XPuj
         cLHUxSp784RpvEQB3pFnRDZq5w/S3joKyBNMN2T7ceEvq2NxgZuMA50I5EgWawjotee+
         E/oiFT38+SICyMRnrtGxEV3izuO3wj/GAxU/Ke0bUwGLUl/2yFk99uuH4clTekuJw87E
         ZVN470/cMaCg0rjCxTt4bONb8Akmlmk06wxmtKzylSiEKxjHwH5zRAVIYm7Fgv/rm7/R
         uAQA==
X-Forwarded-Encrypted: i=1; AHgh+RrT5b3OZ7zfSPInNBnPVvFUVhiM1iezUzti3V8thaQ3Yerffd4XgKb5PJOxoZOEzE1O/tmKVIBpqn2H1nBqGWFh@lists.infradead.org
X-Gm-Message-State: AOJu0Yxo5rCNGP08Jc+tMC9C+PMTt9AhDiblK8DqubxuQLYTHE1/WAx0
	y/l86kKQyw9nQcp4/jMO+c7wgFRpGZxkSg6vx8e7nG6CvKptmKR1OVMD
X-Gm-Gg: AfdE7cm7mnB17DyW5+mYg7uoE+pK8lWEa2XN7jjbmRn4WhduQDB0ZCss9f8eVS739BA
	RvouI1z6x8xSGpXuXOpSxv4ZZ/Yevy/2UJODv4bOEeiJu3eARG1I1V4eykfoTip0I0ctM/yUcu6
	qvNELCDUdvQUndfFhy+Fu/HBAOKW1ihcPHYdL9v8BuqDKI+nHS0a6ErTOCofqzcJna19cA5nsAP
	i4ENl1Mv6zuwBh1Wgt+cqGVsXieNvv7/0Uffsy6zpVrhQTTF70D5xyMlj995fkshjCMWphbz9vd
	zDtF29lE9Sh0lu6z6POJ2453l/Nzyng49gMYM9yaRPMuxO8celzSBV9zXGtfWVBBMdAVPuNslKr
	R1mxrpzcuEq04xJKDwzZnlBrG+e5Q9Lx3kxyH8APynncOUUkeLtPt0TZLrZO2mjW6vCAxEYfJVT
	h74lxNvmGSBnJpdrKSsv+6xRyHtbFEW0iBN/hbjDxq7UmpfGtuOtn+QM/1pJS+fhBQyAg3T31pt
	SRT53X5TdJ1m3oyVGB6K/0QEuycftYkjEZ5pbeaZetifejBqx/ae8a0pET1M13ily3tkk2tqJRN
	DQUjjdb80qJlI8TG/qSY
X-Received: by 2002:a05:600c:6095:b0:493:e983:806e with SMTP id 5b1f17b1804b1-495158c68c7mr8361975e9.3.1783970710468;
        Mon, 13 Jul 2026 12:25:10 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4a7-df01-9434-c79e-9028-76f8.310.pool.telefonica.de. [2a02:3100:a4a7:df01:9434:c79e:9028:76f8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950a322c86sm15376195e9.11.2026.07.13.12.25.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 13 Jul 2026 12:25:09 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Karl Mehltretter <kmehltretter@gmail.com>
Subject: [PATCH v2] ARM: lpc32xx: only run SoC init on LPC32xx hardware
Date: Mon, 13 Jul 2026 21:25:06 +0200
Message-Id: <20260713192506.7782-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_122513_909922_B5922378 
X-CRM114-Status: GOOD (  15.26  )
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

lpc32xx_check_uid() and lpc32xx_pm_init() are arch_initcalls that poke
LPC32xx-only registers. Since the multiplatform conversion they also
run on other ARCH_MULTI_V5 boards where access faults e.g. on versatile:

  Unable to handle kernel paging request at virtual address f4004130
  PC is at lpc32xx_check_uid+0x2c/0x9c

Drop the arch_initcall() registrations and call both functions directly
from lpc3250_machine_init(), the machine's .init_machine hook.
The calls are placed in link order (common.c, pm.c, phy3250.c) to
keep their previous relative ordering.

Fixes: 75bf1bd7d2f9 ("ARM: lpc32xx: allow multiplatform build")
Suggested-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
v2:
 - Rather than guarding the two arch_initcalls, drop the initcalls
   entirely and call both functions from lpc3250_machine_init(), which
   is already guarded properly. (Suggested by Arnd.)

 arch/arm/mach-lpc32xx/common.c  | 5 +----
 arch/arm/mach-lpc32xx/common.h  | 2 ++
 arch/arm/mach-lpc32xx/phy3250.c | 2 ++
 arch/arm/mach-lpc32xx/pm.c      | 5 +----
 4 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/arch/arm/mach-lpc32xx/common.c b/arch/arm/mach-lpc32xx/common.c
index 304ea61a0716..35ed3569c5a3 100644
--- a/arch/arm/mach-lpc32xx/common.c
+++ b/arch/arm/mach-lpc32xx/common.c
@@ -106,7 +106,7 @@ void __init lpc32xx_map_io(void)
 	iotable_init(lpc32xx_io_desc, ARRAY_SIZE(lpc32xx_io_desc));
 }
 
-static int __init lpc32xx_check_uid(void)
+void __init lpc32xx_check_uid(void)
 {
 	u32 uid[4];
 
@@ -119,7 +119,4 @@ static int __init lpc32xx_check_uid(void)
 		system_serial_low = uid[0];
 		system_serial_high = uid[1];
 	}
-
-	return 1;
 }
-arch_initcall(lpc32xx_check_uid);
diff --git a/arch/arm/mach-lpc32xx/common.h b/arch/arm/mach-lpc32xx/common.h
index 32f0ad217807..06b20bea324e 100644
--- a/arch/arm/mach-lpc32xx/common.h
+++ b/arch/arm/mach-lpc32xx/common.h
@@ -16,6 +16,8 @@
  * Other arch specific structures and functions
  */
 extern void __init lpc32xx_map_io(void);
+extern void __init lpc32xx_check_uid(void);
+extern void __init lpc32xx_pm_init(void);
 extern void __init lpc32xx_serial_init(void);
 
 /*
diff --git a/arch/arm/mach-lpc32xx/phy3250.c b/arch/arm/mach-lpc32xx/phy3250.c
index 66701bf43248..ddc6333ca55d 100644
--- a/arch/arm/mach-lpc32xx/phy3250.c
+++ b/arch/arm/mach-lpc32xx/phy3250.c
@@ -71,6 +71,8 @@ static const struct of_dev_auxdata lpc32xx_auxdata_lookup[] __initconst = {
 
 static void __init lpc3250_machine_init(void)
 {
+	lpc32xx_check_uid();
+	lpc32xx_pm_init();
 	lpc32xx_serial_init();
 
 	of_platform_default_populate(NULL, lpc32xx_auxdata_lookup, NULL);
diff --git a/arch/arm/mach-lpc32xx/pm.c b/arch/arm/mach-lpc32xx/pm.c
index 2572bd89a5e8..9b5c5e1462ed 100644
--- a/arch/arm/mach-lpc32xx/pm.c
+++ b/arch/arm/mach-lpc32xx/pm.c
@@ -120,7 +120,7 @@ static const struct platform_suspend_ops lpc32xx_pm_ops = {
 #define EMC_DYN_MEM_CTRL_OFS 0x20
 #define EMC_SRMMC           (1 << 3)
 #define EMC_CTRL_REG io_p2v(LPC32XX_EMC_BASE + EMC_DYN_MEM_CTRL_OFS)
-static int __init lpc32xx_pm_init(void)
+void __init lpc32xx_pm_init(void)
 {
 	/*
 	 * Setup SDRAM self-refresh clock to automatically disable o
@@ -129,7 +129,4 @@ static int __init lpc32xx_pm_init(void)
 	__raw_writel(__raw_readl(EMC_CTRL_REG) | EMC_SRMMC, EMC_CTRL_REG);
 
 	suspend_set_ops(&lpc32xx_pm_ops);
-
-	return 0;
 }
-arch_initcall(lpc32xx_pm_init);
-- 
2.39.5 (Apple Git-154)


