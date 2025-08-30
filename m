Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E6CDCA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 16:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=t5qRg8dL7CV+FgonqN1II497OJX54kF6SQzjUzNxw88=; b=qjdxvEj9krswyy
	eanF0r3Ta75HJ3/+vOwcT3I+RKAoIhwqPYdW5KYlTmjADHppcExa5mC/qo1ND+1lWajz5Yso697Mg
	WmU+pfU3TS5XdTYVXRQYF32rz+zxn/JsV+MVPNXUTkKT0hVp8L7YsSnGTZGobkSTjm/qTM9Um1TBJ
	BbBq1UUzJjSjdWSkdPCRNDGSc5km07Gf9i1OD9BUBoufbeBzmC/1VB99N91gKhConcQl3O6GFlyP1
	jQ5gG9QJLRPL/lGYPlYlS6zgENXsNLHC9U/yP1XF1F0CrsLBquj1ZPVQa+EHpL5odllbknJ6n/lxQ
	zK2+aFwq8zwX/vzSGGQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usOUH-000000088nN-2AJD;
	Sat, 30 Aug 2025 16:31:33 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usORW-000000088MU-0naM
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 16:28:43 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-70def63ec87so23439856d6.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 09:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756571321; x=1757176121; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t5qRg8dL7CV+FgonqN1II497OJX54kF6SQzjUzNxw88=;
        b=b37S1Ee7lUpXMFkABpU9hfiw3pqXiNwUMbbFM2I5qu1Gbdm2bKWIhH5WZjAkoTkNg/
         0gYEfCc0dVc6KRMw1+OqwjAQHOfB08MwvmOZoLbN7bbIKmxBI5uTYvQzgoLfaCgcHTvU
         ZdssTIcUwE17yEBicfWKhvf4MLIKhbeVqdJd4/HiIdYrgp4gtDER6Eq2R6vLFojheCCi
         4yGKQ2zotiVnwhr7d4GqyydzQRYDxtkimMbJmzh1lk1kRc79KaZkHBH688nOtcmLRBSP
         l92LxyJulWMFbVVkLV5pTwIt7eErXL7SXbY1TvubViD33z01kAiWh8ZXefKytdCDnv3i
         BXwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756571321; x=1757176121;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t5qRg8dL7CV+FgonqN1II497OJX54kF6SQzjUzNxw88=;
        b=Dai1/4rJbdS7EUCN/PPHUClg+87+MHaAbr89OLp4pifFOUWy79EJw1/JT55STJxCJe
         lwH4ueBdllA0xSNimlsmQpEaeb4N4Bctnumr4qMYsBOviW2x8nKSW4h9iqgDrNyGvAVz
         NY9mGw4QOonM055c0zvdYLOtMlXY5r1+ZxNIufQLcrbIVZahzTItqYbAWsLwwTEBP8OP
         sgbx+ThHukF8C7IL0OxSOQ7zyhujl9u4kGC9zfm3U9hNvPn5lOr0barmQONOXBg1WaVr
         mDvbks68L+NAnmpvGBepzgplMQB9s6ODEGJJokeQBwvbCNH3Ie7VM6jOnTlHSG4rbXLl
         X+jg==
X-Forwarded-Encrypted: i=1; AJvYcCXbxvMYbM2nbsmQiEIRAc/uk6yiFYQCfbAPpdmELFiE1yfFdeOeG+UiqZs74czJBlvZ/a//PKyeyEbUdhDdmpv5@lists.infradead.org
X-Gm-Message-State: AOJu0YyTZNQU6fHk+klUBRiCioIPWrn6BzzqbJjnBXTwJmwd4U5G6eWS
	G9olBXcZX1AQIAsvUMcozE4SRwewLtOMA+mKfEtJSoLjAJaBs56Gx7RL
X-Gm-Gg: ASbGncsOxhBqreYHdI6f8A+DNlk4T2KGIDxNPmsqJMkmRh6qMKPzU4yhPKJfVM9soSW
	N+EOMxaaZxyUjcvxCXX+jV+W2FjE3aiouMj+ot69lDN/FReFci2tf7drUxqrglqpzERjbtKYDJN
	WGvWnBjvmA8Hj3dKV9k+3/MFOgetb9CULT8ZCv6PRXh3+bR6ys+eAYOoG6NAG2PsukKEvWjQf6n
	vSdVBQfKP/tzdnRIcM3A5VKFimAYyNbnaYdwK4cl5hsDPoktQUPjaQ6iqp8qUsL6jQAUsvSF/hM
	CtPvMa9oqIKcRz571AsMN9EAQC8Jl50pAwVAPw/4UL3pRLfYKvksP02oxqi74q7wvgj211hIREj
	jA20xKJC6Yg9Db4T5RmMuXkxYwVeF
X-Google-Smtp-Source: AGHT+IEDsnzVzmDqICYsDSEbi2aaTM/6NHF5Tn3lwCq02oQLmPIh4l49hBu0D6JUcNECJ8GrIWvnTg==
X-Received: by 2002:a05:6214:f09:b0:70d:9291:bdd8 with SMTP id 6a1803df08f44-70fac7c7ed1mr28987296d6.30.1756571320599;
        Sat, 30 Aug 2025 09:28:40 -0700 (PDT)
Received: from [127.0.0.1] ([74.249.85.195])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70fb28b5a26sm8110786d6.64.2025.08.30.09.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 09:28:40 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Subject: [PATCH v5 0/5] clk: samsung: exynos990: CMU_TOP fixes (mux regs,
 widths, factors)
Date: Sat, 30 Aug 2025 16:28:37 +0000
Message-Id: <20250830-fix-cmu-top-v5-0-7c62f608309e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALUms2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyTHUUlJIzE
 vPSU3UzU4B8JSMDI1MDC2MD3bTMCt3k3FLdkvwCXQNLQ/PERAsTC3PDJCWgjoKiVKA02LTo2Np
 aAIZGO1pdAAAA
X-Change-ID: 20250830-fix-cmu-top-0917aa84871b
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Denzeel Oliva <wachiturroxd150@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756571319; l=1607;
 i=wachiturroxd150@gmail.com; s=20250830; h=from:subject:message-id;
 bh=DTu6htZoqYuzhaeQFD9mKEvbhzis4l6Wheni3yeZONY=;
 b=TLrfWOSA0lvmaSNnT+NdMXez4B1AptncW54LbNAkWa5w+d2JzK+N+1IQ+yAVMSNO25fxPCFEy
 UBnQgmyzbFwA4LaOd57KjANj/h0Y/WEc/z/cFH4T5EBqdNC4JeVz7MX
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=rxHEBGA1eos5vQkPC9SlkEPD6sil9F03N6bc8qmUFrQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_092842_232005_554FC449 
X-CRM114-Status: GOOD (  10.72  )
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

Hi,

Two small fixes for Exynos990 CMU_TOP:

Correct PLL mux register selection (use PLL_CON0), add DPU_BUS and
CMUREF mux/div, and update clock IDs.
Fix mux/div bit widths and replace a few bogus divs with fixed-factor
clocks (HSI1/2 PCIe, USBDP debug); also fix OTP rate.

Changes in v2:

- In the first commit the divratio of
  PLL_SHARED0_DIV3 should not be changed.

Changes in v3:

- There is no ABI massive break, the new ID clocks are
  in the last define CMU_TOP block.

Changes in v4:

- Fix compilation for define CLK_DOUT_CMU_CMUREF to
  CLK_DOUT_CMU_CLK_CMUREF

Changes in v5:

-  Rewrite commits and remove cosmetic/non-operational changes
   and unrelated rebases.
   CLKS_NR_TOP will be moved to the patch that adds the new clocks.

Please review.

Denzeel Oliva

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
Denzeel Oliva (5):
      clk: samsung: exynos990: Use PLL_CON0 for PLL parent muxes
      clk: samsung: exynos990: Fix CMU_TOP mux/div bit widths
      clk: samsung: exynos990: Replace bogus divs with fixed-factor clocks
      dt-bindings: clock: exynos990: Extend clocks IDs
      clk: samsung: exynos990: Add DPU_BUS and CMUREF mux/div and update CLKS_NR_TOP

 drivers/clk/samsung/clk-exynos990.c           | 80 ++++++++++++++++++++-------
 include/dt-bindings/clock/samsung,exynos990.h |  4 ++
 2 files changed, 63 insertions(+), 21 deletions(-)
---
base-commit: 39f90c1967215375f7d87b81d14b0f3ed6b40c29
change-id: 20250830-fix-cmu-top-0917aa84871b

Best regards,
-- 
Denzeel Oliva <wachiturroxd150@gmail.com>


