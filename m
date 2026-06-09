Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50BC0CD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 02:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pJI9CahXJjJULtLK0KUB7o46AGmYjVAvw4WBv+i+U6E=; b=ZZDSDdusJ8dkjMpQO4Xv7nS5KW
	dI+dl/eBb4rc6BRCFJHVKyKO4HLVBwVSMOcckD5Nen50tEzkJvKCg6zqnvVWnPJgcpg0wEBU9xhWv
	1uvOvxJmMShFGZv3mNsUMMXGv+K6gviGvylxN484f3gF+TGgvO/oagu+yOEwzX7bVgKPrwvKHWGhX
	O4/7LFDgjhal8QotezIBY7Vv8xwrWxdGMY1JLde16PyR7mavZwYZWAAnYFFobIudwIiIVVOX3+z/W
	3B0Uh0OO0gRs55tFjQRNLWDmPGViyh3frfPs4s12SsD+DwyCc46cCN+/lI400qE+bNfx525jQn7q8
	TXnqjq2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWmcR-00000004eRi-16dV;
	Tue, 09 Jun 2026 02:55:11 +0000
Received: from mail-dy1-x1344.google.com ([2607:f8b0:4864:20::1344])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWmcO-00000004eRH-1DRA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 02:55:09 +0000
Received: by mail-dy1-x1344.google.com with SMTP id 5a478bee46e88-3074adb8fcaso8478328eec.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 19:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780973707; x=1781578507; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pJI9CahXJjJULtLK0KUB7o46AGmYjVAvw4WBv+i+U6E=;
        b=dywPFNhatbI4Z6t6WL+wrLl+5GH6z9PGKKuOV4Ja1mh4mwk1kZCitcW/uzHN2bl6ec
         +EQvW6ErG1UPR5q3MVIDF4qn7rDwROu0zpj4ZBqGYUSBYjNvG3saF8h3Zu3+R29VXVx7
         tfGUcEEkujD3lCa8h6ZeKgn6QIeo0WSNefG2Em6vnBadINLs4hX12yAecZJEOGYPtLzV
         PIzE0lHd55ZBQvyku8u+SnHBBboOdqmmw6g0pdLjTHoOShHx2cV3Myu96BBdIAe7yu4W
         2958VXPMWWFr1j2EOHwt9diY2UAeh8iVP32PPnFMWy6aK+v9EzmDPW/dWmUQ3UxQ/aZm
         6HtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780973707; x=1781578507;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pJI9CahXJjJULtLK0KUB7o46AGmYjVAvw4WBv+i+U6E=;
        b=BPtlEhwz5ESErJ61cn7V8LD1At3j+KD5R/IGO+HLDwkJpxMrlLBNfWEcHT3SckXfjH
         gIp2i1owGFtfFQUzSGtDgX8CuW6fNLbsBgjDbA0Nt7ZN7TGnr5Ph0p6SvU+wd/faLNzR
         eSuWpQkQJ84HNZyIyguTIe+1lznbPfvVwy6Cc9yXXj+Mn7DO2/Yh5FlmxXV4At3YR4aw
         brUnGDtoHfAuv/tSfAOMr0cARjjNgXnXbD4APe7Y3L2ZK8czPvnqXvB/VnuF1DxMw9vw
         KdtQCDGRP8BQegbmjVahhj4yY3tAq5r1R6VV48cjN4GrJuPAxrZOHUq9l7rdf/sXH+RG
         b8IQ==
X-Gm-Message-State: AOJu0YyqlIR4YyMoDSsJXZeNTLRVvIvQIejJ/hiYDlSTn9HBt7tLtvYd
	OZqB5iMacIEJyDLqthS+2n+at6fUA/1dsJprCeSPOg57yPHaRGsS22FlEDsRS70L
X-Gm-Gg: Acq92OGf0az4kAAGTS73oKbk6lgu7BqKKTYN3VZgGwFrlOKkzrk1mk/bMbLDW48X/8/
	mS1nPTtMPgJH1CpWeYP0WJLEzNxM+bLtLsZXhsLJcYQtQZ/VSaLn7gXou5IcrXaGo7xPevqHt4R
	bDmHYMQFWodMisUvQGmWjNoVvlq62lrVZnQfMN+LTGB0nflCLPAG+BDKqcKo8+vlzOIkcX8WMF6
	TdURBh7wG64X61iOEB7I+3ovVIFFaADct3Nc8f6op9wLg9yqRZMcwYAR/aFwPJp0sa+fdpP9SMY
	4VJF0W7WuAn1dt024k2c1xxp/YOljYod/Csw/UTsrZVpG29eYtrSz079e6Ucj2f9DIPE026aIGV
	kULmXuZ6oSOQs7uo4++l5Xys52ffNeWKmzNp6D9VPNHc4iIQ5tzFl00BdrF1t4abOI3cj1IUis7
	VQGhCwQKiVXT/cIwRhiYXTJmP8JBzAIDoU9W+29k+6N1/U0WbnnjdfPinFYVxUp5yFJeFbxaenB
	dmo71U/dmp/NpofjWAPXSuiwpXHTq64tuhi34jAl8FkD0V+4+jL4/8plBgC5PXAm5sfLNhPsgDt
	Kw/EpD5BFXYzDQOtFUamr5b8n7tb
X-Received: by 2002:a05:693c:2c01:b0:304:705f:e4e8 with SMTP id 5a478bee46e88-3077b33835bmr11052916eec.32.1780973707366;
        Mon, 08 Jun 2026 19:55:07 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df191d0sm28554855eec.21.2026.06.08.19.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 19:55:07 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-mmc@vger.kernel.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Ulf Hansson <ulfh@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Rakuram Eswaran <rakuram.e96@gmail.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Khalid Aziz <khalid@kernel.org>
Subject: [PATCH] ARM: PXA: remove remnants of PXA93x support
Date: Mon,  8 Jun 2026 19:54:51 -0700
Message-ID: <20260609025458.13744-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_195508_365500_7D0F21B5 
X-CRM114-Status: GOOD (  11.29  )
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

Support for PXA93x chips was removed in commit d711b8a2987a ("ARM: pxa:
remove pxa93x support"), but some code to handle them remains. Remove
it.

Discovered while searching for CONFIG_* symbols referenced in code but
not defined in any Kconfig file.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 drivers/mmc/host/pxamci.c   |  3 +-
 include/linux/soc/pxa/cpu.h | 56 -------------------------------------
 2 files changed, 1 insertion(+), 58 deletions(-)

diff --git a/drivers/mmc/host/pxamci.c b/drivers/mmc/host/pxamci.c
index b5ea058ed467..f8427f071c00 100644
--- a/drivers/mmc/host/pxamci.c
+++ b/drivers/mmc/host/pxamci.c
@@ -43,8 +43,7 @@
 #define NR_SG	1
 #define CLKRT_OFF	(~0)
 
-#define mmc_has_26MHz()		(cpu_is_pxa300() || cpu_is_pxa310() \
-				|| cpu_is_pxa935())
+#define mmc_has_26MHz()		(cpu_is_pxa300() || cpu_is_pxa310())
 
 struct pxamci_host {
 	struct mmc_host		*mmc;
diff --git a/include/linux/soc/pxa/cpu.h b/include/linux/soc/pxa/cpu.h
index 5782450ee45c..38bacdae684f 100644
--- a/include/linux/soc/pxa/cpu.h
+++ b/include/linux/soc/pxa/cpu.h
@@ -46,14 +46,6 @@
  *  PXA31x	A2	0x69056892	0x2E649013
  *  PXA32x	B1	0x69056825	0x5E642013
  *  PXA32x	B2	0x69056826	0x6E642013
- *
- *  PXA930	B0	0x69056835	0x5E643013
- *  PXA930	B1	0x69056837	0x7E643013
- *  PXA930	B2	0x69056838	0x8E643013
- *
- *  PXA935	A0	0x56056931	0x1E653013
- *  PXA935	B0	0x56056936	0x6E653013
- *  PXA935	B1	0x56056938	0x8E653013
  */
 #ifdef CONFIG_PXA25x
 #define __cpu_is_pxa210(id)				\
@@ -126,26 +118,6 @@
 #define __cpu_is_pxa320(id)	(0)
 #endif
 
-#ifdef CONFIG_CPU_PXA930
-#define __cpu_is_pxa930(id)				\
-	({						\
-		unsigned int _id = (id) >> 4 & 0xfff;	\
-		_id == 0x683;				\
-	 })
-#else
-#define __cpu_is_pxa930(id)	(0)
-#endif
-
-#ifdef CONFIG_CPU_PXA935
-#define __cpu_is_pxa935(id)				\
-	({						\
-		unsigned int _id = (id) >> 4 & 0xfff;	\
-		_id == 0x693;				\
-	 })
-#else
-#define __cpu_is_pxa935(id)	(0)
-#endif
-
 #define cpu_is_pxa210()					\
 	({						\
 		__cpu_is_pxa210(read_cpuid_id());	\
@@ -186,18 +158,6 @@
 		__cpu_is_pxa320(read_cpuid_id());	\
 	 })
 
-#define cpu_is_pxa930()					\
-	({						\
-		__cpu_is_pxa930(read_cpuid_id());	\
-	 })
-
-#define cpu_is_pxa935()					\
-	({						\
-		__cpu_is_pxa935(read_cpuid_id());	\
-	 })
-
-
-
 /*
  * CPUID Core Generation Bit
  * <= 0x2 for pxa21x/pxa25x/pxa26x/pxa27x
@@ -218,22 +178,11 @@
 		__cpu_is_pxa300(id)			\
 			|| __cpu_is_pxa310(id)		\
 			|| __cpu_is_pxa320(id)		\
-			|| __cpu_is_pxa93x(id);		\
 	 })
 #else
 #define __cpu_is_pxa3xx(id)	(0)
 #endif
 
-#if defined(CONFIG_CPU_PXA930) || defined(CONFIG_CPU_PXA935)
-#define __cpu_is_pxa93x(id)				\
-	({						\
-		__cpu_is_pxa930(id)			\
-			|| __cpu_is_pxa935(id);		\
-	 })
-#else
-#define __cpu_is_pxa93x(id)	(0)
-#endif
-
 #define cpu_is_pxa2xx()					\
 	({						\
 		__cpu_is_pxa2xx(read_cpuid_id());	\
@@ -244,9 +193,4 @@
 		__cpu_is_pxa3xx(read_cpuid_id());	\
 	 })
 
-#define cpu_is_pxa93x()					\
-	({						\
-		__cpu_is_pxa93x(read_cpuid_id());	\
-	 })
-
 #endif
-- 
2.43.0


