Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61978CCD1A7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 16:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5wSXHZohsaCEhrjQuZ+j1mQRILOZAzer/gVJVPvJ/bw=; b=CrR3gXENpo8eBkl/nhD1f8eW6B
	Fsiopv46Oaou5o1M4E2ynaXxQjcWNMOs1oJ4yA1mOVRdg19jJtlEC1M2xx5JLkBwVS60rTdxKhxS/
	OSzUeOG0poYxs8i7ziTA/1cYwSaoxEPNvtXROiqYTZwhfg9Yn4sC8GmjmQMwJbf36RqjLPM/nNZta
	rT18zWu9JdPOhqc0D/pA5ltjH2SDJ64YdnrSMs6c5mrl3fmFFLNInCr/StW9hMRQC7LW5EnKnIFpN
	njyzixWHfnTTOGc67u6gY258oxKfRDYqoYMp7d/21H+nVirQwNUReUhHQsguLHTitFO0T2gQHAgIc
	xhiQRt/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9n65-00000008OT0-3Hqc;
	Fri, 17 Oct 2025 16:14:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9n60-00000008OPS-2KD2
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 17 Oct 2025 16:14:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=5wSXHZohsaCEhrjQuZ+j1mQRILOZAzer/gVJVPvJ/bw=; b=FFUFOZim1bvF/6KacSRiCuX1sL
	rLLBCjYXmW51GmyVmk9XYQIN+VBjcB+SvRO1Dt0t6V5rum9jYp3xaChJCN4blVGYo+HRKANsqVbYF
	zGokiEYs4J5BYaT9mRpzPo4o4fIyofZKc6lvb8e4Wfu94IzsFdIDMd2yxc2Am29sWVDEQTgX+vmpj
	ZEG4ihlEO0PwKUhaaZ0th7WfgyzquJKILdQKHamF4Fm3grRN0CDAucWcy5vLIBwRR7PO788OZk2Ph
	cv56y6KEz2RSYUWE9Lym6uH7HWiHFIffe2jVdxspVDJcGKuFLIo3KrP3yBbUyGzNlBsQljBPB43Z8
	X/auvvqA==;
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9n5x-00000007jWt-29AU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 16:14:23 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-b48d8deaef9so411234466b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Oct 2025 09:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760717660; x=1761322460; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5wSXHZohsaCEhrjQuZ+j1mQRILOZAzer/gVJVPvJ/bw=;
        b=kD3QzsmrAAIfxKe79QSIGNswrL3oD945TSZBRWPzmTBeVwFWdNQmMnC+QQ6g+eM1O7
         O3ashKKYYszECOurayQ9vy1PEV8rjfrH1PkQdDCp5ehesenF8uCqjMbLYW4uxZtJzL6w
         kachXLlgX3GcPwayhzgQtgZ5zLfRLevX/fc1tur5aCSlvweiH8ECzZU3ND4tsxU81R4g
         LF568HRLjGXs4kWYdHfjFT7VBl+Xmt6tIM4TN+RbGQN8z72ASwNIVxlVGzoPr2xHVKps
         24bnVz1mJ3l/dpIEt05CVDQ4RdOnTwxG9BANjlKZACSDnoJUdLKemNbj4QYn+ZmI3/bG
         KwqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760717660; x=1761322460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5wSXHZohsaCEhrjQuZ+j1mQRILOZAzer/gVJVPvJ/bw=;
        b=cfsS8wh6Bga1ktfA48w0rDERCSjPVNpgFENeOQdgkmjN84Yo/zMib7eLyn1Nxjaa5I
         MX81v4AEGBW26i+UTdcXhA7FOJFXVIdpeNhhd+o1+XSUFa75e5dgW/ASbOMirvvoAjb5
         ePjMR8YZ+ksuncgSFnIiF0d5d+k0452M8lHWP3XXLjzqMaHUenJ9B1Y0sVDQNLxH1Bwt
         /Wm00nVxRPiflvgv3K62qB1fTWHsOmA7lZNuxIQW7BviI6+ct+RXKd2iehxaFzTbClNz
         QDs4colXQ29gcW0TPVkxCj8RXweQ/dl6/0F1mq7WeKZE/haFLJxNL6u33ixg+wu2nMN2
         c/lA==
X-Forwarded-Encrypted: i=1; AJvYcCUCmpH8idVoouNLdXIvY2M5kc2eJzQ8RRImUn8zzU+p6TKkXVW1LPTaF66y61daNI4Q8KmWCy4U/guPUi9frsQd@lists.infradead.org
X-Gm-Message-State: AOJu0YzqhkYKTgN+wILW6CJvZY7Z3k/cDYuYLs2TJwU1MCuIncGZiswt
	LdqekM9oj1V1taRT3yhSvKsyGLSi8keEx8/QnXxlN0tzM2hpEQGdi8UL
X-Gm-Gg: ASbGncvGGlGhQH101BXygGC6I0ilRK4K0h148LcjA+Yv2ptjvKB+4JCHThpK2X02B1B
	5ODEbuPy/DguSLmi1yMlqYqkTTN5Olbf+c/cLMSGinF8EBcj8Nx2dXxnaNfy8lPwDLLzXR8GcmL
	y/4vQqKvpvgjoGp/e7QiDaqZmFTQoV9+V5KOoZyQbbOFZjS3BUMHCtCdHVCJ8ygl4KqsU3nb0Wj
	eqZGdoGiWqaAfacCWvtKGpyMblgcCb6xiF+wQUoUgDgcI+EkxkF0wxBMq7eL8np8DuCZMdX5uo0
	45YG4i55eNamUn8nmMzxW2Y3NpbN6WneMEIiAN+OxSQmIVPKL3UwocaKROTtYOPrlP7DW9mhQrj
	AAQDc1o4UUvsVDBm91mtvCpq1Sq4aat59UGmbCjsYJyCJwdF5YqLx70kPTmTj+qlJIXinuS+RkX
	06V5+2/GvfCEdcmM7MDJ9HTeuRXBQVKaBziZ4fTJXg2Akei00y2uQ=
X-Google-Smtp-Source: AGHT+IHeWvwzswQuS89QqwrkWJejRaA0kdyn1cZQjqE82QizymMChJ/7f4qYNAhj2tOmrYVSNDAksg==
X-Received: by 2002:a17:906:c116:b0:b1d:285c:e0ef with SMTP id a640c23a62f3a-b6471f3c342mr512675266b.26.1760717660204;
        Fri, 17 Oct 2025 09:14:20 -0700 (PDT)
Received: from ivaylo-T580.. (79-100-18-255.ip.btc-net.bg. [79.100.18.255])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb036706sm9606466b.41.2025.10.17.09.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 09:14:19 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] clk: samsung: clk-pll: Add support for pll_1431x
Date: Fri, 17 Oct 2025 19:13:32 +0300
Message-ID: <20251017161334.1295955-5-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251017161334.1295955-1-ivo.ivanov.ivanov1@gmail.com>
References: <20251017161334.1295955-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_171421_661695_AC1D3EA0 
X-CRM114-Status: GOOD (  14.10  )
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

The PLL is similar enough to pll_36xx that the same code can be used.

When defining a PLL, the "con" parameter should be set to CON0
register, like this:

PLL(pll_1431x, CLK_FOUT_SHARED0_PLL, "fout_shared0_pll", "oscclk",
     PLL_LOCKTIME_PLL_SHARED0, PLL_CON0_PLL_SHARED0,
     pll_shared0_rate_table),

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
---
Changes from v2:
- rebase
- add r-b tag from Peng Fan
---
 drivers/clk/samsung/clk-pll.c | 1 +
 drivers/clk/samsung/clk-pll.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
index 3c7333529..a509180a7 100644
--- a/drivers/clk/samsung/clk-pll.c
+++ b/drivers/clk/samsung/clk-pll.c
@@ -1544,6 +1544,7 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 	/* clk_ops for 36xx and 2650 are similar */
 	case pll_36xx:
 	case pll_2650:
+	case pll_1431x:
 		pll->enable_offs = PLL36XX_ENABLE_SHIFT;
 		pll->lock_offs = PLL36XX_LOCK_STAT_SHIFT;
 		if (!pll->rate_table)
diff --git a/drivers/clk/samsung/clk-pll.h b/drivers/clk/samsung/clk-pll.h
index 04b3fe97f..eddc4cd08 100644
--- a/drivers/clk/samsung/clk-pll.h
+++ b/drivers/clk/samsung/clk-pll.h
@@ -53,6 +53,7 @@ enum samsung_pll_type {
 	pll_1031x,
 	pll_141xx,
 	pll_1419x,
+	pll_1431x,
 };
 
 #define PLL_RATE(_fin, _m, _p, _s, _k, _ks) \
-- 
2.43.0


