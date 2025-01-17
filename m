Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D83DEC02188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 16:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9g6Vyc9mOB7lyi/aQRjsa7BERTyMx1iof60RQwC2Xw0=; b=4xyUjK9vfTLeJs
	baC5Y6LS6IzFjX+KX/HClmmwyghetAs+m7oC+QTSeg9PCFcSwrLtopiuqrNFZWmfZocL8eA2FZ+8c
	IsedRUsznLnhusESgz5eQQdEuFYvGpq9yOa176Z7Nd9gYI154X0ZPCiXkC9lkB9AkD1tOeZJ+IKwS
	bjBXj3eoI7N29QmfwCcCoItysHp7QjOAd7cGyztmK5DmrnYwbY/Inhk//Wv4CX5YfjaJ15Oyk84Si
	pC17hT7QkuQFBBTnJ6c5CC3b6YfA+aatBkSdbYxQMUs3NvyDinpHPcCD4MS9wP5WaM7oRdLwST1/0
	KbUdfD2sMKjx0UBz1wuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYolb-00000000hM2-1tYB;
	Fri, 17 Jan 2025 16:00:15 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYokK-00000000h0i-0RAv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 15:58:57 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3862f32a33eso1060275f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jan 2025 07:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1737129534; x=1737734334; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9g6Vyc9mOB7lyi/aQRjsa7BERTyMx1iof60RQwC2Xw0=;
        b=c5psHssT6jO8hXW/1Dd9exIemi1nnhagVftYR9PwtjKB1+aZFFyFgp/jdtH1B6miL+
         EarcCEkbGIfZkUguvKXGerMlFxSBW8oDaT1owvInokd+gwo1VJCT0q+rJ8T09hIXM4FV
         OmNMlcA/U347k6y02NPdFNO++WqDZofJrXkCW7DPyeBW5l12oqRyc7CFEafPXAK9l14w
         F2PXyWoZ6kMk2gdQb/iK5Mx79SsYygfLCmGWGLrJgOFp9vtqiicmQHGD5L7oCQihY83M
         o+8pIfS4PkYvAh7JzL2T8hyjGrbiJeYb8gUHkHsXkow55zsAZ+lrBcoHXIJqrFIgG8ZV
         7qTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737129534; x=1737734334;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9g6Vyc9mOB7lyi/aQRjsa7BERTyMx1iof60RQwC2Xw0=;
        b=B/CgZ2V8BtWCcN72pDnaF7d2kqNPE6ksy+wrpkBBB1h/2u+q/73by4SpNn5xHkQvyP
         MklQ9XYBPfDmHwAfcGCFFWS2VNh989RnRuP6QIFKfEuOOvFITpr87vzl3riue2Wbta11
         329SYNhBRecD3eMXYWUkwHqDRwDG+APZMNpZ2TaQ+pAzlHCnOJyCEPMlT7jX9apKbET+
         +MOzPcYfapNkJq+DG8PHFf2cmgzCgIAm6upItnXZ/EqQbjt1gOJXNCF4EcA7g+6x511r
         nFpH6ogZ7Cba47Z0IhB8cWEIG+nKKSPfeHRIWBgXCPMeRiH3P64DyKLbKvZ2Ox4K07Zx
         me9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWsQT4GgPCz2gkMwsbDVRHFJ7ApHn9660ktiEKMb/RXvZFD7VuiibVdeRAvEGvBUY62ZiFJI0GzqCjK5Z5q2hpR@lists.infradead.org
X-Gm-Message-State: AOJu0Yzl4tLpAoxmFY6xq2Th1oyEGXfRbXpTOXJlor0FNQLh+9xv7o3m
	LGom/6GLpcmP1iaJ1QRUzKhlb/eYMSYPiI55W0GzkS9o9A8FP5xh/RflccK5duA=
X-Gm-Gg: ASbGnctabB6PtcBBI6OjdManSOjZLVZZ4HedhInkQgYyCAEPLpraMSkat5ymqGtjNRy
	EEYMmmJ8mjfIMZIczqoJH4rFbeHY+vyvKdqiBZiHWKQ5BVzAz9oBwQvgiLSIxs1zRS7GPl4Id3E
	1H0ZGQIdUK+JTTaPANKeRxs2tqEi/M2O0B0dghgrLQ2AiQHSNB8Lb7ncc6/8dIWIA7TE60UUrpB
	VU34uV3wD1zncCDg5c/xFbFwV2bQezy7azW6rZJcHFpc7wIOv6d40KEEyvsT7wJDnJ7dmU=
X-Google-Smtp-Source: AGHT+IEFctnhDoaU9MlqplgOMTYAM82vSV45AUZja9u72PfPs4/igV3EGZ+h0AvIYK+a+WQ9znx4wQ==
X-Received: by 2002:a5d:5f8c:0:b0:385:ef2f:92ad with SMTP id ffacd0b85a97d-38bf564d5e7mr3579724f8f.10.1737129533948;
        Fri, 17 Jan 2025 07:58:53 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:b019:599d:2d51:f3c7])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-437c7528076sm99382195e9.25.2025.01.17.07.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 07:58:53 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v2 0/4] clk: amlogic: drop clk_regmap tables
Date: Fri, 17 Jan 2025 16:58:29 +0100
Message-Id: <20250117-amlogic-clk-drop-clk-regmap-tables-v2-0-d1f77cb0773e@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACV+imcC/5WNTQ6CMBBGr0K6dgytFtSV9zAs+jPAxELJlBAJ4
 e5WbuDue9/ivU0kZMIkHsUmGBdKFMcM6lQI15uxQyCfWahSXaVSJZghxI4cuPAGz3E6BmM3mAl
 mYwMmkDfUrtW1uuhKZNHE2NLniLyazD2lOfJ6NBf5e//SLxJKuFfeV7p2trX+ac0ayDKeXRxEs
 +/7F+6SzzTXAAAA
X-Change-ID: 20241220-amlogic-clk-drop-clk-regmap-tables-18e5cf572356
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3163; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=5GBtK/Zufm73VK+pUpHd8niOXTdAdy+WcFTCquXSAPQ=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnin44kKraKDYPejH2n7CpehSMnuaRgAfHt2jiF
 VRluJQV/haJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ4p+OAAKCRDm/A8cN/La
 hUAmD/9ervITo4Mtbw0X+1dsHMEeAK0MuNr7/AUtzXrn+UneQnOMd2wUL5CBYI2AiUrAjlmwLX+
 sUibYfTZwQ3MAgJ/HfDaAE9j12xOvRRfUuZWZVtR8/OmgbKGp3N390VEInxxXQFW8lyoqGCi8a2
 Pg60h4jUq51hu3c169X6IHmEm1Q2ILokgQ7V40UJjAndaOckZALQXjBJGaD67T6rdLm0fK35+OA
 EmqPYYz1Ih27N3R3n7wEfxIW89oTWewHzc6ITqZQsVnvwyVUC7jHn8CsZyPtsH3Co4PFQ9wkYr2
 U0sLKsxHBQFzdzDFBz7AnIUO6hH4DZ9bWASttBcCmt9hW/xgwwSSkmj23v3SsuUU/vgsVI1A0vi
 e1i5ZYJpi6sm+Z8yUE15+SEYA5IKBE/RfNdwNYQPdOC/omsFWLbF2dR3hRDTV+x+2hwpAw5q3i4
 7kZk+b+RJbsbeSAxsXSEu8TzCPtdbu8FWfXOwoI8PbWWjTqxDYD7eyyuSVPbn5yvO7VvYiS0N1k
 ddJM2nCbBH3igOzA3CYEVH2y2i59ob/T+HAgUG5qoO9BDwBrLZb+7HM0RqB3GbDS4b2v1ilePoV
 JE6er0pTarMGAq+Pz1+mrnt8VNBuhOvFEqPDye+b0Hvw8WcGPfxvcVEX+YLRbbTpPCboPwXAgsL
 IeEf1U8GFpubr0w==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_075856_148253_DE73BDD2 
X-CRM114-Status: GOOD (  13.08  )
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

This patchset removes the needs for clk_regmap tables in each clock
controller driver. Those were used to populate regmap with in the regmap
based clocks.

This saves memory and ease maintenance a bit.

This is the 1st step in a series of rework of Amlogic clocks, to clean-up,
increase code re-use and ease future maintenance.

Changes in v2:
- Add clk_hw_get_of_node and kunit tests for the new helpers
- Split patch adding the .init() and the dropping the table
- Drop devres based solution and something temporary but simple
  while a more generic solution to hook controller init is discussed.
- Link to v1: https://lore.kernel.org/r/20241220-amlogic-clk-drop-clk-regmap-tables-v1-0-96dd657cbfbd@baylibre.com

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
Jerome Brunet (4):
      clk: add a clk_hw helpers to get the clock device or device_node
      clk: amlogic: get regmap with clk_regmap_init
      clk: amlogic: drop clk_regmap tables
      clk: amlogic: s4: remove unused data

 drivers/clk/Makefile                    |   1 +
 drivers/clk/clk.c                       |  33 +++
 drivers/clk/clk_test.c                  | 116 +++++++--
 drivers/clk/kunit_clk_dummy_device.dtso |  10 +
 drivers/clk/meson/Kconfig               |   1 +
 drivers/clk/meson/a1-peripherals.c      | 163 +-----------
 drivers/clk/meson/a1-pll.c              |  16 +-
 drivers/clk/meson/axg-aoclk.c           |  22 --
 drivers/clk/meson/axg-audio.c           | 433 --------------------------------
 drivers/clk/meson/axg.c                 | 131 ----------
 drivers/clk/meson/c3-peripherals.c      | 210 +---------------
 drivers/clk/meson/c3-pll.c              |  32 +--
 drivers/clk/meson/clk-cpu-dyndiv.c      |   1 +
 drivers/clk/meson/clk-dualdiv.c         |   2 +
 drivers/clk/meson/clk-mpll.c            |   6 +
 drivers/clk/meson/clk-phase.c           |  11 +
 drivers/clk/meson/clk-pll.c             |   7 +
 drivers/clk/meson/clk-regmap.c          |  49 ++++
 drivers/clk/meson/clk-regmap.h          |   4 +
 drivers/clk/meson/g12a-aoclk.c          |  34 ---
 drivers/clk/meson/g12a.c                | 261 -------------------
 drivers/clk/meson/gxbb-aoclk.c          |  19 --
 drivers/clk/meson/gxbb.c                | 393 -----------------------------
 drivers/clk/meson/meson-aoclk.c         |   5 +-
 drivers/clk/meson/meson-aoclk.h         |   2 -
 drivers/clk/meson/meson-eeclk.c         |   4 -
 drivers/clk/meson/meson-eeclk.h         |   2 -
 drivers/clk/meson/meson8-ddr.c          |   9 -
 drivers/clk/meson/meson8b.c             | 200 ---------------
 drivers/clk/meson/s4-peripherals.c      | 341 -------------------------
 drivers/clk/meson/s4-pll.c              |  31 ---
 drivers/clk/meson/sclk-div.c            |   5 +
 drivers/clk/meson/vclk.c                |   2 +
 drivers/clk/meson/vid-pll-div.c         |   1 +
 include/linux/clk-provider.h            |   2 +
 35 files changed, 239 insertions(+), 2320 deletions(-)
---
base-commit: 1909d0d351ed98fdb9f5cbe377213ba0154bf2e0
change-id: 20241220-amlogic-clk-drop-clk-regmap-tables-18e5cf572356

Best regards,
-- 
Jerome


