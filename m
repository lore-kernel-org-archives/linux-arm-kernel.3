Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F78CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 09:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cPH4Dt9LC8zmN5YywximTfS/LxGtIse3pZkHAnoKBEk=; b=ET9HGIRQ5+Ucu7cQSh+TArAPsV
	kcjytH+6AFwiUNQqPFqU0ZbabhP95UFFbnCpbqcO7zPUvD1VdXEM36EPn4rVuJVl6MI2MOzrCG4ua
	Zd4kDFsFiNBTWb59N1Q/l7Z5mWHNJ+kouYbkyFakP+QDiBIVSTLKo3Frs6z1xX+uuxYGIIR2S7/kS
	9VpRkspc5e5DRnm3Z2D0uBptCJyIBQzRQB0jKj1JFVgeYRnlLxTVM/QFDpJTCz8nh7Ml2wxlX5vhg
	ElVNwuD7yjRA9Ym4V8cS2WfM36v0ENhKdDXrFXMChIhB+pcn8Wp9qfX0yVIFnI7FVf5/A8t0QOmQW
	FoT0Y+ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up1nj-0000000GTB0-1m1m;
	Thu, 21 Aug 2025 09:41:43 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up0H1-0000000GBBa-3HnF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 08:03:52 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-45a1b066b5eso3115675e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 01:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1755763430; x=1756368230; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cPH4Dt9LC8zmN5YywximTfS/LxGtIse3pZkHAnoKBEk=;
        b=LnnpPVeLjMTrbMjoKFY2JEv00szC5kbYdoH5PqIKhvD4O6Mztx3XTiB09IzV+pFLA4
         MZSnAuGbMSESxR5B5wPSO7xVinj5m1Oi7fhLeiRnFKrzL6YMR6Pqg4oVCyhzc8K05vmW
         4L1EyHlE1+jSYgojrTcvrg6pZwW9xtcuOe2l8gsyDuYebAuSz04i6MbkzuL8HTNSZnjO
         0SVeZr/shSJGs1t+dsYDwCyG0voVhGJ6U3wtcPf/yII+3bnG7XsWbhRfP/rfak9OfPoX
         BetSFwjcSKaLO7A6RQ1jvzWc6727nsjWChzZkdOABudJWGpSiYw5HMfe950E3+wIGVKK
         DS8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755763430; x=1756368230;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cPH4Dt9LC8zmN5YywximTfS/LxGtIse3pZkHAnoKBEk=;
        b=Z12C9nv4kjvUsRPYBarMZywrF3E4VMxMTCju6tWoFABzjce5rTfCUrNnMe7QdLrJT4
         yQamBcxVeIWgpNAXDt8M3ZO9Vii7AnY0Y/V9yl9pi62bUAb0g3vOOg6NqhqyQ8HPZfeO
         3hBjBsYKEvr6UyyMG+tdA0l6uQ9OOXrfiLgHyCt4G5aaOp8XB6MFLy8IxQhjj+AIWOI8
         DobkY0WbSKoG55pd5f823xLe6YRPpnxDCInVzdD5qvm4cqBlr8FJCHfyXmCJAgs8LcUw
         LfpapF2LyE9d/n1UDpPKofyqt24tqAd3HPCH8TfMaQJrNB5wGOoiRHeZB0q1MulBDBXe
         j9uQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2iQgcljESAB9l5XYpvFabaLQzvagGr2A25xNvNWhWnFzAXTiAx1vIAYAMC6dDoUIuUFkJEjUcH4TqN2BydVDW@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4rOm/Ww7ikmSpMYJnEIIsgm9o5AxLlCRRZJdLUkAoGQM3loyf
	b7nbtl+DnkGX+ZIxHGCg+BeGjQCjj130dyF+Mq3ZK0fy+vrnWIPRxNYVCL7Z7yitkyo=
X-Gm-Gg: ASbGncuive2XL2NDbzU0Of/CoVHhGpoT+T+I3HjvC4cjRc89c/x4WmdVvMZ0VD3FW2H
	WpXUhV/LthYQZd/CSQLfAZB0LfROdPyC4iRiha24MITMo4jgoNfxr2l26G1AIdKEy3l74CVmwB3
	lShUqjzby+T0Zg5jE20MhRGLd7B41BVbkJWmbQwvLXXMQGfwzXB5YT0YF0JTf06Y8geI9b9ghZp
	g/XFy2iJUFkUnHXiY81sfgaDeBkIzpRVag13N4/j2n7422KsRCvPHPbaFJZgS2tWuafKSpcuj9d
	UziaXSsld4mOA21H37qdMyp9Cj0hxCJete0xNM4V9k2q5DWnJ9QfrC2VkX+wM2J7vDaSxq8Yz42
	ueXbfmwkCZyeAFm8PHxhegCADlU5Gm5AdZVk/6aV3LrVGG8rwPpk=
X-Google-Smtp-Source: AGHT+IHHm8Lchn2zvhRJUg1fgGzuxGz8KFFfOq4sSoyn5I0S9lKsbcJu4rnRhc/hWeaHsuyWmyDFzw==
X-Received: by 2002:a05:600c:3b19:b0:456:496:2100 with SMTP id 5b1f17b1804b1-45b4d84e6f0mr14634375e9.31.1755763430131;
        Thu, 21 Aug 2025 01:03:50 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b4dc155b8sm17356225e9.19.2025.08.21.01.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 01:03:49 -0700 (PDT)
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
Subject: [PATCH 0/2] clk: renesas: rzg2l: Disable unused clocks after resume
Date: Thu, 21 Aug 2025 11:03:30 +0300
Message-ID: <20250821080333.27049-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_010351_821356_41C77785 
X-CRM114-Status: UNSURE (   8.91  )
X-CRM114-Notice: Please train this message.
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

Hi,

This series disables clocks that remain unused after resume.
This is necessary when the resume process is done with the help of the
bootloader, as the bootloader enables various clocks when returning from
resume.

On the RZ/G3S SoC (where this series was tested), the bootloader enables
the SDHI clocks (for all SDHI modules, of which 2 are used by Linux and
1 is unused) and the clocks for a serial IP (unused by Linux).

Testing was done on the RZ/G3S SMARC Carrier II board.

Thank you,
Claudiu Benea

Claudiu Beznea (2):
  clk: Export clk_disable_unused()
  clk: renesas: rzg2l: Register PM notifier to disable unused clocks

 drivers/clk/clk.c               |  9 +++++----
 drivers/clk/renesas/rzg2l-cpg.c | 24 ++++++++++++++++++++++++
 include/linux/clk.h             | 12 ++++++++++++
 3 files changed, 41 insertions(+), 4 deletions(-)

-- 
2.43.0


