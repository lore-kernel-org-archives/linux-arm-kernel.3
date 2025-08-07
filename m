Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB024C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 14:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9OzOvhq3GmbvaBtGUgAaXSZiV6ZbsCylTW2ygbBRF/o=; b=LyxkTjrJUbXx/uGezBJw1if0Ei
	5ijB1JDo6fx5bj0euOtAKTEPsOunWx0/diGW2YyPTJX0RTD2LH8+awNzTAFQL/9vxQf88zyzwWIbo
	gHk//hYVeevyd9XJkCN19OeJDl/lDoLts6UZXsh4eNjftvosezppN9eeObdD2P7ipzh5ak1j/QXfJ
	S+oQGaJza8dv47kwNsRpQMPwIwQ7FvqF9nujSiu8nEeu8Xh61vkpqFo4MEL5ZsTWpzTTvwKXs7Ib2
	025v6lcg/xJEpMRa3zfn0iuifpyhho/gW3gmInHVU4718kXx3IKI39F/6hqYLMkWlmmgOgvrZPWCW
	x1N4g1Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk1yB-00000000shg-3Vur;
	Thu, 07 Aug 2025 14:51:51 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk1ug-00000000s2B-2lLS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 14:48:15 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-31f1da6d294so1040977a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Aug 2025 07:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754578093; x=1755182893; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9OzOvhq3GmbvaBtGUgAaXSZiV6ZbsCylTW2ygbBRF/o=;
        b=CtLsQRtKWvwGdX+7eGYYct23yfvEBWW62pnY2rK7LLrjqp94kP28lzqiJSnvNKTp9q
         aYCCpHdLpWyNQuWhJB3jO1BXY0XaqfxZ/38E43x4tAces+4j9hYe7bP+ujx/vZxCVE1J
         JeoRJcbwVtzr1V1Mo5RPukJrx/nZueOMC+usYYgIhea3NAgATSJnZp+PuTQmaiLQ1ZpP
         H3+7TI8wbAbe8GtEE44JTrYNJG3Ej9IdkHZugmMdIQ29KztOYzHQaDPexl8UCc47NJHp
         hckYdW9TjDoONJZj03rs425yGr4so7oqMjrSMqxaKa39Gr3sbH+YwhKLnninPl1m9ZBV
         3bqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754578093; x=1755182893;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9OzOvhq3GmbvaBtGUgAaXSZiV6ZbsCylTW2ygbBRF/o=;
        b=QEhMolEMbkN5CoKel+9iUVeXxqEuF4Sf3Av7a9Ris3OuLkpb9ta5A2/Qa+I6iVvUHZ
         L0ypbCkBje3QzOATJAWiuOBcJvuGYPDGxE8tMsI/ulDjvPTAGNEFwCM9ca9QAc/OFX3C
         u87trDLd8lb87dvRLG58c2clNoxqBfLq6TRkJ3P677Bq+my50C+DGk/8frQVbTiXBJTs
         jtvfLmxQiV6lVfbeNYkdGxLnQXaaGe3Hbt0nV6BH9FW7pjMNxKuD/oxfSiUgT93pNp4m
         gY/dh2Fad8JfhS4oNhufSDR//lz34kes5q5zwOxcXru2eteIYBm/XKMTgUWPOof2J3nL
         tzOw==
X-Forwarded-Encrypted: i=1; AJvYcCVnaJR6bzo+1gxrzitzH90bFTZ9PNbgBCwieC1b+izS8Qf6KStIsOhA9H4tnOUW681KicHo76eIX+TRYO5Vh6tT@lists.infradead.org
X-Gm-Message-State: AOJu0YxfOSXqiJb8HSGM8O2CdrDMkydEGrdq5HpTK//DZK4/4hHYtjbX
	za5sAuN6pasHdqT+xR2LtAjZuEQImTNC7c7+eylneabEkWWoBDYOIe5K
X-Gm-Gg: ASbGnct7KacOEcl9eSV2iWgXkP7iQAnrBk/smD4EgKsyAgnxiAuX7Ow0CKvi3Ayfxxj
	K0LfoBHxCpB+Q9NdZgIWY4BfNZJfrwJKng057nv+ifybsBLBirCUuwkoIw3TiMByk0DfHnT7Ac8
	zpJQSrmjh/VLIZViqFrOmlc99Vf3QqQbUBrfQUhmRXAaAQovFOM6AL2d1qVPDewvLY+X3mVwAkZ
	Gu+OOr5pJTf7U3afOjOtICRMlpUbw9TzOpNvqdwmoVGGoztzOZWhg4pglzy7Nf6CcEKDayHXgYz
	PI2PnWUxsnCcMuCJIrN8M2Daam0Jvy/kz7C+ayIryewNnSgPiVh5SJWOZSxW+yjhNB15qU97BKp
	NL9Rk9siSdWSVlVupVbrx1zrVHT1jdjI82uh/+GlbF5LyjaSfZM9S9yM9OkgaWLw=
X-Google-Smtp-Source: AGHT+IHwaoMkTzcQeF2yNTgw2rwq0sXC8TFuiy0D0JP3G7qyIazfprxaglxJAOwviDiPYZNxs0iaeg==
X-Received: by 2002:a17:90a:e7c2:b0:31c:15d9:8aa with SMTP id 98e67ed59e1d1-32166cd17a9mr9149630a91.34.1754578093407;
        Thu, 07 Aug 2025 07:48:13 -0700 (PDT)
Received: from ak-workspace.tail730999.ts.net ([49.207.200.134])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31f63f36311sm22574230a91.34.2025.08.07.07.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 07:48:12 -0700 (PDT)
From: Akshaykumar Gunari <akshaygunari@gmail.com>
To: corbet@lwn.net,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com
Cc: linux-doc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Akshaykumar Gunari <akshaygunari@gmail.com>
Subject: [PATCH] docs: arm: stm32: fix typo "busses" -> "buses"
Date: Thu,  7 Aug 2025 20:18:05 +0530
Message-ID: <20250807144805.2179-1-akshaygunari@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_074814_697864_1D52EE45 
X-CRM114-Status: GOOD (  11.02  )
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

Fix the spelling of "busses" to the preferred form "buses" in STM32 ARM
architecture documentation.

Signed-off-by: Akshaykumar Gunari <akshaygunari@gmail.com>
---
 Documentation/arch/arm/stm32/stm32f746-overview.rst  | 2 +-
 Documentation/arch/arm/stm32/stm32f769-overview.rst  | 2 +-
 Documentation/arch/arm/stm32/stm32h743-overview.rst  | 2 +-
 Documentation/arch/arm/stm32/stm32h750-overview.rst  | 2 +-
 Documentation/arch/arm/stm32/stm32mp13-overview.rst  | 2 +-
 Documentation/arch/arm/stm32/stm32mp151-overview.rst | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/arch/arm/stm32/stm32f746-overview.rst b/Documentation/arch/arm/stm32/stm32f746-overview.rst
index 78befddc7740..335f0855a858 100644
--- a/Documentation/arch/arm/stm32/stm32f746-overview.rst
+++ b/Documentation/arch/arm/stm32/stm32f746-overview.rst
@@ -15,7 +15,7 @@ It features:
 - SD/MMC/SDIO support
 - Ethernet controller
 - USB OTFG FS & HS controllers
-- I2C, SPI, CAN busses support
+- I2C, SPI, CAN buses support
 - Several 16 & 32 bits general purpose timers
 - Serial Audio interface
 - LCD controller
diff --git a/Documentation/arch/arm/stm32/stm32f769-overview.rst b/Documentation/arch/arm/stm32/stm32f769-overview.rst
index e482980ddf21..ef31aadee68f 100644
--- a/Documentation/arch/arm/stm32/stm32f769-overview.rst
+++ b/Documentation/arch/arm/stm32/stm32f769-overview.rst
@@ -15,7 +15,7 @@ It features:
 - SD/MMC/SDIO support*2
 - Ethernet controller
 - USB OTFG FS & HS controllers
-- I2C*4, SPI*6, CAN*3 busses support
+- I2C*4, SPI*6, CAN*3 buses support
 - Several 16 & 32 bits general purpose timers
 - Serial Audio interface*2
 - LCD controller
diff --git a/Documentation/arch/arm/stm32/stm32h743-overview.rst b/Documentation/arch/arm/stm32/stm32h743-overview.rst
index 4e15f1a42730..7659df24d362 100644
--- a/Documentation/arch/arm/stm32/stm32h743-overview.rst
+++ b/Documentation/arch/arm/stm32/stm32h743-overview.rst
@@ -15,7 +15,7 @@ It features:
 - SD/MMC/SDIO support
 - Ethernet controller
 - USB OTFG FS & HS controllers
-- I2C, SPI, CAN busses support
+- I2C, SPI, CAN buses support
 - Several 16 & 32 bits general purpose timers
 - Serial Audio interface
 - LCD controller
diff --git a/Documentation/arch/arm/stm32/stm32h750-overview.rst b/Documentation/arch/arm/stm32/stm32h750-overview.rst
index 0e51235c9547..be032b77d1f1 100644
--- a/Documentation/arch/arm/stm32/stm32h750-overview.rst
+++ b/Documentation/arch/arm/stm32/stm32h750-overview.rst
@@ -15,7 +15,7 @@ It features:
 - SD/MMC/SDIO support
 - Ethernet controller
 - USB OTFG FS & HS controllers
-- I2C, SPI, CAN busses support
+- I2C, SPI, CAN buses support
 - Several 16 & 32 bits general purpose timers
 - Serial Audio interface
 - LCD controller
diff --git a/Documentation/arch/arm/stm32/stm32mp13-overview.rst b/Documentation/arch/arm/stm32/stm32mp13-overview.rst
index 3bb9492dad49..b5e9589fb06f 100644
--- a/Documentation/arch/arm/stm32/stm32mp13-overview.rst
+++ b/Documentation/arch/arm/stm32/stm32mp13-overview.rst
@@ -24,7 +24,7 @@ More details:
 - ADC/DAC
 - USB EHCI/OHCI controllers
 - USB OTG
-- I2C, SPI, CAN busses support
+- I2C, SPI, CAN buses support
 - Several general purpose timers
 - Serial Audio interface
 - LCD controller
diff --git a/Documentation/arch/arm/stm32/stm32mp151-overview.rst b/Documentation/arch/arm/stm32/stm32mp151-overview.rst
index f42a2ac309c0..b58c256ede9a 100644
--- a/Documentation/arch/arm/stm32/stm32mp151-overview.rst
+++ b/Documentation/arch/arm/stm32/stm32mp151-overview.rst
@@ -23,7 +23,7 @@ More details:
 - ADC/DAC
 - USB EHCI/OHCI controllers
 - USB OTG
-- I2C, SPI busses support
+- I2C, SPI buses support
 - Several general purpose timers
 - Serial Audio interface
 - LCD-TFT controller
-- 
2.43.0


