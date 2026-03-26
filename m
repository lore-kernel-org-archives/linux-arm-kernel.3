Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FB2C109E529
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 04:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XljdsmAvu2M9cVCCjFds2jX6qIm7BiRW226a6zw+6M0=; b=Eq7rR7mSI7dM/iz32L2Bdlim9v
	oGrnMJ/5QBKzLV8XnaEAbrtJRUoSNBZob6/W5BPLvKFN8k3sGd0B1X6/t0XflO4ZlxzhSJiJh9Lwy
	ZEIpT9PsH/q+6ShwJDrFVtPjLhkmMFCRkvrZiQ18lARUqPtSSPGN9PEvz7QQDTE8lReuYkyUyJZE9
	aVHwa4EVOc1XsH9SDRn4QVIq5+KD9CA2Vad5fW4jfH+m19H59VwVirfjYzVhxw549C/9eqJlRsd3E
	kFDsrMYt2GT/+08+odfeE65Ui+e0v78JHdG9zzbjit2mGAeSQ6reHDX1VbAb9ZUMslLIpIH6Hj6ml
	/t39yo3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5clV-00000004hQb-2vC7;
	Thu, 26 Mar 2026 04:56:17 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5clS-00000004hQ1-3U2j
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 04:56:16 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2b0ba3bfe16so6988105ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 21:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774500974; x=1775105774; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XljdsmAvu2M9cVCCjFds2jX6qIm7BiRW226a6zw+6M0=;
        b=rHLLjjfZY/LM4Qj4nH7IgF+Y4lwWK/0rrPw6enK/IDL/fZxJ4Y9d0q0BTt1OUDNhVi
         dt4qY0nZj2sPOyUOXcr/WXKftWNI85U5iZ2zPIvwwixizjgopYJxC4j9dAa0gsxboaTo
         EA4Vl1ikLfSLT0LsN3W1GhdnkQEWxbsLusOC4bGU2jy5bA2L6S2bmNnlHuaVJFL6eOux
         s3GQZL+UoEHnCGsjwYggv718Km8RufsHx29ViJoC7Qib7n/mvQzxTnR5FH4n7dbriqxT
         gvcf/t0CwhXndDwo0exmsvMU3oknWUzmVpJvShCsrQSoyPX46r3ynSVh77b81DwiyKoQ
         iqCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774500974; x=1775105774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XljdsmAvu2M9cVCCjFds2jX6qIm7BiRW226a6zw+6M0=;
        b=krHL5O7JpWaSoIFp3hGbXTlxAD5ohQJ5NpsbcAMKs8nmfjBfCdHn4/xwnYP+n3rMVL
         er+I9fXkGw+osSeZeXV5ljaC3XB+NLsYSXOSNquhtdcAeLWYdq/TFK80BFR+vMyqfHN0
         P6oJ5Mm6avFSAW9fohv7SxDA50akrVWtaAPxjPh61zX3oLufAstYX+ba6tKN83W7GdrL
         sp/7czmHSw8QO8mRL0HfLm4asuDuOXvlyL60VPpyEube3GoDXopetksrDMvp00Cm3JFA
         3gEs3HeQNkU0/MMtBzJ4M2v5AcVaf3esT8f9j4sEZcr9ftHFfhfyj/C7bse/ohxKb8k2
         pp+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWSdkNrC/Bt6LHuy/hvH5BfJEgx0Ela6ZTQYQGABYUKeYBs9JcxbhqWIlCCdt4XKKE1ROp7LVQAoZDtVJeg1E8U@lists.infradead.org
X-Gm-Message-State: AOJu0YxRx8bOjomESHV1yjALD+ZwufozHtowdaLW8bziIrRjBeumddq1
	0wFq5yQlCTBhnomdgOMWYXjdPtsVS/Kn5LelNkthXZSnO1jDh9/Uj412
X-Gm-Gg: ATEYQzyoB98mKTMRdjLxMrmA3YBm2k7TlONaYdIAsWDzTog78TG8UwpvUr7tZvNtITc
	NJAWWPOffclhQMC3hQ84y6BjYNCVUErFM2qez/Ly5wVIf68mRm2EtqfPJvx30rsrm+GZTYAn4p9
	8eb7rw6yjzYh5DMtcy0NuYVp8RkdOlX1nV+l5IPUw9mULh9etCVm55G/ypdZzpgsteSKUORbl4B
	ea4FCrTJTT8rtwcLoXbahwKOIQI0hwZy5MzDiHfCTwfR8/An78WQEGDB1DeSoaeQfaUhKAGtMlz
	O85MMAFONbIUovPIiANUsICh5MckJQ5tMqaQLfH1prRpW+kIX/BHYdTS8B7ub83C/6h5NnOSyVP
	FxzCd9r8/zD5eR9mdQcYyuBIzKBBB5Tj52HwamaMlR4cXPIcYNXF//9Kk9Kp0UXh1CxJtV+6MVP
	Gpp/k2/3sSsMteyKmoAIS1kufmesAHkBLBAT/yQ4twqSd2KjDvS3INEIU=
X-Received: by 2002:a17:903:b90:b0:2b0:6365:217e with SMTP id d9443c01a7336-2b0c48a7f32mr2334785ad.15.1774500973771;
        Wed, 25 Mar 2026 21:56:13 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc7b8adasm20087225ad.33.2026.03.25.21.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 21:56:13 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,...),
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCH] clk: kirkwood: use kzalloc_flex
Date: Wed, 25 Mar 2026 21:55:55 -0700
Message-ID: <20260326045555.240730-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_215614_877975_584D8420 
X-CRM114-Status: GOOD (  12.61  )
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

Simplify allocation by using a flexible array member and kzalloc_flex to
combine allocations.

Add __counted_by for extra runtime analysis. Move counting variable
assignment to right after allocation as required by __counted_by.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/clk/mvebu/kirkwood.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/mvebu/kirkwood.c b/drivers/clk/mvebu/kirkwood.c
index ed061d82fb65..fc2972538008 100644
--- a/drivers/clk/mvebu/kirkwood.c
+++ b/drivers/clk/mvebu/kirkwood.c
@@ -253,8 +253,8 @@ struct clk_muxing_soc_desc {
 
 struct clk_muxing_ctrl {
 	spinlock_t *lock;
-	struct clk **muxes;
 	int num_muxes;
+	struct clk *muxes[] __counted_by(num_muxes);
 };
 
 static const char *powersave_parents[] = {
@@ -297,21 +297,18 @@ static void __init kirkwood_clk_muxing_setup(struct device_node *np,
 	if (WARN_ON(!base))
 		return;
 
-	ctrl = kzalloc_obj(*ctrl);
-	if (WARN_ON(!ctrl))
-		goto ctrl_out;
-
-	/* lock must already be initialized */
-	ctrl->lock = &ctrl_gating_lock;
-
 	/* Count, allocate, and register clock muxes */
 	for (n = 0; desc[n].name;)
 		n++;
 
+	ctrl = kzalloc_flex(*ctrl, muxes, n);
+	if (WARN_ON(!ctrl))
+		goto ctrl_out;
+
 	ctrl->num_muxes = n;
-	ctrl->muxes = kzalloc_objs(struct clk *, ctrl->num_muxes);
-	if (WARN_ON(!ctrl->muxes))
-		goto muxes_out;
+
+	/* lock must already be initialized */
+	ctrl->lock = &ctrl_gating_lock;
 
 	for (n = 0; n < ctrl->num_muxes; n++) {
 		ctrl->muxes[n] = clk_register_mux(NULL, desc[n].name,
-- 
2.53.0


