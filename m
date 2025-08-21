Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6A74CA0EF8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 09:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2XjehKGt2s9Iw0S60/WJtSyoiI8bGy2dbzPpshFFO9Q=; b=RQOpr3TMvYyIYXopnhMsp8tiVY
	IAcOkzN6CJJMgpvBYiWTHw1GbESTB6ewJKjWXsU8VXXsDcrb55BL35yrwnB8Ma8W5oRRC8dGelhj5
	GM7KcWIdSQ2qwvqQDRlMtHeI8dMj5TYlMblLkTDQpnc+GWTHAu3a5KrGl2NmWDmX1MWYMKJQRUDVY
	OTXxTVrcBbrk2L4utoem1iITpZNSGjdXycVCn842CVTYkwYJ5ERw3fmftoGWJVseIHoHbqAr5UVrn
	8QvKNzScBMJ+1y+kiZWJGzXjgHSqFK9aVhyZLwtIx3H6wFy0Zs+5WMSjYuSnSCpltgfQtCBzr968Y
	vItdMmHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up1np-0000000GTJ5-17v7;
	Thu, 21 Aug 2025 09:41:49 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up0H3-0000000GBC5-1nRs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 08:03:54 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-45a286135c8so9052235e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 01:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1755763432; x=1756368232; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2XjehKGt2s9Iw0S60/WJtSyoiI8bGy2dbzPpshFFO9Q=;
        b=Bk2fL9mxIdywII786LDvbTkBx5vMKp/9ag6sLRVRvaJwraDiGll61BJED/0FpRcPpc
         jS8FPvGT+YSqfoH1WfWX0f10B9MB5/Hu6arqndz8STLNpejtNa+IU+wKzAF1oeX0aCH3
         aJM4C3A8Evzy7S8XTuLw1gf5pknCQtR05Ml+CedNpkF+C2yQt0AlVGDx8TluvY7OjzLX
         hKqjLYmNYRXicTln2s1eLR6jqHfz09CQEJJVSk36J421uUV4yEPniJR43BHmKEIG35JH
         pTe+xiY8yiS+kTpqoXS+G4fZzWSqd7M61tAv+sJGjrPWytOXjsmRmRx0ZQJP12Fy1qxi
         fRrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755763432; x=1756368232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2XjehKGt2s9Iw0S60/WJtSyoiI8bGy2dbzPpshFFO9Q=;
        b=LBn4Cz6wol5Gy6zdV+mw/BwuO98oK5EvAe1xJFl7na2nLJGJeNlZacYSOwEmJtjv0L
         hTiSIhwjeM7QSzQthKpIBl0FQKl783fnIok/UuzvZgNEXzCeCcKigLrXR3Ng/akiVqL5
         mxALCyccXHYtdQBQv/SwPow0PKmAykdnOlTbgdCI17fR6aRjYQTslcIe97IXHg2FNHeq
         MamGZLp/3Mgg/hwv8VitE4K3bTooK7tEpUjWDuEiEr3Svjg+a4kgX9y+b9A0Wntc6Bje
         Yujltwdz+AF4wcasrUxmllkcoKeBH1PRvkPp40hDHuVp84FG2FEXOIVCtSfLh6o0iMNc
         wSfQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4e08TThTa1UgzQOT/ysF3gCxAVuRypIVLONEJMGm4UhCwUbpD6yUmdM7/XKkh/gHYZscY3FP8d5Cp6a9Yi1DB@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6kdeDTDauoALrWP4FMCRBAgIwutx8Gy+p8uVTtBrqWWltL94j
	6bb///azjiBSGZHn4HDaneXbSBcEpGgke7wNa67npxy71MsvlYvhufT4BhXmg8qgm/U=
X-Gm-Gg: ASbGncuc+fZUQ8PbQLyKDnlLYfRfVw31xRoj/b5h+Srv7ZQR8SP6ezl4+x0SKj66ZQ/
	u8A9nXA3x94UeDFwxgNdZI6/sfrwO4LXZl4v6wbMUe25M1Z/CqCEj30xIJchufvNzldWPURPeoe
	VccxTHfcuQXDUtOl7coljSNxvyiQVTWM1r/xc18G9D07RHcaE1EwSr60JHGvZAEN+9oT7hG9dOB
	pvi67t4TDr+2XTTC6ft9ovWpEXLvewW8HqzZiFEY2Jadj3HCRviwa5Fok+4RkZt+dZXYPU2kg4I
	JtFoqQqwexs1JhcLLFCM99iik1SanY2YHQLbM/YNVYO0CqkP57iQR+fkarHqezNuSTQjBm9nGWh
	k3KHI7+DqZkUxZUI3yJJE3FQv9muOYDM/7efqNj8zUWBnJGAlSUA=
X-Google-Smtp-Source: AGHT+IHc431XLCYaF8pLi9lptfBNKV1wKndQFd3h8KySRGUYBaDuLZGptDhbLDqZIqPusEPqY1JIQg==
X-Received: by 2002:a5d:5f56:0:b0:3c4:9c59:52e2 with SMTP id ffacd0b85a97d-3c4aec25ae2mr1116773f8f.7.1755763431534;
        Thu, 21 Aug 2025 01:03:51 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b4dc155b8sm17356225e9.19.2025.08.21.01.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 01:03:50 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	geert+renesas@glider.be,
	linux@armlinux.org.uk
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 1/2] clk: Export clk_disable_unused()
Date: Thu, 21 Aug 2025 11:03:31 +0300
Message-ID: <20250821080333.27049-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250821080333.27049-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250821080333.27049-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_010353_466254_7C7C7D51 
X-CRM114-Status: GOOD (  16.21  )
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

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The Renesas RZ/G3S SoC has a suspend mode where power to most components is
turned off and RAM is switched to self-refresh. Resuming from this
low-power mode is done with the help of the bootloader. During resume, the
bootloader re-enables the clocks for the modules needed in the resume
process (e.g. SDHI or serial). After that, control is passed to Linux.

If Linux has not probed a driver for one of the modules enabled by the
bootloader, or if the module was previously in a runtime-suspended state,
the corresponding clocks remain enabled after resume, even though they have
no consumers or they were previously disabled.

To avoid keeping these clocks enabled unnecessarily, make the
clk_disable_unused() function available to other drivers. Drivers can then
call it during resume to disable any unused clocks.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/clk/clk.c   |  9 +++++----
 include/linux/clk.h | 12 ++++++++++++
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index b821b2cdb155..5278030b0ad8 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1460,7 +1460,7 @@ static void clk_core_disable_unprepare(struct clk_core *core)
 	clk_core_unprepare_lock(core);
 }
 
-static void __init clk_unprepare_unused_subtree(struct clk_core *core)
+static void clk_unprepare_unused_subtree(struct clk_core *core)
 {
 	struct clk_core *child;
 
@@ -1485,7 +1485,7 @@ static void __init clk_unprepare_unused_subtree(struct clk_core *core)
 	}
 }
 
-static void __init clk_disable_unused_subtree(struct clk_core *core)
+static void clk_disable_unused_subtree(struct clk_core *core)
 {
 	struct clk_core *child;
 	unsigned long flags;
@@ -1526,7 +1526,7 @@ static void __init clk_disable_unused_subtree(struct clk_core *core)
 		clk_core_disable_unprepare(core->parent);
 }
 
-static bool clk_ignore_unused __initdata;
+static bool clk_ignore_unused;
 static int __init clk_ignore_unused_setup(char *__unused)
 {
 	clk_ignore_unused = true;
@@ -1534,7 +1534,7 @@ static int __init clk_ignore_unused_setup(char *__unused)
 }
 __setup("clk_ignore_unused", clk_ignore_unused_setup);
 
-static int __init clk_disable_unused(void)
+int clk_disable_unused(void)
 {
 	struct clk_core *core;
 	int ret;
@@ -1574,6 +1574,7 @@ static int __init clk_disable_unused(void)
 	return 0;
 }
 late_initcall_sync(clk_disable_unused);
+EXPORT_SYMBOL_GPL(clk_disable_unused);
 
 static int clk_core_determine_round_nolock(struct clk_core *core,
 					   struct clk_rate_request *req)
diff --git a/include/linux/clk.h b/include/linux/clk.h
index b607482ca77e..7eb0e5eb9aba 100644
--- a/include/linux/clk.h
+++ b/include/linux/clk.h
@@ -950,6 +950,13 @@ int clk_save_context(void);
  */
 void clk_restore_context(void);
 
+/**
+ * clk_disable_unused - disable unused clocks
+ *
+ * Disable unused clocks at boot or resume time.
+ */
+int clk_disable_unused(void);
+
 #else /* !CONFIG_HAVE_CLK */
 
 static inline struct clk *clk_get(struct device *dev, const char *id)
@@ -1136,6 +1143,11 @@ static inline int clk_save_context(void)
 
 static inline void clk_restore_context(void) {}
 
+static inline int clk_disbale_unused(void)
+{
+	return 0;
+}
+
 #endif
 
 /* clk_prepare_enable helps cases using clk_enable in non-atomic context. */
-- 
2.43.0


