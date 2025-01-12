Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36461E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jan 2025 18:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PZ+KKaJmXPxzxDNxe6MA06Q8Nc2be0rN6nRzuoDVTD0=; b=O2WwwTT99aE/oXXHpm6mUhXT20
	8u8YfN85bY1Xre9Q+t4fAaEcqftlCUdyayjNwlnKpN6UChiB+4cs4a/w/gEfdrlfvqyschtBKsW6r
	95iu98Xky9iTiL9YV5s/R/qQRCx+KcYoq6NkAOqwIJgNrEpaeqUd94QkUfJY+KEZPGAGt3QD7vs/r
	kvuRAX1SxWtK/xBq+IQlgC1woK1K9vw5P5fpHiMATfCjjDdpfCfS4OujaD/AaHFLVHtHmclpUpCNm
	US0OhRjOjtLMksvBQgSAcruh56fC6NGzDsvShncb+rYTODWmmFVyXo0MDy1EU5hiooUo+GX1dSQwG
	QyU095uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tX2Pa-00000003EWi-2B87;
	Sun, 12 Jan 2025 18:10:10 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tX2OK-00000003EP8-107E
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jan 2025 18:08:53 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43616c12d72so4780115e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jan 2025 10:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736705330; x=1737310130; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PZ+KKaJmXPxzxDNxe6MA06Q8Nc2be0rN6nRzuoDVTD0=;
        b=H7xE5MGV4zHecpfeGCr7X7aApeGdfXvBlurHuxLhicr1MvADZuK960BxcBFKjWaB+c
         +eOSS6Sdq1S6gZEsO8fBlFIel8pse2M8WuTk8LsfNqGRAw9pNF8GEQk/DgA5eBlkiO9U
         qV0Q+2Ld0PwDYxIgIF+GhwzpV2AjcA7a6A+K46IWsXiSmbcjrOWjio4BYqLvQ2OkrYWm
         HdOF7tIl5mo+45xz1z8gSbrMu166+7oO5fXpLHrNIsI12Redzdowp4viWoDO2kkLR1wU
         uFdcfjJA4uWgh9OS5YKihabu51M4v0YHn6VtqaWW/E+sScn3ndYcNLwme+EvX2vWrfl/
         gm0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736705330; x=1737310130;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PZ+KKaJmXPxzxDNxe6MA06Q8Nc2be0rN6nRzuoDVTD0=;
        b=VYtRMhQ+MmfhWmrM03/wgBpJTyZ3Rqwc0fIOpz+R+q+wYS848q6ghiMYOn47K+z7Y6
         gLe8hbUtX5TEj3p+V7+rnSju4ZiuDcrvCCZLVPnhtkX6jVrLZoswjLWa32dmLuOcrxGH
         5sknnXQz1D53NpBrcy4WDdukmfcLwlHLifibEYd5VlPxbaGu4aiboGOJ/zoOAwci4aTH
         JiykdmbBESlkIyIs4MVhePw5RMyyrq7ZhzL1O6rMvxO1Mq9R+3qpD3iBnbOoo/IBja23
         vE3qE8+Lbcd/xXuWuZ52oJD6un2okJhlhk2gsr2vpPL94fBCk/E+Nyp8YRpXLnv8xzCZ
         1ZNQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5lJxgTl/c6fCd2tNW26JvCL7LNJDpRVp5v2dSD8VUEkWX+J6arYalb6lR/134cFINm7BIDPbeBkWNc0MHgD0H@lists.infradead.org
X-Gm-Message-State: AOJu0YyFK43N4OtHlsVsxfA6KLMtdXvuTuiPAjrGKCLO7ZLdFxoEDe7a
	PP1miVmSlU6Zlp/u3Y0t1dOqGzdmjDE8T/v59+CRhlb6BDlEmzpaAP5+VMcVfuQ=
X-Gm-Gg: ASbGncurOT3ph6EoPqRdB6WuzMoX2LT69xacValiHgM8p2O1RR7i9jVHz/M5L8FDR3k
	Q7Df0IjdNj8y3xzXj5EROdF6YFDIgBdurzYk0Om6bkhGt+IRNBhraASvlOqO/SMcEokf3OiKhgZ
	9e3TVp6hdnWJrGsey9+ynkpTZ086eg4lYCNGeDRRghOfZyo7JZPA6UUq3MK1elX3w/8g/owVUO0
	G3Dzl5VEwkOl9lIRq9EQkRsyBthsqgK8F3kKtLYKygTu1zD8DOvv/npJsxJLNTXqvT94aM=
X-Google-Smtp-Source: AGHT+IHu9JNZR3ElrmXphabS7z0OElOospxIN9/DnCZllvZLlZCEZRz4dgWabn67diqwb3Q/GAGKmQ==
X-Received: by 2002:a05:600c:1385:b0:436:1b94:2deb with SMTP id 5b1f17b1804b1-436e26f556fmr67303905e9.5.1736705330605;
        Sun, 12 Jan 2025 10:08:50 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2e89de4sm150842705e9.34.2025.01.12.10.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 10:08:49 -0800 (PST)
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
Subject: [GIT PULL] samsung: drivers: for v6.14, part two
Date: Sun, 12 Jan 2025 19:08:46 +0100
Message-ID: <20250112180846.64154-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_100852_426377_C6A76779 
X-CRM114-Status: GOOD (  10.75  )
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

Previously I sent just one patch alone. It is not included here.

Best regards,
Krzysztof


The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-6.14

for you to fetch changes up to eca836dfd8386b32f1aae60f8e323218ac6a0b75:

  soc: samsung: exynos-pmu: Fix uninitialized ret in tensor_set_bits_atomic() (2025-01-06 10:54:04 +0100)

----------------------------------------------------------------
Samsung SoC drivers for v6.14

1. Add new bindings for sysreg in Exynos8895.
2. Minor improvements in Exynos USI bindings.
3. Fix for Smatch warning in Exynos PMU syscon driver.

----------------------------------------------------------------
Ivaylo Ivanov (1):
      dt-bindings: soc: samsung: exynos-sysreg: add sysreg compatibles for exynos8895

Krzysztof Kozlowski (2):
      dt-bindings: samsung: exynos-usi: Restrict possible samsung,mode values
      soc: samsung: exynos-pmu: Fix uninitialized ret in tensor_set_bits_atomic()

 Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml     | 1 +
 .../devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml    | 8 ++++++++
 drivers/soc/samsung/exynos-pmu.c                                  | 2 +-
 3 files changed, 10 insertions(+), 1 deletion(-)

