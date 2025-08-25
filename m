Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DC55CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 03:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Q1QymQ+N7lTmS95ACDacJw8aP/Wywg82d5BNec1X3hU=; b=Fhqh301odWiFHS
	pA9p5oNNZMzudgoC+3p5MPQKsa5j5uAsXGCAHjB/Yah3LkS33FIepOKAWY6w90Zu+k/bX64rSL2Ty
	6NFNy4MhquM8LqU+pszRcOuFfXrVfHIrLFNwC54i5kvusUM9ac/oD9Ma0b0gDFXg3iZYoiH48SxPG
	gK0Wm9Sa45EZl/1r5fZ2YzjWMifOVoLxX1PuYRZbJh6X2ae7CP7ySemh1iFhmlalImfHdL3xNI+MS
	94XrqhH1AVY3d7R188gQ36C5I/Kk1As41k0LD7FtafXv99FKT5EFGCn1pN19ozqmhfmlhIbooU9Xt
	/L0o26i5wVZm/1AHvKWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqNV0-00000006mbI-0Gl1;
	Mon, 25 Aug 2025 03:03:58 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqNN4-00000006lUa-2XRH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 02:55:47 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-4b109c63e84so45305561cf.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 24 Aug 2025 19:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756090545; x=1756695345; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q1QymQ+N7lTmS95ACDacJw8aP/Wywg82d5BNec1X3hU=;
        b=Y1pljNB2cn7bO+e0howheY5mkywT4q18VdNy+xTWksyFVxEd22wfaIa0s/224IUk0H
         qaqgP0/icOzA9dvRuMFUuU/B+706HQX2/uqJzYuK6yx+UtYy4bNKjmRbc4BCQnBaP0wl
         poSxKkgZZhJ3UAxeT9fDjsbshwEe683R9ms7Z3XNgOajWsScnHvFOpIi4eTIMVcuM6tR
         w5uwAd5XT+6AoUfT0dBSE59y+SsTudokWcDx1k75YrmUYVTLQ12GCiCxvGYrhXJ1DEQu
         q2zq274hIEwxjTcXGPfF/hSPT9j7+aOl39zFRESavApqz2VOnBsmC5Cc8U+h+LSf5nIg
         WIjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756090545; x=1756695345;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q1QymQ+N7lTmS95ACDacJw8aP/Wywg82d5BNec1X3hU=;
        b=d0dbLHZnyDndW0RWNyTuaiwgp/Ly9zWIPRGneUqEE7EpzTuHPSlvyKwKDv7cS4vqFH
         LSCq4kkzSHtLCePxPvieZYBXoPj3RX8E4WmMDnHF1fGRktWY+PaR2noIiCjz6JO1AP0y
         LDIXNxmvRVzazYm6WyEDGYFrIQz4/v9cZD4uz8j9igsQQAib6xsC96D9gnoin4c8SgjS
         OCSbbxusYKQfgM8KTbXgRbDO8pQmQXBdD7OgJuWDchiTq373Mti3y5ImUByWJIzNcJ2q
         2EXORsm34p9zAR5wpSpr5ymWgq/6Ik3h6h/Yy77QoufQi+2LrWFel1q+e8sBDpd1mtXo
         plOg==
X-Forwarded-Encrypted: i=1; AJvYcCWVYnzCrkwdA/fbLWFLBB1OnA+OswersTEdK7wLIE7jnPvtR90QtHbVNfANMbPHF3Rq+9f3bKCi0+v1jzsg7FiC@lists.infradead.org
X-Gm-Message-State: AOJu0Yyt0NuOZipPifesL40Y8efO6t50MdbYGbVNYY7UgNlNwMBhv8vX
	g+L+KeF84BXsGyMR7H3i9l6oCn0fUyb7m7R83IK0q984KxvZc/2d+nmz
X-Gm-Gg: ASbGncudmfde29f5Umo2i4O9xzKRZbKZtN9gV7K9tXcggS7XauPTw1/fn/2wYmc6not
	hh4IOoU6+psf+0VSuKe1jST9+hEC4IVGuB6a3ktuXigw14+HyKgpZyPyVPIufqDYA2tKJn7JNeO
	XKIQnpN3OjLivGHPZdEM1qlcGAyJ75yeUn0mYubosnE1h4HIoLhYsCRDP7nh6t3u0Ym2XFRXKmu
	/9djUEqj4vHxiwqWGM6m9dDo4hlDxTYLTvzjycfl1uuhjgJKHWULdWvePupD7u1IV6bAXLCoFkQ
	1UMdlvVABRILqTE4kDG4F6b5Up1sM7rR+z2aqRtbd97QkHWFXkDM+UmB3T9vp3RUrweG3MHolyq
	k/iuhIFXnm5XfOelVuCJkcNgKvnXI1g==
X-Google-Smtp-Source: AGHT+IGbnGPVJ5DdKKr+vtzGzlXGv4G9veTPN1vRKR/wFKZQjtPT0AZapMpobMePa2S4WRvmzjfMLg==
X-Received: by 2002:a05:622a:164a:b0:4b0:7521:3bb7 with SMTP id d75a77b69052e-4b2aab37f10mr121228581cf.48.1756090545149;
        Sun, 24 Aug 2025 19:55:45 -0700 (PDT)
Received: from [127.0.0.1] ([172.191.151.57])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b2b8c61adcsm43970491cf.5.2025.08.24.19.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 19:55:44 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Subject: [PATCH v3 0/4] clk: samsung: exynos990: CMU_TOP fixes (mux regs,
 widths, factors)
Date: Mon, 25 Aug 2025 02:55:42 +0000
Message-Id: <20250825-cmu-top-v3-0-8838641432dc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK7Qq2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHUUlJIzE
 vPSU3UzU4B8JSMDI1MDCyNT3eTcUt2S/AJd02RzA8tkwxQD82QjJaDqgqLUtMwKsEnRsbW1AIW
 cgzJZAAAA
X-Change-ID: 20250825-cmu-top-5c709c1d07c2
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Denzeel Oliva <wachiturroxd150@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756090544; l=1248;
 i=wachiturroxd150@gmail.com; s=20250825; h=from:subject:message-id;
 bh=Il0Ec3pMC9RC7MiF9xNyXJRyNNelcuGbw9atXy12I8U=;
 b=UgqjtqzT/u3t+ZdgWcXKvRaVCsE/5E5v3H1Jf2w8mP52nY0Rb0Y2GRtVdosb+qF8736d4KU5Y
 S9o3sz7Ouk2AOwGVS2NRieQqemj4FgH8DW8xEsuq0rAR9T0UyYYWiRb
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=qZrip2idhSTNQABELWG6WKCrg9xOKep//pV9JGKmW5k=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_195546_653278_96A6374C 
X-CRM114-Status: UNSURE (   9.74  )
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

Please review.

Denzeel Oliva

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
Denzeel Oliva (4):
      clk: samsung: exynos990: Fix CMU TOP mux/div widths and add fixed-factors
      dt-bindings: clock: exynos990: Extend clocks IDs
      clk: samsung: exynos990: update CLK_NR_TOP for new IDs clocks
      clk: samsung: exynos990: Fix PLL mux regs, add DPU/CMUREF

 drivers/clk/samsung/clk-exynos990.c           | 136 ++++++++++++++++----------
 include/dt-bindings/clock/samsung,exynos990.h |   4 +
 2 files changed, 89 insertions(+), 51 deletions(-)
---
base-commit: 0f4c93f7eb861acab537dbe94441817a270537bf
change-id: 20250825-cmu-top-5c709c1d07c2

Best regards,
--  
Denzeel Oliva <wachiturroxd150@gmail.com>


