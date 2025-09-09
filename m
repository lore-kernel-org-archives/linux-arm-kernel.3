Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C68FCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 18:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sbgtE9csO6Cvgxlo8b8Cy8qgsxjaxLMfDvbV/GRdzeA=; b=k25BR6wK+yG1Pifxsx1PKjhaa4
	gTPeOD0hL5JNkkOoOW17LdxP+EhnoXQVckujNHJybOFQVxoqHSniz4b1gm4gN2V4MI3yQ0Zrx0doZ
	Av65qcQqojbqMCo0G0svU20UCzSJeyiyAwH2GGRZpy2L90W9ou8NcPaxgnSztO5HMHROut6dQrE3F
	WjEGBO4jTXiFKSo4XjmbrBFNPF5AStsVOjyHzcaU1Nd6LCLkz0atM4jkOz+x5RB0xExpPz2QkRQ4U
	XaixSaIhP2JAdgtJO+S3I4SQ7NmySF6Aa2X5qdHhf+we3xppZ8kDt9zelKf4nXtv5hMTKzcm243O5
	fcrUCPSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw3Lz-00000009VfP-2hhZ;
	Tue, 09 Sep 2025 18:46:07 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw3Lw-00000009VdR-3fp0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 18:46:06 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-6285612382aso335833a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 11:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757443563; x=1758048363; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sbgtE9csO6Cvgxlo8b8Cy8qgsxjaxLMfDvbV/GRdzeA=;
        b=oyYa90CRKzY1qo+d4PAdvxX+6EtYvlAfLIsO1xcIhEDpyudctVqSDyY3rWiMdViJbr
         tjQ+iT2R+dJoWWaEmUWO6/1zxNziLpNSd6Fl2iZvU09C0p8jQn7eoYFs8XUNT7UGHEBY
         Eea+LbCen6RyY37MEsDdbgxR8iXjNTJ0jMpWwpddBovAcutF+/xkeWs6HGQvn+d/ddLP
         qrJXGkk3fQfmHljBGzSUi201eMQP8mQLM1kfX6P9OHI9bSXkdJN5enz3WgC4EaOQFQwj
         IuK9UKeVLS7cXxHnBaSWuM3vf3MWpvGajw/EMV/a9pZpAUTA2H5My4sJNpBbB2vfQvBJ
         Llmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757443563; x=1758048363;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sbgtE9csO6Cvgxlo8b8Cy8qgsxjaxLMfDvbV/GRdzeA=;
        b=cwihJ73rN7nT9+aWQT0R9T++p42+MQAIuBc44iAOwLSRcoBhW61A3f0Oqf5IndI+Wg
         rdawswzX+i2LM23m/Ad8f2wzoP6a+YJbEyCaKTW4cT/4p9WXj+7tUtcgylFSOS+qiYLz
         IFdtw5VdGi7GemjPT9YWbXzbpWI7ElUJy8flXR6snpGcJ4iVDQtZN7ne+b5u7Zoqd6Ea
         4U08d+rup3F/T+Zt+D9BjWCOmjl75tF9nU3c0QxfAA3PTZzNkd5S/ade8Xjw76kpTR+K
         0gX0Lhu2wZ718vb3Pv6GWiNusMIYBvkWgTvjberpa0xD8HLNp0vbFjmDlS1NyybpvTNv
         g1iA==
X-Forwarded-Encrypted: i=1; AJvYcCXVek/t9O290VtXjjDi75UpzII8unfZazmhN2PvE0mLm0vB/6aEa1Z1ec8A9W2yZlBNEEnR7YkKsQecj1g7B+MR@lists.infradead.org
X-Gm-Message-State: AOJu0YwQRoQBsKOkmPHqc+lqJTmMDAQhIPxzxtrBNLL7HP1Qcg/oBFfw
	df/6y4+lMtADQxxXSWQwETmYyWRPtFksU99jdjl6k2QHkfpAaVGbwrAoHkpE4CUorxdEj7mGFno
	LABoW
X-Gm-Gg: ASbGncuaIYHVCGLJZjEUgJOViopaHylDQtfLsDe7JdfxLzx3+gyP6oCs8K7zpaG6/DH
	yOeji6cUJLvfCPdBACxwTVZLphw78rQ2n9bSCgFja/+y4CR/rXTvj6TMyxCk1jYdnKdiZgimThH
	1evO/yBDkf45YcnW8IFQg18IzFTXzUhzUAYe0iQ3/wRlNsPOB/8+i8cMvoXsM582UrtSHqZItzc
	g9616xAztNRdLYzKXkXvSeqXermm+anG3IJMds+VhTrjitg0boRKYTeudk5Uqm3O7reiSLSPjv3
	9cZvJ3UmFpEl2FOZNeGTmqoxS2n5cOEZB0Ljy4ejTvjUPODdUM1qWn9encyclC2yAhhGcTnuU3I
	Mfw+zGE7wu4RVM48Qw1hF+kQZVJLNYbuDiWTJG4pu6M2jOF3lGDr2Z2g=
X-Google-Smtp-Source: AGHT+IF9qmGIbHHgyLkF+cuxfT/tBA4kZKk5q6FFmJEiexmBUNMRyqAXcs52z+BMBR9gWhKpKR+C/Q==
X-Received: by 2002:a17:907:60cc:b0:afe:ee31:4b93 with SMTP id a640c23a62f3a-b04b10a4accmr652443266b.0.1757443562945;
        Tue, 09 Sep 2025 11:46:02 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0783046d34sm35399566b.6.2025.09.09.11.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 11:46:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] ARM: dts: samsung: dts for v6.18
Date: Tue,  9 Sep 2025 20:45:58 +0200
Message-ID: <20250909184559.105777-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1462; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=96PWMU27/jrXI2PVjuNvBWIsi+qKgC6GLk3JCeyEiAg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBowHXnwqcshQhMcnuW6z945CPT+bxhcKDTjVPRJ
 pSWTYWfHrmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaMB15wAKCRDBN2bmhouD
 1zUdD/wN+EBFSwGSxuGwG1tuhq5rNoCYRiolY1hHazJfxBx0abVi8Ilgrp0VoAWG5kZW8Jq+wTc
 QTTQoqHCyv4RKvO0jKM5gNCEWFMw1fhyO8k393+Ct+aGDCpbP1IbZZtfx3t3Zzs4D1gCXDH6T40
 jVWun62rnKoj3YKcyvic0Whd7ABzCRfNuXmDvgCLdEW9rqPUBNty/kpShQZTc3Md3Oqm5z1guUI
 OeVkU4ZKuX0IQBoZZQ8ODIVf1SiRtMyr289ULGsTBe713UsZfTBwxL4XVlVaZ7qA5PUSVJtioCV
 CL74u9paL/IB/6h8/KCxN5r0pIaKHU/NLrOEqpgg7NycD5m595Uwaw5FuB6F5fphQ8WaDLVuSC/
 7e58lPDbPHOKQ6fpTTlGGPJegDmTDrp4pnRmKCTzwnO2EjayT7tKpjvrlBg+OqnZOM0qfi0vsP8
 sHaza3Vm1GXFIQmaMkedoebzzjDUmVBG9WyxtnJEMbbuxZesUK35A00qjAvo1pBWm3+3mrHMDc9
 6XlBUm67Sk18/hrFeDi+Of/AMke7AWftXc4n+ZBRgYEcYj5gc4UdLzL3TyXT9PS7v3hiRhRf4+c
 dKLibr+/ix3V32BBRNSWoDGZ4AoUaLQPboAZxi1xy8y8FsWOW0nOTxOCcKm6JaORP4XrrTruBCv VxkqT4s/l9dTxDQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_114604_937164_822ABA6A 
X-CRM114-Status: UNSURE (   9.10  )
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

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-6.18

for you to fetch changes up to d19b1773362adfe8c0d5ccc4faf6aea0249976a6:

  ARM: dts: samsung: smdk5250: add sromc node (2025-09-08 09:35:51 +0200)

----------------------------------------------------------------
Samsung DTS ARM changes for v6.18

1. Drop S3C2416 SoC from bindings, because it was removed from kernel
   in 2023.

2. Add Ethernet attached via SROM controller (memory bus) on SMDK5250.
   This wasn't tested, but code should work just like it is working on
   Exynos5410-based boards.

----------------------------------------------------------------
Henrik Grimler (3):
      ARM: dts: samsung: exynos5410: use multiple tuples for sromc ranges
      ARM: dts: samsung: exynos5250: describe sromc bank memory map
      ARM: dts: samsung: smdk5250: add sromc node

Krzysztof Kozlowski (1):
      dt-bindings: arm: samsung: Drop S3C2416

 .../bindings/arm/samsung/samsung-boards.yaml       |  6 ----
 arch/arm/boot/dts/samsung/exynos5250-smdk5250.dts  | 37 ++++++++++++++++++++++
 arch/arm/boot/dts/samsung/exynos5250.dtsi          |  9 ++++++
 arch/arm/boot/dts/samsung/exynos5410.dtsi          |  8 ++---
 4 files changed, 50 insertions(+), 10 deletions(-)

