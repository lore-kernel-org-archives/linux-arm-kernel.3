Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C353E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Dec 2024 13:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FsIg+Mcd3VhuGN1xLJZdNOnDNUO1L1uY5LDyhY+2IAE=; b=KVsf4l9AqajP83NBW0Sb7yHQnx
	Ja7ZnRXT0AolXtS4Cm3Io1HxPFfehqc+eV7fn40JcoU1o9we4spC9cB6nKdSobtcaYh1O8a4R+7/2
	eHQKnJ1CwlPsDl5Hg31K7Xt2tgMWuuIpHa47GPabumFVRlxTUiHXFh8nUzb9Ldnl+EVLWW6VRcfuB
	TXBPy9oiuUQpEtHDxjjZSZXeg302sMtuXhuvw1wotcjQ58s3e18NrTvSwv/G+Kj2l/BPYvQjCAEUJ
	CYYZCcllXkvOP8w1QA/D+2GbSTYoi7Q+yp5embLxzAig8BBdtJUEkpAe+ENhNarfriR22Pnymk38P
	Ux/NSIfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tScE8-00000007Fhl-1xb0;
	Tue, 31 Dec 2024 13:24:04 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tScAA-00000007FGa-02xi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Dec 2024 13:19:59 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-436284cdbe0so15971285e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Dec 2024 05:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735651197; x=1736255997; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FsIg+Mcd3VhuGN1xLJZdNOnDNUO1L1uY5LDyhY+2IAE=;
        b=EMNeq1gvSICP+ze/ZzEYMLPDLYT6t61I3Mrk5yVkofpFgDwa00iUTEiLnWmghGlIYO
         2Sw6dNt+fzudE+34I048YNdvlkarkntC2D3zra+nbL+5YOGcfb8QlRxoeQ1QYGNkxg2E
         avs5igXmHfp2dXWrd10KXepbPfyF6pmd2IeOB8QabsnxXtlaWec97th2j6gqKRnlSnoU
         wzC0NtP49z3Ej8hsDCqi/kOMwVMiVGEqKzL2dr9A2BbfpgNKWXuyw2CpIZjA+/LmDFaN
         epM1ZEvpr0AbdxbGarDlAS27GiTIWVEN9Tvv10AwyCmFmutqeRKSx8PMyD3yBKRHyDdZ
         LKPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735651197; x=1736255997;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FsIg+Mcd3VhuGN1xLJZdNOnDNUO1L1uY5LDyhY+2IAE=;
        b=iGs6NoEKqEnyo2aFFD99yNeVFRa5SscQFf5kya2PMZxAdJKJfI+NPAflNl85zlPWO/
         nw5sd1zpuSi0y8nwcbuPiTYHYWH7yKhJMR+NjBjXIsWkSU9xDFrfItSjoa2vEmXSBDk7
         6dDFAYhnlDHUmq/f8k9eFlikprF1X1Eip7nbrsaSpZXtZOG+d6QekUZOkYCJSFgakk1x
         Cmw6Y+/LUblr7Hi2/cvHXQnNS8d6bbbfGtg3vz1k36zKgFrgpoAQcYjyps/AKLuD3se2
         ip/eLJPZMJ3ONcqfnGrxHC08+vKJqlZ1JP7fJjoMos5JNr/QmLHL8pyC64lms5V4eH5u
         /AoA==
X-Forwarded-Encrypted: i=1; AJvYcCUDE1QoFCrymyYDQiXYPrJ5RIUVrTsntGBTkMPyS65lsHvvQvSjhztZwHAZA/LVqAB/CrydHVgey83G8n0ESlY6@lists.infradead.org
X-Gm-Message-State: AOJu0YxHY0JsBTAt3ccl4X5GuUFY1jW6kcfxFUCzMRaC4Ntnozevh87h
	x47hkZ2sSqRVkM8LioE8/I3clSwPPvUnYGYXai9bvqllVXJpi9zbR1z1JibF2fg=
X-Gm-Gg: ASbGncteAlawZPP0bDnQZNV+bA/6xTZp5lrL3s/eJycGWfkgG0NXUM9j6uULce5taHA
	nhIFeXZf+pTyTQTjXGxlCVs4BQipWh7H0RCMJE8Wozo7epfkpKmfD86svvopINvp/r32lNpfLsW
	e5E8dOzd+REaqPpa9BT8iqUQdomzwI39iS7+mCOXMb6i+aFP8r6NpFktsMRy3Mty1tPfE1ihMNO
	VJix7eKfDNDfY+95A36nD9IaRh7NR2sVPg00m9iAu0wFs3rc/BJPFCgxaV2kmpq0plVJDE=
X-Google-Smtp-Source: AGHT+IFdVsUX0ato8elnQIAS4IkMtXA5th/MOoBVgOBpYTxoY2gUKvFdkQGLMpAxiE680U/eW2BAkA==
X-Received: by 2002:a05:6000:71b:b0:385:ea11:dd8f with SMTP id ffacd0b85a97d-38a221f780bmr11631694f8f.7.1735651196674;
        Tue, 31 Dec 2024 05:19:56 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8a6abesm32818468f8f.90.2024.12.31.05.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Dec 2024 05:19:56 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	linux-clk@vger.kernel.org,
	Sylwester Nawrocki <snawrocki@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] clk: samsung: drivers for v6.14
Date: Tue, 31 Dec 2024 14:19:53 +0100
Message-ID: <20241231131953.134834-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241231_051958_063686_44220827 
X-CRM114-Status: UNSURE (   8.73  )
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

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-clk-6.14

for you to fetch changes up to bdd03ebf721f70df1458a720b25998a489f63297:

  clk: samsung: Introduce Exynos990 clock controller driver (2024-12-14 11:39:02 +0100)

----------------------------------------------------------------
Samsung SoC clock drivers changes for 6.14

Add clock controller for new Exynos990 SoC.

----------------------------------------------------------------
Igor Belwon (3):
      dt-bindings: clock: samsung: Add Exynos990 SoC CMU bindings
      clk: samsung: clk-pll: Add support for pll_{0717x, 0718x, 0732x}
      clk: samsung: Introduce Exynos990 clock controller driver

 .../bindings/clock/samsung,exynos990-clock.yaml    |  121 ++
 drivers/clk/samsung/Makefile                       |    1 +
 drivers/clk/samsung/clk-exynos990.c                | 1343 ++++++++++++++++++++
 drivers/clk/samsung/clk-pll.c                      |   14 +-
 drivers/clk/samsung/clk-pll.h                      |    3 +
 include/dt-bindings/clock/samsung,exynos990.h      |  236 ++++
 6 files changed, 1716 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos990-clock.yaml
 create mode 100644 drivers/clk/samsung/clk-exynos990.c
 create mode 100644 include/dt-bindings/clock/samsung,exynos990.h

