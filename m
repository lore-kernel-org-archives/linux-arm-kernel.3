Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 993DDCD5BD2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 10:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GsMFlu4zMM9QAuZhA61CFIpsfkuzQD+bunJ5hQnI6aw=; b=WbKWV55NTLTIeZ8Mm7+6Uv/Y+5
	0tyh5hn5TYI0SIrz4Gd3Q8Zku47o9qqgRZBrajAsG3GFy8sGS3W85A63LYj0yRanZMY9IrcIO3Y5L
	eQPWaWizzgDxLSGQpFvYJqON0wnk0r9/MxtrbmVt6Ito8T2acL/lYOwbxbTwlpltp/+XBmd5EENa4
	VUsMjyT9lw/+fihOPSqbh2MSf6zA1qxjui48vnSP3m3MS16GDlbatyz9Z+pjOKrcvTSQQo5ByrtuW
	8e3I+6PYImhqLb8cJi+gaBYMCSlEkLLFGsfc2QQqlCQ81SGaFfhIeKDP8aWHkO+G40jf90bGqGvpm
	2gvgI4dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRow3-00000001dcu-2SLt;
	Tue, 26 May 2026 10:22:55 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRow1-00000001dby-0YYL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 10:22:54 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-36a35e4eefeso3546644a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 03:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779790972; x=1780395772; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GsMFlu4zMM9QAuZhA61CFIpsfkuzQD+bunJ5hQnI6aw=;
        b=fJ6QHW8XmAx3Batai4faXk9Vh5bNYTWGcrHysa+d5SOVJrptjYNyCN8xTne7H8ITTY
         3zinIxE9A6LT1lHdOCkfPIiP/Yp2fDDGpa59jvZBv6RH1RFxjyNFfRxVrfUQtetVmg82
         Knjo5E41+WxVX2Kj1dpn2+D8ih+/sHUwdqcPL2ZMS341YZNVgcHAQ/ugjh+WEIwSmA6M
         SaDhomEnpjtyZ11UxpxGz5xxgtB3lbRFXoz5c+lGAXaISxggV9WXzpLRZiqRB9Ui5/Xu
         no4hTkwf5DL0sDSBiV7BJeYt9WHOTGVtxoywQnybALGZLAiAmUDdkUxI7genzgwb58js
         9BCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779790972; x=1780395772;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GsMFlu4zMM9QAuZhA61CFIpsfkuzQD+bunJ5hQnI6aw=;
        b=s07yqv9R5dW99QV7xfyBYNd7BJi8CPJkoFewRGHfMJnbew/1NthhWytrhVJ3LL/4qN
         fRiG/1G6a68DuMw8waLBJwuoEMVHQRZKmRJnqSvsmMS1jK1BFjKBYXoEXkRYjPu9tmyi
         VF74q95mM1InACJ6vWjJrCgW0uxI3NLCbbDpNT/2dg2whqHWReJ9OC/0akzk2lV1M2xY
         HnmmrHsmyhfBVsXbqQXFsLk8ZYE9oa/PjuH24fPSsrjPC6TFNUcf2MICzpjZJ/m6FW21
         viFNYB7mr4geWt/cnkeNaINMx5oYZFOCRa1vHZ6PvaFjYDGGJy9OTf205wg8dXuFxf3x
         gGog==
X-Gm-Message-State: AOJu0YwHruttzKQMJrJjJQFG0GocMe6Rb/xBNr7IazHTXiG/LOe8dKfG
	1aSBRVzG5viI+L95s1qva/ojzJFpH2wHtTtxFc5394a2aVaaW9oUmrHX
X-Gm-Gg: Acq92OHb2laZGRWNLx8BTqpV/0iDNWzTyorK+KqT9s/Ijv90fBUJjjw1h+wQTdUTzLB
	HniKE4KXEgtRebgvsuKMUrbiAdsqM7t88M9znfZRWXrhk7Zb26Q8GrQk9pUX9upTGaN3KHyzHJd
	uTHa/PSXMhEVhedbYaPTMhbO6XQH85Hzs9JOuAmNwVBBB+eMl5+PsoSTQsRyKX5dpMv69FBLdtT
	CqIdgl87SUsUSmnNV+YnIrglqPdU0NjJW1LxnLyz3S0HraHQ7OJW6wrJOQI2N3zlfkuAbbnico2
	6E69Inh9Ar+sLv4+5VtBQxOqjWXZdmP47OtrfwNjYoYHD37RvsOQ5OklJdvN7bEbhhHGdbtoOjS
	njVL5pyxVZZ5cGd6mBrqeZXS4OnuHtCeZ2UN2JkGBOWeHTLsTnm61rdV2KGkIuiR2Ka513aGp11
	fZn6PaexqlEGdspvYmjwQ4zYjjAEonP7XaaMA4oiPC+P41RLVypudYCW3glMw1D9BYxBS7D/HL
X-Received: by 2002:a17:90b:42:b0:36a:f382:9f72 with SMTP id 98e67ed59e1d1-36af382a1efmr4718899a91.13.1779790971630;
        Tue, 26 May 2026 03:22:51 -0700 (PDT)
Received: from chaitanya-virtualbox.. ([103.249.241.55])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a71d9416csm16435713a91.3.2026.05.26.03.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 03:22:51 -0700 (PDT)
From: Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
To: brgl@kernel.org,
	andi.shyti@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chaitanya Sabnis <chaitanya.msabnis@gmail.com>,
	Sashiko <sashiko-bot@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v4] i2c: davinci: fix division by zero on missing clock-frequency
Date: Tue, 26 May 2026 15:52:40 +0530
Message-ID: <20260526102240.4949-1-chaitanya.msabnis@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_032253_203737_FE88458C 
X-CRM114-Status: GOOD (  14.67  )
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

When the 'clock-frequency' property is missing from the device tree,
the driver falls back to DAVINCI_I2C_DEFAULT_BUS_FREQ. However, this
macro was defined in kHz (100), whereas the device tree property is
expected in Hz.

The probe function divided the fallback value by 1000, causing
integer truncation that resulted in dev->bus_freq = 0. This triggered
a deterministic division-by-zero kernel panic when calculating clock
dividers later in the probe sequence.

Fix this by redefining DAVINCI_I2C_DEFAULT_BUS_FREQ in Hz (100000)
to match the expected device tree property unit, allowing the existing
division logic to work correctly for both cases.

Fixes: b04ce6385979 ("i2c: davinci: kill platform data")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260514044726.57297C2BCB7@smtp.kernel.org/
Signed-off-by: Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---

Changes in v4:
- Restored accidentally removed blank lines (removed ninja changes).
- Collected Reviewed-by tag.

Changes in v3:
- Reverted probe function changes and correctly applied the fix to the macro.

Changes in v2:
- Changed approach: updated macro to Hz instead of dividing in probe.
- Added Fixes tag.

 drivers/i2c/busses/i2c-davinci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-davinci.c b/drivers/i2c/busses/i2c-davinci.c
index a773ba082321..66c23535656b 100644
--- a/drivers/i2c/busses/i2c-davinci.c
+++ b/drivers/i2c/busses/i2c-davinci.c
@@ -117,7 +117,7 @@
 /* timeout for pm runtime autosuspend */
 #define DAVINCI_I2C_PM_TIMEOUT	1000	/* ms */
 
-#define DAVINCI_I2C_DEFAULT_BUS_FREQ	100
+#define DAVINCI_I2C_DEFAULT_BUS_FREQ	100000
 
 struct davinci_i2c_dev {
 	struct device           *dev;
-- 
2.43.0


