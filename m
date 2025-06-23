Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDD54C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 21:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sXfU9/sKAYBBbGmHQM1w7+6Suw+kwrFKSqlLdXK/Mh0=; b=YqCVFtb1h+ASac
	9mGWT3fZQ2E5Jon+crZCkH3/7y7U83NLgVB8oAPS5lw3HdlWNa6HSM/M1Rxh+vyQj8QoIVQxLTg1X
	EgLqISzpUKQk8OYpeHF/kdWQtoDfXwXFwPJaeTwDDJZ8d3JKW1FFxLVrN6C4+MXo2n//6TwYMLevl
	uauO+cZKAts6WN3qp7HiEs9dVSLgL9AaMJYEIVCpPgIXdvOX+ghK1Q+r24lTxrm083aYwIdVchRmw
	QBmOt4SaW49FssFOfwHBwzPmDu9E3IktfdNnkdHjgmwdaLA1z1eOWVX6gfFy+oPfgxX6LtuQTRV68
	WTQ5tUJ5FVmeSvNPlXhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uToaQ-00000004006-1T97;
	Mon, 23 Jun 2025 21:20:18 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTkB2-00000003SBH-0HqG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 16:37:50 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3a4e742dc97so3232421f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 09:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750696666; x=1751301466; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sXfU9/sKAYBBbGmHQM1w7+6Suw+kwrFKSqlLdXK/Mh0=;
        b=jBC0KtSCOXFgQATQwC8PE2KGDKaJe6JTvCACPwlBU2dHaHGKX+ABl4MJJCqcuReMv+
         lTR+RDmtBqT5p61r8OPG0bdYNF9OmE0Iod8nGNY5foQhBd7UewIuqYJtcwN/D1cjWyTv
         WpeP02NubbHU9atbXLOAQ/+fC3YD9s6xXL222oGPrhka6ieM+CRWghfB6QQB0CvX/biu
         avIfR4efVfJl/6srmbp0asxFwMWfrYanlE+YdxJ8BtX/x9rxri2GfKSUPgdohXyqq7wl
         Uz2ocDyAXaZty7brBUrMzwUO327qsweeK8qdnEQQvoleb1fRuFIQUSWCgwdOUhyBgWW9
         pS2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750696666; x=1751301466;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sXfU9/sKAYBBbGmHQM1w7+6Suw+kwrFKSqlLdXK/Mh0=;
        b=WLTAgbEzTetelbXZgz9DJTQqlXKEs4Iob/7CHMby27ir2XhuTFZ8oDm/lB6Lhl/7xR
         XLiTQ8ASdNyy3U5djqojg3ZoCNOH2vRmayogdB394Kt8hOFZZFZG9kioFmlI9VJot4Ty
         mlEyoxlCDAbxmvuI/GT/bZVUr/jXrEBtFXlC5GZCc+OdUVrc8O/+8CrraKBGpfpV/pgz
         BacZ2HVtbr0Y3iSR3GtAiAYILwouYmxImyNbh1/P9kSqr5tFcwARU148RKFoK4ffczrL
         n8TdzaMHfEGqLkl7W9Ix2H4930vVCA7czeWf3ssZmOSxQAeBQ4NudiPP0LcXFBWffK1X
         xN3Q==
X-Forwarded-Encrypted: i=1; AJvYcCV8S2ntVyMZqtAtxHe4cDbVJtyo8rIx/LHlyxYVA6PwfY5HihxImh02NL6WKxiDHCL0JZwWWI2Z4lNgUYZyA/XD@lists.infradead.org
X-Gm-Message-State: AOJu0YwSFIXvWuedK1UK35K2e38krYGgQ+MVxauQ+QXucekZ7+JS5Vjo
	gphBGDXEYgmlR+G0szGtnNwK8DGja0O6AG9KYWK4PeHSlgDfPxvzgA0WvvM1EvslsdI=
X-Gm-Gg: ASbGncslk9owem06PDdQe6EWEpz/KyLoywPqcDFveKFreFPxxkyBBMdX66OQpLedQKR
	JFd9iFNJ2L3ssSqR/5RstljI8FrcgInlBHPE3mSRgYJ/DXymHRvhggi+lTb9MPFtBhXY1GzQozS
	I3paidebatikS3AWu2BEO4CeOhANT0c5VPlo6jUUYdA01zUIK1gvOnLEGXLOxsjviQqnfa8RAvJ
	JZ3XTvaRFY/OsyTXyq+apOaAwm1lwLYX7COArSh/7HE9I1e6oTpEfnC558AoFM375V2I0/6ig2Y
	YsoTSWYeYa94YA1ahIo5plDCvTA0gusEXdf8FlGodxAh/e5vFGULMywVopkrO+bey3SsIv1lP4b
	l
X-Google-Smtp-Source: AGHT+IFqfwGYY0+Dig+qJqYeoejIBa8GYHXUUVZat5Q6BxxTcUIEB+sFZBy9mHOAj+NMznzCbMGGkQ==
X-Received: by 2002:a05:6000:2089:b0:3a4:e1f5:41f4 with SMTP id ffacd0b85a97d-3a6e71ff6ecmr153014f8f.17.1750696666309;
        Mon, 23 Jun 2025 09:37:46 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:7b0f:c522:cad6:acd1])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a6d0f1011fsm9852947f8f.7.2025.06.23.09.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 09:37:45 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v4 0/3] clk: amlogic: drop clk_regmap tables
Date: Mon, 23 Jun 2025 18:37:36 +0200
Message-Id: <20250623-amlogic-clk-drop-clk-regmap-tables-v4-0-ff04918211cc@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANCCWWgC/5XOy2rDMBAF0F8JWldFM9ajyar/UbLQY+yI2JGRg
 okx/vcqhkIJWSS7uXdx7iysUI5U2GG3sExTLDFdapAfO+ZP9tIRj6FmhgIlIApuhz510XPfn3n
 IadyOTN1gR361rqfC4YuUb5XBRmlWoTFTG2/byM+x5lMs15TnbXOCe/sWPwEXfK9D0Mp417rw7
 ezcR5fp06eB3Rcm/FOVADAvqVjVAK2ppjCmoSdq80998demqoAapQSp99I8qOu6/gJuN1LNgwE
 AAA==
X-Change-ID: 20241220-amlogic-clk-drop-clk-regmap-tables-18e5cf572356
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3293; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=mYWVSmzjLjIbQDjgPKQIGCT3cgx5XlaE8wPwnDxWmfg=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBoWYLVmgtUvfDevz3Z10seXSm+XFjjYfxvZSxDt
 D3zgtlL2siJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaFmC1QAKCRDm/A8cN/La
 hZ5zD/wKTXfUG9GHR7LsTVWa2bQ0Ny9ClwqlBsRKbjzPe25XXK95/Z0+fnBUE0gcokzUmNXOajH
 sOvbauzAcb4bx3x1AZwpkpEE3/lwZ8NNv7Ecun48UyYWsPEzJWu439gjg/niJ7hIXttXw1vVWwb
 o96iCZN/DNLSns99V04RUJ6j21ka1W2zS3gzxay3xhAvtUCaW4vDiXdWMfShlpCRm9KhL2OyTl4
 HlfDCMjaoBGM8+NzKaYhoMSYO/sTvRb04hPNQb3TCQIknGS2Cdwzq6bNqom3xytg4cPFvyETTQ8
 73lDcMDONg0BXIQ1W/qr2ATjh+ruRLwQZR9zL9g91i9E83VSWKyf4Ozxsx8PhHTQMZPY+5PkNOv
 xcD4yy69DwnkS2eC1otDTnPh/g4nxtUMLO3k5Bch98Ov3XFenhz+l26KKFtFYJc+O5iv/719nll
 iatKI8tUIxveTkFfRIsgtxNRpltGMIiRbsJJfj0YI61k+YfOSb2QsM6er8jlzAw3oU4IkNcNTrK
 EOkMZA2y7BLQvVDU8P7JFvC1l5afC/e6U3ShoXqgsOylTgSzHqmEUo1+1g2Q3Y+t9loEEk9OgBm
 wAwsKkNt+XMRiwJrQid9Jhr11nkvOJ/BP0RTwHhajdv2PUEItqyHIUUNW9miFTy0fDgiaAuODUv
 lA3+YVdj/o3X5Iw==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_093748_351717_B4E4D872 
X-CRM114-Status: GOOD (  12.70  )
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

This patchset removes the need for clk_regmap tables in each clock
controller driver. These were used to populate regmap with in the regmap
based clocks.

This saves memory and is the 2nd step in a series of rework of Amlogic
clocks, to clean-up, increase code re-use and ease future maintenance.

Note: the clock initilization callback has guess what in order to properly
get the necessary regmap. This is not ideal and temporary as noted in the
code comments. This intent is to eventualy replace this with a dedicated
location where regmap may be consistently retreived by the clock.

Changes in v4:
- Rebased clk-meson-next targeting v6.17
- Link to v3: https://lore.kernel.org/r/20250120-amlogic-clk-drop-clk-regmap-tables-v3-0-126244146947@baylibre.com

Changes in v3:
- Fix some typos
- Link to v2: https://lore.kernel.org/r/20250117-amlogic-clk-drop-clk-regmap-tables-v2-0-d1f77cb0773e@baylibre.com

Changes in v2:
- Add clk_hw_get_of_node and kunit tests for the new helpers
- Split patch adding the .init() and the dropping the table
- Drop devres based solution and something temporary but simple
  while a more generic solution to hook controller init is discussed.
- Link to v1: https://lore.kernel.org/r/20241220-amlogic-clk-drop-clk-regmap-tables-v1-0-96dd657cbfbd@baylibre.com

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
Jerome Brunet (3):
      clk: amlogic: get regmap with clk_regmap_init
      clk: amlogic: drop clk_regmap tables
      clk: amlogic: s4: remove unused data

 drivers/clk/meson/Kconfig          |   1 +
 drivers/clk/meson/a1-peripherals.c | 163 +-------------
 drivers/clk/meson/a1-pll.c         |  16 +-
 drivers/clk/meson/axg-aoclk.c      |  22 --
 drivers/clk/meson/axg-audio.c      | 433 -------------------------------------
 drivers/clk/meson/axg.c            | 131 -----------
 drivers/clk/meson/c3-peripherals.c | 210 +-----------------
 drivers/clk/meson/c3-pll.c         |  32 +--
 drivers/clk/meson/clk-cpu-dyndiv.c |   1 +
 drivers/clk/meson/clk-dualdiv.c    |   2 +
 drivers/clk/meson/clk-mpll.c       |   6 +
 drivers/clk/meson/clk-phase.c      |  11 +
 drivers/clk/meson/clk-pll.c        |   7 +
 drivers/clk/meson/clk-regmap.c     |  49 +++++
 drivers/clk/meson/clk-regmap.h     |   4 +
 drivers/clk/meson/g12a-aoclk.c     |  34 ---
 drivers/clk/meson/g12a.c           | 261 ----------------------
 drivers/clk/meson/gxbb-aoclk.c     |  19 --
 drivers/clk/meson/gxbb.c           | 393 ---------------------------------
 drivers/clk/meson/meson-aoclk.c    |   5 +-
 drivers/clk/meson/meson-aoclk.h    |   2 -
 drivers/clk/meson/meson-eeclk.c    |   4 -
 drivers/clk/meson/meson-eeclk.h    |   2 -
 drivers/clk/meson/meson8-ddr.c     |   9 -
 drivers/clk/meson/meson8b.c        | 200 -----------------
 drivers/clk/meson/s4-peripherals.c | 341 -----------------------------
 drivers/clk/meson/s4-pll.c         |  31 ---
 drivers/clk/meson/sclk-div.c       |   5 +
 drivers/clk/meson/vclk.c           |   2 +
 drivers/clk/meson/vid-pll-div.c    |   1 +
 30 files changed, 94 insertions(+), 2303 deletions(-)
---
base-commit: b7f68cdf9f2a42b88815941538446dbf4f2dd464
change-id: 20241220-amlogic-clk-drop-clk-regmap-tables-18e5cf572356

Best regards,
-- 
Jerome


