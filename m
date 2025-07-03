Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79F85C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 22:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9OzOvhq3GmbvaBtGUgAaXSZiV6ZbsCylTW2ygbBRF/o=; b=idLUZeQE8Z+/WR9TszQxO52K38
	8N2y4f1obd5RpC/zuu0+eZxXVN0SfEO38RVgPdrDwxLxT1gYnCYZ/V/uPssU9qLyOIEWnZSEFs6gW
	pCUaUPryrewZolRW5GPM8GHmwf9YtPpCEcfs3+PDWrxhs/kLfwJb8brv0kZYnnh6lBMBEPqycRJf3
	SKEp1K7QBMiKzYT+1ps3sfdPsCZYzVWSD2UcLGakwcg1xj3qjGspFXGueRzIwpGmhNlFXywdL7Mgq
	GayIh3Pk4IcYr9Ffc99NfAS/TQnOYwiyGtjDY0gqBnndbqviOM9S8mv0U6+x1f+baKZ4mx1I+59aS
	WnrtPUAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXSNq-0000000Cj3x-3YmT;
	Thu, 03 Jul 2025 22:26:22 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXOxj-0000000CH0I-19pG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 18:47:12 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-7424ccbef4eso308259b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 11:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751568430; x=1752173230; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9OzOvhq3GmbvaBtGUgAaXSZiV6ZbsCylTW2ygbBRF/o=;
        b=S81o9Udiuy1CkcDJe35EdxMV0JWHa0DTibREJIxtVdhpf3/kLhoQ1NxrA6hpGwsCE7
         nk0I2b9ZU2q6fQV78cL968KpL4axz9O38iW5i8APbvdQ1YYChuNVellVfa0tIbRcGBtU
         onG4nW1YfR92qzPT0cbyGXw9af9BMjhdzV2iCB0jslf86eYcJnW0iTdRICZ7kZEaz1K7
         NHdkbvdqyOsFOWk9m6QHRkKdWk51XYRf2WlJpp2X9UcBMlI0Vt7asivgqVEy2iXPYpF+
         W8hfbPNXZMJe/QwTRo/H4pkg9sQx5UCfDz1ZAtS3QZQiVE3jX/j0PUlMYk+SshLirgei
         w/hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751568430; x=1752173230;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9OzOvhq3GmbvaBtGUgAaXSZiV6ZbsCylTW2ygbBRF/o=;
        b=mza+n88D5ZGqeGJ8ovidM/R9HjAqqBteJlOXv7rXJmqrjbXoXE+ANPDebhZzhOTGTb
         IBlSi63mCO+JRW4dZPbYA/+3OBrFJpeA9XiizPEfs75c/5vbePow+ggo2bPgVNQLa0n8
         Vs2O+GQhPaViXeoOE99lrL6R9rIAtd88Nzb0kpNWlIQhLgGYnGQ6ao3Ab9ZK0Kl7maY2
         WZFRAKbn2yqjTvMcHFbd+gQsO4USsDsJ02/+LxvQB9hLqLfbNrZ6yz3Bz8tZmLTqOBeJ
         i9c//cdbv75ZY7HKZj5zaZQfkMXy8VeDDG3Cogk+JSmMZ+0ZPJrJ3S5qX8CJNCpHqPGr
         GR1w==
X-Forwarded-Encrypted: i=1; AJvYcCW6pMEANb1MJDIfllnv7VEH0tARCpCSMMC26GberwnhFv2ClhSgx/acbfnlzUP024tFgRCwGHkdXAXrZ0fgfcc8@lists.infradead.org
X-Gm-Message-State: AOJu0YxIiwjAVQcFs3L+DW+tiP2A9ruNaVS+PZw6zMKjlOGCIgPjBqF+
	tdIzrjdJ4hQGWsudYik+NtH8UWk2NnXm9j1tW9nK72PayAxYWcDFrHUX
X-Gm-Gg: ASbGncsCJqQmF5B8RhpU9VJ4BsVfXKsD+uygKn3GmtHJ5T38I0B5jQu8s/Cm7YpAUBu
	4olIV+LbPvZYR1NQmwqlOcEIpGj3ukEwIHasB9mXOLrDDgTw10TPCpuUQqC17o4zn1VmB7qb2Kd
	aMJAMmYdNfvekCxlMSqqzT8Q2To+vn0+hLO3s/IZuZR8tnWS+XTBN0sAxlg6ZASbM9Po4hxykvJ
	6Bun+1F6vG7mNU0UqeDkqbkKWpDaYcHunNYSH99eBxDRSBczRA8V05+mVHq1VEYLWKWI1roO+It
	vr5Ng7ejN2zKMao5DvSg8PvymEa9/bukf+DD4uMdW3kEZFRv5njt+HZ+wd9mmxvKJHOVZPNvNHv
	8sHH9n4ZvGKVEnWuNHw==
X-Google-Smtp-Source: AGHT+IGGdSrO72xn9qTSPHgCp+n9DyMAPuvEbKUXrsvqwInd/blTS202ynaZjuZx54FTS1JJgB0QIg==
X-Received: by 2002:a05:6a21:7a47:b0:21f:4ecc:11a9 with SMTP id adf61e73a8af0-222d7f08449mr14018200637.32.1751568430070;
        Thu, 03 Jul 2025 11:47:10 -0700 (PDT)
Received: from ak-workspace.tail730999.ts.net ([2406:7400:63:5144:cefd:59bd:c444:e2b1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce42cefccsm193739b3a.156.2025.07.03.11.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 11:47:09 -0700 (PDT)
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
Date: Fri,  4 Jul 2025 00:16:59 +0530
Message-ID: <20250703184659.3110-1-akshaygunari@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_114711_314470_98CF04E1 
X-CRM114-Status: GOOD (  10.85  )
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


