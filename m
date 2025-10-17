Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31CB4CCD1A4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 16:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uDBtrf04QYUQbsiCFswby2jYYDrs9vGFSiZ+aqY91Ds=; b=2OI10dcLMQGvjO5K6XLFofZggj
	sXR7GSfYibnhYzwegb091I2GL5+FNEoDL07W46UPBGt/dP10wjZz6MkebWaQ/n2m7R5ArUp3GEWmO
	yORUQEsymOFFZT77QpCgA8zRHBtMeA9RcT3v9awBWNeQG7Vqt4uu4Tqg2sth4akHXHew8pFvlwtqr
	amQtCkdwyJ+VRnFPrqkau3/0qwCejBgva6+dyaqUiiIe8VQDdfqyp96RbogCK1f3fybdKcvjI6OAB
	lAXyANb28O7TOqQqhd9QwUt241Gtc4xKRgJvh5df63T7H9ov9YCIr6d7n3cvvv1OCMbbuN7HSIdiR
	kVd89lIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9n5y-00000008OOM-3jvg;
	Fri, 17 Oct 2025 16:14:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9n5x-00000008ONc-2t1t
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 17 Oct 2025 16:14:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=uDBtrf04QYUQbsiCFswby2jYYDrs9vGFSiZ+aqY91Ds=; b=XqJ+VtaRc9agJyWl47E9O0UqT6
	BpjEZv59AKuTjuVjHbwoLy3nXHYaniLjmHzUkLSxEvnyhNsaqTpnR+4xmRTWnxqqk6eqn7C9KyYr/
	3Ua8XVUUGXkuquVyIRCb/OgdigiIw+2rvIPEgzAaEioAazlEaL7w+R8Gc1zRcwqLA+jiKTngV2tuA
	9wf0M0a74RZL16YZEWBUN1/jLKEFN8z4qsobrwVZm/wWaDhNy+zrAhbJxvT4VO7whG6iVebzDp6Su
	WS6DsdPA2gKTkAOD3hX3RAeFKt0e2g8HNwARgIDoQFcPg0ZDGsm8UCL71E/PJOYWt3Od1oTHzMP19
	EJTvgUJg==;
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9n5u-00000007jV8-3Jmu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 16:14:20 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-b3d196b7eeeso386038566b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Oct 2025 09:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760717655; x=1761322455; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uDBtrf04QYUQbsiCFswby2jYYDrs9vGFSiZ+aqY91Ds=;
        b=OWtiWqykmIvFqTDfXTyyH1fIerqgPxaGE50N3gcRIZwXzsHqBl4u9vHtXlSzo4jR66
         wyrGJHdUum7CS3Z++Fnjdzh6/mk/tHv66fjccQDd806LLTpgsaZhgg0GE2dGYmRTcZWF
         rVxbO3w9jK+rFWvuRR/ooNGVLXjk0suB4fJKphskBDqXVF/GMw2tQnCgBkyXpa0/kraX
         1z4Zq3IoPGWGKMpThoGiZgozNEijcw1b+I5jZdQ0FRLeUa5Kxw4xlK3IK2gI71Ao/9pK
         ce4wqMkALRPBM3Kf5mY/DnZxG/XmnsFL20W7wft/pNpv8ZqAkqAn8ueaSSOoHlYGVQhC
         MjBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760717655; x=1761322455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uDBtrf04QYUQbsiCFswby2jYYDrs9vGFSiZ+aqY91Ds=;
        b=pC7SyTgTHOn+DoKf0Uk9MKpRhiuWR7772gE4fZteYPy9rZMnd6eooAk7+LrM9r2iXl
         4EA3Dd06Kl9yprx8ZGpWd6sR08hvHHBwfEt46tLCvrbQs/QpGjFfeiDA7Iy+2+2xiLN5
         BrqcTlSTC6yk3OOor5WkKpTTMCJHA2difJM+OWxKsJcbIg9hy0UbpQMyImnEd77fYSm+
         ryI0BUYk4rWg7TlHhiQPyk3lLk6s/6Rnn6hJj/KptvOdTCscCYG56vb5cfQ1tAvJj7OX
         feM0gKvnXu++bFOoEV9Yl+nUerOV4KdWy1pLaYNoR6Se2vLbULIeTzJtoVEdDHJg9pbQ
         awdA==
X-Forwarded-Encrypted: i=1; AJvYcCUC4rVHdTJh5Hhzz8SaeBFMkBFmwn2t/PRSR/F5JebleqLCo1+LNd7oXQY5NZhpg4lgncT/42NEqKNCvCNN+6bL@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+2o9DxwcRxemnH8MemgP+YpZkJiJTSjdff/CgJzhnTNIGNvhI
	jZSp+tw4GHWh+VbH7RU+3AtutUDmDBJ783i7OYVsYAUKf43+VDeyCWp5
X-Gm-Gg: ASbGncuB2Joe/A9Uqq8vqBdYkr5pv1wvMsbZo/RQUQKbbOuY0oWB9utI+mkPReow5EY
	dq6zGV5cy6+S/pGoh14O0QE5di6ZyJEDCURBb58faEA+EMGdXQSKddiFu/sOAksDWBcl+WkWApe
	trg6tQhGqP4o6Alj3494e2xl6y+zSKzFOpCJ0hkULFMAQuMEN1rGPkxYhZeVw9tV/kCsKq2kbxI
	JPWjndpO1hf0t0iXHfEKKm7cF29pqBtHUaDeiD6FV4DWpR/i02h1kSgEcz99OmcfN6Z6LDvsUp7
	YbjAajJWa1TUhg4YbSR2LJj+JME/Wcz63LGLHG+ssTVqdUpT/aPO43LwMikydgHgkLbk2bKyQiW
	Q6XzFH9Naf0rmut2FAWv5IBlV1w5XwkF3PbfNHBDsNGa6tNwS0r9ZeE3yOL6BgefY7noYaA1eOw
	p3H48iFeTMTJ3tza6vECcl5sQk7eEsGjo4jFQIAbBJ
X-Google-Smtp-Source: AGHT+IHK9WQ4a0UK8NwMypKKKManCE9AjC6PIzjyVE2Ox3e8SVeVLpu0Cb9a9BFD18dkt9RME7LIHQ==
X-Received: by 2002:a17:907:3e1d:b0:b3c:8940:623c with SMTP id a640c23a62f3a-b6472a6a114mr519013666b.14.1760717655010;
        Fri, 17 Oct 2025 09:14:15 -0700 (PDT)
Received: from ivaylo-T580.. (79-100-18-255.ip.btc-net.bg. [79.100.18.255])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb036706sm9606466b.41.2025.10.17.09.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 09:14:14 -0700 (PDT)
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
Subject: [PATCH v2 0/5] clk: samsung: introduce exynos8890 clock driver
Date: Fri, 17 Oct 2025 19:13:28 +0300
Message-ID: <20251017161334.1295955-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_171418_933203_0A7CC061 
X-CRM114-Status: GOOD (  13.90  )
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

Hey folks,

This patchset adds a pretty much full (except for ISP and camera blocks)
cmu driver for exynos8890. It's configured to run with gates in manual
mode, which is done differenetly from other exynos SoCs.

Best regards,
Ivaylo

Changes from V2:
patch 2/5:
- rebase on next and drop the unnecessary new line
patch 3/5:
- rebase on next
- add r-b tag from Peng Fan
patch 4/5:
- rebase
- add r-b tag from Peng Fan
patch 5/5:
- include bitfield.h to ease the kernel test robot's pain
- add a comment that specifies we're disabling hwacg and change
the commit description as per Peng Fan's suggestion

Ivaylo Ivanov (5):
  dt-bindings: clock: add exynos8890 SoC
  clk: samsung: clk-pll: Add support for pll_141xx
  clk: samsung: clk-pll: Add support for pll_1419x
  clk: samsung: clk-pll: Add support for pll_1431x
  clk: samsung: introduce exynos8890 clock driver

 .../clock/samsung,exynos8890-cmu.yaml         |  477 +
 drivers/clk/samsung/Makefile                  |    1 +
 drivers/clk/samsung/clk-exynos8890.c          | 8697 +++++++++++++++++
 drivers/clk/samsung/clk-pll.c                 |   12 +-
 drivers/clk/samsung/clk-pll.h                 |   12 +
 .../clock/samsung,exynos8890-cmu.h            | 1279 +++
 6 files changed, 10476 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos8890-cmu.yaml
 create mode 100644 drivers/clk/samsung/clk-exynos8890.c
 create mode 100644 include/dt-bindings/clock/samsung,exynos8890-cmu.h

-- 
2.43.0


