Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92EA6CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 15:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EctQdPK7/HV2BlXTQK2FpJXbDTj/G2Ge7tqo6AYQOpk=; b=o5ql8pi+2QLZIibCry6RJa7zw8
	OA4cKAYsFJkKIKOMHxOgV7OgSpj9qrB6F18LTauuw2PnJqbBhBpo244Hp9f+BFs144oPZlmzRgmGC
	m9WU9zTo6wPM57eQbHfeXo++W1ippE2hOZiiqAPo4BeltrxyRUAYGCsy7fqjkNi/75KzOzRObqe8v
	HNtf7nP9aH6xSEZ3iKo1yTwBcF1RlxSHwy4Sp+pQaj6CLL0Vm6O1Z6JDbHLoMH2B/x32k7IUP1s24
	jsCm/jxTvMqpPWL1guIX/g5xuntZVTfiHXE4QrixxBE9C3BkyMVbfbz0F7t+21OKM9Z1eMidmdXos
	ZnCVv2gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vArn0-0000000E7ns-007K;
	Mon, 20 Oct 2025 15:27:14 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vArmx-0000000E7nJ-0H9i
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 15:27:12 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-471193a9d9eso40113995e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 08:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760974029; x=1761578829; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EctQdPK7/HV2BlXTQK2FpJXbDTj/G2Ge7tqo6AYQOpk=;
        b=JF7Sv0fKnTbZqYQd4Ijx9Wzv/U4ESvUMTO/EnOgY67S6zp+QjnX2TvB397EamqCUkS
         YuzD98p40HSzRii9O2/lG173lbRYfZz6SRs8Y+Bn3iCjp28+GCra/KUaxoMxh4X2tRWZ
         sgU0KhJbcSGllIJwQtdBPimlQh/wCOOlfYzphlOdWVa6GKZfyFC362BDviNSEg/o8oBI
         N0BLJV9LmYh/uVV0OqYpLfp9QM6W36brFQDMx0CZFUTCBFWDdNBFmuC1Yl5n7765octH
         CQO2kikAMH1KxsLvLI5wr+e/0WamNhu4+peFMZtQ+W49ZqWMmXBp5NrEeOjF4EsyuQe3
         z5dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760974029; x=1761578829;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EctQdPK7/HV2BlXTQK2FpJXbDTj/G2Ge7tqo6AYQOpk=;
        b=KIvRzIF5T2O9U4+5B2m3dOTBeKfXYHhT6N4TdMNLx/CvlLhmZ4UEOZX/SopcwceKJp
         UMTtTq8EC43+ECNpHrvQh2NxOAq+bYOSHir6Kn4LktnHe2AGWyhmdpf8DbJ9uTE5Wb1X
         1QcTh3NOcdAhPhIDoOfeaL9YgrgTVUgM5f/sXMhUL3AoogJlHiYogu96YYOAK/dMwvuF
         yG4/ZA1qLdkVbwIVHnjMUyAA54cK886uVrsbOizG92fSvylBovnLui0e2YPKEfDAbXg6
         g3MJo2fk06FkLo1mo6N+F+JZcdtiUx5qmY5y53SaaXSG9PCK8kaYBvuMUPdBz2QxZA/X
         Rh2w==
X-Forwarded-Encrypted: i=1; AJvYcCVpx+KCUQ5c/hhb2LHWAV3iByVjGKc9kprxzkaHJMN+mQPl6iW7hYvNzh7h+qVZBMmnCM6myZFFkjp/adu7eHye@lists.infradead.org
X-Gm-Message-State: AOJu0Yxh9FGDe+yt7HyWdOOvChrEcTk4Qnp/yQny+eZ1H49ta0JYxOx3
	928db5Tj9xlPYaDMunqpjONErg1v9o1IjibFkOEu14sFMis7ffFQClcP
X-Gm-Gg: ASbGnctUZOtkoToaGWRsHhG7MHoSO36KmkLCAzmZ83P5cM0XoX6tVvxfIe0apjJnKqs
	ndPwvUyIIwkaa2gpVyjaWEuw9gPtpRgE5la/A5LawMTvIlqUoJah/3vHTZbzByn7EvSdBsycI8k
	ZEIPRbQESjvChpiJCEVzeuXoCi1dCDbRBwL4KuYW/q2X21uRqUe0cbniW3c7+U74P+AfCP6q6UR
	ZvvauUQa6OKrzEuqOmc+8kMdB66ydrA0D0RLi/lylxr/nUo8CVpooxmhdRR1OiSnzi7y1CKHLcD
	WtwAKlg8pexlVab6WTtXCAu0aJfAZJTg5bcvS0PlZdw5sYxje5X6biLf8+wPbpLtuJDg5SxHvZ5
	D1HkF3WPdFyB6nz+ELuYyzKgNJ4MIBsGQtXL+vrN3YpvUtYQgv6MsMsXIAiI6yz5iSOx7uOMUIK
	bdMyC5r8N3l7F18EwVIoQuT2eP1yWa+6hVjQZq5H20SnNEt4UPIRKhIVi+jIDlqYZ9p+EX/Cv/9
	npY
X-Google-Smtp-Source: AGHT+IFdnScd3UAa6FYvms7Mk8BD0zHKLaPHlgHblA0Aa/pK4mTEeu3ZIirJn6DvinarmuaN/TRYZA==
X-Received: by 2002:a05:600c:4507:b0:46f:c55a:5a8d with SMTP id 5b1f17b1804b1-4711787276dmr102704965e9.4.1760974028776;
        Mon, 20 Oct 2025 08:27:08 -0700 (PDT)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4715e4e267fsm64723995e9.12.2025.10.20.08.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 08:27:08 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: wens@csie.org,
	samuel@sholland.org
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v2] clk: sunxi-ng: Mark A523 bus-r-cpucfg clock as critical
Date: Mon, 20 Oct 2025 17:27:04 +0200
Message-ID: <20251020152704.4804-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_082711_109670_245A79E5 
X-CRM114-Status: GOOD (  11.99  )
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

bus-r-cpucfg clock is important for peripheral which takes care of
powering CPU cores on and off. Since this operation is done by firmware
(TF-A), mark it as critical. That way Linux won't interfere with that
clock.

Fixes: 8cea339cfb81 ("clk: sunxi-ng: add support for the A523/T527 PRCM CCU")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Tested-by: Andre Przywara <andre.przywara@arm.com>
---
Changes from v1:
- fixed typos
- added r-b and t-b tags

 drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c b/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c
index 70ce0ca0cb7d..c5b0d4a2e397 100644
--- a/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c
+++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c
@@ -125,7 +125,7 @@ static SUNXI_CCU_GATE_HW(bus_r_dma_clk, "bus-r-dma",
 static SUNXI_CCU_GATE_HW(bus_r_rtc_clk, "bus-r-rtc",
 			 &r_apb0_clk.common.hw, 0x20c, BIT(0), 0);
 static SUNXI_CCU_GATE_HW(bus_r_cpucfg_clk, "bus-r-cpucfg",
-			 &r_apb0_clk.common.hw, 0x22c, BIT(0), 0);
+			 &r_apb0_clk.common.hw, 0x22c, BIT(0), CLK_IS_CRITICAL);
 
 static struct ccu_common *sun55i_a523_r_ccu_clks[] = {
 	&r_ahb_clk.common,
-- 
2.51.1


