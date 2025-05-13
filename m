Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1717C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 10:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FmKO4iUFCtGPij5z8zMun04XAyBt8taBVw5kM26b2KE=; b=WwsWCkOevgmnflyHDNmDouyb+X
	T7jdNHyS+POZiK2usgZw4rfp8nieFDEgtolv5JcJhkDuWjzB+a2VLvqcYnK8jiXj7iDHRUG25kYSt
	VYfRXwHvUOPJf5gsVH9Kdirgz/GWqfvv9pefHdLUyl8pU28TltBQFQeDSlaOnMZcFGVvBR0rZ4KDy
	Jn9xfhrWOBnuBnCnvb8jpejsjVVJ0Mq5XewaO5VOog1abgmH8ONNxHvmjrHgzVMO9hYan+2GlajAY
	ZQHtnbxejG+2Xbh3eYeuXUZYNkMUHodjdOginS+u5iIrs0dQ831xLsu+RVmkjX5UZNhK34nQZG7OK
	WvfjdmwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEmpZ-0000000C6CG-2yoi;
	Tue, 13 May 2025 10:25:49 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEmeL-0000000C3KC-42el
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 10:14:15 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-442e9c7cf0eso751465e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 May 2025 03:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747131252; x=1747736052; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FmKO4iUFCtGPij5z8zMun04XAyBt8taBVw5kM26b2KE=;
        b=apfk675jeV++rRMDdumRx2aRx7IpD3JPcGdfu7wFuSzF7n4z2f84W4y4jDoe+CaNwQ
         /r1/40sGjLGWKqV84RhI6EB22gY2CJG6nku72Xdz9Gu2xFgEkM3kHx9NWS/0/ZZ15266
         N/OQqGRdOh/zoEr3YcZf2SFMOlMjA6h/F5SAa/iUuLYbYco+OJoD1B+pBqi2/G50mt1J
         nzHW7VmMPbV+XOb3OxyFwpml83rjEsUvmmWX1R4Sl8anbKtCOzxkb7bpGGiORmhGSwM0
         XBBWcvwC6bCUoNZR2uicZBZxvLSiqWDm54BQ6bbR/ZASmUZTbt9ppJc25bO/i7L+6EaJ
         lvvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747131252; x=1747736052;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FmKO4iUFCtGPij5z8zMun04XAyBt8taBVw5kM26b2KE=;
        b=rOM9Ueehbph+BpxrtjG08km03f3ZcutOci3qG0ehrFDlpa04nz2oAiDpWKbGkLLDkd
         nfMimf3kQnSRxHT97PWdMt38qn6zkC7PuIEJFdvPo3ahrjP0/hCgCAkBqH2FJYe2XuYs
         LWJ7Kmdos+SCU1SGJ7eLmmUs0JiOLxm1ZnNa3q30nehMCSLgol8Hi/ZLPL0lClSNa7rL
         uEzb1BiFpKegUz8yKZder/CuFPmI+wLw5gXrh7Rcp0i+OadElcaT4H+lRp6yisvcsYcu
         P/TQf1VjtnUTtn9ncIJIZasOonv5JuChirg5f8sGSy2ZLBjVa3Oc8i1ylYqVEYkNwDit
         B+mQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYlInxtgOrUyVFdj0aPX4KiPyW+RyhcGo+mcJSnHXu/rCu5jQnMRWS3IKAru4IvmrPBoF6KVemn7WemQSWla6K@lists.infradead.org
X-Gm-Message-State: AOJu0YwZOu9UnnhTBE7WkY4qXDh6lKNcom7UO3Ojjw78jwlSBiYNFsp8
	smhi5kOxOQTdwFYsZXsEkFk/s1YmYaukMC8IfSxUeZjaC4aPjp5U77wReVSQjow=
X-Gm-Gg: ASbGncvnkcCQW4jjLynO4fht/ubvzhY06MihYbh6fVfuaoSBtaXIYt3SuQqTY21ZI0w
	0X9yUPD9k0bktp9dhWi8HAGpOS4H9r7teTr7vxxypjssplsOPp8WMtH/EJhSWUzkXhjPhm5nFY3
	iCOIZI/CVxBOZa4g90auBNaEPYAHfKgBIDiJrzdj42AilCyVO5K+lSvO3ZkF0KCpNaI1Yq/nlY8
	8VNs3eUu3igKjCW6BBaNPUL9Yw1OI9gLYgzdZB5cXh8oK7wsAN1TVY8qusK9qIxc17cXZRXg7md
	zausPWProKEIE5yoVR7+2NINP8wAMo1O34FdEGyAXlYnQrLL/zyYotCCIPNTO30PXRaSKQjVMup
	xRci+rt5JO7wBDV7e1lAqQ4odvP06y4cWo9g1Ksg=
X-Google-Smtp-Source: AGHT+IHK4ZgyRSwCAQUNKdc+qokxm+jDw3954HdRD4CSqDPQxvmPct2ZSvOSVpIzgIPcfnsOsH7saA==
X-Received: by 2002:a05:600c:3513:b0:43b:ca39:a9b8 with SMTP id 5b1f17b1804b1-442d9c8e883mr49631055e9.2.1747131252406;
        Tue, 13 May 2025 03:14:12 -0700 (PDT)
Received: from kuoka.c.hoisthospitality.com (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd3b7f18sm211920495e9.40.2025.05.13.03.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 03:14:11 -0700 (PDT)
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
Subject: [GIT PULL] clk: samsung: drivers for v6.16
Date: Tue, 13 May 2025 12:14:08 +0200
Message-ID: <20250513101407.22233-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1778; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=ULrHUwBSa4Nx57f23106q1CX/Yt3c3c/zhOPpinKUyo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoIxtvRkenr8845Ru9521lbcHxxw4cdwiBeV80j
 l4nXPkerpeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaCMbbwAKCRDBN2bmhouD
 1+NbD/93RhWOMmoLrcMu+Ixi+i1CLAmMXhF5TyrC/rP1BMFqTHiOh3HfrwHoBpONqaPc1UagMkV
 jwKMRPdVrwu7GX1TfnBORAtXoCgVRepVUHNvUKl1uKFmOJlS7t83YFfq2EdXy32Wjk9q31SjkVA
 K+AtUHfNnDGk9hLDJZeJM7ZVsNlP6YUK80aZegURRAbcLVvIdXX67ogEsqsHtBNtWALr0kVmXFp
 sDoToY0r1+o8v22bM687E+RBnlYmWBHTYcl75SLsHM0NCJY/FiPNxK7nbxzdLikikMFxFqnLxvA
 jp64iju1RGqAe7vnFknUD3s/NcxnAFo7MXhSFY5J6wbJuK7/ruQWJGznhhLRi/rrT461bU03LOB
 hV+WFiTuV7G/irrmngaaDG7yfmCx8AlWS2cY8tXCEQ1G7PDqcWGzXLKQqD20oOzbURRSdG5nFcE
 4HwQ2I5hy1zHJP6A8UYQM+XqEJ0Azgb5Y0XMdhU/vVEsz9IffzNli6k8LUkKKN4U6wkhmTIMW4z
 Kn81iZKqidUbgwmTVRgW9uXQC/V09vYfAPYuAyunpV1luJaihbm3/S/Iozz7PK2A7s2mHrRmSUI
 XsYZV6Z7c4RfJ80yxy2EJSUHCaayBiuX+gkTdZ3Voemy1nrM1iHEDe/q9hWxaQPfO1qbLFQsx/P N7L5dub2+QwjjoQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_031414_005748_85D05A1C 
X-CRM114-Status: UNSURE (   7.57  )
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

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-clk-6.16

for you to fetch changes up to 81214185e7e1fc6dfc8661a574c457accaf9a5a4:

  clk: samsung: correct clock summary for hsi1 block (2025-05-12 08:30:06 +0200)

----------------------------------------------------------------
Samsung SoC clock drivers changes for 6.16

1. ExynosAutov920:
 - Add CPU cluster CL0, CL1 and CL2 clock controllers.
 - Fix HSI1 USBDRD clock parents.

2. Minor cleanup for Exynos4 drivers.

----------------------------------------------------------------
Krzysztof Kozlowski (2):
      Merge branch 'for-v6.16/dt-bindings-clk-samsung' into next/clk
      Merge branch 'for-v6.16/dt-bindings-clk-samsung' into next/clk

Pritam Manohar Sutar (1):
      clk: samsung: correct clock summary for hsi1 block

Shin Son (5):
      dt-bindings: clock: exynosautov920: add cpucl0 clock definitions
      clk: samsung: exynosautov920: add cpucl0 clock support
      dt-bindings: clock: exynosautov920: add cpucl1/2 clock definitions
      clk: samsung: exynosautov920: add cpucl1/2 clock support
      clk: samsung: exynosautov920: Fix incorrect CLKS_NR_CPUCL0 definition

Varada Pavani (1):
      clk: samsung: Use samsung CCF common function

 .../clock/samsung,exynosautov920-clock.yaml        |  69 +++++
 drivers/clk/samsung/clk-exynos4.c                  |  74 +++--
 drivers/clk/samsung/clk-exynosautov920.c           | 338 ++++++++++++++++++++-
 include/dt-bindings/clock/samsung,exynosautov920.h |  51 ++++
 4 files changed, 499 insertions(+), 33 deletions(-)

