Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97D70C4451B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jul 2026 21:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VhJl3YkYSOoC4SqmTcp6WH/00PPU77CFhgqYr4GFFyQ=; b=dtieCehpuIk+NSuPSDEBNkGg2R
	CBNbLP9defMM8u5okC9ETkVlK3xLftvAVeQryN9F8rxy6Fjlp3pNJ77T77JV+q9vPBmVNE1/ncHXt
	sTYX6BN2jV7S6e5jVh0tG8kxtE6XQyjRigpmgINIWJRNAnb2ihRqOGvmD/HIE29M2gLQjuqLPn3/Q
	CP4WvLe1eOU6m4Nt9PCqac1cSK4IU/Uy5Vvz0Rgh913gfsGtVybhWqUld0ofADc4qbTIIntDgdoDX
	cXytB20oA29tyCadEVuX25snWdHh67xS1dYwrYW9Gqe+Mp61uMNq74uKg+5PBTDXmrSg/NSu1UxmM
	sRxiIl8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlZPR-00000005OkA-0pm2;
	Sun, 19 Jul 2026 21:50:53 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlZPK-00000005Oiw-41GO
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Jul 2026 21:50:48 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2ceae1ed204so71693105ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Jul 2026 14:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784497846; x=1785102646; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VhJl3YkYSOoC4SqmTcp6WH/00PPU77CFhgqYr4GFFyQ=;
        b=YzljrEozvmsFHa6grXXFzk063Fe08GQUHGG+aYMFTtMXjPA9PnFuoisqRC/if3AVvj
         4m+/ODGdaDMH0TSR1xyawRLO6+U1igtaVx0nfFrUcleAOG1nMV22P2AaUEn8ilrFIYv1
         VOR2TRaBJ0Gi6HsbpwQE8pk8LTVxlbg1DIYQ0IJo4BY08OlVV6QeVjrGaRw18eRjEPG+
         dsLAfibAF0du52E6kQWxqJnNTyZdt/6TTP6u8jMsvhyF2w5J4dtFQCXauSyMSGo+3Bgb
         YcTfwjNR1DF80bzzjLswvYq5auAJaOs+U9ALxrp655kYvszbGnSXnWCHJf40a2tVaSvJ
         b+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784497846; x=1785102646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VhJl3YkYSOoC4SqmTcp6WH/00PPU77CFhgqYr4GFFyQ=;
        b=DsOVNZ1nOalPCUX4PBQvbki8snpWNuvTYaMGoEyJScmws3ZkXFLVBcv7FUzv1Ci6tG
         W+xuT9mru1jXSvLEtdeV7qBMVFFOBtLIKUYEdt7B0KxVesDf6wg4Pn/zwWb6yWUYloOZ
         gka2HOB/r792x8L7/REUb/3if26LaCD15GkOixp2VLp9cn+L1abEEJIo2Fa+tPl/5XW5
         tr4yw3VMcNh3eHyaekyMNrhpGOL/A5qP2zjUy4jECTraVwyGj6Dh4adYtQzphVSuwCnt
         6RdK1TLzmD/h+SWOalm8c4Rw2V0uyIGxnRm3fctFmyG3N1tZmvcs62duo2tUx+tmpH96
         Tn/A==
X-Forwarded-Encrypted: i=1; AHgh+RogFe9cjKMVrbwfsB/zx5QhbF+l5fF4FE0EGvqrGX7O+GPHPOffjuwPkze3Sn75vn9bezXr5rweM1x0cAy8zhCv@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+kFT4vvd18zPxdXYV4h3EqTxwG1ZuGYr3u3Gphyczcg1vpVRI
	+xXACRm6gCnWZGJYu5chz1o40v5gdSyT0XflrJAEIDkcVwghdbPbHFQl
X-Gm-Gg: AfdE7ckhpaFiwR6UPXZHZ8BkniR5RHZALuiJgGKUwwZl1dwfNRDzFE79xEzJrUseZfL
	BWH1lpLu1Mh3z0wJ83mbd69gUwnznZ5bMTJxSaGqZOK+eEwOd/ghLyRVcwlIuqfice1Z920x6Bk
	RSpLKmYuXASg6UxpeWxL9C5LwQ3EcLXGoFBmyTlHkI/iuxFwhLyD/JASYK6cDV6A2DbqG+fP6gC
	VwLSDk9MQpajJ0JbTlRb0SzpI4N7M3GaShsjO6zsYE9wuMBssFOHRN2or33mDcxIWXzEBid1fSq
	8neb2gRP0Sxs+RIAln+XlsVa1HsaWCPxIo4DuZqL6IzPiXc51q1Bj+HkbcRoPHnFR7M7nmYhuOb
	JcCK1nGF7+E6tJXNe/Xny6kHrJght/uEaFgDJH7CdsS+MxdXOqhUoI3bnGXK1ZuAU5Fyiwi1IRk
	sRFdw3LxJd/JMenCuLxMOhXC2IWoT0fs0qKX+R2Qtpl7MZ6DeqvuGwwD2U2mE3hXhQgWIed8M7b
	SnwPDuQ0XU3EBD8ftAFIOkeBY+GsCQHDwv+lyWzuYI4RYp1Zlk+mSU=
X-Received: by 2002:a17:903:a8f:b0:2ce:a600:6022 with SMTP id d9443c01a7336-2cf34850c21mr126436495ad.7.1784497845982;
        Sun, 19 Jul 2026 14:50:45 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf344b78e2sm44745845ad.24.2026.07.19.14.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 14:50:45 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
	Nicolas Le Bayon <nicolas.le.bayon@foss.st.com>,
	Alok Tiwari <alok.a.tiwari@oracle.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32 ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/STM32 ARCHITECTURE),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCHv2 1/2] clk: stm32: add missing bitfield.h header
Date: Sun, 19 Jul 2026 14:50:39 -0700
Message-ID: <20260719215040.767232-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260719215040.767232-1-rosenp@gmail.com>
References: <20260719215040.767232-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_145047_018194_3864B808 
X-CRM114-Status: GOOD (  11.06  )
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

It seems some ARM header includes this and the build passes there, but
nowhere else. Note that the driver has COMPILE_TEST in depends.

Fixes: 37ae8501cdb0 ("clk: stm32: introduce clocks for STM32MP21 platfor")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/clk/stm32/clk-stm32mp21.c | 1 +
 drivers/clk/stm32/clk-stm32mp25.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/clk/stm32/clk-stm32mp21.c b/drivers/clk/stm32/clk-stm32mp21.c
index c8a37b716bd5..bdb17419908c 100644
--- a/drivers/clk/stm32/clk-stm32mp21.c
+++ b/drivers/clk/stm32/clk-stm32mp21.c
@@ -4,6 +4,7 @@
  * Author: Gabriel Fernandez <gabriel.fernandez@foss.st.com> for STMicroelectronics.
  */
 
+#include <linux/bitfield.h>
 #include <linux/bus/stm32_firewall_device.h>
 #include <linux/clk-provider.h>
 #include <linux/io.h>
diff --git a/drivers/clk/stm32/clk-stm32mp25.c b/drivers/clk/stm32/clk-stm32mp25.c
index 52f0e8a12926..eb0bc918ecee 100644
--- a/drivers/clk/stm32/clk-stm32mp25.c
+++ b/drivers/clk/stm32/clk-stm32mp25.c
@@ -4,6 +4,7 @@
  * Author: Gabriel Fernandez <gabriel.fernandez@foss.st.com> for STMicroelectronics.
  */
 
+#include <linux/bitfield.h>
 #include <linux/bus/stm32_firewall_device.h>
 #include <linux/clk-provider.h>
 #include <linux/io.h>
-- 
2.55.0


